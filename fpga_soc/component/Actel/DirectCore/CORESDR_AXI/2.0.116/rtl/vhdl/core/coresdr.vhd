
-- *********************************************************************/ 
-- Copyright (c) 2009 Actel Corporation.  All rights reserved.  
-- 
-- Any use or redistribution in part or in whole must be handled in 
-- accordance with the Actel license agreement and must be approved 
-- in advance in writing.  
--  
-- File : CORESDR.vhd 
--     
-- Description: This module is the top level module for the Local bus version of the
--              SDRAM controller.
--
--
-- Notes:
--
-- *********************************************************************/ 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;


entity CORESDR is
    generic (
        FAMILY                         :  integer := 16;    -- Device Family
        SDRAM_RASIZE    : integer := 31;   -- local address bus size
        SDRAM_CHIPS     : integer := 8;    -- number of chip selects
        SDRAM_COLBITS   : integer := 12;   -- max number of sdram column bits
        SDRAM_ROWBITS   : integer := 14;   -- max number of sdram row bits
        SDRAM_CHIPBITS  : integer := 3;    -- number of encoded chip select bits        
        SDRAM_BANKSTATMODULES : integer := 4 -- number of bank status modules used (in multiples of 4)
  );
 
    port(
         CLK             : in std_logic;
         RESET_N         : in std_logic;                      
         RADDR           : in std_logic_vector (SDRAM_RASIZE-1 downto 0); 
         R_REQ           : in std_logic;                      
         W_REQ           : in std_logic;                      
         B_SIZE          : in std_logic_vector (3 downto 0);
         AUTO_PCH        : in std_logic;
         SD_INIT         : in std_logic;
         RAS             : in std_logic_vector (3 downto 0);
         RCD             : in std_logic_vector (2 downto 0);
         RRD             : in std_logic_vector (1 downto 0);
         RP              : in std_logic_vector (2 downto 0);
         RC              : in std_logic_vector (3 downto 0);
         RFC             : in std_logic_vector (3 downto 0);
         WR              : in std_logic_vector (1 downto 0);
         MRD             : in std_logic_vector (2 downto 0);
         CL              : in std_logic_vector (2 downto 0);
         BL              : in std_logic_vector (1 downto 0);
         DELAY           : in std_logic_vector (15 downto 0);
         REF             : in std_logic_vector (15 downto 0);
         COLBITS         : in std_logic_vector (2 downto 0);
         ROWBITS         : in std_logic_vector (1 downto 0);
         REGDIMM         : in std_logic;
         RW_ACK          : out std_logic;                     
         R_VALID         : out std_logic;                     
         D_REQ           : out std_logic;                     
         W_VALID         : out std_logic;                     
         OE              : out std_logic;              
         SA              : out std_logic_vector (13 downto 0);
         BA              : out std_logic_vector (1 downto 0); 
         CS_N            : out std_logic_vector (SDRAM_CHIPS-1 downto 0); 
         DQM             : out std_logic;
         CKE             : out std_logic;                     
         RAS_N           : out std_logic;
         CAS_N           : out std_logic;
         WE_N            : out std_logic
    );
end CORESDR;

                 
architecture rtl of CORESDR is

attribute syn_hier : string;
attribute syn_hier of rtl: architecture is "hard";

    component fastinit
        generic (
            sdram_rasize    : in integer := 31;   -- local address bus size
            sdram_chips     : in integer := 8;    -- number of chip selects
            sdram_colbits   : in integer := 12;   -- max number of sdram column bits
            sdram_rowbits   : in integer := 14;   -- max number of sdram row bits
            sdram_chipbits  : in integer := 3;    -- number of encoded chip select bits
            sdram_bankstatmodules : in integer := 4 -- number of bank status modules used (in multiples of 4)
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
    end component;

signal sd_init_i            : std_logic;
signal auto_pch_i           : std_logic;
signal ras_i                : std_logic_vector (3 downto 0);
signal rcd_i                : std_logic_vector (2 downto 0);
signal rrd_i                : std_logic_vector (1 downto 0);
signal rp_i                 : std_logic_vector (2 downto 0);
signal rc_i                 : std_logic_vector (3 downto 0);
signal rfc_i                : std_logic_vector (3 downto 0);
signal wr_i                 : std_logic_vector (1 downto 0);
signal mrd_i                : std_logic_vector (2 downto 0);
signal cl_i                 : std_logic_vector (2 downto 0);
signal cl_half_i            : std_logic;
signal bl_i                 : std_logic_vector (1 downto 0);
signal ds_i                 : std_logic_vector (1 downto 0);
signal ref_i                : std_logic_vector (15 downto 0);
signal delay_i              : std_logic_vector (15 downto 0);
signal colbits_i            : std_logic_vector (2 downto 0);
signal rowbits_i            : std_logic_vector (1 downto 0);
signal regdimm_i            : std_logic;

signal r_req_i              : std_logic;
signal w_req_i              : std_logic;
signal r_req_in             : std_logic;
signal w_req_in             : std_logic;
signal r_valid_i            : std_logic;
signal w_valid_i            : std_logic;
signal rw_ack_i             : std_logic;
signal d_req_i              : std_logic;
signal dqm_i                : std_logic; 

signal sa_i                 : std_logic_vector (13 downto 0);
signal ba_i                 : std_logic_vector (1 downto 0);
signal cs_n_i               : std_logic_vector (sdram_chips-1 downto 0);
signal cke_i                : std_logic;
signal ras_n_i              : std_logic;
signal cas_n_i              : std_logic;
signal we_n_i               : std_logic;


begin

-- parameter settings -- these parameter ports may be hardwired here prior to synthesis
--   to generate higher fmax, more compact route. 
sd_init_i   <= SD_INIT;    -- sdram init control
auto_pch_i  <= AUTO_PCH;   -- auto precharge request
ras_i       <= RAS;        -- minimum time between activate and autoprecharge
rcd_i       <= RCD;        -- minimum time between activate and read/write
rrd_i       <= RRD;        -- minimum time between activate to activate in different banks
rp_i        <= RP;         -- minimum precharge to activate.
rc_i        <= RC;         -- Minimum ACTIVATE to ACTIVATE in same bank.
rfc_i       <= RFC;        -- Minimum AUTO-REFRESH to AUTO-REFRESH/ACTIVATE
wr_i        <= WR;         -- Minimum write to autoprecharge
mrd_i       <= MRD;        -- minimum loadmode to activate command.
cl_i        <= CL;         -- cas latency.
cl_half_i   <= '0';        -- half clock cas latency
bl_i        <= BL;         -- local burst length 0=1 1=2 2=4 3=8.
ds_i        <= "00";       -- Drive strength (not used for SDR) 
ref_i       <= REF;        -- refresh period
delay_i     <= DELAY;      -- initialization delay
colbits_i   <= COLBITS;    -- number of column bits
rowbits_i   <= ROWBITS;    -- number of row bits   
regdimm_i   <= REGDIMM;    -- registered dimm selection, 0=non-reg 1=reg
    

-- instantiations    
    fastinit_1 : fastinit
        generic map(
            sdram_rasize          =>    SDRAM_RASIZE  ,  
            sdram_chips           =>    SDRAM_CHIPS   ,  
            sdram_colbits         =>    SDRAM_COLBITS ,  
            sdram_rowbits         =>    SDRAM_ROWBITS ,  
            sdram_chipbits        =>    SDRAM_CHIPBITS,  
            sdram_bankstatmodules =>    SDRAM_BANKSTATMODULES)

        port map (
            clk        =>     CLK       ,
            reset_n    =>     RESET_N   ,
            raddr      =>     RADDR     ,
            r_req      =>     r_req_in     ,
            w_req      =>     w_req_in     ,
            b_size     =>     B_SIZE    ,
            auto_pch   =>     auto_pch_i,
            sd_init    =>     sd_init_i   ,
            ras        =>     ras_i     ,
            rcd        =>     rcd_i       ,
            rrd        =>     rrd_i       ,
            rp         =>     rp_i      ,
            rc         =>     rc_i      ,
            rfc        =>     rfc_i     ,
            wr         =>     wr_i      ,
            mrd        =>     mrd_i     ,
            cl         =>     cl_i      ,
            cl_half    =>     cl_half_i ,
            bl         =>     bl_i      ,
            ds         =>     ds_i      ,
            delay      =>     delay_i   ,
            ref        =>     ref_i     ,
            colbits    =>     colbits_i ,
            rowbits    =>     rowbits_i ,
            regdimm    =>     regdimm_i ,
            rw_ack     =>     rw_ack_i  ,
            r_valid    =>     r_valid_i ,
            d_req      =>     d_req_i   ,
            w_valid    =>     w_valid_i ,
            oe         =>     OE      ,                 
            sa         =>     sa_i      ,
            ba         =>     ba_i      ,
            cs_n       =>     cs_n_i    ,
            dqm        =>     dqm_i     ,
            cke        =>     cke_i     ,
            ras_n      =>     ras_n_i   ,
            cas_n      =>     cas_n_i   ,
            we_n       =>     we_n_i    
        );                            


--sdram command word and addressing registers -- typically placed in apex
--      20k/ke i/o cell.
--      no reset is used here because i/o cells in apex 20k cannot reset to high (preset).
--      the logic high (inactive) states for these registers are propagated from previous logic stages.

    cmd_word_p : process (CLK)
    begin    
        if (CLK'event and CLK = '1') then
            SA <=     sa_i;
            BA <=     ba_i;
            CS_N <=   cs_n_i;
            CKE <=    cke_i;
            RAS_N <=  ras_n_i;
            CAS_N <=  cas_n_i;
            WE_N <=   we_n_i;
            DQM <=    dqm_i;
        end if;
    end process cmd_word_p;

-- Register localbus signals to ease routing to external locations 

    localbus_reg_p : process (CLK, RESET_N)
    begin
        if (RESET_N = '0') then
            RW_ACK <= '0';
            R_VALID <= '0';
            D_REQ <= '0';
            W_VALID <= '0';
            r_req_i <= '0';
            w_req_i <= '0';
        elsif (CLK'event and CLK = '1') then
            RW_ACK <= rw_ack_i;
            R_VALID <= r_valid_i;
            D_REQ <= d_req_i;
            W_VALID <= w_valid_i;
            r_req_i <= R_REQ;
            w_req_i <= W_REQ;
        end if;
    end process localbus_reg_p;

r_req_in <= r_req_i and R_REQ;
w_req_in <= w_req_i and W_REQ;
            
end rtl;
