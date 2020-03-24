//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue Mar 24 11:05:52 2020
// Version: v11.8 11.8.0.26
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// fpga_soc_MSS
module fpga_soc_MSS(
    // Inputs
    MCCC_CLK_BASE,
    MCCC_CLK_BASE_PLL_LOCK,
    MDDR_SMC_AHB_M_HRDATA,
    MDDR_SMC_AHB_M_HREADY,
    MDDR_SMC_AHB_M_HRESP,
    MMUART_0_RXD,
    MSS_RESET_N_F2M,
    SPI_0_DI,
    // Outputs
    MDDR_SMC_AHB_M_HADDR,
    MDDR_SMC_AHB_M_HBURST,
    MDDR_SMC_AHB_M_HMASTLOCK,
    MDDR_SMC_AHB_M_HSIZE,
    MDDR_SMC_AHB_M_HTRANS,
    MDDR_SMC_AHB_M_HWDATA,
    MDDR_SMC_AHB_M_HWRITE,
    MMUART_0_TXD,
    MSS_RESET_N_M2F,
    SPI_0_DO,
    // Inouts
    GPIO_10_BI,
    GPIO_11_BI,
    GPIO_12_BI,
    GPIO_13_BI,
    GPIO_14_BI,
    GPIO_15_BI,
    GPIO_16_BI,
    GPIO_17_BI,
    GPIO_18_BI,
    GPIO_19_BI,
    GPIO_20_BI,
    GPIO_21_BI,
    GPIO_22_BI,
    GPIO_23_BI,
    GPIO_8_BI,
    GPIO_9_BI,
    I2C_0_SCL,
    I2C_0_SDA,
    SPI_0_CLK,
    SPI_0_SS0
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         MCCC_CLK_BASE;
input         MCCC_CLK_BASE_PLL_LOCK;
input  [31:0] MDDR_SMC_AHB_M_HRDATA;
input         MDDR_SMC_AHB_M_HREADY;
input         MDDR_SMC_AHB_M_HRESP;
input         MMUART_0_RXD;
input         MSS_RESET_N_F2M;
input         SPI_0_DI;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [31:0] MDDR_SMC_AHB_M_HADDR;
output [2:0]  MDDR_SMC_AHB_M_HBURST;
output        MDDR_SMC_AHB_M_HMASTLOCK;
output [1:0]  MDDR_SMC_AHB_M_HSIZE;
output [1:0]  MDDR_SMC_AHB_M_HTRANS;
output [31:0] MDDR_SMC_AHB_M_HWDATA;
output        MDDR_SMC_AHB_M_HWRITE;
output        MMUART_0_TXD;
output        MSS_RESET_N_M2F;
output        SPI_0_DO;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout         GPIO_10_BI;
inout         GPIO_11_BI;
inout         GPIO_12_BI;
inout         GPIO_13_BI;
inout         GPIO_14_BI;
inout         GPIO_15_BI;
inout         GPIO_16_BI;
inout         GPIO_17_BI;
inout         GPIO_18_BI;
inout         GPIO_19_BI;
inout         GPIO_20_BI;
inout         GPIO_21_BI;
inout         GPIO_22_BI;
inout         GPIO_23_BI;
inout         GPIO_8_BI;
inout         GPIO_9_BI;
inout         I2C_0_SCL;
inout         I2C_0_SDA;
inout         SPI_0_CLK;
inout         SPI_0_SS0;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire           GPIO_8_BI;
wire           GPIO_9_BI;
wire           GPIO_10_BI;
wire           GPIO_11_BI;
wire           GPIO_12_BI;
wire           GPIO_13_BI;
wire           GPIO_14_BI;
wire           GPIO_15_BI;
wire           GPIO_16_BI;
wire           GPIO_17_BI;
wire           GPIO_18_BI;
wire           GPIO_19_BI;
wire           GPIO_20_BI;
wire           GPIO_21_BI;
wire           GPIO_22_BI;
wire           GPIO_23_BI;
wire           GPIO_GPIO_8_BI_PAD_Y;
wire           GPIO_GPIO_9_BI_PAD_Y;
wire           GPIO_GPIO_10_BI_PAD_Y;
wire           GPIO_GPIO_11_BI_PAD_Y;
wire           GPIO_GPIO_12_BI_PAD_Y;
wire           GPIO_GPIO_13_BI_PAD_Y;
wire           GPIO_GPIO_14_BI_PAD_Y;
wire           GPIO_GPIO_15_BI_PAD_Y;
wire           GPIO_GPIO_16_BI_PAD_Y;
wire           GPIO_GPIO_17_BI_PAD_Y;
wire           GPIO_GPIO_18_BI_PAD_Y;
wire           GPIO_GPIO_19_BI_PAD_Y;
wire           GPIO_GPIO_20_BI_PAD_Y;
wire           GPIO_GPIO_21_BI_PAD_Y;
wire           GPIO_GPIO_22_BI_PAD_Y;
wire           GPIO_GPIO_23_BI_PAD_Y;
wire           I2C_0_SCL;
wire           I2C_0_SCL_PAD_Y;
wire           I2C_0_SDA;
wire           I2C_0_SDA_PAD_Y;
wire           MCCC_CLK_BASE;
wire           MCCC_CLK_BASE_PLL_LOCK;
wire   [31:31] MDDR_SMC_AHB_M_HADDR_net_0;
wire   [30:30] MDDR_SMC_AHB_M_HADDR_0;
wire   [29:29] MDDR_SMC_AHB_M_HADDR_1;
wire   [28:28] MDDR_SMC_AHB_M_HADDR_2;
wire   [27:27] MDDR_SMC_AHB_M_HADDR_3;
wire   [26:26] MDDR_SMC_AHB_M_HADDR_4;
wire   [25:25] MDDR_SMC_AHB_M_HADDR_5;
wire   [24:24] MDDR_SMC_AHB_M_HADDR_6;
wire   [23:23] MDDR_SMC_AHB_M_HADDR_7;
wire   [22:22] MDDR_SMC_AHB_M_HADDR_8;
wire   [21:21] MDDR_SMC_AHB_M_HADDR_9;
wire   [20:20] MDDR_SMC_AHB_M_HADDR_10;
wire   [19:19] MDDR_SMC_AHB_M_HADDR_11;
wire   [18:18] MDDR_SMC_AHB_M_HADDR_12;
wire   [17:17] MDDR_SMC_AHB_M_HADDR_13;
wire   [16:16] MDDR_SMC_AHB_M_HADDR_14;
wire   [15:15] MDDR_SMC_AHB_M_HADDR_15;
wire   [14:14] MDDR_SMC_AHB_M_HADDR_16;
wire   [13:13] MDDR_SMC_AHB_M_HADDR_17;
wire   [12:12] MDDR_SMC_AHB_M_HADDR_18;
wire   [11:11] MDDR_SMC_AHB_M_HADDR_19;
wire   [10:10] MDDR_SMC_AHB_M_HADDR_20;
wire   [9:9]   MDDR_SMC_AHB_M_HADDR_21;
wire   [8:8]   MDDR_SMC_AHB_M_HADDR_22;
wire   [7:7]   MDDR_SMC_AHB_M_HADDR_23;
wire   [6:6]   MDDR_SMC_AHB_M_HADDR_24;
wire   [5:5]   MDDR_SMC_AHB_M_HADDR_25;
wire   [4:4]   MDDR_SMC_AHB_M_HADDR_26;
wire   [3:3]   MDDR_SMC_AHB_M_HADDR_27;
wire   [2:2]   MDDR_SMC_AHB_M_HADDR_28;
wire   [1:1]   MDDR_SMC_AHB_M_HADDR_29;
wire   [0:0]   MDDR_SMC_AHB_M_HADDR_30;
wire   [2:2]   MDDR_SMC_AHB_M_HBURST_net_0;
wire   [1:1]   MDDR_SMC_AHB_M_HBURST_0;
wire   [0:0]   MDDR_SMC_AHB_M_HBURST_1;
wire           MDDR_SMC_AHB_M_HMASTLOCK_net_0;
wire   [31:31] MDDR_SMC_AHB_M_HRDATA_slice_0;
wire   [30:30] MDDR_SMC_AHB_M_HRDATA_slice_1;
wire   [29:29] MDDR_SMC_AHB_M_HRDATA_slice_2;
wire   [28:28] MDDR_SMC_AHB_M_HRDATA_slice_3;
wire   [27:27] MDDR_SMC_AHB_M_HRDATA_slice_4;
wire   [26:26] MDDR_SMC_AHB_M_HRDATA_slice_5;
wire   [25:25] MDDR_SMC_AHB_M_HRDATA_slice_6;
wire   [24:24] MDDR_SMC_AHB_M_HRDATA_slice_7;
wire   [23:23] MDDR_SMC_AHB_M_HRDATA_slice_8;
wire   [22:22] MDDR_SMC_AHB_M_HRDATA_slice_9;
wire   [21:21] MDDR_SMC_AHB_M_HRDATA_slice_10;
wire   [20:20] MDDR_SMC_AHB_M_HRDATA_slice_11;
wire   [19:19] MDDR_SMC_AHB_M_HRDATA_slice_12;
wire   [18:18] MDDR_SMC_AHB_M_HRDATA_slice_13;
wire   [17:17] MDDR_SMC_AHB_M_HRDATA_slice_14;
wire   [16:16] MDDR_SMC_AHB_M_HRDATA_slice_15;
wire   [15:15] MDDR_SMC_AHB_M_HRDATA_slice_16;
wire   [14:14] MDDR_SMC_AHB_M_HRDATA_slice_17;
wire   [13:13] MDDR_SMC_AHB_M_HRDATA_slice_18;
wire   [12:12] MDDR_SMC_AHB_M_HRDATA_slice_19;
wire   [11:11] MDDR_SMC_AHB_M_HRDATA_slice_20;
wire   [10:10] MDDR_SMC_AHB_M_HRDATA_slice_21;
wire   [9:9]   MDDR_SMC_AHB_M_HRDATA_slice_22;
wire   [8:8]   MDDR_SMC_AHB_M_HRDATA_slice_23;
wire   [7:7]   MDDR_SMC_AHB_M_HRDATA_slice_24;
wire   [6:6]   MDDR_SMC_AHB_M_HRDATA_slice_25;
wire   [5:5]   MDDR_SMC_AHB_M_HRDATA_slice_26;
wire   [4:4]   MDDR_SMC_AHB_M_HRDATA_slice_27;
wire   [3:3]   MDDR_SMC_AHB_M_HRDATA_slice_28;
wire   [2:2]   MDDR_SMC_AHB_M_HRDATA_slice_29;
wire   [1:1]   MDDR_SMC_AHB_M_HRDATA_slice_30;
wire   [0:0]   MDDR_SMC_AHB_M_HRDATA_slice_31;
wire           MDDR_SMC_AHB_M_HREADY;
wire           MDDR_SMC_AHB_M_HRESP;
wire   [1:1]   MDDR_SMC_AHB_M_HSIZE_net_0;
wire   [0:0]   MDDR_SMC_AHB_M_HSIZE_0;
wire   [1:0]   MDDR_SMC_AHB_M_HTRANS_net_0;
wire   [63:63] MDDR_SMC_AHB_M_HWDATA_net_0;
wire   [62:62] MDDR_SMC_AHB_M_HWDATA_0;
wire   [61:61] MDDR_SMC_AHB_M_HWDATA_1;
wire   [60:60] MDDR_SMC_AHB_M_HWDATA_2;
wire   [59:59] MDDR_SMC_AHB_M_HWDATA_3;
wire   [58:58] MDDR_SMC_AHB_M_HWDATA_4;
wire   [57:57] MDDR_SMC_AHB_M_HWDATA_5;
wire   [56:56] MDDR_SMC_AHB_M_HWDATA_6;
wire   [55:55] MDDR_SMC_AHB_M_HWDATA_7;
wire   [54:54] MDDR_SMC_AHB_M_HWDATA_8;
wire   [53:53] MDDR_SMC_AHB_M_HWDATA_9;
wire   [52:52] MDDR_SMC_AHB_M_HWDATA_10;
wire   [51:51] MDDR_SMC_AHB_M_HWDATA_11;
wire   [50:50] MDDR_SMC_AHB_M_HWDATA_12;
wire   [49:49] MDDR_SMC_AHB_M_HWDATA_13;
wire   [48:48] MDDR_SMC_AHB_M_HWDATA_14;
wire   [47:47] MDDR_SMC_AHB_M_HWDATA_15;
wire   [46:46] MDDR_SMC_AHB_M_HWDATA_16;
wire   [45:45] MDDR_SMC_AHB_M_HWDATA_17;
wire   [44:44] MDDR_SMC_AHB_M_HWDATA_18;
wire   [43:43] MDDR_SMC_AHB_M_HWDATA_19;
wire   [42:42] MDDR_SMC_AHB_M_HWDATA_20;
wire   [41:41] MDDR_SMC_AHB_M_HWDATA_21;
wire   [40:40] MDDR_SMC_AHB_M_HWDATA_22;
wire   [39:39] MDDR_SMC_AHB_M_HWDATA_23;
wire   [38:38] MDDR_SMC_AHB_M_HWDATA_24;
wire   [37:37] MDDR_SMC_AHB_M_HWDATA_25;
wire   [36:36] MDDR_SMC_AHB_M_HWDATA_26;
wire   [35:35] MDDR_SMC_AHB_M_HWDATA_27;
wire   [34:34] MDDR_SMC_AHB_M_HWDATA_28;
wire   [33:33] MDDR_SMC_AHB_M_HWDATA_29;
wire   [32:32] MDDR_SMC_AHB_M_HWDATA_30;
wire           MDDR_SMC_AHB_M_HWRITE_net_0;
wire           MMUART_0_RXD;
wire           MMUART_0_RXD_PAD_Y;
wire           MMUART_0_TXD_net_0;
wire           MSS_ADLIB_INST_I2C0_SCL_USBC_DATA1_MGPIO31B_OE;
wire           MSS_ADLIB_INST_I2C0_SCL_USBC_DATA1_MGPIO31B_OUT;
wire           MSS_ADLIB_INST_I2C0_SDA_USBC_DATA0_MGPIO30B_OE;
wire           MSS_ADLIB_INST_I2C0_SDA_USBC_DATA0_MGPIO30B_OUT;
wire           MSS_ADLIB_INST_MMUART0_CTS_USBC_DATA7_MGPIO19B_OE;
wire           MSS_ADLIB_INST_MMUART0_CTS_USBC_DATA7_MGPIO19B_OUT;
wire           MSS_ADLIB_INST_MMUART0_DCD_MGPIO22B_OE;
wire           MSS_ADLIB_INST_MMUART0_DCD_MGPIO22B_OUT;
wire           MSS_ADLIB_INST_MMUART0_DSR_MGPIO20B_OE;
wire           MSS_ADLIB_INST_MMUART0_DSR_MGPIO20B_OUT;
wire           MSS_ADLIB_INST_MMUART0_RI_MGPIO21B_OE;
wire           MSS_ADLIB_INST_MMUART0_RI_MGPIO21B_OUT;
wire           MSS_ADLIB_INST_MMUART0_TXD_USBC_DIR_MGPIO27B_OE;
wire           MSS_ADLIB_INST_MMUART0_TXD_USBC_DIR_MGPIO27B_OUT;
wire           MSS_ADLIB_INST_SPI0_SCK_USBA_XCLK_OE;
wire           MSS_ADLIB_INST_SPI0_SCK_USBA_XCLK_OUT;
wire           MSS_ADLIB_INST_SPI0_SDO_USBA_STP_MGPIO6A_OE;
wire           MSS_ADLIB_INST_SPI0_SDO_USBA_STP_MGPIO6A_OUT;
wire           MSS_ADLIB_INST_SPI0_SS0_USBA_NXT_MGPIO7A_OE;
wire           MSS_ADLIB_INST_SPI0_SS0_USBA_NXT_MGPIO7A_OUT;
wire           MSS_ADLIB_INST_SPI0_SS1_USBA_DATA5_MGPIO8A_OE;
wire           MSS_ADLIB_INST_SPI0_SS1_USBA_DATA5_MGPIO8A_OUT;
wire           MSS_ADLIB_INST_SPI0_SS2_USBA_DATA6_MGPIO9A_OE;
wire           MSS_ADLIB_INST_SPI0_SS2_USBA_DATA6_MGPIO9A_OUT;
wire           MSS_ADLIB_INST_SPI0_SS3_USBA_DATA7_MGPIO10A_OE;
wire           MSS_ADLIB_INST_SPI0_SS3_USBA_DATA7_MGPIO10A_OUT;
wire           MSS_ADLIB_INST_SPI1_SDI_MGPIO11A_OE;
wire           MSS_ADLIB_INST_SPI1_SDI_MGPIO11A_OUT;
wire           MSS_ADLIB_INST_SPI1_SDO_MGPIO12A_OE;
wire           MSS_ADLIB_INST_SPI1_SDO_MGPIO12A_OUT;
wire           MSS_ADLIB_INST_SPI1_SS0_MGPIO13A_OE;
wire           MSS_ADLIB_INST_SPI1_SS0_MGPIO13A_OUT;
wire           MSS_ADLIB_INST_SPI1_SS1_MGPIO14A_OE;
wire           MSS_ADLIB_INST_SPI1_SS1_MGPIO14A_OUT;
wire           MSS_ADLIB_INST_SPI1_SS2_MGPIO15A_OE;
wire           MSS_ADLIB_INST_SPI1_SS2_MGPIO15A_OUT;
wire           MSS_ADLIB_INST_SPI1_SS3_MGPIO16A_OE;
wire           MSS_ADLIB_INST_SPI1_SS3_MGPIO16A_OUT;
wire           MSS_ADLIB_INST_SPI1_SS4_MGPIO17A_OE;
wire           MSS_ADLIB_INST_SPI1_SS4_MGPIO17A_OUT;
wire           MSS_ADLIB_INST_SPI1_SS5_MGPIO18A_OE;
wire           MSS_ADLIB_INST_SPI1_SS5_MGPIO18A_OUT;
wire           MSS_ADLIB_INST_SPI1_SS6_MGPIO23A_OE;
wire           MSS_ADLIB_INST_SPI1_SS6_MGPIO23A_OUT;
wire           MSS_RESET_N_F2M;
wire           MSS_RESET_N_M2F_net_0;
wire           SPI_0_CLK;
wire           SPI_0_CLK_PAD_Y;
wire           SPI_0_DI;
wire           SPI_0_DI_PAD_Y;
wire           SPI_0_DO_net_0;
wire           SPI_0_SS0;
wire           SPI_0_SS0_PAD_Y;
wire           SPI_0_DO_net_1;
wire           MMUART_0_TXD_net_1;
wire           MDDR_SMC_AHB_M_HMASTLOCK_net_1;
wire           MDDR_SMC_AHB_M_HWRITE_net_1;
wire           MSS_RESET_N_M2F_net_1;
wire   [0:0]   MDDR_SMC_AHB_M_HBURST_1_net_0;
wire   [1:1]   MDDR_SMC_AHB_M_HBURST_0_net_0;
wire   [2:2]   MDDR_SMC_AHB_M_HBURST_net_1;
wire   [1:0]   MDDR_SMC_AHB_M_HTRANS_net_1;
wire   [0:0]   MDDR_SMC_AHB_M_HSIZE_0_net_0;
wire   [1:1]   MDDR_SMC_AHB_M_HSIZE_net_1;
wire   [0:0]   MDDR_SMC_AHB_M_HWDATA_30_net_0;
wire   [10:10] MDDR_SMC_AHB_M_HWDATA_20_net_0;
wire   [11:11] MDDR_SMC_AHB_M_HWDATA_19_net_0;
wire   [12:12] MDDR_SMC_AHB_M_HWDATA_18_net_0;
wire   [13:13] MDDR_SMC_AHB_M_HWDATA_17_net_0;
wire   [14:14] MDDR_SMC_AHB_M_HWDATA_16_net_0;
wire   [15:15] MDDR_SMC_AHB_M_HWDATA_15_net_0;
wire   [16:16] MDDR_SMC_AHB_M_HWDATA_14_net_0;
wire   [17:17] MDDR_SMC_AHB_M_HWDATA_13_net_0;
wire   [18:18] MDDR_SMC_AHB_M_HWDATA_12_net_0;
wire   [19:19] MDDR_SMC_AHB_M_HWDATA_11_net_0;
wire   [1:1]   MDDR_SMC_AHB_M_HWDATA_29_net_0;
wire   [20:20] MDDR_SMC_AHB_M_HWDATA_10_net_0;
wire   [21:21] MDDR_SMC_AHB_M_HWDATA_9_net_0;
wire   [22:22] MDDR_SMC_AHB_M_HWDATA_8_net_0;
wire   [23:23] MDDR_SMC_AHB_M_HWDATA_7_net_0;
wire   [24:24] MDDR_SMC_AHB_M_HWDATA_6_net_0;
wire   [25:25] MDDR_SMC_AHB_M_HWDATA_5_net_0;
wire   [26:26] MDDR_SMC_AHB_M_HWDATA_4_net_0;
wire   [27:27] MDDR_SMC_AHB_M_HWDATA_3_net_0;
wire   [28:28] MDDR_SMC_AHB_M_HWDATA_2_net_0;
wire   [29:29] MDDR_SMC_AHB_M_HWDATA_1_net_0;
wire   [2:2]   MDDR_SMC_AHB_M_HWDATA_28_net_0;
wire   [30:30] MDDR_SMC_AHB_M_HWDATA_0_net_0;
wire   [31:31] MDDR_SMC_AHB_M_HWDATA_net_1;
wire   [3:3]   MDDR_SMC_AHB_M_HWDATA_27_net_0;
wire   [4:4]   MDDR_SMC_AHB_M_HWDATA_26_net_0;
wire   [5:5]   MDDR_SMC_AHB_M_HWDATA_25_net_0;
wire   [6:6]   MDDR_SMC_AHB_M_HWDATA_24_net_0;
wire   [7:7]   MDDR_SMC_AHB_M_HWDATA_23_net_0;
wire   [8:8]   MDDR_SMC_AHB_M_HWDATA_22_net_0;
wire   [9:9]   MDDR_SMC_AHB_M_HWDATA_21_net_0;
wire   [0:0]   MDDR_SMC_AHB_M_HADDR_30_net_0;
wire   [10:10] MDDR_SMC_AHB_M_HADDR_20_net_0;
wire   [11:11] MDDR_SMC_AHB_M_HADDR_19_net_0;
wire   [12:12] MDDR_SMC_AHB_M_HADDR_18_net_0;
wire   [13:13] MDDR_SMC_AHB_M_HADDR_17_net_0;
wire   [14:14] MDDR_SMC_AHB_M_HADDR_16_net_0;
wire   [15:15] MDDR_SMC_AHB_M_HADDR_15_net_0;
wire   [16:16] MDDR_SMC_AHB_M_HADDR_14_net_0;
wire   [17:17] MDDR_SMC_AHB_M_HADDR_13_net_0;
wire   [18:18] MDDR_SMC_AHB_M_HADDR_12_net_0;
wire   [19:19] MDDR_SMC_AHB_M_HADDR_11_net_0;
wire   [1:1]   MDDR_SMC_AHB_M_HADDR_29_net_0;
wire   [20:20] MDDR_SMC_AHB_M_HADDR_10_net_0;
wire   [21:21] MDDR_SMC_AHB_M_HADDR_9_net_0;
wire   [22:22] MDDR_SMC_AHB_M_HADDR_8_net_0;
wire   [23:23] MDDR_SMC_AHB_M_HADDR_7_net_0;
wire   [24:24] MDDR_SMC_AHB_M_HADDR_6_net_0;
wire   [25:25] MDDR_SMC_AHB_M_HADDR_5_net_0;
wire   [26:26] MDDR_SMC_AHB_M_HADDR_4_net_0;
wire   [27:27] MDDR_SMC_AHB_M_HADDR_3_net_0;
wire   [28:28] MDDR_SMC_AHB_M_HADDR_2_net_0;
wire   [29:29] MDDR_SMC_AHB_M_HADDR_1_net_0;
wire   [2:2]   MDDR_SMC_AHB_M_HADDR_28_net_0;
wire   [30:30] MDDR_SMC_AHB_M_HADDR_0_net_0;
wire   [31:31] MDDR_SMC_AHB_M_HADDR_net_1;
wire   [3:3]   MDDR_SMC_AHB_M_HADDR_27_net_0;
wire   [4:4]   MDDR_SMC_AHB_M_HADDR_26_net_0;
wire   [5:5]   MDDR_SMC_AHB_M_HADDR_25_net_0;
wire   [6:6]   MDDR_SMC_AHB_M_HADDR_24_net_0;
wire   [7:7]   MDDR_SMC_AHB_M_HADDR_23_net_0;
wire   [8:8]   MDDR_SMC_AHB_M_HADDR_22_net_0;
wire   [9:9]   MDDR_SMC_AHB_M_HADDR_21_net_0;
wire   [3:3]   F_BID_slice_0;
wire   [2:2]   F_RID_slice_0;
wire   [3:3]   F_RID_slice_1;
wire   [1:0]   F_AWLOCK_HMASTLOCK0_net_0;
wire   [63:0]  F_WDATA_HWDATA01_net_0;
wire   [31:0]  MDDR_SMC_AHB_M_HRDATA;
wire   [3:0]   F_BID_net_0;
wire   [63:0]  F_RDATA_HRDATA01_net_0;
wire   [3:0]   F_RID_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire           GND_net;
wire   [2:0]   DM_IN_const_net_0;
wire   [17:0]  DRAM_DQ_IN_const_net_0;
wire   [2:0]   DRAM_DQS_IN_const_net_0;
wire   [1:0]   DRAM_FIFO_WE_IN_const_net_0;
wire           VCC_net;
wire   [1:0]   F2_DMAREADY_const_net_0;
wire   [15:0]  F2H_INTERRUPT_const_net_0;
wire   [1:0]   F_DMAREADY_const_net_0;
wire   [31:0]  F_FM0_ADDR_const_net_0;
wire   [1:0]   F_FM0_SIZE_const_net_0;
wire   [31:0]  F_FM0_WDATA_const_net_0;
wire   [31:0]  F_HM0_RDATA_const_net_0;
wire   [1:0]   FAB_LINESTATE_const_net_0;
wire   [7:0]   FAB_VSTATUS_const_net_0;
wire   [7:0]   FAB_XDATAIN_const_net_0;
wire   [31:0]  PER2_FABRIC_PRDATA_const_net_0;
wire   [9:0]   RCGF_const_net_0;
wire   [7:0]   RXDF_const_net_0;
wire   [31:0]  F_ARADDR_HADDR1_const_net_0;
wire   [1:0]   F_ARBURST_HTRANS1_const_net_0;
wire   [3:0]   F_ARID_HSEL1_const_net_0;
wire   [3:0]   F_ARLEN_HBURST1_const_net_0;
wire   [1:0]   F_ARLOCK_HMASTLOCK1_const_net_0;
wire   [1:0]   F_ARSIZE_HSIZE1_const_net_0;
wire   [31:0]  F_AWADDR_HADDR0_const_net_0;
wire   [1:0]   F_AWBURST_HTRANS0_const_net_0;
wire   [3:0]   F_AWID_HSEL0_const_net_0;
wire   [3:0]   F_AWLEN_HBURST0_const_net_0;
wire   [1:0]   F_AWSIZE_HSIZE0_const_net_0;
wire   [3:0]   F_WID_HREADY01_const_net_0;
wire   [7:0]   F_WSTRB_const_net_0;
wire   [10:2]  MDDR_FABRIC_PADDR_const_net_0;
wire   [15:0]  MDDR_FABRIC_PWDATA_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                         = 1'b0;
assign DM_IN_const_net_0               = 3'h0;
assign DRAM_DQ_IN_const_net_0          = 18'h00000;
assign DRAM_DQS_IN_const_net_0         = 3'h0;
assign DRAM_FIFO_WE_IN_const_net_0     = 2'h0;
assign VCC_net                         = 1'b1;
assign F2_DMAREADY_const_net_0         = 2'h3;
assign F2H_INTERRUPT_const_net_0       = 16'h0000;
assign F_DMAREADY_const_net_0          = 2'h3;
assign F_FM0_ADDR_const_net_0          = 32'h00000000;
assign F_FM0_SIZE_const_net_0          = 2'h0;
assign F_FM0_WDATA_const_net_0         = 32'h00000000;
assign F_HM0_RDATA_const_net_0         = 32'h00000000;
assign FAB_LINESTATE_const_net_0       = 2'h3;
assign FAB_VSTATUS_const_net_0         = 8'hFF;
assign FAB_XDATAIN_const_net_0         = 8'hFF;
assign PER2_FABRIC_PRDATA_const_net_0  = 32'hFFFFFFFF;
assign RCGF_const_net_0                = 10'h3FF;
assign RXDF_const_net_0                = 8'hFF;
assign F_ARADDR_HADDR1_const_net_0     = 32'hFFFFFFFF;
assign F_ARBURST_HTRANS1_const_net_0   = 2'h0;
assign F_ARID_HSEL1_const_net_0        = 4'h0;
assign F_ARLEN_HBURST1_const_net_0     = 4'h0;
assign F_ARLOCK_HMASTLOCK1_const_net_0 = 2'h0;
assign F_ARSIZE_HSIZE1_const_net_0     = 2'h0;
assign F_AWADDR_HADDR0_const_net_0     = 32'hFFFFFFFF;
assign F_AWBURST_HTRANS0_const_net_0   = 2'h0;
assign F_AWID_HSEL0_const_net_0        = 4'h0;
assign F_AWLEN_HBURST0_const_net_0     = 4'h0;
assign F_AWSIZE_HSIZE0_const_net_0     = 2'h0;
assign F_WID_HREADY01_const_net_0      = 4'h0;
assign F_WSTRB_const_net_0             = 8'h00;
assign MDDR_FABRIC_PADDR_const_net_0   = 9'h1FF;
assign MDDR_FABRIC_PWDATA_const_net_0  = 16'hFFFF;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign SPI_0_DO_net_1                     = SPI_0_DO_net_0;
assign SPI_0_DO                           = SPI_0_DO_net_1;
assign MMUART_0_TXD_net_1                 = MMUART_0_TXD_net_0;
assign MMUART_0_TXD                       = MMUART_0_TXD_net_1;
assign MDDR_SMC_AHB_M_HMASTLOCK_net_1     = MDDR_SMC_AHB_M_HMASTLOCK_net_0;
assign MDDR_SMC_AHB_M_HMASTLOCK           = MDDR_SMC_AHB_M_HMASTLOCK_net_1;
assign MDDR_SMC_AHB_M_HWRITE_net_1        = MDDR_SMC_AHB_M_HWRITE_net_0;
assign MDDR_SMC_AHB_M_HWRITE              = MDDR_SMC_AHB_M_HWRITE_net_1;
assign MSS_RESET_N_M2F_net_1              = MSS_RESET_N_M2F_net_0;
assign MSS_RESET_N_M2F                    = MSS_RESET_N_M2F_net_1;
assign MDDR_SMC_AHB_M_HBURST_1_net_0[0]   = MDDR_SMC_AHB_M_HBURST_1[0];
assign MDDR_SMC_AHB_M_HBURST[0:0]         = MDDR_SMC_AHB_M_HBURST_1_net_0[0];
assign MDDR_SMC_AHB_M_HBURST_0_net_0[1]   = MDDR_SMC_AHB_M_HBURST_0[1];
assign MDDR_SMC_AHB_M_HBURST[1:1]         = MDDR_SMC_AHB_M_HBURST_0_net_0[1];
assign MDDR_SMC_AHB_M_HBURST_net_1[2]     = MDDR_SMC_AHB_M_HBURST_net_0[2];
assign MDDR_SMC_AHB_M_HBURST[2:2]         = MDDR_SMC_AHB_M_HBURST_net_1[2];
assign MDDR_SMC_AHB_M_HTRANS_net_1        = MDDR_SMC_AHB_M_HTRANS_net_0;
assign MDDR_SMC_AHB_M_HTRANS[1:0]         = MDDR_SMC_AHB_M_HTRANS_net_1;
assign MDDR_SMC_AHB_M_HSIZE_0_net_0[0]    = MDDR_SMC_AHB_M_HSIZE_0[0];
assign MDDR_SMC_AHB_M_HSIZE[0:0]          = MDDR_SMC_AHB_M_HSIZE_0_net_0[0];
assign MDDR_SMC_AHB_M_HSIZE_net_1[1]      = MDDR_SMC_AHB_M_HSIZE_net_0[1];
assign MDDR_SMC_AHB_M_HSIZE[1:1]          = MDDR_SMC_AHB_M_HSIZE_net_1[1];
assign MDDR_SMC_AHB_M_HWDATA_30_net_0[0]  = MDDR_SMC_AHB_M_HWDATA_30[32];
assign MDDR_SMC_AHB_M_HWDATA[0:0]         = MDDR_SMC_AHB_M_HWDATA_30_net_0[0];
assign MDDR_SMC_AHB_M_HWDATA_20_net_0[10] = MDDR_SMC_AHB_M_HWDATA_20[42];
assign MDDR_SMC_AHB_M_HWDATA[10:10]       = MDDR_SMC_AHB_M_HWDATA_20_net_0[10];
assign MDDR_SMC_AHB_M_HWDATA_19_net_0[11] = MDDR_SMC_AHB_M_HWDATA_19[43];
assign MDDR_SMC_AHB_M_HWDATA[11:11]       = MDDR_SMC_AHB_M_HWDATA_19_net_0[11];
assign MDDR_SMC_AHB_M_HWDATA_18_net_0[12] = MDDR_SMC_AHB_M_HWDATA_18[44];
assign MDDR_SMC_AHB_M_HWDATA[12:12]       = MDDR_SMC_AHB_M_HWDATA_18_net_0[12];
assign MDDR_SMC_AHB_M_HWDATA_17_net_0[13] = MDDR_SMC_AHB_M_HWDATA_17[45];
assign MDDR_SMC_AHB_M_HWDATA[13:13]       = MDDR_SMC_AHB_M_HWDATA_17_net_0[13];
assign MDDR_SMC_AHB_M_HWDATA_16_net_0[14] = MDDR_SMC_AHB_M_HWDATA_16[46];
assign MDDR_SMC_AHB_M_HWDATA[14:14]       = MDDR_SMC_AHB_M_HWDATA_16_net_0[14];
assign MDDR_SMC_AHB_M_HWDATA_15_net_0[15] = MDDR_SMC_AHB_M_HWDATA_15[47];
assign MDDR_SMC_AHB_M_HWDATA[15:15]       = MDDR_SMC_AHB_M_HWDATA_15_net_0[15];
assign MDDR_SMC_AHB_M_HWDATA_14_net_0[16] = MDDR_SMC_AHB_M_HWDATA_14[48];
assign MDDR_SMC_AHB_M_HWDATA[16:16]       = MDDR_SMC_AHB_M_HWDATA_14_net_0[16];
assign MDDR_SMC_AHB_M_HWDATA_13_net_0[17] = MDDR_SMC_AHB_M_HWDATA_13[49];
assign MDDR_SMC_AHB_M_HWDATA[17:17]       = MDDR_SMC_AHB_M_HWDATA_13_net_0[17];
assign MDDR_SMC_AHB_M_HWDATA_12_net_0[18] = MDDR_SMC_AHB_M_HWDATA_12[50];
assign MDDR_SMC_AHB_M_HWDATA[18:18]       = MDDR_SMC_AHB_M_HWDATA_12_net_0[18];
assign MDDR_SMC_AHB_M_HWDATA_11_net_0[19] = MDDR_SMC_AHB_M_HWDATA_11[51];
assign MDDR_SMC_AHB_M_HWDATA[19:19]       = MDDR_SMC_AHB_M_HWDATA_11_net_0[19];
assign MDDR_SMC_AHB_M_HWDATA_29_net_0[1]  = MDDR_SMC_AHB_M_HWDATA_29[33];
assign MDDR_SMC_AHB_M_HWDATA[1:1]         = MDDR_SMC_AHB_M_HWDATA_29_net_0[1];
assign MDDR_SMC_AHB_M_HWDATA_10_net_0[20] = MDDR_SMC_AHB_M_HWDATA_10[52];
assign MDDR_SMC_AHB_M_HWDATA[20:20]       = MDDR_SMC_AHB_M_HWDATA_10_net_0[20];
assign MDDR_SMC_AHB_M_HWDATA_9_net_0[21]  = MDDR_SMC_AHB_M_HWDATA_9[53];
assign MDDR_SMC_AHB_M_HWDATA[21:21]       = MDDR_SMC_AHB_M_HWDATA_9_net_0[21];
assign MDDR_SMC_AHB_M_HWDATA_8_net_0[22]  = MDDR_SMC_AHB_M_HWDATA_8[54];
assign MDDR_SMC_AHB_M_HWDATA[22:22]       = MDDR_SMC_AHB_M_HWDATA_8_net_0[22];
assign MDDR_SMC_AHB_M_HWDATA_7_net_0[23]  = MDDR_SMC_AHB_M_HWDATA_7[55];
assign MDDR_SMC_AHB_M_HWDATA[23:23]       = MDDR_SMC_AHB_M_HWDATA_7_net_0[23];
assign MDDR_SMC_AHB_M_HWDATA_6_net_0[24]  = MDDR_SMC_AHB_M_HWDATA_6[56];
assign MDDR_SMC_AHB_M_HWDATA[24:24]       = MDDR_SMC_AHB_M_HWDATA_6_net_0[24];
assign MDDR_SMC_AHB_M_HWDATA_5_net_0[25]  = MDDR_SMC_AHB_M_HWDATA_5[57];
assign MDDR_SMC_AHB_M_HWDATA[25:25]       = MDDR_SMC_AHB_M_HWDATA_5_net_0[25];
assign MDDR_SMC_AHB_M_HWDATA_4_net_0[26]  = MDDR_SMC_AHB_M_HWDATA_4[58];
assign MDDR_SMC_AHB_M_HWDATA[26:26]       = MDDR_SMC_AHB_M_HWDATA_4_net_0[26];
assign MDDR_SMC_AHB_M_HWDATA_3_net_0[27]  = MDDR_SMC_AHB_M_HWDATA_3[59];
assign MDDR_SMC_AHB_M_HWDATA[27:27]       = MDDR_SMC_AHB_M_HWDATA_3_net_0[27];
assign MDDR_SMC_AHB_M_HWDATA_2_net_0[28]  = MDDR_SMC_AHB_M_HWDATA_2[60];
assign MDDR_SMC_AHB_M_HWDATA[28:28]       = MDDR_SMC_AHB_M_HWDATA_2_net_0[28];
assign MDDR_SMC_AHB_M_HWDATA_1_net_0[29]  = MDDR_SMC_AHB_M_HWDATA_1[61];
assign MDDR_SMC_AHB_M_HWDATA[29:29]       = MDDR_SMC_AHB_M_HWDATA_1_net_0[29];
assign MDDR_SMC_AHB_M_HWDATA_28_net_0[2]  = MDDR_SMC_AHB_M_HWDATA_28[34];
assign MDDR_SMC_AHB_M_HWDATA[2:2]         = MDDR_SMC_AHB_M_HWDATA_28_net_0[2];
assign MDDR_SMC_AHB_M_HWDATA_0_net_0[30]  = MDDR_SMC_AHB_M_HWDATA_0[62];
assign MDDR_SMC_AHB_M_HWDATA[30:30]       = MDDR_SMC_AHB_M_HWDATA_0_net_0[30];
assign MDDR_SMC_AHB_M_HWDATA_net_1[31]    = MDDR_SMC_AHB_M_HWDATA_net_0[63];
assign MDDR_SMC_AHB_M_HWDATA[31:31]       = MDDR_SMC_AHB_M_HWDATA_net_1[31];
assign MDDR_SMC_AHB_M_HWDATA_27_net_0[3]  = MDDR_SMC_AHB_M_HWDATA_27[35];
assign MDDR_SMC_AHB_M_HWDATA[3:3]         = MDDR_SMC_AHB_M_HWDATA_27_net_0[3];
assign MDDR_SMC_AHB_M_HWDATA_26_net_0[4]  = MDDR_SMC_AHB_M_HWDATA_26[36];
assign MDDR_SMC_AHB_M_HWDATA[4:4]         = MDDR_SMC_AHB_M_HWDATA_26_net_0[4];
assign MDDR_SMC_AHB_M_HWDATA_25_net_0[5]  = MDDR_SMC_AHB_M_HWDATA_25[37];
assign MDDR_SMC_AHB_M_HWDATA[5:5]         = MDDR_SMC_AHB_M_HWDATA_25_net_0[5];
assign MDDR_SMC_AHB_M_HWDATA_24_net_0[6]  = MDDR_SMC_AHB_M_HWDATA_24[38];
assign MDDR_SMC_AHB_M_HWDATA[6:6]         = MDDR_SMC_AHB_M_HWDATA_24_net_0[6];
assign MDDR_SMC_AHB_M_HWDATA_23_net_0[7]  = MDDR_SMC_AHB_M_HWDATA_23[39];
assign MDDR_SMC_AHB_M_HWDATA[7:7]         = MDDR_SMC_AHB_M_HWDATA_23_net_0[7];
assign MDDR_SMC_AHB_M_HWDATA_22_net_0[8]  = MDDR_SMC_AHB_M_HWDATA_22[40];
assign MDDR_SMC_AHB_M_HWDATA[8:8]         = MDDR_SMC_AHB_M_HWDATA_22_net_0[8];
assign MDDR_SMC_AHB_M_HWDATA_21_net_0[9]  = MDDR_SMC_AHB_M_HWDATA_21[41];
assign MDDR_SMC_AHB_M_HWDATA[9:9]         = MDDR_SMC_AHB_M_HWDATA_21_net_0[9];
assign MDDR_SMC_AHB_M_HADDR_30_net_0[0]   = MDDR_SMC_AHB_M_HADDR_30[0];
assign MDDR_SMC_AHB_M_HADDR[0:0]          = MDDR_SMC_AHB_M_HADDR_30_net_0[0];
assign MDDR_SMC_AHB_M_HADDR_20_net_0[10]  = MDDR_SMC_AHB_M_HADDR_20[10];
assign MDDR_SMC_AHB_M_HADDR[10:10]        = MDDR_SMC_AHB_M_HADDR_20_net_0[10];
assign MDDR_SMC_AHB_M_HADDR_19_net_0[11]  = MDDR_SMC_AHB_M_HADDR_19[11];
assign MDDR_SMC_AHB_M_HADDR[11:11]        = MDDR_SMC_AHB_M_HADDR_19_net_0[11];
assign MDDR_SMC_AHB_M_HADDR_18_net_0[12]  = MDDR_SMC_AHB_M_HADDR_18[12];
assign MDDR_SMC_AHB_M_HADDR[12:12]        = MDDR_SMC_AHB_M_HADDR_18_net_0[12];
assign MDDR_SMC_AHB_M_HADDR_17_net_0[13]  = MDDR_SMC_AHB_M_HADDR_17[13];
assign MDDR_SMC_AHB_M_HADDR[13:13]        = MDDR_SMC_AHB_M_HADDR_17_net_0[13];
assign MDDR_SMC_AHB_M_HADDR_16_net_0[14]  = MDDR_SMC_AHB_M_HADDR_16[14];
assign MDDR_SMC_AHB_M_HADDR[14:14]        = MDDR_SMC_AHB_M_HADDR_16_net_0[14];
assign MDDR_SMC_AHB_M_HADDR_15_net_0[15]  = MDDR_SMC_AHB_M_HADDR_15[15];
assign MDDR_SMC_AHB_M_HADDR[15:15]        = MDDR_SMC_AHB_M_HADDR_15_net_0[15];
assign MDDR_SMC_AHB_M_HADDR_14_net_0[16]  = MDDR_SMC_AHB_M_HADDR_14[16];
assign MDDR_SMC_AHB_M_HADDR[16:16]        = MDDR_SMC_AHB_M_HADDR_14_net_0[16];
assign MDDR_SMC_AHB_M_HADDR_13_net_0[17]  = MDDR_SMC_AHB_M_HADDR_13[17];
assign MDDR_SMC_AHB_M_HADDR[17:17]        = MDDR_SMC_AHB_M_HADDR_13_net_0[17];
assign MDDR_SMC_AHB_M_HADDR_12_net_0[18]  = MDDR_SMC_AHB_M_HADDR_12[18];
assign MDDR_SMC_AHB_M_HADDR[18:18]        = MDDR_SMC_AHB_M_HADDR_12_net_0[18];
assign MDDR_SMC_AHB_M_HADDR_11_net_0[19]  = MDDR_SMC_AHB_M_HADDR_11[19];
assign MDDR_SMC_AHB_M_HADDR[19:19]        = MDDR_SMC_AHB_M_HADDR_11_net_0[19];
assign MDDR_SMC_AHB_M_HADDR_29_net_0[1]   = MDDR_SMC_AHB_M_HADDR_29[1];
assign MDDR_SMC_AHB_M_HADDR[1:1]          = MDDR_SMC_AHB_M_HADDR_29_net_0[1];
assign MDDR_SMC_AHB_M_HADDR_10_net_0[20]  = MDDR_SMC_AHB_M_HADDR_10[20];
assign MDDR_SMC_AHB_M_HADDR[20:20]        = MDDR_SMC_AHB_M_HADDR_10_net_0[20];
assign MDDR_SMC_AHB_M_HADDR_9_net_0[21]   = MDDR_SMC_AHB_M_HADDR_9[21];
assign MDDR_SMC_AHB_M_HADDR[21:21]        = MDDR_SMC_AHB_M_HADDR_9_net_0[21];
assign MDDR_SMC_AHB_M_HADDR_8_net_0[22]   = MDDR_SMC_AHB_M_HADDR_8[22];
assign MDDR_SMC_AHB_M_HADDR[22:22]        = MDDR_SMC_AHB_M_HADDR_8_net_0[22];
assign MDDR_SMC_AHB_M_HADDR_7_net_0[23]   = MDDR_SMC_AHB_M_HADDR_7[23];
assign MDDR_SMC_AHB_M_HADDR[23:23]        = MDDR_SMC_AHB_M_HADDR_7_net_0[23];
assign MDDR_SMC_AHB_M_HADDR_6_net_0[24]   = MDDR_SMC_AHB_M_HADDR_6[24];
assign MDDR_SMC_AHB_M_HADDR[24:24]        = MDDR_SMC_AHB_M_HADDR_6_net_0[24];
assign MDDR_SMC_AHB_M_HADDR_5_net_0[25]   = MDDR_SMC_AHB_M_HADDR_5[25];
assign MDDR_SMC_AHB_M_HADDR[25:25]        = MDDR_SMC_AHB_M_HADDR_5_net_0[25];
assign MDDR_SMC_AHB_M_HADDR_4_net_0[26]   = MDDR_SMC_AHB_M_HADDR_4[26];
assign MDDR_SMC_AHB_M_HADDR[26:26]        = MDDR_SMC_AHB_M_HADDR_4_net_0[26];
assign MDDR_SMC_AHB_M_HADDR_3_net_0[27]   = MDDR_SMC_AHB_M_HADDR_3[27];
assign MDDR_SMC_AHB_M_HADDR[27:27]        = MDDR_SMC_AHB_M_HADDR_3_net_0[27];
assign MDDR_SMC_AHB_M_HADDR_2_net_0[28]   = MDDR_SMC_AHB_M_HADDR_2[28];
assign MDDR_SMC_AHB_M_HADDR[28:28]        = MDDR_SMC_AHB_M_HADDR_2_net_0[28];
assign MDDR_SMC_AHB_M_HADDR_1_net_0[29]   = MDDR_SMC_AHB_M_HADDR_1[29];
assign MDDR_SMC_AHB_M_HADDR[29:29]        = MDDR_SMC_AHB_M_HADDR_1_net_0[29];
assign MDDR_SMC_AHB_M_HADDR_28_net_0[2]   = MDDR_SMC_AHB_M_HADDR_28[2];
assign MDDR_SMC_AHB_M_HADDR[2:2]          = MDDR_SMC_AHB_M_HADDR_28_net_0[2];
assign MDDR_SMC_AHB_M_HADDR_0_net_0[30]   = MDDR_SMC_AHB_M_HADDR_0[30];
assign MDDR_SMC_AHB_M_HADDR[30:30]        = MDDR_SMC_AHB_M_HADDR_0_net_0[30];
assign MDDR_SMC_AHB_M_HADDR_net_1[31]     = MDDR_SMC_AHB_M_HADDR_net_0[31];
assign MDDR_SMC_AHB_M_HADDR[31:31]        = MDDR_SMC_AHB_M_HADDR_net_1[31];
assign MDDR_SMC_AHB_M_HADDR_27_net_0[3]   = MDDR_SMC_AHB_M_HADDR_27[3];
assign MDDR_SMC_AHB_M_HADDR[3:3]          = MDDR_SMC_AHB_M_HADDR_27_net_0[3];
assign MDDR_SMC_AHB_M_HADDR_26_net_0[4]   = MDDR_SMC_AHB_M_HADDR_26[4];
assign MDDR_SMC_AHB_M_HADDR[4:4]          = MDDR_SMC_AHB_M_HADDR_26_net_0[4];
assign MDDR_SMC_AHB_M_HADDR_25_net_0[5]   = MDDR_SMC_AHB_M_HADDR_25[5];
assign MDDR_SMC_AHB_M_HADDR[5:5]          = MDDR_SMC_AHB_M_HADDR_25_net_0[5];
assign MDDR_SMC_AHB_M_HADDR_24_net_0[6]   = MDDR_SMC_AHB_M_HADDR_24[6];
assign MDDR_SMC_AHB_M_HADDR[6:6]          = MDDR_SMC_AHB_M_HADDR_24_net_0[6];
assign MDDR_SMC_AHB_M_HADDR_23_net_0[7]   = MDDR_SMC_AHB_M_HADDR_23[7];
assign MDDR_SMC_AHB_M_HADDR[7:7]          = MDDR_SMC_AHB_M_HADDR_23_net_0[7];
assign MDDR_SMC_AHB_M_HADDR_22_net_0[8]   = MDDR_SMC_AHB_M_HADDR_22[8];
assign MDDR_SMC_AHB_M_HADDR[8:8]          = MDDR_SMC_AHB_M_HADDR_22_net_0[8];
assign MDDR_SMC_AHB_M_HADDR_21_net_0[9]   = MDDR_SMC_AHB_M_HADDR_21[9];
assign MDDR_SMC_AHB_M_HADDR[9:9]          = MDDR_SMC_AHB_M_HADDR_21_net_0[9];
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign MDDR_SMC_AHB_M_HADDR_net_0[31]     = F_RDATA_HRDATA01_net_0[31:31];
assign MDDR_SMC_AHB_M_HADDR_0[30]         = F_RDATA_HRDATA01_net_0[30:30];
assign MDDR_SMC_AHB_M_HADDR_1[29]         = F_RDATA_HRDATA01_net_0[29:29];
assign MDDR_SMC_AHB_M_HADDR_2[28]         = F_RDATA_HRDATA01_net_0[28:28];
assign MDDR_SMC_AHB_M_HADDR_3[27]         = F_RDATA_HRDATA01_net_0[27:27];
assign MDDR_SMC_AHB_M_HADDR_4[26]         = F_RDATA_HRDATA01_net_0[26:26];
assign MDDR_SMC_AHB_M_HADDR_5[25]         = F_RDATA_HRDATA01_net_0[25:25];
assign MDDR_SMC_AHB_M_HADDR_6[24]         = F_RDATA_HRDATA01_net_0[24:24];
assign MDDR_SMC_AHB_M_HADDR_7[23]         = F_RDATA_HRDATA01_net_0[23:23];
assign MDDR_SMC_AHB_M_HADDR_8[22]         = F_RDATA_HRDATA01_net_0[22:22];
assign MDDR_SMC_AHB_M_HADDR_9[21]         = F_RDATA_HRDATA01_net_0[21:21];
assign MDDR_SMC_AHB_M_HADDR_10[20]        = F_RDATA_HRDATA01_net_0[20:20];
assign MDDR_SMC_AHB_M_HADDR_11[19]        = F_RDATA_HRDATA01_net_0[19:19];
assign MDDR_SMC_AHB_M_HADDR_12[18]        = F_RDATA_HRDATA01_net_0[18:18];
assign MDDR_SMC_AHB_M_HADDR_13[17]        = F_RDATA_HRDATA01_net_0[17:17];
assign MDDR_SMC_AHB_M_HADDR_14[16]        = F_RDATA_HRDATA01_net_0[16:16];
assign MDDR_SMC_AHB_M_HADDR_15[15]        = F_RDATA_HRDATA01_net_0[15:15];
assign MDDR_SMC_AHB_M_HADDR_16[14]        = F_RDATA_HRDATA01_net_0[14:14];
assign MDDR_SMC_AHB_M_HADDR_17[13]        = F_RDATA_HRDATA01_net_0[13:13];
assign MDDR_SMC_AHB_M_HADDR_18[12]        = F_RDATA_HRDATA01_net_0[12:12];
assign MDDR_SMC_AHB_M_HADDR_19[11]        = F_RDATA_HRDATA01_net_0[11:11];
assign MDDR_SMC_AHB_M_HADDR_20[10]        = F_RDATA_HRDATA01_net_0[10:10];
assign MDDR_SMC_AHB_M_HADDR_21[9]         = F_RDATA_HRDATA01_net_0[9:9];
assign MDDR_SMC_AHB_M_HADDR_22[8]         = F_RDATA_HRDATA01_net_0[8:8];
assign MDDR_SMC_AHB_M_HADDR_23[7]         = F_RDATA_HRDATA01_net_0[7:7];
assign MDDR_SMC_AHB_M_HADDR_24[6]         = F_RDATA_HRDATA01_net_0[6:6];
assign MDDR_SMC_AHB_M_HADDR_25[5]         = F_RDATA_HRDATA01_net_0[5:5];
assign MDDR_SMC_AHB_M_HADDR_26[4]         = F_RDATA_HRDATA01_net_0[4:4];
assign MDDR_SMC_AHB_M_HADDR_27[3]         = F_RDATA_HRDATA01_net_0[3:3];
assign MDDR_SMC_AHB_M_HADDR_28[2]         = F_RDATA_HRDATA01_net_0[2:2];
assign MDDR_SMC_AHB_M_HADDR_29[1]         = F_RDATA_HRDATA01_net_0[1:1];
assign MDDR_SMC_AHB_M_HADDR_30[0]         = F_RDATA_HRDATA01_net_0[0:0];
assign MDDR_SMC_AHB_M_HBURST_net_0[2]     = F_BID_net_0[2:2];
assign MDDR_SMC_AHB_M_HBURST_0[1]         = F_BID_net_0[1:1];
assign MDDR_SMC_AHB_M_HBURST_1[0]         = F_BID_net_0[0:0];
assign MDDR_SMC_AHB_M_HRDATA_slice_0[31]  = MDDR_SMC_AHB_M_HRDATA[31:31];
assign MDDR_SMC_AHB_M_HRDATA_slice_1[30]  = MDDR_SMC_AHB_M_HRDATA[30:30];
assign MDDR_SMC_AHB_M_HRDATA_slice_2[29]  = MDDR_SMC_AHB_M_HRDATA[29:29];
assign MDDR_SMC_AHB_M_HRDATA_slice_3[28]  = MDDR_SMC_AHB_M_HRDATA[28:28];
assign MDDR_SMC_AHB_M_HRDATA_slice_4[27]  = MDDR_SMC_AHB_M_HRDATA[27:27];
assign MDDR_SMC_AHB_M_HRDATA_slice_5[26]  = MDDR_SMC_AHB_M_HRDATA[26:26];
assign MDDR_SMC_AHB_M_HRDATA_slice_6[25]  = MDDR_SMC_AHB_M_HRDATA[25:25];
assign MDDR_SMC_AHB_M_HRDATA_slice_7[24]  = MDDR_SMC_AHB_M_HRDATA[24:24];
assign MDDR_SMC_AHB_M_HRDATA_slice_8[23]  = MDDR_SMC_AHB_M_HRDATA[23:23];
assign MDDR_SMC_AHB_M_HRDATA_slice_9[22]  = MDDR_SMC_AHB_M_HRDATA[22:22];
assign MDDR_SMC_AHB_M_HRDATA_slice_10[21] = MDDR_SMC_AHB_M_HRDATA[21:21];
assign MDDR_SMC_AHB_M_HRDATA_slice_11[20] = MDDR_SMC_AHB_M_HRDATA[20:20];
assign MDDR_SMC_AHB_M_HRDATA_slice_12[19] = MDDR_SMC_AHB_M_HRDATA[19:19];
assign MDDR_SMC_AHB_M_HRDATA_slice_13[18] = MDDR_SMC_AHB_M_HRDATA[18:18];
assign MDDR_SMC_AHB_M_HRDATA_slice_14[17] = MDDR_SMC_AHB_M_HRDATA[17:17];
assign MDDR_SMC_AHB_M_HRDATA_slice_15[16] = MDDR_SMC_AHB_M_HRDATA[16:16];
assign MDDR_SMC_AHB_M_HRDATA_slice_16[15] = MDDR_SMC_AHB_M_HRDATA[15:15];
assign MDDR_SMC_AHB_M_HRDATA_slice_17[14] = MDDR_SMC_AHB_M_HRDATA[14:14];
assign MDDR_SMC_AHB_M_HRDATA_slice_18[13] = MDDR_SMC_AHB_M_HRDATA[13:13];
assign MDDR_SMC_AHB_M_HRDATA_slice_19[12] = MDDR_SMC_AHB_M_HRDATA[12:12];
assign MDDR_SMC_AHB_M_HRDATA_slice_20[11] = MDDR_SMC_AHB_M_HRDATA[11:11];
assign MDDR_SMC_AHB_M_HRDATA_slice_21[10] = MDDR_SMC_AHB_M_HRDATA[10:10];
assign MDDR_SMC_AHB_M_HRDATA_slice_22[9]  = MDDR_SMC_AHB_M_HRDATA[9:9];
assign MDDR_SMC_AHB_M_HRDATA_slice_23[8]  = MDDR_SMC_AHB_M_HRDATA[8:8];
assign MDDR_SMC_AHB_M_HRDATA_slice_24[7]  = MDDR_SMC_AHB_M_HRDATA[7:7];
assign MDDR_SMC_AHB_M_HRDATA_slice_25[6]  = MDDR_SMC_AHB_M_HRDATA[6:6];
assign MDDR_SMC_AHB_M_HRDATA_slice_26[5]  = MDDR_SMC_AHB_M_HRDATA[5:5];
assign MDDR_SMC_AHB_M_HRDATA_slice_27[4]  = MDDR_SMC_AHB_M_HRDATA[4:4];
assign MDDR_SMC_AHB_M_HRDATA_slice_28[3]  = MDDR_SMC_AHB_M_HRDATA[3:3];
assign MDDR_SMC_AHB_M_HRDATA_slice_29[2]  = MDDR_SMC_AHB_M_HRDATA[2:2];
assign MDDR_SMC_AHB_M_HRDATA_slice_30[1]  = MDDR_SMC_AHB_M_HRDATA[1:1];
assign MDDR_SMC_AHB_M_HRDATA_slice_31[0]  = MDDR_SMC_AHB_M_HRDATA[0:0];
assign MDDR_SMC_AHB_M_HSIZE_net_0[1]      = F_RID_net_0[1:1];
assign MDDR_SMC_AHB_M_HSIZE_0[0]          = F_RID_net_0[0:0];
assign MDDR_SMC_AHB_M_HWDATA_net_0[63]    = F_RDATA_HRDATA01_net_0[63:63];
assign MDDR_SMC_AHB_M_HWDATA_0[62]        = F_RDATA_HRDATA01_net_0[62:62];
assign MDDR_SMC_AHB_M_HWDATA_1[61]        = F_RDATA_HRDATA01_net_0[61:61];
assign MDDR_SMC_AHB_M_HWDATA_2[60]        = F_RDATA_HRDATA01_net_0[60:60];
assign MDDR_SMC_AHB_M_HWDATA_3[59]        = F_RDATA_HRDATA01_net_0[59:59];
assign MDDR_SMC_AHB_M_HWDATA_4[58]        = F_RDATA_HRDATA01_net_0[58:58];
assign MDDR_SMC_AHB_M_HWDATA_5[57]        = F_RDATA_HRDATA01_net_0[57:57];
assign MDDR_SMC_AHB_M_HWDATA_6[56]        = F_RDATA_HRDATA01_net_0[56:56];
assign MDDR_SMC_AHB_M_HWDATA_7[55]        = F_RDATA_HRDATA01_net_0[55:55];
assign MDDR_SMC_AHB_M_HWDATA_8[54]        = F_RDATA_HRDATA01_net_0[54:54];
assign MDDR_SMC_AHB_M_HWDATA_9[53]        = F_RDATA_HRDATA01_net_0[53:53];
assign MDDR_SMC_AHB_M_HWDATA_10[52]       = F_RDATA_HRDATA01_net_0[52:52];
assign MDDR_SMC_AHB_M_HWDATA_11[51]       = F_RDATA_HRDATA01_net_0[51:51];
assign MDDR_SMC_AHB_M_HWDATA_12[50]       = F_RDATA_HRDATA01_net_0[50:50];
assign MDDR_SMC_AHB_M_HWDATA_13[49]       = F_RDATA_HRDATA01_net_0[49:49];
assign MDDR_SMC_AHB_M_HWDATA_14[48]       = F_RDATA_HRDATA01_net_0[48:48];
assign MDDR_SMC_AHB_M_HWDATA_15[47]       = F_RDATA_HRDATA01_net_0[47:47];
assign MDDR_SMC_AHB_M_HWDATA_16[46]       = F_RDATA_HRDATA01_net_0[46:46];
assign MDDR_SMC_AHB_M_HWDATA_17[45]       = F_RDATA_HRDATA01_net_0[45:45];
assign MDDR_SMC_AHB_M_HWDATA_18[44]       = F_RDATA_HRDATA01_net_0[44:44];
assign MDDR_SMC_AHB_M_HWDATA_19[43]       = F_RDATA_HRDATA01_net_0[43:43];
assign MDDR_SMC_AHB_M_HWDATA_20[42]       = F_RDATA_HRDATA01_net_0[42:42];
assign MDDR_SMC_AHB_M_HWDATA_21[41]       = F_RDATA_HRDATA01_net_0[41:41];
assign MDDR_SMC_AHB_M_HWDATA_22[40]       = F_RDATA_HRDATA01_net_0[40:40];
assign MDDR_SMC_AHB_M_HWDATA_23[39]       = F_RDATA_HRDATA01_net_0[39:39];
assign MDDR_SMC_AHB_M_HWDATA_24[38]       = F_RDATA_HRDATA01_net_0[38:38];
assign MDDR_SMC_AHB_M_HWDATA_25[37]       = F_RDATA_HRDATA01_net_0[37:37];
assign MDDR_SMC_AHB_M_HWDATA_26[36]       = F_RDATA_HRDATA01_net_0[36:36];
assign MDDR_SMC_AHB_M_HWDATA_27[35]       = F_RDATA_HRDATA01_net_0[35:35];
assign MDDR_SMC_AHB_M_HWDATA_28[34]       = F_RDATA_HRDATA01_net_0[34:34];
assign MDDR_SMC_AHB_M_HWDATA_29[33]       = F_RDATA_HRDATA01_net_0[33:33];
assign MDDR_SMC_AHB_M_HWDATA_30[32]       = F_RDATA_HRDATA01_net_0[32:32];
assign F_BID_slice_0[3]                   = F_BID_net_0[3:3];
assign F_RID_slice_0[2]                   = F_RID_net_0[2:2];
assign F_RID_slice_1[3]                   = F_RID_net_0[3:3];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign F_AWLOCK_HMASTLOCK0_net_0 = { 1'b0 , MDDR_SMC_AHB_M_HRESP };
assign F_WDATA_HWDATA01_net_0    = { 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , MDDR_SMC_AHB_M_HRDATA_slice_0[31] , MDDR_SMC_AHB_M_HRDATA_slice_1[30] , MDDR_SMC_AHB_M_HRDATA_slice_2[29] , MDDR_SMC_AHB_M_HRDATA_slice_3[28] , MDDR_SMC_AHB_M_HRDATA_slice_4[27] , MDDR_SMC_AHB_M_HRDATA_slice_5[26] , MDDR_SMC_AHB_M_HRDATA_slice_6[25] , MDDR_SMC_AHB_M_HRDATA_slice_7[24] , MDDR_SMC_AHB_M_HRDATA_slice_8[23] , MDDR_SMC_AHB_M_HRDATA_slice_9[22] , MDDR_SMC_AHB_M_HRDATA_slice_10[21] , MDDR_SMC_AHB_M_HRDATA_slice_11[20] , MDDR_SMC_AHB_M_HRDATA_slice_12[19] , MDDR_SMC_AHB_M_HRDATA_slice_13[18] , MDDR_SMC_AHB_M_HRDATA_slice_14[17] , MDDR_SMC_AHB_M_HRDATA_slice_15[16] , MDDR_SMC_AHB_M_HRDATA_slice_16[15] , MDDR_SMC_AHB_M_HRDATA_slice_17[14] , MDDR_SMC_AHB_M_HRDATA_slice_18[13] , MDDR_SMC_AHB_M_HRDATA_slice_19[12] , MDDR_SMC_AHB_M_HRDATA_slice_20[11] , MDDR_SMC_AHB_M_HRDATA_slice_21[10] , MDDR_SMC_AHB_M_HRDATA_slice_22[9] , MDDR_SMC_AHB_M_HRDATA_slice_23[8] , MDDR_SMC_AHB_M_HRDATA_slice_24[7] , MDDR_SMC_AHB_M_HRDATA_slice_25[6] , MDDR_SMC_AHB_M_HRDATA_slice_26[5] , MDDR_SMC_AHB_M_HRDATA_slice_27[4] , MDDR_SMC_AHB_M_HRDATA_slice_28[3] , MDDR_SMC_AHB_M_HRDATA_slice_29[2] , MDDR_SMC_AHB_M_HRDATA_slice_30[1] , MDDR_SMC_AHB_M_HRDATA_slice_31[0] };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------BIBUF
BIBUF GPIO_GPIO_8_BI_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI0_SS1_USBA_DATA5_MGPIO8A_OUT ),
        .E   ( MSS_ADLIB_INST_SPI0_SS1_USBA_DATA5_MGPIO8A_OE ),
        // Outputs
        .Y   ( GPIO_GPIO_8_BI_PAD_Y ),
        // Inouts
        .PAD ( GPIO_8_BI ) 
        );

//--------BIBUF
BIBUF GPIO_GPIO_9_BI_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI0_SS2_USBA_DATA6_MGPIO9A_OUT ),
        .E   ( MSS_ADLIB_INST_SPI0_SS2_USBA_DATA6_MGPIO9A_OE ),
        // Outputs
        .Y   ( GPIO_GPIO_9_BI_PAD_Y ),
        // Inouts
        .PAD ( GPIO_9_BI ) 
        );

//--------BIBUF
BIBUF GPIO_GPIO_10_BI_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI0_SS3_USBA_DATA7_MGPIO10A_OUT ),
        .E   ( MSS_ADLIB_INST_SPI0_SS3_USBA_DATA7_MGPIO10A_OE ),
        // Outputs
        .Y   ( GPIO_GPIO_10_BI_PAD_Y ),
        // Inouts
        .PAD ( GPIO_10_BI ) 
        );

//--------BIBUF
BIBUF GPIO_GPIO_11_BI_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI1_SDI_MGPIO11A_OUT ),
        .E   ( MSS_ADLIB_INST_SPI1_SDI_MGPIO11A_OE ),
        // Outputs
        .Y   ( GPIO_GPIO_11_BI_PAD_Y ),
        // Inouts
        .PAD ( GPIO_11_BI ) 
        );

//--------BIBUF
BIBUF GPIO_GPIO_12_BI_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI1_SDO_MGPIO12A_OUT ),
        .E   ( MSS_ADLIB_INST_SPI1_SDO_MGPIO12A_OE ),
        // Outputs
        .Y   ( GPIO_GPIO_12_BI_PAD_Y ),
        // Inouts
        .PAD ( GPIO_12_BI ) 
        );

//--------BIBUF
BIBUF GPIO_GPIO_13_BI_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI1_SS0_MGPIO13A_OUT ),
        .E   ( MSS_ADLIB_INST_SPI1_SS0_MGPIO13A_OE ),
        // Outputs
        .Y   ( GPIO_GPIO_13_BI_PAD_Y ),
        // Inouts
        .PAD ( GPIO_13_BI ) 
        );

//--------BIBUF
BIBUF GPIO_GPIO_14_BI_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI1_SS1_MGPIO14A_OUT ),
        .E   ( MSS_ADLIB_INST_SPI1_SS1_MGPIO14A_OE ),
        // Outputs
        .Y   ( GPIO_GPIO_14_BI_PAD_Y ),
        // Inouts
        .PAD ( GPIO_14_BI ) 
        );

//--------BIBUF
BIBUF GPIO_GPIO_15_BI_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI1_SS2_MGPIO15A_OUT ),
        .E   ( MSS_ADLIB_INST_SPI1_SS2_MGPIO15A_OE ),
        // Outputs
        .Y   ( GPIO_GPIO_15_BI_PAD_Y ),
        // Inouts
        .PAD ( GPIO_15_BI ) 
        );

//--------BIBUF
BIBUF GPIO_GPIO_16_BI_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI1_SS3_MGPIO16A_OUT ),
        .E   ( MSS_ADLIB_INST_SPI1_SS3_MGPIO16A_OE ),
        // Outputs
        .Y   ( GPIO_GPIO_16_BI_PAD_Y ),
        // Inouts
        .PAD ( GPIO_16_BI ) 
        );

//--------BIBUF
BIBUF GPIO_GPIO_17_BI_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI1_SS4_MGPIO17A_OUT ),
        .E   ( MSS_ADLIB_INST_SPI1_SS4_MGPIO17A_OE ),
        // Outputs
        .Y   ( GPIO_GPIO_17_BI_PAD_Y ),
        // Inouts
        .PAD ( GPIO_17_BI ) 
        );

//--------BIBUF
BIBUF GPIO_GPIO_18_BI_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI1_SS5_MGPIO18A_OUT ),
        .E   ( MSS_ADLIB_INST_SPI1_SS5_MGPIO18A_OE ),
        // Outputs
        .Y   ( GPIO_GPIO_18_BI_PAD_Y ),
        // Inouts
        .PAD ( GPIO_18_BI ) 
        );

//--------BIBUF
BIBUF GPIO_GPIO_19_BI_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_MMUART0_CTS_USBC_DATA7_MGPIO19B_OUT ),
        .E   ( MSS_ADLIB_INST_MMUART0_CTS_USBC_DATA7_MGPIO19B_OE ),
        // Outputs
        .Y   ( GPIO_GPIO_19_BI_PAD_Y ),
        // Inouts
        .PAD ( GPIO_19_BI ) 
        );

//--------BIBUF
BIBUF GPIO_GPIO_20_BI_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_MMUART0_DSR_MGPIO20B_OUT ),
        .E   ( MSS_ADLIB_INST_MMUART0_DSR_MGPIO20B_OE ),
        // Outputs
        .Y   ( GPIO_GPIO_20_BI_PAD_Y ),
        // Inouts
        .PAD ( GPIO_20_BI ) 
        );

//--------BIBUF
BIBUF GPIO_GPIO_21_BI_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_MMUART0_RI_MGPIO21B_OUT ),
        .E   ( MSS_ADLIB_INST_MMUART0_RI_MGPIO21B_OE ),
        // Outputs
        .Y   ( GPIO_GPIO_21_BI_PAD_Y ),
        // Inouts
        .PAD ( GPIO_21_BI ) 
        );

//--------BIBUF
BIBUF GPIO_GPIO_22_BI_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_MMUART0_DCD_MGPIO22B_OUT ),
        .E   ( MSS_ADLIB_INST_MMUART0_DCD_MGPIO22B_OE ),
        // Outputs
        .Y   ( GPIO_GPIO_22_BI_PAD_Y ),
        // Inouts
        .PAD ( GPIO_22_BI ) 
        );

//--------BIBUF
BIBUF GPIO_GPIO_23_BI_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI1_SS6_MGPIO23A_OUT ),
        .E   ( MSS_ADLIB_INST_SPI1_SS6_MGPIO23A_OE ),
        // Outputs
        .Y   ( GPIO_GPIO_23_BI_PAD_Y ),
        // Inouts
        .PAD ( GPIO_23_BI ) 
        );

//--------BIBUF
BIBUF I2C_0_SCL_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_I2C0_SCL_USBC_DATA1_MGPIO31B_OUT ),
        .E   ( MSS_ADLIB_INST_I2C0_SCL_USBC_DATA1_MGPIO31B_OE ),
        // Outputs
        .Y   ( I2C_0_SCL_PAD_Y ),
        // Inouts
        .PAD ( I2C_0_SCL ) 
        );

//--------BIBUF
BIBUF I2C_0_SDA_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_I2C0_SDA_USBC_DATA0_MGPIO30B_OUT ),
        .E   ( MSS_ADLIB_INST_I2C0_SDA_USBC_DATA0_MGPIO30B_OE ),
        // Outputs
        .Y   ( I2C_0_SDA_PAD_Y ),
        // Inouts
        .PAD ( I2C_0_SDA ) 
        );

//--------INBUF
INBUF MMUART_0_RXD_PAD(
        // Inputs
        .PAD ( MMUART_0_RXD ),
        // Outputs
        .Y   ( MMUART_0_RXD_PAD_Y ) 
        );

//--------TRIBUFF
TRIBUFF MMUART_0_TXD_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_MMUART0_TXD_USBC_DIR_MGPIO27B_OUT ),
        .E   ( MSS_ADLIB_INST_MMUART0_TXD_USBC_DIR_MGPIO27B_OE ),
        // Outputs
        .PAD ( MMUART_0_TXD_net_0 ) 
        );

//--------MSS_010
MSS_010 #( 
        .ACT_UBITS         ( 56'hFFFFFFFFFFFFFF ),
        .DDR_CLK_FREQ      ( 100.0 ),
        .INIT              ( 1438'h00000401003612024290A429080000000000000000000000000000024290A4290A4290A4290A42000000000090A4290801203610000000000000000000000000000000000000000900000000F000000000000000000000000000000007FFFFFFFB000001007C33C000200006092C0104003FFFFE4000000000020300780000F0E01C000000035D44010842108421000001FE34001FF8000000400000000020091007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ),
        .MEMORYFILE        ( "ENVM_init.mem" ),
        .RTC_MAIN_XTL_FREQ ( 0.0 ),
        .RTC_MAIN_XTL_MODE ( "" ) )
MSS_ADLIB_INST(
        // Inputs
        .CAN_RXBUS_F2H_SCP                       ( VCC_net ), // tied to 1'b1 from definition
        .CAN_TX_EBL_F2H_SCP                      ( VCC_net ), // tied to 1'b1 from definition
        .CAN_TXBUS_F2H_SCP                       ( VCC_net ), // tied to 1'b1 from definition
        .COLF                                    ( VCC_net ), // tied to 1'b1 from definition
        .CRSF                                    ( VCC_net ), // tied to 1'b1 from definition
        .F2_DMAREADY                             ( F2_DMAREADY_const_net_0 ), // tied to 2'h3 from definition
        .F2H_INTERRUPT                           ( F2H_INTERRUPT_const_net_0 ), // tied to 16'h0000 from definition
        .F2HCALIB                                ( VCC_net ), // tied to 1'b1 from definition
        .F_DMAREADY                              ( F_DMAREADY_const_net_0 ), // tied to 2'h3 from definition
        .F_FM0_ADDR                              ( F_FM0_ADDR_const_net_0 ), // tied to 32'h00000000 from definition
        .F_FM0_ENABLE                            ( GND_net ), // tied to 1'b0 from definition
        .F_FM0_MASTLOCK                          ( GND_net ), // tied to 1'b0 from definition
        .F_FM0_READY                             ( VCC_net ), // tied to 1'b1 from definition
        .F_FM0_SEL                               ( GND_net ), // tied to 1'b0 from definition
        .F_FM0_SIZE                              ( F_FM0_SIZE_const_net_0 ), // tied to 2'h0 from definition
        .F_FM0_TRANS1                            ( GND_net ), // tied to 1'b0 from definition
        .F_FM0_WDATA                             ( F_FM0_WDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .F_FM0_WRITE                             ( GND_net ), // tied to 1'b0 from definition
        .F_HM0_RDATA                             ( F_HM0_RDATA_const_net_0 ), // tied to 32'h00000000 from definition
        .F_HM0_READY                             ( VCC_net ), // tied to 1'b1 from definition
        .F_HM0_RESP                              ( GND_net ), // tied to 1'b0 from definition
        .FAB_AVALID                              ( VCC_net ), // tied to 1'b1 from definition
        .FAB_HOSTDISCON                          ( VCC_net ), // tied to 1'b1 from definition
        .FAB_IDDIG                               ( VCC_net ), // tied to 1'b1 from definition
        .FAB_LINESTATE                           ( FAB_LINESTATE_const_net_0 ), // tied to 2'h3 from definition
        .FAB_M3_RESET_N                          ( VCC_net ), // tied to 1'b1 from definition
        .FAB_PLL_LOCK                            ( MCCC_CLK_BASE_PLL_LOCK ),
        .FAB_RXACTIVE                            ( VCC_net ), // tied to 1'b1 from definition
        .FAB_RXERROR                             ( VCC_net ), // tied to 1'b1 from definition
        .FAB_RXVALID                             ( VCC_net ), // tied to 1'b1 from definition
        .FAB_RXVALIDH                            ( GND_net ), // tied to 1'b0 from definition
        .FAB_SESSEND                             ( VCC_net ), // tied to 1'b1 from definition
        .FAB_TXREADY                             ( VCC_net ), // tied to 1'b1 from definition
        .FAB_VBUSVALID                           ( VCC_net ), // tied to 1'b1 from definition
        .FAB_VSTATUS                             ( FAB_VSTATUS_const_net_0 ), // tied to 8'hFF from definition
        .FAB_XDATAIN                             ( FAB_XDATAIN_const_net_0 ), // tied to 8'hFF from definition
        .GTX_CLKPF                               ( VCC_net ), // tied to 1'b1 from definition
        .I2C0_BCLK                               ( VCC_net ), // tied to 1'b1 from definition
        .I2C0_SCL_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .I2C0_SDA_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .I2C1_BCLK                               ( VCC_net ), // tied to 1'b1 from definition
        .I2C1_SCL_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .I2C1_SDA_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .MDIF                                    ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO0A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO10A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO11A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO11B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO12A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO13A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO14A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO15A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO16A_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO17B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO18B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO19B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO1A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO20B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO21B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO22B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO24B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO25B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO26B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO27B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO28B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO29B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO2A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO30B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO31B_F2H_GPIN                       ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO3A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO4A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO5A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO6A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO7A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO8A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MGPIO9A_F2H_GPIN                        ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_CTS_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_DCD_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_DSR_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_DTR_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_RI_F2H_SCP                      ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_RTS_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_RXD_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_SCK_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART0_TXD_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_CTS_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_DCD_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_DSR_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_RI_F2H_SCP                      ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_RTS_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_RXD_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_SCK_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .MMUART1_TXD_F2H_SCP                     ( VCC_net ), // tied to 1'b1 from definition
        .PER2_FABRIC_PRDATA                      ( PER2_FABRIC_PRDATA_const_net_0 ), // tied to 32'hFFFFFFFF from definition
        .PER2_FABRIC_PREADY                      ( VCC_net ), // tied to 1'b1 from definition
        .PER2_FABRIC_PSLVERR                     ( VCC_net ), // tied to 1'b1 from definition
        .RCGF                                    ( RCGF_const_net_0 ), // tied to 10'h3FF from definition
        .RX_CLKPF                                ( VCC_net ), // tied to 1'b1 from definition
        .RX_DVF                                  ( VCC_net ), // tied to 1'b1 from definition
        .RX_ERRF                                 ( VCC_net ), // tied to 1'b1 from definition
        .RX_EV                                   ( VCC_net ), // tied to 1'b1 from definition
        .RXDF                                    ( RXDF_const_net_0 ), // tied to 8'hFF from definition
        .SLEEPHOLDREQ                            ( GND_net ), // tied to 1'b0 from definition
        .SMBALERT_NI0                            ( VCC_net ), // tied to 1'b1 from definition
        .SMBALERT_NI1                            ( VCC_net ), // tied to 1'b1 from definition
        .SMBSUS_NI0                              ( VCC_net ), // tied to 1'b1 from definition
        .SMBSUS_NI1                              ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_CLK_IN                             ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_SDI_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_SDO_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_SS0_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_SS1_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_SS2_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI0_SS3_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_CLK_IN                             ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_SDI_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_SDO_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_SS0_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_SS1_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_SS2_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .SPI1_SS3_F2H_SCP                        ( VCC_net ), // tied to 1'b1 from definition
        .TX_CLKPF                                ( VCC_net ), // tied to 1'b1 from definition
        .USER_MSS_GPIO_RESET_N                   ( VCC_net ), // tied to 1'b1 from definition
        .USER_MSS_RESET_N                        ( MSS_RESET_N_F2M ),
        .XCLK_FAB                                ( VCC_net ), // tied to 1'b1 from definition
        .CLK_BASE                                ( MCCC_CLK_BASE ),
        .CLK_MDDR_APB                            ( VCC_net ), // tied to 1'b1 from definition
        .F_ARADDR_HADDR1                         ( F_ARADDR_HADDR1_const_net_0 ), // tied to 32'hFFFFFFFF from definition
        .F_ARBURST_HTRANS1                       ( F_ARBURST_HTRANS1_const_net_0 ), // tied to 2'h0 from definition
        .F_ARID_HSEL1                            ( F_ARID_HSEL1_const_net_0 ), // tied to 4'h0 from definition
        .F_ARLEN_HBURST1                         ( F_ARLEN_HBURST1_const_net_0 ), // tied to 4'h0 from definition
        .F_ARLOCK_HMASTLOCK1                     ( F_ARLOCK_HMASTLOCK1_const_net_0 ), // tied to 2'h0 from definition
        .F_ARSIZE_HSIZE1                         ( F_ARSIZE_HSIZE1_const_net_0 ), // tied to 2'h0 from definition
        .F_ARVALID_HWRITE1                       ( GND_net ), // tied to 1'b0 from definition
        .F_AWADDR_HADDR0                         ( F_AWADDR_HADDR0_const_net_0 ), // tied to 32'hFFFFFFFF from definition
        .F_AWBURST_HTRANS0                       ( F_AWBURST_HTRANS0_const_net_0 ), // tied to 2'h0 from definition
        .F_AWID_HSEL0                            ( F_AWID_HSEL0_const_net_0 ), // tied to 4'h0 from definition
        .F_AWLEN_HBURST0                         ( F_AWLEN_HBURST0_const_net_0 ), // tied to 4'h0 from definition
        .F_AWLOCK_HMASTLOCK0                     ( F_AWLOCK_HMASTLOCK0_net_0 ),
        .F_AWSIZE_HSIZE0                         ( F_AWSIZE_HSIZE0_const_net_0 ), // tied to 2'h0 from definition
        .F_AWVALID_HWRITE0                       ( GND_net ), // tied to 1'b0 from definition
        .F_BREADY                                ( GND_net ), // tied to 1'b0 from definition
        .F_RMW_AXI                               ( GND_net ), // tied to 1'b0 from definition
        .F_RREADY                                ( GND_net ), // tied to 1'b0 from definition
        .F_WDATA_HWDATA01                        ( F_WDATA_HWDATA01_net_0 ),
        .F_WID_HREADY01                          ( F_WID_HREADY01_const_net_0 ), // tied to 4'h0 from definition
        .F_WLAST                                 ( MDDR_SMC_AHB_M_HREADY ),
        .F_WSTRB                                 ( F_WSTRB_const_net_0 ), // tied to 8'h00 from definition
        .F_WVALID                                ( GND_net ), // tied to 1'b0 from definition
        .FPGA_MDDR_ARESET_N                      ( VCC_net ), // tied to 1'b1 from definition
        .MDDR_FABRIC_PADDR                       ( MDDR_FABRIC_PADDR_const_net_0 ), // tied to 9'h1FF from definition
        .MDDR_FABRIC_PENABLE                     ( VCC_net ), // tied to 1'b1 from definition
        .MDDR_FABRIC_PSEL                        ( VCC_net ), // tied to 1'b1 from definition
        .MDDR_FABRIC_PWDATA                      ( MDDR_FABRIC_PWDATA_const_net_0 ), // tied to 16'hFFFF from definition
        .MDDR_FABRIC_PWRITE                      ( VCC_net ), // tied to 1'b1 from definition
        .PRESET_N                                ( GND_net ), // tied to 1'b0 from definition
        .CAN_RXBUS_USBA_DATA1_MGPIO3A_IN         ( GND_net ),
        .CAN_TX_EBL_USBA_DATA2_MGPIO4A_IN        ( GND_net ),
        .CAN_TXBUS_USBA_DATA0_MGPIO2A_IN         ( GND_net ),
        .DM_IN                                   ( DM_IN_const_net_0 ),
        .DRAM_DQ_IN                              ( DRAM_DQ_IN_const_net_0 ),
        .DRAM_DQS_IN                             ( DRAM_DQS_IN_const_net_0 ),
        .DRAM_FIFO_WE_IN                         ( DRAM_FIFO_WE_IN_const_net_0 ),
        .I2C0_SCL_USBC_DATA1_MGPIO31B_IN         ( I2C_0_SCL_PAD_Y ),
        .I2C0_SDA_USBC_DATA0_MGPIO30B_IN         ( I2C_0_SDA_PAD_Y ),
        .I2C1_SCL_USBA_DATA4_MGPIO1A_IN          ( GND_net ),
        .I2C1_SDA_USBA_DATA3_MGPIO0A_IN          ( GND_net ),
        .MMUART0_CTS_USBC_DATA7_MGPIO19B_IN      ( GPIO_GPIO_19_BI_PAD_Y ),
        .MMUART0_DCD_MGPIO22B_IN                 ( GPIO_GPIO_22_BI_PAD_Y ),
        .MMUART0_DSR_MGPIO20B_IN                 ( GPIO_GPIO_20_BI_PAD_Y ),
        .MMUART0_DTR_USBC_DATA6_MGPIO18B_IN      ( GND_net ),
        .MMUART0_RI_MGPIO21B_IN                  ( GPIO_GPIO_21_BI_PAD_Y ),
        .MMUART0_RTS_USBC_DATA5_MGPIO17B_IN      ( GND_net ),
        .MMUART0_RXD_USBC_STP_MGPIO28B_IN        ( MMUART_0_RXD_PAD_Y ),
        .MMUART0_SCK_USBC_NXT_MGPIO29B_IN        ( GND_net ),
        .MMUART0_TXD_USBC_DIR_MGPIO27B_IN        ( GND_net ),
        .MMUART1_RXD_USBC_DATA3_MGPIO26B_IN      ( GND_net ),
        .MMUART1_SCK_USBC_DATA4_MGPIO25B_IN      ( GND_net ),
        .MMUART1_TXD_USBC_DATA2_MGPIO24B_IN      ( GND_net ),
        .RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_IN     ( GND_net ),
        .RGMII_MDC_RMII_MDC_IN                   ( GND_net ),
        .RGMII_MDIO_RMII_MDIO_USBB_DATA7_IN      ( GND_net ),
        .RGMII_RX_CLK_IN                         ( GND_net ),
        .RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_IN  ( GND_net ),
        .RGMII_RXD0_RMII_RXD0_USBB_DATA0_IN      ( GND_net ),
        .RGMII_RXD1_RMII_RXD1_USBB_DATA1_IN      ( GND_net ),
        .RGMII_RXD2_RMII_RX_ER_USBB_DATA3_IN     ( GND_net ),
        .RGMII_RXD3_USBB_DATA4_IN                ( GND_net ),
        .RGMII_TX_CLK_IN                         ( GND_net ),
        .RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_IN     ( GND_net ),
        .RGMII_TXD0_RMII_TXD0_USBB_DIR_IN        ( GND_net ),
        .RGMII_TXD1_RMII_TXD1_USBB_STP_IN        ( GND_net ),
        .RGMII_TXD2_USBB_DATA5_IN                ( GND_net ),
        .RGMII_TXD3_USBB_DATA6_IN                ( GND_net ),
        .SPI0_SCK_USBA_XCLK_IN                   ( SPI_0_CLK_PAD_Y ),
        .SPI0_SDI_USBA_DIR_MGPIO5A_IN            ( SPI_0_DI_PAD_Y ),
        .SPI0_SDO_USBA_STP_MGPIO6A_IN            ( GND_net ),
        .SPI0_SS0_USBA_NXT_MGPIO7A_IN            ( SPI_0_SS0_PAD_Y ),
        .SPI0_SS1_USBA_DATA5_MGPIO8A_IN          ( GPIO_GPIO_8_BI_PAD_Y ),
        .SPI0_SS2_USBA_DATA6_MGPIO9A_IN          ( GPIO_GPIO_9_BI_PAD_Y ),
        .SPI0_SS3_USBA_DATA7_MGPIO10A_IN         ( GPIO_GPIO_10_BI_PAD_Y ),
        .SPI1_SCK_IN                             ( GND_net ),
        .SPI1_SDI_MGPIO11A_IN                    ( GPIO_GPIO_11_BI_PAD_Y ),
        .SPI1_SDO_MGPIO12A_IN                    ( GPIO_GPIO_12_BI_PAD_Y ),
        .SPI1_SS0_MGPIO13A_IN                    ( GPIO_GPIO_13_BI_PAD_Y ),
        .SPI1_SS1_MGPIO14A_IN                    ( GPIO_GPIO_14_BI_PAD_Y ),
        .SPI1_SS2_MGPIO15A_IN                    ( GPIO_GPIO_15_BI_PAD_Y ),
        .SPI1_SS3_MGPIO16A_IN                    ( GPIO_GPIO_16_BI_PAD_Y ),
        .SPI1_SS4_MGPIO17A_IN                    ( GPIO_GPIO_17_BI_PAD_Y ),
        .SPI1_SS5_MGPIO18A_IN                    ( GPIO_GPIO_18_BI_PAD_Y ),
        .SPI1_SS6_MGPIO23A_IN                    ( GPIO_GPIO_23_BI_PAD_Y ),
        .SPI1_SS7_MGPIO24A_IN                    ( GND_net ),
        .USBC_XCLK_IN                            ( GND_net ),
        // Outputs
        .CAN_RXBUS_MGPIO3A_H2F_A                 (  ),
        .CAN_RXBUS_MGPIO3A_H2F_B                 (  ),
        .CAN_TX_EBL_MGPIO4A_H2F_A                (  ),
        .CAN_TX_EBL_MGPIO4A_H2F_B                (  ),
        .CAN_TXBUS_MGPIO2A_H2F_A                 (  ),
        .CAN_TXBUS_MGPIO2A_H2F_B                 (  ),
        .CLK_CONFIG_APB                          (  ),
        .COMMS_INT                               (  ),
        .CONFIG_PRESET_N                         (  ),
        .EDAC_ERROR                              (  ),
        .F_FM0_RDATA                             (  ),
        .F_FM0_READYOUT                          (  ),
        .F_FM0_RESP                              (  ),
        .F_HM0_ADDR                              (  ),
        .F_HM0_ENABLE                            (  ),
        .F_HM0_SEL                               (  ),
        .F_HM0_SIZE                              (  ),
        .F_HM0_TRANS1                            (  ),
        .F_HM0_WDATA                             (  ),
        .F_HM0_WRITE                             (  ),
        .FAB_CHRGVBUS                            (  ),
        .FAB_DISCHRGVBUS                         (  ),
        .FAB_DMPULLDOWN                          (  ),
        .FAB_DPPULLDOWN                          (  ),
        .FAB_DRVVBUS                             (  ),
        .FAB_IDPULLUP                            (  ),
        .FAB_OPMODE                              (  ),
        .FAB_SUSPENDM                            (  ),
        .FAB_TERMSEL                             (  ),
        .FAB_TXVALID                             (  ),
        .FAB_VCONTROL                            (  ),
        .FAB_VCONTROLLOADM                       (  ),
        .FAB_XCVRSEL                             (  ),
        .FAB_XDATAOUT                            (  ),
        .FACC_GLMUX_SEL                          (  ),
        .FIC32_0_MASTER                          (  ),
        .FIC32_1_MASTER                          (  ),
        .FPGA_RESET_N                            ( MSS_RESET_N_M2F_net_0 ),
        .GTX_CLK                                 (  ),
        .H2F_INTERRUPT                           (  ),
        .H2F_NMI                                 (  ),
        .H2FCALIB                                (  ),
        .I2C0_SCL_MGPIO31B_H2F_A                 (  ),
        .I2C0_SCL_MGPIO31B_H2F_B                 (  ),
        .I2C0_SDA_MGPIO30B_H2F_A                 (  ),
        .I2C0_SDA_MGPIO30B_H2F_B                 (  ),
        .I2C1_SCL_MGPIO1A_H2F_A                  (  ),
        .I2C1_SCL_MGPIO1A_H2F_B                  (  ),
        .I2C1_SDA_MGPIO0A_H2F_A                  (  ),
        .I2C1_SDA_MGPIO0A_H2F_B                  (  ),
        .MDCF                                    (  ),
        .MDOENF                                  (  ),
        .MDOF                                    (  ),
        .MMUART0_CTS_MGPIO19B_H2F_A              (  ),
        .MMUART0_CTS_MGPIO19B_H2F_B              (  ),
        .MMUART0_DCD_MGPIO22B_H2F_A              (  ),
        .MMUART0_DCD_MGPIO22B_H2F_B              (  ),
        .MMUART0_DSR_MGPIO20B_H2F_A              (  ),
        .MMUART0_DSR_MGPIO20B_H2F_B              (  ),
        .MMUART0_DTR_MGPIO18B_H2F_A              (  ),
        .MMUART0_DTR_MGPIO18B_H2F_B              (  ),
        .MMUART0_RI_MGPIO21B_H2F_A               (  ),
        .MMUART0_RI_MGPIO21B_H2F_B               (  ),
        .MMUART0_RTS_MGPIO17B_H2F_A              (  ),
        .MMUART0_RTS_MGPIO17B_H2F_B              (  ),
        .MMUART0_RXD_MGPIO28B_H2F_A              (  ),
        .MMUART0_RXD_MGPIO28B_H2F_B              (  ),
        .MMUART0_SCK_MGPIO29B_H2F_A              (  ),
        .MMUART0_SCK_MGPIO29B_H2F_B              (  ),
        .MMUART0_TXD_MGPIO27B_H2F_A              (  ),
        .MMUART0_TXD_MGPIO27B_H2F_B              (  ),
        .MMUART1_DTR_MGPIO12B_H2F_A              (  ),
        .MMUART1_RTS_MGPIO11B_H2F_A              (  ),
        .MMUART1_RTS_MGPIO11B_H2F_B              (  ),
        .MMUART1_RXD_MGPIO26B_H2F_A              (  ),
        .MMUART1_RXD_MGPIO26B_H2F_B              (  ),
        .MMUART1_SCK_MGPIO25B_H2F_A              (  ),
        .MMUART1_SCK_MGPIO25B_H2F_B              (  ),
        .MMUART1_TXD_MGPIO24B_H2F_A              (  ),
        .MMUART1_TXD_MGPIO24B_H2F_B              (  ),
        .MPLL_LOCK                               (  ),
        .PER2_FABRIC_PADDR                       (  ),
        .PER2_FABRIC_PENABLE                     (  ),
        .PER2_FABRIC_PSEL                        (  ),
        .PER2_FABRIC_PWDATA                      (  ),
        .PER2_FABRIC_PWRITE                      (  ),
        .RTC_MATCH                               (  ),
        .SLEEPDEEP                               (  ),
        .SLEEPHOLDACK                            (  ),
        .SLEEPING                                (  ),
        .SMBALERT_NO0                            (  ),
        .SMBALERT_NO1                            (  ),
        .SMBSUS_NO0                              (  ),
        .SMBSUS_NO1                              (  ),
        .SPI0_CLK_OUT                            (  ),
        .SPI0_SDI_MGPIO5A_H2F_A                  (  ),
        .SPI0_SDI_MGPIO5A_H2F_B                  (  ),
        .SPI0_SDO_MGPIO6A_H2F_A                  (  ),
        .SPI0_SDO_MGPIO6A_H2F_B                  (  ),
        .SPI0_SS0_MGPIO7A_H2F_A                  (  ),
        .SPI0_SS0_MGPIO7A_H2F_B                  (  ),
        .SPI0_SS1_MGPIO8A_H2F_A                  (  ),
        .SPI0_SS1_MGPIO8A_H2F_B                  (  ),
        .SPI0_SS2_MGPIO9A_H2F_A                  (  ),
        .SPI0_SS2_MGPIO9A_H2F_B                  (  ),
        .SPI0_SS3_MGPIO10A_H2F_A                 (  ),
        .SPI0_SS3_MGPIO10A_H2F_B                 (  ),
        .SPI0_SS4_MGPIO19A_H2F_A                 (  ),
        .SPI0_SS5_MGPIO20A_H2F_A                 (  ),
        .SPI0_SS6_MGPIO21A_H2F_A                 (  ),
        .SPI0_SS7_MGPIO22A_H2F_A                 (  ),
        .SPI1_CLK_OUT                            (  ),
        .SPI1_SDI_MGPIO11A_H2F_A                 (  ),
        .SPI1_SDI_MGPIO11A_H2F_B                 (  ),
        .SPI1_SDO_MGPIO12A_H2F_A                 (  ),
        .SPI1_SDO_MGPIO12A_H2F_B                 (  ),
        .SPI1_SS0_MGPIO13A_H2F_A                 (  ),
        .SPI1_SS0_MGPIO13A_H2F_B                 (  ),
        .SPI1_SS1_MGPIO14A_H2F_A                 (  ),
        .SPI1_SS1_MGPIO14A_H2F_B                 (  ),
        .SPI1_SS2_MGPIO15A_H2F_A                 (  ),
        .SPI1_SS2_MGPIO15A_H2F_B                 (  ),
        .SPI1_SS3_MGPIO16A_H2F_A                 (  ),
        .SPI1_SS3_MGPIO16A_H2F_B                 (  ),
        .SPI1_SS4_MGPIO17A_H2F_A                 (  ),
        .SPI1_SS5_MGPIO18A_H2F_A                 (  ),
        .SPI1_SS6_MGPIO23A_H2F_A                 (  ),
        .SPI1_SS7_MGPIO24A_H2F_A                 (  ),
        .TCGF                                    (  ),
        .TRACECLK                                (  ),
        .TRACEDATA                               (  ),
        .TX_CLK                                  (  ),
        .TX_ENF                                  (  ),
        .TX_ERRF                                 (  ),
        .TXCTL_EN_RIF                            (  ),
        .TXD_RIF                                 (  ),
        .TXDF                                    (  ),
        .TXEV                                    (  ),
        .WDOGTIMEOUT                             (  ),
        .F_ARREADY_HREADYOUT1                    ( MDDR_SMC_AHB_M_HWRITE_net_0 ),
        .F_AWREADY_HREADYOUT0                    (  ),
        .F_BID                                   ( F_BID_net_0 ),
        .F_BRESP_HRESP0                          ( MDDR_SMC_AHB_M_HTRANS_net_0 ),
        .F_BVALID                                ( MDDR_SMC_AHB_M_HMASTLOCK_net_0 ),
        .F_RDATA_HRDATA01                        ( F_RDATA_HRDATA01_net_0 ),
        .F_RID                                   ( F_RID_net_0 ),
        .F_RLAST                                 (  ),
        .F_RRESP_HRESP1                          (  ),
        .F_RVALID                                (  ),
        .F_WREADY                                (  ),
        .MDDR_FABRIC_PRDATA                      (  ),
        .MDDR_FABRIC_PREADY                      (  ),
        .MDDR_FABRIC_PSLVERR                     (  ),
        .CAN_RXBUS_USBA_DATA1_MGPIO3A_OUT        (  ),
        .CAN_TX_EBL_USBA_DATA2_MGPIO4A_OUT       (  ),
        .CAN_TXBUS_USBA_DATA0_MGPIO2A_OUT        (  ),
        .DRAM_ADDR                               (  ),
        .DRAM_BA                                 (  ),
        .DRAM_CASN                               (  ),
        .DRAM_CKE                                (  ),
        .DRAM_CLK                                (  ),
        .DRAM_CSN                                (  ),
        .DRAM_DM_RDQS_OUT                        (  ),
        .DRAM_DQ_OUT                             (  ),
        .DRAM_DQS_OUT                            (  ),
        .DRAM_FIFO_WE_OUT                        (  ),
        .DRAM_ODT                                (  ),
        .DRAM_RASN                               (  ),
        .DRAM_RSTN                               (  ),
        .DRAM_WEN                                (  ),
        .I2C0_SCL_USBC_DATA1_MGPIO31B_OUT        ( MSS_ADLIB_INST_I2C0_SCL_USBC_DATA1_MGPIO31B_OUT ),
        .I2C0_SDA_USBC_DATA0_MGPIO30B_OUT        ( MSS_ADLIB_INST_I2C0_SDA_USBC_DATA0_MGPIO30B_OUT ),
        .I2C1_SCL_USBA_DATA4_MGPIO1A_OUT         (  ),
        .I2C1_SDA_USBA_DATA3_MGPIO0A_OUT         (  ),
        .MMUART0_CTS_USBC_DATA7_MGPIO19B_OUT     ( MSS_ADLIB_INST_MMUART0_CTS_USBC_DATA7_MGPIO19B_OUT ),
        .MMUART0_DCD_MGPIO22B_OUT                ( MSS_ADLIB_INST_MMUART0_DCD_MGPIO22B_OUT ),
        .MMUART0_DSR_MGPIO20B_OUT                ( MSS_ADLIB_INST_MMUART0_DSR_MGPIO20B_OUT ),
        .MMUART0_DTR_USBC_DATA6_MGPIO18B_OUT     (  ),
        .MMUART0_RI_MGPIO21B_OUT                 ( MSS_ADLIB_INST_MMUART0_RI_MGPIO21B_OUT ),
        .MMUART0_RTS_USBC_DATA5_MGPIO17B_OUT     (  ),
        .MMUART0_RXD_USBC_STP_MGPIO28B_OUT       (  ),
        .MMUART0_SCK_USBC_NXT_MGPIO29B_OUT       (  ),
        .MMUART0_TXD_USBC_DIR_MGPIO27B_OUT       ( MSS_ADLIB_INST_MMUART0_TXD_USBC_DIR_MGPIO27B_OUT ),
        .MMUART1_RXD_USBC_DATA3_MGPIO26B_OUT     (  ),
        .MMUART1_SCK_USBC_DATA4_MGPIO25B_OUT     (  ),
        .MMUART1_TXD_USBC_DATA2_MGPIO24B_OUT     (  ),
        .RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_OUT    (  ),
        .RGMII_MDC_RMII_MDC_OUT                  (  ),
        .RGMII_MDIO_RMII_MDIO_USBB_DATA7_OUT     (  ),
        .RGMII_RX_CLK_OUT                        (  ),
        .RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OUT (  ),
        .RGMII_RXD0_RMII_RXD0_USBB_DATA0_OUT     (  ),
        .RGMII_RXD1_RMII_RXD1_USBB_DATA1_OUT     (  ),
        .RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OUT    (  ),
        .RGMII_RXD3_USBB_DATA4_OUT               (  ),
        .RGMII_TX_CLK_OUT                        (  ),
        .RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_OUT    (  ),
        .RGMII_TXD0_RMII_TXD0_USBB_DIR_OUT       (  ),
        .RGMII_TXD1_RMII_TXD1_USBB_STP_OUT       (  ),
        .RGMII_TXD2_USBB_DATA5_OUT               (  ),
        .RGMII_TXD3_USBB_DATA6_OUT               (  ),
        .SPI0_SCK_USBA_XCLK_OUT                  ( MSS_ADLIB_INST_SPI0_SCK_USBA_XCLK_OUT ),
        .SPI0_SDI_USBA_DIR_MGPIO5A_OUT           (  ),
        .SPI0_SDO_USBA_STP_MGPIO6A_OUT           ( MSS_ADLIB_INST_SPI0_SDO_USBA_STP_MGPIO6A_OUT ),
        .SPI0_SS0_USBA_NXT_MGPIO7A_OUT           ( MSS_ADLIB_INST_SPI0_SS0_USBA_NXT_MGPIO7A_OUT ),
        .SPI0_SS1_USBA_DATA5_MGPIO8A_OUT         ( MSS_ADLIB_INST_SPI0_SS1_USBA_DATA5_MGPIO8A_OUT ),
        .SPI0_SS2_USBA_DATA6_MGPIO9A_OUT         ( MSS_ADLIB_INST_SPI0_SS2_USBA_DATA6_MGPIO9A_OUT ),
        .SPI0_SS3_USBA_DATA7_MGPIO10A_OUT        ( MSS_ADLIB_INST_SPI0_SS3_USBA_DATA7_MGPIO10A_OUT ),
        .SPI1_SCK_OUT                            (  ),
        .SPI1_SDI_MGPIO11A_OUT                   ( MSS_ADLIB_INST_SPI1_SDI_MGPIO11A_OUT ),
        .SPI1_SDO_MGPIO12A_OUT                   ( MSS_ADLIB_INST_SPI1_SDO_MGPIO12A_OUT ),
        .SPI1_SS0_MGPIO13A_OUT                   ( MSS_ADLIB_INST_SPI1_SS0_MGPIO13A_OUT ),
        .SPI1_SS1_MGPIO14A_OUT                   ( MSS_ADLIB_INST_SPI1_SS1_MGPIO14A_OUT ),
        .SPI1_SS2_MGPIO15A_OUT                   ( MSS_ADLIB_INST_SPI1_SS2_MGPIO15A_OUT ),
        .SPI1_SS3_MGPIO16A_OUT                   ( MSS_ADLIB_INST_SPI1_SS3_MGPIO16A_OUT ),
        .SPI1_SS4_MGPIO17A_OUT                   ( MSS_ADLIB_INST_SPI1_SS4_MGPIO17A_OUT ),
        .SPI1_SS5_MGPIO18A_OUT                   ( MSS_ADLIB_INST_SPI1_SS5_MGPIO18A_OUT ),
        .SPI1_SS6_MGPIO23A_OUT                   ( MSS_ADLIB_INST_SPI1_SS6_MGPIO23A_OUT ),
        .SPI1_SS7_MGPIO24A_OUT                   (  ),
        .USBC_XCLK_OUT                           (  ),
        .CAN_RXBUS_USBA_DATA1_MGPIO3A_OE         (  ),
        .CAN_TX_EBL_USBA_DATA2_MGPIO4A_OE        (  ),
        .CAN_TXBUS_USBA_DATA0_MGPIO2A_OE         (  ),
        .DM_OE                                   (  ),
        .DRAM_DQ_OE                              (  ),
        .DRAM_DQS_OE                             (  ),
        .I2C0_SCL_USBC_DATA1_MGPIO31B_OE         ( MSS_ADLIB_INST_I2C0_SCL_USBC_DATA1_MGPIO31B_OE ),
        .I2C0_SDA_USBC_DATA0_MGPIO30B_OE         ( MSS_ADLIB_INST_I2C0_SDA_USBC_DATA0_MGPIO30B_OE ),
        .I2C1_SCL_USBA_DATA4_MGPIO1A_OE          (  ),
        .I2C1_SDA_USBA_DATA3_MGPIO0A_OE          (  ),
        .MMUART0_CTS_USBC_DATA7_MGPIO19B_OE      ( MSS_ADLIB_INST_MMUART0_CTS_USBC_DATA7_MGPIO19B_OE ),
        .MMUART0_DCD_MGPIO22B_OE                 ( MSS_ADLIB_INST_MMUART0_DCD_MGPIO22B_OE ),
        .MMUART0_DSR_MGPIO20B_OE                 ( MSS_ADLIB_INST_MMUART0_DSR_MGPIO20B_OE ),
        .MMUART0_DTR_USBC_DATA6_MGPIO18B_OE      (  ),
        .MMUART0_RI_MGPIO21B_OE                  ( MSS_ADLIB_INST_MMUART0_RI_MGPIO21B_OE ),
        .MMUART0_RTS_USBC_DATA5_MGPIO17B_OE      (  ),
        .MMUART0_RXD_USBC_STP_MGPIO28B_OE        (  ),
        .MMUART0_SCK_USBC_NXT_MGPIO29B_OE        (  ),
        .MMUART0_TXD_USBC_DIR_MGPIO27B_OE        ( MSS_ADLIB_INST_MMUART0_TXD_USBC_DIR_MGPIO27B_OE ),
        .MMUART1_RXD_USBC_DATA3_MGPIO26B_OE      (  ),
        .MMUART1_SCK_USBC_DATA4_MGPIO25B_OE      (  ),
        .MMUART1_TXD_USBC_DATA2_MGPIO24B_OE      (  ),
        .RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_OE     (  ),
        .RGMII_MDC_RMII_MDC_OE                   (  ),
        .RGMII_MDIO_RMII_MDIO_USBB_DATA7_OE      (  ),
        .RGMII_RX_CLK_OE                         (  ),
        .RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OE  (  ),
        .RGMII_RXD0_RMII_RXD0_USBB_DATA0_OE      (  ),
        .RGMII_RXD1_RMII_RXD1_USBB_DATA1_OE      (  ),
        .RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OE     (  ),
        .RGMII_RXD3_USBB_DATA4_OE                (  ),
        .RGMII_TX_CLK_OE                         (  ),
        .RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_OE     (  ),
        .RGMII_TXD0_RMII_TXD0_USBB_DIR_OE        (  ),
        .RGMII_TXD1_RMII_TXD1_USBB_STP_OE        (  ),
        .RGMII_TXD2_USBB_DATA5_OE                (  ),
        .RGMII_TXD3_USBB_DATA6_OE                (  ),
        .SPI0_SCK_USBA_XCLK_OE                   ( MSS_ADLIB_INST_SPI0_SCK_USBA_XCLK_OE ),
        .SPI0_SDI_USBA_DIR_MGPIO5A_OE            (  ),
        .SPI0_SDO_USBA_STP_MGPIO6A_OE            ( MSS_ADLIB_INST_SPI0_SDO_USBA_STP_MGPIO6A_OE ),
        .SPI0_SS0_USBA_NXT_MGPIO7A_OE            ( MSS_ADLIB_INST_SPI0_SS0_USBA_NXT_MGPIO7A_OE ),
        .SPI0_SS1_USBA_DATA5_MGPIO8A_OE          ( MSS_ADLIB_INST_SPI0_SS1_USBA_DATA5_MGPIO8A_OE ),
        .SPI0_SS2_USBA_DATA6_MGPIO9A_OE          ( MSS_ADLIB_INST_SPI0_SS2_USBA_DATA6_MGPIO9A_OE ),
        .SPI0_SS3_USBA_DATA7_MGPIO10A_OE         ( MSS_ADLIB_INST_SPI0_SS3_USBA_DATA7_MGPIO10A_OE ),
        .SPI1_SCK_OE                             (  ),
        .SPI1_SDI_MGPIO11A_OE                    ( MSS_ADLIB_INST_SPI1_SDI_MGPIO11A_OE ),
        .SPI1_SDO_MGPIO12A_OE                    ( MSS_ADLIB_INST_SPI1_SDO_MGPIO12A_OE ),
        .SPI1_SS0_MGPIO13A_OE                    ( MSS_ADLIB_INST_SPI1_SS0_MGPIO13A_OE ),
        .SPI1_SS1_MGPIO14A_OE                    ( MSS_ADLIB_INST_SPI1_SS1_MGPIO14A_OE ),
        .SPI1_SS2_MGPIO15A_OE                    ( MSS_ADLIB_INST_SPI1_SS2_MGPIO15A_OE ),
        .SPI1_SS3_MGPIO16A_OE                    ( MSS_ADLIB_INST_SPI1_SS3_MGPIO16A_OE ),
        .SPI1_SS4_MGPIO17A_OE                    ( MSS_ADLIB_INST_SPI1_SS4_MGPIO17A_OE ),
        .SPI1_SS5_MGPIO18A_OE                    ( MSS_ADLIB_INST_SPI1_SS5_MGPIO18A_OE ),
        .SPI1_SS6_MGPIO23A_OE                    ( MSS_ADLIB_INST_SPI1_SS6_MGPIO23A_OE ),
        .SPI1_SS7_MGPIO24A_OE                    (  ),
        .USBC_XCLK_OE                            (  ) 
        );

//--------BIBUF
BIBUF SPI_0_CLK_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI0_SCK_USBA_XCLK_OUT ),
        .E   ( MSS_ADLIB_INST_SPI0_SCK_USBA_XCLK_OE ),
        // Outputs
        .Y   ( SPI_0_CLK_PAD_Y ),
        // Inouts
        .PAD ( SPI_0_CLK ) 
        );

//--------INBUF
INBUF SPI_0_DI_PAD(
        // Inputs
        .PAD ( SPI_0_DI ),
        // Outputs
        .Y   ( SPI_0_DI_PAD_Y ) 
        );

//--------TRIBUFF
TRIBUFF SPI_0_DO_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI0_SDO_USBA_STP_MGPIO6A_OUT ),
        .E   ( MSS_ADLIB_INST_SPI0_SDO_USBA_STP_MGPIO6A_OE ),
        // Outputs
        .PAD ( SPI_0_DO_net_0 ) 
        );

//--------BIBUF
BIBUF SPI_0_SS0_PAD(
        // Inputs
        .D   ( MSS_ADLIB_INST_SPI0_SS0_USBA_NXT_MGPIO7A_OUT ),
        .E   ( MSS_ADLIB_INST_SPI0_SS0_USBA_NXT_MGPIO7A_OE ),
        // Outputs
        .Y   ( SPI_0_SS0_PAD_Y ),
        // Inouts
        .PAD ( SPI_0_SS0 ) 
        );


endmodule
