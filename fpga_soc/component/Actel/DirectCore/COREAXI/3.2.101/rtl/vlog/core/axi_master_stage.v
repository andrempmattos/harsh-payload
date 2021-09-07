// ****************************************************************************/
// Actel Corporation Proprietary and Confidential
// Copyright 2010 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: master_stage - Module defines interface with Master 
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
module axi_master_stage (
                     // Global signals
                     ACLK,
                     ARESETN,

                     // MASTER 0
                     // AXI MASTER 0 write address channel signals
                     AWID_M,
                     AWADDR_M,
                     AWLEN_M,
                     AWSIZE_M,
                     AWBURST_M,
                     AWLOCK_M,
                     AWCACHE_M,
                     AWPROT_M,
                     AWVALID_M,
                     AWREADY_M,
                     // AXI MASTER 0 write data channel signals
                     WID_M,
                     WDATA_M,
                     WSTRB_M,
                     WLAST_M,
                     WVALID_M,
                     WREADY_M,
                     // AXI MASTER 0 write response channel signals
                     BID_M,
                     BRESP_M,
                     BVALID_M,
                     BREADY_M,
                     // AXI MASTER 0 read address channel signals
                     ARID_M,
                     ARADDR_M,
                     ARLEN_M,
                     ARSIZE_M,
                     ARBURST_M,
                     ARLOCK_M,
                     ARCACHE_M,
                     ARPROT_M,
                     ARVALID_M,
                     ARREADY_M,
                     // AXI MASTER 0 read response channel signals
                     RID_M,
                     RDATA_M,
                     RRESP_M,
                     RLAST_M,
                     RVALID_M,
                     RREADY_M,
                     
                     // To interconnect
                     // SLAVE 0
                     // AXI SLAVE 0 write address channel signals
                     AWID_MI,
                     AWADDR_MI,
                     AWLEN_MI,
                     AWSIZE_MI,
                     AWBURST_MI,
                     AWLOCK_MI,
                     AWCACHE_MI,
                     AWPROT_MI,
                     AWVALID_MI,
                     AWREADY_IM,
                     // AXI SLAVE 0 write data channel signals
                     WID_MI,
                     WDATA_MI,
                     WSTRB_MI,
                     WLAST_MI,
                     WVALID_MI,
                     WREADY_IM,
                     // AXI SLAVE 0 write response channel signals
                     BID_IM,
                     BRESP_IM,
                     BVALID_IM,
                     BREADY_MI,
                     // AXI SLAVE 0 read address channel signals
                     ARID_MI,
                     ARADDR_MI,
                     ARLEN_MI,
                     ARSIZE_MI,
                     ARBURST_MI,
                     ARLOCK_MI,
                     ARCACHE_MI,
                     ARPROT_MI,
                     ARVALID_MI,
                     ARREADY_IM,
                     // AXI SLAVE 0 read response channel signals
                     RID_IM,
                     RDATA_IM,
                     RRESP_IM,
                     RLAST_IM,
                     RVALID_IM,
                     RREADY_MI,
                     
                     // To arbiter
                     master_rd_end,
                     master_wr_end,
                     mst_rd_inprog,  
                     mst_wr_inprog                                 

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
   parameter BASE_ID_WIDTH        = 2;
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

   localparam  COMB_REG = {SC_0, SC_1, SC_2, SC_3, SC_4, SC_5, SC_6, SC_7, SC_8, SC_9, SC_10, SC_11, SC_12, SC_13, SC_14, SC_15};
   

   // --------------------------------------------------------------------------
   // I/O Declaration
   // --------------------------------------------------------------------------
   // Global signals
   input      ACLK;
   input      ARESETN;

   // MASTER 0
   // AXI MASTER 0 write address channel signals
   input [ID_WIDTH-1:0]          AWID_M;
   input [31:0]        AWADDR_M;
   input [3:0]                   AWLEN_M;
   input [2:0]                   AWSIZE_M;
   input [1:0]                   AWBURST_M;
   input [1:0]                   AWLOCK_M;
   input [3:0]                   AWCACHE_M;
   input [2:0]                   AWPROT_M;
   input                         AWVALID_M;
   output                        AWREADY_M;
   // AXI MASTER 0 write data channel signals
   input [ID_WIDTH-1:0]          WID_M;
   input [AXI_DWIDTH-1:0]        WDATA_M;
   input [AXI_STRBWIDTH-1:0]     WSTRB_M;
   input                         WLAST_M;
   input                         WVALID_M;
   output                        WREADY_M;
   // AXI MASTER 0 write response channel signals
   output [ID_WIDTH-1:0]         BID_M;
   output [1:0]                  BRESP_M;
   output                        BVALID_M;
   input                         BREADY_M;
   // AXI MASTER 0 read address channel signals
   input [ID_WIDTH-1:0]          ARID_M;
   input [31:0]        ARADDR_M;
   input [3:0]                   ARLEN_M;
   input [2:0]                   ARSIZE_M;
   input [1:0]                   ARBURST_M;
   input [1:0]                   ARLOCK_M;
   input [3:0]                   ARCACHE_M;
   input [2:0]                   ARPROT_M;
   input                         ARVALID_M;
   output                        ARREADY_M;
   // AXI MASTER 0 read response channel signals
   output [ID_WIDTH-1:0]         RID_M;
   output [AXI_DWIDTH-1:0]       RDATA_M;
   output [1:0]                  RRESP_M;
   output                        RLAST_M;
   output                        RVALID_M;
   input                         RREADY_M;

   // SLAVE 0
   // AXI SLAVE 0 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_MI;
   output [31:0]      AWADDR_MI;
   output [3:0]                 AWLEN_MI;
   output [2:0]                 AWSIZE_MI;
   output [1:0]                 AWBURST_MI;
   output [1:0]                 AWLOCK_MI;
   output [3:0]                 AWCACHE_MI;
   output [2:0]                 AWPROT_MI;
   output                       AWVALID_MI;
   input                        AWREADY_IM;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH + ID_WIDTH - 1:0] WID_MI;
   output [AXI_DWIDTH-1:0]      WDATA_MI;
   output [AXI_STRBWIDTH-1:0]   WSTRB_MI;
   output                       WLAST_MI;
   output                       WVALID_MI;
   input                        WREADY_IM;
   // AXI SLAVE 0 write response channel signals
   input [BASE_ID_WIDTH + ID_WIDTH - 1:0] BID_IM;
   input  [1:0]                 BRESP_IM;
   input                        BVALID_IM;
   output                       BREADY_MI;
   // AXI SLAVE 0 read address channel signals
   output [(BASE_ID_WIDTH+ID_WIDTH)-1:0] ARID_MI;
   output [31:0]      ARADDR_MI;
   output [3:0]                 ARLEN_MI;
   output [2:0]                 ARSIZE_MI;
   output [1:0]                 ARBURST_MI;
   output [1:0]                 ARLOCK_MI;
   output [3:0]                 ARCACHE_MI;
   output [2:0]                 ARPROT_MI;
   output                       ARVALID_MI;
   input                        ARREADY_IM;
   // AXI SLAVE 0 read response channel signals
   input [(BASE_ID_WIDTH+ID_WIDTH)-1:0] RID_IM;
   input  [AXI_DWIDTH-1:0]      RDATA_IM;
   input  [1:0]                 RRESP_IM;
   input                        RLAST_IM;
   input                        RVALID_IM;
   output                       RREADY_MI;

   output                       master_wr_end;
   output                       master_rd_end;

   output                       mst_rd_inprog;  // v3.2.12 - for lock xfers
   output                       mst_wr_inprog;                                 

   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_MI;
   reg [31:0]      AWADDR_MI;
   reg [3:0]                 AWLEN_MI;
   reg [2:0]                 AWSIZE_MI;
   reg [1:0]                 AWBURST_MI;
   reg [1:0]                 AWLOCK_MI;
   reg [3:0]                 AWCACHE_MI;
   reg [2:0]                 AWPROT_MI;
   reg                       AWVALID_MI;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_MI;
   reg [31:0]      ARADDR_MI;
   reg [3:0]                 ARLEN_MI;
   reg [2:0]                 ARSIZE_MI;
   reg [1:0]                 ARBURST_MI;
   reg [1:0]                 ARLOCK_MI;
   reg [3:0]                 ARCACHE_MI;
   reg [2:0]                 ARPROT_MI;
   reg                       ARVALID_MI;

//   wire                      RREADY_MI;
   reg                       RREADY_MI;
   wire                      BREADY_MI;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_MI;
   reg [AXI_DWIDTH-1:0]      WDATA_MI;
   reg                       WVALID_MI;
   reg                       WLAST_MI;
   reg [AXI_STRBWIDTH-1:0]   WSTRB_MI;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_M_FF1;
   reg [31:0]      AWADDR_M_FF1;
   reg [3:0]                 AWLEN_M_FF1;
   reg [2:0]                 AWSIZE_M_FF1;
   reg [1:0]                 AWBURST_M_FF1;
   reg [1:0]                 AWLOCK_M_FF1;
   reg [3:0]                 AWCACHE_M_FF1;
   reg [2:0]                 AWPROT_M_FF1;
   reg                       AWVALID_M_FF1;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_M_FF1;
   reg [31:0]      ARADDR_M_FF1;
   reg [3:0]                 ARLEN_M_FF1;
   reg [2:0]                 ARSIZE_M_FF1;
   reg [1:0]                 ARBURST_M_FF1;
   reg [1:0]                 ARLOCK_M_FF1;
   reg [3:0]                 ARCACHE_M_FF1;
   reg [2:0]                 ARPROT_M_FF1;
   reg                       ARVALID_M_FF1;
   reg                       RREADY_M_FF1;
   reg                       BREADY_M_FF1;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_M_FF1;
   reg [AXI_DWIDTH-1:0]      WDATA_M_FF1;
   reg                       WVALID_M_FF1;
   reg                       WLAST_M_FF1;
   reg [AXI_STRBWIDTH-1:0]   WSTRB_M_FF1;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_M_INPFF1;
   reg [31:0]      AWADDR_M_INPFF1;
   reg [3:0]                 AWLEN_M_INPFF1;
   reg [2:0]                 AWSIZE_M_INPFF1;
   reg [1:0]                 AWBURST_M_INPFF1;
   reg [1:0]                 AWLOCK_M_INPFF1;
   reg [3:0]                 AWCACHE_M_INPFF1;
   reg [2:0]                 AWPROT_M_INPFF1;
   reg                       AWVALID_M_INPFF1;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_M_INPFF1;
   reg [31:0]      ARADDR_M_INPFF1;
   reg [3:0]                 ARLEN_M_INPFF1;
   reg [2:0]                 ARSIZE_M_INPFF1;
   reg [1:0]                 ARBURST_M_INPFF1;
   reg [1:0]                 ARLOCK_M_INPFF1;
   reg [3:0]                 ARCACHE_M_INPFF1;
   reg [2:0]                 ARPROT_M_INPFF1;
   reg                       ARVALID_M_INPFF1;
   reg                       RREADY_M_INPFF1;
   reg                       BREADY_M_INPFF1;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_M_INPFF1;
   reg [AXI_DWIDTH-1:0]      WDATA_M_INPFF1;
   reg                       WVALID_M_INPFF1;
   reg                       WLAST_M_INPFF1;
   reg [AXI_STRBWIDTH-1:0]   WSTRB_M_INPFF1;


   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_M_pulse;
   reg [31:0]      AWADDR_M_pulse;
   reg [3:0]                 AWLEN_M_pulse;
   reg [2:0]                 AWSIZE_M_pulse;
   reg [1:0]                 AWBURST_M_pulse;
   reg [1:0]                 AWLOCK_M_pulse;
   reg [3:0]                 AWCACHE_M_pulse;
   reg [2:0]                 AWPROT_M_pulse;
   reg                       AWVALID_M_pulse;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_M_pulse;
   reg [31:0]      ARADDR_M_pulse;
   reg [3:0]                 ARLEN_M_pulse;
   reg [2:0]                 ARSIZE_M_pulse;
   reg [1:0]                 ARBURST_M_pulse;
   reg [1:0]                 ARLOCK_M_pulse;
   reg [3:0]                 ARCACHE_M_pulse;
   reg [2:0]                 ARPROT_M_pulse;
   reg                       ARVALID_M_pulse;

   wire                       RREADY_M_pulse;
   wire                       BREADY_M_pulse;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_M_pulse;
   reg [AXI_DWIDTH-1:0]      WDATA_M_pulse;
   reg                       WVALID_M_pulse;
   reg                       WLAST_M_pulse;
   reg [AXI_STRBWIDTH-1:0]   WSTRB_M_pulse;

   reg [BASE_ID_WIDTH+ID_WIDTH-1:0] RID_M_FF1;
   reg [AXI_DWIDTH-1:0]      RDATA_M_FF1;
   reg [1:0]                 RRESP_M_FF1;
   reg                       RLAST_M_FF1;
   reg                       RVALID_M_FF1;
   reg [BASE_ID_WIDTH+ID_WIDTH-1:0]        RID_M_INPFF1;
   reg [AXI_DWIDTH-1:0]      RDATA_M_INPFF1;
   reg [1:0]                 RRESP_M_INPFF1;
   reg                       RLAST_M_INPFF1;
   reg                       RVALID_M_INPFF1;

   reg [BASE_ID_WIDTH+ID_WIDTH-1:0]        RID_M_pulse;
   reg [AXI_DWIDTH-1:0]      RDATA_M_pulse;
   reg [1:0]                 RRESP_M_pulse;
   reg                       RLAST_M_pulse;
   reg                       RVALID_M_pulse;
   reg                       RVALID_M_pulse_r;
   
   reg [BASE_ID_WIDTH+ID_WIDTH-1:0]        BID_M_FF1;
   reg [1:0]                 BRESP_M_FF1;
   reg                       BVALID_M_FF1;
   reg [BASE_ID_WIDTH+ID_WIDTH-1:0]        BID_M_INPFF1;
   reg [1:0]                 BRESP_M_INPFF1;
   reg                       BVALID_M_INPFF1;

   reg [BASE_ID_WIDTH+ID_WIDTH-1:0] BID_M_pulse;
   reg [1:0]                        BRESP_M_pulse;
   reg                              BVALID_M_pulse;

   // AXI MASTER 0 write response channel signals
   reg [ID_WIDTH-1:0]         BID_M;
   reg [1:0]                  BRESP_M;
   reg                        BVALID_M;

   reg [ID_WIDTH-1:0]         BID_M_r;
   reg [1:0]                  BRESP_M_r;
   reg                        BVALID_M_r;
   // AXI MASTER 0 read response channel signals
   reg [ID_WIDTH-1:0]         RID_M;
   reg [AXI_DWIDTH-1:0]       RDATA_M;
   reg [1:0]                  RRESP_M;
   reg                        RLAST_M;
   reg                        RVALID_M;

   reg                        ARREADY_M;
   reg                        AWREADY_M;
   reg                        WREADY_M;

   wire                       master_wr_end;
   wire                       master_rd_end;

   wire [(BASE_ID_WIDTH+ID_WIDTH)-1:0] AWID_int;
   wire [(BASE_ID_WIDTH+ID_WIDTH)-1:0] WID_int;
   wire [(BASE_ID_WIDTH+ID_WIDTH)-1:0] ARID_int;

   integer                             k;
   integer                             p;

   reg [16:0]                          SLAVE_SELECT_WRITE_M;
   reg [16:0]                          SLAVE_SELECT_READ_M;

   reg                                 mst_wr_end;
   reg                                 mst_rd_end;

   reg                                 WREADY_IM_r;
   reg                                 WLAST_M_r;
   reg                                 AWVALID_M_r;
   reg                                 ARVALID_M_r;   

   reg                                 next_valid_sample;
   reg                                 next_valid_sample_r;   

   reg                                 next_rvalid_sample;
   reg                                 next_rvalid_sample_r;   
   reg                                 RLAST_IM_r;

   wire                                gated_WREADY_M;
   wire                                gated_AWVALID_M_flag;   
   reg                                 WREADY_M_int;
   
   reg                                 RVALID_IM_r;
   reg                                 BVALID_IM_r;
   reg                                 BVALID_IM_r1;
   reg                                 RREADY_M_r;
   reg                                 RVALID_M_r;
                       
   reg                                 gatedWA_Rdy;
   
   reg [3:0]                           rd_rdcntr;
   reg [3:0]                           rd_wdcntr;     
   reg                                 rd_wen_flag;
   reg                                 rd_ren_flag;
   wire                                ARREADY_M_int;
   reg                                 ARREADY_M_int1;
   
   wire [3:0]                          rd_acceptance_limit;  
   reg                                 WVALID_MI_r1;
   reg                                 WVALID_MI_r2;
   
   reg [31:0]                          prev_ARADDR;
   reg [ID_WIDTH-1:0]                  prev_ARID;
   reg                                 rdtrans_inprog;                                 
   reg                                 stall_trans;
   reg                                 stall_trans_rd;
   
   reg [(BASE_ID_WIDTH+ID_WIDTH)-1:0] RID_M_int;
   reg  [AXI_DWIDTH-1:0]      RDATA_M_int;
   reg  [1:0]                 RRESP_M_int;
   reg                        RLAST_M_int;
   reg                        RVALID_M_int;

   reg                        AWREADY_M_r;
   reg                        ARREADY_M_r;
   reg                        WREADY_M_r;
   
   reg                        rdtrans_inprog_r;
   reg                        add_rdtran;

   reg [WR_ACCEPTANCE*2 - 1:0]  AWID_msb_lat;  
   reg [1:0]                  ARID_msb_lat;
   integer                    ID_cnt;
   
   wire                       aresetn;
   wire                       sresetn;

   wire [3:0]                 wr_acceptance_limit;  
   reg                        wrtrans_inprog;                                 
   reg                        wrtrans_inprog_r;                                 
   reg                        stall_trans1;
   reg                        stall_trans_wr;
   reg                        wr_wen_flag;
   reg                        wr_ren_flag;
   reg [31:0]                 prev_AWADDR;
   reg [ID_WIDTH-1:0]         prev_AWID;
   reg                        add_wrtran;
   reg [3:0]                  wr_rdcntr;
   reg [3:0]                  wr_wdcntr;     
   wire                       AWREADY_M_int;
   reg                        bvalid_bready_r;

   reg                        mst_rd_inprog;                                 
   reg                        mst_wr_inprog;                                 

   /////////////////////////////////////////////////////////////////////////////
   //                               Start - of - Code                         //
   /////////////////////////////////////////////////////////////////////////////

   // --------------------------------------------------------------------------
   // resets
   // --------------------------------------------------------------------------
   assign aresetn   = (SYNC_RESET == 1) ? 1'b1  : ARESETN;
   assign sresetn   = (SYNC_RESET == 1) ? ARESETN : 1'b1;

   // ##########################################################################
   //-------------------------------------------------------------
   // mst_wr_end: Generate signal to indicate to the write address
   // arbiter to terminate the grant for the current master
   // The grant to the master is terminated when the write response
   // is received.
   //-------------------------------------------------------------
   always @ (posedge ACLK or negedge aresetn) begin
      if ((!aresetn) || (!sresetn)) begin
         mst_wr_end <= 1'b0;
      end 
      else begin
         mst_wr_end <= BVALID_M & BREADY_M;
      end
   end
   always @ (posedge ACLK or negedge aresetn) begin
      if ((!aresetn) || (!sresetn)) begin
         bvalid_bready_r <= 1'b0;
      end 
      else begin
         bvalid_bready_r <= BVALID_M & BREADY_M;
      end
   end

   //-------------------------------------------------------------
   // mst_rd_end: Generate signal to indicate to the read address
   // arbiter to terminate the grant for the current master
   // The grant to the master is terminated when the last read
   // data is received.
   //-------------------------------------------------------------
   always @ (posedge ACLK or negedge aresetn) begin
      if ((!aresetn) || (!sresetn)) begin
         mst_rd_end <= 1'b0;
      end 
      else begin
         mst_rd_end <= RLAST_M & RVALID_M & RREADY_M;
      end
   end

   // ##########################################################################
   // --------------------------------------------------------------------------
   // SLAVE_SELECT_READ_M: Select Slave slot for Read
   // This is used to generate the read request to the arbiter in the slave side
   // --------------------------------------------------------------------------
   generate     // Added to address huge slave issue
      if(MEMSPACE == 0 && ADDR_HGS_CFG == 0) begin

   always @ (*) begin
      if(ARADDR_MI[31] == 1'b0) begin
         SLAVE_SELECT_READ_M = SLAVE_N;
      end      
      else begin
      case ({ARVALID_MI,ARADDR_MI[AXI_AWIDTH - 1:AXI_AWIDTH-4]})

        5'h10, 5'h18 : begin
           SLAVE_SELECT_READ_M = SLAVE_8;
        end

        5'h11, 5'h19 : begin
           SLAVE_SELECT_READ_M = SLAVE_9;
        end

        5'h12, 5'h1A : begin
           SLAVE_SELECT_READ_M = SLAVE_A;
        end

        5'h13, 5'h1B : begin
           SLAVE_SELECT_READ_M = SLAVE_B;
        end

        5'h14, 5'h1C : begin
           SLAVE_SELECT_READ_M = SLAVE_C;
        end

        5'h15, 5'h1D : begin
           SLAVE_SELECT_READ_M = SLAVE_D;
        end

        5'h16, 5'h1E : begin
           SLAVE_SELECT_READ_M = SLAVE_E;
        end

        5'h17, 5'h1F : begin
           SLAVE_SELECT_READ_M = SLAVE_F;
        end

        default : begin SLAVE_SELECT_READ_M = 17'h00000; end
      endcase // case ({ARVALID_MI,ARADDR_MI[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
      end // else: !if(ARADDR_MI[31:28] < 4'h8)
      
   end // always @ (*)

   // --------------------------------------------------------------------------
   // Select Slave slot for Write
   // This is used to generate the write request to the arbiter in the slave side
   // --------------------------------------------------------------------------
   always @ (*) begin
      if(AWADDR_MI[31] == 1'b0) begin
         SLAVE_SELECT_WRITE_M = SLAVE_N;
      end
      else begin
      case ({AWVALID_MI,AWADDR_MI[AXI_AWIDTH - 1:AXI_AWIDTH-4]})

        5'h10, 5'h18 : begin
           SLAVE_SELECT_WRITE_M = SLAVE_8;
        end

        5'h11, 5'h19 : begin
           SLAVE_SELECT_WRITE_M = SLAVE_9;
        end

        5'h12, 5'h1A : begin
           SLAVE_SELECT_WRITE_M = SLAVE_A;
        end

        5'h13, 5'h1B : begin
           SLAVE_SELECT_WRITE_M = SLAVE_B;
        end

        5'h14, 5'h1C : begin
           SLAVE_SELECT_WRITE_M = SLAVE_C;
        end

        5'h15, 5'h1D : begin
           SLAVE_SELECT_WRITE_M = SLAVE_D;
        end

        5'h16, 5'h1E : begin
           SLAVE_SELECT_WRITE_M = SLAVE_E;
        end

        5'h17, 5'h1F : begin
           SLAVE_SELECT_WRITE_M = SLAVE_F;
        end

        default : begin SLAVE_SELECT_WRITE_M = 17'h00000; end
      endcase // case ({AWVALID_MI,AWADDR_MI[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
      end
   end // always @ (*)   

      
      end // if (MEMSPACE == 0 && ADDR_HGS_CFG == 0)      
   endgenerate
   
   
   generate   // Added to address huge slave issue
      if(MEMSPACE == 0 && ADDR_HGS_CFG == 1) begin

   always @ (*) begin
      if(ARADDR_MI[31] == 1'b1) begin
         SLAVE_SELECT_READ_M = SLAVE_N;
      end      
      else begin
      case ({ARVALID_MI,ARADDR_MI[AXI_AWIDTH - 1:AXI_AWIDTH-4]})

        5'h10, 5'h18 : begin
           SLAVE_SELECT_READ_M = SLAVE_0;
        end

        5'h11, 5'h19 : begin
           SLAVE_SELECT_READ_M = SLAVE_1;
        end

        5'h12, 5'h1A : begin
           SLAVE_SELECT_READ_M = SLAVE_2;
        end

        5'h13, 5'h1B : begin
           SLAVE_SELECT_READ_M = SLAVE_3;
        end

        5'h14, 5'h1C : begin
           SLAVE_SELECT_READ_M = SLAVE_4;
        end

        5'h15, 5'h1D : begin
           SLAVE_SELECT_READ_M = SLAVE_5;
        end

        5'h16, 5'h1E : begin
           SLAVE_SELECT_READ_M = SLAVE_6;
        end

        5'h17, 5'h1F : begin
           SLAVE_SELECT_READ_M = SLAVE_7;
        end

        default : begin SLAVE_SELECT_READ_M = 17'h00000; end
      endcase // case ({ARVALID_MI,ARADDR_MI[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
      end // else: !if(ARADDR_MI[31:28] < 4'h8)
      
   end // always @ (*)

   always @ (*) begin
      if(AWADDR_MI[31] == 1'b1) begin
         SLAVE_SELECT_WRITE_M = SLAVE_N;
      end
      else begin
      case ({AWVALID_MI,AWADDR_MI[AXI_AWIDTH - 1:AXI_AWIDTH-4]})

        5'h10, 5'h18 : begin
           SLAVE_SELECT_WRITE_M = SLAVE_0;
        end

        5'h11, 5'h19 : begin
           SLAVE_SELECT_WRITE_M = SLAVE_1;
        end

        5'h12, 5'h1A : begin
           SLAVE_SELECT_WRITE_M = SLAVE_2;
        end

        5'h13, 5'h1B : begin
           SLAVE_SELECT_WRITE_M = SLAVE_3;
        end

        5'h14, 5'h1C : begin
           SLAVE_SELECT_WRITE_M = SLAVE_4;
        end

        5'h15, 5'h1D : begin
           SLAVE_SELECT_WRITE_M = SLAVE_5;
        end

        5'h16, 5'h1E : begin
           SLAVE_SELECT_WRITE_M = SLAVE_6;
        end

        5'h17, 5'h1F : begin
           SLAVE_SELECT_WRITE_M = SLAVE_7;
        end

        default : begin SLAVE_SELECT_WRITE_M = 17'h00000; end
      endcase // case ({AWVALID_MI,AWADDR_MI[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
      end // else: !if(AWADDR_MI[31] == 1'b0)      
   end // always @ (*)         

      end // if (MEMSPACE == 0 && ADDR_HGS_CFG == 1)      
   endgenerate
   
   generate     // Added to address huge slave issue
      if(MEMSPACE > 0) begin

      always @ (*) begin
      case ({ARVALID_MI,ARADDR_MI[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
        5'h10 : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_0;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M = SLAVE_0;
           end
        end // case: 5'h10
        
        5'h11 : begin 
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_1;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M = SLAVE_1;
           end
        end // case: 5'h11
        
        5'h12 : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_2;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M = SLAVE_2;
           end
        end      

        5'h13 : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_3;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M = SLAVE_3;
           end
        end

        5'h14 : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_4;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M = SLAVE_4;
           end
        end

        5'h15 : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_5;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M = SLAVE_5;
           end
        end

        5'h16 : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_6;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M = SLAVE_6;
           end
        end

        5'h17 : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_7;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M = SLAVE_7;
           end
        end

        5'h18 : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_8;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M = SLAVE_8;
           end
        end

        5'h19 : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_9;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M = SLAVE_9;
           end
        end

        5'h1A : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_A;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M = SLAVE_A;
           end
        end

        5'h1B : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_B;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M = SLAVE_B;
           end
        end

        5'h1C : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_C;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M = SLAVE_C;
           end
        end

        5'h1D : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_D;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M = SLAVE_D;
           end
        end

        5'h1E : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_E;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M = SLAVE_E;
           end
        end

        5'h1F : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_F;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_READ_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M = SLAVE_F;
           end
        end

        default : begin SLAVE_SELECT_READ_M = 17'h00000; end
      endcase // case ({ARVALID_MI,ARADDR_MI[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
   end // always @ (*)

   // --------------------------------------------------------------------------
   // Select Slave slot for Write
   // This is used to generate the write request to the arbiter in the slave side
   // --------------------------------------------------------------------------
   always @ (*) begin
      case ({AWVALID_MI,AWADDR_MI[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
        5'h10 : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_0;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_WRITE_M = SLAVE_0;
           end
        end // case: 5'h10
        
        5'h11 : begin 
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_1;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_WRITE_M = SLAVE_1;
           end
        end // case: 5'h11
        
        5'h12 : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_2;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_WRITE_M = SLAVE_2;
           end
        end      

        5'h13 : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_3;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_WRITE_M = SLAVE_3;
           end
        end

        5'h14 : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_4;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_WRITE_M = SLAVE_4;
           end
        end

        5'h15 : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_5;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_WRITE_M = SLAVE_5;
           end
        end

        5'h16 : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_6;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_WRITE_M = SLAVE_6;
           end
        end

        5'h17 : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_7;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_WRITE_M = SLAVE_7;
           end
        end

        5'h18 : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_8;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_WRITE_M = SLAVE_8;
           end
        end

        5'h19 : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_9;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_WRITE_M = SLAVE_9;
           end
        end

        5'h1A : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_A;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_WRITE_M = SLAVE_A;
           end
        end

        5'h1B : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_B;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_WRITE_M = SLAVE_B;
           end
        end

        5'h1C : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_C;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_WRITE_M = SLAVE_C;
           end
        end

        5'h1D : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_D;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_WRITE_M = SLAVE_D;
           end
        end

        5'h1E : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_E;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_WRITE_M = SLAVE_E;
           end
        end

        5'h1F : begin
           if((MEMSPACE > 0) && (COMB_REG == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_F;
           end
           else if(((MEMSPACE > 0) && (COMB_REG == 1)) || (MEMSPACE == 0)) begin
              SLAVE_SELECT_WRITE_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_WRITE_M = SLAVE_F;
           end
        end

        default : begin SLAVE_SELECT_WRITE_M = 17'h00000; end
      endcase // case ({AWVALID_MI,AWADDR_MI[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
   end // always @ (*)   


      end // if (MEMSPACE > 0)
   endgenerate
   
         

   // ##########################################################################
   //---------------------------------------------------------------------------
   // Write address signals to the Interconnect
   //---------------------------------------------------------------------------
   generate

      if(INP_REG_BUF == 1)  begin  

         // --------------------------------------------
         // Write address
         // --------------------------------------------

         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               AWVALID_M_INPFF1  <= 1'b0;
               AWLEN_M_INPFF1    <= 'h0;
               AWSIZE_M_INPFF1   <= 'h0;
               AWBURST_M_INPFF1  <= 'h0;
               AWLOCK_M_INPFF1   <= 'h0;
               AWCACHE_M_INPFF1  <= 'h0;
               AWPROT_M_INPFF1   <= 'h0;
               AWADDR_M_INPFF1   <= 'h0;
               AWID_M_INPFF1     <= 'h0;
               prev_AWADDR       <= 'h0;  
               prev_AWID         <= 'h0;
               
               ARVALID_M_INPFF1  <= 1'b0;
               ARLEN_M_INPFF1    <= 'h0;
               ARSIZE_M_INPFF1   <= 'h0;
               ARBURST_M_INPFF1  <= 'h0;
               ARLOCK_M_INPFF1   <= 'h0;
               ARCACHE_M_INPFF1  <= 'h0;
               ARPROT_M_INPFF1   <= 'h0;
               ARADDR_M_INPFF1   <= 'h0;
               ARID_M_INPFF1     <= 'h0;

               prev_ARADDR       <= 'h0;
               prev_ARID         <= 'h0;
            end
            else begin
               if(AWREADY_M && AWVALID_M ) begin
                  AWVALID_M_INPFF1  <= 1'b0;
                  AWLEN_M_INPFF1    <= 'h0;
                  AWSIZE_M_INPFF1   <= 'h0;
                  AWBURST_M_INPFF1  <= 'h0;
                  AWCACHE_M_INPFF1  <= 'h0;
                  AWPROT_M_INPFF1   <= 'h0;
                  AWID_M_INPFF1     <= 'h0;
                  prev_AWADDR       <= AWADDR_M;  // v3.2 For SAR#69878
                  prev_AWID         <= AWID_M;
               end
               else if(AWVALID_M ) begin  
                  //AWVALID_M_INPFF1  <=  1'b1;
		          // v3.2 For SAR#69878
                  // Number of outstanding wries allowed is equal to WR_ACCEPTANCE.
                  // This is used to block any further transaction if it the number of pending writes are greater than
                  // WR_ACCEPTANCE.
                  AWVALID_M_INPFF1  <= 1'b1 & !((wr_wdcntr - wr_rdcntr) == wr_acceptance_limit) & !stall_trans1 & !stall_trans_wr;
                  AWID_M_INPFF1     <= AWID_int;
                  AWLEN_M_INPFF1    <= AWLEN_M;
                  AWSIZE_M_INPFF1   <= AWSIZE_M;
                  AWBURST_M_INPFF1  <= AWBURST_M;
                  AWLOCK_M_INPFF1   <= AWLOCK_M;
                  AWCACHE_M_INPFF1  <= AWCACHE_M;
                  AWPROT_M_INPFF1   <= AWPROT_M;
                  AWADDR_M_INPFF1   <= AWADDR_M;

               end

               if(ARREADY_M && ARVALID_M) begin
                  ARVALID_M_INPFF1  <= 1'b0;
                  ARLEN_M_INPFF1    <= 'h0;
                  ARSIZE_M_INPFF1   <= 'h0;
                  ARBURST_M_INPFF1  <= 'h0;
                  ARCACHE_M_INPFF1  <= 'h0;
                  ARPROT_M_INPFF1   <= 'h0;
                  ARID_M_INPFF1     <= 'h0;

                  prev_ARADDR       <= ARADDR_M;
                  prev_ARID         <= ARID_M;
               end
               //else begin
               else if(ARVALID_M ) begin  
                  // Number of outstanding reads allowed is equal to RD_ACCEPTANCE.
                  // This is used to block any further transaction if it the number of pending reads are greater than
                  // RD_ACCEPTANCE.
                  ARVALID_M_INPFF1  <= 1'b1 & !((rd_wdcntr - rd_rdcntr) == rd_acceptance_limit) & !stall_trans & !stall_trans_rd; 
                  ARID_M_INPFF1     <= ARID_int;
                  ARLEN_M_INPFF1    <= ARLEN_M;
                  ARSIZE_M_INPFF1   <= ARSIZE_M;
                  ARBURST_M_INPFF1  <= ARBURST_M;
                  ARLOCK_M_INPFF1   <= ARLOCK_M;
                  ARCACHE_M_INPFF1  <= ARCACHE_M;
                  ARPROT_M_INPFF1   <= ARPROT_M;
                  ARADDR_M_INPFF1   <= ARADDR_M;                  
               end
            end // else: !if(!aresetn)            
         end // always @ (posedge ACLK or negedge( aresetn) || (!sresetn))
         
         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               AWVALID_M_FF1  <= 1'b0;
               ARVALID_M_FF1  <= 1'b0;
            end
            else begin
               if(AWREADY_M && AWVALID_M ) begin
                  AWVALID_M_FF1  <= 1'b0;
               end
               else begin
                  AWVALID_M_FF1  <= AWVALID_M_INPFF1;  
               end

               if(ARREADY_M && ARVALID_M) begin
                  ARVALID_M_FF1  <= 1'b0;
               end
               else begin
                  ARVALID_M_FF1  <= ARVALID_M_INPFF1 & !stall_trans & !((rd_wdcntr - rd_rdcntr) == rd_acceptance_limit) & !stall_trans_rd;
               end
            end // else: !if(!aresetn)            
         end // always @ (posedge ACLK or negedge( aresetn) || (!sresetn))

         always @(posedge ACLK or negedge aresetn) begin // registering on clock 
            if((!aresetn) || (!sresetn)) begin
               AWVALID_M_pulse  <= 'h0;
            end
            else begin
               if(AWREADY_M && AWVALID_M) begin
                  AWVALID_M_pulse  <= 1'b0;
               end
               else if(AWVALID_M_INPFF1 && !AWVALID_M_FF1) begin  
                  AWVALID_M_pulse  <= 1'b1;
               end

            end // else: !if(ARESETN == 1'b0)
         end // always @ (posedge ACLK or negedge ARESETN)
         
         always @(posedge ACLK or negedge aresetn) begin // registering on clock 
            if((!aresetn) || (!sresetn)) begin
               ARVALID_M_pulse  <= 'h0;
            end
            else begin
               if(ARREADY_M && ARVALID_M) begin
                  ARVALID_M_pulse  <= 'h0;
               end
               else if(ARVALID_M_INPFF1 && !ARVALID_M_FF1 && !((rd_wdcntr - rd_rdcntr) == rd_acceptance_limit) & !stall_trans & !stall_trans_rd) begin

                  ARVALID_M_pulse  <= 1'b1;
               end

            end // else: !if(ARESETN == 1'b0)
         end // always @ (posedge ACLK or negedge ARESETN)

         // --------------------------------------------
         // Write data
         // --------------------------------------------
         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin               
               WVALID_M_INPFF1   <= 1'b0;         
               WID_M_INPFF1      <= 'h0;         
               WLAST_M_INPFF1    <= 1'b0;         
               WDATA_M_INPFF1    <= 'h0;         
               WSTRB_M_INPFF1    <= 'h0;
       
               BREADY_M_INPFF1   <= 1'b0;
               RREADY_M_INPFF1   <= 1'b0;
            end
            else begin

               if((WREADY_M && WVALID_M)) begin 
                  WVALID_M_INPFF1   <= 1'b0;
                  WLAST_M_INPFF1    <= 1'b0;         
               end
               else begin
                  WVALID_M_INPFF1 <= WVALID_M;
                  WDATA_M_INPFF1  <= WDATA_M;         
                  WID_M_INPFF1    <= WID_int;   
                  WSTRB_M_INPFF1  <= WSTRB_M;
                  WLAST_M_INPFF1  <= WLAST_M;
               end

               BREADY_M_INPFF1 <= BREADY_M;
               RREADY_M_INPFF1 <= RREADY_M;               

            end // else: !if(!ARESETN)            
         end // always @ (posedge ACLK or negedge ARESETN)
         
         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               WVALID_M_FF1   <= 1'b0;         
       
               BREADY_M_FF1 <= 1'b0;
               RREADY_M_FF1 <= 1'b0;               

            end
            else begin
               WVALID_M_FF1 <= WVALID_M_INPFF1;
               
               BREADY_M_FF1 <= BREADY_M_INPFF1;
               RREADY_M_FF1 <= RREADY_M_INPFF1;               

            end
         end // always @ (posedge ACLK or negedge ARESETN)         

         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               WVALID_M_pulse  <= 'h0;               
            end
            else begin
               if(WREADY_M && WVALID_M) begin
                  WVALID_M_pulse  <= 'h0;               
               end
               else if(WVALID_M_INPFF1 && !WVALID_M_FF1) begin
                  WVALID_M_pulse  <= 1'b1;
               end
            end
         end
         
         assign BREADY_M_pulse  = !BREADY_M_FF1 & BREADY_M_INPFF1;
         assign RREADY_M_pulse  = !RREADY_M_FF1 & RREADY_M_INPFF1;


         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               next_valid_sample <= 1'b0;
               next_valid_sample_r <= 1'b0;
               WLAST_M_r <= 1'b0;               
               AWVALID_M_r <= 1'b0;               
               ARVALID_M_r <= 1'b0;               
            end
            else begin
               if(WREADY_M) begin
                  next_valid_sample <= 1'b0;
               end
               else if(WVALID_M_INPFF1) begin
                  next_valid_sample <= 1'b1;
               end
               next_valid_sample_r <= next_valid_sample;
               WLAST_M_r <= WLAST_M & !gated_AWVALID_M_flag;
               AWVALID_M_r <= AWVALID_M;
               ARVALID_M_r <= ARVALID_M;
            end
         end

         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               next_rvalid_sample <= 1'b0;
               next_rvalid_sample_r <= 1'b0;
               RLAST_IM_r <= 1'b0;               
            end
            else begin
               if(RREADY_MI) begin
                  next_rvalid_sample <= 1'b0;
               end
               else if(RVALID_M_INPFF1) begin
                  next_rvalid_sample <= 1'b1;
               end
               next_rvalid_sample_r <= next_rvalid_sample;
               RLAST_IM_r <= RLAST_IM;
            end
         end


         // --------------------------------------------------
         // Read data
         // --------------------------------------------------
         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               // Latched Write Response signals
               BVALID_M_INPFF1   <= 1'b0;         
               BID_M_INPFF1      <= 'h0;
               BRESP_M_INPFF1    <= 'h0;
               
               // Latched Read Response signals
               RID_M_INPFF1     <= 'h0;               
               RDATA_M_INPFF1   <= 'h0;
               RRESP_M_INPFF1   <= 'h0;               
               RLAST_M_INPFF1   <= 'h0;               
               RVALID_M_INPFF1  <= 1'b0;                  
            end
            else begin
               if(BVALID_M && BREADY_M) begin
                  BVALID_M_INPFF1   <= 1'b0;         
                  BID_M_INPFF1      <= 'h0;
                  BRESP_M_INPFF1    <= 'h0;
               end
               else begin
                  // Latched Write Response signals
                  BID_M_INPFF1     <= BID_IM;               
                  BRESP_M_INPFF1   <= BRESP_IM;               
                  BVALID_M_INPFF1  <= BVALID_IM & !BVALID_IM_r;
               end

               if(RVALID_M && RREADY_M) begin
                  RID_M_INPFF1     <= 'h0;               
                  RDATA_M_INPFF1   <= 'h0;
                  RRESP_M_INPFF1   <= 'h0;               
                  RLAST_M_INPFF1   <= 'h0;               
                  RVALID_M_INPFF1  <= 1'b0;                  
               end
               else begin
                  RID_M_INPFF1     <= RID_IM;
                  RDATA_M_INPFF1   <= RDATA_IM;
                  RRESP_M_INPFF1   <= RRESP_IM;               
                  RLAST_M_INPFF1   <= RLAST_IM;               
                  RVALID_M_INPFF1  <= RVALID_IM;
               end
            end
         end // always @ (posedge ACLK or negedge ARESETN)         

         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               // Latched Write Response signals
               BVALID_M_FF1   <= 1'b0;         
               BID_M_FF1      <= 'h0;
               BRESP_M_FF1    <= 'h0;

               RID_M_FF1     <= 'h0;               
               RDATA_M_FF1   <= 'h0;               
               RRESP_M_FF1   <= 'h0;               
               RLAST_M_FF1   <= 'h0;
               RVALID_M_FF1  <= 'h0;
            end
            else begin
               BID_M_FF1     <= BID_M_INPFF1;               
               BRESP_M_FF1   <= BRESP_M_INPFF1;               
               BVALID_M_FF1  <= BVALID_M_INPFF1;               

               RID_M_FF1     <= RID_M_INPFF1; 
               RDATA_M_FF1   <= RDATA_M_INPFF1; 
               RRESP_M_FF1   <= RRESP_M_INPFF1;               
               RLAST_M_FF1   <= RLAST_M_INPFF1;                
               RVALID_M_FF1  <= RVALID_M_INPFF1;

            end
         end // always @ (posedge ACLK or negedge ARESETN)         

         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               RVALID_M_pulse  <= 'h0;               
               RID_M_pulse     <= 'h0;               
               RRESP_M_pulse   <= 'h0;               
               RDATA_M_pulse   <= 'h0;               
               RLAST_M_pulse   <= 'h0;               
            end
            else begin
               if(RVALID_M && RREADY_M) begin
                  RVALID_M_pulse  <= 'h0;               
                  RID_M_pulse     <= 'h0;               
                  RRESP_M_pulse   <= 'h0;               
                  RDATA_M_pulse   <= 'h0;               
                  RLAST_M_pulse   <= 'h0;               
               end
               else if((RVALID_M_INPFF1 && !RVALID_M_FF1)) begin
                  RVALID_M_pulse  <= 1'b1;
                  RID_M_pulse     <= RID_M_INPFF1;                                           
                  RRESP_M_pulse   <= RRESP_M_INPFF1;                                         
                  RDATA_M_pulse   <= RDATA_M_INPFF1;                                         
                  RLAST_M_pulse   <= RLAST_M_INPFF1;
               end
            end
         end

         // Write Resp
         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               BVALID_M_pulse  <= 'h0;               
               BID_M_pulse     <= 'h0;               
               BRESP_M_pulse   <= 'h0;               
            end
            else begin
               if(BVALID_M && BREADY_M) begin
                  BVALID_M_pulse  <= 'h0;
                  BID_M_pulse     <= 'h0;
                  BRESP_M_pulse   <= 'h0;
               end
               else if(BVALID_M_INPFF1 && !BVALID_M_FF1) begin
                  BVALID_M_pulse  <= 1'b1;                  
                  BID_M_pulse     <= BID_M_INPFF1;                 
                  BRESP_M_pulse   <= BRESP_M_INPFF1;                              
               end
            end
         end

      end // if (INP_REG_BUF == 1)      
   endgenerate
   
   generate
      if(INP_REG_BUF == 0)  begin  
         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               AWVALID_M_INPFF1  <= 1'b0;
               AWLEN_M_INPFF1    <= 'h0;
               AWSIZE_M_INPFF1   <= 'h0;
               AWBURST_M_INPFF1  <= 'h0;
               AWLOCK_M_INPFF1   <= 'h0;
               AWCACHE_M_INPFF1  <= 'h0;
               AWPROT_M_INPFF1   <= 'h0;
               AWADDR_M_INPFF1   <= 'h0;
               AWID_M_INPFF1     <= 'h0;
               prev_AWADDR       <= 'h0;  
               prev_AWID         <= 'h0;
               
               ARVALID_M_INPFF1  <= 1'b0;
               ARLEN_M_INPFF1    <= 'h0;
               ARSIZE_M_INPFF1   <= 'h0;
               ARBURST_M_INPFF1  <= 'h0;
               ARLOCK_M_INPFF1   <= 'h0;
               ARCACHE_M_INPFF1  <= 'h0;
               ARPROT_M_INPFF1   <= 'h0;
               ARADDR_M_INPFF1   <= 'h0;
               ARID_M_INPFF1     <= 'h0;

               prev_ARADDR       <= 'h0;
               prev_ARID         <= 'h0;
               
            end
            else begin
               if(AWREADY_M && AWVALID_M ) begin
                  AWVALID_M_INPFF1  <= 1'b0;
                  AWLEN_M_INPFF1    <= 'h0;
                  AWSIZE_M_INPFF1   <= 'h0;
                  AWBURST_M_INPFF1  <= 'h0;
                  AWCACHE_M_INPFF1  <= 'h0;
                  AWPROT_M_INPFF1   <= 'h0;
                  AWID_M_INPFF1     <= 'h0;
                  prev_AWADDR       <= AWADDR_M;
                  prev_AWID         <= AWID_M;
               end
               else if(AWVALID_M ) begin  
                  //AWVALID_M_INPFF1  <= 1'b1;
		          // v3.2 ForSAR69878
                  AWVALID_M_INPFF1  <= 1'b1 & !((wr_wdcntr - wr_rdcntr) == wr_acceptance_limit) & !stall_trans1 & !stall_trans_wr;
                  AWID_M_INPFF1     <= AWID_int;
                  AWLEN_M_INPFF1    <= AWLEN_M;
                  AWSIZE_M_INPFF1   <= AWSIZE_M;
                  AWBURST_M_INPFF1  <= AWBURST_M;
                  AWLOCK_M_INPFF1   <= AWLOCK_M;
                  AWCACHE_M_INPFF1  <= AWCACHE_M;
                  AWPROT_M_INPFF1   <= AWPROT_M;
                  AWADDR_M_INPFF1   <= AWADDR_M;
               end

               if(ARREADY_M && ARVALID_M) begin
                  ARVALID_M_INPFF1  <= 1'b0;
                  ARLEN_M_INPFF1    <= 'h0;
                  ARSIZE_M_INPFF1   <= 'h0;
                  ARBURST_M_INPFF1  <= 'h0;
                  ARCACHE_M_INPFF1  <= 'h0;
                  ARPROT_M_INPFF1   <= 'h0;
                  ARID_M_INPFF1     <= 'h0;

                  prev_ARADDR       <= ARADDR_M;
                  prev_ARID         <= ARID_M;
               end
               //else begin
               else if(ARVALID_M ) begin 
                  ARVALID_M_INPFF1  <= 1'b1 & !((rd_wdcntr - rd_rdcntr) == rd_acceptance_limit) & !stall_trans & !stall_trans_rd;
                  
                  ARID_M_INPFF1     <= ARID_int;
                  ARLEN_M_INPFF1    <= ARLEN_M;
                  ARSIZE_M_INPFF1   <= ARSIZE_M;
                  ARBURST_M_INPFF1  <= ARBURST_M;
                  ARLOCK_M_INPFF1   <= ARLOCK_M;
                  ARCACHE_M_INPFF1  <= ARCACHE_M;
                  ARPROT_M_INPFF1   <= ARPROT_M;
                  ARADDR_M_INPFF1   <= ARADDR_M;

               end
            end // else: !if(!ARESETN)            
         end // always @ (posedge ACLK or negedge ARESETN)


         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               AWVALID_M_pulse  <= 'h0;
            end
            else begin
               if(AWREADY_M && AWVALID_M) begin
                  AWVALID_M_pulse  <= 1'b0;
               end              
	           // v3.2 ForSAR69878
               else if(AWVALID_M && !AWVALID_M_INPFF1 && !stall_trans1 && !stall_trans_wr  && !((wr_wdcntr - wr_rdcntr) == wr_acceptance_limit)) begin
                  AWVALID_M_pulse  <= 1'b1;
               end                 
            end // else: !if(ARESETN == 1'b0)            
         end // always @ (posedge ACLK or negedge ARESETN)         
         
         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               ARVALID_M_pulse  <= 'h0;
            end
            else begin
               if(ARREADY_M && ARVALID_M) begin
                  ARVALID_M_pulse  <= 1'b0;
               end              
               else if(ARVALID_M && !ARVALID_M_INPFF1 && !stall_trans && !stall_trans_rd  && !((rd_wdcntr - rd_rdcntr) == rd_acceptance_limit)) begin
                  ARVALID_M_pulse  <= 1'b1;
               end                 
            end // else: !if(ARESETN == 1'b0)            
         end // always @ (posedge ACLK or negedge ARESETN)         
   


         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               WVALID_M_INPFF1   <= 1'b0;         
               WLAST_M_INPFF1    <= 1'b0;         
               WDATA_M_INPFF1    <= 'h0;         
               WSTRB_M_INPFF1    <= 'h0;
               WID_M_INPFF1      <= 'h0;         

       
               BREADY_M_FF1 <= 1'b0;
               RREADY_M_FF1 <= 1'b0;               
            end
            else begin
               if(WREADY_M && WVALID_M) begin 
                  WVALID_M_INPFF1   <= 1'b0;         
                  WLAST_M_INPFF1    <= 1'b0;         
                  WID_M_INPFF1      <= 'h0;         
               end
               else begin
                  WVALID_M_INPFF1 <= WVALID_M;
                  WDATA_M_INPFF1  <= WDATA_M;         
                  WID_M_INPFF1    <= WID_int;   
                  WSTRB_M_INPFF1  <= WSTRB_M;
                  WLAST_M_INPFF1  <= WLAST_M;
               end

               BREADY_M_FF1 <= BREADY_M;               
               RREADY_M_FF1 <= RREADY_M;               
            end
         end // always @ (posedge ACLK or negedge ARESETN)


         // --------------------------------------------
         // Write data (INP_REG_BUF = 0)
         // --------------------------------------------
         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               WVALID_M_pulse  <= 'h0;               
               WLAST_M_pulse   <= 'h0;
               WID_M_pulse     <= 'h0;
               WDATA_M_pulse   <= 'h0;
               WSTRB_M_pulse   <= 'h0;           
            end
            else begin
               if(WREADY_M && WVALID_M) begin
                  WVALID_M_pulse  <= 'h0;               
                  WLAST_M_pulse   <= 'h0;
               end
               else if(WVALID_M && !WVALID_M_INPFF1) begin
                  WVALID_M_pulse  <= 1'b1;
                  WLAST_M_pulse   <= WLAST_M; 
                  WID_M_pulse     <= WID_int;   
                  WDATA_M_pulse   <= WDATA_M;             
                  WSTRB_M_pulse   <= WSTRB_M; 
               end
               WDATA_M_pulse   <= WDATA_M;
               WSTRB_M_pulse   <= WSTRB_M;
               WID_M_pulse     <= WID_int;               
  
          end
         end
         
         assign BREADY_M_pulse  = !BREADY_M_FF1 & BREADY_M;
         assign RREADY_M_pulse  = !RREADY_M_FF1 & RREADY_M;

         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               next_valid_sample <= 1'b0;
               next_valid_sample_r <= 1'b0;
               WLAST_M_r <= 1'b0;               
               AWVALID_M_r <= 1'b0;               
               ARVALID_M_r <= 1'b0;               
            end
            else begin
               if(WREADY_M) begin
                  next_valid_sample <= 1'b0;
               end
               else if(WVALID_M_pulse) begin
                  next_valid_sample <= 1'b1;
               end
               next_valid_sample_r <= next_valid_sample;
               WLAST_M_r <= WLAST_M & !gated_AWVALID_M_flag;
               AWVALID_M_r <= AWVALID_M;
               ARVALID_M_r <= ARVALID_M;
            end
         end

         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               // Latched Read Response signals
               RID_M_FF1     <= 'h0;               
               RDATA_M_FF1   <= 'h0;
               RRESP_M_FF1   <= 'h0;               
               RLAST_M_FF1   <= 'h0;
               RVALID_M_FF1  <= 1'b0;
            end
            else begin
               if(RVALID_M && RREADY_M) begin
                  RID_M_FF1     <= 'h0;               
                  RDATA_M_FF1   <= 'h0;
                  RRESP_M_FF1   <= 'h0;               
                  RLAST_M_FF1   <= 'h0;
                  RVALID_M_FF1  <= 1'b0;
               end
               else begin
	              // Latched Read Response signals
                  RID_M_FF1     <= RID_IM;
                  RDATA_M_FF1   <= RDATA_IM;
                  RRESP_M_FF1   <= RRESP_IM;               
                  RLAST_M_FF1   <= RLAST_IM;               
                  RVALID_M_FF1  <= RVALID_IM;
               end
            end
         end // always @ (posedge ACLK or negedge ARESETN)         
  
         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               RVALID_M_pulse  <= 'h0;               
               RID_M_pulse     <= 'h0;               
               RRESP_M_pulse   <= 'h0;               
               RDATA_M_pulse   <= 'h0;               
               RLAST_M_pulse   <= 'h0;               
            end
            else begin
               if(RVALID_M && RREADY_M) begin
                  RVALID_M_pulse  <= 'h0;               
                  RID_M_pulse     <= 'h0;               
                  RRESP_M_pulse   <= 'h0;               
                  RDATA_M_pulse   <= 'h0;               
                  RLAST_M_pulse   <= 'h0;               
               end
               else if(RVALID_IM && !RVALID_M_FF1) begin
                  RVALID_M_pulse  <= 1'b1;
                  RID_M_pulse     <= RID_IM;                                           
                  RRESP_M_pulse   <= RRESP_IM;                                         
                  RDATA_M_pulse   <= RDATA_IM;                                         
                  RLAST_M_pulse   <= RLAST_IM;
               end
            end
         end

         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               // Latched Write Response signals
               BVALID_M_FF1   <= 1'b0;         
               BID_M_FF1      <= 'h0;
               BRESP_M_FF1    <= 'h0;
            end
            else begin
               if(BVALID_M && BREADY_M) begin
                  BVALID_M_FF1   <= 1'b0;         
                  BID_M_FF1      <= 'h0;
                  BRESP_M_FF1    <= 'h0;
               end
               else begin
                  // Latched Write Response signals
                  BID_M_FF1     <= BID_IM;               
                  BRESP_M_FF1   <= BRESP_IM;               
                  BVALID_M_FF1  <= BVALID_IM & !BVALID_IM_r;
               end
            end
         end // always @ (posedge ACLK or negedge ARESETN)         


         // Write Resp
         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               BVALID_M_pulse  <= 'h0;               
               BID_M_pulse     <= 'h0;               
               BRESP_M_pulse   <= 'h0;               
            end
            else begin
               if(BVALID_M && BREADY_M) begin
                  BVALID_M_pulse  <= 'h0;
                  BID_M_pulse     <= 'h0;
                  BRESP_M_pulse   <= 'h0;
               end
               else if(BVALID_IM && !BVALID_IM_r) begin
                  BVALID_M_pulse  <= 1'b1;
                  BID_M_pulse     <= BID_IM;
                  BRESP_M_pulse   <= BRESP_IM;
               end
            end
         end

      end // if (INP_REG_BUF == 0)
   endgenerate
   
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         RVALID_IM_r <= 1'b0;
         BVALID_IM_r <= 1'b0;
         BVALID_IM_r1 <= 1'b0;

         RVALID_M_r <= 1'b0;
         RREADY_M_r <= 1'b0;
      end
      else begin
         RVALID_IM_r <= RVALID_IM;
         BVALID_IM_r <= BVALID_IM;
         BVALID_IM_r1 <= BVALID_IM_r;

         RVALID_M_r <= RVALID_M;
         RREADY_M_r <= RREADY_M;
      end
   end

   always @(posedge ACLK or negedge aresetn) begin // registering on clock 
      if((!aresetn) || (!sresetn)) begin
         WREADY_IM_r <= 1'b0;
      end
      else begin
         WREADY_IM_r <= WREADY_IM;
      end
   end // always @ (posedge ACLK or negedge ARESETN)

   assign BREADY_MI   = BREADY_M & BVALID_M;

   always @(*) begin
      RREADY_MI   = RREADY_M & RVALID_M;
   end


   // ##########################################################################
   // --------------------------------------------------------------------------
   // Towards Master interface
   // --------------------------------------------------------------------------
   // Pass Write address/Read address and write data ready signals back to the master top
   // Register the AND'ing of READY from the slave and the outgoing valid 
   // from the master stage
   // --------------------------------------------------------------------------
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         WVALID_MI_r1 <= 1'b0;
         WVALID_MI_r2 <= 1'b0;
      end
      else begin
         if(WREADY_M && WVALID_M) begin
            WVALID_MI_r1 <= 1'b0;
            WVALID_MI_r2 <= 1'b0;
         end
         else begin
            WVALID_MI_r1 <= WVALID_MI;
            WVALID_MI_r2 <= WVALID_MI_r1;
         end
      end
   end


   // --------------------------------------------------------------------------
   // Pass the ARDEADY_SI coming from the respective selected slave.
   // When the look-up is filled to limit of 16, the AWREADY going towards the
   // granted master is pulled low. This disallows anymore transactions to be
   // received in to the DUT.
   // --------------------------------------------------------------------------
   generate      
      if(OUT_REG_BUF == 1)  begin

         assign ARREADY_M_int = ARREADY_IM & ARVALID_MI & !ARREADY_M;
         assign AWREADY_M_int = AWREADY_IM & AWVALID_MI & !AWREADY_M;

         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               AWREADY_M <= 1'b0;
               ARREADY_M <= 1'b0;
               WREADY_M <= 1'b0;
            end
            else begin
               AWREADY_M <= (((wr_wdcntr - wr_rdcntr) == WR_ACCEPTANCE) | (stall_trans1 == 1'b1) | (stall_trans_wr == 1'b1)) ? 1'b0: AWREADY_M_int;    // v3.2 For SAR#69878
               ARREADY_M <= (((rd_wdcntr - rd_rdcntr) == RD_ACCEPTANCE) | (stall_trans == 1'b1)  | (stall_trans_rd == 1'b1)) ? 1'b0: ARREADY_M_int;  
               WREADY_M <= WREADY_IM & WVALID_MI & !WREADY_M;
            end
         end

      end // if (OUT_REG_BUF == 1)
   endgenerate
   

   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         AWREADY_M_r <= 1'b0;
         ARREADY_M_r <= 1'b0;
         WREADY_M_r  <= 1'b0;
      end
      else begin
         AWREADY_M_r <= AWREADY_M;
         ARREADY_M_r <= ARREADY_M;               
         WREADY_M_r  <= WREADY_M;
      end
   end

   generate      
      if(OUT_REG_BUF == 0)  begin
         assign ARREADY_M_int  = ARREADY_IM & ARVALID_MI;
         assign AWREADY_M_int  = AWREADY_IM & AWVALID_MI;

         always @(*) begin
            AWREADY_M = (((wr_wdcntr - wr_rdcntr) == WR_ACCEPTANCE) | (stall_trans1 == 1'b1) | (stall_trans_wr == 1'b1)) ? 1'b0: AWREADY_M_int;  // v3.2 For SAR#69878
            ARREADY_M = (((rd_wdcntr - rd_rdcntr) == RD_ACCEPTANCE) | (stall_trans == 1'b1)  | (stall_trans_rd == 1'b1)) ? 1'b0: ARREADY_M_int;  
            WREADY_M  = WREADY_IM & WVALID_MI & !WREADY_M_r;
         end

      end // if (OUT_REG_BUF == 0)
      
   endgenerate
      
   always @(posedge ACLK or negedge aresetn) begin  
      if((!aresetn) || (!sresetn)) begin
         gatedWA_Rdy <= 1'b0;
      end
      else begin
         if(BVALID_M && BREADY_M) begin
            gatedWA_Rdy <= 1'b0;
         end
         else if(AWVALID_M && AWREADY_M) begin
            gatedWA_Rdy <= 1'b1;
         end
      end
   end


   always @(*) begin
      // Latched Write Address signals 
      AWVALID_MI  = AWVALID_M_pulse;
      AWID_MI     = AWID_M_INPFF1;
      AWLEN_MI    = AWLEN_M_INPFF1;
      AWSIZE_MI   = AWSIZE_M_INPFF1;
      AWBURST_MI  = AWBURST_M_INPFF1;
      AWLOCK_MI   = AWLOCK_M_INPFF1;
      AWCACHE_MI  = AWCACHE_M_INPFF1;
      AWPROT_MI   = AWPROT_M_INPFF1;
      AWADDR_MI   = AWADDR_M_INPFF1;

      // Latched Read Address signals 
      ARVALID_MI  = ARVALID_M_pulse;
      ARID_MI     = ARID_M_INPFF1;
      ARSIZE_MI   = ARSIZE_M_INPFF1;
      ARBURST_MI  = ARBURST_M_INPFF1;
      ARLOCK_MI   = ARLOCK_M_INPFF1;
      ARCACHE_MI  = ARCACHE_M_INPFF1;
      ARPROT_MI   = ARPROT_M_INPFF1;
      ARLEN_MI    = ARLEN_M_INPFF1;
      ARADDR_MI   = ARADDR_M_INPFF1;
   end


   // ----------------------------------------------------
   // From slave_stage
   // ----------------------------------------------------

   //-----------------------------------------------------
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         WID_MI      <= 'h0;
         WDATA_MI    <= 'h0;
         WSTRB_MI    <= 'h0;
         WLAST_MI    <= 'h0;
         WVALID_MI   <= 'h0;
      end
      else begin
         if(WREADY_M && WVALID_M) begin
            WID_MI      <= 'h0;
            WLAST_MI    <= 'h0;
            WVALID_MI   <= 'h0;
         end
         else begin
            WVALID_MI   <= WVALID_M_pulse;
            WID_MI      <= WID_M_INPFF1;
            WDATA_MI    <= WDATA_M_INPFF1;
            WSTRB_MI    <= WSTRB_M_INPFF1;
            WLAST_MI    <= WLAST_M_INPFF1;

         end
      end
   end // always @ (posedge ACLK or negedge ARESETN)
   
   
   generate
      if(OUT_REG_BUF == 1'b1) begin


         // Pass Read response signals back to the master top
         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               RVALID_M_pulse_r <= 1'b0;               
            end
            else begin
               RVALID_M_pulse_r <= RVALID_M_pulse;
            end
         end

         // Pass Read response signals back to the master top
         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               RID_M     <= 'h0;
               RVALID_M  <= 1'b0;
               RRESP_M   <= 'h0;
               RDATA_M   <= 'h0;
               RLAST_M   <= 1'b0;               
            end
            else begin
               if(RVALID_M && RREADY_M) begin
                  RID_M     <= 'h0;
                  RVALID_M  <= 1'b0;
                  RRESP_M   <= 'h0;
                  RDATA_M   <= 'h0;
                  RLAST_M   <= 1'b0;
               end
               else begin
                  if(RID_M_int[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2] == UID_WIDTH) begin
                     RID_M     <= {ARID_msb_lat,RID_M_int[1:0]};
                     RVALID_M  <= RVALID_M_int;
                     RRESP_M   <= RRESP_M_int;
                     RDATA_M   <= RDATA_M_int;
                     RLAST_M   <= RLAST_M_int;
                  end
               end
            end
         end // always @ (posedge ACLK or negedge ARESETN)

         // Pass Read response signals back to the master top
         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               RID_M_int     <= 'h0;
               RVALID_M_int  <= 1'b0;
               RRESP_M_int   <= 'h0;
               RDATA_M_int   <= 'h0;
               RLAST_M_int   <= 1'b0;               
            end
            else begin
               if(RVALID_M && RREADY_M) begin
                  RID_M_int     <= 'h0;
                  RVALID_M_int  <= 1'b0;
                  RRESP_M_int   <= 'h0;
                  RDATA_M_int   <= 'h0;
                  RLAST_M_int   <= 1'b0;
               end
               else begin
                  if(RID_IM[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2] == UID_WIDTH) begin
                     RID_M_int     <= RID_IM;
                     RVALID_M_int  <= RVALID_IM;
                     RRESP_M_int   <= RRESP_IM;
                     RDATA_M_int   <= RDATA_IM;
                     RLAST_M_int   <= RLAST_IM;
                  end
               end
            end
         end // always @ (posedge ACLK or negedge ARESETN)

         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               BID_M     <= 'h0;
               BVALID_M  <= 1'b0;
               BRESP_M   <= 'h0;               
            end
            else begin
               if(BVALID_M && BREADY_M) begin
                  BID_M     <= 'h0;
                  BVALID_M  <= 1'b0;
                  BRESP_M   <= 'h0;
               end
               else begin
                  BVALID_M <= BVALID_M_pulse;
                  BID_M    <= {AWID_msb_lat[WR_ACCEPTANCE*2 - 1:WR_ACCEPTANCE*2 - 2],BID_M_pulse[1:0]};
                  BRESP_M  <= BRESP_M_pulse;
               end
            end
         end


      end // if (OUT_REG_BUF == 1'b1)
   endgenerate


   generate
      if(OUT_REG_BUF == 1'b0) begin

         // Pass Read response signals back to the master top
         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               RID_M     <= 'h0;
               RVALID_M  <= 1'b0;
               RRESP_M   <= 'h0;
               RDATA_M   <= 'h0;
               RLAST_M   <= 1'b0;               
            end
            else begin
               if(RVALID_M && RREADY_M) begin
                  RID_M     <= 'h0;
                  RVALID_M  <= 1'b0;
                  RRESP_M   <= 'h0;
                  RDATA_M   <= 'h0;
                  RLAST_M   <= 1'b0;
               end
               else begin
                  if(RID_IM[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2] == UID_WIDTH) begin
                     RID_M     <= {ARID_msb_lat,RID_IM[1:0]};
                     RVALID_M  <= RVALID_IM;
                     RRESP_M   <= RRESP_IM;
                     RDATA_M   <= RDATA_IM;
                     RLAST_M   <= RLAST_IM;
                  end
               end
            end
         end // always @ (posedge ACLK or negedge ARESETN)

         // Pass Write response signals back to the master top
         always @(*) begin
            BVALID_M = BVALID_M_pulse;
            BID_M    <= {AWID_msb_lat[WR_ACCEPTANCE*2 - 1:WR_ACCEPTANCE*2 - 2],BID_M_pulse[1:0]};
            BRESP_M  = BRESP_M_pulse;
         end


      end // if (OUT_REG_BUF == 1'b0)      
   endgenerate
   
   // v3.2.9

   generate 
     if(WR_ACCEPTANCE == 4) begin

   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         AWID_msb_lat     <= 'h0;         
      end
      else begin         
         if(AWVALID_M && AWREADY_M && BVALID_M && BREADY_M) begin
            if(ID_cnt == 0) begin               
               AWID_msb_lat  <= AWID_msb_lat << 2;  
            end
            else if(ID_cnt == 1) begin               
               AWID_msb_lat  <= {AWID_M[3:2], AWID_msb_lat[5:0]};
            end
            else if(ID_cnt == 2) begin               
               AWID_msb_lat  <= {AWID_msb_lat[7:6],AWID_M[3:2], AWID_msb_lat[3:0]};  
            end
            else if(ID_cnt == 3) begin               
               AWID_msb_lat  <= {AWID_msb_lat[7:4],AWID_M[3:2], AWID_msb_lat[1:0]};  
            end
            else if(ID_cnt == 4) begin               
               AWID_msb_lat  <= {AWID_msb_lat[7:2],AWID_M[3:2]};  
            end
         end       
         else if(BVALID_M && BREADY_M) begin       // Pop the top two stored ID value
            AWID_msb_lat  <= AWID_msb_lat << 2;  
         end       
         else if(AWVALID_M && AWREADY_M && ID_cnt == 0) begin  // Push the top two stored ID value, push the latest down
            AWID_msb_lat  <= {AWID_M[3:2], AWID_msb_lat[5:0]};  
         end       
         else if(AWVALID_M && AWREADY_M && ID_cnt == 1) begin
            AWID_msb_lat  <= {AWID_msb_lat[7:6],AWID_M[3:2], AWID_msb_lat[3:0]};  
         end       
         else if(AWVALID_M && AWREADY_M && ID_cnt == 2) begin
            AWID_msb_lat  <= {AWID_msb_lat[7:4],AWID_M[3:2], AWID_msb_lat[1:0]};  
         end       
         else if(AWVALID_M && AWREADY_M && ID_cnt == 3) begin
            AWID_msb_lat  <= {AWID_msb_lat[7:2],AWID_M[3:2]};  
         end       
      end
   end

     end
   endgenerate 

   generate 
     if(WR_ACCEPTANCE == 3) begin

   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         AWID_msb_lat     <= 'h0;         
      end
      else begin         
         if(AWVALID_M && AWREADY_M && BVALID_M && BREADY_M) begin
            if(ID_cnt == 0) begin               
               AWID_msb_lat  <= AWID_msb_lat << 2;  
            end
            else if(ID_cnt == 1) begin               
               AWID_msb_lat  <= {AWID_M[3:2], AWID_msb_lat[3:0]};
            end
            else if(ID_cnt == 2) begin               
               AWID_msb_lat  <= {AWID_msb_lat[5:4],AWID_M[3:2], AWID_msb_lat[1:0]};  
            end
            else if(ID_cnt == 3) begin               
               AWID_msb_lat  <= {AWID_msb_lat[5:2],AWID_M[3:2]};  
            end
         end       
         else if(BVALID_M && BREADY_M) begin       // Pop the top two stored ID value
            AWID_msb_lat  <= AWID_msb_lat << 2;  
         end       
         else if(AWVALID_M && AWREADY_M && ID_cnt == 0) begin  // Push the top two stored ID value, push the latest down
            AWID_msb_lat  <= {AWID_M[3:2], AWID_msb_lat[3:0]};  
         end       
         else if(AWVALID_M && AWREADY_M && ID_cnt == 1) begin
            AWID_msb_lat  <= {AWID_msb_lat[5:4],AWID_M[3:2], AWID_msb_lat[1:0]};  
         end       
         else if(AWVALID_M && AWREADY_M && ID_cnt == 2) begin
            AWID_msb_lat  <= {AWID_msb_lat[5:2],AWID_M[3:2]};  
         end       
      end
   end

     end
   endgenerate 

   generate 
     if(WR_ACCEPTANCE == 2) begin

   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         AWID_msb_lat     <= 'h0;         
      end
      else begin         
         if(AWVALID_M && AWREADY_M && BVALID_M && BREADY_M) begin
            if(ID_cnt == 0) begin               
               AWID_msb_lat  <= AWID_msb_lat << 2;  
            end
            else if(ID_cnt == 1) begin               
               AWID_msb_lat  <= {AWID_M[3:2], AWID_msb_lat[1:0]};
            end
            else if(ID_cnt == 2) begin               
               AWID_msb_lat  <= {AWID_msb_lat[3:2],AWID_M[3:2]};  
            end
         end       
         else if(BVALID_M && BREADY_M) begin       // Pop the top two stored ID value
            AWID_msb_lat  <= AWID_msb_lat << 2;  
         end       
         else if(AWVALID_M && AWREADY_M && ID_cnt == 0) begin  // Push the top two stored ID value, push the latest down
            AWID_msb_lat  <= {AWID_M[3:2], AWID_msb_lat[1:0]};  
         end       
         else if(AWVALID_M && AWREADY_M && ID_cnt == 1) begin
            AWID_msb_lat  <= {AWID_msb_lat[3:2],AWID_M[3:2]};  
         end       
      end
   end

     end
   endgenerate 

   generate 
     if(WR_ACCEPTANCE == 1) begin

   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         AWID_msb_lat     <= 'h0;         
      end
      else begin         
         if(BVALID_M && BREADY_M) begin       // Pop the top two stored ID value
            AWID_msb_lat  <= AWID_msb_lat << 2;  
         end       
         else if(AWVALID_M && AWREADY_M && ID_cnt == 0) begin  // Push the top two stored ID value, push the latest down
            AWID_msb_lat  <= AWID_M[3:2];  
         end       
      end
   end

     end
   endgenerate 

   // Dec 10 -v3.2.9
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         ID_cnt     <= 0;         
      end
      else begin
         if(AWVALID_M && AWREADY_M && BVALID_M && BREADY_M) begin
            ID_cnt  <= ID_cnt;
         end       
         else if(BVALID_M && BREADY_M) begin
            ID_cnt  <= ID_cnt - 1'b1;
         end       
         else if(AWVALID_M && AWREADY_M) begin
            ID_cnt  <= ID_cnt + 1'b1;
         end
      end
   end
  // --

   
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         ARID_msb_lat     <= 'h0;         
      end
      else begin
         if(ARVALID_M && ARREADY_M) begin
            ARID_msb_lat  <= ARID_M[3:2];  
         end
      end
   end

   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         BID_M_r     <= 'h0;         
         BVALID_M_r  <= 'h0;      
         BRESP_M_r   <= 'h0;     
      end
      else begin
         BID_M_r     <= BID_M;         
         BVALID_M_r  <= BVALID_M;      
         BRESP_M_r   <= BRESP_M;     
      end
   end

   //-------------------------------------------------------------
   // Generate output to the arbiter to enable
   // This enables the arbiter to end the grant given to 
   // the current master
   //-------------------------------------------------------------
   assign master_rd_end = mst_rd_end;   
   assign master_wr_end = mst_wr_end;
   
   //---------------------------------------------------------------------------
   // ID Calculations
   //---------------------------------------------------------------------------

   // --------------------------------------------------------------------------
   // Write address channel ID assignment towards the Interconnect
   // The master replaces the bit 3 adn bit 2 with its unique master ID.
   // --------------------------------------------------------------------------
   assign AWID_int = {AWID_M[3:2],UID_WIDTH,AWID_M[1:0]};
   
   // Read address channel ID assignment towards the Interconnect
   assign ARID_int = {ARID_M[3:2],UID_WIDTH,ARID_M[1:0]};

   // Write data channel ID assignment towards the Interconnect
   assign WID_int = {WID_M[3:2],UID_WIDTH,WID_M[1:0]};

   // --------------------------------------------------------------------------


   // ***************************************************************************   
   // --------------------------------------------------------------------------
   // Configure the read acceptance limit
   // --------------------------------------------------------------------------
   assign rd_acceptance_limit = (RD_ACCEPTANCE == 4) ? 4'b0100 : ((RD_ACCEPTANCE == 3) ? 4'b0011 : 
                                                                  ((RD_ACCEPTANCE == 2) ?  4'b0010 : 
                                                                   ((RD_ACCEPTANCE == 1) ? 4'b0001: 
                                                                    4'b0001)));

   // v3.2 For SAR#69878
   assign wr_acceptance_limit = (WR_ACCEPTANCE == 4) ? 4'b0100 : ((WR_ACCEPTANCE == 3) ? 4'b0011 : 
                                                                  ((WR_ACCEPTANCE == 2) ?  4'b0010 : 
                                                                   ((WR_ACCEPTANCE == 1) ? 4'b0001: 
                                                                    4'b0001))); 

   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         rd_rdcntr <= 4'h0;
         rd_ren_flag <= 1'b0;
      end
      else begin
         rd_rdcntr <= 4'h0;
      end
   end

   // v3.2 For SAR#69878
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         wr_rdcntr <= 4'h0;
         wr_ren_flag <= 1'b0;
      end
      else begin
         wr_rdcntr <= 4'h0;
      end
   end

   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         add_rdtran <= 1'b0;
      end
      else begin
          if(add_rdtran == 1'b1) begin
             add_rdtran <= 1'b0;
          end
          else if(RLAST_M && RREADY_M && RVALID_M && ARVALID_M && ARREADY_M) begin
             add_rdtran <= 1'b1;
          end
      end
  end

  // v3.2 For SAR#69878
  always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         add_wrtran <= 1'b0;
      end
      else begin
          if(add_wrtran == 1'b1) begin
             add_wrtran <= 1'b0;
          end
          else if(BREADY_M && BVALID_M && AWVALID_M && AWREADY_M) begin
             add_wrtran <= 1'b1;
          end
      end
  end


   // --------------------------------------------------------------------------
   // rd_wdcntr: Counter logic to keep track of the number of outstanding reads.
   // It increments on every occurence of ARVALID and ARREADY until the
   // outstanding read limit is reached. If the limit is reached then any further
   // reads are stalled.
   // It decrements the last read data.
   // --------------------------------------------------------------------------
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         rd_wdcntr <= 4'h0;
         rd_wen_flag <= 1'b0;
      end
      else begin
         if (RLAST_M && RREADY_M && RVALID_M && ARVALID_M && ARREADY_M) begin    
            rd_wdcntr <= rd_wdcntr;
         end
         else if ((RLAST_M == 1'b1 && RVALID_M == 1'b1 && RREADY_M == 1'b1)) begin  
            rd_wdcntr <= rd_wdcntr - 1'b1;
         end
         else if ((ARVALID_M == 1'b1 && ARREADY_M == 1'b1 && (rd_wdcntr != rd_acceptance_limit) && (!stall_trans && !stall_trans_rd))) begin  
            rd_wdcntr <= rd_wdcntr + 1'b1;
            rd_wen_flag <= 1'b1;
         end
      end
    end

  // v3.2 For SAR#69878
  always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         wr_wdcntr <= 4'h0;
         wr_wen_flag <= 1'b0;
      end
      else begin
         if (BREADY_M && BVALID_M && AWVALID_M && AWREADY_M) begin    
            wr_wdcntr <= wr_wdcntr;
         end
         else if ((BVALID_M == 1'b1 && BREADY_M == 1'b1)) begin  
            wr_wdcntr <= wr_wdcntr - 1'b1;
         end
         else if ((AWVALID_M == 1'b1 && AWREADY_M == 1'b1 && (wr_wdcntr != wr_acceptance_limit) && (!stall_trans1 && !stall_trans_wr))) begin  
            wr_wdcntr <= wr_wdcntr + 1'b1;
            wr_wen_flag <= 1'b1;
         end
      end
    end
   // --

   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         rdtrans_inprog_r <= 1'b0;
      end
      else begin
         rdtrans_inprog_r <= rdtrans_inprog;
     end
   end    

   // v3.2 For SAR#69878
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         wrtrans_inprog_r <= 1'b0;
      end
      else begin
         wrtrans_inprog_r <= wrtrans_inprog;
     end
   end    
   // --

   generate   // Added to address huge slave issue
      if(MEMSPACE > 0) begin

   // --------------------------------------------------------------------------
   // Cyclic dependency scheme for read addresses
   // Slave scheme is employed in this module. This scheme prevents a deadlock 
   // prevention scheme in an interconnect that is connected to a slave that
   // reorders the read data.
   // This scheme accepts or stalls new transactions based on the following rules:
   //   - A master can initiate a transaction to any slave if the master has no
   // outstanding transactions.
   //   - If master does have outstanding transactions then:
   //     a master can initiate a transaction to same slave as the current
   // outstanding transaction.
   // --------------------------------------------------------------------------
   always @(posedge ACLK or negedge aresetn)    begin
      if((!aresetn) || (!sresetn)) begin
         stall_trans <= 1'b0;
      end
      else begin
         if(ARVALID_M == 1'b1 && prev_ARADDR[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] != ARADDR_M[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] && rdtrans_inprog == 1'b1) begin
           stall_trans <= 1'b1;
         end
         else begin
           stall_trans <= 1'b0;
         end
      end
   end

   always @(*) begin
      if(rdtrans_inprog && prev_ARADDR[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] != ARADDR_M[AXI_AWIDTH - 1 : AXI_AWIDTH - 4]) begin
         stall_trans_rd = 1'b1;
      end
      else begin
         stall_trans_rd = 1'b0;
      end
   end
   
   // v3.2 For SAR#69878 --
   always @(posedge ACLK or negedge aresetn)    begin
      if((!aresetn) || (!sresetn)) begin
         stall_trans1 <= 1'b0;
      end
      else begin
         if(AWVALID_M == 1'b1 && prev_AWADDR[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] != AWADDR_M[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] && wrtrans_inprog == 1'b1) begin
           stall_trans1 <= 1'b1;
         end
         else begin
           stall_trans1 <= 1'b0;
         end
      end
   end

   always @(*) begin
      if(wrtrans_inprog && prev_AWADDR[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] != AWADDR_M[AXI_AWIDTH - 1 : AXI_AWIDTH - 4]) begin
         stall_trans_wr = 1'b1;
      end
      else begin
         stall_trans_wr = 1'b0;
      end
   end

      end // if (MEMSPACE > 0)
   endgenerate
   
   generate   // Added to address huge slave issue
      if(MEMSPACE == 0 && ADDR_HGS_CFG == 0) begin

   // --------------------------------------------------------------------------
   // Cyclic dependency scheme for read addresses
   // Slave scheme is employed in this module. This scheme prevents a deadlock 
   // prevention scheme in an interconnect that is connected to a slave that
   // reorders the read data.
   // This scheme accepts or stalls new transactions based on the following rules:
   //   - A master can initiate a transaction to any slave if the master has no
   // outstanding transactions.
   //   - If master does have outstanding transactions then:
   //     a master can initiate a transaction to same slave as the current
   // outstanding transaction.
   // --------------------------------------------------------------------------
   always @(posedge ACLK or negedge aresetn)    begin
      if((!aresetn) || (!sresetn)) begin
         stall_trans <= 1'b0;
      end
      else begin
         if(ARVALID_M == 1'b1 && ARADDR_M[31] == 1'b0 && prev_ARADDR[31 : 28] != ARADDR_M[31 : 28] && rdtrans_inprog == 1'b1) begin
           stall_trans <= 1'b1;
         end
         else if(ARVALID_M == 1'b1 && ARADDR_M[31] == 1'b1 && prev_ARADDR[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] != ARADDR_M[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] && rdtrans_inprog == 1'b1) begin
           stall_trans <= 1'b1;
         end
         else begin
           stall_trans <= 1'b0;
         end
      end
   end

   always @(*) begin
      if(rdtrans_inprog && prev_ARADDR[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] != ARADDR_M[AXI_AWIDTH - 1 : AXI_AWIDTH - 4]) begin
         stall_trans_rd = 1'b1;
      end
      else begin
         stall_trans_rd = 1'b0;
      end
   end
   
   // v3.2 For SAR#69878 --
   always @(posedge ACLK or negedge aresetn)    begin
      if((!aresetn) || (!sresetn)) begin
         stall_trans1 <= 1'b0;
      end
      else begin
         if(AWVALID_M == 1'b1 && AWADDR_M[31] == 1'b0 && prev_AWADDR[31 : 28] != AWADDR_M[31 : 28] && wrtrans_inprog == 1'b1) begin
           stall_trans1 <= 1'b1;
         end
         else if(AWVALID_M == 1'b1 && AWADDR_M[31] == 1'b1 && prev_AWADDR[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] != AWADDR_M[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] && wrtrans_inprog == 1'b1) begin
           stall_trans1 <= 1'b1;
         end
         else begin
           stall_trans1 <= 1'b0;
         end
      end
   end

   always @(*) begin
      if(wrtrans_inprog && prev_AWADDR[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] != AWADDR_M[AXI_AWIDTH - 1 : AXI_AWIDTH - 4]) begin
         stall_trans_wr = 1'b1;
      end
      else begin
         stall_trans_wr = 1'b0;
      end
   end

      end // if (MEMSPACE == 0 && ADDR_HGS_CFG == 0)      
   endgenerate

   generate   // Added to address huge slave issue
      if(MEMSPACE == 0 && ADDR_HGS_CFG == 1) begin

   // --------------------------------------------------------------------------
   // Cyclic dependency scheme for read addresses
   // Slave scheme is employed in this module. This scheme prevents a deadlock 
   // prevention scheme in an interconnect that is connected to a slave that
   // reorders the read data.
   // This scheme accepts or stalls new transactions based on the following rules:
   //   - A master can initiate a transaction to any slave if the master has no
   // outstanding transactions.
   //   - If master does have outstanding transactions then:
   //     a master can initiate a transaction to same slave as the current
   // outstanding transaction.
   // --------------------------------------------------------------------------
   always @(posedge ACLK or negedge aresetn)    begin
      if((!aresetn) || (!sresetn)) begin
         stall_trans <= 1'b0;
      end
      else begin
         if(ARVALID_M == 1'b1 && ARADDR_M[31] == 1'b1 && prev_ARADDR[31 : 28] != ARADDR_M[31 : 28] && rdtrans_inprog == 1'b1) begin
           stall_trans <= 1'b1;
         end
         else if(ARVALID_M == 1'b1 && ARADDR_M[31] == 1'b0 && prev_ARADDR[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] != ARADDR_M[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] && rdtrans_inprog == 1'b1) begin
           stall_trans <= 1'b1;
         end
         else begin
           stall_trans <= 1'b0;
         end
      end
   end

   always @(*) begin
      if(rdtrans_inprog && prev_ARADDR[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] != ARADDR_M[AXI_AWIDTH - 1 : AXI_AWIDTH - 4]) begin
         stall_trans_rd = 1'b1;
      end
      else begin
         stall_trans_rd = 1'b0;
      end
   end
   
   // v3.2 For SAR#69878 --
      always @(posedge ACLK or negedge aresetn)    begin
      if((!aresetn) || (!sresetn)) begin
         stall_trans1 <= 1'b0;
      end
      else begin
         if(AWVALID_M == 1'b1 && AWADDR_M[31] == 1'b1 && prev_AWADDR[31 : 28] != AWADDR_M[31 : 28] && wrtrans_inprog == 1'b1) begin
           stall_trans1 <= 1'b1;
         end
         else if(AWVALID_M == 1'b1 && AWADDR_M[31] == 1'b0 && prev_AWADDR[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] != AWADDR_M[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] && wrtrans_inprog == 1'b1) begin
           stall_trans1 <= 1'b1;
         end
         else begin
           stall_trans1 <= 1'b0;
         end
      end
   end

   always @(*) begin
      if(wrtrans_inprog && prev_AWADDR[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] != AWADDR_M[AXI_AWIDTH - 1 : AXI_AWIDTH - 4]) begin
         stall_trans_wr = 1'b1;
      end
      else begin
         stall_trans_wr = 1'b0;
      end
   end


      end // if (MEMSPACE == 0 && ADDR_HGS_CFG == 1)      
   endgenerate


   always @(posedge ACLK or negedge aresetn)    begin
      if((!aresetn) || (!sresetn)) begin
         rdtrans_inprog       <= 1'b0;
      end
      else begin
         if(RVALID_M && RREADY_M && RLAST_M && ((rd_wdcntr - (rd_rdcntr+1'b1)) == 4'h0)) begin
            rdtrans_inprog    <= 1'b0;
         end
         else if((ARVALID_M && ARREADY_M) || add_rdtran) begin 
            rdtrans_inprog    <= 1'b1;
         end
      end
   end

   // v3.2 For SAR#69878
   always @(posedge ACLK or negedge aresetn)    begin
      if((!aresetn) || (!sresetn)) begin
         wrtrans_inprog       <= 1'b0;
      end
      else begin
         if(WVALID_M && WREADY_M && WLAST_M) begin
            wrtrans_inprog    <= 1'b0;
         end
         else if(AWVALID_M && wrtrans_inprog) begin
            wrtrans_inprog    <= 1'b1;
         end
         else if((AWVALID_M && AWREADY_M) || add_wrtran) begin 
            wrtrans_inprog    <= 1'b1;
         end

      end
   end   
   // ***************************************************************************   

   // v3.2.12 - For lock xfers

   always @(posedge ACLK or negedge aresetn)    begin
      if((!aresetn) || (!sresetn)) begin
         mst_rd_inprog       <= 1'b0;
      end
      else begin
         if(RVALID_M && RREADY_M && RLAST_M) begin
            mst_rd_inprog    <= 1'b0;
         end
         else if((ARVALID_M && ARREADY_M) || add_rdtran) begin 
            mst_rd_inprog    <= 1'b1;
         end
      end
   end


   always @(posedge ACLK or negedge aresetn)    begin
      if((!aresetn) || (!sresetn)) begin
         mst_wr_inprog       <= 1'b0;
      end
      else begin
          if(BVALID_M && BREADY_M) begin
            mst_wr_inprog    <= 1'b0;
         end
         else if(AWVALID_M && wrtrans_inprog) begin
            mst_wr_inprog    <= 1'b1;
         end
         else if((AWVALID_M && AWREADY_M) || add_wrtran) begin 
            mst_wr_inprog    <= 1'b1;
         end

      end
   end   
   
endmodule // axi_master_stage


   /////////////////////////////////////////////////////////////////////////////
   //                               End - of - Code                           //
   /////////////////////////////////////////////////////////////////////////////
