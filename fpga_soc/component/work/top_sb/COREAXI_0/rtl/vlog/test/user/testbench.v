// ****************************************************************************/
// Microsemi Corporation Proprietary and Confidential
// Copyright 2015 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: CoreAXI - Testbench 
//
// SVN Revision Information:
// SVN $Revision: 25692 $
// SVN $Date: 2015-12-09 15:13:32 +0530 (Wed, 09 Dec 2015) $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
//
// ****************************************************************************/
`timescale 1ns/1ps

module testbench ();
`include "../../../../coreparameters.v"

    localparam AXI_STRBWIDTH      = 8;
    localparam AXI_CLK_PERIOD     = 1.25;
    localparam BASE_ID_WIDTH      = 2;
    // Global signals
    reg                          ACLK;
    reg                          ARESETN;

    // MASTER 0
    // AXI MASTER 0 write address channel signals
    wire   [ID_WIDTH - 1:0]                 AWID_M0;
    wire   [31:0]      AWADDR_M0;
    wire   [3:0]                 AWLEN_M0;
    wire   [2:0]                 AWSIZE_M0;
    wire   [1:0]                 AWBURST_M0;
    wire   [1:0]                 AWLOCK_M0;
    wire   [3:0]                 AWCACHE_M0;
    wire   [2:0]                 AWPROT_M0;
    wire                         AWVALID_M0;
    wire                         AWREADY_M0;
    // AXI MASTER 0 write data channel signals
    wire   [ID_WIDTH - 1:0]                 WID_M0;
    wire   [63:0]      WDATA_M0;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_M0;
    wire                         WLAST_M0;
    wire                         WVALID_M0;
    wire                         WREADY_M0;
    // AXI MASTER 0 write response channel signals
    wire   [ID_WIDTH - 1:0]                 BID_M0;
    wire   [1:0]                 BRESP_M0;
    wire                         BVALID_M0;
    wire                         BREADY_M0;
    // AXI MASTER 0 read address channel signals
    wire   [ID_WIDTH - 1:0]                 ARID_M0;
    wire   [31:0]      ARADDR_M0;
    wire   [3:0]                 ARLEN_M0;
    wire   [2:0]                 ARSIZE_M0;
    wire   [1:0]                 ARBURST_M0;
    wire   [1:0]                 ARLOCK_M0;
    wire   [3:0]                 ARCACHE_M0;
    wire   [2:0]                 ARPROT_M0;
    wire                         ARVALID_M0;
    wire                         ARREADY_M0;
    // AXI MASTER 0 read response channel signals
    wire   [ID_WIDTH - 1:0]                 RID_M0;
    wire   [63:0]      RDATA_M0;
    wire   [1:0]                 RRESP_M0;
    wire                         RLAST_M0;
    wire                         RVALID_M0;
    wire                         RREADY_M0;

    // MASTER 1
    // AXI MASTER 0 write address channel signals
    wire   [ID_WIDTH - 1:0]                 AWID_M1;
    wire   [31:0]      AWADDR_M1;
    wire   [3:0]                 AWLEN_M1;
    wire   [2:0]                 AWSIZE_M1;
    wire   [1:0]                 AWBURST_M1;
    wire   [1:0]                 AWLOCK_M1;
    wire   [3:0]                 AWCACHE_M1;
    wire   [2:0]                 AWPROT_M1;
    wire                         AWVALID_M1;
    wire                         AWREADY_M1;
    // AXI MASTER 0 write data channel signals
    wire   [ID_WIDTH - 1:0]                 WID_M1;
    wire   [63:0]      WDATA_M1;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_M1;
    wire                         WLAST_M1;
    wire                         WVALID_M1;
    wire                         WREADY_M1;
    // AXI MASTER 0 write response channel signals
    wire   [ID_WIDTH - 1:0]                 BID_M1;
    wire   [1:0]                 BRESP_M1;
    wire                         BVALID_M1;
    wire                         BREADY_M1;
    // AXI MASTER 0 read address channel signals
    wire   [ID_WIDTH - 1:0]                 ARID_M1;
    wire   [31:0]      ARADDR_M1;
    wire   [3:0]                 ARLEN_M1;
    wire   [2:0]                 ARSIZE_M1;
    wire   [1:0]                 ARBURST_M1;
    wire   [1:0]                 ARLOCK_M1;
    wire   [3:0]                 ARCACHE_M1;
    wire   [2:0]                 ARPROT_M1;
    wire                         ARVALID_M1;
    wire                         ARREADY_M1;
    // AXI MASTER 0 read response channel signals
    wire   [ID_WIDTH - 1:0]                 RID_M1;
    wire   [63:0]      RDATA_M1;
    wire   [1:0]                 RRESP_M1;
    wire                         RLAST_M1;
    wire                         RVALID_M1;
    wire                         RREADY_M1;

    // MASTER 2
    // AXI MASTER 0 write address channel signals
    wire   [ID_WIDTH - 1:0]                 AWID_M2;
    wire   [31:0]      AWADDR_M2;
    wire   [3:0]                 AWLEN_M2;
    wire   [2:0]                 AWSIZE_M2;
    wire   [1:0]                 AWBURST_M2;
    wire   [1:0]                 AWLOCK_M2;
    wire   [3:0]                 AWCACHE_M2;
    wire   [2:0]                 AWPROT_M2;
    wire                         AWVALID_M2;
    wire                         AWREADY_M2;
    // AXI MASTER 0 write data channel signals
    wire   [ID_WIDTH - 1:0]                 WID_M2;
    wire   [63:0]      WDATA_M2;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_M2;
    wire                         WLAST_M2;
    wire                         WVALID_M2;
    wire                         WREADY_M2;
    // AXI MASTER 0 write response channel signals
    wire   [ID_WIDTH - 1:0]                 BID_M2;
    wire   [1:0]                 BRESP_M2;
    wire                         BVALID_M2;
    wire                         BREADY_M2;
    // AXI MASTER 0 read address channel signals
    wire   [ID_WIDTH - 1:0]                 ARID_M2;
    wire   [31:0]      ARADDR_M2;
    wire   [3:0]                 ARLEN_M2;
    wire   [2:0]                 ARSIZE_M2;
    wire   [1:0]                 ARBURST_M2;
    wire   [1:0]                 ARLOCK_M2;
    wire   [3:0]                 ARCACHE_M2;
    wire   [2:0]                 ARPROT_M2;
    wire                         ARVALID_M2;
    wire                         ARREADY_M2;
    // AXI MASTER 0 read response channel signals
    wire   [ID_WIDTH - 1:0]                 RID_M2;
    wire   [63:0]      RDATA_M2;
    wire   [1:0]                 RRESP_M2;
    wire                         RLAST_M2;
    wire                         RVALID_M2;
    wire                         RREADY_M2;

    // MASTER 3
    // AXI MASTER 0 write address channel signals
    wire   [ID_WIDTH - 1:0]                 AWID_M3;
    wire   [31:0]      AWADDR_M3;
    wire   [3:0]                 AWLEN_M3;
    wire   [2:0]                 AWSIZE_M3;
    wire   [1:0]                 AWBURST_M3;
    wire   [1:0]                 AWLOCK_M3;
    wire   [3:0]                 AWCACHE_M3;
    wire   [2:0]                 AWPROT_M3;
    wire                         AWVALID_M3;
    wire                         AWREADY_M3;
    // AXI MASTER 0 write data channel signals
    wire   [ID_WIDTH - 1:0]                 WID_M3;
    wire   [63:0]      WDATA_M3;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_M3;
    wire                         WLAST_M3;
    wire                         WVALID_M3;
    wire                         WREADY_M3;
    // AXI MASTER 0 write response channel signals
    wire   [ID_WIDTH - 1:0]                 BID_M3;
    wire   [1:0]                 BRESP_M3;
    wire                         BVALID_M3;
    wire                         BREADY_M3;
    // AXI MASTER 0 read address channel signals
    wire   [ID_WIDTH - 1:0]                 ARID_M3;
    wire   [31:0]      ARADDR_M3;
    wire   [3:0]                 ARLEN_M3;
    wire   [2:0]                 ARSIZE_M3;
    wire   [1:0]                 ARBURST_M3;
    wire   [1:0]                 ARLOCK_M3;
    wire   [3:0]                 ARCACHE_M3;
    wire   [2:0]                 ARPROT_M3;
    wire                         ARVALID_M3;
    wire                         ARREADY_M3;
    // AXI MASTER 0 read response channel signals
    wire   [ID_WIDTH - 1:0]                 RID_M3;
    wire   [63:0]      RDATA_M3;
    wire   [1:0]                 RRESP_M3;
    wire                         RLAST_M3;
    wire                         RVALID_M3;
    wire                         RREADY_M3;


    // SLAVE 0
    // AXI SLAVE 0 write address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S0;
    wire   [31:0]      AWADDR_S0;
    wire   [3:0]                 AWLEN_S0;
    wire   [2:0]                 AWSIZE_S0;
    wire   [1:0]                 AWBURST_S0;
    wire   [1:0]                 AWLOCK_S0;
    wire   [3:0]                 AWCACHE_S0;
    wire   [2:0]                 AWPROT_S0;
    wire                         AWVALID_S0;
    wire                         AWREADY_S0;
    // AXI SLAVE 0 write data channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S0;
    wire   [63:0]      WDATA_S0;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_S0;
    wire                         WLAST_S0;
    wire                         WVALID_S0;
    wire                         WREADY_S0;
    // AXI SLAVE 0 write response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S0;
    wire   [1:0]                 BRESP_S0;
    wire                         BVALID_S0;
    wire                         BREADY_S0;
    // AXI SLAVE 0 read address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S0;
    wire   [31:0]      ARADDR_S0;
    wire   [3:0]                 ARLEN_S0;
    wire   [2:0]                 ARSIZE_S0;
    wire   [1:0]                 ARBURST_S0;
    wire   [1:0]                 ARLOCK_S0;
    wire   [3:0]                 ARCACHE_S0;
    wire   [2:0]                 ARPROT_S0;
    wire                         ARVALID_S0;
    wire                         ARREADY_S0;
    // AXI SLAVE 0 read response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S0;
    wire   [63:0]      RDATA_S0;
    wire   [1:0]                 RRESP_S0;
    wire                         RLAST_S0;
    wire                         RVALID_S0;
    wire                         RREADY_S0;

    // SLAVE 1
    // AXI SLAVE 1 write address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S1;
    wire   [31:0]      AWADDR_S1;
    wire   [3:0]                 AWLEN_S1;
    wire   [2:0]                 AWSIZE_S1;
    wire   [1:0]                 AWBURST_S1;
    wire   [1:0]                 AWLOCK_S1;
    wire   [3:0]                 AWCACHE_S1;
    wire   [2:0]                 AWPROT_S1;
    wire                         AWVALID_S1;
    wire                         AWREADY_S1;
    // AXI SLAVE 0 write data channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S1;
    wire   [63:0]      WDATA_S1;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_S1;
    wire                         WLAST_S1;
    wire                         WVALID_S1;
    wire                         WREADY_S1;
    // AXI SLAVE 0 write response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S1;
    wire   [1:0]                 BRESP_S1;
    wire                         BVALID_S1;
    wire                         BREADY_S1;
    // AXI SLAVE 0 read address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S1;
    wire   [31:0]      ARADDR_S1;
    wire   [3:0]                 ARLEN_S1;
    wire   [2:0]                 ARSIZE_S1;
    wire   [1:0]                 ARBURST_S1;
    wire   [1:0]                 ARLOCK_S1;
    wire   [3:0]                 ARCACHE_S1;
    wire   [2:0]                 ARPROT_S1;
    wire                         ARVALID_S1;
    wire                         ARREADY_S1;
    // AXI SLAVE 0 read response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S1;
    wire   [63:0]      RDATA_S1;
    wire   [1:0]                 RRESP_S1;
    wire                         RLAST_S1;
    wire                         RVALID_S1;
    wire                         RREADY_S1;

    // SLAVE 2
    // AXI SLAVE 2 write address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S2;
    wire   [31:0]      AWADDR_S2;
    wire   [3:0]                 AWLEN_S2;
    wire   [2:0]                 AWSIZE_S2;
    wire   [1:0]                 AWBURST_S2;
    wire   [1:0]                 AWLOCK_S2;
    wire   [3:0]                 AWCACHE_S2;
    wire   [2:0]                 AWPROT_S2;
    wire                         AWVALID_S2;
    wire                         AWREADY_S2;
    // AXI SLAVE 0 write data channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S2;
    wire   [63:0]      WDATA_S2;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_S2;
    wire                         WLAST_S2;
    wire                         WVALID_S2;
    wire                         WREADY_S2;
    // AXI SLAVE 0 write response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S2;
    wire   [1:0]                 BRESP_S2;
    wire                         BVALID_S2;
    wire                         BREADY_S2;
    // AXI SLAVE 0 read address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S2;
    wire   [31:0]      ARADDR_S2;
    wire   [3:0]                 ARLEN_S2;
    wire   [2:0]                 ARSIZE_S2;
    wire   [1:0]                 ARBURST_S2;
    wire   [1:0]                 ARLOCK_S2;
    wire   [3:0]                 ARCACHE_S2;
    wire   [2:0]                 ARPROT_S2;
    wire                         ARVALID_S2;
    wire                         ARREADY_S2;
    // AXI SLAVE 0 read response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S2;
    wire   [63:0]      RDATA_S2;
    wire   [1:0]                 RRESP_S2;
    wire                         RLAST_S2;
    wire                         RVALID_S2;
    wire                         RREADY_S2;

    // SLAVE 3
    // AXI SLAVE 3 write address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S3;
    wire   [31:0]      AWADDR_S3;
    wire   [3:0]                 AWLEN_S3;
    wire   [2:0]                 AWSIZE_S3;
    wire   [1:0]                 AWBURST_S3;
    wire   [1:0]                 AWLOCK_S3;
    wire   [3:0]                 AWCACHE_S3;
    wire   [2:0]                 AWPROT_S3;
    wire                         AWVALID_S3;
    wire                         AWREADY_S3;
    // AXI SLAVE 0 write data channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S3;
    wire   [63:0]      WDATA_S3;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_S3;
    wire                         WLAST_S3;
    wire                         WVALID_S3;
    wire                         WREADY_S3;
    // AXI SLAVE 0 write response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S3;
    wire   [1:0]                 BRESP_S3;
    wire                         BVALID_S3;
    wire                         BREADY_S3;
    // AXI SLAVE 0 read address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S3;
    wire   [31:0]      ARADDR_S3;
    wire   [3:0]                 ARLEN_S3;
    wire   [2:0]                 ARSIZE_S3;
    wire   [1:0]                 ARBURST_S3;
    wire   [1:0]                 ARLOCK_S3;
    wire   [3:0]                 ARCACHE_S3;
    wire   [2:0]                 ARPROT_S3;
    wire                         ARVALID_S3;
    wire                         ARREADY_S3;
    // AXI SLAVE 0 read response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S3;
    wire   [63:0]      RDATA_S3;
    wire   [1:0]                 RRESP_S3;
    wire                         RLAST_S3;
    wire                         RVALID_S3;
    wire                         RREADY_S3;

    // SLAVE 4
    // AXI SLAVE 4 write address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S4;
    wire   [31:0]      AWADDR_S4;
    wire   [3:0]                 AWLEN_S4;
    wire   [2:0]                 AWSIZE_S4;
    wire   [1:0]                 AWBURST_S4;
    wire   [1:0]                 AWLOCK_S4;
    wire   [3:0]                 AWCACHE_S4;
    wire   [2:0]                 AWPROT_S4;
    wire                         AWVALID_S4;
    wire                         AWREADY_S4;
    // AXI SLAVE 0 write data channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S4;
    wire   [63:0]      WDATA_S4;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_S4;
    wire                         WLAST_S4;
    wire                         WVALID_S4;
    wire                         WREADY_S4;
    // AXI SLAVE 0 write response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S4;
    wire   [1:0]                 BRESP_S4;
    wire                         BVALID_S4;
    wire                         BREADY_S4;
    // AXI SLAVE 0 read address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S4;
    wire   [31:0]      ARADDR_S4;
    wire   [3:0]                 ARLEN_S4;
    wire   [2:0]                 ARSIZE_S4;
    wire   [1:0]                 ARBURST_S4;
    wire   [1:0]                 ARLOCK_S4;
    wire   [3:0]                 ARCACHE_S4;
    wire   [2:0]                 ARPROT_S4;
    wire                         ARVALID_S4;
    wire                         ARREADY_S4;
    // AXI SLAVE 0 read response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S4;
    wire   [63:0]      RDATA_S4;
    wire   [1:0]                 RRESP_S4;
    wire                         RLAST_S4;
    wire                         RVALID_S4;
    wire                         RREADY_S4;

    // SLAVE 5
    // AXI SLAVE 5 write address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S5;
    wire   [31:0]      AWADDR_S5;
    wire   [3:0]                 AWLEN_S5;
    wire   [2:0]                 AWSIZE_S5;
    wire   [1:0]                 AWBURST_S5;
    wire   [1:0]                 AWLOCK_S5;
    wire   [3:0]                 AWCACHE_S5;
    wire   [2:0]                 AWPROT_S5;
    wire                         AWVALID_S5;
    wire                         AWREADY_S5;
    // AXI SLAVE 0 write data channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S5;
    wire   [63:0]      WDATA_S5;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_S5;
    wire                         WLAST_S5;
    wire                         WVALID_S5;
    wire                         WREADY_S5;
    // AXI SLAVE 0 write response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S5;
    wire   [1:0]                 BRESP_S5;
    wire                         BVALID_S5;
    wire                         BREADY_S5;
    // AXI SLAVE 0 read address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S5;
    wire   [31:0]      ARADDR_S5;
    wire   [3:0]                 ARLEN_S5;
    wire   [2:0]                 ARSIZE_S5;
    wire   [1:0]                 ARBURST_S5;
    wire   [1:0]                 ARLOCK_S5;
    wire   [3:0]                 ARCACHE_S5;
    wire   [2:0]                 ARPROT_S5;
    wire                         ARVALID_S5;
    wire                         ARREADY_S5;
    // AXI SLAVE 0 read response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S5;
    wire   [63:0]      RDATA_S5;
    wire   [1:0]                 RRESP_S5;
    wire                         RLAST_S5;
    wire                         RVALID_S5;
    wire                         RREADY_S5;

    // SLAVE 6
    // AXI SLAVE 6 write address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S6;
    wire   [31:0]      AWADDR_S6;
    wire   [3:0]                 AWLEN_S6;
    wire   [2:0]                 AWSIZE_S6;
    wire   [1:0]                 AWBURST_S6;
    wire   [1:0]                 AWLOCK_S6;
    wire   [3:0]                 AWCACHE_S6;
    wire   [2:0]                 AWPROT_S6;
    wire                         AWVALID_S6;
    wire                         AWREADY_S6;
    // AXI SLAVE 0 write data channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S6;
    wire   [63:0]      WDATA_S6;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_S6;
    wire                         WLAST_S6;
    wire                         WVALID_S6;
    wire                         WREADY_S6;
    // AXI SLAVE 0 write response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S6;
    wire   [1:0]                 BRESP_S6;
    wire                         BVALID_S6;
    wire                         BREADY_S6;
    // AXI SLAVE 0 read address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S6;
    wire   [31:0]      ARADDR_S6;
    wire   [3:0]                 ARLEN_S6;
    wire   [2:0]                 ARSIZE_S6;
    wire   [1:0]                 ARBURST_S6;
    wire   [1:0]                 ARLOCK_S6;
    wire   [3:0]                 ARCACHE_S6;
    wire   [2:0]                 ARPROT_S6;
    wire                         ARVALID_S6;
    wire                         ARREADY_S6;
    // AXI SLAVE 0 read response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S6;
    wire   [63:0]      RDATA_S6;
    wire   [1:0]                 RRESP_S6;
    wire                         RLAST_S6;
    wire                         RVALID_S6;
    wire                         RREADY_S6;

    // SLAVE 7
    // AXI SLAVE 7 write address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S7;
    wire   [31:0]      AWADDR_S7;
    wire   [3:0]                 AWLEN_S7;
    wire   [2:0]                 AWSIZE_S7;
    wire   [1:0]                 AWBURST_S7;
    wire   [1:0]                 AWLOCK_S7;
    wire   [3:0]                 AWCACHE_S7;
    wire   [2:0]                 AWPROT_S7;
    wire                         AWVALID_S7;
    wire                         AWREADY_S7;
    // AXI SLAVE 0 write data channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S7;
    wire   [63:0]      WDATA_S7;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_S7;
    wire                         WLAST_S7;
    wire                         WVALID_S7;
    wire                         WREADY_S7;
    // AXI SLAVE 0 write response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S7;
    wire   [1:0]                 BRESP_S7;
    wire                         BVALID_S7;
    wire                         BREADY_S7;
    // AXI SLAVE 0 read address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S7;
    wire   [31:0]      ARADDR_S7;
    wire   [3:0]                 ARLEN_S7;
    wire   [2:0]                 ARSIZE_S7;
    wire   [1:0]                 ARBURST_S7;
    wire   [1:0]                 ARLOCK_S7;
    wire   [3:0]                 ARCACHE_S7;
    wire   [2:0]                 ARPROT_S7;
    wire                         ARVALID_S7;
    wire                         ARREADY_S7;
    // AXI SLAVE 0 read response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S7;
    wire   [63:0]      RDATA_S7;
    wire   [1:0]                 RRESP_S7;
    wire                         RLAST_S7;
    wire                         RVALID_S7;
    wire                         RREADY_S7;

    // SLAVE 8
    // AXI SLAVE 8 write address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S8;
    wire   [31:0]      AWADDR_S8;
    wire   [3:0]                 AWLEN_S8;
    wire   [2:0]                 AWSIZE_S8;
    wire   [1:0]                 AWBURST_S8;
    wire   [1:0]                 AWLOCK_S8;
    wire   [3:0]                 AWCACHE_S8;
    wire   [2:0]                 AWPROT_S8;
    wire                         AWVALID_S8;
    wire                         AWREADY_S8;
    // AXI SLAVE 0 write data channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S8;
    wire   [63:0]      WDATA_S8;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_S8;
    wire                         WLAST_S8;
    wire                         WVALID_S8;
    wire                         WREADY_S8;
    // AXI SLAVE 0 write response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S8;
    wire   [1:0]                 BRESP_S8;
    wire                         BVALID_S8;
    wire                         BREADY_S8;
    // AXI SLAVE 0 read address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S8;
    wire   [31:0]      ARADDR_S8;
    wire   [3:0]                 ARLEN_S8;
    wire   [2:0]                 ARSIZE_S8;
    wire   [1:0]                 ARBURST_S8;
    wire   [1:0]                 ARLOCK_S8;
    wire   [3:0]                 ARCACHE_S8;
    wire   [2:0]                 ARPROT_S8;
    wire                         ARVALID_S8;
    wire                         ARREADY_S8;
    // AXI SLAVE 0 read response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S8;
    wire   [63:0]      RDATA_S8;
    wire   [1:0]                 RRESP_S8;
    wire                         RLAST_S8;
    wire                         RVALID_S8;
    wire                         RREADY_S8;

    // SLAVE 9
    // AXI SLAVE 9 write address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S9;
    wire   [31:0]      AWADDR_S9;
    wire   [3:0]                 AWLEN_S9;
    wire   [2:0]                 AWSIZE_S9;
    wire   [1:0]                 AWBURST_S9;
    wire   [1:0]                 AWLOCK_S9;
    wire   [3:0]                 AWCACHE_S9;
    wire   [2:0]                 AWPROT_S9;
    wire                         AWVALID_S9;
    wire                         AWREADY_S9;
    // AXI SLAVE 0 write data channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S9;
    wire   [63:0]      WDATA_S9;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_S9;
    wire                         WLAST_S9;
    wire                         WVALID_S9;
    wire                         WREADY_S9;
    // AXI SLAVE 0 write response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S9;
    wire   [1:0]                 BRESP_S9;
    wire                         BVALID_S9;
    wire                         BREADY_S9;
    // AXI SLAVE 0 read address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S9;
    wire   [31:0]      ARADDR_S9;
    wire   [3:0]                 ARLEN_S9;
    wire   [2:0]                 ARSIZE_S9;
    wire   [1:0]                 ARBURST_S9;
    wire   [1:0]                 ARLOCK_S9;
    wire   [3:0]                 ARCACHE_S9;
    wire   [2:0]                 ARPROT_S9;
    wire                         ARVALID_S9;
    wire                         ARREADY_S9;
    // AXI SLAVE 0 read response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S9;
    wire   [63:0]      RDATA_S9;
    wire   [1:0]                 RRESP_S9;
    wire                         RLAST_S9;
    wire                         RVALID_S9;
    wire                         RREADY_S9;

    // SLAVE 10
    // AXI SLAVE 10 write address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S10;
    wire   [31:0]      AWADDR_S10;
    wire   [3:0]                 AWLEN_S10;
    wire   [2:0]                 AWSIZE_S10;
    wire   [1:0]                 AWBURST_S10;
    wire   [1:0]                 AWLOCK_S10;
    wire   [3:0]                 AWCACHE_S10;
    wire   [2:0]                 AWPROT_S10;
    wire                         AWVALID_S10;
    wire                         AWREADY_S10;
    // AXI SLAVE 0 write data channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S10;
    wire   [63:0]      WDATA_S10;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_S10;
    wire                         WLAST_S10;
    wire                         WVALID_S10;
    wire                         WREADY_S10;
    // AXI SLAVE 0 write response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S10;
    wire   [1:0]                 BRESP_S10;
    wire                         BVALID_S10;
    wire                         BREADY_S10;
    // AXI SLAVE 0 read address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S10;
    wire   [31:0]      ARADDR_S10;
    wire   [3:0]                 ARLEN_S10;
    wire   [2:0]                 ARSIZE_S10;
    wire   [1:0]                 ARBURST_S10;
    wire   [1:0]                 ARLOCK_S10;
    wire   [3:0]                 ARCACHE_S10;
    wire   [2:0]                 ARPROT_S10;
    wire                         ARVALID_S10;
    wire                         ARREADY_S10;
    // AXI SLAVE 0 read response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S10;
    wire   [63:0]      RDATA_S10;
    wire   [1:0]                 RRESP_S10;
    wire                         RLAST_S10;
    wire                         RVALID_S10;
    wire                         RREADY_S10;

    // SLAVE 11
    // AXI SLAVE 11 write address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S11;
    wire   [31:0]      AWADDR_S11;
    wire   [3:0]                 AWLEN_S11;
    wire   [2:0]                 AWSIZE_S11;
    wire   [1:0]                 AWBURST_S11;
    wire   [1:0]                 AWLOCK_S11;
    wire   [3:0]                 AWCACHE_S11;
    wire   [2:0]                 AWPROT_S11;
    wire                         AWVALID_S11;
    wire                         AWREADY_S11;
    // AXI SLAVE 0 write data channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S11;
    wire   [63:0]      WDATA_S11;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_S11;
    wire                         WLAST_S11;
    wire                         WVALID_S11;
    wire                         WREADY_S11;
    // AXI SLAVE 0 write response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S11;
    wire   [1:0]                 BRESP_S11;
    wire                         BVALID_S11;
    wire                         BREADY_S11;
    // AXI SLAVE 0 read address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S11;
    wire   [31:0]      ARADDR_S11;
    wire   [3:0]                 ARLEN_S11;
    wire   [2:0]                 ARSIZE_S11;
    wire   [1:0]                 ARBURST_S11;
    wire   [1:0]                 ARLOCK_S11;
    wire   [3:0]                 ARCACHE_S11;
    wire   [2:0]                 ARPROT_S11;
    wire                         ARVALID_S11;
    wire                         ARREADY_S11;
    // AXI SLAVE 0 read response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S11;
    wire   [63:0]      RDATA_S11;
    wire   [1:0]                 RRESP_S11;
    wire                         RLAST_S11;
    wire                         RVALID_S11;
    wire                         RREADY_S11;

    // SLAVE 12
    // AXI SLAVE 12 write address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S12;
    wire   [31:0]      AWADDR_S12;
    wire   [3:0]                 AWLEN_S12;
    wire   [2:0]                 AWSIZE_S12;
    wire   [1:0]                 AWBURST_S12;
    wire   [1:0]                 AWLOCK_S12;
    wire   [3:0]                 AWCACHE_S12;
    wire   [2:0]                 AWPROT_S12;
    wire                         AWVALID_S12;
    wire                         AWREADY_S12;
    // AXI SLAVE 0 write data channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S12;
    wire   [63:0]      WDATA_S12;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_S12;
    wire                         WLAST_S12;
    wire                         WVALID_S12;
    wire                         WREADY_S12;
    // AXI SLAVE 0 write response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S12;
    wire   [1:0]                 BRESP_S12;
    wire                         BVALID_S12;
    wire                         BREADY_S12;
    // AXI SLAVE 0 read address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S12;
    wire   [31:0]      ARADDR_S12;
    wire   [3:0]                 ARLEN_S12;
    wire   [2:0]                 ARSIZE_S12;
    wire   [1:0]                 ARBURST_S12;
    wire   [1:0]                 ARLOCK_S12;
    wire   [3:0]                 ARCACHE_S12;
    wire   [2:0]                 ARPROT_S12;
    wire                         ARVALID_S12;
    wire                         ARREADY_S12;
    // AXI SLAVE 0 read response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S12;
    wire   [63:0]      RDATA_S12;
    wire   [1:0]                 RRESP_S12;
    wire                         RLAST_S12;
    wire                         RVALID_S12;
    wire                         RREADY_S12;

    // SLAVE 13
    // AXI SLAVE 13 write address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S13;
    wire   [31:0]      AWADDR_S13;
    wire   [3:0]                 AWLEN_S13;
    wire   [2:0]                 AWSIZE_S13;
    wire   [1:0]                 AWBURST_S13;
    wire   [1:0]                 AWLOCK_S13;
    wire   [3:0]                 AWCACHE_S13;
    wire   [2:0]                 AWPROT_S13;
    wire                         AWVALID_S13;
    wire                         AWREADY_S13;
    // AXI SLAVE 0 write data channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S13;
    wire   [63:0]      WDATA_S13;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_S13;
    wire                         WLAST_S13;
    wire                         WVALID_S13;
    wire                         WREADY_S13;
    // AXI SLAVE 0 write response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S13;
    wire   [1:0]                 BRESP_S13;
    wire                         BVALID_S13;
    wire                         BREADY_S13;
    // AXI SLAVE 0 read address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S13;
    wire   [31:0]      ARADDR_S13;
    wire   [3:0]                 ARLEN_S13;
    wire   [2:0]                 ARSIZE_S13;
    wire   [1:0]                 ARBURST_S13;
    wire   [1:0]                 ARLOCK_S13;
    wire   [3:0]                 ARCACHE_S13;
    wire   [2:0]                 ARPROT_S13;
    wire                         ARVALID_S13;
    wire                         ARREADY_S13;
    // AXI SLAVE 0 read response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S13;
    wire   [63:0]      RDATA_S13;
    wire   [1:0]                 RRESP_S13;
    wire                         RLAST_S13;
    wire                         RVALID_S13;
    wire                         RREADY_S13;

    // SLAVE 14
    // AXI SLAVE 14 write address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S14;
    wire   [31:0]      AWADDR_S14;
    wire   [3:0]                 AWLEN_S14;
    wire   [2:0]                 AWSIZE_S14;
    wire   [1:0]                 AWBURST_S14;
    wire   [1:0]                 AWLOCK_S14;
    wire   [3:0]                 AWCACHE_S14;
    wire   [2:0]                 AWPROT_S14;
    wire                         AWVALID_S14;
    wire                         AWREADY_S14;
    // AXI SLAVE 0 write data channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S14;
    wire   [63:0]      WDATA_S14;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_S14;
    wire                         WLAST_S14;
    wire                         WVALID_S14;
    wire                         WREADY_S14;
    // AXI SLAVE 0 write response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S14;
    wire   [1:0]                 BRESP_S14;
    wire                         BVALID_S14;
    wire                         BREADY_S14;
    // AXI SLAVE 0 read address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S14;
    wire   [31:0]      ARADDR_S14;
    wire   [3:0]                 ARLEN_S14;
    wire   [2:0]                 ARSIZE_S14;
    wire   [1:0]                 ARBURST_S14;
    wire   [1:0]                 ARLOCK_S14;
    wire   [3:0]                 ARCACHE_S14;
    wire   [2:0]                 ARPROT_S14;
    wire                         ARVALID_S14;
    wire                         ARREADY_S14;
    // AXI SLAVE 0 read response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S14;
    wire   [63:0]      RDATA_S14;
    wire   [1:0]                 RRESP_S14;
    wire                         RLAST_S14;
    wire                         RVALID_S14;
    wire                         RREADY_S14;

    // SLAVE 15
    // AXI SLAVE 15 write address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S15;
    wire   [31:0]      AWADDR_S15;
    wire   [3:0]                 AWLEN_S15;
    wire   [2:0]                 AWSIZE_S15;
    wire   [1:0]                 AWBURST_S15;
    wire   [1:0]                 AWLOCK_S15;
    wire   [3:0]                 AWCACHE_S15;
    wire   [2:0]                 AWPROT_S15;
    wire                         AWVALID_S15;
    wire                         AWREADY_S15;
    // AXI SLAVE 0 write data channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S15;
    wire   [63:0]      WDATA_S15;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_S15;
    wire                         WLAST_S15;
    wire                         WVALID_S15;
    wire                         WREADY_S15;
    // AXI SLAVE 0 write response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S15;
    wire   [1:0]                 BRESP_S15;
    wire                         BVALID_S15;
    wire                         BREADY_S15;
    // AXI SLAVE 0 read address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S15;
    wire   [31:0]      ARADDR_S15;
    wire   [3:0]                 ARLEN_S15;
    wire   [2:0]                 ARSIZE_S15;
    wire   [1:0]                 ARBURST_S15;
    wire   [1:0]                 ARLOCK_S15;
    wire   [3:0]                 ARCACHE_S15;
    wire   [2:0]                 ARPROT_S15;
    wire                         ARVALID_S15;
    wire                         ARREADY_S15;
    // AXI SLAVE 0 read response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S15;
    wire   [63:0]      RDATA_S15;
    wire   [1:0]                 RRESP_S15;
    wire                         RLAST_S15;
    wire                         RVALID_S15;
    wire                         RREADY_S15;

    // SLAVE 16
    // AXI SLAVE 15 write address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S16;
    wire   [31:0]      AWADDR_S16;
    wire   [3:0]                 AWLEN_S16;
    wire   [2:0]                 AWSIZE_S16;
    wire   [1:0]                 AWBURST_S16;
    wire   [1:0]                 AWLOCK_S16;
    wire   [3:0]                 AWCACHE_S16;
    wire   [2:0]                 AWPROT_S16;
    wire                         AWVALID_S16;
    wire                         AWREADY_S16;
    // AXI SLAVE 0 write data channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S16;
    wire   [63:0]      WDATA_S16;
    wire   [AXI_STRBWIDTH-1:0]   WSTRB_S16;
    wire                         WLAST_S16;
    wire                         WVALID_S16;
    wire                         WREADY_S16;
    // AXI SLAVE 0 write response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S16;
    wire   [1:0]                 BRESP_S16;
    wire                         BVALID_S16;
    wire                         BREADY_S16;
    // AXI SLAVE 0 read address channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S16;
    wire   [31:0]      ARADDR_S16;
    wire   [3:0]                 ARLEN_S16;
    wire   [2:0]                 ARSIZE_S16;
    wire   [1:0]                 ARBURST_S16;
    wire   [1:0]                 ARLOCK_S16;
    wire   [3:0]                 ARCACHE_S16;
    wire   [2:0]                 ARPROT_S16;
    wire                         ARVALID_S16;
    wire                         ARREADY_S16;
    // AXI SLAVE 0 read response channel signals
    wire   [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S16;
    wire   [63:0]      RDATA_S16;
    wire   [1:0]                 RRESP_S16;
    wire                         RLAST_S16;
    wire                         RVALID_S16;
    wire                         RREADY_S16;

    initial begin
        ACLK = 0;
        ARESETN = 0;
    end

    always begin
        #AXI_CLK_PERIOD ACLK = ~ACLK;
    end

    initial begin
        #100 ARESETN = 1;
        @(posedge ACLK);
	if(M0_SLAVE0ENABLE == 1) begin
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'h00000000,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'h00000004,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
#100         @(posedge ACLK);
                master_0.axi_read(
                                    4'b0000,       // ARID
                                    'h00000000,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
#100         @(posedge ACLK);
               master_0.axi_read(
                                    4'b0000,       // ARID
                                    'h00000004,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M0_SLAVE1ENABLE == 1) begin
                master_0.axi_write(
                                    4'b0001,       // AWID
                                    'h11111110,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_0.axi_write(
                                    4'b0001,       // AWID
                                    'h11111114,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
#100         @(posedge ACLK);
                master_0.axi_read(
                                    4'b0001,       // ARID
                                    'h11111110,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
#100         @(posedge ACLK);
               master_0.axi_read(
                                    4'b0001,       // ARID
                                    'h11111114,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M0_SLAVE2ENABLE == 1) begin
                master_0.axi_write(
                                    4'b0010,       // AWID
                                    'h22222220,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_0.axi_write(
                                    4'b0010,       // AWID
                                    'h22222224,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
#100         @(posedge ACLK);
                master_0.axi_read(
                                    4'b0010,       // ARID
                                    'h22222220,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
#100         @(posedge ACLK);
               master_0.axi_read(
                                    4'b0010,       // ARID
                                    'h22222224,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M0_SLAVE3ENABLE == 1) begin
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'h33333330,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'h33333334,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_0.axi_read(
                                    4'b0000,       // ARID
                                    'h33333330,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_0.axi_read(
                                    4'b0000,       // ARID
                                    'h33333334,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end
   
	if(M0_SLAVE4ENABLE == 1) begin
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'h44444440,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'h444444444,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_0.axi_read(
                                    4'b0000,       // ARID
                                    'h44444440,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_0.axi_read(
                                    4'b0000,       // ARID
                                    'h44444444,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end     

        if(M0_SLAVE5ENABLE == 1) begin
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'h55555550,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'h55555554,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_0.axi_read(
                                    4'b0000,       // ARID
                                    'h55555550,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_0.axi_read(
                                    4'b0000,       // ARID
                                    'h55555554,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M0_SLAVE6ENABLE == 1) begin
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'h66666660,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'h66666664,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_0.axi_read(
                                    4'b0000,       // ARID
                                    'h66666660,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_0.axi_read(
                                    4'b0000,       // ARID
                                    'h66666664,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M0_SLAVE7ENABLE == 1) begin
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'h77777770,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'h77777774,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_0.axi_read(
                                    4'b0000,       // ARID
                                    'h77777770,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_0.axi_read(
                                    4'b0000,       // ARID
                                    'h77777774,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M0_SLAVE8ENABLE == 1) begin
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'h88888880,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'h88888884,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_0.axi_read(
                                    4'b0000,       // ARID
                                    'h88888880,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_0.axi_read(
                                    4'b0000,       // ARID
                                    'h88888884,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M0_SLAVE9ENABLE == 1) begin
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'h99999990,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'h99999994,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_0.axi_read(
                                    4'b0000,       // ARID
                                    'h99999990,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_0.axi_read(
                                    4'b0000,       // ARID
                                    'h99999994,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end
  
	  if(M0_SLAVE10ENABLE == 1) begin
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'hAAAAAAA0,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'hAAAAAAA4,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_0.axi_read(
                                    4'b0000,       // ARID
                                    'hAAAAAAA0,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_0.axi_read(
                                    4'b0000,       // ARID
                                    'hAAAAAAA4,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

        if(M0_SLAVE11ENABLE == 1) begin
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'hbbbbbbb0,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'hbbbbbbb4,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_0.axi_read(
                                    4'b0000,       // ARID
                                    'hbbbbbbb0,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_0.axi_read(
                                    4'b0000,       // ARID
                                    'hbbbbbbb4,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M0_SLAVE12ENABLE == 1) begin
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'hccccccc0,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'hccccccc4,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_0.axi_read(
                                    4'b0000,       // ARID
                                    'hccccccc0,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_0.axi_read(
                                    4'b0000,       // ARID
                                    'hccccccc4,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

      if(M0_SLAVE13ENABLE == 1) begin
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'hddddddd0,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'hddddddd4,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_0.axi_read(
                                    4'b0000,       // ARID
                                    'hddddddd0,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_0.axi_read(
                                    4'b0000,       // ARID
                                    'hddddddd4,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M0_SLAVE14ENABLE == 1) begin
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'heeeeeee0,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'heeeeeee4,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_0.axi_read(
                                    4'b0000,       // ARID
                                    'heeeeeee0,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_0.axi_read(
                                    4'b0000,       // ARID
                                    'heeeeeee4,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M0_SLAVE15ENABLE == 1) begin
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'hfffffff0,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_0.axi_write(
                                    4'b0000,       // AWID
                                    'hfffffff4,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_0.axi_read(
                                    4'b0000,       // ARID
                                    'hfffffff0,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_0.axi_read(
                                    4'b0000,       // ARID
                                    'hfffffff4,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

// ---------
// Master 1
// ---------
        #1000 @(posedge ACLK);

	if(M1_SLAVE0ENABLE == 1) begin
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'h0A000000,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'h0A000000,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
#100         @(posedge ACLK);
                master_1.axi_read(
                                    4'b0000,       // ARID
                                    'h0A000000,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
#100         @(posedge ACLK);
               master_1.axi_read(
                                    4'b0000,       // ARID
                                    'h0A000000,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M1_SLAVE1ENABLE == 1) begin
                master_1.axi_write(
                                    4'b0001,       // AWID
                                    'h1111111a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_1.axi_write(
                                    4'b0001,       // AWID
                                    'h1111111b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
#100         @(posedge ACLK);
                master_1.axi_read(
                                    4'b0001,       // ARID
                                    'h1111111a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
#100         @(posedge ACLK);
               master_1.axi_read(
                                    4'b0001,       // ARID
                                    'h1111111b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M1_SLAVE2ENABLE == 1) begin
                master_1.axi_write(
                                    4'b0010,       // AWID
                                    'h2222222a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_1.axi_write(
                                    4'b0010,       // AWID
                                    'h2222222b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
#100         @(posedge ACLK);
                master_1.axi_read(
                                    4'b0010,       // ARID
                                    'h2222222a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
#100         @(posedge ACLK);
               master_1.axi_read(
                                    4'b0010,       // ARID
                                    'h2222222b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M1_SLAVE3ENABLE == 1) begin
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'h33333330,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'h3333333a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_1.axi_read(
                                    4'b0000,       // ARID
                                    'h33333330,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_1.axi_read(
                                    4'b0000,       // ARID
                                    'h33333330,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end
   
	if(M1_SLAVE4ENABLE == 1) begin
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'h4444444b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'h444444440,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_1.axi_read(
                                    4'b0000,       // ARID
                                    'h4444444b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_1.axi_read(
                                    4'b0000,       // ARID
                                    'h44444440,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end     

        if(M1_SLAVE5ENABLE == 1) begin
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'h5555555a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'h5555555b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_1.axi_read(
                                    4'b0000,       // ARID
                                    'h5555555a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_1.axi_read(
                                    4'b0000,       // ARID
                                    'h5555555b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M1_SLAVE6ENABLE == 1) begin
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'h6666666a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'h6666666b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_1.axi_read(
                                    4'b0000,       // ARID
                                    'h6666666a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_1.axi_read(
                                    4'b0000,       // ARID
                                    'h6666666b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M1_SLAVE7ENABLE == 1) begin
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'h7777777a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'h7777777b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_1.axi_read(
                                    4'b0000,       // ARID
                                    'h7777777a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_1.axi_read(
                                    4'b0000,       // ARID
                                    'h7777777b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M1_SLAVE8ENABLE == 1) begin
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'h8888888a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'h8888888b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_1.axi_read(
                                    4'b0000,       // ARID
                                    'h8888888a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_1.axi_read(
                                    4'b0000,       // ARID
                                    'h8888888b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M1_SLAVE9ENABLE == 1) begin
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'h9999999a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'h9999999b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_1.axi_read(
                                    4'b0000,       // ARID
                                    'h9999999a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_1.axi_read(
                                    4'b0000,       // ARID
                                    'h9999999b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end
  
	  if(M1_SLAVE10ENABLE == 1) begin
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'hAAAAAAA0,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'hAAAAAAA2,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_1.axi_read(
                                    4'b0000,       // ARID
                                    'hAAAAAAA0,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_1.axi_read(
                                    4'b0000,       // ARID
                                    'hAAAAAAA2,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

        if(M1_SLAVE11ENABLE == 1) begin
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'hbbbbbbb0,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'hbbbbbbb2,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_1.axi_read(
                                    4'b0000,       // ARID
                                    'hbbbbbbb0,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_1.axi_read(
                                    4'b0000,       // ARID
                                    'hbbbbbbb2,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M1_SLAVE12ENABLE == 1) begin
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'hccccccca,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'hcccccccb,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_1.axi_read(
                                    4'b0000,       // ARID
                                    'hccccccca,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_1.axi_read(
                                    4'b0000,       // ARID
                                    'hcccccccb,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

      if(M1_SLAVE13ENABLE == 1) begin
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'hddddddda,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'hdddddddb,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_1.axi_read(
                                    4'b0000,       // ARID
                                    'hddddddda,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_1.axi_read(
                                    4'b0000,       // ARID
                                    'hdddddddb,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M1_SLAVE14ENABLE == 1) begin
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'heeeeeeea,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'heeeeeeeb,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_1.axi_read(
                                    4'b0000,       // ARID
                                    'heeeeeeea,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_1.axi_read(
                                    4'b0000,       // ARID
                                    'heeeeeeeb,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M1_SLAVE15ENABLE == 1) begin
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'hfffffffa,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_1.axi_write(
                                    4'b0000,       // AWID
                                    'hfffffffb,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_1.axi_read(
                                    4'b0000,       // ARID
                                    'hfffffffa,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_1.axi_read(
                                    4'b0000,       // ARID
                                    'hfffffffb,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

// ---------
// Master 2
// ---------
        #1000 @(posedge ACLK);

	if(M2_SLAVE0ENABLE == 1) begin
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'h0A000000,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'h0A000000,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
#100         @(posedge ACLK);
                master_2.axi_read(
                                    4'b0000,       // ARID
                                    'h0A000000,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
#100         @(posedge ACLK);
               master_2.axi_read(
                                    4'b0000,       // ARID
                                    'h0A000000,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M2_SLAVE1ENABLE == 1) begin
                master_2.axi_write(
                                    4'b0001,       // AWID
                                    'h1111111a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_2.axi_write(
                                    4'b0001,       // AWID
                                    'h1111111b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
#100         @(posedge ACLK);
                master_2.axi_read(
                                    4'b0001,       // ARID
                                    'h1111111a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
#100         @(posedge ACLK);
               master_2.axi_read(
                                    4'b0001,       // ARID
                                    'h1111111b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M2_SLAVE2ENABLE == 1) begin
                master_2.axi_write(
                                    4'b0010,       // AWID
                                    'h2222222a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_2.axi_write(
                                    4'b0010,       // AWID
                                    'h2222222b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
#100         @(posedge ACLK);
                master_2.axi_read(
                                    4'b0010,       // ARID
                                    'h2222222a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
#100         @(posedge ACLK);
               master_2.axi_read(
                                    4'b0010,       // ARID
                                    'h2222222b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M2_SLAVE3ENABLE == 1) begin
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'h33333330,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'h3333333a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_2.axi_read(
                                    4'b0000,       // ARID
                                    'h33333330,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_2.axi_read(
                                    4'b0000,       // ARID
                                    'h33333330,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end
   
	if(M2_SLAVE4ENABLE == 1) begin
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'h4444444b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'h444444440,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_2.axi_read(
                                    4'b0000,       // ARID
                                    'h4444444b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_2.axi_read(
                                    4'b0000,       // ARID
                                    'h44444440,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end     

        if(M2_SLAVE5ENABLE == 1) begin
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'h5555555a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'h5555555b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_2.axi_read(
                                    4'b0000,       // ARID
                                    'h5555555a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_2.axi_read(
                                    4'b0000,       // ARID
                                    'h5555555b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M2_SLAVE6ENABLE == 1) begin
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'h6666666a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'h6666666b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_2.axi_read(
                                    4'b0000,       // ARID
                                    'h6666666a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_2.axi_read(
                                    4'b0000,       // ARID
                                    'h6666666b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M2_SLAVE7ENABLE == 1) begin
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'h7777777a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'h7777777b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_2.axi_read(
                                    4'b0000,       // ARID
                                    'h7777777a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_2.axi_read(
                                    4'b0000,       // ARID
                                    'h7777777b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M2_SLAVE8ENABLE == 1) begin
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'h8888888a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'h8888888b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_2.axi_read(
                                    4'b0000,       // ARID
                                    'h8888888a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_2.axi_read(
                                    4'b0000,       // ARID
                                    'h8888888b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M2_SLAVE9ENABLE == 1) begin
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'h9999999a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'h9999999b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_2.axi_read(
                                    4'b0000,       // ARID
                                    'h9999999a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_2.axi_read(
                                    4'b0000,       // ARID
                                    'h9999999b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end
  
	  if(M2_SLAVE10ENABLE == 1) begin
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'hAAAAAAA0,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'hAAAAAAA2,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_2.axi_read(
                                    4'b0000,       // ARID
                                    'hAAAAAAA0,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_2.axi_read(
                                    4'b0000,       // ARID
                                    'hAAAAAAA2,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

        if(M2_SLAVE11ENABLE == 1) begin
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'hbbbbbbb0,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'hbbbbbbb2,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_2.axi_read(
                                    4'b0000,       // ARID
                                    'hbbbbbbb0,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_2.axi_read(
                                    4'b0000,       // ARID
                                    'hbbbbbbb2,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M2_SLAVE12ENABLE == 1) begin
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'hccccccca,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'hcccccccb,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_2.axi_read(
                                    4'b0000,       // ARID
                                    'hccccccca,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_2.axi_read(
                                    4'b0000,       // ARID
                                    'hcccccccb,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

      if(M2_SLAVE13ENABLE == 1) begin
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'hddddddda,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'hdddddddb,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_2.axi_read(
                                    4'b0000,       // ARID
                                    'hddddddda,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_2.axi_read(
                                    4'b0000,       // ARID
                                    'hdddddddb,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M2_SLAVE14ENABLE == 1) begin
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'heeeeeeea,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'heeeeeeeb,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_2.axi_read(
                                    4'b0000,       // ARID
                                    'heeeeeeea,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_2.axi_read(
                                    4'b0000,       // ARID
                                    'heeeeeeeb,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M2_SLAVE15ENABLE == 1) begin
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'hfffffffa,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_2.axi_write(
                                    4'b0000,       // AWID
                                    'hfffffffb,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_2.axi_read(
                                    4'b0000,       // ARID
                                    'hfffffffa,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_2.axi_read(
                                    4'b0000,       // ARID
                                    'hfffffffb,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

// ---------
// Master 3
// ---------
        #1000 @(posedge ACLK);

	if(M3_SLAVE0ENABLE == 1) begin
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'h0A000000,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'h0A000000,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
#100         @(posedge ACLK);
                master_3.axi_read(
                                    4'b0000,       // ARID
                                    'h0A000000,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
#100         @(posedge ACLK);
               master_3.axi_read(
                                    4'b0000,       // ARID
                                    'h0A000000,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M3_SLAVE1ENABLE == 1) begin
                master_3.axi_write(
                                    4'b0001,       // AWID
                                    'h1111111a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_3.axi_write(
                                    4'b0001,       // AWID
                                    'h1111111b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
#100         @(posedge ACLK);
                master_3.axi_read(
                                    4'b0001,       // ARID
                                    'h1111111a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
#100         @(posedge ACLK);
               master_3.axi_read(
                                    4'b0001,       // ARID
                                    'h1111111b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M3_SLAVE2ENABLE == 1) begin
                master_3.axi_write(
                                    4'b0010,       // AWID
                                    'h2222222a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_3.axi_write(
                                    4'b0010,       // AWID
                                    'h2222222b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
#100         @(posedge ACLK);
                master_3.axi_read(
                                    4'b0010,       // ARID
                                    'h2222222a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
#100         @(posedge ACLK);
               master_3.axi_read(
                                    4'b0010,       // ARID
                                    'h2222222b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M3_SLAVE3ENABLE == 1) begin
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'h33333330,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'h3333333a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_3.axi_read(
                                    4'b0000,       // ARID
                                    'h33333330,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_3.axi_read(
                                    4'b0000,       // ARID
                                    'h33333330,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end
   
	if(M3_SLAVE4ENABLE == 1) begin
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'h4444444b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'h444444440,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_3.axi_read(
                                    4'b0000,       // ARID
                                    'h4444444b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_3.axi_read(
                                    4'b0000,       // ARID
                                    'h44444440,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end     

        if(M3_SLAVE5ENABLE == 1) begin
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'h5555555a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'h5555555b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_3.axi_read(
                                    4'b0000,       // ARID
                                    'h5555555a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_3.axi_read(
                                    4'b0000,       // ARID
                                    'h5555555b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M3_SLAVE6ENABLE == 1) begin
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'h6666666a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'h6666666b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_3.axi_read(
                                    4'b0000,       // ARID
                                    'h6666666a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_3.axi_read(
                                    4'b0000,       // ARID
                                    'h6666666b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M3_SLAVE7ENABLE == 1) begin
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'h7777777a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'h7777777b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_3.axi_read(
                                    4'b0000,       // ARID
                                    'h7777777a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_3.axi_read(
                                    4'b0000,       // ARID
                                    'h7777777b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M3_SLAVE8ENABLE == 1) begin
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'h8888888a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'h8888888b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_3.axi_read(
                                    4'b0000,       // ARID
                                    'h8888888a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_3.axi_read(
                                    4'b0000,       // ARID
                                    'h8888888b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M3_SLAVE9ENABLE == 1) begin
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'h9999999a,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'h9999999b,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_3.axi_read(
                                    4'b0000,       // ARID
                                    'h9999999a,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_3.axi_read(
                                    4'b0000,       // ARID
                                    'h9999999b,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end
  
	  if(M3_SLAVE10ENABLE == 1) begin
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'hAAAAAAA0,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'hAAAAAAA2,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_3.axi_read(
                                    4'b0000,       // ARID
                                    'hAAAAAAA0,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_3.axi_read(
                                    4'b0000,       // ARID
                                    'hAAAAAAA2,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

        if(M3_SLAVE11ENABLE == 1) begin
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'hbbbbbbb0,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'hbbbbbbb2,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_3.axi_read(
                                    4'b0000,       // ARID
                                    'hbbbbbbb0,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_3.axi_read(
                                    4'b0000,       // ARID
                                    'hbbbbbbb2,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M3_SLAVE12ENABLE == 1) begin
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'hccccccca,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'hcccccccb,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_3.axi_read(
                                    4'b0000,       // ARID
                                    'hccccccca,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_3.axi_read(
                                    4'b0000,       // ARID
                                    'hcccccccb,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

      if(M3_SLAVE13ENABLE == 1) begin
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'hddddddda,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'hdddddddb,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_3.axi_read(
                                    4'b0000,       // ARID
                                    'hddddddda,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_3.axi_read(
                                    4'b0000,       // ARID
                                    'hdddddddb,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M3_SLAVE14ENABLE == 1) begin
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'heeeeeeea,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'heeeeeeeb,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_3.axi_read(
                                    4'b0000,       // ARID
                                    'heeeeeeea,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_3.axi_read(
                                    4'b0000,       // ARID
                                    'heeeeeeeb,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end

	if(M3_SLAVE15ENABLE == 1) begin
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'hfffffffa,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b10          // AWLOCK 
                );
                master_3.axi_write(
                                    4'b0000,       // AWID
                                    'hfffffffb,  // AWADDR
                                    4'b0000,       // AWLEN
                                    3'b011,        // AWSIZE
                                    2'b01,         // AWBURST
                                    2'b00          // AWLOCK 
                );
                master_3.axi_read(
                                    4'b0000,       // ARID
                                    'hfffffffa,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
               master_3.axi_read(
                                    4'b0000,       // ARID
                                    'hfffffffb,  // ARADDR
                                    4'b0000,       // ARLEN
                                    3'b011,        // ARSIZE
                                    2'b01,         // ARBURST
                                    2'b00          // ARLOCK 
                );
        end
	#200 $finish;


    end

   axi_master # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) master_0 (
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // MASTER
        // AXI MASTER write address channel signals
        ,   .AWID        (AWID_M0)
        ,   .AWADDR      (AWADDR_M0)
        ,   .AWLEN       (AWLEN_M0)
        ,   .AWSIZE      (AWSIZE_M0)
        ,   .AWBURST     (AWBURST_M0)
        ,   .AWLOCK      (AWLOCK_M0)
        ,   .AWCACHE     (AWCACHE_M0)
        ,   .AWPROT      (AWPROT_M0)
        ,   .AWVALID     (AWVALID_M0)
        ,   .AWREADY     (AWREADY_M0)
        // AXI MASTER write data channel signals
        ,   .WID         (WID_M0)
        ,   .WDATA       (WDATA_M0)
        ,   .WSTRB       (WSTRB_M0)
        ,   .WLAST       (WLAST_M0)
        ,   .WVALID      (WVALID_M0)
        ,   .WREADY      (WREADY_M0)
        // AXI MASTER write response channel signals
        ,   .BID         (BID_M0)
        ,   .BRESP       (BRESP_M0)
        ,   .BVALID      (BVALID_M0)
        ,   .BREADY      (BREADY_M0)
        // AXI MASTER read address channel signals
        ,   .ARID        (ARID_M0)
        ,   .ARADDR      (ARADDR_M0)
        ,   .ARLEN       (ARLEN_M0)
        ,   .ARSIZE      (ARSIZE_M0)
        ,   .ARBURST     (ARBURST_M0)
        ,   .ARLOCK      (ARLOCK_M0)
        ,   .ARCACHE     (ARCACHE_M0)
        ,   .ARPROT      (ARPROT_M0)
        ,   .ARVALID     (ARVALID_M0)
        ,   .ARREADY     (ARREADY_M0)
        // AXI MASTER read response channel signals
        ,   .RID         (RID_M0)
        ,   .RDATA       (RDATA_M0)
        ,   .RRESP       (RRESP_M0)
        ,   .RLAST       (RLAST_M0)
        ,   .RVALID      (RVALID_M0)
        ,   .RREADY      (RREADY_M0)
    );

   axi_master # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) master_1 (
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // MASTER
        // AXI MASTER write address channel signals
        ,   .AWID        (AWID_M1)
        ,   .AWADDR      (AWADDR_M1)
        ,   .AWLEN       (AWLEN_M1)
        ,   .AWSIZE      (AWSIZE_M1)
        ,   .AWBURST     (AWBURST_M1)
        ,   .AWLOCK      (AWLOCK_M1)
        ,   .AWCACHE     (AWCACHE_M1)
        ,   .AWPROT      (AWPROT_M1)
        ,   .AWVALID     (AWVALID_M1)
        ,   .AWREADY     (AWREADY_M1)
        // AXI MASTER write data channel signals
        ,   .WID         (WID_M1)
        ,   .WDATA       (WDATA_M1)
        ,   .WSTRB       (WSTRB_M1)
        ,   .WLAST       (WLAST_M1)
        ,   .WVALID      (WVALID_M1)
        ,   .WREADY      (WREADY_M1)
        // AXI MASTER write response channel signals
        ,   .BID         (BID_M1)
        ,   .BRESP       (BRESP_M1)
        ,   .BVALID      (BVALID_M1)
        ,   .BREADY      (BREADY_M1)
        // AXI MASTER read address channel signals
        ,   .ARID        (ARID_M1)
        ,   .ARADDR      (ARADDR_M1)
        ,   .ARLEN       (ARLEN_M1)
        ,   .ARSIZE      (ARSIZE_M1)
        ,   .ARBURST     (ARBURST_M1)
        ,   .ARLOCK      (ARLOCK_M1)
        ,   .ARCACHE     (ARCACHE_M1)
        ,   .ARPROT      (ARPROT_M1)
        ,   .ARVALID     (ARVALID_M1)
        ,   .ARREADY     (ARREADY_M1)
        // AXI MASTER read response channel signals
        ,   .RID         (RID_M1)
        ,   .RDATA       (RDATA_M1)
        ,   .RRESP       (RRESP_M1)
        ,   .RLAST       (RLAST_M1)
        ,   .RVALID      (RVALID_M1)
        ,   .RREADY      (RREADY_M1)
    );

   axi_master # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) master_2 (
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // MASTER
        // AXI MASTER write address channel signals
        ,   .AWID        (AWID_M2)
        ,   .AWADDR      (AWADDR_M2)
        ,   .AWLEN       (AWLEN_M2)
        ,   .AWSIZE      (AWSIZE_M2)
        ,   .AWBURST     (AWBURST_M2)
        ,   .AWLOCK      (AWLOCK_M2)
        ,   .AWCACHE     (AWCACHE_M2)
        ,   .AWPROT      (AWPROT_M2)
        ,   .AWVALID     (AWVALID_M2)
        ,   .AWREADY     (AWREADY_M2)
        // AXI MASTER write data channel signals
        ,   .WID         (WID_M2)
        ,   .WDATA       (WDATA_M2)
        ,   .WSTRB       (WSTRB_M2)
        ,   .WLAST       (WLAST_M2)
        ,   .WVALID      (WVALID_M2)
        ,   .WREADY      (WREADY_M2)
        // AXI MASTER write response channel signals
        ,   .BID         (BID_M2)
        ,   .BRESP       (BRESP_M2)
        ,   .BVALID      (BVALID_M2)
        ,   .BREADY      (BREADY_M2)
        // AXI MASTER read address channel signals
        ,   .ARID        (ARID_M2)
        ,   .ARADDR      (ARADDR_M2)
        ,   .ARLEN       (ARLEN_M2)
        ,   .ARSIZE      (ARSIZE_M2)
        ,   .ARBURST     (ARBURST_M2)
        ,   .ARLOCK      (ARLOCK_M2)
        ,   .ARCACHE     (ARCACHE_M2)
        ,   .ARPROT      (ARPROT_M2)
        ,   .ARVALID     (ARVALID_M2)
        ,   .ARREADY     (ARREADY_M2)
        // AXI MASTER read response channel signals
        ,   .RID         (RID_M2)
        ,   .RDATA       (RDATA_M2)
        ,   .RRESP       (RRESP_M2)
        ,   .RLAST       (RLAST_M2)
        ,   .RVALID      (RVALID_M2)
        ,   .RREADY      (RREADY_M2)
    );

   axi_master # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) master_3 (
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // MASTER
        // AXI MASTER write address channel signals
        ,   .AWID        (AWID_M3)
        ,   .AWADDR      (AWADDR_M3)
        ,   .AWLEN       (AWLEN_M3)
        ,   .AWSIZE      (AWSIZE_M3)
        ,   .AWBURST     (AWBURST_M3)
        ,   .AWLOCK      (AWLOCK_M3)
        ,   .AWCACHE     (AWCACHE_M3)
        ,   .AWPROT      (AWPROT_M3)
        ,   .AWVALID     (AWVALID_M3)
        ,   .AWREADY     (AWREADY_M3)
        // AXI MASTER write data channel signals
        ,   .WID         (WID_M3)
        ,   .WDATA       (WDATA_M3)
        ,   .WSTRB       (WSTRB_M3)
        ,   .WLAST       (WLAST_M3)
        ,   .WVALID      (WVALID_M3)
        ,   .WREADY      (WREADY_M3)
        // AXI MASTER write response channel signals
        ,   .BID         (BID_M3)
        ,   .BRESP       (BRESP_M3)
        ,   .BVALID      (BVALID_M3)
        ,   .BREADY      (BREADY_M3)
        // AXI MASTER read address channel signals
        ,   .ARID        (ARID_M3)
        ,   .ARADDR      (ARADDR_M3)
        ,   .ARLEN       (ARLEN_M3)
        ,   .ARSIZE      (ARSIZE_M3)
        ,   .ARBURST     (ARBURST_M3)
        ,   .ARLOCK      (ARLOCK_M3)
        ,   .ARCACHE     (ARCACHE_M3)
        ,   .ARPROT      (ARPROT_M3)
        ,   .ARVALID     (ARVALID_M3)
        ,   .ARREADY     (ARREADY_M3)
        // AXI MASTER read response channel signals
        ,   .RID         (RID_M3)
        ,   .RDATA       (RDATA_M3)
        ,   .RRESP       (RRESP_M3)
        ,   .RLAST       (RLAST_M3)
        ,   .RVALID      (RVALID_M3)
        ,   .RREADY      (RREADY_M3)
    );

    axi_slave # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) slave_0 (
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // 
        // AXI write address channel signals
        ,   .AWID        (AWID_S0)
        ,   .AWADDR        (AWADDR_S0)
        ,   .AWLEN        (AWLEN_S0)
        ,   .AWSIZE        (AWSIZE_S0)
        ,   .AWBURST        (AWBURST_S0)
        ,   .AWLOCK        (AWLOCK_S0)
        ,   .AWCACHE        (AWCACHE_S0)
        ,   .AWPROT        (AWPROT_S0)
        ,   .AWVALID        (AWVALID_S0)
        ,   .AWREADY        (AWREADY_S0)
        // AXI write data channel signals
        ,   .WID        (WID_S0)
        ,   .WDATA        (WDATA_S0)
        ,   .WSTRB        (WSTRB_S0)
        ,   .WLAST        (WLAST_S0)
        ,   .WVALID        (WVALID_S0)
        ,   .WREADY        (WREADY_S0)
        // AXI write response channel signals
        ,   .BID        (BID_S0)
        ,   .BRESP        (BRESP_S0)
        ,   .BVALID        (BVALID_S0)
        ,   .BREADY        (BREADY_S0)
        // AXI read address channel signals
        ,   .ARID        (ARID_S0)
        ,   .ARADDR        (ARADDR_S0)
        ,   .ARLEN        (ARLEN_S0)
        ,   .ARSIZE        (ARSIZE_S0)
        ,   .ARBURST        (ARBURST_S0)
        ,   .ARLOCK        (ARLOCK_S0)
        ,   .ARCACHE        (ARCACHE_S0)
        ,   .ARPROT        (ARPROT_S0)
        ,   .ARVALID        (ARVALID_S0)
        ,   .ARREADY        (ARREADY_S0)
        // AXI read response channel signals
        ,   .RID        (RID_S0)
        ,   .RDATA        (RDATA_S0)
        ,   .RRESP        (RRESP_S0)
        ,   .RLAST        (RLAST_S0)
        ,   .RVALID        (RVALID_S0)
        ,   .RREADY        (RREADY_S0)
    );

    axi_slave # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) slave_1 (
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // 
        // AXI write address channel signals
        ,   .AWID        (AWID_S1)
        ,   .AWADDR        (AWADDR_S1)
        ,   .AWLEN        (AWLEN_S1)
        ,   .AWSIZE        (AWSIZE_S1)
        ,   .AWBURST        (AWBURST_S1)
        ,   .AWLOCK        (AWLOCK_S1)
        ,   .AWCACHE        (AWCACHE_S1)
        ,   .AWPROT        (AWPROT_S1)
        ,   .AWVALID        (AWVALID_S1)
        ,   .AWREADY        (AWREADY_S1)
        // AXI write data channel signals
        ,   .WID        (WID_S1)
        ,   .WDATA        (WDATA_S1)
        ,   .WSTRB        (WSTRB_S1)
        ,   .WLAST        (WLAST_S1)
        ,   .WVALID        (WVALID_S1)
        ,   .WREADY        (WREADY_S1)
        // AXI write response channel signals
        ,   .BID        (BID_S1)
        ,   .BRESP        (BRESP_S1)
        ,   .BVALID        (BVALID_S1)
        ,   .BREADY        (BREADY_S1)
        // AXI read address channel signals
        ,   .ARID        (ARID_S1)
        ,   .ARADDR        (ARADDR_S1)
        ,   .ARLEN        (ARLEN_S1)
        ,   .ARSIZE        (ARSIZE_S1)
        ,   .ARBURST        (ARBURST_S1)
        ,   .ARLOCK        (ARLOCK_S1)
        ,   .ARCACHE        (ARCACHE_S1)
        ,   .ARPROT        (ARPROT_S1)
        ,   .ARVALID        (ARVALID_S1)
        ,   .ARREADY        (ARREADY_S1)
        // AXI read response channel signals
        ,   .RID        (RID_S1)
        ,   .RDATA        (RDATA_S1)
        ,   .RRESP        (RRESP_S1)
        ,   .RLAST        (RLAST_S1)
        ,   .RVALID        (RVALID_S1)
        ,   .RREADY        (RREADY_S1)
    );

axi_slave # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) slave_2 (
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // 
        // AXI write address channel signals
        ,   .AWID        (AWID_S2)
        ,   .AWADDR        (AWADDR_S2)
        ,   .AWLEN        (AWLEN_S2)
        ,   .AWSIZE        (AWSIZE_S2)
        ,   .AWBURST        (AWBURST_S2)
        ,   .AWLOCK        (AWLOCK_S2)
        ,   .AWCACHE        (AWCACHE_S2)
        ,   .AWPROT        (AWPROT_S2)
        ,   .AWVALID        (AWVALID_S2)
        ,   .AWREADY        (AWREADY_S2)
        // AXI write data channel signals
        ,   .WID        (WID_S2)
        ,   .WDATA        (WDATA_S2)
        ,   .WSTRB        (WSTRB_S2)
        ,   .WLAST        (WLAST_S2)
        ,   .WVALID        (WVALID_S2)
        ,   .WREADY        (WREADY_S2)
        // AXI write response channel signals
        ,   .BID        (BID_S2)
        ,   .BRESP        (BRESP_S2)
        ,   .BVALID        (BVALID_S2)
        ,   .BREADY        (BREADY_S2)
        // AXI read address channel signals
        ,   .ARID        (ARID_S2)
        ,   .ARADDR        (ARADDR_S2)
        ,   .ARLEN        (ARLEN_S2)
        ,   .ARSIZE        (ARSIZE_S2)
        ,   .ARBURST        (ARBURST_S2)
        ,   .ARLOCK        (ARLOCK_S2)
        ,   .ARCACHE        (ARCACHE_S2)
        ,   .ARPROT        (ARPROT_S2)
        ,   .ARVALID        (ARVALID_S2)
        ,   .ARREADY        (ARREADY_S2)
        // AXI read response channel signals
        ,   .RID        (RID_S2)
        ,   .RDATA        (RDATA_S2)
        ,   .RRESP        (RRESP_S2)
        ,   .RLAST        (RLAST_S2)
        ,   .RVALID        (RVALID_S2)
        ,   .RREADY        (RREADY_S2)
    );


axi_slave # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) slave_3 (
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // 
        // AXI write address channel signals
        ,   .AWID        (AWID_S3)
        ,   .AWADDR        (AWADDR_S3)
        ,   .AWLEN        (AWLEN_S3)
        ,   .AWSIZE        (AWSIZE_S3)
        ,   .AWBURST        (AWBURST_S3)
        ,   .AWLOCK        (AWLOCK_S3)
        ,   .AWCACHE        (AWCACHE_S3)
        ,   .AWPROT        (AWPROT_S3)
        ,   .AWVALID        (AWVALID_S3)
        ,   .AWREADY        (AWREADY_S3)
        // AXI write data channel signals
        ,   .WID        (WID_S3)
        ,   .WDATA        (WDATA_S3)
        ,   .WSTRB        (WSTRB_S3)
        ,   .WLAST        (WLAST_S3)
        ,   .WVALID        (WVALID_S3)
        ,   .WREADY        (WREADY_S3)
        // AXI write response channel signals
        ,   .BID        (BID_S3)
        ,   .BRESP        (BRESP_S3)
        ,   .BVALID        (BVALID_S3)
        ,   .BREADY        (BREADY_S3)
        // AXI read address channel signals
        ,   .ARID        (ARID_S3)
        ,   .ARADDR        (ARADDR_S3)
        ,   .ARLEN        (ARLEN_S3)
        ,   .ARSIZE        (ARSIZE_S3)
        ,   .ARBURST        (ARBURST_S3)
        ,   .ARLOCK        (ARLOCK_S3)
        ,   .ARCACHE        (ARCACHE_S3)
        ,   .ARPROT        (ARPROT_S3)
        ,   .ARVALID        (ARVALID_S3)
        ,   .ARREADY        (ARREADY_S3)
        // AXI read response channel signals
        ,   .RID        (RID_S3)
        ,   .RDATA        (RDATA_S3)
        ,   .RRESP        (RRESP_S3)
        ,   .RLAST        (RLAST_S3)
        ,   .RVALID        (RVALID_S3)
        ,   .RREADY        (RREADY_S3)
    );

axi_slave # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) slave_4 (
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // 
        // AXI write address channel signals
        ,   .AWID        (AWID_S4)
        ,   .AWADDR        (AWADDR_S4)
        ,   .AWLEN        (AWLEN_S4)
        ,   .AWSIZE        (AWSIZE_S4)
        ,   .AWBURST        (AWBURST_S4)
        ,   .AWLOCK        (AWLOCK_S4)
        ,   .AWCACHE        (AWCACHE_S4)
        ,   .AWPROT        (AWPROT_S4)
        ,   .AWVALID        (AWVALID_S4)
        ,   .AWREADY        (AWREADY_S4)
        // AXI write data channel signals
        ,   .WID        (WID_S4)
        ,   .WDATA        (WDATA_S4)
        ,   .WSTRB        (WSTRB_S4)
        ,   .WLAST        (WLAST_S4)
        ,   .WVALID        (WVALID_S4)
        ,   .WREADY        (WREADY_S4)
        // AXI write response channel signals
        ,   .BID        (BID_S4)
        ,   .BRESP        (BRESP_S4)
        ,   .BVALID        (BVALID_S4)
        ,   .BREADY        (BREADY_S4)
        // AXI read address channel signals
        ,   .ARID        (ARID_S4)
        ,   .ARADDR        (ARADDR_S4)
        ,   .ARLEN        (ARLEN_S4)
        ,   .ARSIZE        (ARSIZE_S4)
        ,   .ARBURST        (ARBURST_S4)
        ,   .ARLOCK        (ARLOCK_S4)
        ,   .ARCACHE        (ARCACHE_S4)
        ,   .ARPROT        (ARPROT_S4)
        ,   .ARVALID        (ARVALID_S4)
        ,   .ARREADY        (ARREADY_S4)
        // AXI read response channel signals
        ,   .RID        (RID_S4)
        ,   .RDATA        (RDATA_S4)
        ,   .RRESP        (RRESP_S4)
        ,   .RLAST        (RLAST_S4)
        ,   .RVALID        (RVALID_S4)
        ,   .RREADY        (RREADY_S4)
    );
axi_slave # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) slave_5 (
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // 
        // AXI write address channel signals
        ,   .AWID        (AWID_S5)
        ,   .AWADDR        (AWADDR_S5)
        ,   .AWLEN        (AWLEN_S5)
        ,   .AWSIZE        (AWSIZE_S5)
        ,   .AWBURST        (AWBURST_S5)
        ,   .AWLOCK        (AWLOCK_S5)
        ,   .AWCACHE        (AWCACHE_S5)
        ,   .AWPROT        (AWPROT_S5)
        ,   .AWVALID        (AWVALID_S5)
        ,   .AWREADY        (AWREADY_S5)
        // AXI write data channel signals
        ,   .WID        (WID_S5)
        ,   .WDATA        (WDATA_S5)
        ,   .WSTRB        (WSTRB_S5)
        ,   .WLAST        (WLAST_S5)
        ,   .WVALID        (WVALID_S5)
        ,   .WREADY        (WREADY_S5)
        // AXI write response channel signals
        ,   .BID        (BID_S5)
        ,   .BRESP        (BRESP_S5)
        ,   .BVALID        (BVALID_S5)
        ,   .BREADY        (BREADY_S5)
        // AXI read address channel signals
        ,   .ARID        (ARID_S5)
        ,   .ARADDR        (ARADDR_S5)
        ,   .ARLEN        (ARLEN_S5)
        ,   .ARSIZE        (ARSIZE_S5)
        ,   .ARBURST        (ARBURST_S5)
        ,   .ARLOCK        (ARLOCK_S5)
        ,   .ARCACHE        (ARCACHE_S5)
        ,   .ARPROT        (ARPROT_S5)
        ,   .ARVALID        (ARVALID_S5)
        ,   .ARREADY        (ARREADY_S5)
        // AXI read response channel signals
        ,   .RID        (RID_S5)
        ,   .RDATA        (RDATA_S5)
        ,   .RRESP        (RRESP_S5)
        ,   .RLAST        (RLAST_S5)
        ,   .RVALID        (RVALID_S5)
        ,   .RREADY        (RREADY_S5)
    ); 

axi_slave # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) slave_6 (
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // 
        // AXI write address channel signals
        ,   .AWID        (AWID_S6)
        ,   .AWADDR        (AWADDR_S6)
        ,   .AWLEN        (AWLEN_S6)
        ,   .AWSIZE        (AWSIZE_S6)
        ,   .AWBURST        (AWBURST_S6)
        ,   .AWLOCK        (AWLOCK_S6)
        ,   .AWCACHE        (AWCACHE_S6)
        ,   .AWPROT        (AWPROT_S6)
        ,   .AWVALID        (AWVALID_S6)
        ,   .AWREADY        (AWREADY_S6)
        // AXI write data channel signals
        ,   .WID        (WID_S6)
        ,   .WDATA        (WDATA_S6)
        ,   .WSTRB        (WSTRB_S6)
        ,   .WLAST        (WLAST_S6)
        ,   .WVALID        (WVALID_S6)
        ,   .WREADY        (WREADY_S6)
        // AXI write response channel signals
        ,   .BID        (BID_S6)
        ,   .BRESP        (BRESP_S6)
        ,   .BVALID        (BVALID_S6)
        ,   .BREADY        (BREADY_S6)
        // AXI read address channel signals
        ,   .ARID        (ARID_S6)
        ,   .ARADDR        (ARADDR_S6)
        ,   .ARLEN        (ARLEN_S6)
        ,   .ARSIZE        (ARSIZE_S6)
        ,   .ARBURST        (ARBURST_S6)
        ,   .ARLOCK        (ARLOCK_S6)
        ,   .ARCACHE        (ARCACHE_S6)
        ,   .ARPROT        (ARPROT_S6)
        ,   .ARVALID        (ARVALID_S6)
        ,   .ARREADY        (ARREADY_S6)
        // AXI read response channel signals
        ,   .RID        (RID_S6)
        ,   .RDATA        (RDATA_S6)
        ,   .RRESP        (RRESP_S6)
        ,   .RLAST        (RLAST_S6)
        ,   .RVALID        (RVALID_S6)
        ,   .RREADY        (RREADY_S6)
    );

 axi_slave # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) slave_7 (
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // 
        // AXI write address channel signals
        ,   .AWID        (AWID_S7)
        ,   .AWADDR        (AWADDR_S7)
        ,   .AWLEN        (AWLEN_S7)
        ,   .AWSIZE        (AWSIZE_S7)
        ,   .AWBURST        (AWBURST_S7)
        ,   .AWLOCK        (AWLOCK_S7)
        ,   .AWCACHE        (AWCACHE_S7)
        ,   .AWPROT        (AWPROT_S7)
        ,   .AWVALID        (AWVALID_S7)
        ,   .AWREADY        (AWREADY_S7)
        // AXI write data channel signals
        ,   .WID        (WID_S7)
        ,   .WDATA        (WDATA_S7)
        ,   .WSTRB        (WSTRB_S7)
        ,   .WLAST        (WLAST_S7)
        ,   .WVALID        (WVALID_S7)
        ,   .WREADY        (WREADY_S7)
        // AXI write response channel signals
        ,   .BID        (BID_S7)
        ,   .BRESP        (BRESP_S7)
        ,   .BVALID        (BVALID_S7)
        ,   .BREADY        (BREADY_S7)
        // AXI read address channel signals
        ,   .ARID        (ARID_S7)
        ,   .ARADDR        (ARADDR_S7)
        ,   .ARLEN        (ARLEN_S7)
        ,   .ARSIZE        (ARSIZE_S7)
        ,   .ARBURST        (ARBURST_S7)
        ,   .ARLOCK        (ARLOCK_S7)
        ,   .ARCACHE        (ARCACHE_S7)
        ,   .ARPROT        (ARPROT_S7)
        ,   .ARVALID        (ARVALID_S7)
        ,   .ARREADY        (ARREADY_S7)
        // AXI read response channel signals
        ,   .RID        (RID_S7)
        ,   .RDATA        (RDATA_S7)
        ,   .RRESP        (RRESP_S7)
        ,   .RLAST        (RLAST_S7)
        ,   .RVALID        (RVALID_S7)
        ,   .RREADY        (RREADY_S7)
    );

    axi_slave # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) slave_8 (
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // 
        // AXI write address channel signals
        ,   .AWID        (AWID_S8)
        ,   .AWADDR        (AWADDR_S8)
        ,   .AWLEN        (AWLEN_S8)
        ,   .AWSIZE        (AWSIZE_S8)
        ,   .AWBURST        (AWBURST_S8)
        ,   .AWLOCK        (AWLOCK_S8)
        ,   .AWCACHE        (AWCACHE_S8)
        ,   .AWPROT        (AWPROT_S8)
        ,   .AWVALID        (AWVALID_S8)
        ,   .AWREADY        (AWREADY_S8)
        // AXI write data channel signals
        ,   .WID        (WID_S8)
        ,   .WDATA        (WDATA_S8)
        ,   .WSTRB        (WSTRB_S8)
        ,   .WLAST        (WLAST_S8)
        ,   .WVALID        (WVALID_S8)
        ,   .WREADY        (WREADY_S8)
        // AXI write response channel signals
        ,   .BID        (BID_S8)
        ,   .BRESP        (BRESP_S8)
        ,   .BVALID        (BVALID_S8)
        ,   .BREADY        (BREADY_S8)
        // AXI read address channel signals
        ,   .ARID        (ARID_S8)
        ,   .ARADDR        (ARADDR_S8)
        ,   .ARLEN        (ARLEN_S8)
        ,   .ARSIZE        (ARSIZE_S3)
        ,   .ARBURST        (ARBURST_S8)
        ,   .ARLOCK        (ARLOCK_S8)
        ,   .ARCACHE        (ARCACHE_S8)
        ,   .ARPROT        (ARPROT_S8)
        ,   .ARVALID        (ARVALID_S8)
        ,   .ARREADY        (ARREADY_S8)
        // AXI read response channel signals
        ,   .RID        (RID_S8)
        ,   .RDATA        (RDATA_S8)
        ,   .RRESP        (RRESP_S8)
        ,   .RLAST        (RLAST_S8)
        ,   .RVALID        (RVALID_S8)
        ,   .RREADY        (RREADY_S8)
    );

axi_slave # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) slave_9 (
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // 
        // AXI write address channel signals
        ,   .AWID        (AWID_S9)
        ,   .AWADDR        (AWADDR_S9)
        ,   .AWLEN        (AWLEN_S9)
        ,   .AWSIZE        (AWSIZE_S9)
        ,   .AWBURST        (AWBURST_S9)
        ,   .AWLOCK        (AWLOCK_S9)
        ,   .AWCACHE        (AWCACHE_S9)
        ,   .AWPROT        (AWPROT_S9)
        ,   .AWVALID        (AWVALID_S9)
        ,   .AWREADY        (AWREADY_S9)
        // AXI write data channel signals
        ,   .WID        (WID_S9)
        ,   .WDATA        (WDATA_S9)
        ,   .WSTRB        (WSTRB_S9)
        ,   .WLAST        (WLAST_S9)
        ,   .WVALID        (WVALID_S9)
        ,   .WREADY        (WREADY_S9)
        // AXI write response channel signals
        ,   .BID        (BID_S9)
        ,   .BRESP        (BRESP_S9)
        ,   .BVALID        (BVALID_S9)
        ,   .BREADY        (BREADY_S9)
        // AXI read address channel signals
        ,   .ARID        (ARID_S9)
        ,   .ARADDR        (ARADDR_S9)
        ,   .ARLEN        (ARLEN_S9)
        ,   .ARSIZE        (ARSIZE_S9)
        ,   .ARBURST        (ARBURST_S9)
        ,   .ARLOCK        (ARLOCK_S9)
        ,   .ARCACHE        (ARCACHE_S9)
        ,   .ARPROT        (ARPROT_S9)
        ,   .ARVALID        (ARVALID_S9)
        ,   .ARREADY        (ARREADY_S9)
        // AXI read response channel signals
        ,   .RID        (RID_S9)
        ,   .RDATA        (RDATA_S9)
        ,   .RRESP        (RRESP_S9)
        ,   .RLAST        (RLAST_S9)
        ,   .RVALID        (RVALID_S9)
        ,   .RREADY        (RREADY_S9)
    );

   axi_slave # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) slave_10(
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // 
        // AXI write address channel signals
        ,   .AWID        (AWID_S10)
        ,   .AWADDR        (AWADDR_S10)
        ,   .AWLEN        (AWLEN_S10)
        ,   .AWSIZE        (AWSIZE_S10)
        ,   .AWBURST        (AWBURST_S10)
        ,   .AWLOCK        (AWLOCK_S10)
        ,   .AWCACHE        (AWCACHE_S10)
        ,   .AWPROT        (AWPROT_S10)
        ,   .AWVALID        (AWVALID_S10)
        ,   .AWREADY        (AWREADY_S10)
        // AXI write data channel signals
        ,   .WID        (WID_S10)
        ,   .WDATA        (WDATA_S10)
        ,   .WSTRB        (WSTRB_S10)
        ,   .WLAST        (WLAST_S10)
        ,   .WVALID        (WVALID_S10)
        ,   .WREADY        (WREADY_S10)
        // AXI write response channel signals
        ,   .BID        (BID_S10)
        ,   .BRESP        (BRESP_S10)
        ,   .BVALID        (BVALID_S10)
        ,   .BREADY        (BREADY_S10)
        // AXI read address channel signals
        ,   .ARID        (ARID_S10)
        ,   .ARADDR        (ARADDR_S10)
        ,   .ARLEN        (ARLEN_S10)
        ,   .ARSIZE        (ARSIZE_S10)
        ,   .ARBURST        (ARBURST_S10)
        ,   .ARLOCK        (ARLOCK_S10)
        ,   .ARCACHE        (ARCACHE_S10)
        ,   .ARPROT        (ARPROT_S10)
        ,   .ARVALID        (ARVALID_S10)
        ,   .ARREADY        (ARREADY_S10)
        // AXI read response channel signals
        ,   .RID        (RID_S10)
        ,   .RDATA        (RDATA_S10)
        ,   .RRESP        (RRESP_S10)
        ,   .RLAST        (RLAST_S10)
        ,   .RVALID        (RVALID_S10)
        ,   .RREADY        (RREADY_S10)
    );

axi_slave # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) slave_11(
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // 
        // AXI write address channel signals
        ,   .AWID        (AWID_S11)
        ,   .AWADDR        (AWADDR_S11)
        ,   .AWLEN        (AWLEN_S11)
        ,   .AWSIZE        (AWSIZE_S11)
        ,   .AWBURST        (AWBURST_S11)
        ,   .AWLOCK        (AWLOCK_S11)
        ,   .AWCACHE        (AWCACHE_S11)
        ,   .AWPROT        (AWPROT_S11)
        ,   .AWVALID        (AWVALID_S11)
        ,   .AWREADY        (AWREADY_S11)
        // AXI write data channel signals
        ,   .WID        (WID_S11)
        ,   .WDATA        (WDATA_S11)
        ,   .WSTRB        (WSTRB_S11)
        ,   .WLAST        (WLAST_S11)
        ,   .WVALID        (WVALID_S11)
        ,   .WREADY        (WREADY_S11)
        // AXI write response channel signals
        ,   .BID        (BID_S11)
        ,   .BRESP        (BRESP_S11)
        ,   .BVALID        (BVALID_S11)
        ,   .BREADY        (BREADY_S11)
        // AXI read address channel signals
        ,   .ARID        (ARID_S11)
        ,   .ARADDR        (ARADDR_S11)
        ,   .ARLEN        (ARLEN_S11)
        ,   .ARSIZE        (ARSIZE_S11)
        ,   .ARBURST        (ARBURST_S11)
        ,   .ARLOCK        (ARLOCK_S11)
        ,   .ARCACHE        (ARCACHE_S11)
        ,   .ARPROT        (ARPROT_S11)
        ,   .ARVALID        (ARVALID_S11)
        ,   .ARREADY        (ARREADY_S11)
        // AXI read response channel signals
        ,   .RID        (RID_S11)
        ,   .RDATA        (RDATA_S11)
        ,   .RRESP        (RRESP_S11)
        ,   .RLAST        (RLAST_S11)
        ,   .RVALID        (RVALID_S11)
        ,   .RREADY        (RREADY_S11)
    );
axi_slave # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) slave_12(
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // 
        // AXI write address channel signals
        ,   .AWID        (AWID_S12)
        ,   .AWADDR        (AWADDR_S12)
        ,   .AWLEN        (AWLEN_S12)
        ,   .AWSIZE        (AWSIZE_S12)
        ,   .AWBURST        (AWBURST_S12)
        ,   .AWLOCK        (AWLOCK_S12)
        ,   .AWCACHE        (AWCACHE_S12)
        ,   .AWPROT        (AWPROT_S12)
        ,   .AWVALID        (AWVALID_S12)
        ,   .AWREADY        (AWREADY_S12)
        // AXI write data channel signals
        ,   .WID        (WID_S12)
        ,   .WDATA        (WDATA_S12)
        ,   .WSTRB        (WSTRB_S12)
        ,   .WLAST        (WLAST_S12)
        ,   .WVALID        (WVALID_S12)
        ,   .WREADY        (WREADY_S12)
        // AXI write response channel signals
        ,   .BID        (BID_S12)
        ,   .BRESP        (BRESP_S12)
        ,   .BVALID        (BVALID_S12)
        ,   .BREADY        (BREADY_S12)
        // AXI read address channel signals
        ,   .ARID        (ARID_S12)
        ,   .ARADDR        (ARADDR_S12)
        ,   .ARLEN        (ARLEN_S12)
        ,   .ARSIZE        (ARSIZE_S12)
        ,   .ARBURST        (ARBURST_S12)
        ,   .ARLOCK        (ARLOCK_S12)
        ,   .ARCACHE        (ARCACHE_S12)
        ,   .ARPROT        (ARPROT_S12)
        ,   .ARVALID        (ARVALID_S12)
        ,   .ARREADY        (ARREADY_S12)
        // AXI read response channel signals
        ,   .RID        (RID_S12)
        ,   .RDATA        (RDATA_S12)
        ,   .RRESP        (RRESP_S12)
        ,   .RLAST        (RLAST_S12)
        ,   .RVALID        (RVALID_S12)
        ,   .RREADY        (RREADY_S12)
    );

axi_slave # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) slave_13(
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // 
        // AXI write address channel signals
        ,   .AWID        (AWID_S13)
        ,   .AWADDR        (AWADDR_S13)
        ,   .AWLEN        (AWLEN_S13)
        ,   .AWSIZE        (AWSIZE_S13)
        ,   .AWBURST        (AWBURST_S13)
        ,   .AWLOCK        (AWLOCK_S13)
        ,   .AWCACHE        (AWCACHE_S13)
        ,   .AWPROT        (AWPROT_S13)
        ,   .AWVALID        (AWVALID_S13)
        ,   .AWREADY        (AWREADY_S13)
        // AXI write data channel signals
        ,   .WID        (WID_S13)
        ,   .WDATA        (WDATA_S13)
        ,   .WSTRB        (WSTRB_S13)
        ,   .WLAST        (WLAST_S13)
        ,   .WVALID        (WVALID_S13)
        ,   .WREADY        (WREADY_S13)
        // AXI write response channel signals
        ,   .BID        (BID_S13)
        ,   .BRESP        (BRESP_S13)
        ,   .BVALID        (BVALID_S13)
        ,   .BREADY        (BREADY_S13)
        // AXI read address channel signals
        ,   .ARID        (ARID_S13)
        ,   .ARADDR        (ARADDR_S13)
        ,   .ARLEN        (ARLEN_S13)
        ,   .ARSIZE        (ARSIZE_S13)
        ,   .ARBURST        (ARBURST_S13)
        ,   .ARLOCK        (ARLOCK_S13)
        ,   .ARCACHE        (ARCACHE_S13)
        ,   .ARPROT        (ARPROT_S13)
        ,   .ARVALID        (ARVALID_S13)
        ,   .ARREADY        (ARREADY_S13)
        // AXI read response channel signals
        ,   .RID        (RID_S13)
        ,   .RDATA        (RDATA_S13)
        ,   .RRESP        (RRESP_S13)
        ,   .RLAST        (RLAST_S13)
        ,   .RVALID        (RVALID_S13)
        ,   .RREADY        (RREADY_S13)
    );
axi_slave # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) slave_14(
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // 
        // AXI write address channel signals
        ,   .AWID        (AWID_S14)
        ,   .AWADDR        (AWADDR_S14)
        ,   .AWLEN        (AWLEN_S14)
        ,   .AWSIZE        (AWSIZE_S14)
        ,   .AWBURST        (AWBURST_S14)
        ,   .AWLOCK        (AWLOCK_S14)
        ,   .AWCACHE        (AWCACHE_S14)
        ,   .AWPROT        (AWPROT_S14)
        ,   .AWVALID        (AWVALID_S14)
        ,   .AWREADY        (AWREADY_S14)
        // AXI write data channel signals
        ,   .WID        (WID_S14)
        ,   .WDATA        (WDATA_S14)
        ,   .WSTRB        (WSTRB_S14)
        ,   .WLAST        (WLAST_S14)
        ,   .WVALID        (WVALID_S14)
        ,   .WREADY        (WREADY_S14)
        // AXI write response channel signals
        ,   .BID        (BID_S14)
        ,   .BRESP        (BRESP_S14)
        ,   .BVALID        (BVALID_S14)
        ,   .BREADY        (BREADY_S14)
        // AXI read address channel signals
        ,   .ARID        (ARID_S14)
        ,   .ARADDR        (ARADDR_S14)
        ,   .ARLEN        (ARLEN_S14)
        ,   .ARSIZE        (ARSIZE_S14)
        ,   .ARBURST        (ARBURST_S14)
        ,   .ARLOCK        (ARLOCK_S14)
        ,   .ARCACHE        (ARCACHE_S14)
        ,   .ARPROT        (ARPROT_S14)
        ,   .ARVALID        (ARVALID_S14)
        ,   .ARREADY        (ARREADY_S14)
        // AXI read response channel signals
        ,   .RID        (RID_S14)
        ,   .RDATA        (RDATA_S14)
        ,   .RRESP        (RRESP_S14)
        ,   .RLAST        (RLAST_S14)
        ,   .RVALID        (RVALID_S14)
        ,   .RREADY        (RREADY_S14)
    );
axi_slave # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) slave_15(
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // 
        // AXI write address channel signals
        ,   .AWID        (AWID_S15)
        ,   .AWADDR        (AWADDR_S15)
        ,   .AWLEN        (AWLEN_S15)
        ,   .AWSIZE        (AWSIZE_S15)
        ,   .AWBURST        (AWBURST_S15)
        ,   .AWLOCK        (AWLOCK_S15)
        ,   .AWCACHE        (AWCACHE_S15)
        ,   .AWPROT        (AWPROT_S15)
        ,   .AWVALID        (AWVALID_S15)
        ,   .AWREADY        (AWREADY_S15)
        // AXI write data channel signals
        ,   .WID        (WID_S15)
        ,   .WDATA        (WDATA_S15)
        ,   .WSTRB        (WSTRB_S15)
        ,   .WLAST        (WLAST_S15)
        ,   .WVALID        (WVALID_S15)
        ,   .WREADY        (WREADY_S15)
        // AXI write response channel signals
        ,   .BID        (BID_S15)
        ,   .BRESP        (BRESP_S15)
        ,   .BVALID        (BVALID_S15)
        ,   .BREADY        (BREADY_S15)
        // AXI read address channel signals
        ,   .ARID        (ARID_S15)
        ,   .ARADDR        (ARADDR_S15)
        ,   .ARLEN        (ARLEN_S15)
        ,   .ARSIZE        (ARSIZE_S15)
        ,   .ARBURST        (ARBURST_S15)
        ,   .ARLOCK        (ARLOCK_S15)
        ,   .ARCACHE        (ARCACHE_S15)
        ,   .ARPROT        (ARPROT_S15)
        ,   .ARVALID        (ARVALID_S15)
        ,   .ARREADY        (ARREADY_S15)
        // AXI read response channel signals
        ,   .RID        (RID_S15)
        ,   .RDATA        (RDATA_S15)
        ,   .RRESP        (RRESP_S15)
        ,   .RLAST        (RLAST_S15)
        ,   .RVALID        (RVALID_S15)
        ,   .RREADY        (RREADY_S15)
    );
axi_slave # (
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(1),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)


    ) slave_16(
        // Global signals
            .ACLK           (ACLK)
        ,   .ARESETN        (ARESETN)

        // 
        // AXI write address channel signals
        ,   .AWID        (AWID_S16)
        ,   .AWADDR        (AWADDR_S16)
        ,   .AWLEN        (AWLEN_S16)
        ,   .AWSIZE        (AWSIZE_S16)
        ,   .AWBURST        (AWBURST_S16)
        ,   .AWLOCK        (AWLOCK_S16)
        ,   .AWCACHE        (AWCACHE_S16)
        ,   .AWPROT        (AWPROT_S16)
        ,   .AWVALID        (AWVALID_S16)
        ,   .AWREADY        (AWREADY_S16)
        // AXI write data channel signals
        ,   .WID        (WID_S16)
        ,   .WDATA        (WDATA_S16)
        ,   .WSTRB        (WSTRB_S16)
        ,   .WLAST        (WLAST_S16)
        ,   .WVALID        (WVALID_S16)
        ,   .WREADY        (WREADY_S16)
        // AXI write response channel signals
        ,   .BID        (BID_S16)
        ,   .BRESP        (BRESP_S16)
        ,   .BVALID        (BVALID_S16)
        ,   .BREADY        (BREADY_S16)
        // AXI read address channel signals
        ,   .ARID        (ARID_S16)
        ,   .ARADDR        (ARADDR_S16)
        ,   .ARLEN        (ARLEN_S16)
        ,   .ARSIZE        (ARSIZE_S16)
        ,   .ARBURST        (ARBURST_S16)
        ,   .ARLOCK        (ARLOCK_S16)
        ,   .ARCACHE        (ARCACHE_S16)
        ,   .ARPROT        (ARPROT_S16)
        ,   .ARVALID        (ARVALID_S16)
        ,   .ARREADY        (ARREADY_S16)
        // AXI read response channel signals
        ,   .RID        (RID_S16)
        ,   .RDATA        (RDATA_S16)
        ,   .RRESP        (RRESP_S16)
        ,   .RLAST        (RLAST_S16)
        ,   .RVALID        (RVALID_S16)
        ,   .RREADY        (RREADY_S16)
    );
    top_sb_COREAXI_0_COREAXI  #(
                          .FAMILY(FAMILY),             
                          .AXI_DWIDTH(64),                                   
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
                          .M0_SLAVE16ENABLE(0),                     
                          .M1_SLAVE0ENABLE(1),    
                          .M1_SLAVE1ENABLE(0),    
                          .M1_SLAVE2ENABLE(0),    
                          .M1_SLAVE3ENABLE(0),    
                          .M1_SLAVE4ENABLE(0),    
                          .M1_SLAVE5ENABLE(0),    
                          .M1_SLAVE6ENABLE(0),    
                          .M1_SLAVE7ENABLE(0),    
                          .M1_SLAVE8ENABLE(0),    
                          .M1_SLAVE9ENABLE(0),    
                          .M1_SLAVE10ENABLE(0),   
                          .M1_SLAVE11ENABLE(0),   
                          .M1_SLAVE12ENABLE(0),   
                          .M1_SLAVE13ENABLE(0),   
                          .M1_SLAVE14ENABLE(0),   
                          .M1_SLAVE15ENABLE(0),   
                          .M1_SLAVE16ENABLE(0),   
                          .M2_SLAVE0ENABLE(1),    
                          .M2_SLAVE1ENABLE(0),    
                          .M2_SLAVE2ENABLE(0),    
                          .M2_SLAVE3ENABLE(0),    
                          .M2_SLAVE4ENABLE(0),    
                          .M2_SLAVE5ENABLE(0),    
                          .M2_SLAVE6ENABLE(0),    
                          .M2_SLAVE7ENABLE(0),    
                          .M2_SLAVE8ENABLE(0),    
                          .M2_SLAVE9ENABLE(0),    
                          .M2_SLAVE10ENABLE(0),   
                          .M2_SLAVE11ENABLE(0),   
                          .M2_SLAVE12ENABLE(0),   
                          .M2_SLAVE13ENABLE(0),   
                          .M2_SLAVE14ENABLE(0),   
                          .M2_SLAVE15ENABLE(0),   
                          .M2_SLAVE16ENABLE(0),                      
                          .M3_SLAVE0ENABLE(1),    
                          .M3_SLAVE1ENABLE(0),    
                          .M3_SLAVE2ENABLE(0),    
                          .M3_SLAVE3ENABLE(0),    
                          .M3_SLAVE4ENABLE(0),    
                          .M3_SLAVE5ENABLE(0),    
                          .M3_SLAVE6ENABLE(0),    
                          .M3_SLAVE7ENABLE(0),
                          .M3_SLAVE8ENABLE(0),    
                          .M3_SLAVE9ENABLE(0),    
                          .M3_SLAVE10ENABLE(0),   
                          .M3_SLAVE11ENABLE(0),   
                          .M3_SLAVE12ENABLE(0),   
                          .M3_SLAVE13ENABLE(0),   
                          .M3_SLAVE14ENABLE(0),   
                          .M3_SLAVE15ENABLE(0),   
                          .M3_SLAVE16ENABLE(0),                      
                          .ID_WIDTH(4),                                                        
                          //.NUM_SLAVE_SLOT(NUM_SLAVE_SLOT),     
                          .NUM_MASTER_SLOT(4),    
                          .MEMSPACE(1),           
                          .HGS_CFG(1),            
                          .ADDR_HGS_CFG(1),                                                    
                          .SC_0(0),               
                          .SC_1(0),               
                          .SC_2(0),               
                          .SC_3(0),               
                          .SC_4(0),               
                          .SC_5(0),               
                          .SC_6(0),               
                          .SC_7(0),               
                          .SC_8(0),               
                          .SC_9(0),               
                          .SC_10(0),              
                          .SC_11(0),              
                          .SC_12(0),              
                          .SC_13(0),              
                          .SC_14(0),              
                          .SC_15(0),                                                           
                          .FEED_THROUGH(0),       
                          .INP_REG_BUF(1),        
                          .OUT_REG_BUF(1),                                                     
                          .WR_ACCEPTANCE(4),
                          .RD_ACCEPTANCE(4)
                          ) CoreAXI_0 (
                                       // Global signals
                                       .ACLK(ACLK),
                                       .ARESETN(ARESETN),

                                       // MASTER 0
                                       // AXI MASTER 0 write address channel signals
                                       .AWID_M0(AWID_M0),
                                       .AWADDR_M0(AWADDR_M0),
                                       .AWLEN_M0(AWLEN_M0),
                                       .AWSIZE_M0(AWSIZE_M0),
                                       .AWBURST_M0(AWBURST_M0),
                                       .AWLOCK_M0(AWLOCK_M0),
                                       .AWCACHE_M0(AWCACHE_M0),
                                       .AWPROT_M0(AWPROT_M0),
                                       .AWVALID_M0(AWVALID_M0),
                                       .AWREADY_M0(AWREADY_M0),
                                       // AXI MASTER 0 write data channel signals
                                       .WID_M0(WID_M0),
                                       .WDATA_M0(WDATA_M0),
                                       .WSTRB_M0(WSTRB_M0),
                                       .WLAST_M0(WLAST_M0),
                                       .WVALID_M0(WVALID_M0),
                                       .WREADY_M0(WREADY_M0),
                                       // AXI MASTER 0 write response channel signals
                                       .BID_M0(BID_M0),
                                       .BRESP_M0(BRESP_M0),
                                       .BVALID_M0(BVALID_M0),
                                       .BREADY_M0(BREADY_M0),
                                       // AXI MASTER 0 read address channel signals
                                       .ARID_M0(ARID_M0),
                                       .ARADDR_M0(ARADDR_M0),
                                       .ARLEN_M0(ARLEN_M0),
                                       .ARSIZE_M0(ARSIZE_M0),
                                       .ARBURST_M0(ARBURST_M0),
                                       .ARLOCK_M0(ARLOCK_M0),
                                       .ARCACHE_M0(ARCACHE_M0),
                                       .ARPROT_M0(ARPROT_M0),
                                       .ARVALID_M0(ARVALID_M0),
                                       .ARREADY_M0(ARREADY_M0),
                                       // AXI MASTER 0 read response channel signals
                                       .RID_M0(RID_M0),
                                       .RDATA_M0(RDATA_M0),
                                       .RRESP_M0(RRESP_M0),
                                       .RLAST_M0(RLAST_M0),
                                       .RVALID_M0(RVALID_M0),
                                       .RREADY_M0(RREADY_M0),
                                       
                                       // MASTER 1
                                       // AXI MASTER 1 write address channel signals
                                       .AWID_M1(AWID_M1),
                                       .AWADDR_M1(AWADDR_M1),
                                       .AWLEN_M1(AWLEN_M1),
                                       .AWSIZE_M1(AWSIZE_M1),
                                       .AWBURST_M1(AWBURST_M1),
                                       .AWLOCK_M1(AWLOCK_M1),
                                       .AWCACHE_M1(AWCACHE_M1),
                                       .AWPROT_M1(AWPROT_M1),
                                       .AWVALID_M1(AWVALID_M1),
                                       .AWREADY_M1(AWREADY_M1),
                                       // AXI MASTER 1 write data channel signals
                                       .WID_M1(WID_M1),
                                       .WDATA_M1(WDATA_M1),
                                       .WSTRB_M1(WSTRB_M1),
                                       .WLAST_M1(WLAST_M1),
                                       .WVALID_M1(WVALID_M1),
                                       .WREADY_M1(WREADY_M1),
                                       // AXI MASTER 1 write response channel signals
                                       .BID_M1(BID_M1),
                                       .BRESP_M1(BRESP_M1),
                                       .BVALID_M1(BVALID_M1),
                                       .BREADY_M1(BREADY_M1),
                                      // AXI MASTER 1 read address channel signals
                                       .ARID_M1(ARID_M1),
                                       .ARADDR_M1(ARADDR_M1),
                                       .ARLEN_M1(ARLEN_M1),
                                       .ARSIZE_M1(ARSIZE_M1),
                                       .ARBURST_M1(ARBURST_M1),
                                       .ARLOCK_M1(ARLOCK_M1),
                                       .ARCACHE_M1(ARCACHE_M1),
                                       .ARPROT_M1(ARPROT_M1),
                                       .ARVALID_M1(ARVALID_M1),
                                       .ARREADY_M1(ARREADY_M1),
                                       // AXI MASTER 1 read response channel signals
                                       .RID_M1(RID_M1),
                                       .RDATA_M1(RDATA_M1),
                                       .RRESP_M1(RRESP_M1),
                                       .RLAST_M1(RLAST_M1),
                                       .RVALID_M1(RVALID_M1),
                                       .RREADY_M1(RREADY_M1),
                                       
                                       // MASTER 2
                                       // AXI MASTER 2 write address channel signals
                                       .AWID_M2(AWID_M2),
                                       .AWADDR_M2(AWADDR_M2),
                                       .AWLEN_M2(AWLEN_M2),
                                       .AWSIZE_M2(AWSIZE_M2),
                                       .AWBURST_M2(AWBURST_M2),
                                       .AWLOCK_M2(AWLOCK_M2),
                                       .AWCACHE_M2(AWCACHE_M2),
                                       .AWPROT_M2(AWPROT_M2),
                                       .AWVALID_M2(AWVALID_M2),
                                       .AWREADY_M2(AWREADY_M2),
                                       // AXI MASTER 2 write data channel signals
                                       .WID_M2(WID_M2),
                                       .WDATA_M2(WDATA_M2),
                                       .WSTRB_M2(WSTRB_M2),
                                       .WLAST_M2(WLAST_M2),
                                       .WVALID_M2(WVALID_M2),
                                       .WREADY_M2(WREADY_M2),
                                       // AXI MASTER 2 write response channel signals
                                       .BID_M2(BID_M2),
                                       .BRESP_M2(BRESP_M2),
                                       .BVALID_M2(BVALID_M2),
                                       .BREADY_M2(BREADY_M2),
                                       // AXI MASTER 2 read address channel signals
                                       .ARID_M2(ARID_M2),
                                       .ARADDR_M2(ARADDR_M2),
                                       .ARLEN_M2(ARLEN_M2),
                                       .ARSIZE_M2(ARSIZE_M2),
                                       .ARBURST_M2(ARBURST_M2),
                                       .ARLOCK_M2(ARLOCK_M2),
                                       .ARCACHE_M2(ARCACHE_M2),
                                       .ARPROT_M2(ARPROT_M2),
                                       .ARVALID_M2(ARVALID_M2),
                                       .ARREADY_M2(ARREADY_M2),
                                       // AXI MASTER 2 read response channel signals
                                       .RID_M2(RID_M2),
                                       .RDATA_M2(RDATA_M2),
                                       .RRESP_M2(RRESP_M2),
                                       .RLAST_M2(RLAST_M2),
                                       .RVALID_M2(RVALID_M2),
                                       .RREADY_M2(RREADY_M2),
                                       
                                       // MASTER 3
                                       // AXI MASTER 3 write address channel signals
                                       .AWID_M3(AWID_M3),
                                       .AWADDR_M3(AWADDR_M3),
                                       .AWLEN_M3(AWLEN_M3),
                                       .AWSIZE_M3(AWSIZE_M3),
                                       .AWBURST_M3(AWBURST_M3),
                                       .AWLOCK_M3(AWLOCK_M3),
                                       .AWCACHE_M3(AWCACHE_M3),
                                       .AWPROT_M3(AWPROT_M3),
                                       .AWVALID_M3(AWVALID_M3),
                                       .AWREADY_M3(AWREADY_M3),
                                       // AXI MASTER 3 write data channel signals
                                       .WID_M3(WID_M3),
                                       .WDATA_M3(WDATA_M3),
                                       .WSTRB_M3(WSTRB_M3),
                                       .WLAST_M3(WLAST_M3),
                                       .WVALID_M3(WVALID_M3),
                                       .WREADY_M3(WREADY_M3),
                                       // AXI MASTER 3 write response channel signals
                                       .BID_M3(BID_M3),
                                       .BRESP_M3(BRESP_M3),
                                       .BVALID_M3(BVALID_M3),
                                       .BREADY_M3(BREADY_M3),
                                       // AXI MASTER 3 read address channel signals
                                       .ARID_M3(ARID_M3),
                                       .ARADDR_M3(ARADDR_M3),
                                       .ARLEN_M3(ARLEN_M3),
                                       .ARSIZE_M3(ARSIZE_M3),
                                       .ARBURST_M3(ARBURST_M3),
                                       .ARLOCK_M3(ARLOCK_M3),
                                       .ARCACHE_M3(ARCACHE_M3),
                                       .ARPROT_M3(ARPROT_M3),
                                       .ARVALID_M3(ARVALID_M3),
                                       .ARREADY_M3(ARREADY_M3),
                                       // AXI MASTER 3 read response channel signals
                                       .RID_M3(RID_M3),
                                       .RDATA_M3(RDATA_M3),
                                       .RRESP_M3(RRESP_M3),
                                       .RLAST_M3(RLAST_M3),
                                       .RVALID_M3(RVALID_M3),
                                       .RREADY_M3(RREADY_M3),    
                                       
                                       // SLAVE 0
                                       // AXI SLAVE 0 write address channel signals
                                       .AWID_S0(AWID_S0),
                                       .AWADDR_S0(AWADDR_S0),
                                       .AWLEN_S0(AWLEN_S0),
                                       .AWSIZE_S0(AWSIZE_S0),
                                       .AWBURST_S0(AWBURST_S0),
                                       .AWLOCK_S0(AWLOCK_S0),
                                       .AWCACHE_S0(AWCACHE_S0),
                                       .AWPROT_S0(AWPROT_S0),
                                       .AWVALID_S0(AWVALID_S0),
                                       .AWREADY_S0(AWREADY_S0),
                                       // AXI SLAVE 0 write data channel signals
                                       .WID_S0(WID_S0),
                                       .WDATA_S0(WDATA_S0),
                                       .WSTRB_S0(WSTRB_S0),
                                       .WLAST_S0(WLAST_S0),
                                       .WVALID_S0(WVALID_S0),
                                       .WREADY_S0(WREADY_S0),
                                       // AXI SLAVE 0 write response channel signals
                                       .BID_S0(BID_S0),
                                       .BRESP_S0(BRESP_S0),
                                       .BVALID_S0(BVALID_S0),
                                       .BREADY_S0(BREADY_S0),
                                       // AXI SLAVE 0 read address channel signals
                                       .ARID_S0(ARID_S0),
                                       .ARADDR_S0(ARADDR_S0),
                                       .ARLEN_S0(ARLEN_S0),
                                       .ARSIZE_S0(ARSIZE_S0),
                                       .ARBURST_S0(ARBURST_S0),
                                       .ARLOCK_S0(ARLOCK_S0),
                                       .ARCACHE_S0(ARCACHE_S0),
                                       .ARPROT_S0(ARPROT_S0),
                                       .ARVALID_S0(ARVALID_S0),
                                       .ARREADY_S0(ARREADY_S0),
                                       // AXI SLAVE 0 read response channel signals
                                       .RID_S0(RID_S0),
                                       .RDATA_S0(RDATA_S0),
                                       .RRESP_S0(RRESP_S0),
                                       .RLAST_S0(RLAST_S0),
                                       .RVALID_S0(RVALID_S0),
                                       .RREADY_S0(RREADY_S0),
                                       
                                       // SLAVE 1
                                       // AXI SLAVE 1 write address channel signals
                                       .AWID_S1(AWID_S1),
                                       .AWADDR_S1(AWADDR_S1),
                                       .AWLEN_S1(AWLEN_S1),
                                       .AWSIZE_S1(AWSIZE_S1),
                                       .AWBURST_S1(AWBURST_S1),
                                       .AWLOCK_S1(AWLOCK_S1),
                                       .AWCACHE_S1(AWCACHE_S1),
                                       .AWPROT_S1(AWPROT_S1),
                                       .AWVALID_S1(AWVALID_S1),
                                       .AWREADY_S1(AWREADY_S1),
                                       // AXI SLAVE 1 write data channel signals
                                       .WID_S1(WID_S1),
                                       .WDATA_S1(WDATA_S1),
                                       .WSTRB_S1(WSTRB_S1),
                                       .WLAST_S1(WLAST_S1),
                                       .WVALID_S1(WVALID_S1),
                                       .WREADY_S1(WREADY_S1),
                                       // AXI SLAVE 1 write response channel signals
                                       .BID_S1(BID_S1),
                                       .BRESP_S1(BRESP_S1),
                                       .BVALID_S1(BVALID_S1),
                                       .BREADY_S1(BREADY_S1),
                                       // AXI SLAVE 1 read address channel signals
                                       .ARID_S1(ARID_S1),
                                       .ARADDR_S1(ARADDR_S1),
                                       .ARLEN_S1(ARLEN_S1),
                                       .ARSIZE_S1(ARSIZE_S1),
                                       .ARBURST_S1(ARBURST_S1),
                                       .ARLOCK_S1(ARLOCK_S1),
                                       .ARCACHE_S1(ARCACHE_S1),
                                       .ARPROT_S1(ARPROT_S1),
                                       .ARVALID_S1(ARVALID_S1),
                                       .ARREADY_S1(ARREADY_S1),
                                       // AXI SLAVE 1 read response channel signals
                                       .RID_S1(RID_S1),
                                       .RDATA_S1(RDATA_S1),
                                       .RRESP_S1(RRESP_S1),
                                       .RLAST_S1(RLAST_S1),
                                       .RVALID_S1(RVALID_S1),
                                       .RREADY_S1(RREADY_S1),
                                       
                                       // SLAVE 2
                                       // AXI SLAVE 2 write address channel signals
                                       .AWID_S2(AWID_S2),
                                       .AWADDR_S2(AWADDR_S2),
                                       .AWLEN_S2(AWLEN_S2),
                                       .AWSIZE_S2(AWSIZE_S2),
                                       .AWBURST_S2(AWBURST_S2),
                                       .AWLOCK_S2(AWLOCK_S2),
                                       .AWCACHE_S2(AWCACHE_S2),
                                       .AWPROT_S2(AWPROT_S2),
                                       .AWVALID_S2(AWVALID_S2),
                                       .AWREADY_S2(AWREADY_S2),
                                       // AXI SLAVE 2 write data channel signals
                                       .WID_S2(WID_S2),
                                       .WDATA_S2(WDATA_S2),
                                       .WSTRB_S2(WSTRB_S2),
                                       .WLAST_S2(WLAST_S2),
                                       .WVALID_S2(WVALID_S2),
                                       .WREADY_S2(WREADY_S2),
                                       // AXI SLAVE 2 write response channel signals
                                       .BID_S2(BID_S2),
                                       .BRESP_S2(BRESP_S2),
                                       .BVALID_S2(BVALID_S2),
                                       .BREADY_S2(BREADY_S2),
                                       // AXI SLAVE 2 read address channel signals
                                       .ARID_S2(ARID_S2),
                                       .ARADDR_S2(ARADDR_S2),
                                       .ARLEN_S2(ARLEN_S2),
                                       .ARSIZE_S2(ARSIZE_S2),
                                       .ARBURST_S2(ARBURST_S2),
                                       .ARLOCK_S2(ARLOCK_S2),
                                       .ARCACHE_S2(ARCACHE_S2),
                                       .ARPROT_S2(ARPROT_S2),
                                       .ARVALID_S2(ARVALID_S2),
                                       .ARREADY_S2(ARREADY_S2),
                                       // AXI SLAVE 2 read response channel signals
                                       .RID_S2(RID_S2),
                                       .RDATA_S2(RDATA_S2),
                                       .RRESP_S2(RRESP_S2),
                                       .RLAST_S2(RLAST_S2),
                                       .RVALID_S2(RVALID_S2),
                                       .RREADY_S2(RREADY_S2),
                                       
                                       // SLAVE 3
                                       // AXI SLAVE 3 write address channel signals
                                       .AWID_S3(AWID_S3),
                                       .AWADDR_S3(AWADDR_S3),
                                       .AWLEN_S3(AWLEN_S3),
                                       .AWSIZE_S3(AWSIZE_S3),
                                       .AWBURST_S3(AWBURST_S3),
                                       .AWLOCK_S3(AWLOCK_S3),
                                       .AWCACHE_S3(AWCACHE_S3),
                                       .AWPROT_S3(AWPROT_S3),
                                       .AWVALID_S3(AWVALID_S3),
                                       .AWREADY_S3(AWREADY_S3),
                                       // AXI SLAVE 3 write data channel signals
                                       .WID_S3(WID_S3),
                                       .WDATA_S3(WDATA_S3),
                                       .WSTRB_S3(WSTRB_S3),
                                       .WLAST_S3(WLAST_S3),
                                       .WVALID_S3(WVALID_S3),
                                       .WREADY_S3(WREADY_S3),
                                       // AXI SLAVE 3 write response channel signals
                                       .BID_S3(BID_S3),
                                       .BRESP_S3(BRESP_S3),
                                       .BVALID_S3(BVALID_S3),
                                       .BREADY_S3(BREADY_S3),
                                       // AXI SLAVE 3 read address channel signals
                                       .ARID_S3(ARID_S3),
                                       .ARADDR_S3(ARADDR_S3),
                                       .ARLEN_S3(ARLEN_S3),
                                       .ARSIZE_S3(ARSIZE_S3),
                                       .ARBURST_S3(ARBURST_S3),
                                       .ARLOCK_S3(ARLOCK_S3),
                                       .ARCACHE_S3(ARCACHE_S3),
                                       .ARPROT_S3(ARPROT_S3),
                                       .ARVALID_S3(ARVALID_S3),
                                       .ARREADY_S3(ARREADY_S3),
                                       // AXI SLAVE 3 read response channel signals
                                       .RID_S3(RID_S3),
                                       .RDATA_S3(RDATA_S3),
                                       .RRESP_S3(RRESP_S3),
                                       .RLAST_S3(RLAST_S3),
                                       .RVALID_S3(RVALID_S3),
                                       .RREADY_S3(RREADY_S3),
                                       
                                       // SLAVE 4
                                       // AXI SLAVE 4 write address channel signals
                                       .AWID_S4(AWID_S4),
                                       .AWADDR_S4(AWADDR_S4),
                                       .AWLEN_S4(AWLEN_S4),
                                       .AWSIZE_S4(AWSIZE_S4),
                                       .AWBURST_S4(AWBURST_S4),
                                       .AWLOCK_S4(AWLOCK_S4),
                                       .AWCACHE_S4(AWCACHE_S4),
                                       .AWPROT_S4(AWPROT_S4),
                                       .AWVALID_S4(AWVALID_S4),
                                       .AWREADY_S4(AWREADY_S4),
                                       // AXI SLAVE 4 write data channel signals
                                       .WID_S4(WID_S4),
                                       .WDATA_S4(WDATA_S4),
                                       .WSTRB_S4(WSTRB_S4),
                                       .WLAST_S4(WLAST_S4),
                                       .WVALID_S4(WVALID_S4),
                                       .WREADY_S4(WREADY_S4),
                                       // AXI SLAVE 4 write response channel signals
                                       .BID_S4(BID_S4),
                                       .BRESP_S4(BRESP_S4),
                                       .BVALID_S4(BVALID_S4),
                                       .BREADY_S4(BREADY_S4),
                                       // AXI SLAVE 4 read address channel signals
                                       .ARID_S4(ARID_S4),
                                       .ARADDR_S4(ARADDR_S4),
                                       .ARLEN_S4(ARLEN_S4),
                                       .ARSIZE_S4(ARSIZE_S4),
                                       .ARBURST_S4(ARBURST_S4),
                                       .ARLOCK_S4(ARLOCK_S4),
                                       .ARCACHE_S4(ARCACHE_S4),
                                       .ARPROT_S4(ARPROT_S4),
                                       .ARVALID_S4(ARVALID_S4),
                                       .ARREADY_S4(ARREADY_S4),
                                       // AXI SLAVE 4 read response channel signals
                                       .RID_S4(RID_S4),
                                       .RDATA_S4(RDATA_S4),
                                       .RRESP_S4(RRESP_S4),
                                       .RLAST_S4(RLAST_S4),
                                       .RVALID_S4(RVALID_S4),
                                       .RREADY_S4(RREADY_S4),
                                       
                                       // SLAVE 5
                                       // AXI SLAVE 5 write address channel signals
                                       .AWID_S5(AWID_S5),
                                       .AWADDR_S5(AWADDR_S5),
                                       .AWLEN_S5(AWLEN_S5),
                                       .AWSIZE_S5(AWSIZE_S5),
                                       .AWBURST_S5(AWBURST_S5),
                                       .AWLOCK_S5(AWLOCK_S5),
                                       .AWCACHE_S5(AWCACHE_S5),
                                       .AWPROT_S5(AWPROT_S5),
                                       .AWVALID_S5(AWVALID_S5),
                                       .AWREADY_S5(AWREADY_S5),
                                       // AXI SLAVE 5 write data channel signals
                                       .WID_S5(WID_S5),
                                       .WDATA_S5(WDATA_S5),
                                       .WSTRB_S5(WSTRB_S5),
                                       .WLAST_S5(WLAST_S5),
                                       .WVALID_S5(WVALID_S5),
                                       .WREADY_S5(WREADY_S5),
                                       // AXI SLAVE 5 write response channel signals
                                       .BID_S5(BID_S5),
                                       .BRESP_S5(BRESP_S5),
                                       .BVALID_S5(BVALID_S5),
                                       .BREADY_S5(BREADY_S5),
                                       // AXI SLAVE 5 read address channel signals
                                       .ARID_S5(ARID_S5),
                                       .ARADDR_S5(ARADDR_S5),
                                       .ARLEN_S5(ARLEN_S5),
                                       .ARSIZE_S5(ARSIZE_S5),
                                       .ARBURST_S5(ARBURST_S5),
                                       .ARLOCK_S5(ARLOCK_S5),
                                       .ARCACHE_S5(ARCACHE_S5),
                                       .ARPROT_S5(ARPROT_S5),
                                       .ARVALID_S5(ARVALID_S5),
                                       .ARREADY_S5(ARREADY_S5),
                                       // AXI SLAVE 5 read response channel signals
                                       .RID_S5(RID_S5),
                                       .RDATA_S5(RDATA_S5),
                                       .RRESP_S5(RRESP_S5),
                                       .RLAST_S5(RLAST_S5),
                                       .RVALID_S5(RVALID_S5),
                                       .RREADY_S5(RREADY_S5),
                                       
                                       // SLAVE 6
                                       // AXI SLAVE 6 write address channel signals
                                       .AWID_S6(AWID_S6),
                                       .AWADDR_S6(AWADDR_S6),
                                       .AWLEN_S6(AWLEN_S6),
                                       .AWSIZE_S6(AWSIZE_S6),
                                       .AWBURST_S6(AWBURST_S6),
                                       .AWLOCK_S6(AWLOCK_S6),
                                       .AWCACHE_S6(AWCACHE_S6),
                                       .AWPROT_S6(AWPROT_S6),
                                       .AWVALID_S6(AWVALID_S6),
                                       .AWREADY_S6(AWREADY_S6),
                                       // AXI SLAVE 6 write data channel signals
                                       .WID_S6(WID_S6),
                                       .WDATA_S6(WDATA_S6),
                                       .WSTRB_S6(WSTRB_S6),
                                       .WLAST_S6(WLAST_S6),
                                       .WVALID_S6(WVALID_S6),
                                       .WREADY_S6(WREADY_S6),
                                       // AXI SLAVE 6 write response channel signals
                                       .BID_S6(BID_S6),
                                       .BRESP_S6(BRESP_S6),
                                       .BVALID_S6(BVALID_S6),
                                       .BREADY_S6(BREADY_S6),
                                       // AXI SLAVE 6 read address channel signals
                                       .ARID_S6(ARID_S6),
                                       .ARADDR_S6(ARADDR_S6),
                                       .ARLEN_S6(ARLEN_S6),
                                       .ARSIZE_S6(ARSIZE_S6),
                                       .ARBURST_S6(ARBURST_S6),
                                       .ARLOCK_S6(ARLOCK_S6),
                                       .ARCACHE_S6(ARCACHE_S6),
                                       .ARPROT_S6(ARPROT_S6),
                                       .ARVALID_S6(ARVALID_S6),
                                       .ARREADY_S6(ARREADY_S6),
                                       // AXI SLAVE 6 read response channel signals
                                       .RID_S6(RID_S6),
                                       .RDATA_S6(RDATA_S6),
                                       .RRESP_S6(RRESP_S6),
                                       .RLAST_S6(RLAST_S6),
                                       .RVALID_S6(RVALID_S6),
                                       .RREADY_S6(RREADY_S6),
                                       
                                       // SLAVE 7
                                       // AXI SLAVE 7 write address channel signals
                                       .AWID_S7(AWID_S7),
                                       .AWADDR_S7(AWADDR_S7),
                                       .AWLEN_S7(AWLEN_S7),
                                       .AWSIZE_S7(AWSIZE_S7),
                                       .AWBURST_S7(AWBURST_S7),
                                       .AWLOCK_S7(AWLOCK_S7),
                                       .AWCACHE_S7(AWCACHE_S7),
                                       .AWPROT_S7(AWPROT_S7),
                                       .AWVALID_S7(AWVALID_S7),
                                       .AWREADY_S7(AWREADY_S7),
                                       // AXI SLAVE 7 write data channel signals
                                       .WID_S7(WID_S7),
                                       .WDATA_S7(WDATA_S7),
                                       .WSTRB_S7(WSTRB_S7),
                                       .WLAST_S7(WLAST_S7),
                                       .WVALID_S7(WVALID_S7),
                                       .WREADY_S7(WREADY_S7),
                                       // AXI SLAVE 7 write response channel signals
                                       .BID_S7(BID_S7),
                                       .BRESP_S7(BRESP_S7),
                                       .BVALID_S7(BVALID_S7),
                                       .BREADY_S7(BREADY_S7),
                                       // AXI SLAVE 7 read address channel signals
                                       .ARID_S7(ARID_S7),
                                       .ARADDR_S7(ARADDR_S7),
                                       .ARLEN_S7(ARLEN_S7),
                                       .ARSIZE_S7(ARSIZE_S7),
                                       .ARBURST_S7(ARBURST_S7),
                                       .ARLOCK_S7(ARLOCK_S7),
                                       .ARCACHE_S7(ARCACHE_S7),
                                       .ARPROT_S7(ARPROT_S7),
                                       .ARVALID_S7(ARVALID_S7),
                                       .ARREADY_S7(ARREADY_S7),
                                       // AXI SLAVE 7 read response channel signals
                                       .RID_S7(RID_S7),
                                       .RDATA_S7(RDATA_S7),
                                       .RRESP_S7(RRESP_S7),
                                       .RLAST_S7(RLAST_S7),
                                       .RVALID_S7(RVALID_S7),
                                       .RREADY_S7(RREADY_S7),
                                       
                                       // SLAVE 8
                                       // AXI SLAVE 8 write address channel signals
                                       .AWID_S8(AWID_S8),
                                       .AWADDR_S8(AWADDR_S8),
                                       .AWLEN_S8(AWLEN_S8),
                                       .AWSIZE_S8(AWSIZE_S8),
                                       .AWBURST_S8(AWBURST_S8),
                                       .AWLOCK_S8(AWLOCK_S8),
                                       .AWCACHE_S8(AWCACHE_S8),
                                       .AWPROT_S8(AWPROT_S8),
                                       .AWVALID_S8(AWVALID_S8),
                                       .AWREADY_S8(AWREADY_S8),
                                       // AXI SLAVE 8 write data channel signals
                                       .WID_S8(WID_S8),
                                       .WDATA_S8(WDATA_S8),
                                       .WSTRB_S8(WSTRB_S8),
                                       .WLAST_S8(WLAST_S8),
                                       .WVALID_S8(WVALID_S8),
                                       .WREADY_S8(WREADY_S8),
                                       // AXI SLAVE 8 write response channel signals
                                       .BID_S8(BID_S8),
                                       .BRESP_S8(BRESP_S8),
                                       .BVALID_S8(BVALID_S8),
                                       .BREADY_S8(BREADY_S8),
                                       // AXI SLAVE 8 read address channel signals
                                       .ARID_S8(ARID_S8),
                                       .ARADDR_S8(ARADDR_S8),
                                       .ARLEN_S8(ARLEN_S8),
                                       .ARSIZE_S8(ARSIZE_S8),
                                       .ARBURST_S8(ARBURST_S8),
                                       .ARLOCK_S8(ARLOCK_S8),
                                       .ARCACHE_S8(ARCACHE_S8),
                                       .ARPROT_S8(ARPROT_S8),
                                       .ARVALID_S8(ARVALID_S8),
                                       .ARREADY_S8(ARREADY_S8),
                                       // AXI SLAVE 8 read response channel signals
                                       .RID_S8(RID_S8),
                                       .RDATA_S8(RDATA_S8),
                                       .RRESP_S8(RRESP_S8),
                                       .RLAST_S8(RLAST_S8),
                                       .RVALID_S8(RVALID_S8),
                                       .RREADY_S8(RREADY_S8),
                                       
                                       // SLAVE 9
                                       // AXI SLAVE 9 write address channel signals
                                       .AWID_S9(AWID_S9),
                                       .AWADDR_S9(AWADDR_S9),
                                       .AWLEN_S9(AWLEN_S9),
                                       .AWSIZE_S9(AWSIZE_S9),
                                       .AWBURST_S9(AWBURST_S9),
                                       .AWLOCK_S9(AWLOCK_S9),
                                       .AWCACHE_S9(AWCACHE_S9),
                                       .AWPROT_S9(AWPROT_S9),
                                       .AWVALID_S9(AWVALID_S9),
                                       .AWREADY_S9(AWREADY_S9),
                                       // AXI SLAVE 9 write data channel signals
                                       .WID_S9(WID_S9),
                                       .WDATA_S9(WDATA_S9),
                                       .WSTRB_S9(WSTRB_S9),
                                       .WLAST_S9(WLAST_S9),
                                       .WVALID_S9(WVALID_S9),
                                       .WREADY_S9(WREADY_S9),
                                       // AXI SLAVE 9 write response channel signals
                                       .BID_S9(BID_S9),
                                       .BRESP_S9(BRESP_S9),
                                       .BVALID_S9(BVALID_S9),
                                       .BREADY_S9(BREADY_S9),
                                       // AXI SLAVE 9 read address channel signals
                                       .ARID_S9(ARID_S9),
                                       .ARADDR_S9(ARADDR_S9),
                                       .ARLEN_S9(ARLEN_S9),
                                       .ARSIZE_S9(ARSIZE_S9),
                                       .ARBURST_S9(ARBURST_S9),
                                       .ARLOCK_S9(ARLOCK_S9),
                                       .ARCACHE_S9(ARCACHE_S9),
                                       .ARPROT_S9(ARPROT_S9),
                                       .ARVALID_S9(ARVALID_S9),
                                       .ARREADY_S9(ARREADY_S9),
                                       // AXI SLAVE 9 read response channel signals
                                       .RID_S9(RID_S9),
                                       .RDATA_S9(RDATA_S9),
                                       .RRESP_S9(RRESP_S9),
                                       .RLAST_S9(RLAST_S9),
                                       .RVALID_S9(RVALID_S9),
                                       .RREADY_S9(RREADY_S9),
                                       
                                       // SLAVE 10
                                       // AXI SLAVE 10 write address channel signals
                                       .AWID_S10(AWID_S10),
                                       .AWADDR_S10(AWADDR_S10),
                                       .AWLEN_S10(AWLEN_S10),
                                       .AWSIZE_S10(AWSIZE_S10),
                                       .AWBURST_S10(AWBURST_S10),
                                       .AWLOCK_S10(AWLOCK_S10),
                                       .AWCACHE_S10(AWCACHE_S10),
                                       .AWPROT_S10(AWPROT_S10),
                                       .AWVALID_S10(AWVALID_S10),
                                       .AWREADY_S10(AWREADY_S10),
                                       // AXI SLAVE 10 write data channel signals
                                       .WID_S10(WID_S10),
                                       .WDATA_S10(WDATA_S10),
                                       .WSTRB_S10(WSTRB_S10),
                                       .WLAST_S10(WLAST_S10),
                                       .WVALID_S10(WVALID_S10),
                                       .WREADY_S10(WREADY_S10),
                                       // AXI SLAVE 10 write response channel signals
                                       .BID_S10(BID_S10),
                                       .BRESP_S10(BRESP_S10),
                                       .BVALID_S10(BVALID_S10),
                                       .BREADY_S10(BREADY_S10),
                                       // AXI SLAVE 10 read address channel signals
                                       .ARID_S10(ARID_S10),
                                       .ARADDR_S10(ARADDR_S10),
                                       .ARLEN_S10(ARLEN_S10),
                                       .ARSIZE_S10(ARSIZE_S10),
                                       .ARBURST_S10(ARBURST_S10),
                                       .ARLOCK_S10(ARLOCK_S10),
                                       .ARCACHE_S10(ARCACHE_S10),
                                       .ARPROT_S10(ARPROT_S10),
                                       .ARVALID_S10(ARVALID_S10),
                                       .ARREADY_S10(ARREADY_S10),
                                       // AXI SLAVE 10 read response channel signals
                                       .RID_S10(RID_S10),
                                       .RDATA_S10(RDATA_S10),
                                       .RRESP_S10(RRESP_S10),
                                       .RLAST_S10(RLAST_S10),
                                       .RVALID_S10(RVALID_S10),
                                       .RREADY_S10(RREADY_S10),
                                       
                                       // SLAVE 11
                                       // AXI SLAVE 11 write address channel signals
                                       .AWID_S11(AWID_S11),
                                       .AWADDR_S11(AWADDR_S11),
                                       .AWLEN_S11(AWLEN_S11),
                                       .AWSIZE_S11(AWSIZE_S11),
                                       .AWBURST_S11(AWBURST_S11),
                                       .AWLOCK_S11(AWLOCK_S11),
                                       .AWCACHE_S11(AWCACHE_S11),
                                       .AWPROT_S11(AWPROT_S11),
                                       .AWVALID_S11(AWVALID_S11),
                                       .AWREADY_S11(AWREADY_S11),
                                       // AXI SLAVE 11 write data channel signals
                                       .WID_S11(WID_S11),
                                       .WDATA_S11(WDATA_S11),
                                       .WSTRB_S11(WSTRB_S11),
                                       .WLAST_S11(WLAST_S11),
                                       .WVALID_S11(WVALID_S11),
                                       .WREADY_S11(WREADY_S11),
                                       // AXI SLAVE 11 write response channel signals
                                       .BID_S11(BID_S11),
                                       .BRESP_S11(BRESP_S11),
                                       .BVALID_S11(BVALID_S11),
                                       .BREADY_S11(BREADY_S11),
                                       // AXI SLAVE 11 read address channel signals
                                       .ARID_S11(ARID_S11),
                                       .ARADDR_S11(ARADDR_S11),
                                       .ARLEN_S11(ARLEN_S11),
                                       .ARSIZE_S11(ARSIZE_S11),
                                       .ARBURST_S11(ARBURST_S11),
                                       .ARLOCK_S11(ARLOCK_S11),
                                       .ARCACHE_S11(ARCACHE_S11),
                                       .ARPROT_S11(ARPROT_S11),
                                       .ARVALID_S11(ARVALID_S11),
                                       .ARREADY_S11(ARREADY_S11),
                                       // AXI SLAVE 11 read response channel signals
                                       .RID_S11(RID_S11),
                                       .RDATA_S11(RDATA_S11),
                                       .RRESP_S11(RRESP_S11),
                                       .RLAST_S11(RLAST_S11),
                                       .RVALID_S11(RVALID_S11),
                                       .RREADY_S11(RREADY_S11),
                                       
                                       // SLAVE 12
                                       // AXI SLAVE 12 write address channel signals
                                       .AWID_S12(AWID_S12),
                                       .AWADDR_S12(AWADDR_S12),
                                       .AWLEN_S12(AWLEN_S12),
                                       .AWSIZE_S12(AWSIZE_S12),
                                       .AWBURST_S12(AWBURST_S12),
                                       .AWLOCK_S12(AWLOCK_S12),
                                       .AWCACHE_S12(AWCACHE_S12),
                                       .AWPROT_S12(AWPROT_S12),
                                       .AWVALID_S12(AWVALID_S12),
                                       .AWREADY_S12(AWREADY_S12),
                                       // AXI SLAVE 12 write data channel signals
                                       .WID_S12(WID_S12),
                                       .WDATA_S12(WDATA_S12),
                                       .WSTRB_S12(WSTRB_S12),
                                       .WLAST_S12(WLAST_S12),
                                       .WVALID_S12(WVALID_S12),
                                       .WREADY_S12(WREADY_S12),
                                       // AXI SLAVE 12 write response channel signals
                                       .BID_S12(BID_S12),
                                       .BRESP_S12(BRESP_S12),
                                       .BVALID_S12(BVALID_S12),
                                       .BREADY_S12(BREADY_S12),
                                       // AXI SLAVE 12 read address channel signals
                                       .ARID_S12(ARID_S12),
                                       .ARADDR_S12(ARADDR_S12),
                                       .ARLEN_S12(ARLEN_S12),
                                       .ARSIZE_S12(ARSIZE_S12),
                                       .ARBURST_S12(ARBURST_S12),
                                       .ARLOCK_S12(ARLOCK_S12),
                                       .ARCACHE_S12(ARCACHE_S12),
                                       .ARPROT_S12(ARPROT_S12),
                                       .ARVALID_S12(ARVALID_S12),
                                       .ARREADY_S12(ARREADY_S12),
                                       // AXI SLAVE 12 read response channel signals
                                       .RID_S12(RID_S12),
                                       .RDATA_S12(RDATA_S12),
                                       .RRESP_S12(RRESP_S12),
                                       .RLAST_S12(RLAST_S12),
                                       .RVALID_S12(RVALID_S12),
                                       .RREADY_S12(RREADY_S12),
                                       
                                       // SLAVE 13
                                       // AXI SLAVE 13 write address channel signals
                                       .AWID_S13(AWID_S13),
                                       .AWADDR_S13(AWADDR_S13),
                                       .AWLEN_S13(AWLEN_S13),
                                       .AWSIZE_S13(AWSIZE_S13),
                                       .AWBURST_S13(AWBURST_S13),
                                       .AWLOCK_S13(AWLOCK_S13),
                                       .AWCACHE_S13(AWCACHE_S13),
                                       .AWPROT_S13(AWPROT_S13),
                                       .AWVALID_S13(AWVALID_S13),
                                       .AWREADY_S13(AWREADY_S13),
                                       // AXI SLAVE 13 write data channel signals
                                       .WID_S13(WID_S13),
                                       .WDATA_S13(WDATA_S13),
                                       .WSTRB_S13(WSTRB_S13),
                                       .WLAST_S13(WLAST_S13),
                                       .WVALID_S13(WVALID_S13),
                                       .WREADY_S13(WREADY_S13),
                                       // AXI SLAVE 13 write response channel signals
                                       .BID_S13(BID_S13),
                                       .BRESP_S13(BRESP_S13),
                                       .BVALID_S13(BVALID_S13),
                                       .BREADY_S13(BREADY_S13),
                                       // AXI SLAVE 13 read address channel signals
                                       .ARID_S13(ARID_S13),
                                       .ARADDR_S13(ARADDR_S13),
                                       .ARLEN_S13(ARLEN_S13),
                                       .ARSIZE_S13(ARSIZE_S13),
                                       .ARBURST_S13(ARBURST_S13),
                                       .ARLOCK_S13(ARLOCK_S13),
                                       .ARCACHE_S13(ARCACHE_S13),
                                       .ARPROT_S13(ARPROT_S13),
                                       .ARVALID_S13(ARVALID_S13),
                                       .ARREADY_S13(ARREADY_S13),
                                       // AXI SLAVE 13 read response channel signals
                                       .RID_S13(RID_S13),
                                       .RDATA_S13(RDATA_S13),
                                       .RRESP_S13(RRESP_S13),
                                       .RLAST_S13(RLAST_S13),
                                       .RVALID_S13(RVALID_S13),
                                       .RREADY_S13(RREADY_S13),
                                       
                                       // SLAVE 14
                                       // AXI SLAVE 14 write address channel signals
                                       .AWID_S14(AWID_S14),
                                       .AWADDR_S14(AWADDR_S14),
                                       .AWLEN_S14(AWLEN_S14),
                                       .AWSIZE_S14(AWSIZE_S14),
                                       .AWBURST_S14(AWBURST_S14),
                                       .AWLOCK_S14(AWLOCK_S14),
                                       .AWCACHE_S14(AWCACHE_S14),
                                       .AWPROT_S14(AWPROT_S14),
                                       .AWVALID_S14(AWVALID_S14),
                                       .AWREADY_S14(AWREADY_S14),
                                       // AXI SLAVE 14 write data channel signals
                                       .WID_S14(WID_S14),
                                       .WDATA_S14(WDATA_S14),
                                       .WSTRB_S14(WSTRB_S14),
                                       .WLAST_S14(WLAST_S14),
                                       .WVALID_S14(WVALID_S14),
                                       .WREADY_S14(WREADY_S14),
                                       // AXI SLAVE 14 write response channel signals
                                       .BID_S14(BID_S14),
                                       .BRESP_S14(BRESP_S14),
                                       .BVALID_S14(BVALID_S14),
                                       .BREADY_S14(BREADY_S14),
                                       // AXI SLAVE 14 read address channel signals
                                       .ARID_S14(ARID_S14),
                                       .ARADDR_S14(ARADDR_S14),
                                       .ARLEN_S14(ARLEN_S14),
                                       .ARSIZE_S14(ARSIZE_S14),
                                       .ARBURST_S14(ARBURST_S14),
                                       .ARLOCK_S14(ARLOCK_S14),
                                       .ARCACHE_S14(ARCACHE_S14),
                                       .ARPROT_S14(ARPROT_S14),
                                       .ARVALID_S14(ARVALID_S14),
                                       .ARREADY_S14(ARREADY_S14),
                                       // AXI SLAVE 14 read response channel signals
                                       .RID_S14(RID_S14),
                                       .RDATA_S14(RDATA_S14),
                                       .RRESP_S14(RRESP_S14),
                                       .RLAST_S14(RLAST_S14),
                                       .RVALID_S14(RVALID_S14),
                                       .RREADY_S14(RREADY_S14),
                                       
                                       // SLAVE 15
                                       // AXI SLAVE 15 write address channel signals
                                       .AWID_S15(AWID_S15),
                                       .AWADDR_S15(AWADDR_S15),
                                       .AWLEN_S15(AWLEN_S15),
                                       .AWSIZE_S15(AWSIZE_S15),
                                       .AWBURST_S15(AWBURST_S15),
                                       .AWLOCK_S15(AWLOCK_S15),
                                       .AWCACHE_S15(AWCACHE_S15),
                                       .AWPROT_S15(AWPROT_S15),
                                       .AWVALID_S15(AWVALID_S15),
                                       .AWREADY_S15(AWREADY_S15),
                                       // AXI SLAVE 15 write data channel signals
                                       .WID_S15(WID_S15),
                                       .WDATA_S15(WDATA_S15),
                                       .WSTRB_S15(WSTRB_S15),
                                       .WLAST_S15(WLAST_S15),
                                       .WVALID_S15(WVALID_S15),
                                       .WREADY_S15(WREADY_S15),
                                       // AXI SLAVE 15 write response channel signals
                                       .BID_S15(BID_S15),
                                       .BRESP_S15(BRESP_S15),
                                       .BVALID_S15(BVALID_S15),
                                       .BREADY_S15(BREADY_S15),
                                       // AXI SLAVE 15 read address channel signals
                                       .ARID_S15(ARID_S15),
                                       .ARADDR_S15(ARADDR_S15),
                                       .ARLEN_S15(ARLEN_S15),
                                       .ARSIZE_S15(ARSIZE_S15),
                                       .ARBURST_S15(ARBURST_S15),
                                       .ARLOCK_S15(ARLOCK_S15),
                                       .ARCACHE_S15(ARCACHE_S15),
                                       .ARPROT_S15(ARPROT_S15),
                                       .ARVALID_S15(ARVALID_S15),
                                       .ARREADY_S15(ARREADY_S15),
                                       // AXI SLAVE 15 read response channel signals
                                       .RID_S15(RID_S15),
                                       .RDATA_S15(RDATA_S15),
                                       .RRESP_S15(RRESP_S15),
                                       .RLAST_S15(RLAST_S15),
                                       .RVALID_S15(RVALID_S15),
                                       .RREADY_S15(RREADY_S15),
                                       
                                       // SLAVE 16
                                       // AXI SLAVE 16 write address channel signals
                                       .AWID_S16(AWID_S16),
                                       .AWADDR_S16(AWADDR_S16),
                                       .AWLEN_S16(AWLEN_S16),
                                       .AWSIZE_S16(AWSIZE_S16),
                                       .AWBURST_S16(AWBURST_S16),
                                       .AWLOCK_S16(AWLOCK_S16),
                                       .AWCACHE_S16(AWCACHE_S16),
                                       .AWPROT_S16(AWPROT_S16),
                                       .AWVALID_S16(AWVALID_S16),
                                       .AWREADY_S16(AWREADY_S16),
                                       // AXI SLAVE 16 write data channel signals
                                       .WID_S16(WID_S16),
                                       .WDATA_S16(WDATA_S16),
                                       .WSTRB_S16(WSTRB_S16),
                                       .WLAST_S16(WLAST_S16),
                                       .WVALID_S16(WVALID_S16),
                                       .WREADY_S16(WREADY_S16),
                                       // AXI SLAVE 16 write response channel signals
                                       .BID_S16(BID_S16),
                                       .BRESP_S16(BRESP_S16),
                                       .BVALID_S16(BVALID_S16),
                                       .BREADY_S16(BREADY_S16),
                                       // AXI SLAVE 16 read address channel signals
                                       .ARID_S16(ARID_S16),
                                       .ARADDR_S16(ARADDR_S16),
                                       .ARLEN_S16(ARLEN_S16),
                                       .ARSIZE_S16(ARSIZE_S16),
                                       .ARBURST_S16(ARBURST_S16),
                                       .ARLOCK_S16(ARLOCK_S16),
                                       .ARCACHE_S16(ARCACHE_S16),
                                       .ARPROT_S16(ARPROT_S16),
                                       .ARVALID_S16(ARVALID_S16),
                                       .ARREADY_S16(ARREADY_S16),
                                       // AXI SLAVE 16 read response channel signals
                                       .RID_S16(RID_S16),
                                       .RDATA_S16(RDATA_S16),
                                       .RRESP_S16(RRESP_S16),
                                       .RLAST_S16(RLAST_S16),
                                       .RVALID_S16(RVALID_S16),
                                       .RREADY_S16(RREADY_S16)
                                       
                                       );
                                       
endmodule
                                       
                                    
                                       

