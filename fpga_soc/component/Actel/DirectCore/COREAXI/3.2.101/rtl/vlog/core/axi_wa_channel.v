/****************************************************************************/
// Actel Corporation Proprietary and Confidential
// Copyright 2010 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: interconnect_ntom - Bridge interconnect matrix 
//              This is n-to-m interconnect matrix file
//              Contains:
//                       - Arbiter
//                       - Decoder
//
// Revision Information:
// Date            Description
// ----            -----------------------------------------
// 02Feb11         Inital. Ports and Parameters declaration
//
// SVN Revision Information:
// SVN $Revision: 25801 $
// SVN $Date: 2015-12-20 21:48:37 +0530 (Sun, 20 Dec 2015) $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
// 1. 
//
// ****************************************************************************/
`timescale 1ns/1ps

module axi_wa_channel (
                   // Global signals
                   ACLK,
                   ARESETN,

                   m0_wr_end,
                   m1_wr_end,
                   m2_wr_end,
                   m3_wr_end,

                   AWADDR_M0,
                   AWVALID_M0,
                   AWLOCK_M0,
                   AWADDR_M1,
                   AWVALID_M1,
                   AWLOCK_M1,
                   AWADDR_M2,
                   AWVALID_M2,
                   AWLOCK_M2,
                   AWADDR_M3,
                   AWVALID_M3,
                   AWLOCK_M3,

                   BVALID_SI,
                   BREADY_IS,
                   // MASTER 0
                   // AXI MASTER write address channel signals
                   AWID_MI0,
                   AWADDR_MI0,
                   AWLEN_MI0,
                   AWSIZE_MI0,
                   AWBURST_MI0,
                   AWLOCK_MI0,
                   AWCACHE_MI0,
                   AWPROT_MI0,
                   AWVALID_MI0,
                   AWREADY_IM0,

                   // MASTER 1
                   // AXI MASTER write address channel signals
                   AWID_MI1,
                   AWADDR_MI1,
                   AWLEN_MI1,
                   AWSIZE_MI1,
                   AWBURST_MI1,
                   AWLOCK_MI1,
                   AWCACHE_MI1,
                   AWPROT_MI1,
                   AWVALID_MI1,
                   AWREADY_IM1,
                   
                   // MASTER 2
                   // AXI MASTER write address channel signals
                   AWID_MI2,
                   AWADDR_MI2,
                   AWLEN_MI2,
                   AWSIZE_MI2,
                   AWBURST_MI2,
                   AWLOCK_MI2,
                   AWCACHE_MI2,
                   AWPROT_MI2,
                   AWVALID_MI2,
                   AWREADY_IM2,
                   
                   // MASTER 3
                   // AXI MASTER write address channel signals
                   AWID_MI3,
                   AWADDR_MI3,
                   AWLEN_MI3,
                   AWSIZE_MI3,
                   AWBURST_MI3,
                   AWLOCK_MI3,
                   AWCACHE_MI3,
                   AWPROT_MI3,
                   AWVALID_MI3,
                   AWREADY_IM3,

                   // SLAVE 0
                   // AXI SLAVE 0 write address channel signals
                   AWID_IS,
                   AWADDR_IS,
                   AWLEN_IS,
                   AWSIZE_IS,
                   AWBURST_IS,
                   AWLOCK_IS,
                   AWCACHE_IS,
                   AWPROT_IS,
                   AWVALID_IS,
                   AWREADY_SI,
                   AWADDR_IS_int,

                   MST_WRGNT_NUM,
                   gated_waddr,
                   SLAVE_NUMBER,

                   // v3.2 - For outstanding writes
                   pending_wr0,
                   pending_wr1,
                   pending_wr2,
                   pending_wr3,
                   BVBR_M0_pulse,
                   BVBR_M1_pulse,
                   BVBR_M2_pulse,
                   BVBR_M3_pulse,
                   slave_out_en
                   , wr_lock_high
                   , rd_lock_high
                   , wr_normal_high  
                   , rd_normal_high  

                   , mst_rd_inprog0  
                   , mst_rd_inprog1  
                   , mst_rd_inprog2  
                   , mst_rd_inprog3  
                   , mst_wr_inprog0                                 
                   , mst_wr_inprog1                                 
                   , mst_wr_inprog2                                 
                   , mst_wr_inprog3                                 
                   );

   // --------------------------------------------------------------------------
   // PARAMETER Declaration
   // --------------------------------------------------------------------------
   parameter AXI_AWIDTH           = 32;
   parameter AXI_DWIDTH           = 64;   // 64/128/256

   parameter M0_SLAVE0ENABLE      = 1;
   parameter M0_SLAVE1ENABLE      = 0;
   parameter M0_SLAVE2ENABLE      = 0;
   parameter M0_SLAVE3ENABLE      = 0;
   parameter M0_SLAVE4ENABLE      = 0;
   parameter M0_SLAVE5ENABLE      = 0;
   parameter M0_SLAVE6ENABLE      = 0;
   parameter M0_SLAVE7ENABLE      = 0;
   parameter M0_SLAVE8ENABLE      = 0;
   parameter M0_SLAVE9ENABLE      = 0;
   parameter M0_SLAVE10ENABLE     = 0;
   parameter M0_SLAVE11ENABLE     = 0;
   parameter M0_SLAVE12ENABLE     = 0;
   parameter M0_SLAVE13ENABLE     = 0;
   parameter M0_SLAVE14ENABLE     = 0;
   parameter M0_SLAVE15ENABLE     = 0;
   parameter M0_SLAVE16ENABLE    = 0;
   
   parameter M1_SLAVE0ENABLE      = 1;
   parameter M1_SLAVE1ENABLE      = 0;
   parameter M1_SLAVE2ENABLE      = 0;
   parameter M1_SLAVE3ENABLE      = 0;
   parameter M1_SLAVE4ENABLE      = 0;
   parameter M1_SLAVE5ENABLE      = 0;
   parameter M1_SLAVE6ENABLE      = 0;
   parameter M1_SLAVE7ENABLE      = 0;
   parameter M1_SLAVE8ENABLE      = 0;
   parameter M1_SLAVE9ENABLE      = 0;
   parameter M1_SLAVE10ENABLE     = 0;
   parameter M1_SLAVE11ENABLE     = 0;
   parameter M1_SLAVE12ENABLE     = 0;
   parameter M1_SLAVE13ENABLE     = 0;
   parameter M1_SLAVE14ENABLE     = 0;
   parameter M1_SLAVE15ENABLE     = 0;
   parameter M1_SLAVE16ENABLE     = 0;
   parameter M2_SLAVE0ENABLE      = 1;
   parameter M2_SLAVE1ENABLE      = 0;
   parameter M2_SLAVE2ENABLE      = 0;
   parameter M2_SLAVE3ENABLE      = 0;
   parameter M2_SLAVE4ENABLE      = 0;
   parameter M2_SLAVE5ENABLE      = 0;
   parameter M2_SLAVE6ENABLE      = 0;
   parameter M2_SLAVE7ENABLE      = 0;
   parameter M2_SLAVE8ENABLE      = 0;
   parameter M2_SLAVE9ENABLE      = 0;
   parameter M2_SLAVE10ENABLE     = 0;
   parameter M2_SLAVE11ENABLE     = 0;
   parameter M2_SLAVE12ENABLE     = 0;
   parameter M2_SLAVE13ENABLE     = 0;
   parameter M2_SLAVE14ENABLE     = 0;
   parameter M2_SLAVE15ENABLE     = 0;
   parameter M2_SLAVE16ENABLE     = 0;

   parameter M3_SLAVE0ENABLE      = 1;
   parameter M3_SLAVE1ENABLE      = 0;
   parameter M3_SLAVE2ENABLE      = 0;
   parameter M3_SLAVE3ENABLE      = 0;
   parameter M3_SLAVE4ENABLE      = 0;
   parameter M3_SLAVE5ENABLE      = 0;
   parameter M3_SLAVE6ENABLE      = 0;
   parameter M3_SLAVE7ENABLE      = 0;
   parameter M3_SLAVE8ENABLE      = 0;
   parameter M3_SLAVE9ENABLE      = 0;
   parameter M3_SLAVE10ENABLE     = 0;
   parameter M3_SLAVE11ENABLE     = 0;
   parameter M3_SLAVE12ENABLE     = 0;
   parameter M3_SLAVE13ENABLE     = 0;
   parameter M3_SLAVE14ENABLE     = 0;
   parameter M3_SLAVE15ENABLE     = 0;    
   parameter M3_SLAVE16ENABLE     = 0;

   parameter ID_WIDTH             = 4;
   parameter BASE_ID_WIDTH        = 0;
   parameter NUM_SLAVE_SLOT       = 1;  // 1 - 16
   parameter NUM_MASTER_SLOT      = 1;  // 1 - 4
   parameter MEMSPACE             = 1;  // 0 - 6
   parameter HGS_CFG              = 1;  // 1 - 6
   parameter ADDR_HGS_CFG         = 1;  // 0 - 1

   parameter SC_0                 = 0;
   parameter SC_1                 = 0;
   parameter SC_2                 = 0;
   parameter SC_3                 = 0;
   parameter SC_4                 = 0;
   parameter SC_5                 = 0;
   parameter SC_6                 = 0;
   parameter SC_7                 = 0;
   parameter SC_8                 = 0;
   parameter SC_9                 = 0;
   parameter SC_10                = 0;
   parameter SC_11                = 0;
   parameter SC_12                = 0;
   parameter SC_13                = 0;
   parameter SC_14                = 0;
   parameter SC_15                = 0;

   parameter FEED_THROUGH         = 0;  // 0 - 1
   parameter INP_REG_BUF          = 1;  // 0 - 1
   parameter OUT_REG_BUF          = 1;  // 0 - 1

   parameter WR_ACCEPTANCE        = 4;  // 1 - 4
   parameter RD_ACCEPTANCE        = 4;  // 1 - 4
   parameter SYNC_RESET           = 0;

   localparam AXI_STRBWIDTH       = AXI_DWIDTH/8;

   localparam SLAVE_0  =        17'b00000000000000001;
   localparam SLAVE_1  =        17'b00000000000000010;
   localparam SLAVE_2  =        17'b00000000000000100;
   localparam SLAVE_3  =        17'b00000000000001000;
   localparam SLAVE_4  =        17'b00000000000010000;
   localparam SLAVE_5  =        17'b00000000000100000;
   localparam SLAVE_6  =        17'b00000000001000000;
   localparam SLAVE_7  =        17'b00000000010000000;
   localparam SLAVE_8  =        17'b00000000100000000;
   localparam SLAVE_9  =        17'b00000001000000000;
   localparam SLAVE_A  =        17'b00000010000000000;
   localparam SLAVE_B  =        17'b00000100000000000;
   localparam SLAVE_C  =        17'b00001000000000000;
   localparam SLAVE_D  =        17'b00010000000000000;
   localparam SLAVE_E  =        17'b00100000000000000;
   localparam SLAVE_F  =        17'b01000000000000000;
   localparam SLAVE_N  =        17'b10000000000000000;

   // --------------------------------------------------------------------------
   // I/O Declaration
   // --------------------------------------------------------------------------
   // Global signals
   input       ACLK;
   input       ARESETN;
   
   // For Arbiter from Masters
   // To end grant to current master
   input       m0_wr_end;
   input       m1_wr_end;
   input       m2_wr_end;
   input       m3_wr_end;

   input  [31:0]      AWADDR_M0;
   input  [1:0]                 AWLOCK_M0;
   input                        AWVALID_M0;
   input  [31:0]      AWADDR_M1;
   input  [1:0]                 AWLOCK_M1;
   input                        AWVALID_M1;
   input  [31:0]      AWADDR_M2;
   input  [1:0]                 AWLOCK_M2;
   input                        AWVALID_M2;
   input  [31:0]      AWADDR_M3;
   input  [1:0]                 AWLOCK_M3;
   input                        AWVALID_M3;

   
   // From Master 0
   // AXI write address channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_MI0;
   input [31:0]        AWADDR_MI0;
   input [3:0]                   AWLEN_MI0;
   input [2:0]                   AWSIZE_MI0;
   input [1:0]                   AWBURST_MI0;
   input [1:0]                   AWLOCK_MI0;
   input [3:0]                   AWCACHE_MI0;
   input [2:0]                   AWPROT_MI0;
   input                         AWVALID_MI0;
   output                        AWREADY_IM0;

   // From Master 1
   // AXI write address channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_MI1;
   input [31:0]        AWADDR_MI1;
   input [3:0]                   AWLEN_MI1;
   input [2:0]                   AWSIZE_MI1;
   input [1:0]                   AWBURST_MI1;
   input [1:0]                   AWLOCK_MI1;
   input [3:0]                   AWCACHE_MI1;
   input [2:0]                   AWPROT_MI1;
   input                         AWVALID_MI1;
   output                        AWREADY_IM1;

   // From Master 2
   // AXI write address channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_MI2;
   input [31:0]        AWADDR_MI2;
   input [3:0]                   AWLEN_MI2;
   input [2:0]                   AWSIZE_MI2;
   input [1:0]                   AWBURST_MI2;
   input [1:0]                   AWLOCK_MI2;
   input [3:0]                   AWCACHE_MI2;
   input [2:0]                   AWPROT_MI2;
   input                         AWVALID_MI2;
   output                        AWREADY_IM2;

   // From Master 3
   // AXI write address channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_MI3;
   input [31:0]        AWADDR_MI3;
   input [3:0]                   AWLEN_MI3;
   input [2:0]                   AWSIZE_MI3;
   input [1:0]                   AWBURST_MI3;
   input [1:0]                   AWLOCK_MI3;
   input [3:0]                   AWCACHE_MI3;
   input [2:0]                   AWPROT_MI3;
   input                         AWVALID_MI3;
   output                        AWREADY_IM3;

    // SLAVE 0
    // AXI SLAVE 0 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS;
    output [31:0]      AWADDR_IS;
    output [3:0]                 AWLEN_IS;
    output [2:0]                 AWSIZE_IS;
    output [1:0]                 AWBURST_IS;
    output [1:0]                 AWLOCK_IS;
    output [3:0]                 AWCACHE_IS;
    output [2:0]                 AWPROT_IS;
    output                       AWVALID_IS;
   output [31:0]       AWADDR_IS_int;

    input                        AWREADY_SI;

   output [16:0]                 gated_waddr;
   input [4:0]                   SLAVE_NUMBER;
   output [3:0]                  MST_WRGNT_NUM; 
   input                         BVALID_SI;
   input                         BREADY_IS;
   //v3.2 - For outstanding writes

   input [WR_ACCEPTANCE-1:0]       pending_wr0;
   input [WR_ACCEPTANCE-1:0]       pending_wr1;
   input [WR_ACCEPTANCE-1:0]       pending_wr2;
   input [WR_ACCEPTANCE-1:0]       pending_wr3;

   input                           BVBR_M0_pulse;
   input                           BVBR_M1_pulse;
   input                           BVBR_M2_pulse;
   input                           BVBR_M3_pulse;
   input                           slave_out_en; 
   output                          wr_lock_high;  
   input                           rd_lock_high;  
   output                          wr_normal_high;  
   input                           rd_normal_high;  

   input                           mst_rd_inprog0;  
   input                           mst_rd_inprog1;  
   input                           mst_rd_inprog2;  
   input                           mst_rd_inprog3;  
   input                           mst_wr_inprog0;                                 
   input                           mst_wr_inprog1;                                 
   input                           mst_wr_inprog2;                                 
   input                           mst_wr_inprog3;                                 
   
   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------
   wire [31:0]       AWADDR_IS_int;


   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS;
   wire [31:0]               AWADDR_IS;
   wire [3:0]                          AWLEN_IS;
   wire [2:0]                          AWSIZE_IS;
   wire [1:0]                          AWBURST_IS;
   wire [1:0]                          AWLOCK_IS;
   wire [3:0]                          AWCACHE_IS;
   wire [2:0]                          AWPROT_IS;
   wire                                AWVALID_IS;


   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IC;
   wire [31:0]               AWADDR_IC;
   wire [3:0]                          AWLEN_IC;
   wire [2:0]                          AWSIZE_IC;
   wire [1:0]                          AWBURST_IC;
   wire [1:0]                          AWLOCK_IC;
   wire [3:0]                          AWCACHE_IC;
   wire [2:0]                          AWPROT_IC;
   wire                                AWVALID_IC;

   wire                                BVALID_SI;
   wire                                BREADY_IS;

   wire [16:0]                         gated_waddr;

   wire                                aresetn;
   wire                                sresetn;

   /////////////////////////////////////////////////////////////////////////////
   //                               Start - of - Code                         //
   /////////////////////////////////////////////////////////////////////////////

   // --------------------------------------------------------------------------
   // resets
   // --------------------------------------------------------------------------
   assign aresetn   = (SYNC_RESET == 1) ? 1'b1  : ARESETN;
   assign sresetn   = (SYNC_RESET == 1) ? ARESETN : 1'b1;

   // --------------------------------------------------------------------------
   // Select the Master signals based the grant provided by the arbiter
   // --------------------------------------------------------------------------
   generate
      if(MEMSPACE > 0) begin

   axi_wrmatrix_4Mto1S #(
                   .SYNC_RESET(SYNC_RESET),
                   .AXI_AWIDTH(AXI_AWIDTH),
                   .AXI_DWIDTH(AXI_DWIDTH),
                   .NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),
                   .NUM_MASTER_SLOT(NUM_MASTER_SLOT),
           	       .FEED_THROUGH(FEED_THROUGH),
		           .INP_REG_BUF(INP_REG_BUF),
		           .OUT_REG_BUF(OUT_REG_BUF),
		           .MEMSPACE(MEMSPACE),
		           .HGS_CFG(HGS_CFG),
		           .ADDR_HGS_CFG(ADDR_HGS_CFG),
                   .ID_WIDTH(ID_WIDTH),
                   .BASE_ID_WIDTH(BASE_ID_WIDTH),
                   .WR_ACCEPTANCE(WR_ACCEPTANCE),
                   .RD_ACCEPTANCE(RD_ACCEPTANCE),
                   .SC_0(SC_0),
                   .SC_1(SC_1),
                   .SC_2(SC_2),
                   .SC_3(SC_3),
                   .SC_4(SC_4),
                   .SC_5(SC_5),
                   .SC_6(SC_6),
                   .SC_7(SC_7),
                   .SC_8(SC_8),
                   .SC_9(SC_9),
                   .SC_10(SC_10),
                   .SC_11(SC_11),
                   .SC_12(SC_12),
                   .SC_13(SC_13),
                   .SC_14(SC_14),
                   .SC_15(SC_15),
                   .M0_SLAVE0ENABLE(M0_SLAVE0ENABLE),
                   .M0_SLAVE1ENABLE(M0_SLAVE1ENABLE),
                   .M0_SLAVE2ENABLE(M0_SLAVE2ENABLE),
                   .M0_SLAVE3ENABLE(M0_SLAVE3ENABLE),
                   .M0_SLAVE4ENABLE(M0_SLAVE4ENABLE),
                   .M0_SLAVE5ENABLE(M0_SLAVE5ENABLE),
                   .M0_SLAVE6ENABLE(M0_SLAVE6ENABLE),
                   .M0_SLAVE7ENABLE(M0_SLAVE7ENABLE),
                   .M0_SLAVE8ENABLE(M0_SLAVE8ENABLE),
                   .M0_SLAVE9ENABLE(M0_SLAVE9ENABLE),
                   .M0_SLAVE10ENABLE(M0_SLAVE10ENABLE),
                   .M0_SLAVE11ENABLE(M0_SLAVE11ENABLE),
                   .M0_SLAVE12ENABLE(M0_SLAVE12ENABLE),
                   .M0_SLAVE13ENABLE(M0_SLAVE13ENABLE),
                   .M0_SLAVE14ENABLE(M0_SLAVE14ENABLE),
                   .M0_SLAVE15ENABLE(M0_SLAVE15ENABLE),
                   .M0_SLAVE16ENABLE(M0_SLAVE16ENABLE),
                   
                   .M1_SLAVE0ENABLE(M1_SLAVE0ENABLE),
                   .M1_SLAVE1ENABLE(M1_SLAVE1ENABLE),
                   .M1_SLAVE2ENABLE(M1_SLAVE2ENABLE),
                   .M1_SLAVE3ENABLE(M1_SLAVE3ENABLE),
                   .M1_SLAVE4ENABLE(M1_SLAVE4ENABLE),
                   .M1_SLAVE5ENABLE(M1_SLAVE5ENABLE),
                   .M1_SLAVE6ENABLE(M1_SLAVE6ENABLE),
                   .M1_SLAVE7ENABLE(M1_SLAVE7ENABLE),
                   .M1_SLAVE8ENABLE(M1_SLAVE8ENABLE),
                   .M1_SLAVE9ENABLE(M1_SLAVE9ENABLE),
                   .M1_SLAVE10ENABLE(M1_SLAVE10ENABLE),
                   .M1_SLAVE11ENABLE(M1_SLAVE11ENABLE),
                   .M1_SLAVE12ENABLE(M1_SLAVE12ENABLE),
                   .M1_SLAVE13ENABLE(M1_SLAVE13ENABLE),
                   .M1_SLAVE14ENABLE(M1_SLAVE14ENABLE),
                   .M1_SLAVE15ENABLE(M1_SLAVE15ENABLE),
                   .M1_SLAVE16ENABLE(M1_SLAVE16ENABLE),
                   
                   .M2_SLAVE0ENABLE(M2_SLAVE0ENABLE),
                   .M2_SLAVE1ENABLE(M2_SLAVE1ENABLE),
                   .M2_SLAVE2ENABLE(M2_SLAVE2ENABLE),
                   .M2_SLAVE3ENABLE(M2_SLAVE3ENABLE),
                   .M2_SLAVE4ENABLE(M2_SLAVE4ENABLE),
                   .M2_SLAVE5ENABLE(M2_SLAVE5ENABLE),
                   .M2_SLAVE6ENABLE(M2_SLAVE6ENABLE),
                   .M2_SLAVE7ENABLE(M2_SLAVE7ENABLE),
                   .M2_SLAVE8ENABLE(M2_SLAVE8ENABLE),
                   .M2_SLAVE9ENABLE(M2_SLAVE9ENABLE),
                   .M2_SLAVE10ENABLE(M2_SLAVE10ENABLE),
                   .M2_SLAVE11ENABLE(M2_SLAVE11ENABLE),
                   .M2_SLAVE12ENABLE(M2_SLAVE12ENABLE),
                   .M2_SLAVE13ENABLE(M2_SLAVE13ENABLE),
                   .M2_SLAVE14ENABLE(M2_SLAVE14ENABLE),
                   .M2_SLAVE15ENABLE(M2_SLAVE15ENABLE),
                   .M2_SLAVE16ENABLE(M2_SLAVE16ENABLE),
                   
                   .M3_SLAVE0ENABLE(M3_SLAVE0ENABLE),
                   .M3_SLAVE1ENABLE(M3_SLAVE1ENABLE),
                   .M3_SLAVE2ENABLE(M3_SLAVE2ENABLE),
                   .M3_SLAVE3ENABLE(M3_SLAVE3ENABLE),
                   .M3_SLAVE4ENABLE(M3_SLAVE4ENABLE),
                   .M3_SLAVE5ENABLE(M3_SLAVE5ENABLE),
                   .M3_SLAVE6ENABLE(M3_SLAVE6ENABLE),
                   .M3_SLAVE7ENABLE(M3_SLAVE7ENABLE),
                   .M3_SLAVE8ENABLE(M3_SLAVE8ENABLE),
                   .M3_SLAVE9ENABLE(M3_SLAVE9ENABLE),
                   .M3_SLAVE10ENABLE(M3_SLAVE10ENABLE),
                   .M3_SLAVE11ENABLE(M3_SLAVE11ENABLE),
                   .M3_SLAVE12ENABLE(M3_SLAVE12ENABLE),
                   .M3_SLAVE13ENABLE(M3_SLAVE13ENABLE),
                   .M3_SLAVE14ENABLE(M3_SLAVE14ENABLE),
                   .M3_SLAVE15ENABLE(M3_SLAVE15ENABLE),
                   .M3_SLAVE16ENABLE(M3_SLAVE16ENABLE)

                   )
     inst_wrmatrix_4Mto1S (
                           // Global signals
                           .ACLK(ACLK),
                           .ARESETN(ARESETN),             
                            
                           .AWADDR_M0(AWADDR_M0),
                           .AWVALID_M0(AWVALID_M0),
                           .AWLOCK_M0(AWLOCK_M0),
                           .AWADDR_M1(AWADDR_M1),
                           .AWVALID_M1(AWVALID_M1),
                           .AWLOCK_M1(AWLOCK_M1),
                           .AWADDR_M2(AWADDR_M2),
                           .AWVALID_M2(AWVALID_M2),
                           .AWLOCK_M2(AWLOCK_M2),
                           .AWADDR_M3(AWADDR_M3),
                           .AWVALID_M3(AWVALID_M3),
                           .AWLOCK_M3(AWLOCK_M3),

                           .m0_wr_end(m0_wr_end),
                           .m1_wr_end(m1_wr_end),
                           .m2_wr_end(m2_wr_end),
                           .m3_wr_end(m3_wr_end),

                           // AXI MASTER write address channel signals
                           .AWREADY_SI(AWREADY_SI),
                           .BVALID_SI(BVALID_SI),
                           .BREADY_IS(BREADY_IS),
                         
                           // MASTER 0
                           // AXI MASTER write address channel signals
                           .AWID_MI0(AWID_MI0),
                           .AWADDR_MI0(AWADDR_MI0),
                           .AWLEN_MI0(AWLEN_MI0),
                           .AWSIZE_MI0(AWSIZE_MI0),
                           .AWBURST_MI0(AWBURST_MI0),
                           .AWLOCK_MI0(AWLOCK_MI0),
                           .AWCACHE_MI0(AWCACHE_MI0),
                           .AWPROT_MI0(AWPROT_MI0),
                           .AWVALID_MI0(AWVALID_MI0),
                           .AWREADY_IM0(AWREADY_IM0),
                                                   
                           // MASTER 1
                           // AXI MASTER write address channel signals
                           .AWID_MI1(AWID_MI1),
                           .AWADDR_MI1(AWADDR_MI1),
                           .AWLEN_MI1(AWLEN_MI1),
                           .AWSIZE_MI1(AWSIZE_MI1),
                           .AWBURST_MI1(AWBURST_MI1),
                           .AWLOCK_MI1(AWLOCK_MI1),
                           .AWCACHE_MI1(AWCACHE_MI1),
                           .AWPROT_MI1(AWPROT_MI1),
                           .AWVALID_MI1(AWVALID_MI1),
                           .AWREADY_IM1(AWREADY_IM1),
                           
                           // MASTER 2
                           // AXI MASTER write address channel signals
                           .AWID_MI2(AWID_MI2),
                           .AWADDR_MI2(AWADDR_MI2),
                           .AWLEN_MI2(AWLEN_MI2),
                           .AWSIZE_MI2(AWSIZE_MI2),
                           .AWBURST_MI2(AWBURST_MI2),
                           .AWLOCK_MI2(AWLOCK_MI2),
                           .AWCACHE_MI2(AWCACHE_MI2),
                           .AWPROT_MI2(AWPROT_MI2),
                           .AWVALID_MI2(AWVALID_MI2),
                           .AWREADY_IM2(AWREADY_IM2),
                           
                           // MASTER 3
                           // AXI MASTER write address channel signals
                           .AWID_MI3(AWID_MI3),
                           .AWADDR_MI3(AWADDR_MI3),
                           .AWLEN_MI3(AWLEN_MI3),
                           .AWSIZE_MI3(AWSIZE_MI3),
                           .AWBURST_MI3(AWBURST_MI3),
                           .AWLOCK_MI3(AWLOCK_MI3),
                           .AWCACHE_MI3(AWCACHE_MI3),
                           .AWPROT_MI3(AWPROT_MI3),
                           .AWVALID_MI3(AWVALID_MI3),
                           .AWREADY_IM3(AWREADY_IM3),
                           
                           // SLAVE 0
                           // AXI SLAVE 0 write address channel signals
                           .AWID_IS(AWID_IS),
                           .AWADDR_IS(AWADDR_IS),
                           .AWLEN_IS(AWLEN_IS),
                           .AWSIZE_IS(AWSIZE_IS),
                           .AWBURST_IS(AWBURST_IS),
                           .AWLOCK_IS(AWLOCK_IS),
                           .AWCACHE_IS(AWCACHE_IS),
                           .AWPROT_IS(AWPROT_IS),
                           .AWVALID_IS(AWVALID_IS),
                           .AWADDR_IS_int(AWADDR_IS_int),
                         
                           .MST_WRGNT_NUM(MST_WRGNT_NUM),
                           .SLAVE_SELECT_WADDRCH_M(gated_waddr),
                           .SLAVE_NUMBER(SLAVE_NUMBER),
                     .pending_wr0(pending_wr0),                       
                     .pending_wr1(pending_wr1),                       
                     .pending_wr2(pending_wr2),                       
                     .pending_wr3(pending_wr3),                       
                     .BVBR_M0_pulse (BVBR_M0_pulse),
                     .BVBR_M1_pulse (BVBR_M1_pulse),
                     .BVBR_M2_pulse (BVBR_M2_pulse),
                     .BVBR_M3_pulse (BVBR_M3_pulse),
                     .slave_out_en (slave_out_en)  
                           ,.wr_lock_high(wr_lock_high)  
                           ,.rd_lock_high(rd_lock_high)  
                           ,.wr_normal_high(wr_normal_high)  
                           ,.rd_normal_high(rd_normal_high)  

                           ,.mst_rd_inprog0(mst_rd_inprog0) 
                           ,.mst_rd_inprog1(mst_rd_inprog1) 
                           ,.mst_rd_inprog2(mst_rd_inprog2) 
                           ,.mst_rd_inprog3(mst_rd_inprog3) 
                           ,.mst_wr_inprog0(mst_wr_inprog0)                               
                           ,.mst_wr_inprog1(mst_wr_inprog1)                               
                           ,.mst_wr_inprog2(mst_wr_inprog2)                               
                           ,.mst_wr_inprog3(mst_wr_inprog3)                               
                           );

      end // if (MEMSPACE > 0)
   endgenerate
   
   generate
      if(MEMSPACE == 0 && ADDR_HGS_CFG == 0) begin

   axi_wrmatrix_4Mto1S_hgs_low #(
                   .SYNC_RESET(SYNC_RESET),
                   .AXI_AWIDTH(AXI_AWIDTH),
                   .AXI_DWIDTH(AXI_DWIDTH),
                   .NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),
                   .NUM_MASTER_SLOT(NUM_MASTER_SLOT),
           	       .FEED_THROUGH(FEED_THROUGH),
		           .INP_REG_BUF(INP_REG_BUF),
		           .OUT_REG_BUF(OUT_REG_BUF),
		           .MEMSPACE(MEMSPACE),
		           .HGS_CFG(HGS_CFG),
		           .ADDR_HGS_CFG(ADDR_HGS_CFG),
                   .ID_WIDTH(ID_WIDTH),
                   .BASE_ID_WIDTH(BASE_ID_WIDTH),
                   .WR_ACCEPTANCE(WR_ACCEPTANCE),
                   .RD_ACCEPTANCE(RD_ACCEPTANCE),
                   .SC_0(SC_0),
                   .SC_1(SC_1),
                   .SC_2(SC_2),
                   .SC_3(SC_3),
                   .SC_4(SC_4),
                   .SC_5(SC_5),
                   .SC_6(SC_6),
                   .SC_7(SC_7),
                   .SC_8(SC_8),
                   .SC_9(SC_9),
                   .SC_10(SC_10),
                   .SC_11(SC_11),
                   .SC_12(SC_12),
                   .SC_13(SC_13),
                   .SC_14(SC_14),
                   .SC_15(SC_15),
                   .M0_SLAVE0ENABLE(M0_SLAVE0ENABLE),
                   .M0_SLAVE1ENABLE(M0_SLAVE1ENABLE),
                   .M0_SLAVE2ENABLE(M0_SLAVE2ENABLE),
                   .M0_SLAVE3ENABLE(M0_SLAVE3ENABLE),
                   .M0_SLAVE4ENABLE(M0_SLAVE4ENABLE),
                   .M0_SLAVE5ENABLE(M0_SLAVE5ENABLE),
                   .M0_SLAVE6ENABLE(M0_SLAVE6ENABLE),
                   .M0_SLAVE7ENABLE(M0_SLAVE7ENABLE),
                   .M0_SLAVE8ENABLE(M0_SLAVE8ENABLE),
                   .M0_SLAVE9ENABLE(M0_SLAVE9ENABLE),
                   .M0_SLAVE10ENABLE(M0_SLAVE10ENABLE),
                   .M0_SLAVE11ENABLE(M0_SLAVE11ENABLE),
                   .M0_SLAVE12ENABLE(M0_SLAVE12ENABLE),
                   .M0_SLAVE13ENABLE(M0_SLAVE13ENABLE),
                   .M0_SLAVE14ENABLE(M0_SLAVE14ENABLE),
                   .M0_SLAVE15ENABLE(M0_SLAVE15ENABLE),
                   .M0_SLAVE16ENABLE(M0_SLAVE16ENABLE),
                   
                   .M1_SLAVE0ENABLE(M1_SLAVE0ENABLE),
                   .M1_SLAVE1ENABLE(M1_SLAVE1ENABLE),
                   .M1_SLAVE2ENABLE(M1_SLAVE2ENABLE),
                   .M1_SLAVE3ENABLE(M1_SLAVE3ENABLE),
                   .M1_SLAVE4ENABLE(M1_SLAVE4ENABLE),
                   .M1_SLAVE5ENABLE(M1_SLAVE5ENABLE),
                   .M1_SLAVE6ENABLE(M1_SLAVE6ENABLE),
                   .M1_SLAVE7ENABLE(M1_SLAVE7ENABLE),
                   .M1_SLAVE8ENABLE(M1_SLAVE8ENABLE),
                   .M1_SLAVE9ENABLE(M1_SLAVE9ENABLE),
                   .M1_SLAVE10ENABLE(M1_SLAVE10ENABLE),
                   .M1_SLAVE11ENABLE(M1_SLAVE11ENABLE),
                   .M1_SLAVE12ENABLE(M1_SLAVE12ENABLE),
                   .M1_SLAVE13ENABLE(M1_SLAVE13ENABLE),
                   .M1_SLAVE14ENABLE(M1_SLAVE14ENABLE),
                   .M1_SLAVE15ENABLE(M1_SLAVE15ENABLE),
                   .M1_SLAVE16ENABLE(M1_SLAVE16ENABLE),
                   
                   .M2_SLAVE0ENABLE(M2_SLAVE0ENABLE),
                   .M2_SLAVE1ENABLE(M2_SLAVE1ENABLE),
                   .M2_SLAVE2ENABLE(M2_SLAVE2ENABLE),
                   .M2_SLAVE3ENABLE(M2_SLAVE3ENABLE),
                   .M2_SLAVE4ENABLE(M2_SLAVE4ENABLE),
                   .M2_SLAVE5ENABLE(M2_SLAVE5ENABLE),
                   .M2_SLAVE6ENABLE(M2_SLAVE6ENABLE),
                   .M2_SLAVE7ENABLE(M2_SLAVE7ENABLE),
                   .M2_SLAVE8ENABLE(M2_SLAVE8ENABLE),
                   .M2_SLAVE9ENABLE(M2_SLAVE9ENABLE),
                   .M2_SLAVE10ENABLE(M2_SLAVE10ENABLE),
                   .M2_SLAVE11ENABLE(M2_SLAVE11ENABLE),
                   .M2_SLAVE12ENABLE(M2_SLAVE12ENABLE),
                   .M2_SLAVE13ENABLE(M2_SLAVE13ENABLE),
                   .M2_SLAVE14ENABLE(M2_SLAVE14ENABLE),
                   .M2_SLAVE15ENABLE(M2_SLAVE15ENABLE),
                   .M2_SLAVE16ENABLE(M2_SLAVE16ENABLE),
                   
                   .M3_SLAVE0ENABLE(M3_SLAVE0ENABLE),
                   .M3_SLAVE1ENABLE(M3_SLAVE1ENABLE),
                   .M3_SLAVE2ENABLE(M3_SLAVE2ENABLE),
                   .M3_SLAVE3ENABLE(M3_SLAVE3ENABLE),
                   .M3_SLAVE4ENABLE(M3_SLAVE4ENABLE),
                   .M3_SLAVE5ENABLE(M3_SLAVE5ENABLE),
                   .M3_SLAVE6ENABLE(M3_SLAVE6ENABLE),
                   .M3_SLAVE7ENABLE(M3_SLAVE7ENABLE),
                   .M3_SLAVE8ENABLE(M3_SLAVE8ENABLE),
                   .M3_SLAVE9ENABLE(M3_SLAVE9ENABLE),
                   .M3_SLAVE10ENABLE(M3_SLAVE10ENABLE),
                   .M3_SLAVE11ENABLE(M3_SLAVE11ENABLE),
                   .M3_SLAVE12ENABLE(M3_SLAVE12ENABLE),
                   .M3_SLAVE13ENABLE(M3_SLAVE13ENABLE),
                   .M3_SLAVE14ENABLE(M3_SLAVE14ENABLE),
                   .M3_SLAVE15ENABLE(M3_SLAVE15ENABLE),
                   .M3_SLAVE16ENABLE(M3_SLAVE16ENABLE)

                   )
     inst_wrmatrix_4Mto1S_hgs_low (
                           // Global signals
                           .ACLK(ACLK),
                           .ARESETN(ARESETN),             
                            
                           .AWADDR_M0(AWADDR_M0),
                           .AWVALID_M0(AWVALID_M0),
                           .AWLOCK_M0(AWLOCK_M0),
                           .AWADDR_M1(AWADDR_M1),
                           .AWVALID_M1(AWVALID_M1),
                           .AWLOCK_M1(AWLOCK_M1),
                           .AWADDR_M2(AWADDR_M2),
                           .AWVALID_M2(AWVALID_M2),
                           .AWLOCK_M2(AWLOCK_M2),
                           .AWADDR_M3(AWADDR_M3),
                           .AWVALID_M3(AWVALID_M3),
                           .AWLOCK_M3(AWLOCK_M3),

                           .m0_wr_end(m0_wr_end),
                           .m1_wr_end(m1_wr_end),
                           .m2_wr_end(m2_wr_end),
                           .m3_wr_end(m3_wr_end),

                           // AXI MASTER write address channel signals
                           .AWREADY_SI(AWREADY_SI),
                           .BVALID_SI(BVALID_SI),
                           .BREADY_IS(BREADY_IS),
                         
                           // MASTER 0
                           // AXI MASTER write address channel signals
                           .AWID_MI0(AWID_MI0),
                           .AWADDR_MI0(AWADDR_MI0),
                           .AWLEN_MI0(AWLEN_MI0),
                           .AWSIZE_MI0(AWSIZE_MI0),
                           .AWBURST_MI0(AWBURST_MI0),
                           .AWLOCK_MI0(AWLOCK_MI0),
                           .AWCACHE_MI0(AWCACHE_MI0),
                           .AWPROT_MI0(AWPROT_MI0),
                           .AWVALID_MI0(AWVALID_MI0),
                           .AWREADY_IM0(AWREADY_IM0),
                                                   
                           // MASTER 1
                           // AXI MASTER write address channel signals
                           .AWID_MI1(AWID_MI1),
                           .AWADDR_MI1(AWADDR_MI1),
                           .AWLEN_MI1(AWLEN_MI1),
                           .AWSIZE_MI1(AWSIZE_MI1),
                           .AWBURST_MI1(AWBURST_MI1),
                           .AWLOCK_MI1(AWLOCK_MI1),
                           .AWCACHE_MI1(AWCACHE_MI1),
                           .AWPROT_MI1(AWPROT_MI1),
                           .AWVALID_MI1(AWVALID_MI1),
                           .AWREADY_IM1(AWREADY_IM1),
                           
                           // MASTER 2
                           // AXI MASTER write address channel signals
                           .AWID_MI2(AWID_MI2),
                           .AWADDR_MI2(AWADDR_MI2),
                           .AWLEN_MI2(AWLEN_MI2),
                           .AWSIZE_MI2(AWSIZE_MI2),
                           .AWBURST_MI2(AWBURST_MI2),
                           .AWLOCK_MI2(AWLOCK_MI2),
                           .AWCACHE_MI2(AWCACHE_MI2),
                           .AWPROT_MI2(AWPROT_MI2),
                           .AWVALID_MI2(AWVALID_MI2),
                           .AWREADY_IM2(AWREADY_IM2),
                           
                           // MASTER 3
                           // AXI MASTER write address channel signals
                           .AWID_MI3(AWID_MI3),
                           .AWADDR_MI3(AWADDR_MI3),
                           .AWLEN_MI3(AWLEN_MI3),
                           .AWSIZE_MI3(AWSIZE_MI3),
                           .AWBURST_MI3(AWBURST_MI3),
                           .AWLOCK_MI3(AWLOCK_MI3),
                           .AWCACHE_MI3(AWCACHE_MI3),
                           .AWPROT_MI3(AWPROT_MI3),
                           .AWVALID_MI3(AWVALID_MI3),
                           .AWREADY_IM3(AWREADY_IM3),
                           
                           // SLAVE 0
                           // AXI SLAVE 0 write address channel signals
                           .AWID_IS(AWID_IS),
                           .AWADDR_IS(AWADDR_IS),
                           .AWLEN_IS(AWLEN_IS),
                           .AWSIZE_IS(AWSIZE_IS),
                           .AWBURST_IS(AWBURST_IS),
                           .AWLOCK_IS(AWLOCK_IS),
                           .AWCACHE_IS(AWCACHE_IS),
                           .AWPROT_IS(AWPROT_IS),
                           .AWVALID_IS(AWVALID_IS),
                           .AWADDR_IS_int(AWADDR_IS_int),
                         
                           .MST_WRGNT_NUM(MST_WRGNT_NUM),
                           .SLAVE_SELECT_WADDRCH_M(gated_waddr),
                           .SLAVE_NUMBER(SLAVE_NUMBER),
                     .pending_wr0(pending_wr0),                       
                     .pending_wr1(pending_wr1),                       
                     .pending_wr2(pending_wr2),                       
                     .pending_wr3(pending_wr3),                       
                     .BVBR_M0_pulse (BVBR_M0_pulse),
                     .BVBR_M1_pulse (BVBR_M1_pulse),
                     .BVBR_M2_pulse (BVBR_M2_pulse),
                     .BVBR_M3_pulse (BVBR_M3_pulse),
                     .slave_out_en (slave_out_en) 
                           ,.wr_lock_high(wr_lock_high)  
                           ,.rd_lock_high(rd_lock_high)  
                           ,.wr_normal_high(wr_normal_high)  
                           ,.rd_normal_high(rd_normal_high)  
                           ,.mst_rd_inprog0(mst_rd_inprog0) 
                           ,.mst_rd_inprog1(mst_rd_inprog1) 
                           ,.mst_rd_inprog2(mst_rd_inprog2) 
                           ,.mst_rd_inprog3(mst_rd_inprog3) 
                           ,.mst_wr_inprog0(mst_wr_inprog0)                               
                           ,.mst_wr_inprog1(mst_wr_inprog1)                               
                           ,.mst_wr_inprog2(mst_wr_inprog2)                               
                           ,.mst_wr_inprog3(mst_wr_inprog3)                               
                           );


      end // if (MEMSPACE == 0 && ADDR_HGS_CFG == 0)      
   endgenerate

   generate
      if(MEMSPACE == 0 && ADDR_HGS_CFG == 1) begin

   axi_wrmatrix_4Mto1S_hgs_high #(
                   .SYNC_RESET(SYNC_RESET),
                   .AXI_AWIDTH(AXI_AWIDTH),
                   .AXI_DWIDTH(AXI_DWIDTH),
                   .NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),
                   .NUM_MASTER_SLOT(NUM_MASTER_SLOT),
           	       .FEED_THROUGH(FEED_THROUGH),
		           .INP_REG_BUF(INP_REG_BUF),
		           .OUT_REG_BUF(OUT_REG_BUF),
		           .MEMSPACE(MEMSPACE),
		           .HGS_CFG(HGS_CFG),
		           .ADDR_HGS_CFG(ADDR_HGS_CFG),
                   .ID_WIDTH(ID_WIDTH),
                   .BASE_ID_WIDTH(BASE_ID_WIDTH),
                   .WR_ACCEPTANCE(WR_ACCEPTANCE),
                   .RD_ACCEPTANCE(RD_ACCEPTANCE),
                   .SC_0(SC_0),
                   .SC_1(SC_1),
                   .SC_2(SC_2),
                   .SC_3(SC_3),
                   .SC_4(SC_4),
                   .SC_5(SC_5),
                   .SC_6(SC_6),
                   .SC_7(SC_7),
                   .SC_8(SC_8),
                   .SC_9(SC_9),
                   .SC_10(SC_10),
                   .SC_11(SC_11),
                   .SC_12(SC_12),
                   .SC_13(SC_13),
                   .SC_14(SC_14),
                   .SC_15(SC_15),
                   .M0_SLAVE0ENABLE(M0_SLAVE0ENABLE),
                   .M0_SLAVE1ENABLE(M0_SLAVE1ENABLE),
                   .M0_SLAVE2ENABLE(M0_SLAVE2ENABLE),
                   .M0_SLAVE3ENABLE(M0_SLAVE3ENABLE),
                   .M0_SLAVE4ENABLE(M0_SLAVE4ENABLE),
                   .M0_SLAVE5ENABLE(M0_SLAVE5ENABLE),
                   .M0_SLAVE6ENABLE(M0_SLAVE6ENABLE),
                   .M0_SLAVE7ENABLE(M0_SLAVE7ENABLE),
                   .M0_SLAVE8ENABLE(M0_SLAVE8ENABLE),
                   .M0_SLAVE9ENABLE(M0_SLAVE9ENABLE),
                   .M0_SLAVE10ENABLE(M0_SLAVE10ENABLE),
                   .M0_SLAVE11ENABLE(M0_SLAVE11ENABLE),
                   .M0_SLAVE12ENABLE(M0_SLAVE12ENABLE),
                   .M0_SLAVE13ENABLE(M0_SLAVE13ENABLE),
                   .M0_SLAVE14ENABLE(M0_SLAVE14ENABLE),
                   .M0_SLAVE15ENABLE(M0_SLAVE15ENABLE),
                   .M0_SLAVE16ENABLE(M0_SLAVE16ENABLE),
                   
                   .M1_SLAVE0ENABLE(M1_SLAVE0ENABLE),
                   .M1_SLAVE1ENABLE(M1_SLAVE1ENABLE),
                   .M1_SLAVE2ENABLE(M1_SLAVE2ENABLE),
                   .M1_SLAVE3ENABLE(M1_SLAVE3ENABLE),
                   .M1_SLAVE4ENABLE(M1_SLAVE4ENABLE),
                   .M1_SLAVE5ENABLE(M1_SLAVE5ENABLE),
                   .M1_SLAVE6ENABLE(M1_SLAVE6ENABLE),
                   .M1_SLAVE7ENABLE(M1_SLAVE7ENABLE),
                   .M1_SLAVE8ENABLE(M1_SLAVE8ENABLE),
                   .M1_SLAVE9ENABLE(M1_SLAVE9ENABLE),
                   .M1_SLAVE10ENABLE(M1_SLAVE10ENABLE),
                   .M1_SLAVE11ENABLE(M1_SLAVE11ENABLE),
                   .M1_SLAVE12ENABLE(M1_SLAVE12ENABLE),
                   .M1_SLAVE13ENABLE(M1_SLAVE13ENABLE),
                   .M1_SLAVE14ENABLE(M1_SLAVE14ENABLE),
                   .M1_SLAVE15ENABLE(M1_SLAVE15ENABLE),
                   .M1_SLAVE16ENABLE(M1_SLAVE16ENABLE),
                   
                   .M2_SLAVE0ENABLE(M2_SLAVE0ENABLE),
                   .M2_SLAVE1ENABLE(M2_SLAVE1ENABLE),
                   .M2_SLAVE2ENABLE(M2_SLAVE2ENABLE),
                   .M2_SLAVE3ENABLE(M2_SLAVE3ENABLE),
                   .M2_SLAVE4ENABLE(M2_SLAVE4ENABLE),
                   .M2_SLAVE5ENABLE(M2_SLAVE5ENABLE),
                   .M2_SLAVE6ENABLE(M2_SLAVE6ENABLE),
                   .M2_SLAVE7ENABLE(M2_SLAVE7ENABLE),
                   .M2_SLAVE8ENABLE(M2_SLAVE8ENABLE),
                   .M2_SLAVE9ENABLE(M2_SLAVE9ENABLE),
                   .M2_SLAVE10ENABLE(M2_SLAVE10ENABLE),
                   .M2_SLAVE11ENABLE(M2_SLAVE11ENABLE),
                   .M2_SLAVE12ENABLE(M2_SLAVE12ENABLE),
                   .M2_SLAVE13ENABLE(M2_SLAVE13ENABLE),
                   .M2_SLAVE14ENABLE(M2_SLAVE14ENABLE),
                   .M2_SLAVE15ENABLE(M2_SLAVE15ENABLE),
                   .M2_SLAVE16ENABLE(M2_SLAVE16ENABLE),
                   
                   .M3_SLAVE0ENABLE(M3_SLAVE0ENABLE),
                   .M3_SLAVE1ENABLE(M3_SLAVE1ENABLE),
                   .M3_SLAVE2ENABLE(M3_SLAVE2ENABLE),
                   .M3_SLAVE3ENABLE(M3_SLAVE3ENABLE),
                   .M3_SLAVE4ENABLE(M3_SLAVE4ENABLE),
                   .M3_SLAVE5ENABLE(M3_SLAVE5ENABLE),
                   .M3_SLAVE6ENABLE(M3_SLAVE6ENABLE),
                   .M3_SLAVE7ENABLE(M3_SLAVE7ENABLE),
                   .M3_SLAVE8ENABLE(M3_SLAVE8ENABLE),
                   .M3_SLAVE9ENABLE(M3_SLAVE9ENABLE),
                   .M3_SLAVE10ENABLE(M3_SLAVE10ENABLE),
                   .M3_SLAVE11ENABLE(M3_SLAVE11ENABLE),
                   .M3_SLAVE12ENABLE(M3_SLAVE12ENABLE),
                   .M3_SLAVE13ENABLE(M3_SLAVE13ENABLE),
                   .M3_SLAVE14ENABLE(M3_SLAVE14ENABLE),
                   .M3_SLAVE15ENABLE(M3_SLAVE15ENABLE),
                   .M3_SLAVE16ENABLE(M3_SLAVE16ENABLE)

                   )
     inst_wrmatrix_4Mto1S_hgs_high (
                           // Global signals
                           .ACLK(ACLK),
                           .ARESETN(ARESETN),             
                            
                           .AWADDR_M0(AWADDR_M0),
                           .AWVALID_M0(AWVALID_M0),
                           .AWLOCK_M0(AWLOCK_M0),
                           .AWADDR_M1(AWADDR_M1),
                           .AWVALID_M1(AWVALID_M1),
                           .AWLOCK_M1(AWLOCK_M1),
                           .AWADDR_M2(AWADDR_M2),
                           .AWVALID_M2(AWVALID_M2),
                           .AWLOCK_M2(AWLOCK_M2),
                           .AWADDR_M3(AWADDR_M3),
                           .AWVALID_M3(AWVALID_M3),
                           .AWLOCK_M3(AWLOCK_M3),

                           .m0_wr_end(m0_wr_end),
                           .m1_wr_end(m1_wr_end),
                           .m2_wr_end(m2_wr_end),
                           .m3_wr_end(m3_wr_end),

                           // AXI MASTER write address channel signals
                           .AWREADY_SI(AWREADY_SI),
                           .BVALID_SI(BVALID_SI),
                           .BREADY_IS(BREADY_IS),
                         
                           // MASTER 0
                           // AXI MASTER write address channel signals
                           .AWID_MI0(AWID_MI0),
                           .AWADDR_MI0(AWADDR_MI0),
                           .AWLEN_MI0(AWLEN_MI0),
                           .AWSIZE_MI0(AWSIZE_MI0),
                           .AWBURST_MI0(AWBURST_MI0),
                           .AWLOCK_MI0(AWLOCK_MI0),
                           .AWCACHE_MI0(AWCACHE_MI0),
                           .AWPROT_MI0(AWPROT_MI0),
                           .AWVALID_MI0(AWVALID_MI0),
                           .AWREADY_IM0(AWREADY_IM0),
                                                   
                           // MASTER 1
                           // AXI MASTER write address channel signals
                           .AWID_MI1(AWID_MI1),
                           .AWADDR_MI1(AWADDR_MI1),
                           .AWLEN_MI1(AWLEN_MI1),
                           .AWSIZE_MI1(AWSIZE_MI1),
                           .AWBURST_MI1(AWBURST_MI1),
                           .AWLOCK_MI1(AWLOCK_MI1),
                           .AWCACHE_MI1(AWCACHE_MI1),
                           .AWPROT_MI1(AWPROT_MI1),
                           .AWVALID_MI1(AWVALID_MI1),
                           .AWREADY_IM1(AWREADY_IM1),
                           
                           // MASTER 2
                           // AXI MASTER write address channel signals
                           .AWID_MI2(AWID_MI2),
                           .AWADDR_MI2(AWADDR_MI2),
                           .AWLEN_MI2(AWLEN_MI2),
                           .AWSIZE_MI2(AWSIZE_MI2),
                           .AWBURST_MI2(AWBURST_MI2),
                           .AWLOCK_MI2(AWLOCK_MI2),
                           .AWCACHE_MI2(AWCACHE_MI2),
                           .AWPROT_MI2(AWPROT_MI2),
                           .AWVALID_MI2(AWVALID_MI2),
                           .AWREADY_IM2(AWREADY_IM2),
                           
                           // MASTER 3
                           // AXI MASTER write address channel signals
                           .AWID_MI3(AWID_MI3),
                           .AWADDR_MI3(AWADDR_MI3),
                           .AWLEN_MI3(AWLEN_MI3),
                           .AWSIZE_MI3(AWSIZE_MI3),
                           .AWBURST_MI3(AWBURST_MI3),
                           .AWLOCK_MI3(AWLOCK_MI3),
                           .AWCACHE_MI3(AWCACHE_MI3),
                           .AWPROT_MI3(AWPROT_MI3),
                           .AWVALID_MI3(AWVALID_MI3),
                           .AWREADY_IM3(AWREADY_IM3),
                           
                           // SLAVE 0
                           // AXI SLAVE 0 write address channel signals
                           .AWID_IS(AWID_IS),
                           .AWADDR_IS(AWADDR_IS),
                           .AWLEN_IS(AWLEN_IS),
                           .AWSIZE_IS(AWSIZE_IS),
                           .AWBURST_IS(AWBURST_IS),
                           .AWLOCK_IS(AWLOCK_IS),
                           .AWCACHE_IS(AWCACHE_IS),
                           .AWPROT_IS(AWPROT_IS),
                           .AWVALID_IS(AWVALID_IS),
                           .AWADDR_IS_int(AWADDR_IS_int),
                         
                           .MST_WRGNT_NUM(MST_WRGNT_NUM),
                           .SLAVE_SELECT_WADDRCH_M(gated_waddr),
                           .SLAVE_NUMBER(SLAVE_NUMBER),
                           .pending_wr0(pending_wr0),                       
                     .pending_wr1(pending_wr1),                       
                     .pending_wr2(pending_wr2),                       
                     .pending_wr3(pending_wr3),                       
                     .BVBR_M0_pulse (BVBR_M0_pulse),
                     .BVBR_M1_pulse (BVBR_M1_pulse),
                     .BVBR_M2_pulse (BVBR_M2_pulse),
                     .BVBR_M3_pulse (BVBR_M3_pulse),
                     .slave_out_en (slave_out_en) 
                           ,.wr_lock_high(wr_lock_high)  
                           ,.rd_lock_high(rd_lock_high)  
                           ,.wr_normal_high(wr_normal_high)  
                           ,.rd_normal_high(rd_normal_high)  
                           ,.mst_rd_inprog0(mst_rd_inprog0) 
                           ,.mst_rd_inprog1(mst_rd_inprog1) 
                           ,.mst_rd_inprog2(mst_rd_inprog2) 
                           ,.mst_rd_inprog3(mst_rd_inprog3) 
                           ,.mst_wr_inprog0(mst_wr_inprog0)                               
                           ,.mst_wr_inprog1(mst_wr_inprog1)                               
                           ,.mst_wr_inprog2(mst_wr_inprog2)                               
                           ,.mst_wr_inprog3(mst_wr_inprog3)                               
                           );

      end // if (MEMSPACE == 0 && ADDR_HGS_CFG == 1)      
   endgenerate
         

endmodule // axi_wa_channel




   /////////////////////////////////////////////////////////////////////////////
   //                               End - of - Code                           //
   /////////////////////////////////////////////////////////////////////////////
