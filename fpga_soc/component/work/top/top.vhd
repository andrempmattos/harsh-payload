----------------------------------------------------------------------
-- Created by SmartDesign Thu Mar 26 22:07:10 2020
-- Version: v11.8 11.8.0.26
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
----------------------------------------------------------------------
-- top entity declaration
----------------------------------------------------------------------
entity top is
    -- Port list
    port(
        -- Inputs
        CLK1_PAD     : in    std_logic;
        DEVRST_N     : in    std_logic;
        GPIO_29_IN   : in    std_logic;
        MMUART_0_RXD : in    std_logic;
        -- Outputs
        BA           : out   std_logic_vector(1 downto 0);
        CAS_N        : out   std_logic;
        CKE          : out   std_logic;
        CS_N         : out   std_logic_vector(0 to 0);
        DQM          : out   std_logic_vector(1 downto 0);
        GPIO_10_OUT  : out   std_logic;
        GPIO_11_OUT  : out   std_logic;
        GPIO_12_OUT  : out   std_logic;
        GPIO_13_OUT  : out   std_logic;
        GPIO_14_OUT  : out   std_logic;
        GPIO_15_OUT  : out   std_logic;
        GPIO_16_OUT  : out   std_logic;
        GPIO_25_OUT  : out   std_logic;
        GPIO_8_OUT   : out   std_logic;
        GPIO_9_OUT   : out   std_logic;
        MMUART_0_TXD : out   std_logic;
        RAS_N        : out   std_logic;
        SA           : out   std_logic_vector(13 downto 0);
        SDRCLK       : out   std_logic;
        WE_N         : out   std_logic;
        -- Inouts
        DQ           : inout std_logic_vector(15 downto 0)
        );
end top;
----------------------------------------------------------------------
-- top architecture body
----------------------------------------------------------------------
architecture RTL of top is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- top_sb
component top_sb
    -- Port list
    port(
        -- Inputs
        CLK1_PAD         : in    std_logic;
        DEVRST_N         : in    std_logic;
        FAB_RESET_N      : in    std_logic;
        GPIO_29_IN       : in    std_logic;
        MMUART_0_RXD     : in    std_logic;
        -- Outputs
        BA               : out   std_logic_vector(1 downto 0);
        CAS_N            : out   std_logic;
        CKE              : out   std_logic;
        CS_N             : out   std_logic_vector(0 to 0);
        DQM              : out   std_logic_vector(1 downto 0);
        FAB_CCC_GL2      : out   std_logic;
        FAB_CCC_LOCK     : out   std_logic;
        GPIO_10_OUT      : out   std_logic;
        GPIO_11_OUT      : out   std_logic;
        GPIO_12_OUT      : out   std_logic;
        GPIO_13_OUT      : out   std_logic;
        GPIO_14_OUT      : out   std_logic;
        GPIO_15_OUT      : out   std_logic;
        GPIO_16_OUT      : out   std_logic;
        GPIO_25_OUT      : out   std_logic;
        GPIO_8_OUT       : out   std_logic;
        GPIO_9_OUT       : out   std_logic;
        INIT_DONE        : out   std_logic;
        MMUART_0_TXD     : out   std_logic;
        MSS_READY        : out   std_logic;
        OE               : out   std_logic;
        POWER_ON_RESET_N : out   std_logic;
        RAS_N            : out   std_logic;
        SA               : out   std_logic_vector(13 downto 0);
        SDRCLK           : out   std_logic;
        WE_N             : out   std_logic;
        -- Inouts
        DQ               : inout std_logic_vector(15 downto 0)
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal BA_net_0                  : std_logic_vector(1 downto 0);
signal CAS_N_net_0               : std_logic;
signal CKE_net_0                 : std_logic;
signal CS_N_1                    : std_logic_vector(0 to 0);
signal DQM_net_0                 : std_logic_vector(1 downto 0);
signal GPIO_8_OUT_net_0          : std_logic;
signal GPIO_9_OUT_net_0          : std_logic;
signal GPIO_10_OUT_net_0         : std_logic;
signal GPIO_11_OUT_net_0         : std_logic;
signal GPIO_12_OUT_net_0         : std_logic;
signal GPIO_13_OUT_net_0         : std_logic;
signal GPIO_14_OUT_net_0         : std_logic;
signal GPIO_15_OUT_net_0         : std_logic;
signal GPIO_16_OUT_net_0         : std_logic;
signal GPIO_25_OUT_0             : std_logic;
signal MMUART_0_TXD_net_0        : std_logic;
signal RAS_N_net_0               : std_logic;
signal SA_net_0                  : std_logic_vector(13 downto 0);
signal SDRCLK_net_0              : std_logic;
signal top_sb_0_POWER_ON_RESET_N : std_logic;
signal WE_N_net_0                : std_logic;
signal MMUART_0_TXD_net_1        : std_logic;
signal SDRCLK_net_1              : std_logic;
signal CKE_net_1                 : std_logic;
signal RAS_N_net_1               : std_logic;
signal CAS_N_net_1               : std_logic;
signal WE_N_net_1                : std_logic;
signal SA_net_1                  : std_logic_vector(13 downto 0);
signal BA_net_1                  : std_logic_vector(1 downto 0);
signal CS_N_1_net_0              : std_logic_vector(0 to 0);
signal DQM_net_1                 : std_logic_vector(1 downto 0);
signal GPIO_8_OUT_net_1          : std_logic;
signal GPIO_9_OUT_net_1          : std_logic;
signal GPIO_10_OUT_net_1         : std_logic;
signal GPIO_11_OUT_net_1         : std_logic;
signal GPIO_12_OUT_net_1         : std_logic;
signal GPIO_13_OUT_net_1         : std_logic;
signal GPIO_14_OUT_net_1         : std_logic;
signal GPIO_15_OUT_net_1         : std_logic;
signal GPIO_16_OUT_net_1         : std_logic;
signal GPIO_25_OUT_0_net_0       : std_logic;

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 MMUART_0_TXD_net_1  <= MMUART_0_TXD_net_0;
 MMUART_0_TXD        <= MMUART_0_TXD_net_1;
 SDRCLK_net_1        <= SDRCLK_net_0;
 SDRCLK              <= SDRCLK_net_1;
 CKE_net_1           <= CKE_net_0;
 CKE                 <= CKE_net_1;
 RAS_N_net_1         <= RAS_N_net_0;
 RAS_N               <= RAS_N_net_1;
 CAS_N_net_1         <= CAS_N_net_0;
 CAS_N               <= CAS_N_net_1;
 WE_N_net_1          <= WE_N_net_0;
 WE_N                <= WE_N_net_1;
 SA_net_1            <= SA_net_0;
 SA(13 downto 0)     <= SA_net_1;
 BA_net_1            <= BA_net_0;
 BA(1 downto 0)      <= BA_net_1;
 CS_N_1_net_0(0)     <= CS_N_1(0);
 CS_N(0)             <= CS_N_1_net_0(0);
 DQM_net_1           <= DQM_net_0;
 DQM(1 downto 0)     <= DQM_net_1;
 GPIO_8_OUT_net_1    <= GPIO_8_OUT_net_0;
 GPIO_8_OUT          <= GPIO_8_OUT_net_1;
 GPIO_9_OUT_net_1    <= GPIO_9_OUT_net_0;
 GPIO_9_OUT          <= GPIO_9_OUT_net_1;
 GPIO_10_OUT_net_1   <= GPIO_10_OUT_net_0;
 GPIO_10_OUT         <= GPIO_10_OUT_net_1;
 GPIO_11_OUT_net_1   <= GPIO_11_OUT_net_0;
 GPIO_11_OUT         <= GPIO_11_OUT_net_1;
 GPIO_12_OUT_net_1   <= GPIO_12_OUT_net_0;
 GPIO_12_OUT         <= GPIO_12_OUT_net_1;
 GPIO_13_OUT_net_1   <= GPIO_13_OUT_net_0;
 GPIO_13_OUT         <= GPIO_13_OUT_net_1;
 GPIO_14_OUT_net_1   <= GPIO_14_OUT_net_0;
 GPIO_14_OUT         <= GPIO_14_OUT_net_1;
 GPIO_15_OUT_net_1   <= GPIO_15_OUT_net_0;
 GPIO_15_OUT         <= GPIO_15_OUT_net_1;
 GPIO_16_OUT_net_1   <= GPIO_16_OUT_net_0;
 GPIO_16_OUT         <= GPIO_16_OUT_net_1;
 GPIO_25_OUT_0_net_0 <= GPIO_25_OUT_0;
 GPIO_25_OUT         <= GPIO_25_OUT_0_net_0;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- top_sb_0
top_sb_0 : top_sb
    port map( 
        -- Inputs
        MMUART_0_RXD     => MMUART_0_RXD,
        FAB_RESET_N      => top_sb_0_POWER_ON_RESET_N,
        CLK1_PAD         => CLK1_PAD,
        DEVRST_N         => DEVRST_N,
        GPIO_29_IN       => GPIO_29_IN,
        -- Outputs
        MMUART_0_TXD     => MMUART_0_TXD_net_0,
        POWER_ON_RESET_N => top_sb_0_POWER_ON_RESET_N,
        INIT_DONE        => OPEN,
        FAB_CCC_GL2      => OPEN,
        FAB_CCC_LOCK     => OPEN,
        MSS_READY        => OPEN,
        SDRCLK           => SDRCLK_net_0,
        OE               => OPEN,
        CKE              => CKE_net_0,
        RAS_N            => RAS_N_net_0,
        CAS_N            => CAS_N_net_0,
        WE_N             => WE_N_net_0,
        SA               => SA_net_0,
        BA               => BA_net_0,
        CS_N             => CS_N_1,
        DQM              => DQM_net_0,
        GPIO_8_OUT       => GPIO_8_OUT_net_0,
        GPIO_9_OUT       => GPIO_9_OUT_net_0,
        GPIO_10_OUT      => GPIO_10_OUT_net_0,
        GPIO_11_OUT      => GPIO_11_OUT_net_0,
        GPIO_12_OUT      => GPIO_12_OUT_net_0,
        GPIO_13_OUT      => GPIO_13_OUT_net_0,
        GPIO_14_OUT      => GPIO_14_OUT_net_0,
        GPIO_15_OUT      => GPIO_15_OUT_net_0,
        GPIO_16_OUT      => GPIO_16_OUT_net_0,
        GPIO_25_OUT      => GPIO_25_OUT_0,
        -- Inouts
        DQ               => DQ 
        );

end RTL;
