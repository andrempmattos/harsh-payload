
-- *********************************************************************/ 
-- Copyright (c) 2009 Actel Corporation.  All rights reserved.  
-- 
-- Any use or redistribution in part or in whole must be handled in 
-- accordance with the Actel license agreement and must be approved 
-- in advance in writing.  
--  
-- File : fastinit.vhd $
--     
-- Description: This module handles the initialization of the SDRAM when the system
--              leaves the Reset state. After the system is running, this block also
--              handles the periodic refresh operations to the SDRAM
--
-- Revision :  $
--
-- Notes:
--
-- *********************************************************************/

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fastinit is
    generic (
        sdram_rasize    : in integer := 31;   -- local address bus size
        sdram_chips     : in integer := 8;    -- number of chip selects
        sdram_colbits   : in integer := 12;   -- max number of SDRAM column bits
        sdram_rowbits   : in integer := 14;   -- max number of SDRAM row bits
        sdram_chipbits  : in integer := 3;    -- number of encoded chip select bits
        sdram_bankstatmodules  : in integer := 4 -- number of bank status modules used (in multiples of 4)
    );

    port (clk             : in std_logic;
          reset_n         : in std_logic;                      
          raddr           : in std_logic_vector (sdram_rasize-1 downto 0); 
          r_req           : in std_logic;                      
          w_req           : in std_logic;                      
          b_size          : in std_logic_vector (3 downto 0);
          auto_pch        : in std_logic;
          sd_init         : in std_logic;
          ras             : in std_logic_vector (3 downto 0);
          rcd             : in std_logic_vector (2 downto 0);
          rrd             : in std_logic_vector (1 downto 0);
          rp              : in std_logic_vector (2 downto 0);
          rc              : in std_logic_vector (3 downto 0);
          rfc             : in std_logic_vector (3 downto 0);
          wr              : in std_logic_vector (1 downto 0);
          mrd             : in std_logic_vector (2 downto 0);
          cl              : in std_logic_vector (2 downto 0);
          cl_half         : in std_logic;
          bl              : in std_logic_vector (1 downto 0);
          ds              : in std_logic_vector (1 downto 0);
          delay           : in std_logic_vector (15 downto 0);
          ref             : in std_logic_vector (15 downto 0);
          colbits         : in std_logic_vector (2 downto 0);
          rowbits         : in std_logic_vector (1 downto 0);
          regdimm         : in std_logic;
          rw_ack          : out std_logic;                     
          r_valid         : out std_logic;                     
          d_req           : out std_logic;                     
          w_valid         : out std_logic;                     
          oe              : out std_logic;                   
          sa              : out std_logic_vector (13 downto 0);
          ba              : out std_logic_vector (1 downto 0); 
          cs_n            : out std_logic_vector (sdram_chips-1 downto 0); 
          dqm             : out std_logic;
          cke             : out std_logic;                     
          ras_n           : out std_logic;
          cas_n           : out std_logic;
          we_n            : out std_logic
    );
end fastinit;

architecture rtl of fastinit is

attribute syn_hier : string;
attribute syn_hier of rtl: architecture is "hard";

component fastsdram
    generic (
        sdram_rasize    : in integer := 31;   -- local address bus size
        sdram_chips     : in integer := 8;    -- number of chip selects
        sdram_colbits   : in integer := 12;   -- max number of SDRAM column bits
        sdram_rowbits   : in integer := 14;   -- max number of SDRAM row bits
        sdram_chipbits  : in integer := 3;    -- number of encoded chip select bits
        sdram_bankstatmodules: in integer := 4 -- number of bank status modules used (in multiples of 4)
    );    
    port (clk               : in std_logic;
          reset_n           : in std_logic;                      
          sd_init           : in std_logic;
          raddr             : in std_logic_vector (sdram_rasize-1 downto 0); 
          r_req             : in std_logic;                      
          w_req             : in std_logic;                      
          b_size            : in std_logic_vector (3 downto 0);
          auto_pch          : in std_logic;
          rf_req            : in std_logic;
          p_req             : in std_logic;
          m_req             : in std_logic;
          m_req_dll_reset   : in std_logic;
          em_req            : in std_logic;
          ras               : in std_logic_vector (3 downto 0);
          rcd               : in std_logic_vector (2 downto 0);
          rrd               : in std_logic_vector (1 downto 0);
          rp                : in std_logic_vector (2 downto 0);
          rc                : in std_logic_vector (3 downto 0);
          rfc               : in std_logic_vector (3 downto 0);
          wr                : in std_logic_vector (1 downto 0);
          mrd               : in std_logic_vector (2 downto 0);
          cl                : in std_logic_vector (2 downto 0);
          cl_half           : in std_logic;
          bl                : in std_logic_vector (1 downto 0);
          ds                : in std_logic_vector (1 downto 0);
          colbits           : in std_logic_vector (2 downto 0);
          rowbits           : in std_logic_vector (1 downto 0);
          regdimm           : in std_logic;
          dqm_wr_bterm      : out std_logic;
          rw_ack            : out std_logic;
          s_ack             : out std_logic;
          r_valid           : out std_logic;
          w_valid           : out std_logic;
          d_req             : out std_logic;
          oe                : out std_logic;                    
          sa                : out std_logic_vector (13 downto 0);
          ba                : out std_logic_vector (1 downto 0); 
          cs_n              : out std_logic_vector (sdram_chips-1 downto 0); 
          cke               : out std_logic;                     
          ras_n             : out std_logic;
          cas_n             : out std_logic;
          we_n              : out std_logic
    );          
end component;
    
signal      dll_holdoff_timer   : std_logic_vector (7 downto 0); -- Counter used to prevent read/write access until DDR DLL is stable
signal      dll_holdoff_en      : std_logic; -- Enables countdown of dll_holdoff_timer
signal      timer               : std_logic_vector (15 downto 0); -- startup delay and refresh counter
signal      inited              : std_logic; -- Used to hold off requests until initialization complete
signal      p_req               : std_logic; -- Precharge request to fastsdram
signal      m_req               : std_logic; -- LMR request to fastsdram
signal      rf_req              : std_logic; -- refresh request to fastsdram
signal      em_req              : std_logic; -- Extended LMR request to fastsdram
signal      m_req_dll_reset     : std_logic; -- LMR w/ DLL reset request to fastsdram
signal      dqm_wr_bterm        : std_logic; -- DQM asserted during write burst terminates (for SDR)
signal      dqm_init            : std_logic; -- Asserts DQM during initialization per JEDEC spec
signal      dqm_init_d0         : std_logic; -- First stage delay of dqm_init
signal      dqm_init_d1         : std_logic; -- Second stage delay of dqm_init
signal      s_ack               : std_logic; -- Command ack from fastsdram

signal      r_req_i             : std_logic; -- Read Request to fastsdram (held off until init is complete)
signal      w_req_i             : std_logic; -- Write Request to fastsdram (held off until init is complete)

signal      p_shift             : std_logic_vector (9 downto 0); -- Shift register for precharges during init sequence;
signal      r_shift             : std_logic_vector (9 downto 0); -- Shift register for refreshes during init sequence
signal      m_shift             : std_logic_vector (9 downto 0); -- Shift register for LMR during init sequence
signal      m_dr_shift          : std_logic_vector (9 downto 0); -- Shift register for LMR-DLL reset during init sequence
signal      em_shift            : std_logic_vector (9 downto 0); -- Shift register for Extended LMR during init sequence

signal      start_delay_done    : std_logic; -- flag set after startup delay has elapsed
signal      timer_reset         : std_logic; -- Indicates expiration of timer
signal      load                : std_logic; -- Causes initialization of startup delay

begin
    -- Instantiate low level controller
    fastsdram_1 : fastsdram
        generic map (
            sdram_rasize           =>    sdram_rasize          ,
            sdram_chips            =>    sdram_chips           ,
            sdram_colbits          =>    sdram_colbits         ,
            sdram_rowbits          =>    14         ,
--            sdram_rowbits          =>    sdram_rowbits         ,
            sdram_chipbits         =>    sdram_chipbits        ,
            sdram_bankstatmodules  =>    sdram_bankstatmodules 
        )
        port map(                  
            clk                 =>  clk            ,
            reset_n             =>  reset_n        ,
            sd_init             =>  sd_init        ,
            raddr               =>  raddr          ,
            r_req               =>  r_req_i        ,
            w_req               =>  w_req_i        ,
            b_size              =>  b_size         ,
            auto_pch            =>  auto_pch       ,
            rf_req              =>  rf_req         ,
            p_req               =>  p_req          ,
            m_req               =>  m_req          ,
            m_req_dll_reset     =>  m_req_dll_reset,
            em_req              =>  em_req         ,
            ras                 =>  ras            ,
            rcd                 =>  rcd            ,
            rrd                 =>  rrd            ,
            rp                  =>  rp             ,
            rc                  =>  rc             ,
            rfc                 =>  rfc            ,
            wr                  =>  wr             ,
            mrd                 =>  mrd            ,
            cl                  =>  cl             ,
            cl_half             =>  cl_half        ,
            bl                  =>  bl             ,
            ds                  =>  ds             ,
            colbits             =>  colbits        ,
            rowbits             =>  rowbits        ,
            regdimm             =>  regdimm        ,
            dqm_wr_bterm        =>  dqm_wr_bterm   ,
            rw_ack              =>  rw_ack         ,
            s_ack               =>  s_ack          ,
            r_valid             =>  r_valid        ,
            w_valid             =>  w_valid        ,
            d_req               =>  d_req          ,
            oe                  =>  oe             ,
            sa                  =>  sa             ,
            ba                  =>  ba             ,
            cs_n                =>  cs_n           ,
            cke                 =>  cke            ,
            ras_n               =>  ras_n          ,
            cas_n               =>  cas_n          ,
            we_n                =>  we_n           
        );


-- Initialization Sequences
--   Performs initialization of SDRAM devices when system comes out of reset or SD_INIT strobed.
--   Different init sequences are used for DDR and SDR

--    Initialization sequence for DDR SDRAM:
--      Wait for timer_reset to expire
--      Issue precharge
--      Issue extended load mode register
--      Issue load mode register with DLL reset bit set
--      Issue precharge
--      Issue 2 refreshes
--      Issue load mode register with DLL reset bit clear
--      Wait for 200 clocks for DLL to stablize before any read / write command

--
--    Initialization sequence for SDR SDRAM:
--      Wait for reset_timer to expire
--      Issue Precharge
--      Issue 8 Refreshes
--      Issue mode Register Write


init : process (clk, reset_n)
begin
    if (reset_n = '0') then
               --SDR initial values
            p_shift     <= "0000000001";
            r_shift     <= "0111111110";
            m_shift     <= "1000000000";
            m_dr_shift  <= "0000000000";
            em_shift    <= "0000000000";
            p_req       <= '0';
            rf_req      <= '0';
            m_req       <= '0';
            em_req       <= '0';
            m_req_dll_reset       <= '0';
         
    elsif (clk'event and (clk = '1')) then
        if (sd_init = '1') then
                     --SDR initial values
                p_shift     <= "0000000001";
                r_shift     <= "0111111110";
                m_shift     <= "1000000000";
                m_dr_shift  <= "0000000000";
                em_shift    <= "0000000000";
                p_req       <= '0';
                rf_req      <= '0';
                m_req       <= '0';
                em_req       <= '0';
                m_req_dll_reset       <= '0';
            
        elsif (timer_reset = '1' or (s_ack = '1' and start_delay_done = '1')) then
                    --SDR initialization sequence
                p_req   <= p_shift(0);
                p_shift <= '0' & p_shift(9 downto 1);
                rf_req  <= r_shift(0);
                r_shift <= not(r_shift(9)) & r_shift(9 downto 1);
                m_req   <= m_shift(0);
                m_shift <= '0' & m_shift(9 downto 1);
            
        end if;
    end if;
end process init;

--
-- start_delay_done -- flag cleared after SD_INIT or RESET_N and asserted after
--   startup delay has elapsed
--
start_delay_done_p : process (clk, reset_n)
begin
    if (reset_n = '0') then
        start_delay_done <= '0';
    elsif (clk'event and (clk = '1')) then
        if (SD_INIT = '1') then
            start_delay_done <= '0';
        elsif (timer_reset = '1') then
            start_delay_done <= '1';
        end if;
    end if;
end process start_delay_done_p;

--
-- DQM asserted during initialization or during write burst terminate (for SDR)
--
dqm_init_p : process (clk, reset_n)
begin
    if (reset_n = '0') then
        dqm_init <= '1';
    elsif (clk'event and (clk = '1')) then
        if sd_init = '1' then
            dqm_init <= '1';        
        elsif (m_req = '1' and s_ack = '1') then
            dqm_init <= '0';
        end if;
    end if;
end process dqm_init_p;
 
--   delay by 2 clocks so that DQM goes low one clock after MRS command is issued
dqm_init_delay_p: process (clk, reset_n)
begin
    if (reset_n = '0') then
        dqm_init_d0 <= '0';
        dqm_init_d1 <= '0';
    elsif (clk'event and (clk = '1')) then
        dqm_init_d0 <= dqm_init;
        dqm_init_d1 <= dqm_init_d0;
    end if;
end process dqm_init_delay_p;

dqm <= dqm_init_d1 or dqm_wr_bterm;


-- DLL Stablization Holdoff Timer
--   Timer to hold off accesses after init until DDR DLL has stablized (200 clocks)
dll_stab_holdoff_p: process (clk, reset_n)
begin
    if (reset_n = '0') then
        dll_holdoff_timer <= x"c8"; -- 200 clocks (= 0xc8)
        dll_holdoff_en <= '0';
    elsif (clk'event and (clk = '1')) then
        if (sd_init = '1') then
            dll_holdoff_timer <= x"c8"; -- 200 clocks (= 0xc8)
            dll_holdoff_en <= '0';
        else
            if (m_req = '1' and s_ack = '1') then
                dll_holdoff_en <= '1';
            end if;
        
            if (dll_holdoff_en = '1') then
                dll_holdoff_timer <= dll_holdoff_timer - 1;
            end if;
        end if;
    end if;
end process dll_stab_holdoff_p;


-- Timer counts off both the reset timer at startup and the refresh
--   timer during normal operation.
timer_p: process(clk, reset_n)
begin
    if (reset_n = '0') then
        timer <= x"0004";
        inited <= '0';
        timer_reset <= '0';
        load <= '1';
    elsif (clk'event and (clk = '1')) then
        if (sd_init = '1' or load = '1') then
            timer <= DELAY;
            inited <= '0';
            timer_reset <= '0';
            load <= '0';
        else 
            -- SDR
            if (m_req = '1' and s_ack = '1') then
                inited <= '1';
            end if;
           
            
            if (timer_reset = '1') then
                timer <= ref;
            else
                timer <= timer - 1;
            end if;
      
            if (timer = x"0000") then
                timer_reset <= '1';
            else
                timer_reset <= '0';
            end if;
        end if;
    end if;
end process timer_p;     
            
-- Read and write requests are masked until initialization
--   has been completed

w_req_i     <= w_req and inited;
r_req_i     <= r_req and inited;

end rtl;
