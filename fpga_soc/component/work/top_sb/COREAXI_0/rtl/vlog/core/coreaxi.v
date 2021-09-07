// ****************************************************************************/
// Actel Corporation Proprietary and Confidential
// Copyright 2010 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: CoreAXI - Multi - Master AXI bus interface that supports 
//                        up to 16 slaves 
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
module top_sb_COREAXI_0_COREAXI (
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

    // MASTER 1
    // AXI MASTER 1 write address channel signals
    AWID_M1,
    AWADDR_M1,
    AWLEN_M1,
    AWSIZE_M1,
    AWBURST_M1,
    AWLOCK_M1,
    AWCACHE_M1,
    AWPROT_M1,
    AWVALID_M1,
    AWREADY_M1,
    // AXI MASTER 1 write data channel signals
    WID_M1,
    WDATA_M1,
    WSTRB_M1,
    WLAST_M1,
    WVALID_M1,
    WREADY_M1,
    // AXI MASTER 1 write response channel signals
    BID_M1,
    BRESP_M1,
    BVALID_M1,
    BREADY_M1,
    // AXI MASTER 1 read address channel signals
    ARID_M1,
    ARADDR_M1,
    ARLEN_M1,
    ARSIZE_M1,
    ARBURST_M1,
    ARLOCK_M1,
    ARCACHE_M1,
    ARPROT_M1,
    ARVALID_M1,
    ARREADY_M1,
    // AXI MASTER 1 read response channel signals
    RID_M1,
    RDATA_M1,
    RRESP_M1,
    RLAST_M1,
    RVALID_M1,
    RREADY_M1,

    // MASTER 2
    // AXI MASTER 2 write address channel signals
    AWID_M2,
    AWADDR_M2,
    AWLEN_M2,
    AWSIZE_M2,
    AWBURST_M2,
    AWLOCK_M2,
    AWCACHE_M2,
    AWPROT_M2,
    AWVALID_M2,
    AWREADY_M2,
    // AXI MASTER 2 write data channel signals
    WID_M2,
    WDATA_M2,
    WSTRB_M2,
    WLAST_M2,
    WVALID_M2,
    WREADY_M2,
    // AXI MASTER 2 write response channel signals
    BID_M2,
    BRESP_M2,
    BVALID_M2,
    BREADY_M2,
    // AXI MASTER 2 read address channel signals
    ARID_M2,
    ARADDR_M2,
    ARLEN_M2,
    ARSIZE_M2,
    ARBURST_M2,
    ARLOCK_M2,
    ARCACHE_M2,
    ARPROT_M2,
    ARVALID_M2,
    ARREADY_M2,
    // AXI MASTER 2 read response channel signals
    RID_M2,
    RDATA_M2,
    RRESP_M2,
    RLAST_M2,
    RVALID_M2,
    RREADY_M2,

    // MASTER 3
    // AXI MASTER 3 write address channel signals
    AWID_M3,
    AWADDR_M3,
    AWLEN_M3,
    AWSIZE_M3,
    AWBURST_M3,
    AWLOCK_M3,
    AWCACHE_M3,
    AWPROT_M3,
    AWVALID_M3,
    AWREADY_M3,
    // AXI MASTER 3 write data channel signals
    WID_M3,
    WDATA_M3,
    WSTRB_M3,
    WLAST_M3,
    WVALID_M3,
    WREADY_M3,
    // AXI MASTER 3 write response channel signals
    BID_M3,
    BRESP_M3,
    BVALID_M3,
    BREADY_M3,
    // AXI MASTER 3 read address channel signals
    ARID_M3,
    ARADDR_M3,
    ARLEN_M3,
    ARSIZE_M3,
    ARBURST_M3,
    ARLOCK_M3,
    ARCACHE_M3,
    ARPROT_M3,
    ARVALID_M3,
    ARREADY_M3,
    // AXI MASTER 3 read response channel signals
    RID_M3,
    RDATA_M3,
    RRESP_M3,
    RLAST_M3,
    RVALID_M3,
    RREADY_M3,    

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
    RREADY_S0,

    // SLAVE 1
    // AXI SLAVE 1 write address channel signals
    AWID_S1,
    AWADDR_S1,
    AWLEN_S1,
    AWSIZE_S1,
    AWBURST_S1,
    AWLOCK_S1,
    AWCACHE_S1,
    AWPROT_S1,
    AWVALID_S1,
    AWREADY_S1,
    // AXI SLAVE 1 write data channel signals
    WID_S1,
    WDATA_S1,
    WSTRB_S1,
    WLAST_S1,
    WVALID_S1,
    WREADY_S1,
    // AXI SLAVE 1 write response channel signals
    BID_S1,
    BRESP_S1,
    BVALID_S1,
    BREADY_S1,
    // AXI SLAVE 1 read address channel signals
    ARID_S1,
    ARADDR_S1,
    ARLEN_S1,
    ARSIZE_S1,
    ARBURST_S1,
    ARLOCK_S1,
    ARCACHE_S1,
    ARPROT_S1,
    ARVALID_S1,
    ARREADY_S1,
    // AXI SLAVE 1 read response channel signals
    RID_S1,
    RDATA_S1,
    RRESP_S1,
    RLAST_S1,
    RVALID_S1,
    RREADY_S1,

    // SLAVE 2
    // AXI SLAVE 2 write address channel signals
    AWID_S2,
    AWADDR_S2,
    AWLEN_S2,
    AWSIZE_S2,
    AWBURST_S2,
    AWLOCK_S2,
    AWCACHE_S2,
    AWPROT_S2,
    AWVALID_S2,
    AWREADY_S2,
    // AXI SLAVE 2 write data channel signals
    WID_S2,
    WDATA_S2,
    WSTRB_S2,
    WLAST_S2,
    WVALID_S2,
    WREADY_S2,
    // AXI SLAVE 2 write response channel signals
    BID_S2,
    BRESP_S2,
    BVALID_S2,
    BREADY_S2,
    // AXI SLAVE 2 read address channel signals
    ARID_S2,
    ARADDR_S2,
    ARLEN_S2,
    ARSIZE_S2,
    ARBURST_S2,
    ARLOCK_S2,
    ARCACHE_S2,
    ARPROT_S2,
    ARVALID_S2,
    ARREADY_S2,
    // AXI SLAVE 2 read response channel signals
    RID_S2,
    RDATA_S2,
    RRESP_S2,
    RLAST_S2,
    RVALID_S2,
    RREADY_S2,

    // SLAVE 3
    // AXI SLAVE 3 write address channel signals
    AWID_S3,
    AWADDR_S3,
    AWLEN_S3,
    AWSIZE_S3,
    AWBURST_S3,
    AWLOCK_S3,
    AWCACHE_S3,
    AWPROT_S3,
    AWVALID_S3,
    AWREADY_S3,
    // AXI SLAVE 3 write data channel signals
    WID_S3,
    WDATA_S3,
    WSTRB_S3,
    WLAST_S3,
    WVALID_S3,
    WREADY_S3,
    // AXI SLAVE 3 write response channel signals
    BID_S3,
    BRESP_S3,
    BVALID_S3,
    BREADY_S3,
    // AXI SLAVE 3 read address channel signals
    ARID_S3,
    ARADDR_S3,
    ARLEN_S3,
    ARSIZE_S3,
    ARBURST_S3,
    ARLOCK_S3,
    ARCACHE_S3,
    ARPROT_S3,
    ARVALID_S3,
    ARREADY_S3,
    // AXI SLAVE 3 read response channel signals
    RID_S3,
    RDATA_S3,
    RRESP_S3,
    RLAST_S3,
    RVALID_S3,
    RREADY_S3,

    // SLAVE 4
    // AXI SLAVE 4 write address channel signals
    AWID_S4,
    AWADDR_S4,
    AWLEN_S4,
    AWSIZE_S4,
    AWBURST_S4,
    AWLOCK_S4,
    AWCACHE_S4,
    AWPROT_S4,
    AWVALID_S4,
    AWREADY_S4,
    // AXI SLAVE 4 write data channel signals
    WID_S4,
    WDATA_S4,
    WSTRB_S4,
    WLAST_S4,
    WVALID_S4,
    WREADY_S4,
    // AXI SLAVE 4 write response channel signals
    BID_S4,
    BRESP_S4,
    BVALID_S4,
    BREADY_S4,
    // AXI SLAVE 4 read address channel signals
    ARID_S4,
    ARADDR_S4,
    ARLEN_S4,
    ARSIZE_S4,
    ARBURST_S4,
    ARLOCK_S4,
    ARCACHE_S4,
    ARPROT_S4,
    ARVALID_S4,
    ARREADY_S4,
    // AXI SLAVE 4 read response channel signals
    RID_S4,
    RDATA_S4,
    RRESP_S4,
    RLAST_S4,
    RVALID_S4,
    RREADY_S4,

    // SLAVE 5
    // AXI SLAVE 5 write address channel signals
    AWID_S5,
    AWADDR_S5,
    AWLEN_S5,
    AWSIZE_S5,
    AWBURST_S5,
    AWLOCK_S5,
    AWCACHE_S5,
    AWPROT_S5,
    AWVALID_S5,
    AWREADY_S5,
    // AXI SLAVE 5 write data channel signals
    WID_S5,
    WDATA_S5,
    WSTRB_S5,
    WLAST_S5,
    WVALID_S5,
    WREADY_S5,
    // AXI SLAVE 5 write response channel signals
    BID_S5,
    BRESP_S5,
    BVALID_S5,
    BREADY_S5,
    // AXI SLAVE 5 read address channel signals
    ARID_S5,
    ARADDR_S5,
    ARLEN_S5,
    ARSIZE_S5,
    ARBURST_S5,
    ARLOCK_S5,
    ARCACHE_S5,
    ARPROT_S5,
    ARVALID_S5,
    ARREADY_S5,
    // AXI SLAVE 5 read response channel signals
    RID_S5,
    RDATA_S5,
    RRESP_S5,
    RLAST_S5,
    RVALID_S5,
    RREADY_S5,

    // SLAVE 6
    // AXI SLAVE 6 write address channel signals
    AWID_S6,
    AWADDR_S6,
    AWLEN_S6,
    AWSIZE_S6,
    AWBURST_S6,
    AWLOCK_S6,
    AWCACHE_S6,
    AWPROT_S6,
    AWVALID_S6,
    AWREADY_S6,
    // AXI SLAVE 6 write data channel signals
    WID_S6,
    WDATA_S6,
    WSTRB_S6,
    WLAST_S6,
    WVALID_S6,
    WREADY_S6,
    // AXI SLAVE 6 write response channel signals
    BID_S6,
    BRESP_S6,
    BVALID_S6,
    BREADY_S6,
    // AXI SLAVE 6 read address channel signals
    ARID_S6,
    ARADDR_S6,
    ARLEN_S6,
    ARSIZE_S6,
    ARBURST_S6,
    ARLOCK_S6,
    ARCACHE_S6,
    ARPROT_S6,
    ARVALID_S6,
    ARREADY_S6,
    // AXI SLAVE 6 read response channel signals
    RID_S6,
    RDATA_S6,
    RRESP_S6,
    RLAST_S6,
    RVALID_S6,
    RREADY_S6,

    // SLAVE 7
    // AXI SLAVE 7 write address channel signals
    AWID_S7,
    AWADDR_S7,
    AWLEN_S7,
    AWSIZE_S7,
    AWBURST_S7,
    AWLOCK_S7,
    AWCACHE_S7,
    AWPROT_S7,
    AWVALID_S7,
    AWREADY_S7,
    // AXI SLAVE 7 write data channel signals
    WID_S7,
    WDATA_S7,
    WSTRB_S7,
    WLAST_S7,
    WVALID_S7,
    WREADY_S7,
    // AXI SLAVE 7 write response channel signals
    BID_S7,
    BRESP_S7,
    BVALID_S7,
    BREADY_S7,
    // AXI SLAVE 7 read address channel signals
    ARID_S7,
    ARADDR_S7,
    ARLEN_S7,
    ARSIZE_S7,
    ARBURST_S7,
    ARLOCK_S7,
    ARCACHE_S7,
    ARPROT_S7,
    ARVALID_S7,
    ARREADY_S7,
    // AXI SLAVE 7 read response channel signals
    RID_S7,
    RDATA_S7,
    RRESP_S7,
    RLAST_S7,
    RVALID_S7,
    RREADY_S7,

    // SLAVE 8
    // AXI SLAVE 8 write address channel signals
    AWID_S8,
    AWADDR_S8,
    AWLEN_S8,
    AWSIZE_S8,
    AWBURST_S8,
    AWLOCK_S8,
    AWCACHE_S8,
    AWPROT_S8,
    AWVALID_S8,
    AWREADY_S8,
    // AXI SLAVE 8 write data channel signals
    WID_S8,
    WDATA_S8,
    WSTRB_S8,
    WLAST_S8,
    WVALID_S8,
    WREADY_S8,
    // AXI SLAVE 8 write response channel signals
    BID_S8,
    BRESP_S8,
    BVALID_S8,
    BREADY_S8,
    // AXI SLAVE 8 read address channel signals
    ARID_S8,
    ARADDR_S8,
    ARLEN_S8,
    ARSIZE_S8,
    ARBURST_S8,
    ARLOCK_S8,
    ARCACHE_S8,
    ARPROT_S8,
    ARVALID_S8,
    ARREADY_S8,
    // AXI SLAVE 8 read response channel signals
    RID_S8,
    RDATA_S8,
    RRESP_S8,
    RLAST_S8,
    RVALID_S8,
    RREADY_S8,

    // SLAVE 9
    // AXI SLAVE 9 write address channel signals
    AWID_S9,
    AWADDR_S9,
    AWLEN_S9,
    AWSIZE_S9,
    AWBURST_S9,
    AWLOCK_S9,
    AWCACHE_S9,
    AWPROT_S9,
    AWVALID_S9,
    AWREADY_S9,
    // AXI SLAVE 9 write data channel signals
    WID_S9,
    WDATA_S9,
    WSTRB_S9,
    WLAST_S9,
    WVALID_S9,
    WREADY_S9,
    // AXI SLAVE 9 write response channel signals
    BID_S9,
    BRESP_S9,
    BVALID_S9,
    BREADY_S9,
    // AXI SLAVE 9 read address channel signals
    ARID_S9,
    ARADDR_S9,
    ARLEN_S9,
    ARSIZE_S9,
    ARBURST_S9,
    ARLOCK_S9,
    ARCACHE_S9,
    ARPROT_S9,
    ARVALID_S9,
    ARREADY_S9,
    // AXI SLAVE 9 read response channel signals
    RID_S9,
    RDATA_S9,
    RRESP_S9,
    RLAST_S9,
    RVALID_S9,
    RREADY_S9,

    // SLAVE 10
    // AXI SLAVE 10 write address channel signals
    AWID_S10,
    AWADDR_S10,
    AWLEN_S10,
    AWSIZE_S10,
    AWBURST_S10,
    AWLOCK_S10,
    AWCACHE_S10,
    AWPROT_S10,
    AWVALID_S10,
    AWREADY_S10,
    // AXI SLAVE 10 write data channel signals
    WID_S10,
    WDATA_S10,
    WSTRB_S10,
    WLAST_S10,
    WVALID_S10,
    WREADY_S10,
    // AXI SLAVE 10 write response channel signals
    BID_S10,
    BRESP_S10,
    BVALID_S10,
    BREADY_S10,
    // AXI SLAVE 10 read address channel signals
    ARID_S10,
    ARADDR_S10,
    ARLEN_S10,
    ARSIZE_S10,
    ARBURST_S10,
    ARLOCK_S10,
    ARCACHE_S10,
    ARPROT_S10,
    ARVALID_S10,
    ARREADY_S10,
    // AXI SLAVE 10 read response channel signals
    RID_S10,
    RDATA_S10,
    RRESP_S10,
    RLAST_S10,
    RVALID_S10,
    RREADY_S10,

    // SLAVE 11
    // AXI SLAVE 11 write address channel signals
    AWID_S11,
    AWADDR_S11,
    AWLEN_S11,
    AWSIZE_S11,
    AWBURST_S11,
    AWLOCK_S11,
    AWCACHE_S11,
    AWPROT_S11,
    AWVALID_S11,
    AWREADY_S11,
    // AXI SLAVE 11 write data channel signals
    WID_S11,
    WDATA_S11,
    WSTRB_S11,
    WLAST_S11,
    WVALID_S11,
    WREADY_S11,
    // AXI SLAVE 11 write response channel signals
    BID_S11,
    BRESP_S11,
    BVALID_S11,
    BREADY_S11,
    // AXI SLAVE 11 read address channel signals
    ARID_S11,
    ARADDR_S11,
    ARLEN_S11,
    ARSIZE_S11,
    ARBURST_S11,
    ARLOCK_S11,
    ARCACHE_S11,
    ARPROT_S11,
    ARVALID_S11,
    ARREADY_S11,
    // AXI SLAVE 11 read response channel signals
    RID_S11,
    RDATA_S11,
    RRESP_S11,
    RLAST_S11,
    RVALID_S11,
    RREADY_S11,

    // SLAVE 12
    // AXI SLAVE 12 write address channel signals
    AWID_S12,
    AWADDR_S12,
    AWLEN_S12,
    AWSIZE_S12,
    AWBURST_S12,
    AWLOCK_S12,
    AWCACHE_S12,
    AWPROT_S12,
    AWVALID_S12,
    AWREADY_S12,
    // AXI SLAVE 12 write data channel signals
    WID_S12,
    WDATA_S12,
    WSTRB_S12,
    WLAST_S12,
    WVALID_S12,
    WREADY_S12,
    // AXI SLAVE 12 write response channel signals
    BID_S12,
    BRESP_S12,
    BVALID_S12,
    BREADY_S12,
    // AXI SLAVE 12 read address channel signals
    ARID_S12,
    ARADDR_S12,
    ARLEN_S12,
    ARSIZE_S12,
    ARBURST_S12,
    ARLOCK_S12,
    ARCACHE_S12,
    ARPROT_S12,
    ARVALID_S12,
    ARREADY_S12,
    // AXI SLAVE 12 read response channel signals
    RID_S12,
    RDATA_S12,
    RRESP_S12,
    RLAST_S12,
    RVALID_S12,
    RREADY_S12,

    // SLAVE 13
    // AXI SLAVE 13 write address channel signals
    AWID_S13,
    AWADDR_S13,
    AWLEN_S13,
    AWSIZE_S13,
    AWBURST_S13,
    AWLOCK_S13,
    AWCACHE_S13,
    AWPROT_S13,
    AWVALID_S13,
    AWREADY_S13,
    // AXI SLAVE 13 write data channel signals
    WID_S13,
    WDATA_S13,
    WSTRB_S13,
    WLAST_S13,
    WVALID_S13,
    WREADY_S13,
    // AXI SLAVE 13 write response channel signals
    BID_S13,
    BRESP_S13,
    BVALID_S13,
    BREADY_S13,
    // AXI SLAVE 13 read address channel signals
    ARID_S13,
    ARADDR_S13,
    ARLEN_S13,
    ARSIZE_S13,
    ARBURST_S13,
    ARLOCK_S13,
    ARCACHE_S13,
    ARPROT_S13,
    ARVALID_S13,
    ARREADY_S13,
    // AXI SLAVE 13 read response channel signals
    RID_S13,
    RDATA_S13,
    RRESP_S13,
    RLAST_S13,
    RVALID_S13,
    RREADY_S13,

    // SLAVE 14
    // AXI SLAVE 14 write address channel signals
    AWID_S14,
    AWADDR_S14,
    AWLEN_S14,
    AWSIZE_S14,
    AWBURST_S14,
    AWLOCK_S14,
    AWCACHE_S14,
    AWPROT_S14,
    AWVALID_S14,
    AWREADY_S14,
    // AXI SLAVE 14 write data channel signals
    WID_S14,
    WDATA_S14,
    WSTRB_S14,
    WLAST_S14,
    WVALID_S14,
    WREADY_S14,
    // AXI SLAVE 14 write response channel signals
    BID_S14,
    BRESP_S14,
    BVALID_S14,
    BREADY_S14,
    // AXI SLAVE 14 read address channel signals
    ARID_S14,
    ARADDR_S14,
    ARLEN_S14,
    ARSIZE_S14,
    ARBURST_S14,
    ARLOCK_S14,
    ARCACHE_S14,
    ARPROT_S14,
    ARVALID_S14,
    ARREADY_S14,
    // AXI SLAVE 14 read response channel signals
    RID_S14,
    RDATA_S14,
    RRESP_S14,
    RLAST_S14,
    RVALID_S14,
    RREADY_S14,

    // SLAVE 15
    // AXI SLAVE 15 write address channel signals
    AWID_S15,
    AWADDR_S15,
    AWLEN_S15,
    AWSIZE_S15,
    AWBURST_S15,
    AWLOCK_S15,
    AWCACHE_S15,
    AWPROT_S15,
    AWVALID_S15,
    AWREADY_S15,
    // AXI SLAVE 15 write data channel signals
    WID_S15,
    WDATA_S15,
    WSTRB_S15,
    WLAST_S15,
    WVALID_S15,
    WREADY_S15,
    // AXI SLAVE 15 write response channel signals
    BID_S15,
    BRESP_S15,
    BVALID_S15,
    BREADY_S15,
    // AXI SLAVE 15 read address channel signals
    ARID_S15,
    ARADDR_S15,
    ARLEN_S15,
    ARSIZE_S15,
    ARBURST_S15,
    ARLOCK_S15,
    ARCACHE_S15,
    ARPROT_S15,
    ARVALID_S15,
    ARREADY_S15,
    // AXI SLAVE 15 read response channel signals
    RID_S15,
    RDATA_S15,
    RRESP_S15,
    RLAST_S15,
    RVALID_S15,
    RREADY_S15,

    // SLAVE 16
    // AXI SLAVE 16 write address channel signals
    AWID_S16,
    AWADDR_S16,
    AWLEN_S16,
    AWSIZE_S16,
    AWBURST_S16,
    AWLOCK_S16,
    AWCACHE_S16,
    AWPROT_S16,
    AWVALID_S16,
    AWREADY_S16,
    // AXI SLAVE 16 write data channel signals
    WID_S16,
    WDATA_S16,
    WSTRB_S16,
    WLAST_S16,
    WVALID_S16,
    WREADY_S16,
    // AXI SLAVE 16 write response channel signals
    BID_S16,
    BRESP_S16,
    BVALID_S16,
    BREADY_S16,
    // AXI SLAVE 16 read address channel signals
    ARID_S16,
    ARADDR_S16,
    ARLEN_S16,
    ARSIZE_S16,
    ARBURST_S16,
    ARLOCK_S16,
    ARCACHE_S16,
    ARPROT_S16,
    ARVALID_S16,
    ARREADY_S16,
    // AXI SLAVE 16 read response channel signals
    RID_S16,
    RDATA_S16,
    RRESP_S16,
    RLAST_S16,
    RVALID_S16,
    RREADY_S16

);

   // --------------------------------------------------------------------------
   // Parameter Declaration
   // --------------------------------------------------------------------------
    parameter FAMILY               = 19;
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

    localparam NUM_SLAVE_SLOT       = 16;  // 1 - 16
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
    parameter RD_ACCEPTANCE        = 4;  // 1 - 4
    parameter WR_ACCEPTANCE        = 4;  // 1 - 4

   // --------------------------------------------------------------------------
   // Local Parameter Declaration
   // --------------------------------------------------------------------------
   localparam AWIDTH1 = (MEMSPACE == 1) ? 32 : ((MEMSPACE == 2) ? 28 : ((MEMSPACE == 3) ? 24 : ((MEMSPACE == 4) ? 20 : ((MEMSPACE == 5) ? 16 : ((MEMSPACE == 6) ? 12 : 32)))));
   localparam AWIDTH2 = (HGS_CFG == 1 ) ? 32 : ((HGS_CFG == 2 ) ? 28 : ((HGS_CFG == 3 ) ? 24 : ((HGS_CFG == 4 ) ? 20 : ((HGS_CFG == 5 ) ? 16 : ((HGS_CFG == 6 ) ? 12 : 32)))));
   localparam AXI_AWIDTH           = (MEMSPACE == 0) ? AWIDTH2 : AWIDTH1;
   
   localparam AXI_STRBWIDTH              = AXI_DWIDTH/8;
   localparam BASE_ID_WIDTH              = 2;
   localparam SINGLE_MASTER              = (NUM_MASTER_SLOT == 1) ? 1 : 0;
   localparam SINGLE_SLAVE               = (NUM_SLAVE_SLOT  == 1) ? 1 : 0;
   localparam SINGLE_MASTER_SINGLE_SLAVE = (NUM_MASTER_SLOT == 1) ? ((NUM_SLAVE_SLOT == 1) ? 1 : 0 ) : 0;
   localparam COMB_REG                   = {SC_0, SC_1, SC_2, SC_3, SC_4, SC_5, SC_6, SC_7, SC_8, SC_9, SC_10, SC_11, SC_12, SC_13, SC_14, SC_15};

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

   localparam SYNC_RESET      = (FAMILY == 25) ? 1 : 0; // 0 = async mode, 1 = sync mode


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

    // MASTER 1
    // AXI MASTER 0 write address channel signals
    input  [ID_WIDTH-1:0]        AWID_M1;
    input  [31:0]      AWADDR_M1;
    input  [3:0]                 AWLEN_M1;
    input  [2:0]                 AWSIZE_M1;
    input  [1:0]                 AWBURST_M1;
    input  [1:0]                 AWLOCK_M1;
    input  [3:0]                 AWCACHE_M1;
    input  [2:0]                 AWPROT_M1;
    input                        AWVALID_M1;
    output                       AWREADY_M1;
    // AXI MASTER 0 write data channel signals
    input  [ID_WIDTH-1:0]        WID_M1;
    input  [AXI_DWIDTH-1:0]      WDATA_M1;
    input  [AXI_STRBWIDTH-1:0]   WSTRB_M1;
    input                        WLAST_M1;
    input                        WVALID_M1;
    output                       WREADY_M1;
    // AXI MASTER 0 write response channel signals
    output [ID_WIDTH-1:0]        BID_M1;
    output [1:0]                 BRESP_M1;
    output                       BVALID_M1;
    input                        BREADY_M1;
    // AXI MASTER 0 read address channel signals
    input  [ID_WIDTH-1:0]        ARID_M1;
    input  [31:0]      ARADDR_M1;
    input  [3:0]                 ARLEN_M1;
    input  [2:0]                 ARSIZE_M1;
    input  [1:0]                 ARBURST_M1;
    input  [1:0]                 ARLOCK_M1;
    input  [3:0]                 ARCACHE_M1;
    input  [2:0]                 ARPROT_M1;
    input                        ARVALID_M1;
    output                       ARREADY_M1;
    // AXI MASTER 0 read response channel signals
    output [ID_WIDTH-1:0]        RID_M1;
    output [AXI_DWIDTH-1:0]      RDATA_M1;
    output [1:0]                 RRESP_M1;
    output                       RLAST_M1;
    output                       RVALID_M1;
    input                        RREADY_M1;

    // MASTER 2
    // AXI MASTER 0 write address channel signals
    input  [ID_WIDTH-1:0]        AWID_M2;
    input  [31:0]      AWADDR_M2;
    input  [3:0]                 AWLEN_M2;
    input  [2:0]                 AWSIZE_M2;
    input  [1:0]                 AWBURST_M2;
    input  [1:0]                 AWLOCK_M2;
    input  [3:0]                 AWCACHE_M2;
    input  [2:0]                 AWPROT_M2;
    input                        AWVALID_M2;
    output                       AWREADY_M2;
    // AXI MASTER 0 write data channel signals
    input  [ID_WIDTH-1:0]        WID_M2;
    input  [AXI_DWIDTH-1:0]      WDATA_M2;
    input  [AXI_STRBWIDTH-1:0]   WSTRB_M2;
    input                        WLAST_M2;
    input                        WVALID_M2;
    output                       WREADY_M2;
    // AXI MASTER 0 write response channel signals
    output [ID_WIDTH-1:0]        BID_M2;
    output [1:0]                 BRESP_M2;
    output                       BVALID_M2;
    input                        BREADY_M2;
    // AXI MASTER 0 read address channel signals
    input  [ID_WIDTH-1:0]        ARID_M2;
    input  [31:0]      ARADDR_M2;
    input  [3:0]                 ARLEN_M2;
    input  [2:0]                 ARSIZE_M2;
    input  [1:0]                 ARBURST_M2;
    input  [1:0]                 ARLOCK_M2;
    input  [3:0]                 ARCACHE_M2;
    input  [2:0]                 ARPROT_M2;
    input                        ARVALID_M2;
    output                       ARREADY_M2;
    // AXI MASTER 0 read response channel signals
    output [ID_WIDTH-1:0]        RID_M2;
    output [AXI_DWIDTH-1:0]      RDATA_M2;
    output [1:0]                 RRESP_M2;
    output                       RLAST_M2;
    output                       RVALID_M2;
    input                        RREADY_M2;

    // MASTER 3
    // AXI MASTER 0 write address channel signals
    input  [ID_WIDTH-1:0]        AWID_M3;
    input  [31:0]      AWADDR_M3;
    input  [3:0]                 AWLEN_M3;
    input  [2:0]                 AWSIZE_M3;
    input  [1:0]                 AWBURST_M3;
    input  [1:0]                 AWLOCK_M3;
    input  [3:0]                 AWCACHE_M3;
    input  [2:0]                 AWPROT_M3;
    input                        AWVALID_M3;
    output                       AWREADY_M3;
    // AXI MASTER 0 write data channel signals
    input  [ID_WIDTH-1:0]        WID_M3;
    input  [AXI_DWIDTH-1:0]      WDATA_M3;
    input  [AXI_STRBWIDTH-1:0]   WSTRB_M3;
    input                        WLAST_M3;
    input                        WVALID_M3;
    output                       WREADY_M3;
    // AXI MASTER 0 write response channel signals
    output [ID_WIDTH-1:0]        BID_M3;
    output [1:0]                 BRESP_M3;
    output                       BVALID_M3;
    input                        BREADY_M3;
    // AXI MASTER 0 read address channel signals
    input  [ID_WIDTH-1:0]        ARID_M3;
    input  [31:0]      ARADDR_M3;
    input  [3:0]                 ARLEN_M3;
    input  [2:0]                 ARSIZE_M3;
    input  [1:0]                 ARBURST_M3;
    input  [1:0]                 ARLOCK_M3;
    input  [3:0]                 ARCACHE_M3;
    input  [2:0]                 ARPROT_M3;
    input                        ARVALID_M3;
    output                       ARREADY_M3;
    // AXI MASTER 0 read response channel signals
    output [ID_WIDTH-1:0]        RID_M3;
    output [AXI_DWIDTH-1:0]      RDATA_M3;
    output [1:0]                 RRESP_M3;
    output                       RLAST_M3;
    output                       RVALID_M3;
    input                        RREADY_M3;

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

    // SLAVE 1
    // AXI SLAVE 1 write address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S1;
    output [31:0]      AWADDR_S1;
    output [3:0]                 AWLEN_S1;
    output [2:0]                 AWSIZE_S1;
    output [1:0]                 AWBURST_S1;
    output [1:0]                 AWLOCK_S1;
    output [3:0]                 AWCACHE_S1;
    output [2:0]                 AWPROT_S1;
    output                       AWVALID_S1;
    input                        AWREADY_S1;
    // AXI SLAVE 0 write data channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S1;
    output [AXI_DWIDTH-1:0]      WDATA_S1;
    output [AXI_STRBWIDTH-1:0]   WSTRB_S1;
    output                       WLAST_S1;
    output                       WVALID_S1;
    input                        WREADY_S1;
    // AXI SLAVE 0 write response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S1;
    input  [1:0]                 BRESP_S1;
    input                        BVALID_S1;
    output                       BREADY_S1;
    // AXI SLAVE 0 read address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S1;
    output [31:0]      ARADDR_S1;
    output [3:0]                 ARLEN_S1;
    output [2:0]                 ARSIZE_S1;
    output [1:0]                 ARBURST_S1;
    output [1:0]                 ARLOCK_S1;
    output [3:0]                 ARCACHE_S1;
    output [2:0]                 ARPROT_S1;
    output                       ARVALID_S1;
    input                        ARREADY_S1;
    // AXI SLAVE 0 read response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S1;
    input  [AXI_DWIDTH-1:0]      RDATA_S1;
    input  [1:0]                 RRESP_S1;
    input                        RLAST_S1;
    input                        RVALID_S1;
    output                       RREADY_S1;

    // SLAVE 2
    // AXI SLAVE 2 write address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S2;
    output [31:0]      AWADDR_S2;
    output [3:0]                 AWLEN_S2;
    output [2:0]                 AWSIZE_S2;
    output [1:0]                 AWBURST_S2;
    output [1:0]                 AWLOCK_S2;
    output [3:0]                 AWCACHE_S2;
    output [2:0]                 AWPROT_S2;
    output                       AWVALID_S2;
    input                        AWREADY_S2;
    // AXI SLAVE 0 write data channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S2;
    output [AXI_DWIDTH-1:0]      WDATA_S2;
    output [AXI_STRBWIDTH-1:0]   WSTRB_S2;
    output                       WLAST_S2;
    output                       WVALID_S2;
    input                        WREADY_S2;
    // AXI SLAVE 0 write response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S2;
    input  [1:0]                 BRESP_S2;
    input                        BVALID_S2;
    output                       BREADY_S2;
    // AXI SLAVE 0 read address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S2;
    output [31:0]      ARADDR_S2;
    output [3:0]                 ARLEN_S2;
    output [2:0]                 ARSIZE_S2;
    output [1:0]                 ARBURST_S2;
    output [1:0]                 ARLOCK_S2;
    output [3:0]                 ARCACHE_S2;
    output [2:0]                 ARPROT_S2;
    output                       ARVALID_S2;
    input                        ARREADY_S2;
    // AXI SLAVE 0 read response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S2;
    input  [AXI_DWIDTH-1:0]      RDATA_S2;
    input  [1:0]                 RRESP_S2;
    input                        RLAST_S2;
    input                        RVALID_S2;
    output                       RREADY_S2;

    // SLAVE 3
    // AXI SLAVE 3 write address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S3;
    output [31:0]      AWADDR_S3;
    output [3:0]                 AWLEN_S3;
    output [2:0]                 AWSIZE_S3;
    output [1:0]                 AWBURST_S3;
    output [1:0]                 AWLOCK_S3;
    output [3:0]                 AWCACHE_S3;
    output [2:0]                 AWPROT_S3;
    output                       AWVALID_S3;
    input                        AWREADY_S3;
    // AXI SLAVE 0 write data channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S3;
    output [AXI_DWIDTH-1:0]      WDATA_S3;
    output [AXI_STRBWIDTH-1:0]   WSTRB_S3;
    output                       WLAST_S3;
    output                       WVALID_S3;
    input                        WREADY_S3;
    // AXI SLAVE 0 write response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S3;
    input  [1:0]                 BRESP_S3;
    input                        BVALID_S3;
    output                       BREADY_S3;
    // AXI SLAVE 0 read address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S3;
    output [31:0]      ARADDR_S3;
    output [3:0]                 ARLEN_S3;
    output [2:0]                 ARSIZE_S3;
    output [1:0]                 ARBURST_S3;
    output [1:0]                 ARLOCK_S3;
    output [3:0]                 ARCACHE_S3;
    output [2:0]                 ARPROT_S3;
    output                       ARVALID_S3;
    input                        ARREADY_S3;
    // AXI SLAVE 0 read response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S3;
    input  [AXI_DWIDTH-1:0]      RDATA_S3;
    input  [1:0]                 RRESP_S3;
    input                        RLAST_S3;
    input                        RVALID_S3;
    output                       RREADY_S3;

    // SLAVE 4
    // AXI SLAVE 4 write address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S4;
    output [31:0]      AWADDR_S4;
    output [3:0]                 AWLEN_S4;
    output [2:0]                 AWSIZE_S4;
    output [1:0]                 AWBURST_S4;
    output [1:0]                 AWLOCK_S4;
    output [3:0]                 AWCACHE_S4;
    output [2:0]                 AWPROT_S4;
    output                       AWVALID_S4;
    input                        AWREADY_S4;
    // AXI SLAVE 0 write data channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S4;
    output [AXI_DWIDTH-1:0]      WDATA_S4;
    output [AXI_STRBWIDTH-1:0]   WSTRB_S4;
    output                       WLAST_S4;
    output                       WVALID_S4;
    input                        WREADY_S4;
    // AXI SLAVE 0 write response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S4;
    input  [1:0]                 BRESP_S4;
    input                        BVALID_S4;
    output                       BREADY_S4;
    // AXI SLAVE 0 read address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S4;
    output [31:0]      ARADDR_S4;
    output [3:0]                 ARLEN_S4;
    output [2:0]                 ARSIZE_S4;
    output [1:0]                 ARBURST_S4;
    output [1:0]                 ARLOCK_S4;
    output [3:0]                 ARCACHE_S4;
    output [2:0]                 ARPROT_S4;
    output                       ARVALID_S4;
    input                        ARREADY_S4;
    // AXI SLAVE 0 read response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S4;
    input  [AXI_DWIDTH-1:0]      RDATA_S4;
    input  [1:0]                 RRESP_S4;
    input                        RLAST_S4;
    input                        RVALID_S4;
    output                       RREADY_S4;

    // SLAVE 5
    // AXI SLAVE 5 write address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S5;
    output [31:0]      AWADDR_S5;
    output [3:0]                 AWLEN_S5;
    output [2:0]                 AWSIZE_S5;
    output [1:0]                 AWBURST_S5;
    output [1:0]                 AWLOCK_S5;
    output [3:0]                 AWCACHE_S5;
    output [2:0]                 AWPROT_S5;
    output                       AWVALID_S5;
    input                        AWREADY_S5;
    // AXI SLAVE 0 write data channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S5;
    output [AXI_DWIDTH-1:0]      WDATA_S5;
    output [AXI_STRBWIDTH-1:0]   WSTRB_S5;
    output                       WLAST_S5;
    output                       WVALID_S5;
    input                        WREADY_S5;
    // AXI SLAVE 0 write response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S5;
    input  [1:0]                 BRESP_S5;
    input                        BVALID_S5;
    output                       BREADY_S5;
    // AXI SLAVE 0 read address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S5;
    output [31:0]      ARADDR_S5;
    output [3:0]                 ARLEN_S5;
    output [2:0]                 ARSIZE_S5;
    output [1:0]                 ARBURST_S5;
    output [1:0]                 ARLOCK_S5;
    output [3:0]                 ARCACHE_S5;
    output [2:0]                 ARPROT_S5;
    output                       ARVALID_S5;
    input                        ARREADY_S5;
    // AXI SLAVE 0 read response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S5;
    input  [AXI_DWIDTH-1:0]      RDATA_S5;
    input  [1:0]                 RRESP_S5;
    input                        RLAST_S5;
    input                        RVALID_S5;
    output                       RREADY_S5;

    // SLAVE 6
    // AXI SLAVE 6 write address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S6;
    output [31:0]      AWADDR_S6;
    output [3:0]                 AWLEN_S6;
    output [2:0]                 AWSIZE_S6;
    output [1:0]                 AWBURST_S6;
    output [1:0]                 AWLOCK_S6;
    output [3:0]                 AWCACHE_S6;
    output [2:0]                 AWPROT_S6;
    output                       AWVALID_S6;
    input                        AWREADY_S6;
    // AXI SLAVE 0 write data channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S6;
    output [AXI_DWIDTH-1:0]      WDATA_S6;
    output [AXI_STRBWIDTH-1:0]   WSTRB_S6;
    output                       WLAST_S6;
    output                       WVALID_S6;
    input                        WREADY_S6;
    // AXI SLAVE 0 write response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S6;
    input  [1:0]                 BRESP_S6;
    input                        BVALID_S6;
    output                       BREADY_S6;
    // AXI SLAVE 0 read address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S6;
    output [31:0]      ARADDR_S6;
    output [3:0]                 ARLEN_S6;
    output [2:0]                 ARSIZE_S6;
    output [1:0]                 ARBURST_S6;
    output [1:0]                 ARLOCK_S6;
    output [3:0]                 ARCACHE_S6;
    output [2:0]                 ARPROT_S6;
    output                       ARVALID_S6;
    input                        ARREADY_S6;
    // AXI SLAVE 0 read response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S6;
    input  [AXI_DWIDTH-1:0]      RDATA_S6;
    input  [1:0]                 RRESP_S6;
    input                        RLAST_S6;
    input                        RVALID_S6;
    output                       RREADY_S6;

    // SLAVE 7
    // AXI SLAVE 7 write address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S7;
    output [31:0]      AWADDR_S7;
    output [3:0]                 AWLEN_S7;
    output [2:0]                 AWSIZE_S7;
    output [1:0]                 AWBURST_S7;
    output [1:0]                 AWLOCK_S7;
    output [3:0]                 AWCACHE_S7;
    output [2:0]                 AWPROT_S7;
    output                       AWVALID_S7;
    input                        AWREADY_S7;
    // AXI SLAVE 0 write data channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S7;
    output [AXI_DWIDTH-1:0]      WDATA_S7;
    output [AXI_STRBWIDTH-1:0]   WSTRB_S7;
    output                       WLAST_S7;
    output                       WVALID_S7;
    input                        WREADY_S7;
    // AXI SLAVE 0 write response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S7;
    input  [1:0]                 BRESP_S7;
    input                        BVALID_S7;
    output                       BREADY_S7;
    // AXI SLAVE 0 read address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S7;
    output [31:0]      ARADDR_S7;
    output [3:0]                 ARLEN_S7;
    output [2:0]                 ARSIZE_S7;
    output [1:0]                 ARBURST_S7;
    output [1:0]                 ARLOCK_S7;
    output [3:0]                 ARCACHE_S7;
    output [2:0]                 ARPROT_S7;
    output                       ARVALID_S7;
    input                        ARREADY_S7;
    // AXI SLAVE 0 read response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S7;
    input  [AXI_DWIDTH-1:0]      RDATA_S7;
    input  [1:0]                 RRESP_S7;
    input                        RLAST_S7;
    input                        RVALID_S7;
    output                       RREADY_S7;

    // SLAVE 8
    // AXI SLAVE 8 write address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S8;
    output [31:0]      AWADDR_S8;
    output [3:0]                 AWLEN_S8;
    output [2:0]                 AWSIZE_S8;
    output [1:0]                 AWBURST_S8;
    output [1:0]                 AWLOCK_S8;
    output [3:0]                 AWCACHE_S8;
    output [2:0]                 AWPROT_S8;
    output                       AWVALID_S8;
    input                        AWREADY_S8;
    // AXI SLAVE 0 write data channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S8;
    output [AXI_DWIDTH-1:0]      WDATA_S8;
    output [AXI_STRBWIDTH-1:0]   WSTRB_S8;
    output                       WLAST_S8;
    output                       WVALID_S8;
    input                        WREADY_S8;
    // AXI SLAVE 0 write response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S8;
    input  [1:0]                 BRESP_S8;
    input                        BVALID_S8;
    output                       BREADY_S8;
    // AXI SLAVE 0 read address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S8;
    output [31:0]      ARADDR_S8;
    output [3:0]                 ARLEN_S8;
    output [2:0]                 ARSIZE_S8;
    output [1:0]                 ARBURST_S8;
    output [1:0]                 ARLOCK_S8;
    output [3:0]                 ARCACHE_S8;
    output [2:0]                 ARPROT_S8;
    output                       ARVALID_S8;
    input                        ARREADY_S8;
    // AXI SLAVE 0 read response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S8;
    input  [AXI_DWIDTH-1:0]      RDATA_S8;
    input  [1:0]                 RRESP_S8;
    input                        RLAST_S8;
    input                        RVALID_S8;
    output                       RREADY_S8;

    // SLAVE 9
    // AXI SLAVE 9 write address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S9;
    output [31:0]      AWADDR_S9;
    output [3:0]                 AWLEN_S9;
    output [2:0]                 AWSIZE_S9;
    output [1:0]                 AWBURST_S9;
    output [1:0]                 AWLOCK_S9;
    output [3:0]                 AWCACHE_S9;
    output [2:0]                 AWPROT_S9;
    output                       AWVALID_S9;
    input                        AWREADY_S9;
    // AXI SLAVE 0 write data channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S9;
    output [AXI_DWIDTH-1:0]      WDATA_S9;
    output [AXI_STRBWIDTH-1:0]   WSTRB_S9;
    output                       WLAST_S9;
    output                       WVALID_S9;
    input                        WREADY_S9;
    // AXI SLAVE 0 write response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S9;
    input  [1:0]                 BRESP_S9;
    input                        BVALID_S9;
    output                       BREADY_S9;
    // AXI SLAVE 0 read address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S9;
    output [31:0]      ARADDR_S9;
    output [3:0]                 ARLEN_S9;
    output [2:0]                 ARSIZE_S9;
    output [1:0]                 ARBURST_S9;
    output [1:0]                 ARLOCK_S9;
    output [3:0]                 ARCACHE_S9;
    output [2:0]                 ARPROT_S9;
    output                       ARVALID_S9;
    input                        ARREADY_S9;
    // AXI SLAVE 0 read response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S9;
    input  [AXI_DWIDTH-1:0]      RDATA_S9;
    input  [1:0]                 RRESP_S9;
    input                        RLAST_S9;
    input                        RVALID_S9;
    output                       RREADY_S9;

    // SLAVE 10
    // AXI SLAVE 10 write address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S10;
    output [31:0]      AWADDR_S10;
    output [3:0]                 AWLEN_S10;
    output [2:0]                 AWSIZE_S10;
    output [1:0]                 AWBURST_S10;
    output [1:0]                 AWLOCK_S10;
    output [3:0]                 AWCACHE_S10;
    output [2:0]                 AWPROT_S10;
    output                       AWVALID_S10;
    input                        AWREADY_S10;
    // AXI SLAVE 0 write data channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S10;
    output [AXI_DWIDTH-1:0]      WDATA_S10;
    output [AXI_STRBWIDTH-1:0]   WSTRB_S10;
    output                       WLAST_S10;
    output                       WVALID_S10;
    input                        WREADY_S10;
    // AXI SLAVE 0 write response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S10;
    input  [1:0]                 BRESP_S10;
    input                        BVALID_S10;
    output                       BREADY_S10;
    // AXI SLAVE 0 read address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S10;
    output [31:0]      ARADDR_S10;
    output [3:0]                 ARLEN_S10;
    output [2:0]                 ARSIZE_S10;
    output [1:0]                 ARBURST_S10;
    output [1:0]                 ARLOCK_S10;
    output [3:0]                 ARCACHE_S10;
    output [2:0]                 ARPROT_S10;
    output                       ARVALID_S10;
    input                        ARREADY_S10;
    // AXI SLAVE 0 read response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S10;
    input  [AXI_DWIDTH-1:0]      RDATA_S10;
    input  [1:0]                 RRESP_S10;
    input                        RLAST_S10;
    input                        RVALID_S10;
    output                       RREADY_S10;

    // SLAVE 11
    // AXI SLAVE 11 write address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S11;
    output [31:0]      AWADDR_S11;
    output [3:0]                 AWLEN_S11;
    output [2:0]                 AWSIZE_S11;
    output [1:0]                 AWBURST_S11;
    output [1:0]                 AWLOCK_S11;
    output [3:0]                 AWCACHE_S11;
    output [2:0]                 AWPROT_S11;
    output                       AWVALID_S11;
    input                        AWREADY_S11;
    // AXI SLAVE 0 write data channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S11;
    output [AXI_DWIDTH-1:0]      WDATA_S11;
    output [AXI_STRBWIDTH-1:0]   WSTRB_S11;
    output                       WLAST_S11;
    output                       WVALID_S11;
    input                        WREADY_S11;
    // AXI SLAVE 0 write response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S11;
    input  [1:0]                 BRESP_S11;
    input                        BVALID_S11;
    output                       BREADY_S11;
    // AXI SLAVE 0 read address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S11;
    output [31:0]      ARADDR_S11;
    output [3:0]                 ARLEN_S11;
    output [2:0]                 ARSIZE_S11;
    output [1:0]                 ARBURST_S11;
    output [1:0]                 ARLOCK_S11;
    output [3:0]                 ARCACHE_S11;
    output [2:0]                 ARPROT_S11;
    output                       ARVALID_S11;
    input                        ARREADY_S11;
    // AXI SLAVE 0 read response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S11;
    input  [AXI_DWIDTH-1:0]      RDATA_S11;
    input  [1:0]                 RRESP_S11;
    input                        RLAST_S11;
    input                        RVALID_S11;
    output                       RREADY_S11;

    // SLAVE 12
    // AXI SLAVE 12 write address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S12;
    output [31:0]      AWADDR_S12;
    output [3:0]                 AWLEN_S12;
    output [2:0]                 AWSIZE_S12;
    output [1:0]                 AWBURST_S12;
    output [1:0]                 AWLOCK_S12;
    output [3:0]                 AWCACHE_S12;
    output [2:0]                 AWPROT_S12;
    output                       AWVALID_S12;
    input                        AWREADY_S12;
    // AXI SLAVE 0 write data channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S12;
    output [AXI_DWIDTH-1:0]      WDATA_S12;
    output [AXI_STRBWIDTH-1:0]   WSTRB_S12;
    output                       WLAST_S12;
    output                       WVALID_S12;
    input                        WREADY_S12;
    // AXI SLAVE 0 write response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S12;
    input  [1:0]                 BRESP_S12;
    input                        BVALID_S12;
    output                       BREADY_S12;
    // AXI SLAVE 0 read address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S12;
    output [31:0]      ARADDR_S12;
    output [3:0]                 ARLEN_S12;
    output [2:0]                 ARSIZE_S12;
    output [1:0]                 ARBURST_S12;
    output [1:0]                 ARLOCK_S12;
    output [3:0]                 ARCACHE_S12;
    output [2:0]                 ARPROT_S12;
    output                       ARVALID_S12;
    input                        ARREADY_S12;
    // AXI SLAVE 0 read response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S12;
    input  [AXI_DWIDTH-1:0]      RDATA_S12;
    input  [1:0]                 RRESP_S12;
    input                        RLAST_S12;
    input                        RVALID_S12;
    output                       RREADY_S12;

    // SLAVE 13
    // AXI SLAVE 13 write address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S13;
    output [31:0]      AWADDR_S13;
    output [3:0]                 AWLEN_S13;
    output [2:0]                 AWSIZE_S13;
    output [1:0]                 AWBURST_S13;
    output [1:0]                 AWLOCK_S13;
    output [3:0]                 AWCACHE_S13;
    output [2:0]                 AWPROT_S13;
    output                       AWVALID_S13;
    input                        AWREADY_S13;
    // AXI SLAVE 0 write data channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S13;
    output [AXI_DWIDTH-1:0]      WDATA_S13;
    output [AXI_STRBWIDTH-1:0]   WSTRB_S13;
    output                       WLAST_S13;
    output                       WVALID_S13;
    input                        WREADY_S13;
    // AXI SLAVE 0 write response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S13;
    input  [1:0]                 BRESP_S13;
    input                        BVALID_S13;
    output                       BREADY_S13;
    // AXI SLAVE 0 read address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S13;
    output [31:0]      ARADDR_S13;
    output [3:0]                 ARLEN_S13;
    output [2:0]                 ARSIZE_S13;
    output [1:0]                 ARBURST_S13;
    output [1:0]                 ARLOCK_S13;
    output [3:0]                 ARCACHE_S13;
    output [2:0]                 ARPROT_S13;
    output                       ARVALID_S13;
    input                        ARREADY_S13;
    // AXI SLAVE 0 read response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S13;
    input  [AXI_DWIDTH-1:0]      RDATA_S13;
    input  [1:0]                 RRESP_S13;
    input                        RLAST_S13;
    input                        RVALID_S13;
    output                       RREADY_S13;

    // SLAVE 14
    // AXI SLAVE 14 write address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S14;
    output [31:0]      AWADDR_S14;
    output [3:0]                 AWLEN_S14;
    output [2:0]                 AWSIZE_S14;
    output [1:0]                 AWBURST_S14;
    output [1:0]                 AWLOCK_S14;
    output [3:0]                 AWCACHE_S14;
    output [2:0]                 AWPROT_S14;
    output                       AWVALID_S14;
    input                        AWREADY_S14;
    // AXI SLAVE 0 write data channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S14;
    output [AXI_DWIDTH-1:0]      WDATA_S14;
    output [AXI_STRBWIDTH-1:0]   WSTRB_S14;
    output                       WLAST_S14;
    output                       WVALID_S14;
    input                        WREADY_S14;
    // AXI SLAVE 0 write response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S14;
    input  [1:0]                 BRESP_S14;
    input                        BVALID_S14;
    output                       BREADY_S14;
    // AXI SLAVE 0 read address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S14;
    output [31:0]      ARADDR_S14;
    output [3:0]                 ARLEN_S14;
    output [2:0]                 ARSIZE_S14;
    output [1:0]                 ARBURST_S14;
    output [1:0]                 ARLOCK_S14;
    output [3:0]                 ARCACHE_S14;
    output [2:0]                 ARPROT_S14;
    output                       ARVALID_S14;
    input                        ARREADY_S14;
    // AXI SLAVE 0 read response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S14;
    input  [AXI_DWIDTH-1:0]      RDATA_S14;
    input  [1:0]                 RRESP_S14;
    input                        RLAST_S14;
    input                        RVALID_S14;
    output                       RREADY_S14;

    // SLAVE 15
    // AXI SLAVE 15 write address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S15;
    output [31:0]      AWADDR_S15;
    output [3:0]                 AWLEN_S15;
    output [2:0]                 AWSIZE_S15;
    output [1:0]                 AWBURST_S15;
    output [1:0]                 AWLOCK_S15;
    output [3:0]                 AWCACHE_S15;
    output [2:0]                 AWPROT_S15;
    output                       AWVALID_S15;
    input                        AWREADY_S15;
    // AXI SLAVE 0 write data channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S15;
    output [AXI_DWIDTH-1:0]      WDATA_S15;
    output [AXI_STRBWIDTH-1:0]   WSTRB_S15;
    output                       WLAST_S15;
    output                       WVALID_S15;
    input                        WREADY_S15;
    // AXI SLAVE 0 write response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S15;
    input  [1:0]                 BRESP_S15;
    input                        BVALID_S15;
    output                       BREADY_S15;
    // AXI SLAVE 0 read address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S15;
    output [31:0]      ARADDR_S15;
    output [3:0]                 ARLEN_S15;
    output [2:0]                 ARSIZE_S15;
    output [1:0]                 ARBURST_S15;
    output [1:0]                 ARLOCK_S15;
    output [3:0]                 ARCACHE_S15;
    output [2:0]                 ARPROT_S15;
    output                       ARVALID_S15;
    input                        ARREADY_S15;
    // AXI SLAVE 0 read response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S15;
    input  [AXI_DWIDTH-1:0]      RDATA_S15;
    input  [1:0]                 RRESP_S15;
    input                        RLAST_S15;
    input                        RVALID_S15;
    output                       RREADY_S15;

    // SLAVE 16
    // AXI SLAVE 16 write address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S16;
    output [31:0]      AWADDR_S16;
    output [3:0]                 AWLEN_S16;
    output [2:0]                 AWSIZE_S16;
    output [1:0]                 AWBURST_S16;
    output [1:0]                 AWLOCK_S16;
    output [3:0]                 AWCACHE_S16;
    output [2:0]                 AWPROT_S16;
    output                       AWVALID_S16;
    input                        AWREADY_S16;
    // AXI SLAVE 0 write data channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S16;
    output [AXI_DWIDTH-1:0]      WDATA_S16;
    output [AXI_STRBWIDTH-1:0]   WSTRB_S16;
    output                       WLAST_S16;
    output                       WVALID_S16;
    input                        WREADY_S16;
    // AXI SLAVE 0 write response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S16;
    input  [1:0]                 BRESP_S16;
    input                        BVALID_S16;
    output                       BREADY_S16;
    // AXI SLAVE 0 read address channel signals
    output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S16;
    output [31:0]      ARADDR_S16;
    output [3:0]                 ARLEN_S16;
    output [2:0]                 ARSIZE_S16;
    output [1:0]                 ARBURST_S16;
    output [1:0]                 ARLOCK_S16;
    output [3:0]                 ARCACHE_S16;
    output [2:0]                 ARPROT_S16;
    output                       ARVALID_S16;
    input                        ARREADY_S16;
    // AXI SLAVE 0 read response channel signals
    input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S16;
    input  [AXI_DWIDTH-1:0]      RDATA_S16;
    input  [1:0]                 RRESP_S16;
    input                        RLAST_S16;
    input                        RVALID_S16;
    output                       RREADY_S16;

   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------
   wire                          AWREADY_IM0;
   wire                          AWREADY_IM1;
   wire                          AWREADY_IM2;
   wire                          AWREADY_IM3;
   wire                          WREADY_IM0;
   wire                          WREADY_IM1;
   wire                          WREADY_IM2;
   wire                          WREADY_IM3;
   wire                          ARREADY_IM0;
   wire                          ARREADY_IM1;
   wire                          ARREADY_IM2;
   wire                          ARREADY_IM3;

   wire                          BREADY_MI0;
   wire                          BREADY_MI1;
   wire                          BREADY_MI2;
   wire                          BREADY_MI3;
   wire                          RREADY_MI0;
   wire                          RREADY_MI1;
   wire                          RREADY_MI2;
   wire                          RREADY_MI3;


   wire                                BVALID_IM0;
   wire                                BVALID_IM1;
   wire                                BVALID_IM2;
   wire                                BVALID_IM3;


    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS0;
    wire [31:0]      AWADDR_IS0;
    wire [3:0]                 AWLEN_IS0;
    wire [2:0]                 AWSIZE_IS0;
    wire [1:0]                 AWBURST_IS0;
    wire [1:0]                 AWLOCK_IS0;
    wire [3:0]                 AWCACHE_IS0;
    wire [2:0]                 AWPROT_IS0;
    wire                       AWVALID_IS0;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS0;
    wire [AXI_DWIDTH-1:0]      WDATA_IS0;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_IS0;
    wire                       WLAST_IS0;
    wire                       WVALID_IS0;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_IS0;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS0;
    wire [31:0]      ARADDR_IS0;
    wire [3:0]                 ARLEN_IS0;
    wire [2:0]                 ARSIZE_IS0;
    wire [1:0]                 ARBURST_IS0;
    wire [1:0]                 ARLOCK_IS0;
    wire [3:0]                 ARCACHE_IS0;
    wire [2:0]                 ARPROT_IS0;
    wire                       ARVALID_IS0;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_IS0;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS1;
    wire [31:0]      AWADDR_IS1;
    wire [3:0]                 AWLEN_IS1;
    wire [2:0]                 AWSIZE_IS1;
    wire [1:0]                 AWBURST_IS1;
    wire [1:0]                 AWLOCK_IS1;
    wire [3:0]                 AWCACHE_IS1;
    wire [2:0]                 AWPROT_IS1;
    wire                       AWVALID_IS1;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS1;
    wire [AXI_DWIDTH-1:0]      WDATA_IS1;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_IS1;
    wire                       WLAST_IS1;
    wire                       WVALID_IS1;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_IS1;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS1;
    wire [31:0]      ARADDR_IS1;
    wire [3:0]                 ARLEN_IS1;
    wire [2:0]                 ARSIZE_IS1;
    wire [1:0]                 ARBURST_IS1;
    wire [1:0]                 ARLOCK_IS1;
    wire [3:0]                 ARCACHE_IS1;
    wire [2:0]                 ARPROT_IS1;
    wire                       ARVALID_IS1;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_IS1;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS2;
    wire [31:0]      AWADDR_IS2;
    wire [3:0]                 AWLEN_IS2;
    wire [2:0]                 AWSIZE_IS2;
    wire [1:0]                 AWBURST_IS2;
    wire [1:0]                 AWLOCK_IS2;
    wire [3:0]                 AWCACHE_IS2;
    wire [2:0]                 AWPROT_IS2;
    wire                       AWVALID_IS2;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS2;
    wire [AXI_DWIDTH-1:0]      WDATA_IS2;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_IS2;
    wire                       WLAST_IS2;
    wire                       WVALID_IS2;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_IS2;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS2;
    wire [31:0]      ARADDR_IS2;
    wire [3:0]                 ARLEN_IS2;
    wire [2:0]                 ARSIZE_IS2;
    wire [1:0]                 ARBURST_IS2;
    wire [1:0]                 ARLOCK_IS2;
    wire [3:0]                 ARCACHE_IS2;
    wire [2:0]                 ARPROT_IS2;
    wire                       ARVALID_IS2;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_IS2;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS3;
    wire [31:0]      AWADDR_IS3;
    wire [3:0]                 AWLEN_IS3;
    wire [2:0]                 AWSIZE_IS3;
    wire [1:0]                 AWBURST_IS3;
    wire [1:0]                 AWLOCK_IS3;
    wire [3:0]                 AWCACHE_IS3;
    wire [2:0]                 AWPROT_IS3;
    wire                       AWVALID_IS3;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS3;
    wire [AXI_DWIDTH-1:0]      WDATA_IS3;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_IS3;
    wire                       WLAST_IS3;
    wire                       WVALID_IS3;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_IS3;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS3;
    wire [31:0]      ARADDR_IS3;
    wire [3:0]                 ARLEN_IS3;
    wire [2:0]                 ARSIZE_IS3;
    wire [1:0]                 ARBURST_IS3;
    wire [1:0]                 ARLOCK_IS3;
    wire [3:0]                 ARCACHE_IS3;
    wire [2:0]                 ARPROT_IS3;
    wire                       ARVALID_IS3;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_IS3;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS4;
    wire [31:0]      AWADDR_IS4;
    wire [3:0]                 AWLEN_IS4;
    wire [2:0]                 AWSIZE_IS4;
    wire [1:0]                 AWBURST_IS4;
    wire [1:0]                 AWLOCK_IS4;
    wire [3:0]                 AWCACHE_IS4;
    wire [2:0]                 AWPROT_IS4;
    wire                       AWVALID_IS4;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS4;
    wire [AXI_DWIDTH-1:0]      WDATA_IS4;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_IS4;
    wire                       WLAST_IS4;
    wire                       WVALID_IS4;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_IS4;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS4;
    wire [31:0]      ARADDR_IS4;
    wire [3:0]                 ARLEN_IS4;
    wire [2:0]                 ARSIZE_IS4;
    wire [1:0]                 ARBURST_IS4;
    wire [1:0]                 ARLOCK_IS4;
    wire [3:0]                 ARCACHE_IS4;
    wire [2:0]                 ARPROT_IS4;
    wire                       ARVALID_IS4;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_IS4;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS5;
    wire [31:0]      AWADDR_IS5;
    wire [3:0]                 AWLEN_IS5;
    wire [2:0]                 AWSIZE_IS5;
    wire [1:0]                 AWBURST_IS5;
    wire [1:0]                 AWLOCK_IS5;
    wire [3:0]                 AWCACHE_IS5;
    wire [2:0]                 AWPROT_IS5;
    wire                       AWVALID_IS5;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS5;
    wire [AXI_DWIDTH-1:0]      WDATA_IS5;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_IS5;
    wire                       WLAST_IS5;
    wire                       WVALID_IS5;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_IS5;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS5;
    wire [31:0]      ARADDR_IS5;
    wire [3:0]                 ARLEN_IS5;
    wire [2:0]                 ARSIZE_IS5;
    wire [1:0]                 ARBURST_IS5;
    wire [1:0]                 ARLOCK_IS5;
    wire [3:0]                 ARCACHE_IS5;
    wire [2:0]                 ARPROT_IS5;
    wire                       ARVALID_IS5;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_IS5;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS6;
    wire [31:0]      AWADDR_IS6;
    wire [3:0]                 AWLEN_IS6;
    wire [2:0]                 AWSIZE_IS6;
    wire [1:0]                 AWBURST_IS6;
    wire [1:0]                 AWLOCK_IS6;
    wire [3:0]                 AWCACHE_IS6;
    wire [2:0]                 AWPROT_IS6;
    wire                       AWVALID_IS6;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS6;
    wire [AXI_DWIDTH-1:0]      WDATA_IS6;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_IS6;
    wire                       WLAST_IS6;
    wire                       WVALID_IS6;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_IS6;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS6;
    wire [31:0]      ARADDR_IS6;
    wire [3:0]                 ARLEN_IS6;
    wire [2:0]                 ARSIZE_IS6;
    wire [1:0]                 ARBURST_IS6;
    wire [1:0]                 ARLOCK_IS6;
    wire [3:0]                 ARCACHE_IS6;
    wire [2:0]                 ARPROT_IS6;
    wire                       ARVALID_IS6;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_IS6;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS7;
    wire [31:0]      AWADDR_IS7;
    wire [3:0]                 AWLEN_IS7;
    wire [2:0]                 AWSIZE_IS7;
    wire [1:0]                 AWBURST_IS7;
    wire [1:0]                 AWLOCK_IS7;
    wire [3:0]                 AWCACHE_IS7;
    wire [2:0]                 AWPROT_IS7;
    wire                       AWVALID_IS7;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS7;
    wire [AXI_DWIDTH-1:0]      WDATA_IS7;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_IS7;
    wire                       WLAST_IS7;
    wire                       WVALID_IS7;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_IS7;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS7;
    wire [31:0]      ARADDR_IS7;
    wire [3:0]                 ARLEN_IS7;
    wire [2:0]                 ARSIZE_IS7;
    wire [1:0]                 ARBURST_IS7;
    wire [1:0]                 ARLOCK_IS7;
    wire [3:0]                 ARCACHE_IS7;
    wire [2:0]                 ARPROT_IS7;
    wire                       ARVALID_IS7;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_IS7;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS8;
    wire [31:0]      AWADDR_IS8;
    wire [3:0]                 AWLEN_IS8;
    wire [2:0]                 AWSIZE_IS8;
    wire [1:0]                 AWBURST_IS8;
    wire [1:0]                 AWLOCK_IS8;
    wire [3:0]                 AWCACHE_IS8;
    wire [2:0]                 AWPROT_IS8;
    wire                       AWVALID_IS8;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS8;
    wire [AXI_DWIDTH-1:0]      WDATA_IS8;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_IS8;
    wire                       WLAST_IS8;
    wire                       WVALID_IS8;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_IS8;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS8;
    wire [31:0]      ARADDR_IS8;
    wire [3:0]                 ARLEN_IS8;
    wire [2:0]                 ARSIZE_IS8;
    wire [1:0]                 ARBURST_IS8;
    wire [1:0]                 ARLOCK_IS8;
    wire [3:0]                 ARCACHE_IS8;
    wire [2:0]                 ARPROT_IS8;
    wire                       ARVALID_IS8;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_IS8;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS9;
    wire [31:0]      AWADDR_IS9;
    wire [3:0]                 AWLEN_IS9;
    wire [2:0]                 AWSIZE_IS9;
    wire [1:0]                 AWBURST_IS9;
    wire [1:0]                 AWLOCK_IS9;
    wire [3:0]                 AWCACHE_IS9;
    wire [2:0]                 AWPROT_IS9;
    wire                       AWVALID_IS9;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS9;
    wire [AXI_DWIDTH-1:0]      WDATA_IS9;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_IS9;
    wire                       WLAST_IS9;
    wire                       WVALID_IS9;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_IS9;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS9;
    wire [31:0]      ARADDR_IS9;
    wire [3:0]                 ARLEN_IS9;
    wire [2:0]                 ARSIZE_IS9;
    wire [1:0]                 ARBURST_IS9;
    wire [1:0]                 ARLOCK_IS9;
    wire [3:0]                 ARCACHE_IS9;
    wire [2:0]                 ARPROT_IS9;
    wire                       ARVALID_IS9;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_IS9;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS10;
    wire [31:0]      AWADDR_IS10;
    wire [3:0]                 AWLEN_IS10;
    wire [2:0]                 AWSIZE_IS10;
    wire [1:0]                 AWBURST_IS10;
    wire [1:0]                 AWLOCK_IS10;
    wire [3:0]                 AWCACHE_IS10;
    wire [2:0]                 AWPROT_IS10;
    wire                       AWVALID_IS10;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS10;
    wire [AXI_DWIDTH-1:0]      WDATA_IS10;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_IS10;
    wire                       WLAST_IS10;
    wire                       WVALID_IS10;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_IS10;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS10;
    wire [31:0]      ARADDR_IS10;
    wire [3:0]                 ARLEN_IS10;
    wire [2:0]                 ARSIZE_IS10;
    wire [1:0]                 ARBURST_IS10;
    wire [1:0]                 ARLOCK_IS10;
    wire [3:0]                 ARCACHE_IS10;
    wire [2:0]                 ARPROT_IS10;
    wire                       ARVALID_IS10;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_IS10;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS11;
    wire [31:0]      AWADDR_IS11;
    wire [3:0]                 AWLEN_IS11;
    wire [2:0]                 AWSIZE_IS11;
    wire [1:0]                 AWBURST_IS11;
    wire [1:0]                 AWLOCK_IS11;
    wire [3:0]                 AWCACHE_IS11;
    wire [2:0]                 AWPROT_IS11;
    wire                       AWVALID_IS11;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS11;
    wire [AXI_DWIDTH-1:0]      WDATA_IS11;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_IS11;
    wire                       WLAST_IS11;
    wire                       WVALID_IS11;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_IS11;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS11;
    wire [31:0]      ARADDR_IS11;
    wire [3:0]                 ARLEN_IS11;
    wire [2:0]                 ARSIZE_IS11;
    wire [1:0]                 ARBURST_IS11;
    wire [1:0]                 ARLOCK_IS11;
    wire [3:0]                 ARCACHE_IS11;
    wire [2:0]                 ARPROT_IS11;
    wire                       ARVALID_IS11;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_IS11;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS12;
    wire [31:0]      AWADDR_IS12;
    wire [3:0]                 AWLEN_IS12;
    wire [2:0]                 AWSIZE_IS12;
    wire [1:0]                 AWBURST_IS12;
    wire [1:0]                 AWLOCK_IS12;
    wire [3:0]                 AWCACHE_IS12;
    wire [2:0]                 AWPROT_IS12;
    wire                       AWVALID_IS12;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS12;
    wire [AXI_DWIDTH-1:0]      WDATA_IS12;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_IS12;
    wire                       WLAST_IS12;
    wire                       WVALID_IS12;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_IS12;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS12;
    wire [31:0]      ARADDR_IS12;
    wire [3:0]                 ARLEN_IS12;
    wire [2:0]                 ARSIZE_IS12;
    wire [1:0]                 ARBURST_IS12;
    wire [1:0]                 ARLOCK_IS12;
    wire [3:0]                 ARCACHE_IS12;
    wire [2:0]                 ARPROT_IS12;
    wire                       ARVALID_IS12;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_IS12;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS13;
    wire [31:0]      AWADDR_IS13;
    wire [3:0]                 AWLEN_IS13;
    wire [2:0]                 AWSIZE_IS13;
    wire [1:0]                 AWBURST_IS13;
    wire [1:0]                 AWLOCK_IS13;
    wire [3:0]                 AWCACHE_IS13;
    wire [2:0]                 AWPROT_IS13;
    wire                       AWVALID_IS13;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS13;
    wire [AXI_DWIDTH-1:0]      WDATA_IS13;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_IS13;
    wire                       WLAST_IS13;
    wire                       WVALID_IS13;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_IS13;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS13;
    wire [31:0]      ARADDR_IS13;
    wire [3:0]                 ARLEN_IS13;
    wire [2:0]                 ARSIZE_IS13;
    wire [1:0]                 ARBURST_IS13;
    wire [1:0]                 ARLOCK_IS13;
    wire [3:0]                 ARCACHE_IS13;
    wire [2:0]                 ARPROT_IS13;
    wire                       ARVALID_IS13;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_IS13;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS14;
    wire [31:0]      AWADDR_IS14;
    wire [3:0]                 AWLEN_IS14;
    wire [2:0]                 AWSIZE_IS14;
    wire [1:0]                 AWBURST_IS14;
    wire [1:0]                 AWLOCK_IS14;
    wire [3:0]                 AWCACHE_IS14;
    wire [2:0]                 AWPROT_IS14;
    wire                       AWVALID_IS14;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS14;
    wire [AXI_DWIDTH-1:0]      WDATA_IS14;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_IS14;
    wire                       WLAST_IS14;
    wire                       WVALID_IS14;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_IS14;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS14;
    wire [31:0]      ARADDR_IS14;
    wire [3:0]                 ARLEN_IS14;
    wire [2:0]                 ARSIZE_IS14;
    wire [1:0]                 ARBURST_IS14;
    wire [1:0]                 ARLOCK_IS14;
    wire [3:0]                 ARCACHE_IS14;
    wire [2:0]                 ARPROT_IS14;
    wire                       ARVALID_IS14;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_IS14;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS15;
    wire [31:0]      AWADDR_IS15;
    wire [3:0]                 AWLEN_IS15;
    wire [2:0]                 AWSIZE_IS15;
    wire [1:0]                 AWBURST_IS15;
    wire [1:0]                 AWLOCK_IS15;
    wire [3:0]                 AWCACHE_IS15;
    wire [2:0]                 AWPROT_IS15;
    wire                       AWVALID_IS15;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS15;
    wire [AXI_DWIDTH-1:0]      WDATA_IS15;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_IS15;
    wire                       WLAST_IS15;
    wire                       WVALID_IS15;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_IS15;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS15;
    wire [31:0]      ARADDR_IS15;
    wire [3:0]                 ARLEN_IS15;
    wire [2:0]                 ARSIZE_IS15;
    wire [1:0]                 ARBURST_IS15;
    wire [1:0]                 ARLOCK_IS15;
    wire [3:0]                 ARCACHE_IS15;
    wire [2:0]                 ARPROT_IS15;
    wire                       ARVALID_IS15;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_IS15;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS16;
    wire [31:0]      AWADDR_IS16;
    wire [3:0]                 AWLEN_IS16;
    wire [2:0]                 AWSIZE_IS16;
    wire [1:0]                 AWBURST_IS16;
    wire [1:0]                 AWLOCK_IS16;
    wire [3:0]                 AWCACHE_IS16;
    wire [2:0]                 AWPROT_IS16;
    wire                       AWVALID_IS16;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS16;
    wire [AXI_DWIDTH-1:0]      WDATA_IS16;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_IS16;
    wire                       WLAST_IS16;
    wire                       WVALID_IS16;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_IS16;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS16;
    wire [31:0]      ARADDR_IS16;
    wire [3:0]                 ARLEN_IS16;
    wire [2:0]                 ARSIZE_IS16;
    wire [1:0]                 ARBURST_IS16;
    wire [1:0]                 ARLOCK_IS16;
    wire [3:0]                 ARCACHE_IS16;
    wire [2:0]                 ARPROT_IS16;
    wire                       ARVALID_IS16;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_IS16;


   // M0

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_MI0;
   wire [31:0]        AWADDR_MI0;
   wire [3:0]                   AWLEN_MI0;
   wire [2:0]                   AWSIZE_MI0;
   wire [1:0]                   AWBURST_MI0;
   wire [1:0]                   AWLOCK_MI0;
   wire [3:0]                   AWCACHE_MI0;
   wire [2:0]                   AWPROT_MI0;
   wire                         AWVALID_MI0;
   // AXI write data channel signals
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_MI0;
   wire [AXI_DWIDTH-1:0]        WDATA_MI0;
   wire [AXI_STRBWIDTH-1:0]     WSTRB_MI0;
   wire                         WLAST_MI0;
   wire                         WVALID_MI0;
   // AXI read address channel signals
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_MI0;
   wire [31:0]       ARADDR_MI0;
   wire [3:0]                  ARLEN_MI0;
   wire [2:0]                  ARSIZE_MI0;
   wire [1:0]                  ARBURST_MI0;
   wire [1:0]                  ARLOCK_MI0;
   wire [3:0]                  ARCACHE_MI0;
   wire [2:0]                  ARPROT_MI0;
   wire                        ARVALID_MI0;

   wire [1:0]                  BRESP_IM0;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM0;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_IM0;
   wire [AXI_DWIDTH-1:0]      RDATA_IM0;
   wire [1:0]                 RRESP_IM0;
   wire                       RVALID_IM0;
   wire                       RLAST_IM0;
   

   // M1

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_MI1;
   wire [31:0]        AWADDR_MI1;
   wire [3:0]                   AWLEN_MI1;
   wire [2:0]                   AWSIZE_MI1;
   wire [1:0]                   AWBURST_MI1;
   wire [1:0]                   AWLOCK_MI1;
   wire [3:0]                   AWCACHE_MI1;
   wire [2:0]                   AWPROT_MI1;
   wire                         AWVALID_MI1;
   // AXI write data channel signals
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_MI1;
   wire [AXI_DWIDTH-1:0]        WDATA_MI1;
   wire [AXI_STRBWIDTH-1:0]     WSTRB_MI1;
   wire                         WLAST_MI1;
   wire                         WVALID_MI1;
   // AXI read address channel signals
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_MI1;
   wire [31:0]       ARADDR_MI1;
   wire [3:0]                  ARLEN_MI1;
   wire [2:0]                  ARSIZE_MI1;
   wire [1:0]                  ARBURST_MI1;
   wire [1:0]                  ARLOCK_MI1;
   wire [3:0]                  ARCACHE_MI1;
   wire [2:0]                  ARPROT_MI1;
   wire                        ARVALID_MI1;

   wire [1:0]                  BRESP_IM1;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM1;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_IM1;
   wire [AXI_DWIDTH-1:0]      RDATA_IM1;
   wire [1:0]                 RRESP_IM1;
   wire                       RVALID_IM1;
   wire                       RLAST_IM1;

   // M2

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_MI2;
   wire [31:0]        AWADDR_MI2;
   wire [3:0]                   AWLEN_MI2;
   wire [2:0]                   AWSIZE_MI2;
   wire [1:0]                   AWBURST_MI2;
   wire [1:0]                   AWLOCK_MI2;
   wire [3:0]                   AWCACHE_MI2;
   wire [2:0]                   AWPROT_MI2;
   wire                         AWVALID_MI2;
   // AXI write data channel signals
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_MI2;
   wire [AXI_DWIDTH-1:0]        WDATA_MI2;
   wire [AXI_STRBWIDTH-1:0]     WSTRB_MI2;
   wire                         WLAST_MI2;
   wire                         WVALID_MI2;
   // AXI read address channel signals
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_MI2;
   wire [31:0]       ARADDR_MI2;
   wire [3:0]                  ARLEN_MI2;
   wire [2:0]                  ARSIZE_MI2;
   wire [1:0]                  ARBURST_MI2;
   wire [1:0]                  ARLOCK_MI2;
   wire [3:0]                  ARCACHE_MI2;
   wire [2:0]                  ARPROT_MI2;
   wire                        ARVALID_MI2;

   wire [1:0]                  BRESP_IM2;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM2;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_IM2;
   wire [AXI_DWIDTH-1:0]      RDATA_IM2;
   wire [1:0]                 RRESP_IM2;
   wire                       RVALID_IM2;
   wire                       RLAST_IM2;

   // M3

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_MI3;
   wire [31:0]        AWADDR_MI3;
   wire [3:0]                   AWLEN_MI3;
   wire [2:0]                   AWSIZE_MI3;
   wire [1:0]                   AWBURST_MI3;
   wire [1:0]                   AWLOCK_MI3;
   wire [3:0]                   AWCACHE_MI3;
   wire [2:0]                   AWPROT_MI3;
   wire                         AWVALID_MI3;
   // AXI write data channel signals
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_MI3;
   wire [AXI_DWIDTH-1:0]        WDATA_MI3;
   wire [AXI_STRBWIDTH-1:0]     WSTRB_MI3;
   wire                         WLAST_MI3;
   wire                         WVALID_MI3;
   // AXI read address channel signals
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_MI3;
   wire [31:0]       ARADDR_MI3;
   wire [3:0]                  ARLEN_MI3;
   wire [2:0]                  ARSIZE_MI3;
   wire [1:0]                  ARBURST_MI3;
   wire [1:0]                  ARLOCK_MI3;
   wire [3:0]                  ARCACHE_MI3;
   wire [2:0]                  ARPROT_MI3;
   wire                        ARVALID_MI3;

   wire [1:0]                  BRESP_IM3;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM3;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_IM3;
   wire [AXI_DWIDTH-1:0]      RDATA_IM3;
   wire [1:0]                 RRESP_IM3;
   wire                       RVALID_IM3;
   wire                       RLAST_IM3;

// ===================================================================

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S0;
    wire [31:0]      AWADDR_S0;
    wire [3:0]                 AWLEN_S0;
    wire [2:0]                 AWSIZE_S0;
    wire [1:0]                 AWBURST_S0;
    wire [1:0]                 AWLOCK_S0;
    wire [3:0]                 AWCACHE_S0;
    wire [2:0]                 AWPROT_S0;
    wire                       AWVALID_S0;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S0;
    wire [AXI_DWIDTH-1:0]      WDATA_S0;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_S0;
    wire                       WLAST_S0;
    wire                       WVALID_S0;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_S0;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S0;
    wire [31:0]      ARADDR_S0;
    wire [3:0]                 ARLEN_S0;
    wire [2:0]                 ARSIZE_S0;
    wire [1:0]                 ARBURST_S0;
    wire [1:0]                 ARLOCK_S0;
    wire [3:0]                 ARCACHE_S0;
    wire [2:0]                 ARPROT_S0;
    wire                       ARVALID_S0;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_S0;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S1;
    wire [31:0]      AWADDR_S1;
    wire [3:0]                 AWLEN_S1;
    wire [2:0]                 AWSIZE_S1;
    wire [1:0]                 AWBURST_S1;
    wire [1:0]                 AWLOCK_S1;
    wire [3:0]                 AWCACHE_S1;
    wire [2:0]                 AWPROT_S1;
    wire                       AWVALID_S1;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S1;
    wire [AXI_DWIDTH-1:0]      WDATA_S1;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_S1;
    wire                       WLAST_S1;
    wire                       WVALID_S1;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_S1;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S1;
    wire [31:0]      ARADDR_S1;
    wire [3:0]                 ARLEN_S1;
    wire [2:0]                 ARSIZE_S1;
    wire [1:0]                 ARBURST_S1;
    wire [1:0]                 ARLOCK_S1;
    wire [3:0]                 ARCACHE_S1;
    wire [2:0]                 ARPROT_S1;
    wire                       ARVALID_S1;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_S1;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S2;
    wire [31:0]      AWADDR_S2;
    wire [3:0]                 AWLEN_S2;
    wire [2:0]                 AWSIZE_S2;
    wire [1:0]                 AWBURST_S2;
    wire [1:0]                 AWLOCK_S2;
    wire [3:0]                 AWCACHE_S2;
    wire [2:0]                 AWPROT_S2;
    wire                       AWVALID_S2;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S2;
    wire [AXI_DWIDTH-1:0]      WDATA_S2;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_S2;
    wire                       WLAST_S2;
    wire                       WVALID_S2;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_S2;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S2;
    wire [31:0]      ARADDR_S2;
    wire [3:0]                 ARLEN_S2;
    wire [2:0]                 ARSIZE_S2;
    wire [1:0]                 ARBURST_S2;
    wire [1:0]                 ARLOCK_S2;
    wire [3:0]                 ARCACHE_S2;
    wire [2:0]                 ARPROT_S2;
    wire                       ARVALID_S2;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_S2;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S3;
    wire [31:0]      AWADDR_S3;
    wire [3:0]                 AWLEN_S3;
    wire [2:0]                 AWSIZE_S3;
    wire [1:0]                 AWBURST_S3;
    wire [1:0]                 AWLOCK_S3;
    wire [3:0]                 AWCACHE_S3;
    wire [2:0]                 AWPROT_S3;
    wire                       AWVALID_S3;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S3;
    wire [AXI_DWIDTH-1:0]      WDATA_S3;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_S3;
    wire                       WLAST_S3;
    wire                       WVALID_S3;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_S3;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S3;
    wire [31:0]      ARADDR_S3;
    wire [3:0]                 ARLEN_S3;
    wire [2:0]                 ARSIZE_S3;
    wire [1:0]                 ARBURST_S3;
    wire [1:0]                 ARLOCK_S3;
    wire [3:0]                 ARCACHE_S3;
    wire [2:0]                 ARPROT_S3;
    wire                       ARVALID_S3;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_S3;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S4;
    wire [31:0]      AWADDR_S4;
    wire [3:0]                 AWLEN_S4;
    wire [2:0]                 AWSIZE_S4;
    wire [1:0]                 AWBURST_S4;
    wire [1:0]                 AWLOCK_S4;
    wire [3:0]                 AWCACHE_S4;
    wire [2:0]                 AWPROT_S4;
    wire                       AWVALID_S4;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S4;
    wire [AXI_DWIDTH-1:0]      WDATA_S4;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_S4;
    wire                       WLAST_S4;
    wire                       WVALID_S4;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_S4;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S4;
    wire [31:0]      ARADDR_S4;
    wire [3:0]                 ARLEN_S4;
    wire [2:0]                 ARSIZE_S4;
    wire [1:0]                 ARBURST_S4;
    wire [1:0]                 ARLOCK_S4;
    wire [3:0]                 ARCACHE_S4;
    wire [2:0]                 ARPROT_S4;
    wire                       ARVALID_S4;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_S4;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S5;
    wire [31:0]      AWADDR_S5;
    wire [3:0]                 AWLEN_S5;
    wire [2:0]                 AWSIZE_S5;
    wire [1:0]                 AWBURST_S5;
    wire [1:0]                 AWLOCK_S5;
    wire [3:0]                 AWCACHE_S5;
    wire [2:0]                 AWPROT_S5;
    wire                       AWVALID_S5;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S5;
    wire [AXI_DWIDTH-1:0]      WDATA_S5;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_S5;
    wire                       WLAST_S5;
    wire                       WVALID_S5;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_S5;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S5;
    wire [31:0]      ARADDR_S5;
    wire [3:0]                 ARLEN_S5;
    wire [2:0]                 ARSIZE_S5;
    wire [1:0]                 ARBURST_S5;
    wire [1:0]                 ARLOCK_S5;
    wire [3:0]                 ARCACHE_S5;
    wire [2:0]                 ARPROT_S5;
    wire                       ARVALID_S5;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_S5;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S6;
    wire [31:0]      AWADDR_S6;
    wire [3:0]                 AWLEN_S6;
    wire [2:0]                 AWSIZE_S6;
    wire [1:0]                 AWBURST_S6;
    wire [1:0]                 AWLOCK_S6;
    wire [3:0]                 AWCACHE_S6;
    wire [2:0]                 AWPROT_S6;
    wire                       AWVALID_S6;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S6;
    wire [AXI_DWIDTH-1:0]      WDATA_S6;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_S6;
    wire                       WLAST_S6;
    wire                       WVALID_S6;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_S6;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S6;
    wire [31:0]      ARADDR_S6;
    wire [3:0]                 ARLEN_S6;
    wire [2:0]                 ARSIZE_S6;
    wire [1:0]                 ARBURST_S6;
    wire [1:0]                 ARLOCK_S6;
    wire [3:0]                 ARCACHE_S6;
    wire [2:0]                 ARPROT_S6;
    wire                       ARVALID_S6;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_S6;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S7;
    wire [31:0]      AWADDR_S7;
    wire [3:0]                 AWLEN_S7;
    wire [2:0]                 AWSIZE_S7;
    wire [1:0]                 AWBURST_S7;
    wire [1:0]                 AWLOCK_S7;
    wire [3:0]                 AWCACHE_S7;
    wire [2:0]                 AWPROT_S7;
    wire                       AWVALID_S7;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S7;
    wire [AXI_DWIDTH-1:0]      WDATA_S7;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_S7;
    wire                       WLAST_S7;
    wire                       WVALID_S7;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_S7;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S7;
    wire [31:0]      ARADDR_S7;
    wire [3:0]                 ARLEN_S7;
    wire [2:0]                 ARSIZE_S7;
    wire [1:0]                 ARBURST_S7;
    wire [1:0]                 ARLOCK_S7;
    wire [3:0]                 ARCACHE_S7;
    wire [2:0]                 ARPROT_S7;
    wire                       ARVALID_S7;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_S7;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S8;
    wire [31:0]      AWADDR_S8;
    wire [3:0]                 AWLEN_S8;
    wire [2:0]                 AWSIZE_S8;
    wire [1:0]                 AWBURST_S8;
    wire [1:0]                 AWLOCK_S8;
    wire [3:0]                 AWCACHE_S8;
    wire [2:0]                 AWPROT_S8;
    wire                       AWVALID_S8;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S8;
    wire [AXI_DWIDTH-1:0]      WDATA_S8;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_S8;
    wire                       WLAST_S8;
    wire                       WVALID_S8;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_S8;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S8;
    wire [31:0]      ARADDR_S8;
    wire [3:0]                 ARLEN_S8;
    wire [2:0]                 ARSIZE_S8;
    wire [1:0]                 ARBURST_S8;
    wire [1:0]                 ARLOCK_S8;
    wire [3:0]                 ARCACHE_S8;
    wire [2:0]                 ARPROT_S8;
    wire                       ARVALID_S8;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_S8;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S9;
    wire [31:0]      AWADDR_S9;
    wire [3:0]                 AWLEN_S9;
    wire [2:0]                 AWSIZE_S9;
    wire [1:0]                 AWBURST_S9;
    wire [1:0]                 AWLOCK_S9;
    wire [3:0]                 AWCACHE_S9;
    wire [2:0]                 AWPROT_S9;
    wire                       AWVALID_S9;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S9;
    wire [AXI_DWIDTH-1:0]      WDATA_S9;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_S9;
    wire                       WLAST_S9;
    wire                       WVALID_S9;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_S9;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S9;
    wire [31:0]      ARADDR_S9;
    wire [3:0]                 ARLEN_S9;
    wire [2:0]                 ARSIZE_S9;
    wire [1:0]                 ARBURST_S9;
    wire [1:0]                 ARLOCK_S9;
    wire [3:0]                 ARCACHE_S9;
    wire [2:0]                 ARPROT_S9;
    wire                       ARVALID_S9;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_S9;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S10;
    wire [31:0]      AWADDR_S10;
    wire [3:0]                 AWLEN_S10;
    wire [2:0]                 AWSIZE_S10;
    wire [1:0]                 AWBURST_S10;
    wire [1:0]                 AWLOCK_S10;
    wire [3:0]                 AWCACHE_S10;
    wire [2:0]                 AWPROT_S10;
    wire                       AWVALID_S10;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S10;
    wire [AXI_DWIDTH-1:0]      WDATA_S10;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_S10;
    wire                       WLAST_S10;
    wire                       WVALID_S10;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_S10;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S10;
    wire [31:0]      ARADDR_S10;
    wire [3:0]                 ARLEN_S10;
    wire [2:0]                 ARSIZE_S10;
    wire [1:0]                 ARBURST_S10;
    wire [1:0]                 ARLOCK_S10;
    wire [3:0]                 ARCACHE_S10;
    wire [2:0]                 ARPROT_S10;
    wire                       ARVALID_S10;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_S10;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S11;
    wire [31:0]      AWADDR_S11;
    wire [3:0]                 AWLEN_S11;
    wire [2:0]                 AWSIZE_S11;
    wire [1:0]                 AWBURST_S11;
    wire [1:0]                 AWLOCK_S11;
    wire [3:0]                 AWCACHE_S11;
    wire [2:0]                 AWPROT_S11;
    wire                       AWVALID_S11;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S11;
    wire [AXI_DWIDTH-1:0]      WDATA_S11;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_S11;
    wire                       WLAST_S11;
    wire                       WVALID_S11;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_S11;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S11;
    wire [31:0]      ARADDR_S11;
    wire [3:0]                 ARLEN_S11;
    wire [2:0]                 ARSIZE_S11;
    wire [1:0]                 ARBURST_S11;
    wire [1:0]                 ARLOCK_S11;
    wire [3:0]                 ARCACHE_S11;
    wire [2:0]                 ARPROT_S11;
    wire                       ARVALID_S11;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_S11;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S12;
    wire [31:0]      AWADDR_S12;
    wire [3:0]                 AWLEN_S12;
    wire [2:0]                 AWSIZE_S12;
    wire [1:0]                 AWBURST_S12;
    wire [1:0]                 AWLOCK_S12;
    wire [3:0]                 AWCACHE_S12;
    wire [2:0]                 AWPROT_S12;
    wire                       AWVALID_S12;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S12;
    wire [AXI_DWIDTH-1:0]      WDATA_S12;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_S12;
    wire                       WLAST_S12;
    wire                       WVALID_S12;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_S12;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S12;
    wire [31:0]      ARADDR_S12;
    wire [3:0]                 ARLEN_S12;
    wire [2:0]                 ARSIZE_S12;
    wire [1:0]                 ARBURST_S12;
    wire [1:0]                 ARLOCK_S12;
    wire [3:0]                 ARCACHE_S12;
    wire [2:0]                 ARPROT_S12;
    wire                       ARVALID_S12;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_S12;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S13;
    wire [31:0]      AWADDR_S13;
    wire [3:0]                 AWLEN_S13;
    wire [2:0]                 AWSIZE_S13;
    wire [1:0]                 AWBURST_S13;
    wire [1:0]                 AWLOCK_S13;
    wire [3:0]                 AWCACHE_S13;
    wire [2:0]                 AWPROT_S13;
    wire                       AWVALID_S13;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S13;
    wire [AXI_DWIDTH-1:0]      WDATA_S13;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_S13;
    wire                       WLAST_S13;
    wire                       WVALID_S13;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_S13;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S13;
    wire [31:0]      ARADDR_S13;
    wire [3:0]                 ARLEN_S13;
    wire [2:0]                 ARSIZE_S13;
    wire [1:0]                 ARBURST_S13;
    wire [1:0]                 ARLOCK_S13;
    wire [3:0]                 ARCACHE_S13;
    wire [2:0]                 ARPROT_S13;
    wire                       ARVALID_S13;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_S13;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S14;
    wire [31:0]      AWADDR_S14;
    wire [3:0]                 AWLEN_S14;
    wire [2:0]                 AWSIZE_S14;
    wire [1:0]                 AWBURST_S14;
    wire [1:0]                 AWLOCK_S14;
    wire [3:0]                 AWCACHE_S14;
    wire [2:0]                 AWPROT_S14;
    wire                       AWVALID_S14;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S14;
    wire [AXI_DWIDTH-1:0]      WDATA_S14;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_S14;
    wire                       WLAST_S14;
    wire                       WVALID_S14;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_S14;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S14;
    wire [31:0]      ARADDR_S14;
    wire [3:0]                 ARLEN_S14;
    wire [2:0]                 ARSIZE_S14;
    wire [1:0]                 ARBURST_S14;
    wire [1:0]                 ARLOCK_S14;
    wire [3:0]                 ARCACHE_S14;
    wire [2:0]                 ARPROT_S14;
    wire                       ARVALID_S14;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_S14;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S15;
    wire [31:0]      AWADDR_S15;
    wire [3:0]                 AWLEN_S15;
    wire [2:0]                 AWSIZE_S15;
    wire [1:0]                 AWBURST_S15;
    wire [1:0]                 AWLOCK_S15;
    wire [3:0]                 AWCACHE_S15;
    wire [2:0]                 AWPROT_S15;
    wire                       AWVALID_S15;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S15;
    wire [AXI_DWIDTH-1:0]      WDATA_S15;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_S15;
    wire                       WLAST_S15;
    wire                       WVALID_S15;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_S15;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S15;
    wire [31:0]      ARADDR_S15;
    wire [3:0]                 ARLEN_S15;
    wire [2:0]                 ARSIZE_S15;
    wire [1:0]                 ARBURST_S15;
    wire [1:0]                 ARLOCK_S15;
    wire [3:0]                 ARCACHE_S15;
    wire [2:0]                 ARPROT_S15;
    wire                       ARVALID_S15;

    // AXI SLAVE 0 read response channel signals
    wire                        RREADY_S15;

    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S16;
    wire [31:0]      AWADDR_S16;
    wire [3:0]                 AWLEN_S16;
    wire [2:0]                 AWSIZE_S16;
    wire [1:0]                 AWBURST_S16;
    wire [1:0]                 AWLOCK_S16;
    wire [3:0]                 AWCACHE_S16;
    wire [2:0]                 AWPROT_S16;
    wire                       AWVALID_S16;

    // AXI SLAVE 0 write data channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S16;
    wire [AXI_DWIDTH-1:0]      WDATA_S16;
    wire [AXI_STRBWIDTH-1:0]   WSTRB_S16;
    wire                       WLAST_S16;
    wire                       WVALID_S16;
    // AXI SLAVE 0 write response channel signals
    wire                       BREADY_S16;
    // AXI SLAVE 0 read address channel signals
    wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S16;
    wire [31:0]      ARADDR_S16;
    wire [3:0]                 ARLEN_S16;
    wire [2:0]                 ARSIZE_S16;
    wire [1:0]                 ARBURST_S16;
    wire [1:0]                 ARLOCK_S16;
    wire [3:0]                 ARCACHE_S16;
    wire [2:0]                 ARPROT_S16;
    wire                       ARVALID_S16;


   wire                        AWREADY_SI0;
   wire                        AWREADY_SI1;
   wire                        AWREADY_SI2;
   wire                        AWREADY_SI3;
   wire                        AWREADY_SI4;
   wire                        AWREADY_SI5;
   wire                        AWREADY_SI6;
   wire                        AWREADY_SI7;
   wire                        AWREADY_SI8;
   wire                        AWREADY_SI9;
   wire                        AWREADY_SI10;
   wire                        AWREADY_SI11;
   wire                        AWREADY_SI12;
   wire                        AWREADY_SI13;
   wire                        AWREADY_SI14;
   wire                        AWREADY_SI15;
   wire                        AWREADY_SI16;

   wire                        WREADY_SI0;
   wire                        WREADY_SI1;
   wire                        WREADY_SI2;
   wire                        WREADY_SI3;
   wire                        WREADY_SI4;
   wire                        WREADY_SI5;
   wire                        WREADY_SI6;
   wire                        WREADY_SI7;
   wire                        WREADY_SI8;
   wire                        WREADY_SI9;
   wire                        WREADY_SI10;
   wire                        WREADY_SI11;
   wire                        WREADY_SI12;
   wire                        WREADY_SI13;
   wire                        WREADY_SI14;
   wire                        WREADY_SI15;
   wire                        WREADY_SI16;
   
   wire                        ARREADY_SI0;
   wire                        ARREADY_SI1;
   wire                        ARREADY_SI2;
   wire                        ARREADY_SI3;
   wire                        ARREADY_SI4;
   wire                        ARREADY_SI5;
   wire                        ARREADY_SI6;
   wire                        ARREADY_SI7;
   wire                        ARREADY_SI8;
   wire                        ARREADY_SI9;
   wire                        ARREADY_SI10;
   wire                        ARREADY_SI11;
   wire                        ARREADY_SI12;
   wire                        ARREADY_SI13;
   wire                        ARREADY_SI14;
   wire                        ARREADY_SI15;
   wire                        ARREADY_SI16;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI0;
   wire [1:0]                 BRESP_SI0;
   wire                       BVALID_SI0;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI0;
   wire [AXI_DWIDTH-1:0]      RDATA_SI0;
   wire [1:0]                 RRESP_SI0;
   wire                       RLAST_SI0;
   wire                       RVALID_SI0;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI1;
   wire [1:0]                 BRESP_SI1;
   wire                       BVALID_SI1;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI1;
   wire [AXI_DWIDTH-1:0]      RDATA_SI1;
   wire [1:0]                 RRESP_SI1;
   wire                       RLAST_SI1;
   wire                       RVALID_SI1;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI2;
   wire [1:0]                 BRESP_SI2;
   wire                       BVALID_SI2;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI2;
   wire [AXI_DWIDTH-1:0]      RDATA_SI2;
   wire [1:0]                 RRESP_SI2;
   wire                       RLAST_SI2;
   wire                       RVALID_SI2;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI3;
   wire [1:0]                 BRESP_SI3;
   wire                       BVALID_SI3;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI3;
   wire [AXI_DWIDTH-1:0]      RDATA_SI3;
   wire [1:0]                 RRESP_SI3;
   wire                       RLAST_SI3;
   wire                       RVALID_SI3;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI4;
   wire [1:0]                 BRESP_SI4;
   wire                       BVALID_SI4;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI4;
   wire [AXI_DWIDTH-1:0]      RDATA_SI4;
   wire [1:0]                 RRESP_SI4;
   wire                       RLAST_SI4;
   wire                       RVALID_SI4;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI5;
   wire [1:0]                 BRESP_SI5;
   wire                       BVALID_SI5;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI5;
   wire [AXI_DWIDTH-1:0]      RDATA_SI5;
   wire [1:0]                 RRESP_SI5;
   wire                       RLAST_SI5;
   wire                       RVALID_SI5;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI6;
   wire [1:0]                 BRESP_SI6;
   wire                       BVALID_SI6;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI6;
   wire [AXI_DWIDTH-1:0]      RDATA_SI6;
   wire [1:0]                 RRESP_SI6;
   wire                       RLAST_SI6;
   wire                       RVALID_SI6;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI7;
   wire [1:0]                 BRESP_SI7;
   wire                       BVALID_SI7;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI7;
   wire [AXI_DWIDTH-1:0]      RDATA_SI7;
   wire [1:0]                 RRESP_SI7;
   wire                       RLAST_SI7;
   wire                       RVALID_SI7;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI8;
   wire [1:0]                 BRESP_SI8;
   wire                       BVALID_SI8;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI8;
   wire [AXI_DWIDTH-1:0]      RDATA_SI8;
   wire [1:0]                 RRESP_SI8;
   wire                       RLAST_SI8;
   wire                       RVALID_SI8;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI9;
   wire [1:0]                 BRESP_SI9;
   wire                       BVALID_SI9;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI9;
   wire [AXI_DWIDTH-1:0]      RDATA_SI9;
   wire [1:0]                 RRESP_SI9;
   wire                       RLAST_SI9;
   wire                       RVALID_SI9;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI10;
   wire [1:0]                 BRESP_SI10;
   wire                       BVALID_SI10;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI10;
   wire [AXI_DWIDTH-1:0]      RDATA_SI10;
   wire [1:0]                 RRESP_SI10;
   wire                       RLAST_SI10;
   wire                       RVALID_SI10;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI11;
   wire [1:0]                 BRESP_SI11;
   wire                       BVALID_SI11;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI11;
   wire [AXI_DWIDTH-1:0]      RDATA_SI11;
   wire [1:0]                 RRESP_SI11;
   wire                       RLAST_SI11;
   wire                       RVALID_SI11;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI12;
   wire [1:0]                 BRESP_SI12;
   wire                       BVALID_SI12;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI12;
   wire [AXI_DWIDTH-1:0]      RDATA_SI12;
   wire [1:0]                 RRESP_SI12;
   wire                       RLAST_SI12;
   wire                       RVALID_SI12;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI13;
   wire [1:0]                 BRESP_SI13;
   wire                       BVALID_SI13;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI13;
   wire [AXI_DWIDTH-1:0]      RDATA_SI13;
   wire [1:0]                 RRESP_SI13;
   wire                       RLAST_SI13;
   wire                       RVALID_SI13;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI14;
   wire [1:0]                 BRESP_SI14;
   wire                       BVALID_SI14;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI14;
   wire [AXI_DWIDTH-1:0]      RDATA_SI14;
   wire [1:0]                 RRESP_SI14;
   wire                       RLAST_SI14;
   wire                       RVALID_SI14;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI15;
   wire [1:0]                 BRESP_SI15;
   wire                       BVALID_SI15;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI15;
   wire [AXI_DWIDTH-1:0]      RDATA_SI15;
   wire [1:0]                 RRESP_SI15;
   wire                       RLAST_SI15;
   wire                       RVALID_SI15;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI16;
   wire [1:0]                 BRESP_SI16;
   wire                       BVALID_SI16;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI16;
   wire [AXI_DWIDTH-1:0]      RDATA_SI16;
   wire [1:0]                 RRESP_SI16;
   wire                       RLAST_SI16;
   wire                       RVALID_SI16;


   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_IM;
   wire [1:0]                 BRESP_IM;
   wire                       BVALID_IM;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_IM;
   wire [AXI_DWIDTH-1:0]      RDATA_IM;
   wire [1:0]                 RRESP_IM;
   wire                       RLAST_IM;
   wire                       RVALID_IM;

   wire                       m0_rd_end;
   wire                       m1_rd_end;
   wire                       m2_rd_end;
   wire                       m3_rd_end;
   wire                       m0_wr_end;
   wire                       m1_wr_end;
   wire                       m2_wr_end;
   wire                       m3_wr_end;

   wire                       mst_wr_inprog0;
   wire                       mst_wr_inprog1;
   wire                       mst_wr_inprog2;
   wire                       mst_wr_inprog3;
   wire                       mst_rd_inprog0;
   wire                       mst_rd_inprog1;
   wire                       mst_rd_inprog2;
   wire                       mst_rd_inprog3;
   


   /////////////////////////////////////////////////////////////////////////////
   //                               Start - of - Code                         //
   /////////////////////////////////////////////////////////////////////////////

   // --------------------------------------------------------------------------
   // axi_feedthrough Instances
   // This module is active only when FEED_THROUGH parameter is selected.
   // In this mode M0 <-> S0 connection can only happen.
   // It consumes no logic and the master0 is connected directly with the slave0
   // --------------------------------------------------------------------------

   generate 
      //if(FEED_THROUGH == 1 && SINGLE_MASTER_SINGLE_SLAVE == 1) begin  
      //Removed NUM_SLAVE_SLOT parameter
      if(FEED_THROUGH == 1) begin

   axi_feedthrough #(
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
    u_axi_feedthrough(
    // Global signals
    .ACLK        (ACLK),
    .ARESETN     (ARESETN),

    // MASTER 0
    // AXI MASTER 0 write address channel signals
    .AWID_M0     (AWID_M0),
    .AWADDR_M0   (AWADDR_M0),
    .AWLEN_M0    (AWLEN_M0),
    .AWSIZE_M0   (AWSIZE_M0),
    .AWBURST_M0  (AWBURST_M0),
    .AWLOCK_M0   (AWLOCK_M0),
    .AWCACHE_M0  (AWCACHE_M0),
    .AWPROT_M0   (AWPROT_M0),
    .AWVALID_M0  (AWVALID_M0),
    .AWREADY_M0  (AWREADY_M0),
    // AXI MASTER 0 write data channel signals
    .WID_M0      (WID_M0),
    .WDATA_M0    (WDATA_M0),
    .WSTRB_M0    (WSTRB_M0),
    .WLAST_M0    (WLAST_M0),
    .WVALID_M0   (WVALID_M0),
    .WREADY_M0   (WREADY_M0),
    // AXI MASTER 0 write response channel signals
    .BID_M0      (BID_M0),
    .BRESP_M0    (BRESP_M0),
    .BVALID_M0   (BVALID_M0),
    .BREADY_M0   (BREADY_M0),
    // AXI MASTER 0 read address channel signals
    .ARID_M0     (ARID_M0),
    .ARADDR_M0   (ARADDR_M0),
    .ARLEN_M0    (ARLEN_M0),
    .ARSIZE_M0   (ARSIZE_M0),
    .ARBURST_M0  (ARBURST_M0),
    .ARLOCK_M0   (ARLOCK_M0),
    .ARCACHE_M0  (ARCACHE_M0),
    .ARPROT_M0   (ARPROT_M0),
    .ARVALID_M0  (ARVALID_M0),
    .ARREADY_M0  (ARREADY_M0),
    // AXI MASTER 0 read response channel signals
    .RID_M0      (RID_M0),
    .RDATA_M0    (RDATA_M0),
    .RRESP_M0    (RRESP_M0),
    .RLAST_M0    (RLAST_M0),
    .RVALID_M0   (RVALID_M0),
    .RREADY_M0   (RREADY_M0),

    // SLAVE 0
    // AXI SLAVE 0 write address channel signals
    .AWID_S0     (AWID_S0),
    .AWADDR_S0   (AWADDR_S0),
    .AWLEN_S0    (AWLEN_S0),
    .AWSIZE_S0   (AWSIZE_S0),
    .AWBURST_S0  (AWBURST_S0),
    .AWLOCK_S0   (AWLOCK_S0),
    .AWCACHE_S0  (AWCACHE_S0),
    .AWPROT_S0   (AWPROT_S0),
    .AWVALID_S0  (AWVALID_S0),
    .AWREADY_S0  (AWREADY_S0),
    // AXI SLAVE 0 write data channel signals
    .WID_S0      (WID_S0),
    .WDATA_S0    (WDATA_S0),
    .WSTRB_S0    (WSTRB_S0),
    .WLAST_S0    (WLAST_S0),
    .WVALID_S0   (WVALID_S0),
    .WREADY_S0   (WREADY_S0),
    // AXI SLAVE 0 write response channel signals
    .BID_S0      (BID_S0),
    .BRESP_S0    (BRESP_S0),
    .BVALID_S0   (BVALID_S0),
    .BREADY_S0   (BREADY_S0),
    // AXI SLAVE 0 read address channel signals
    .ARID_S0     (ARID_S0),
    .ARADDR_S0   (ARADDR_S0),
    .ARLEN_S0    (ARLEN_S0),
    .ARSIZE_S0   (ARSIZE_S0),
    .ARBURST_S0  (ARBURST_S0),
    .ARLOCK_S0   (ARLOCK_S0),
    .ARCACHE_S0  (ARCACHE_S0),
    .ARPROT_S0   (ARPROT_S0),
    .ARVALID_S0  (ARVALID_S0),
    .ARREADY_S0  (ARREADY_S0),
    // AXI SLAVE 0 read response channel signals
    .RID_S0      (RID_S0),
    .RDATA_S0    (RDATA_S0),
    .RRESP_S0    (RRESP_S0),
    .RLAST_S0    (RLAST_S0),
    .RVALID_S0   (RVALID_S0),
    .RREADY_S0   (RREADY_S0)
 
   );

   end
   endgenerate

   // --------------------------------------------------------------------------
   //                           Interconnect Instances
   // --------------------------------------------------------------------------
   // Interconnect N-to-M connection
   // N = # of masters
   // M = # of slaves
   // --------------------------------------------------------------------------

   generate 
      if(FEED_THROUGH != 1) begin

   axi_interconnect_ntom #(
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
     u_interconnect_ntom(
                     // Global signals
                     .ACLK(ACLK),
                     .ARESETN(ARESETN),                     

                    .ARADDR_M0(ARADDR_M0),
                    .ARLOCK_M0(ARLOCK_M0),
                    .ARVALID_M0(ARVALID_M0),
                    .ARADDR_M1(ARADDR_M1),
                    .ARLOCK_M1(ARLOCK_M1),
                    .ARVALID_M1(ARVALID_M1),
                    .ARADDR_M2(ARADDR_M2),
                    .ARLOCK_M2(ARLOCK_M2),
                    .ARVALID_M2(ARVALID_M2),
                    .ARADDR_M3(ARADDR_M3),
                    .ARLOCK_M3(ARLOCK_M3),
                    .ARVALID_M3(ARVALID_M3),

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

                     // MASTER 0
                     // AXI MASTER 0 write address channel signals
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
                     // AXI MASTER 0 write data channel signals
                     .WID_MI0(WID_MI0),
                     .WDATA_MI0(WDATA_MI0),
                     .WSTRB_MI0(WSTRB_MI0),
                     .WLAST_MI0(WLAST_MI0),
                     .WVALID_MI0(WVALID_MI0),
                     .WREADY_IM0(WREADY_IM0),
                     // AXI MASTER 0 write response channel signals
                     .BID_IM0(BID_IM0),
                     .BRESP_IM0(BRESP_IM0),
                     .BVALID_IM0(BVALID_IM0),
                     .BREADY_MI0(BREADY_MI0),
                     // AXI MASTER 0 read address channel signals
                     .ARID_MI0(ARID_MI0),
                     .ARADDR_MI0(ARADDR_MI0),
                     .ARLEN_MI0(ARLEN_MI0),
                     .ARSIZE_MI0(ARSIZE_MI0),
                     .ARBURST_MI0(ARBURST_MI0),
                     .ARLOCK_MI0(ARLOCK_MI0),
                     .ARCACHE_MI0(ARCACHE_MI0),
                     .ARPROT_MI0(ARPROT_MI0),
                     .ARVALID_MI0(ARVALID_MI0),
                     .ARREADY_IM0(ARREADY_IM0),
                     // AXI MASTER 0 read response channel signals
                     .RID_IM0(RID_IM0),
                     .RDATA_IM0(RDATA_IM0),
                     .RRESP_IM0(RRESP_IM0),
                     .RLAST_IM0(RLAST_IM0),
                     .RVALID_IM0(RVALID_IM0),
                     .RREADY_MI0(RREADY_MI0),

                     // MASTER 1
                     // AXI MASTER 1 write address channel signals
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
                     // AXI MASTER 1 write data channel signals
                     .WID_MI1(WID_MI1),
                     .WDATA_MI1(WDATA_MI1),
                     .WSTRB_MI1(WSTRB_MI1),
                     .WLAST_MI1(WLAST_MI1),
                     .WVALID_MI1(WVALID_MI1),
                     .WREADY_IM1(WREADY_IM1),
                     // AXI MASTER 1 write response channel signals
                     .BID_IM1(BID_IM1),
                     .BRESP_IM1(BRESP_IM1),
                     .BVALID_IM1(BVALID_IM1),
                     .BREADY_MI1(BREADY_MI1),
                     // AXI MASTER 1 read address channel signals
                     .ARID_MI1(ARID_MI1),
                     .ARADDR_MI1(ARADDR_MI1),
                     .ARLEN_MI1(ARLEN_MI1),
                     .ARSIZE_MI1(ARSIZE_MI1),
                     .ARBURST_MI1(ARBURST_MI1),
                     .ARLOCK_MI1(ARLOCK_MI1),
                     .ARCACHE_MI1(ARCACHE_MI1),
                     .ARPROT_MI1(ARPROT_MI1),
                     .ARVALID_MI1(ARVALID_MI1),
                     .ARREADY_IM1(ARREADY_IM1),
                     // AXI MASTER 1 read response channel signals
                     .RID_IM1(RID_IM1),
                     .RDATA_IM1(RDATA_IM1),
                     .RRESP_IM1(RRESP_IM1),
                     .RLAST_IM1(RLAST_IM1),
                     .RVALID_IM1(RVALID_IM1),
                     .RREADY_MI1(RREADY_MI1),


                     // MASTER 2
                     // AXI MASTER 2 write address channel signals
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
                     // AXI MASTER 2 write data channel signals
                     .WID_MI2(WID_MI2),
                     .WDATA_MI2(WDATA_MI2),
                     .WSTRB_MI2(WSTRB_MI2),
                     .WLAST_MI2(WLAST_MI2),
                     .WVALID_MI2(WVALID_MI2),
                     .WREADY_IM2(WREADY_IM2),
                     // AXI MASTER 2 write response channel signals
                     .BID_IM2(BID_IM2),
                     .BRESP_IM2(BRESP_IM2),
                     .BVALID_IM2(BVALID_IM2),
                     .BREADY_MI2(BREADY_MI2),
                     // AXI MASTER 2 read address channel signals
                     .ARID_MI2(ARID_MI2),
                     .ARADDR_MI2(ARADDR_MI2),
                     .ARLEN_MI2(ARLEN_MI2),
                     .ARSIZE_MI2(ARSIZE_MI2),
                     .ARBURST_MI2(ARBURST_MI2),
                     .ARLOCK_MI2(ARLOCK_MI2),
                     .ARCACHE_MI2(ARCACHE_MI2),
                     .ARPROT_MI2(ARPROT_MI2),
                     .ARVALID_MI2(ARVALID_MI2),
                     .ARREADY_IM2(ARREADY_IM2),
                     // AXI MASTER 2 read response channel signals
                     .RID_IM2(RID_IM2),
                     .RDATA_IM2(RDATA_IM2),
                     .RRESP_IM2(RRESP_IM2),
                     .RLAST_IM2(RLAST_IM2),
                     .RVALID_IM2(RVALID_IM2),
                     .RREADY_MI2(RREADY_MI2),

                     // MASTER 3
                     // AXI MASTER 3 write address channel signals
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
                     // AXI MASTER 3 write data channel signals
                     .WID_MI3(WID_MI3),
                     .WDATA_MI3(WDATA_MI3),
                     .WSTRB_MI3(WSTRB_MI3),
                     .WLAST_MI3(WLAST_MI3),
                     .WVALID_MI3(WVALID_MI3),
                     .WREADY_IM3(WREADY_IM3),
                     // AXI MASTER 3 write response channel signals
                     .BID_IM3(BID_IM3),
                     .BRESP_IM3(BRESP_IM3),
                     .BVALID_IM3(BVALID_IM3),
                     .BREADY_MI3(BREADY_MI3),
                     // AXI MASTER 3 read address channel signals
                     .ARID_MI3(ARID_MI3),
                     .ARADDR_MI3(ARADDR_MI3),
                     .ARLEN_MI3(ARLEN_MI3),
                     .ARSIZE_MI3(ARSIZE_MI3),
                     .ARBURST_MI3(ARBURST_MI3),
                     .ARLOCK_MI3(ARLOCK_MI3),
                     .ARCACHE_MI3(ARCACHE_MI3),
                     .ARPROT_MI3(ARPROT_MI3),
                     .ARVALID_MI3(ARVALID_MI3),
                     .ARREADY_IM3(ARREADY_IM3),
                     // AXI MASTER 3 read response channel signals
                     .RID_IM3(RID_IM3),
                     .RDATA_IM3(RDATA_IM3),
                     .RRESP_IM3(RRESP_IM3),
                     .RLAST_IM3(RLAST_IM3),
                     .RVALID_IM3(RVALID_IM3),
                     .RREADY_MI3(RREADY_MI3),
 
                     // SLAVE 0
                     // AXI SLAVE 0 write address channel signals
                     .AWID_IS0(AWID_IS0),
                     .AWADDR_IS0(AWADDR_IS0),
                     .AWLEN_IS0(AWLEN_IS0),
                     .AWSIZE_IS0(AWSIZE_IS0),
                     .AWBURST_IS0(AWBURST_IS0),
                     .AWLOCK_IS0(AWLOCK_IS0),
                     .AWCACHE_IS0(AWCACHE_IS0),
                     .AWPROT_IS0(AWPROT_IS0),
                     .AWVALID_IS0(AWVALID_IS0),
                     .AWREADY_SI0(AWREADY_SI0),
                     // AXI SLAVE 0 write data channel signals
                     .WID_IS0(WID_IS0),
                     .WDATA_IS0(WDATA_IS0),
                     .WSTRB_IS0(WSTRB_IS0),
                     .WLAST_IS0(WLAST_IS0),
                     .WVALID_IS0(WVALID_IS0),
                     .WREADY_SI0(WREADY_SI0),
                     // AXI SLAVE 0 write response channel signals
                     .BID_SI0(BID_SI0),
                     .BRESP_SI0(BRESP_SI0),
                     .BVALID_SI0(BVALID_SI0),
                     .BREADY_IS0(BREADY_IS0),
                     // AXI SLAVE 0 read address channel signals
                     .ARID_IS0(ARID_IS0),
                     .ARADDR_IS0(ARADDR_IS0),
                     .ARLEN_IS0(ARLEN_IS0),
                     .ARSIZE_IS0(ARSIZE_IS0),
                     .ARBURST_IS0(ARBURST_IS0),
                     .ARLOCK_IS0(ARLOCK_IS0),
                     .ARCACHE_IS0(ARCACHE_IS0),
                     .ARPROT_IS0(ARPROT_IS0),
                     .ARVALID_IS0(ARVALID_IS0),
                     .ARREADY_SI0(ARREADY_SI0),
                     // AXI SLAVE 0 read response channel signals
                     .RID_SI0(RID_SI0),
                     .RDATA_SI0(RDATA_SI0),
                     .RRESP_SI0(RRESP_SI0),
                     .RLAST_SI0(RLAST_SI0),
                     .RVALID_SI0(RVALID_SI0),
                     .RREADY_IS0(RREADY_IS0),
                     
                     // SLAVE 1
                     // AXI SLAVE 1 write address channel signals
                     .AWID_IS1(AWID_IS1),
                     .AWADDR_IS1(AWADDR_IS1),
                     .AWLEN_IS1(AWLEN_IS1),
                     .AWSIZE_IS1(AWSIZE_IS1),
                     .AWBURST_IS1(AWBURST_IS1),
                     .AWLOCK_IS1(AWLOCK_IS1),
                     .AWCACHE_IS1(AWCACHE_IS1),
                     .AWPROT_IS1(AWPROT_IS1),
                     .AWVALID_IS1(AWVALID_IS1),
                     .AWREADY_SI1(AWREADY_SI1),
                     // AXI SLAVE 0 write data channel signals
                     .WID_IS1(WID_IS1),
                     .WDATA_IS1(WDATA_IS1),
                     .WSTRB_IS1(WSTRB_IS1),
                     .WLAST_IS1(WLAST_IS1),
                     .WVALID_IS1(WVALID_IS1),
                     .WREADY_SI1(WREADY_SI1),
                     // AXI SLAVE 0 write response channel signals
                     .BID_SI1(BID_SI1),
                     .BRESP_SI1(BRESP_SI1),
                     .BVALID_SI1(BVALID_SI1),
                     .BREADY_IS1(BREADY_IS1),
                     // AXI SLAVE 0 read address channel signals
                     .ARID_IS1(ARID_IS1),
                     .ARADDR_IS1(ARADDR_IS1),
                     .ARLEN_IS1(ARLEN_IS1),
                     .ARSIZE_IS1(ARSIZE_IS1),
                     .ARBURST_IS1(ARBURST_IS1),
                     .ARLOCK_IS1(ARLOCK_IS1),
                     .ARCACHE_IS1(ARCACHE_IS1),
                     .ARPROT_IS1(ARPROT_IS1),
                     .ARVALID_IS1(ARVALID_IS1),
                     .ARREADY_SI1(ARREADY_SI1),
                     // AXI SLAVE 0 read response channel signals
                     .RID_SI1(RID_SI1),
                     .RDATA_SI1(RDATA_SI1),
                     .RRESP_SI1(RRESP_SI1),
                     .RLAST_SI1(RLAST_SI1),
                     .RVALID_SI1(RVALID_SI1),
                     .RREADY_IS1(RREADY_IS1),
                     
                     // SLAVE 2
                     // AXI SLAVE 2 write address channel signals
                     .AWID_IS2(AWID_IS2),
                     .AWADDR_IS2(AWADDR_IS2),
                     .AWLEN_IS2(AWLEN_IS2),
                     .AWSIZE_IS2(AWSIZE_IS2),
                     .AWBURST_IS2(AWBURST_IS2),
                     .AWLOCK_IS2(AWLOCK_IS2),
                     .AWCACHE_IS2(AWCACHE_IS2),
                     .AWPROT_IS2(AWPROT_IS2),
                     .AWVALID_IS2(AWVALID_IS2),
                     .AWREADY_SI2(AWREADY_SI2),
                     // AXI SLAVE 0 write data channel signals
                     .WID_IS2(WID_IS2),
                     .WDATA_IS2(WDATA_IS2),
                     .WSTRB_IS2(WSTRB_IS2),
                     .WLAST_IS2(WLAST_IS2),
                     .WVALID_IS2(WVALID_IS2),
                     .WREADY_SI2(WREADY_SI2),
                     // AXI SLAVE 0 write response channel signals
                     .BID_SI2(BID_SI2),
                     .BRESP_SI2(BRESP_SI2),
                     .BVALID_SI2(BVALID_SI2),
                     .BREADY_IS2(BREADY_IS2),
                     // AXI SLAVE 0 read address channel signals
                     .ARID_IS2(ARID_IS2),
                     .ARADDR_IS2(ARADDR_IS2),
                     .ARLEN_IS2(ARLEN_IS2),
                     .ARSIZE_IS2(ARSIZE_IS2),
                     .ARBURST_IS2(ARBURST_IS2),
                     .ARLOCK_IS2(ARLOCK_IS2),
                     .ARCACHE_IS2(ARCACHE_IS2),
                     .ARPROT_IS2(ARPROT_IS2),
                     .ARVALID_IS2(ARVALID_IS2),
                     .ARREADY_SI2(ARREADY_SI2),
                     // AXI SLAVE 0 read response channel signals
                     .RID_SI2(RID_SI2),
                     .RDATA_SI2(RDATA_SI2),
                     .RRESP_SI2(RRESP_SI2),
                     .RLAST_SI2(RLAST_SI2),
                     .RVALID_SI2(RVALID_SI2),
                     .RREADY_IS2(RREADY_IS2),
                     
                     // SLAVE 3
                     // AXI SLAVE 3 write address channel signals
                     .AWID_IS3(AWID_IS3),
                     .AWADDR_IS3(AWADDR_IS3),
                     .AWLEN_IS3(AWLEN_IS3),
                     .AWSIZE_IS3(AWSIZE_IS3),
                     .AWBURST_IS3(AWBURST_IS3),
                     .AWLOCK_IS3(AWLOCK_IS3),
                     .AWCACHE_IS3(AWCACHE_IS3),
                     .AWPROT_IS3(AWPROT_IS3),
                     .AWVALID_IS3(AWVALID_IS3),
                     .AWREADY_SI3(AWREADY_SI3),
                     // AXI SLAVE 0 write data channel signals
                     .WID_IS3(WID_IS3),
                     .WDATA_IS3(WDATA_IS3),
                     .WSTRB_IS3(WSTRB_IS3),
                     .WLAST_IS3(WLAST_IS3),
                     .WVALID_IS3(WVALID_IS3),
                     .WREADY_SI3(WREADY_SI3),
                     // AXI SLAVE 0 write response channel signals
                     .BID_SI3(BID_SI3),
                     .BRESP_SI3(BRESP_SI3),
                     .BVALID_SI3(BVALID_SI3),
                     .BREADY_IS3(BREADY_IS3),
                     // AXI SLAVE 0 read address channel signals
                     .ARID_IS3(ARID_IS3),
                     .ARADDR_IS3(ARADDR_IS3),
                     .ARLEN_IS3(ARLEN_IS3),
                     .ARSIZE_IS3(ARSIZE_IS3),
                     .ARBURST_IS3(ARBURST_IS3),
                     .ARLOCK_IS3(ARLOCK_IS3),
                     .ARCACHE_IS3(ARCACHE_IS3),
                     .ARPROT_IS3(ARPROT_IS3),
                     .ARVALID_IS3(ARVALID_IS3),
                     .ARREADY_SI3(ARREADY_SI3),
                     // AXI SLAVE 0 read response channel signals
                     .RID_SI3(RID_SI3),
                     .RDATA_SI3(RDATA_SI3),
                     .RRESP_SI3(RRESP_SI3),
                     .RLAST_SI3(RLAST_SI3),
                     .RVALID_SI3(RVALID_SI3),
                     .RREADY_IS3(RREADY_IS3),
                     
                     // SLAVE 4
                     // AXI SLAVE 4 write address channel signals
                     .AWID_IS4(AWID_IS4),
                     .AWADDR_IS4(AWADDR_IS4),
                     .AWLEN_IS4(AWLEN_IS4),
                     .AWSIZE_IS4(AWSIZE_IS4),
                     .AWBURST_IS4(AWBURST_IS4),
                     .AWLOCK_IS4(AWLOCK_IS4),
                     .AWCACHE_IS4(AWCACHE_IS4),
                     .AWPROT_IS4(AWPROT_IS4),
                     .AWVALID_IS4(AWVALID_IS4),
                     .AWREADY_SI4(AWREADY_SI4),
                     // AXI SLAVE 0 write data channel signals
                     .WID_IS4(WID_IS4),
                     .WDATA_IS4(WDATA_IS4),
                     .WSTRB_IS4(WSTRB_IS4),
                     .WLAST_IS4(WLAST_IS4),
                     .WVALID_IS4(WVALID_IS4),
                     .WREADY_SI4(WREADY_SI4),
                     // AXI SLAVE 0 write response channel signals
                     .BID_SI4(BID_SI4),
                     .BRESP_SI4(BRESP_SI4),
                     .BVALID_SI4(BVALID_SI4),
                     .BREADY_IS4(BREADY_IS4),
                     // AXI SLAVE 0 read address channel signals
                     .ARID_IS4(ARID_IS4),
                     .ARADDR_IS4(ARADDR_IS4),
                     .ARLEN_IS4(ARLEN_IS4),
                     .ARSIZE_IS4(ARSIZE_IS4),
                     .ARBURST_IS4(ARBURST_IS4),
                     .ARLOCK_IS4(ARLOCK_IS4),
                     .ARCACHE_IS4(ARCACHE_IS4),
                     .ARPROT_IS4(ARPROT_IS4),
                     .ARVALID_IS4(ARVALID_IS4),
                     .ARREADY_SI4(ARREADY_SI4),
                     // AXI SLAVE 0 read response channel signals
                     .RID_SI4(RID_SI4),
                     .RDATA_SI4(RDATA_SI4),
                     .RRESP_SI4(RRESP_SI4),
                     .RLAST_SI4(RLAST_SI4),
                     .RVALID_SI4(RVALID_SI4),
                     .RREADY_IS4(RREADY_IS4),
                     
                     // SLAVE 5
                     // AXI SLAVE 5 write address channel signals
                     .AWID_IS5(AWID_IS5),
                     .AWADDR_IS5(AWADDR_IS5),
                     .AWLEN_IS5(AWLEN_IS5),
                     .AWSIZE_IS5(AWSIZE_IS5),
                     .AWBURST_IS5(AWBURST_IS5),
                     .AWLOCK_IS5(AWLOCK_IS5),
                     .AWCACHE_IS5(AWCACHE_IS5),
                     .AWPROT_IS5(AWPROT_IS5),
                     .AWVALID_IS5(AWVALID_IS5),
                     .AWREADY_SI5(AWREADY_SI5),
                     // AXI SLAVE 0 write data channel signals
                     .WID_IS5(WID_IS5),
                     .WDATA_IS5(WDATA_IS5),
                     .WSTRB_IS5(WSTRB_IS5),
                     .WLAST_IS5(WLAST_IS5),
                     .WVALID_IS5(WVALID_IS5),
                     .WREADY_SI5(WREADY_SI5),
                     // AXI SLAVE 0 write response channel signals
                     .BID_SI5(BID_SI5),
                     .BRESP_SI5(BRESP_SI5),
                     .BVALID_SI5(BVALID_SI5),
                     .BREADY_IS5(BREADY_IS5),
                     // AXI SLAVE 0 read address channel signals
                     .ARID_IS5(ARID_IS5),
                     .ARADDR_IS5(ARADDR_IS5),
                     .ARLEN_IS5(ARLEN_IS5),
                     .ARSIZE_IS5(ARSIZE_IS5),
                     .ARBURST_IS5(ARBURST_IS5),
                     .ARLOCK_IS5(ARLOCK_IS5),
                     .ARCACHE_IS5(ARCACHE_IS5),
                     .ARPROT_IS5(ARPROT_IS5),
                     .ARVALID_IS5(ARVALID_IS5),
                     .ARREADY_SI5(ARREADY_SI5),
                     // AXI SLAVE 0 read response channel signals
                     .RID_SI5(RID_SI5),
                     .RDATA_SI5(RDATA_SI5),
                     .RRESP_SI5(RRESP_SI5),
                     .RLAST_SI5(RLAST_SI5),
                     .RVALID_SI5(RVALID_SI5),
                     .RREADY_IS5(RREADY_IS5),
                     
                     // SLAVE 6
                     // AXI SLAVE 6 write address channel signals
                     .AWID_IS6(AWID_IS6),
                     .AWADDR_IS6(AWADDR_IS6),
                     .AWLEN_IS6(AWLEN_IS6),
                     .AWSIZE_IS6(AWSIZE_IS6),
                     .AWBURST_IS6(AWBURST_IS6),
                     .AWLOCK_IS6(AWLOCK_IS6),
                     .AWCACHE_IS6(AWCACHE_IS6),
                     .AWPROT_IS6(AWPROT_IS6),
                     .AWVALID_IS6(AWVALID_IS6),
                     .AWREADY_SI6(AWREADY_SI6),
                     // AXI SLAVE 0 write data channel signals
                     .WID_IS6(WID_IS6),
                     .WDATA_IS6(WDATA_IS6),
                     .WSTRB_IS6(WSTRB_IS6),
                     .WLAST_IS6(WLAST_IS6),
                     .WVALID_IS6(WVALID_IS6),
                     .WREADY_SI6(WREADY_SI6),
                     // AXI SLAVE 0 write response channel signals
                     .BID_SI6(BID_SI6),
                     .BRESP_SI6(BRESP_SI6),
                     .BVALID_SI6(BVALID_SI6),
                     .BREADY_IS6(BREADY_IS6),
                     // AXI SLAVE 0 read address channel signals
                     .ARID_IS6(ARID_IS6),
                     .ARADDR_IS6(ARADDR_IS6),
                     .ARLEN_IS6(ARLEN_IS6),
                     .ARSIZE_IS6(ARSIZE_IS6),
                     .ARBURST_IS6(ARBURST_IS6),
                     .ARLOCK_IS6(ARLOCK_IS6),
                     .ARCACHE_IS6(ARCACHE_IS6),
                     .ARPROT_IS6(ARPROT_IS6),
                     .ARVALID_IS6(ARVALID_IS6),
                     .ARREADY_SI6(ARREADY_SI6),
                     // AXI SLAVE 0 read response channel signals
                     .RID_SI6(RID_SI6),
                     .RDATA_SI6(RDATA_SI6),
                     .RRESP_SI6(RRESP_SI6),
                     .RLAST_SI6(RLAST_SI6),
                     .RVALID_SI6(RVALID_SI6),
                     .RREADY_IS6(RREADY_IS6),
                     
                     // SLAVE 7
                     // AXI SLAVE 7 write address channel signals
                     .AWID_IS7(AWID_IS7),
                     .AWADDR_IS7(AWADDR_IS7),
                     .AWLEN_IS7(AWLEN_IS7),
                     .AWSIZE_IS7(AWSIZE_IS7),
                     .AWBURST_IS7(AWBURST_IS7),
                     .AWLOCK_IS7(AWLOCK_IS7),
                     .AWCACHE_IS7(AWCACHE_IS7),
                     .AWPROT_IS7(AWPROT_IS7),
                     .AWVALID_IS7(AWVALID_IS7),
                     .AWREADY_SI7(AWREADY_SI7),
                     // AXI SLAVE 0 write data channel signals
                     .WID_IS7(WID_IS7),
                     .WDATA_IS7(WDATA_IS7),
                     .WSTRB_IS7(WSTRB_IS7),
                     .WLAST_IS7(WLAST_IS7),
                     .WVALID_IS7(WVALID_IS7),
                     .WREADY_SI7(WREADY_SI7),
                     // AXI SLAVE 0 write response channel signals
                     .BID_SI7(BID_SI7),
                     .BRESP_SI7(BRESP_SI7),
                     .BVALID_SI7(BVALID_SI7),
                     .BREADY_IS7(BREADY_IS7),
                     // AXI SLAVE 0 read address channel signals
                     .ARID_IS7(ARID_IS7),
                     .ARADDR_IS7(ARADDR_IS7),
                     .ARLEN_IS7(ARLEN_IS7),
                     .ARSIZE_IS7(ARSIZE_IS7),
                     .ARBURST_IS7(ARBURST_IS7),
                     .ARLOCK_IS7(ARLOCK_IS7),
                     .ARCACHE_IS7(ARCACHE_IS7),
                     .ARPROT_IS7(ARPROT_IS7),
                     .ARVALID_IS7(ARVALID_IS7),
                     .ARREADY_SI7(ARREADY_SI7),
                     // AXI SLAVE 0 read response channel signals
                     .RID_SI7(RID_SI7),
                     .RDATA_SI7(RDATA_SI7),
                     .RRESP_SI7(RRESP_SI7),
                     .RLAST_SI7(RLAST_SI7),
                     .RVALID_SI7(RVALID_SI7),
                     .RREADY_IS7(RREADY_IS7),
                     
                     // SLAVE 8
                     // AXI SLAVE 8 write address channel signals
                     .AWID_IS8(AWID_IS8),
                     .AWADDR_IS8(AWADDR_IS8),
                     .AWLEN_IS8(AWLEN_IS8),
                     .AWSIZE_IS8(AWSIZE_IS8),
                     .AWBURST_IS8(AWBURST_IS8),
                     .AWLOCK_IS8(AWLOCK_IS8),
                     .AWCACHE_IS8(AWCACHE_IS8),
                     .AWPROT_IS8(AWPROT_IS8),
                     .AWVALID_IS8(AWVALID_IS8),
                     .AWREADY_SI8(AWREADY_SI8),
                     // AXI SLAVE 0 write data channel signals
                     .WID_IS8(WID_IS8),
                     .WDATA_IS8(WDATA_IS8),
                     .WSTRB_IS8(WSTRB_IS8),
                     .WLAST_IS8(WLAST_IS8),
                     .WVALID_IS8(WVALID_IS8),
                     .WREADY_SI8(WREADY_SI8),
                     // AXI SLAVE 0 write response channel signals
                     .BID_SI8(BID_SI8),
                     .BRESP_SI8(BRESP_SI8),
                     .BVALID_SI8(BVALID_SI8),
                     .BREADY_IS8(BREADY_IS8),
                     // AXI SLAVE 0 read address channel signals
                     .ARID_IS8(ARID_IS8),
                     .ARADDR_IS8(ARADDR_IS8),
                     .ARLEN_IS8(ARLEN_IS8),
                     .ARSIZE_IS8(ARSIZE_IS8),
                     .ARBURST_IS8(ARBURST_IS8),
                     .ARLOCK_IS8(ARLOCK_IS8),
                     .ARCACHE_IS8(ARCACHE_IS8),
                     .ARPROT_IS8(ARPROT_IS8),
                     .ARVALID_IS8(ARVALID_IS8),
                     .ARREADY_SI8(ARREADY_SI8),
                     // AXI SLAVE 0 read response channel signals
                     .RID_SI8(RID_SI8),
                     .RDATA_SI8(RDATA_SI8),
                     .RRESP_SI8(RRESP_SI8),
                     .RLAST_SI8(RLAST_SI8),
                     .RVALID_SI8(RVALID_SI8),
                     .RREADY_IS8(RREADY_IS8),
                     
                     // SLAVE 9
                     // AXI SLAVE 9 write address channel signals
                     .AWID_IS9(AWID_IS9),
                     .AWADDR_IS9(AWADDR_IS9),
                     .AWLEN_IS9(AWLEN_IS9),
                     .AWSIZE_IS9(AWSIZE_IS9),
                     .AWBURST_IS9(AWBURST_IS9),
                     .AWLOCK_IS9(AWLOCK_IS9),
                     .AWCACHE_IS9(AWCACHE_IS9),
                     .AWPROT_IS9(AWPROT_IS9),
                     .AWVALID_IS9(AWVALID_IS9),
                     .AWREADY_SI9(AWREADY_SI9),
                     // AXI SLAVE 0 write data channel signals
                     .WID_IS9(WID_IS9),
                     .WDATA_IS9(WDATA_IS9),
                     .WSTRB_IS9(WSTRB_IS9),
                     .WLAST_IS9(WLAST_IS9),
                     .WVALID_IS9(WVALID_IS9),
                     .WREADY_SI9(WREADY_SI9),
                     // AXI SLAVE 0 write response channel signals
                     .BID_SI9(BID_SI9),
                     .BRESP_SI9(BRESP_SI9),
                     .BVALID_SI9(BVALID_SI9),
                     .BREADY_IS9(BREADY_IS9),
                     // AXI SLAVE 0 read address channel signals
                     .ARID_IS9(ARID_IS9),
                     .ARADDR_IS9(ARADDR_IS9),
                     .ARLEN_IS9(ARLEN_IS9),
                     .ARSIZE_IS9(ARSIZE_IS9),
                     .ARBURST_IS9(ARBURST_IS9),
                     .ARLOCK_IS9(ARLOCK_IS9),
                     .ARCACHE_IS9(ARCACHE_IS9),
                     .ARPROT_IS9(ARPROT_IS9),
                     .ARVALID_IS9(ARVALID_IS9),
                     .ARREADY_SI9(ARREADY_SI9),
                     // AXI SLAVE 0 read response channel signals
                     .RID_SI9(RID_SI9),
                     .RDATA_SI9(RDATA_SI9),
                     .RRESP_SI9(RRESP_SI9),
                     .RLAST_SI9(RLAST_SI9),
                     .RVALID_SI9(RVALID_SI9),
                     .RREADY_IS9(RREADY_IS9),
                     
                     // SLAVE 10
                     // AXI SLAVE 10 write address channel signals
                     .AWID_IS10(AWID_IS10),
                     .AWADDR_IS10(AWADDR_IS10),
                     .AWLEN_IS10(AWLEN_IS10),
                     .AWSIZE_IS10(AWSIZE_IS10),
                     .AWBURST_IS10(AWBURST_IS10),
                     .AWLOCK_IS10(AWLOCK_IS10),
                     .AWCACHE_IS10(AWCACHE_IS10),
                     .AWPROT_IS10(AWPROT_IS10),
                     .AWVALID_IS10(AWVALID_IS10),
                     .AWREADY_SI10(AWREADY_SI10),
                     // AXI SLAVE 0 write data channel signals
                     .WID_IS10(WID_IS10),
                     .WDATA_IS10(WDATA_IS10),
                     .WSTRB_IS10(WSTRB_IS10),
                     .WLAST_IS10(WLAST_IS10),
                     .WVALID_IS10(WVALID_IS10),
                     .WREADY_SI10(WREADY_SI10),
                     // AXI SLAVE 0 write response channel signals
                     .BID_SI10(BID_SI10),
                     .BRESP_SI10(BRESP_SI10),
                     .BVALID_SI10(BVALID_SI10),
                     .BREADY_IS10(BREADY_IS10),
                     // AXI SLAVE 0 read address channel signals
                     .ARID_IS10(ARID_IS10),
                     .ARADDR_IS10(ARADDR_IS10),
                     .ARLEN_IS10(ARLEN_IS10),
                     .ARSIZE_IS10(ARSIZE_IS10),
                     .ARBURST_IS10(ARBURST_IS10),
                     .ARLOCK_IS10(ARLOCK_IS10),
                     .ARCACHE_IS10(ARCACHE_IS10),
                     .ARPROT_IS10(ARPROT_IS10),
                     .ARVALID_IS10(ARVALID_IS10),
                     .ARREADY_SI10(ARREADY_SI10),
                     // AXI SLAVE 0 read response channel signals
                     .RID_SI10(RID_SI10),
                     .RDATA_SI10(RDATA_SI10),
                     .RRESP_SI10(RRESP_SI10),
                     .RLAST_SI10(RLAST_SI10),
                     .RVALID_SI10(RVALID_SI10),
                     .RREADY_IS10(RREADY_IS10),
                     
                     // SLAVE 11
                     // AXI SLAVE 11 write address channel signals
                     .AWID_IS11(AWID_IS11),
                     .AWADDR_IS11(AWADDR_IS11),
                     .AWLEN_IS11(AWLEN_IS11),
                     .AWSIZE_IS11(AWSIZE_IS11),
                     .AWBURST_IS11(AWBURST_IS11),
                     .AWLOCK_IS11(AWLOCK_IS11),
                     .AWCACHE_IS11(AWCACHE_IS11),
                     .AWPROT_IS11(AWPROT_IS11),
                     .AWVALID_IS11(AWVALID_IS11),
                     .AWREADY_SI11(AWREADY_SI11),
                     // AXI SLAVE 0 write data channel signals
                     .WID_IS11(WID_IS11),
                     .WDATA_IS11(WDATA_IS11),
                     .WSTRB_IS11(WSTRB_IS11),
                     .WLAST_IS11(WLAST_IS11),
                     .WVALID_IS11(WVALID_IS11),
                     .WREADY_SI11(WREADY_SI11),
                     // AXI SLAVE 0 write response channel signals
                     .BID_SI11(BID_SI11),
                     .BRESP_SI11(BRESP_SI11),
                     .BVALID_SI11(BVALID_SI11),
                     .BREADY_IS11(BREADY_IS11),
                     // AXI SLAVE 0 read address channel signals
                     .ARID_IS11(ARID_IS11),
                     .ARADDR_IS11(ARADDR_IS11),
                     .ARLEN_IS11(ARLEN_IS11),
                     .ARSIZE_IS11(ARSIZE_IS11),
                     .ARBURST_IS11(ARBURST_IS11),
                     .ARLOCK_IS11(ARLOCK_IS11),
                     .ARCACHE_IS11(ARCACHE_IS11),
                     .ARPROT_IS11(ARPROT_IS11),
                     .ARVALID_IS11(ARVALID_IS11),
                     .ARREADY_SI11(ARREADY_SI11),
                     // AXI SLAVE 0 read response channel signals
                     .RID_SI11(RID_SI11),
                     .RDATA_SI11(RDATA_SI11),
                     .RRESP_SI11(RRESP_SI11),
                     .RLAST_SI11(RLAST_SI11),
                     .RVALID_SI11(RVALID_SI11),
                     .RREADY_IS11(RREADY_IS11),
                     
                     // SLAVE 12
                     // AXI SLAVE 12 write address channel signals
                     .AWID_IS12(AWID_IS12),
                     .AWADDR_IS12(AWADDR_IS12),
                     .AWLEN_IS12(AWLEN_IS12),
                     .AWSIZE_IS12(AWSIZE_IS12),
                     .AWBURST_IS12(AWBURST_IS12),
                     .AWLOCK_IS12(AWLOCK_IS12),
                     .AWCACHE_IS12(AWCACHE_IS12),
                     .AWPROT_IS12(AWPROT_IS12),
                     .AWVALID_IS12(AWVALID_IS12),
                     .AWREADY_SI12(AWREADY_SI12),
                     // AXI SLAVE 0 write data channel signals
                     .WID_IS12(WID_IS12),
                     .WDATA_IS12(WDATA_IS12),
                     .WSTRB_IS12(WSTRB_IS12),
                     .WLAST_IS12(WLAST_IS12),
                     .WVALID_IS12(WVALID_IS12),
                     .WREADY_SI12(WREADY_SI12),
                     // AXI SLAVE 0 write response channel signals
                     .BID_SI12(BID_SI12),
                     .BRESP_SI12(BRESP_SI12),
                     .BVALID_SI12(BVALID_SI12),
                     .BREADY_IS12(BREADY_IS12),
                     // AXI SLAVE 0 read address channel signals
                     .ARID_IS12(ARID_IS12),
                     .ARADDR_IS12(ARADDR_IS12),
                     .ARLEN_IS12(ARLEN_IS12),
                     .ARSIZE_IS12(ARSIZE_IS12),
                     .ARBURST_IS12(ARBURST_IS12),
                     .ARLOCK_IS12(ARLOCK_IS12),
                     .ARCACHE_IS12(ARCACHE_IS12),
                     .ARPROT_IS12(ARPROT_IS12),
                     .ARVALID_IS12(ARVALID_IS12),
                     .ARREADY_SI12(ARREADY_SI12),
                     // AXI SLAVE 0 read response channel signals
                     .RID_SI12(RID_SI12),
                     .RDATA_SI12(RDATA_SI12),
                     .RRESP_SI12(RRESP_SI12),
                     .RLAST_SI12(RLAST_SI12),
                     .RVALID_SI12(RVALID_SI12),
                     .RREADY_IS12(RREADY_IS12),
                     
                     // SLAVE 13
                     // AXI SLAVE 13 write address channel signals
                     .AWID_IS13(AWID_IS13),
                     .AWADDR_IS13(AWADDR_IS13),
                     .AWLEN_IS13(AWLEN_IS13),
                     .AWSIZE_IS13(AWSIZE_IS13),
                     .AWBURST_IS13(AWBURST_IS13),
                     .AWLOCK_IS13(AWLOCK_IS13),
                     .AWCACHE_IS13(AWCACHE_IS13),
                     .AWPROT_IS13(AWPROT_IS13),
                     .AWVALID_IS13(AWVALID_IS13),
                     .AWREADY_SI13(AWREADY_SI13),
                     // AXI SLAVE 0 write data channel signals
                     .WID_IS13(WID_IS13),
                     .WDATA_IS13(WDATA_IS13),
                     .WSTRB_IS13(WSTRB_IS13),
                     .WLAST_IS13(WLAST_IS13),
                     .WVALID_IS13(WVALID_IS13),
                     .WREADY_SI13(WREADY_SI13),
                     // AXI SLAVE 0 write response channel signals
                     .BID_SI13(BID_SI13),
                     .BRESP_SI13(BRESP_SI13),
                     .BVALID_SI13(BVALID_SI13),
                     .BREADY_IS13(BREADY_IS13),
                     // AXI SLAVE 0 read address channel signals
                     .ARID_IS13(ARID_IS13),
                     .ARADDR_IS13(ARADDR_IS13),
                     .ARLEN_IS13(ARLEN_IS13),
                     .ARSIZE_IS13(ARSIZE_IS13),
                     .ARBURST_IS13(ARBURST_IS13),
                     .ARLOCK_IS13(ARLOCK_IS13),
                     .ARCACHE_IS13(ARCACHE_IS13),
                     .ARPROT_IS13(ARPROT_IS13),
                     .ARVALID_IS13(ARVALID_IS13),
                     .ARREADY_SI13(ARREADY_SI13),
                     // AXI SLAVE 0 read response channel signals
                     .RID_SI13(RID_SI13),
                     .RDATA_SI13(RDATA_SI13),
                     .RRESP_SI13(RRESP_SI13),
                     .RLAST_SI13(RLAST_SI13),
                     .RVALID_SI13(RVALID_SI13),
                     .RREADY_IS13(RREADY_IS13),
                     
                     // SLAVE 14
                     // AXI SLAVE 14 write address channel signals
                     .AWID_IS14(AWID_IS14),
                     .AWADDR_IS14(AWADDR_IS14),
                     .AWLEN_IS14(AWLEN_IS14),
                     .AWSIZE_IS14(AWSIZE_IS14),
                     .AWBURST_IS14(AWBURST_IS14),
                     .AWLOCK_IS14(AWLOCK_IS14),
                     .AWCACHE_IS14(AWCACHE_IS14),
                     .AWPROT_IS14(AWPROT_IS14),
                     .AWVALID_IS14(AWVALID_IS14),
                     .AWREADY_SI14(AWREADY_SI14),
                     // AXI SLAVE 0 write data channel signals
                     .WID_IS14(WID_IS14),
                     .WDATA_IS14(WDATA_IS14),
                     .WSTRB_IS14(WSTRB_IS14),
                     .WLAST_IS14(WLAST_IS14),
                     .WVALID_IS14(WVALID_IS14),
                     .WREADY_SI14(WREADY_SI14),
                     // AXI SLAVE 0 write response channel signals
                     .BID_SI14(BID_SI14),
                     .BRESP_SI14(BRESP_SI14),
                     .BVALID_SI14(BVALID_SI14),
                     .BREADY_IS14(BREADY_IS14),
                     // AXI SLAVE 0 read address channel signals
                     .ARID_IS14(ARID_IS14),
                     .ARADDR_IS14(ARADDR_IS14),
                     .ARLEN_IS14(ARLEN_IS14),
                     .ARSIZE_IS14(ARSIZE_IS14),
                     .ARBURST_IS14(ARBURST_IS14),
                     .ARLOCK_IS14(ARLOCK_IS14),
                     .ARCACHE_IS14(ARCACHE_IS14),
                     .ARPROT_IS14(ARPROT_IS14),
                     .ARVALID_IS14(ARVALID_IS14),
                     .ARREADY_SI14(ARREADY_SI14),
                     // AXI SLAVE 0 read response channel signals
                     .RID_SI14(RID_SI14),
                     .RDATA_SI14(RDATA_SI14),
                     .RRESP_SI14(RRESP_SI14),
                     .RLAST_SI14(RLAST_SI14),
                     .RVALID_SI14(RVALID_SI14),
                     .RREADY_IS14(RREADY_IS14),
                     
                     // SLAVE 15
                     // AXI SLAVE 15 write address channel signals
                     .AWID_IS15(AWID_IS15),
                     .AWADDR_IS15(AWADDR_IS15),
                     .AWLEN_IS15(AWLEN_IS15),
                     .AWSIZE_IS15(AWSIZE_IS15),
                     .AWBURST_IS15(AWBURST_IS15),
                     .AWLOCK_IS15(AWLOCK_IS15),
                     .AWCACHE_IS15(AWCACHE_IS15),
                     .AWPROT_IS15(AWPROT_IS15),
                     .AWVALID_IS15(AWVALID_IS15),
                     .AWREADY_SI15(AWREADY_SI15),
                     // AXI SLAVE 0 write data channel signals
                     .WID_IS15(WID_IS15),
                     .WDATA_IS15(WDATA_IS15),
                     .WSTRB_IS15(WSTRB_IS15),
                     .WLAST_IS15(WLAST_IS15),
                     .WVALID_IS15(WVALID_IS15),
                     .WREADY_SI15(WREADY_SI15),
                     // AXI SLAVE 0 write response channel signals
                     .BID_SI15(BID_SI15),
                     .BRESP_SI15(BRESP_SI15),
                     .BVALID_SI15(BVALID_SI15),
                     .BREADY_IS15(BREADY_IS15),
                     // AXI SLAVE 0 read address channel signals
                     .ARID_IS15(ARID_IS15),
                     .ARADDR_IS15(ARADDR_IS15),
                     .ARLEN_IS15(ARLEN_IS15),
                     .ARSIZE_IS15(ARSIZE_IS15),
                     .ARBURST_IS15(ARBURST_IS15),
                     .ARLOCK_IS15(ARLOCK_IS15),
                     .ARCACHE_IS15(ARCACHE_IS15),
                     .ARPROT_IS15(ARPROT_IS15),
                     .ARVALID_IS15(ARVALID_IS15),
                     .ARREADY_SI15(ARREADY_SI15),
                     // AXI SLAVE 0 read response channel signals
                     .RID_SI15(RID_SI15),
                     .RDATA_SI15(RDATA_SI15),
                     .RRESP_SI15(RRESP_SI15),
                     .RLAST_SI15(RLAST_SI15),
                     .RVALID_SI15(RVALID_SI15),
                     .RREADY_IS15(RREADY_IS15),

                     // SLAVE 16
                     // AXI SLAVE 16 write address channel signals
                     .AWID_IS16(AWID_IS16),
                     .AWADDR_IS16(AWADDR_IS16),
                     .AWLEN_IS16(AWLEN_IS16),
                     .AWSIZE_IS16(AWSIZE_IS16),
                     .AWBURST_IS16(AWBURST_IS16),
                     .AWLOCK_IS16(AWLOCK_IS16),
                     .AWCACHE_IS16(AWCACHE_IS16),
                     .AWPROT_IS16(AWPROT_IS16),
                     .AWVALID_IS16(AWVALID_IS16),
                     .AWREADY_SI16(AWREADY_SI16),
                     // AXI SLAVE 0 write data channel signals
                     .WID_IS16(WID_IS16),
                     .WDATA_IS16(WDATA_IS16),
                     .WSTRB_IS16(WSTRB_IS16),
                     .WLAST_IS16(WLAST_IS16),
                     .WVALID_IS16(WVALID_IS16),
                     .WREADY_SI16(WREADY_SI16),
                     // AXI SLAVE 0 write response channel signals
                     .BID_SI16(BID_SI16),
                     .BRESP_SI16(BRESP_SI16),
                     .BVALID_SI16(BVALID_SI16),
                     .BREADY_IS16(BREADY_IS16),
                     // AXI SLAVE 0 read address channel signals
                     .ARID_IS16(ARID_IS16),
                     .ARADDR_IS16(ARADDR_IS16),
                     .ARLEN_IS16(ARLEN_IS16),
                     .ARSIZE_IS16(ARSIZE_IS16),
                     .ARBURST_IS16(ARBURST_IS16),
                     .ARLOCK_IS16(ARLOCK_IS16),
                     .ARCACHE_IS16(ARCACHE_IS16),
                     .ARPROT_IS16(ARPROT_IS16),
                     .ARVALID_IS16(ARVALID_IS16),
                     .ARREADY_SI16(ARREADY_SI16),
                     // AXI SLAVE 0 read response channel signals
                     .RID_SI16(RID_SI16),
                     .RDATA_SI16(RDATA_SI16),
                     .RRESP_SI16(RRESP_SI16),
                     .RLAST_SI16(RLAST_SI16),
                     .RVALID_SI16(RVALID_SI16),
                     .RREADY_IS16(RREADY_IS16),


		             // To arbiter (within interconnect)
		             .m0_rd_end(m0_rd_end),
                     .m0_wr_end(m0_wr_end),
                     
		             .m1_rd_end(m1_rd_end),
                     .m1_wr_end(m1_wr_end),
                     
		             .m2_rd_end(m2_rd_end),
                     .m2_wr_end(m2_wr_end),
                     
		             .m3_rd_end(m3_rd_end),
                     .m3_wr_end(m3_wr_end),

                     // v3.2 FOR OUTSTANDING WRITES
                     .AWREADY_M0 (AWREADY_M0),
                     .AWREADY_M1 (AWREADY_M1),
                     .AWREADY_M2 (AWREADY_M2),
                     .AWREADY_M3 (AWREADY_M3),
                     .BVALID_M0 (BVALID_M0),
                     .BVALID_M1 (BVALID_M1),
                     .BVALID_M2 (BVALID_M2),
                     .BVALID_M3 (BVALID_M3),
                     .BREADY_M0 (BREADY_M0),
                     .BREADY_M1 (BREADY_M1),
                     .BREADY_M2 (BREADY_M2),
                     .BREADY_M3 (BREADY_M3),

                    .WVALID_M0(WVALID_M0),
                    .WVALID_M1(WVALID_M1),
                    .WVALID_M2(WVALID_M2),
                    .WVALID_M3(WVALID_M3),
                    .WREADY_M0(WREADY_M0),
                    .WREADY_M1(WREADY_M1),
                    .WREADY_M2(WREADY_M2),
                    .WREADY_M3(WREADY_M3),
                    .WLAST_M0 (WLAST_M0 ),
                    .WLAST_M1 (WLAST_M1 ),
                    .WLAST_M2 (WLAST_M2 ),
                    .WLAST_M3 (WLAST_M3 )

                    ,.AWID_M0(AWID_M0)
                    ,.AWID_M1(AWID_M1)
                    ,.AWID_M2(AWID_M2)
                    ,.AWID_M3(AWID_M3)

                    ,.mst_rd_inprog0(mst_rd_inprog0) 
                    ,.mst_rd_inprog1(mst_rd_inprog1) 
                    ,.mst_rd_inprog2(mst_rd_inprog2) 
                    ,.mst_rd_inprog3(mst_rd_inprog3) 
                    ,.mst_wr_inprog0(mst_wr_inprog0)                               
                    ,.mst_wr_inprog1(mst_wr_inprog1)                               
                    ,.mst_wr_inprog2(mst_wr_inprog2)                               
                    ,.mst_wr_inprog3(mst_wr_inprog3)                               

                     );  // interconnect_ntom
	     end
     endgenerate

   generate 
      if(FEED_THROUGH != 1) begin
   axi_master_stage #(
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
               .UID_WIDTH(2'b00),
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
     master_stage0(
                   // Global signals
                   .ACLK(ACLK),
                   .ARESETN(ARESETN),
                   
                   // MASTER 0
                   // AXI MASTER 0 write address channel signals
                   .AWID_M(AWID_M0),
                   .AWADDR_M(AWADDR_M0),
                   .AWLEN_M(AWLEN_M0),
                   .AWSIZE_M(AWSIZE_M0),
                   .AWBURST_M(AWBURST_M0),
                   .AWLOCK_M(AWLOCK_M0),
                   .AWCACHE_M(AWCACHE_M0),
                   .AWPROT_M(AWPROT_M0),
                   .AWVALID_M(AWVALID_M0),
                   .AWREADY_M(AWREADY_M0),
                   // AXI MASTER 0 write data channel signals
                   .WID_M(WID_M0),
                   .WDATA_M(WDATA_M0),
                   .WSTRB_M(WSTRB_M0),
                   .WLAST_M(WLAST_M0),
                   .WVALID_M(WVALID_M0),
                   .WREADY_M(WREADY_M0),
                   // AXI MASTER 0 write response channel signals
                   .BID_M(BID_M0),
                   .BRESP_M(BRESP_M0),
                   .BVALID_M(BVALID_M0),
                   .BREADY_M(BREADY_M0),
                   // AXI MASTER 0 read address channel signals
                   .ARID_M(ARID_M0),
                   .ARADDR_M(ARADDR_M0),
                   .ARLEN_M(ARLEN_M0),
                   .ARSIZE_M(ARSIZE_M0),
                   .ARBURST_M(ARBURST_M0),
                   .ARLOCK_M(ARLOCK_M0),
                   .ARCACHE_M(ARCACHE_M0),
                   .ARPROT_M(ARPROT_M0),
                   .ARVALID_M(ARVALID_M0),
                   .ARREADY_M(ARREADY_M0),
                   // AXI MASTER 0 read response channel signals
                   .RID_M(RID_M0),
                   .RDATA_M(RDATA_M0),
                   .RRESP_M(RRESP_M0),
                   .RLAST_M(RLAST_M0),
                   .RVALID_M(RVALID_M0),
                   .RREADY_M(RREADY_M0),
                   
                   // SLAVE 0
                   // AXI SLAVE 0 write address channel signals
                   .AWID_MI(AWID_MI0),
                   .AWADDR_MI(AWADDR_MI0),
                   .AWLEN_MI(AWLEN_MI0),
                   .AWSIZE_MI(AWSIZE_MI0),
                   .AWBURST_MI(AWBURST_MI0),
                   .AWLOCK_MI(AWLOCK_MI0),
                   .AWCACHE_MI(AWCACHE_MI0),
                   .AWPROT_MI(AWPROT_MI0),
                   .AWVALID_MI(AWVALID_MI0),
                   .AWREADY_IM(AWREADY_IM0),
                   // AXI SLAVE 0 write data channel signals
                   .WID_MI(WID_MI0),
                   .WDATA_MI(WDATA_MI0),
                   .WSTRB_MI(WSTRB_MI0),
                   .WLAST_MI(WLAST_MI0),
                   .WVALID_MI(WVALID_MI0),
                   .WREADY_IM(WREADY_IM0),
                   // AXI SLAVE 0 write response channel signals
                   .BID_IM(BID_IM0),
                   .BRESP_IM(BRESP_IM0),
                   .BVALID_IM(BVALID_IM0),
                   .BREADY_MI(BREADY_MI0),
                   // AXI SLAVE 0 read address channel signals
                   .ARID_MI(ARID_MI0),
                   .ARADDR_MI(ARADDR_MI0),
                   .ARLEN_MI(ARLEN_MI0),
                   .ARSIZE_MI(ARSIZE_MI0),
                   .ARBURST_MI(ARBURST_MI0),
                   .ARLOCK_MI(ARLOCK_MI0),
                   .ARCACHE_MI(ARCACHE_MI0),
                   .ARPROT_MI(ARPROT_MI0),
                   .ARVALID_MI(ARVALID_MI0),
                   .ARREADY_IM(ARREADY_IM0),
                   // AXI SLAVE 0 read response channel signals
                   .RID_IM(RID_IM0),
                   .RDATA_IM(RDATA_IM0),
                   .RRESP_IM(RRESP_IM0),
                   .RLAST_IM(RLAST_IM0),
                   .RVALID_IM(RVALID_IM0),
                   .RREADY_MI(RREADY_MI0),


		           .master_rd_end(m0_rd_end),
                   .master_wr_end(m0_wr_end)
                   ,.mst_rd_inprog(mst_rd_inprog0)
                   ,.mst_wr_inprog(mst_wr_inprog0)                               
                   );    //master_stage

      end // if (FEED_THROUGH != 1)
   endgenerate
   
   generate 
      if(NUM_MASTER_SLOT > 1 && FEED_THROUGH != 1) begin

         axi_master_stage #(
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
                        .UID_WIDTH(2'b01),
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
           master_stage1(
                         // Global signals
                         .ACLK(ACLK),
                         .ARESETN(ARESETN),
                   
                         // MASTER 1
                         // AXI MASTER 1 write address channel signals
                         .AWID_M(AWID_M1),
                         .AWADDR_M(AWADDR_M1),
                         .AWLEN_M(AWLEN_M1),
                         .AWSIZE_M(AWSIZE_M1),
                         .AWBURST_M(AWBURST_M1),
                         .AWLOCK_M(AWLOCK_M1),
                         .AWCACHE_M(AWCACHE_M1),
                         .AWPROT_M(AWPROT_M1),
                         .AWVALID_M(AWVALID_M1),
                         .AWREADY_M(AWREADY_M1),
                         // AXI MASTER 1 write data channel signals
                         .WID_M(WID_M1),
                         .WDATA_M(WDATA_M1),
                         .WSTRB_M(WSTRB_M1),
                         .WLAST_M(WLAST_M1),
                         .WVALID_M(WVALID_M1),
                         .WREADY_M(WREADY_M1),
                         // AXI MASTER 1 write response channel signals
                         .BID_M(BID_M1),
                         .BRESP_M(BRESP_M1),
                         .BVALID_M(BVALID_M1),
                         .BREADY_M(BREADY_M1),
                         // AXI MASTER 1 read address channel signals
                         .ARID_M(ARID_M1),
                         .ARADDR_M(ARADDR_M1),
                         .ARLEN_M(ARLEN_M1),
                         .ARSIZE_M(ARSIZE_M1),
                         .ARBURST_M(ARBURST_M1),
                         .ARLOCK_M(ARLOCK_M1),
                         .ARCACHE_M(ARCACHE_M1),
                         .ARPROT_M(ARPROT_M1),
                         .ARVALID_M(ARVALID_M1),
                         .ARREADY_M(ARREADY_M1),
                         // AXI MASTER 1 read response channel signals
                         .RID_M(RID_M1),
                         .RDATA_M(RDATA_M1),
                         .RRESP_M(RRESP_M1),
                         .RLAST_M(RLAST_M1),
                         .RVALID_M(RVALID_M1),
                         .RREADY_M(RREADY_M1),
                   
                         // SLAVE 0
                         // AXI SLAVE 0 write address channel signals
                         .AWID_MI(AWID_MI1),
                         .AWADDR_MI(AWADDR_MI1),
                         .AWLEN_MI(AWLEN_MI1),
                         .AWSIZE_MI(AWSIZE_MI1),
                         .AWBURST_MI(AWBURST_MI1),
                         .AWLOCK_MI(AWLOCK_MI1),
                         .AWCACHE_MI(AWCACHE_MI1),
                         .AWPROT_MI(AWPROT_MI1),
                         .AWVALID_MI(AWVALID_MI1),
                         .AWREADY_IM(AWREADY_IM1),
                         // AXI SLAVE 0 write data channel signals
                         .WID_MI(WID_MI1),
                         .WDATA_MI(WDATA_MI1),
                         .WSTRB_MI(WSTRB_MI1),
                         .WLAST_MI(WLAST_MI1),
                         .WVALID_MI(WVALID_MI1),
                         .WREADY_IM(WREADY_IM1),
                         // AXI SLAVE 0 write response channel signals
                         .BID_IM(BID_IM1),
                         .BRESP_IM(BRESP_IM1),
                         .BVALID_IM(BVALID_IM1),
                         .BREADY_MI(BREADY_MI1),
                         // AXI SLAVE 0 read address channel signals
                         .ARID_MI(ARID_MI1),
                         .ARADDR_MI(ARADDR_MI1),
                         .ARLEN_MI(ARLEN_MI1),
                         .ARSIZE_MI(ARSIZE_MI1),
                         .ARBURST_MI(ARBURST_MI1),
                         .ARLOCK_MI(ARLOCK_MI1),
                         .ARCACHE_MI(ARCACHE_MI1),
                         .ARPROT_MI(ARPROT_MI1),
                         .ARVALID_MI(ARVALID_MI1),
                         .ARREADY_IM(ARREADY_IM1),
                         // AXI SLAVE 0 read response channel signals
                         .RID_IM(RID_IM1),
                         .RDATA_IM(RDATA_IM1),
                         .RRESP_IM(RRESP_IM1),
                         .RLAST_IM(RLAST_IM1),
                         .RVALID_IM(RVALID_IM1),
                         .RREADY_MI(RREADY_MI1),

                         
		                 .master_rd_end(m1_rd_end),
                         .master_wr_end(m1_wr_end)
                         ,.mst_rd_inprog(mst_rd_inprog1) 
                         ,.mst_wr_inprog(mst_wr_inprog1)                               
                         
                         );    //master_stage1
         
      end // if (NUM_MASTER_SLOT > 1)      
   endgenerate   

   generate 
      if(NUM_MASTER_SLOT > 2  && FEED_THROUGH != 1) begin

         axi_master_stage #(
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
                        .UID_WIDTH(2'b10),
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
           master_stage2(
                         // Global signals
                         .ACLK(ACLK),
                         .ARESETN(ARESETN),
                         
                         // MASTER 2
                         // AXI MASTER 0 write address channel signals
                         .AWID_M(AWID_M2),
                         .AWADDR_M(AWADDR_M2),
                         .AWLEN_M(AWLEN_M2),
                         .AWSIZE_M(AWSIZE_M2),
                         .AWBURST_M(AWBURST_M2),
                         .AWLOCK_M(AWLOCK_M2),
                         .AWCACHE_M(AWCACHE_M2),
                         .AWPROT_M(AWPROT_M2),
                         .AWVALID_M(AWVALID_M2),
                         .AWREADY_M(AWREADY_M2),
                         // AXI MASTER 2 write data channel signals
                         .WID_M(WID_M2),
                         .WDATA_M(WDATA_M2),
                         .WSTRB_M(WSTRB_M2),
                         .WLAST_M(WLAST_M2),
                         .WVALID_M(WVALID_M2),
                         .WREADY_M(WREADY_M2),
                         // AXI MASTER 2 write response channel signals
                         .BID_M(BID_M2),
                         .BRESP_M(BRESP_M2),
                         .BVALID_M(BVALID_M2),
                         .BREADY_M(BREADY_M2),
                         // AXI MASTER 2 read address channel signals
                         .ARID_M(ARID_M2),
                         .ARADDR_M(ARADDR_M2),
                         .ARLEN_M(ARLEN_M2),
                         .ARSIZE_M(ARSIZE_M2),
                         .ARBURST_M(ARBURST_M2),
                         .ARLOCK_M(ARLOCK_M2),
                         .ARCACHE_M(ARCACHE_M2),
                         .ARPROT_M(ARPROT_M2),
                         .ARVALID_M(ARVALID_M2),
                         .ARREADY_M(ARREADY_M2),
                         // AXI MASTER 2 read response channel signals
                         .RID_M(RID_M2),
                         .RDATA_M(RDATA_M2),
                         .RRESP_M(RRESP_M2),
                         .RLAST_M(RLAST_M2),
                         .RVALID_M(RVALID_M2),
                         .RREADY_M(RREADY_M2),
                         
                         // SLAVE 0
                         // AXI SLAVE 0 write address channel signals
                         .AWID_MI(AWID_MI2),
                         .AWADDR_MI(AWADDR_MI2),
                         .AWLEN_MI(AWLEN_MI2),
                         .AWSIZE_MI(AWSIZE_MI2),
                         .AWBURST_MI(AWBURST_MI2),
                         .AWLOCK_MI(AWLOCK_MI2),
                         .AWCACHE_MI(AWCACHE_MI2),
                         .AWPROT_MI(AWPROT_MI2),
                         .AWVALID_MI(AWVALID_MI2),
                         .AWREADY_IM(AWREADY_IM2),
                         // AXI SLAVE 0 write data channel signals
                         .WID_MI(WID_MI2),
                         .WDATA_MI(WDATA_MI2),
                         .WSTRB_MI(WSTRB_MI2),
                         .WLAST_MI(WLAST_MI2),
                         .WVALID_MI(WVALID_MI2),
                         .WREADY_IM(WREADY_IM2),
                         // AXI SLAVE 0 write response channel signals
                         .BID_IM(BID_IM2),
                         .BRESP_IM(BRESP_IM2),
                         .BVALID_IM(BVALID_IM2),
                         .BREADY_MI(BREADY_MI2),
                         // AXI SLAVE 0 read address channel signals
                         .ARID_MI(ARID_MI2),
                         .ARADDR_MI(ARADDR_MI2),
                         .ARLEN_MI(ARLEN_MI2),
                         .ARSIZE_MI(ARSIZE_MI2),
                         .ARBURST_MI(ARBURST_MI2),
                         .ARLOCK_MI(ARLOCK_MI2),
                         .ARCACHE_MI(ARCACHE_MI2),
                         .ARPROT_MI(ARPROT_MI2),
                         .ARVALID_MI(ARVALID_MI2),
                         .ARREADY_IM(ARREADY_IM2),
                         // AXI SLAVE 0 read response channel signals
                         .RID_IM(RID_IM2),
                         .RDATA_IM(RDATA_IM2),
                         .RRESP_IM(RRESP_IM2),
                         .RLAST_IM(RLAST_IM2),
                         .RVALID_IM(RVALID_IM2),
                         .RREADY_MI(RREADY_MI2),


		                 .master_rd_end(m2_rd_end),
                         .master_wr_end(m2_wr_end)
                         ,.mst_rd_inprog(mst_rd_inprog2) 
                         ,.mst_wr_inprog(mst_wr_inprog2)                               

                              
                         );    //master_stage2
      end // if (NUM_MASTER_SLOT > 2)      
   endgenerate

   generate 
      if(NUM_MASTER_SLOT > 3  && FEED_THROUGH != 1) begin

         axi_master_stage #(
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
                        .UID_WIDTH(2'b11),
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
           master_stage3(
                         // Global signals
                         .ACLK(ACLK),
                         .ARESETN(ARESETN),
                   
                         // MASTER 3
                         // AXI MASTER 3 write address channel signals
                         .AWID_M(AWID_M3),
                         .AWADDR_M(AWADDR_M3),
                         .AWLEN_M(AWLEN_M3),
                         .AWSIZE_M(AWSIZE_M3),
                         .AWBURST_M(AWBURST_M3),
                         .AWLOCK_M(AWLOCK_M3),
                         .AWCACHE_M(AWCACHE_M3),
                         .AWPROT_M(AWPROT_M3),
                         .AWVALID_M(AWVALID_M3),
                         .AWREADY_M(AWREADY_M3),
                         // AXI MASTER 3 write data channel signals
                         .WID_M(WID_M3),
                         .WDATA_M(WDATA_M3),
                         .WSTRB_M(WSTRB_M3),
                         .WLAST_M(WLAST_M3),
                         .WVALID_M(WVALID_M3),
                         .WREADY_M(WREADY_M3),
                         // AXI MASTER 3 write response channel signals
                         .BID_M(BID_M3),
                         .BRESP_M(BRESP_M3),
                         .BVALID_M(BVALID_M3),
                         .BREADY_M(BREADY_M3),
                         // AXI MASTER 3 read address channel signals
                         .ARID_M(ARID_M3),
                         .ARADDR_M(ARADDR_M3),
                         .ARLEN_M(ARLEN_M3),
                         .ARSIZE_M(ARSIZE_M3),
                         .ARBURST_M(ARBURST_M3),
                         .ARLOCK_M(ARLOCK_M3),
                         .ARCACHE_M(ARCACHE_M3),
                         .ARPROT_M(ARPROT_M3),
                         .ARVALID_M(ARVALID_M3),
                         .ARREADY_M(ARREADY_M3),
                         // AXI MASTER 3 read response channel signals
                         .RID_M(RID_M3),
                         .RDATA_M(RDATA_M3),
                         .RRESP_M(RRESP_M3),
                         .RLAST_M(RLAST_M3),
                         .RVALID_M(RVALID_M3),
                         .RREADY_M(RREADY_M3),
                                    
                         // SLAVE 0
                         // AXI SLAVE 0 write address channel signals
                         .AWID_MI(AWID_MI3),
                         .AWADDR_MI(AWADDR_MI3),
                         .AWLEN_MI(AWLEN_MI3),
                         .AWSIZE_MI(AWSIZE_MI3),
                         .AWBURST_MI(AWBURST_MI3),
                         .AWLOCK_MI(AWLOCK_MI3),
                         .AWCACHE_MI(AWCACHE_MI3),
                         .AWPROT_MI(AWPROT_MI3),
                         .AWVALID_MI(AWVALID_MI3),
                         .AWREADY_IM(AWREADY_IM3),
                         // AXI SLAVE 0 write data channel signals
                         .WID_MI(WID_MI3),
                         .WDATA_MI(WDATA_MI3),
                         .WSTRB_MI(WSTRB_MI3),
                         .WLAST_MI(WLAST_MI3),
                         .WVALID_MI(WVALID_MI3),
                         .WREADY_IM(WREADY_IM3),
                         // AXI SLAVE 0 write response channel signals
                         .BID_IM(BID_IM3),
                         .BRESP_IM(BRESP_IM3),
                         .BVALID_IM(BVALID_IM3),
                         .BREADY_MI(BREADY_MI3),
                         // AXI SLAVE 0 read address channel signals
                         .ARID_MI(ARID_MI3),
                         .ARADDR_MI(ARADDR_MI3),
                         .ARLEN_MI(ARLEN_MI3),
                         .ARSIZE_MI(ARSIZE_MI3),
                         .ARBURST_MI(ARBURST_MI3),
                         .ARLOCK_MI(ARLOCK_MI3),
                         .ARCACHE_MI(ARCACHE_MI3),
                         .ARPROT_MI(ARPROT_MI3),
                         .ARVALID_MI(ARVALID_MI3),
                         .ARREADY_IM(ARREADY_IM3),
                         // AXI SLAVE 0 read response channel signals
                         .RID_IM(RID_IM3),
                         .RDATA_IM(RDATA_IM3),
                         .RRESP_IM(RRESP_IM3),
                         .RLAST_IM(RLAST_IM3),
                         .RVALID_IM(RVALID_IM3),
                         .RREADY_MI(RREADY_MI3),
                        
		                 .master_rd_end(m3_rd_end),
                         .master_wr_end(m3_wr_end)
                         ,.mst_rd_inprog(mst_rd_inprog3) 
                         ,.mst_wr_inprog(mst_wr_inprog3)                               

                         );    //master_stage3
         
      end // if (NUM_MASTER_SLOT > 3)      
   endgenerate


   generate
      if((((M0_SLAVE0ENABLE == 1 || M1_SLAVE0ENABLE == 1  || M2_SLAVE0ENABLE == 1 || M3_SLAVE0ENABLE == 1) && (MEMSPACE > 0)) ||
          ((M0_SLAVE0ENABLE == 1 || M1_SLAVE0ENABLE == 1  || M2_SLAVE0ENABLE == 1 || M3_SLAVE0ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 1))) && FEED_THROUGH != 1) begin
         axi_slave_stage #(
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
           slave_stage0(
                                  // Global signals
                                  .ACLK(ACLK),
                                  .ARESETN(ARESETN),
                            
                                  // Interconnect
                                  // Write address channel signals
                                  .AWID_IS(AWID_IS0),
                                  .AWADDR_IS(AWADDR_IS0),
                                  .AWLEN_IS(AWLEN_IS0),
                                  .AWSIZE_IS(AWSIZE_IS0),
                                  .AWBURST_IS(AWBURST_IS0),
                                  .AWLOCK_IS(AWLOCK_IS0),
                                  .AWCACHE_IS(AWCACHE_IS0),
                                  .AWPROT_IS(AWPROT_IS0),
                                  .AWVALID_IS(AWVALID_IS0),
                                  .AWREADY_SI(AWREADY_SI0),
                                  // Write data channel signals
                                  .WID_IS(WID_IS0),
                                  .WDATA_IS(WDATA_IS0),
                                  .WSTRB_IS(WSTRB_IS0),
                                  .WLAST_IS(WLAST_IS0),
                                  .WVALID_IS(WVALID_IS0),
                                  .WREADY_SI(WREADY_SI0),
                                  // Write response channel signals
                                  .BID_SI(BID_SI0),
                                  .BRESP_SI(BRESP_SI0),
                                  .BVALID_SI(BVALID_SI0),
                                  .BREADY_IS(BREADY_IS0),
                                  // Read address channel signals
                                  .ARID_IS(ARID_IS0),
                                  .ARADDR_IS(ARADDR_IS0),
                                  .ARLEN_IS(ARLEN_IS0),
                                  .ARSIZE_IS(ARSIZE_IS0),
                                  .ARBURST_IS(ARBURST_IS0),
                                  .ARLOCK_IS(ARLOCK_IS0),
                                  .ARCACHE_IS(ARCACHE_IS0),
                                  .ARPROT_IS(ARPROT_IS0),
                                  .ARVALID_IS(ARVALID_IS0),
                                  .ARREADY_SI(ARREADY_SI0),
                                  // Read response channel signals
                                  .RID_SI(RID_SI0),
                                  .RDATA_SI(RDATA_SI0),
                                  .RRESP_SI(RRESP_SI0),
                                  .RLAST_SI(RLAST_SI0),
                                  .RVALID_SI(RVALID_SI0),
                                  .RREADY_IS(RREADY_IS0),
                                  
                                  // SLAVE Side
                                  // AXI SLAVE write address channel signals
                                  .AWID_S(AWID_S0),
                                  .AWADDR_S(AWADDR_S0),
                                  .AWLEN_S(AWLEN_S0),
                                  .AWSIZE_S(AWSIZE_S0),
                                  .AWBURST_S(AWBURST_S0),
                                  .AWLOCK_S(AWLOCK_S0),
                                  .AWCACHE_S(AWCACHE_S0),
                                  .AWPROT_S(AWPROT_S0),
                                  .AWVALID_S(AWVALID_S0),
                                  .AWREADY_S(AWREADY_S0),
                                  // AXI SLAVE write data channel signals
                                  .WID_S(WID_S0),
                                  .WDATA_S(WDATA_S0),
                                  .WSTRB_S(WSTRB_S0),
                                  .WLAST_S(WLAST_S0),
                                  .WVALID_S(WVALID_S0),
                                  .WREADY_S(WREADY_S0),
                                  // AXI SLAVE write response channel signals
                                  .BID_S(BID_S0),
                                  .BRESP_S(BRESP_S0),
                                  .BVALID_S(BVALID_S0),
                                  .BREADY_S(BREADY_S0),
                                  // AXI SLAVE read address channel signals
                                  .ARID_S(ARID_S0),
                                  .ARADDR_S(ARADDR_S0),
                                  .ARLEN_S(ARLEN_S0),
                                  .ARSIZE_S(ARSIZE_S0),
                                  .ARBURST_S(ARBURST_S0),
                                  .ARLOCK_S(ARLOCK_S0),
                                  .ARCACHE_S(ARCACHE_S0),
                                  .ARPROT_S(ARPROT_S0),
                                  .ARVALID_S(ARVALID_S0),
                                  .ARREADY_S(ARREADY_S0),
                                  // AXI SLAVE read response channel signals
                                  .RID_S(RID_S0),
                                  .RDATA_S(RDATA_S0),
                                  .RRESP_S(RRESP_S0),
                                  .RLAST_S(RLAST_S0),
                                  .RVALID_S(RVALID_S0),
                                  .RREADY_S(RREADY_S0)                                  
                            );
      end
   endgenerate
   

   generate
      if((((M0_SLAVE1ENABLE == 1 || M1_SLAVE1ENABLE == 1  || M2_SLAVE1ENABLE == 1 || M3_SLAVE1ENABLE == 1) && (MEMSPACE > 0)) ||
          ((M0_SLAVE1ENABLE == 1 || M1_SLAVE1ENABLE == 1  || M2_SLAVE1ENABLE == 1 || M3_SLAVE1ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 1))) && FEED_THROUGH != 1) begin
         axi_slave_stage #(
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
           slave_stage1(
                                  // Global signals
                                  .ACLK(ACLK),
                                  .ARESETN(ARESETN),
                            
                                  // Interconnect
                                  // Write address channel signals
                                  .AWID_IS(AWID_IS1),
                                  .AWADDR_IS(AWADDR_IS1),
                                  .AWLEN_IS(AWLEN_IS1),
                                  .AWSIZE_IS(AWSIZE_IS1),
                                  .AWBURST_IS(AWBURST_IS1),
                                  .AWLOCK_IS(AWLOCK_IS1),
                                  .AWCACHE_IS(AWCACHE_IS1),
                                  .AWPROT_IS(AWPROT_IS1),
                                  .AWVALID_IS(AWVALID_IS1),
                                  .AWREADY_SI(AWREADY_SI1),
                                  // Write data channel signals
                                  .WID_IS(WID_IS1),
                                  .WDATA_IS(WDATA_IS1),
                                  .WSTRB_IS(WSTRB_IS1),
                                  .WLAST_IS(WLAST_IS1),
                                  .WVALID_IS(WVALID_IS1),
                                  .WREADY_SI(WREADY_SI1),
                                  // Write response channel signals
                                  .BID_SI(BID_SI1),
                                  .BRESP_SI(BRESP_SI1),
                                  .BVALID_SI(BVALID_SI1),
                                  .BREADY_IS(BREADY_IS1),
                                  // Read address channel signals
                                  .ARID_IS(ARID_IS1),
                                  .ARADDR_IS(ARADDR_IS1),
                                  .ARLEN_IS(ARLEN_IS1),
                                  .ARSIZE_IS(ARSIZE_IS1),
                                  .ARBURST_IS(ARBURST_IS1),
                                  .ARLOCK_IS(ARLOCK_IS1),
                                  .ARCACHE_IS(ARCACHE_IS1),
                                  .ARPROT_IS(ARPROT_IS1),
                                  .ARVALID_IS(ARVALID_IS1),
                                  .ARREADY_SI(ARREADY_SI1),
                                  // Read response channel signals
                                  .RID_SI(RID_SI1),
                                  .RDATA_SI(RDATA_SI1),
                                  .RRESP_SI(RRESP_SI1),
                                  .RLAST_SI(RLAST_SI1),
                                  .RVALID_SI(RVALID_SI1),
                                  .RREADY_IS(RREADY_IS1),
                                  
                                  // SLAVE Side
                                  // AXI SLAVE write address channel signals
                                  .AWID_S(AWID_S1),
                                  .AWADDR_S(AWADDR_S1),
                                  .AWLEN_S(AWLEN_S1),
                                  .AWSIZE_S(AWSIZE_S1),
                                  .AWBURST_S(AWBURST_S1),
                                  .AWLOCK_S(AWLOCK_S1),
                                  .AWCACHE_S(AWCACHE_S1),
                                  .AWPROT_S(AWPROT_S1),
                                  .AWVALID_S(AWVALID_S1),
                                  .AWREADY_S(AWREADY_S1),
                                  // AXI SLAVE write data channel signals
                                  .WID_S(WID_S1),
                                  .WDATA_S(WDATA_S1),
                                  .WSTRB_S(WSTRB_S1),
                                  .WLAST_S(WLAST_S1),
                                  .WVALID_S(WVALID_S1),
                                  .WREADY_S(WREADY_S1),
                                  // AXI SLAVE write response channel signals
                                  .BID_S(BID_S1),
                                  .BRESP_S(BRESP_S1),
                                  .BVALID_S(BVALID_S1),
                                  .BREADY_S(BREADY_S1),
                                  // AXI SLAVE read address channel signals
                                  .ARID_S(ARID_S1),
                                  .ARADDR_S(ARADDR_S1),
                                  .ARLEN_S(ARLEN_S1),
                                  .ARSIZE_S(ARSIZE_S1),
                                  .ARBURST_S(ARBURST_S1),
                                  .ARLOCK_S(ARLOCK_S1),
                                  .ARCACHE_S(ARCACHE_S1),
                                  .ARPROT_S(ARPROT_S1),
                                  .ARVALID_S(ARVALID_S1),
                                  .ARREADY_S(ARREADY_S1),
                                  // AXI SLAVE read response channel signals
                                  .RID_S(RID_S1),
                                  .RDATA_S(RDATA_S1),
                                  .RRESP_S(RRESP_S1),
                                  .RLAST_S(RLAST_S1),
                                  .RVALID_S(RVALID_S1),
                                  .RREADY_S(RREADY_S1)                                  
                            );
      end
   endgenerate

   generate
      if((((M0_SLAVE2ENABLE == 1 || M1_SLAVE2ENABLE == 1  || M2_SLAVE2ENABLE == 1 || M3_SLAVE2ENABLE == 1) && (MEMSPACE > 0)) ||
          ((M0_SLAVE2ENABLE == 1 || M1_SLAVE2ENABLE == 1  || M2_SLAVE2ENABLE == 1 || M3_SLAVE2ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 1))) && FEED_THROUGH != 1) begin
         axi_slave_stage #(
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
           slave_stage2(
                                  // Global signals
                                  .ACLK(ACLK),
                                  .ARESETN(ARESETN),
                            
                                  // Interconnect
                                  // Write address channel signals
                                  .AWID_IS(AWID_IS2),
                                  .AWADDR_IS(AWADDR_IS2),
                                  .AWLEN_IS(AWLEN_IS2),
                                  .AWSIZE_IS(AWSIZE_IS2),
                                  .AWBURST_IS(AWBURST_IS2),
                                  .AWLOCK_IS(AWLOCK_IS2),
                                  .AWCACHE_IS(AWCACHE_IS2),
                                  .AWPROT_IS(AWPROT_IS2),
                                  .AWVALID_IS(AWVALID_IS2),
                                  .AWREADY_SI(AWREADY_SI2),
                                  // Write data channel signals
                                  .WID_IS(WID_IS2),
                                  .WDATA_IS(WDATA_IS2),
                                  .WSTRB_IS(WSTRB_IS2),
                                  .WLAST_IS(WLAST_IS2),
                                  .WVALID_IS(WVALID_IS2),
                                  .WREADY_SI(WREADY_SI2),
                                  // Write response channel signals
                                  .BID_SI(BID_SI2),
                                  .BRESP_SI(BRESP_SI2),
                                  .BVALID_SI(BVALID_SI2),
                                  .BREADY_IS(BREADY_IS2),
                                  // Read address channel signals
                                  .ARID_IS(ARID_IS2),
                                  .ARADDR_IS(ARADDR_IS2),
                                  .ARLEN_IS(ARLEN_IS2),
                                  .ARSIZE_IS(ARSIZE_IS2),
                                  .ARBURST_IS(ARBURST_IS2),
                                  .ARLOCK_IS(ARLOCK_IS2),
                                  .ARCACHE_IS(ARCACHE_IS2),
                                  .ARPROT_IS(ARPROT_IS2),
                                  .ARVALID_IS(ARVALID_IS2),
                                  .ARREADY_SI(ARREADY_SI2),
                                  // Read response channel signals
                                  .RID_SI(RID_SI2),
                                  .RDATA_SI(RDATA_SI2),
                                  .RRESP_SI(RRESP_SI2),
                                  .RLAST_SI(RLAST_SI2),
                                  .RVALID_SI(RVALID_SI2),
                                  .RREADY_IS(RREADY_IS2),
                                  
                                  // SLAVE Side
                                  // AXI SLAVE write address channel signals
                                  .AWID_S(AWID_S2),
                                  .AWADDR_S(AWADDR_S2),
                                  .AWLEN_S(AWLEN_S2),
                                  .AWSIZE_S(AWSIZE_S2),
                                  .AWBURST_S(AWBURST_S2),
                                  .AWLOCK_S(AWLOCK_S2),
                                  .AWCACHE_S(AWCACHE_S2),
                                  .AWPROT_S(AWPROT_S2),
                                  .AWVALID_S(AWVALID_S2),
                                  .AWREADY_S(AWREADY_S2),
                                  // AXI SLAVE write data channel signals
                                  .WID_S(WID_S2),
                                  .WDATA_S(WDATA_S2),
                                  .WSTRB_S(WSTRB_S2),
                                  .WLAST_S(WLAST_S2),
                                  .WVALID_S(WVALID_S2),
                                  .WREADY_S(WREADY_S2),
                                  // AXI SLAVE write response channel signals
                                  .BID_S(BID_S2),
                                  .BRESP_S(BRESP_S2),
                                  .BVALID_S(BVALID_S2),
                                  .BREADY_S(BREADY_S2),
                                  // AXI SLAVE read address channel signals
                                  .ARID_S(ARID_S2),
                                  .ARADDR_S(ARADDR_S2),
                                  .ARLEN_S(ARLEN_S2),
                                  .ARSIZE_S(ARSIZE_S2),
                                  .ARBURST_S(ARBURST_S2),
                                  .ARLOCK_S(ARLOCK_S2),
                                  .ARCACHE_S(ARCACHE_S2),
                                  .ARPROT_S(ARPROT_S2),
                                  .ARVALID_S(ARVALID_S2),
                                  .ARREADY_S(ARREADY_S2),
                                  // AXI SLAVE read response channel signals
                                  .RID_S(RID_S2),
                                  .RDATA_S(RDATA_S2),
                                  .RRESP_S(RRESP_S2),
                                  .RLAST_S(RLAST_S2),
                                  .RVALID_S(RVALID_S2),
                                  .RREADY_S(RREADY_S2)                                  
                            );
      end
   endgenerate

   generate
      if((((M0_SLAVE3ENABLE == 1 || M1_SLAVE3ENABLE == 1  || M2_SLAVE3ENABLE == 1 || M3_SLAVE3ENABLE == 1) && (MEMSPACE > 0)) ||
          ((M0_SLAVE3ENABLE == 1 || M1_SLAVE3ENABLE == 1  || M2_SLAVE3ENABLE == 1 || M3_SLAVE3ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 1))) && FEED_THROUGH != 1) begin
         axi_slave_stage #(
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
           slave_stage3(
                                  // Global signals
                                  .ACLK(ACLK),
                                  .ARESETN(ARESETN),
                            
                                  // Interconnect
                                  // Write address channel signals
                                  .AWID_IS(AWID_IS3),
                                  .AWADDR_IS(AWADDR_IS3),
                                  .AWLEN_IS(AWLEN_IS3),
                                  .AWSIZE_IS(AWSIZE_IS3),
                                  .AWBURST_IS(AWBURST_IS3),
                                  .AWLOCK_IS(AWLOCK_IS3),
                                  .AWCACHE_IS(AWCACHE_IS3),
                                  .AWPROT_IS(AWPROT_IS3),
                                  .AWVALID_IS(AWVALID_IS3),
                                  .AWREADY_SI(AWREADY_SI3),
                                  // Write data channel signals
                                  .WID_IS(WID_IS3),
                                  .WDATA_IS(WDATA_IS3),
                                  .WSTRB_IS(WSTRB_IS3),
                                  .WLAST_IS(WLAST_IS3),
                                  .WVALID_IS(WVALID_IS3),
                                  .WREADY_SI(WREADY_SI3),
                                  // Write response channel signals
                                  .BID_SI(BID_SI3),
                                  .BRESP_SI(BRESP_SI3),
                                  .BVALID_SI(BVALID_SI3),
                                  .BREADY_IS(BREADY_IS3),
                                  // Read address channel signals
                                  .ARID_IS(ARID_IS3),
                                  .ARADDR_IS(ARADDR_IS3),
                                  .ARLEN_IS(ARLEN_IS3),
                                  .ARSIZE_IS(ARSIZE_IS3),
                                  .ARBURST_IS(ARBURST_IS3),
                                  .ARLOCK_IS(ARLOCK_IS3),
                                  .ARCACHE_IS(ARCACHE_IS3),
                                  .ARPROT_IS(ARPROT_IS3),
                                  .ARVALID_IS(ARVALID_IS3),
                                  .ARREADY_SI(ARREADY_SI3),
                                  // Read response channel signals
                                  .RID_SI(RID_SI3),
                                  .RDATA_SI(RDATA_SI3),
                                  .RRESP_SI(RRESP_SI3),
                                  .RLAST_SI(RLAST_SI3),
                                  .RVALID_SI(RVALID_SI3),
                                  .RREADY_IS(RREADY_IS3),
                                  
                                  // SLAVE Side
                                  // AXI SLAVE write address channel signals
                                  .AWID_S(AWID_S3),
                                  .AWADDR_S(AWADDR_S3),
                                  .AWLEN_S(AWLEN_S3),
                                  .AWSIZE_S(AWSIZE_S3),
                                  .AWBURST_S(AWBURST_S3),
                                  .AWLOCK_S(AWLOCK_S3),
                                  .AWCACHE_S(AWCACHE_S3),
                                  .AWPROT_S(AWPROT_S3),
                                  .AWVALID_S(AWVALID_S3),
                                  .AWREADY_S(AWREADY_S3),
                                  // AXI SLAVE write data channel signals
                                  .WID_S(WID_S3),
                                  .WDATA_S(WDATA_S3),
                                  .WSTRB_S(WSTRB_S3),
                                  .WLAST_S(WLAST_S3),
                                  .WVALID_S(WVALID_S3),
                                  .WREADY_S(WREADY_S3),
                                  // AXI SLAVE write response channel signals
                                  .BID_S(BID_S3),
                                  .BRESP_S(BRESP_S3),
                                  .BVALID_S(BVALID_S3),
                                  .BREADY_S(BREADY_S3),
                                  // AXI SLAVE read address channel signals
                                  .ARID_S(ARID_S3),
                                  .ARADDR_S(ARADDR_S3),
                                  .ARLEN_S(ARLEN_S3),
                                  .ARSIZE_S(ARSIZE_S3),
                                  .ARBURST_S(ARBURST_S3),
                                  .ARLOCK_S(ARLOCK_S3),
                                  .ARCACHE_S(ARCACHE_S3),
                                  .ARPROT_S(ARPROT_S3),
                                  .ARVALID_S(ARVALID_S3),
                                  .ARREADY_S(ARREADY_S3),
                                  // AXI SLAVE read response channel signals
                                  .RID_S(RID_S3),
                                  .RDATA_S(RDATA_S3),
                                  .RRESP_S(RRESP_S3),
                                  .RLAST_S(RLAST_S3),
                                  .RVALID_S(RVALID_S3),
                                  .RREADY_S(RREADY_S3)                                  
                            );
      end // if (M0_SLAVE3ENABLE == 1)   
   endgenerate

   generate
      if((((M0_SLAVE4ENABLE == 1 || M1_SLAVE4ENABLE == 1  || M2_SLAVE4ENABLE == 1 || M3_SLAVE4ENABLE == 1) && (MEMSPACE > 0)) ||
          ((M0_SLAVE4ENABLE == 1 || M1_SLAVE4ENABLE == 1  || M2_SLAVE4ENABLE == 1 || M3_SLAVE4ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 1))) && FEED_THROUGH != 1) begin
         axi_slave_stage #(
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
           slave_stage4(
                                  // Global signals
                                  .ACLK(ACLK),
                                  .ARESETN(ARESETN),
                            
                                  // Interconnect
                                  // Write address channel signals
                                  .AWID_IS(AWID_IS4),
                                  .AWADDR_IS(AWADDR_IS4),
                                  .AWLEN_IS(AWLEN_IS4),
                                  .AWSIZE_IS(AWSIZE_IS4),
                                  .AWBURST_IS(AWBURST_IS4),
                                  .AWLOCK_IS(AWLOCK_IS4),
                                  .AWCACHE_IS(AWCACHE_IS4),
                                  .AWPROT_IS(AWPROT_IS4),
                                  .AWVALID_IS(AWVALID_IS4),
                                  .AWREADY_SI(AWREADY_SI4),
                                  // Write data channel signals
                                  .WID_IS(WID_IS4),
                                  .WDATA_IS(WDATA_IS4),
                                  .WSTRB_IS(WSTRB_IS4),
                                  .WLAST_IS(WLAST_IS4),
                                  .WVALID_IS(WVALID_IS4),
                                  .WREADY_SI(WREADY_SI4),
                                  // Write response channel signals
                                  .BID_SI(BID_SI4),
                                  .BRESP_SI(BRESP_SI4),
                                  .BVALID_SI(BVALID_SI4),
                                  .BREADY_IS(BREADY_IS4),
                                  // Read address channel signals
                                  .ARID_IS(ARID_IS4),
                                  .ARADDR_IS(ARADDR_IS4),
                                  .ARLEN_IS(ARLEN_IS4),
                                  .ARSIZE_IS(ARSIZE_IS4),
                                  .ARBURST_IS(ARBURST_IS4),
                                  .ARLOCK_IS(ARLOCK_IS4),
                                  .ARCACHE_IS(ARCACHE_IS4),
                                  .ARPROT_IS(ARPROT_IS4),
                                  .ARVALID_IS(ARVALID_IS4),
                                  .ARREADY_SI(ARREADY_SI4),
                                  // Read response channel signals
                                  .RID_SI(RID_SI4),
                                  .RDATA_SI(RDATA_SI4),
                                  .RRESP_SI(RRESP_SI4),
                                  .RLAST_SI(RLAST_SI4),
                                  .RVALID_SI(RVALID_SI4),
                                  .RREADY_IS(RREADY_IS4),
                                  
                                  // SLAVE Side
                                  // AXI SLAVE write address channel signals
                                  .AWID_S(AWID_S4),
                                  .AWADDR_S(AWADDR_S4),
                                  .AWLEN_S(AWLEN_S4),
                                  .AWSIZE_S(AWSIZE_S4),
                                  .AWBURST_S(AWBURST_S4),
                                  .AWLOCK_S(AWLOCK_S4),
                                  .AWCACHE_S(AWCACHE_S4),
                                  .AWPROT_S(AWPROT_S4),
                                  .AWVALID_S(AWVALID_S4),
                                  .AWREADY_S(AWREADY_S4),
                                  // AXI SLAVE write data channel signals
                                  .WID_S(WID_S4),
                                  .WDATA_S(WDATA_S4),
                                  .WSTRB_S(WSTRB_S4),
                                  .WLAST_S(WLAST_S4),
                                  .WVALID_S(WVALID_S4),
                                  .WREADY_S(WREADY_S4),
                                  // AXI SLAVE write response channel signals
                                  .BID_S(BID_S4),
                                  .BRESP_S(BRESP_S4),
                                  .BVALID_S(BVALID_S4),
                                  .BREADY_S(BREADY_S4),
                                  // AXI SLAVE read address channel signals
                                  .ARID_S(ARID_S4),
                                  .ARADDR_S(ARADDR_S4),
                                  .ARLEN_S(ARLEN_S4),
                                  .ARSIZE_S(ARSIZE_S4),
                                  .ARBURST_S(ARBURST_S4),
                                  .ARLOCK_S(ARLOCK_S4),
                                  .ARCACHE_S(ARCACHE_S4),
                                  .ARPROT_S(ARPROT_S4),
                                  .ARVALID_S(ARVALID_S4),
                                  .ARREADY_S(ARREADY_S4),
                                  // AXI SLAVE read response channel signals
                                  .RID_S(RID_S4),
                                  .RDATA_S(RDATA_S4),
                                  .RRESP_S(RRESP_S4),
                                  .RLAST_S(RLAST_S4),
                                  .RVALID_S(RVALID_S4),
                                  .RREADY_S(RREADY_S4)                                  
                            );
      end
   endgenerate

   generate
      if((((M0_SLAVE5ENABLE == 1 || M1_SLAVE5ENABLE == 1  || M2_SLAVE5ENABLE == 1 || M3_SLAVE5ENABLE == 1) && (MEMSPACE > 0)) ||
          ((M0_SLAVE5ENABLE == 1 || M1_SLAVE5ENABLE == 1  || M2_SLAVE5ENABLE == 1 || M3_SLAVE5ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 1))) && FEED_THROUGH != 1) begin
         axi_slave_stage #(
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
           slave_stage5(
                                  // Global signals
                                  .ACLK(ACLK),
                                  .ARESETN(ARESETN),
                            
                                  // Interconnect
                                  // Write address channel signals
                                  .AWID_IS(AWID_IS5),
                                  .AWADDR_IS(AWADDR_IS5),
                                  .AWLEN_IS(AWLEN_IS5),
                                  .AWSIZE_IS(AWSIZE_IS5),
                                  .AWBURST_IS(AWBURST_IS5),
                                  .AWLOCK_IS(AWLOCK_IS5),
                                  .AWCACHE_IS(AWCACHE_IS5),
                                  .AWPROT_IS(AWPROT_IS5),
                                  .AWVALID_IS(AWVALID_IS5),
                                  .AWREADY_SI(AWREADY_SI5),
                                  // Write data channel signals
                                  .WID_IS(WID_IS5),
                                  .WDATA_IS(WDATA_IS5),
                                  .WSTRB_IS(WSTRB_IS5),
                                  .WLAST_IS(WLAST_IS5),
                                  .WVALID_IS(WVALID_IS5),
                                  .WREADY_SI(WREADY_SI5),
                                  // Write response channel signals
                                  .BID_SI(BID_SI5),
                                  .BRESP_SI(BRESP_SI5),
                                  .BVALID_SI(BVALID_SI5),
                                  .BREADY_IS(BREADY_IS5),
                                  // Read address channel signals
                                  .ARID_IS(ARID_IS5),
                                  .ARADDR_IS(ARADDR_IS5),
                                  .ARLEN_IS(ARLEN_IS5),
                                  .ARSIZE_IS(ARSIZE_IS5),
                                  .ARBURST_IS(ARBURST_IS5),
                                  .ARLOCK_IS(ARLOCK_IS5),
                                  .ARCACHE_IS(ARCACHE_IS5),
                                  .ARPROT_IS(ARPROT_IS5),
                                  .ARVALID_IS(ARVALID_IS5),
                                  .ARREADY_SI(ARREADY_SI5),
                                  // Read response channel signals
                                  .RID_SI(RID_SI5),
                                  .RDATA_SI(RDATA_SI5),
                                  .RRESP_SI(RRESP_SI5),
                                  .RLAST_SI(RLAST_SI5),
                                  .RVALID_SI(RVALID_SI5),
                                  .RREADY_IS(RREADY_IS5),
                                  
                                  // SLAVE Side
                                  // AXI SLAVE write address channel signals
                                  .AWID_S(AWID_S5),
                                  .AWADDR_S(AWADDR_S5),
                                  .AWLEN_S(AWLEN_S5),
                                  .AWSIZE_S(AWSIZE_S5),
                                  .AWBURST_S(AWBURST_S5),
                                  .AWLOCK_S(AWLOCK_S5),
                                  .AWCACHE_S(AWCACHE_S5),
                                  .AWPROT_S(AWPROT_S5),
                                  .AWVALID_S(AWVALID_S5),
                                  .AWREADY_S(AWREADY_S5),
                                  // AXI SLAVE write data channel signals
                                  .WID_S(WID_S5),
                                  .WDATA_S(WDATA_S5),
                                  .WSTRB_S(WSTRB_S5),
                                  .WLAST_S(WLAST_S5),
                                  .WVALID_S(WVALID_S5),
                                  .WREADY_S(WREADY_S5),
                                  // AXI SLAVE write response channel signals
                                  .BID_S(BID_S5),
                                  .BRESP_S(BRESP_S5),
                                  .BVALID_S(BVALID_S5),
                                  .BREADY_S(BREADY_S5),
                                  // AXI SLAVE read address channel signals
                                  .ARID_S(ARID_S5),
                                  .ARADDR_S(ARADDR_S5),
                                  .ARLEN_S(ARLEN_S5),
                                  .ARSIZE_S(ARSIZE_S5),
                                  .ARBURST_S(ARBURST_S5),
                                  .ARLOCK_S(ARLOCK_S5),
                                  .ARCACHE_S(ARCACHE_S5),
                                  .ARPROT_S(ARPROT_S5),
                                  .ARVALID_S(ARVALID_S5),
                                  .ARREADY_S(ARREADY_S5),
                                  // AXI SLAVE read response channel signals
                                  .RID_S(RID_S5),
                                  .RDATA_S(RDATA_S5),
                                  .RRESP_S(RRESP_S5),
                                  .RLAST_S(RLAST_S5),
                                  .RVALID_S(RVALID_S5),
                                  .RREADY_S(RREADY_S5)                                  
                            );
      end
   endgenerate
   
   generate
      if((((M0_SLAVE6ENABLE == 1 || M1_SLAVE6ENABLE == 1  || M2_SLAVE6ENABLE == 1 || M3_SLAVE6ENABLE == 1) && (MEMSPACE > 0)) ||
          ((M0_SLAVE6ENABLE == 1 || M1_SLAVE6ENABLE == 1  || M2_SLAVE6ENABLE == 1 || M3_SLAVE6ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 1))) && FEED_THROUGH != 1) begin
         axi_slave_stage #(
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
           slave_stage6(
                                  // Global signals
                                  .ACLK(ACLK),
                                  .ARESETN(ARESETN),
                            
                                  // Interconnect
                                  // Write address channel signals
                                  .AWID_IS(AWID_IS6),
                                  .AWADDR_IS(AWADDR_IS6),
                                  .AWLEN_IS(AWLEN_IS6),
                                  .AWSIZE_IS(AWSIZE_IS6),
                                  .AWBURST_IS(AWBURST_IS6),
                                  .AWLOCK_IS(AWLOCK_IS6),
                                  .AWCACHE_IS(AWCACHE_IS6),
                                  .AWPROT_IS(AWPROT_IS6),
                                  .AWVALID_IS(AWVALID_IS6),
                                  .AWREADY_SI(AWREADY_SI6),
                                  // Write data channel signals
                                  .WID_IS(WID_IS6),
                                  .WDATA_IS(WDATA_IS6),
                                  .WSTRB_IS(WSTRB_IS6),
                                  .WLAST_IS(WLAST_IS6),
                                  .WVALID_IS(WVALID_IS6),
                                  .WREADY_SI(WREADY_SI6),
                                  // Write response channel signals
                                  .BID_SI(BID_SI6),
                                  .BRESP_SI(BRESP_SI6),
                                  .BVALID_SI(BVALID_SI6),
                                  .BREADY_IS(BREADY_IS6),
                                  // Read address channel signals
                                  .ARID_IS(ARID_IS6),
                                  .ARADDR_IS(ARADDR_IS6),
                                  .ARLEN_IS(ARLEN_IS6),
                                  .ARSIZE_IS(ARSIZE_IS6),
                                  .ARBURST_IS(ARBURST_IS6),
                                  .ARLOCK_IS(ARLOCK_IS6),
                                  .ARCACHE_IS(ARCACHE_IS6),
                                  .ARPROT_IS(ARPROT_IS6),
                                  .ARVALID_IS(ARVALID_IS6),
                                  .ARREADY_SI(ARREADY_SI6),
                                  // Read response channel signals
                                  .RID_SI(RID_SI6),
                                  .RDATA_SI(RDATA_SI6),
                                  .RRESP_SI(RRESP_SI6),
                                  .RLAST_SI(RLAST_SI6),
                                  .RVALID_SI(RVALID_SI6),
                                  .RREADY_IS(RREADY_IS6),
                                  
                                  // SLAVE Side
                                  // AXI SLAVE write address channel signals
                                  .AWID_S(AWID_S6),
                                  .AWADDR_S(AWADDR_S6),
                                  .AWLEN_S(AWLEN_S6),
                                  .AWSIZE_S(AWSIZE_S6),
                                  .AWBURST_S(AWBURST_S6),
                                  .AWLOCK_S(AWLOCK_S6),
                                  .AWCACHE_S(AWCACHE_S6),
                                  .AWPROT_S(AWPROT_S6),
                                  .AWVALID_S(AWVALID_S6),
                                  .AWREADY_S(AWREADY_S6),
                                  // AXI SLAVE write data channel signals
                                  .WID_S(WID_S6),
                                  .WDATA_S(WDATA_S6),
                                  .WSTRB_S(WSTRB_S6),
                                  .WLAST_S(WLAST_S6),
                                  .WVALID_S(WVALID_S6),
                                  .WREADY_S(WREADY_S6),
                                  // AXI SLAVE write response channel signals
                                  .BID_S(BID_S6),
                                  .BRESP_S(BRESP_S6),
                                  .BVALID_S(BVALID_S6),
                                  .BREADY_S(BREADY_S6),
                                  // AXI SLAVE read address channel signals
                                  .ARID_S(ARID_S6),
                                  .ARADDR_S(ARADDR_S6),
                                  .ARLEN_S(ARLEN_S6),
                                  .ARSIZE_S(ARSIZE_S6),
                                  .ARBURST_S(ARBURST_S6),
                                  .ARLOCK_S(ARLOCK_S6),
                                  .ARCACHE_S(ARCACHE_S6),
                                  .ARPROT_S(ARPROT_S6),
                                  .ARVALID_S(ARVALID_S6),
                                  .ARREADY_S(ARREADY_S6),
                                  // AXI SLAVE read response channel signals
                                  .RID_S(RID_S6),
                                  .RDATA_S(RDATA_S6),
                                  .RRESP_S(RRESP_S6),
                                  .RLAST_S(RLAST_S6),
                                  .RVALID_S(RVALID_S6),
                                  .RREADY_S(RREADY_S6)                                  
                            );
      end
   endgenerate

   generate
      if((((M0_SLAVE7ENABLE == 1 || M1_SLAVE7ENABLE == 1  || M2_SLAVE7ENABLE == 1 || M3_SLAVE7ENABLE == 1) && (MEMSPACE > 0)) ||
          ((M0_SLAVE7ENABLE == 1 || M1_SLAVE7ENABLE == 1  || M2_SLAVE7ENABLE == 1 || M3_SLAVE7ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 1))) && FEED_THROUGH != 1) begin
         axi_slave_stage #(
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
           slave_stage7(
                                  // Global signals
                                  .ACLK(ACLK),
                                  .ARESETN(ARESETN),
                            
                                  // Interconnect
                                  // Write address channel signals
                                  .AWID_IS(AWID_IS7),
                                  .AWADDR_IS(AWADDR_IS7),
                                  .AWLEN_IS(AWLEN_IS7),
                                  .AWSIZE_IS(AWSIZE_IS7),
                                  .AWBURST_IS(AWBURST_IS7),
                                  .AWLOCK_IS(AWLOCK_IS7),
                                  .AWCACHE_IS(AWCACHE_IS7),
                                  .AWPROT_IS(AWPROT_IS7),
                                  .AWVALID_IS(AWVALID_IS7),
                                  .AWREADY_SI(AWREADY_SI7),
                                  // Write data channel signals
                                  .WID_IS(WID_IS7),
                                  .WDATA_IS(WDATA_IS7),
                                  .WSTRB_IS(WSTRB_IS7),
                                  .WLAST_IS(WLAST_IS7),
                                  .WVALID_IS(WVALID_IS7),
                                  .WREADY_SI(WREADY_SI7),
                                  // Write response channel signals
                                  .BID_SI(BID_SI7),
                                  .BRESP_SI(BRESP_SI7),
                                  .BVALID_SI(BVALID_SI7),
                                  .BREADY_IS(BREADY_IS7),
                                  // Read address channel signals
                                  .ARID_IS(ARID_IS7),
                                  .ARADDR_IS(ARADDR_IS7),
                                  .ARLEN_IS(ARLEN_IS7),
                                  .ARSIZE_IS(ARSIZE_IS7),
                                  .ARBURST_IS(ARBURST_IS7),
                                  .ARLOCK_IS(ARLOCK_IS7),
                                  .ARCACHE_IS(ARCACHE_IS7),
                                  .ARPROT_IS(ARPROT_IS7),
                                  .ARVALID_IS(ARVALID_IS7),
                                  .ARREADY_SI(ARREADY_SI7),
                                  // Read response channel signals
                                  .RID_SI(RID_SI7),
                                  .RDATA_SI(RDATA_SI7),
                                  .RRESP_SI(RRESP_SI7),
                                  .RLAST_SI(RLAST_SI7),
                                  .RVALID_SI(RVALID_SI7),
                                  .RREADY_IS(RREADY_IS7),
                                  
                                  // SLAVE Side
                                  // AXI SLAVE write address channel signals
                                  .AWID_S(AWID_S7),
                                  .AWADDR_S(AWADDR_S7),
                                  .AWLEN_S(AWLEN_S7),
                                  .AWSIZE_S(AWSIZE_S7),
                                  .AWBURST_S(AWBURST_S7),
                                  .AWLOCK_S(AWLOCK_S7),
                                  .AWCACHE_S(AWCACHE_S7),
                                  .AWPROT_S(AWPROT_S7),
                                  .AWVALID_S(AWVALID_S7),
                                  .AWREADY_S(AWREADY_S7),
                                  // AXI SLAVE write data channel signals
                                  .WID_S(WID_S7),
                                  .WDATA_S(WDATA_S7),
                                  .WSTRB_S(WSTRB_S7),
                                  .WLAST_S(WLAST_S7),
                                  .WVALID_S(WVALID_S7),
                                  .WREADY_S(WREADY_S7),
                                  // AXI SLAVE write response channel signals
                                  .BID_S(BID_S7),
                                  .BRESP_S(BRESP_S7),
                                  .BVALID_S(BVALID_S7),
                                  .BREADY_S(BREADY_S7),
                                  // AXI SLAVE read address channel signals
                                  .ARID_S(ARID_S7),
                                  .ARADDR_S(ARADDR_S7),
                                  .ARLEN_S(ARLEN_S7),
                                  .ARSIZE_S(ARSIZE_S7),
                                  .ARBURST_S(ARBURST_S7),
                                  .ARLOCK_S(ARLOCK_S7),
                                  .ARCACHE_S(ARCACHE_S7),
                                  .ARPROT_S(ARPROT_S7),
                                  .ARVALID_S(ARVALID_S7),
                                  .ARREADY_S(ARREADY_S7),
                                  // AXI SLAVE read response channel signals
                                  .RID_S(RID_S7),
                                  .RDATA_S(RDATA_S7),
                                  .RRESP_S(RRESP_S7),
                                  .RLAST_S(RLAST_S7),
                                  .RVALID_S(RVALID_S7),
                                  .RREADY_S(RREADY_S7)                                  
                            );
      end
   endgenerate

   generate
      if((((M0_SLAVE8ENABLE == 1 || M1_SLAVE8ENABLE == 1  || M2_SLAVE8ENABLE == 1 || M3_SLAVE8ENABLE == 1) && (MEMSPACE > 0)) ||
          ((M0_SLAVE8ENABLE == 1 || M1_SLAVE8ENABLE == 1  || M2_SLAVE8ENABLE == 1 || M3_SLAVE8ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 0))) && FEED_THROUGH != 1) begin
         axi_slave_stage #(
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
           slave_stage8(
                                  // Global signals
                                  .ACLK(ACLK),
                                  .ARESETN(ARESETN),
                            
                                  // Interconnect
                                  // Write address channel signals
                                  .AWID_IS(AWID_IS8),
                                  .AWADDR_IS(AWADDR_IS8),
                                  .AWLEN_IS(AWLEN_IS8),
                                  .AWSIZE_IS(AWSIZE_IS8),
                                  .AWBURST_IS(AWBURST_IS8),
                                  .AWLOCK_IS(AWLOCK_IS8),
                                  .AWCACHE_IS(AWCACHE_IS8),
                                  .AWPROT_IS(AWPROT_IS8),
                                  .AWVALID_IS(AWVALID_IS8),
                                  .AWREADY_SI(AWREADY_SI8),
                                  // Write data channel signals
                                  .WID_IS(WID_IS8),
                                  .WDATA_IS(WDATA_IS8),
                                  .WSTRB_IS(WSTRB_IS8),
                                  .WLAST_IS(WLAST_IS8),
                                  .WVALID_IS(WVALID_IS8),
                                  .WREADY_SI(WREADY_SI8),
                                  // Write response channel signals
                                  .BID_SI(BID_SI8),
                                  .BRESP_SI(BRESP_SI8),
                                  .BVALID_SI(BVALID_SI8),
                                  .BREADY_IS(BREADY_IS8),
                                  // Read address channel signals
                                  .ARID_IS(ARID_IS8),
                                  .ARADDR_IS(ARADDR_IS8),
                                  .ARLEN_IS(ARLEN_IS8),
                                  .ARSIZE_IS(ARSIZE_IS8),
                                  .ARBURST_IS(ARBURST_IS8),
                                  .ARLOCK_IS(ARLOCK_IS8),
                                  .ARCACHE_IS(ARCACHE_IS8),
                                  .ARPROT_IS(ARPROT_IS8),
                                  .ARVALID_IS(ARVALID_IS8),
                                  .ARREADY_SI(ARREADY_SI8),
                                  // Read response channel signals
                                  .RID_SI(RID_SI8),
                                  .RDATA_SI(RDATA_SI8),
                                  .RRESP_SI(RRESP_SI8),
                                  .RLAST_SI(RLAST_SI8),
                                  .RVALID_SI(RVALID_SI8),
                                  .RREADY_IS(RREADY_IS8),
                                  
                                  // SLAVE Side
                                  // AXI SLAVE write address channel signals
                                  .AWID_S(AWID_S8),
                                  .AWADDR_S(AWADDR_S8),
                                  .AWLEN_S(AWLEN_S8),
                                  .AWSIZE_S(AWSIZE_S8),
                                  .AWBURST_S(AWBURST_S8),
                                  .AWLOCK_S(AWLOCK_S8),
                                  .AWCACHE_S(AWCACHE_S8),
                                  .AWPROT_S(AWPROT_S8),
                                  .AWVALID_S(AWVALID_S8),
                                  .AWREADY_S(AWREADY_S8),
                                  // AXI SLAVE write data channel signals
                                  .WID_S(WID_S8),
                                  .WDATA_S(WDATA_S8),
                                  .WSTRB_S(WSTRB_S8),
                                  .WLAST_S(WLAST_S8),
                                  .WVALID_S(WVALID_S8),
                                  .WREADY_S(WREADY_S8),
                                  // AXI SLAVE write response channel signals
                                  .BID_S(BID_S8),
                                  .BRESP_S(BRESP_S8),
                                  .BVALID_S(BVALID_S8),
                                  .BREADY_S(BREADY_S8),
                                  // AXI SLAVE read address channel signals
                                  .ARID_S(ARID_S8),
                                  .ARADDR_S(ARADDR_S8),
                                  .ARLEN_S(ARLEN_S8),
                                  .ARSIZE_S(ARSIZE_S8),
                                  .ARBURST_S(ARBURST_S8),
                                  .ARLOCK_S(ARLOCK_S8),
                                  .ARCACHE_S(ARCACHE_S8),
                                  .ARPROT_S(ARPROT_S8),
                                  .ARVALID_S(ARVALID_S8),
                                  .ARREADY_S(ARREADY_S8),
                                  // AXI SLAVE read response channel signals
                                  .RID_S(RID_S8),
                                  .RDATA_S(RDATA_S8),
                                  .RRESP_S(RRESP_S8),
                                  .RLAST_S(RLAST_S8),
                                  .RVALID_S(RVALID_S8),
                                  .RREADY_S(RREADY_S8)                                  
                            );
      end
   endgenerate

   generate
      if((((M0_SLAVE9ENABLE == 1 || M1_SLAVE9ENABLE == 1  || M2_SLAVE9ENABLE == 1 || M3_SLAVE9ENABLE == 1) && (MEMSPACE > 0)) ||
          ((M0_SLAVE9ENABLE == 1 || M1_SLAVE9ENABLE == 1  || M2_SLAVE9ENABLE == 1 || M3_SLAVE9ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 0))) && FEED_THROUGH != 1) begin
         axi_slave_stage #(
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
           slave_stage9(
                                  // Global signals
                                  .ACLK(ACLK),
                                  .ARESETN(ARESETN),
                            
                                  // Interconnect
                                  // Write address channel signals
                                  .AWID_IS(AWID_IS9),
                                  .AWADDR_IS(AWADDR_IS9),
                                  .AWLEN_IS(AWLEN_IS9),
                                  .AWSIZE_IS(AWSIZE_IS9),
                                  .AWBURST_IS(AWBURST_IS9),
                                  .AWLOCK_IS(AWLOCK_IS9),
                                  .AWCACHE_IS(AWCACHE_IS9),
                                  .AWPROT_IS(AWPROT_IS9),
                                  .AWVALID_IS(AWVALID_IS9),
                                  .AWREADY_SI(AWREADY_SI9),
                                  // Write data channel signals
                                  .WID_IS(WID_IS9),
                                  .WDATA_IS(WDATA_IS9),
                                  .WSTRB_IS(WSTRB_IS9),
                                  .WLAST_IS(WLAST_IS9),
                                  .WVALID_IS(WVALID_IS9),
                                  .WREADY_SI(WREADY_SI9),
                                  // Write response channel signals
                                  .BID_SI(BID_SI9),
                                  .BRESP_SI(BRESP_SI9),
                                  .BVALID_SI(BVALID_SI9),
                                  .BREADY_IS(BREADY_IS9),
                                  // Read address channel signals
                                  .ARID_IS(ARID_IS9),
                                  .ARADDR_IS(ARADDR_IS9),
                                  .ARLEN_IS(ARLEN_IS9),
                                  .ARSIZE_IS(ARSIZE_IS9),
                                  .ARBURST_IS(ARBURST_IS9),
                                  .ARLOCK_IS(ARLOCK_IS9),
                                  .ARCACHE_IS(ARCACHE_IS9),
                                  .ARPROT_IS(ARPROT_IS9),
                                  .ARVALID_IS(ARVALID_IS9),
                                  .ARREADY_SI(ARREADY_SI9),
                                  // Read response channel signals
                                  .RID_SI(RID_SI9),
                                  .RDATA_SI(RDATA_SI9),
                                  .RRESP_SI(RRESP_SI9),
                                  .RLAST_SI(RLAST_SI9),
                                  .RVALID_SI(RVALID_SI9),
                                  .RREADY_IS(RREADY_IS9),
                                  
                                  // SLAVE Side
                                  // AXI SLAVE write address channel signals
                                  .AWID_S(AWID_S9),
                                  .AWADDR_S(AWADDR_S9),
                                  .AWLEN_S(AWLEN_S9),
                                  .AWSIZE_S(AWSIZE_S9),
                                  .AWBURST_S(AWBURST_S9),
                                  .AWLOCK_S(AWLOCK_S9),
                                  .AWCACHE_S(AWCACHE_S9),
                                  .AWPROT_S(AWPROT_S9),
                                  .AWVALID_S(AWVALID_S9),
                                  .AWREADY_S(AWREADY_S9),
                                  // AXI SLAVE write data channel signals
                                  .WID_S(WID_S9),
                                  .WDATA_S(WDATA_S9),
                                  .WSTRB_S(WSTRB_S9),
                                  .WLAST_S(WLAST_S9),
                                  .WVALID_S(WVALID_S9),
                                  .WREADY_S(WREADY_S9),
                                  // AXI SLAVE write response channel signals
                                  .BID_S(BID_S9),
                                  .BRESP_S(BRESP_S9),
                                  .BVALID_S(BVALID_S9),
                                  .BREADY_S(BREADY_S9),
                                  // AXI SLAVE read address channel signals
                                  .ARID_S(ARID_S9),
                                  .ARADDR_S(ARADDR_S9),
                                  .ARLEN_S(ARLEN_S9),
                                  .ARSIZE_S(ARSIZE_S9),
                                  .ARBURST_S(ARBURST_S9),
                                  .ARLOCK_S(ARLOCK_S9),
                                  .ARCACHE_S(ARCACHE_S9),
                                  .ARPROT_S(ARPROT_S9),
                                  .ARVALID_S(ARVALID_S9),
                                  .ARREADY_S(ARREADY_S9),
                                  // AXI SLAVE read response channel signals
                                  .RID_S(RID_S9),
                                  .RDATA_S(RDATA_S9),
                                  .RRESP_S(RRESP_S9),
                                  .RLAST_S(RLAST_S9),
                                  .RVALID_S(RVALID_S9),
                                  .RREADY_S(RREADY_S9)                                  
                            );
      end
   endgenerate

   generate
      if((((M0_SLAVE10ENABLE == 1 || M1_SLAVE10ENABLE == 1  || M2_SLAVE10ENABLE == 1 || M3_SLAVE10ENABLE == 1) && (MEMSPACE > 0)) ||
          ((M0_SLAVE10ENABLE == 1 || M1_SLAVE10ENABLE == 1  || M2_SLAVE10ENABLE == 1 || M3_SLAVE10ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 0))) && FEED_THROUGH != 1) begin
         axi_slave_stage #(
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
           slave_stage10(
                                  // Global signals
                                  .ACLK(ACLK),
                                  .ARESETN(ARESETN),
                            
                                  // Interconnect
                                  // Write address channel signals
                                  .AWID_IS(AWID_IS10),
                                  .AWADDR_IS(AWADDR_IS10),
                                  .AWLEN_IS(AWLEN_IS10),
                                  .AWSIZE_IS(AWSIZE_IS10),
                                  .AWBURST_IS(AWBURST_IS10),
                                  .AWLOCK_IS(AWLOCK_IS10),
                                  .AWCACHE_IS(AWCACHE_IS10),
                                  .AWPROT_IS(AWPROT_IS10),
                                  .AWVALID_IS(AWVALID_IS10),
                                  .AWREADY_SI(AWREADY_SI10),
                                  // Write data channel signals
                                  .WID_IS(WID_IS10),
                                  .WDATA_IS(WDATA_IS10),
                                  .WSTRB_IS(WSTRB_IS10),
                                  .WLAST_IS(WLAST_IS10),
                                  .WVALID_IS(WVALID_IS10),
                                  .WREADY_SI(WREADY_SI10),
                                  // Write response channel signals
                                  .BID_SI(BID_SI10),
                                  .BRESP_SI(BRESP_SI10),
                                  .BVALID_SI(BVALID_SI10),
                                  .BREADY_IS(BREADY_IS10),
                                  // Read address channel signals
                                  .ARID_IS(ARID_IS10),
                                  .ARADDR_IS(ARADDR_IS10),
                                  .ARLEN_IS(ARLEN_IS10),
                                  .ARSIZE_IS(ARSIZE_IS10),
                                  .ARBURST_IS(ARBURST_IS10),
                                  .ARLOCK_IS(ARLOCK_IS10),
                                  .ARCACHE_IS(ARCACHE_IS10),
                                  .ARPROT_IS(ARPROT_IS10),
                                  .ARVALID_IS(ARVALID_IS10),
                                  .ARREADY_SI(ARREADY_SI10),
                                  // Read response channel signals
                                  .RID_SI(RID_SI10),
                                  .RDATA_SI(RDATA_SI10),
                                  .RRESP_SI(RRESP_SI10),
                                  .RLAST_SI(RLAST_SI10),
                                  .RVALID_SI(RVALID_SI10),
                                  .RREADY_IS(RREADY_IS10),
                                  
                                  // SLAVE Side
                                  // AXI SLAVE write address channel signals
                                  .AWID_S(AWID_S10),
                                  .AWADDR_S(AWADDR_S10),
                                  .AWLEN_S(AWLEN_S10),
                                  .AWSIZE_S(AWSIZE_S10),
                                  .AWBURST_S(AWBURST_S10),
                                  .AWLOCK_S(AWLOCK_S10),
                                  .AWCACHE_S(AWCACHE_S10),
                                  .AWPROT_S(AWPROT_S10),
                                  .AWVALID_S(AWVALID_S10),
                                  .AWREADY_S(AWREADY_S10),
                                  // AXI SLAVE write data channel signals
                                  .WID_S(WID_S10),
                                  .WDATA_S(WDATA_S10),
                                  .WSTRB_S(WSTRB_S10),
                                  .WLAST_S(WLAST_S10),
                                  .WVALID_S(WVALID_S10),
                                  .WREADY_S(WREADY_S10),
                                  // AXI SLAVE write response channel signals
                                  .BID_S(BID_S10),
                                  .BRESP_S(BRESP_S10),
                                  .BVALID_S(BVALID_S10),
                                  .BREADY_S(BREADY_S10),
                                  // AXI SLAVE read address channel signals
                                  .ARID_S(ARID_S10),
                                  .ARADDR_S(ARADDR_S10),
                                  .ARLEN_S(ARLEN_S10),
                                  .ARSIZE_S(ARSIZE_S10),
                                  .ARBURST_S(ARBURST_S10),
                                  .ARLOCK_S(ARLOCK_S10),
                                  .ARCACHE_S(ARCACHE_S10),
                                  .ARPROT_S(ARPROT_S10),
                                  .ARVALID_S(ARVALID_S10),
                                  .ARREADY_S(ARREADY_S10),
                                  // AXI SLAVE read response channel signals
                                  .RID_S(RID_S10),
                                  .RDATA_S(RDATA_S10),
                                  .RRESP_S(RRESP_S10),
                                  .RLAST_S(RLAST_S10),
                                  .RVALID_S(RVALID_S10),
                                  .RREADY_S(RREADY_S10)                                  
                            );
      end
   endgenerate

   generate
      if((((M0_SLAVE11ENABLE == 1 || M1_SLAVE11ENABLE == 1  || M2_SLAVE11ENABLE == 1 || M3_SLAVE11ENABLE == 1) && (MEMSPACE > 0)) ||
          ((M0_SLAVE11ENABLE == 1 || M1_SLAVE11ENABLE == 1  || M2_SLAVE11ENABLE == 1 || M3_SLAVE11ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 0))) && FEED_THROUGH != 1) begin
         axi_slave_stage #(
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
           slave_stage11(
                                  // Global signals
                                  .ACLK(ACLK),
                                  .ARESETN(ARESETN),
                            
                                  // Interconnect
                                  // Write address channel signals
                                  .AWID_IS(AWID_IS11),
                                  .AWADDR_IS(AWADDR_IS11),
                                  .AWLEN_IS(AWLEN_IS11),
                                  .AWSIZE_IS(AWSIZE_IS11),
                                  .AWBURST_IS(AWBURST_IS11),
                                  .AWLOCK_IS(AWLOCK_IS11),
                                  .AWCACHE_IS(AWCACHE_IS11),
                                  .AWPROT_IS(AWPROT_IS11),
                                  .AWVALID_IS(AWVALID_IS11),
                                  .AWREADY_SI(AWREADY_SI11),
                                  // Write data channel signals
                                  .WID_IS(WID_IS11),
                                  .WDATA_IS(WDATA_IS11),
                                  .WSTRB_IS(WSTRB_IS11),
                                  .WLAST_IS(WLAST_IS11),
                                  .WVALID_IS(WVALID_IS11),
                                  .WREADY_SI(WREADY_SI11),
                                  // Write response channel signals
                                  .BID_SI(BID_SI11),
                                  .BRESP_SI(BRESP_SI11),
                                  .BVALID_SI(BVALID_SI11),
                                  .BREADY_IS(BREADY_IS11),
                                  // Read address channel signals
                                  .ARID_IS(ARID_IS11),
                                  .ARADDR_IS(ARADDR_IS11),
                                  .ARLEN_IS(ARLEN_IS11),
                                  .ARSIZE_IS(ARSIZE_IS11),
                                  .ARBURST_IS(ARBURST_IS11),
                                  .ARLOCK_IS(ARLOCK_IS11),
                                  .ARCACHE_IS(ARCACHE_IS11),
                                  .ARPROT_IS(ARPROT_IS11),
                                  .ARVALID_IS(ARVALID_IS11),
                                  .ARREADY_SI(ARREADY_SI11),
                                  // Read response channel signals
                                  .RID_SI(RID_SI11),
                                  .RDATA_SI(RDATA_SI11),
                                  .RRESP_SI(RRESP_SI11),
                                  .RLAST_SI(RLAST_SI11),
                                  .RVALID_SI(RVALID_SI11),
                                  .RREADY_IS(RREADY_IS11),
                                  
                                  // SLAVE Side
                                  // AXI SLAVE write address channel signals
                                  .AWID_S(AWID_S11),
                                  .AWADDR_S(AWADDR_S11),
                                  .AWLEN_S(AWLEN_S11),
                                  .AWSIZE_S(AWSIZE_S11),
                                  .AWBURST_S(AWBURST_S11),
                                  .AWLOCK_S(AWLOCK_S11),
                                  .AWCACHE_S(AWCACHE_S11),
                                  .AWPROT_S(AWPROT_S11),
                                  .AWVALID_S(AWVALID_S11),
                                  .AWREADY_S(AWREADY_S11),
                                  // AXI SLAVE write data channel signals
                                  .WID_S(WID_S11),
                                  .WDATA_S(WDATA_S11),
                                  .WSTRB_S(WSTRB_S11),
                                  .WLAST_S(WLAST_S11),
                                  .WVALID_S(WVALID_S11),
                                  .WREADY_S(WREADY_S11),
                                  // AXI SLAVE write response channel signals
                                  .BID_S(BID_S11),
                                  .BRESP_S(BRESP_S11),
                                  .BVALID_S(BVALID_S11),
                                  .BREADY_S(BREADY_S11),
                                  // AXI SLAVE read address channel signals
                                  .ARID_S(ARID_S11),
                                  .ARADDR_S(ARADDR_S11),
                                  .ARLEN_S(ARLEN_S11),
                                  .ARSIZE_S(ARSIZE_S11),
                                  .ARBURST_S(ARBURST_S11),
                                  .ARLOCK_S(ARLOCK_S11),
                                  .ARCACHE_S(ARCACHE_S11),
                                  .ARPROT_S(ARPROT_S11),
                                  .ARVALID_S(ARVALID_S11),
                                  .ARREADY_S(ARREADY_S11),
                                  // AXI SLAVE read response channel signals
                                  .RID_S(RID_S11),
                                  .RDATA_S(RDATA_S11),
                                  .RRESP_S(RRESP_S11),
                                  .RLAST_S(RLAST_S11),
                                  .RVALID_S(RVALID_S11),
                                  .RREADY_S(RREADY_S11)                                  
                            );
      end
   endgenerate

   generate
      if((((M0_SLAVE12ENABLE == 1 || M1_SLAVE12ENABLE == 1  || M2_SLAVE12ENABLE == 1 || M3_SLAVE12ENABLE == 1) && (MEMSPACE > 0)) ||
          ((M0_SLAVE12ENABLE == 1 || M1_SLAVE12ENABLE == 1  || M2_SLAVE12ENABLE == 1 || M3_SLAVE12ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 0))) && FEED_THROUGH != 1) begin
         axi_slave_stage #(
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
           slave_stage12(
                                  // Global signals
                                  .ACLK(ACLK),
                                  .ARESETN(ARESETN),
                            
                                  // Interconnect
                                  // Write address channel signals
                                  .AWID_IS(AWID_IS12),
                                  .AWADDR_IS(AWADDR_IS12),
                                  .AWLEN_IS(AWLEN_IS12),
                                  .AWSIZE_IS(AWSIZE_IS12),
                                  .AWBURST_IS(AWBURST_IS12),
                                  .AWLOCK_IS(AWLOCK_IS12),
                                  .AWCACHE_IS(AWCACHE_IS12),
                                  .AWPROT_IS(AWPROT_IS12),
                                  .AWVALID_IS(AWVALID_IS12),
                                  .AWREADY_SI(AWREADY_SI12),
                                  // Write data channel signals
                                  .WID_IS(WID_IS12),
                                  .WDATA_IS(WDATA_IS12),
                                  .WSTRB_IS(WSTRB_IS12),
                                  .WLAST_IS(WLAST_IS12),
                                  .WVALID_IS(WVALID_IS12),
                                  .WREADY_SI(WREADY_SI12),
                                  // Write response channel signals
                                  .BID_SI(BID_SI12),
                                  .BRESP_SI(BRESP_SI12),
                                  .BVALID_SI(BVALID_SI12),
                                  .BREADY_IS(BREADY_IS12),
                                  // Read address channel signals
                                  .ARID_IS(ARID_IS12),
                                  .ARADDR_IS(ARADDR_IS12),
                                  .ARLEN_IS(ARLEN_IS12),
                                  .ARSIZE_IS(ARSIZE_IS12),
                                  .ARBURST_IS(ARBURST_IS12),
                                  .ARLOCK_IS(ARLOCK_IS12),
                                  .ARCACHE_IS(ARCACHE_IS12),
                                  .ARPROT_IS(ARPROT_IS12),
                                  .ARVALID_IS(ARVALID_IS12),
                                  .ARREADY_SI(ARREADY_SI12),
                                  // Read response channel signals
                                  .RID_SI(RID_SI12),
                                  .RDATA_SI(RDATA_SI12),
                                  .RRESP_SI(RRESP_SI12),
                                  .RLAST_SI(RLAST_SI12),
                                  .RVALID_SI(RVALID_SI12),
                                  .RREADY_IS(RREADY_IS12),
                                  
                                  // SLAVE Side
                                  // AXI SLAVE write address channel signals
                                  .AWID_S(AWID_S12),
                                  .AWADDR_S(AWADDR_S12),
                                  .AWLEN_S(AWLEN_S12),
                                  .AWSIZE_S(AWSIZE_S12),
                                  .AWBURST_S(AWBURST_S12),
                                  .AWLOCK_S(AWLOCK_S12),
                                  .AWCACHE_S(AWCACHE_S12),
                                  .AWPROT_S(AWPROT_S12),
                                  .AWVALID_S(AWVALID_S12),
                                  .AWREADY_S(AWREADY_S12),
                                  // AXI SLAVE write data channel signals
                                  .WID_S(WID_S12),
                                  .WDATA_S(WDATA_S12),
                                  .WSTRB_S(WSTRB_S12),
                                  .WLAST_S(WLAST_S12),
                                  .WVALID_S(WVALID_S12),
                                  .WREADY_S(WREADY_S12),
                                  // AXI SLAVE write response channel signals
                                  .BID_S(BID_S12),
                                  .BRESP_S(BRESP_S12),
                                  .BVALID_S(BVALID_S12),
                                  .BREADY_S(BREADY_S12),
                                  // AXI SLAVE read address channel signals
                                  .ARID_S(ARID_S12),
                                  .ARADDR_S(ARADDR_S12),
                                  .ARLEN_S(ARLEN_S12),
                                  .ARSIZE_S(ARSIZE_S12),
                                  .ARBURST_S(ARBURST_S12),
                                  .ARLOCK_S(ARLOCK_S12),
                                  .ARCACHE_S(ARCACHE_S12),
                                  .ARPROT_S(ARPROT_S12),
                                  .ARVALID_S(ARVALID_S12),
                                  .ARREADY_S(ARREADY_S12),
                                  // AXI SLAVE read response channel signals
                                  .RID_S(RID_S12),
                                  .RDATA_S(RDATA_S12),
                                  .RRESP_S(RRESP_S12),
                                  .RLAST_S(RLAST_S12),
                                  .RVALID_S(RVALID_S12),
                                  .RREADY_S(RREADY_S12)                                  
                            );
      end
   endgenerate

   generate
      if((((M0_SLAVE13ENABLE == 1 || M1_SLAVE13ENABLE == 1  || M2_SLAVE13ENABLE == 1 || M3_SLAVE13ENABLE == 1) && (MEMSPACE > 0)) ||
          ((M0_SLAVE13ENABLE == 1 || M1_SLAVE13ENABLE == 1  || M2_SLAVE13ENABLE == 1 || M3_SLAVE13ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 0))) && FEED_THROUGH != 1) begin
         axi_slave_stage #(
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
           slave_stage13(
                                  // Global signals
                                  .ACLK(ACLK),
                                  .ARESETN(ARESETN),
                            
                                  // Interconnect
                                  // Write address channel signals
                                  .AWID_IS(AWID_IS13),
                                  .AWADDR_IS(AWADDR_IS13),
                                  .AWLEN_IS(AWLEN_IS13),
                                  .AWSIZE_IS(AWSIZE_IS13),
                                  .AWBURST_IS(AWBURST_IS13),
                                  .AWLOCK_IS(AWLOCK_IS13),
                                  .AWCACHE_IS(AWCACHE_IS13),
                                  .AWPROT_IS(AWPROT_IS13),
                                  .AWVALID_IS(AWVALID_IS13),
                                  .AWREADY_SI(AWREADY_SI13),
                                  // Write data channel signals
                                  .WID_IS(WID_IS13),
                                  .WDATA_IS(WDATA_IS13),
                                  .WSTRB_IS(WSTRB_IS13),
                                  .WLAST_IS(WLAST_IS13),
                                  .WVALID_IS(WVALID_IS13),
                                  .WREADY_SI(WREADY_SI13),
                                  // Write response channel signals
                                  .BID_SI(BID_SI13),
                                  .BRESP_SI(BRESP_SI13),
                                  .BVALID_SI(BVALID_SI13),
                                  .BREADY_IS(BREADY_IS13),
                                  // Read address channel signals
                                  .ARID_IS(ARID_IS13),
                                  .ARADDR_IS(ARADDR_IS13),
                                  .ARLEN_IS(ARLEN_IS13),
                                  .ARSIZE_IS(ARSIZE_IS13),
                                  .ARBURST_IS(ARBURST_IS13),
                                  .ARLOCK_IS(ARLOCK_IS13),
                                  .ARCACHE_IS(ARCACHE_IS13),
                                  .ARPROT_IS(ARPROT_IS13),
                                  .ARVALID_IS(ARVALID_IS13),
                                  .ARREADY_SI(ARREADY_SI13),
                                  // Read response channel signals
                                  .RID_SI(RID_SI13),
                                  .RDATA_SI(RDATA_SI13),
                                  .RRESP_SI(RRESP_SI13),
                                  .RLAST_SI(RLAST_SI13),
                                  .RVALID_SI(RVALID_SI13),
                                  .RREADY_IS(RREADY_IS13),
                                  
                                  // SLAVE Side
                                  // AXI SLAVE write address channel signals
                                  .AWID_S(AWID_S13),
                                  .AWADDR_S(AWADDR_S13),
                                  .AWLEN_S(AWLEN_S13),
                                  .AWSIZE_S(AWSIZE_S13),
                                  .AWBURST_S(AWBURST_S13),
                                  .AWLOCK_S(AWLOCK_S13),
                                  .AWCACHE_S(AWCACHE_S13),
                                  .AWPROT_S(AWPROT_S13),
                                  .AWVALID_S(AWVALID_S13),
                                  .AWREADY_S(AWREADY_S13),
                                  // AXI SLAVE write data channel signals
                                  .WID_S(WID_S13),
                                  .WDATA_S(WDATA_S13),
                                  .WSTRB_S(WSTRB_S13),
                                  .WLAST_S(WLAST_S13),
                                  .WVALID_S(WVALID_S13),
                                  .WREADY_S(WREADY_S13),
                                  // AXI SLAVE write response channel signals
                                  .BID_S(BID_S13),
                                  .BRESP_S(BRESP_S13),
                                  .BVALID_S(BVALID_S13),
                                  .BREADY_S(BREADY_S13),
                                  // AXI SLAVE read address channel signals
                                  .ARID_S(ARID_S13),
                                  .ARADDR_S(ARADDR_S13),
                                  .ARLEN_S(ARLEN_S13),
                                  .ARSIZE_S(ARSIZE_S13),
                                  .ARBURST_S(ARBURST_S13),
                                  .ARLOCK_S(ARLOCK_S13),
                                  .ARCACHE_S(ARCACHE_S13),
                                  .ARPROT_S(ARPROT_S13),
                                  .ARVALID_S(ARVALID_S13),
                                  .ARREADY_S(ARREADY_S13),
                                  // AXI SLAVE read response channel signals
                                  .RID_S(RID_S13),
                                  .RDATA_S(RDATA_S13),
                                  .RRESP_S(RRESP_S13),
                                  .RLAST_S(RLAST_S13),
                                  .RVALID_S(RVALID_S13),
                                  .RREADY_S(RREADY_S13)                                  
                            );
      end
   endgenerate

   generate
      if((((M0_SLAVE14ENABLE == 1 || M1_SLAVE14ENABLE == 1  || M2_SLAVE14ENABLE == 1 || M3_SLAVE14ENABLE == 1) && (MEMSPACE > 0)) ||
          ((M0_SLAVE14ENABLE == 1 || M1_SLAVE14ENABLE == 1  || M2_SLAVE14ENABLE == 1 || M3_SLAVE14ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 0))) && FEED_THROUGH != 1) begin
         axi_slave_stage #(
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
           slave_stage14(
                                  // Global signals
                                  .ACLK(ACLK),
                                  .ARESETN(ARESETN),
                            
                                  // Interconnect
                                  // Write address channel signals
                                  .AWID_IS(AWID_IS14),
                                  .AWADDR_IS(AWADDR_IS14),
                                  .AWLEN_IS(AWLEN_IS14),
                                  .AWSIZE_IS(AWSIZE_IS14),
                                  .AWBURST_IS(AWBURST_IS14),
                                  .AWLOCK_IS(AWLOCK_IS14),
                                  .AWCACHE_IS(AWCACHE_IS14),
                                  .AWPROT_IS(AWPROT_IS14),
                                  .AWVALID_IS(AWVALID_IS14),
                                  .AWREADY_SI(AWREADY_SI14),
                                  // Write data channel signals
                                  .WID_IS(WID_IS14),
                                  .WDATA_IS(WDATA_IS14),
                                  .WSTRB_IS(WSTRB_IS14),
                                  .WLAST_IS(WLAST_IS14),
                                  .WVALID_IS(WVALID_IS14),
                                  .WREADY_SI(WREADY_SI14),
                                  // Write response channel signals
                                  .BID_SI(BID_SI14),
                                  .BRESP_SI(BRESP_SI14),
                                  .BVALID_SI(BVALID_SI14),
                                  .BREADY_IS(BREADY_IS14),
                                  // Read address channel signals
                                  .ARID_IS(ARID_IS14),
                                  .ARADDR_IS(ARADDR_IS14),
                                  .ARLEN_IS(ARLEN_IS14),
                                  .ARSIZE_IS(ARSIZE_IS14),
                                  .ARBURST_IS(ARBURST_IS14),
                                  .ARLOCK_IS(ARLOCK_IS14),
                                  .ARCACHE_IS(ARCACHE_IS14),
                                  .ARPROT_IS(ARPROT_IS14),
                                  .ARVALID_IS(ARVALID_IS14),
                                  .ARREADY_SI(ARREADY_SI14),
                                  // Read response channel signals
                                  .RID_SI(RID_SI14),
                                  .RDATA_SI(RDATA_SI14),
                                  .RRESP_SI(RRESP_SI14),
                                  .RLAST_SI(RLAST_SI14),
                                  .RVALID_SI(RVALID_SI14),
                                  .RREADY_IS(RREADY_IS14),
                                  
                                  // SLAVE Side
                                  // AXI SLAVE write address channel signals
                                  .AWID_S(AWID_S14),
                                  .AWADDR_S(AWADDR_S14),
                                  .AWLEN_S(AWLEN_S14),
                                  .AWSIZE_S(AWSIZE_S14),
                                  .AWBURST_S(AWBURST_S14),
                                  .AWLOCK_S(AWLOCK_S14),
                                  .AWCACHE_S(AWCACHE_S14),
                                  .AWPROT_S(AWPROT_S14),
                                  .AWVALID_S(AWVALID_S14),
                                  .AWREADY_S(AWREADY_S14),
                                  // AXI SLAVE write data channel signals
                                  .WID_S(WID_S14),
                                  .WDATA_S(WDATA_S14),
                                  .WSTRB_S(WSTRB_S14),
                                  .WLAST_S(WLAST_S14),
                                  .WVALID_S(WVALID_S14),
                                  .WREADY_S(WREADY_S14),
                                  // AXI SLAVE write response channel signals
                                  .BID_S(BID_S14),
                                  .BRESP_S(BRESP_S14),
                                  .BVALID_S(BVALID_S14),
                                  .BREADY_S(BREADY_S14),
                                  // AXI SLAVE read address channel signals
                                  .ARID_S(ARID_S14),
                                  .ARADDR_S(ARADDR_S14),
                                  .ARLEN_S(ARLEN_S14),
                                  .ARSIZE_S(ARSIZE_S14),
                                  .ARBURST_S(ARBURST_S14),
                                  .ARLOCK_S(ARLOCK_S14),
                                  .ARCACHE_S(ARCACHE_S14),
                                  .ARPROT_S(ARPROT_S14),
                                  .ARVALID_S(ARVALID_S14),
                                  .ARREADY_S(ARREADY_S14),
                                  // AXI SLAVE read response channel signals
                                  .RID_S(RID_S14),
                                  .RDATA_S(RDATA_S14),
                                  .RRESP_S(RRESP_S14),
                                  .RLAST_S(RLAST_S14),
                                  .RVALID_S(RVALID_S14),
                                  .RREADY_S(RREADY_S14)                                  
                            );
      end
   endgenerate

   generate
      if((((M0_SLAVE15ENABLE == 1 || M1_SLAVE15ENABLE == 1  || M2_SLAVE15ENABLE == 1 || M3_SLAVE15ENABLE == 1) && (MEMSPACE > 0)) ||
          ((M0_SLAVE15ENABLE == 1 || M1_SLAVE15ENABLE == 1  || M2_SLAVE15ENABLE == 1 || M3_SLAVE15ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 0))) && FEED_THROUGH != 1) begin
         axi_slave_stage #(
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
           slave_stage15(
                                  // Global signals
                                  .ACLK(ACLK),
                                  .ARESETN(ARESETN),
                            
                                  // Interconnect
                                  // Write address channel signals
                                  .AWID_IS(AWID_IS15),
                                  .AWADDR_IS(AWADDR_IS15),
                                  .AWLEN_IS(AWLEN_IS15),
                                  .AWSIZE_IS(AWSIZE_IS15),
                                  .AWBURST_IS(AWBURST_IS15),
                                  .AWLOCK_IS(AWLOCK_IS15),
                                  .AWCACHE_IS(AWCACHE_IS15),
                                  .AWPROT_IS(AWPROT_IS15),
                                  .AWVALID_IS(AWVALID_IS15),
                                  .AWREADY_SI(AWREADY_SI15),
                                  // Write data channel signals
                                  .WID_IS(WID_IS15),
                                  .WDATA_IS(WDATA_IS15),
                                  .WSTRB_IS(WSTRB_IS15),
                                  .WLAST_IS(WLAST_IS15),
                                  .WVALID_IS(WVALID_IS15),
                                  .WREADY_SI(WREADY_SI15),
                                  // Write response channel signals
                                  .BID_SI(BID_SI15),
                                  .BRESP_SI(BRESP_SI15),
                                  .BVALID_SI(BVALID_SI15),
                                  .BREADY_IS(BREADY_IS15),
                                  // Read address channel signals
                                  .ARID_IS(ARID_IS15),
                                  .ARADDR_IS(ARADDR_IS15),
                                  .ARLEN_IS(ARLEN_IS15),
                                  .ARSIZE_IS(ARSIZE_IS15),
                                  .ARBURST_IS(ARBURST_IS15),
                                  .ARLOCK_IS(ARLOCK_IS15),
                                  .ARCACHE_IS(ARCACHE_IS15),
                                  .ARPROT_IS(ARPROT_IS15),
                                  .ARVALID_IS(ARVALID_IS15),
                                  .ARREADY_SI(ARREADY_SI15),
                                  // Read response channel signals
                                  .RID_SI(RID_SI15),
                                  .RDATA_SI(RDATA_SI15),
                                  .RRESP_SI(RRESP_SI15),
                                  .RLAST_SI(RLAST_SI15),
                                  .RVALID_SI(RVALID_SI15),
                                  .RREADY_IS(RREADY_IS15),
                                  
                                  // SLAVE Side
                                  // AXI SLAVE write address channel signals
                                  .AWID_S(AWID_S15),
                                  .AWADDR_S(AWADDR_S15),
                                  .AWLEN_S(AWLEN_S15),
                                  .AWSIZE_S(AWSIZE_S15),
                                  .AWBURST_S(AWBURST_S15),
                                  .AWLOCK_S(AWLOCK_S15),
                                  .AWCACHE_S(AWCACHE_S15),
                                  .AWPROT_S(AWPROT_S15),
                                  .AWVALID_S(AWVALID_S15),
                                  .AWREADY_S(AWREADY_S15),
                                  // AXI SLAVE write data channel signals
                                  .WID_S(WID_S15),
                                  .WDATA_S(WDATA_S15),
                                  .WSTRB_S(WSTRB_S15),
                                  .WLAST_S(WLAST_S15),
                                  .WVALID_S(WVALID_S15),
                                  .WREADY_S(WREADY_S15),
                                  // AXI SLAVE write response channel signals
                                  .BID_S(BID_S15),
                                  .BRESP_S(BRESP_S15),
                                  .BVALID_S(BVALID_S15),
                                  .BREADY_S(BREADY_S15),
                                  // AXI SLAVE read address channel signals
                                  .ARID_S(ARID_S15),
                                  .ARADDR_S(ARADDR_S15),
                                  .ARLEN_S(ARLEN_S15),
                                  .ARSIZE_S(ARSIZE_S15),
                                  .ARBURST_S(ARBURST_S15),
                                  .ARLOCK_S(ARLOCK_S15),
                                  .ARCACHE_S(ARCACHE_S15),
                                  .ARPROT_S(ARPROT_S15),
                                  .ARVALID_S(ARVALID_S15),
                                  .ARREADY_S(ARREADY_S15),
                                  // AXI SLAVE read response channel signals
                                  .RID_S(RID_S15),
                                  .RDATA_S(RDATA_S15),
                                  .RRESP_S(RRESP_S15),
                                  .RLAST_S(RLAST_S15),
                                  .RVALID_S(RVALID_S15),
                                  .RREADY_S(RREADY_S15)                                  
                            );
      end
   endgenerate


   generate
      if((((M0_SLAVE16ENABLE == 1 || M1_SLAVE16ENABLE == 1  || M2_SLAVE16ENABLE == 1 || M3_SLAVE16ENABLE == 1) && (MEMSPACE == 0)) ||
          ((M0_SLAVE16ENABLE == 1 || M1_SLAVE16ENABLE == 1  || M2_SLAVE16ENABLE == 1 || M3_SLAVE16ENABLE == 1) && (MEMSPACE > 0 && |COMB_REG))) && FEED_THROUGH != 1) begin
         axi_slave_stage #(
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
           slave_stage16(
                                  // Global signals
                                  .ACLK(ACLK),
                                  .ARESETN(ARESETN),
                            
                                  // Interconnect
                                  // Write address channel signals
                                  .AWID_IS(AWID_IS16),
                                  .AWADDR_IS(AWADDR_IS16),
                                  .AWLEN_IS(AWLEN_IS16),
                                  .AWSIZE_IS(AWSIZE_IS16),
                                  .AWBURST_IS(AWBURST_IS16),
                                  .AWLOCK_IS(AWLOCK_IS16),
                                  .AWCACHE_IS(AWCACHE_IS16),
                                  .AWPROT_IS(AWPROT_IS16),
                                  .AWVALID_IS(AWVALID_IS16),
                                  .AWREADY_SI(AWREADY_SI16),
                                  // Write data channel signals
                                  .WID_IS(WID_IS16),
                                  .WDATA_IS(WDATA_IS16),
                                  .WSTRB_IS(WSTRB_IS16),
                                  .WLAST_IS(WLAST_IS16),
                                  .WVALID_IS(WVALID_IS16),
                                  .WREADY_SI(WREADY_SI16),
                                  // Write response channel signals
                                  .BID_SI(BID_SI16),
                                  .BRESP_SI(BRESP_SI16),
                                  .BVALID_SI(BVALID_SI16),
                                  .BREADY_IS(BREADY_IS16),
                                  // Read address channel signals
                                  .ARID_IS(ARID_IS16),
                                  .ARADDR_IS(ARADDR_IS16),
                                  .ARLEN_IS(ARLEN_IS16),
                                  .ARSIZE_IS(ARSIZE_IS16),
                                  .ARBURST_IS(ARBURST_IS16),
                                  .ARLOCK_IS(ARLOCK_IS16),
                                  .ARCACHE_IS(ARCACHE_IS16),
                                  .ARPROT_IS(ARPROT_IS16),
                                  .ARVALID_IS(ARVALID_IS16),
                                  .ARREADY_SI(ARREADY_SI16),
                                  // Read response channel signals
                                  .RID_SI(RID_SI16),
                                  .RDATA_SI(RDATA_SI16),
                                  .RRESP_SI(RRESP_SI16),
                                  .RLAST_SI(RLAST_SI16),
                                  .RVALID_SI(RVALID_SI16),
                                  .RREADY_IS(RREADY_IS16),
                                  
                                  // SLAVE Side
                                  // AXI SLAVE write address channel signals
                                  .AWID_S(AWID_S16),
                                  .AWADDR_S(AWADDR_S16),
                                  .AWLEN_S(AWLEN_S16),
                                  .AWSIZE_S(AWSIZE_S16),
                                  .AWBURST_S(AWBURST_S16),
                                  .AWLOCK_S(AWLOCK_S16),
                                  .AWCACHE_S(AWCACHE_S16),
                                  .AWPROT_S(AWPROT_S16),
                                  .AWVALID_S(AWVALID_S16),
                                  .AWREADY_S(AWREADY_S16),
                                  // AXI SLAVE write data channel signals
                                  .WID_S(WID_S16),
                                  .WDATA_S(WDATA_S16),
                                  .WSTRB_S(WSTRB_S16),
                                  .WLAST_S(WLAST_S16),
                                  .WVALID_S(WVALID_S16),
                                  .WREADY_S(WREADY_S16),
                                  // AXI SLAVE write response channel signals
                                  .BID_S(BID_S16),
                                  .BRESP_S(BRESP_S16),
                                  .BVALID_S(BVALID_S16),
                                  .BREADY_S(BREADY_S16),
                                  // AXI SLAVE read address channel signals
                                  .ARID_S(ARID_S16),
                                  .ARADDR_S(ARADDR_S16),
                                  .ARLEN_S(ARLEN_S16),
                                  .ARSIZE_S(ARSIZE_S16),
                                  .ARBURST_S(ARBURST_S16),
                                  .ARLOCK_S(ARLOCK_S16),
                                  .ARCACHE_S(ARCACHE_S16),
                                  .ARPROT_S(ARPROT_S16),
                                  .ARVALID_S(ARVALID_S16),
                                  .ARREADY_S(ARREADY_S16),
                                  // AXI SLAVE read response channel signals
                                  .RID_S(RID_S16),
                                  .RDATA_S(RDATA_S16),
                                  .RRESP_S(RRESP_S16),
                                  .RLAST_S(RLAST_S16),
                                  .RVALID_S(RVALID_S16),
                                  .RREADY_S(RREADY_S16)                                  
                            );
      end
   endgenerate


   //---------------------------------------------------------------------------
   // Functions
   //---------------------------------------------------------------------------
   function [31:0] ceil_log2;
      input integer x;
      integer tmp, res;
      begin
         tmp = 1;
         res = 0;
         while(tmp < x) begin
            tmp = tmp * 2;
            res = res + 1;
         end
         ceil_log2 = res;
      end
   endfunction // ceil_log2


endmodule // COREAXI


   /////////////////////////////////////////////////////////////////////////////
   //                               End - of - Code                           //
   /////////////////////////////////////////////////////////////////////////////
