// ****************************************************************************/
// Actel Corporation Proprietary and Confidential
// Copyright 2010 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: rd_channel.v
//              
//              Contains:
//                       - 
//                       - 
//
// Revision Information:
// Date            Description
// ----            -----------------------------------------
// 02Feb11         Inital. Ports and Parameters declaration
//
// SVN Revision Information:
// SVN $Revision: 25410 $
// SVN $Date: 2015-09-22 15:22:50 +0530 (Tue, 22 Sep 2015) $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
// 1. 
//
// ****************************************************************************/
`timescale 1ns/1ps

module axi_rd_channel (
                   // Global signals
                   ACLK,
                   ARESETN,                            
                      
//                   SLAVE_SELECT_WADDRCH_M,
                   // MASTER 0
                   // AXI MASTER write data channel signals
                   RID_IM,
                   RRESP_IM,
                   RVALID_IM,
                   RDATA_IM,
                   RLAST_IM,
                   RREADY_MI,
                      
                   // SLAVE 0
                   RID_SI0,
                   RVALID_SI0,
                   RRESP_SI0,
                   RDATA_SI0,
                   RLAST_SI0,
                   
                   // SLAVE 1
                   RID_SI1,
                   RVALID_SI1,
                   RRESP_SI1,
                   RDATA_SI1,
                   RLAST_SI1,
                   
                   // SLAVE 2
                   RID_SI2,
                   RVALID_SI2,
                   RRESP_SI2,
                   RDATA_SI2,
                   RLAST_SI2,
                   

                   // SLAVE 3
                   RID_SI3,
                   RVALID_SI3,
                   RRESP_SI3,
                   RDATA_SI3,
                   RLAST_SI3,
                   
                   // SLAVE 4
                   RID_SI4,
                   RVALID_SI4,
                   RRESP_SI4,
                   RDATA_SI4,
                   RLAST_SI4,
                   
                   // SLAVE 5
                   RID_SI5,
                   RVALID_SI5,
                   RRESP_SI5,
                   RDATA_SI5,
                   RLAST_SI5,
                   
                   // SLAVE 6
                   RID_SI6,
                   RVALID_SI6,
                   RRESP_SI6,
                   RDATA_SI6,
                   RLAST_SI6,
                   
                   // SLAVE 7
                   RID_SI7,
                   RVALID_SI7,
                   RRESP_SI7,
                   RDATA_SI7,
                   RLAST_SI7,
                   
                   // SLAVE 8
                   RID_SI8,
                   RVALID_SI8,
                   RRESP_SI8,
                   RDATA_SI8,
                   RLAST_SI8,
                   
                   // SLAVE 9
                   RID_SI9,
                   RVALID_SI9,
                   RRESP_SI9,
                   RDATA_SI9,
                   RLAST_SI9,
                   
                   // SLAVE 10
                   RID_SI10,
                   RVALID_SI10,
                   RRESP_SI10,
                   RDATA_SI10,
                   RLAST_SI10,
                   
                   // SLAVE 11
                   RID_SI11,
                   RVALID_SI11,
                   RRESP_SI11,
                   RDATA_SI11,
                   RLAST_SI11,
                   
                   // SLAVE 12
                   RID_SI12,
                   RVALID_SI12,
                   RRESP_SI12,
                   RDATA_SI12,
                   RLAST_SI12,
                   
                   // SLAVE 13
                   RID_SI13,
                   RVALID_SI13,
                   RRESP_SI13,
                   RDATA_SI13,
                   RLAST_SI13,
                   
                   // SLAVE 14
                   RID_SI14,
                   RVALID_SI14,
                   RRESP_SI14,
                   RDATA_SI14,
                   RLAST_SI14,
                   
                   // SLAVE 15
                   RID_SI15,
                   RVALID_SI15,
                   RRESP_SI15,
                   RDATA_SI15,
                   RLAST_SI15,
                   
                   // SLAVE 16
                   RID_SI16,
                   RVALID_SI16,
                   RRESP_SI16,
                   RDATA_SI16,
                   RLAST_SI16,

                   // From Master
                   RREADY_IS0,
                   RREADY_IS1,
                   RREADY_IS2,
                   RREADY_IS3,
                   RREADY_IS4,
                   RREADY_IS5,
                   RREADY_IS6,
                   RREADY_IS7,
                   RREADY_IS8,
                   RREADY_IS9,
                   RREADY_IS10,
                   RREADY_IS11,
                   RREADY_IS12,
                   RREADY_IS13,
                   RREADY_IS14,
                   RREADY_IS15,
                   RREADY_IS16

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
   parameter UID_WIDTH            = 2'b00;
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

//   input [16:0] SLAVE_SELECT_WADDRCH_M;   

   // From Master 0
   // AXI write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_IM;
   output [1:0]                          RRESP_IM;
   output                                RVALID_IM;
   output [AXI_DWIDTH-1:0]               RDATA_IM;
   output                                RLAST_IM;
   input                                 RREADY_MI;   

   // SLAVE 0
   // AXI SLAVE 0 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  RID_SI0;
   input [1:0]                           RRESP_SI0;
   input                                 RVALID_SI0;
   input [AXI_DWIDTH-1:0]                RDATA_SI0;
   input                                 RLAST_SI0;
   output                                RREADY_IS0;   
   
   // SLAVE 1
   // AXI SLAVE 1 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  RID_SI1;
   input [1:0]                           RRESP_SI1;
   input                                 RVALID_SI1;
   input [AXI_DWIDTH-1:0]                RDATA_SI1;
   input                                 RLAST_SI1;
   output                                RREADY_IS1;   
   
   // SLAVE 2
   // AXI SLAVE 2 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  RID_SI2;
   input [1:0]                           RRESP_SI2;
   input                                 RVALID_SI2;
   input [AXI_DWIDTH-1:0]                RDATA_SI2;
   input                                 RLAST_SI2;
   output                                RREADY_IS2;   

   // SLAVE 3
   // AXI SLAVE 3 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  RID_SI3;
   input [1:0]                           RRESP_SI3;
   input                                 RVALID_SI3;
   input [AXI_DWIDTH-1:0]                RDATA_SI3;
   input                                 RLAST_SI3;
   output                                RREADY_IS3;   

   // SLAVE 4
   // AXI SLAVE 4 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  RID_SI4;
   input [1:0]                           RRESP_SI4;
   input                                 RVALID_SI4;
   input [AXI_DWIDTH-1:0]                RDATA_SI4;
   input                                 RLAST_SI4;
   output                                RREADY_IS4;   

   // SLAVE 5
   // AXI SLAVE 5 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  RID_SI5;
   input [1:0]                           RRESP_SI5;
   input                                 RVALID_SI5;
   input [AXI_DWIDTH-1:0]                RDATA_SI5;
   input                                 RLAST_SI5;
   output                                RREADY_IS5;   

   // SLAVE 6
   // AXI SLAVE 6 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  RID_SI6;
   input [1:0]                           RRESP_SI6;
   input                                 RVALID_SI6;
   input [AXI_DWIDTH-1:0]                RDATA_SI6;
   input                                 RLAST_SI6;
   output                                RREADY_IS6;   

   // SLAVE 7
   // AXI SLAVE 7 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  RID_SI7;
   input [1:0]                           RRESP_SI7;
   input                                 RVALID_SI7;
   input [AXI_DWIDTH-1:0]                RDATA_SI7;
   input                                 RLAST_SI7;
   output                                RREADY_IS7;   

   // SLAVE 8
   // AXI SLAVE 8 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  RID_SI8;
   input [1:0]                           RRESP_SI8;
   input                                 RVALID_SI8;
   input [AXI_DWIDTH-1:0]                RDATA_SI8;
   input                                 RLAST_SI8;
   output                                RREADY_IS8;   

   // SLAVE 9
   // AXI SLAVE 9 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  RID_SI9;
   input [1:0]                           RRESP_SI9;
   input                                 RVALID_SI9;
   input [AXI_DWIDTH-1:0]                RDATA_SI9;
   input                                 RLAST_SI9;
   output                                RREADY_IS9;   

   // SLAVE 10
   // AXI SLAVE 10 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  RID_SI10;
   input [1:0]                           RRESP_SI10;
   input                                 RVALID_SI10;
   input [AXI_DWIDTH-1:0]                RDATA_SI10;
   input                                 RLAST_SI10;
   output                                RREADY_IS10;   

   // SLAVE 11
   // AXI SLAVE 11 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  RID_SI11;
   input [1:0]                           RRESP_SI11;
   input                                 RVALID_SI11;
   input [AXI_DWIDTH-1:0]                RDATA_SI11;
   input                                 RLAST_SI11;
   output                                RREADY_IS11;   

   // SLAVE 12
   // AXI SLAVE 12 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  RID_SI12;
   input [1:0]                           RRESP_SI12;
   input                                 RVALID_SI12;
   input [AXI_DWIDTH-1:0]                RDATA_SI12;
   input                                 RLAST_SI12;
   output                                RREADY_IS12;   

   // SLAVE 13
   // AXI SLAVE 13 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  RID_SI13;
   input [1:0]                           RRESP_SI13;
   input                                 RVALID_SI13;
   input [AXI_DWIDTH-1:0]                RDATA_SI13;
   input                                 RLAST_SI13;
   output                                RREADY_IS13;   

   // SLAVE 14
   // AXI SLAVE 14 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  RID_SI14;
   input [1:0]                           RRESP_SI14;
   input                                 RVALID_SI14;
   input [AXI_DWIDTH-1:0]                RDATA_SI14;
   input                                 RLAST_SI14;
   output                                RREADY_IS14;   

   // SLAVE 15
   // AXI SLAVE 15 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  RID_SI15;
   input [1:0]                           RRESP_SI15;
   input                                 RVALID_SI15;
   input [AXI_DWIDTH-1:0]                RDATA_SI15;
   input                                 RLAST_SI15;
   output                                RREADY_IS15;   

   // SLAVE 16
   // AXI SLAVE 16 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  RID_SI16;
   input [1:0]                           RRESP_SI16;
   input                                 RVALID_SI16;
   input [AXI_DWIDTH-1:0]                RDATA_SI16;
   input                                 RLAST_SI16;
   output                                RREADY_IS16;   
   
   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_IM;
   wire [1:0]                          RRESP_IM;
   wire                                RVALID_IM;
   wire [AXI_DWIDTH-1:0]               RDATA_IM;
   wire                                RLAST_IM;

   wire                                RREADY_IS0;
   wire                                RREADY_IS1;
   wire                                RREADY_IS2;
   wire                                RREADY_IS3;
   wire                                RREADY_IS4;
   wire                                RREADY_IS5;
   wire                                RREADY_IS6;
   wire                                RREADY_IS7;
   wire                                RREADY_IS8;
   wire                                RREADY_IS9;
   wire                                RREADY_IS10;
   wire                                RREADY_IS11;
   wire                                RREADY_IS12;
   wire                                RREADY_IS13;
   wire                                RREADY_IS14;
   wire                                RREADY_IS15;
   wire                                RREADY_IS16;
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


   // Instance
   axi_rdmatrix_16Sto1M #(
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
                      .UID_WIDTH(UID_WIDTH),
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
     inst_rdmatrix_16Sto1M (
                         
                            // Global signals
                            .ACLK(ACLK),
                            .ARESETN(ARESETN),                            

                            // MASTER 0
                            // AXI MASTER write data channel signals
                            .RID_IM(RID_IM),
                            .RRESP_IM(RRESP_IM),
                            .RVALID_IM(RVALID_IM),
                            .RDATA_IM(RDATA_IM),
                            .RLAST_IM(RLAST_IM),
                            .RREADY_MI(RREADY_MI),
                            
                            // SLAVE 0
                            .RID_SI0(RID_SI0),
                            .RVALID_SI0(RVALID_SI0),
                            .RRESP_SI0(RRESP_SI0),
                            .RDATA_SI0(RDATA_SI0),
                            .RLAST_SI0(RLAST_SI0),
                            
                            // SLAVE 1
                            .RID_SI1(RID_SI1),
                            .RVALID_SI1(RVALID_SI1),
                            .RRESP_SI1(RRESP_SI1),
                            .RDATA_SI1(RDATA_SI1),
                            .RLAST_SI1(RLAST_SI1),
                            
                            // SLAVE 2
                            .RID_SI2(RID_SI2),
                            .RVALID_SI2(RVALID_SI2),
                            .RRESP_SI2(RRESP_SI2),
                            .RDATA_SI2(RDATA_SI2),
                            .RLAST_SI2(RLAST_SI2),
                         
                         
                            // SLAVE 3
                            .RID_SI3(RID_SI3),
                            .RVALID_SI3(RVALID_SI3),
                            .RRESP_SI3(RRESP_SI3),
                            .RDATA_SI3(RDATA_SI3),
                            .RLAST_SI3(RLAST_SI3),
                            
                            // SLAVE 4
                            .RID_SI4(RID_SI4),
                            .RVALID_SI4(RVALID_SI4),
                            .RRESP_SI4(RRESP_SI4),
                            .RDATA_SI4(RDATA_SI4),
                            .RLAST_SI4(RLAST_SI4),
                            
                            // SLAVE 5
                            .RID_SI5(RID_SI5),
                            .RVALID_SI5(RVALID_SI5),
                            .RRESP_SI5(RRESP_SI5),
                            .RDATA_SI5(RDATA_SI5),
                            .RLAST_SI5(RLAST_SI5),
                         
                            // SLAVE 6
                            .RID_SI6(RID_SI6),
                            .RVALID_SI6(RVALID_SI6),
                            .RRESP_SI6(RRESP_SI6),
                            .RDATA_SI6(RDATA_SI6),
                            .RLAST_SI6(RLAST_SI6),
                            
                            // SLAVE 7
                            .RID_SI7(RID_SI7),
                            .RVALID_SI7(RVALID_SI7),
                            .RRESP_SI7(RRESP_SI7),
                            .RDATA_SI7(RDATA_SI7),
                            .RLAST_SI7(RLAST_SI7),
                            
                            // SLAVE 8
                            .RID_SI8(RID_SI8),
                            .RVALID_SI8(RVALID_SI8),
                            .RRESP_SI8(RRESP_SI8),
                            .RDATA_SI8(RDATA_SI8),
                            .RLAST_SI8(RLAST_SI8),
                         
                            // SLAVE 9
                            .RID_SI9(RID_SI9),
                            .RVALID_SI9(RVALID_SI9),
                            .RRESP_SI9(RRESP_SI9),
                            .RDATA_SI9(RDATA_SI9),
                            .RLAST_SI9(RLAST_SI9),
                            
                            // SLAVE 10
                            .RID_SI10(RID_SI10),
                            .RVALID_SI10(RVALID_SI10),
                            .RRESP_SI10(RRESP_SI10),
                            .RDATA_SI10(RDATA_SI10),
                            .RLAST_SI10(RLAST_SI10),
                            
                            // SLAVE 11
                            .RID_SI11(RID_SI11),
                            .RVALID_SI11(RVALID_SI11),
                            .RRESP_SI11(RRESP_SI11),
                            .RDATA_SI11(RDATA_SI11),
                            .RLAST_SI11(RLAST_SI11),
                         
                            // SLAVE 12
                            .RID_SI12(RID_SI12),
                            .RVALID_SI12(RVALID_SI12),
                            .RRESP_SI12(RRESP_SI12),
                            .RDATA_SI12(RDATA_SI12),
                            .RLAST_SI12(RLAST_SI12),
                            
                            // SLAVE 13
                            .RID_SI13(RID_SI13),
                            .RVALID_SI13(RVALID_SI13),
                            .RRESP_SI13(RRESP_SI13),
                            .RDATA_SI13(RDATA_SI13),
                            .RLAST_SI13(RLAST_SI13),
                            
                            // SLAVE 14
                            .RID_SI14(RID_SI14),
                            .RVALID_SI14(RVALID_SI14),
                            .RRESP_SI14(RRESP_SI14),
                            .RDATA_SI14(RDATA_SI14),
                            .RLAST_SI14(RLAST_SI14),
                         
                            // SLAVE 15
                            .RID_SI15(RID_SI15),
                            .RVALID_SI15(RVALID_SI15),
                            .RRESP_SI15(RRESP_SI15),
                            .RDATA_SI15(RDATA_SI15),
                            .RLAST_SI15(RLAST_SI15),
                            
                            // SLAVE 16
                            .RID_SI16(RID_SI16),
                            .RVALID_SI16(RVALID_SI16),
                            .RRESP_SI16(RRESP_SI16),
                            .RDATA_SI16(RDATA_SI16),
                            .RLAST_SI16(RLAST_SI16),
                            
                            // From Master
                            .RREADY_IS0(RREADY_IS0),
                            .RREADY_IS1(RREADY_IS1),
                            .RREADY_IS2(RREADY_IS2),
                            .RREADY_IS3(RREADY_IS3),
                            .RREADY_IS4(RREADY_IS4),
                            .RREADY_IS5(RREADY_IS5),
                            .RREADY_IS6(RREADY_IS6),
                            .RREADY_IS7(RREADY_IS7),
                            .RREADY_IS8(RREADY_IS8),
                            .RREADY_IS9(RREADY_IS9),
                            .RREADY_IS10(RREADY_IS10),
                            .RREADY_IS11(RREADY_IS11),
                            .RREADY_IS12(RREADY_IS12),
                            .RREADY_IS13(RREADY_IS13),
                            .RREADY_IS14(RREADY_IS14),
                            .RREADY_IS15(RREADY_IS15),
                            .RREADY_IS16(RREADY_IS16)                            

                            );

endmodule // rd_channel

                            
                            


   /////////////////////////////////////////////////////////////////////////////
   //                               End - of - Code                           //
   /////////////////////////////////////////////////////////////////////////////

