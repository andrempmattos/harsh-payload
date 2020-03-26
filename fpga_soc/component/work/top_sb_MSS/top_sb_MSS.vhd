----------------------------------------------------------------------
-- Created by SmartDesign Thu Mar 26 22:07:06 2020
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
-- top_sb_MSS entity declaration
----------------------------------------------------------------------
entity top_sb_MSS is
    -- Port list
    port(
        -- Inputs
        FIC_2_APB_M_PRDATA       : in  std_logic_vector(31 downto 0);
        FIC_2_APB_M_PREADY       : in  std_logic;
        FIC_2_APB_M_PSLVERR      : in  std_logic;
        GPIO_29_IN               : in  std_logic;
        MCCC_CLK_BASE            : in  std_logic;
        MCCC_CLK_BASE_PLL_LOCK   : in  std_logic;
        MDDR_SMC_AHB_M_HRDATA    : in  std_logic_vector(31 downto 0);
        MDDR_SMC_AHB_M_HREADY    : in  std_logic;
        MDDR_SMC_AHB_M_HRESP     : in  std_logic;
        MMUART_0_RXD             : in  std_logic;
        MSS_RESET_N_F2M          : in  std_logic;
        -- Outputs
        FIC_2_APB_M_PADDR        : out std_logic_vector(15 downto 2);
        FIC_2_APB_M_PCLK         : out std_logic;
        FIC_2_APB_M_PENABLE      : out std_logic;
        FIC_2_APB_M_PRESET_N     : out std_logic;
        FIC_2_APB_M_PSEL         : out std_logic;
        FIC_2_APB_M_PWDATA       : out std_logic_vector(31 downto 0);
        FIC_2_APB_M_PWRITE       : out std_logic;
        GPIO_10_OUT              : out std_logic;
        GPIO_11_OUT              : out std_logic;
        GPIO_12_OUT              : out std_logic;
        GPIO_13_OUT              : out std_logic;
        GPIO_14_OUT              : out std_logic;
        GPIO_15_OUT              : out std_logic;
        GPIO_16_OUT              : out std_logic;
        GPIO_25_OUT              : out std_logic;
        GPIO_8_OUT               : out std_logic;
        GPIO_9_OUT               : out std_logic;
        MDDR_SMC_AHB_M_HADDR     : out std_logic_vector(31 downto 0);
        MDDR_SMC_AHB_M_HBURST    : out std_logic_vector(2 downto 0);
        MDDR_SMC_AHB_M_HMASTLOCK : out std_logic;
        MDDR_SMC_AHB_M_HSIZE     : out std_logic_vector(1 downto 0);
        MDDR_SMC_AHB_M_HTRANS    : out std_logic_vector(1 downto 0);
        MDDR_SMC_AHB_M_HWDATA    : out std_logic_vector(31 downto 0);
        MDDR_SMC_AHB_M_HWRITE    : out std_logic;
        MMUART_0_TXD             : out std_logic;
        MSS_RESET_N_M2F          : out std_logic
        );
end top_sb_MSS;
----------------------------------------------------------------------
-- top_sb_MSS architecture body
----------------------------------------------------------------------
architecture RTL of top_sb_MSS is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- OUTBUF
component OUTBUF
    generic( 
        IOSTD : string := "" 
        );
    -- Port list
    port(
        -- Inputs
        D   : in  std_logic;
        -- Outputs
        PAD : out std_logic
        );
end component;
-- INBUF
component INBUF
    generic( 
        IOSTD : string := "" 
        );
    -- Port list
    port(
        -- Inputs
        PAD : in  std_logic;
        -- Outputs
        Y   : out std_logic
        );
end component;
-- TRIBUFF
component TRIBUFF
    generic( 
        IOSTD : string := "" 
        );
    -- Port list
    port(
        -- Inputs
        D   : in  std_logic;
        E   : in  std_logic;
        -- Outputs
        PAD : out std_logic
        );
end component;
-- MSS_010
component MSS_010
    generic( 
        INIT              : std_logic_vector(1437 downto 0) := "00" & x"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" ;
        ACT_UBITS         : std_logic_vector(55 downto 0)   := x"FFFFFFFFFFFFFF" ;
        MEMORYFILE        : string                          := "" ;
        RTC_MAIN_XTL_FREQ : real                            := 0.0 ;
        RTC_MAIN_XTL_MODE : string                          := "1" ;
        DDR_CLK_FREQ      : real                            := 0.0 
        );
    -- Port list
    port(
        -- Inputs
        CAN_RXBUS_F2H_SCP                       : in  std_logic;
        CAN_RXBUS_USBA_DATA1_MGPIO3A_IN         : in  std_logic;
        CAN_TXBUS_F2H_SCP                       : in  std_logic;
        CAN_TXBUS_USBA_DATA0_MGPIO2A_IN         : in  std_logic;
        CAN_TX_EBL_F2H_SCP                      : in  std_logic;
        CAN_TX_EBL_USBA_DATA2_MGPIO4A_IN        : in  std_logic;
        CLK_BASE                                : in  std_logic;
        CLK_MDDR_APB                            : in  std_logic;
        COLF                                    : in  std_logic;
        CRSF                                    : in  std_logic;
        DM_IN                                   : in  std_logic_vector(2 downto 0);
        DRAM_DQS_IN                             : in  std_logic_vector(2 downto 0);
        DRAM_DQ_IN                              : in  std_logic_vector(17 downto 0);
        DRAM_FIFO_WE_IN                         : in  std_logic_vector(1 downto 0);
        F2HCALIB                                : in  std_logic;
        F2H_INTERRUPT                           : in  std_logic_vector(15 downto 0);
        F2_DMAREADY                             : in  std_logic_vector(1 downto 0);
        FAB_AVALID                              : in  std_logic;
        FAB_HOSTDISCON                          : in  std_logic;
        FAB_IDDIG                               : in  std_logic;
        FAB_LINESTATE                           : in  std_logic_vector(1 downto 0);
        FAB_M3_RESET_N                          : in  std_logic;
        FAB_PLL_LOCK                            : in  std_logic;
        FAB_RXACTIVE                            : in  std_logic;
        FAB_RXERROR                             : in  std_logic;
        FAB_RXVALID                             : in  std_logic;
        FAB_RXVALIDH                            : in  std_logic;
        FAB_SESSEND                             : in  std_logic;
        FAB_TXREADY                             : in  std_logic;
        FAB_VBUSVALID                           : in  std_logic;
        FAB_VSTATUS                             : in  std_logic_vector(7 downto 0);
        FAB_XDATAIN                             : in  std_logic_vector(7 downto 0);
        FPGA_MDDR_ARESET_N                      : in  std_logic;
        F_ARADDR_HADDR1                         : in  std_logic_vector(31 downto 0);
        F_ARBURST_HTRANS1                       : in  std_logic_vector(1 downto 0);
        F_ARID_HSEL1                            : in  std_logic_vector(3 downto 0);
        F_ARLEN_HBURST1                         : in  std_logic_vector(3 downto 0);
        F_ARLOCK_HMASTLOCK1                     : in  std_logic_vector(1 downto 0);
        F_ARSIZE_HSIZE1                         : in  std_logic_vector(1 downto 0);
        F_ARVALID_HWRITE1                       : in  std_logic;
        F_AWADDR_HADDR0                         : in  std_logic_vector(31 downto 0);
        F_AWBURST_HTRANS0                       : in  std_logic_vector(1 downto 0);
        F_AWID_HSEL0                            : in  std_logic_vector(3 downto 0);
        F_AWLEN_HBURST0                         : in  std_logic_vector(3 downto 0);
        F_AWLOCK_HMASTLOCK0                     : in  std_logic_vector(1 downto 0);
        F_AWSIZE_HSIZE0                         : in  std_logic_vector(1 downto 0);
        F_AWVALID_HWRITE0                       : in  std_logic;
        F_BREADY                                : in  std_logic;
        F_DMAREADY                              : in  std_logic_vector(1 downto 0);
        F_FM0_ADDR                              : in  std_logic_vector(31 downto 0);
        F_FM0_ENABLE                            : in  std_logic;
        F_FM0_MASTLOCK                          : in  std_logic;
        F_FM0_READY                             : in  std_logic;
        F_FM0_SEL                               : in  std_logic;
        F_FM0_SIZE                              : in  std_logic_vector(1 downto 0);
        F_FM0_TRANS1                            : in  std_logic;
        F_FM0_WDATA                             : in  std_logic_vector(31 downto 0);
        F_FM0_WRITE                             : in  std_logic;
        F_HM0_RDATA                             : in  std_logic_vector(31 downto 0);
        F_HM0_READY                             : in  std_logic;
        F_HM0_RESP                              : in  std_logic;
        F_RMW_AXI                               : in  std_logic;
        F_RREADY                                : in  std_logic;
        F_WDATA_HWDATA01                        : in  std_logic_vector(63 downto 0);
        F_WID_HREADY01                          : in  std_logic_vector(3 downto 0);
        F_WLAST                                 : in  std_logic;
        F_WSTRB                                 : in  std_logic_vector(7 downto 0);
        F_WVALID                                : in  std_logic;
        GTX_CLKPF                               : in  std_logic;
        I2C0_BCLK                               : in  std_logic;
        I2C0_SCL_F2H_SCP                        : in  std_logic;
        I2C0_SCL_USBC_DATA1_MGPIO31B_IN         : in  std_logic;
        I2C0_SDA_F2H_SCP                        : in  std_logic;
        I2C0_SDA_USBC_DATA0_MGPIO30B_IN         : in  std_logic;
        I2C1_BCLK                               : in  std_logic;
        I2C1_SCL_F2H_SCP                        : in  std_logic;
        I2C1_SCL_USBA_DATA4_MGPIO1A_IN          : in  std_logic;
        I2C1_SDA_F2H_SCP                        : in  std_logic;
        I2C1_SDA_USBA_DATA3_MGPIO0A_IN          : in  std_logic;
        MDDR_FABRIC_PADDR                       : in  std_logic_vector(10 downto 2);
        MDDR_FABRIC_PENABLE                     : in  std_logic;
        MDDR_FABRIC_PSEL                        : in  std_logic;
        MDDR_FABRIC_PWDATA                      : in  std_logic_vector(15 downto 0);
        MDDR_FABRIC_PWRITE                      : in  std_logic;
        MDIF                                    : in  std_logic;
        MGPIO0A_F2H_GPIN                        : in  std_logic;
        MGPIO10A_F2H_GPIN                       : in  std_logic;
        MGPIO11A_F2H_GPIN                       : in  std_logic;
        MGPIO11B_F2H_GPIN                       : in  std_logic;
        MGPIO12A_F2H_GPIN                       : in  std_logic;
        MGPIO13A_F2H_GPIN                       : in  std_logic;
        MGPIO14A_F2H_GPIN                       : in  std_logic;
        MGPIO15A_F2H_GPIN                       : in  std_logic;
        MGPIO16A_F2H_GPIN                       : in  std_logic;
        MGPIO17B_F2H_GPIN                       : in  std_logic;
        MGPIO18B_F2H_GPIN                       : in  std_logic;
        MGPIO19B_F2H_GPIN                       : in  std_logic;
        MGPIO1A_F2H_GPIN                        : in  std_logic;
        MGPIO20B_F2H_GPIN                       : in  std_logic;
        MGPIO21B_F2H_GPIN                       : in  std_logic;
        MGPIO22B_F2H_GPIN                       : in  std_logic;
        MGPIO24B_F2H_GPIN                       : in  std_logic;
        MGPIO25B_F2H_GPIN                       : in  std_logic;
        MGPIO26B_F2H_GPIN                       : in  std_logic;
        MGPIO27B_F2H_GPIN                       : in  std_logic;
        MGPIO28B_F2H_GPIN                       : in  std_logic;
        MGPIO29B_F2H_GPIN                       : in  std_logic;
        MGPIO2A_F2H_GPIN                        : in  std_logic;
        MGPIO30B_F2H_GPIN                       : in  std_logic;
        MGPIO31B_F2H_GPIN                       : in  std_logic;
        MGPIO3A_F2H_GPIN                        : in  std_logic;
        MGPIO4A_F2H_GPIN                        : in  std_logic;
        MGPIO5A_F2H_GPIN                        : in  std_logic;
        MGPIO6A_F2H_GPIN                        : in  std_logic;
        MGPIO7A_F2H_GPIN                        : in  std_logic;
        MGPIO8A_F2H_GPIN                        : in  std_logic;
        MGPIO9A_F2H_GPIN                        : in  std_logic;
        MMUART0_CTS_F2H_SCP                     : in  std_logic;
        MMUART0_CTS_USBC_DATA7_MGPIO19B_IN      : in  std_logic;
        MMUART0_DCD_F2H_SCP                     : in  std_logic;
        MMUART0_DCD_MGPIO22B_IN                 : in  std_logic;
        MMUART0_DSR_F2H_SCP                     : in  std_logic;
        MMUART0_DSR_MGPIO20B_IN                 : in  std_logic;
        MMUART0_DTR_F2H_SCP                     : in  std_logic;
        MMUART0_DTR_USBC_DATA6_MGPIO18B_IN      : in  std_logic;
        MMUART0_RI_F2H_SCP                      : in  std_logic;
        MMUART0_RI_MGPIO21B_IN                  : in  std_logic;
        MMUART0_RTS_F2H_SCP                     : in  std_logic;
        MMUART0_RTS_USBC_DATA5_MGPIO17B_IN      : in  std_logic;
        MMUART0_RXD_F2H_SCP                     : in  std_logic;
        MMUART0_RXD_USBC_STP_MGPIO28B_IN        : in  std_logic;
        MMUART0_SCK_F2H_SCP                     : in  std_logic;
        MMUART0_SCK_USBC_NXT_MGPIO29B_IN        : in  std_logic;
        MMUART0_TXD_F2H_SCP                     : in  std_logic;
        MMUART0_TXD_USBC_DIR_MGPIO27B_IN        : in  std_logic;
        MMUART1_CTS_F2H_SCP                     : in  std_logic;
        MMUART1_DCD_F2H_SCP                     : in  std_logic;
        MMUART1_DSR_F2H_SCP                     : in  std_logic;
        MMUART1_RI_F2H_SCP                      : in  std_logic;
        MMUART1_RTS_F2H_SCP                     : in  std_logic;
        MMUART1_RXD_F2H_SCP                     : in  std_logic;
        MMUART1_RXD_USBC_DATA3_MGPIO26B_IN      : in  std_logic;
        MMUART1_SCK_F2H_SCP                     : in  std_logic;
        MMUART1_SCK_USBC_DATA4_MGPIO25B_IN      : in  std_logic;
        MMUART1_TXD_F2H_SCP                     : in  std_logic;
        MMUART1_TXD_USBC_DATA2_MGPIO24B_IN      : in  std_logic;
        PER2_FABRIC_PRDATA                      : in  std_logic_vector(31 downto 0);
        PER2_FABRIC_PREADY                      : in  std_logic;
        PER2_FABRIC_PSLVERR                     : in  std_logic;
        PRESET_N                                : in  std_logic;
        RCGF                                    : in  std_logic_vector(9 downto 0);
        RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_IN     : in  std_logic;
        RGMII_MDC_RMII_MDC_IN                   : in  std_logic;
        RGMII_MDIO_RMII_MDIO_USBB_DATA7_IN      : in  std_logic;
        RGMII_RXD0_RMII_RXD0_USBB_DATA0_IN      : in  std_logic;
        RGMII_RXD1_RMII_RXD1_USBB_DATA1_IN      : in  std_logic;
        RGMII_RXD2_RMII_RX_ER_USBB_DATA3_IN     : in  std_logic;
        RGMII_RXD3_USBB_DATA4_IN                : in  std_logic;
        RGMII_RX_CLK_IN                         : in  std_logic;
        RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_IN  : in  std_logic;
        RGMII_TXD0_RMII_TXD0_USBB_DIR_IN        : in  std_logic;
        RGMII_TXD1_RMII_TXD1_USBB_STP_IN        : in  std_logic;
        RGMII_TXD2_USBB_DATA5_IN                : in  std_logic;
        RGMII_TXD3_USBB_DATA6_IN                : in  std_logic;
        RGMII_TX_CLK_IN                         : in  std_logic;
        RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_IN     : in  std_logic;
        RXDF                                    : in  std_logic_vector(7 downto 0);
        RX_CLKPF                                : in  std_logic;
        RX_DVF                                  : in  std_logic;
        RX_ERRF                                 : in  std_logic;
        RX_EV                                   : in  std_logic;
        SLEEPHOLDREQ                            : in  std_logic;
        SMBALERT_NI0                            : in  std_logic;
        SMBALERT_NI1                            : in  std_logic;
        SMBSUS_NI0                              : in  std_logic;
        SMBSUS_NI1                              : in  std_logic;
        SPI0_CLK_IN                             : in  std_logic;
        SPI0_SCK_USBA_XCLK_IN                   : in  std_logic;
        SPI0_SDI_F2H_SCP                        : in  std_logic;
        SPI0_SDI_USBA_DIR_MGPIO5A_IN            : in  std_logic;
        SPI0_SDO_F2H_SCP                        : in  std_logic;
        SPI0_SDO_USBA_STP_MGPIO6A_IN            : in  std_logic;
        SPI0_SS0_F2H_SCP                        : in  std_logic;
        SPI0_SS0_USBA_NXT_MGPIO7A_IN            : in  std_logic;
        SPI0_SS1_F2H_SCP                        : in  std_logic;
        SPI0_SS1_USBA_DATA5_MGPIO8A_IN          : in  std_logic;
        SPI0_SS2_F2H_SCP                        : in  std_logic;
        SPI0_SS2_USBA_DATA6_MGPIO9A_IN          : in  std_logic;
        SPI0_SS3_F2H_SCP                        : in  std_logic;
        SPI0_SS3_USBA_DATA7_MGPIO10A_IN         : in  std_logic;
        SPI1_CLK_IN                             : in  std_logic;
        SPI1_SCK_IN                             : in  std_logic;
        SPI1_SDI_F2H_SCP                        : in  std_logic;
        SPI1_SDI_MGPIO11A_IN                    : in  std_logic;
        SPI1_SDO_F2H_SCP                        : in  std_logic;
        SPI1_SDO_MGPIO12A_IN                    : in  std_logic;
        SPI1_SS0_F2H_SCP                        : in  std_logic;
        SPI1_SS0_MGPIO13A_IN                    : in  std_logic;
        SPI1_SS1_F2H_SCP                        : in  std_logic;
        SPI1_SS1_MGPIO14A_IN                    : in  std_logic;
        SPI1_SS2_F2H_SCP                        : in  std_logic;
        SPI1_SS2_MGPIO15A_IN                    : in  std_logic;
        SPI1_SS3_F2H_SCP                        : in  std_logic;
        SPI1_SS3_MGPIO16A_IN                    : in  std_logic;
        SPI1_SS4_MGPIO17A_IN                    : in  std_logic;
        SPI1_SS5_MGPIO18A_IN                    : in  std_logic;
        SPI1_SS6_MGPIO23A_IN                    : in  std_logic;
        SPI1_SS7_MGPIO24A_IN                    : in  std_logic;
        TX_CLKPF                                : in  std_logic;
        USBC_XCLK_IN                            : in  std_logic;
        USER_MSS_GPIO_RESET_N                   : in  std_logic;
        USER_MSS_RESET_N                        : in  std_logic;
        XCLK_FAB                                : in  std_logic;
        -- Outputs
        CAN_RXBUS_MGPIO3A_H2F_A                 : out std_logic;
        CAN_RXBUS_MGPIO3A_H2F_B                 : out std_logic;
        CAN_RXBUS_USBA_DATA1_MGPIO3A_OE         : out std_logic;
        CAN_RXBUS_USBA_DATA1_MGPIO3A_OUT        : out std_logic;
        CAN_TXBUS_MGPIO2A_H2F_A                 : out std_logic;
        CAN_TXBUS_MGPIO2A_H2F_B                 : out std_logic;
        CAN_TXBUS_USBA_DATA0_MGPIO2A_OE         : out std_logic;
        CAN_TXBUS_USBA_DATA0_MGPIO2A_OUT        : out std_logic;
        CAN_TX_EBL_MGPIO4A_H2F_A                : out std_logic;
        CAN_TX_EBL_MGPIO4A_H2F_B                : out std_logic;
        CAN_TX_EBL_USBA_DATA2_MGPIO4A_OE        : out std_logic;
        CAN_TX_EBL_USBA_DATA2_MGPIO4A_OUT       : out std_logic;
        CLK_CONFIG_APB                          : out std_logic;
        COMMS_INT                               : out std_logic;
        CONFIG_PRESET_N                         : out std_logic;
        DM_OE                                   : out std_logic_vector(2 downto 0);
        DRAM_ADDR                               : out std_logic_vector(15 downto 0);
        DRAM_BA                                 : out std_logic_vector(2 downto 0);
        DRAM_CASN                               : out std_logic;
        DRAM_CKE                                : out std_logic;
        DRAM_CLK                                : out std_logic;
        DRAM_CSN                                : out std_logic;
        DRAM_DM_RDQS_OUT                        : out std_logic_vector(2 downto 0);
        DRAM_DQS_OE                             : out std_logic_vector(2 downto 0);
        DRAM_DQS_OUT                            : out std_logic_vector(2 downto 0);
        DRAM_DQ_OE                              : out std_logic_vector(17 downto 0);
        DRAM_DQ_OUT                             : out std_logic_vector(17 downto 0);
        DRAM_FIFO_WE_OUT                        : out std_logic_vector(1 downto 0);
        DRAM_ODT                                : out std_logic;
        DRAM_RASN                               : out std_logic;
        DRAM_RSTN                               : out std_logic;
        DRAM_WEN                                : out std_logic;
        EDAC_ERROR                              : out std_logic_vector(7 downto 0);
        FAB_CHRGVBUS                            : out std_logic;
        FAB_DISCHRGVBUS                         : out std_logic;
        FAB_DMPULLDOWN                          : out std_logic;
        FAB_DPPULLDOWN                          : out std_logic;
        FAB_DRVVBUS                             : out std_logic;
        FAB_IDPULLUP                            : out std_logic;
        FAB_OPMODE                              : out std_logic_vector(1 downto 0);
        FAB_SUSPENDM                            : out std_logic;
        FAB_TERMSEL                             : out std_logic;
        FAB_TXVALID                             : out std_logic;
        FAB_VCONTROL                            : out std_logic_vector(3 downto 0);
        FAB_VCONTROLLOADM                       : out std_logic;
        FAB_XCVRSEL                             : out std_logic_vector(1 downto 0);
        FAB_XDATAOUT                            : out std_logic_vector(7 downto 0);
        FACC_GLMUX_SEL                          : out std_logic;
        FIC32_0_MASTER                          : out std_logic_vector(1 downto 0);
        FIC32_1_MASTER                          : out std_logic_vector(1 downto 0);
        FPGA_RESET_N                            : out std_logic;
        F_ARREADY_HREADYOUT1                    : out std_logic;
        F_AWREADY_HREADYOUT0                    : out std_logic;
        F_BID                                   : out std_logic_vector(3 downto 0);
        F_BRESP_HRESP0                          : out std_logic_vector(1 downto 0);
        F_BVALID                                : out std_logic;
        F_FM0_RDATA                             : out std_logic_vector(31 downto 0);
        F_FM0_READYOUT                          : out std_logic;
        F_FM0_RESP                              : out std_logic;
        F_HM0_ADDR                              : out std_logic_vector(31 downto 0);
        F_HM0_ENABLE                            : out std_logic;
        F_HM0_SEL                               : out std_logic;
        F_HM0_SIZE                              : out std_logic_vector(1 downto 0);
        F_HM0_TRANS1                            : out std_logic;
        F_HM0_WDATA                             : out std_logic_vector(31 downto 0);
        F_HM0_WRITE                             : out std_logic;
        F_RDATA_HRDATA01                        : out std_logic_vector(63 downto 0);
        F_RID                                   : out std_logic_vector(3 downto 0);
        F_RLAST                                 : out std_logic;
        F_RRESP_HRESP1                          : out std_logic_vector(1 downto 0);
        F_RVALID                                : out std_logic;
        F_WREADY                                : out std_logic;
        GTX_CLK                                 : out std_logic;
        H2FCALIB                                : out std_logic;
        H2F_INTERRUPT                           : out std_logic_vector(15 downto 0);
        H2F_NMI                                 : out std_logic;
        I2C0_SCL_MGPIO31B_H2F_A                 : out std_logic;
        I2C0_SCL_MGPIO31B_H2F_B                 : out std_logic;
        I2C0_SCL_USBC_DATA1_MGPIO31B_OE         : out std_logic;
        I2C0_SCL_USBC_DATA1_MGPIO31B_OUT        : out std_logic;
        I2C0_SDA_MGPIO30B_H2F_A                 : out std_logic;
        I2C0_SDA_MGPIO30B_H2F_B                 : out std_logic;
        I2C0_SDA_USBC_DATA0_MGPIO30B_OE         : out std_logic;
        I2C0_SDA_USBC_DATA0_MGPIO30B_OUT        : out std_logic;
        I2C1_SCL_MGPIO1A_H2F_A                  : out std_logic;
        I2C1_SCL_MGPIO1A_H2F_B                  : out std_logic;
        I2C1_SCL_USBA_DATA4_MGPIO1A_OE          : out std_logic;
        I2C1_SCL_USBA_DATA4_MGPIO1A_OUT         : out std_logic;
        I2C1_SDA_MGPIO0A_H2F_A                  : out std_logic;
        I2C1_SDA_MGPIO0A_H2F_B                  : out std_logic;
        I2C1_SDA_USBA_DATA3_MGPIO0A_OE          : out std_logic;
        I2C1_SDA_USBA_DATA3_MGPIO0A_OUT         : out std_logic;
        MDCF                                    : out std_logic;
        MDDR_FABRIC_PRDATA                      : out std_logic_vector(15 downto 0);
        MDDR_FABRIC_PREADY                      : out std_logic;
        MDDR_FABRIC_PSLVERR                     : out std_logic;
        MDOENF                                  : out std_logic;
        MDOF                                    : out std_logic;
        MMUART0_CTS_MGPIO19B_H2F_A              : out std_logic;
        MMUART0_CTS_MGPIO19B_H2F_B              : out std_logic;
        MMUART0_CTS_USBC_DATA7_MGPIO19B_OE      : out std_logic;
        MMUART0_CTS_USBC_DATA7_MGPIO19B_OUT     : out std_logic;
        MMUART0_DCD_MGPIO22B_H2F_A              : out std_logic;
        MMUART0_DCD_MGPIO22B_H2F_B              : out std_logic;
        MMUART0_DCD_MGPIO22B_OE                 : out std_logic;
        MMUART0_DCD_MGPIO22B_OUT                : out std_logic;
        MMUART0_DSR_MGPIO20B_H2F_A              : out std_logic;
        MMUART0_DSR_MGPIO20B_H2F_B              : out std_logic;
        MMUART0_DSR_MGPIO20B_OE                 : out std_logic;
        MMUART0_DSR_MGPIO20B_OUT                : out std_logic;
        MMUART0_DTR_MGPIO18B_H2F_A              : out std_logic;
        MMUART0_DTR_MGPIO18B_H2F_B              : out std_logic;
        MMUART0_DTR_USBC_DATA6_MGPIO18B_OE      : out std_logic;
        MMUART0_DTR_USBC_DATA6_MGPIO18B_OUT     : out std_logic;
        MMUART0_RI_MGPIO21B_H2F_A               : out std_logic;
        MMUART0_RI_MGPIO21B_H2F_B               : out std_logic;
        MMUART0_RI_MGPIO21B_OE                  : out std_logic;
        MMUART0_RI_MGPIO21B_OUT                 : out std_logic;
        MMUART0_RTS_MGPIO17B_H2F_A              : out std_logic;
        MMUART0_RTS_MGPIO17B_H2F_B              : out std_logic;
        MMUART0_RTS_USBC_DATA5_MGPIO17B_OE      : out std_logic;
        MMUART0_RTS_USBC_DATA5_MGPIO17B_OUT     : out std_logic;
        MMUART0_RXD_MGPIO28B_H2F_A              : out std_logic;
        MMUART0_RXD_MGPIO28B_H2F_B              : out std_logic;
        MMUART0_RXD_USBC_STP_MGPIO28B_OE        : out std_logic;
        MMUART0_RXD_USBC_STP_MGPIO28B_OUT       : out std_logic;
        MMUART0_SCK_MGPIO29B_H2F_A              : out std_logic;
        MMUART0_SCK_MGPIO29B_H2F_B              : out std_logic;
        MMUART0_SCK_USBC_NXT_MGPIO29B_OE        : out std_logic;
        MMUART0_SCK_USBC_NXT_MGPIO29B_OUT       : out std_logic;
        MMUART0_TXD_MGPIO27B_H2F_A              : out std_logic;
        MMUART0_TXD_MGPIO27B_H2F_B              : out std_logic;
        MMUART0_TXD_USBC_DIR_MGPIO27B_OE        : out std_logic;
        MMUART0_TXD_USBC_DIR_MGPIO27B_OUT       : out std_logic;
        MMUART1_DTR_MGPIO12B_H2F_A              : out std_logic;
        MMUART1_RTS_MGPIO11B_H2F_A              : out std_logic;
        MMUART1_RTS_MGPIO11B_H2F_B              : out std_logic;
        MMUART1_RXD_MGPIO26B_H2F_A              : out std_logic;
        MMUART1_RXD_MGPIO26B_H2F_B              : out std_logic;
        MMUART1_RXD_USBC_DATA3_MGPIO26B_OE      : out std_logic;
        MMUART1_RXD_USBC_DATA3_MGPIO26B_OUT     : out std_logic;
        MMUART1_SCK_MGPIO25B_H2F_A              : out std_logic;
        MMUART1_SCK_MGPIO25B_H2F_B              : out std_logic;
        MMUART1_SCK_USBC_DATA4_MGPIO25B_OE      : out std_logic;
        MMUART1_SCK_USBC_DATA4_MGPIO25B_OUT     : out std_logic;
        MMUART1_TXD_MGPIO24B_H2F_A              : out std_logic;
        MMUART1_TXD_MGPIO24B_H2F_B              : out std_logic;
        MMUART1_TXD_USBC_DATA2_MGPIO24B_OE      : out std_logic;
        MMUART1_TXD_USBC_DATA2_MGPIO24B_OUT     : out std_logic;
        MPLL_LOCK                               : out std_logic;
        PER2_FABRIC_PADDR                       : out std_logic_vector(15 downto 2);
        PER2_FABRIC_PENABLE                     : out std_logic;
        PER2_FABRIC_PSEL                        : out std_logic;
        PER2_FABRIC_PWDATA                      : out std_logic_vector(31 downto 0);
        PER2_FABRIC_PWRITE                      : out std_logic;
        RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_OE     : out std_logic;
        RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_OUT    : out std_logic;
        RGMII_MDC_RMII_MDC_OE                   : out std_logic;
        RGMII_MDC_RMII_MDC_OUT                  : out std_logic;
        RGMII_MDIO_RMII_MDIO_USBB_DATA7_OE      : out std_logic;
        RGMII_MDIO_RMII_MDIO_USBB_DATA7_OUT     : out std_logic;
        RGMII_RXD0_RMII_RXD0_USBB_DATA0_OE      : out std_logic;
        RGMII_RXD0_RMII_RXD0_USBB_DATA0_OUT     : out std_logic;
        RGMII_RXD1_RMII_RXD1_USBB_DATA1_OE      : out std_logic;
        RGMII_RXD1_RMII_RXD1_USBB_DATA1_OUT     : out std_logic;
        RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OE     : out std_logic;
        RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OUT    : out std_logic;
        RGMII_RXD3_USBB_DATA4_OE                : out std_logic;
        RGMII_RXD3_USBB_DATA4_OUT               : out std_logic;
        RGMII_RX_CLK_OE                         : out std_logic;
        RGMII_RX_CLK_OUT                        : out std_logic;
        RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OE  : out std_logic;
        RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OUT : out std_logic;
        RGMII_TXD0_RMII_TXD0_USBB_DIR_OE        : out std_logic;
        RGMII_TXD0_RMII_TXD0_USBB_DIR_OUT       : out std_logic;
        RGMII_TXD1_RMII_TXD1_USBB_STP_OE        : out std_logic;
        RGMII_TXD1_RMII_TXD1_USBB_STP_OUT       : out std_logic;
        RGMII_TXD2_USBB_DATA5_OE                : out std_logic;
        RGMII_TXD2_USBB_DATA5_OUT               : out std_logic;
        RGMII_TXD3_USBB_DATA6_OE                : out std_logic;
        RGMII_TXD3_USBB_DATA6_OUT               : out std_logic;
        RGMII_TX_CLK_OE                         : out std_logic;
        RGMII_TX_CLK_OUT                        : out std_logic;
        RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_OE     : out std_logic;
        RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_OUT    : out std_logic;
        RTC_MATCH                               : out std_logic;
        SLEEPDEEP                               : out std_logic;
        SLEEPHOLDACK                            : out std_logic;
        SLEEPING                                : out std_logic;
        SMBALERT_NO0                            : out std_logic;
        SMBALERT_NO1                            : out std_logic;
        SMBSUS_NO0                              : out std_logic;
        SMBSUS_NO1                              : out std_logic;
        SPI0_CLK_OUT                            : out std_logic;
        SPI0_SCK_USBA_XCLK_OE                   : out std_logic;
        SPI0_SCK_USBA_XCLK_OUT                  : out std_logic;
        SPI0_SDI_MGPIO5A_H2F_A                  : out std_logic;
        SPI0_SDI_MGPIO5A_H2F_B                  : out std_logic;
        SPI0_SDI_USBA_DIR_MGPIO5A_OE            : out std_logic;
        SPI0_SDI_USBA_DIR_MGPIO5A_OUT           : out std_logic;
        SPI0_SDO_MGPIO6A_H2F_A                  : out std_logic;
        SPI0_SDO_MGPIO6A_H2F_B                  : out std_logic;
        SPI0_SDO_USBA_STP_MGPIO6A_OE            : out std_logic;
        SPI0_SDO_USBA_STP_MGPIO6A_OUT           : out std_logic;
        SPI0_SS0_MGPIO7A_H2F_A                  : out std_logic;
        SPI0_SS0_MGPIO7A_H2F_B                  : out std_logic;
        SPI0_SS0_USBA_NXT_MGPIO7A_OE            : out std_logic;
        SPI0_SS0_USBA_NXT_MGPIO7A_OUT           : out std_logic;
        SPI0_SS1_MGPIO8A_H2F_A                  : out std_logic;
        SPI0_SS1_MGPIO8A_H2F_B                  : out std_logic;
        SPI0_SS1_USBA_DATA5_MGPIO8A_OE          : out std_logic;
        SPI0_SS1_USBA_DATA5_MGPIO8A_OUT         : out std_logic;
        SPI0_SS2_MGPIO9A_H2F_A                  : out std_logic;
        SPI0_SS2_MGPIO9A_H2F_B                  : out std_logic;
        SPI0_SS2_USBA_DATA6_MGPIO9A_OE          : out std_logic;
        SPI0_SS2_USBA_DATA6_MGPIO9A_OUT         : out std_logic;
        SPI0_SS3_MGPIO10A_H2F_A                 : out std_logic;
        SPI0_SS3_MGPIO10A_H2F_B                 : out std_logic;
        SPI0_SS3_USBA_DATA7_MGPIO10A_OE         : out std_logic;
        SPI0_SS3_USBA_DATA7_MGPIO10A_OUT        : out std_logic;
        SPI0_SS4_MGPIO19A_H2F_A                 : out std_logic;
        SPI0_SS5_MGPIO20A_H2F_A                 : out std_logic;
        SPI0_SS6_MGPIO21A_H2F_A                 : out std_logic;
        SPI0_SS7_MGPIO22A_H2F_A                 : out std_logic;
        SPI1_CLK_OUT                            : out std_logic;
        SPI1_SCK_OE                             : out std_logic;
        SPI1_SCK_OUT                            : out std_logic;
        SPI1_SDI_MGPIO11A_H2F_A                 : out std_logic;
        SPI1_SDI_MGPIO11A_H2F_B                 : out std_logic;
        SPI1_SDI_MGPIO11A_OE                    : out std_logic;
        SPI1_SDI_MGPIO11A_OUT                   : out std_logic;
        SPI1_SDO_MGPIO12A_H2F_A                 : out std_logic;
        SPI1_SDO_MGPIO12A_H2F_B                 : out std_logic;
        SPI1_SDO_MGPIO12A_OE                    : out std_logic;
        SPI1_SDO_MGPIO12A_OUT                   : out std_logic;
        SPI1_SS0_MGPIO13A_H2F_A                 : out std_logic;
        SPI1_SS0_MGPIO13A_H2F_B                 : out std_logic;
        SPI1_SS0_MGPIO13A_OE                    : out std_logic;
        SPI1_SS0_MGPIO13A_OUT                   : out std_logic;
        SPI1_SS1_MGPIO14A_H2F_A                 : out std_logic;
        SPI1_SS1_MGPIO14A_H2F_B                 : out std_logic;
        SPI1_SS1_MGPIO14A_OE                    : out std_logic;
        SPI1_SS1_MGPIO14A_OUT                   : out std_logic;
        SPI1_SS2_MGPIO15A_H2F_A                 : out std_logic;
        SPI1_SS2_MGPIO15A_H2F_B                 : out std_logic;
        SPI1_SS2_MGPIO15A_OE                    : out std_logic;
        SPI1_SS2_MGPIO15A_OUT                   : out std_logic;
        SPI1_SS3_MGPIO16A_H2F_A                 : out std_logic;
        SPI1_SS3_MGPIO16A_H2F_B                 : out std_logic;
        SPI1_SS3_MGPIO16A_OE                    : out std_logic;
        SPI1_SS3_MGPIO16A_OUT                   : out std_logic;
        SPI1_SS4_MGPIO17A_H2F_A                 : out std_logic;
        SPI1_SS4_MGPIO17A_OE                    : out std_logic;
        SPI1_SS4_MGPIO17A_OUT                   : out std_logic;
        SPI1_SS5_MGPIO18A_H2F_A                 : out std_logic;
        SPI1_SS5_MGPIO18A_OE                    : out std_logic;
        SPI1_SS5_MGPIO18A_OUT                   : out std_logic;
        SPI1_SS6_MGPIO23A_H2F_A                 : out std_logic;
        SPI1_SS6_MGPIO23A_OE                    : out std_logic;
        SPI1_SS6_MGPIO23A_OUT                   : out std_logic;
        SPI1_SS7_MGPIO24A_H2F_A                 : out std_logic;
        SPI1_SS7_MGPIO24A_OE                    : out std_logic;
        SPI1_SS7_MGPIO24A_OUT                   : out std_logic;
        TCGF                                    : out std_logic_vector(9 downto 0);
        TRACECLK                                : out std_logic;
        TRACEDATA                               : out std_logic_vector(3 downto 0);
        TXCTL_EN_RIF                            : out std_logic;
        TXDF                                    : out std_logic_vector(7 downto 0);
        TXD_RIF                                 : out std_logic_vector(3 downto 0);
        TXEV                                    : out std_logic;
        TX_CLK                                  : out std_logic;
        TX_ENF                                  : out std_logic;
        TX_ERRF                                 : out std_logic;
        USBC_XCLK_OE                            : out std_logic;
        USBC_XCLK_OUT                           : out std_logic;
        WDOGTIMEOUT                             : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal FIC_2_APB_M_PCLK_0                                 : std_logic;
signal FIC_2_APB_M_PRESET_N_0                             : std_logic;
signal FIC_2_APB_MASTER_0_PADDR                           : std_logic_vector(15 downto 2);
signal FIC_2_APB_MASTER_0_PENABLE                         : std_logic;
signal FIC_2_APB_MASTER_0_PSELx                           : std_logic;
signal FIC_2_APB_MASTER_0_PWDATA                          : std_logic_vector(31 downto 0);
signal FIC_2_APB_MASTER_0_PWRITE                          : std_logic;
signal GPIO_8_OUT_net_0                                   : std_logic;
signal GPIO_9_OUT_net_0                                   : std_logic;
signal GPIO_10_OUT_net_0                                  : std_logic;
signal GPIO_11_OUT_net_0                                  : std_logic;
signal GPIO_12_OUT_net_0                                  : std_logic;
signal GPIO_13_OUT_net_0                                  : std_logic;
signal GPIO_14_OUT_net_0                                  : std_logic;
signal GPIO_15_OUT_net_0                                  : std_logic;
signal GPIO_16_OUT_net_0                                  : std_logic;
signal GPIO_25_OUT_net_0                                  : std_logic;
signal GPIO_GPIO_29_IN_PAD_Y                              : std_logic;
signal MDDR_SMC_AHB_M_HADDR_net_0                         : std_logic_vector(31 to 31);
signal MDDR_SMC_AHB_M_HADDR_0                             : std_logic_vector(30 to 30);
signal MDDR_SMC_AHB_M_HADDR_1                             : std_logic_vector(29 to 29);
signal MDDR_SMC_AHB_M_HADDR_2                             : std_logic_vector(28 to 28);
signal MDDR_SMC_AHB_M_HADDR_3                             : std_logic_vector(27 to 27);
signal MDDR_SMC_AHB_M_HADDR_4                             : std_logic_vector(26 to 26);
signal MDDR_SMC_AHB_M_HADDR_5                             : std_logic_vector(25 to 25);
signal MDDR_SMC_AHB_M_HADDR_6                             : std_logic_vector(24 to 24);
signal MDDR_SMC_AHB_M_HADDR_7                             : std_logic_vector(23 to 23);
signal MDDR_SMC_AHB_M_HADDR_8                             : std_logic_vector(22 to 22);
signal MDDR_SMC_AHB_M_HADDR_9                             : std_logic_vector(21 to 21);
signal MDDR_SMC_AHB_M_HADDR_10                            : std_logic_vector(20 to 20);
signal MDDR_SMC_AHB_M_HADDR_11                            : std_logic_vector(19 to 19);
signal MDDR_SMC_AHB_M_HADDR_12                            : std_logic_vector(18 to 18);
signal MDDR_SMC_AHB_M_HADDR_13                            : std_logic_vector(17 to 17);
signal MDDR_SMC_AHB_M_HADDR_14                            : std_logic_vector(16 to 16);
signal MDDR_SMC_AHB_M_HADDR_15                            : std_logic_vector(15 to 15);
signal MDDR_SMC_AHB_M_HADDR_16                            : std_logic_vector(14 to 14);
signal MDDR_SMC_AHB_M_HADDR_17                            : std_logic_vector(13 to 13);
signal MDDR_SMC_AHB_M_HADDR_18                            : std_logic_vector(12 to 12);
signal MDDR_SMC_AHB_M_HADDR_19                            : std_logic_vector(11 to 11);
signal MDDR_SMC_AHB_M_HADDR_20                            : std_logic_vector(10 to 10);
signal MDDR_SMC_AHB_M_HADDR_21                            : std_logic_vector(9 to 9);
signal MDDR_SMC_AHB_M_HADDR_22                            : std_logic_vector(8 to 8);
signal MDDR_SMC_AHB_M_HADDR_23                            : std_logic_vector(7 to 7);
signal MDDR_SMC_AHB_M_HADDR_24                            : std_logic_vector(6 to 6);
signal MDDR_SMC_AHB_M_HADDR_25                            : std_logic_vector(5 to 5);
signal MDDR_SMC_AHB_M_HADDR_26                            : std_logic_vector(4 to 4);
signal MDDR_SMC_AHB_M_HADDR_27                            : std_logic_vector(3 to 3);
signal MDDR_SMC_AHB_M_HADDR_28                            : std_logic_vector(2 to 2);
signal MDDR_SMC_AHB_M_HADDR_29                            : std_logic_vector(1 to 1);
signal MDDR_SMC_AHB_M_HADDR_30                            : std_logic_vector(0 to 0);
signal MDDR_SMC_AHB_M_HBURST_net_0                        : std_logic_vector(2 to 2);
signal MDDR_SMC_AHB_M_HBURST_0                            : std_logic_vector(1 to 1);
signal MDDR_SMC_AHB_M_HBURST_1                            : std_logic_vector(0 to 0);
signal MDDR_SMC_AHB_M_HMASTLOCK_net_0                     : std_logic;
signal MDDR_SMC_AHB_M_HRDATA_slice_0                      : std_logic_vector(31 to 31);
signal MDDR_SMC_AHB_M_HRDATA_slice_1                      : std_logic_vector(30 to 30);
signal MDDR_SMC_AHB_M_HRDATA_slice_2                      : std_logic_vector(29 to 29);
signal MDDR_SMC_AHB_M_HRDATA_slice_3                      : std_logic_vector(28 to 28);
signal MDDR_SMC_AHB_M_HRDATA_slice_4                      : std_logic_vector(27 to 27);
signal MDDR_SMC_AHB_M_HRDATA_slice_5                      : std_logic_vector(26 to 26);
signal MDDR_SMC_AHB_M_HRDATA_slice_6                      : std_logic_vector(25 to 25);
signal MDDR_SMC_AHB_M_HRDATA_slice_7                      : std_logic_vector(24 to 24);
signal MDDR_SMC_AHB_M_HRDATA_slice_8                      : std_logic_vector(23 to 23);
signal MDDR_SMC_AHB_M_HRDATA_slice_9                      : std_logic_vector(22 to 22);
signal MDDR_SMC_AHB_M_HRDATA_slice_10                     : std_logic_vector(21 to 21);
signal MDDR_SMC_AHB_M_HRDATA_slice_11                     : std_logic_vector(20 to 20);
signal MDDR_SMC_AHB_M_HRDATA_slice_12                     : std_logic_vector(19 to 19);
signal MDDR_SMC_AHB_M_HRDATA_slice_13                     : std_logic_vector(18 to 18);
signal MDDR_SMC_AHB_M_HRDATA_slice_14                     : std_logic_vector(17 to 17);
signal MDDR_SMC_AHB_M_HRDATA_slice_15                     : std_logic_vector(16 to 16);
signal MDDR_SMC_AHB_M_HRDATA_slice_16                     : std_logic_vector(15 to 15);
signal MDDR_SMC_AHB_M_HRDATA_slice_17                     : std_logic_vector(14 to 14);
signal MDDR_SMC_AHB_M_HRDATA_slice_18                     : std_logic_vector(13 to 13);
signal MDDR_SMC_AHB_M_HRDATA_slice_19                     : std_logic_vector(12 to 12);
signal MDDR_SMC_AHB_M_HRDATA_slice_20                     : std_logic_vector(11 to 11);
signal MDDR_SMC_AHB_M_HRDATA_slice_21                     : std_logic_vector(10 to 10);
signal MDDR_SMC_AHB_M_HRDATA_slice_22                     : std_logic_vector(9 to 9);
signal MDDR_SMC_AHB_M_HRDATA_slice_23                     : std_logic_vector(8 to 8);
signal MDDR_SMC_AHB_M_HRDATA_slice_24                     : std_logic_vector(7 to 7);
signal MDDR_SMC_AHB_M_HRDATA_slice_25                     : std_logic_vector(6 to 6);
signal MDDR_SMC_AHB_M_HRDATA_slice_26                     : std_logic_vector(5 to 5);
signal MDDR_SMC_AHB_M_HRDATA_slice_27                     : std_logic_vector(4 to 4);
signal MDDR_SMC_AHB_M_HRDATA_slice_28                     : std_logic_vector(3 to 3);
signal MDDR_SMC_AHB_M_HRDATA_slice_29                     : std_logic_vector(2 to 2);
signal MDDR_SMC_AHB_M_HRDATA_slice_30                     : std_logic_vector(1 to 1);
signal MDDR_SMC_AHB_M_HRDATA_slice_31                     : std_logic_vector(0 to 0);
signal MDDR_SMC_AHB_M_HSIZE_net_0                         : std_logic_vector(1 to 1);
signal MDDR_SMC_AHB_M_HSIZE_0                             : std_logic_vector(0 to 0);
signal MDDR_SMC_AHB_M_HTRANS_net_0                        : std_logic_vector(1 downto 0);
signal MDDR_SMC_AHB_M_HWDATA_net_0                        : std_logic_vector(63 to 63);
signal MDDR_SMC_AHB_M_HWDATA_0                            : std_logic_vector(62 to 62);
signal MDDR_SMC_AHB_M_HWDATA_1                            : std_logic_vector(61 to 61);
signal MDDR_SMC_AHB_M_HWDATA_2                            : std_logic_vector(60 to 60);
signal MDDR_SMC_AHB_M_HWDATA_3                            : std_logic_vector(59 to 59);
signal MDDR_SMC_AHB_M_HWDATA_4                            : std_logic_vector(58 to 58);
signal MDDR_SMC_AHB_M_HWDATA_5                            : std_logic_vector(57 to 57);
signal MDDR_SMC_AHB_M_HWDATA_6                            : std_logic_vector(56 to 56);
signal MDDR_SMC_AHB_M_HWDATA_7                            : std_logic_vector(55 to 55);
signal MDDR_SMC_AHB_M_HWDATA_8                            : std_logic_vector(54 to 54);
signal MDDR_SMC_AHB_M_HWDATA_9                            : std_logic_vector(53 to 53);
signal MDDR_SMC_AHB_M_HWDATA_10                           : std_logic_vector(52 to 52);
signal MDDR_SMC_AHB_M_HWDATA_11                           : std_logic_vector(51 to 51);
signal MDDR_SMC_AHB_M_HWDATA_12                           : std_logic_vector(50 to 50);
signal MDDR_SMC_AHB_M_HWDATA_13                           : std_logic_vector(49 to 49);
signal MDDR_SMC_AHB_M_HWDATA_14                           : std_logic_vector(48 to 48);
signal MDDR_SMC_AHB_M_HWDATA_15                           : std_logic_vector(47 to 47);
signal MDDR_SMC_AHB_M_HWDATA_16                           : std_logic_vector(46 to 46);
signal MDDR_SMC_AHB_M_HWDATA_17                           : std_logic_vector(45 to 45);
signal MDDR_SMC_AHB_M_HWDATA_18                           : std_logic_vector(44 to 44);
signal MDDR_SMC_AHB_M_HWDATA_19                           : std_logic_vector(43 to 43);
signal MDDR_SMC_AHB_M_HWDATA_20                           : std_logic_vector(42 to 42);
signal MDDR_SMC_AHB_M_HWDATA_21                           : std_logic_vector(41 to 41);
signal MDDR_SMC_AHB_M_HWDATA_22                           : std_logic_vector(40 to 40);
signal MDDR_SMC_AHB_M_HWDATA_23                           : std_logic_vector(39 to 39);
signal MDDR_SMC_AHB_M_HWDATA_24                           : std_logic_vector(38 to 38);
signal MDDR_SMC_AHB_M_HWDATA_25                           : std_logic_vector(37 to 37);
signal MDDR_SMC_AHB_M_HWDATA_26                           : std_logic_vector(36 to 36);
signal MDDR_SMC_AHB_M_HWDATA_27                           : std_logic_vector(35 to 35);
signal MDDR_SMC_AHB_M_HWDATA_28                           : std_logic_vector(34 to 34);
signal MDDR_SMC_AHB_M_HWDATA_29                           : std_logic_vector(33 to 33);
signal MDDR_SMC_AHB_M_HWDATA_30                           : std_logic_vector(32 to 32);
signal MDDR_SMC_AHB_M_HWRITE_net_0                        : std_logic;
signal MMUART_0_RXD_PAD_Y                                 : std_logic;
signal MMUART_0_TXD_net_0                                 : std_logic;
signal MSS_ADLIB_INST_MMUART0_TXD_USBC_DIR_MGPIO27B_OE    : std_logic;
signal MSS_ADLIB_INST_MMUART0_TXD_USBC_DIR_MGPIO27B_OUT   : std_logic;
signal MSS_ADLIB_INST_MMUART1_SCK_USBC_DATA4_MGPIO25B_OUT : std_logic;
signal MSS_ADLIB_INST_SPI0_SS1_USBA_DATA5_MGPIO8A_OUT     : std_logic;
signal MSS_ADLIB_INST_SPI0_SS2_USBA_DATA6_MGPIO9A_OUT     : std_logic;
signal MSS_ADLIB_INST_SPI0_SS3_USBA_DATA7_MGPIO10A_OUT    : std_logic;
signal MSS_ADLIB_INST_SPI1_SDI_MGPIO11A_OUT               : std_logic;
signal MSS_ADLIB_INST_SPI1_SDO_MGPIO12A_OUT               : std_logic;
signal MSS_ADLIB_INST_SPI1_SS0_MGPIO13A_OUT               : std_logic;
signal MSS_ADLIB_INST_SPI1_SS1_MGPIO14A_OUT               : std_logic;
signal MSS_ADLIB_INST_SPI1_SS2_MGPIO15A_OUT               : std_logic;
signal MSS_ADLIB_INST_SPI1_SS3_MGPIO16A_OUT               : std_logic;
signal MSS_RESET_N_M2F_net_0                              : std_logic;
signal MMUART_0_TXD_net_1                                 : std_logic;
signal MSS_RESET_N_M2F_net_1                              : std_logic;
signal MDDR_SMC_AHB_M_HMASTLOCK_net_1                     : std_logic;
signal MDDR_SMC_AHB_M_HWRITE_net_1                        : std_logic;
signal FIC_2_APB_M_PRESET_N_0_net_0                       : std_logic;
signal FIC_2_APB_M_PCLK_0_net_0                           : std_logic;
signal FIC_2_APB_MASTER_0_PWRITE_net_0                    : std_logic;
signal FIC_2_APB_MASTER_0_PENABLE_net_0                   : std_logic;
signal FIC_2_APB_MASTER_0_PSELx_net_0                     : std_logic;
signal GPIO_8_OUT_net_1                                   : std_logic;
signal GPIO_9_OUT_net_1                                   : std_logic;
signal GPIO_10_OUT_net_1                                  : std_logic;
signal GPIO_11_OUT_net_1                                  : std_logic;
signal GPIO_12_OUT_net_1                                  : std_logic;
signal GPIO_13_OUT_net_1                                  : std_logic;
signal GPIO_14_OUT_net_1                                  : std_logic;
signal GPIO_15_OUT_net_1                                  : std_logic;
signal GPIO_16_OUT_net_1                                  : std_logic;
signal GPIO_25_OUT_net_1                                  : std_logic;
signal MDDR_SMC_AHB_M_HBURST_1_net_0                      : std_logic_vector(0 to 0);
signal MDDR_SMC_AHB_M_HBURST_0_net_0                      : std_logic_vector(1 to 1);
signal MDDR_SMC_AHB_M_HBURST_net_1                        : std_logic_vector(2 to 2);
signal MDDR_SMC_AHB_M_HTRANS_net_1                        : std_logic_vector(1 downto 0);
signal MDDR_SMC_AHB_M_HSIZE_0_net_0                       : std_logic_vector(0 to 0);
signal MDDR_SMC_AHB_M_HSIZE_net_1                         : std_logic_vector(1 to 1);
signal MDDR_SMC_AHB_M_HWDATA_30_net_0                     : std_logic_vector(0 to 0);
signal MDDR_SMC_AHB_M_HWDATA_20_net_0                     : std_logic_vector(10 to 10);
signal MDDR_SMC_AHB_M_HWDATA_19_net_0                     : std_logic_vector(11 to 11);
signal MDDR_SMC_AHB_M_HWDATA_18_net_0                     : std_logic_vector(12 to 12);
signal MDDR_SMC_AHB_M_HWDATA_17_net_0                     : std_logic_vector(13 to 13);
signal MDDR_SMC_AHB_M_HWDATA_16_net_0                     : std_logic_vector(14 to 14);
signal MDDR_SMC_AHB_M_HWDATA_15_net_0                     : std_logic_vector(15 to 15);
signal MDDR_SMC_AHB_M_HWDATA_14_net_0                     : std_logic_vector(16 to 16);
signal MDDR_SMC_AHB_M_HWDATA_13_net_0                     : std_logic_vector(17 to 17);
signal MDDR_SMC_AHB_M_HWDATA_12_net_0                     : std_logic_vector(18 to 18);
signal MDDR_SMC_AHB_M_HWDATA_11_net_0                     : std_logic_vector(19 to 19);
signal MDDR_SMC_AHB_M_HWDATA_29_net_0                     : std_logic_vector(1 to 1);
signal MDDR_SMC_AHB_M_HWDATA_10_net_0                     : std_logic_vector(20 to 20);
signal MDDR_SMC_AHB_M_HWDATA_9_net_0                      : std_logic_vector(21 to 21);
signal MDDR_SMC_AHB_M_HWDATA_8_net_0                      : std_logic_vector(22 to 22);
signal MDDR_SMC_AHB_M_HWDATA_7_net_0                      : std_logic_vector(23 to 23);
signal MDDR_SMC_AHB_M_HWDATA_6_net_0                      : std_logic_vector(24 to 24);
signal MDDR_SMC_AHB_M_HWDATA_5_net_0                      : std_logic_vector(25 to 25);
signal MDDR_SMC_AHB_M_HWDATA_4_net_0                      : std_logic_vector(26 to 26);
signal MDDR_SMC_AHB_M_HWDATA_3_net_0                      : std_logic_vector(27 to 27);
signal MDDR_SMC_AHB_M_HWDATA_2_net_0                      : std_logic_vector(28 to 28);
signal MDDR_SMC_AHB_M_HWDATA_1_net_0                      : std_logic_vector(29 to 29);
signal MDDR_SMC_AHB_M_HWDATA_28_net_0                     : std_logic_vector(2 to 2);
signal MDDR_SMC_AHB_M_HWDATA_0_net_0                      : std_logic_vector(30 to 30);
signal MDDR_SMC_AHB_M_HWDATA_net_1                        : std_logic_vector(31 to 31);
signal MDDR_SMC_AHB_M_HWDATA_27_net_0                     : std_logic_vector(3 to 3);
signal MDDR_SMC_AHB_M_HWDATA_26_net_0                     : std_logic_vector(4 to 4);
signal MDDR_SMC_AHB_M_HWDATA_25_net_0                     : std_logic_vector(5 to 5);
signal MDDR_SMC_AHB_M_HWDATA_24_net_0                     : std_logic_vector(6 to 6);
signal MDDR_SMC_AHB_M_HWDATA_23_net_0                     : std_logic_vector(7 to 7);
signal MDDR_SMC_AHB_M_HWDATA_22_net_0                     : std_logic_vector(8 to 8);
signal MDDR_SMC_AHB_M_HWDATA_21_net_0                     : std_logic_vector(9 to 9);
signal MDDR_SMC_AHB_M_HADDR_30_net_0                      : std_logic_vector(0 to 0);
signal MDDR_SMC_AHB_M_HADDR_20_net_0                      : std_logic_vector(10 to 10);
signal MDDR_SMC_AHB_M_HADDR_19_net_0                      : std_logic_vector(11 to 11);
signal MDDR_SMC_AHB_M_HADDR_18_net_0                      : std_logic_vector(12 to 12);
signal MDDR_SMC_AHB_M_HADDR_17_net_0                      : std_logic_vector(13 to 13);
signal MDDR_SMC_AHB_M_HADDR_16_net_0                      : std_logic_vector(14 to 14);
signal MDDR_SMC_AHB_M_HADDR_15_net_0                      : std_logic_vector(15 to 15);
signal MDDR_SMC_AHB_M_HADDR_14_net_0                      : std_logic_vector(16 to 16);
signal MDDR_SMC_AHB_M_HADDR_13_net_0                      : std_logic_vector(17 to 17);
signal MDDR_SMC_AHB_M_HADDR_12_net_0                      : std_logic_vector(18 to 18);
signal MDDR_SMC_AHB_M_HADDR_11_net_0                      : std_logic_vector(19 to 19);
signal MDDR_SMC_AHB_M_HADDR_29_net_0                      : std_logic_vector(1 to 1);
signal MDDR_SMC_AHB_M_HADDR_10_net_0                      : std_logic_vector(20 to 20);
signal MDDR_SMC_AHB_M_HADDR_9_net_0                       : std_logic_vector(21 to 21);
signal MDDR_SMC_AHB_M_HADDR_8_net_0                       : std_logic_vector(22 to 22);
signal MDDR_SMC_AHB_M_HADDR_7_net_0                       : std_logic_vector(23 to 23);
signal MDDR_SMC_AHB_M_HADDR_6_net_0                       : std_logic_vector(24 to 24);
signal MDDR_SMC_AHB_M_HADDR_5_net_0                       : std_logic_vector(25 to 25);
signal MDDR_SMC_AHB_M_HADDR_4_net_0                       : std_logic_vector(26 to 26);
signal MDDR_SMC_AHB_M_HADDR_3_net_0                       : std_logic_vector(27 to 27);
signal MDDR_SMC_AHB_M_HADDR_2_net_0                       : std_logic_vector(28 to 28);
signal MDDR_SMC_AHB_M_HADDR_1_net_0                       : std_logic_vector(29 to 29);
signal MDDR_SMC_AHB_M_HADDR_28_net_0                      : std_logic_vector(2 to 2);
signal MDDR_SMC_AHB_M_HADDR_0_net_0                       : std_logic_vector(30 to 30);
signal MDDR_SMC_AHB_M_HADDR_net_1                         : std_logic_vector(31 to 31);
signal MDDR_SMC_AHB_M_HADDR_27_net_0                      : std_logic_vector(3 to 3);
signal MDDR_SMC_AHB_M_HADDR_26_net_0                      : std_logic_vector(4 to 4);
signal MDDR_SMC_AHB_M_HADDR_25_net_0                      : std_logic_vector(5 to 5);
signal MDDR_SMC_AHB_M_HADDR_24_net_0                      : std_logic_vector(6 to 6);
signal MDDR_SMC_AHB_M_HADDR_23_net_0                      : std_logic_vector(7 to 7);
signal MDDR_SMC_AHB_M_HADDR_22_net_0                      : std_logic_vector(8 to 8);
signal MDDR_SMC_AHB_M_HADDR_21_net_0                      : std_logic_vector(9 to 9);
signal FIC_2_APB_MASTER_0_PADDR_net_0                     : std_logic_vector(15 downto 2);
signal FIC_2_APB_MASTER_0_PWDATA_net_0                    : std_logic_vector(31 downto 0);
signal F_BID_slice_0                                      : std_logic_vector(3 to 3);
signal F_RID_slice_0                                      : std_logic_vector(2 to 2);
signal F_RID_slice_1                                      : std_logic_vector(3 to 3);
signal F_AWLOCK_HMASTLOCK0_net_0                          : std_logic_vector(1 downto 0);
signal F_WDATA_HWDATA01_net_0                             : std_logic_vector(63 downto 0);
signal F_BID_net_0                                        : std_logic_vector(3 downto 0);
signal F_RDATA_HRDATA01_net_0                             : std_logic_vector(63 downto 0);
signal F_RID_net_0                                        : std_logic_vector(3 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net                                            : std_logic;
signal DM_IN_const_net_0                                  : std_logic_vector(2 downto 0);
signal DRAM_DQ_IN_const_net_0                             : std_logic_vector(17 downto 0);
signal DRAM_DQS_IN_const_net_0                            : std_logic_vector(2 downto 0);
signal DRAM_FIFO_WE_IN_const_net_0                        : std_logic_vector(1 downto 0);
signal VCC_net                                            : std_logic;
signal F2_DMAREADY_const_net_0                            : std_logic_vector(1 downto 0);
signal F2H_INTERRUPT_const_net_0                          : std_logic_vector(15 downto 0);
signal F_DMAREADY_const_net_0                             : std_logic_vector(1 downto 0);
signal F_FM0_ADDR_const_net_0                             : std_logic_vector(31 downto 0);
signal F_FM0_SIZE_const_net_0                             : std_logic_vector(1 downto 0);
signal F_FM0_WDATA_const_net_0                            : std_logic_vector(31 downto 0);
signal F_HM0_RDATA_const_net_0                            : std_logic_vector(31 downto 0);
signal FAB_LINESTATE_const_net_0                          : std_logic_vector(1 downto 0);
signal FAB_VSTATUS_const_net_0                            : std_logic_vector(7 downto 0);
signal FAB_XDATAIN_const_net_0                            : std_logic_vector(7 downto 0);
signal RCGF_const_net_0                                   : std_logic_vector(9 downto 0);
signal RXDF_const_net_0                                   : std_logic_vector(7 downto 0);
signal F_ARADDR_HADDR1_const_net_0                        : std_logic_vector(31 downto 0);
signal F_ARBURST_HTRANS1_const_net_0                      : std_logic_vector(1 downto 0);
signal F_ARID_HSEL1_const_net_0                           : std_logic_vector(3 downto 0);
signal F_ARLEN_HBURST1_const_net_0                        : std_logic_vector(3 downto 0);
signal F_ARLOCK_HMASTLOCK1_const_net_0                    : std_logic_vector(1 downto 0);
signal F_ARSIZE_HSIZE1_const_net_0                        : std_logic_vector(1 downto 0);
signal F_AWADDR_HADDR0_const_net_0                        : std_logic_vector(31 downto 0);
signal F_AWBURST_HTRANS0_const_net_0                      : std_logic_vector(1 downto 0);
signal F_AWID_HSEL0_const_net_0                           : std_logic_vector(3 downto 0);
signal F_AWLEN_HBURST0_const_net_0                        : std_logic_vector(3 downto 0);
signal F_AWSIZE_HSIZE0_const_net_0                        : std_logic_vector(1 downto 0);
signal F_WID_HREADY01_const_net_0                         : std_logic_vector(3 downto 0);
signal F_WSTRB_const_net_0                                : std_logic_vector(7 downto 0);
signal MDDR_FABRIC_PADDR_const_net_0                      : std_logic_vector(10 downto 2);
signal MDDR_FABRIC_PWDATA_const_net_0                     : std_logic_vector(15 downto 0);

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net                         <= '0';
 DM_IN_const_net_0               <= B"000";
 DRAM_DQ_IN_const_net_0          <= B"000000000000000000";
 DRAM_DQS_IN_const_net_0         <= B"000";
 DRAM_FIFO_WE_IN_const_net_0     <= B"00";
 VCC_net                         <= '1';
 F2_DMAREADY_const_net_0         <= B"11";
 F2H_INTERRUPT_const_net_0       <= B"0000000000000000";
 F_DMAREADY_const_net_0          <= B"11";
 F_FM0_ADDR_const_net_0          <= B"00000000000000000000000000000000";
 F_FM0_SIZE_const_net_0          <= B"00";
 F_FM0_WDATA_const_net_0         <= B"00000000000000000000000000000000";
 F_HM0_RDATA_const_net_0         <= B"00000000000000000000000000000000";
 FAB_LINESTATE_const_net_0       <= B"11";
 FAB_VSTATUS_const_net_0         <= B"11111111";
 FAB_XDATAIN_const_net_0         <= B"11111111";
 RCGF_const_net_0                <= B"1111111111";
 RXDF_const_net_0                <= B"11111111";
 F_ARADDR_HADDR1_const_net_0     <= B"11111111111111111111111111111111";
 F_ARBURST_HTRANS1_const_net_0   <= B"00";
 F_ARID_HSEL1_const_net_0        <= B"0000";
 F_ARLEN_HBURST1_const_net_0     <= B"0000";
 F_ARLOCK_HMASTLOCK1_const_net_0 <= B"00";
 F_ARSIZE_HSIZE1_const_net_0     <= B"00";
 F_AWADDR_HADDR0_const_net_0     <= B"11111111111111111111111111111111";
 F_AWBURST_HTRANS0_const_net_0   <= B"00";
 F_AWID_HSEL0_const_net_0        <= B"0000";
 F_AWLEN_HBURST0_const_net_0     <= B"0000";
 F_AWSIZE_HSIZE0_const_net_0     <= B"00";
 F_WID_HREADY01_const_net_0      <= B"0000";
 F_WSTRB_const_net_0             <= B"00000000";
 MDDR_FABRIC_PADDR_const_net_0   <= B"111111111";
 MDDR_FABRIC_PWDATA_const_net_0  <= B"1111111111111111";
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 MMUART_0_TXD_net_1                 <= MMUART_0_TXD_net_0;
 MMUART_0_TXD                       <= MMUART_0_TXD_net_1;
 MSS_RESET_N_M2F_net_1              <= MSS_RESET_N_M2F_net_0;
 MSS_RESET_N_M2F                    <= MSS_RESET_N_M2F_net_1;
 MDDR_SMC_AHB_M_HMASTLOCK_net_1     <= MDDR_SMC_AHB_M_HMASTLOCK_net_0;
 MDDR_SMC_AHB_M_HMASTLOCK           <= MDDR_SMC_AHB_M_HMASTLOCK_net_1;
 MDDR_SMC_AHB_M_HWRITE_net_1        <= MDDR_SMC_AHB_M_HWRITE_net_0;
 MDDR_SMC_AHB_M_HWRITE              <= MDDR_SMC_AHB_M_HWRITE_net_1;
 FIC_2_APB_M_PRESET_N_0_net_0       <= FIC_2_APB_M_PRESET_N_0;
 FIC_2_APB_M_PRESET_N               <= FIC_2_APB_M_PRESET_N_0_net_0;
 FIC_2_APB_M_PCLK_0_net_0           <= FIC_2_APB_M_PCLK_0;
 FIC_2_APB_M_PCLK                   <= FIC_2_APB_M_PCLK_0_net_0;
 FIC_2_APB_MASTER_0_PWRITE_net_0    <= FIC_2_APB_MASTER_0_PWRITE;
 FIC_2_APB_M_PWRITE                 <= FIC_2_APB_MASTER_0_PWRITE_net_0;
 FIC_2_APB_MASTER_0_PENABLE_net_0   <= FIC_2_APB_MASTER_0_PENABLE;
 FIC_2_APB_M_PENABLE                <= FIC_2_APB_MASTER_0_PENABLE_net_0;
 FIC_2_APB_MASTER_0_PSELx_net_0     <= FIC_2_APB_MASTER_0_PSELx;
 FIC_2_APB_M_PSEL                   <= FIC_2_APB_MASTER_0_PSELx_net_0;
 GPIO_8_OUT_net_1                   <= GPIO_8_OUT_net_0;
 GPIO_8_OUT                         <= GPIO_8_OUT_net_1;
 GPIO_9_OUT_net_1                   <= GPIO_9_OUT_net_0;
 GPIO_9_OUT                         <= GPIO_9_OUT_net_1;
 GPIO_10_OUT_net_1                  <= GPIO_10_OUT_net_0;
 GPIO_10_OUT                        <= GPIO_10_OUT_net_1;
 GPIO_11_OUT_net_1                  <= GPIO_11_OUT_net_0;
 GPIO_11_OUT                        <= GPIO_11_OUT_net_1;
 GPIO_12_OUT_net_1                  <= GPIO_12_OUT_net_0;
 GPIO_12_OUT                        <= GPIO_12_OUT_net_1;
 GPIO_13_OUT_net_1                  <= GPIO_13_OUT_net_0;
 GPIO_13_OUT                        <= GPIO_13_OUT_net_1;
 GPIO_14_OUT_net_1                  <= GPIO_14_OUT_net_0;
 GPIO_14_OUT                        <= GPIO_14_OUT_net_1;
 GPIO_15_OUT_net_1                  <= GPIO_15_OUT_net_0;
 GPIO_15_OUT                        <= GPIO_15_OUT_net_1;
 GPIO_16_OUT_net_1                  <= GPIO_16_OUT_net_0;
 GPIO_16_OUT                        <= GPIO_16_OUT_net_1;
 GPIO_25_OUT_net_1                  <= GPIO_25_OUT_net_0;
 GPIO_25_OUT                        <= GPIO_25_OUT_net_1;
 MDDR_SMC_AHB_M_HBURST_1_net_0(0)   <= MDDR_SMC_AHB_M_HBURST_1(0);
 MDDR_SMC_AHB_M_HBURST(0)           <= MDDR_SMC_AHB_M_HBURST_1_net_0(0);
 MDDR_SMC_AHB_M_HBURST_0_net_0(1)   <= MDDR_SMC_AHB_M_HBURST_0(1);
 MDDR_SMC_AHB_M_HBURST(1)           <= MDDR_SMC_AHB_M_HBURST_0_net_0(1);
 MDDR_SMC_AHB_M_HBURST_net_1(2)     <= MDDR_SMC_AHB_M_HBURST_net_0(2);
 MDDR_SMC_AHB_M_HBURST(2)           <= MDDR_SMC_AHB_M_HBURST_net_1(2);
 MDDR_SMC_AHB_M_HTRANS_net_1        <= MDDR_SMC_AHB_M_HTRANS_net_0;
 MDDR_SMC_AHB_M_HTRANS(1 downto 0)  <= MDDR_SMC_AHB_M_HTRANS_net_1;
 MDDR_SMC_AHB_M_HSIZE_0_net_0(0)    <= MDDR_SMC_AHB_M_HSIZE_0(0);
 MDDR_SMC_AHB_M_HSIZE(0)            <= MDDR_SMC_AHB_M_HSIZE_0_net_0(0);
 MDDR_SMC_AHB_M_HSIZE_net_1(1)      <= MDDR_SMC_AHB_M_HSIZE_net_0(1);
 MDDR_SMC_AHB_M_HSIZE(1)            <= MDDR_SMC_AHB_M_HSIZE_net_1(1);
 MDDR_SMC_AHB_M_HWDATA_30_net_0(0)  <= MDDR_SMC_AHB_M_HWDATA_30(32);
 MDDR_SMC_AHB_M_HWDATA(0)           <= MDDR_SMC_AHB_M_HWDATA_30_net_0(0);
 MDDR_SMC_AHB_M_HWDATA_20_net_0(10) <= MDDR_SMC_AHB_M_HWDATA_20(42);
 MDDR_SMC_AHB_M_HWDATA(10)          <= MDDR_SMC_AHB_M_HWDATA_20_net_0(10);
 MDDR_SMC_AHB_M_HWDATA_19_net_0(11) <= MDDR_SMC_AHB_M_HWDATA_19(43);
 MDDR_SMC_AHB_M_HWDATA(11)          <= MDDR_SMC_AHB_M_HWDATA_19_net_0(11);
 MDDR_SMC_AHB_M_HWDATA_18_net_0(12) <= MDDR_SMC_AHB_M_HWDATA_18(44);
 MDDR_SMC_AHB_M_HWDATA(12)          <= MDDR_SMC_AHB_M_HWDATA_18_net_0(12);
 MDDR_SMC_AHB_M_HWDATA_17_net_0(13) <= MDDR_SMC_AHB_M_HWDATA_17(45);
 MDDR_SMC_AHB_M_HWDATA(13)          <= MDDR_SMC_AHB_M_HWDATA_17_net_0(13);
 MDDR_SMC_AHB_M_HWDATA_16_net_0(14) <= MDDR_SMC_AHB_M_HWDATA_16(46);
 MDDR_SMC_AHB_M_HWDATA(14)          <= MDDR_SMC_AHB_M_HWDATA_16_net_0(14);
 MDDR_SMC_AHB_M_HWDATA_15_net_0(15) <= MDDR_SMC_AHB_M_HWDATA_15(47);
 MDDR_SMC_AHB_M_HWDATA(15)          <= MDDR_SMC_AHB_M_HWDATA_15_net_0(15);
 MDDR_SMC_AHB_M_HWDATA_14_net_0(16) <= MDDR_SMC_AHB_M_HWDATA_14(48);
 MDDR_SMC_AHB_M_HWDATA(16)          <= MDDR_SMC_AHB_M_HWDATA_14_net_0(16);
 MDDR_SMC_AHB_M_HWDATA_13_net_0(17) <= MDDR_SMC_AHB_M_HWDATA_13(49);
 MDDR_SMC_AHB_M_HWDATA(17)          <= MDDR_SMC_AHB_M_HWDATA_13_net_0(17);
 MDDR_SMC_AHB_M_HWDATA_12_net_0(18) <= MDDR_SMC_AHB_M_HWDATA_12(50);
 MDDR_SMC_AHB_M_HWDATA(18)          <= MDDR_SMC_AHB_M_HWDATA_12_net_0(18);
 MDDR_SMC_AHB_M_HWDATA_11_net_0(19) <= MDDR_SMC_AHB_M_HWDATA_11(51);
 MDDR_SMC_AHB_M_HWDATA(19)          <= MDDR_SMC_AHB_M_HWDATA_11_net_0(19);
 MDDR_SMC_AHB_M_HWDATA_29_net_0(1)  <= MDDR_SMC_AHB_M_HWDATA_29(33);
 MDDR_SMC_AHB_M_HWDATA(1)           <= MDDR_SMC_AHB_M_HWDATA_29_net_0(1);
 MDDR_SMC_AHB_M_HWDATA_10_net_0(20) <= MDDR_SMC_AHB_M_HWDATA_10(52);
 MDDR_SMC_AHB_M_HWDATA(20)          <= MDDR_SMC_AHB_M_HWDATA_10_net_0(20);
 MDDR_SMC_AHB_M_HWDATA_9_net_0(21)  <= MDDR_SMC_AHB_M_HWDATA_9(53);
 MDDR_SMC_AHB_M_HWDATA(21)          <= MDDR_SMC_AHB_M_HWDATA_9_net_0(21);
 MDDR_SMC_AHB_M_HWDATA_8_net_0(22)  <= MDDR_SMC_AHB_M_HWDATA_8(54);
 MDDR_SMC_AHB_M_HWDATA(22)          <= MDDR_SMC_AHB_M_HWDATA_8_net_0(22);
 MDDR_SMC_AHB_M_HWDATA_7_net_0(23)  <= MDDR_SMC_AHB_M_HWDATA_7(55);
 MDDR_SMC_AHB_M_HWDATA(23)          <= MDDR_SMC_AHB_M_HWDATA_7_net_0(23);
 MDDR_SMC_AHB_M_HWDATA_6_net_0(24)  <= MDDR_SMC_AHB_M_HWDATA_6(56);
 MDDR_SMC_AHB_M_HWDATA(24)          <= MDDR_SMC_AHB_M_HWDATA_6_net_0(24);
 MDDR_SMC_AHB_M_HWDATA_5_net_0(25)  <= MDDR_SMC_AHB_M_HWDATA_5(57);
 MDDR_SMC_AHB_M_HWDATA(25)          <= MDDR_SMC_AHB_M_HWDATA_5_net_0(25);
 MDDR_SMC_AHB_M_HWDATA_4_net_0(26)  <= MDDR_SMC_AHB_M_HWDATA_4(58);
 MDDR_SMC_AHB_M_HWDATA(26)          <= MDDR_SMC_AHB_M_HWDATA_4_net_0(26);
 MDDR_SMC_AHB_M_HWDATA_3_net_0(27)  <= MDDR_SMC_AHB_M_HWDATA_3(59);
 MDDR_SMC_AHB_M_HWDATA(27)          <= MDDR_SMC_AHB_M_HWDATA_3_net_0(27);
 MDDR_SMC_AHB_M_HWDATA_2_net_0(28)  <= MDDR_SMC_AHB_M_HWDATA_2(60);
 MDDR_SMC_AHB_M_HWDATA(28)          <= MDDR_SMC_AHB_M_HWDATA_2_net_0(28);
 MDDR_SMC_AHB_M_HWDATA_1_net_0(29)  <= MDDR_SMC_AHB_M_HWDATA_1(61);
 MDDR_SMC_AHB_M_HWDATA(29)          <= MDDR_SMC_AHB_M_HWDATA_1_net_0(29);
 MDDR_SMC_AHB_M_HWDATA_28_net_0(2)  <= MDDR_SMC_AHB_M_HWDATA_28(34);
 MDDR_SMC_AHB_M_HWDATA(2)           <= MDDR_SMC_AHB_M_HWDATA_28_net_0(2);
 MDDR_SMC_AHB_M_HWDATA_0_net_0(30)  <= MDDR_SMC_AHB_M_HWDATA_0(62);
 MDDR_SMC_AHB_M_HWDATA(30)          <= MDDR_SMC_AHB_M_HWDATA_0_net_0(30);
 MDDR_SMC_AHB_M_HWDATA_net_1(31)    <= MDDR_SMC_AHB_M_HWDATA_net_0(63);
 MDDR_SMC_AHB_M_HWDATA(31)          <= MDDR_SMC_AHB_M_HWDATA_net_1(31);
 MDDR_SMC_AHB_M_HWDATA_27_net_0(3)  <= MDDR_SMC_AHB_M_HWDATA_27(35);
 MDDR_SMC_AHB_M_HWDATA(3)           <= MDDR_SMC_AHB_M_HWDATA_27_net_0(3);
 MDDR_SMC_AHB_M_HWDATA_26_net_0(4)  <= MDDR_SMC_AHB_M_HWDATA_26(36);
 MDDR_SMC_AHB_M_HWDATA(4)           <= MDDR_SMC_AHB_M_HWDATA_26_net_0(4);
 MDDR_SMC_AHB_M_HWDATA_25_net_0(5)  <= MDDR_SMC_AHB_M_HWDATA_25(37);
 MDDR_SMC_AHB_M_HWDATA(5)           <= MDDR_SMC_AHB_M_HWDATA_25_net_0(5);
 MDDR_SMC_AHB_M_HWDATA_24_net_0(6)  <= MDDR_SMC_AHB_M_HWDATA_24(38);
 MDDR_SMC_AHB_M_HWDATA(6)           <= MDDR_SMC_AHB_M_HWDATA_24_net_0(6);
 MDDR_SMC_AHB_M_HWDATA_23_net_0(7)  <= MDDR_SMC_AHB_M_HWDATA_23(39);
 MDDR_SMC_AHB_M_HWDATA(7)           <= MDDR_SMC_AHB_M_HWDATA_23_net_0(7);
 MDDR_SMC_AHB_M_HWDATA_22_net_0(8)  <= MDDR_SMC_AHB_M_HWDATA_22(40);
 MDDR_SMC_AHB_M_HWDATA(8)           <= MDDR_SMC_AHB_M_HWDATA_22_net_0(8);
 MDDR_SMC_AHB_M_HWDATA_21_net_0(9)  <= MDDR_SMC_AHB_M_HWDATA_21(41);
 MDDR_SMC_AHB_M_HWDATA(9)           <= MDDR_SMC_AHB_M_HWDATA_21_net_0(9);
 MDDR_SMC_AHB_M_HADDR_30_net_0(0)   <= MDDR_SMC_AHB_M_HADDR_30(0);
 MDDR_SMC_AHB_M_HADDR(0)            <= MDDR_SMC_AHB_M_HADDR_30_net_0(0);
 MDDR_SMC_AHB_M_HADDR_20_net_0(10)  <= MDDR_SMC_AHB_M_HADDR_20(10);
 MDDR_SMC_AHB_M_HADDR(10)           <= MDDR_SMC_AHB_M_HADDR_20_net_0(10);
 MDDR_SMC_AHB_M_HADDR_19_net_0(11)  <= MDDR_SMC_AHB_M_HADDR_19(11);
 MDDR_SMC_AHB_M_HADDR(11)           <= MDDR_SMC_AHB_M_HADDR_19_net_0(11);
 MDDR_SMC_AHB_M_HADDR_18_net_0(12)  <= MDDR_SMC_AHB_M_HADDR_18(12);
 MDDR_SMC_AHB_M_HADDR(12)           <= MDDR_SMC_AHB_M_HADDR_18_net_0(12);
 MDDR_SMC_AHB_M_HADDR_17_net_0(13)  <= MDDR_SMC_AHB_M_HADDR_17(13);
 MDDR_SMC_AHB_M_HADDR(13)           <= MDDR_SMC_AHB_M_HADDR_17_net_0(13);
 MDDR_SMC_AHB_M_HADDR_16_net_0(14)  <= MDDR_SMC_AHB_M_HADDR_16(14);
 MDDR_SMC_AHB_M_HADDR(14)           <= MDDR_SMC_AHB_M_HADDR_16_net_0(14);
 MDDR_SMC_AHB_M_HADDR_15_net_0(15)  <= MDDR_SMC_AHB_M_HADDR_15(15);
 MDDR_SMC_AHB_M_HADDR(15)           <= MDDR_SMC_AHB_M_HADDR_15_net_0(15);
 MDDR_SMC_AHB_M_HADDR_14_net_0(16)  <= MDDR_SMC_AHB_M_HADDR_14(16);
 MDDR_SMC_AHB_M_HADDR(16)           <= MDDR_SMC_AHB_M_HADDR_14_net_0(16);
 MDDR_SMC_AHB_M_HADDR_13_net_0(17)  <= MDDR_SMC_AHB_M_HADDR_13(17);
 MDDR_SMC_AHB_M_HADDR(17)           <= MDDR_SMC_AHB_M_HADDR_13_net_0(17);
 MDDR_SMC_AHB_M_HADDR_12_net_0(18)  <= MDDR_SMC_AHB_M_HADDR_12(18);
 MDDR_SMC_AHB_M_HADDR(18)           <= MDDR_SMC_AHB_M_HADDR_12_net_0(18);
 MDDR_SMC_AHB_M_HADDR_11_net_0(19)  <= MDDR_SMC_AHB_M_HADDR_11(19);
 MDDR_SMC_AHB_M_HADDR(19)           <= MDDR_SMC_AHB_M_HADDR_11_net_0(19);
 MDDR_SMC_AHB_M_HADDR_29_net_0(1)   <= MDDR_SMC_AHB_M_HADDR_29(1);
 MDDR_SMC_AHB_M_HADDR(1)            <= MDDR_SMC_AHB_M_HADDR_29_net_0(1);
 MDDR_SMC_AHB_M_HADDR_10_net_0(20)  <= MDDR_SMC_AHB_M_HADDR_10(20);
 MDDR_SMC_AHB_M_HADDR(20)           <= MDDR_SMC_AHB_M_HADDR_10_net_0(20);
 MDDR_SMC_AHB_M_HADDR_9_net_0(21)   <= MDDR_SMC_AHB_M_HADDR_9(21);
 MDDR_SMC_AHB_M_HADDR(21)           <= MDDR_SMC_AHB_M_HADDR_9_net_0(21);
 MDDR_SMC_AHB_M_HADDR_8_net_0(22)   <= MDDR_SMC_AHB_M_HADDR_8(22);
 MDDR_SMC_AHB_M_HADDR(22)           <= MDDR_SMC_AHB_M_HADDR_8_net_0(22);
 MDDR_SMC_AHB_M_HADDR_7_net_0(23)   <= MDDR_SMC_AHB_M_HADDR_7(23);
 MDDR_SMC_AHB_M_HADDR(23)           <= MDDR_SMC_AHB_M_HADDR_7_net_0(23);
 MDDR_SMC_AHB_M_HADDR_6_net_0(24)   <= MDDR_SMC_AHB_M_HADDR_6(24);
 MDDR_SMC_AHB_M_HADDR(24)           <= MDDR_SMC_AHB_M_HADDR_6_net_0(24);
 MDDR_SMC_AHB_M_HADDR_5_net_0(25)   <= MDDR_SMC_AHB_M_HADDR_5(25);
 MDDR_SMC_AHB_M_HADDR(25)           <= MDDR_SMC_AHB_M_HADDR_5_net_0(25);
 MDDR_SMC_AHB_M_HADDR_4_net_0(26)   <= MDDR_SMC_AHB_M_HADDR_4(26);
 MDDR_SMC_AHB_M_HADDR(26)           <= MDDR_SMC_AHB_M_HADDR_4_net_0(26);
 MDDR_SMC_AHB_M_HADDR_3_net_0(27)   <= MDDR_SMC_AHB_M_HADDR_3(27);
 MDDR_SMC_AHB_M_HADDR(27)           <= MDDR_SMC_AHB_M_HADDR_3_net_0(27);
 MDDR_SMC_AHB_M_HADDR_2_net_0(28)   <= MDDR_SMC_AHB_M_HADDR_2(28);
 MDDR_SMC_AHB_M_HADDR(28)           <= MDDR_SMC_AHB_M_HADDR_2_net_0(28);
 MDDR_SMC_AHB_M_HADDR_1_net_0(29)   <= MDDR_SMC_AHB_M_HADDR_1(29);
 MDDR_SMC_AHB_M_HADDR(29)           <= MDDR_SMC_AHB_M_HADDR_1_net_0(29);
 MDDR_SMC_AHB_M_HADDR_28_net_0(2)   <= MDDR_SMC_AHB_M_HADDR_28(2);
 MDDR_SMC_AHB_M_HADDR(2)            <= MDDR_SMC_AHB_M_HADDR_28_net_0(2);
 MDDR_SMC_AHB_M_HADDR_0_net_0(30)   <= MDDR_SMC_AHB_M_HADDR_0(30);
 MDDR_SMC_AHB_M_HADDR(30)           <= MDDR_SMC_AHB_M_HADDR_0_net_0(30);
 MDDR_SMC_AHB_M_HADDR_net_1(31)     <= MDDR_SMC_AHB_M_HADDR_net_0(31);
 MDDR_SMC_AHB_M_HADDR(31)           <= MDDR_SMC_AHB_M_HADDR_net_1(31);
 MDDR_SMC_AHB_M_HADDR_27_net_0(3)   <= MDDR_SMC_AHB_M_HADDR_27(3);
 MDDR_SMC_AHB_M_HADDR(3)            <= MDDR_SMC_AHB_M_HADDR_27_net_0(3);
 MDDR_SMC_AHB_M_HADDR_26_net_0(4)   <= MDDR_SMC_AHB_M_HADDR_26(4);
 MDDR_SMC_AHB_M_HADDR(4)            <= MDDR_SMC_AHB_M_HADDR_26_net_0(4);
 MDDR_SMC_AHB_M_HADDR_25_net_0(5)   <= MDDR_SMC_AHB_M_HADDR_25(5);
 MDDR_SMC_AHB_M_HADDR(5)            <= MDDR_SMC_AHB_M_HADDR_25_net_0(5);
 MDDR_SMC_AHB_M_HADDR_24_net_0(6)   <= MDDR_SMC_AHB_M_HADDR_24(6);
 MDDR_SMC_AHB_M_HADDR(6)            <= MDDR_SMC_AHB_M_HADDR_24_net_0(6);
 MDDR_SMC_AHB_M_HADDR_23_net_0(7)   <= MDDR_SMC_AHB_M_HADDR_23(7);
 MDDR_SMC_AHB_M_HADDR(7)            <= MDDR_SMC_AHB_M_HADDR_23_net_0(7);
 MDDR_SMC_AHB_M_HADDR_22_net_0(8)   <= MDDR_SMC_AHB_M_HADDR_22(8);
 MDDR_SMC_AHB_M_HADDR(8)            <= MDDR_SMC_AHB_M_HADDR_22_net_0(8);
 MDDR_SMC_AHB_M_HADDR_21_net_0(9)   <= MDDR_SMC_AHB_M_HADDR_21(9);
 MDDR_SMC_AHB_M_HADDR(9)            <= MDDR_SMC_AHB_M_HADDR_21_net_0(9);
 FIC_2_APB_MASTER_0_PADDR_net_0     <= FIC_2_APB_MASTER_0_PADDR;
 FIC_2_APB_M_PADDR(15 downto 2)     <= FIC_2_APB_MASTER_0_PADDR_net_0;
 FIC_2_APB_MASTER_0_PWDATA_net_0    <= FIC_2_APB_MASTER_0_PWDATA;
 FIC_2_APB_M_PWDATA(31 downto 0)    <= FIC_2_APB_MASTER_0_PWDATA_net_0;
----------------------------------------------------------------------
-- Slices assignments
----------------------------------------------------------------------
 MDDR_SMC_AHB_M_HADDR_net_0(31)     <= F_RDATA_HRDATA01_net_0(31);
 MDDR_SMC_AHB_M_HADDR_0(30)         <= F_RDATA_HRDATA01_net_0(30);
 MDDR_SMC_AHB_M_HADDR_1(29)         <= F_RDATA_HRDATA01_net_0(29);
 MDDR_SMC_AHB_M_HADDR_2(28)         <= F_RDATA_HRDATA01_net_0(28);
 MDDR_SMC_AHB_M_HADDR_3(27)         <= F_RDATA_HRDATA01_net_0(27);
 MDDR_SMC_AHB_M_HADDR_4(26)         <= F_RDATA_HRDATA01_net_0(26);
 MDDR_SMC_AHB_M_HADDR_5(25)         <= F_RDATA_HRDATA01_net_0(25);
 MDDR_SMC_AHB_M_HADDR_6(24)         <= F_RDATA_HRDATA01_net_0(24);
 MDDR_SMC_AHB_M_HADDR_7(23)         <= F_RDATA_HRDATA01_net_0(23);
 MDDR_SMC_AHB_M_HADDR_8(22)         <= F_RDATA_HRDATA01_net_0(22);
 MDDR_SMC_AHB_M_HADDR_9(21)         <= F_RDATA_HRDATA01_net_0(21);
 MDDR_SMC_AHB_M_HADDR_10(20)        <= F_RDATA_HRDATA01_net_0(20);
 MDDR_SMC_AHB_M_HADDR_11(19)        <= F_RDATA_HRDATA01_net_0(19);
 MDDR_SMC_AHB_M_HADDR_12(18)        <= F_RDATA_HRDATA01_net_0(18);
 MDDR_SMC_AHB_M_HADDR_13(17)        <= F_RDATA_HRDATA01_net_0(17);
 MDDR_SMC_AHB_M_HADDR_14(16)        <= F_RDATA_HRDATA01_net_0(16);
 MDDR_SMC_AHB_M_HADDR_15(15)        <= F_RDATA_HRDATA01_net_0(15);
 MDDR_SMC_AHB_M_HADDR_16(14)        <= F_RDATA_HRDATA01_net_0(14);
 MDDR_SMC_AHB_M_HADDR_17(13)        <= F_RDATA_HRDATA01_net_0(13);
 MDDR_SMC_AHB_M_HADDR_18(12)        <= F_RDATA_HRDATA01_net_0(12);
 MDDR_SMC_AHB_M_HADDR_19(11)        <= F_RDATA_HRDATA01_net_0(11);
 MDDR_SMC_AHB_M_HADDR_20(10)        <= F_RDATA_HRDATA01_net_0(10);
 MDDR_SMC_AHB_M_HADDR_21(9)         <= F_RDATA_HRDATA01_net_0(9);
 MDDR_SMC_AHB_M_HADDR_22(8)         <= F_RDATA_HRDATA01_net_0(8);
 MDDR_SMC_AHB_M_HADDR_23(7)         <= F_RDATA_HRDATA01_net_0(7);
 MDDR_SMC_AHB_M_HADDR_24(6)         <= F_RDATA_HRDATA01_net_0(6);
 MDDR_SMC_AHB_M_HADDR_25(5)         <= F_RDATA_HRDATA01_net_0(5);
 MDDR_SMC_AHB_M_HADDR_26(4)         <= F_RDATA_HRDATA01_net_0(4);
 MDDR_SMC_AHB_M_HADDR_27(3)         <= F_RDATA_HRDATA01_net_0(3);
 MDDR_SMC_AHB_M_HADDR_28(2)         <= F_RDATA_HRDATA01_net_0(2);
 MDDR_SMC_AHB_M_HADDR_29(1)         <= F_RDATA_HRDATA01_net_0(1);
 MDDR_SMC_AHB_M_HADDR_30(0)         <= F_RDATA_HRDATA01_net_0(0);
 MDDR_SMC_AHB_M_HBURST_net_0(2)     <= F_BID_net_0(2);
 MDDR_SMC_AHB_M_HBURST_0(1)         <= F_BID_net_0(1);
 MDDR_SMC_AHB_M_HBURST_1(0)         <= F_BID_net_0(0);
 MDDR_SMC_AHB_M_HRDATA_slice_0(31)  <= MDDR_SMC_AHB_M_HRDATA(31);
 MDDR_SMC_AHB_M_HRDATA_slice_1(30)  <= MDDR_SMC_AHB_M_HRDATA(30);
 MDDR_SMC_AHB_M_HRDATA_slice_2(29)  <= MDDR_SMC_AHB_M_HRDATA(29);
 MDDR_SMC_AHB_M_HRDATA_slice_3(28)  <= MDDR_SMC_AHB_M_HRDATA(28);
 MDDR_SMC_AHB_M_HRDATA_slice_4(27)  <= MDDR_SMC_AHB_M_HRDATA(27);
 MDDR_SMC_AHB_M_HRDATA_slice_5(26)  <= MDDR_SMC_AHB_M_HRDATA(26);
 MDDR_SMC_AHB_M_HRDATA_slice_6(25)  <= MDDR_SMC_AHB_M_HRDATA(25);
 MDDR_SMC_AHB_M_HRDATA_slice_7(24)  <= MDDR_SMC_AHB_M_HRDATA(24);
 MDDR_SMC_AHB_M_HRDATA_slice_8(23)  <= MDDR_SMC_AHB_M_HRDATA(23);
 MDDR_SMC_AHB_M_HRDATA_slice_9(22)  <= MDDR_SMC_AHB_M_HRDATA(22);
 MDDR_SMC_AHB_M_HRDATA_slice_10(21) <= MDDR_SMC_AHB_M_HRDATA(21);
 MDDR_SMC_AHB_M_HRDATA_slice_11(20) <= MDDR_SMC_AHB_M_HRDATA(20);
 MDDR_SMC_AHB_M_HRDATA_slice_12(19) <= MDDR_SMC_AHB_M_HRDATA(19);
 MDDR_SMC_AHB_M_HRDATA_slice_13(18) <= MDDR_SMC_AHB_M_HRDATA(18);
 MDDR_SMC_AHB_M_HRDATA_slice_14(17) <= MDDR_SMC_AHB_M_HRDATA(17);
 MDDR_SMC_AHB_M_HRDATA_slice_15(16) <= MDDR_SMC_AHB_M_HRDATA(16);
 MDDR_SMC_AHB_M_HRDATA_slice_16(15) <= MDDR_SMC_AHB_M_HRDATA(15);
 MDDR_SMC_AHB_M_HRDATA_slice_17(14) <= MDDR_SMC_AHB_M_HRDATA(14);
 MDDR_SMC_AHB_M_HRDATA_slice_18(13) <= MDDR_SMC_AHB_M_HRDATA(13);
 MDDR_SMC_AHB_M_HRDATA_slice_19(12) <= MDDR_SMC_AHB_M_HRDATA(12);
 MDDR_SMC_AHB_M_HRDATA_slice_20(11) <= MDDR_SMC_AHB_M_HRDATA(11);
 MDDR_SMC_AHB_M_HRDATA_slice_21(10) <= MDDR_SMC_AHB_M_HRDATA(10);
 MDDR_SMC_AHB_M_HRDATA_slice_22(9)  <= MDDR_SMC_AHB_M_HRDATA(9);
 MDDR_SMC_AHB_M_HRDATA_slice_23(8)  <= MDDR_SMC_AHB_M_HRDATA(8);
 MDDR_SMC_AHB_M_HRDATA_slice_24(7)  <= MDDR_SMC_AHB_M_HRDATA(7);
 MDDR_SMC_AHB_M_HRDATA_slice_25(6)  <= MDDR_SMC_AHB_M_HRDATA(6);
 MDDR_SMC_AHB_M_HRDATA_slice_26(5)  <= MDDR_SMC_AHB_M_HRDATA(5);
 MDDR_SMC_AHB_M_HRDATA_slice_27(4)  <= MDDR_SMC_AHB_M_HRDATA(4);
 MDDR_SMC_AHB_M_HRDATA_slice_28(3)  <= MDDR_SMC_AHB_M_HRDATA(3);
 MDDR_SMC_AHB_M_HRDATA_slice_29(2)  <= MDDR_SMC_AHB_M_HRDATA(2);
 MDDR_SMC_AHB_M_HRDATA_slice_30(1)  <= MDDR_SMC_AHB_M_HRDATA(1);
 MDDR_SMC_AHB_M_HRDATA_slice_31(0)  <= MDDR_SMC_AHB_M_HRDATA(0);
 MDDR_SMC_AHB_M_HSIZE_net_0(1)      <= F_RID_net_0(1);
 MDDR_SMC_AHB_M_HSIZE_0(0)          <= F_RID_net_0(0);
 MDDR_SMC_AHB_M_HWDATA_net_0(63)    <= F_RDATA_HRDATA01_net_0(63);
 MDDR_SMC_AHB_M_HWDATA_0(62)        <= F_RDATA_HRDATA01_net_0(62);
 MDDR_SMC_AHB_M_HWDATA_1(61)        <= F_RDATA_HRDATA01_net_0(61);
 MDDR_SMC_AHB_M_HWDATA_2(60)        <= F_RDATA_HRDATA01_net_0(60);
 MDDR_SMC_AHB_M_HWDATA_3(59)        <= F_RDATA_HRDATA01_net_0(59);
 MDDR_SMC_AHB_M_HWDATA_4(58)        <= F_RDATA_HRDATA01_net_0(58);
 MDDR_SMC_AHB_M_HWDATA_5(57)        <= F_RDATA_HRDATA01_net_0(57);
 MDDR_SMC_AHB_M_HWDATA_6(56)        <= F_RDATA_HRDATA01_net_0(56);
 MDDR_SMC_AHB_M_HWDATA_7(55)        <= F_RDATA_HRDATA01_net_0(55);
 MDDR_SMC_AHB_M_HWDATA_8(54)        <= F_RDATA_HRDATA01_net_0(54);
 MDDR_SMC_AHB_M_HWDATA_9(53)        <= F_RDATA_HRDATA01_net_0(53);
 MDDR_SMC_AHB_M_HWDATA_10(52)       <= F_RDATA_HRDATA01_net_0(52);
 MDDR_SMC_AHB_M_HWDATA_11(51)       <= F_RDATA_HRDATA01_net_0(51);
 MDDR_SMC_AHB_M_HWDATA_12(50)       <= F_RDATA_HRDATA01_net_0(50);
 MDDR_SMC_AHB_M_HWDATA_13(49)       <= F_RDATA_HRDATA01_net_0(49);
 MDDR_SMC_AHB_M_HWDATA_14(48)       <= F_RDATA_HRDATA01_net_0(48);
 MDDR_SMC_AHB_M_HWDATA_15(47)       <= F_RDATA_HRDATA01_net_0(47);
 MDDR_SMC_AHB_M_HWDATA_16(46)       <= F_RDATA_HRDATA01_net_0(46);
 MDDR_SMC_AHB_M_HWDATA_17(45)       <= F_RDATA_HRDATA01_net_0(45);
 MDDR_SMC_AHB_M_HWDATA_18(44)       <= F_RDATA_HRDATA01_net_0(44);
 MDDR_SMC_AHB_M_HWDATA_19(43)       <= F_RDATA_HRDATA01_net_0(43);
 MDDR_SMC_AHB_M_HWDATA_20(42)       <= F_RDATA_HRDATA01_net_0(42);
 MDDR_SMC_AHB_M_HWDATA_21(41)       <= F_RDATA_HRDATA01_net_0(41);
 MDDR_SMC_AHB_M_HWDATA_22(40)       <= F_RDATA_HRDATA01_net_0(40);
 MDDR_SMC_AHB_M_HWDATA_23(39)       <= F_RDATA_HRDATA01_net_0(39);
 MDDR_SMC_AHB_M_HWDATA_24(38)       <= F_RDATA_HRDATA01_net_0(38);
 MDDR_SMC_AHB_M_HWDATA_25(37)       <= F_RDATA_HRDATA01_net_0(37);
 MDDR_SMC_AHB_M_HWDATA_26(36)       <= F_RDATA_HRDATA01_net_0(36);
 MDDR_SMC_AHB_M_HWDATA_27(35)       <= F_RDATA_HRDATA01_net_0(35);
 MDDR_SMC_AHB_M_HWDATA_28(34)       <= F_RDATA_HRDATA01_net_0(34);
 MDDR_SMC_AHB_M_HWDATA_29(33)       <= F_RDATA_HRDATA01_net_0(33);
 MDDR_SMC_AHB_M_HWDATA_30(32)       <= F_RDATA_HRDATA01_net_0(32);
 F_BID_slice_0(3)                   <= F_BID_net_0(3);
 F_RID_slice_0(2)                   <= F_RID_net_0(2);
 F_RID_slice_1(3)                   <= F_RID_net_0(3);
----------------------------------------------------------------------
-- Concatenation assignments
----------------------------------------------------------------------
 F_AWLOCK_HMASTLOCK0_net_0 <= ( '0' & MDDR_SMC_AHB_M_HRESP );
 F_WDATA_HWDATA01_net_0    <= ( '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1' & MDDR_SMC_AHB_M_HRDATA_slice_0(31) & MDDR_SMC_AHB_M_HRDATA_slice_1(30) & MDDR_SMC_AHB_M_HRDATA_slice_2(29) & MDDR_SMC_AHB_M_HRDATA_slice_3(28) & MDDR_SMC_AHB_M_HRDATA_slice_4(27) & MDDR_SMC_AHB_M_HRDATA_slice_5(26) & MDDR_SMC_AHB_M_HRDATA_slice_6(25) & MDDR_SMC_AHB_M_HRDATA_slice_7(24) & MDDR_SMC_AHB_M_HRDATA_slice_8(23) & MDDR_SMC_AHB_M_HRDATA_slice_9(22) & MDDR_SMC_AHB_M_HRDATA_slice_10(21) & MDDR_SMC_AHB_M_HRDATA_slice_11(20) & MDDR_SMC_AHB_M_HRDATA_slice_12(19) & MDDR_SMC_AHB_M_HRDATA_slice_13(18) & MDDR_SMC_AHB_M_HRDATA_slice_14(17) & MDDR_SMC_AHB_M_HRDATA_slice_15(16) & MDDR_SMC_AHB_M_HRDATA_slice_16(15) & MDDR_SMC_AHB_M_HRDATA_slice_17(14) & MDDR_SMC_AHB_M_HRDATA_slice_18(13) & MDDR_SMC_AHB_M_HRDATA_slice_19(12) & MDDR_SMC_AHB_M_HRDATA_slice_20(11) & MDDR_SMC_AHB_M_HRDATA_slice_21(10) & MDDR_SMC_AHB_M_HRDATA_slice_22(9) & MDDR_SMC_AHB_M_HRDATA_slice_23(8) & MDDR_SMC_AHB_M_HRDATA_slice_24(7) & MDDR_SMC_AHB_M_HRDATA_slice_25(6) & MDDR_SMC_AHB_M_HRDATA_slice_26(5) & MDDR_SMC_AHB_M_HRDATA_slice_27(4) & MDDR_SMC_AHB_M_HRDATA_slice_28(3) & MDDR_SMC_AHB_M_HRDATA_slice_29(2) & MDDR_SMC_AHB_M_HRDATA_slice_30(1) & MDDR_SMC_AHB_M_HRDATA_slice_31(0) );
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- GPIO_GPIO_8_OUT_PAD
GPIO_GPIO_8_OUT_PAD : OUTBUF
    port map( 
        -- Inputs
        D   => MSS_ADLIB_INST_SPI0_SS1_USBA_DATA5_MGPIO8A_OUT,
        -- Outputs
        PAD => GPIO_8_OUT_net_0 
        );
-- GPIO_GPIO_9_OUT_PAD
GPIO_GPIO_9_OUT_PAD : OUTBUF
    port map( 
        -- Inputs
        D   => MSS_ADLIB_INST_SPI0_SS2_USBA_DATA6_MGPIO9A_OUT,
        -- Outputs
        PAD => GPIO_9_OUT_net_0 
        );
-- GPIO_GPIO_10_OUT_PAD
GPIO_GPIO_10_OUT_PAD : OUTBUF
    port map( 
        -- Inputs
        D   => MSS_ADLIB_INST_SPI0_SS3_USBA_DATA7_MGPIO10A_OUT,
        -- Outputs
        PAD => GPIO_10_OUT_net_0 
        );
-- GPIO_GPIO_11_OUT_PAD
GPIO_GPIO_11_OUT_PAD : OUTBUF
    port map( 
        -- Inputs
        D   => MSS_ADLIB_INST_SPI1_SDI_MGPIO11A_OUT,
        -- Outputs
        PAD => GPIO_11_OUT_net_0 
        );
-- GPIO_GPIO_12_OUT_PAD
GPIO_GPIO_12_OUT_PAD : OUTBUF
    port map( 
        -- Inputs
        D   => MSS_ADLIB_INST_SPI1_SDO_MGPIO12A_OUT,
        -- Outputs
        PAD => GPIO_12_OUT_net_0 
        );
-- GPIO_GPIO_13_OUT_PAD
GPIO_GPIO_13_OUT_PAD : OUTBUF
    port map( 
        -- Inputs
        D   => MSS_ADLIB_INST_SPI1_SS0_MGPIO13A_OUT,
        -- Outputs
        PAD => GPIO_13_OUT_net_0 
        );
-- GPIO_GPIO_14_OUT_PAD
GPIO_GPIO_14_OUT_PAD : OUTBUF
    port map( 
        -- Inputs
        D   => MSS_ADLIB_INST_SPI1_SS1_MGPIO14A_OUT,
        -- Outputs
        PAD => GPIO_14_OUT_net_0 
        );
-- GPIO_GPIO_15_OUT_PAD
GPIO_GPIO_15_OUT_PAD : OUTBUF
    port map( 
        -- Inputs
        D   => MSS_ADLIB_INST_SPI1_SS2_MGPIO15A_OUT,
        -- Outputs
        PAD => GPIO_15_OUT_net_0 
        );
-- GPIO_GPIO_16_OUT_PAD
GPIO_GPIO_16_OUT_PAD : OUTBUF
    port map( 
        -- Inputs
        D   => MSS_ADLIB_INST_SPI1_SS3_MGPIO16A_OUT,
        -- Outputs
        PAD => GPIO_16_OUT_net_0 
        );
-- GPIO_GPIO_25_OUT_PAD
GPIO_GPIO_25_OUT_PAD : OUTBUF
    port map( 
        -- Inputs
        D   => MSS_ADLIB_INST_MMUART1_SCK_USBC_DATA4_MGPIO25B_OUT,
        -- Outputs
        PAD => GPIO_25_OUT_net_0 
        );
-- GPIO_GPIO_29_IN_PAD
GPIO_GPIO_29_IN_PAD : INBUF
    port map( 
        -- Inputs
        PAD => GPIO_29_IN,
        -- Outputs
        Y   => GPIO_GPIO_29_IN_PAD_Y 
        );
-- MMUART_0_RXD_PAD
MMUART_0_RXD_PAD : INBUF
    port map( 
        -- Inputs
        PAD => MMUART_0_RXD,
        -- Outputs
        Y   => MMUART_0_RXD_PAD_Y 
        );
-- MMUART_0_TXD_PAD
MMUART_0_TXD_PAD : TRIBUFF
    port map( 
        -- Inputs
        D   => MSS_ADLIB_INST_MMUART0_TXD_USBC_DIR_MGPIO27B_OUT,
        E   => MSS_ADLIB_INST_MMUART0_TXD_USBC_DIR_MGPIO27B_OE,
        -- Outputs
        PAD => MMUART_0_TXD_net_0 
        );
-- MSS_ADLIB_INST
MSS_ADLIB_INST : MSS_010
    generic map( 
        ACT_UBITS         => ( x"FFFFFFFFFFFFFF" ),
        DDR_CLK_FREQ      => ( 100.0 ),
        INIT              => ( "00" & x"0000000D8B612000000000000000000090000000000000000000000000000090240902409024000000000009024090000000000000000000000000000000000000000000000000F00000000F000000000000000000000000000000007FFFFFFFB000001007C37C000200006092C0104003FFFFE0000000000000320000000F0F01C000000025FC4010842108421000001FE34001FF8000000480000000020091007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF" ),
        MEMORYFILE        => ( "ENVM_init.mem" ),
        RTC_MAIN_XTL_FREQ => ( 0.0 ),
        RTC_MAIN_XTL_MODE => ( "" )
        )
    port map( 
        -- Inputs
        CAN_RXBUS_F2H_SCP                       => VCC_net, -- tied to '1' from definition
        CAN_TX_EBL_F2H_SCP                      => VCC_net, -- tied to '1' from definition
        CAN_TXBUS_F2H_SCP                       => VCC_net, -- tied to '1' from definition
        COLF                                    => VCC_net, -- tied to '1' from definition
        CRSF                                    => VCC_net, -- tied to '1' from definition
        F2_DMAREADY                             => F2_DMAREADY_const_net_0, -- tied to X"1" from definition
        F2H_INTERRUPT                           => F2H_INTERRUPT_const_net_0, -- tied to X"0" from definition
        F2HCALIB                                => VCC_net, -- tied to '1' from definition
        F_DMAREADY                              => F_DMAREADY_const_net_0, -- tied to X"1" from definition
        F_FM0_ADDR                              => F_FM0_ADDR_const_net_0, -- tied to X"0" from definition
        F_FM0_ENABLE                            => GND_net, -- tied to '0' from definition
        F_FM0_MASTLOCK                          => GND_net, -- tied to '0' from definition
        F_FM0_READY                             => VCC_net, -- tied to '1' from definition
        F_FM0_SEL                               => GND_net, -- tied to '0' from definition
        F_FM0_SIZE                              => F_FM0_SIZE_const_net_0, -- tied to X"0" from definition
        F_FM0_TRANS1                            => GND_net, -- tied to '0' from definition
        F_FM0_WDATA                             => F_FM0_WDATA_const_net_0, -- tied to X"0" from definition
        F_FM0_WRITE                             => GND_net, -- tied to '0' from definition
        F_HM0_RDATA                             => F_HM0_RDATA_const_net_0, -- tied to X"0" from definition
        F_HM0_READY                             => VCC_net, -- tied to '1' from definition
        F_HM0_RESP                              => GND_net, -- tied to '0' from definition
        FAB_AVALID                              => VCC_net, -- tied to '1' from definition
        FAB_HOSTDISCON                          => VCC_net, -- tied to '1' from definition
        FAB_IDDIG                               => VCC_net, -- tied to '1' from definition
        FAB_LINESTATE                           => FAB_LINESTATE_const_net_0, -- tied to X"1" from definition
        FAB_M3_RESET_N                          => VCC_net, -- tied to '1' from definition
        FAB_PLL_LOCK                            => MCCC_CLK_BASE_PLL_LOCK,
        FAB_RXACTIVE                            => VCC_net, -- tied to '1' from definition
        FAB_RXERROR                             => VCC_net, -- tied to '1' from definition
        FAB_RXVALID                             => VCC_net, -- tied to '1' from definition
        FAB_RXVALIDH                            => GND_net, -- tied to '0' from definition
        FAB_SESSEND                             => VCC_net, -- tied to '1' from definition
        FAB_TXREADY                             => VCC_net, -- tied to '1' from definition
        FAB_VBUSVALID                           => VCC_net, -- tied to '1' from definition
        FAB_VSTATUS                             => FAB_VSTATUS_const_net_0, -- tied to X"1" from definition
        FAB_XDATAIN                             => FAB_XDATAIN_const_net_0, -- tied to X"1" from definition
        GTX_CLKPF                               => VCC_net, -- tied to '1' from definition
        I2C0_BCLK                               => VCC_net, -- tied to '1' from definition
        I2C0_SCL_F2H_SCP                        => VCC_net, -- tied to '1' from definition
        I2C0_SDA_F2H_SCP                        => VCC_net, -- tied to '1' from definition
        I2C1_BCLK                               => VCC_net, -- tied to '1' from definition
        I2C1_SCL_F2H_SCP                        => VCC_net, -- tied to '1' from definition
        I2C1_SDA_F2H_SCP                        => VCC_net, -- tied to '1' from definition
        MDIF                                    => VCC_net, -- tied to '1' from definition
        MGPIO0A_F2H_GPIN                        => VCC_net, -- tied to '1' from definition
        MGPIO10A_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO11A_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO11B_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO12A_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO13A_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO14A_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO15A_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO16A_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO17B_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO18B_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO19B_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO1A_F2H_GPIN                        => VCC_net, -- tied to '1' from definition
        MGPIO20B_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO21B_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO22B_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO24B_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO25B_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO26B_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO27B_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO28B_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO29B_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO2A_F2H_GPIN                        => VCC_net, -- tied to '1' from definition
        MGPIO30B_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO31B_F2H_GPIN                       => VCC_net, -- tied to '1' from definition
        MGPIO3A_F2H_GPIN                        => VCC_net, -- tied to '1' from definition
        MGPIO4A_F2H_GPIN                        => VCC_net, -- tied to '1' from definition
        MGPIO5A_F2H_GPIN                        => VCC_net, -- tied to '1' from definition
        MGPIO6A_F2H_GPIN                        => VCC_net, -- tied to '1' from definition
        MGPIO7A_F2H_GPIN                        => VCC_net, -- tied to '1' from definition
        MGPIO8A_F2H_GPIN                        => VCC_net, -- tied to '1' from definition
        MGPIO9A_F2H_GPIN                        => VCC_net, -- tied to '1' from definition
        MMUART0_CTS_F2H_SCP                     => VCC_net, -- tied to '1' from definition
        MMUART0_DCD_F2H_SCP                     => VCC_net, -- tied to '1' from definition
        MMUART0_DSR_F2H_SCP                     => VCC_net, -- tied to '1' from definition
        MMUART0_DTR_F2H_SCP                     => VCC_net, -- tied to '1' from definition
        MMUART0_RI_F2H_SCP                      => VCC_net, -- tied to '1' from definition
        MMUART0_RTS_F2H_SCP                     => VCC_net, -- tied to '1' from definition
        MMUART0_RXD_F2H_SCP                     => VCC_net, -- tied to '1' from definition
        MMUART0_SCK_F2H_SCP                     => VCC_net, -- tied to '1' from definition
        MMUART0_TXD_F2H_SCP                     => VCC_net, -- tied to '1' from definition
        MMUART1_CTS_F2H_SCP                     => VCC_net, -- tied to '1' from definition
        MMUART1_DCD_F2H_SCP                     => VCC_net, -- tied to '1' from definition
        MMUART1_DSR_F2H_SCP                     => VCC_net, -- tied to '1' from definition
        MMUART1_RI_F2H_SCP                      => VCC_net, -- tied to '1' from definition
        MMUART1_RTS_F2H_SCP                     => VCC_net, -- tied to '1' from definition
        MMUART1_RXD_F2H_SCP                     => VCC_net, -- tied to '1' from definition
        MMUART1_SCK_F2H_SCP                     => VCC_net, -- tied to '1' from definition
        MMUART1_TXD_F2H_SCP                     => VCC_net, -- tied to '1' from definition
        PER2_FABRIC_PRDATA                      => FIC_2_APB_M_PRDATA,
        PER2_FABRIC_PREADY                      => FIC_2_APB_M_PREADY,
        PER2_FABRIC_PSLVERR                     => FIC_2_APB_M_PSLVERR,
        RCGF                                    => RCGF_const_net_0, -- tied to X"1" from definition
        RX_CLKPF                                => VCC_net, -- tied to '1' from definition
        RX_DVF                                  => VCC_net, -- tied to '1' from definition
        RX_ERRF                                 => VCC_net, -- tied to '1' from definition
        RX_EV                                   => VCC_net, -- tied to '1' from definition
        RXDF                                    => RXDF_const_net_0, -- tied to X"1" from definition
        SLEEPHOLDREQ                            => GND_net, -- tied to '0' from definition
        SMBALERT_NI0                            => VCC_net, -- tied to '1' from definition
        SMBALERT_NI1                            => VCC_net, -- tied to '1' from definition
        SMBSUS_NI0                              => VCC_net, -- tied to '1' from definition
        SMBSUS_NI1                              => VCC_net, -- tied to '1' from definition
        SPI0_CLK_IN                             => VCC_net, -- tied to '1' from definition
        SPI0_SDI_F2H_SCP                        => VCC_net, -- tied to '1' from definition
        SPI0_SDO_F2H_SCP                        => VCC_net, -- tied to '1' from definition
        SPI0_SS0_F2H_SCP                        => VCC_net, -- tied to '1' from definition
        SPI0_SS1_F2H_SCP                        => VCC_net, -- tied to '1' from definition
        SPI0_SS2_F2H_SCP                        => VCC_net, -- tied to '1' from definition
        SPI0_SS3_F2H_SCP                        => VCC_net, -- tied to '1' from definition
        SPI1_CLK_IN                             => VCC_net, -- tied to '1' from definition
        SPI1_SDI_F2H_SCP                        => VCC_net, -- tied to '1' from definition
        SPI1_SDO_F2H_SCP                        => VCC_net, -- tied to '1' from definition
        SPI1_SS0_F2H_SCP                        => VCC_net, -- tied to '1' from definition
        SPI1_SS1_F2H_SCP                        => VCC_net, -- tied to '1' from definition
        SPI1_SS2_F2H_SCP                        => VCC_net, -- tied to '1' from definition
        SPI1_SS3_F2H_SCP                        => VCC_net, -- tied to '1' from definition
        TX_CLKPF                                => VCC_net, -- tied to '1' from definition
        USER_MSS_GPIO_RESET_N                   => VCC_net, -- tied to '1' from definition
        USER_MSS_RESET_N                        => MSS_RESET_N_F2M,
        XCLK_FAB                                => VCC_net, -- tied to '1' from definition
        CLK_BASE                                => MCCC_CLK_BASE,
        CLK_MDDR_APB                            => VCC_net, -- tied to '1' from definition
        F_ARADDR_HADDR1                         => F_ARADDR_HADDR1_const_net_0, -- tied to X"1" from definition
        F_ARBURST_HTRANS1                       => F_ARBURST_HTRANS1_const_net_0, -- tied to X"0" from definition
        F_ARID_HSEL1                            => F_ARID_HSEL1_const_net_0, -- tied to X"0" from definition
        F_ARLEN_HBURST1                         => F_ARLEN_HBURST1_const_net_0, -- tied to X"0" from definition
        F_ARLOCK_HMASTLOCK1                     => F_ARLOCK_HMASTLOCK1_const_net_0, -- tied to X"0" from definition
        F_ARSIZE_HSIZE1                         => F_ARSIZE_HSIZE1_const_net_0, -- tied to X"0" from definition
        F_ARVALID_HWRITE1                       => GND_net, -- tied to '0' from definition
        F_AWADDR_HADDR0                         => F_AWADDR_HADDR0_const_net_0, -- tied to X"1" from definition
        F_AWBURST_HTRANS0                       => F_AWBURST_HTRANS0_const_net_0, -- tied to X"0" from definition
        F_AWID_HSEL0                            => F_AWID_HSEL0_const_net_0, -- tied to X"0" from definition
        F_AWLEN_HBURST0                         => F_AWLEN_HBURST0_const_net_0, -- tied to X"0" from definition
        F_AWLOCK_HMASTLOCK0                     => F_AWLOCK_HMASTLOCK0_net_0,
        F_AWSIZE_HSIZE0                         => F_AWSIZE_HSIZE0_const_net_0, -- tied to X"0" from definition
        F_AWVALID_HWRITE0                       => GND_net, -- tied to '0' from definition
        F_BREADY                                => GND_net, -- tied to '0' from definition
        F_RMW_AXI                               => GND_net, -- tied to '0' from definition
        F_RREADY                                => GND_net, -- tied to '0' from definition
        F_WDATA_HWDATA01                        => F_WDATA_HWDATA01_net_0,
        F_WID_HREADY01                          => F_WID_HREADY01_const_net_0, -- tied to X"0" from definition
        F_WLAST                                 => MDDR_SMC_AHB_M_HREADY,
        F_WSTRB                                 => F_WSTRB_const_net_0, -- tied to X"0" from definition
        F_WVALID                                => GND_net, -- tied to '0' from definition
        FPGA_MDDR_ARESET_N                      => VCC_net, -- tied to '1' from definition
        MDDR_FABRIC_PADDR                       => MDDR_FABRIC_PADDR_const_net_0, -- tied to X"1" from definition
        MDDR_FABRIC_PENABLE                     => VCC_net, -- tied to '1' from definition
        MDDR_FABRIC_PSEL                        => VCC_net, -- tied to '1' from definition
        MDDR_FABRIC_PWDATA                      => MDDR_FABRIC_PWDATA_const_net_0, -- tied to X"1" from definition
        MDDR_FABRIC_PWRITE                      => VCC_net, -- tied to '1' from definition
        PRESET_N                                => GND_net, -- tied to '0' from definition
        CAN_RXBUS_USBA_DATA1_MGPIO3A_IN         => GND_net,
        CAN_TX_EBL_USBA_DATA2_MGPIO4A_IN        => GND_net,
        CAN_TXBUS_USBA_DATA0_MGPIO2A_IN         => GND_net,
        DM_IN                                   => DM_IN_const_net_0,
        DRAM_DQ_IN                              => DRAM_DQ_IN_const_net_0,
        DRAM_DQS_IN                             => DRAM_DQS_IN_const_net_0,
        DRAM_FIFO_WE_IN                         => DRAM_FIFO_WE_IN_const_net_0,
        I2C0_SCL_USBC_DATA1_MGPIO31B_IN         => GND_net,
        I2C0_SDA_USBC_DATA0_MGPIO30B_IN         => GND_net,
        I2C1_SCL_USBA_DATA4_MGPIO1A_IN          => GND_net,
        I2C1_SDA_USBA_DATA3_MGPIO0A_IN          => GND_net,
        MMUART0_CTS_USBC_DATA7_MGPIO19B_IN      => GND_net,
        MMUART0_DCD_MGPIO22B_IN                 => GND_net,
        MMUART0_DSR_MGPIO20B_IN                 => GND_net,
        MMUART0_DTR_USBC_DATA6_MGPIO18B_IN      => GND_net,
        MMUART0_RI_MGPIO21B_IN                  => GND_net,
        MMUART0_RTS_USBC_DATA5_MGPIO17B_IN      => GND_net,
        MMUART0_RXD_USBC_STP_MGPIO28B_IN        => MMUART_0_RXD_PAD_Y,
        MMUART0_SCK_USBC_NXT_MGPIO29B_IN        => GPIO_GPIO_29_IN_PAD_Y,
        MMUART0_TXD_USBC_DIR_MGPIO27B_IN        => GND_net,
        MMUART1_RXD_USBC_DATA3_MGPIO26B_IN      => GND_net,
        MMUART1_SCK_USBC_DATA4_MGPIO25B_IN      => GND_net,
        MMUART1_TXD_USBC_DATA2_MGPIO24B_IN      => GND_net,
        RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_IN     => GND_net,
        RGMII_MDC_RMII_MDC_IN                   => GND_net,
        RGMII_MDIO_RMII_MDIO_USBB_DATA7_IN      => GND_net,
        RGMII_RX_CLK_IN                         => GND_net,
        RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_IN  => GND_net,
        RGMII_RXD0_RMII_RXD0_USBB_DATA0_IN      => GND_net,
        RGMII_RXD1_RMII_RXD1_USBB_DATA1_IN      => GND_net,
        RGMII_RXD2_RMII_RX_ER_USBB_DATA3_IN     => GND_net,
        RGMII_RXD3_USBB_DATA4_IN                => GND_net,
        RGMII_TX_CLK_IN                         => GND_net,
        RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_IN     => GND_net,
        RGMII_TXD0_RMII_TXD0_USBB_DIR_IN        => GND_net,
        RGMII_TXD1_RMII_TXD1_USBB_STP_IN        => GND_net,
        RGMII_TXD2_USBB_DATA5_IN                => GND_net,
        RGMII_TXD3_USBB_DATA6_IN                => GND_net,
        SPI0_SCK_USBA_XCLK_IN                   => GND_net,
        SPI0_SDI_USBA_DIR_MGPIO5A_IN            => GND_net,
        SPI0_SDO_USBA_STP_MGPIO6A_IN            => GND_net,
        SPI0_SS0_USBA_NXT_MGPIO7A_IN            => GND_net,
        SPI0_SS1_USBA_DATA5_MGPIO8A_IN          => GND_net,
        SPI0_SS2_USBA_DATA6_MGPIO9A_IN          => GND_net,
        SPI0_SS3_USBA_DATA7_MGPIO10A_IN         => GND_net,
        SPI1_SCK_IN                             => GND_net,
        SPI1_SDI_MGPIO11A_IN                    => GND_net,
        SPI1_SDO_MGPIO12A_IN                    => GND_net,
        SPI1_SS0_MGPIO13A_IN                    => GND_net,
        SPI1_SS1_MGPIO14A_IN                    => GND_net,
        SPI1_SS2_MGPIO15A_IN                    => GND_net,
        SPI1_SS3_MGPIO16A_IN                    => GND_net,
        SPI1_SS4_MGPIO17A_IN                    => GND_net,
        SPI1_SS5_MGPIO18A_IN                    => GND_net,
        SPI1_SS6_MGPIO23A_IN                    => GND_net,
        SPI1_SS7_MGPIO24A_IN                    => GND_net,
        USBC_XCLK_IN                            => GND_net,
        -- Outputs
        CAN_RXBUS_MGPIO3A_H2F_A                 => OPEN,
        CAN_RXBUS_MGPIO3A_H2F_B                 => OPEN,
        CAN_TX_EBL_MGPIO4A_H2F_A                => OPEN,
        CAN_TX_EBL_MGPIO4A_H2F_B                => OPEN,
        CAN_TXBUS_MGPIO2A_H2F_A                 => OPEN,
        CAN_TXBUS_MGPIO2A_H2F_B                 => OPEN,
        CLK_CONFIG_APB                          => FIC_2_APB_M_PCLK_0,
        COMMS_INT                               => OPEN,
        CONFIG_PRESET_N                         => FIC_2_APB_M_PRESET_N_0,
        EDAC_ERROR                              => OPEN,
        F_FM0_RDATA                             => OPEN,
        F_FM0_READYOUT                          => OPEN,
        F_FM0_RESP                              => OPEN,
        F_HM0_ADDR                              => OPEN,
        F_HM0_ENABLE                            => OPEN,
        F_HM0_SEL                               => OPEN,
        F_HM0_SIZE                              => OPEN,
        F_HM0_TRANS1                            => OPEN,
        F_HM0_WDATA                             => OPEN,
        F_HM0_WRITE                             => OPEN,
        FAB_CHRGVBUS                            => OPEN,
        FAB_DISCHRGVBUS                         => OPEN,
        FAB_DMPULLDOWN                          => OPEN,
        FAB_DPPULLDOWN                          => OPEN,
        FAB_DRVVBUS                             => OPEN,
        FAB_IDPULLUP                            => OPEN,
        FAB_OPMODE                              => OPEN,
        FAB_SUSPENDM                            => OPEN,
        FAB_TERMSEL                             => OPEN,
        FAB_TXVALID                             => OPEN,
        FAB_VCONTROL                            => OPEN,
        FAB_VCONTROLLOADM                       => OPEN,
        FAB_XCVRSEL                             => OPEN,
        FAB_XDATAOUT                            => OPEN,
        FACC_GLMUX_SEL                          => OPEN,
        FIC32_0_MASTER                          => OPEN,
        FIC32_1_MASTER                          => OPEN,
        FPGA_RESET_N                            => MSS_RESET_N_M2F_net_0,
        GTX_CLK                                 => OPEN,
        H2F_INTERRUPT                           => OPEN,
        H2F_NMI                                 => OPEN,
        H2FCALIB                                => OPEN,
        I2C0_SCL_MGPIO31B_H2F_A                 => OPEN,
        I2C0_SCL_MGPIO31B_H2F_B                 => OPEN,
        I2C0_SDA_MGPIO30B_H2F_A                 => OPEN,
        I2C0_SDA_MGPIO30B_H2F_B                 => OPEN,
        I2C1_SCL_MGPIO1A_H2F_A                  => OPEN,
        I2C1_SCL_MGPIO1A_H2F_B                  => OPEN,
        I2C1_SDA_MGPIO0A_H2F_A                  => OPEN,
        I2C1_SDA_MGPIO0A_H2F_B                  => OPEN,
        MDCF                                    => OPEN,
        MDOENF                                  => OPEN,
        MDOF                                    => OPEN,
        MMUART0_CTS_MGPIO19B_H2F_A              => OPEN,
        MMUART0_CTS_MGPIO19B_H2F_B              => OPEN,
        MMUART0_DCD_MGPIO22B_H2F_A              => OPEN,
        MMUART0_DCD_MGPIO22B_H2F_B              => OPEN,
        MMUART0_DSR_MGPIO20B_H2F_A              => OPEN,
        MMUART0_DSR_MGPIO20B_H2F_B              => OPEN,
        MMUART0_DTR_MGPIO18B_H2F_A              => OPEN,
        MMUART0_DTR_MGPIO18B_H2F_B              => OPEN,
        MMUART0_RI_MGPIO21B_H2F_A               => OPEN,
        MMUART0_RI_MGPIO21B_H2F_B               => OPEN,
        MMUART0_RTS_MGPIO17B_H2F_A              => OPEN,
        MMUART0_RTS_MGPIO17B_H2F_B              => OPEN,
        MMUART0_RXD_MGPIO28B_H2F_A              => OPEN,
        MMUART0_RXD_MGPIO28B_H2F_B              => OPEN,
        MMUART0_SCK_MGPIO29B_H2F_A              => OPEN,
        MMUART0_SCK_MGPIO29B_H2F_B              => OPEN,
        MMUART0_TXD_MGPIO27B_H2F_A              => OPEN,
        MMUART0_TXD_MGPIO27B_H2F_B              => OPEN,
        MMUART1_DTR_MGPIO12B_H2F_A              => OPEN,
        MMUART1_RTS_MGPIO11B_H2F_A              => OPEN,
        MMUART1_RTS_MGPIO11B_H2F_B              => OPEN,
        MMUART1_RXD_MGPIO26B_H2F_A              => OPEN,
        MMUART1_RXD_MGPIO26B_H2F_B              => OPEN,
        MMUART1_SCK_MGPIO25B_H2F_A              => OPEN,
        MMUART1_SCK_MGPIO25B_H2F_B              => OPEN,
        MMUART1_TXD_MGPIO24B_H2F_A              => OPEN,
        MMUART1_TXD_MGPIO24B_H2F_B              => OPEN,
        MPLL_LOCK                               => OPEN,
        PER2_FABRIC_PADDR                       => FIC_2_APB_MASTER_0_PADDR,
        PER2_FABRIC_PENABLE                     => FIC_2_APB_MASTER_0_PENABLE,
        PER2_FABRIC_PSEL                        => FIC_2_APB_MASTER_0_PSELx,
        PER2_FABRIC_PWDATA                      => FIC_2_APB_MASTER_0_PWDATA,
        PER2_FABRIC_PWRITE                      => FIC_2_APB_MASTER_0_PWRITE,
        RTC_MATCH                               => OPEN,
        SLEEPDEEP                               => OPEN,
        SLEEPHOLDACK                            => OPEN,
        SLEEPING                                => OPEN,
        SMBALERT_NO0                            => OPEN,
        SMBALERT_NO1                            => OPEN,
        SMBSUS_NO0                              => OPEN,
        SMBSUS_NO1                              => OPEN,
        SPI0_CLK_OUT                            => OPEN,
        SPI0_SDI_MGPIO5A_H2F_A                  => OPEN,
        SPI0_SDI_MGPIO5A_H2F_B                  => OPEN,
        SPI0_SDO_MGPIO6A_H2F_A                  => OPEN,
        SPI0_SDO_MGPIO6A_H2F_B                  => OPEN,
        SPI0_SS0_MGPIO7A_H2F_A                  => OPEN,
        SPI0_SS0_MGPIO7A_H2F_B                  => OPEN,
        SPI0_SS1_MGPIO8A_H2F_A                  => OPEN,
        SPI0_SS1_MGPIO8A_H2F_B                  => OPEN,
        SPI0_SS2_MGPIO9A_H2F_A                  => OPEN,
        SPI0_SS2_MGPIO9A_H2F_B                  => OPEN,
        SPI0_SS3_MGPIO10A_H2F_A                 => OPEN,
        SPI0_SS3_MGPIO10A_H2F_B                 => OPEN,
        SPI0_SS4_MGPIO19A_H2F_A                 => OPEN,
        SPI0_SS5_MGPIO20A_H2F_A                 => OPEN,
        SPI0_SS6_MGPIO21A_H2F_A                 => OPEN,
        SPI0_SS7_MGPIO22A_H2F_A                 => OPEN,
        SPI1_CLK_OUT                            => OPEN,
        SPI1_SDI_MGPIO11A_H2F_A                 => OPEN,
        SPI1_SDI_MGPIO11A_H2F_B                 => OPEN,
        SPI1_SDO_MGPIO12A_H2F_A                 => OPEN,
        SPI1_SDO_MGPIO12A_H2F_B                 => OPEN,
        SPI1_SS0_MGPIO13A_H2F_A                 => OPEN,
        SPI1_SS0_MGPIO13A_H2F_B                 => OPEN,
        SPI1_SS1_MGPIO14A_H2F_A                 => OPEN,
        SPI1_SS1_MGPIO14A_H2F_B                 => OPEN,
        SPI1_SS2_MGPIO15A_H2F_A                 => OPEN,
        SPI1_SS2_MGPIO15A_H2F_B                 => OPEN,
        SPI1_SS3_MGPIO16A_H2F_A                 => OPEN,
        SPI1_SS3_MGPIO16A_H2F_B                 => OPEN,
        SPI1_SS4_MGPIO17A_H2F_A                 => OPEN,
        SPI1_SS5_MGPIO18A_H2F_A                 => OPEN,
        SPI1_SS6_MGPIO23A_H2F_A                 => OPEN,
        SPI1_SS7_MGPIO24A_H2F_A                 => OPEN,
        TCGF                                    => OPEN,
        TRACECLK                                => OPEN,
        TRACEDATA                               => OPEN,
        TX_CLK                                  => OPEN,
        TX_ENF                                  => OPEN,
        TX_ERRF                                 => OPEN,
        TXCTL_EN_RIF                            => OPEN,
        TXD_RIF                                 => OPEN,
        TXDF                                    => OPEN,
        TXEV                                    => OPEN,
        WDOGTIMEOUT                             => OPEN,
        F_ARREADY_HREADYOUT1                    => MDDR_SMC_AHB_M_HWRITE_net_0,
        F_AWREADY_HREADYOUT0                    => OPEN,
        F_BID                                   => F_BID_net_0,
        F_BRESP_HRESP0                          => MDDR_SMC_AHB_M_HTRANS_net_0,
        F_BVALID                                => MDDR_SMC_AHB_M_HMASTLOCK_net_0,
        F_RDATA_HRDATA01                        => F_RDATA_HRDATA01_net_0,
        F_RID                                   => F_RID_net_0,
        F_RLAST                                 => OPEN,
        F_RRESP_HRESP1                          => OPEN,
        F_RVALID                                => OPEN,
        F_WREADY                                => OPEN,
        MDDR_FABRIC_PRDATA                      => OPEN,
        MDDR_FABRIC_PREADY                      => OPEN,
        MDDR_FABRIC_PSLVERR                     => OPEN,
        CAN_RXBUS_USBA_DATA1_MGPIO3A_OUT        => OPEN,
        CAN_TX_EBL_USBA_DATA2_MGPIO4A_OUT       => OPEN,
        CAN_TXBUS_USBA_DATA0_MGPIO2A_OUT        => OPEN,
        DRAM_ADDR                               => OPEN,
        DRAM_BA                                 => OPEN,
        DRAM_CASN                               => OPEN,
        DRAM_CKE                                => OPEN,
        DRAM_CLK                                => OPEN,
        DRAM_CSN                                => OPEN,
        DRAM_DM_RDQS_OUT                        => OPEN,
        DRAM_DQ_OUT                             => OPEN,
        DRAM_DQS_OUT                            => OPEN,
        DRAM_FIFO_WE_OUT                        => OPEN,
        DRAM_ODT                                => OPEN,
        DRAM_RASN                               => OPEN,
        DRAM_RSTN                               => OPEN,
        DRAM_WEN                                => OPEN,
        I2C0_SCL_USBC_DATA1_MGPIO31B_OUT        => OPEN,
        I2C0_SDA_USBC_DATA0_MGPIO30B_OUT        => OPEN,
        I2C1_SCL_USBA_DATA4_MGPIO1A_OUT         => OPEN,
        I2C1_SDA_USBA_DATA3_MGPIO0A_OUT         => OPEN,
        MMUART0_CTS_USBC_DATA7_MGPIO19B_OUT     => OPEN,
        MMUART0_DCD_MGPIO22B_OUT                => OPEN,
        MMUART0_DSR_MGPIO20B_OUT                => OPEN,
        MMUART0_DTR_USBC_DATA6_MGPIO18B_OUT     => OPEN,
        MMUART0_RI_MGPIO21B_OUT                 => OPEN,
        MMUART0_RTS_USBC_DATA5_MGPIO17B_OUT     => OPEN,
        MMUART0_RXD_USBC_STP_MGPIO28B_OUT       => OPEN,
        MMUART0_SCK_USBC_NXT_MGPIO29B_OUT       => OPEN,
        MMUART0_TXD_USBC_DIR_MGPIO27B_OUT       => MSS_ADLIB_INST_MMUART0_TXD_USBC_DIR_MGPIO27B_OUT,
        MMUART1_RXD_USBC_DATA3_MGPIO26B_OUT     => OPEN,
        MMUART1_SCK_USBC_DATA4_MGPIO25B_OUT     => MSS_ADLIB_INST_MMUART1_SCK_USBC_DATA4_MGPIO25B_OUT,
        MMUART1_TXD_USBC_DATA2_MGPIO24B_OUT     => OPEN,
        RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_OUT    => OPEN,
        RGMII_MDC_RMII_MDC_OUT                  => OPEN,
        RGMII_MDIO_RMII_MDIO_USBB_DATA7_OUT     => OPEN,
        RGMII_RX_CLK_OUT                        => OPEN,
        RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OUT => OPEN,
        RGMII_RXD0_RMII_RXD0_USBB_DATA0_OUT     => OPEN,
        RGMII_RXD1_RMII_RXD1_USBB_DATA1_OUT     => OPEN,
        RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OUT    => OPEN,
        RGMII_RXD3_USBB_DATA4_OUT               => OPEN,
        RGMII_TX_CLK_OUT                        => OPEN,
        RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_OUT    => OPEN,
        RGMII_TXD0_RMII_TXD0_USBB_DIR_OUT       => OPEN,
        RGMII_TXD1_RMII_TXD1_USBB_STP_OUT       => OPEN,
        RGMII_TXD2_USBB_DATA5_OUT               => OPEN,
        RGMII_TXD3_USBB_DATA6_OUT               => OPEN,
        SPI0_SCK_USBA_XCLK_OUT                  => OPEN,
        SPI0_SDI_USBA_DIR_MGPIO5A_OUT           => OPEN,
        SPI0_SDO_USBA_STP_MGPIO6A_OUT           => OPEN,
        SPI0_SS0_USBA_NXT_MGPIO7A_OUT           => OPEN,
        SPI0_SS1_USBA_DATA5_MGPIO8A_OUT         => MSS_ADLIB_INST_SPI0_SS1_USBA_DATA5_MGPIO8A_OUT,
        SPI0_SS2_USBA_DATA6_MGPIO9A_OUT         => MSS_ADLIB_INST_SPI0_SS2_USBA_DATA6_MGPIO9A_OUT,
        SPI0_SS3_USBA_DATA7_MGPIO10A_OUT        => MSS_ADLIB_INST_SPI0_SS3_USBA_DATA7_MGPIO10A_OUT,
        SPI1_SCK_OUT                            => OPEN,
        SPI1_SDI_MGPIO11A_OUT                   => MSS_ADLIB_INST_SPI1_SDI_MGPIO11A_OUT,
        SPI1_SDO_MGPIO12A_OUT                   => MSS_ADLIB_INST_SPI1_SDO_MGPIO12A_OUT,
        SPI1_SS0_MGPIO13A_OUT                   => MSS_ADLIB_INST_SPI1_SS0_MGPIO13A_OUT,
        SPI1_SS1_MGPIO14A_OUT                   => MSS_ADLIB_INST_SPI1_SS1_MGPIO14A_OUT,
        SPI1_SS2_MGPIO15A_OUT                   => MSS_ADLIB_INST_SPI1_SS2_MGPIO15A_OUT,
        SPI1_SS3_MGPIO16A_OUT                   => MSS_ADLIB_INST_SPI1_SS3_MGPIO16A_OUT,
        SPI1_SS4_MGPIO17A_OUT                   => OPEN,
        SPI1_SS5_MGPIO18A_OUT                   => OPEN,
        SPI1_SS6_MGPIO23A_OUT                   => OPEN,
        SPI1_SS7_MGPIO24A_OUT                   => OPEN,
        USBC_XCLK_OUT                           => OPEN,
        CAN_RXBUS_USBA_DATA1_MGPIO3A_OE         => OPEN,
        CAN_TX_EBL_USBA_DATA2_MGPIO4A_OE        => OPEN,
        CAN_TXBUS_USBA_DATA0_MGPIO2A_OE         => OPEN,
        DM_OE                                   => OPEN,
        DRAM_DQ_OE                              => OPEN,
        DRAM_DQS_OE                             => OPEN,
        I2C0_SCL_USBC_DATA1_MGPIO31B_OE         => OPEN,
        I2C0_SDA_USBC_DATA0_MGPIO30B_OE         => OPEN,
        I2C1_SCL_USBA_DATA4_MGPIO1A_OE          => OPEN,
        I2C1_SDA_USBA_DATA3_MGPIO0A_OE          => OPEN,
        MMUART0_CTS_USBC_DATA7_MGPIO19B_OE      => OPEN,
        MMUART0_DCD_MGPIO22B_OE                 => OPEN,
        MMUART0_DSR_MGPIO20B_OE                 => OPEN,
        MMUART0_DTR_USBC_DATA6_MGPIO18B_OE      => OPEN,
        MMUART0_RI_MGPIO21B_OE                  => OPEN,
        MMUART0_RTS_USBC_DATA5_MGPIO17B_OE      => OPEN,
        MMUART0_RXD_USBC_STP_MGPIO28B_OE        => OPEN,
        MMUART0_SCK_USBC_NXT_MGPIO29B_OE        => OPEN,
        MMUART0_TXD_USBC_DIR_MGPIO27B_OE        => MSS_ADLIB_INST_MMUART0_TXD_USBC_DIR_MGPIO27B_OE,
        MMUART1_RXD_USBC_DATA3_MGPIO26B_OE      => OPEN,
        MMUART1_SCK_USBC_DATA4_MGPIO25B_OE      => OPEN,
        MMUART1_TXD_USBC_DATA2_MGPIO24B_OE      => OPEN,
        RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_OE     => OPEN,
        RGMII_MDC_RMII_MDC_OE                   => OPEN,
        RGMII_MDIO_RMII_MDIO_USBB_DATA7_OE      => OPEN,
        RGMII_RX_CLK_OE                         => OPEN,
        RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OE  => OPEN,
        RGMII_RXD0_RMII_RXD0_USBB_DATA0_OE      => OPEN,
        RGMII_RXD1_RMII_RXD1_USBB_DATA1_OE      => OPEN,
        RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OE     => OPEN,
        RGMII_RXD3_USBB_DATA4_OE                => OPEN,
        RGMII_TX_CLK_OE                         => OPEN,
        RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_OE     => OPEN,
        RGMII_TXD0_RMII_TXD0_USBB_DIR_OE        => OPEN,
        RGMII_TXD1_RMII_TXD1_USBB_STP_OE        => OPEN,
        RGMII_TXD2_USBB_DATA5_OE                => OPEN,
        RGMII_TXD3_USBB_DATA6_OE                => OPEN,
        SPI0_SCK_USBA_XCLK_OE                   => OPEN,
        SPI0_SDI_USBA_DIR_MGPIO5A_OE            => OPEN,
        SPI0_SDO_USBA_STP_MGPIO6A_OE            => OPEN,
        SPI0_SS0_USBA_NXT_MGPIO7A_OE            => OPEN,
        SPI0_SS1_USBA_DATA5_MGPIO8A_OE          => OPEN,
        SPI0_SS2_USBA_DATA6_MGPIO9A_OE          => OPEN,
        SPI0_SS3_USBA_DATA7_MGPIO10A_OE         => OPEN,
        SPI1_SCK_OE                             => OPEN,
        SPI1_SDI_MGPIO11A_OE                    => OPEN,
        SPI1_SDO_MGPIO12A_OE                    => OPEN,
        SPI1_SS0_MGPIO13A_OE                    => OPEN,
        SPI1_SS1_MGPIO14A_OE                    => OPEN,
        SPI1_SS2_MGPIO15A_OE                    => OPEN,
        SPI1_SS3_MGPIO16A_OE                    => OPEN,
        SPI1_SS4_MGPIO17A_OE                    => OPEN,
        SPI1_SS5_MGPIO18A_OE                    => OPEN,
        SPI1_SS6_MGPIO23A_OE                    => OPEN,
        SPI1_SS7_MGPIO24A_OE                    => OPEN,
        USBC_XCLK_OE                            => OPEN 
        );

end RTL;
