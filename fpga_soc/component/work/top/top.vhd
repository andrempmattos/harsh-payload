----------------------------------------------------------------------
-- Created by SmartDesign Fri Sep 25 15:27:07 2020
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
        CAN_RX       : in    std_logic;
        DEVRST_N     : in    std_logic;
        MMUART_0_RXD : in    std_logic;
        SPI_0_DI     : in    std_logic;
        XTL          : in    std_logic;
        -- Outputs
        BA           : out   std_logic_vector(1 downto 0);
        CAN_TX       : out   std_logic;
        CAN_TX_EN_N  : out   std_logic;
        CAS_N        : out   std_logic;
        CKE          : out   std_logic;
        CS_N         : out   std_logic_vector(0 to 0);
        DQM          : out   std_logic_vector(1 downto 0);
        MMUART_0_TXD : out   std_logic;
        RAS_N        : out   std_logic;
        SA           : out   std_logic_vector(13 downto 0);
        SDRCLK       : out   std_logic;
        SPI_0_DO     : out   std_logic;
        WE_N         : out   std_logic;
        -- Inouts
        DQ           : inout std_logic_vector(15 downto 0);
        GPIO_10_BI   : inout std_logic;
        GPIO_11_BI   : inout std_logic;
        GPIO_12_BI   : inout std_logic;
        GPIO_13_BI   : inout std_logic;
        GPIO_14_BI   : inout std_logic;
        GPIO_15_BI   : inout std_logic;
        GPIO_16_BI   : inout std_logic;
        GPIO_17_BI   : inout std_logic;
        GPIO_18_BI   : inout std_logic;
        GPIO_19_BI   : inout std_logic;
        GPIO_1_BI    : inout std_logic;
        GPIO_20_BI   : inout std_logic;
        GPIO_21_BI   : inout std_logic;
        GPIO_22_BI   : inout std_logic;
        GPIO_23_BI   : inout std_logic;
        GPIO_24_BI   : inout std_logic;
        GPIO_25_BI   : inout std_logic;
        GPIO_26_BI   : inout std_logic;
        GPIO_29_BI   : inout std_logic;
        GPIO_8_BI    : inout std_logic;
        GPIO_9_BI    : inout std_logic;
        I2C_0_SCL    : inout std_logic;
        I2C_0_SDA    : inout std_logic;
        SPI_0_CLK    : inout std_logic;
        SPI_0_SS0    : inout std_logic
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
        CAN_RX           : in    std_logic;
        DEVRST_N         : in    std_logic;
        FAB_RESET_N      : in    std_logic;
        MMUART_0_RXD     : in    std_logic;
        SPI_0_DI         : in    std_logic;
        XTL              : in    std_logic;
        -- Outputs
        BA               : out   std_logic_vector(1 downto 0);
        CAN_TX           : out   std_logic;
        CAN_TX_EN_N      : out   std_logic;
        CAS_N            : out   std_logic;
        CKE              : out   std_logic;
        CS_N             : out   std_logic_vector(0 to 0);
        DQM              : out   std_logic_vector(1 downto 0);
        FAB_CCC_GL2      : out   std_logic;
        FAB_CCC_LOCK     : out   std_logic;
        INIT_DONE        : out   std_logic;
        MMUART_0_TXD     : out   std_logic;
        MSS_READY        : out   std_logic;
        OE               : out   std_logic;
        POWER_ON_RESET_N : out   std_logic;
        RAS_N            : out   std_logic;
        SA               : out   std_logic_vector(13 downto 0);
        SDRCLK           : out   std_logic;
        SPI_0_DO         : out   std_logic;
        WE_N             : out   std_logic;
        -- Inouts
        DQ               : inout std_logic_vector(15 downto 0);
        GPIO_10_BI       : inout std_logic;
        GPIO_11_BI       : inout std_logic;
        GPIO_12_BI       : inout std_logic;
        GPIO_13_BI       : inout std_logic;
        GPIO_14_BI       : inout std_logic;
        GPIO_15_BI       : inout std_logic;
        GPIO_16_BI       : inout std_logic;
        GPIO_17_BI       : inout std_logic;
        GPIO_18_BI       : inout std_logic;
        GPIO_19_BI       : inout std_logic;
        GPIO_1_BI        : inout std_logic;
        GPIO_20_BI       : inout std_logic;
        GPIO_21_BI       : inout std_logic;
        GPIO_22_BI       : inout std_logic;
        GPIO_23_BI       : inout std_logic;
        GPIO_24_BI       : inout std_logic;
        GPIO_25_BI       : inout std_logic;
        GPIO_26_BI       : inout std_logic;
        GPIO_29_BI       : inout std_logic;
        GPIO_8_BI        : inout std_logic;
        GPIO_9_BI        : inout std_logic;
        I2C_0_SCL        : inout std_logic;
        I2C_0_SDA        : inout std_logic;
        SPI_0_CLK        : inout std_logic;
        SPI_0_SS0        : inout std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal BA_net_0                  : std_logic_vector(1 downto 0);
signal CAN_TX_net_0              : std_logic;
signal CAN_TX_EN_N_net_0         : std_logic;
signal CAS_N_net_0               : std_logic;
signal CKE_net_0                 : std_logic;
signal CS_N_1                    : std_logic_vector(0 to 0);
signal DQM_net_0                 : std_logic_vector(1 downto 0);
signal MMUART_0_TXD_net_0        : std_logic;
signal RAS_N_net_0               : std_logic;
signal SA_net_0                  : std_logic_vector(13 downto 0);
signal SDRCLK_net_0              : std_logic;
signal SPI_0_DO_net_0            : std_logic;
signal top_sb_0_POWER_ON_RESET_N : std_logic;
signal WE_N_net_0                : std_logic;
signal MMUART_0_TXD_net_1        : std_logic;
signal SDRCLK_net_1              : std_logic;
signal CKE_net_1                 : std_logic;
signal RAS_N_net_1               : std_logic;
signal CAS_N_net_1               : std_logic;
signal WE_N_net_1                : std_logic;
signal SPI_0_DO_net_1            : std_logic;
signal CAN_TX_net_1              : std_logic;
signal CAN_TX_EN_N_net_1         : std_logic;
signal SA_net_1                  : std_logic_vector(13 downto 0);
signal BA_net_1                  : std_logic_vector(1 downto 0);
signal CS_N_1_net_0              : std_logic_vector(0 to 0);
signal DQM_net_1                 : std_logic_vector(1 downto 0);

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 MMUART_0_TXD_net_1 <= MMUART_0_TXD_net_0;
 MMUART_0_TXD       <= MMUART_0_TXD_net_1;
 SDRCLK_net_1       <= SDRCLK_net_0;
 SDRCLK             <= SDRCLK_net_1;
 CKE_net_1          <= CKE_net_0;
 CKE                <= CKE_net_1;
 RAS_N_net_1        <= RAS_N_net_0;
 RAS_N              <= RAS_N_net_1;
 CAS_N_net_1        <= CAS_N_net_0;
 CAS_N              <= CAS_N_net_1;
 WE_N_net_1         <= WE_N_net_0;
 WE_N               <= WE_N_net_1;
 SPI_0_DO_net_1     <= SPI_0_DO_net_0;
 SPI_0_DO           <= SPI_0_DO_net_1;
 CAN_TX_net_1       <= CAN_TX_net_0;
 CAN_TX             <= CAN_TX_net_1;
 CAN_TX_EN_N_net_1  <= CAN_TX_EN_N_net_0;
 CAN_TX_EN_N        <= CAN_TX_EN_N_net_1;
 SA_net_1           <= SA_net_0;
 SA(13 downto 0)    <= SA_net_1;
 BA_net_1           <= BA_net_0;
 BA(1 downto 0)     <= BA_net_1;
 CS_N_1_net_0(0)    <= CS_N_1(0);
 CS_N(0)            <= CS_N_1_net_0(0);
 DQM_net_1          <= DQM_net_0;
 DQM(1 downto 0)    <= DQM_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- top_sb_0
top_sb_0 : top_sb
    port map( 
        -- Inputs
        MMUART_0_RXD     => MMUART_0_RXD,
        FAB_RESET_N      => top_sb_0_POWER_ON_RESET_N,
        DEVRST_N         => DEVRST_N,
        SPI_0_DI         => SPI_0_DI,
        CAN_RX           => CAN_RX,
        XTL              => XTL,
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
        SPI_0_DO         => SPI_0_DO_net_0,
        CAN_TX           => CAN_TX_net_0,
        CAN_TX_EN_N      => CAN_TX_EN_N_net_0,
        SA               => SA_net_0,
        BA               => BA_net_0,
        CS_N             => CS_N_1,
        DQM              => DQM_net_0,
        -- Inouts
        SPI_0_CLK        => SPI_0_CLK,
        SPI_0_SS0        => SPI_0_SS0,
        I2C_0_SDA        => I2C_0_SDA,
        I2C_0_SCL        => I2C_0_SCL,
        GPIO_1_BI        => GPIO_1_BI,
        GPIO_8_BI        => GPIO_8_BI,
        GPIO_9_BI        => GPIO_9_BI,
        GPIO_10_BI       => GPIO_10_BI,
        GPIO_11_BI       => GPIO_11_BI,
        GPIO_12_BI       => GPIO_12_BI,
        GPIO_13_BI       => GPIO_13_BI,
        GPIO_14_BI       => GPIO_14_BI,
        GPIO_15_BI       => GPIO_15_BI,
        GPIO_16_BI       => GPIO_16_BI,
        GPIO_17_BI       => GPIO_17_BI,
        GPIO_18_BI       => GPIO_18_BI,
        GPIO_19_BI       => GPIO_19_BI,
        GPIO_20_BI       => GPIO_20_BI,
        GPIO_21_BI       => GPIO_21_BI,
        GPIO_22_BI       => GPIO_22_BI,
        GPIO_23_BI       => GPIO_23_BI,
        GPIO_24_BI       => GPIO_24_BI,
        GPIO_25_BI       => GPIO_25_BI,
        GPIO_26_BI       => GPIO_26_BI,
        GPIO_29_BI       => GPIO_29_BI,
        DQ               => DQ 
        );

end RTL;
