// ****************************************************************************/
// Actel Corporation Proprietary and Confidential
// Copyright 2010 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: axi_feedthrough.v
// This file is used in SingleMaster-Single Slave mode. It is only wire
// connection betweem master and slave.
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
module axi_feedthrough (
                        // Global signals
                        ACLK,
                        ARESETN,

                        // MASTER 0
                        // AXI MASTER 0 write address channel signals
                        AWID_M0,
                        AWADDR_M0,
                        AWLEN_M0,
                        AWSIZE_M0,
                        AWBURST_M0,
                        AWLOCK_M0,
                        AWCACHE_M0,
                        AWPROT_M0,
                        AWVALID_M0,
                        AWREADY_M0,
                        // AXI MASTER 0 write data channel signals
                        WID_M0,
                        WDATA_M0,
                        WSTRB_M0,
                        WLAST_M0,
                            WVALID_M0,
                        WREADY_M0,
                        // AXI MASTER 0 write response channel signals
                        BID_M0,
                        BRESP_M0,
                        BVALID_M0,
                        BREADY_M0,
                        // AXI MASTER 0 read address channel signals
                        ARID_M0,
                        ARADDR_M0,
                        ARLEN_M0,
                        ARSIZE_M0,
                        ARBURST_M0,
                        ARLOCK_M0,
                        ARCACHE_M0,
                        ARPROT_M0,
                        ARVALID_M0,
                        ARREADY_M0,
                            // AXI MASTER 0 read response channel signals
                        RID_M0,
                        RDATA_M0,
                        RRESP_M0,
                        RLAST_M0,
                        RVALID_M0,
                        RREADY_M0,
                        
                        
                        // SLAVE 0
                        // AXI SLAVE 0 write address channel signals
                        AWID_S0,
                        AWADDR_S0,
                        AWLEN_S0,
                        AWSIZE_S0,
                        AWBURST_S0,
                        AWLOCK_S0,
                        AWCACHE_S0,
                        AWPROT_S0,
                        AWVALID_S0,
                        AWREADY_S0,
                        // AXI SLAVE 0 write data channel signals
                        WID_S0,
                        WDATA_S0,
                        WSTRB_S0,
                        WLAST_S0,
                        WVALID_S0,
                        WREADY_S0,
                        // AXI SLAVE 0 write response channel signals
                        BID_S0,
                        BRESP_S0,
                        BVALID_S0,
                        BREADY_S0,
                        // AXI SLAVE 0 read address channel signals
                        ARID_S0,
                        ARADDR_S0,
                        ARLEN_S0,
                        ARSIZE_S0,
                        ARBURST_S0,
                        ARLOCK_S0,
                        ARCACHE_S0,
                        ARPROT_S0,
                        ARVALID_S0,
                        ARREADY_S0,
                        // AXI SLAVE 0 read response channel signals
                        RID_S0,
                        RDATA_S0,
                        RRESP_S0,
                        RLAST_S0,
                        RVALID_S0,
                        RREADY_S0
 
                        );

   // --------------------------------------------------------------------------
   // Parameter Declaration
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

   parameter BASE_ID_WIDTH        = 2;
   parameter SYNC_RESET           = 0;

   localparam AXI_STRBWIDTH       = AXI_DWIDTH/8;

   // --------------------------------------------------------------------------
   // I/O Declaration
   // --------------------------------------------------------------------------

   // Global signals
   input                        ACLK;
   input                        ARESETN;

   // MASTER 0
   // AXI MASTER 0 write address channel signals
   input  [ID_WIDTH-1:0]        AWID_M0;
   input  [31:0]      AWADDR_M0;
   input  [3:0]                 AWLEN_M0;
   input  [2:0]                 AWSIZE_M0;
   input  [1:0]                 AWBURST_M0;
   input  [1:0]                 AWLOCK_M0;
   input  [3:0]                 AWCACHE_M0;
   input  [2:0]                 AWPROT_M0;
   input                        AWVALID_M0;
   output                       AWREADY_M0;
   // AXI MASTER 0 write data channel signals
   input  [ID_WIDTH-1:0]        WID_M0;
   input  [AXI_DWIDTH-1:0]      WDATA_M0;
   input  [AXI_STRBWIDTH-1:0]   WSTRB_M0;
   input                        WLAST_M0;
   input                        WVALID_M0;
   output                       WREADY_M0;
   // AXI MASTER 0 write response channel signals
   output [ID_WIDTH-1:0]        BID_M0;
   output [1:0]                 BRESP_M0;
   output                       BVALID_M0;
   input                        BREADY_M0;
   // AXI MASTER 0 read address channel signals
   input  [ID_WIDTH-1:0]        ARID_M0;
   input  [31:0]      ARADDR_M0;
   input  [3:0]                 ARLEN_M0;
   input  [2:0]                 ARSIZE_M0;
   input  [1:0]                 ARBURST_M0;
   input  [1:0]                 ARLOCK_M0;
   input  [3:0]                 ARCACHE_M0;
   input  [2:0]                 ARPROT_M0;
   input                        ARVALID_M0;
   output                       ARREADY_M0;
   // AXI MASTER 0 read response channel signals
   output [ID_WIDTH-1:0]        RID_M0;
   output [AXI_DWIDTH-1:0]      RDATA_M0;
   output [1:0]                 RRESP_M0;
   output                       RLAST_M0;
   output                       RVALID_M0;
   input                        RREADY_M0;


   // SLAVE 0
   // AXI SLAVE 0 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S0;
   output [31:0]      AWADDR_S0;
   output [3:0]                 AWLEN_S0;
   output [2:0]                 AWSIZE_S0;
   output [1:0]                 AWBURST_S0;
   output [1:0]                 AWLOCK_S0;
   output [3:0]                 AWCACHE_S0;
   output [2:0]                 AWPROT_S0;
   output                       AWVALID_S0;
   input                        AWREADY_S0;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S0;
   output [AXI_DWIDTH-1:0]      WDATA_S0;
   output [AXI_STRBWIDTH-1:0]   WSTRB_S0;
   output                       WLAST_S0;
   output                       WVALID_S0;
   input                        WREADY_S0;
   // AXI SLAVE 0 write response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S0;
   input  [1:0]                 BRESP_S0;
   input                        BVALID_S0;
   output                       BREADY_S0;
   // AXI SLAVE 0 read address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S0;
   output [31:0]      ARADDR_S0;
   output [3:0]                 ARLEN_S0;
   output [2:0]                 ARSIZE_S0;
   output [1:0]                 ARBURST_S0;
   output [1:0]                 ARLOCK_S0;
   output [3:0]                 ARCACHE_S0;
   output [2:0]                 ARPROT_S0;
   output                       ARVALID_S0;
   input                        ARREADY_S0;
   // AXI SLAVE 0 read response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S0;
   input  [AXI_DWIDTH-1:0]      RDATA_S0;
   input  [1:0]                 RRESP_S0;
   input                        RLAST_S0;
   input                        RVALID_S0;
   output                       RREADY_S0;

   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------
   // AXI write address channel signals
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_S0;
   wire [31:0]        AWADDR_S0;
   wire [3:0]                   AWLEN_S0;
   wire [2:0]                   AWSIZE_S0;
   wire [1:0]                   AWBURST_S0;
   wire [1:0]                   AWLOCK_S0;
   wire [3:0]                   AWCACHE_S0;
   wire [2:0]                   AWPROT_S0;
   wire                         AWVALID_S0;
   wire                         AWREADY_M0;
   // AXI write data channel signals
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_S0;
   wire [AXI_DWIDTH-1:0]        WDATA_S0;
   wire [AXI_STRBWIDTH-1:0]     WSTRB_S0;
   wire                         WLAST_S0;
   wire                         WVALID_S0;
   wire                         WREADY_M0;
   // AXI write response channel signals
   wire                         BREADY_S0;
   // AXI read address channel signals
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_S0;
   wire [31:0]       ARADDR_S0;
   wire [3:0]                  ARLEN_S0;
   wire [2:0]                  ARSIZE_S0;
   wire [1:0]                  ARBURST_S0;
   wire [1:0]                  ARLOCK_S0;
   wire [3:0]                  ARCACHE_S0;
   wire [2:0]                  ARPROT_S0;
   wire                        ARVALID_S0;
   wire                        ARREADY_M0;
   // AXI read data channel signals
   wire [ID_WIDTH-1:0]         RID_M0;
   wire [AXI_DWIDTH-1:0]       RDATA_M0;
   wire [1:0]                  RRESP_M0;
   wire                        RLAST_M0;
   wire                        RVALID_M0;
   wire                        RREADY_S0;
   wire                        aresetn;
   wire                        sresetn;

   /////////////////////////////////////////////////////////////////////////////
   //                               Start - of - Code                         //
   /////////////////////////////////////////////////////////////////////////////

   // --------------------------------------------------------------------------
   // resets
   // --------------------------------------------------------------------------
   assign aresetn   = (SYNC_RESET == 1) ? 1'b1  : ARESETN;
   assign sresetn   = (SYNC_RESET == 1) ? ARESETN : 1'b1;

   // ************************************************************************//
   // For Single Master - Single Slave Cfg and FEED_THROUGH = 1 --- Start     //  
   // ************************************************************************//

   // --------------------------------------------------------------------------
   // Feedthrough mode
   // This is direct wire connection between the master and slave. It consumes no
   // logic.
   // --------------------------------------------------------------------------
   // SLAVE 0
   // AXI SLAVE 0 write address channel signals
   assign AWID_S0    = AWID_M0;
   assign AWADDR_S0  = AWADDR_M0;
   assign AWLEN_S0   = AWLEN_M0;
   assign AWSIZE_S0  = AWSIZE_M0;
   assign AWBURST_S0 = AWBURST_M0;
   assign AWLOCK_S0  = AWLOCK_M0;
   assign AWCACHE_S0 = AWCACHE_M0;
   assign AWPROT_S0  = AWPROT_M0;
   assign AWVALID_S0 = AWVALID_M0;
   assign AWREADY_M0 = AWREADY_S0;
   // AXI SLAVE 0 write data channel signals
   assign WID_S0     = WID_M0;
   assign WDATA_S0   = WDATA_M0;
   assign WSTRB_S0   = WSTRB_M0;
   assign WLAST_S0   = WLAST_M0;
   assign WVALID_S0  = WVALID_M0;
   assign WREADY_M0  = WREADY_S0;
   // AXI SLAVE 0 write response channel signals
   assign BID_M0     = BID_S0;
   assign BRESP_M0   = BRESP_S0;
   assign BVALID_M0  = BVALID_S0;
   assign BREADY_S0  = BREADY_M0;
   // AXI SLAVE 0 read address channel signals
   assign ARID_S0    = ARID_M0;
   assign ARADDR_S0  = ARADDR_M0;
   assign ARLEN_S0   = ARLEN_M0;
   assign ARSIZE_S0  = ARSIZE_M0;
   assign ARBURST_S0 = ARBURST_M0;
   assign ARLOCK_S0  = ARLOCK_M0;
   assign ARCACHE_S0 = ARCACHE_M0;
   assign ARPROT_S0  = ARPROT_M0;
   assign ARVALID_S0 = ARVALID_M0;
   assign ARREADY_M0 = ARREADY_S0;
   // AXI SLAVE 0 read response channel signals
   assign RID_M0     = RID_S0;
   assign RDATA_M0   = RDATA_S0;
   assign RRESP_M0   = RRESP_S0;
   assign RLAST_M0   = RLAST_S0;
   assign RVALID_M0  = RVALID_S0;
   assign RREADY_S0  = RREADY_M0;

   // ************************************************************************//
   // For Single Master - Single Slave Cfg and FEED_THROUGH = 1 --- End       //  
   // ************************************************************************//

endmodule // axi_feedthrough

   /////////////////////////////////////////////////////////////////////////////
   //                               End - of - Code                           //
   /////////////////////////////////////////////////////////////////////////////

