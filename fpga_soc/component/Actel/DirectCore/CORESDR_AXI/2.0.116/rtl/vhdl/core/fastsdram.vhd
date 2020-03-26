-- *********************************************************************/ 
-- Copyright (c) 2009 Actel Corporation.  All rights reserved.  
-- 
-- Any use or redistribution in part or in whole must be handled in 
-- accordance with the Actel license agreement and must be approved 
-- in advance in writing.  
--  
-- File : fastsdram.vhd $
--     
-- Description: TThis block of code handles all the direct control of the SDRAM.
--              
--
-- Revision :  $
--
-- Notes:
--
-- *********************************************************************/
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;



entity fastsdram is
    generic (
        sdram_rasize    : in integer := 31;   -- local address bus size
        sdram_chips     : in integer := 8;    -- number of chip selects
        sdram_colbits   : in integer := 12;   -- max number of sdram column bits
        sdram_rowbits   : in integer := 14;   -- max number of sdram row bits
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
end fastsdram;


architecture rtl of fastsdram is

attribute syn_hier : string;				-- Synplify constraint to preserve interface of design unit and prevent
attribute syn_hier of rtl: architecture is "hard";	-- unnecessary cross-hierarchical optimizations

constant    ones : std_logic_vector (7 downto 0) := "11111111";
constant    zeros : std_logic_vector (7 downto 0) := "00000000";

constant    colbits8    : std_logic_vector(2 downto 0) := "011";
constant    colbits9    : std_logic_vector(2 downto 0) := "100";
constant    colbits10   : std_logic_vector(2 downto 0) := "101";
constant    colbits11   : std_logic_vector(2 downto 0) := "110";
constant    colbits12   : std_logic_vector(2 downto 0) := "111";

constant    rowbits11   : std_logic_vector(1 downto 0) := "00";
constant    rowbits12   : std_logic_vector(1 downto 0) := "01";
constant    rowbits13   : std_logic_vector(1 downto 0) := "10";
constant    rowbits14   : std_logic_vector(1 downto 0) := "11";


constant    colbits8_rowbits11 : std_logic_vector(4 downto 0)  := "01100";
constant    colbits8_rowbits12 : std_logic_vector(4 downto 0)  := "01101";
constant    colbits9_rowbits12 : std_logic_vector(4 downto 0)  := "10001";
constant    colbits10_rowbits12 : std_logic_vector(4 downto 0) := "10101";
constant    colbits11_rowbits12 : std_logic_vector(4 downto 0) := "11001";
constant    colbits8_rowbits13 : std_logic_vector(4 downto 0)  := "01110";
constant    colbits9_rowbits13 : std_logic_vector(4 downto 0)  := "10010";
constant    colbits10_rowbits13 : std_logic_vector(4 downto 0) := "10110";
constant    colbits11_rowbits13 : std_logic_vector(4 downto 0) := "11010";
constant    colbits12_rowbits13 : std_logic_vector(4 downto 0) := "11110";
constant    colbits10_rowbits14 : std_logic_vector(4 downto 0) := "10111";
constant    colbits11_rowbits14 : std_logic_vector(4 downto 0) := "11011";
constant    colbits12_rowbits14 : std_logic_vector(4 downto 0) := "11111";

component openbank is
    generic (
        sdram_chipbits          : integer;
        sdram_rowbits           : integer
 	);
    port (
        clk                     : in std_logic;   
        reset_n                 : in std_logic;   
        sd_init                 : in std_logic;
        goactive                : in std_logic;   
        dorw                    : in std_logic;   
        readcmd                 : in std_logic;
        dopc                    : in std_logic;   
        actv                    : in std_logic;   
        doref                   : in std_logic;   
        dopch                   : in std_logic;   
        domode                  : in std_logic;   
        bsize                   : in std_logic_vector(3 downto 0);   
        auto_pch                : in std_logic;
        lineaddr                : in std_logic_vector(sdram_rowbits-1 downto 0);   
        chipaddr                : in std_logic_vector(sdram_chipbits-1 downto 0);   
        ras                     : in std_logic_vector (3 downto 0);
        rcd                     : in std_logic_vector(2 downto 0);   
        rrd                     : in std_logic_vector(1 downto 0);   
        rp                      : in std_logic_vector(2 downto 0);   
        mrd                     : in std_logic_vector(2 downto 0);   
        rc                      : in std_logic_vector(3 downto 0);   
        rfc                     : in std_logic_vector(3 downto 0);
        wr                      : in std_logic_vector(1 downto 0);
        bl                      : in std_logic_vector(1 downto 0);   
        actable                 : out std_logic;   
        rwable                  : out std_logic;   
        pcable                  : out std_logic;   
        active                  : out std_logic;   
        line                    : out std_logic_vector(sdram_rowbits-1 downto 0);   
        chip                    : out std_logic_vector(sdram_chipbits-1 downto 0)
        );   
end component;

signal chipaddr                 :  std_logic_vector(sdram_chipbits-1 downto 0);       --encoded chip address extracted from raddr
signal rowaddr                  :  std_logic_vector(sdram_rowbits-1 downto 0);                     --row address extracted from raddr
signal rowaddr_int                  :  std_logic_vector(13 downto 0);                     --row address extracted from raddr
signal bankaddr                 :  std_logic_vector(1 downto 0);                      --bank address extracted from raddr
signal coladdr                  :  std_logic_vector(12 downto 0);                     --column address extracted from raddr

signal wcount                   :  std_logic_vector(3 downto 0);                      --counter to determine when bus available after write
signal wc_zero                  :  std_logic;                                         --flag indicates bus available after write
signal rcount                   :  std_logic_vector(3 downto 0);                      --counter to determine when bus available after read
signal rc_zero                  :  std_logic;                                         --flag indicates bus available after read
signal rc_zero_d                :  std_logic;                                         --flag indicates bus available after read
signal r_valid_delay            :  std_logic;                                         --used to determine r_valid for case of registered dimm
signal w_valid_d                : std_logic;                                          --used for generation of w_valid and oe
signal w_valid_i                : std_logic;                                          --internal reg from which w_valid is derived

signal actable                  : std_logic_vector(sdram_bankstatmodules-1 downto 0); --flag to indicate bank can go active  
signal rwable                   : std_logic_vector(sdram_bankstatmodules-1 downto 0); --flag to indicate bank can read/write    
signal pcable                   : std_logic_vector(sdram_bankstatmodules-1 downto 0); --flag to indicate bank can be precharged    
signal active                   : std_logic_vector(sdram_bankstatmodules-1 downto 0); --flag to indicate bank is active  
signal goact                    : std_logic_vector(sdram_bankstatmodules-1 downto 0); --signal to activate bank  
signal dorw                     : std_logic_vector(sdram_bankstatmodules-1 downto 0); --signal to begin a read or write on bank  
signal prch                     : std_logic_vector(sdram_bankstatmodules-1 downto 0); --signal to start a precharge of bank  

signal act                      : std_logic;                                          --signal to activate a bank
signal rw                       : std_logic;                                          --signal to issue read/write command to sdram
signal doread                   :  std_logic;                                         --indicates command is a read
signal dowrite                  :  std_logic;                                         --indicates command is a write
signal bterm                    :  std_logic;                                         --burst terminate command
signal refresh                  :  std_logic;                                         --signal to issue refresh command to sdram
signal pch                      :  std_logic;                                         --signal to issue bank precharge command to sdram
signal precharge                :  std_logic;                                         --signal to issue precharge all command to sdram
signal mode                     :  std_logic;                                         --signal to issues load mode register command to sdram
signal rshift                   :  std_logic_vector(10 downto 0);                     --shift register used to derive r_valid flow control signal
signal wshift                   :  std_logic_vector(7 downto 0);                      --shift register used to derive w_valid, d_req flow control signals
signal bcount                   :  std_logic_vector(3 downto 0);                      --registered version of b_size
signal bdcnt                    :  std_logic_vector(3 downto 0);                      --burst counter used to derive bterm_cmd
signal bdzero                   :  std_logic;                                         --signal used to derive bterm_cmd

signal rfsh_cmd                 :  std_logic;                                         --first stage registration of refresh request from upper level
signal prch_cmd                 :  std_logic;                                         --first stage registration of precharge command from upper level
signal mode_cmd                 :  std_logic;                                         --first stage registration of lmr command from upper level
signal rdwr_cmd                 :  std_logic_vector(sdram_bankstatmodules-1 downto 0);--first stage registration of read/write command (from r_req/w_req)   
signal read_cmd                 :  std_logic;                                         --first stage registration indicates request is read
signal new_cmd                  :  std_logic;                                         --state bit goes low when command detected
signal lnht_cmd                 :  std_logic_vector(sdram_bankstatmodules-1 downto 0);--indicates if current address is a line hit (for each bank)   
signal bterm_cmd                :  std_logic;                                         --causes burst-terminate command to be issued
signal blen                     :  std_logic_vector(3 downto 0);                      --decoded version of bl (used to simplify coding)

signal oldchip                  :  std_logic_vector(sdram_chipbits-1 downto 0);       --previously accessed chip number
signal pchaddr                  :  std_logic_vector(sdram_chipbits-1 downto 0);       --chip number to precharge

signal ack                      :  std_logic;                                         --command acknowledge

signal psa                      :  std_logic_vector(13 downto 0);                     --address bus formation used during elmr and lmr
signal dqs_hold_sr              : std_logic_vector (3 downto 0);-- used to hold off read command to prevent dqs contention when switching between chips
signal turnaround_hold                 : std_logic;                    -- indicates if chip switch has happened and read command should be held off

signal colbits_rowbits          :  std_logic_vector(4 downto 0);

signal cl_cl_half               : std_logic_vector(3 downto 0);                 --temporary hold for concatenation of cl & cl_half

subtype line_subtype is std_logic_vector(sdram_rowbits-1 downto 0);
type line_type is array(sdram_bankstatmodules-1 downto 0) of line_subtype;
signal line_i                   : line_type;

subtype chip_subtype is std_logic_vector(sdram_chipbits-1 downto 0);
type chip_type is array(sdram_bankstatmodules-1 downto 0) of chip_subtype;
signal chip_i                    : chip_type;

--
-- bank status management modules
--

begin
    
    openbank_gen:
        for i in 0 to sdram_bankstatmodules - 1 generate
            openbank_r1_i : openbank
            generic map (
                sdram_chipbits  =>  sdram_chipbits,
                sdram_rowbits  =>  sdram_rowbits
                )
            port map (
                clk             =>  clk      ,
                reset_n         =>  reset_n  ,
                sd_init         =>  sd_init  ,
                goactive        =>  goact(i) ,
                dorw            =>  dorw(i)  ,
                readcmd         =>  read_cmd  ,
                dopc            =>  prch(i)     ,
                actv            =>  act     ,
                doref           =>  refresh    ,
                dopch           =>  precharge    ,
                domode          =>  mode   ,
                bsize           =>  bcount    ,
                auto_pch        =>  auto_pch,
                lineaddr        =>  rowaddr ,
                chipaddr        =>  chipaddr ,
                ras             =>  ras      ,
                rcd             =>  rcd      ,
                rrd             =>  rrd      ,
                rp              =>  rp       ,
                mrd             =>  mrd      ,
                rc              =>  rc       ,
                rfc             =>  rfc      ,
                wr              =>  wr       ,
                bl              =>  bl       ,
                actable         =>  actable(i)  ,
                rwable          =>  rwable(i)   ,
                pcable          =>  pcable(i)   ,
                active          =>  active(i)   ,
                line            =>  line_i(i)     ,
                chip            =>  chip_i(i)     
            );    
        
            
        end generate;         
                

--  address segmentation
--
--  the memory address is split into column, row, bank
--  
--  the following rowbit and column bit combinations are supported:
--              rowbits      colbits        bankbits
--                 12           8              2
--                 12           9              2
--                 12           10             2
--                 12           11             2
--                 11           8              2
--                 13           8              2
--                 13           9              2
--                 13           10             2
--                 13           11             2
--                 13           12             2     //512mb (128m x 4)
--                 14           10             2     //1024mb (256m x 4)
--                 14           11             2     //1024mb (128m x 8)
--                 14           12             2     //1024mb (64m x 16)

    with colbits select  -- bankbits2 assumed
        bankaddr <= raddr(9 downto 8) when colbits8,
                    raddr(10 downto 9) when colbits9,
                    raddr(11 downto 10) when colbits10,
                    raddr(12 downto 11) when colbits11,
                    raddr(13 downto 12) when colbits12,
                    (others => '-') when others;

    colbits_rowbits <= colbits & rowbits;
     
    with colbits_rowbits select
        chipaddr <= raddr(sdram_chipbits+21-1 downto 21) when colbits8_rowbits11   ,
                    raddr(sdram_chipbits+22-1 downto 22) when colbits8_rowbits12  ,
                    raddr(sdram_chipbits+23-1 downto 23) when colbits9_rowbits12 ,
                    raddr(sdram_chipbits+24-1 downto 24) when colbits10_rowbits12,
                    raddr(sdram_chipbits+25-1 downto 25) when colbits11_rowbits12,
                    raddr(sdram_chipbits+23-1 downto 23) when colbits8_rowbits13 ,
                    raddr(sdram_chipbits+24-1 downto 24) when colbits9_rowbits13 ,
                    raddr(sdram_chipbits+25-1 downto 25) when colbits10_rowbits13,
                    raddr(sdram_chipbits+26-1 downto 26) when colbits11_rowbits13,
                    raddr(sdram_chipbits+27-1 downto 27) when colbits12_rowbits13,
                    raddr(sdram_chipbits+26-1 downto 26) when colbits10_rowbits14,
                    raddr(sdram_chipbits+27-1 downto 27) when colbits11_rowbits14,
                    raddr(sdram_chipbits+28-1 downto 28) when colbits12_rowbits14,
                    (others => '-') when others;

    with colbits_rowbits select
        rowaddr_int <= "000" & raddr(20 downto 10) when colbits8_rowbits11,
                   "00" & raddr(21 downto 10) when colbits8_rowbits12,
                   "00" & raddr(22 downto 11) when colbits9_rowbits12,
                   "00" & raddr(23 downto 12) when colbits10_rowbits12,
                   "00" & raddr(24 downto 13) when colbits11_rowbits12,
                   "0" & raddr(22 downto 10) when colbits8_rowbits13,
                   "0" & raddr(23 downto 11) when colbits9_rowbits13,
                   "0" & raddr(24 downto 12) when colbits10_rowbits13,
                   "0" & raddr(25 downto 13) when colbits11_rowbits13,
                   "0" & raddr(26 downto 14) when colbits12_rowbits13,
                   raddr(25 downto 12) when colbits10_rowbits14,
                   raddr(26 downto 13) when colbits11_rowbits14,
                   raddr(27 downto 14) when colbits12_rowbits14,
                   (others => '-') when others;
    rowaddr <= rowaddr_int(sdram_rowbits - 1 downto 0);

    with colbits select
        coladdr <= "00000" & raddr(7 downto 0) when colbits8,
                   "0000" & raddr(8 downto 0) when colbits9,
                   "000" & raddr(9 downto 0) when colbits10,
                   "0" & raddr(10) & "0" & raddr(9 downto 0) when colbits11,
                   raddr(11 downto 10) & "0" & raddr(9 downto 0) when colbits12,
                   (others => '-') when others;


                    
-- translate requests into a command word
--
-- inputs:      r_req, w_req, rf_req, p_req, m_req              request lines
--              ack                                             command acknowledge
--              chipaddr, rowaddr, bankaddr                     current request's address
--              line0, line1, line2, line3,
--              line4, line5, line6, line7                      active lines in each bank
--
-- outputs:     rfsh_cmd, prch_cmd, mode_cmd, rdwr_cmd, read_cmd, lnht_cmd, new_cmd      command bits

cmd_p:process(reset_n,clk)
begin
    if (reset_n = '0') then
        rfsh_cmd <= '0';
        prch_cmd <= '0';
        mode_cmd <= '0';
        rdwr_cmd <= (others => '0');
        read_cmd <= '0';
        new_cmd <= '1';
        lnht_cmd <= (others => '0');
    elsif (clk'event and (clk = '1')) then
        if (ack = '1') then
            rfsh_cmd <= '0';
            prch_cmd <= '0';
            mode_cmd <= '0';
            rdwr_cmd <= (others => '0');
            new_cmd <= '1';
        elsif (rf_req = '1' and new_cmd = '1') then
            rfsh_cmd <= '1';
            prch_cmd <= '0';
            mode_cmd <= '0';
            rdwr_cmd <= (others => '0');
            new_cmd <= '0';
        elsif (p_req = '1' and new_cmd = '1') then
            rfsh_cmd <= '0';
            prch_cmd <= '1';
            mode_cmd <= '0';
            rdwr_cmd <= (others => '0');
            new_cmd <= '0';
        elsif ((m_req = '1' or em_req = '1' or m_req_dll_reset = '1') and new_cmd = '1') then
            rfsh_cmd <= '0';
            prch_cmd <= '0';
            mode_cmd <= '1';
            rdwr_cmd <= (others => '0');
            new_cmd <= '0';
        elsif ((r_req = '1' or w_req = '1') and new_cmd = '1') then
            rfsh_cmd <= '0';
            prch_cmd <= '0';
            mode_cmd <= '0';
            new_cmd <= '0';
            if (sdram_bankstatmodules = 8) then
                rdwr_cmd <= shl ("00000001",chipaddr(0) & bankaddr);
            else
                rdwr_cmd <= shl ("0001", bankaddr);
            end if;
        elsif (new_cmd = '1') then
            rfsh_cmd <= '0';
            prch_cmd <= '0';
            mode_cmd <= '0';
            rdwr_cmd <= (others => '0');
        end if;

        read_cmd <= r_req;

        for l in 0 to sdram_bankstatmodules-1 loop
            if (unsigned(chipaddr) & unsigned (rowaddr)) = (unsigned(chip_i(l)) & unsigned(line_i(l))) or goact(l) = '1' then
                lnht_cmd(l) <= '1';
            else
                lnht_cmd(l) <= '0';
            end if;
        end loop;
            
    end if;
    
end process cmd_p;

-- take command and state info and issue actions 
--
-- inputs:      rfsh_cmd, prch_cmd, mode_cmd, rdwr_cmd, read_cmd, lnht_cmd        command bits
--              actable, rwable, pcable, active, rc_zero, wc_zero                 state bits
--              ack                                                                     acknowledge bit
--
-- outputs:     goact, dorw, prch, doread, dowrite, refresh, precharge, mode, act, rw, pch, bcount    actions
--

act_p:process(reset_n,clk)
begin
    if (reset_n = '0') then
        goact     <= (others => '0');
        dorw      <= (others => '0');
        prch      <= (others => '0');
        doread    <= '0';
        dowrite   <= '0';
        refresh   <= '0';
        precharge <= '0';
        mode      <= '0';
        act       <= '0';
        rw        <= '0';
        pch       <= '0';
        bcount    <= (others => '0');
        pchaddr   <= (others => '0');
    elsif (clk'event and (clk = '1')) then

        if (rfsh_cmd = '1' and (actable = ones(sdram_bankstatmodules-1 downto 0)) and refresh = '0' and bterm_cmd = '0') then            
            -- refresh waits for all banks actable
            refresh <= '1';
        else
            refresh <= '0';
        end if;

        --
        -- precharge is issued when refresh is requested and banks are active
        -- or when precharge is requested and all banks are actable
        --

        if (rfsh_cmd = '1' and pcable = ones(sdram_bankstatmodules-1 downto 0) and 
                not(active = zeros(sdram_bankstatmodules-1 downto 0)) and precharge = '0' and bterm_cmd = '0') then    
            -- precharge before refresh if needed
            precharge <= '1';
        elsif (prch_cmd = '1' and actable = ones(sdram_bankstatmodules-1 downto 0) and precharge = '0') then 
            -- precharge waits for all banks actable
            precharge <= '1';
        else
            precharge <= '0';
        end if;
    
        --
        -- mode write is issued when all banks are actable
        --

        if (mode_cmd = '1' and actable = ones(sdram_bankstatmodules-1 downto 0) and mode = '0') then     
            -- mode waits for all banks actable
            mode <= '1';
        else
            mode <= '0';
        end if;

        --
        -- active issued on active command with bank actable
        --               or read/write command with bank actable but not rwable
        --
        act       <= '0';
        for i in 0 to sdram_bankstatmodules-1 loop
            if (rdwr_cmd(i) = '1' and actable(i) = '1' and goact(i) = '0' and bterm_cmd = '0' and ack = '0') then
                goact(i)    <= '1';
                act        <= '1';
            else
                goact(i)    <= '0';
            end if;
        end loop;

        --
        -- read/write issued on read/write command with bank rwable and 
        --   the appropriate counter is zero.
        --
        rw        <= '0';
        pch       <= '0';
        for k in 0 to sdram_bankstatmodules-1 loop
             -- sdr
                if (rdwr_cmd(k) = '1' and bterm_cmd = '0' and ack = '0' and rwable(k) = '1' and 
                        dorw(k) = '0' and lnht_cmd(k) = '1' and 
                        ((read_cmd = '1' and rc_zero = '1' and (turnaround_hold = '0' or rc_zero_d = '1')) or 
                        (read_cmd = '0' and wc_zero = '1')))  then
                    dorw(k)    <= '1';
                    rw        <= '1';
                else
                    dorw(k)    <= '0';
                end if;
           

            if (rdwr_cmd(k) = '1' and lnht_cmd(k) = '0' and active(k) = '1' and pcable(k) = '1' and pch = '0' and bterm_cmd = '0') then 
                prch(k) <= '1';
                pch <= '1';
                pchaddr <= chip_i(k);
            else
                prch(k) <= '0';
            end if;
        end loop;

    bcount  <= b_size;
    doread  <= read_cmd;
    dowrite <= not(read_cmd);

    end if;
end process act_p;

--
-- Issue a burst terminate whenever a shortened burst is required
--
bterm_p:process(reset_n,clk)
    begin
        if (reset_n = '0') then
            bterm     <= '0';
            bterm_cmd <= '0';
            bdcnt     <= (others => '0');
            bdzero <= '1';
        elsif (clk'event and (clk = '1')) then
            if (rw = '1') then

                if (bcount = 1 or bcount = 0) then
                    bterm <= '1';
                    bterm_cmd <= '0';
                    bdcnt <= x"0";
                    bdzero <= '1';
                elsif (bcount = blen) then
                    bterm <= '0';
                    bterm_cmd <= '0';
                    bdcnt <= x"0";
                    bdzero <= '1';
                elsif (bcount = 2) then
                    bterm <= '0';
                    bterm_cmd <= '1';
                    bdcnt <= x"2";
                    bdzero <= '0';
                else
                    bterm <= '0';
                    bterm_cmd <= '0';
                    bdcnt <= bcount;
                    bdzero <= '0';
                end if;
            elsif (bdzero = '0') then
                bdcnt <= bdcnt - 1;
                if (bdcnt = 3) then
                    bterm_cmd <= '1';
                else
                    bterm_cmd <= '0';
                end if;
                if (bdcnt = 2) then
                    bterm <= '1';
                else
                    bterm <= '0';
                end if;
                if (bdcnt = 2) then     
                    bdzero <= '1';      
                else                    
                    bdzero <= '0';      
                end if;                 
            else
                bterm <= '0';
                bterm_cmd <= '0';
                bdcnt <= x"0";
                bdzero <= '1';
            end if;
        end if;

end process bterm_p;


-- translate action into control signals to the sdram
--
-- inputs:      refresh, precharge, mode, rw, act, bterm, pch, doburst          action bits
--              rowaddr, bankaddr, chipaddr, coladdr                            address
--
-- outputs:     sa, ba, s, ras_n, cas_n, we_n, cke                                  sdram control signals
--
-- precompute sa for precharge, mode, etc.
--
cl_cl_half <= (cl(2),cl(1),cl(0), cl_half); -- used below for cl case statement (variable!!!)

psa_p:process(reset_n,clk)
begin
    if (reset_n = '0') then
        psa <= (others => '0');
    elsif (clk'event and clk = '1') then
        if (prch_cmd = '1' or rfsh_cmd = '1') then
            psa <= "00010100000000";
        elsif (mode_cmd = '1') then
                 -- sdr
                case bl is
                when "00" => psa(2 downto 0) <= "000"; --sdr bl = 1
                when "01" => psa(2 downto 0) <= "001"; --sdr bl = 2
                when "10" => psa(2 downto 0) <= "010"; --sdr bl = 4
                when "11" => psa(2 downto 0) <= "011"; --sdr bl = 8
                when others => null;
                end case;
                
                psa(3) <= '0'; -- burst type = sequential
                
                case cl is
                when "000" => psa(6 downto 4) <= "001"; --cl = 1.0
                when "010" => psa(6 downto 4) <= "010"; --cl = 2.0
                when "011" => psa(6 downto 4) <= "011"; --cl = 3.0
                when "100" => psa(6 downto 4) <= "100"; --cl = 4.0
                when others  => psa(6 downto 4) <= "011"; --cl = 3.0
                end case;

                psa(13 downto 7) <= "0000000";
            
        else
            psa <= "00000000000000";
        end if;
    end if;
end process psa_p;        

            
sd_ctl_p:process(reset_n,clk)

begin
    if (reset_n = '0') then
        sa <= (others => '0');    
        ba <= (others => '0');    
        ras_n <= '1';    
        cas_n <= '1';    
        we_n <= '1';    
        cke <= '0';    
        oldchip <= (others => '0');
        cs_n <= (others => '1');    
    elsif (clk'event and clk = '1') then
        cke <= '1';    

        if (precharge = '1' or mode = '1' or bterm = '1' or pch = '1') then
            sa <= psa;    
        elsif (act = '1') then
            sa <= rowaddr_int;    
        elsif (auto_pch = '1') then 
            sa <= "0" & coladdr(12 downto 11) & "1" & coladdr(9 downto 0);
        else
            sa <= "0" & coladdr(12 downto 11) & "0" & coladdr(9 downto 0);
        end if;
        
        if (precharge = '1' or mode = '1') then
            if (em_req = '0') then -- base mode register
                ba <= "00";
            else
                ba <= "01";
            end if;
        else
           ba <= bankaddr(1 downto 0);    
        end if;
        
        if (refresh = '1' or precharge = '1' or mode = '1') then
            cs_n <= (others => '0');
        elsif (bterm = '1' ) then
            for l in 0 to sdram_chips-1 loop
                if (l = oldchip) then 
                    cs_n(l) <= '0';
                else
                    cs_n(l) <= '1';
                end if;
            end loop;
        elsif pch = '1' then
            for l in 0 to sdram_chips-1 loop
                if (l = pchaddr) then
                    cs_n(l) <= '0';
                else
                    cs_n(l) <= '1';
                end if;
            end loop;
        else   
            for l in 0 to sdram_chips-1 loop
                if (l = chipaddr) then
                    cs_n(l) <= '0';
                else
                    cs_n(l) <= '1';
                end if;
            end loop;
        end if;
                    
        if (rw = '1') then
           oldchip <= chipaddr;    
        end if;
        
        if (refresh = '1') then         -- refresh
           ras_n <= '0';    
           cas_n <= '0';    
           we_n <= '1';    
        elsif (precharge = '1') then    -- precharge all
           ras_n <= '0';    
           cas_n <= '1';    
           we_n <= '0';    
        elsif (mode = '1') then         -- mode write
           ras_n <= '0';    
           cas_n <= '0';    
           we_n <= '0';    
        elsif (act = '1') then          -- activate
           ras_n <= '0';    
           cas_n <= '1';    
           we_n <= '1';    
        elsif (rw = '1') then           -- read/write
           ras_n <= '1';    
           cas_n <= '0';    
           we_n <= doread;    
        elsif (bterm = '1') then        -- burst terminate
           ras_n <= '1';    
           cas_n <= '1';    
           we_n <= '0';    
        elsif (pch = '1') then          -- precharge a bank
           ras_n <= '0';    
           cas_n <= '1';    
           we_n <= '0';    
        else                            -- no operation
           ras_n <= '1';    
           cas_n <= '1';    
           we_n <= '1';    
        end if;
      end if;
end process sd_ctl_p;
  
--
-- assert dqm during write burst terminate per jedec 21-c
--
dqm_bterm_p: process (clk, reset_n)
begin
    if (reset_n = '0') then
        dqm_wr_bterm <= '0';
    elsif (clk'event and clk = '1') then
        if bterm = '1' and w_valid_i = '1' then
            dqm_wr_bterm <= '1';
        else
            dqm_wr_bterm <= '0';
        end if;
    end if;
end process dqm_bterm_p;


-- prevent dqs premable contention during continuous switch to new chip select.
--      this can happen when switching from chip 'a' to chip 'b' during reads where chip 'a'
--      is still asserting dqs (due to dqs postamble) when chip 'b' starts asserting dqs
--      (due to dqs preamble).
--
-- inputs:       rw
--
-- outputs:      dqs_hold      --  tells controller to use dqs_hold_sr to delay read command
--                                 to new chip to prevent dqs contention.      
--               dqs_hold_sr   --  shift register initiated by the read / write command (rw)

dqs_contention_p: process (clk, reset_n)
begin
    if (reset_n = '0') then
        turnaround_hold <= '0';
        dqs_hold_sr <= "0000";
    elsif (clk'event and clk = '1') then
        if rw = '1' then
            dqs_hold_sr <= "1111";
        else
            dqs_hold_sr <= '0' & dqs_hold_sr(3 downto 1);
        end if;
            
        if (r_req = '1' and new_cmd = '1' and chipaddr /= oldchip) then
            turnaround_hold <= '1';
        elsif rw = '1' then
            turnaround_hold <= '0';
        end if;
    end if;
end process dqs_contention_p;

-- rc and wc counters keep track of data bus availablity for read and write
--
-- inputs:      rw, doread, dowrite    action bits
--
-- outputs:     rcount, wcount        down counters until bus free
--              rc_zero, wc_zero  flags indicating bus available for read or write
wc_p:process(reset_n,clk)
begin
    if (reset_n = '0') then
        wcount <= "0000";
        wc_zero <= '1';
    elsif (clk'event and (clk = '1')) then
        if (rw = '1' and dowrite = '0') then

            wcount <= bcount + cl;
      
            wc_zero <= '0';
        elsif (rw = '1' and dowrite = '1') then
            if (bcount > 2) then
                wcount <= bcount - 2;
                wc_zero <= '0';
            else
                wcount <= "0000";
                wc_zero <= '1';
            end if;
        elsif (wc_zero = '0') then
            wcount <= wcount - 1;
            if (wcount = 1 or wcount = 0) then
                wc_zero <= '1';
            end if;
        else
            wcount <= "0000";
            wc_zero <= '1';
        end if;
    end if;
end process wc_p;

rc_p:process(reset_n,clk)
begin
    if (reset_n = '0') then
        rcount <= "0000";
        rc_zero <= '1';
        rc_zero_d <= '1';
    elsif (clk'event and (clk = '1')) then
        rc_zero_d <= rc_zero;
        if (rw = '1' and doread = '0') then
                --SDR, take into account burst term         
                if (bcount = blen) then
                    if (blen <= 2) then
                        rcount <= "0000";
                        rc_zero <= '1';
                    else
                        rcount <= (blen - "0010");    
                        rc_zero <= '0';
                    end if;    
                elsif (bcount > (cl + "01")) then
                    rcount <= (bcount - "0001");    
                    rc_zero <= '0';    
                else
                    rcount <= "0000";    
                    rc_zero <= '1';    
                end if;
            
        elsif (rw = '1' and doread = '1') then
            if (bcount > "0010") then
                rcount <= (bcount - "0010");    
                rc_zero <= '0';    
            else
                rcount <= "0000";    
                rc_zero <= '1';    
            end if;
        elsif (rc_zero = '0') then
            rcount <= rcount - "0001";    
            if (rcount = 1 or rcount = 0) then
                rc_zero <= '1';    
            end if;
        else
            rcount <= "0000";    
            rc_zero <= '1';    
        end if;
    end if;
end process rc_p;

-- data flow control signals --
--   r_valid derived using shift register (rshift) that keeps track of where read data is in pipeline
--   d_req / w_valid derived using shift register (wshift) that keeps track of where write data is
--     in pipeline
data_flow_ctrl_p : process  (clk, reset_n)
begin
    if (reset_n = '0') then
        rshift <= (others => '0');    
        wshift <= (others => '0');    
        r_valid <= '0';    
        r_valid_delay <= '0';    
    elsif (clk'event and clk = '1') then
        if (rw = '1' and doread = '1') then
            case cl is
            when "001" => 
                if (bcount = 1) then
                    rshift(10 downto 0) <= "00000000001";    
                elsif (bcount = 2) then
                    rshift(10 downto 0) <= "00000000011";    
                elsif (bcount = 3) then
                    rshift(10 downto 0) <= "00000000111";    
                elsif (bcount = 4) then
                    rshift(10 downto 0) <= "00000001111";    
                elsif (bcount = 5) then
                    rshift(10 downto 0) <= "00000011111";    
                elsif (bcount = 6) then
                    rshift(10 downto 0) <= "00000111111";    
                elsif (bcount = 7) then
                    rshift(10 downto 0) <= "00001111111";    
                elsif (bcount = 8) then
                    rshift(10 downto 0) <= "00011111111";    
                end if;
            when "010" =>
                rshift(0) <= rshift(1);    
                if (bcount = 1) then
                    rshift(10 downto 1) <= "0000000001";    
                elsif (bcount = 2) then
                    rshift(10 downto 1) <= "0000000011";    
                elsif (bcount = 3) then
                    rshift(10 downto 1) <= "0000000111";    
                elsif (bcount = 4) then
                    rshift(10 downto 1) <= "0000001111";    
                elsif (bcount = 5) then
                    rshift(10 downto 1) <= "0000011111";    
                elsif (bcount = 6) then
                    rshift(10 downto 1) <= "0000111111";    
                elsif (bcount = 7) then
                    rshift(10 downto 1) <= "0001111111";    
                elsif (bcount = 8) then
                    rshift(10 downto 1) <= "0011111111";    
                end if;
            when "011" =>
                rshift(1 downto 0) <= rshift(2 downto 1);    
                if (bcount = 1) then
                    rshift(10 downto 2) <= "000000001";    
                elsif (bcount = 2) then
                    rshift(10 downto 2) <= "000000011";    
                elsif (bcount = 3) then
                    rshift(10 downto 2) <= "000000111";    
                elsif (bcount = 4) then
                    rshift(10 downto 2) <= "000001111";    
                elsif (bcount = 5) then
                    rshift(10 downto 2) <= "000011111";    
                elsif (bcount = 6) then
                    rshift(10 downto 2) <= "000111111";    
                elsif (bcount = 7) then
                    rshift(10 downto 2) <= "001111111";    
                elsif (bcount = 8) then
                    rshift(10 downto 2) <= "011111111";    
                end if;
            when "100" =>
                rshift(2 downto 0) <= rshift(3 downto 1);    
                if (bcount = 1) then
                    rshift(10 downto 3) <= "00000001";    
                elsif (bcount = 2) then
                    rshift(10 downto 3) <= "00000011";    
                elsif (bcount = 3) then
                    rshift(10 downto 3) <= "00000111";    
                elsif (bcount = 4) then
                    rshift(10 downto 3) <= "00001111";    
                elsif (bcount = 5) then
                    rshift(10 downto 3) <= "00011111";    
                elsif (bcount = 6) then
                    rshift(10 downto 3) <= "00111111";    
                elsif (bcount = 7) then
                    rshift(10 downto 3) <= "01111111";    
                elsif (bcount = 8) then
                    rshift(10 downto 3) <= "11111111";    
                end if;
            when others => null;
            end case;
           
            if (regdimm = '1') then
                r_valid <= r_valid_delay;    
                r_valid_delay <= rshift(0);    
            else
                r_valid <= rshift(0);    
                r_valid_delay <= '0';    
            end if;
        else
            rshift <= '0' & rshift(10 downto 1);    
            if (regdimm = '1') then
                r_valid <= r_valid_delay;    
                r_valid_delay <= rshift(0);    
            else
                r_valid <= rshift(0);    
                r_valid_delay <= '0';    
            end if;
        end if;
       
        if (rw = '1' and doread = '0') then
            case bcount is
            when "0001" => wshift <= "00000001";    
            when "0010" => wshift <= "00000011";
            when "0011" => wshift <= "00000111";
            when "0100" => wshift <= "00001111";
            when "0101" => wshift <= "00011111";
            when "0110" => wshift <= "00111111";
            when "0111" => wshift <= "01111111";
            when "1000" => wshift <= "11111111";
            when others => wshift <= (others => '-'); --any other value for bcount is invalid
            end case;
        else
            wshift <= '0' & wshift(7 downto 1);    
        end if;
    end if;
end process data_flow_ctrl_p;

-- data write requests, valids, and output enables
--
-- d_req -- this is registered again at higher level
-- w_valid -- delayed version of d_req, registered again at higher level
-- output enable -- simialar to w_valid but not delayed at higher level so that it is active one clock
--                  the output needs to be enabled to allow for long tco on tri-state drivers.  this
--                  oe is typically not used with ddr
wr_flow_ctrl_p : process (clk, reset_n)
begin
    if (reset_n = '0') then
        w_valid_i <= '0';
        w_valid_d <= '0';
        oe <= '0';
    elsif (clk'event and clk = '1') then
        w_valid_i <= (rw and dowrite) or wshift(1);
        w_valid_d <= w_valid_i;
        
        
            if (regdimm = '1') then
                oe <= w_valid_i or w_valid_d;
            else
                oe <= (rw and dowrite) or wshift(1) or w_valid_i;
            end if;
        
    end if;
end process wr_flow_ctrl_p;

d_req <= w_valid_i when regdimm = '1' else
         (rw and dowrite) or wshift(1);

w_valid <= w_valid_d when regdimm = '1' else
           w_valid_i;
                    

-- command acknowledge
--
-- inputs:      rfsh_cmd, prch_cmd, mode_cmd            command bits
--              actable                                 state bits
--              rw                                      action bit
--
-- outputs:     rw_ack, s_ack                           acknowledge bits
--              ack                                     flag for command acknowledge

dh_p:process(reset_n,clk)
begin
     if (reset_n = '0') then
        s_ack  <= '0';
        ack    <= '0';
    elsif (clk'event and (clk = '1')) then
        if (rfsh_cmd = '1' and actable = ones(sdram_bankstatmodules-1 downto 0) and ack = '0') then
            s_ack <= '1';
            ack <= '1';
        elsif (prch_cmd = '1' and actable = ones(sdram_bankstatmodules-1 downto 0) and ack = '0') then
            s_ack <= '1';
            ack <= '1';
        elsif (mode_cmd = '1' and actable = ones(sdram_bankstatmodules-1 downto 0) and ack = '0') then
            s_ack <= '1';
            ack <= '1';
        elsif (rw = '1') then
            s_ack <= '0';
            ack <= '1';
        else
            s_ack <= '0';
            ack <= '0';
        end if;
    end if;
end process dh_p;


-- decode bl into actual burst length (number of local side data transfers)

blen_p:process (bl)
begin
    case bl is
    when "00" => blen <= "0001";
    when "01" => blen <= "0010";
    when "10" => blen <= "0100";
    when "11" => blen <= "1000";
    when others => null;
    end case;
end process blen_p;

rw_ack <= rw ;

end rtl;
