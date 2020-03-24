//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue Mar 24 11:06:05 2020
// Version: v11.8 11.8.0.26
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// fpga_soc
module fpga_soc(
    // Inputs
    MMUART_0_RXD,
    MSS_RESET_N_F2M,
    SPI_0_DI,
    // Outputs
    BA,
    CAS_N,
    CKE,
    CS_N,
    DQM,
    MMUART_0_TXD,
    OE,
    RAS_N,
    SA,
    SDRCLK,
    SPI_0_DO,
    WE_N,
    // Inouts
    DQ,
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
input         MMUART_0_RXD;
input         MSS_RESET_N_F2M;
input         SPI_0_DI;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [1:0]  BA;
output        CAS_N;
output        CKE;
output [0:0]  CS_N;
output [1:0]  DQM;
output        MMUART_0_TXD;
output        OE;
output        RAS_N;
output [13:0] SA;
output        SDRCLK;
output        SPI_0_DO;
output        WE_N;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout  [15:0] DQ;
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
wire   [1:0]  BA_net_0;
wire          CAS_N_net_0;
wire          CKE_net_0;
wire   [31:0] Controller_MSS_MDDR_SMC_AHB_MASTER_HADDR;
wire   [2:0]  Controller_MSS_MDDR_SMC_AHB_MASTER_HBURST;
wire          Controller_MSS_MDDR_SMC_AHB_MASTER_HLOCK;
wire   [31:0] Controller_MSS_MDDR_SMC_AHB_MASTER_HRDATA;
wire          Controller_MSS_MDDR_SMC_AHB_MASTER_HREADY;
wire   [1:0]  Controller_MSS_MDDR_SMC_AHB_MASTER_HTRANS;
wire   [31:0] Controller_MSS_MDDR_SMC_AHB_MASTER_HWDATA;
wire          Controller_MSS_MDDR_SMC_AHB_MASTER_HWRITE;
wire          Controller_MSS_MSS_RESET_N_M2F;
wire   [31:0] CoreAHBLite_Interface_AHBmslave0_HADDR;
wire   [2:0]  CoreAHBLite_Interface_AHBmslave0_HBURST;
wire          CoreAHBLite_Interface_AHBmslave0_HMASTLOCK;
wire   [3:0]  CoreAHBLite_Interface_AHBmslave0_HPROT;
wire   [31:0] CoreAHBLite_Interface_AHBmslave0_HRDATA;
wire          CoreAHBLite_Interface_AHBmslave0_HREADY;
wire          CoreAHBLite_Interface_AHBmslave0_HREADYOUT;
wire   [1:0]  CoreAHBLite_Interface_AHBmslave0_HRESP;
wire          CoreAHBLite_Interface_AHBmslave0_HSELx;
wire   [2:0]  CoreAHBLite_Interface_AHBmslave0_HSIZE;
wire   [1:0]  CoreAHBLite_Interface_AHBmslave0_HTRANS;
wire   [31:0] CoreAHBLite_Interface_AHBmslave0_HWDATA;
wire          CoreAHBLite_Interface_AHBmslave0_HWRITE;
wire   [0:0]  CS_N_net_0;
wire   [15:0] DQ;
wire   [1:0]  DQM_net_0;
wire          FCCC_100MHz_GL0;
wire          FCCC_100MHz_LOCK;
wire          GPIO_8_BI;
wire          GPIO_9_BI;
wire          GPIO_10_BI;
wire          GPIO_11_BI;
wire          GPIO_12_BI;
wire          GPIO_13_BI;
wire          GPIO_14_BI;
wire          GPIO_15_BI;
wire          GPIO_16_BI;
wire          GPIO_17_BI;
wire          GPIO_18_BI;
wire          GPIO_19_BI;
wire          GPIO_20_BI;
wire          GPIO_21_BI;
wire          GPIO_22_BI;
wire          GPIO_23_BI;
wire          I2C_0_SCL;
wire          I2C_0_SDA;
wire          MMUART_0_RXD;
wire          MMUART_0_TXD_net_0;
wire          MSS_RESET_N_F2M;
wire          OE_net_0;
wire          OSC_50MHz_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC;
wire          RAS_N_net_0;
wire   [13:0] SA_net_0;
wire          SDRCLK_net_0;
wire          SPI_0_CLK;
wire          SPI_0_DI;
wire          SPI_0_DO_net_0;
wire          SPI_0_SS0;
wire          WE_N_net_0;
wire          SPI_0_DO_net_1;
wire          MMUART_0_TXD_net_1;
wire          CAS_N_net_1;
wire   [0:0]  CS_N_net_1;
wire          WE_N_net_1;
wire          OE_net_1;
wire          CKE_net_1;
wire          RAS_N_net_1;
wire   [1:0]  BA_net_1;
wire          SDRCLK_net_1;
wire   [1:0]  DQM_net_1;
wire   [13:0] SA_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          VCC_net;
wire          GND_net;
wire   [7:2]  PADDR_const_net_0;
wire   [7:0]  PWDATA_const_net_0;
wire   [3:0]  HPROT_M0_const_net_0;
wire   [31:0] HADDR_M1_const_net_0;
wire   [1:0]  HTRANS_M1_const_net_0;
wire   [2:0]  HSIZE_M1_const_net_0;
wire   [2:0]  HBURST_M1_const_net_0;
wire   [3:0]  HPROT_M1_const_net_0;
wire   [31:0] HWDATA_M1_const_net_0;
wire   [31:0] HADDR_M2_const_net_0;
wire   [1:0]  HTRANS_M2_const_net_0;
wire   [2:0]  HSIZE_M2_const_net_0;
wire   [2:0]  HBURST_M2_const_net_0;
wire   [3:0]  HPROT_M2_const_net_0;
wire   [31:0] HWDATA_M2_const_net_0;
wire   [31:0] HADDR_M3_const_net_0;
wire   [1:0]  HTRANS_M3_const_net_0;
wire   [2:0]  HSIZE_M3_const_net_0;
wire   [2:0]  HBURST_M3_const_net_0;
wire   [3:0]  HPROT_M3_const_net_0;
wire   [31:0] HWDATA_M3_const_net_0;
wire   [31:0] HRDATA_S1_const_net_0;
wire   [1:0]  HRESP_S1_const_net_0;
wire   [31:0] HRDATA_S2_const_net_0;
wire   [1:0]  HRESP_S2_const_net_0;
wire   [31:0] HRDATA_S3_const_net_0;
wire   [1:0]  HRESP_S3_const_net_0;
wire   [31:0] HRDATA_S4_const_net_0;
wire   [1:0]  HRESP_S4_const_net_0;
wire   [31:0] HRDATA_S5_const_net_0;
wire   [1:0]  HRESP_S5_const_net_0;
wire   [31:0] HRDATA_S6_const_net_0;
wire   [1:0]  HRESP_S6_const_net_0;
wire   [31:0] HRDATA_S7_const_net_0;
wire   [1:0]  HRESP_S7_const_net_0;
wire   [31:0] HRDATA_S8_const_net_0;
wire   [1:0]  HRESP_S8_const_net_0;
wire   [31:0] HRDATA_S9_const_net_0;
wire   [1:0]  HRESP_S9_const_net_0;
wire   [31:0] HRDATA_S10_const_net_0;
wire   [1:0]  HRESP_S10_const_net_0;
wire   [31:0] HRDATA_S11_const_net_0;
wire   [1:0]  HRESP_S11_const_net_0;
wire   [31:0] HRDATA_S12_const_net_0;
wire   [1:0]  HRESP_S12_const_net_0;
wire   [31:0] HRDATA_S13_const_net_0;
wire   [1:0]  HRESP_S13_const_net_0;
wire   [31:0] HRDATA_S14_const_net_0;
wire   [1:0]  HRESP_S14_const_net_0;
wire   [31:0] HRDATA_S15_const_net_0;
wire   [1:0]  HRESP_S15_const_net_0;
wire   [31:0] HRDATA_S16_const_net_0;
wire   [1:0]  HRESP_S16_const_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [1:0]  Controller_MSS_MDDR_SMC_AHB_MASTER_HRESP;
wire   [0:0]  Controller_MSS_MDDR_SMC_AHB_MASTER_HRESP_0_0to0;
wire          Controller_MSS_MDDR_SMC_AHB_MASTER_HRESP_0;
wire   [2:2]  Controller_MSS_MDDR_SMC_AHB_MASTER_HSIZE_0_2to2;
wire   [1:0]  Controller_MSS_MDDR_SMC_AHB_MASTER_HSIZE_0_1to0;
wire   [2:0]  Controller_MSS_MDDR_SMC_AHB_MASTER_HSIZE_0;
wire   [1:0]  Controller_MSS_MDDR_SMC_AHB_MASTER_HSIZE;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net                = 1'b1;
assign GND_net                = 1'b0;
assign PADDR_const_net_0      = 6'h00;
assign PWDATA_const_net_0     = 8'h00;
assign HPROT_M0_const_net_0   = 4'h0;
assign HADDR_M1_const_net_0   = 32'h00000000;
assign HTRANS_M1_const_net_0  = 2'h0;
assign HSIZE_M1_const_net_0   = 3'h0;
assign HBURST_M1_const_net_0  = 3'h0;
assign HPROT_M1_const_net_0   = 4'h0;
assign HWDATA_M1_const_net_0  = 32'h00000000;
assign HADDR_M2_const_net_0   = 32'h00000000;
assign HTRANS_M2_const_net_0  = 2'h0;
assign HSIZE_M2_const_net_0   = 3'h0;
assign HBURST_M2_const_net_0  = 3'h0;
assign HPROT_M2_const_net_0   = 4'h0;
assign HWDATA_M2_const_net_0  = 32'h00000000;
assign HADDR_M3_const_net_0   = 32'h00000000;
assign HTRANS_M3_const_net_0  = 2'h0;
assign HSIZE_M3_const_net_0   = 3'h0;
assign HBURST_M3_const_net_0  = 3'h0;
assign HPROT_M3_const_net_0   = 4'h0;
assign HWDATA_M3_const_net_0  = 32'h00000000;
assign HRDATA_S1_const_net_0  = 32'h00000000;
assign HRESP_S1_const_net_0   = 2'h0;
assign HRDATA_S2_const_net_0  = 32'h00000000;
assign HRESP_S2_const_net_0   = 2'h0;
assign HRDATA_S3_const_net_0  = 32'h00000000;
assign HRESP_S3_const_net_0   = 2'h0;
assign HRDATA_S4_const_net_0  = 32'h00000000;
assign HRESP_S4_const_net_0   = 2'h0;
assign HRDATA_S5_const_net_0  = 32'h00000000;
assign HRESP_S5_const_net_0   = 2'h0;
assign HRDATA_S6_const_net_0  = 32'h00000000;
assign HRESP_S6_const_net_0   = 2'h0;
assign HRDATA_S7_const_net_0  = 32'h00000000;
assign HRESP_S7_const_net_0   = 2'h0;
assign HRDATA_S8_const_net_0  = 32'h00000000;
assign HRESP_S8_const_net_0   = 2'h0;
assign HRDATA_S9_const_net_0  = 32'h00000000;
assign HRESP_S9_const_net_0   = 2'h0;
assign HRDATA_S10_const_net_0 = 32'h00000000;
assign HRESP_S10_const_net_0  = 2'h0;
assign HRDATA_S11_const_net_0 = 32'h00000000;
assign HRESP_S11_const_net_0  = 2'h0;
assign HRDATA_S12_const_net_0 = 32'h00000000;
assign HRESP_S12_const_net_0  = 2'h0;
assign HRDATA_S13_const_net_0 = 32'h00000000;
assign HRESP_S13_const_net_0  = 2'h0;
assign HRDATA_S14_const_net_0 = 32'h00000000;
assign HRESP_S14_const_net_0  = 2'h0;
assign HRDATA_S15_const_net_0 = 32'h00000000;
assign HRESP_S15_const_net_0  = 2'h0;
assign HRDATA_S16_const_net_0 = 32'h00000000;
assign HRESP_S16_const_net_0  = 2'h0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign SPI_0_DO_net_1     = SPI_0_DO_net_0;
assign SPI_0_DO           = SPI_0_DO_net_1;
assign MMUART_0_TXD_net_1 = MMUART_0_TXD_net_0;
assign MMUART_0_TXD       = MMUART_0_TXD_net_1;
assign CAS_N_net_1        = CAS_N_net_0;
assign CAS_N              = CAS_N_net_1;
assign CS_N_net_1[0]      = CS_N_net_0[0];
assign CS_N[0:0]          = CS_N_net_1[0];
assign WE_N_net_1         = WE_N_net_0;
assign WE_N               = WE_N_net_1;
assign OE_net_1           = OE_net_0;
assign OE                 = OE_net_1;
assign CKE_net_1          = CKE_net_0;
assign CKE                = CKE_net_1;
assign RAS_N_net_1        = RAS_N_net_0;
assign RAS_N              = RAS_N_net_1;
assign BA_net_1           = BA_net_0;
assign BA[1:0]            = BA_net_1;
assign SDRCLK_net_1       = SDRCLK_net_0;
assign SDRCLK             = SDRCLK_net_1;
assign DQM_net_1          = DQM_net_0;
assign DQM[1:0]           = DQM_net_1;
assign SA_net_1           = SA_net_0;
assign SA[13:0]           = SA_net_1;
//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign Controller_MSS_MDDR_SMC_AHB_MASTER_HRESP_0_0to0 = Controller_MSS_MDDR_SMC_AHB_MASTER_HRESP[0:0];
assign Controller_MSS_MDDR_SMC_AHB_MASTER_HRESP_0 = { Controller_MSS_MDDR_SMC_AHB_MASTER_HRESP_0_0to0 };

assign Controller_MSS_MDDR_SMC_AHB_MASTER_HSIZE_0_2to2 = 1'b0;
assign Controller_MSS_MDDR_SMC_AHB_MASTER_HSIZE_0_1to0 = Controller_MSS_MDDR_SMC_AHB_MASTER_HSIZE[1:0];
assign Controller_MSS_MDDR_SMC_AHB_MASTER_HSIZE_0 = { Controller_MSS_MDDR_SMC_AHB_MASTER_HSIZE_0_2to2, Controller_MSS_MDDR_SMC_AHB_MASTER_HSIZE_0_1to0 };

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------fpga_soc_MSS
fpga_soc_MSS Controller_MSS(
        // Inputs
        .SPI_0_DI                 ( SPI_0_DI ),
        .MCCC_CLK_BASE            ( FCCC_100MHz_GL0 ),
        .MMUART_0_RXD             ( MMUART_0_RXD ),
        .MDDR_SMC_AHB_M_HRESP     ( Controller_MSS_MDDR_SMC_AHB_MASTER_HRESP_0 ),
        .MDDR_SMC_AHB_M_HRDATA    ( Controller_MSS_MDDR_SMC_AHB_MASTER_HRDATA ),
        .MDDR_SMC_AHB_M_HREADY    ( Controller_MSS_MDDR_SMC_AHB_MASTER_HREADY ),
        .MCCC_CLK_BASE_PLL_LOCK   ( FCCC_100MHz_LOCK ),
        .MSS_RESET_N_F2M          ( MSS_RESET_N_F2M ),
        // Outputs
        .SPI_0_DO                 ( SPI_0_DO_net_0 ),
        .MMUART_0_TXD             ( MMUART_0_TXD_net_0 ),
        .MDDR_SMC_AHB_M_HBURST    ( Controller_MSS_MDDR_SMC_AHB_MASTER_HBURST ),
        .MDDR_SMC_AHB_M_HTRANS    ( Controller_MSS_MDDR_SMC_AHB_MASTER_HTRANS ),
        .MDDR_SMC_AHB_M_HMASTLOCK ( Controller_MSS_MDDR_SMC_AHB_MASTER_HLOCK ),
        .MDDR_SMC_AHB_M_HWRITE    ( Controller_MSS_MDDR_SMC_AHB_MASTER_HWRITE ),
        .MDDR_SMC_AHB_M_HSIZE     ( Controller_MSS_MDDR_SMC_AHB_MASTER_HSIZE ),
        .MDDR_SMC_AHB_M_HWDATA    ( Controller_MSS_MDDR_SMC_AHB_MASTER_HWDATA ),
        .MDDR_SMC_AHB_M_HADDR     ( Controller_MSS_MDDR_SMC_AHB_MASTER_HADDR ),
        .MSS_RESET_N_M2F          ( Controller_MSS_MSS_RESET_N_M2F ),
        // Inouts
        .I2C_0_SDA                ( I2C_0_SDA ),
        .I2C_0_SCL                ( I2C_0_SCL ),
        .SPI_0_CLK                ( SPI_0_CLK ),
        .SPI_0_SS0                ( SPI_0_SS0 ),
        .GPIO_8_BI                ( GPIO_8_BI ),
        .GPIO_9_BI                ( GPIO_9_BI ),
        .GPIO_10_BI               ( GPIO_10_BI ),
        .GPIO_11_BI               ( GPIO_11_BI ),
        .GPIO_12_BI               ( GPIO_12_BI ),
        .GPIO_13_BI               ( GPIO_13_BI ),
        .GPIO_14_BI               ( GPIO_14_BI ),
        .GPIO_15_BI               ( GPIO_15_BI ),
        .GPIO_16_BI               ( GPIO_16_BI ),
        .GPIO_17_BI               ( GPIO_17_BI ),
        .GPIO_18_BI               ( GPIO_18_BI ),
        .GPIO_19_BI               ( GPIO_19_BI ),
        .GPIO_20_BI               ( GPIO_20_BI ),
        .GPIO_21_BI               ( GPIO_21_BI ),
        .GPIO_22_BI               ( GPIO_22_BI ),
        .GPIO_23_BI               ( GPIO_23_BI ) 
        );

//--------fpga_soc_Controller_SDRAM_AHB_CORESDR_AHB   -   Actel:DirectCore:CORESDR_AHB:4.3.100
fpga_soc_Controller_SDRAM_AHB_CORESDR_AHB #( 
        .AUTO_PCH              ( 0 ),
        .CL                    ( 3 ),
        .COLBITS               ( 4 ),
        .DELAY                 ( 10000 ),
        .FAMILY                ( 19 ),
        .MRD                   ( 2 ),
        .RAS                   ( 5 ),
        .RC                    ( 6 ),
        .RCD                   ( 2 ),
        .REF                   ( 8192 ),
        .REGDIMM               ( 0 ),
        .RFC                   ( 7 ),
        .ROWBITS               ( 2 ),
        .RP                    ( 2 ),
        .RRD                   ( 2 ),
        .SDRAM_BANKSTATMODULES ( 4 ),
        .SDRAM_CHIPBITS        ( 1 ),
        .SDRAM_CHIPS           ( 1 ),
        .SDRAM_COLBITS         ( 9 ),
        .SDRAM_DQSIZE          ( 16 ),
        .SDRAM_RASIZE          ( 31 ),
        .SDRAM_ROWBITS         ( 13 ),
        .SYS_FREQ              ( 0 ),
        .WR                    ( 2 ) )
Controller_SDRAM_AHB(
        // Inputs
        .HADDR    ( CoreAHBLite_Interface_AHBmslave0_HADDR ),
        .HCLK     ( FCCC_100MHz_GL0 ),
        .HSEL     ( CoreAHBLite_Interface_AHBmslave0_HSELx ),
        .HREADYIN ( CoreAHBLite_Interface_AHBmslave0_HREADY ),
        .HRESETN  ( Controller_MSS_MSS_RESET_N_M2F ),
        .HSIZE    ( CoreAHBLite_Interface_AHBmslave0_HSIZE ),
        .HTRANS   ( CoreAHBLite_Interface_AHBmslave0_HTRANS ),
        .HWDATA   ( CoreAHBLite_Interface_AHBmslave0_HWDATA ),
        .HWRITE   ( CoreAHBLite_Interface_AHBmslave0_HWRITE ),
        // Outputs
        .HREADY   ( CoreAHBLite_Interface_AHBmslave0_HREADYOUT ),
        .HRDATA   ( CoreAHBLite_Interface_AHBmslave0_HRDATA ),
        .HRESP    ( CoreAHBLite_Interface_AHBmslave0_HRESP ),
        .OE       ( OE_net_0 ),
        .RAS_N    ( RAS_N_net_0 ),
        .CAS_N    ( CAS_N_net_0 ),
        .SA       ( SA_net_0 ),
        .BA       ( BA_net_0 ),
        .CS_N     ( CS_N_net_0 ),
        .WE_N     ( WE_N_net_0 ),
        .DQM      ( DQM_net_0 ),
        .CKE      ( CKE_net_0 ),
        .SDRCLK   ( SDRCLK_net_0 ),
        // Inouts
        .DQ       ( DQ ) 
        );

//--------fpga_soc_CoreAHBLite_Interface_CoreAHBLite   -   Actel:DirectCore:CoreAHBLite:5.4.102
fpga_soc_CoreAHBLite_Interface_CoreAHBLite #( 
        .FAMILY             ( 19 ),
        .HADDR_SHG_CFG      ( 1 ),
        .M0_AHBSLOT0ENABLE  ( 1 ),
        .M0_AHBSLOT1ENABLE  ( 0 ),
        .M0_AHBSLOT2ENABLE  ( 0 ),
        .M0_AHBSLOT3ENABLE  ( 0 ),
        .M0_AHBSLOT4ENABLE  ( 0 ),
        .M0_AHBSLOT5ENABLE  ( 0 ),
        .M0_AHBSLOT6ENABLE  ( 0 ),
        .M0_AHBSLOT7ENABLE  ( 0 ),
        .M0_AHBSLOT8ENABLE  ( 0 ),
        .M0_AHBSLOT9ENABLE  ( 0 ),
        .M0_AHBSLOT10ENABLE ( 0 ),
        .M0_AHBSLOT11ENABLE ( 0 ),
        .M0_AHBSLOT12ENABLE ( 0 ),
        .M0_AHBSLOT13ENABLE ( 0 ),
        .M0_AHBSLOT14ENABLE ( 0 ),
        .M0_AHBSLOT15ENABLE ( 0 ),
        .M0_AHBSLOT16ENABLE ( 0 ),
        .M1_AHBSLOT0ENABLE  ( 0 ),
        .M1_AHBSLOT1ENABLE  ( 0 ),
        .M1_AHBSLOT2ENABLE  ( 0 ),
        .M1_AHBSLOT3ENABLE  ( 0 ),
        .M1_AHBSLOT4ENABLE  ( 0 ),
        .M1_AHBSLOT5ENABLE  ( 0 ),
        .M1_AHBSLOT6ENABLE  ( 0 ),
        .M1_AHBSLOT7ENABLE  ( 0 ),
        .M1_AHBSLOT8ENABLE  ( 0 ),
        .M1_AHBSLOT9ENABLE  ( 0 ),
        .M1_AHBSLOT10ENABLE ( 0 ),
        .M1_AHBSLOT11ENABLE ( 0 ),
        .M1_AHBSLOT12ENABLE ( 0 ),
        .M1_AHBSLOT13ENABLE ( 0 ),
        .M1_AHBSLOT14ENABLE ( 0 ),
        .M1_AHBSLOT15ENABLE ( 0 ),
        .M1_AHBSLOT16ENABLE ( 0 ),
        .M2_AHBSLOT0ENABLE  ( 0 ),
        .M2_AHBSLOT1ENABLE  ( 0 ),
        .M2_AHBSLOT2ENABLE  ( 0 ),
        .M2_AHBSLOT3ENABLE  ( 0 ),
        .M2_AHBSLOT4ENABLE  ( 0 ),
        .M2_AHBSLOT5ENABLE  ( 0 ),
        .M2_AHBSLOT6ENABLE  ( 0 ),
        .M2_AHBSLOT7ENABLE  ( 0 ),
        .M2_AHBSLOT8ENABLE  ( 0 ),
        .M2_AHBSLOT9ENABLE  ( 0 ),
        .M2_AHBSLOT10ENABLE ( 0 ),
        .M2_AHBSLOT11ENABLE ( 0 ),
        .M2_AHBSLOT12ENABLE ( 0 ),
        .M2_AHBSLOT13ENABLE ( 0 ),
        .M2_AHBSLOT14ENABLE ( 0 ),
        .M2_AHBSLOT15ENABLE ( 0 ),
        .M2_AHBSLOT16ENABLE ( 0 ),
        .M3_AHBSLOT0ENABLE  ( 0 ),
        .M3_AHBSLOT1ENABLE  ( 0 ),
        .M3_AHBSLOT2ENABLE  ( 0 ),
        .M3_AHBSLOT3ENABLE  ( 0 ),
        .M3_AHBSLOT4ENABLE  ( 0 ),
        .M3_AHBSLOT5ENABLE  ( 0 ),
        .M3_AHBSLOT6ENABLE  ( 0 ),
        .M3_AHBSLOT7ENABLE  ( 0 ),
        .M3_AHBSLOT8ENABLE  ( 0 ),
        .M3_AHBSLOT9ENABLE  ( 0 ),
        .M3_AHBSLOT10ENABLE ( 0 ),
        .M3_AHBSLOT11ENABLE ( 0 ),
        .M3_AHBSLOT12ENABLE ( 0 ),
        .M3_AHBSLOT13ENABLE ( 0 ),
        .M3_AHBSLOT14ENABLE ( 0 ),
        .M3_AHBSLOT15ENABLE ( 0 ),
        .M3_AHBSLOT16ENABLE ( 0 ),
        .MASTER0_INTERFACE  ( 1 ),
        .MASTER1_INTERFACE  ( 1 ),
        .MASTER2_INTERFACE  ( 1 ),
        .MASTER3_INTERFACE  ( 1 ),
        .MEMSPACE           ( 1 ),
        .SC_0               ( 0 ),
        .SC_1               ( 0 ),
        .SC_2               ( 0 ),
        .SC_3               ( 0 ),
        .SC_4               ( 0 ),
        .SC_5               ( 0 ),
        .SC_6               ( 0 ),
        .SC_7               ( 0 ),
        .SC_8               ( 0 ),
        .SC_9               ( 0 ),
        .SC_10              ( 0 ),
        .SC_11              ( 0 ),
        .SC_12              ( 0 ),
        .SC_13              ( 0 ),
        .SC_14              ( 0 ),
        .SC_15              ( 0 ),
        .SLAVE0_INTERFACE   ( 1 ),
        .SLAVE1_INTERFACE   ( 1 ),
        .SLAVE2_INTERFACE   ( 1 ),
        .SLAVE3_INTERFACE   ( 1 ),
        .SLAVE4_INTERFACE   ( 1 ),
        .SLAVE5_INTERFACE   ( 1 ),
        .SLAVE6_INTERFACE   ( 1 ),
        .SLAVE7_INTERFACE   ( 1 ),
        .SLAVE8_INTERFACE   ( 1 ),
        .SLAVE9_INTERFACE   ( 1 ),
        .SLAVE10_INTERFACE  ( 1 ),
        .SLAVE11_INTERFACE  ( 1 ),
        .SLAVE12_INTERFACE  ( 1 ),
        .SLAVE13_INTERFACE  ( 1 ),
        .SLAVE14_INTERFACE  ( 1 ),
        .SLAVE15_INTERFACE  ( 1 ),
        .SLAVE16_INTERFACE  ( 1 ) )
CoreAHBLite_Interface(
        // Inputs
        .HCLK          ( FCCC_100MHz_GL0 ),
        .HRESETN       ( Controller_MSS_MSS_RESET_N_M2F ),
        .REMAP_M0      ( GND_net ), // tied to 1'b0 from definition
        .HADDR_M0      ( Controller_MSS_MDDR_SMC_AHB_MASTER_HADDR ),
        .HMASTLOCK_M0  ( Controller_MSS_MDDR_SMC_AHB_MASTER_HLOCK ),
        .HSIZE_M0      ( Controller_MSS_MDDR_SMC_AHB_MASTER_HSIZE_0 ),
        .HTRANS_M0     ( Controller_MSS_MDDR_SMC_AHB_MASTER_HTRANS ),
        .HWRITE_M0     ( Controller_MSS_MDDR_SMC_AHB_MASTER_HWRITE ),
        .HWDATA_M0     ( Controller_MSS_MDDR_SMC_AHB_MASTER_HWDATA ),
        .HBURST_M0     ( Controller_MSS_MDDR_SMC_AHB_MASTER_HBURST ),
        .HPROT_M0      ( HPROT_M0_const_net_0 ), // tied to 4'h0 from definition
        .HADDR_M1      ( HADDR_M1_const_net_0 ), // tied to 32'h00000000 from definition
        .HMASTLOCK_M1  ( GND_net ), // tied to 1'b0 from definition
        .HSIZE_M1      ( HSIZE_M1_const_net_0 ), // tied to 3'h0 from definition
        .HTRANS_M1     ( HTRANS_M1_const_net_0 ), // tied to 2'h0 from definition
        .HWRITE_M1     ( GND_net ), // tied to 1'b0 from definition
        .HWDATA_M1     ( HWDATA_M1_const_net_0 ), // tied to 32'h00000000 from definition
        .HBURST_M1     ( HBURST_M1_const_net_0 ), // tied to 3'h0 from definition
        .HPROT_M1      ( HPROT_M1_const_net_0 ), // tied to 4'h0 from definition
        .HADDR_M2      ( HADDR_M2_const_net_0 ), // tied to 32'h00000000 from definition
        .HMASTLOCK_M2  ( GND_net ), // tied to 1'b0 from definition
        .HSIZE_M2      ( HSIZE_M2_const_net_0 ), // tied to 3'h0 from definition
        .HTRANS_M2     ( HTRANS_M2_const_net_0 ), // tied to 2'h0 from definition
        .HWRITE_M2     ( GND_net ), // tied to 1'b0 from definition
        .HWDATA_M2     ( HWDATA_M2_const_net_0 ), // tied to 32'h00000000 from definition
        .HBURST_M2     ( HBURST_M2_const_net_0 ), // tied to 3'h0 from definition
        .HPROT_M2      ( HPROT_M2_const_net_0 ), // tied to 4'h0 from definition
        .HADDR_M3      ( HADDR_M3_const_net_0 ), // tied to 32'h00000000 from definition
        .HMASTLOCK_M3  ( GND_net ), // tied to 1'b0 from definition
        .HSIZE_M3      ( HSIZE_M3_const_net_0 ), // tied to 3'h0 from definition
        .HTRANS_M3     ( HTRANS_M3_const_net_0 ), // tied to 2'h0 from definition
        .HWRITE_M3     ( GND_net ), // tied to 1'b0 from definition
        .HWDATA_M3     ( HWDATA_M3_const_net_0 ), // tied to 32'h00000000 from definition
        .HBURST_M3     ( HBURST_M3_const_net_0 ), // tied to 3'h0 from definition
        .HPROT_M3      ( HPROT_M3_const_net_0 ), // tied to 4'h0 from definition
        .HRDATA_S0     ( CoreAHBLite_Interface_AHBmslave0_HRDATA ),
        .HREADYOUT_S0  ( CoreAHBLite_Interface_AHBmslave0_HREADYOUT ),
        .HRESP_S0      ( CoreAHBLite_Interface_AHBmslave0_HRESP ),
        .HRDATA_S1     ( HRDATA_S1_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S1  ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S1      ( HRESP_S1_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S2     ( HRDATA_S2_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S2  ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S2      ( HRESP_S2_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S3     ( HRDATA_S3_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S3  ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S3      ( HRESP_S3_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S4     ( HRDATA_S4_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S4  ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S4      ( HRESP_S4_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S5     ( HRDATA_S5_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S5  ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S5      ( HRESP_S5_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S6     ( HRDATA_S6_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S6  ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S6      ( HRESP_S6_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S7     ( HRDATA_S7_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S7  ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S7      ( HRESP_S7_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S8     ( HRDATA_S8_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S8  ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S8      ( HRESP_S8_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S9     ( HRDATA_S9_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S9  ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S9      ( HRESP_S9_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S10    ( HRDATA_S10_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S10 ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S10     ( HRESP_S10_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S11    ( HRDATA_S11_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S11 ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S11     ( HRESP_S11_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S12    ( HRDATA_S12_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S12 ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S12     ( HRESP_S12_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S13    ( HRDATA_S13_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S13 ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S13     ( HRESP_S13_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S14    ( HRDATA_S14_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S14 ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S14     ( HRESP_S14_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S15    ( HRDATA_S15_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S15 ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S15     ( HRESP_S15_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S16    ( HRDATA_S16_const_net_0 ), // tied to 32'h00000000 from definition
        .HREADYOUT_S16 ( VCC_net ), // tied to 1'b1 from definition
        .HRESP_S16     ( HRESP_S16_const_net_0 ), // tied to 2'h0 from definition
        // Outputs
        .HRESP_M0      ( Controller_MSS_MDDR_SMC_AHB_MASTER_HRESP ),
        .HRDATA_M0     ( Controller_MSS_MDDR_SMC_AHB_MASTER_HRDATA ),
        .HREADY_M0     ( Controller_MSS_MDDR_SMC_AHB_MASTER_HREADY ),
        .HRESP_M1      (  ),
        .HRDATA_M1     (  ),
        .HREADY_M1     (  ),
        .HRESP_M2      (  ),
        .HRDATA_M2     (  ),
        .HREADY_M2     (  ),
        .HRESP_M3      (  ),
        .HRDATA_M3     (  ),
        .HREADY_M3     (  ),
        .HSEL_S0       ( CoreAHBLite_Interface_AHBmslave0_HSELx ),
        .HADDR_S0      ( CoreAHBLite_Interface_AHBmslave0_HADDR ),
        .HSIZE_S0      ( CoreAHBLite_Interface_AHBmslave0_HSIZE ),
        .HTRANS_S0     ( CoreAHBLite_Interface_AHBmslave0_HTRANS ),
        .HWRITE_S0     ( CoreAHBLite_Interface_AHBmslave0_HWRITE ),
        .HWDATA_S0     ( CoreAHBLite_Interface_AHBmslave0_HWDATA ),
        .HREADY_S0     ( CoreAHBLite_Interface_AHBmslave0_HREADY ),
        .HMASTLOCK_S0  ( CoreAHBLite_Interface_AHBmslave0_HMASTLOCK ),
        .HBURST_S0     ( CoreAHBLite_Interface_AHBmslave0_HBURST ),
        .HPROT_S0      ( CoreAHBLite_Interface_AHBmslave0_HPROT ),
        .HSEL_S1       (  ),
        .HADDR_S1      (  ),
        .HSIZE_S1      (  ),
        .HTRANS_S1     (  ),
        .HWRITE_S1     (  ),
        .HWDATA_S1     (  ),
        .HREADY_S1     (  ),
        .HMASTLOCK_S1  (  ),
        .HBURST_S1     (  ),
        .HPROT_S1      (  ),
        .HSEL_S2       (  ),
        .HADDR_S2      (  ),
        .HSIZE_S2      (  ),
        .HTRANS_S2     (  ),
        .HWRITE_S2     (  ),
        .HWDATA_S2     (  ),
        .HREADY_S2     (  ),
        .HMASTLOCK_S2  (  ),
        .HBURST_S2     (  ),
        .HPROT_S2      (  ),
        .HSEL_S3       (  ),
        .HADDR_S3      (  ),
        .HSIZE_S3      (  ),
        .HTRANS_S3     (  ),
        .HWRITE_S3     (  ),
        .HWDATA_S3     (  ),
        .HREADY_S3     (  ),
        .HMASTLOCK_S3  (  ),
        .HBURST_S3     (  ),
        .HPROT_S3      (  ),
        .HSEL_S4       (  ),
        .HADDR_S4      (  ),
        .HSIZE_S4      (  ),
        .HTRANS_S4     (  ),
        .HWRITE_S4     (  ),
        .HWDATA_S4     (  ),
        .HREADY_S4     (  ),
        .HMASTLOCK_S4  (  ),
        .HBURST_S4     (  ),
        .HPROT_S4      (  ),
        .HSEL_S5       (  ),
        .HADDR_S5      (  ),
        .HSIZE_S5      (  ),
        .HTRANS_S5     (  ),
        .HWRITE_S5     (  ),
        .HWDATA_S5     (  ),
        .HREADY_S5     (  ),
        .HMASTLOCK_S5  (  ),
        .HBURST_S5     (  ),
        .HPROT_S5      (  ),
        .HSEL_S6       (  ),
        .HADDR_S6      (  ),
        .HSIZE_S6      (  ),
        .HTRANS_S6     (  ),
        .HWRITE_S6     (  ),
        .HWDATA_S6     (  ),
        .HREADY_S6     (  ),
        .HMASTLOCK_S6  (  ),
        .HBURST_S6     (  ),
        .HPROT_S6      (  ),
        .HSEL_S7       (  ),
        .HADDR_S7      (  ),
        .HSIZE_S7      (  ),
        .HTRANS_S7     (  ),
        .HWRITE_S7     (  ),
        .HWDATA_S7     (  ),
        .HREADY_S7     (  ),
        .HMASTLOCK_S7  (  ),
        .HBURST_S7     (  ),
        .HPROT_S7      (  ),
        .HSEL_S8       (  ),
        .HADDR_S8      (  ),
        .HSIZE_S8      (  ),
        .HTRANS_S8     (  ),
        .HWRITE_S8     (  ),
        .HWDATA_S8     (  ),
        .HREADY_S8     (  ),
        .HMASTLOCK_S8  (  ),
        .HBURST_S8     (  ),
        .HPROT_S8      (  ),
        .HSEL_S9       (  ),
        .HADDR_S9      (  ),
        .HSIZE_S9      (  ),
        .HTRANS_S9     (  ),
        .HWRITE_S9     (  ),
        .HWDATA_S9     (  ),
        .HREADY_S9     (  ),
        .HMASTLOCK_S9  (  ),
        .HBURST_S9     (  ),
        .HPROT_S9      (  ),
        .HSEL_S10      (  ),
        .HADDR_S10     (  ),
        .HSIZE_S10     (  ),
        .HTRANS_S10    (  ),
        .HWRITE_S10    (  ),
        .HWDATA_S10    (  ),
        .HREADY_S10    (  ),
        .HMASTLOCK_S10 (  ),
        .HBURST_S10    (  ),
        .HPROT_S10     (  ),
        .HSEL_S11      (  ),
        .HADDR_S11     (  ),
        .HSIZE_S11     (  ),
        .HTRANS_S11    (  ),
        .HWRITE_S11    (  ),
        .HWDATA_S11    (  ),
        .HREADY_S11    (  ),
        .HMASTLOCK_S11 (  ),
        .HBURST_S11    (  ),
        .HPROT_S11     (  ),
        .HSEL_S12      (  ),
        .HADDR_S12     (  ),
        .HSIZE_S12     (  ),
        .HTRANS_S12    (  ),
        .HWRITE_S12    (  ),
        .HWDATA_S12    (  ),
        .HREADY_S12    (  ),
        .HMASTLOCK_S12 (  ),
        .HBURST_S12    (  ),
        .HPROT_S12     (  ),
        .HSEL_S13      (  ),
        .HADDR_S13     (  ),
        .HSIZE_S13     (  ),
        .HTRANS_S13    (  ),
        .HWRITE_S13    (  ),
        .HWDATA_S13    (  ),
        .HREADY_S13    (  ),
        .HMASTLOCK_S13 (  ),
        .HBURST_S13    (  ),
        .HPROT_S13     (  ),
        .HSEL_S14      (  ),
        .HADDR_S14     (  ),
        .HSIZE_S14     (  ),
        .HTRANS_S14    (  ),
        .HWRITE_S14    (  ),
        .HWDATA_S14    (  ),
        .HREADY_S14    (  ),
        .HMASTLOCK_S14 (  ),
        .HBURST_S14    (  ),
        .HPROT_S14     (  ),
        .HSEL_S15      (  ),
        .HADDR_S15     (  ),
        .HSIZE_S15     (  ),
        .HTRANS_S15    (  ),
        .HWRITE_S15    (  ),
        .HWDATA_S15    (  ),
        .HREADY_S15    (  ),
        .HMASTLOCK_S15 (  ),
        .HBURST_S15    (  ),
        .HPROT_S15     (  ),
        .HSEL_S16      (  ),
        .HADDR_S16     (  ),
        .HSIZE_S16     (  ),
        .HTRANS_S16    (  ),
        .HWRITE_S16    (  ),
        .HWDATA_S16    (  ),
        .HREADY_S16    (  ),
        .HMASTLOCK_S16 (  ),
        .HBURST_S16    (  ),
        .HPROT_S16     (  ) 
        );

//--------fpga_soc_FCCC_100MHz_FCCC   -   Actel:SgCore:FCCC:2.0.201
fpga_soc_FCCC_100MHz_FCCC FCCC_100MHz(
        // Inputs
        .RCOSC_25_50MHZ  ( OSC_50MHz_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC ),
        .PLL_ARST_N      ( MSS_RESET_N_F2M ),
        .PLL_POWERDOWN_N ( VCC_net ),
        // Outputs
        .GL0             ( FCCC_100MHz_GL0 ),
        .LOCK            ( FCCC_100MHz_LOCK ) 
        );

//--------fpga_soc_OSC_50MHz_OSC   -   Actel:SgCore:OSC:2.0.101
fpga_soc_OSC_50MHz_OSC OSC_50MHz(
        // Inputs
        .XTL                ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .RCOSC_25_50MHZ_CCC ( OSC_50MHz_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC ),
        .RCOSC_25_50MHZ_O2F (  ),
        .RCOSC_1MHZ_CCC     (  ),
        .RCOSC_1MHZ_O2F     (  ),
        .XTLOSC_CCC         (  ),
        .XTLOSC_O2F         (  ) 
        );


endmodule
