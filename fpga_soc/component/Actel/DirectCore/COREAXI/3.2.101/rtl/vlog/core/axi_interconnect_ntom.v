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
//                       - Wr Address Channel
//                       - Rd Address Channel
//                       - Wr Data Channel
//                       - Wr Response Channel
//                       - Rd Data Channel
//                       - Arbiter
//                       - Decoder
//
// Revision Information:
// Date            Description
// ----            -----------------------------------------
// 02Feb11         Inital. Ports and Parameters declaration
//
// SVN Revision Information:
// SVN $Revision: 25813 $
// SVN $Date: 2015-12-21 21:42:02 +0530 (Mon, 21 Dec 2015) $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
// 1. 
//
// ****************************************************************************/
`timescale 1ns/1ps

module axi_interconnect_ntom (
                              // Global signals
                              ACLK,
                              ARESETN,
                              
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
                              
                              ARADDR_M0,
                              ARLOCK_M0,
                              ARVALID_M0,
                              ARADDR_M1,
                              ARLOCK_M1,
                              ARVALID_M1,
                              ARADDR_M2,
                              ARLOCK_M2,
                              ARVALID_M2,
                              ARADDR_M3,
                              ARLOCK_M3,
                              ARVALID_M3,
                              
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
                              // AXI MASTER write data channel signals
                              WID_MI0,
                              WDATA_MI0,
                              WSTRB_MI0,
                              WLAST_MI0,
                              WVALID_MI0,
                              WREADY_IM0,
                              // AXI MASTER write response channel signals
                              BID_IM0,
                              BRESP_IM0,
                              BVALID_IM0,
                              BREADY_MI0,
                              // AXI MASTER read address channel signals
                              ARID_MI0,
                              ARADDR_MI0,
                              ARLEN_MI0,
                              ARSIZE_MI0,
                              ARBURST_MI0,
                              ARLOCK_MI0,
                              ARCACHE_MI0,
                              ARPROT_MI0,
                              ARVALID_MI0,
                              ARREADY_IM0,
                              // AXI MASTER read response channel signals
                              RID_IM0,
                              RDATA_IM0,
                              RRESP_IM0,
                              RLAST_IM0,
                              RVALID_IM0,
                              RREADY_MI0,
                              
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
                              // AXI MASTER write data channel signals
                              WID_MI1,
                              WDATA_MI1,
                              WSTRB_MI1,
                              WLAST_MI1,
                              WVALID_MI1,
                              WREADY_IM1,
                              // AXI MASTER write response channel signals
                              BID_IM1,
                              BRESP_IM1,
                              BVALID_IM1,
                              BREADY_MI1,
                              // AXI MASTER read address channel signals
                              ARID_MI1,
                              ARADDR_MI1,
                              ARLEN_MI1,
                              ARSIZE_MI1,
                              ARBURST_MI1,
                              ARLOCK_MI1,
                              ARCACHE_MI1,
                              ARPROT_MI1,
                              ARVALID_MI1,
                              ARREADY_IM1,
                              // AXI MASTER read response channel signals
                              RID_IM1,
                              RDATA_IM1,
                              RRESP_IM1,
                              RLAST_IM1,
                              RVALID_IM1,
                              RREADY_MI1,
                          
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
                              // AXI MASTER write data channel signals
                              WID_MI2,
                              WDATA_MI2,
                              WSTRB_MI2,
                              WLAST_MI2,
                              WVALID_MI2,
                              WREADY_IM2,
                              // AXI MASTER write response channel signals
                              BID_IM2,
                              BRESP_IM2,
                              BVALID_IM2,
                              BREADY_MI2,
                              // AXI MASTER read address channel signals
                              ARID_MI2,
                              ARADDR_MI2,
                              ARLEN_MI2,
                              ARSIZE_MI2,
                              ARBURST_MI2,
                              ARLOCK_MI2,
                              ARCACHE_MI2,
                              ARPROT_MI2,
                              ARVALID_MI2,
                              ARREADY_IM2,
                              // AXI MASTER read response channel signals
                              RID_IM2,
                              RDATA_IM2,
                              RRESP_IM2,
                              RLAST_IM2,
                              RVALID_IM2,
                              RREADY_MI2,
                              
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
                              // AXI MASTER write data channel signals
                              WID_MI3,
                              WDATA_MI3,
                              WSTRB_MI3,
                              WLAST_MI3,
                              WVALID_MI3,
                              WREADY_IM3,
                              // AXI MASTER write response channel signals
                              BID_IM3,
                              BRESP_IM3,
                              BVALID_IM3,
                              BREADY_MI3,
                              // AXI MASTER read address channel signals
                              ARID_MI3,
                              ARADDR_MI3,
                              ARLEN_MI3,
                              ARSIZE_MI3,
                              ARBURST_MI3,
                              ARLOCK_MI3,
                              ARCACHE_MI3,
                              ARPROT_MI3,
                              ARVALID_MI3,
                              ARREADY_IM3,
                              // AXI MASTER read response channel signals
                              RID_IM3,
                              RDATA_IM3,
                              RRESP_IM3,
                              RLAST_IM3,
                              RVALID_IM3,
                              RREADY_MI3,
                              
                              
                              // SLAVE 0
                              // AXI SLAVE 0 write address channel signals
                              AWID_IS0,
                              AWADDR_IS0,
                              AWLEN_IS0,
                              AWSIZE_IS0,
                              AWBURST_IS0,
                              AWLOCK_IS0,
                              AWCACHE_IS0,
                              AWPROT_IS0,
                              AWVALID_IS0,
                              AWREADY_SI0,
                              // AXI SLAVE 0 write data channel signals
                              WID_IS0,
                              WDATA_IS0,
                              WSTRB_IS0,
                              WLAST_IS0,
                              WVALID_IS0,
                              WREADY_SI0,
                              // AXI SLAVE 0 write response channel signals
                              BID_SI0,
                              BRESP_SI0,
                              BVALID_SI0,
                              BREADY_IS0,
                              // AXI SLAVE 0 read address channel signals
                              ARID_IS0,
                              ARADDR_IS0,
                              ARLEN_IS0,
                              ARSIZE_IS0,
                              ARBURST_IS0,
                              ARLOCK_IS0,
                              ARCACHE_IS0,
                              ARPROT_IS0,
                              ARVALID_IS0,
                              ARREADY_SI0,
                              // AXI SLAVE 0 read response channel signals
                              RID_SI0,
                              RDATA_SI0,
                              RRESP_SI0,
                              RLAST_SI0,
                              RVALID_SI0,
                              RREADY_IS0,
                          
                              // SLAVE 1
                              // AXI SLAVE 1 write address channel signals
                              AWID_IS1,
                              AWADDR_IS1,
                              AWLEN_IS1,
                              AWSIZE_IS1,
                              AWBURST_IS1,
                              AWLOCK_IS1,
                              AWCACHE_IS1,
                              AWPROT_IS1,
                              AWVALID_IS1,
                              AWREADY_SI1,
                              // AXI SLAVE 1 write data channel signals
                              WID_IS1,
                              WDATA_IS1,
                              WSTRB_IS1,
                              WLAST_IS1,
                              WVALID_IS1,
                              WREADY_SI1,
                              // AXI SLAVE 1 write response channel signals
                              BID_SI1,
                              BRESP_SI1,
                              BVALID_SI1,
                              BREADY_IS1,
                              // AXI SLAVE 1 read address channel signals
                              ARID_IS1,
                              ARADDR_IS1,
                              ARLEN_IS1,
                              ARSIZE_IS1,
                              ARBURST_IS1,
                              ARLOCK_IS1,
                              ARCACHE_IS1,
                              ARPROT_IS1,
                              ARVALID_IS1,
                              ARREADY_SI1,
                              // AXI SLAVE 1 read response channel signals
                              RID_SI1,
                              RDATA_SI1,
                              RRESP_SI1,
                              RLAST_SI1,
                              RVALID_SI1,
                              RREADY_IS1,
                              
                              // SLAVE 2
                              // AXI SLAVE 2 write address channel signals
                              AWID_IS2,
                              AWADDR_IS2,
                              AWLEN_IS2,
                              AWSIZE_IS2,
                              AWBURST_IS2,
                              AWLOCK_IS2,
                              AWCACHE_IS2,
                              AWPROT_IS2,
                              AWVALID_IS2,
                              AWREADY_SI2,
                              // AXI SLAVE 2 write data channel signals
                              WID_IS2,
                              WDATA_IS2,
                              WSTRB_IS2,
                              WLAST_IS2,
                              WVALID_IS2,
                              WREADY_SI2,
                              // AXI SLAVE 2 write response channel signals
                              BID_SI2,
                              BRESP_SI2,
                              BVALID_SI2,
                              BREADY_IS2,
                              // AXI SLAVE 2 read address channel signals
                              ARID_IS2,
                              ARADDR_IS2,
                              ARLEN_IS2,
                              ARSIZE_IS2,
                              ARBURST_IS2,
                              ARLOCK_IS2,
                              ARCACHE_IS2,
                              ARPROT_IS2,
                              ARVALID_IS2,
                              ARREADY_SI2,
                              // AXI SLAVE 2 read response channel signals
                              RID_SI2,
                              RDATA_SI2,
                              RRESP_SI2,
                              RLAST_SI2,
                              RVALID_SI2,
                              RREADY_IS2,
                              
                              // SLAVE 3
                              // AXI SLAVE 3 write address channel signals
                              AWID_IS3,
                              AWADDR_IS3,
                              AWLEN_IS3,
                              AWSIZE_IS3,
                              AWBURST_IS3,
                              AWLOCK_IS3,
                              AWCACHE_IS3,
                              AWPROT_IS3,
                              AWVALID_IS3,
                              AWREADY_SI3,
                              // AXI SLAVE 3 write data channel signals
                              WID_IS3,
                              WDATA_IS3,
                              WSTRB_IS3,
                              WLAST_IS3,
                              WVALID_IS3,
                              WREADY_SI3,
                              // AXI SLAVE 3 write response channel signals
                              BID_SI3,
                              BRESP_SI3,
                              BVALID_SI3,
                              BREADY_IS3,
                              // AXI SLAVE 3 read address channel signals
                              ARID_IS3,
                              ARADDR_IS3,
                              ARLEN_IS3,
                              ARSIZE_IS3,
                              ARBURST_IS3,
                              ARLOCK_IS3,
                              ARCACHE_IS3,
                              ARPROT_IS3,
                              ARVALID_IS3,
                              ARREADY_SI3,
                              // AXI SLAVE 3 read response channel signals
                              RID_SI3,
                              RDATA_SI3,
                              RRESP_SI3,
                              RLAST_SI3,
                              RVALID_SI3,
                              RREADY_IS3,
                              
                              // SLAVE 4
                              // AXI SLAVE 4 write address channel signals
                              AWID_IS4,
                              AWADDR_IS4,
                              AWLEN_IS4,
                              AWSIZE_IS4,
                              AWBURST_IS4,
                              AWLOCK_IS4,
                              AWCACHE_IS4,
                              AWPROT_IS4,
                              AWVALID_IS4,
                              AWREADY_SI4,
                              // AXI SLAVE 4 write data channel signals
                              WID_IS4,
                              WDATA_IS4,
                                  WSTRB_IS4,
                              WLAST_IS4,
                              WVALID_IS4,
                              WREADY_SI4,
                              // AXI SLAVE 4 write response channel signals
                              BID_SI4,
                              BRESP_SI4,
                              BVALID_SI4,
                              BREADY_IS4,
                              // AXI SLAVE 4 read address channel signals
                              ARID_IS4,
                              ARADDR_IS4,
                              ARLEN_IS4,
                              ARSIZE_IS4,
                              ARBURST_IS4,
                              ARLOCK_IS4,
                              ARCACHE_IS4,
                              ARPROT_IS4,
                              ARVALID_IS4,
                              ARREADY_SI4,
                              // AXI SLAVE 4 read response channel signals
                              RID_SI4,
                              RDATA_SI4,
                              RRESP_SI4,
                              RLAST_SI4,
                              RVALID_SI4,
                              RREADY_IS4,
                              
                              // SLAVE 5
                              // AXI SLAVE 5 write address channel signals
                              AWID_IS5,
                              AWADDR_IS5,
                              AWLEN_IS5,
                              AWSIZE_IS5,
                              AWBURST_IS5,
                              AWLOCK_IS5,
                              AWCACHE_IS5,
                              AWPROT_IS5,
                              AWVALID_IS5,
                              AWREADY_SI5,
                              // AXI SLAVE 5 write data channel signals
                              WID_IS5,
                              WDATA_IS5,
                              WSTRB_IS5,
                              WLAST_IS5,
                              WVALID_IS5,
                              WREADY_SI5,
                              // AXI SLAVE 5 write response channel signals
                              BID_SI5,
                              BRESP_SI5,
                              BVALID_SI5,
                              BREADY_IS5,
                              // AXI SLAVE 5 read address channel signals
                              ARID_IS5,
                              ARADDR_IS5,
                              ARLEN_IS5,
                              ARSIZE_IS5,
                              ARBURST_IS5,
                              ARLOCK_IS5,
                              ARCACHE_IS5,
                              ARPROT_IS5,
                              ARVALID_IS5,
                              ARREADY_SI5,
                              // AXI SLAVE 5 read response channel signals
                              RID_SI5,
                              RDATA_SI5,
                              RRESP_SI5,
                              RLAST_SI5,
                              RVALID_SI5,
                              RREADY_IS5,
                              
                              // SLAVE 6
                              // AXI SLAVE 6 write address channel signals
                              AWID_IS6,
                              AWADDR_IS6,
                              AWLEN_IS6,
                              AWSIZE_IS6,
                              AWBURST_IS6,
                              AWLOCK_IS6,
                              AWCACHE_IS6,
                              AWPROT_IS6,
                              AWVALID_IS6,
                              AWREADY_SI6,
                              // AXI SLAVE 6 write data channel signals
                              WID_IS6,
                              WDATA_IS6,
                              WSTRB_IS6,
                              WLAST_IS6,
                              WVALID_IS6,
                              WREADY_SI6,
                              // AXI SLAVE 6 write response channel signals
                              BID_SI6,
                              BRESP_SI6,
                              BVALID_SI6,
                              BREADY_IS6,
                              // AXI SLAVE 6 read address channel signals
                              ARID_IS6,
                              ARADDR_IS6,
                              ARLEN_IS6,
                              ARSIZE_IS6,
                              ARBURST_IS6,
                              ARLOCK_IS6,
                              ARCACHE_IS6,
                              ARPROT_IS6,
                              ARVALID_IS6,
                              ARREADY_SI6,
                              // AXI SLAVE 6 read response channel signals
                              RID_SI6,
                              RDATA_SI6,
                              RRESP_SI6,
                              RLAST_SI6,
                              RVALID_SI6,
                              RREADY_IS6,
                              
                              // SLAVE 7
                              // AXI SLAVE 7 write address channel signals
                              AWID_IS7,
                              AWADDR_IS7,
                              AWLEN_IS7,
                              AWSIZE_IS7,
                              AWBURST_IS7,
                              AWLOCK_IS7,
                              AWCACHE_IS7,
                              AWPROT_IS7,
                              AWVALID_IS7,
                              AWREADY_SI7,
                              // AXI SLAVE 7 write data channel signals
                              WID_IS7,
                              WDATA_IS7,
                              WSTRB_IS7,
                              WLAST_IS7,
                              WVALID_IS7,
                              WREADY_SI7,
                              // AXI SLAVE 7 write response channel signals
                              BID_SI7,
                              BRESP_SI7,
                              BVALID_SI7,
                              BREADY_IS7,
                              // AXI SLAVE 7 read address channel signals
                              ARID_IS7,
                              ARADDR_IS7,
                              ARLEN_IS7,
                              ARSIZE_IS7,
                              ARBURST_IS7,
                                  ARLOCK_IS7,
                              ARCACHE_IS7,
                              ARPROT_IS7,
                              ARVALID_IS7,
                              ARREADY_SI7,
                              // AXI SLAVE 7 read response channel signals
                              RID_SI7,
                              RDATA_SI7,
                              RRESP_SI7,
                              RLAST_SI7,
                              RVALID_SI7,
                              RREADY_IS7,
                              
                              // SLAVE 8
                              // AXI SLAVE 8 write address channel signals
                              AWID_IS8,
                              AWADDR_IS8,
                              AWLEN_IS8,
                              AWSIZE_IS8,
                              AWBURST_IS8,
                              AWLOCK_IS8,
                              AWCACHE_IS8,
                              AWPROT_IS8,
                              AWVALID_IS8,
                              AWREADY_SI8,
                              // AXI SLAVE 8 write data channel signals
                              WID_IS8,
                              WDATA_IS8,
                              WSTRB_IS8,
                              WLAST_IS8,
                              WVALID_IS8,
                              WREADY_SI8,
                              // AXI SLAVE 8 write response channel signals
                              BID_SI8,
                              BRESP_SI8,
                              BVALID_SI8,
                              BREADY_IS8,
                              // AXI SLAVE 8 read address channel signals
                              ARID_IS8,
                              ARADDR_IS8,
                              ARLEN_IS8,
                              ARSIZE_IS8,
                              ARBURST_IS8,
                              ARLOCK_IS8,
                              ARCACHE_IS8,
                              ARPROT_IS8,
                              ARVALID_IS8,
                              ARREADY_SI8,
                              // AXI SLAVE 8 read response channel signals
                              RID_SI8,
                              RDATA_SI8,
                              RRESP_SI8,
                              RLAST_SI8,
                              RVALID_SI8,
                              RREADY_IS8,
                              
                              // SLAVE 9
                              // AXI SLAVE 9 write address channel signals
                              AWID_IS9,
                              AWADDR_IS9,
                              AWLEN_IS9,
                              AWSIZE_IS9,
                              AWBURST_IS9,
                              AWLOCK_IS9,
                              AWCACHE_IS9,
                              AWPROT_IS9,
                              AWVALID_IS9,
                              AWREADY_SI9,
                              // AXI SLAVE 9 write data channel signals
                              WID_IS9,
                              WDATA_IS9,
                              WSTRB_IS9,
                              WLAST_IS9,
                              WVALID_IS9,
                              WREADY_SI9,
                              // AXI SLAVE 9 write response channel signals
                              BID_SI9,
                              BRESP_SI9,
                              BVALID_SI9,
                              BREADY_IS9,
                              // AXI SLAVE 9 read address channel signals
                              ARID_IS9,
                              ARADDR_IS9,
                              ARLEN_IS9,
                              ARSIZE_IS9,
                              ARBURST_IS9,
                              ARLOCK_IS9,
                              ARCACHE_IS9,
                              ARPROT_IS9,
                              ARVALID_IS9,
                              ARREADY_SI9,
                              // AXI SLAVE 9 read response channel signals
                              RID_SI9,
                              RDATA_SI9,
                              RRESP_SI9,
                              RLAST_SI9,
                              RVALID_SI9,
                              RREADY_IS9,
                              
                              // SLAVE 10
                              // AXI SLAVE 10 write address channel signals
                              AWID_IS10,
                              AWADDR_IS10,
                              AWLEN_IS10,
                              AWSIZE_IS10,
                              AWBURST_IS10,
                              AWLOCK_IS10,
                              AWCACHE_IS10,
                              AWPROT_IS10,
                              AWVALID_IS10,
                              AWREADY_SI10,
                              // AXI SLAVE 10 write data channel signals
                              WID_IS10,
                              WDATA_IS10,
                              WSTRB_IS10,
                              WLAST_IS10,
                              WVALID_IS10,
                              WREADY_SI10,
                              // AXI SLAVE 10 write response channel signals
                              BID_SI10,
                              BRESP_SI10,
                              BVALID_SI10,
                              BREADY_IS10,
                              // AXI SLAVE 10 read address channel signals
                              ARID_IS10,
                              ARADDR_IS10,
                              ARLEN_IS10,
                              ARSIZE_IS10,
                              ARBURST_IS10,
                              ARLOCK_IS10,
                              ARCACHE_IS10,
                              ARPROT_IS10,
                              ARVALID_IS10,
                              ARREADY_SI10,
                              // AXI SLAVE 10 read response channel signals
                              RID_SI10,
                              RDATA_SI10,
                              RRESP_SI10,
                              RLAST_SI10,
                              RVALID_SI10,
                              RREADY_IS10,
                              
                              // SLAVE 11
                              // AXI SLAVE 11 write address channel signals
                              AWID_IS11,
                              AWADDR_IS11,
                              AWLEN_IS11,
                              AWSIZE_IS11,
                              AWBURST_IS11,
                              AWLOCK_IS11,
                              AWCACHE_IS11,
                              AWPROT_IS11,
                              AWVALID_IS11,
                              AWREADY_SI11,
                              // AXI SLAVE 11 write data channel signals
                              WID_IS11,
                              WDATA_IS11,
                              WSTRB_IS11,
                              WLAST_IS11,
                              WVALID_IS11,
                              WREADY_SI11,
                              // AXI SLAVE 11 write response channel signals
                              BID_SI11,
                              BRESP_SI11,
                              BVALID_SI11,
                              BREADY_IS11,
                              // AXI SLAVE 11 read address channel signals
                              ARID_IS11,
                              ARADDR_IS11,
                              ARLEN_IS11,
                              ARSIZE_IS11,
                              ARBURST_IS11,
                              ARLOCK_IS11,
                              ARCACHE_IS11,
                              ARPROT_IS11,
                              ARVALID_IS11,
                              ARREADY_SI11,
                              // AXI SLAVE 11 read response channel signals
                              RID_SI11,
                              RDATA_SI11,
                              RRESP_SI11,
                              RLAST_SI11,
                              RVALID_SI11,
                              RREADY_IS11,
                              
                              // SLAVE 12
                              // AXI SLAVE 12 write address channel signals
                              AWID_IS12,
                              AWADDR_IS12,
                              AWLEN_IS12,
                              AWSIZE_IS12,
                              AWBURST_IS12,
                              AWLOCK_IS12,
                              AWCACHE_IS12,
                              AWPROT_IS12,
                              AWVALID_IS12,
                              AWREADY_SI12,
                              // AXI SLAVE 12 write data channel signals
                              WID_IS12,
                              WDATA_IS12,
                              WSTRB_IS12,
                              WLAST_IS12,
                              WVALID_IS12,
                              WREADY_SI12,
                              // AXI SLAVE 12 write response channel signals
                              BID_SI12,
                              BRESP_SI12,
                              BVALID_SI12,
                              BREADY_IS12,
                              // AXI SLAVE 12 read address channel signals
                              ARID_IS12,
                              ARADDR_IS12,
                              ARLEN_IS12,
                              ARSIZE_IS12,
                              ARBURST_IS12,
                              ARLOCK_IS12,
                              ARCACHE_IS12,
                              ARPROT_IS12,
                              ARVALID_IS12,
                              ARREADY_SI12,
                              // AXI SLAVE 12 read response channel signals
                              RID_SI12,
                              RDATA_SI12,
                              RRESP_SI12,
                              RLAST_SI12,
                              RVALID_SI12,
                              RREADY_IS12,
                              
                              // SLAVE 13
                              // AXI SLAVE 13 write address channel signals
                              AWID_IS13,
                              AWADDR_IS13,
                              AWLEN_IS13,
                              AWSIZE_IS13,
                              AWBURST_IS13,
                              AWLOCK_IS13,
                              AWCACHE_IS13,
                              AWPROT_IS13,
                              AWVALID_IS13,
                              AWREADY_SI13,
                              // AXI SLAVE 13 write data channel signals
                              WID_IS13,
                              WDATA_IS13,
                              WSTRB_IS13,
                              WLAST_IS13,
                              WVALID_IS13,
                              WREADY_SI13,
                              // AXI SLAVE 13 write response channel signals
                              BID_SI13,
                              BRESP_SI13,
                              BVALID_SI13,
                              BREADY_IS13,
                              // AXI SLAVE 13 read address channel signals
                              ARID_IS13,
                              ARADDR_IS13,
                              ARLEN_IS13,
                              ARSIZE_IS13,
                              ARBURST_IS13,
                              ARLOCK_IS13,
                              ARCACHE_IS13,
                              ARPROT_IS13,
                              ARVALID_IS13,
                              ARREADY_SI13,
                              // AXI SLAVE 13 read response channel signals
                              RID_SI13,
                              RDATA_SI13,
                              RRESP_SI13,
                              RLAST_SI13,
                              RVALID_SI13,
                              RREADY_IS13,
                              
                              // SLAVE 14
                              // AXI SLAVE 14 write address channel signals
                              AWID_IS14,
                              AWADDR_IS14,
                              AWLEN_IS14,
                              AWSIZE_IS14,
                              AWBURST_IS14,
                              AWLOCK_IS14,
                              AWCACHE_IS14,
                              AWPROT_IS14,
                              AWVALID_IS14,
                              AWREADY_SI14,
                              // AXI SLAVE 14 write data channel signals
                              WID_IS14,
                              WDATA_IS14,
                              WSTRB_IS14,
                              WLAST_IS14,
                                  WVALID_IS14,
                              WREADY_SI14,
                              // AXI SLAVE 14 write response channel signals
                              BID_SI14,
                              BRESP_SI14,
                              BVALID_SI14,
                              BREADY_IS14,
                              // AXI SLAVE 14 read address channel signals
                              ARID_IS14,
                              ARADDR_IS14,
                              ARLEN_IS14,
                              ARSIZE_IS14,
                              ARBURST_IS14,
                              ARLOCK_IS14,
                              ARCACHE_IS14,
                              ARPROT_IS14,
                              ARVALID_IS14,
                              ARREADY_SI14,
                              // AXI SLAVE 14 read response channel signals
                              RID_SI14,
                              RDATA_SI14,
                              RRESP_SI14,
                              RLAST_SI14,
                              RVALID_SI14,
                              RREADY_IS14,
                              
                              // SLAVE 15
                              // AXI SLAVE 15 write address channel signals
                              AWID_IS15,
                              AWADDR_IS15,
                              AWLEN_IS15,
                              AWSIZE_IS15,
                              AWBURST_IS15,
                              AWLOCK_IS15,
                              AWCACHE_IS15,
                              AWPROT_IS15,
                              AWVALID_IS15,
                              AWREADY_SI15,
                              // AXI SLAVE 15 write data channel signals
                              WID_IS15,
                              WDATA_IS15,
                              WSTRB_IS15,
                              WLAST_IS15,
                              WVALID_IS15,
                              WREADY_SI15,
                              // AXI SLAVE 15 write response channel signals
                              BID_SI15,
                              BRESP_SI15,
                              BVALID_SI15,
                              BREADY_IS15,
                              // AXI SLAVE 15 read address channel signals
                              ARID_IS15,
                              ARADDR_IS15,
                              ARLEN_IS15,
                              ARSIZE_IS15,
                              ARBURST_IS15,
                              ARLOCK_IS15,
                              ARCACHE_IS15,
                              ARPROT_IS15,
                              ARVALID_IS15,
                              ARREADY_SI15,
                              // AXI SLAVE 15 read response channel signals
                              RID_SI15,
                              RDATA_SI15,
                              RRESP_SI15,
                              RLAST_SI15,
                              RVALID_SI15,
                              RREADY_IS15,
                              
                              // SLAVE 16
                              // AXI SLAVE 16 write address channel signals
                              AWID_IS16,
                              AWADDR_IS16,
                              AWLEN_IS16,
                              AWSIZE_IS16,
                              AWBURST_IS16,
                              AWLOCK_IS16,
                              AWCACHE_IS16,
                              AWPROT_IS16,
                              AWVALID_IS16,
                              AWREADY_SI16,
                              // AXI SLAVE 16 write data channel signals
                              WID_IS16,
                              WDATA_IS16,
                              WSTRB_IS16,
                              WLAST_IS16,
                              WVALID_IS16,
                              WREADY_SI16,
                              // AXI SLAVE 16 write response channel signals
                              BID_SI16,
                              BRESP_SI16,
                              BVALID_SI16,
                              BREADY_IS16,
                              // AXI SLAVE 16 read address channel signals
                              ARID_IS16,
                              ARADDR_IS16,
                              ARLEN_IS16,
                              ARSIZE_IS16,
                              ARBURST_IS16,
                              ARLOCK_IS16,
                              ARCACHE_IS16,
                              ARPROT_IS16,
                              ARVALID_IS16,
                              ARREADY_SI16,
                              // AXI SLAVE 16 read response channel signals
                              RID_SI16,
                              RDATA_SI16,
                              RRESP_SI16,
                              RLAST_SI16,
                              RVALID_SI16,
                              RREADY_IS16,
                              
                              m0_rd_end,
                              m1_rd_end,
                              m2_rd_end,
                              m3_rd_end,
                              m0_wr_end,
                              m1_wr_end,
                              m2_wr_end,
                              m3_wr_end,

                              // v3.2 -- For outstanding writes
                              AWREADY_M0,
                              AWREADY_M1,
                              AWREADY_M2,
                              AWREADY_M3,
                              BVALID_M0,
                              BVALID_M1,
                              BVALID_M2,
                              BVALID_M3,
                              BREADY_M0,
                              BREADY_M1,
                              BREADY_M2,
                              BREADY_M3,

                              WVALID_M0,
                              WVALID_M1,
                              WVALID_M2,
                              WVALID_M3,
                              WREADY_M0,
                              WREADY_M1,
                              WREADY_M2,
                              WREADY_M3,
                              WLAST_M0,
                              WLAST_M1,
                              WLAST_M2,
                              WLAST_M3

                              ,AWID_M0  
                              ,AWID_M1
                              ,AWID_M2                              
                              ,AWID_M3

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

   localparam  COMB_REG = {SC_0, SC_1, SC_2, SC_3, SC_4, SC_5, SC_6, SC_7, SC_8, SC_9, SC_10, SC_11, SC_12, SC_13, SC_14, SC_15};
   localparam  AXI_STRBWIDTH              = AXI_DWIDTH/8;
   parameter   BASE_ID_WIDTH              = 2;
   parameter SYNC_RESET           = 0;

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
   
   input [31:0]       ARADDR_M0;
   input [1:0]                  ARLOCK_M0;
   input                        ARVALID_M0;
   input [31:0]       ARADDR_M1;
   input [1:0]                  ARLOCK_M1;
   input                        ARVALID_M1;
   input [31:0]       ARADDR_M2; 
   input [1:0]                  ARLOCK_M2;
   input                        ARVALID_M2;
   input [31:0]       ARADDR_M3;
   input [1:0]                  ARLOCK_M3;
   input                        ARVALID_M3;

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
   // AXI write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_MI0;
   input [AXI_DWIDTH-1:0]        WDATA_MI0;
   input [AXI_STRBWIDTH-1:0]     WSTRB_MI0;
   input                         WLAST_MI0;
   input                         WVALID_MI0;
   output                        WREADY_IM0;
   // AXI write response channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM0;
   output [1:0]                 BRESP_IM0;
   output                       BVALID_IM0;
   input                        BREADY_MI0;
   // AXI read address channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_MI0;
   input [31:0]       ARADDR_MI0;
   input [3:0]                  ARLEN_MI0;
   input [2:0]                  ARSIZE_MI0;
   input [1:0]                  ARBURST_MI0;
   input [1:0]                  ARLOCK_MI0;
   input [3:0]                  ARCACHE_MI0;
   input [2:0]                  ARPROT_MI0;
   input                        ARVALID_MI0;
   output                       ARREADY_IM0;
   // AXI read response channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_IM0;
   output [AXI_DWIDTH-1:0]      RDATA_IM0;
   output [1:0]                 RRESP_IM0;
   output                       RLAST_IM0;
   output                       RVALID_IM0;
   input                        RREADY_MI0;


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
   // AXI write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_MI1;
   input [AXI_DWIDTH-1:0]        WDATA_MI1;
   input [AXI_STRBWIDTH-1:0]     WSTRB_MI1;
   input                         WLAST_MI1;
   input                         WVALID_MI1;
   output                        WREADY_IM1;
   // AXI write response channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM1;
   output [1:0]                 BRESP_IM1;
   output                       BVALID_IM1;
   input                        BREADY_MI1;
   // AXI read address channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_MI1;
   input [31:0]       ARADDR_MI1;
   input [3:0]                  ARLEN_MI1;
   input [2:0]                  ARSIZE_MI1;
   input [1:0]                  ARBURST_MI1;
   input [1:0]                  ARLOCK_MI1;
   input [3:0]                  ARCACHE_MI1;
   input [2:0]                  ARPROT_MI1;
   input                        ARVALID_MI1;
   output                       ARREADY_IM1;
   // AXI read response channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_IM1;
   output [AXI_DWIDTH-1:0]      RDATA_IM1;
   output [1:0]                 RRESP_IM1;
   output                       RLAST_IM1;
   output                       RVALID_IM1;
   input                        RREADY_MI1;

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
   // AXI write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_MI2;
   input [AXI_DWIDTH-1:0]        WDATA_MI2;
   input [AXI_STRBWIDTH-1:0]     WSTRB_MI2;
   input                         WLAST_MI2;
   input                         WVALID_MI2;
   output                        WREADY_IM2;
   // AXI write response channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM2;
   output [1:0]                 BRESP_IM2;
   output                       BVALID_IM2;
   input                        BREADY_MI2;
   // AXI read address channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_MI2;
   input [31:0]       ARADDR_MI2;
   input [3:0]                  ARLEN_MI2;
   input [2:0]                  ARSIZE_MI2;
   input [1:0]                  ARBURST_MI2;
   input [1:0]                  ARLOCK_MI2;
   input [3:0]                  ARCACHE_MI2;
   input [2:0]                  ARPROT_MI2;
   input                        ARVALID_MI2;
   output                       ARREADY_IM2;
   // AXI read response channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_IM2;
   output [AXI_DWIDTH-1:0]      RDATA_IM2;
   output [1:0]                 RRESP_IM2;
   output                       RLAST_IM2;
   output                       RVALID_IM2;
   input                        RREADY_MI2;


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
   // AXI write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_MI3;
   input [AXI_DWIDTH-1:0]        WDATA_MI3;
   input [AXI_STRBWIDTH-1:0]     WSTRB_MI3;
   input                         WLAST_MI3;
   input                         WVALID_MI3;
   output                        WREADY_IM3;
   // AXI write response channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM3;
   output [1:0]                 BRESP_IM3;
   output                       BVALID_IM3;
   input                        BREADY_MI3;
   // AXI read address channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_MI3;
   input [31:0]       ARADDR_MI3;
   input [3:0]                  ARLEN_MI3;
   input [2:0]                  ARSIZE_MI3;
   input [1:0]                  ARBURST_MI3;
   input [1:0]                  ARLOCK_MI3;
   input [3:0]                  ARCACHE_MI3;
   input [2:0]                  ARPROT_MI3;
   input                        ARVALID_MI3;
   output                       ARREADY_IM3;
   // AXI read response channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_IM3;
   output [AXI_DWIDTH-1:0]      RDATA_IM3;
   output [1:0]                 RRESP_IM3;
   output                       RLAST_IM3;
   output                       RVALID_IM3;
   input                        RREADY_MI3;


   // SLAVE 0
   // AXI SLAVE 0 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS0;
   output [31:0]      AWADDR_IS0;
   output [3:0]                 AWLEN_IS0;
   output [2:0]                 AWSIZE_IS0;
   output [1:0]                 AWBURST_IS0;
   output [1:0]                 AWLOCK_IS0;
   output [3:0]                 AWCACHE_IS0;
   output [2:0]                 AWPROT_IS0;
   output                       AWVALID_IS0;
   input                        AWREADY_SI0;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS0;
   output [AXI_DWIDTH-1:0]      WDATA_IS0;
   output [AXI_STRBWIDTH-1:0]   WSTRB_IS0;
   output                       WLAST_IS0;
   output                       WVALID_IS0;
   input                        WREADY_SI0;
   // AXI SLAVE 0 write response channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_SI0;
   input  [1:0]                 BRESP_SI0;
   input                        BVALID_SI0;
   output                       BREADY_IS0;
   // AXI SLAVE 0 read address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS0;
   output [31:0]      ARADDR_IS0;
   output [3:0]                 ARLEN_IS0;
   output [2:0]                 ARSIZE_IS0;
   output [1:0]                 ARBURST_IS0;
   output [1:0]                 ARLOCK_IS0;
   output [3:0]                 ARCACHE_IS0;
   output [2:0]                 ARPROT_IS0;
   output                       ARVALID_IS0;
   input                        ARREADY_SI0;
   // AXI SLAVE 0 read response channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_SI0;
   input  [AXI_DWIDTH-1:0]      RDATA_SI0;
   input  [1:0]                 RRESP_SI0;
   input                        RLAST_SI0;
   input                        RVALID_SI0;
   output                       RREADY_IS0;

   // SLAVE 1
   // AXI SLAVE 1 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS1;
   output [31:0]      AWADDR_IS1;
   output [3:0]                 AWLEN_IS1;
   output [2:0]                 AWSIZE_IS1;
   output [1:0]                 AWBURST_IS1;
   output [1:0]                 AWLOCK_IS1;
   output [3:0]                 AWCACHE_IS1;
   output [2:0]                 AWPROT_IS1;
   output                       AWVALID_IS1;
   input                        AWREADY_SI1;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS1;
   output [AXI_DWIDTH-1:0]      WDATA_IS1;
   output [AXI_STRBWIDTH-1:0]   WSTRB_IS1;
   output                       WLAST_IS1;
   output                       WVALID_IS1;
   input                        WREADY_SI1;
   // AXI SLAVE 0 write response channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_SI1;
   input  [1:0]                 BRESP_SI1;
   input                        BVALID_SI1;
   output                       BREADY_IS1;
   // AXI SLAVE 0 read address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS1;
   output [31:0]      ARADDR_IS1;
   output [3:0]                 ARLEN_IS1;
   output [2:0]                 ARSIZE_IS1;
   output [1:0]                 ARBURST_IS1;
   output [1:0]                 ARLOCK_IS1;
   output [3:0]                 ARCACHE_IS1;
   output [2:0]                 ARPROT_IS1;
   output                       ARVALID_IS1;
   input                        ARREADY_SI1;
   // AXI SLAVE 0 read response channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_SI1;
   input [AXI_DWIDTH-1:0]               RDATA_SI1;
   input [1:0]                          RRESP_SI1;
   input                                RLAST_SI1;
   input                                RVALID_SI1;
   output                               RREADY_IS1;

    // SLAVE 2
    // AXI SLAVE 2 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS2;
   output [31:0]      AWADDR_IS2;
   output [3:0]                 AWLEN_IS2;
   output [2:0]                 AWSIZE_IS2;
   output [1:0]                 AWBURST_IS2;
   output [1:0]                 AWLOCK_IS2;
   output [3:0]                 AWCACHE_IS2;
   output [2:0]                 AWPROT_IS2;
   output                       AWVALID_IS2;
   input                        AWREADY_SI2;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS2;
   output [AXI_DWIDTH-1:0]      WDATA_IS2;
   output [AXI_STRBWIDTH-1:0]   WSTRB_IS2;
   output                       WLAST_IS2;
   output                       WVALID_IS2;
   input                        WREADY_SI2;
   // AXI SLAVE 0 write response channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_SI2;
   input  [1:0]                 BRESP_SI2;
   input                        BVALID_SI2;
   output                       BREADY_IS2;
   // AXI SLAVE 0 read address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS2;
   output [31:0]      ARADDR_IS2;
   output [3:0]                 ARLEN_IS2;
   output [2:0]                 ARSIZE_IS2;
   output [1:0]                 ARBURST_IS2;
   output [1:0]                 ARLOCK_IS2;
   output [3:0]                 ARCACHE_IS2;
   output [2:0]                 ARPROT_IS2;
   output                       ARVALID_IS2;
   input                        ARREADY_SI2;
   // AXI SLAVE 0 read response channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_SI2;
   input  [AXI_DWIDTH-1:0]      RDATA_SI2;
   input  [1:0]                 RRESP_SI2;
   input                        RLAST_SI2;
   input                        RVALID_SI2;
   output                       RREADY_IS2;

   // SLAVE 3
   // AXI SLAVE 3 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS3;
   output [31:0]      AWADDR_IS3;
   output [3:0]                 AWLEN_IS3;
   output [2:0]                 AWSIZE_IS3;
   output [1:0]                 AWBURST_IS3;
   output [1:0]                 AWLOCK_IS3;
   output [3:0]                 AWCACHE_IS3;
   output [2:0]                 AWPROT_IS3;
   output                       AWVALID_IS3;
   input                        AWREADY_SI3;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS3;
   output [AXI_DWIDTH-1:0]      WDATA_IS3;
   output [AXI_STRBWIDTH-1:0]   WSTRB_IS3;
   output                       WLAST_IS3;
   output                       WVALID_IS3;
   input                        WREADY_SI3;
   // AXI SLAVE 0 write response channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_SI3;
   input  [1:0]                 BRESP_SI3;
   input                        BVALID_SI3;
   output                       BREADY_IS3;
   // AXI SLAVE 0 read address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS3;
   output [31:0]      ARADDR_IS3;
   output [3:0]                 ARLEN_IS3;
   output [2:0]                 ARSIZE_IS3;
   output [1:0]                 ARBURST_IS3;
   output [1:0]                 ARLOCK_IS3;
   output [3:0]                 ARCACHE_IS3;
   output [2:0]                 ARPROT_IS3;
   output                       ARVALID_IS3;
   input                        ARREADY_SI3;
   // AXI SLAVE 0 read response channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_SI3;
   input  [AXI_DWIDTH-1:0]      RDATA_SI3;
   input  [1:0]                 RRESP_SI3;
   input                        RLAST_SI3;
   input                        RVALID_SI3;
   output                       RREADY_IS3;

   // SLAVE 4
   // AXI SLAVE 4 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS4;
   output [31:0]      AWADDR_IS4;
   output [3:0]                 AWLEN_IS4;
   output [2:0]                 AWSIZE_IS4;
   output [1:0]                 AWBURST_IS4;
   output [1:0]                 AWLOCK_IS4;
   output [3:0]                 AWCACHE_IS4;
   output [2:0]                 AWPROT_IS4;
   output                       AWVALID_IS4;
   input                        AWREADY_SI4;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS4;
   output [AXI_DWIDTH-1:0]      WDATA_IS4;
   output [AXI_STRBWIDTH-1:0]   WSTRB_IS4;
   output                       WLAST_IS4;
   output                       WVALID_IS4;
   input                        WREADY_SI4;
   // AXI SLAVE 0 write response channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_SI4;
   input  [1:0]                 BRESP_SI4;
   input                        BVALID_SI4;
   output                       BREADY_IS4;
   // AXI SLAVE 0 read address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS4;
   output [31:0]      ARADDR_IS4;
   output [3:0]                 ARLEN_IS4;
   output [2:0]                 ARSIZE_IS4;
   output [1:0]                 ARBURST_IS4;
   output [1:0]                 ARLOCK_IS4;
   output [3:0]                 ARCACHE_IS4;
   output [2:0]                 ARPROT_IS4;
   output                       ARVALID_IS4;
   input                        ARREADY_SI4;
   // AXI SLAVE 0 read response channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_SI4;
   input  [AXI_DWIDTH-1:0]      RDATA_SI4;
   input  [1:0]                 RRESP_SI4;
   input                        RLAST_SI4;
   input                        RVALID_SI4;
   output                       RREADY_IS4;

   // SLAVE 5
   // AXI SLAVE 5 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS5;
   output [31:0]      AWADDR_IS5;
   output [3:0]                 AWLEN_IS5;
   output [2:0]                 AWSIZE_IS5;
   output [1:0]                 AWBURST_IS5;
   output [1:0]                 AWLOCK_IS5;
   output [3:0]                 AWCACHE_IS5;
   output [2:0]                 AWPROT_IS5;
   output                       AWVALID_IS5;
   input                        AWREADY_SI5;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS5;
   output [AXI_DWIDTH-1:0]      WDATA_IS5;
   output [AXI_STRBWIDTH-1:0]   WSTRB_IS5;
   output                       WLAST_IS5;
   output                       WVALID_IS5;
   input                        WREADY_SI5;
   // AXI SLAVE 0 write response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI5;
   input  [1:0]                 BRESP_SI5;
   input                        BVALID_SI5;
   output                       BREADY_IS5;
   // AXI SLAVE 0 read address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS5;
   output [31:0]      ARADDR_IS5;
   output [3:0]                 ARLEN_IS5;
   output [2:0]                 ARSIZE_IS5;
   output [1:0]                 ARBURST_IS5;
   output [1:0]                 ARLOCK_IS5;
   output [3:0]                 ARCACHE_IS5;
   output [2:0]                 ARPROT_IS5;
   output                       ARVALID_IS5;
   input                        ARREADY_SI5;
   // AXI SLAVE 0 read response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI5;
   input  [AXI_DWIDTH-1:0]      RDATA_SI5;
   input  [1:0]                 RRESP_SI5;
   input                        RLAST_SI5;
   input                        RVALID_SI5;
   output                       RREADY_IS5;

   // SLAVE 6
   // AXI SLAVE 6 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS6;
   output [31:0]      AWADDR_IS6;
   output [3:0]                 AWLEN_IS6;
   output [2:0]                 AWSIZE_IS6;
   output [1:0]                 AWBURST_IS6;
   output [1:0]                 AWLOCK_IS6;
   output [3:0]                 AWCACHE_IS6;
   output [2:0]                 AWPROT_IS6;
   output                       AWVALID_IS6;
   input                        AWREADY_SI6;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS6;
   output [AXI_DWIDTH-1:0]      WDATA_IS6;
   output [AXI_STRBWIDTH-1:0]   WSTRB_IS6;
   output                       WLAST_IS6;
   output                       WVALID_IS6;
   input                        WREADY_SI6;
   // AXI SLAVE 0 write response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI6;
   input  [1:0]                 BRESP_SI6;
   input                        BVALID_SI6;
   output                       BREADY_IS6;
   // AXI SLAVE 0 read address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS6;
   output [31:0]      ARADDR_IS6;
   output [3:0]                 ARLEN_IS6;
   output [2:0]                 ARSIZE_IS6;
   output [1:0]                 ARBURST_IS6;
   output [1:0]                 ARLOCK_IS6;
   output [3:0]                 ARCACHE_IS6;
   output [2:0]                 ARPROT_IS6;
   output                       ARVALID_IS6;
   input                        ARREADY_SI6;
   // AXI SLAVE 0 read response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI6;
   input  [AXI_DWIDTH-1:0]      RDATA_SI6;
   input  [1:0]                 RRESP_SI6;
   input                        RLAST_SI6;
   input                        RVALID_SI6;
   output                       RREADY_IS6;

   // SLAVE 7
   // AXI SLAVE 7 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS7;
   output [31:0]      AWADDR_IS7;
   output [3:0]                 AWLEN_IS7;
   output [2:0]                 AWSIZE_IS7;
   output [1:0]                 AWBURST_IS7;
   output [1:0]                 AWLOCK_IS7;
   output [3:0]                 AWCACHE_IS7;
   output [2:0]                 AWPROT_IS7;
   output                       AWVALID_IS7;
   input                        AWREADY_SI7;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS7;
   output [AXI_DWIDTH-1:0]      WDATA_IS7;
   output [AXI_STRBWIDTH-1:0]   WSTRB_IS7;
   output                       WLAST_IS7;
   output                       WVALID_IS7;
   input                        WREADY_SI7;
   // AXI SLAVE 0 write response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI7;
   input  [1:0]                 BRESP_SI7;
   input                        BVALID_SI7;
   output                       BREADY_IS7;
   // AXI SLAVE 0 read address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS7;
   output [31:0]      ARADDR_IS7;
   output [3:0]                 ARLEN_IS7;
   output [2:0]                 ARSIZE_IS7;
   output [1:0]                 ARBURST_IS7;
   output [1:0]                 ARLOCK_IS7;
   output [3:0]                 ARCACHE_IS7;
   output [2:0]                 ARPROT_IS7;
   output                       ARVALID_IS7;
   input                        ARREADY_SI7;
   // AXI SLAVE 0 read response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI7;
   input  [AXI_DWIDTH-1:0]      RDATA_SI7;
   input  [1:0]                 RRESP_SI7;
   input                        RLAST_SI7;
   input                        RVALID_SI7;
   output                       RREADY_IS7;

   // SLAVE 8
   // AXI SLAVE 8 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS8;
   output [31:0]      AWADDR_IS8;
   output [3:0]                 AWLEN_IS8;
   output [2:0]                 AWSIZE_IS8;
   output [1:0]                 AWBURST_IS8;
   output [1:0]                 AWLOCK_IS8;
   output [3:0]                 AWCACHE_IS8;
   output [2:0]                 AWPROT_IS8;
   output                       AWVALID_IS8;
   input                        AWREADY_SI8;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS8;
   output [AXI_DWIDTH-1:0]      WDATA_IS8;
   output [AXI_STRBWIDTH-1:0]   WSTRB_IS8;
   output                       WLAST_IS8;
   output                       WVALID_IS8;
   input                        WREADY_SI8;
   // AXI SLAVE 0 write response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI8;
   input  [1:0]                 BRESP_SI8;
   input                        BVALID_SI8;
   output                       BREADY_IS8;
   // AXI SLAVE 0 read address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS8;
   output [31:0]      ARADDR_IS8;
   output [3:0]                 ARLEN_IS8;
   output [2:0]                 ARSIZE_IS8;
   output [1:0]                 ARBURST_IS8;
   output [1:0]                 ARLOCK_IS8;
   output [3:0]                 ARCACHE_IS8;
   output [2:0]                 ARPROT_IS8;
   output                       ARVALID_IS8;
   input                        ARREADY_SI8;
   // AXI SLAVE 0 read response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI8;
   input  [AXI_DWIDTH-1:0]      RDATA_SI8;
   input  [1:0]                 RRESP_SI8;
   input                        RLAST_SI8;
   input                        RVALID_SI8;
   output                       RREADY_IS8;

   // SLAVE 9
   // AXI SLAVE 9 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS9;
   output [31:0]      AWADDR_IS9;
   output [3:0]                 AWLEN_IS9;
   output [2:0]                 AWSIZE_IS9;
   output [1:0]                 AWBURST_IS9;
   output [1:0]                 AWLOCK_IS9;
   output [3:0]                 AWCACHE_IS9;
   output [2:0]                 AWPROT_IS9;
   output                       AWVALID_IS9;
   input                        AWREADY_SI9;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS9;
   output [AXI_DWIDTH-1:0]      WDATA_IS9;
   output [AXI_STRBWIDTH-1:0]   WSTRB_IS9;
   output                       WLAST_IS9;
   output                       WVALID_IS9;
   input                        WREADY_SI9;
   // AXI SLAVE 0 write response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI9;
   input  [1:0]                 BRESP_SI9;
   input                        BVALID_SI9;
   output                       BREADY_IS9;
   // AXI SLAVE 0 read address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS9;
   output [31:0]      ARADDR_IS9;
   output [3:0]                 ARLEN_IS9;
   output [2:0]                 ARSIZE_IS9;
   output [1:0]                 ARBURST_IS9;
   output [1:0]                 ARLOCK_IS9;
   output [3:0]                 ARCACHE_IS9;
   output [2:0]                 ARPROT_IS9;
   output                       ARVALID_IS9;
   input                        ARREADY_SI9;
   // AXI SLAVE 0 read response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI9;
   input  [AXI_DWIDTH-1:0]      RDATA_SI9;
   input  [1:0]                 RRESP_SI9;
   input                        RLAST_SI9;
   input                        RVALID_SI9;
   output                       RREADY_IS9;

   // SLAVE 10
   // AXI SLAVE 10 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS10;
   output [31:0]      AWADDR_IS10;
   output [3:0]                 AWLEN_IS10;
   output [2:0]                 AWSIZE_IS10;
   output [1:0]                 AWBURST_IS10;
   output [1:0]                 AWLOCK_IS10;
   output [3:0]                 AWCACHE_IS10;
   output [2:0]                 AWPROT_IS10;
   output                       AWVALID_IS10;
   input                        AWREADY_SI10;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS10;
   output [AXI_DWIDTH-1:0]      WDATA_IS10;
   output [AXI_STRBWIDTH-1:0]   WSTRB_IS10;
   output                       WLAST_IS10;
   output                       WVALID_IS10;
   input                        WREADY_SI10;
   // AXI SLAVE 0 write response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI10;
   input  [1:0]                 BRESP_SI10;
   input                        BVALID_SI10;
   output                       BREADY_IS10;
   // AXI SLAVE 0 read address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS10;
   output [31:0]      ARADDR_IS10;
   output [3:0]                 ARLEN_IS10;
   output [2:0]                 ARSIZE_IS10;
   output [1:0]                 ARBURST_IS10;
   output [1:0]                 ARLOCK_IS10;
   output [3:0]                 ARCACHE_IS10;
   output [2:0]                 ARPROT_IS10;
   output                       ARVALID_IS10;
   input                        ARREADY_SI10;
   // AXI SLAVE 0 read response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI10;
   input  [AXI_DWIDTH-1:0]      RDATA_SI10;
   input  [1:0]                 RRESP_SI10;
   input                        RLAST_SI10;
   input                        RVALID_SI10;
   output                       RREADY_IS10;

   // SLAVE 11
   // AXI SLAVE 11 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS11;
   output [31:0]      AWADDR_IS11;
   output [3:0]                 AWLEN_IS11;
   output [2:0]                 AWSIZE_IS11;
   output [1:0]                 AWBURST_IS11;
   output [1:0]                 AWLOCK_IS11;
   output [3:0]                 AWCACHE_IS11;
   output [2:0]                 AWPROT_IS11;
   output                       AWVALID_IS11;
   input                        AWREADY_SI11;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS11;
   output [AXI_DWIDTH-1:0]      WDATA_IS11;
   output [AXI_STRBWIDTH-1:0]   WSTRB_IS11;
   output                       WLAST_IS11;
   output                       WVALID_IS11;
   input                        WREADY_SI11;
   // AXI SLAVE 0 write response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI11;
   input  [1:0]                 BRESP_SI11;
   input                        BVALID_SI11;
   output                       BREADY_IS11;
   // AXI SLAVE 0 read address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS11;
   output [31:0]      ARADDR_IS11;
   output [3:0]                 ARLEN_IS11;
   output [2:0]                 ARSIZE_IS11;
   output [1:0]                 ARBURST_IS11;
   output [1:0]                 ARLOCK_IS11;
   output [3:0]                 ARCACHE_IS11;
   output [2:0]                 ARPROT_IS11;
   output                       ARVALID_IS11;
   input                        ARREADY_SI11;
   // AXI SLAVE 0 read response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI11;
   input  [AXI_DWIDTH-1:0]      RDATA_SI11;
   input  [1:0]                 RRESP_SI11;
   input                        RLAST_SI11;
   input                        RVALID_SI11;
   output                       RREADY_IS11;

   // SLAVE 12
   // AXI SLAVE 12 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS12;
   output [31:0]      AWADDR_IS12;
   output [3:0]                 AWLEN_IS12;
   output [2:0]                 AWSIZE_IS12;
   output [1:0]                 AWBURST_IS12;
   output [1:0]                 AWLOCK_IS12;
   output [3:0]                 AWCACHE_IS12;
   output [2:0]                 AWPROT_IS12;
   output                       AWVALID_IS12;
   input                        AWREADY_SI12;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS12;
   output [AXI_DWIDTH-1:0]      WDATA_IS12;
   output [AXI_STRBWIDTH-1:0]   WSTRB_IS12;
   output                       WLAST_IS12;
   output                       WVALID_IS12;
   input                        WREADY_SI12;
   // AXI SLAVE 0 write response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI12;
   input  [1:0]                 BRESP_SI12;
   input                        BVALID_SI12;
   output                       BREADY_IS12;
   // AXI SLAVE 0 read address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS12;
   output [31:0]      ARADDR_IS12;
   output [3:0]                 ARLEN_IS12;
   output [2:0]                 ARSIZE_IS12;
   output [1:0]                 ARBURST_IS12;
   output [1:0]                 ARLOCK_IS12;
   output [3:0]                 ARCACHE_IS12;
   output [2:0]                 ARPROT_IS12;
   output                       ARVALID_IS12;
   input                        ARREADY_SI12;
   // AXI SLAVE 0 read response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI12;
   input  [AXI_DWIDTH-1:0]      RDATA_SI12;
   input  [1:0]                 RRESP_SI12;
   input                        RLAST_SI12;
   input                        RVALID_SI12;
   output                       RREADY_IS12;

   // SLAVE 13
   // AXI SLAVE 13 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS13;
   output [31:0]      AWADDR_IS13;
   output [3:0]                 AWLEN_IS13;
   output [2:0]                 AWSIZE_IS13;
   output [1:0]                 AWBURST_IS13;
   output [1:0]                 AWLOCK_IS13;
   output [3:0]                 AWCACHE_IS13;
   output [2:0]                 AWPROT_IS13;
   output                       AWVALID_IS13;
   input                        AWREADY_SI13;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS13;
   output [AXI_DWIDTH-1:0]      WDATA_IS13;
   output [AXI_STRBWIDTH-1:0]   WSTRB_IS13;
   output                       WLAST_IS13;
   output                       WVALID_IS13;
   input                        WREADY_SI13;
   // AXI SLAVE 0 write response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI13;
   input  [1:0]                 BRESP_SI13;
   input                        BVALID_SI13;
   output                       BREADY_IS13;
   // AXI SLAVE 0 read address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS13;
   output [31:0]      ARADDR_IS13;
   output [3:0]                 ARLEN_IS13;
   output [2:0]                 ARSIZE_IS13;
   output [1:0]                 ARBURST_IS13;
   output [1:0]                 ARLOCK_IS13;
   output [3:0]                 ARCACHE_IS13;
   output [2:0]                 ARPROT_IS13;
   output                       ARVALID_IS13;
   input                        ARREADY_SI13;
   // AXI SLAVE 0 read response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_SI13;
   input  [AXI_DWIDTH-1:0]      RDATA_SI13;
   input  [1:0]                 RRESP_SI13;
   input                        RLAST_SI13;
   input                        RVALID_SI13;
   output                       RREADY_IS13;

   // SLAVE 14
   // AXI SLAVE 14 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_IS14;
   output [31:0]      AWADDR_IS14;
   output [3:0]                 AWLEN_IS14;
   output [2:0]                 AWSIZE_IS14;
   output [1:0]                 AWBURST_IS14;
   output [1:0]                 AWLOCK_IS14;
   output [3:0]                 AWCACHE_IS14;
   output [2:0]                 AWPROT_IS14;
   output                       AWVALID_IS14;
   input                        AWREADY_SI14;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_IS14;
   output [AXI_DWIDTH-1:0]      WDATA_IS14;
   output [AXI_STRBWIDTH-1:0]   WSTRB_IS14;
   output                       WLAST_IS14;
   output                       WVALID_IS14;
   input                        WREADY_SI14;
   // AXI SLAVE 0 write response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_SI14;
   input  [1:0]                 BRESP_SI14;
   input                        BVALID_SI14;
   output                       BREADY_IS14;
   // AXI SLAVE 0 read address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_IS14;
   output [31:0]      ARADDR_IS14;
   output [3:0]                 ARLEN_IS14;
   output [2:0]                 ARSIZE_IS14;
   output [1:0]                 ARBURST_IS14;
   output [1:0]                 ARLOCK_IS14;
   output [3:0]                 ARCACHE_IS14;
   output [2:0]                 ARPROT_IS14;
   output                       ARVALID_IS14;
   input                        ARREADY_SI14;
   // AXI SLAVE 0 read response channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_SI14;
   input  [AXI_DWIDTH-1:0]      RDATA_SI14;
   input  [1:0]                 RRESP_SI14;
   input                        RLAST_SI14;
   input                        RVALID_SI14;
   output                       RREADY_IS14;

   // SLAVE 15
   // AXI SLAVE 15 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS15;
   output [31:0]      AWADDR_IS15;
   output [3:0]                 AWLEN_IS15;
   output [2:0]                 AWSIZE_IS15;
   output [1:0]                 AWBURST_IS15;
   output [1:0]                 AWLOCK_IS15;
   output [3:0]                 AWCACHE_IS15;
   output [2:0]                 AWPROT_IS15;
   output                       AWVALID_IS15;
   input                        AWREADY_SI15;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS15;
   output [AXI_DWIDTH-1:0]      WDATA_IS15;
   output [AXI_STRBWIDTH-1:0]   WSTRB_IS15;
   output                       WLAST_IS15;
   output                       WVALID_IS15;
   input                        WREADY_SI15;
   // AXI SLAVE 0 write response channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_SI15;
   input  [1:0]                 BRESP_SI15;
   input                        BVALID_SI15;
   output                       BREADY_IS15;
   // AXI SLAVE 0 read address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS15;
   output [31:0]      ARADDR_IS15;
   output [3:0]                 ARLEN_IS15;
   output [2:0]                 ARSIZE_IS15;
   output [1:0]                 ARBURST_IS15;
   output [1:0]                 ARLOCK_IS15;
   output [3:0]                 ARCACHE_IS15;
   output [2:0]                 ARPROT_IS15;
   output                       ARVALID_IS15;
   input                        ARREADY_SI15;
   // AXI SLAVE 0 read response channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_SI15;
   input  [AXI_DWIDTH-1:0]      RDATA_SI15;
   input  [1:0]                 RRESP_SI15;
   input                        RLAST_SI15;
   input                        RVALID_SI15;
   output                       RREADY_IS15;

   // SLAVE 16
   // AXI SLAVE 16 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS16;
   output [31:0]      AWADDR_IS16;
   output [3:0]                 AWLEN_IS16;
   output [2:0]                 AWSIZE_IS16;
   output [1:0]                 AWBURST_IS16;
   output [1:0]                 AWLOCK_IS16;
   output [3:0]                 AWCACHE_IS16;
   output [2:0]                 AWPROT_IS16;
   output                       AWVALID_IS16;
   input                        AWREADY_SI16;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS16;
   output [AXI_DWIDTH-1:0]      WDATA_IS16;
   output [AXI_STRBWIDTH-1:0]   WSTRB_IS16;
   output                       WLAST_IS16;
   output                       WVALID_IS16;
   input                        WREADY_SI16;
   // AXI SLAVE 0 write response channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_SI16;
   input  [1:0]                 BRESP_SI16;
   input                        BVALID_SI16;
   output                       BREADY_IS16;
   // AXI SLAVE 0 read address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS16;
   output [31:0]      ARADDR_IS16;
   output [3:0]                 ARLEN_IS16;
   output [2:0]                 ARSIZE_IS16;
   output [1:0]                 ARBURST_IS16;
   output [1:0]                 ARLOCK_IS16;
   output [3:0]                 ARCACHE_IS16;
   output [2:0]                 ARPROT_IS16;
   output                       ARVALID_IS16;
   input                        ARREADY_SI16;
   // AXI SLAVE 0 read response channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_SI16;
   input  [AXI_DWIDTH-1:0]      RDATA_SI16;
   input  [1:0]                 RRESP_SI16;
   input                        RLAST_SI16;
   input                        RVALID_SI16;
   output                       RREADY_IS16;

   // For Arbiter from Masters
   // To end grant to current master
   input                   m0_rd_end;
   input                   m1_rd_end;
   input                   m2_rd_end;
   input                   m3_rd_end;
   input                   m0_wr_end;
   input                   m1_wr_end;
   input                   m2_wr_end;
   input                   m3_wr_end;

   // v3.2
   input                   BVALID_M0;
   input                   BVALID_M1;
   input                   BVALID_M2;
   input                   BVALID_M3;
   input                   BREADY_M0;
   input                   BREADY_M1;
   input                   BREADY_M2;
   input                   BREADY_M3;
   input                   AWREADY_M0;
   input                   AWREADY_M1;
   input                   AWREADY_M2;
   input                   AWREADY_M3;
   // --
   input                   WVALID_M0;
   input                   WVALID_M1;
   input                   WVALID_M2;
   input                   WVALID_M3;
   input                   WREADY_M0;
   input                   WREADY_M1;
   input                   WREADY_M2;
   input                   WREADY_M3;
   input                   WLAST_M0;
   input                   WLAST_M1;
   input                   WLAST_M2;
   input                   WLAST_M3;

   input [ID_WIDTH-1:0]    AWID_M0;
   input [ID_WIDTH-1:0]    AWID_M1;
   input [ID_WIDTH-1:0]    AWID_M2;   
   input [ID_WIDTH-1:0]    AWID_M3;

   input                        mst_rd_inprog0;
   input                        mst_rd_inprog1;
   input                        mst_rd_inprog2;
   input                        mst_rd_inprog3;
   input                        mst_wr_inprog0;                                 
   input                        mst_wr_inprog1;                                 
   input                        mst_wr_inprog2;                                 
   input                        mst_wr_inprog3;                                 
   
   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------
   reg                           AWVALID_M0_r;
   reg [31:0]          AWADDR_M0_r;
   reg                           AWVALID_M1_r;
   reg [31:0]          AWADDR_M1_r;
   reg                           AWVALID_M2_r;
   reg [31:0]          AWADDR_M2_r;
   reg                           AWVALID_M3_r;
   reg [31:0]          AWADDR_M3_r;

   reg                            AWREADY_IM;
   reg                            ARREADY_IM;
   reg                            WREADY_IM;
   reg                            WREADY_IM_int;
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM_int;
   reg                                BVALID_IM_int;
   reg [1:0]                          BRESP_IM_int;
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_IM_int;
   reg [AXI_DWIDTH - 1:0]             RDATA_IM_int;
   reg                                RLAST_IM_int;
   reg                                RVALID_IM_int;
   reg [1:0]                          RRESP_IM_int;

                                      
   reg [1:0]                          BRESP_IM;
   reg                                BVALID_IM;
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM;

   reg                                BREADY_IS0;
   reg                                BREADY_IS1;
   reg                                BREADY_IS2;
   reg                                BREADY_IS3;
   reg                                BREADY_IS4;
   reg                                BREADY_IS5;
   reg                                BREADY_IS6;
   reg                                BREADY_IS7;
   reg                                BREADY_IS8;
   reg                                BREADY_IS9;
   reg                                BREADY_IS10;
   reg                                BREADY_IS11;
   reg                                BREADY_IS12;
   reg                                BREADY_IS13;
   reg                                BREADY_IS14;
   reg                                BREADY_IS15;
   reg                                BREADY_IS16;
   
   reg                                RREADY_IS0;
   reg                                RREADY_IS1;
   reg                                RREADY_IS2;
   reg                                RREADY_IS3;
   reg                                RREADY_IS4;
   reg                                RREADY_IS5;
   reg                                RREADY_IS6;
   reg                                RREADY_IS7;
   reg                                RREADY_IS8;
   reg                                RREADY_IS9;
   reg                                RREADY_IS10;
   reg                                RREADY_IS11;
   reg                                RREADY_IS12;
   reg                                RREADY_IS13;
   reg                                RREADY_IS14;
   reg                                RREADY_IS15;
   reg                                RREADY_IS16;
   
   wire                                RREADY_M0IS0;
   wire                                RREADY_M0IS1;
   wire                                RREADY_M0IS2;
   wire                                RREADY_M0IS3;
   wire                                RREADY_M0IS4;
   wire                                RREADY_M0IS5;
   wire                                RREADY_M0IS6;
   wire                                RREADY_M0IS7;
   wire                                RREADY_M0IS8;
   wire                                RREADY_M0IS9;
   wire                                RREADY_M0IS10;
   wire                                RREADY_M0IS11;
   wire                                RREADY_M0IS12;
   wire                                RREADY_M0IS13;
   wire                                RREADY_M0IS14;
   wire                                RREADY_M0IS15;
   wire                                RREADY_M0IS16;

   wire                                RREADY_M1IS0;
   wire                                RREADY_M1IS1;
   wire                                RREADY_M1IS2;
   wire                                RREADY_M1IS3;
   wire                                RREADY_M1IS4;
   wire                                RREADY_M1IS5;
   wire                                RREADY_M1IS6;
   wire                                RREADY_M1IS7;
   wire                                RREADY_M1IS8;
   wire                                RREADY_M1IS9;
   wire                                RREADY_M1IS10;
   wire                                RREADY_M1IS11;
   wire                                RREADY_M1IS12;
   wire                                RREADY_M1IS13;
   wire                                RREADY_M1IS14;
   wire                                RREADY_M1IS15;
   wire                                RREADY_M1IS16;

   wire                                RREADY_M2IS0;
   wire                                RREADY_M2IS1;
   wire                                RREADY_M2IS2;
   wire                                RREADY_M2IS3;
   wire                                RREADY_M2IS4;
   wire                                RREADY_M2IS5;
   wire                                RREADY_M2IS6;
   wire                                RREADY_M2IS7;
   wire                                RREADY_M2IS8;
   wire                                RREADY_M2IS9;
   wire                                RREADY_M2IS10;
   wire                                RREADY_M2IS11;
   wire                                RREADY_M2IS12;
   wire                                RREADY_M2IS13;
   wire                                RREADY_M2IS14;
   wire                                RREADY_M2IS15;
   wire                                RREADY_M2IS16;

   wire                                RREADY_M3IS0;
   wire                                RREADY_M3IS1;
   wire                                RREADY_M3IS2;
   wire                                RREADY_M3IS3;
   wire                                RREADY_M3IS4;
   wire                                RREADY_M3IS5;
   wire                                RREADY_M3IS6;
   wire                                RREADY_M3IS7;
   wire                                RREADY_M3IS8;
   wire                                RREADY_M3IS9;
   wire                                RREADY_M3IS10;
   wire                                RREADY_M3IS11;
   wire                                RREADY_M3IS12;
   wire                                RREADY_M3IS13;
   wire                                RREADY_M3IS14;
   wire                                RREADY_M3IS15;
   wire                                RREADY_M3IS16;


   wire                                BREADY_M0IS0;
   wire                                BREADY_M0IS1;
   wire                                BREADY_M0IS2;
   wire                                BREADY_M0IS3;
   wire                                BREADY_M0IS4;
   wire                                BREADY_M0IS5;
   wire                                BREADY_M0IS6;
   wire                                BREADY_M0IS7;
   wire                                BREADY_M0IS8;
   wire                                BREADY_M0IS9;
   wire                                BREADY_M0IS10;
   wire                                BREADY_M0IS11;
   wire                                BREADY_M0IS12;
   wire                                BREADY_M0IS13;
   wire                                BREADY_M0IS14;
   wire                                BREADY_M0IS15;
   wire                                BREADY_M0IS16;

   wire                                BREADY_M1IS0;
   wire                                BREADY_M1IS1;
   wire                                BREADY_M1IS2;
   wire                                BREADY_M1IS3;
   wire                                BREADY_M1IS4;
   wire                                BREADY_M1IS5;
   wire                                BREADY_M1IS6;
   wire                                BREADY_M1IS7;
   wire                                BREADY_M1IS8;
   wire                                BREADY_M1IS9;
   wire                                BREADY_M1IS10;
   wire                                BREADY_M1IS11;
   wire                                BREADY_M1IS12;
   wire                                BREADY_M1IS13;
   wire                                BREADY_M1IS14;
   wire                                BREADY_M1IS15;
   wire                                BREADY_M1IS16;

   wire                                BREADY_M2IS0;
   wire                                BREADY_M2IS1;
   wire                                BREADY_M2IS2;
   wire                                BREADY_M2IS3;
   wire                                BREADY_M2IS4;
   wire                                BREADY_M2IS5;
   wire                                BREADY_M2IS6;
   wire                                BREADY_M2IS7;
   wire                                BREADY_M2IS8;
   wire                                BREADY_M2IS9;
   wire                                BREADY_M2IS10;
   wire                                BREADY_M2IS11;
   wire                                BREADY_M2IS12;
   wire                                BREADY_M2IS13;
   wire                                BREADY_M2IS14;
   wire                                BREADY_M2IS15;
   wire                                BREADY_M2IS16;

   wire                                BREADY_M3IS0;
   wire                                BREADY_M3IS1;
   wire                                BREADY_M3IS2;
   wire                                BREADY_M3IS3;
   wire                                BREADY_M3IS4;
   wire                                BREADY_M3IS5;
   wire                                BREADY_M3IS6;
   wire                                BREADY_M3IS7;
   wire                                BREADY_M3IS8;
   wire                                BREADY_M3IS9;
   wire                                BREADY_M3IS10;
   wire                                BREADY_M3IS11;
   wire                                BREADY_M3IS12;
   wire                                BREADY_M3IS13;
   wire                                BREADY_M3IS14;
   wire                                BREADY_M3IS15;
   wire                                BREADY_M3IS16;

   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS0;
   reg [31:0]               AWADDR_IS0;
   reg [3:0]                          AWLEN_IS0;
   reg [2:0]                          AWSIZE_IS0;
   reg [1:0]                          AWBURST_IS0;
   reg [1:0]                          AWLOCK_IS0;
   reg [3:0]                          AWCACHE_IS0;
   reg [2:0]                          AWPROT_IS0;
   reg                                AWVALID_IS0;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS1;
   reg [31:0]               AWADDR_IS1;
   reg [3:0]                          AWLEN_IS1;
   reg [2:0]                          AWSIZE_IS1;
   reg [1:0]                          AWBURST_IS1;
   reg [1:0]                          AWLOCK_IS1;
   reg [3:0]                          AWCACHE_IS1;
   reg [2:0]                          AWPROT_IS1;
   reg                                AWVALID_IS1;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS2;
   reg [31:0]               AWADDR_IS2;
   reg [3:0]                          AWLEN_IS2;
   reg [2:0]                          AWSIZE_IS2;
   reg [1:0]                          AWBURST_IS2;
   reg [1:0]                          AWLOCK_IS2;
   reg [3:0]                          AWCACHE_IS2;
   reg [2:0]                          AWPROT_IS2;
   reg                                AWVALID_IS2;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS3;
   reg [31:0]               AWADDR_IS3;
   reg [3:0]                          AWLEN_IS3;
   reg [2:0]                          AWSIZE_IS3;
   reg [1:0]                          AWBURST_IS3;
   reg [1:0]                          AWLOCK_IS3;
   reg [3:0]                          AWCACHE_IS3;
   reg [2:0]                          AWPROT_IS3;
   reg                                AWVALID_IS3;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS4;
   reg [31:0]               AWADDR_IS4;
   reg [3:0]                          AWLEN_IS4;
   reg [2:0]                          AWSIZE_IS4;
   reg [1:0]                          AWBURST_IS4;
   reg [1:0]                          AWLOCK_IS4;
   reg [3:0]                          AWCACHE_IS4;
   reg [2:0]                          AWPROT_IS4;
   reg                                AWVALID_IS4;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS5;
   reg [31:0]               AWADDR_IS5;
   reg [3:0]                          AWLEN_IS5;
   reg [2:0]                          AWSIZE_IS5;
   reg [1:0]                          AWBURST_IS5;
   reg [1:0]                          AWLOCK_IS5;
   reg [3:0]                          AWCACHE_IS5;
   reg [2:0]                          AWPROT_IS5;
   reg                                AWVALID_IS5;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS6;
   reg [31:0]               AWADDR_IS6;
   reg [3:0]                          AWLEN_IS6;
   reg [2:0]                          AWSIZE_IS6;
   reg [1:0]                          AWBURST_IS6;
   reg [1:0]                          AWLOCK_IS6;
   reg [3:0]                          AWCACHE_IS6;
   reg [2:0]                          AWPROT_IS6;
   reg                                AWVALID_IS6;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS7;
   reg [31:0]               AWADDR_IS7;
   reg [3:0]                          AWLEN_IS7;
   reg [2:0]                          AWSIZE_IS7;
   reg [1:0]                          AWBURST_IS7;
   reg [1:0]                          AWLOCK_IS7;
   reg [3:0]                          AWCACHE_IS7;
   reg [2:0]                          AWPROT_IS7;
   reg                                AWVALID_IS7;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS8;
   reg [31:0]               AWADDR_IS8;
   reg [3:0]                          AWLEN_IS8;
   reg [2:0]                          AWSIZE_IS8;
   reg [1:0]                          AWBURST_IS8;
   reg [1:0]                          AWLOCK_IS8;
   reg [3:0]                          AWCACHE_IS8;
   reg [2:0]                          AWPROT_IS8;
   reg                                AWVALID_IS8;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS9;
   reg [31:0]               AWADDR_IS9;
   reg [3:0]                          AWLEN_IS9;
   reg [2:0]                          AWSIZE_IS9;
   reg [1:0]                          AWBURST_IS9;
   reg [1:0]                          AWLOCK_IS9;
   reg [3:0]                          AWCACHE_IS9;
   reg [2:0]                          AWPROT_IS9;
   reg                                AWVALID_IS9;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS10;
   reg [31:0]               AWADDR_IS10;
   reg [3:0]                          AWLEN_IS10;
   reg [2:0]                          AWSIZE_IS10;
   reg [1:0]                          AWBURST_IS10;
   reg [1:0]                          AWLOCK_IS10;
   reg [3:0]                          AWCACHE_IS10;
   reg [2:0]                          AWPROT_IS10;
   reg                                AWVALID_IS10;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS11;
   reg [31:0]               AWADDR_IS11;
   reg [3:0]                          AWLEN_IS11;
   reg [2:0]                          AWSIZE_IS11;
   reg [1:0]                          AWBURST_IS11;
   reg [1:0]                          AWLOCK_IS11;
   reg [3:0]                          AWCACHE_IS11;
   reg [2:0]                          AWPROT_IS11;
   reg                                AWVALID_IS11;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS12;
   reg [31:0]               AWADDR_IS12;
   reg [3:0]                          AWLEN_IS12;
   reg [2:0]                          AWSIZE_IS12;
   reg [1:0]                          AWBURST_IS12;
   reg [1:0]                          AWLOCK_IS12;
   reg [3:0]                          AWCACHE_IS12;
   reg [2:0]                          AWPROT_IS12;
   reg                                AWVALID_IS12;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS13;
   reg [31:0]               AWADDR_IS13;
   reg [3:0]                          AWLEN_IS13;
   reg [2:0]                          AWSIZE_IS13;
   reg [1:0]                          AWBURST_IS13;
   reg [1:0]                          AWLOCK_IS13;
   reg [3:0]                          AWCACHE_IS13;
   reg [2:0]                          AWPROT_IS13;
   reg                                AWVALID_IS13;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS14;
   reg [31:0]               AWADDR_IS14;
   reg [3:0]                          AWLEN_IS14;
   reg [2:0]                          AWSIZE_IS14;
   reg [1:0]                          AWBURST_IS14;
   reg [1:0]                          AWLOCK_IS14;
   reg [3:0]                          AWCACHE_IS14;
   reg [2:0]                          AWPROT_IS14;
   reg                                AWVALID_IS14;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS15;
   reg [31:0]               AWADDR_IS15;
   reg [3:0]                          AWLEN_IS15;
   reg [2:0]                          AWSIZE_IS15;
   reg [1:0]                          AWBURST_IS15;
   reg [1:0]                          AWLOCK_IS15;
   reg [3:0]                          AWCACHE_IS15;
   reg [2:0]                          AWPROT_IS15;
   reg                                AWVALID_IS15;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS16;
   reg [31:0]               AWADDR_IS16;
   reg [3:0]                          AWLEN_IS16;
   reg [2:0]                          AWSIZE_IS16;
   reg [1:0]                          AWBURST_IS16;
   reg [1:0]                          AWLOCK_IS16;
   reg [3:0]                          AWCACHE_IS16;
   reg [2:0]                          AWPROT_IS16;
   reg                                AWVALID_IS16;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS0_gated;
   wire [31:0]               AWADDR_IS0_gated;
   wire [3:0]                          AWLEN_IS0_gated;
   wire [2:0]                          AWSIZE_IS0_gated;
   wire [1:0]                          AWBURST_IS0_gated;
   wire [1:0]                          AWLOCK_IS0_gated;
   wire [3:0]                          AWCACHE_IS0_gated;
   wire [2:0]                          AWPROT_IS0_gated;
   wire                                AWVALID_IS0_gated;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS1_gated;
   wire [31:0]               AWADDR_IS1_gated;
   wire [3:0]                          AWLEN_IS1_gated;
   wire [2:0]                          AWSIZE_IS1_gated;
   wire [1:0]                          AWBURST_IS1_gated;
   wire [1:0]                          AWLOCK_IS1_gated;
   wire [3:0]                          AWCACHE_IS1_gated;
   wire [2:0]                          AWPROT_IS1_gated;
   wire                                AWVALID_IS1_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS2_gated;
   wire [31:0]               AWADDR_IS2_gated;
   wire [3:0]                          AWLEN_IS2_gated;
   wire [2:0]                          AWSIZE_IS2_gated;
   wire [1:0]                          AWBURST_IS2_gated;
   wire [1:0]                          AWLOCK_IS2_gated;
   wire [3:0]                          AWCACHE_IS2_gated;
   wire [2:0]                          AWPROT_IS2_gated;
   wire                                AWVALID_IS2_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS3_gated;
   wire [31:0]               AWADDR_IS3_gated;
   wire [3:0]                          AWLEN_IS3_gated;
   wire [2:0]                          AWSIZE_IS3_gated;
   wire [1:0]                          AWBURST_IS3_gated;
   wire [1:0]                          AWLOCK_IS3_gated;
   wire [3:0]                          AWCACHE_IS3_gated;
   wire [2:0]                          AWPROT_IS3_gated;
   wire                                AWVALID_IS3_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS4_gated;
   wire [31:0]               AWADDR_IS4_gated;
   wire [3:0]                          AWLEN_IS4_gated;
   wire [2:0]                          AWSIZE_IS4_gated;
   wire [1:0]                          AWBURST_IS4_gated;
   wire [1:0]                          AWLOCK_IS4_gated;
   wire [3:0]                          AWCACHE_IS4_gated;
   wire [2:0]                          AWPROT_IS4_gated;
   wire                                AWVALID_IS4_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS5_gated;
   wire [31:0]               AWADDR_IS5_gated;
   wire [3:0]                          AWLEN_IS5_gated;
   wire [2:0]                          AWSIZE_IS5_gated;
   wire [1:0]                          AWBURST_IS5_gated;
   wire [1:0]                          AWLOCK_IS5_gated;
   wire [3:0]                          AWCACHE_IS5_gated;
   wire [2:0]                          AWPROT_IS5_gated;
   wire                                AWVALID_IS5_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS6_gated;
   wire [31:0]               AWADDR_IS6_gated;
   wire [3:0]                          AWLEN_IS6_gated;
   wire [2:0]                          AWSIZE_IS6_gated;
   wire [1:0]                          AWBURST_IS6_gated;
   wire [1:0]                          AWLOCK_IS6_gated;
   wire [3:0]                          AWCACHE_IS6_gated;
   wire [2:0]                          AWPROT_IS6_gated;
   wire                                AWVALID_IS6_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS7_gated;
   wire [31:0]               AWADDR_IS7_gated;
   wire [3:0]                          AWLEN_IS7_gated;
   wire [2:0]                          AWSIZE_IS7_gated;
   wire [1:0]                          AWBURST_IS7_gated;
   wire [1:0]                          AWLOCK_IS7_gated;
   wire [3:0]                          AWCACHE_IS7_gated;
   wire [2:0]                          AWPROT_IS7_gated;
   wire                                AWVALID_IS7_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS8_gated;
   wire [31:0]               AWADDR_IS8_gated;
   wire [3:0]                          AWLEN_IS8_gated;
   wire [2:0]                          AWSIZE_IS8_gated;
   wire [1:0]                          AWBURST_IS8_gated;
   wire [1:0]                          AWLOCK_IS8_gated;
   wire [3:0]                          AWCACHE_IS8_gated;
   wire [2:0]                          AWPROT_IS8_gated;
   wire                                AWVALID_IS8_gated;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS9_gated;
   wire [31:0]               AWADDR_IS9_gated;
   wire [3:0]                          AWLEN_IS9_gated;
   wire [2:0]                          AWSIZE_IS9_gated;
   wire [1:0]                          AWBURST_IS9_gated;
   wire [1:0]                          AWLOCK_IS9_gated;
   wire [3:0]                          AWCACHE_IS9_gated;
   wire [2:0]                          AWPROT_IS9_gated;
   wire                                AWVALID_IS9_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS10_gated;
   wire [31:0]               AWADDR_IS10_gated;
   wire [3:0]                          AWLEN_IS10_gated;
   wire [2:0]                          AWSIZE_IS10_gated;
   wire [1:0]                          AWBURST_IS10_gated;
   wire [1:0]                          AWLOCK_IS10_gated;
   wire [3:0]                          AWCACHE_IS10_gated;
   wire [2:0]                          AWPROT_IS10_gated;
   wire                                AWVALID_IS10_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS11_gated;
   wire [31:0]               AWADDR_IS11_gated;
   wire [3:0]                          AWLEN_IS11_gated;
   wire [2:0]                          AWSIZE_IS11_gated;
   wire [1:0]                          AWBURST_IS11_gated;
   wire [1:0]                          AWLOCK_IS11_gated;
   wire [3:0]                          AWCACHE_IS11_gated;
   wire [2:0]                          AWPROT_IS11_gated;
   wire                                AWVALID_IS11_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS12_gated;
   wire [31:0]               AWADDR_IS12_gated;
   wire [3:0]                          AWLEN_IS12_gated;
   wire [2:0]                          AWSIZE_IS12_gated;
   wire [1:0]                          AWBURST_IS12_gated;
   wire [1:0]                          AWLOCK_IS12_gated;
   wire [3:0]                          AWCACHE_IS12_gated;
   wire [2:0]                          AWPROT_IS12_gated;
   wire                                AWVALID_IS12_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS13_gated;
   wire [31:0]               AWADDR_IS13_gated;
   wire [3:0]                          AWLEN_IS13_gated;
   wire [2:0]                          AWSIZE_IS13_gated;
   wire [1:0]                          AWBURST_IS13_gated;
   wire [1:0]                          AWLOCK_IS13_gated;
   wire [3:0]                          AWCACHE_IS13_gated;
   wire [2:0]                          AWPROT_IS13_gated;
   wire                                AWVALID_IS13_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS14_gated;
   wire [31:0]               AWADDR_IS14_gated;
   wire [3:0]                          AWLEN_IS14_gated;
   wire [2:0]                          AWSIZE_IS14_gated;
   wire [1:0]                          AWBURST_IS14_gated;
   wire [1:0]                          AWLOCK_IS14_gated;
   wire [3:0]                          AWCACHE_IS14_gated;
   wire [2:0]                          AWPROT_IS14_gated;
   wire                                AWVALID_IS14_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS15_gated;
   wire [31:0]               AWADDR_IS15_gated;
   wire [3:0]                          AWLEN_IS15_gated;
   wire [2:0]                          AWSIZE_IS15_gated;
   wire [1:0]                          AWBURST_IS15_gated;
   wire [1:0]                          AWLOCK_IS15_gated;
   wire [3:0]                          AWCACHE_IS15_gated;
   wire [2:0]                          AWPROT_IS15_gated;
   wire                                AWVALID_IS15_gated;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] AWID_IS16_gated;
   wire [31:0]               AWADDR_IS16_gated;
   wire [3:0]                          AWLEN_IS16_gated;
   wire [2:0]                          AWSIZE_IS16_gated;
   wire [1:0]                          AWBURST_IS16_gated;
   wire [1:0]                          AWLOCK_IS16_gated;
   wire [3:0]                          AWCACHE_IS16_gated;
   wire [2:0]                          AWPROT_IS16_gated;
   wire                                AWVALID_IS16_gated;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS0;
   reg                                WVALID_IS0;
   reg [AXI_DWIDTH-1:0]               WDATA_IS0;
   reg [AXI_STRBWIDTH-1:0]            WSTRB_IS0;
   reg                                WLAST_IS0;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS1;
   reg                                WVALID_IS1;
   reg [AXI_DWIDTH-1:0]               WDATA_IS1;
   reg [AXI_STRBWIDTH-1:0]            WSTRB_IS1;
   reg                                WLAST_IS1;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS2;
   reg                                WVALID_IS2;
   reg [AXI_DWIDTH-1:0]               WDATA_IS2;
   reg [AXI_STRBWIDTH-1:0]            WSTRB_IS2;
   reg                                WLAST_IS2;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS3;
   reg                                WVALID_IS3;
   reg [AXI_DWIDTH-1:0]               WDATA_IS3;
   reg [AXI_STRBWIDTH-1:0]            WSTRB_IS3;
   reg                                WLAST_IS3;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS4;
   reg                                WVALID_IS4;
   reg [AXI_DWIDTH-1:0]               WDATA_IS4;
   reg [AXI_STRBWIDTH-1:0]            WSTRB_IS4;
   reg                                WLAST_IS4;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS5;
   reg                                WVALID_IS5;
   reg [AXI_DWIDTH-1:0]               WDATA_IS5;
   reg [AXI_STRBWIDTH-1:0]            WSTRB_IS5;
   reg                                WLAST_IS5;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS6;
   reg                                WVALID_IS6;
   reg [AXI_DWIDTH-1:0]               WDATA_IS6;
   reg [AXI_STRBWIDTH-1:0]            WSTRB_IS6;
   reg                                WLAST_IS6;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS7;
   reg                                WVALID_IS7;
   reg [AXI_DWIDTH-1:0]               WDATA_IS7;
   reg [AXI_STRBWIDTH-1:0]            WSTRB_IS7;
   reg                                WLAST_IS7;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS8;
   reg                                WVALID_IS8;
   reg [AXI_DWIDTH-1:0]               WDATA_IS8;
   reg [AXI_STRBWIDTH-1:0]            WSTRB_IS8;
   reg                                WLAST_IS8;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS9;
   reg                                WVALID_IS9;
   reg [AXI_DWIDTH-1:0]               WDATA_IS9;
   reg [AXI_STRBWIDTH-1:0]            WSTRB_IS9;
   reg                                WLAST_IS9;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS10;
   reg                                WVALID_IS10;
   reg [AXI_DWIDTH-1:0]               WDATA_IS10;
   reg [AXI_STRBWIDTH-1:0]            WSTRB_IS10;
   reg                                WLAST_IS10;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS11;
   reg                                WVALID_IS11;
   reg [AXI_DWIDTH-1:0]               WDATA_IS11;
   reg [AXI_STRBWIDTH-1:0]            WSTRB_IS11;
   reg                                WLAST_IS11;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS12;
   reg                                WVALID_IS12;
   reg [AXI_DWIDTH-1:0]               WDATA_IS12;
   reg [AXI_STRBWIDTH-1:0]            WSTRB_IS12;
   reg                                WLAST_IS12;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS13;
   reg                                WVALID_IS13;
   reg [AXI_DWIDTH-1:0]               WDATA_IS13;
   reg [AXI_STRBWIDTH-1:0]            WSTRB_IS13;
   reg                                WLAST_IS13;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS14;
   reg                                WVALID_IS14;
   reg [AXI_DWIDTH-1:0]               WDATA_IS14;
   reg [AXI_STRBWIDTH-1:0]            WSTRB_IS14;
   reg                                WLAST_IS14;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS15;
   reg                                WVALID_IS15;
   reg [AXI_DWIDTH-1:0]               WDATA_IS15;
   reg [AXI_STRBWIDTH-1:0]            WSTRB_IS15;
   reg                                WLAST_IS15;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS16;
   reg                                WVALID_IS16;
   reg [AXI_DWIDTH-1:0]               WDATA_IS16;
   reg [AXI_STRBWIDTH-1:0]            WSTRB_IS16;
   reg                                WLAST_IS16;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS0_gated;
   wire                                WVALID_IS0_gated;
   wire [AXI_DWIDTH-1:0]               WDATA_IS0_gated;
   wire [AXI_STRBWIDTH-1:0]            WSTRB_IS0_gated;
   wire                                WLAST_IS0_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS1_gated;
   wire                                WVALID_IS1_gated;
   wire [AXI_DWIDTH-1:0]               WDATA_IS1_gated;
   wire [AXI_STRBWIDTH-1:0]            WSTRB_IS1_gated;
   wire                                WLAST_IS1_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS2_gated;
   wire                                WVALID_IS2_gated;
   wire [AXI_DWIDTH-1:0]               WDATA_IS2_gated;
   wire [AXI_STRBWIDTH-1:0]            WSTRB_IS2_gated;
   wire                                WLAST_IS2_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS3_gated;
   wire                                WVALID_IS3_gated;
   wire [AXI_DWIDTH-1:0]               WDATA_IS3_gated;
   wire [AXI_STRBWIDTH-1:0]            WSTRB_IS3_gated;
   wire                                WLAST_IS3_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS4_gated;
   wire                                WVALID_IS4_gated;
   wire [AXI_DWIDTH-1:0]               WDATA_IS4_gated;
   wire [AXI_STRBWIDTH-1:0]            WSTRB_IS4_gated;
   wire                                WLAST_IS4_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS5_gated;
   wire                                WVALID_IS5_gated;
   wire [AXI_DWIDTH-1:0]               WDATA_IS5_gated;
   wire [AXI_STRBWIDTH-1:0]            WSTRB_IS5_gated;
   wire                                WLAST_IS5_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS6_gated;
   wire                                WVALID_IS6_gated;
   wire [AXI_DWIDTH-1:0]               WDATA_IS6_gated;
   wire [AXI_STRBWIDTH-1:0]            WSTRB_IS6_gated;
   wire                                WLAST_IS6_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS7_gated;
   wire                                WVALID_IS7_gated;
   wire [AXI_DWIDTH-1:0]               WDATA_IS7_gated;
   wire [AXI_STRBWIDTH-1:0]            WSTRB_IS7_gated;
   wire                                WLAST_IS7_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS8_gated;
   wire                                WVALID_IS8_gated;
   wire [AXI_DWIDTH-1:0]               WDATA_IS8_gated;
   wire [AXI_STRBWIDTH-1:0]            WSTRB_IS8_gated;
   wire                                WLAST_IS8_gated;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS9_gated;
   wire                                WVALID_IS9_gated;
   wire [AXI_DWIDTH-1:0]               WDATA_IS9_gated;
   wire [AXI_STRBWIDTH-1:0]            WSTRB_IS9_gated;
   wire                                WLAST_IS9_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS10_gated;
   wire                                WVALID_IS10_gated;
   wire [AXI_DWIDTH-1:0]               WDATA_IS10_gated;
   wire [AXI_STRBWIDTH-1:0]            WSTRB_IS10_gated;
   wire                                WLAST_IS10_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS11_gated;
   wire                                WVALID_IS11_gated;
   wire [AXI_DWIDTH-1:0]               WDATA_IS11_gated;
   wire [AXI_STRBWIDTH-1:0]            WSTRB_IS11_gated;
   wire                                WLAST_IS11_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS12_gated;
   wire                                WVALID_IS12_gated;
   wire [AXI_DWIDTH-1:0]               WDATA_IS12_gated;
   wire [AXI_STRBWIDTH-1:0]            WSTRB_IS12_gated;
   wire                                WLAST_IS12_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS13_gated;
   wire                                WVALID_IS13_gated;
   wire [AXI_DWIDTH-1:0]               WDATA_IS13_gated;
   wire [AXI_STRBWIDTH-1:0]            WSTRB_IS13_gated;
   wire                                WLAST_IS13_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS14_gated;
   wire                                WVALID_IS14_gated;
   wire [AXI_DWIDTH-1:0]               WDATA_IS14_gated;
   wire [AXI_STRBWIDTH-1:0]            WSTRB_IS14_gated;
   wire                                WLAST_IS14_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS15_gated;
   wire                                WVALID_IS15_gated;
   wire [AXI_DWIDTH-1:0]               WDATA_IS15_gated;
   wire [AXI_STRBWIDTH-1:0]            WSTRB_IS15_gated;
   wire                                WLAST_IS15_gated;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS16_gated;
   wire                                WVALID_IS16_gated;
   wire [AXI_DWIDTH-1:0]               WDATA_IS16_gated;
   wire [AXI_STRBWIDTH-1:0]            WSTRB_IS16_gated;
   wire                                WLAST_IS16_gated;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS0;
   reg [31:0]               ARADDR_IS0;
   reg [3:0]                          ARLEN_IS0;
   reg [2:0]                          ARSIZE_IS0;
   reg [1:0]                          ARBURST_IS0;
   reg [1:0]                          ARLOCK_IS0;
   reg [3:0]                          ARCACHE_IS0;
   reg [2:0]                          ARPROT_IS0;
   reg                                ARVALID_IS0;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS1;
   reg [31:0]               ARADDR_IS1;
   reg [3:0]                          ARLEN_IS1;
   reg [2:0]                          ARSIZE_IS1;
   reg [1:0]                          ARBURST_IS1;
   reg [1:0]                          ARLOCK_IS1;
   reg [3:0]                          ARCACHE_IS1;
   reg [2:0]                          ARPROT_IS1;
   reg                                ARVALID_IS1;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS2;
   reg [31:0]               ARADDR_IS2;
   reg [3:0]                          ARLEN_IS2;
   reg [2:0]                          ARSIZE_IS2;
   reg [1:0]                          ARBURST_IS2;
   reg [1:0]                          ARLOCK_IS2;
   reg [3:0]                          ARCACHE_IS2;
   reg [2:0]                          ARPROT_IS2;
   reg                                ARVALID_IS2;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS3;
   reg [31:0]               ARADDR_IS3;
   reg [3:0]                          ARLEN_IS3;
   reg [2:0]                          ARSIZE_IS3;
   reg [1:0]                          ARBURST_IS3;
   reg [1:0]                          ARLOCK_IS3;
   reg [3:0]                          ARCACHE_IS3;
   reg [2:0]                          ARPROT_IS3;
   reg                                ARVALID_IS3;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS4;
   reg [31:0]               ARADDR_IS4;
   reg [3:0]                          ARLEN_IS4;
   reg [2:0]                          ARSIZE_IS4;
   reg [1:0]                          ARBURST_IS4;
   reg [1:0]                          ARLOCK_IS4;
   reg [3:0]                          ARCACHE_IS4;
   reg [2:0]                          ARPROT_IS4;
   reg                                ARVALID_IS4;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS5;
   reg [31:0]               ARADDR_IS5;
   reg [3:0]                          ARLEN_IS5;
   reg [2:0]                          ARSIZE_IS5;
   reg [1:0]                          ARBURST_IS5;
   reg [1:0]                          ARLOCK_IS5;
   reg [3:0]                          ARCACHE_IS5;
   reg [2:0]                          ARPROT_IS5;
   reg                                ARVALID_IS5;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS6;
   reg [31:0]               ARADDR_IS6;
   reg [3:0]                          ARLEN_IS6;
   reg [2:0]                          ARSIZE_IS6;
   reg [1:0]                          ARBURST_IS6;
   reg [1:0]                          ARLOCK_IS6;
   reg [3:0]                          ARCACHE_IS6;
   reg [2:0]                          ARPROT_IS6;
   reg                                ARVALID_IS6;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS7;
   reg [31:0]               ARADDR_IS7;
   reg [3:0]                          ARLEN_IS7;
   reg [2:0]                          ARSIZE_IS7;
   reg [1:0]                          ARBURST_IS7;
   reg [1:0]                          ARLOCK_IS7;
   reg [3:0]                          ARCACHE_IS7;
   reg [2:0]                          ARPROT_IS7;
   reg                                ARVALID_IS7;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS8;
   reg [31:0]               ARADDR_IS8;
   reg [3:0]                          ARLEN_IS8;
   reg [2:0]                          ARSIZE_IS8;
   reg [1:0]                          ARBURST_IS8;
   reg [1:0]                          ARLOCK_IS8;
   reg [3:0]                          ARCACHE_IS8;
   reg [2:0]                          ARPROT_IS8;
   reg                                ARVALID_IS8;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS9;
   reg [31:0]               ARADDR_IS9;
   reg [3:0]                          ARLEN_IS9;
   reg [2:0]                          ARSIZE_IS9;
   reg [1:0]                          ARBURST_IS9;
   reg [1:0]                          ARLOCK_IS9;
   reg [3:0]                          ARCACHE_IS9;
   reg [2:0]                          ARPROT_IS9;
   reg                                ARVALID_IS9;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS10;
   reg [31:0]               ARADDR_IS10;
   reg [3:0]                          ARLEN_IS10;
   reg [2:0]                          ARSIZE_IS10;
   reg [1:0]                          ARBURST_IS10;
   reg [1:0]                          ARLOCK_IS10;
   reg [3:0]                          ARCACHE_IS10;
   reg [2:0]                          ARPROT_IS10;
   reg                                ARVALID_IS10;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS11;
   reg [31:0]               ARADDR_IS11;
   reg [3:0]                          ARLEN_IS11;
   reg [2:0]                          ARSIZE_IS11;
   reg [1:0]                          ARBURST_IS11;
   reg [1:0]                          ARLOCK_IS11;
   reg [3:0]                          ARCACHE_IS11;
   reg [2:0]                          ARPROT_IS11;
   reg                                ARVALID_IS11;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS12;
   reg [31:0]               ARADDR_IS12;
   reg [3:0]                          ARLEN_IS12;
   reg [2:0]                          ARSIZE_IS12;
   reg [1:0]                          ARBURST_IS12;
   reg [1:0]                          ARLOCK_IS12;
   reg [3:0]                          ARCACHE_IS12;
   reg [2:0]                          ARPROT_IS12;
   reg                                ARVALID_IS12;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS13;
   reg [31:0]               ARADDR_IS13;
   reg [3:0]                          ARLEN_IS13;
   reg [2:0]                          ARSIZE_IS13;
   reg [1:0]                          ARBURST_IS13;
   reg [1:0]                          ARLOCK_IS13;
   reg [3:0]                          ARCACHE_IS13;
   reg [2:0]                          ARPROT_IS13;
   reg                                ARVALID_IS13;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS14;
   reg [31:0]               ARADDR_IS14;
   reg [3:0]                          ARLEN_IS14;
   reg [2:0]                          ARSIZE_IS14;
   reg [1:0]                          ARBURST_IS14;
   reg [1:0]                          ARLOCK_IS14;
   reg [3:0]                          ARCACHE_IS14;
   reg [2:0]                          ARPROT_IS14;
   reg                                ARVALID_IS14;
   
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS15;
   reg [31:0]               ARADDR_IS15;
   reg [3:0]                          ARLEN_IS15;
   reg [2:0]                          ARSIZE_IS15;
   reg [1:0]                          ARBURST_IS15;
   reg [1:0]                          ARLOCK_IS15;
   reg [3:0]                          ARCACHE_IS15;
   reg [2:0]                          ARPROT_IS15;
   reg                                ARVALID_IS15;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS16;
   reg [31:0]               ARADDR_IS16;
   reg [3:0]                          ARLEN_IS16;
   reg [2:0]                          ARSIZE_IS16;
   reg [1:0]                          ARBURST_IS16;
   reg [1:0]                          ARLOCK_IS16;
   reg [3:0]                          ARCACHE_IS16;
   reg [2:0]                          ARPROT_IS16;
   reg                                ARVALID_IS16;


   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS0_gated;
   wire [31:0]               ARADDR_IS0_gated;
   wire [3:0]                          ARLEN_IS0_gated;
   wire [2:0]                          ARSIZE_IS0_gated;
   wire [1:0]                          ARBURST_IS0_gated;
   wire [1:0]                          ARLOCK_IS0_gated;
   wire [3:0]                          ARCACHE_IS0_gated;
   wire [2:0]                          ARPROT_IS0_gated;
   wire                                ARVALID_IS0_gated;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS1_gated;
   wire [31:0]               ARADDR_IS1_gated;
   wire [3:0]                          ARLEN_IS1_gated;
   wire [2:0]                          ARSIZE_IS1_gated;
   wire [1:0]                          ARBURST_IS1_gated;
   wire [1:0]                          ARLOCK_IS1_gated;
   wire [3:0]                          ARCACHE_IS1_gated;
   wire [2:0]                          ARPROT_IS1_gated;
   wire                                ARVALID_IS1_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS2_gated;
   wire [31:0]               ARADDR_IS2_gated;
   wire [3:0]                          ARLEN_IS2_gated;
   wire [2:0]                          ARSIZE_IS2_gated;
   wire [1:0]                          ARBURST_IS2_gated;
   wire [1:0]                          ARLOCK_IS2_gated;
   wire [3:0]                          ARCACHE_IS2_gated;
   wire [2:0]                          ARPROT_IS2_gated;
   wire                                ARVALID_IS2_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS3_gated;
   wire [31:0]               ARADDR_IS3_gated;
   wire [3:0]                          ARLEN_IS3_gated;
   wire [2:0]                          ARSIZE_IS3_gated;
   wire [1:0]                          ARBURST_IS3_gated;
   wire [1:0]                          ARLOCK_IS3_gated;
   wire [3:0]                          ARCACHE_IS3_gated;
   wire [2:0]                          ARPROT_IS3_gated;
   wire                                ARVALID_IS3_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS4_gated;
   wire [31:0]               ARADDR_IS4_gated;
   wire [3:0]                          ARLEN_IS4_gated;
   wire [2:0]                          ARSIZE_IS4_gated;
   wire [1:0]                          ARBURST_IS4_gated;
   wire [1:0]                          ARLOCK_IS4_gated;
   wire [3:0]                          ARCACHE_IS4_gated;
   wire [2:0]                          ARPROT_IS4_gated;
   wire                                ARVALID_IS4_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS5_gated;
   wire [31:0]               ARADDR_IS5_gated;
   wire [3:0]                          ARLEN_IS5_gated;
   wire [2:0]                          ARSIZE_IS5_gated;
   wire [1:0]                          ARBURST_IS5_gated;
   wire [1:0]                          ARLOCK_IS5_gated;
   wire [3:0]                          ARCACHE_IS5_gated;
   wire [2:0]                          ARPROT_IS5_gated;
   wire                                ARVALID_IS5_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS6_gated;
   wire [31:0]               ARADDR_IS6_gated;
   wire [3:0]                          ARLEN_IS6_gated;
   wire [2:0]                          ARSIZE_IS6_gated;
   wire [1:0]                          ARBURST_IS6_gated;
   wire [1:0]                          ARLOCK_IS6_gated;
   wire [3:0]                          ARCACHE_IS6_gated;
   wire [2:0]                          ARPROT_IS6_gated;
   wire                                ARVALID_IS6_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS7_gated;
   wire [31:0]               ARADDR_IS7_gated;
   wire [3:0]                          ARLEN_IS7_gated;
   wire [2:0]                          ARSIZE_IS7_gated;
   wire [1:0]                          ARBURST_IS7_gated;
   wire [1:0]                          ARLOCK_IS7_gated;
   wire [3:0]                          ARCACHE_IS7_gated;
   wire [2:0]                          ARPROT_IS7_gated;
   wire                                ARVALID_IS7_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS8_gated;
   wire [31:0]               ARADDR_IS8_gated;
   wire [3:0]                          ARLEN_IS8_gated;
   wire [2:0]                          ARSIZE_IS8_gated;
   wire [1:0]                          ARBURST_IS8_gated;
   wire [1:0]                          ARLOCK_IS8_gated;
   wire [3:0]                          ARCACHE_IS8_gated;
   wire [2:0]                          ARPROT_IS8_gated;
   wire                                ARVALID_IS8_gated;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS9_gated;
   wire [31:0]               ARADDR_IS9_gated;
   wire [3:0]                          ARLEN_IS9_gated;
   wire [2:0]                          ARSIZE_IS9_gated;
   wire [1:0]                          ARBURST_IS9_gated;
   wire [1:0]                          ARLOCK_IS9_gated;
   wire [3:0]                          ARCACHE_IS9_gated;
   wire [2:0]                          ARPROT_IS9_gated;
   wire                                ARVALID_IS9_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS10_gated;
   wire [31:0]               ARADDR_IS10_gated;
   wire [3:0]                          ARLEN_IS10_gated;
   wire [2:0]                          ARSIZE_IS10_gated;
   wire [1:0]                          ARBURST_IS10_gated;
   wire [1:0]                          ARLOCK_IS10_gated;
   wire [3:0]                          ARCACHE_IS10_gated;
   wire [2:0]                          ARPROT_IS10_gated;
   wire                                ARVALID_IS10_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS11_gated;
   wire [31:0]               ARADDR_IS11_gated;
   wire [3:0]                          ARLEN_IS11_gated;
   wire [2:0]                          ARSIZE_IS11_gated;
   wire [1:0]                          ARBURST_IS11_gated;
   wire [1:0]                          ARLOCK_IS11_gated;
   wire [3:0]                          ARCACHE_IS11_gated;
   wire [2:0]                          ARPROT_IS11_gated;
   wire                                ARVALID_IS11_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS12_gated;
   wire [31:0]               ARADDR_IS12_gated;
   wire [3:0]                          ARLEN_IS12_gated;
   wire [2:0]                          ARSIZE_IS12_gated;
   wire [1:0]                          ARBURST_IS12_gated;
   wire [1:0]                          ARLOCK_IS12_gated;
   wire [3:0]                          ARCACHE_IS12_gated;
   wire [2:0]                          ARPROT_IS12_gated;
   wire                                ARVALID_IS12_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS13_gated;
   wire [31:0]               ARADDR_IS13_gated;
   wire [3:0]                          ARLEN_IS13_gated;
   wire [2:0]                          ARSIZE_IS13_gated;
   wire [1:0]                          ARBURST_IS13_gated;
   wire [1:0]                          ARLOCK_IS13_gated;
   wire [3:0]                          ARCACHE_IS13_gated;
   wire [2:0]                          ARPROT_IS13_gated;
   wire                                ARVALID_IS13_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS14_gated;
   wire [31:0]               ARADDR_IS14_gated;
   wire [3:0]                          ARLEN_IS14_gated;
   wire [2:0]                          ARSIZE_IS14_gated;
   wire [1:0]                          ARBURST_IS14_gated;
   wire [1:0]                          ARLOCK_IS14_gated;
   wire [3:0]                          ARCACHE_IS14_gated;
   wire [2:0]                          ARPROT_IS14_gated;
   wire                                ARVALID_IS14_gated;
   
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS15_gated;
   wire [31:0]               ARADDR_IS15_gated;
   wire [3:0]                          ARLEN_IS15_gated;
   wire [2:0]                          ARSIZE_IS15_gated;
   wire [1:0]                          ARBURST_IS15_gated;
   wire [1:0]                          ARLOCK_IS15_gated;
   wire [3:0]                          ARCACHE_IS15_gated;
   wire [2:0]                          ARPROT_IS15_gated;
   wire                                ARVALID_IS15_gated;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS16_gated;
   wire [31:0]               ARADDR_IS16_gated;
   wire [3:0]                          ARLEN_IS16_gated;
   wire [2:0]                          ARSIZE_IS16_gated;
   wire [1:0]                          ARBURST_IS16_gated;
   wire [1:0]                          ARLOCK_IS16_gated;
   wire [3:0]                          ARCACHE_IS16_gated;
   wire [2:0]                          ARPROT_IS16_gated;
   wire                                ARVALID_IS16_gated;

   reg [31:0]               AWADDR_IS16_gated_r;
   reg [31:0]               ARADDR_IS16_gated_r;
   reg                                AWVALID_IS16_gated_r;
   reg                                ARVALID_IS16_gated_r;
   reg                                WVALID_IS16_gated_r;
   

   // AXI read response channel signals
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_IM0;
   wire [AXI_DWIDTH-1:0]               RDATA_IM0;
   wire [1:0]                          RRESP_IM0;
   wire                                RLAST_IM0;
   wire                                RVALID_IM0;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_IM1;
   wire [AXI_DWIDTH-1:0]               RDATA_IM1;
   wire [1:0]                          RRESP_IM1;
   wire                                RLAST_IM1;
   wire                                RVALID_IM1;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_IM2;
   wire [AXI_DWIDTH-1:0]               RDATA_IM2;
   wire [1:0]                          RRESP_IM2;
   wire                                RLAST_IM2;
   wire                                RVALID_IM2;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_IM3;
   wire [AXI_DWIDTH-1:0]               RDATA_IM3;
   wire [1:0]                          RRESP_IM3;
   wire                                RLAST_IM3;
   wire                                RVALID_IM3;

   wire [3:0]                          AW_MASGNT_IC; 
   wire [3:0]                          AR_MASGNT_IC; 

   wire [3:0]                          wr_rdcntr;
   wire [3:0]                          wr_wdcntr;     

   wire [3:0]                          wd_rdcntr;
   wire [3:0]                          wd_wdcntr;     

   wire [1:0]                          MST_RDGNT_NUM; 
   wire [3:0]                          rd_rdcntr;
   wire [3:0]                          rd_wdcntr;     

   wire [1:0]                          AWLOCK_MI0;
   wire [1:0]                          AWLOCK_MI1;
   wire [1:0]                          AWLOCK_MI2;
   wire [1:0]                          AWLOCK_MI3;
   wire [1:0]                          ARLOCK_MI0;
   wire [1:0]                          ARLOCK_MI1;
   wire [1:0]                          ARLOCK_MI2;
   wire [1:0]                          ARLOCK_MI3;

   wire [1:0]                          RRESP_IC;
   wire [AXI_DWIDTH-1:0]               RDATA_IC;

   wire                                AWREADY_S0IM0;
   wire                                AWREADY_S0IM1;
   wire                                AWREADY_S0IM2;
   wire                                AWREADY_S0IM3;   
   wire                                AWREADY_S1IM0;
   wire                                AWREADY_S1IM1;
   wire                                AWREADY_S1IM2;
   wire                                AWREADY_S1IM3;   
   wire                                AWREADY_S2IM0;
   wire                                AWREADY_S2IM1;
   wire                                AWREADY_S2IM2;
   wire                                AWREADY_S2IM3;   
   wire                                AWREADY_S3IM0;
   wire                                AWREADY_S3IM1;
   wire                                AWREADY_S3IM2;
   wire                                AWREADY_S3IM3;   
   wire                                AWREADY_S4IM0;
   wire                                AWREADY_S4IM1;
   wire                                AWREADY_S4IM2;
   wire                                AWREADY_S4IM3;   
   wire                                AWREADY_S5IM0;
   wire                                AWREADY_S5IM1;
   wire                                AWREADY_S5IM2;
   wire                                AWREADY_S5IM3;   
   wire                                AWREADY_S6IM0;
   wire                                AWREADY_S6IM1;
   wire                                AWREADY_S6IM2;
   wire                                AWREADY_S6IM3;   
   wire                                AWREADY_S7IM0;
   wire                                AWREADY_S7IM1;
   wire                                AWREADY_S7IM2;
   wire                                AWREADY_S7IM3;   
   wire                                AWREADY_S8IM0;
   wire                                AWREADY_S8IM1;
   wire                                AWREADY_S8IM2;
   wire                                AWREADY_S8IM3;   
   wire                                AWREADY_S9IM0;
   wire                                AWREADY_S9IM1;
   wire                                AWREADY_S9IM2;
   wire                                AWREADY_S9IM3;   
   wire                                AWREADY_S10IM0;
   wire                                AWREADY_S10IM1;
   wire                                AWREADY_S10IM2;
   wire                                AWREADY_S10IM3;   
   wire                                AWREADY_S11IM0;
   wire                                AWREADY_S11IM1;
   wire                                AWREADY_S11IM2;
   wire                                AWREADY_S11IM3;   
   wire                                AWREADY_S12IM0;
   wire                                AWREADY_S12IM1;
   wire                                AWREADY_S12IM2;
   wire                                AWREADY_S12IM3;   
   wire                                AWREADY_S13IM0;
   wire                                AWREADY_S13IM1;
   wire                                AWREADY_S13IM2;
   wire                                AWREADY_S13IM3;   
   wire                                AWREADY_S14IM0;
   wire                                AWREADY_S14IM1;
   wire                                AWREADY_S14IM2;
   wire                                AWREADY_S14IM3;   
   wire                                AWREADY_S15IM0;
   wire                                AWREADY_S15IM1;
   wire                                AWREADY_S15IM2;
   wire                                AWREADY_S15IM3;   
   wire                                AWREADY_S16IM0;
   wire                                AWREADY_S16IM1;
   wire                                AWREADY_S16IM2;
   wire                                AWREADY_S16IM3;   

   wire                                ARREADY_S0IM0;
   wire                                ARREADY_S0IM1;
   wire                                ARREADY_S0IM2;
   wire                                ARREADY_S0IM3;   
   wire                                ARREADY_S1IM0;
   wire                                ARREADY_S1IM1;
   wire                                ARREADY_S1IM2;
   wire                                ARREADY_S1IM3;   
   wire                                ARREADY_S2IM0;
   wire                                ARREADY_S2IM1;
   wire                                ARREADY_S2IM2;
   wire                                ARREADY_S2IM3;   
   wire                                ARREADY_S3IM0;
   wire                                ARREADY_S3IM1;
   wire                                ARREADY_S3IM2;
   wire                                ARREADY_S3IM3;   
   wire                                ARREADY_S4IM0;
   wire                                ARREADY_S4IM1;
   wire                                ARREADY_S4IM2;
   wire                                ARREADY_S4IM3;   
   wire                                ARREADY_S5IM0;
   wire                                ARREADY_S5IM1;
   wire                                ARREADY_S5IM2;
   wire                                ARREADY_S5IM3;   
   wire                                ARREADY_S6IM0;
   wire                                ARREADY_S6IM1;
   wire                                ARREADY_S6IM2;
   wire                                ARREADY_S6IM3;   
   wire                                ARREADY_S7IM0;
   wire                                ARREADY_S7IM1;
   wire                                ARREADY_S7IM2;
   wire                                ARREADY_S7IM3;   
   wire                                ARREADY_S8IM0;
   wire                                ARREADY_S8IM1;
   wire                                ARREADY_S8IM2;
   wire                                ARREADY_S8IM3;   
   wire                                ARREADY_S9IM0;
   wire                                ARREADY_S9IM1;
   wire                                ARREADY_S9IM2;
   wire                                ARREADY_S9IM3;   
   wire                                ARREADY_S10IM0;
   wire                                ARREADY_S10IM1;
   wire                                ARREADY_S10IM2;
   wire                                ARREADY_S10IM3;   
   wire                                ARREADY_S11IM0;
   wire                                ARREADY_S11IM1;
   wire                                ARREADY_S11IM2;
   wire                                ARREADY_S11IM3;   
   wire                                ARREADY_S12IM0;
   wire                                ARREADY_S12IM1;
   wire                                ARREADY_S12IM2;
   wire                                ARREADY_S12IM3;   
   wire                                ARREADY_S13IM0;
   wire                                ARREADY_S13IM1;
   wire                                ARREADY_S13IM2;
   wire                                ARREADY_S13IM3;   
   wire                                ARREADY_S14IM0;
   wire                                ARREADY_S14IM1;
   wire                                ARREADY_S14IM2;
   wire                                ARREADY_S14IM3;   
   wire                                ARREADY_S15IM0;
   wire                                ARREADY_S15IM1;
   wire                                ARREADY_S15IM2;
   wire                                ARREADY_S15IM3;   
   wire                                ARREADY_S16IM0;
   wire                                ARREADY_S16IM1;
   wire                                ARREADY_S16IM2;
   wire                                ARREADY_S16IM3;   

   wire                                ARREADY_S0IM0_int;
   wire                                ARREADY_S0IM1_int;
   wire                                ARREADY_S0IM2_int;
   wire                                ARREADY_S0IM3_int;   
   wire                                ARREADY_S1IM0_int;
   wire                                ARREADY_S1IM1_int;
   wire                                ARREADY_S1IM2_int;
   wire                                ARREADY_S1IM3_int;   
   wire                                ARREADY_S2IM0_int;
   wire                                ARREADY_S2IM1_int;
   wire                                ARREADY_S2IM2_int;
   wire                                ARREADY_S2IM3_int;   
   wire                                ARREADY_S3IM0_int;
   wire                                ARREADY_S3IM1_int;
   wire                                ARREADY_S3IM2_int;
   wire                                ARREADY_S3IM3_int;   
   wire                                ARREADY_S4IM0_int;
   wire                                ARREADY_S4IM1_int;
   wire                                ARREADY_S4IM2_int;
   wire                                ARREADY_S4IM3_int;   
   wire                                ARREADY_S5IM0_int;
   wire                                ARREADY_S5IM1_int;
   wire                                ARREADY_S5IM2_int;
   wire                                ARREADY_S5IM3_int;   
   wire                                ARREADY_S6IM0_int;
   wire                                ARREADY_S6IM1_int;
   wire                                ARREADY_S6IM2_int;
   wire                                ARREADY_S6IM3_int;   
   wire                                ARREADY_S7IM0_int;
   wire                                ARREADY_S7IM1_int;
   wire                                ARREADY_S7IM2_int;
   wire                                ARREADY_S7IM3_int;   
   wire                                ARREADY_S8IM0_int;
   wire                                ARREADY_S8IM1_int;
   wire                                ARREADY_S8IM2_int;
   wire                                ARREADY_S8IM3_int;   
   wire                                ARREADY_S9IM0_int;
   wire                                ARREADY_S9IM1_int;
   wire                                ARREADY_S9IM2_int;
   wire                                ARREADY_S9IM3_int;   
   wire                                ARREADY_S10IM0_int;
   wire                                ARREADY_S10IM1_int;
   wire                                ARREADY_S10IM2_int;
   wire                                ARREADY_S10IM3_int;   
   wire                                ARREADY_S11IM0_int;
   wire                                ARREADY_S11IM1_int;
   wire                                ARREADY_S11IM2_int;
   wire                                ARREADY_S11IM3_int;   
   wire                                ARREADY_S12IM0_int;
   wire                                ARREADY_S12IM1_int;
   wire                                ARREADY_S12IM2_int;
   wire                                ARREADY_S12IM3_int;   
   wire                                ARREADY_S13IM0_int;
   wire                                ARREADY_S13IM1_int;
   wire                                ARREADY_S13IM2_int;
   wire                                ARREADY_S13IM3_int;   
   wire                                ARREADY_S14IM0_int;
   wire                                ARREADY_S14IM1_int;
   wire                                ARREADY_S14IM2_int;
   wire                                ARREADY_S14IM3_int;   
   wire                                ARREADY_S15IM0_int;
   wire                                ARREADY_S15IM1_int;
   wire                                ARREADY_S15IM2_int;
   wire                                ARREADY_S15IM3_int;   
   wire                                ARREADY_S16IM0_int;
   wire                                ARREADY_S16IM1_int;
   wire                                ARREADY_S16IM2_int;
   wire                                ARREADY_S16IM3_int;   

   wire                                WREADY_S0IM0;
   wire                                WREADY_S0IM1;
   wire                                WREADY_S0IM2;
   wire                                WREADY_S0IM3;   
   wire                                WREADY_S1IM0;
   wire                                WREADY_S1IM1;
   wire                                WREADY_S1IM2;
   wire                                WREADY_S1IM3;   
   wire                                WREADY_S2IM0;
   wire                                WREADY_S2IM1;
   wire                                WREADY_S2IM2;
   wire                                WREADY_S2IM3;   
   wire                                WREADY_S3IM0;
   wire                                WREADY_S3IM1;
   wire                                WREADY_S3IM2;
   wire                                WREADY_S3IM3;   
   wire                                WREADY_S4IM0;
   wire                                WREADY_S4IM1;
   wire                                WREADY_S4IM2;
   wire                                WREADY_S4IM3;   
   wire                                WREADY_S5IM0;
   wire                                WREADY_S5IM1;
   wire                                WREADY_S5IM2;
   wire                                WREADY_S5IM3;   
   wire                                WREADY_S6IM0;
   wire                                WREADY_S6IM1;
   wire                                WREADY_S6IM2;
   wire                                WREADY_S6IM3;   
   wire                                WREADY_S7IM0;
   wire                                WREADY_S7IM1;
   wire                                WREADY_S7IM2;
   wire                                WREADY_S7IM3;   
   wire                                WREADY_S8IM0;
   wire                                WREADY_S8IM1;
   wire                                WREADY_S8IM2;
   wire                                WREADY_S8IM3;   
   wire                                WREADY_S9IM0;
   wire                                WREADY_S9IM1;
   wire                                WREADY_S9IM2;
   wire                                WREADY_S9IM3;   
   wire                                WREADY_S10IM0;
   wire                                WREADY_S10IM1;
   wire                                WREADY_S10IM2;
   wire                                WREADY_S10IM3;   
   wire                                WREADY_S11IM0;
   wire                                WREADY_S11IM1;
   wire                                WREADY_S11IM2;
   wire                                WREADY_S11IM3;   
   wire                                WREADY_S12IM0;
   wire                                WREADY_S12IM1;
   wire                                WREADY_S12IM2;
   wire                                WREADY_S12IM3;   
   wire                                WREADY_S13IM0;
   wire                                WREADY_S13IM1;
   wire                                WREADY_S13IM2;
   wire                                WREADY_S13IM3;   
   wire                                WREADY_S14IM0;
   wire                                WREADY_S14IM1;
   wire                                WREADY_S14IM2;
   wire                                WREADY_S14IM3;   
   wire                                WREADY_S15IM0;
   wire                                WREADY_S15IM1;
   wire                                WREADY_S15IM2;
   wire                                WREADY_S15IM3;   
   wire                                WREADY_S16IM0;
   wire                                WREADY_S16IM1;
   wire                                WREADY_S16IM2;
   wire                                WREADY_S16IM3;   

   reg                                 WREADY_IM0;
   reg                                 WREADY_IM1;
   reg                                 WREADY_IM2;
   reg                                 WREADY_IM3;

   reg                                 AWREADY_IM0;
   reg                                 AWREADY_IM1;
   reg                                 AWREADY_IM2;
   reg                                 AWREADY_IM3;

   reg                                 ARREADY_IM0;
   reg                                 ARREADY_IM1;
   reg                                 ARREADY_IM2;
   reg                                 ARREADY_IM3;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM0_int;
   wire [1:0]                          BRESP_IM0_int;
   wire                                BVALID_IM0_int;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM1_int;
   wire [1:0]                          BRESP_IM1_int;
   wire                                BVALID_IM1_int;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM2_int;
   wire [1:0]                          BRESP_IM2_int;
   wire                                BVALID_IM2_int;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM3_int;
   wire [1:0]                          BRESP_IM3_int;
   wire                                BVALID_IM3_int;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_IM0_int;
   wire [1:0]                          RRESP_IM0_int;
   wire                                RVALID_IM0_int;
   wire                                RLAST_IM0_int;
   wire [AXI_DWIDTH-1:0]               RDATA_IM0_int;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_IM1_int;
   wire [1:0]                          RRESP_IM1_int;
   wire                                RVALID_IM1_int;
   wire                                RLAST_IM1_int;
   wire [AXI_DWIDTH-1:0]               RDATA_IM1_int;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_IM2_int;
   wire [1:0]                          RRESP_IM2_int;
   wire                                RVALID_IM2_int;
   wire                                RLAST_IM2_int;
   wire [AXI_DWIDTH-1:0]               RDATA_IM2_int;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] RID_IM3_int;
   wire [1:0]                          RRESP_IM3_int;
   wire                                RVALID_IM3_int;
   wire                                RLAST_IM3_int;
   wire [AXI_DWIDTH-1:0]               RDATA_IM3_int;

   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM0;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM1;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM2;
   wire [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM3;
   wire [1:0]                          BRESP_IM0;
   wire [1:0]                          BRESP_IM1;
   wire [1:0]                          BRESP_IM2;
   wire [1:0]                          BRESP_IM3;


   wire                                BREADY_M0IS0_gated; 
   wire                                BREADY_M0IS1_gated; 
   wire                                BREADY_M0IS2_gated; 
   wire                                BREADY_M0IS3_gated; 
   wire                                BREADY_M0IS4_gated; 
   wire                                BREADY_M0IS5_gated; 
   wire                                BREADY_M0IS6_gated; 
   wire                                BREADY_M0IS7_gated; 
   wire                                BREADY_M0IS8_gated; 
   wire                                BREADY_M0IS9_gated; 
   wire                                BREADY_M0IS10_gated;
   wire                                BREADY_M0IS11_gated;
   wire                                BREADY_M0IS12_gated;
   wire                                BREADY_M0IS13_gated;
   wire                                BREADY_M0IS14_gated;
   wire                                BREADY_M0IS15_gated;
   wire                                BREADY_M0IS16_gated;
                                                
                                                
   wire                                BREADY_M1IS0_gated; 
   wire                                BREADY_M1IS1_gated; 
   wire                                BREADY_M1IS2_gated; 
   wire                                BREADY_M1IS3_gated; 
   wire                                BREADY_M1IS4_gated; 
   wire                                BREADY_M1IS5_gated; 
   wire                                BREADY_M1IS6_gated; 
   wire                                BREADY_M1IS7_gated; 
   wire                                BREADY_M1IS8_gated; 
   wire                                BREADY_M1IS9_gated; 
   wire                                BREADY_M1IS10_gated;
   wire                                BREADY_M1IS11_gated;
   wire                                BREADY_M1IS12_gated;
   wire                                BREADY_M1IS13_gated;
   wire                                BREADY_M1IS14_gated;
   wire                                BREADY_M1IS15_gated;
   wire                                BREADY_M1IS16_gated;
                                                            
   wire                                BREADY_M2IS0_gated; 
   wire                                BREADY_M2IS1_gated; 
   wire                                BREADY_M2IS2_gated; 
   wire                                BREADY_M2IS3_gated; 
   wire                                BREADY_M2IS4_gated; 
   wire                                BREADY_M2IS5_gated; 
   wire                                BREADY_M2IS6_gated; 
   wire                                BREADY_M2IS7_gated; 
   wire                                BREADY_M2IS8_gated; 
   wire                                BREADY_M2IS9_gated; 
   wire                                BREADY_M2IS10_gated;
   wire                                BREADY_M2IS11_gated;
   wire                                BREADY_M2IS12_gated;
   wire                                BREADY_M2IS13_gated;
   wire                                BREADY_M2IS14_gated;
   wire                                BREADY_M2IS15_gated;   
   wire                                BREADY_M2IS16_gated;
                                                 
   wire                                BREADY_M3IS0_gated; 
   wire                                BREADY_M3IS1_gated; 
   wire                                BREADY_M3IS2_gated; 
   wire                                BREADY_M3IS3_gated; 
   wire                                BREADY_M3IS4_gated; 
   wire                                BREADY_M3IS5_gated; 
   wire                                BREADY_M3IS6_gated; 
   wire                                BREADY_M3IS7_gated; 
   wire                                BREADY_M3IS8_gated; 
   wire                                BREADY_M3IS9_gated; 
   wire                                BREADY_M3IS10_gated;
   wire                                BREADY_M3IS11_gated;
   wire                                BREADY_M3IS12_gated;
   wire                                BREADY_M3IS13_gated;
   wire                                BREADY_M3IS14_gated;
   wire                                BREADY_M3IS15_gated;
   wire                                BREADY_M3IS16_gated;
   wire [16:0]                         gated_waddr;
   wire [16:0]                         gated_raddr;
   wire [31:0]                         AWADDR_IS_int;
   wire [31:0]                         ARADDR_IS_int;
   wire                                aresetn;
   wire                                sresetn;

//   wire [3:0]                          slave_out_addr;
//   wire                                slave_out_en;  
   reg                                 slave_out_en_r0;
   reg                                 slave_out_en_r1;
   reg                                 slave_out_en_r2;
   reg                                 slave_out_en_r3;
   reg                                 slave_out_en_r4;
   reg                                 slave_out_en_r5;
   reg                                 slave_out_en_r6;
   reg                                 slave_out_en_r7;
   reg                                 slave_out_en_r8;
   reg                                 slave_out_en_r9;
   reg                                 slave_out_en_r10;
   reg                                 slave_out_en_r11;
   reg                                 slave_out_en_r12;
   reg                                 slave_out_en_r13;
   reg                                 slave_out_en_r14;
   reg                                 slave_out_en_r15;
   reg                                 slave_out_en_r16;

   wire [3:0]                          slave_out_addr0;
   wire [3:0]                          slave_out_addr1;
   wire [3:0]                          slave_out_addr2;
   wire [3:0]                          slave_out_addr3;
   wire [3:0]                          slave_out_addr4;
   wire [3:0]                          slave_out_addr5;
   wire [3:0]                          slave_out_addr6;
   wire [3:0]                          slave_out_addr7;
   wire [3:0]                          slave_out_addr8;
   wire [3:0]                          slave_out_addr9;
   wire [3:0]                          slave_out_addr10;
   wire [3:0]                          slave_out_addr11;
   wire [3:0]                          slave_out_addr12;
   wire [3:0]                          slave_out_addr13;
   wire [3:0]                          slave_out_addr14;
   wire [3:0]                          slave_out_addr15;
   wire [3:0]                          slave_out_addr16;

   wire                                slave_out_en0;  
   wire                                slave_out_en1;  
   wire                                slave_out_en2;  
   wire                                slave_out_en3;  
   wire                                slave_out_en4;  
   wire                                slave_out_en5;  
   wire                                slave_out_en6;  
   wire                                slave_out_en7;  
   wire                                slave_out_en8;  
   wire                                slave_out_en9;  
   wire                                slave_out_en10;  
   wire                                slave_out_en11;  
   wire                                slave_out_en12;  
   wire                                slave_out_en13;  
   wire                                slave_out_en14;  
   wire                                slave_out_en15;  
   wire                                slave_out_en16;  

   wire [3:0]                          pend_id_addr0;
   wire [3:0]                          pend_id_addr1;
   wire [3:0]                          pend_id_addr2;
   wire [3:0]                          pend_id_addr3;
   wire [3:0]                          pend_id_addr4;
   wire [3:0]                          pend_id_addr5;
   wire [3:0]                          pend_id_addr6;
   wire [3:0]                          pend_id_addr7;
   wire [3:0]                          pend_id_addr8;
   wire [3:0]                          pend_id_addr9;
   wire [3:0]                          pend_id_addr10;
   wire [3:0]                          pend_id_addr11;
   wire [3:0]                          pend_id_addr12;
   wire [3:0]                          pend_id_addr13;
   wire [3:0]                          pend_id_addr14;
   wire [3:0]                          pend_id_addr15;
   wire [3:0]                          pend_id_addr16;
   wire                                pend_id_en0;
   wire                                pend_id_en1;
   wire                                pend_id_en2;
   wire                                pend_id_en3;
   wire                                pend_id_en4;
   wire                                pend_id_en5;
   wire                                pend_id_en6;
   wire                                pend_id_en7;
   wire                                pend_id_en8;
   wire                                pend_id_en9;
   wire                                pend_id_en10;
   wire                                pend_id_en11;
   wire                                pend_id_en12;
   wire                                pend_id_en13;
   wire                                pend_id_en14;
   wire                                pend_id_en15;
   wire                                pend_id_en16;

   wire [3:0]                          outstnd_waddr0;
   wire [3:0]                          outstnd_waddr1;
   wire [3:0]                          outstnd_waddr2;
   wire [3:0]                          outstnd_waddr3;
   wire [3:0]                          outstnd_waddr4;
   wire [3:0]                          outstnd_waddr5;
   wire [3:0]                          outstnd_waddr6;
   wire [3:0]                          outstnd_waddr7;
   wire [3:0]                          outstnd_waddr8;
   wire [3:0]                          outstnd_waddr9;
   wire [3:0]                          outstnd_waddr10;
   wire [3:0]                          outstnd_waddr11;
   wire [3:0]                          outstnd_waddr12;
   wire [3:0]                          outstnd_waddr13;
   wire [3:0]                          outstnd_waddr14;
   wire [3:0]                          outstnd_waddr15;
   wire [3:0]                          outstnd_waddr16;
   wire                                outstnd_waddr_en0;
   wire                                outstnd_waddr_en1;
   wire                                outstnd_waddr_en2;
   wire                                outstnd_waddr_en3;
   wire                                outstnd_waddr_en4;
   wire                                outstnd_waddr_en5;
   wire                                outstnd_waddr_en6;
   wire                                outstnd_waddr_en7;
   wire                                outstnd_waddr_en8;
   wire                                outstnd_waddr_en9;
   wire                                outstnd_waddr_en10;
   wire                                outstnd_waddr_en11;
   wire                                outstnd_waddr_en12;
   wire                                outstnd_waddr_en13;
   wire                                outstnd_waddr_en14;
   wire                                outstnd_waddr_en15;
   wire                                outstnd_waddr_en16;
   

   /////////////////////////////////////////////////////////////////////////////
   //                               Start - of - Code                         //
   /////////////////////////////////////////////////////////////////////////////

   // --------------------------------------------------------------------------
   // resets
   // --------------------------------------------------------------------------
   assign aresetn   = (SYNC_RESET == 1) ? 1'b1  : ARESETN;
   assign sresetn   = (SYNC_RESET == 1) ? ARESETN : 1'b1;



   // --------------------------------------------------------------------------
   // Pass the Write response signals back to corresponding master
   // --------------------------------------------------------------------------   
   assign  BID_IM0    = (BID_IM0_int[BASE_ID_WIDTH+ID_WIDTH - 3:ID_WIDTH-2] == 2'b00) ? {2'b00,BID_IM0_int[ID_WIDTH-1:0]} : 'h0;
   assign  BID_IM1    = (BID_IM1_int[BASE_ID_WIDTH+ID_WIDTH - 3:ID_WIDTH-2] == 2'b01) ? {2'b01,BID_IM1_int[ID_WIDTH-1:0]} : 'h0;   
   assign  BID_IM2    = (BID_IM2_int[BASE_ID_WIDTH+ID_WIDTH - 3:ID_WIDTH-2] == 2'b10) ? {2'b10,BID_IM2_int[ID_WIDTH-1:0]} : 'h0;
   assign  BID_IM3    = (BID_IM3_int[BASE_ID_WIDTH+ID_WIDTH - 3:ID_WIDTH-2] == 2'b11) ? {2'b10,BID_IM3_int[ID_WIDTH-1:0]} : 'h0;
   
   assign  BVALID_IM0 = (BID_IM0_int[BASE_ID_WIDTH+ID_WIDTH - 3:ID_WIDTH-2] == 2'b00) ? BVALID_IM0_int : 'h0;
   assign  BVALID_IM1 = (BID_IM1_int[BASE_ID_WIDTH+ID_WIDTH - 3:ID_WIDTH-2] == 2'b01) ? BVALID_IM1_int : 'h0;   
   assign  BVALID_IM2 = (BID_IM2_int[BASE_ID_WIDTH+ID_WIDTH - 3:ID_WIDTH-2] == 2'b10) ? BVALID_IM2_int : 'h0;
   assign  BVALID_IM3 = (BID_IM3_int[BASE_ID_WIDTH+ID_WIDTH - 3:ID_WIDTH-2] == 2'b11) ? BVALID_IM3_int : 'h0;

   assign  BRESP_IM0  = (BID_IM0_int[BASE_ID_WIDTH+ID_WIDTH - 3:ID_WIDTH-2] == 2'b00) ? BRESP_IM0_int : 'h0;
   assign  BRESP_IM1  = (BID_IM1_int[BASE_ID_WIDTH+ID_WIDTH - 3:ID_WIDTH-2] == 2'b01) ? BRESP_IM1_int : 'h0;   
   assign  BRESP_IM2  = (BID_IM2_int[BASE_ID_WIDTH+ID_WIDTH - 3:ID_WIDTH-2] == 2'b10) ? BRESP_IM2_int : 'h0;
   assign  BRESP_IM3  = (BID_IM3_int[BASE_ID_WIDTH+ID_WIDTH - 3:ID_WIDTH-2] == 2'b11) ? BRESP_IM3_int : 'h0;


   // --------------------------------------------------------------------------
   // Pass the Read data/response signals back to corresponding master
   // --------------------------------------------------------------------------
   assign  RID_IM0    = RID_IM0_int   ;
   assign  RID_IM1    = RID_IM1_int   ;   
   assign  RID_IM2    = RID_IM2_int   ;
   assign  RID_IM3    = RID_IM3_int   ;
                                      
   assign  RLAST_IM0  = RLAST_IM0_int ;
   assign  RLAST_IM1  = RLAST_IM1_int ;   
   assign  RLAST_IM2  = RLAST_IM2_int ;
   assign  RLAST_IM3  = RLAST_IM3_int ;
                                      
   assign  RDATA_IM0  = RDATA_IM0_int ;
   assign  RDATA_IM1  = RDATA_IM1_int ;   
   assign  RDATA_IM2  = RDATA_IM2_int ;
   assign  RDATA_IM3  = RDATA_IM3_int ;

   assign  RVALID_IM0 = RVALID_IM0_int;
   assign  RVALID_IM1 = RVALID_IM1_int;   
   assign  RVALID_IM2 = RVALID_IM2_int;
   assign  RVALID_IM3 = RVALID_IM3_int;

   assign  RRESP_IM0  = RRESP_IM0_int ;
   assign  RRESP_IM1  = RRESP_IM1_int ;   
   assign  RRESP_IM2  = RRESP_IM2_int ;
   assign  RRESP_IM3  = RRESP_IM3_int ;

   // ---------
   //Instances
   // ---------
   axi_matrix_m #(
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
     inst_matrix_m0 (
                     // Global signals
                     .ACLK(ACLK),
                     .ARESETN(ARESETN),

                     .RID_IM(RID_IM0_int),
                     .RDATA_IM(RDATA_IM0_int),
                     .RRESP_IM(RRESP_IM0_int),
                     .RLAST_IM(RLAST_IM0_int),
                     .RVALID_IM(RVALID_IM0_int),
                     .RREADY_MI(RREADY_MI0),
                     
                     .BID_IM(BID_IM0_int),
                     .BVALID_IM(BVALID_IM0_int),
                     .BRESP_IM(BRESP_IM0_int),
                     .BREADY_MI(BREADY_MI0),

                     // SLAVE 0
                     .RID_SI0(RID_SI0),
                     .RVALID_SI0(RVALID_SI0),
                     .RRESP_SI0(RRESP_SI0),
                     .RDATA_SI0(RDATA_SI0),
                     .RLAST_SI0(RLAST_SI0),

                     .BID_SI0(BID_SI0),
                     .BVALID_SI0(BVALID_SI0),
                     .BRESP_SI0(BRESP_SI0),

                     
                     // SLAVE 1
                     .RID_SI1(RID_SI1),
                     .RVALID_SI1(RVALID_SI1),
                     .RRESP_SI1(RRESP_SI1),
                     .RDATA_SI1(RDATA_SI1),
                     .RLAST_SI1(RLAST_SI1),

                     .BID_SI1(BID_SI1),
                     .BVALID_SI1(BVALID_SI1),
                     .BRESP_SI1(BRESP_SI1),

                     
                     // SLAVE 2
                     .RID_SI2(RID_SI2),
                     .RVALID_SI2(RVALID_SI2),
                     .RRESP_SI2(RRESP_SI2),
                     .RDATA_SI2(RDATA_SI2),
                     .RLAST_SI2(RLAST_SI2),

                     .BID_SI2(BID_SI2),
                     .BVALID_SI2(BVALID_SI2),
                     .BRESP_SI2(BRESP_SI2),

                     
                     
                     // SLAVE 3
                     .RID_SI3(RID_SI3),
                     .RVALID_SI3(RVALID_SI3),
                     .RRESP_SI3(RRESP_SI3),
                     .RDATA_SI3(RDATA_SI3),
                     .RLAST_SI3(RLAST_SI3),

                     .BID_SI3(BID_SI3),
                     .BVALID_SI3(BVALID_SI3),
                     .BRESP_SI3(BRESP_SI3),

                     
                     // SLAVE 4
                     .RID_SI4(RID_SI4),
                     .RVALID_SI4(RVALID_SI4),
                     .RRESP_SI4(RRESP_SI4),
                     .RDATA_SI4(RDATA_SI4),
                     .RLAST_SI4(RLAST_SI4),

                     .BID_SI4(BID_SI4),
                     .BVALID_SI4(BVALID_SI4),
                     .BRESP_SI4(BRESP_SI4),

                     
                     // SLAVE 5
                     .RID_SI5(RID_SI5),
                     .RVALID_SI5(RVALID_SI5),
                     .RRESP_SI5(RRESP_SI5),
                     .RDATA_SI5(RDATA_SI5),
                     .RLAST_SI5(RLAST_SI5),

                     .BID_SI5(BID_SI5),
                     .BVALID_SI5(BVALID_SI5),
                     .BRESP_SI5(BRESP_SI5),

                     
                     // SLAVE 6
                     .RID_SI6(RID_SI6),
                     .RVALID_SI6(RVALID_SI6),
                     .RRESP_SI6(RRESP_SI6),
                     .RDATA_SI6(RDATA_SI6),
                     .RLAST_SI6(RLAST_SI6),

                     .BID_SI6(BID_SI6),
                     .BVALID_SI6(BVALID_SI6),
                     .BRESP_SI6(BRESP_SI6),

                     
                     // SLAVE 7
                     .RID_SI7(RID_SI7),
                     .RVALID_SI7(RVALID_SI7),
                     .RRESP_SI7(RRESP_SI7),
                     .RDATA_SI7(RDATA_SI7),
                     .RLAST_SI7(RLAST_SI7),

                     .BID_SI7(BID_SI7),
                     .BVALID_SI7(BVALID_SI7),
                     .BRESP_SI7(BRESP_SI7),

                     
                     // SLAVE 8
                     .RID_SI8(RID_SI8),
                     .RVALID_SI8(RVALID_SI8),
                     .RRESP_SI8(RRESP_SI8),
                     .RDATA_SI8(RDATA_SI8),
                     .RLAST_SI8(RLAST_SI8),

                     .BID_SI8(BID_SI8),
                     .BVALID_SI8(BVALID_SI8),
                     .BRESP_SI8(BRESP_SI8),

                     
                     // SLAVE 9
                     .RID_SI9(RID_SI9),
                     .RVALID_SI9(RVALID_SI9),
                     .RRESP_SI9(RRESP_SI9),
                     .RDATA_SI9(RDATA_SI9),
                     .RLAST_SI9(RLAST_SI9),

                     .BID_SI9(BID_SI9),
                     .BVALID_SI9(BVALID_SI9),
                     .BRESP_SI9(BRESP_SI9),

                     
                     // SLAVE 10
                     .RID_SI10(RID_SI10),
                     .RVALID_SI10(RVALID_SI10),
                     .RRESP_SI10(RRESP_SI10),
                     .RDATA_SI10(RDATA_SI10),
                     .RLAST_SI10(RLAST_SI10),

                     .BID_SI10(BID_SI10),
                     .BVALID_SI10(BVALID_SI10),
                     .BRESP_SI10(BRESP_SI10),

                     
                     // SLAVE 11
                     .RID_SI11(RID_SI11),
                     .RVALID_SI11(RVALID_SI11),
                     .RRESP_SI11(RRESP_SI11),
                     .RDATA_SI11(RDATA_SI11),
                     .RLAST_SI11(RLAST_SI11),

                     .BID_SI11(BID_SI11),
                     .BVALID_SI11(BVALID_SI11),
                     .BRESP_SI11(BRESP_SI11),

                     
                     // SLAVE 12
                     .RID_SI12(RID_SI12),
                     .RVALID_SI12(RVALID_SI12),
                     .RRESP_SI12(RRESP_SI12),
                     .RDATA_SI12(RDATA_SI12),
                     .RLAST_SI12(RLAST_SI12),

                     .BID_SI12(BID_SI12),
                     .BVALID_SI12(BVALID_SI12),
                     .BRESP_SI12(BRESP_SI12),

                     
                     // SLAVE 13
                     .RID_SI13(RID_SI13),
                     .RVALID_SI13(RVALID_SI13),
                     .RRESP_SI13(RRESP_SI13),
                     .RDATA_SI13(RDATA_SI13),
                     .RLAST_SI13(RLAST_SI13),

                     .BID_SI13(BID_SI13),
                     .BVALID_SI13(BVALID_SI13),
                     .BRESP_SI13(BRESP_SI13),

                     
                     // SLAVE 14
                     .RID_SI14(RID_SI14),
                     .RVALID_SI14(RVALID_SI14),
                     .RRESP_SI14(RRESP_SI14),
                     .RDATA_SI14(RDATA_SI14),
                     .RLAST_SI14(RLAST_SI14),

                     .BID_SI14(BID_SI14),
                     .BVALID_SI14(BVALID_SI14),
                     .BRESP_SI14(BRESP_SI14),

                 
                     // SLAVE 15
                     .RID_SI15(RID_SI15),
                     .RVALID_SI15(RVALID_SI15),
                     .RRESP_SI15(RRESP_SI15),
                     .RDATA_SI15(RDATA_SI15),
                     .RLAST_SI15(RLAST_SI15),

                     .BID_SI15(BID_SI15),
                     .BVALID_SI15(BVALID_SI15),
                     .BRESP_SI15(BRESP_SI15),

                     
                     // SLAVE 16
                     .RID_SI16(RID_SI16),
                     .RVALID_SI16(RVALID_SI16),
                     .RRESP_SI16(RRESP_SI16),
                     .RDATA_SI16(RDATA_SI16),
                     .RLAST_SI16(RLAST_SI16),

                     .BID_SI16(BID_SI16),
                     .BVALID_SI16(BVALID_SI16),
                     .BRESP_SI16(BRESP_SI16),

                 
                     // From Master
                     .RREADY_IS0(RREADY_M0IS0),
                     .RREADY_IS1(RREADY_M0IS1),
                     .RREADY_IS2(RREADY_M0IS2),
                     .RREADY_IS3(RREADY_M0IS3),
                     .RREADY_IS4(RREADY_M0IS4),
                     .RREADY_IS5(RREADY_M0IS5),
                     .RREADY_IS6(RREADY_M0IS6),
                     .RREADY_IS7(RREADY_M0IS7),
                     .RREADY_IS8(RREADY_M0IS8),
                     .RREADY_IS9(RREADY_M0IS9),
                     .RREADY_IS10(RREADY_M0IS10),
                     .RREADY_IS11(RREADY_M0IS11),
                     .RREADY_IS12(RREADY_M0IS12),
                     .RREADY_IS13(RREADY_M0IS13),
                     .RREADY_IS14(RREADY_M0IS14),
                     .RREADY_IS15(RREADY_M0IS15),
                     .RREADY_IS16(RREADY_M0IS16),

                     // From Master
                     .BREADY_IS0(BREADY_M0IS0),
                     .BREADY_IS1(BREADY_M0IS1),
                     .BREADY_IS2(BREADY_M0IS2),
                     .BREADY_IS3(BREADY_M0IS3),
                     .BREADY_IS4(BREADY_M0IS4),
                     .BREADY_IS5(BREADY_M0IS5),
                     .BREADY_IS6(BREADY_M0IS6),
                     .BREADY_IS7(BREADY_M0IS7),
                     .BREADY_IS8(BREADY_M0IS8),
                     .BREADY_IS9(BREADY_M0IS9),
                     .BREADY_IS10(BREADY_M0IS10),
                     .BREADY_IS11(BREADY_M0IS11),
                     .BREADY_IS12(BREADY_M0IS12),
                     .BREADY_IS13(BREADY_M0IS13),
                     .BREADY_IS14(BREADY_M0IS14),
                     .BREADY_IS15(BREADY_M0IS15),
                     .BREADY_IS16(BREADY_M0IS16)
                     ,.pend_id_addr0(pend_id_addr0)  
                     ,.pend_id_addr1(pend_id_addr1)  
                     ,.pend_id_addr2(pend_id_addr2)  
                     ,.pend_id_addr3(pend_id_addr3)  
                     ,.pend_id_addr4(pend_id_addr4)  
                     ,.pend_id_addr5(pend_id_addr5)  
                     ,.pend_id_addr6(pend_id_addr6)  
                     ,.pend_id_addr7(pend_id_addr7)  
                     ,.pend_id_addr8(pend_id_addr8)  
                     ,.pend_id_addr9(pend_id_addr9)  
                     ,.pend_id_addr10(pend_id_addr10)
                     ,.pend_id_addr11(pend_id_addr11)
                     ,.pend_id_addr12(pend_id_addr12)
                     ,.pend_id_addr13(pend_id_addr13)
                     ,.pend_id_addr14(pend_id_addr14)
                     ,.pend_id_addr15(pend_id_addr15)
                     ,.pend_id_addr16(pend_id_addr16)
                     ,.pend_id_en0(pend_id_en0)      
                     ,.pend_id_en1(pend_id_en1)      
                     ,.pend_id_en2(pend_id_en2)      
                     ,.pend_id_en3(pend_id_en3)      
                     ,.pend_id_en4(pend_id_en4)      
                     ,.pend_id_en5(pend_id_en5)      
                     ,.pend_id_en6(pend_id_en6)      
                     ,.pend_id_en7(pend_id_en7)      
                     ,.pend_id_en8(pend_id_en8)      
                     ,.pend_id_en9(pend_id_en9)      
                     ,.pend_id_en10(pend_id_en10)    
                     ,.pend_id_en11(pend_id_en11)    
                     ,.pend_id_en12(pend_id_en12)    
                     ,.pend_id_en13(pend_id_en13)    
                     ,.pend_id_en14(pend_id_en14)    
                     ,.pend_id_en15(pend_id_en15)    
                     ,.pend_id_en16(pend_id_en16)    

                     ,.outstnd_waddr0(outstnd_waddr0)
                     ,.outstnd_waddr1(outstnd_waddr1)
                     ,.outstnd_waddr2(outstnd_waddr2)
                     ,.outstnd_waddr3(outstnd_waddr3)
                     ,.outstnd_waddr4(outstnd_waddr4)
                     ,.outstnd_waddr5(outstnd_waddr5)
                     ,.outstnd_waddr6(outstnd_waddr6)
                     ,.outstnd_waddr7(outstnd_waddr7)
                     ,.outstnd_waddr8(outstnd_waddr8)
                     ,.outstnd_waddr9(outstnd_waddr9)
                     ,.outstnd_waddr10(outstnd_waddr10)
                     ,.outstnd_waddr11(outstnd_waddr11)
                     ,.outstnd_waddr12(outstnd_waddr12)
                     ,.outstnd_waddr13(outstnd_waddr13)
                     ,.outstnd_waddr14(outstnd_waddr14)
                     ,.outstnd_waddr15(outstnd_waddr15)
                     ,.outstnd_waddr16(outstnd_waddr16)
                     ,.outstnd_waddr_en0(outstnd_waddr_en0)   
                     ,.outstnd_waddr_en1(outstnd_waddr_en1)   
                     ,.outstnd_waddr_en2(outstnd_waddr_en2)   
                     ,.outstnd_waddr_en3(outstnd_waddr_en3)   
                     ,.outstnd_waddr_en4(outstnd_waddr_en4)   
                     ,.outstnd_waddr_en5(outstnd_waddr_en5)   
                     ,.outstnd_waddr_en6(outstnd_waddr_en6)   
                     ,.outstnd_waddr_en7(outstnd_waddr_en7)   
                     ,.outstnd_waddr_en8(outstnd_waddr_en8)   
                     ,.outstnd_waddr_en9(outstnd_waddr_en9)   
                     ,.outstnd_waddr_en10(outstnd_waddr_en10) 
                     ,.outstnd_waddr_en11(outstnd_waddr_en11) 
                     ,.outstnd_waddr_en12(outstnd_waddr_en12) 
                     ,.outstnd_waddr_en13(outstnd_waddr_en13) 
                     ,.outstnd_waddr_en14(outstnd_waddr_en14) 
                     ,.outstnd_waddr_en15(outstnd_waddr_en15) 
                     ,.outstnd_waddr_en16(outstnd_waddr_en16) 


                     );
                     
   generate 
      if(NUM_MASTER_SLOT > 1) begin

         axi_matrix_m #(
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
     inst_matrix_m1 (
                     // Global signals
                     .ACLK(ACLK),
                     .ARESETN(ARESETN),
                     
                     // AXI MASTER read response channel signals
                     .RID_IM(RID_IM1_int),
                     .RDATA_IM(RDATA_IM1_int),
                     .RRESP_IM(RRESP_IM1_int),
                     .RLAST_IM(RLAST_IM1_int),
                     .RVALID_IM(RVALID_IM1_int),
                     .RREADY_MI(RREADY_MI1),
                     
                     .BID_IM  (BID_IM1_int),
                     .BVALID_IM(BVALID_IM1_int),
                     .BRESP_IM(BRESP_IM1_int),
                     .BREADY_MI(BREADY_MI1),

                     // SLAVE 0
                     .RID_SI0(RID_SI0),
                     .RVALID_SI0(RVALID_SI0),
                     .RRESP_SI0(RRESP_SI0),
                     .RDATA_SI0(RDATA_SI0),
                     .RLAST_SI0(RLAST_SI0),

                     .BID_SI0(BID_SI0),
                     .BVALID_SI0(BVALID_SI0),
                     .BRESP_SI0(BRESP_SI0),

                     
                     // SLAVE 1
                     .RID_SI1(RID_SI1),
                     .RVALID_SI1(RVALID_SI1),
                     .RRESP_SI1(RRESP_SI1),
                     .RDATA_SI1(RDATA_SI1),
                     .RLAST_SI1(RLAST_SI1),

                     .BID_SI1(BID_SI1),
                     .BVALID_SI1(BVALID_SI1),
                     .BRESP_SI1(BRESP_SI1),

                     
                     // SLAVE 2
                     .RID_SI2(RID_SI2),
                     .RVALID_SI2(RVALID_SI2),
                     .RRESP_SI2(RRESP_SI2),
                     .RDATA_SI2(RDATA_SI2),
                     .RLAST_SI2(RLAST_SI2),

                     .BID_SI2(BID_SI2),
                     .BVALID_SI2(BVALID_SI2),
                     .BRESP_SI2(BRESP_SI2),

                     
                     
                     // SLAVE 3
                     .RID_SI3(RID_SI3),
                     .RVALID_SI3(RVALID_SI3),
                     .RRESP_SI3(RRESP_SI3),
                     .RDATA_SI3(RDATA_SI3),
                     .RLAST_SI3(RLAST_SI3),

                     .BID_SI3(BID_SI3),
                     .BVALID_SI3(BVALID_SI3),
                     .BRESP_SI3(BRESP_SI3),

                     
                     // SLAVE 4
                     .RID_SI4(RID_SI4),
                     .RVALID_SI4(RVALID_SI4),
                     .RRESP_SI4(RRESP_SI4),
                     .RDATA_SI4(RDATA_SI4),
                     .RLAST_SI4(RLAST_SI4),

                     .BID_SI4(BID_SI4),
                     .BVALID_SI4(BVALID_SI4),
                     .BRESP_SI4(BRESP_SI4),

                     
                     // SLAVE 5
                     .RID_SI5(RID_SI5),
                     .RVALID_SI5(RVALID_SI5),
                     .RRESP_SI5(RRESP_SI5),
                     .RDATA_SI5(RDATA_SI5),
                     .RLAST_SI5(RLAST_SI5),

                     .BID_SI5(BID_SI5),
                     .BVALID_SI5(BVALID_SI5),
                     .BRESP_SI5(BRESP_SI5),

                     
                     // SLAVE 6
                     .RID_SI6(RID_SI6),
                     .RVALID_SI6(RVALID_SI6),
                     .RRESP_SI6(RRESP_SI6),
                     .RDATA_SI6(RDATA_SI6),
                     .RLAST_SI6(RLAST_SI6),

                     .BID_SI6(BID_SI6),
                     .BVALID_SI6(BVALID_SI6),
                     .BRESP_SI6(BRESP_SI6),

                     
                     // SLAVE 7
                     .RID_SI7(RID_SI7),
                     .RVALID_SI7(RVALID_SI7),
                     .RRESP_SI7(RRESP_SI7),
                     .RDATA_SI7(RDATA_SI7),
                     .RLAST_SI7(RLAST_SI7),

                     .BID_SI7(BID_SI7),
                     .BVALID_SI7(BVALID_SI7),
                     .BRESP_SI7(BRESP_SI7),

                     
                     // SLAVE 8
                     .RID_SI8(RID_SI8),
                     .RVALID_SI8(RVALID_SI8),
                     .RRESP_SI8(RRESP_SI8),
                     .RDATA_SI8(RDATA_SI8),
                     .RLAST_SI8(RLAST_SI8),

                     .BID_SI8(BID_SI8),
                     .BVALID_SI8(BVALID_SI8),
                     .BRESP_SI8(BRESP_SI8),

                     
                     // SLAVE 9
                     .RID_SI9(RID_SI9),
                     .RVALID_SI9(RVALID_SI9),
                     .RRESP_SI9(RRESP_SI9),
                     .RDATA_SI9(RDATA_SI9),
                     .RLAST_SI9(RLAST_SI9),

                     .BID_SI9(BID_SI9),
                     .BVALID_SI9(BVALID_SI9),
                     .BRESP_SI9(BRESP_SI9),

                     
                     // SLAVE 10
                     .RID_SI10(RID_SI10),
                     .RVALID_SI10(RVALID_SI10),
                     .RRESP_SI10(RRESP_SI10),
                     .RDATA_SI10(RDATA_SI10),
                     .RLAST_SI10(RLAST_SI10),

                     .BID_SI10(BID_SI10),
                     .BVALID_SI10(BVALID_SI10),
                     .BRESP_SI10(BRESP_SI10),

                     
                     // SLAVE 11
                     .RID_SI11(RID_SI11),
                     .RVALID_SI11(RVALID_SI11),
                     .RRESP_SI11(RRESP_SI11),
                     .RDATA_SI11(RDATA_SI11),
                     .RLAST_SI11(RLAST_SI11),

                     .BID_SI11(BID_SI11),
                     .BVALID_SI11(BVALID_SI11),
                     .BRESP_SI11(BRESP_SI11),

                     
                     // SLAVE 12
                     .RID_SI12(RID_SI12),
                     .RVALID_SI12(RVALID_SI12),
                     .RRESP_SI12(RRESP_SI12),
                     .RDATA_SI12(RDATA_SI12),
                     .RLAST_SI12(RLAST_SI12),

                     .BID_SI12(BID_SI12),
                     .BVALID_SI12(BVALID_SI12),
                     .BRESP_SI12(BRESP_SI12),

                     
                     // SLAVE 13
                     .RID_SI13(RID_SI13),
                     .RVALID_SI13(RVALID_SI13),
                     .RRESP_SI13(RRESP_SI13),
                     .RDATA_SI13(RDATA_SI13),
                     .RLAST_SI13(RLAST_SI13),

                     .BID_SI13(BID_SI13),
                     .BVALID_SI13(BVALID_SI13),
                     .BRESP_SI13(BRESP_SI13),

                     
                     // SLAVE 14
                     .RID_SI14(RID_SI14),
                     .RVALID_SI14(RVALID_SI14),
                     .RRESP_SI14(RRESP_SI14),
                     .RDATA_SI14(RDATA_SI14),
                     .RLAST_SI14(RLAST_SI14),

                     .BID_SI14(BID_SI14),
                     .BVALID_SI14(BVALID_SI14),
                     .BRESP_SI14(BRESP_SI14),

                 
                     // SLAVE 15
                     .RID_SI15(RID_SI15),
                     .RVALID_SI15(RVALID_SI15),
                     .RRESP_SI15(RRESP_SI15),
                     .RDATA_SI15(RDATA_SI15),
                     .RLAST_SI15(RLAST_SI15),

                     .BID_SI15(BID_SI15),
                     .BVALID_SI15(BVALID_SI15),
                     .BRESP_SI15(BRESP_SI15),

                     
                     // SLAVE 16
                     .RID_SI16(RID_SI16),
                     .RVALID_SI16(RVALID_SI16),
                     .RRESP_SI16(RRESP_SI16),
                     .RDATA_SI16(RDATA_SI16),
                     .RLAST_SI16(RLAST_SI16),

                     .BID_SI16(BID_SI16),
                     .BVALID_SI16(BVALID_SI16),
                     .BRESP_SI16(BRESP_SI16),

                 
                     // From Master
                     .RREADY_IS0(RREADY_M1IS0),
                     .RREADY_IS1(RREADY_M1IS1),
                     .RREADY_IS2(RREADY_M1IS2),
                     .RREADY_IS3(RREADY_M1IS3),
                     .RREADY_IS4(RREADY_M1IS4),
                     .RREADY_IS5(RREADY_M1IS5),
                     .RREADY_IS6(RREADY_M1IS6),
                     .RREADY_IS7(RREADY_M1IS7),
                     .RREADY_IS8(RREADY_M1IS8),
                     .RREADY_IS9(RREADY_M1IS9),
                     .RREADY_IS10(RREADY_M1IS10),
                     .RREADY_IS11(RREADY_M1IS11),
                     .RREADY_IS12(RREADY_M1IS12),
                     .RREADY_IS13(RREADY_M1IS13),
                     .RREADY_IS14(RREADY_M1IS14),
                     .RREADY_IS15(RREADY_M1IS15),
                     .RREADY_IS16(RREADY_M1IS16),

                     // From Master
                     .BREADY_IS0(BREADY_M1IS0),
                     .BREADY_IS1(BREADY_M1IS1),
                     .BREADY_IS2(BREADY_M1IS2),
                     .BREADY_IS3(BREADY_M1IS3),
                     .BREADY_IS4(BREADY_M1IS4),
                     .BREADY_IS5(BREADY_M1IS5),
                     .BREADY_IS6(BREADY_M1IS6),
                     .BREADY_IS7(BREADY_M1IS7),
                     .BREADY_IS8(BREADY_M1IS8),
                     .BREADY_IS9(BREADY_M1IS9),
                     .BREADY_IS10(BREADY_M1IS10),
                     .BREADY_IS11(BREADY_M1IS11),
                     .BREADY_IS12(BREADY_M1IS12),
                     .BREADY_IS13(BREADY_M1IS13),
                     .BREADY_IS14(BREADY_M1IS14),
                     .BREADY_IS15(BREADY_M1IS15),
                     .BREADY_IS16(BREADY_M1IS16)
                     ,.pend_id_addr0(pend_id_addr0)  
                     ,.pend_id_addr1(pend_id_addr1)  
                     ,.pend_id_addr2(pend_id_addr2)  
                     ,.pend_id_addr3(pend_id_addr3)  
                     ,.pend_id_addr4(pend_id_addr4)  
                     ,.pend_id_addr5(pend_id_addr5)  
                     ,.pend_id_addr6(pend_id_addr6)  
                     ,.pend_id_addr7(pend_id_addr7)  
                     ,.pend_id_addr8(pend_id_addr8)  
                     ,.pend_id_addr9(pend_id_addr9)  
                     ,.pend_id_addr10(pend_id_addr10)  
                     ,.pend_id_addr11(pend_id_addr11)  
                     ,.pend_id_addr12(pend_id_addr12)  
                     ,.pend_id_addr13(pend_id_addr13)  
                     ,.pend_id_addr14(pend_id_addr14)  
                     ,.pend_id_addr15(pend_id_addr15)  
                     ,.pend_id_addr16(pend_id_addr16)  
                     ,.pend_id_en0(pend_id_en0)      
                     ,.pend_id_en1(pend_id_en1)      
                     ,.pend_id_en2(pend_id_en2)      
                     ,.pend_id_en3(pend_id_en3)      
                     ,.pend_id_en4(pend_id_en4)      
                     ,.pend_id_en5(pend_id_en5)      
                     ,.pend_id_en6(pend_id_en6)      
                     ,.pend_id_en7(pend_id_en7)      
                     ,.pend_id_en8(pend_id_en8)      
                     ,.pend_id_en9(pend_id_en9)      
                     ,.pend_id_en10(pend_id_en10)      
                     ,.pend_id_en11(pend_id_en11)      
                     ,.pend_id_en12(pend_id_en12)      
                     ,.pend_id_en13(pend_id_en13)      
                     ,.pend_id_en14(pend_id_en14)      
                     ,.pend_id_en15(pend_id_en15)      
                     ,.pend_id_en16(pend_id_en16)      

                     ,.outstnd_waddr0(outstnd_waddr0)  
                     ,.outstnd_waddr1(outstnd_waddr1)  
                     ,.outstnd_waddr2(outstnd_waddr2)  
                     ,.outstnd_waddr3(outstnd_waddr3)  
                     ,.outstnd_waddr4(outstnd_waddr4)  
                     ,.outstnd_waddr5(outstnd_waddr5)  
                     ,.outstnd_waddr6(outstnd_waddr6)  
                     ,.outstnd_waddr7(outstnd_waddr7)  
                     ,.outstnd_waddr8(outstnd_waddr8)  
                     ,.outstnd_waddr9(outstnd_waddr9)  
                     ,.outstnd_waddr10(outstnd_waddr10)  
                     ,.outstnd_waddr11(outstnd_waddr11)  
                     ,.outstnd_waddr12(outstnd_waddr12)  
                     ,.outstnd_waddr13(outstnd_waddr13)  
                     ,.outstnd_waddr14(outstnd_waddr14)  
                     ,.outstnd_waddr15(outstnd_waddr15)  
                     ,.outstnd_waddr16(outstnd_waddr16)  
                     ,.outstnd_waddr_en0(outstnd_waddr_en0)      
                     ,.outstnd_waddr_en1(outstnd_waddr_en1)      
                     ,.outstnd_waddr_en2(outstnd_waddr_en2)      
                     ,.outstnd_waddr_en3(outstnd_waddr_en3)      
                     ,.outstnd_waddr_en4(outstnd_waddr_en4)      
                     ,.outstnd_waddr_en5(outstnd_waddr_en5)      
                     ,.outstnd_waddr_en6(outstnd_waddr_en6)      
                     ,.outstnd_waddr_en7(outstnd_waddr_en7)      
                     ,.outstnd_waddr_en8(outstnd_waddr_en8)      
                     ,.outstnd_waddr_en9(outstnd_waddr_en9)      
                     ,.outstnd_waddr_en10(outstnd_waddr_en10)      
                     ,.outstnd_waddr_en11(outstnd_waddr_en11)      
                     ,.outstnd_waddr_en12(outstnd_waddr_en12)      
                     ,.outstnd_waddr_en13(outstnd_waddr_en13)      
                     ,.outstnd_waddr_en14(outstnd_waddr_en14)      
                     ,.outstnd_waddr_en15(outstnd_waddr_en15)      
                     ,.outstnd_waddr_en16(outstnd_waddr_en16)      

                     );
      end                     
   endgenerate

   generate 
      if(NUM_MASTER_SLOT > 2) begin
   
   axi_matrix_m #(
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
     inst_matrix_m2 (
                     // Global signals
                     .ACLK(ACLK),
                     .ARESETN(ARESETN),
                     
                     // AXI MASTER read response channel signals
                     .RID_IM(RID_IM2_int),
                     .RDATA_IM(RDATA_IM2_int),
                     .RRESP_IM(RRESP_IM2_int),
                     .RLAST_IM(RLAST_IM2_int),
                     .RVALID_IM(RVALID_IM2_int),
                     .RREADY_MI(RREADY_MI2),
                     
                     .BID_IM   (BID_IM2_int),
                     .BRESP_IM (BRESP_IM2_int),
                     .BVALID_IM(BVALID_IM2_int),
                     .BREADY_MI(BREADY_MI2),

                     // SLAVE 0
                     .RID_SI0(RID_SI0),
                     .RVALID_SI0(RVALID_SI0),
                     .RRESP_SI0(RRESP_SI0),
                     .RDATA_SI0(RDATA_SI0),
                     .RLAST_SI0(RLAST_SI0),

                     .BID_SI0(BID_SI0),
                     .BVALID_SI0(BVALID_SI0),
                     .BRESP_SI0(BRESP_SI0),

                     
                     // SLAVE 1
                     .RID_SI1(RID_SI1),
                     .RVALID_SI1(RVALID_SI1),
                     .RRESP_SI1(RRESP_SI1),
                     .RDATA_SI1(RDATA_SI1),
                     .RLAST_SI1(RLAST_SI1),

                     .BID_SI1(BID_SI1),
                     .BVALID_SI1(BVALID_SI1),
                     .BRESP_SI1(BRESP_SI1),

                     
                     // SLAVE 2
                     .RID_SI2(RID_SI2),
                     .RVALID_SI2(RVALID_SI2),
                     .RRESP_SI2(RRESP_SI2),
                     .RDATA_SI2(RDATA_SI2),
                     .RLAST_SI2(RLAST_SI2),

                     .BID_SI2(BID_SI2),
                     .BVALID_SI2(BVALID_SI2),
                     .BRESP_SI2(BRESP_SI2),

                     
                     
                     // SLAVE 3
                     .RID_SI3(RID_SI3),
                     .RVALID_SI3(RVALID_SI3),
                     .RRESP_SI3(RRESP_SI3),
                     .RDATA_SI3(RDATA_SI3),
                     .RLAST_SI3(RLAST_SI3),

                     .BID_SI3(BID_SI3),
                     .BVALID_SI3(BVALID_SI3),
                     .BRESP_SI3(BRESP_SI3),

                     
                     // SLAVE 4
                     .RID_SI4(RID_SI4),
                     .RVALID_SI4(RVALID_SI4),
                     .RRESP_SI4(RRESP_SI4),
                     .RDATA_SI4(RDATA_SI4),
                     .RLAST_SI4(RLAST_SI4),

                     .BID_SI4(BID_SI4),
                     .BVALID_SI4(BVALID_SI4),
                     .BRESP_SI4(BRESP_SI4),

                     
                     // SLAVE 5
                     .RID_SI5(RID_SI5),
                     .RVALID_SI5(RVALID_SI5),
                     .RRESP_SI5(RRESP_SI5),
                     .RDATA_SI5(RDATA_SI5),
                     .RLAST_SI5(RLAST_SI5),

                     .BID_SI5(BID_SI5),
                     .BVALID_SI5(BVALID_SI5),
                     .BRESP_SI5(BRESP_SI5),

                     
                     // SLAVE 6
                     .RID_SI6(RID_SI6),
                     .RVALID_SI6(RVALID_SI6),
                     .RRESP_SI6(RRESP_SI6),
                     .RDATA_SI6(RDATA_SI6),
                     .RLAST_SI6(RLAST_SI6),

                     .BID_SI6(BID_SI6),
                     .BVALID_SI6(BVALID_SI6),
                     .BRESP_SI6(BRESP_SI6),

                     
                     // SLAVE 7
                     .RID_SI7(RID_SI7),
                     .RVALID_SI7(RVALID_SI7),
                     .RRESP_SI7(RRESP_SI7),
                     .RDATA_SI7(RDATA_SI7),
                     .RLAST_SI7(RLAST_SI7),

                     .BID_SI7(BID_SI7),
                     .BVALID_SI7(BVALID_SI7),
                     .BRESP_SI7(BRESP_SI7),

                     
                     // SLAVE 8
                     .RID_SI8(RID_SI8),
                     .RVALID_SI8(RVALID_SI8),
                     .RRESP_SI8(RRESP_SI8),
                     .RDATA_SI8(RDATA_SI8),
                     .RLAST_SI8(RLAST_SI8),

                     .BID_SI8(BID_SI8),
                     .BVALID_SI8(BVALID_SI8),
                     .BRESP_SI8(BRESP_SI8),

                     
                     // SLAVE 9
                     .RID_SI9(RID_SI9),
                     .RVALID_SI9(RVALID_SI9),
                     .RRESP_SI9(RRESP_SI9),
                     .RDATA_SI9(RDATA_SI9),
                     .RLAST_SI9(RLAST_SI9),

                     .BID_SI9(BID_SI9),
                     .BVALID_SI9(BVALID_SI9),
                     .BRESP_SI9(BRESP_SI9),

                     
                     // SLAVE 10
                     .RID_SI10(RID_SI10),
                     .RVALID_SI10(RVALID_SI10),
                     .RRESP_SI10(RRESP_SI10),
                     .RDATA_SI10(RDATA_SI10),
                     .RLAST_SI10(RLAST_SI10),

                     .BID_SI10(BID_SI10),
                     .BVALID_SI10(BVALID_SI10),
                     .BRESP_SI10(BRESP_SI10),

                     
                     // SLAVE 11
                     .RID_SI11(RID_SI11),
                     .RVALID_SI11(RVALID_SI11),
                     .RRESP_SI11(RRESP_SI11),
                     .RDATA_SI11(RDATA_SI11),
                     .RLAST_SI11(RLAST_SI11),

                     .BID_SI11(BID_SI11),
                     .BVALID_SI11(BVALID_SI11),
                     .BRESP_SI11(BRESP_SI11),

                     
                     // SLAVE 12
                     .RID_SI12(RID_SI12),
                     .RVALID_SI12(RVALID_SI12),
                     .RRESP_SI12(RRESP_SI12),
                     .RDATA_SI12(RDATA_SI12),
                     .RLAST_SI12(RLAST_SI12),

                     .BID_SI12(BID_SI12),
                     .BVALID_SI12(BVALID_SI12),
                     .BRESP_SI12(BRESP_SI12),

                     
                     // SLAVE 13
                     .RID_SI13(RID_SI13),
                     .RVALID_SI13(RVALID_SI13),
                     .RRESP_SI13(RRESP_SI13),
                     .RDATA_SI13(RDATA_SI13),
                     .RLAST_SI13(RLAST_SI13),

                     .BID_SI13(BID_SI13),
                     .BVALID_SI13(BVALID_SI13),
                     .BRESP_SI13(BRESP_SI13),

                     
                     // SLAVE 14
                     .RID_SI14(RID_SI14),
                     .RVALID_SI14(RVALID_SI14),
                     .RRESP_SI14(RRESP_SI14),
                     .RDATA_SI14(RDATA_SI14),
                     .RLAST_SI14(RLAST_SI14),

                     .BID_SI14(BID_SI14),
                     .BVALID_SI14(BVALID_SI14),
                     .BRESP_SI14(BRESP_SI14),

                 
                     // SLAVE 15
                     .RID_SI15(RID_SI15),
                     .RVALID_SI15(RVALID_SI15),
                     .RRESP_SI15(RRESP_SI15),
                     .RDATA_SI15(RDATA_SI15),
                     .RLAST_SI15(RLAST_SI15),

                     .BID_SI15(BID_SI15),
                     .BVALID_SI15(BVALID_SI15),
                     .BRESP_SI15(BRESP_SI15),

                     
                     // SLAVE 16
                     .RID_SI16(RID_SI16),
                     .RVALID_SI16(RVALID_SI16),
                     .RRESP_SI16(RRESP_SI16),
                     .RDATA_SI16(RDATA_SI16),
                     .RLAST_SI16(RLAST_SI16),

                     .BID_SI16(BID_SI16),
                     .BVALID_SI16(BVALID_SI16),
                     .BRESP_SI16(BRESP_SI16),

                 
                     // From Master
                     .RREADY_IS0(RREADY_M2IS0),
                     .RREADY_IS1(RREADY_M2IS1),
                     .RREADY_IS2(RREADY_M2IS2),
                     .RREADY_IS3(RREADY_M2IS3),
                     .RREADY_IS4(RREADY_M2IS4),
                     .RREADY_IS5(RREADY_M2IS5),
                     .RREADY_IS6(RREADY_M2IS6),
                     .RREADY_IS7(RREADY_M2IS7),
                     .RREADY_IS8(RREADY_M2IS8),
                     .RREADY_IS9(RREADY_M2IS9),
                     .RREADY_IS10(RREADY_M2IS10),
                     .RREADY_IS11(RREADY_M2IS11),
                     .RREADY_IS12(RREADY_M2IS12),
                     .RREADY_IS13(RREADY_M2IS13),
                     .RREADY_IS14(RREADY_M2IS14),
                     .RREADY_IS15(RREADY_M2IS15),
                     .RREADY_IS16(RREADY_M2IS16),

                     // From Master
                     .BREADY_IS0(BREADY_M2IS0),
                     .BREADY_IS1(BREADY_M2IS1),
                     .BREADY_IS2(BREADY_M2IS2),
                     .BREADY_IS3(BREADY_M2IS3),
                     .BREADY_IS4(BREADY_M2IS4),
                     .BREADY_IS5(BREADY_M2IS5),
                     .BREADY_IS6(BREADY_M2IS6),
                     .BREADY_IS7(BREADY_M2IS7),
                     .BREADY_IS8(BREADY_M2IS8),
                     .BREADY_IS9(BREADY_M2IS9),
                     .BREADY_IS10(BREADY_M2IS10),
                     .BREADY_IS11(BREADY_M2IS11),
                     .BREADY_IS12(BREADY_M2IS12),
                     .BREADY_IS13(BREADY_M2IS13),
                     .BREADY_IS14(BREADY_M2IS14),
                     .BREADY_IS15(BREADY_M2IS15),
                     .BREADY_IS16(BREADY_M2IS16)
                     ,.pend_id_addr0(pend_id_addr0)  
                     ,.pend_id_addr1(pend_id_addr1)  
                     ,.pend_id_addr2(pend_id_addr2)  
                     ,.pend_id_addr3(pend_id_addr3)  
                     ,.pend_id_addr4(pend_id_addr4)  
                     ,.pend_id_addr5(pend_id_addr5)  
                     ,.pend_id_addr6(pend_id_addr6)  
                     ,.pend_id_addr7(pend_id_addr7)  
                     ,.pend_id_addr8(pend_id_addr8)  
                     ,.pend_id_addr9(pend_id_addr9)  
                     ,.pend_id_addr10(pend_id_addr10)  
                     ,.pend_id_addr11(pend_id_addr11)  
                     ,.pend_id_addr12(pend_id_addr12)  
                     ,.pend_id_addr13(pend_id_addr13)  
                     ,.pend_id_addr14(pend_id_addr14)  
                     ,.pend_id_addr15(pend_id_addr15)  
                     ,.pend_id_addr16(pend_id_addr16)  
                     ,.pend_id_en0(pend_id_en0)      
                     ,.pend_id_en1(pend_id_en1)      
                     ,.pend_id_en2(pend_id_en2)      
                     ,.pend_id_en3(pend_id_en3)      
                     ,.pend_id_en4(pend_id_en4)      
                     ,.pend_id_en5(pend_id_en5)      
                     ,.pend_id_en6(pend_id_en6)      
                     ,.pend_id_en7(pend_id_en7)      
                     ,.pend_id_en8(pend_id_en8)      
                     ,.pend_id_en9(pend_id_en9)      
                     ,.pend_id_en10(pend_id_en10)      
                     ,.pend_id_en11(pend_id_en11)      
                     ,.pend_id_en12(pend_id_en12)      
                     ,.pend_id_en13(pend_id_en13)      
                     ,.pend_id_en14(pend_id_en14)      
                     ,.pend_id_en15(pend_id_en15)      
                     ,.pend_id_en16(pend_id_en16)      

                     ,.outstnd_waddr0(outstnd_waddr0)  
                     ,.outstnd_waddr1(outstnd_waddr1)  
                     ,.outstnd_waddr2(outstnd_waddr2)  
                     ,.outstnd_waddr3(outstnd_waddr3)  
                     ,.outstnd_waddr4(outstnd_waddr4)  
                     ,.outstnd_waddr5(outstnd_waddr5)  
                     ,.outstnd_waddr6(outstnd_waddr6)  
                     ,.outstnd_waddr7(outstnd_waddr7)  
                     ,.outstnd_waddr8(outstnd_waddr8)  
                     ,.outstnd_waddr9(outstnd_waddr9)  
                     ,.outstnd_waddr10(outstnd_waddr10)  
                     ,.outstnd_waddr11(outstnd_waddr11)  
                     ,.outstnd_waddr12(outstnd_waddr12)  
                     ,.outstnd_waddr13(outstnd_waddr13)  
                     ,.outstnd_waddr14(outstnd_waddr14)  
                     ,.outstnd_waddr15(outstnd_waddr15)  
                     ,.outstnd_waddr16(outstnd_waddr16)  
                     ,.outstnd_waddr_en0(outstnd_waddr_en0)      
                     ,.outstnd_waddr_en1(outstnd_waddr_en1)      
                     ,.outstnd_waddr_en2(outstnd_waddr_en2)      
                     ,.outstnd_waddr_en3(outstnd_waddr_en3)      
                     ,.outstnd_waddr_en4(outstnd_waddr_en4)      
                     ,.outstnd_waddr_en5(outstnd_waddr_en5)      
                     ,.outstnd_waddr_en6(outstnd_waddr_en6)      
                     ,.outstnd_waddr_en7(outstnd_waddr_en7)      
                     ,.outstnd_waddr_en8(outstnd_waddr_en8)      
                     ,.outstnd_waddr_en9(outstnd_waddr_en9)      
                     ,.outstnd_waddr_en10(outstnd_waddr_en10)      
                     ,.outstnd_waddr_en11(outstnd_waddr_en11)      
                     ,.outstnd_waddr_en12(outstnd_waddr_en12)      
                     ,.outstnd_waddr_en13(outstnd_waddr_en13)      
                     ,.outstnd_waddr_en14(outstnd_waddr_en14)      
                     ,.outstnd_waddr_en15(outstnd_waddr_en15)      
                     ,.outstnd_waddr_en16(outstnd_waddr_en16)      

                     );
      end                     
   endgenerate                     

   generate 
      if(NUM_MASTER_SLOT > 3) begin

   axi_matrix_m #(
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
     inst_matrix_m3 (
                     // Global signals
                     .ACLK(ACLK),
                     .ARESETN(ARESETN),
                     
                     // AXI MASTER read response channel signals
                     .RID_IM(RID_IM3_int),
                     .RDATA_IM(RDATA_IM3_int),
                     .RRESP_IM(RRESP_IM3_int),
                     .RLAST_IM(RLAST_IM3_int),
                     .RVALID_IM(RVALID_IM3_int),
                     .RREADY_MI(RREADY_MI3),
                     
                     .BID_IM   (BID_IM3_int),
                     .BRESP_IM (BRESP_IM3_int),
                     .BVALID_IM(BVALID_IM3_int),
                     .BREADY_MI(BREADY_MI3),
                     // SLAVE 0
                     .RID_SI0(RID_SI0),
                     .RVALID_SI0(RVALID_SI0),
                     .RRESP_SI0(RRESP_SI0),
                     .RDATA_SI0(RDATA_SI0),
                     .RLAST_SI0(RLAST_SI0),

                     .BID_SI0(BID_SI0),
                     .BVALID_SI0(BVALID_SI0),
                     .BRESP_SI0(BRESP_SI0),

                     
                     // SLAVE 1
                     .RID_SI1(RID_SI1),
                     .RVALID_SI1(RVALID_SI1),
                     .RRESP_SI1(RRESP_SI1),
                     .RDATA_SI1(RDATA_SI1),
                     .RLAST_SI1(RLAST_SI1),

                     .BID_SI1(BID_SI1),
                     .BVALID_SI1(BVALID_SI1),
                     .BRESP_SI1(BRESP_SI1),

                     
                     // SLAVE 2
                     .RID_SI2(RID_SI2),
                     .RVALID_SI2(RVALID_SI2),
                     .RRESP_SI2(RRESP_SI2),
                     .RDATA_SI2(RDATA_SI2),
                     .RLAST_SI2(RLAST_SI2),

                     .BID_SI2(BID_SI2),
                     .BVALID_SI2(BVALID_SI2),
                     .BRESP_SI2(BRESP_SI2),
                                          
                     // SLAVE 3
                     .RID_SI3(RID_SI3),
                     .RVALID_SI3(RVALID_SI3),
                     .RRESP_SI3(RRESP_SI3),
                     .RDATA_SI3(RDATA_SI3),
                     .RLAST_SI3(RLAST_SI3),

                     .BID_SI3(BID_SI3),
                     .BVALID_SI3(BVALID_SI3),
                     .BRESP_SI3(BRESP_SI3),

                     
                     // SLAVE 4
                     .RID_SI4(RID_SI4),
                     .RVALID_SI4(RVALID_SI4),
                     .RRESP_SI4(RRESP_SI4),
                     .RDATA_SI4(RDATA_SI4),
                     .RLAST_SI4(RLAST_SI4),

                     .BID_SI4(BID_SI4),
                     .BVALID_SI4(BVALID_SI4),
                     .BRESP_SI4(BRESP_SI4),

                     
                     // SLAVE 5
                     .RID_SI5(RID_SI5),
                     .RVALID_SI5(RVALID_SI5),
                     .RRESP_SI5(RRESP_SI5),
                     .RDATA_SI5(RDATA_SI5),
                     .RLAST_SI5(RLAST_SI5),

                     .BID_SI5(BID_SI5),
                     .BVALID_SI5(BVALID_SI5),
                     .BRESP_SI5(BRESP_SI5),

                     
                     // SLAVE 6
                     .RID_SI6(RID_SI6),
                     .RVALID_SI6(RVALID_SI6),
                     .RRESP_SI6(RRESP_SI6),
                     .RDATA_SI6(RDATA_SI6),
                     .RLAST_SI6(RLAST_SI6),

                     .BID_SI6(BID_SI6),
                     .BVALID_SI6(BVALID_SI6),
                     .BRESP_SI6(BRESP_SI6),

                     
                     // SLAVE 7
                     .RID_SI7(RID_SI7),
                     .RVALID_SI7(RVALID_SI7),
                     .RRESP_SI7(RRESP_SI7),
                     .RDATA_SI7(RDATA_SI7),
                     .RLAST_SI7(RLAST_SI7),

                     .BID_SI7(BID_SI7),
                     .BVALID_SI7(BVALID_SI7),
                     .BRESP_SI7(BRESP_SI7),

                     
                     // SLAVE 8
                     .RID_SI8(RID_SI8),
                     .RVALID_SI8(RVALID_SI8),
                     .RRESP_SI8(RRESP_SI8),
                     .RDATA_SI8(RDATA_SI8),
                     .RLAST_SI8(RLAST_SI8),

                     .BID_SI8(BID_SI8),
                     .BVALID_SI8(BVALID_SI8),
                     .BRESP_SI8(BRESP_SI8),

                     
                     // SLAVE 9
                     .RID_SI9(RID_SI9),
                     .RVALID_SI9(RVALID_SI9),
                     .RRESP_SI9(RRESP_SI9),
                     .RDATA_SI9(RDATA_SI9),
                     .RLAST_SI9(RLAST_SI9),

                     .BID_SI9(BID_SI9),
                     .BVALID_SI9(BVALID_SI9),
                     .BRESP_SI9(BRESP_SI9),

                     
                     // SLAVE 10
                     .RID_SI10(RID_SI10),
                     .RVALID_SI10(RVALID_SI10),
                     .RRESP_SI10(RRESP_SI10),
                     .RDATA_SI10(RDATA_SI10),
                     .RLAST_SI10(RLAST_SI10),

                     .BID_SI10(BID_SI10),
                     .BVALID_SI10(BVALID_SI10),
                     .BRESP_SI10(BRESP_SI10),

                     
                     // SLAVE 11
                     .RID_SI11(RID_SI11),
                     .RVALID_SI11(RVALID_SI11),
                     .RRESP_SI11(RRESP_SI11),
                     .RDATA_SI11(RDATA_SI11),
                     .RLAST_SI11(RLAST_SI11),

                     .BID_SI11(BID_SI11),
                     .BVALID_SI11(BVALID_SI11),
                     .BRESP_SI11(BRESP_SI11),

                     
                     // SLAVE 12
                     .RID_SI12(RID_SI12),
                     .RVALID_SI12(RVALID_SI12),
                     .RRESP_SI12(RRESP_SI12),
                     .RDATA_SI12(RDATA_SI12),
                     .RLAST_SI12(RLAST_SI12),

                     .BID_SI12(BID_SI12),
                     .BVALID_SI12(BVALID_SI12),
                     .BRESP_SI12(BRESP_SI12),

                     
                     // SLAVE 13
                     .RID_SI13(RID_SI13),
                     .RVALID_SI13(RVALID_SI13),
                     .RRESP_SI13(RRESP_SI13),
                     .RDATA_SI13(RDATA_SI13),
                     .RLAST_SI13(RLAST_SI13),

                     .BID_SI13(BID_SI13),
                     .BVALID_SI13(BVALID_SI13),
                     .BRESP_SI13(BRESP_SI13),

                     
                     // SLAVE 14
                     .RID_SI14(RID_SI14),
                     .RVALID_SI14(RVALID_SI14),
                     .RRESP_SI14(RRESP_SI14),
                     .RDATA_SI14(RDATA_SI14),
                     .RLAST_SI14(RLAST_SI14),

                     .BID_SI14(BID_SI14),
                     .BVALID_SI14(BVALID_SI14),
                     .BRESP_SI14(BRESP_SI14),

                 
                     // SLAVE 15
                     .RID_SI15(RID_SI15),
                     .RVALID_SI15(RVALID_SI15),
                     .RRESP_SI15(RRESP_SI15),
                     .RDATA_SI15(RDATA_SI15),
                     .RLAST_SI15(RLAST_SI15),

                     .BID_SI15(BID_SI15),
                     .BVALID_SI15(BVALID_SI15),
                     .BRESP_SI15(BRESP_SI15),

                     
                     // SLAVE 16
                     .RID_SI16(RID_SI16),
                     .RVALID_SI16(RVALID_SI16),
                     .RRESP_SI16(RRESP_SI16),
                     .RDATA_SI16(RDATA_SI16),
                     .RLAST_SI16(RLAST_SI16),

                     .BID_SI16(BID_SI16),
                     .BVALID_SI16(BVALID_SI16),
                     .BRESP_SI16(BRESP_SI16),

                 
                     // From Master
                     .RREADY_IS0(RREADY_M3IS0),
                     .RREADY_IS1(RREADY_M3IS1),
                     .RREADY_IS2(RREADY_M3IS2),
                     .RREADY_IS3(RREADY_M3IS3),
                     .RREADY_IS4(RREADY_M3IS4),
                     .RREADY_IS5(RREADY_M3IS5),
                     .RREADY_IS6(RREADY_M3IS6),
                     .RREADY_IS7(RREADY_M3IS7),
                     .RREADY_IS8(RREADY_M3IS8),
                     .RREADY_IS9(RREADY_M3IS9),
                     .RREADY_IS10(RREADY_M3IS10),
                     .RREADY_IS11(RREADY_M3IS11),
                     .RREADY_IS12(RREADY_M3IS12),
                     .RREADY_IS13(RREADY_M3IS13),
                     .RREADY_IS14(RREADY_M3IS14),
                     .RREADY_IS15(RREADY_M3IS15),
                     .RREADY_IS16(RREADY_M3IS16),

                     // From Master
                     .BREADY_IS0(BREADY_M3IS0),
                     .BREADY_IS1(BREADY_M3IS1),
                     .BREADY_IS2(BREADY_M3IS2),
                     .BREADY_IS3(BREADY_M3IS3),
                     .BREADY_IS4(BREADY_M3IS4),
                     .BREADY_IS5(BREADY_M3IS5),
                     .BREADY_IS6(BREADY_M3IS6),
                     .BREADY_IS7(BREADY_M3IS7),
                     .BREADY_IS8(BREADY_M3IS8),
                     .BREADY_IS9(BREADY_M3IS9),
                     .BREADY_IS10(BREADY_M3IS10),
                     .BREADY_IS11(BREADY_M3IS11),
                     .BREADY_IS12(BREADY_M3IS12),
                     .BREADY_IS13(BREADY_M3IS13),
                     .BREADY_IS14(BREADY_M3IS14),
                     .BREADY_IS15(BREADY_M3IS15),
                     .BREADY_IS16(BREADY_M3IS16)
                     ,.pend_id_addr0(pend_id_addr0)  
                     ,.pend_id_addr1(pend_id_addr1)  
                     ,.pend_id_addr2(pend_id_addr2)  
                     ,.pend_id_addr3(pend_id_addr3)  
                     ,.pend_id_addr4(pend_id_addr4)  
                     ,.pend_id_addr5(pend_id_addr5)  
                     ,.pend_id_addr6(pend_id_addr6)  
                     ,.pend_id_addr7(pend_id_addr7)  
                     ,.pend_id_addr8(pend_id_addr8)  
                     ,.pend_id_addr9(pend_id_addr9)  
                     ,.pend_id_addr10(pend_id_addr10)  
                     ,.pend_id_addr11(pend_id_addr11)  
                     ,.pend_id_addr12(pend_id_addr12)  
                     ,.pend_id_addr13(pend_id_addr13)  
                     ,.pend_id_addr14(pend_id_addr14)  
                     ,.pend_id_addr15(pend_id_addr15)  
                     ,.pend_id_addr16(pend_id_addr16)  
                     ,.pend_id_en0(pend_id_en0)      
                     ,.pend_id_en1(pend_id_en1)      
                     ,.pend_id_en2(pend_id_en2)      
                     ,.pend_id_en3(pend_id_en3)      
                     ,.pend_id_en4(pend_id_en4)      
                     ,.pend_id_en5(pend_id_en5)      
                     ,.pend_id_en6(pend_id_en6)      
                     ,.pend_id_en7(pend_id_en7)      
                     ,.pend_id_en8(pend_id_en8)      
                     ,.pend_id_en9(pend_id_en9)      
                     ,.pend_id_en10(pend_id_en10)      
                     ,.pend_id_en11(pend_id_en11)      
                     ,.pend_id_en12(pend_id_en12)      
                     ,.pend_id_en13(pend_id_en13)      
                     ,.pend_id_en14(pend_id_en14)      
                     ,.pend_id_en15(pend_id_en15)      
                     ,.pend_id_en16(pend_id_en16)      

                     ,.outstnd_waddr0(outstnd_waddr0)  
                     ,.outstnd_waddr1(outstnd_waddr1)  
                     ,.outstnd_waddr2(outstnd_waddr2)  
                     ,.outstnd_waddr3(outstnd_waddr3)  
                     ,.outstnd_waddr4(outstnd_waddr4)  
                     ,.outstnd_waddr5(outstnd_waddr5)  
                     ,.outstnd_waddr6(outstnd_waddr6)  
                     ,.outstnd_waddr7(outstnd_waddr7)  
                     ,.outstnd_waddr8(outstnd_waddr8)  
                     ,.outstnd_waddr9(outstnd_waddr9)  
                     ,.outstnd_waddr10(outstnd_waddr10)  
                     ,.outstnd_waddr11(outstnd_waddr11)  
                     ,.outstnd_waddr12(outstnd_waddr12)  
                     ,.outstnd_waddr13(outstnd_waddr13)  
                     ,.outstnd_waddr14(outstnd_waddr14)  
                     ,.outstnd_waddr15(outstnd_waddr15)  
                     ,.outstnd_waddr16(outstnd_waddr16)  
                     ,.outstnd_waddr_en0(outstnd_waddr_en0)      
                     ,.outstnd_waddr_en1(outstnd_waddr_en1)      
                     ,.outstnd_waddr_en2(outstnd_waddr_en2)      
                     ,.outstnd_waddr_en3(outstnd_waddr_en3)      
                     ,.outstnd_waddr_en4(outstnd_waddr_en4)      
                     ,.outstnd_waddr_en5(outstnd_waddr_en5)      
                     ,.outstnd_waddr_en6(outstnd_waddr_en6)      
                     ,.outstnd_waddr_en7(outstnd_waddr_en7)      
                     ,.outstnd_waddr_en8(outstnd_waddr_en8)      
                     ,.outstnd_waddr_en9(outstnd_waddr_en9)      
                     ,.outstnd_waddr_en10(outstnd_waddr_en10)      
                     ,.outstnd_waddr_en11(outstnd_waddr_en11)      
                     ,.outstnd_waddr_en12(outstnd_waddr_en12)      
                     ,.outstnd_waddr_en13(outstnd_waddr_en13)      
                     ,.outstnd_waddr_en14(outstnd_waddr_en14)      
                     ,.outstnd_waddr_en15(outstnd_waddr_en15)      
                     ,.outstnd_waddr_en16(outstnd_waddr_en16)      
                     );
      end         
   endgenerate

   // --------------------------------------------------------------------------
   // Pass the Write response signals depending upon whether the corresponding
   // parameter MxSLAVExENABLE is enabled/disabled.
   // --------------------------------------------------------------------------
   assign  BREADY_M0IS0_gated = M0_SLAVE0ENABLE ? BREADY_M0IS0 : 1'b0;
   assign  BREADY_M0IS1_gated = M0_SLAVE1ENABLE ? BREADY_M0IS1 : 1'b0;
   assign  BREADY_M0IS2_gated = M0_SLAVE2ENABLE ? BREADY_M0IS2 : 1'b0;
   assign  BREADY_M0IS3_gated = M0_SLAVE3ENABLE ? BREADY_M0IS3 : 1'b0;
   assign  BREADY_M0IS4_gated = M0_SLAVE4ENABLE ? BREADY_M0IS4 : 1'b0;
   assign  BREADY_M0IS5_gated = M0_SLAVE5ENABLE ? BREADY_M0IS5 : 1'b0;
   assign  BREADY_M0IS6_gated = M0_SLAVE6ENABLE ? BREADY_M0IS6 : 1'b0;
   assign  BREADY_M0IS7_gated = M0_SLAVE7ENABLE ? BREADY_M0IS7 : 1'b0;
   assign  BREADY_M0IS8_gated = M0_SLAVE8ENABLE ? BREADY_M0IS8 : 1'b0;
   assign  BREADY_M0IS9_gated = M0_SLAVE9ENABLE ? BREADY_M0IS9 : 1'b0;
   assign  BREADY_M0IS10_gated = M0_SLAVE10ENABLE ? BREADY_M0IS10 : 1'b0;
   assign  BREADY_M0IS11_gated = M0_SLAVE11ENABLE ? BREADY_M0IS11 : 1'b0;
   assign  BREADY_M0IS12_gated = M0_SLAVE12ENABLE ? BREADY_M0IS12 : 1'b0;
   assign  BREADY_M0IS13_gated = M0_SLAVE13ENABLE ? BREADY_M0IS13 : 1'b0;
   assign  BREADY_M0IS14_gated = M0_SLAVE14ENABLE ? BREADY_M0IS14 : 1'b0;
   assign  BREADY_M0IS15_gated = M0_SLAVE15ENABLE ? BREADY_M0IS15 : 1'b0;
   assign  BREADY_M0IS16_gated = M0_SLAVE16ENABLE ? BREADY_M0IS16 : 1'b0;

   assign  BREADY_M1IS0_gated = M1_SLAVE0ENABLE ? BREADY_M1IS0 : 1'b0;
   assign  BREADY_M1IS1_gated = M1_SLAVE1ENABLE ? BREADY_M1IS1 : 1'b0;
   assign  BREADY_M1IS2_gated = M1_SLAVE2ENABLE ? BREADY_M1IS2 : 1'b0;
   assign  BREADY_M1IS3_gated = M1_SLAVE3ENABLE ? BREADY_M1IS3 : 1'b0;
   assign  BREADY_M1IS4_gated = M1_SLAVE4ENABLE ? BREADY_M1IS4 : 1'b0;
   assign  BREADY_M1IS5_gated = M1_SLAVE5ENABLE ? BREADY_M1IS5 : 1'b0;
   assign  BREADY_M1IS6_gated = M1_SLAVE6ENABLE ? BREADY_M1IS6 : 1'b0;
   assign  BREADY_M1IS7_gated = M1_SLAVE7ENABLE ? BREADY_M1IS7 : 1'b0;
   assign  BREADY_M1IS8_gated = M1_SLAVE8ENABLE ? BREADY_M1IS8 : 1'b0;
   assign  BREADY_M1IS9_gated = M1_SLAVE9ENABLE ? BREADY_M1IS9 : 1'b0;
   assign  BREADY_M1IS10_gated = M1_SLAVE10ENABLE ? BREADY_M1IS10 : 1'b0;
   assign  BREADY_M1IS11_gated = M1_SLAVE11ENABLE ? BREADY_M1IS11 : 1'b0;
   assign  BREADY_M1IS12_gated = M1_SLAVE12ENABLE ? BREADY_M1IS12 : 1'b0;
   assign  BREADY_M1IS13_gated = M1_SLAVE13ENABLE ? BREADY_M1IS13 : 1'b0;
   assign  BREADY_M1IS14_gated = M1_SLAVE14ENABLE ? BREADY_M1IS14 : 1'b0;
   assign  BREADY_M1IS15_gated = M1_SLAVE15ENABLE ? BREADY_M1IS15 : 1'b0;
   assign  BREADY_M1IS16_gated = M1_SLAVE16ENABLE ? BREADY_M1IS16 : 1'b0;

   assign  BREADY_M2IS0_gated = M2_SLAVE0ENABLE ? BREADY_M2IS0 : 1'b0;
   assign  BREADY_M2IS1_gated = M2_SLAVE1ENABLE ? BREADY_M2IS1 : 1'b0;
   assign  BREADY_M2IS2_gated = M2_SLAVE2ENABLE ? BREADY_M2IS2 : 1'b0;
   assign  BREADY_M2IS3_gated = M2_SLAVE3ENABLE ? BREADY_M2IS3 : 1'b0;
   assign  BREADY_M2IS4_gated = M2_SLAVE4ENABLE ? BREADY_M2IS4 : 1'b0;
   assign  BREADY_M2IS5_gated = M2_SLAVE5ENABLE ? BREADY_M2IS5 : 1'b0;
   assign  BREADY_M2IS6_gated = M2_SLAVE6ENABLE ? BREADY_M2IS6 : 1'b0;
   assign  BREADY_M2IS7_gated = M2_SLAVE7ENABLE ? BREADY_M2IS7 : 1'b0;
   assign  BREADY_M2IS8_gated = M2_SLAVE8ENABLE ? BREADY_M2IS8 : 1'b0;
   assign  BREADY_M2IS9_gated = M2_SLAVE9ENABLE ? BREADY_M2IS9 : 1'b0;
   assign  BREADY_M2IS10_gated = M2_SLAVE10ENABLE ? BREADY_M2IS10 : 1'b0;
   assign  BREADY_M2IS11_gated = M2_SLAVE11ENABLE ? BREADY_M2IS11 : 1'b0;
   assign  BREADY_M2IS12_gated = M2_SLAVE12ENABLE ? BREADY_M2IS12 : 1'b0;
   assign  BREADY_M2IS13_gated = M2_SLAVE13ENABLE ? BREADY_M2IS13 : 1'b0;
   assign  BREADY_M2IS14_gated = M2_SLAVE14ENABLE ? BREADY_M2IS14 : 1'b0;
   assign  BREADY_M2IS15_gated = M2_SLAVE15ENABLE ? BREADY_M2IS15 : 1'b0;
   assign  BREADY_M2IS16_gated = M2_SLAVE16ENABLE ? BREADY_M2IS16 : 1'b0;

   assign  BREADY_M3IS0_gated = M3_SLAVE0ENABLE ? BREADY_M3IS0 : 1'b0;
   assign  BREADY_M3IS1_gated = M3_SLAVE1ENABLE ? BREADY_M3IS1 : 1'b0;
   assign  BREADY_M3IS2_gated = M3_SLAVE2ENABLE ? BREADY_M3IS2 : 1'b0;
   assign  BREADY_M3IS3_gated = M3_SLAVE3ENABLE ? BREADY_M3IS3 : 1'b0;
   assign  BREADY_M3IS4_gated = M3_SLAVE4ENABLE ? BREADY_M3IS4 : 1'b0;
   assign  BREADY_M3IS5_gated = M3_SLAVE5ENABLE ? BREADY_M3IS5 : 1'b0;
   assign  BREADY_M3IS6_gated = M3_SLAVE6ENABLE ? BREADY_M3IS6 : 1'b0;
   assign  BREADY_M3IS7_gated = M3_SLAVE7ENABLE ? BREADY_M3IS7 : 1'b0;
   assign  BREADY_M3IS8_gated = M3_SLAVE8ENABLE ? BREADY_M3IS8 : 1'b0;
   assign  BREADY_M3IS9_gated = M3_SLAVE9ENABLE ? BREADY_M3IS9 : 1'b0;
   assign  BREADY_M3IS10_gated = M3_SLAVE10ENABLE ? BREADY_M3IS10 : 1'b0;
   assign  BREADY_M3IS11_gated = M3_SLAVE11ENABLE ? BREADY_M3IS11 : 1'b0;
   assign  BREADY_M3IS12_gated = M3_SLAVE12ENABLE ? BREADY_M3IS12 : 1'b0;
   assign  BREADY_M3IS13_gated = M3_SLAVE13ENABLE ? BREADY_M3IS13 : 1'b0;
   assign  BREADY_M3IS14_gated = M3_SLAVE14ENABLE ? BREADY_M3IS14 : 1'b0;
   assign  BREADY_M3IS15_gated = M3_SLAVE15ENABLE ? BREADY_M3IS15 : 1'b0;
   assign  BREADY_M3IS16_gated = M3_SLAVE16ENABLE ? BREADY_M3IS16 : 1'b0;


   // --------------------------------------------------------------------------
   // Pass the Write response ready from the master to the slaves
   // --------------------------------------------------------------------------
   always @(*) begin
     BREADY_IS0  = BREADY_M0IS0_gated  | BREADY_M1IS0_gated  | BREADY_M2IS0_gated  | BREADY_M3IS0_gated ;
     BREADY_IS1  = BREADY_M0IS1_gated  | BREADY_M1IS1_gated  | BREADY_M2IS1_gated  | BREADY_M3IS1_gated ;   
     BREADY_IS2  = BREADY_M0IS2_gated  | BREADY_M1IS2_gated  | BREADY_M2IS2_gated  | BREADY_M3IS2_gated ;
     BREADY_IS3  = BREADY_M0IS3_gated  | BREADY_M1IS3_gated  | BREADY_M2IS3_gated  | BREADY_M3IS3_gated ;   
     BREADY_IS4  = BREADY_M0IS4_gated  | BREADY_M1IS4_gated  | BREADY_M2IS4_gated  | BREADY_M3IS4_gated ;
     BREADY_IS5  = BREADY_M0IS5_gated  | BREADY_M1IS5_gated  | BREADY_M2IS5_gated  | BREADY_M3IS5_gated ;   
     BREADY_IS6  = BREADY_M0IS6_gated  | BREADY_M1IS6_gated  | BREADY_M2IS6_gated  | BREADY_M3IS6_gated ;
     BREADY_IS7  = BREADY_M0IS7_gated  | BREADY_M1IS7_gated  | BREADY_M2IS7_gated  | BREADY_M3IS7_gated ;   
     BREADY_IS8  = BREADY_M0IS8_gated  | BREADY_M1IS8_gated  | BREADY_M2IS8_gated  | BREADY_M3IS8_gated ;
     BREADY_IS9  = BREADY_M0IS9_gated  | BREADY_M1IS9_gated  | BREADY_M2IS9_gated  | BREADY_M3IS9_gated ;   
     BREADY_IS10 = BREADY_M0IS10_gated | BREADY_M1IS10_gated | BREADY_M2IS10_gated | BREADY_M3IS10_gated;
     BREADY_IS11 = BREADY_M0IS11_gated | BREADY_M1IS11_gated | BREADY_M2IS11_gated | BREADY_M3IS11_gated;   
     BREADY_IS12 = BREADY_M0IS12_gated | BREADY_M1IS12_gated | BREADY_M2IS12_gated | BREADY_M3IS12_gated;
     BREADY_IS13 = BREADY_M0IS13_gated | BREADY_M1IS13_gated | BREADY_M2IS13_gated | BREADY_M3IS13_gated;   
     BREADY_IS14 = BREADY_M0IS14_gated | BREADY_M1IS14_gated | BREADY_M2IS14_gated | BREADY_M3IS14_gated;
     BREADY_IS15 = BREADY_M0IS15_gated | BREADY_M1IS15_gated | BREADY_M2IS15_gated | BREADY_M3IS15_gated;   
     BREADY_IS16 = BREADY_M0IS16_gated | BREADY_M1IS16_gated | BREADY_M2IS16_gated | BREADY_M3IS16_gated;                                                   
  end
                                                
   // --------------------------------------------------------------------------
   // Pass the Read response ready from the master to the corresponding 
   // downstream slaves
   // --------------------------------------------------------------------------
   assign RREADY_M0IS0_gated = M0_SLAVE0ENABLE ? RREADY_M0IS0 : 1'b0;
   assign RREADY_M0IS1_gated = M0_SLAVE1ENABLE ? RREADY_M0IS1 : 1'b0;
   assign RREADY_M0IS2_gated = M0_SLAVE2ENABLE ? RREADY_M0IS2 : 1'b0;
   assign RREADY_M0IS3_gated = M0_SLAVE3ENABLE ? RREADY_M0IS3 : 1'b0;
   assign RREADY_M0IS4_gated = M0_SLAVE4ENABLE ? RREADY_M0IS4 : 1'b0;
   assign RREADY_M0IS5_gated = M0_SLAVE5ENABLE ? RREADY_M0IS5 : 1'b0;
   assign RREADY_M0IS6_gated = M0_SLAVE6ENABLE ? RREADY_M0IS6 : 1'b0;
   assign RREADY_M0IS7_gated = M0_SLAVE7ENABLE ? RREADY_M0IS7 : 1'b0;
   assign RREADY_M0IS8_gated = M0_SLAVE8ENABLE ? RREADY_M0IS8 : 1'b0;
   assign RREADY_M0IS9_gated = M0_SLAVE9ENABLE ? RREADY_M0IS9 : 1'b0;
   assign RREADY_M0IS10_gated = M0_SLAVE10ENABLE ? RREADY_M0IS10 : 1'b0;
   assign RREADY_M0IS11_gated = M0_SLAVE11ENABLE ? RREADY_M0IS11 : 1'b0;
   assign RREADY_M0IS12_gated = M0_SLAVE12ENABLE ? RREADY_M0IS12 : 1'b0;
   assign RREADY_M0IS13_gated = M0_SLAVE13ENABLE ? RREADY_M0IS13 : 1'b0;
   assign RREADY_M0IS14_gated = M0_SLAVE14ENABLE ? RREADY_M0IS14 : 1'b0;
   assign RREADY_M0IS15_gated = M0_SLAVE15ENABLE ? RREADY_M0IS15 : 1'b0;
   assign RREADY_M0IS16_gated = M0_SLAVE16ENABLE ? RREADY_M0IS16 : 1'b0;

   assign RREADY_M1IS0_gated = M1_SLAVE0ENABLE ? RREADY_M1IS0 : 1'b0;
   assign RREADY_M1IS1_gated = M1_SLAVE1ENABLE ? RREADY_M1IS1 : 1'b0;
   assign RREADY_M1IS2_gated = M1_SLAVE2ENABLE ? RREADY_M1IS2 : 1'b0;
   assign RREADY_M1IS3_gated = M1_SLAVE3ENABLE ? RREADY_M1IS3 : 1'b0;
   assign RREADY_M1IS4_gated = M1_SLAVE4ENABLE ? RREADY_M1IS4 : 1'b0;
   assign RREADY_M1IS5_gated = M1_SLAVE5ENABLE ? RREADY_M1IS5 : 1'b0;
   assign RREADY_M1IS6_gated = M1_SLAVE6ENABLE ? RREADY_M1IS6 : 1'b0;
   assign RREADY_M1IS7_gated = M1_SLAVE7ENABLE ? RREADY_M1IS7 : 1'b0;
   assign RREADY_M1IS8_gated = M1_SLAVE8ENABLE ? RREADY_M1IS8 : 1'b0;
   assign RREADY_M1IS9_gated = M1_SLAVE9ENABLE ? RREADY_M1IS9 : 1'b0;
   assign RREADY_M1IS10_gated = M1_SLAVE10ENABLE ? RREADY_M1IS10 : 1'b0;
   assign RREADY_M1IS11_gated = M1_SLAVE11ENABLE ? RREADY_M1IS11 : 1'b0;
   assign RREADY_M1IS12_gated = M1_SLAVE12ENABLE ? RREADY_M1IS12 : 1'b0;
   assign RREADY_M1IS13_gated = M1_SLAVE13ENABLE ? RREADY_M1IS13 : 1'b0;
   assign RREADY_M1IS14_gated = M1_SLAVE14ENABLE ? RREADY_M1IS14 : 1'b0;
   assign RREADY_M1IS15_gated = M1_SLAVE15ENABLE ? RREADY_M1IS15 : 1'b0;
   assign RREADY_M1IS16_gated = M1_SLAVE16ENABLE ? RREADY_M1IS16 : 1'b0;

   assign RREADY_M2IS0_gated = M2_SLAVE0ENABLE ? RREADY_M2IS0 : 1'b0;
   assign RREADY_M2IS1_gated = M2_SLAVE1ENABLE ? RREADY_M2IS1 : 1'b0;
   assign RREADY_M2IS2_gated = M2_SLAVE2ENABLE ? RREADY_M2IS2 : 1'b0;
   assign RREADY_M2IS3_gated = M2_SLAVE3ENABLE ? RREADY_M2IS3 : 1'b0;
   assign RREADY_M2IS4_gated = M2_SLAVE4ENABLE ? RREADY_M2IS4 : 1'b0;
   assign RREADY_M2IS5_gated = M2_SLAVE5ENABLE ? RREADY_M2IS5 : 1'b0;
   assign RREADY_M2IS6_gated = M2_SLAVE6ENABLE ? RREADY_M2IS6 : 1'b0;
   assign RREADY_M2IS7_gated = M2_SLAVE7ENABLE ? RREADY_M2IS7 : 1'b0;
   assign RREADY_M2IS8_gated = M2_SLAVE8ENABLE ? RREADY_M2IS8 : 1'b0;
   assign RREADY_M2IS9_gated = M2_SLAVE9ENABLE ? RREADY_M2IS9 : 1'b0;
   assign RREADY_M2IS10_gated = M2_SLAVE10ENABLE ? RREADY_M2IS10 : 1'b0;
   assign RREADY_M2IS11_gated = M2_SLAVE11ENABLE ? RREADY_M2IS11 : 1'b0;
   assign RREADY_M2IS12_gated = M2_SLAVE12ENABLE ? RREADY_M2IS12 : 1'b0;
   assign RREADY_M2IS13_gated = M2_SLAVE13ENABLE ? RREADY_M2IS13 : 1'b0;
   assign RREADY_M2IS14_gated = M2_SLAVE14ENABLE ? RREADY_M2IS14 : 1'b0;
   assign RREADY_M2IS15_gated = M2_SLAVE15ENABLE ? RREADY_M2IS15 : 1'b0;
   assign RREADY_M2IS16_gated = M2_SLAVE16ENABLE ? RREADY_M2IS16 : 1'b0;

   assign RREADY_M3IS0_gated = M3_SLAVE0ENABLE ? RREADY_M3IS0 : 1'b0;
   assign RREADY_M3IS1_gated = M3_SLAVE1ENABLE ? RREADY_M3IS1 : 1'b0;
   assign RREADY_M3IS2_gated = M3_SLAVE2ENABLE ? RREADY_M3IS2 : 1'b0;
   assign RREADY_M3IS3_gated = M3_SLAVE3ENABLE ? RREADY_M3IS3 : 1'b0;
   assign RREADY_M3IS4_gated = M3_SLAVE4ENABLE ? RREADY_M3IS4 : 1'b0;
   assign RREADY_M3IS5_gated = M3_SLAVE5ENABLE ? RREADY_M3IS5 : 1'b0;
   assign RREADY_M3IS6_gated = M3_SLAVE6ENABLE ? RREADY_M3IS6 : 1'b0;
   assign RREADY_M3IS7_gated = M3_SLAVE7ENABLE ? RREADY_M3IS7 : 1'b0;
   assign RREADY_M3IS8_gated = M3_SLAVE8ENABLE ? RREADY_M3IS8 : 1'b0;
   assign RREADY_M3IS9_gated = M3_SLAVE9ENABLE ? RREADY_M3IS9 : 1'b0;
   assign RREADY_M3IS10_gated = M3_SLAVE10ENABLE ? RREADY_M3IS10 : 1'b0;
   assign RREADY_M3IS11_gated = M3_SLAVE11ENABLE ? RREADY_M3IS11 : 1'b0;
   assign RREADY_M3IS12_gated = M3_SLAVE12ENABLE ? RREADY_M3IS12 : 1'b0;
   assign RREADY_M3IS13_gated = M3_SLAVE13ENABLE ? RREADY_M3IS13 : 1'b0;
   assign RREADY_M3IS14_gated = M3_SLAVE14ENABLE ? RREADY_M3IS14 : 1'b0;
   assign RREADY_M3IS15_gated = M3_SLAVE15ENABLE ? RREADY_M3IS15 : 1'b0;
   assign RREADY_M3IS16_gated = M3_SLAVE16ENABLE ? RREADY_M3IS16 : 1'b0;

   // --------------------------------------------------------------------------
   // Pass the Read response ready from the master to the corresponding 
   // downstream slaves
   // --------------------------------------------------------------------------
   always @(*) begin
     RREADY_IS0  = RREADY_M0IS0_gated  | RREADY_M1IS0_gated  | RREADY_M2IS0_gated  | RREADY_M3IS0_gated ;
     RREADY_IS1  = RREADY_M0IS1_gated  | RREADY_M1IS1_gated  | RREADY_M2IS1_gated  | RREADY_M3IS1_gated ;   
     RREADY_IS2  = RREADY_M0IS2_gated  | RREADY_M1IS2_gated  | RREADY_M2IS2_gated  | RREADY_M3IS2_gated ;
     RREADY_IS3  = RREADY_M0IS3_gated  | RREADY_M1IS3_gated  | RREADY_M2IS3_gated  | RREADY_M3IS3_gated ;   
     RREADY_IS4  = RREADY_M0IS4_gated  | RREADY_M1IS4_gated  | RREADY_M2IS4_gated  | RREADY_M3IS4_gated ;
     RREADY_IS5  = RREADY_M0IS5_gated  | RREADY_M1IS5_gated  | RREADY_M2IS5_gated  | RREADY_M3IS5_gated ;   
     RREADY_IS6  = RREADY_M0IS6_gated  | RREADY_M1IS6_gated  | RREADY_M2IS6_gated  | RREADY_M3IS6_gated ;
     RREADY_IS7  = RREADY_M0IS7_gated  | RREADY_M1IS7_gated  | RREADY_M2IS7_gated  | RREADY_M3IS7_gated ;   
     RREADY_IS8  = RREADY_M0IS8_gated  | RREADY_M1IS8_gated  | RREADY_M2IS8_gated  | RREADY_M3IS8_gated ;
     RREADY_IS9  = RREADY_M0IS9_gated  | RREADY_M1IS9_gated  | RREADY_M2IS9_gated  | RREADY_M3IS9_gated ;   
     RREADY_IS10 = RREADY_M0IS10_gated | RREADY_M1IS10_gated | RREADY_M2IS10_gated | RREADY_M3IS10_gated;
     RREADY_IS11 = RREADY_M0IS11_gated | RREADY_M1IS11_gated | RREADY_M2IS11_gated | RREADY_M3IS11_gated;   
     RREADY_IS12 = RREADY_M0IS12_gated | RREADY_M1IS12_gated | RREADY_M2IS12_gated | RREADY_M3IS12_gated;
     RREADY_IS13 = RREADY_M0IS13_gated | RREADY_M1IS13_gated | RREADY_M2IS13_gated | RREADY_M3IS13_gated;   
     RREADY_IS14 = RREADY_M0IS14_gated | RREADY_M1IS14_gated | RREADY_M2IS14_gated | RREADY_M3IS14_gated;
     RREADY_IS15 = RREADY_M0IS15_gated | RREADY_M1IS15_gated | RREADY_M2IS15_gated | RREADY_M3IS15_gated;   
     RREADY_IS16 = RREADY_M0IS16_gated | RREADY_M1IS16_gated | RREADY_M2IS16_gated | RREADY_M3IS16_gated;                                                   
  end

   // --------------------------------------------------------------------------
   // Pass the Write address ready from the downstream slaves to the corresponding 
   // master 
   // --------------------------------------------------------------------------
   always @(*) begin
     AWREADY_IM0 = (M0_SLAVE0ENABLE  ? AWREADY_S0IM0  : 1'b0) | 
                   (M0_SLAVE1ENABLE  ? AWREADY_S1IM0  : 1'b0) |
                   (M0_SLAVE2ENABLE  ? AWREADY_S2IM0  : 1'b0) |
                   (M0_SLAVE3ENABLE  ? AWREADY_S3IM0  : 1'b0) |
                   (M0_SLAVE4ENABLE  ? AWREADY_S4IM0  : 1'b0) |
                   (M0_SLAVE5ENABLE  ? AWREADY_S5IM0  : 1'b0) |
                   (M0_SLAVE6ENABLE  ? AWREADY_S6IM0  : 1'b0) |
                   (M0_SLAVE7ENABLE  ? AWREADY_S7IM0  : 1'b0) |
                   (M0_SLAVE8ENABLE  ? AWREADY_S8IM0  : 1'b0) |
                   (M0_SLAVE9ENABLE  ? AWREADY_S9IM0  : 1'b0) |
                   (M0_SLAVE10ENABLE ? AWREADY_S10IM0 : 1'b0) |
                   (M0_SLAVE11ENABLE ? AWREADY_S11IM0 : 1'b0) |
                   (M0_SLAVE12ENABLE ? AWREADY_S12IM0 : 1'b0) |
                   (M0_SLAVE13ENABLE ? AWREADY_S13IM0 : 1'b0) |
                   (M0_SLAVE14ENABLE ? AWREADY_S14IM0 : 1'b0) |
                   (M0_SLAVE15ENABLE ? AWREADY_S15IM0 : 1'b0) |
                   (M0_SLAVE16ENABLE ? AWREADY_S16IM0 : 1'b0);
     
     AWREADY_IM1 = (M1_SLAVE0ENABLE  ? AWREADY_S0IM1  : 1'b0) | 
                   (M1_SLAVE1ENABLE  ? AWREADY_S1IM1  : 1'b0) |
                   (M1_SLAVE2ENABLE  ? AWREADY_S2IM1  : 1'b0) |
                   (M1_SLAVE3ENABLE  ? AWREADY_S3IM1  : 1'b0) |
                   (M1_SLAVE4ENABLE  ? AWREADY_S4IM1  : 1'b0) |
                   (M1_SLAVE5ENABLE  ? AWREADY_S5IM1  : 1'b0) |
                   (M1_SLAVE6ENABLE  ? AWREADY_S6IM1  : 1'b0) |
                   (M1_SLAVE7ENABLE  ? AWREADY_S7IM1  : 1'b0) |
                   (M1_SLAVE8ENABLE  ? AWREADY_S8IM1  : 1'b0) |
                   (M1_SLAVE9ENABLE  ? AWREADY_S9IM1  : 1'b0) |
                   (M1_SLAVE10ENABLE ? AWREADY_S10IM1 : 1'b0) |
                   (M1_SLAVE11ENABLE ? AWREADY_S11IM1 : 1'b0) |
                   (M1_SLAVE12ENABLE ? AWREADY_S12IM1 : 1'b0) |
                   (M1_SLAVE13ENABLE ? AWREADY_S13IM1 : 1'b0) |
                   (M1_SLAVE14ENABLE ? AWREADY_S14IM1 : 1'b0) |
                   (M1_SLAVE15ENABLE ? AWREADY_S15IM1 : 1'b0) |
                   (M1_SLAVE16ENABLE ? AWREADY_S16IM1 : 1'b0);
     
     AWREADY_IM2 = (M2_SLAVE0ENABLE  ? AWREADY_S0IM2  : 1'b0) | 
                   (M2_SLAVE1ENABLE  ? AWREADY_S1IM2  : 1'b0) |
                   (M2_SLAVE2ENABLE  ? AWREADY_S2IM2  : 1'b0) |
                   (M2_SLAVE3ENABLE  ? AWREADY_S3IM2  : 1'b0) |
                   (M2_SLAVE4ENABLE  ? AWREADY_S4IM2  : 1'b0) |
                   (M2_SLAVE5ENABLE  ? AWREADY_S5IM2  : 1'b0) |
                   (M2_SLAVE6ENABLE  ? AWREADY_S6IM2  : 1'b0) |
                   (M2_SLAVE7ENABLE  ? AWREADY_S7IM2  : 1'b0) |
                   (M2_SLAVE8ENABLE  ? AWREADY_S8IM2  : 1'b0) |
                   (M2_SLAVE9ENABLE  ? AWREADY_S9IM2  : 1'b0) |
                   (M2_SLAVE10ENABLE ? AWREADY_S10IM2 : 1'b0) |
                   (M2_SLAVE11ENABLE ? AWREADY_S11IM2 : 1'b0) |
                   (M2_SLAVE12ENABLE ? AWREADY_S12IM2 : 1'b0) |
                   (M2_SLAVE13ENABLE ? AWREADY_S13IM2 : 1'b0) |
                   (M2_SLAVE14ENABLE ? AWREADY_S14IM2 : 1'b0) |
                   (M2_SLAVE15ENABLE ? AWREADY_S15IM2 : 1'b0) |
                   (M2_SLAVE16ENABLE ? AWREADY_S16IM2 : 1'b0);
     
     AWREADY_IM3 = (M3_SLAVE0ENABLE  ? AWREADY_S0IM3  : 1'b0) | 
                   (M3_SLAVE1ENABLE  ? AWREADY_S1IM3  : 1'b0) |
                   (M3_SLAVE2ENABLE  ? AWREADY_S2IM3  : 1'b0) |
                   (M3_SLAVE3ENABLE  ? AWREADY_S3IM3  : 1'b0) |
                   (M3_SLAVE4ENABLE  ? AWREADY_S4IM3  : 1'b0) |
                   (M3_SLAVE5ENABLE  ? AWREADY_S5IM3  : 1'b0) |
                   (M3_SLAVE6ENABLE  ? AWREADY_S6IM3  : 1'b0) |
                   (M3_SLAVE7ENABLE  ? AWREADY_S7IM3  : 1'b0) |
                   (M3_SLAVE8ENABLE  ? AWREADY_S8IM3  : 1'b0) |
                   (M3_SLAVE9ENABLE  ? AWREADY_S9IM3  : 1'b0) |
                   (M3_SLAVE10ENABLE ? AWREADY_S10IM3 : 1'b0) |
                   (M3_SLAVE11ENABLE ? AWREADY_S11IM3 : 1'b0) |
                   (M3_SLAVE12ENABLE ? AWREADY_S12IM3 : 1'b0) |
                   (M3_SLAVE13ENABLE ? AWREADY_S13IM3 : 1'b0) |
                   (M3_SLAVE14ENABLE ? AWREADY_S14IM3 : 1'b0) |
                   (M3_SLAVE15ENABLE ? AWREADY_S15IM3 : 1'b0) |
                   (M3_SLAVE16ENABLE ? AWREADY_S16IM3 : 1'b0);
     
  end

   // --------------------------------------------------------------------------
   // Pass the Write data ready from the downstream slaves to the corresponding 
   // master 
   // --------------------------------------------------------------------------
   always @(*) begin
     WREADY_IM0 =  (M0_SLAVE0ENABLE  ? WREADY_S0IM0  : 1'b0) | 
                   (M0_SLAVE1ENABLE  ? WREADY_S1IM0  : 1'b0) |
                   (M0_SLAVE2ENABLE  ? WREADY_S2IM0  : 1'b0) |
                   (M0_SLAVE3ENABLE  ? WREADY_S3IM0  : 1'b0) |
                   (M0_SLAVE4ENABLE  ? WREADY_S4IM0  : 1'b0) |
                   (M0_SLAVE5ENABLE  ? WREADY_S5IM0  : 1'b0) |
                   (M0_SLAVE6ENABLE  ? WREADY_S6IM0  : 1'b0) |
                   (M0_SLAVE7ENABLE  ? WREADY_S7IM0  : 1'b0) |
                   (M0_SLAVE8ENABLE  ? WREADY_S8IM0  : 1'b0) |
                   (M0_SLAVE9ENABLE  ? WREADY_S9IM0  : 1'b0) |
                   (M0_SLAVE10ENABLE ? WREADY_S10IM0 : 1'b0) |
                   (M0_SLAVE11ENABLE ? WREADY_S11IM0 : 1'b0) |
                   (M0_SLAVE12ENABLE ? WREADY_S12IM0 : 1'b0) |
                   (M0_SLAVE13ENABLE ? WREADY_S13IM0 : 1'b0) |
                   (M0_SLAVE14ENABLE ? WREADY_S14IM0 : 1'b0) |
                   (M0_SLAVE15ENABLE ? WREADY_S15IM0 : 1'b0) |
                   (M0_SLAVE16ENABLE ? WREADY_S16IM0 : 1'b0);
     
     WREADY_IM1 =  (M1_SLAVE0ENABLE  ? WREADY_S0IM1  : 1'b0) | 
                   (M1_SLAVE1ENABLE  ? WREADY_S1IM1  : 1'b0) |
                   (M1_SLAVE2ENABLE  ? WREADY_S2IM1  : 1'b0) |
                   (M1_SLAVE3ENABLE  ? WREADY_S3IM1  : 1'b0) |
                   (M1_SLAVE4ENABLE  ? WREADY_S4IM1  : 1'b0) |
                   (M1_SLAVE5ENABLE  ? WREADY_S5IM1  : 1'b0) |
                   (M1_SLAVE6ENABLE  ? WREADY_S6IM1  : 1'b0) |
                   (M1_SLAVE7ENABLE  ? WREADY_S7IM1  : 1'b0) |
                   (M1_SLAVE8ENABLE  ? WREADY_S8IM1  : 1'b0) |
                   (M1_SLAVE9ENABLE  ? WREADY_S9IM1  : 1'b0) |
                   (M1_SLAVE10ENABLE ? WREADY_S10IM1 : 1'b0) |
                   (M1_SLAVE11ENABLE ? WREADY_S11IM1 : 1'b0) |
                   (M1_SLAVE12ENABLE ? WREADY_S12IM1 : 1'b0) |
                   (M1_SLAVE13ENABLE ? WREADY_S13IM1 : 1'b0) |
                   (M1_SLAVE14ENABLE ? WREADY_S14IM1 : 1'b0) |
                   (M1_SLAVE15ENABLE ? WREADY_S15IM1 : 1'b0) |
                   (M1_SLAVE16ENABLE ? WREADY_S16IM1 : 1'b0);
     
     WREADY_IM2 =  (M2_SLAVE0ENABLE  ? WREADY_S0IM2  : 1'b0) | 
                   (M2_SLAVE1ENABLE  ? WREADY_S1IM2  : 1'b0) |
                   (M2_SLAVE2ENABLE  ? WREADY_S2IM2  : 1'b0) |
                   (M2_SLAVE3ENABLE  ? WREADY_S3IM2  : 1'b0) |
                   (M2_SLAVE4ENABLE  ? WREADY_S4IM2  : 1'b0) |
                   (M2_SLAVE5ENABLE  ? WREADY_S5IM2  : 1'b0) |
                   (M2_SLAVE6ENABLE  ? WREADY_S6IM2  : 1'b0) |
                   (M2_SLAVE7ENABLE  ? WREADY_S7IM2  : 1'b0) |
                   (M2_SLAVE8ENABLE  ? WREADY_S8IM2  : 1'b0) |
                   (M2_SLAVE9ENABLE  ? WREADY_S9IM2  : 1'b0) |
                   (M2_SLAVE10ENABLE ? WREADY_S10IM2 : 1'b0) |
                   (M2_SLAVE11ENABLE ? WREADY_S11IM2 : 1'b0) |
                   (M2_SLAVE12ENABLE ? WREADY_S12IM2 : 1'b0) |
                   (M2_SLAVE13ENABLE ? WREADY_S13IM2 : 1'b0) |
                   (M2_SLAVE14ENABLE ? WREADY_S14IM2 : 1'b0) |
                   (M2_SLAVE15ENABLE ? WREADY_S15IM2 : 1'b0) |
                   (M2_SLAVE16ENABLE ? WREADY_S16IM2 : 1'b0);
     
     WREADY_IM3 =  (M3_SLAVE0ENABLE  ? WREADY_S0IM3  : 1'b0) | 
                   (M3_SLAVE1ENABLE  ? WREADY_S1IM3  : 1'b0) |
                   (M3_SLAVE2ENABLE  ? WREADY_S2IM3  : 1'b0) |
                   (M3_SLAVE3ENABLE  ? WREADY_S3IM3  : 1'b0) |
                   (M3_SLAVE4ENABLE  ? WREADY_S4IM3  : 1'b0) |
                   (M3_SLAVE5ENABLE  ? WREADY_S5IM3  : 1'b0) |
                   (M3_SLAVE6ENABLE  ? WREADY_S6IM3  : 1'b0) |
                   (M3_SLAVE7ENABLE  ? WREADY_S7IM3  : 1'b0) |
                   (M3_SLAVE8ENABLE  ? WREADY_S8IM3  : 1'b0) |
                   (M3_SLAVE9ENABLE  ? WREADY_S9IM3  : 1'b0) |
                   (M3_SLAVE10ENABLE ? WREADY_S10IM3 : 1'b0) |
                   (M3_SLAVE11ENABLE ? WREADY_S11IM3 : 1'b0) |
                   (M3_SLAVE12ENABLE ? WREADY_S12IM3 : 1'b0) |
                   (M3_SLAVE13ENABLE ? WREADY_S13IM3 : 1'b0) |
                   (M3_SLAVE14ENABLE ? WREADY_S14IM3 : 1'b0) |
                   (M3_SLAVE15ENABLE ? WREADY_S15IM3 : 1'b0) |
                   (M3_SLAVE16ENABLE ? WREADY_S16IM3 : 1'b0);
     
  end

   // --------------------------------------------------------------------------
   // Pass the Read address ready from the downstream slaves to the corresponding 
   // master 
   // --------------------------------------------------------------------------
   always @(*) begin
     ARREADY_IM0 = (M0_SLAVE0ENABLE  ? ARREADY_S0IM0  : 1'b0) | 
                   (M0_SLAVE1ENABLE  ? ARREADY_S1IM0  : 1'b0) |
                   (M0_SLAVE2ENABLE  ? ARREADY_S2IM0  : 1'b0) |
                   (M0_SLAVE3ENABLE  ? ARREADY_S3IM0  : 1'b0) |
                   (M0_SLAVE4ENABLE  ? ARREADY_S4IM0  : 1'b0) |
                   (M0_SLAVE5ENABLE  ? ARREADY_S5IM0  : 1'b0) |
                   (M0_SLAVE6ENABLE  ? ARREADY_S6IM0  : 1'b0) |
                   (M0_SLAVE7ENABLE  ? ARREADY_S7IM0  : 1'b0) |
                   (M0_SLAVE8ENABLE  ? ARREADY_S8IM0  : 1'b0) |
                   (M0_SLAVE9ENABLE  ? ARREADY_S9IM0  : 1'b0) |
                   (M0_SLAVE10ENABLE ? ARREADY_S10IM0 : 1'b0) |
                   (M0_SLAVE11ENABLE ? ARREADY_S11IM0 : 1'b0) |
                   (M0_SLAVE12ENABLE ? ARREADY_S12IM0 : 1'b0) |
                   (M0_SLAVE13ENABLE ? ARREADY_S13IM0 : 1'b0) |
                   (M0_SLAVE14ENABLE ? ARREADY_S14IM0 : 1'b0) |
                   (M0_SLAVE15ENABLE ? ARREADY_S15IM0 : 1'b0) |
                   (M0_SLAVE16ENABLE ? ARREADY_S16IM0 : 1'b0);
     
     ARREADY_IM1 = (M1_SLAVE0ENABLE  ? ARREADY_S0IM1  : 1'b0) | 
                   (M1_SLAVE1ENABLE  ? ARREADY_S1IM1  : 1'b0) |
                   (M1_SLAVE2ENABLE  ? ARREADY_S2IM1  : 1'b0) |
                   (M1_SLAVE3ENABLE  ? ARREADY_S3IM1  : 1'b0) |
                   (M1_SLAVE4ENABLE  ? ARREADY_S4IM1  : 1'b0) |
                   (M1_SLAVE5ENABLE  ? ARREADY_S5IM1  : 1'b0) |
                   (M1_SLAVE6ENABLE  ? ARREADY_S6IM1  : 1'b0) |
                   (M1_SLAVE7ENABLE  ? ARREADY_S7IM1  : 1'b0) |
                   (M1_SLAVE8ENABLE  ? ARREADY_S8IM1  : 1'b0) |
                   (M1_SLAVE9ENABLE  ? ARREADY_S9IM1  : 1'b0) |
                   (M1_SLAVE10ENABLE ? ARREADY_S10IM1 : 1'b0) |
                   (M1_SLAVE11ENABLE ? ARREADY_S11IM1 : 1'b0) |
                   (M1_SLAVE12ENABLE ? ARREADY_S12IM1 : 1'b0) |
                   (M1_SLAVE13ENABLE ? ARREADY_S13IM1 : 1'b0) |
                   (M1_SLAVE14ENABLE ? ARREADY_S14IM1 : 1'b0) |
                   (M1_SLAVE15ENABLE ? ARREADY_S15IM1 : 1'b0) |
                   (M1_SLAVE16ENABLE ? ARREADY_S16IM1 : 1'b0);
     
     ARREADY_IM2 = (M2_SLAVE0ENABLE  ? ARREADY_S0IM2  : 1'b0) | 
                   (M2_SLAVE1ENABLE  ? ARREADY_S1IM2  : 1'b0) |
                   (M2_SLAVE2ENABLE  ? ARREADY_S2IM2  : 1'b0) |
                   (M2_SLAVE3ENABLE  ? ARREADY_S3IM2  : 1'b0) |
                   (M2_SLAVE4ENABLE  ? ARREADY_S4IM2  : 1'b0) |
                   (M2_SLAVE5ENABLE  ? ARREADY_S5IM2  : 1'b0) |
                   (M2_SLAVE6ENABLE  ? ARREADY_S6IM2  : 1'b0) |
                   (M2_SLAVE7ENABLE  ? ARREADY_S7IM2  : 1'b0) |
                   (M2_SLAVE8ENABLE  ? ARREADY_S8IM2  : 1'b0) |
                   (M2_SLAVE9ENABLE  ? ARREADY_S9IM2  : 1'b0) |
                   (M2_SLAVE10ENABLE ? ARREADY_S10IM2 : 1'b0) |
                   (M2_SLAVE11ENABLE ? ARREADY_S11IM2 : 1'b0) |
                   (M2_SLAVE12ENABLE ? ARREADY_S12IM2 : 1'b0) |
                   (M2_SLAVE13ENABLE ? ARREADY_S13IM2 : 1'b0) |
                   (M2_SLAVE14ENABLE ? ARREADY_S14IM2 : 1'b0) |
                   (M2_SLAVE15ENABLE ? ARREADY_S15IM2 : 1'b0) |
                   (M2_SLAVE16ENABLE ? ARREADY_S16IM2 : 1'b0);
     
     ARREADY_IM3 = (M3_SLAVE0ENABLE  ? ARREADY_S0IM3  : 1'b0) | 
                   (M3_SLAVE1ENABLE  ? ARREADY_S1IM3  : 1'b0) |
                   (M3_SLAVE2ENABLE  ? ARREADY_S2IM3  : 1'b0) |
                   (M3_SLAVE3ENABLE  ? ARREADY_S3IM3  : 1'b0) |
                   (M3_SLAVE4ENABLE  ? ARREADY_S4IM3  : 1'b0) |
                   (M3_SLAVE5ENABLE  ? ARREADY_S5IM3  : 1'b0) |
                   (M3_SLAVE6ENABLE  ? ARREADY_S6IM3  : 1'b0) |
                   (M3_SLAVE7ENABLE  ? ARREADY_S7IM3  : 1'b0) |
                   (M3_SLAVE8ENABLE  ? ARREADY_S8IM3  : 1'b0) |
                   (M3_SLAVE9ENABLE  ? ARREADY_S9IM3  : 1'b0) |
                   (M3_SLAVE10ENABLE ? ARREADY_S10IM3 : 1'b0) |
                   (M3_SLAVE11ENABLE ? ARREADY_S11IM3 : 1'b0) |
                   (M3_SLAVE12ENABLE ? ARREADY_S12IM3 : 1'b0) |
                   (M3_SLAVE13ENABLE ? ARREADY_S13IM3 : 1'b0) |
                   (M3_SLAVE14ENABLE ? ARREADY_S14IM3 : 1'b0) |
                   (M3_SLAVE15ENABLE ? ARREADY_S15IM3 : 1'b0) |
                   (M3_SLAVE16ENABLE ? ARREADY_S16IM3 : 1'b0);
     
  end

   // --------------------------------------------------------------------------
   // Pass the Write address signals from the interconnect matrix to downstream
   // slaves
   // --------------------------------------------------------------------------
   always @(*) begin
           AWID_IS0     =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWID_IS0_gated : 'h0;   
           AWADDR_IS0   =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWADDR_IS0_gated : 'h0; 
           AWLEN_IS0    =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWLEN_IS0_gated : 'h0;  
           AWSIZE_IS0   =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWSIZE_IS0_gated : 'h0; 
           AWBURST_IS0  =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWBURST_IS0_gated : 'h0;
           AWLOCK_IS0   =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWLOCK_IS0_gated : 'h0; 
           AWCACHE_IS0  =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWCACHE_IS0_gated : 'h0;
           AWPROT_IS0   =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWPROT_IS0_gated : 'h0; 
           AWVALID_IS0  =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWVALID_IS0_gated : 'h0;

           AWID_IS1     =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWID_IS1_gated : 'h0;   
           AWADDR_IS1   =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWADDR_IS1_gated : 'h0; 
           AWLEN_IS1    =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWLEN_IS1_gated : 'h0;  
           AWSIZE_IS1   =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWSIZE_IS1_gated : 'h0; 
           AWBURST_IS1  =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWBURST_IS1_gated : 'h0;
           AWLOCK_IS1   =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWLOCK_IS1_gated : 'h0; 
           AWCACHE_IS1  =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWCACHE_IS1_gated : 'h0;
           AWPROT_IS1   =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWPROT_IS1_gated : 'h0; 
           AWVALID_IS1  =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWVALID_IS1_gated : 'h0;

           AWID_IS2     =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWID_IS2_gated : 'h0;   
           AWADDR_IS2   =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWADDR_IS2_gated : 'h0; 
           AWLEN_IS2    =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWLEN_IS2_gated : 'h0;  
           AWSIZE_IS2   =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWSIZE_IS2_gated : 'h0; 
           AWBURST_IS2  =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWBURST_IS2_gated : 'h0;
           AWLOCK_IS2   =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWLOCK_IS2_gated : 'h0; 
           AWCACHE_IS2  =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWCACHE_IS2_gated : 'h0;
           AWPROT_IS2   =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWPROT_IS2_gated : 'h0; 
           AWVALID_IS2  =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWVALID_IS2_gated : 'h0;

           AWID_IS3     =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWID_IS3_gated : 'h0;   
           AWADDR_IS3   =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWADDR_IS3_gated : 'h0; 
           AWLEN_IS3    =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWLEN_IS3_gated : 'h0;  
           AWSIZE_IS3   =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWSIZE_IS3_gated : 'h0; 
           AWBURST_IS3  =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWBURST_IS3_gated : 'h0;
           AWLOCK_IS3   =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWLOCK_IS3_gated : 'h0; 
           AWCACHE_IS3  =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWCACHE_IS3_gated : 'h0;
           AWPROT_IS3   =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWPROT_IS3_gated : 'h0; 
           AWVALID_IS3  =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWVALID_IS3_gated : 'h0;

           AWID_IS4     =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWID_IS4_gated : 'h0;   
           AWADDR_IS4   =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWADDR_IS4_gated : 'h0; 
           AWLEN_IS4    =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWLEN_IS4_gated : 'h0;  
           AWSIZE_IS4   =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWSIZE_IS4_gated : 'h0; 
           AWBURST_IS4  =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWBURST_IS4_gated : 'h0;
           AWLOCK_IS4   =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWLOCK_IS4_gated : 'h0; 
           AWCACHE_IS4  =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWCACHE_IS4_gated : 'h0;
           AWPROT_IS4   =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWPROT_IS4_gated : 'h0; 
           AWVALID_IS4  =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWVALID_IS4_gated : 'h0;

           AWID_IS5     =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWID_IS5_gated : 'h0;   
           AWADDR_IS5   =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWADDR_IS5_gated : 'h0; 
           AWLEN_IS5    =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWLEN_IS5_gated : 'h0;  
           AWSIZE_IS5   =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWSIZE_IS5_gated : 'h0; 
           AWBURST_IS5  =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWBURST_IS5_gated : 'h0;
           AWLOCK_IS5   =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWLOCK_IS5_gated : 'h0; 
           AWCACHE_IS5  =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWCACHE_IS5_gated : 'h0;
           AWPROT_IS5   =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWPROT_IS5_gated : 'h0; 
           AWVALID_IS5  =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWVALID_IS5_gated : 'h0;

           AWID_IS6     =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWID_IS6_gated : 'h0;   
           AWADDR_IS6   =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWADDR_IS6_gated : 'h0; 
           AWLEN_IS6    =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWLEN_IS6_gated : 'h0;  
           AWSIZE_IS6   =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWSIZE_IS6_gated : 'h0; 
           AWBURST_IS6  =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWBURST_IS6_gated : 'h0;
           AWLOCK_IS6   =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWLOCK_IS6_gated : 'h0; 
           AWCACHE_IS6  =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWCACHE_IS6_gated : 'h0;
           AWPROT_IS6   =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWPROT_IS6_gated : 'h0; 
           AWVALID_IS6  =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWVALID_IS6_gated : 'h0;

           AWID_IS7     =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWID_IS7_gated : 'h0;   
           AWADDR_IS7   =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWADDR_IS7_gated : 'h0; 
           AWLEN_IS7    =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWLEN_IS7_gated : 'h0;  
           AWSIZE_IS7   =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWSIZE_IS7_gated : 'h0; 
           AWBURST_IS7  =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWBURST_IS7_gated : 'h0;
           AWLOCK_IS7   =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWLOCK_IS7_gated : 'h0; 
           AWCACHE_IS7  =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWCACHE_IS7_gated : 'h0;
           AWPROT_IS7   =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWPROT_IS7_gated : 'h0; 
           AWVALID_IS7  =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? AWVALID_IS7_gated : 'h0;

           AWID_IS8     =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWID_IS8_gated : 'h0;   
           AWADDR_IS8   =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWADDR_IS8_gated : 'h0; 
           AWLEN_IS8    =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWLEN_IS8_gated : 'h0;  
           AWSIZE_IS8   =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWSIZE_IS8_gated : 'h0; 
           AWBURST_IS8  =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWBURST_IS8_gated : 'h0;
           AWLOCK_IS8   =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWLOCK_IS8_gated : 'h0; 
           AWCACHE_IS8  =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWCACHE_IS8_gated : 'h0;
           AWPROT_IS8   =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWPROT_IS8_gated : 'h0; 
           AWVALID_IS8  =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWVALID_IS8_gated : 'h0;

           AWID_IS9     =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWID_IS9_gated : 'h0;   
           AWADDR_IS9   =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWADDR_IS9_gated : 'h0; 
           AWLEN_IS9    =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWLEN_IS9_gated : 'h0;  
           AWSIZE_IS9   =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWSIZE_IS9_gated : 'h0; 
           AWBURST_IS9  =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWBURST_IS9_gated : 'h0;
           AWLOCK_IS9   =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWLOCK_IS9_gated : 'h0; 
           AWCACHE_IS9  =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWCACHE_IS9_gated : 'h0;
           AWPROT_IS9   =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWPROT_IS9_gated : 'h0; 
           AWVALID_IS9  =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWVALID_IS9_gated : 'h0;

           AWID_IS10     =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWID_IS10_gated : 'h0;   
           AWADDR_IS10   =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWADDR_IS10_gated : 'h0; 
           AWLEN_IS10    =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWLEN_IS10_gated : 'h0;  
           AWSIZE_IS10   =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWSIZE_IS10_gated : 'h0; 
           AWBURST_IS10  =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWBURST_IS10_gated : 'h0;
           AWLOCK_IS10   =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWLOCK_IS10_gated : 'h0; 
           AWCACHE_IS10  =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWCACHE_IS10_gated : 'h0;
           AWPROT_IS10   =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWPROT_IS10_gated : 'h0; 
           AWVALID_IS10  =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWVALID_IS10_gated : 'h0;

           AWID_IS11     =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWID_IS11_gated : 'h0;   
           AWADDR_IS11   =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWADDR_IS11_gated : 'h0; 
           AWLEN_IS11    =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWLEN_IS11_gated : 'h0;  
           AWSIZE_IS11   =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWSIZE_IS11_gated : 'h0; 
           AWBURST_IS11  =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWBURST_IS11_gated : 'h0;
           AWLOCK_IS11   =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWLOCK_IS11_gated : 'h0; 
           AWCACHE_IS11  =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWCACHE_IS11_gated : 'h0;
           AWPROT_IS11   =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWPROT_IS11_gated : 'h0; 
           AWVALID_IS11  =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWVALID_IS11_gated : 'h0;

           AWID_IS12     =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWID_IS12_gated : 'h0;   
           AWADDR_IS12   =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWADDR_IS12_gated : 'h0; 
           AWLEN_IS12    =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWLEN_IS12_gated : 'h0;  
           AWSIZE_IS12   =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWSIZE_IS12_gated : 'h0; 
           AWBURST_IS12  =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWBURST_IS12_gated : 'h0;
           AWLOCK_IS12   =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWLOCK_IS12_gated : 'h0; 
           AWCACHE_IS12  =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWCACHE_IS12_gated : 'h0;
           AWPROT_IS12   =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWPROT_IS12_gated : 'h0; 
           AWVALID_IS12  =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWVALID_IS12_gated : 'h0;

           AWID_IS13     =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWID_IS13_gated : 'h0;   
           AWADDR_IS13   =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWADDR_IS13_gated : 'h0; 
           AWLEN_IS13    =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWLEN_IS13_gated : 'h0;  
           AWSIZE_IS13   =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWSIZE_IS13_gated : 'h0; 
           AWBURST_IS13  =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWBURST_IS13_gated : 'h0;
           AWLOCK_IS13   =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWLOCK_IS13_gated : 'h0; 
           AWCACHE_IS13  =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWCACHE_IS13_gated : 'h0;
           AWPROT_IS13   =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWPROT_IS13_gated : 'h0; 
           AWVALID_IS13  =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWVALID_IS13_gated : 'h0;

           AWID_IS14     =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWID_IS14_gated : 'h0;   
           AWADDR_IS14   =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWADDR_IS14_gated : 'h0; 
           AWLEN_IS14    =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWLEN_IS14_gated : 'h0;  
           AWSIZE_IS14   =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWSIZE_IS14_gated : 'h0; 
           AWBURST_IS14  =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWBURST_IS14_gated : 'h0;
           AWLOCK_IS14   =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWLOCK_IS14_gated : 'h0; 
           AWCACHE_IS14  =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWCACHE_IS14_gated : 'h0;
           AWPROT_IS14   =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWPROT_IS14_gated : 'h0; 
           AWVALID_IS14  =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWVALID_IS14_gated : 'h0;

           AWID_IS15     =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWID_IS15_gated : 'h0;   
           AWADDR_IS15   =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWADDR_IS15_gated : 'h0; 
           AWLEN_IS15    =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWLEN_IS15_gated : 'h0;  
           AWSIZE_IS15   =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWSIZE_IS15_gated : 'h0; 
           AWBURST_IS15  =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWBURST_IS15_gated : 'h0;
           AWLOCK_IS15   =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWLOCK_IS15_gated : 'h0; 
           AWCACHE_IS15  =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWCACHE_IS15_gated : 'h0;
           AWPROT_IS15   =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWPROT_IS15_gated : 'h0; 
           AWVALID_IS15  =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? AWVALID_IS15_gated : 'h0;

      if((MEMSPACE == 0 && ADDR_HGS_CFG == 1'b1  && AWVALID_IS16_gated_r && (AWADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] > 4'h7)) || 
         (MEMSPACE == 0 && ADDR_HGS_CFG == 1'b0  && AWVALID_IS16_gated_r && (AWADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] < 4'h8)) ||
         (MEMSPACE > 0  && SC_0  == 1            && AWVALID_IS16_gated_r  && (AWADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h0 )) ||
         (MEMSPACE > 0  && SC_1  == 1            && AWVALID_IS16_gated_r  && (AWADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h1 )) ||
         (MEMSPACE > 0  && SC_2  == 1            && AWVALID_IS16_gated_r  && (AWADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h2 )) ||
         (MEMSPACE > 0  && SC_3  == 1            && AWVALID_IS16_gated_r  && (AWADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h3 )) ||
         (MEMSPACE > 0  && SC_4  == 1            && AWVALID_IS16_gated_r  && (AWADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h4 )) ||
         (MEMSPACE > 0  && SC_5  == 1            && AWVALID_IS16_gated_r  && (AWADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h5 )) ||
         (MEMSPACE > 0  && SC_6  == 1            && AWVALID_IS16_gated_r  && (AWADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h6 )) ||
         (MEMSPACE > 0  && SC_7  == 1            && AWVALID_IS16_gated_r  && (AWADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h7 )) ||
         (MEMSPACE > 0  && SC_8  == 1            && AWVALID_IS16_gated_r  && (AWADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h8 )) ||
         (MEMSPACE > 0  && SC_9  == 1            && AWVALID_IS16_gated_r  && (AWADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h9 )) ||
         (MEMSPACE > 0  && SC_10 == 1            && AWVALID_IS16_gated_r  && (AWADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'hA )) ||
         (MEMSPACE > 0  && SC_11 == 1            && AWVALID_IS16_gated_r  && (AWADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'hB )) ||
         (MEMSPACE > 0  && SC_12 == 1            && AWVALID_IS16_gated_r  && (AWADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'hC )) ||
         (MEMSPACE > 0  && SC_13 == 1            && AWVALID_IS16_gated_r  && (AWADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'hD )) ||
         (MEMSPACE > 0  && SC_14 == 1            && AWVALID_IS16_gated_r  && (AWADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'hE )) ||
         (MEMSPACE > 0  && SC_15 == 1            && AWVALID_IS16_gated_r  && (AWADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'hF ))
         ) begin
           AWID_IS16     =   AWID_IS16_gated;   
           AWADDR_IS16   =   AWADDR_IS16_gated; 
           AWLEN_IS16    =   AWLEN_IS16_gated;  
           AWSIZE_IS16   =   AWSIZE_IS16_gated; 
           AWBURST_IS16  =   AWBURST_IS16_gated;
           AWLOCK_IS16   =   AWLOCK_IS16_gated; 
           AWCACHE_IS16  =   AWCACHE_IS16_gated;
           AWPROT_IS16   =   AWPROT_IS16_gated; 
           AWVALID_IS16  =   AWVALID_IS16_gated;
      end // if ((MEMSPACE == 0 && ADDR_HGS_CFG == 1'b1 && AWADDR_IS16_gated_r[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] > 4'h7)...
      else begin
           AWID_IS16     = 'h0;
           AWADDR_IS16   = 'h0;
           AWLEN_IS16    = 'h0;
           AWSIZE_IS16   = 'h0;
           AWBURST_IS16  = 'h0;
           AWLOCK_IS16   = 'h0;
           AWCACHE_IS16  = 'h0;       
           AWPROT_IS16   = 'h0;
           AWVALID_IS16  = 'h0;       
      end

   end // always @ (*)


   // --------------------------------------------------------------------------
   // Register signals
   // --------------------------------------------------------------------------
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
  	     AWADDR_IS16_gated_r   <= 'h0;
  	     AWVALID_IS16_gated_r  <= 'h0;
  	     WVALID_IS16_gated_r   <= 'h0;
      end
      else begin
  	     AWADDR_IS16_gated_r   <= AWADDR_IS16_gated;
  	     AWVALID_IS16_gated_r  <= AWVALID_IS16_gated;
  	     WVALID_IS16_gated_r   <= WVALID_IS16_gated;
      end // else: !if(!ARESETN)
   end // always @ (posedge ACLK or negedge ARESETN)

   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
  	     ARADDR_IS16_gated_r   <= 'h0;
  	     ARVALID_IS16_gated_r   <= 'h0;
      end
      else begin
  	     ARADDR_IS16_gated_r   <= ARADDR_IS16_gated;
  	     ARVALID_IS16_gated_r   <= ARVALID_IS16_gated;
      end // else: !if(!ARESETN)
   end // always @ (posedge ACLK or negedge ARESETN)
   
   // --------------------------------------------------------------------------
   // Pass the Write data signals from the interconnect matrix to downstream
   // slave
   // --------------------------------------------------------------------------
   always @(*) begin
           WID_IS0     =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WID_IS0_gated : 'h0;   
           WDATA_IS0   =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WDATA_IS0_gated : 'h0; 
           WSTRB_IS0   =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WSTRB_IS0_gated : 'h0;
           WLAST_IS0   =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WLAST_IS0_gated : 'h0; 
           WVALID_IS0  =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WVALID_IS0_gated : 'h0;

           WID_IS1     =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WID_IS1_gated : 'h0;   
           WDATA_IS1   =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WDATA_IS1_gated : 'h0; 
           WSTRB_IS1   =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WSTRB_IS1_gated : 'h0;
           WLAST_IS1   =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WLAST_IS1_gated : 'h0; 
           WVALID_IS1  =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WVALID_IS1_gated : 'h0;

           WID_IS2     =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WID_IS2_gated : 'h0;   
           WDATA_IS2   =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WDATA_IS2_gated : 'h0; 
           WSTRB_IS2   =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WSTRB_IS2_gated : 'h0;
           WLAST_IS2   =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WLAST_IS2_gated : 'h0; 
           WVALID_IS2  =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WVALID_IS2_gated : 'h0;

           WID_IS3     =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WID_IS3_gated : 'h0;   
           WDATA_IS3   =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WDATA_IS3_gated : 'h0; 
           WSTRB_IS3   =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WSTRB_IS3_gated : 'h0;
           WLAST_IS3   =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WLAST_IS3_gated : 'h0; 
           WVALID_IS3  =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WVALID_IS3_gated : 'h0;

           WID_IS4     =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WID_IS4_gated : 'h0;   
           WDATA_IS4   =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WDATA_IS4_gated : 'h0; 
           WSTRB_IS4   =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WSTRB_IS4_gated : 'h0;
           WLAST_IS4   =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WLAST_IS4_gated : 'h0; 
           WVALID_IS4  =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WVALID_IS4_gated : 'h0;

           WID_IS5     =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WID_IS5_gated : 'h0;   
           WDATA_IS5   =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WDATA_IS5_gated : 'h0; 
           WSTRB_IS5   =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WSTRB_IS5_gated : 'h0;
           WLAST_IS5   =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WLAST_IS5_gated : 'h0; 
           WVALID_IS5  =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WVALID_IS5_gated : 'h0;

           WID_IS6     =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WID_IS6_gated : 'h0;   
           WDATA_IS6   =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WDATA_IS6_gated : 'h0; 
           WSTRB_IS6   =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WSTRB_IS6_gated : 'h0;
           WLAST_IS6   =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WLAST_IS6_gated : 'h0; 
           WVALID_IS6  =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WVALID_IS6_gated : 'h0;

           WID_IS7     =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WID_IS7_gated : 'h0;   
           WDATA_IS7   =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WDATA_IS7_gated : 'h0; 
           WSTRB_IS7   =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WSTRB_IS7_gated : 'h0;
           WLAST_IS7   =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WLAST_IS7_gated : 'h0; 
           WVALID_IS7  =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? WVALID_IS7_gated : 'h0;

           WID_IS8     =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WID_IS8_gated : 'h0;   
           WDATA_IS8   =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WDATA_IS8_gated : 'h0; 
           WSTRB_IS8   =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WSTRB_IS8_gated : 'h0;
           WLAST_IS8   =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WLAST_IS8_gated : 'h0; 
           WVALID_IS8  =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WVALID_IS8_gated : 'h0;

           WID_IS9     =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WID_IS9_gated : 'h0;   
           WDATA_IS9   =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WDATA_IS9_gated : 'h0; 
           WSTRB_IS9   =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WSTRB_IS9_gated : 'h0;
           WLAST_IS9   =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WLAST_IS9_gated : 'h0; 
           WVALID_IS9  =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WVALID_IS9_gated : 'h0;

           WID_IS10     =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WID_IS10_gated : 'h0;   
           WDATA_IS10   =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WDATA_IS10_gated : 'h0; 
           WSTRB_IS10   =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WSTRB_IS10_gated : 'h0;
           WLAST_IS10   =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WLAST_IS10_gated : 'h0; 
           WVALID_IS10  =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WVALID_IS10_gated : 'h0;

           WID_IS11     =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WID_IS11_gated : 'h0;   
           WDATA_IS11   =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WDATA_IS11_gated : 'h0; 
           WSTRB_IS11   =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WSTRB_IS11_gated : 'h0;
           WLAST_IS11   =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WLAST_IS11_gated : 'h0; 
           WVALID_IS11  =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WVALID_IS11_gated : 'h0;

           WID_IS12     =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WID_IS12_gated : 'h0;   
           WDATA_IS12   =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WDATA_IS12_gated : 'h0; 
           WSTRB_IS12   =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WSTRB_IS12_gated : 'h0;
           WLAST_IS12   =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WLAST_IS12_gated : 'h0; 
           WVALID_IS12  =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WVALID_IS12_gated : 'h0;

           WID_IS13     =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WID_IS13_gated : 'h0;   
           WDATA_IS13   =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WDATA_IS13_gated : 'h0; 
           WSTRB_IS13   =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WSTRB_IS13_gated : 'h0;
           WLAST_IS13   =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WLAST_IS13_gated : 'h0; 
           WVALID_IS13  =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WVALID_IS13_gated : 'h0;

           WID_IS14     =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WID_IS14_gated : 'h0;   
           WDATA_IS14   =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WDATA_IS14_gated : 'h0; 
           WSTRB_IS14   =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WSTRB_IS14_gated : 'h0;
           WLAST_IS14   =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WLAST_IS14_gated : 'h0; 
           WVALID_IS14  =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WVALID_IS14_gated : 'h0;

           WID_IS15     =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WID_IS15_gated : 'h0;   
           WDATA_IS15   =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WDATA_IS15_gated : 'h0; 
           WSTRB_IS15   =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WSTRB_IS15_gated : 'h0;
           WLAST_IS15   =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WLAST_IS15_gated : 'h0; 
           WVALID_IS15  =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? WVALID_IS15_gated : 'h0;

      // v3.2
      // Replaced AWADDR_IS16_gated_r with slave_out_addr to gate the write data channel correctly.
      if((MEMSPACE == 0 && ADDR_HGS_CFG == 1'b1  && WVALID_IS16_gated_r && ( (slave_out_addr16 > 4'h7 && slave_out_en_r16)))  ||   
         (MEMSPACE == 0 && ADDR_HGS_CFG == 1'b0  && WVALID_IS16_gated_r && ( (slave_out_addr16 < 4'h8 && slave_out_en_r16)))  ||                                           
         (MEMSPACE > 0  && SC_0  == 1            && WVALID_IS16_gated_r && (slave_out_addr16 == 4'h0 && slave_out_en16)) ||
         (MEMSPACE > 0  && SC_1  == 1            && WVALID_IS16_gated_r && (slave_out_addr16 == 4'h1 && slave_out_en16)) ||
         (MEMSPACE > 0  && SC_2  == 1            && WVALID_IS16_gated_r && (slave_out_addr16 == 4'h2 && slave_out_en16)) ||
         (MEMSPACE > 0  && SC_3  == 1            && WVALID_IS16_gated_r && (slave_out_addr16 == 4'h3 && slave_out_en16)) ||
         (MEMSPACE > 0  && SC_4  == 1            && WVALID_IS16_gated_r && (slave_out_addr16 == 4'h4 && slave_out_en16)) ||
         (MEMSPACE > 0  && SC_5  == 1            && WVALID_IS16_gated_r && (slave_out_addr16 == 4'h5 && slave_out_en16)) ||
         (MEMSPACE > 0  && SC_6  == 1            && WVALID_IS16_gated_r && (slave_out_addr16 == 4'h6 && slave_out_en16)) ||
         (MEMSPACE > 0  && SC_7  == 1            && WVALID_IS16_gated_r && (slave_out_addr16 == 4'h7 && slave_out_en16)) ||
         (MEMSPACE > 0  && SC_8  == 1            && WVALID_IS16_gated_r && (slave_out_addr16 == 4'h8 && slave_out_en16)) ||
         (MEMSPACE > 0  && SC_9  == 1            && WVALID_IS16_gated_r && (slave_out_addr16 == 4'h9 && slave_out_en16)) ||
         (MEMSPACE > 0  && SC_10 == 1            && WVALID_IS16_gated_r && (slave_out_addr16 == 4'hA && slave_out_en16)) ||
         (MEMSPACE > 0  && SC_11 == 1            && WVALID_IS16_gated_r && (slave_out_addr16 == 4'hB && slave_out_en16)) ||
         (MEMSPACE > 0  && SC_12 == 1            && WVALID_IS16_gated_r && (slave_out_addr16 == 4'hC && slave_out_en16)) ||
         (MEMSPACE > 0  && SC_13 == 1            && WVALID_IS16_gated_r && (slave_out_addr16 == 4'hD && slave_out_en16)) ||
         (MEMSPACE > 0  && SC_14 == 1            && WVALID_IS16_gated_r && (slave_out_addr16 == 4'hE && slave_out_en16)) ||
         (MEMSPACE > 0  && SC_15 == 1            && WVALID_IS16_gated_r && (slave_out_addr16 == 4'hF && slave_out_en16))
         ) begin                                                                                                    
         WID_IS16     =   WID_IS16_gated;   
         WDATA_IS16   =   WDATA_IS16_gated; 
         WSTRB_IS16   =   WSTRB_IS16_gated;
         WLAST_IS16   =   WLAST_IS16_gated; 
         WVALID_IS16  =   WVALID_IS16_gated;
      end
      else begin
         WID_IS16   = 'h0;
         WDATA_IS16 = 'h0;
         WSTRB_IS16 = 'h0;
         WLAST_IS16 = 'h0;
         WVALID_IS16= 'h0;
      end // if ((MEMSPACE == 0 && ADDR_HGS_CFG == 1'b1 && AWADDR_IS16_gated_r[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] > 4'h7)...
      

   end // always @ (*)
   

   // --------------------------------------------------------------------------
   // Pass the Read address signals from the interconnect matrix to downstream
   // slaves
   // --------------------------------------------------------------------------
   always @ (*) begin
           ARID_IS0     =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARID_IS0_gated : 'h0;   
           ARADDR_IS0   =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARADDR_IS0_gated : 'h0; 
           ARLEN_IS0    =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARLEN_IS0_gated : 'h0;  
           ARSIZE_IS0   =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARSIZE_IS0_gated : 'h0; 
           ARBURST_IS0  =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARBURST_IS0_gated : 'h0;
           ARLOCK_IS0   =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARLOCK_IS0_gated : 'h0; 
           ARCACHE_IS0  =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARCACHE_IS0_gated : 'h0;
           ARPROT_IS0   =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARPROT_IS0_gated : 'h0; 
           ARVALID_IS0  =   (SC_0 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARVALID_IS0_gated : 'h0;

           ARID_IS1     =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARID_IS1_gated : 'h0;   
           ARADDR_IS1   =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARADDR_IS1_gated : 'h0; 
           ARLEN_IS1    =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARLEN_IS1_gated : 'h0;  
           ARSIZE_IS1   =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARSIZE_IS1_gated : 'h0; 
           ARBURST_IS1  =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARBURST_IS1_gated : 'h0;
           ARLOCK_IS1   =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARLOCK_IS1_gated : 'h0; 
           ARCACHE_IS1  =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARCACHE_IS1_gated : 'h0;
           ARPROT_IS1   =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARPROT_IS1_gated : 'h0; 
           ARVALID_IS1  =   (SC_1 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARVALID_IS1_gated : 'h0;

           ARID_IS2     =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARID_IS2_gated : 'h0;   
           ARADDR_IS2   =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARADDR_IS2_gated : 'h0; 
           ARLEN_IS2    =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARLEN_IS2_gated : 'h0;  
           ARSIZE_IS2   =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARSIZE_IS2_gated : 'h0; 
           ARBURST_IS2  =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARBURST_IS2_gated : 'h0;
           ARLOCK_IS2   =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARLOCK_IS2_gated : 'h0; 
           ARCACHE_IS2  =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARCACHE_IS2_gated : 'h0;
           ARPROT_IS2   =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARPROT_IS2_gated : 'h0; 
           ARVALID_IS2  =   (SC_2 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARVALID_IS2_gated : 'h0;

           ARID_IS3     =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARID_IS3_gated : 'h0;   
           ARADDR_IS3   =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARADDR_IS3_gated : 'h0; 
           ARLEN_IS3    =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARLEN_IS3_gated : 'h0;  
           ARSIZE_IS3   =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARSIZE_IS3_gated : 'h0; 
           ARBURST_IS3  =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARBURST_IS3_gated : 'h0;
           ARLOCK_IS3   =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARLOCK_IS3_gated : 'h0; 
           ARCACHE_IS3  =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARCACHE_IS3_gated : 'h0;
           ARPROT_IS3   =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARPROT_IS3_gated : 'h0; 
           ARVALID_IS3  =   (SC_3 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARVALID_IS3_gated : 'h0;

           ARID_IS4     =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARID_IS4_gated : 'h0;   
           ARADDR_IS4   =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARADDR_IS4_gated : 'h0; 
           ARLEN_IS4    =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARLEN_IS4_gated : 'h0;  
           ARSIZE_IS4   =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARSIZE_IS4_gated : 'h0; 
           ARBURST_IS4  =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARBURST_IS4_gated : 'h0;
           ARLOCK_IS4   =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARLOCK_IS4_gated : 'h0; 
           ARCACHE_IS4  =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARCACHE_IS4_gated : 'h0;
           ARPROT_IS4   =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARPROT_IS4_gated : 'h0; 
           ARVALID_IS4  =   (SC_4 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARVALID_IS4_gated : 'h0;

           ARID_IS5     =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARID_IS5_gated : 'h0;   
           ARADDR_IS5   =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARADDR_IS5_gated : 'h0; 
           ARLEN_IS5    =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARLEN_IS5_gated : 'h0;  
           ARSIZE_IS5   =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARSIZE_IS5_gated : 'h0; 
           ARBURST_IS5  =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARBURST_IS5_gated : 'h0;
           ARLOCK_IS5   =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARLOCK_IS5_gated : 'h0; 
           ARCACHE_IS5  =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARCACHE_IS5_gated : 'h0;
           ARPROT_IS5   =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARPROT_IS5_gated : 'h0; 
           ARVALID_IS5  =   (SC_5 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARVALID_IS5_gated : 'h0;

           ARID_IS6     =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARID_IS6_gated : 'h0;   
           ARADDR_IS6   =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARADDR_IS6_gated : 'h0; 
           ARLEN_IS6    =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARLEN_IS6_gated : 'h0;  
           ARSIZE_IS6   =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARSIZE_IS6_gated : 'h0; 
           ARBURST_IS6  =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARBURST_IS6_gated : 'h0;
           ARLOCK_IS6   =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARLOCK_IS6_gated : 'h0; 
           ARCACHE_IS6  =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARCACHE_IS6_gated : 'h0;
           ARPROT_IS6   =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARPROT_IS6_gated : 'h0; 
           ARVALID_IS6  =   (SC_6 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARVALID_IS6_gated : 'h0;

           ARID_IS7     =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARID_IS7_gated : 'h0;   
           ARADDR_IS7   =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARADDR_IS7_gated : 'h0; 
           ARLEN_IS7    =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARLEN_IS7_gated : 'h0;  
           ARSIZE_IS7   =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARSIZE_IS7_gated : 'h0; 
           ARBURST_IS7  =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARBURST_IS7_gated : 'h0;
           ARLOCK_IS7   =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARLOCK_IS7_gated : 'h0; 
           ARCACHE_IS7  =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARCACHE_IS7_gated : 'h0;
           ARPROT_IS7   =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARPROT_IS7_gated : 'h0; 
           ARVALID_IS7  =   (SC_7 == 0 | (MEMSPACE == 0 && ADDR_HGS_CFG == 1)) ? ARVALID_IS7_gated : 'h0;

           ARID_IS8     =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARID_IS8_gated : 'h0;   
           ARADDR_IS8   =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARADDR_IS8_gated : 'h0; 
           ARLEN_IS8    =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARLEN_IS8_gated : 'h0;  
           ARSIZE_IS8   =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARSIZE_IS8_gated : 'h0; 
           ARBURST_IS8  =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARBURST_IS8_gated : 'h0;
           ARLOCK_IS8   =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARLOCK_IS8_gated : 'h0; 
           ARCACHE_IS8  =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARCACHE_IS8_gated : 'h0;
           ARPROT_IS8   =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARPROT_IS8_gated : 'h0; 
           ARVALID_IS8  =   (SC_8 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARVALID_IS8_gated : 'h0;

           ARID_IS9     =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARID_IS9_gated : 'h0;   
           ARADDR_IS9   =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARADDR_IS9_gated : 'h0; 
           ARLEN_IS9    =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARLEN_IS9_gated : 'h0;  
           ARSIZE_IS9   =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARSIZE_IS9_gated : 'h0; 
           ARBURST_IS9  =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARBURST_IS9_gated : 'h0;
           ARLOCK_IS9   =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARLOCK_IS9_gated : 'h0; 
           ARCACHE_IS9  =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARCACHE_IS9_gated : 'h0;
           ARPROT_IS9   =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARPROT_IS9_gated : 'h0; 
           ARVALID_IS9  =   (SC_9 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARVALID_IS9_gated : 'h0;

           ARID_IS10     =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARID_IS10_gated : 'h0;   
           ARADDR_IS10   =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARADDR_IS10_gated : 'h0; 
           ARLEN_IS10    =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARLEN_IS10_gated : 'h0;  
           ARSIZE_IS10   =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARSIZE_IS10_gated : 'h0; 
           ARBURST_IS10  =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARBURST_IS10_gated : 'h0;
           ARLOCK_IS10   =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARLOCK_IS10_gated : 'h0; 
           ARCACHE_IS10  =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARCACHE_IS10_gated : 'h0;
           ARPROT_IS10   =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARPROT_IS10_gated : 'h0; 
           ARVALID_IS10  =   (SC_10 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARVALID_IS10_gated : 'h0;

           ARID_IS11     =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARID_IS11_gated : 'h0;   
           ARADDR_IS11   =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARADDR_IS11_gated : 'h0; 
           ARLEN_IS11    =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARLEN_IS11_gated : 'h0;  
           ARSIZE_IS11   =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARSIZE_IS11_gated : 'h0; 
           ARBURST_IS11  =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARBURST_IS11_gated : 'h0;
           ARLOCK_IS11   =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARLOCK_IS11_gated : 'h0; 
           ARCACHE_IS11  =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARCACHE_IS11_gated : 'h0;
           ARPROT_IS11   =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARPROT_IS11_gated : 'h0; 
           ARVALID_IS11  =   (SC_11 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARVALID_IS11_gated : 'h0;

           ARID_IS12     =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARID_IS12_gated : 'h0;   
           ARADDR_IS12   =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARADDR_IS12_gated : 'h0; 
           ARLEN_IS12    =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARLEN_IS12_gated : 'h0;  
           ARSIZE_IS12   =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARSIZE_IS12_gated : 'h0; 
           ARBURST_IS12  =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARBURST_IS12_gated : 'h0;
           ARLOCK_IS12   =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARLOCK_IS12_gated : 'h0; 
           ARCACHE_IS12  =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARCACHE_IS12_gated : 'h0;
           ARPROT_IS12   =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARPROT_IS12_gated : 'h0; 
           ARVALID_IS12  =   (SC_12 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARVALID_IS12_gated : 'h0;

           ARID_IS13     =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARID_IS13_gated : 'h0;   
           ARADDR_IS13   =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARADDR_IS13_gated : 'h0; 
           ARLEN_IS13    =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARLEN_IS13_gated : 'h0;  
           ARSIZE_IS13   =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARSIZE_IS13_gated : 'h0; 
           ARBURST_IS13  =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARBURST_IS13_gated : 'h0;
           ARLOCK_IS13   =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARLOCK_IS13_gated : 'h0; 
           ARCACHE_IS13  =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARCACHE_IS13_gated : 'h0;
           ARPROT_IS13   =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARPROT_IS13_gated : 'h0; 
           ARVALID_IS13  =   (SC_13 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARVALID_IS13_gated : 'h0;

           ARID_IS14     =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARID_IS14_gated : 'h0;   
           ARADDR_IS14   =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARADDR_IS14_gated : 'h0; 
           ARLEN_IS14    =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARLEN_IS14_gated : 'h0;  
           ARSIZE_IS14   =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARSIZE_IS14_gated : 'h0; 
           ARBURST_IS14  =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARBURST_IS14_gated : 'h0;
           ARLOCK_IS14   =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARLOCK_IS14_gated : 'h0; 
           ARCACHE_IS14  =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARCACHE_IS14_gated : 'h0;
           ARPROT_IS14   =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARPROT_IS14_gated : 'h0; 
           ARVALID_IS14  =   (SC_14 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARVALID_IS14_gated : 'h0;

           ARID_IS15     =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARID_IS15_gated : 'h0;   
           ARADDR_IS15   =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARADDR_IS15_gated : 'h0; 
           ARLEN_IS15    =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARLEN_IS15_gated : 'h0;  
           ARSIZE_IS15   =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARSIZE_IS15_gated : 'h0; 
           ARBURST_IS15  =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARBURST_IS15_gated : 'h0;
           ARLOCK_IS15   =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARLOCK_IS15_gated : 'h0; 
           ARCACHE_IS15  =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARCACHE_IS15_gated : 'h0;
           ARPROT_IS15   =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARPROT_IS15_gated : 'h0; 
           ARVALID_IS15  =   (SC_15 == 0  | (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) ? ARVALID_IS15_gated : 'h0;

      if((MEMSPACE == 0 && ADDR_HGS_CFG == 1'b1 && ARVALID_IS16_gated_r && (ARADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] > 4'h7)) || 
         (MEMSPACE == 0 && ADDR_HGS_CFG == 1'b0 && ARVALID_IS16_gated_r && (ARADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] < 4'h8)) ||
         (MEMSPACE > 0  && SC_0  == 1            && ARVALID_IS16_gated_r   && (ARADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h0 )) ||
         (MEMSPACE > 0  && SC_1  == 1            && ARVALID_IS16_gated_r   && (ARADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h1 )) ||
         (MEMSPACE > 0  && SC_2  == 1            && ARVALID_IS16_gated_r   && (ARADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h2 )) ||
         (MEMSPACE > 0  && SC_3  == 1            && ARVALID_IS16_gated_r   && (ARADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h3 )) ||
         (MEMSPACE > 0  && SC_4  == 1            && ARVALID_IS16_gated_r   && (ARADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h4 )) ||
         (MEMSPACE > 0  && SC_5  == 1            && ARVALID_IS16_gated_r   && (ARADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h5 )) ||
         (MEMSPACE > 0  && SC_6  == 1            && ARVALID_IS16_gated_r   && (ARADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h6 )) ||
         (MEMSPACE > 0  && SC_7  == 1            && ARVALID_IS16_gated_r   && (ARADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h7 )) ||
         (MEMSPACE > 0  && SC_8  == 1            && ARVALID_IS16_gated_r   && (ARADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h8 )) ||
         (MEMSPACE > 0  && SC_9  == 1            && ARVALID_IS16_gated_r   && (ARADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'h9 )) ||
         (MEMSPACE > 0  && SC_10 == 1            && ARVALID_IS16_gated_r   && (ARADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'hA)) ||
         (MEMSPACE > 0  && SC_11 == 1            && ARVALID_IS16_gated_r   && (ARADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'hB)) ||
         (MEMSPACE > 0  && SC_12 == 1            && ARVALID_IS16_gated_r   && (ARADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'hC)) ||
         (MEMSPACE > 0  && SC_13 == 1            && ARVALID_IS16_gated_r   && (ARADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'hD)) ||
         (MEMSPACE > 0  && SC_14 == 1            && ARVALID_IS16_gated_r   && (ARADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'hE)) ||
         (MEMSPACE > 0  && SC_15 == 1            && ARVALID_IS16_gated_r   && (ARADDR_IS16_gated_r[AXI_AWIDTH - 1: AXI_AWIDTH-4] == 4'hF))
         ) begin
           ARID_IS16     =   ARID_IS16_gated;   
           ARADDR_IS16   =   ARADDR_IS16_gated; 
           ARLEN_IS16    =   ARLEN_IS16_gated;  
           ARSIZE_IS16   =   ARSIZE_IS16_gated; 
           ARBURST_IS16  =   ARBURST_IS16_gated;
           ARLOCK_IS16   =   ARLOCK_IS16_gated; 
           ARCACHE_IS16  =   ARCACHE_IS16_gated;
           ARPROT_IS16   =   ARPROT_IS16_gated; 
           ARVALID_IS16  =   ARVALID_IS16_gated;
      end
      else begin
         ARID_IS16     = 'h0;
         ARADDR_IS16   = 'h0;
         ARLEN_IS16    = 'h0;
         ARSIZE_IS16   = 'h0;
         ARBURST_IS16  = 'h0;
         ARLOCK_IS16   = 'h0;
         ARCACHE_IS16  = 'h0;
         ARPROT_IS16   = 'h0;
         ARVALID_IS16  = 'h0;
      end
   
   end // always @ (*)
   

   // --------------------------------------------------------------------------
   // Instance: matrix_s
   // --------------------------------------------------------------------------
   generate
      if(((M0_SLAVE0ENABLE == 1 || M1_SLAVE0ENABLE == 1  || M2_SLAVE0ENABLE == 1 || M3_SLAVE0ENABLE == 1) && (MEMSPACE > 0)) ||
         ((M0_SLAVE0ENABLE == 1 || M1_SLAVE0ENABLE == 1  || M2_SLAVE0ENABLE == 1 || M3_SLAVE0ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 1))) begin

   axi_matrix_s #(       
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
     inst_matrix_S0(
                    // Global signals
                    .ACLK(ACLK),
                    .ARESETN(ARESETN),
                    .AWADDR_IS_int(AWADDR_IS_int),
                    .ARADDR_IS_int(ARADDR_IS_int),
                    .gated_waddr(gated_waddr),
                    .gated_raddr(gated_raddr),

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

                    // From Master Stage
                    .m0_rd_end(m0_rd_end),
                    .m1_rd_end(m1_rd_end),
                    .m2_rd_end(m2_rd_end),
                    .m3_rd_end(m3_rd_end),
                    .m0_wr_end(m0_wr_end),
                    .m1_wr_end(m1_wr_end),
                    .m2_wr_end(m2_wr_end),
                    .m3_wr_end(m3_wr_end),
                    
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
                    .AWREADY_IM0(AWREADY_S0IM0),
                    // AXI MASTER write data channel signals
                    .WID_MI0(WID_MI0),
                    .WDATA_MI0(WDATA_MI0),
                    .WSTRB_MI0(WSTRB_MI0),
                    .WLAST_MI0(WLAST_MI0),
                    .WVALID_MI0(WVALID_MI0),
                    .WREADY_IM0(WREADY_S0IM0),
                    // AXI MASTER read address channel signals
                    .ARID_MI0(ARID_MI0),
                    .ARADDR_MI0(ARADDR_MI0),
                    .ARLEN_MI0(ARLEN_MI0),
                    .ARSIZE_MI0(ARSIZE_MI0),
                    .ARBURST_MI0(ARBURST_MI0),
                    .ARLOCK_MI0(ARLOCK_MI0),
                    .ARCACHE_MI0(ARCACHE_MI0),
                    .ARPROT_MI0(ARPROT_MI0),
                    .ARVALID_MI0(ARVALID_MI0),
                    .ARREADY_IM0(ARREADY_S0IM0),
                    
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
                    .AWREADY_IM1(AWREADY_S0IM1),
                    // AXI MASTER write data channel signals
                    .WID_MI1(WID_MI1),
                    .WDATA_MI1(WDATA_MI1),
                    .WSTRB_MI1(WSTRB_MI1),
                    .WLAST_MI1(WLAST_MI1),
                    .WVALID_MI1(WVALID_MI1),
                    .WREADY_IM1(WREADY_S0IM1),
                    // AXI MASTER read address channel signals
                    .ARID_MI1(ARID_MI1),
                    .ARADDR_MI1(ARADDR_MI1),
                    .ARLEN_MI1(ARLEN_MI1),
                    .ARSIZE_MI1(ARSIZE_MI1),
                    .ARBURST_MI1(ARBURST_MI1),
                    .ARLOCK_MI1(ARLOCK_MI1),
                    .ARCACHE_MI1(ARCACHE_MI1),
                    .ARPROT_MI1(ARPROT_MI1),
                    .ARVALID_MI1(ARVALID_MI1),
                    .ARREADY_IM1(ARREADY_S0IM1),
                    
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
                    .AWREADY_IM2(AWREADY_S0IM2),
                    // AXI MASTER write data channel signals
                    .WID_MI2(WID_MI2),
                    .WDATA_MI2(WDATA_MI2),
                    .WSTRB_MI2(WSTRB_MI2),
                    .WLAST_MI2(WLAST_MI2),
                    .WVALID_MI2(WVALID_MI2),
                    .WREADY_IM2(WREADY_S0IM2),
                    // AXI MASTER read address channel signals
                    .ARID_MI2(ARID_MI2),
                    .ARADDR_MI2(ARADDR_MI2),
                    .ARLEN_MI2(ARLEN_MI2),
                    .ARSIZE_MI2(ARSIZE_MI2),
                    .ARBURST_MI2(ARBURST_MI2),
                    .ARLOCK_MI2(ARLOCK_MI2),
                    .ARCACHE_MI2(ARCACHE_MI2),
                    .ARPROT_MI2(ARPROT_MI2),
                    .ARVALID_MI2(ARVALID_MI2),
                    .ARREADY_IM2(ARREADY_S0IM2),
                    
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
                    .AWREADY_IM3(AWREADY_S0IM3),
                    // AXI MASTER write data channel signals
                    .WID_MI3(WID_MI3),
                    .WDATA_MI3(WDATA_MI3),
                    .WSTRB_MI3(WSTRB_MI3),
                    .WLAST_MI3(WLAST_MI3),
                    .WVALID_MI3(WVALID_MI3),
                    .WREADY_IM3(WREADY_S0IM3),
                    // AXI MASTER read address channel signals
                    .ARID_MI3(ARID_MI3),
                    .ARADDR_MI3(ARADDR_MI3),
                    .ARLEN_MI3(ARLEN_MI3),
                    .ARSIZE_MI3(ARSIZE_MI3),
                    .ARBURST_MI3(ARBURST_MI3),
                    .ARLOCK_MI3(ARLOCK_MI3),
                    .ARCACHE_MI3(ARCACHE_MI3),
                    .ARPROT_MI3(ARPROT_MI3),
                    .ARVALID_MI3(ARVALID_MI3),
                    .ARREADY_IM3(ARREADY_S0IM3),                    
                    
                    // SLAVE 0
                    // AXI SLAVE 0 write address channel signals
                    .AWID_IS(AWID_IS0_gated),
                    .AWADDR_IS(AWADDR_IS0_gated),
                    .AWLEN_IS(AWLEN_IS0_gated),
                    .AWSIZE_IS(AWSIZE_IS0_gated),
                    .AWBURST_IS(AWBURST_IS0_gated),
                    .AWLOCK_IS(AWLOCK_IS0_gated),
                    .AWCACHE_IS(AWCACHE_IS0_gated),
                    .AWPROT_IS(AWPROT_IS0_gated),
                    .AWVALID_IS(AWVALID_IS0_gated),
                    .AWREADY_SI(AWREADY_SI0),

                    .RVALID_SI(RVALID_SI0),
                    .RLAST_SI(RLAST_SI0),
                    .RREADY_IS(RREADY_IS0),


                    // AXI SLAVE 0 write data channel signals
                    .WID_IS(WID_IS0_gated),
                    .WDATA_IS(WDATA_IS0_gated),
                    .WSTRB_IS(WSTRB_IS0_gated),
                    .WLAST_IS(WLAST_IS0_gated),
                    .WVALID_IS(WVALID_IS0_gated),
                    .WREADY_SI(WREADY_SI0),
                    // AXI SLAVE 0 read address channel signals
                    .ARID_IS(ARID_IS0_gated),
                    .ARADDR_IS(ARADDR_IS0_gated),
                    .ARLEN_IS(ARLEN_IS0_gated),
                    .ARSIZE_IS(ARSIZE_IS0_gated),
                    .ARBURST_IS(ARBURST_IS0_gated),
                    .ARLOCK_IS(ARLOCK_IS0_gated),
                    .ARCACHE_IS(ARCACHE_IS0_gated),
                    .ARPROT_IS(ARPROT_IS0_gated),
                    .ARVALID_IS(ARVALID_IS0_gated),
                    .ARREADY_SI(ARREADY_SI0),

                    .SLAVE_NUMBER(5'b00000),

                    //v3.2 - For Outstanding writes
                    .AWREADY_M0(AWREADY_M0),
                    .AWREADY_M1(AWREADY_M1),
                    .AWREADY_M2(AWREADY_M2),
                    .AWREADY_M3(AWREADY_M3),
                    .BVALID_M0(BVALID_M0),
                    .BVALID_M1(BVALID_M1),
                    .BVALID_M2(BVALID_M2),
                    .BVALID_M3(BVALID_M3),
                    .BREADY_M0(BREADY_M0),
                    .BREADY_M1(BREADY_M1),
                    .BREADY_M2(BREADY_M2),
                    .BREADY_M3(BREADY_M3),

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
                    .WLAST_M3 (WLAST_M3 ),
                    .slave_out_addr (slave_out_addr0)  
                    ,.slave_out_en (slave_out_en0)  
                    ,.pend_id_addr(pend_id_addr0)  
                    ,.pend_id_en(pend_id_en0)      

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


                    ,.outstnd_waddr(outstnd_waddr0)         
                    ,.outstnd_waddr_en(outstnd_waddr_en0)
                    );
      end
   endgenerate

   // --------------------------------------------------------------------------
   // Instance: matrix_s
   // --------------------------------------------------------------------------
   generate
      if(((M0_SLAVE1ENABLE == 1 || M1_SLAVE1ENABLE == 1  || M2_SLAVE1ENABLE == 1 || M3_SLAVE1ENABLE == 1) && (MEMSPACE > 0)) ||
         ((M0_SLAVE1ENABLE == 1 || M1_SLAVE1ENABLE == 1  || M2_SLAVE1ENABLE == 1 || M3_SLAVE1ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 1))) begin

   axi_matrix_s #(
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
     inst_matrix_S1(
                    // Global signals
                    .ACLK(ACLK),
                    .ARESETN(ARESETN),
                    .AWADDR_IS_int(AWADDR_IS_int),
                    .ARADDR_IS_int(ARADDR_IS_int),
                    
                    .gated_waddr(gated_waddr),
                    .gated_raddr(gated_raddr),

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

                    // From Master Stage
                    .m0_rd_end(m0_rd_end),
                    .m1_rd_end(m1_rd_end),
                    .m2_rd_end(m2_rd_end),
                    .m3_rd_end(m3_rd_end),
                    .m0_wr_end(m0_wr_end),
                    .m1_wr_end(m1_wr_end),
                    .m2_wr_end(m2_wr_end),
                    .m3_wr_end(m3_wr_end),
                    
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
                    .AWREADY_IM0(AWREADY_S1IM0),
                    // AXI MASTER write data channel signals
                    .WID_MI0(WID_MI0),
                    .WDATA_MI0(WDATA_MI0),
                    .WSTRB_MI0(WSTRB_MI0),
                    .WLAST_MI0(WLAST_MI0),
                    .WVALID_MI0(WVALID_MI0),
                    .WREADY_IM0(WREADY_S1IM0),
                    // AXI MASTER read address channel signals
                    .ARID_MI0(ARID_MI0),
                    .ARADDR_MI0(ARADDR_MI0),
                    .ARLEN_MI0(ARLEN_MI0),
                    .ARSIZE_MI0(ARSIZE_MI0),
                    .ARBURST_MI0(ARBURST_MI0),
                    .ARLOCK_MI0(ARLOCK_MI0),
                    .ARCACHE_MI0(ARCACHE_MI0),
                    .ARPROT_MI0(ARPROT_MI0),
                    .ARVALID_MI0(ARVALID_MI0),
                    .ARREADY_IM0(ARREADY_S1IM0),
                    
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
                    .AWREADY_IM1(AWREADY_S1IM1),
                    // AXI MASTER write data channel signals
                    .WID_MI1(WID_MI1),
                    .WDATA_MI1(WDATA_MI1),
                    .WSTRB_MI1(WSTRB_MI1),
                    .WLAST_MI1(WLAST_MI1),
                    .WVALID_MI1(WVALID_MI1),
                    .WREADY_IM1(WREADY_S1IM1),
                    // AXI MASTER read address channel signals
                    .ARID_MI1(ARID_MI1),
                    .ARADDR_MI1(ARADDR_MI1),
                    .ARLEN_MI1(ARLEN_MI1),
                    .ARSIZE_MI1(ARSIZE_MI1),
                    .ARBURST_MI1(ARBURST_MI1),
                    .ARLOCK_MI1(ARLOCK_MI1),
                    .ARCACHE_MI1(ARCACHE_MI1),
                    .ARPROT_MI1(ARPROT_MI1),
                    .ARVALID_MI1(ARVALID_MI1),
                    .ARREADY_IM1(ARREADY_S1IM1),
                    
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
                    .AWREADY_IM2(AWREADY_S1IM2),
                    // AXI MASTER write data channel signals
                    .WID_MI2(WID_MI2),
                    .WDATA_MI2(WDATA_MI2),
                    .WSTRB_MI2(WSTRB_MI2),
                    .WLAST_MI2(WLAST_MI2),
                    .WVALID_MI2(WVALID_MI2),
                    .WREADY_IM2(WREADY_S1IM2),
                    // AXI MASTER read address channel signals
                    .ARID_MI2(ARID_MI2),
                    .ARADDR_MI2(ARADDR_MI2),
                    .ARLEN_MI2(ARLEN_MI2),
                    .ARSIZE_MI2(ARSIZE_MI2),
                    .ARBURST_MI2(ARBURST_MI2),
                    .ARLOCK_MI2(ARLOCK_MI2),
                    .ARCACHE_MI2(ARCACHE_MI2),
                    .ARPROT_MI2(ARPROT_MI2),
                    .ARVALID_MI2(ARVALID_MI2),
                    .ARREADY_IM2(ARREADY_S1IM2),
                    
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
                    .AWREADY_IM3(AWREADY_S1IM3),
                    // AXI MASTER write data channel signals
                    .WID_MI3(WID_MI3),
                    .WDATA_MI3(WDATA_MI3),
                    .WSTRB_MI3(WSTRB_MI3),
                    .WLAST_MI3(WLAST_MI3),
                    .WVALID_MI3(WVALID_MI3),
                    .WREADY_IM3(WREADY_S1IM3),
                    // AXI MASTER read address channel signals
                    .ARID_MI3(ARID_MI3),
                    .ARADDR_MI3(ARADDR_MI3),
                    .ARLEN_MI3(ARLEN_MI3),
                    .ARSIZE_MI3(ARSIZE_MI3),
                    .ARBURST_MI3(ARBURST_MI3),
                    .ARLOCK_MI3(ARLOCK_MI3),
                    .ARCACHE_MI3(ARCACHE_MI3),
                    .ARPROT_MI3(ARPROT_MI3),
                    .ARVALID_MI3(ARVALID_MI3),
                    .ARREADY_IM3(ARREADY_S1IM3),                    
                    
                    // SLAVE 1
                    // AXI SLAVE 1 write address channel signals
                    .AWID_IS(AWID_IS1_gated),
                    .AWADDR_IS(AWADDR_IS1_gated),
                    .AWLEN_IS(AWLEN_IS1_gated),
                    .AWSIZE_IS(AWSIZE_IS1_gated),
                    .AWBURST_IS(AWBURST_IS1_gated),
                    .AWLOCK_IS(AWLOCK_IS1_gated),
                    .AWCACHE_IS(AWCACHE_IS1_gated),
                    .AWPROT_IS(AWPROT_IS1_gated),
                    .AWVALID_IS(AWVALID_IS1_gated),
                    .AWREADY_SI(AWREADY_SI1),

                    .RVALID_SI(RVALID_SI1),
                    .RLAST_SI(RLAST_SI1),
                    .RREADY_IS(RREADY_IS1),

                    // AXI SLAVE 0 write data channel signals
                    .WID_IS(WID_IS1_gated),
                    .WDATA_IS(WDATA_IS1_gated),
                    .WSTRB_IS(WSTRB_IS1_gated),
                    .WLAST_IS(WLAST_IS1_gated),
                    .WVALID_IS(WVALID_IS1_gated),
                    .WREADY_SI(WREADY_SI1),
                    // AXI SLAVE 0 read address channel signals
                    .ARID_IS(ARID_IS1_gated),
                    .ARADDR_IS(ARADDR_IS1_gated),
                    .ARLEN_IS(ARLEN_IS1_gated),
                    .ARSIZE_IS(ARSIZE_IS1_gated),
                    .ARBURST_IS(ARBURST_IS1_gated),
                    .ARLOCK_IS(ARLOCK_IS1_gated),
                    .ARCACHE_IS(ARCACHE_IS1_gated),
                    .ARPROT_IS(ARPROT_IS1_gated),
                    .ARVALID_IS(ARVALID_IS1_gated),
                    .ARREADY_SI(ARREADY_SI1),

                    .SLAVE_NUMBER(5'b00001), 
                    //v3.2 - For Outstanding writes
                    .AWREADY_M0(AWREADY_M0),
                    .AWREADY_M1(AWREADY_M1),
                    .AWREADY_M2(AWREADY_M2),
                    .AWREADY_M3(AWREADY_M3),
                    .BVALID_M0(BVALID_M0),
                    .BVALID_M1(BVALID_M1),
                    .BVALID_M2(BVALID_M2),
                    .BVALID_M3(BVALID_M3),
                    .BREADY_M0(BREADY_M0),
                    .BREADY_M1(BREADY_M1),
                    .BREADY_M2(BREADY_M2),
                    .BREADY_M3(BREADY_M3),
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
                    .WLAST_M3 (WLAST_M3 ),
                    .slave_out_addr(slave_out_addr1)  
                    ,.slave_out_en (slave_out_en1)  
                    ,.pend_id_addr(pend_id_addr1)  
                    ,.pend_id_en(pend_id_en1)      
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

                    ,.outstnd_waddr(outstnd_waddr1)           
                    ,.outstnd_waddr_en(outstnd_waddr_en1)
                    );
      end
   endgenerate

   // --------------------------------------------------------------------------
   // Instance: matrix_s
   // --------------------------------------------------------------------------
   generate
      if(((M0_SLAVE2ENABLE == 1 || M1_SLAVE2ENABLE == 1  || M2_SLAVE2ENABLE == 1 || M3_SLAVE2ENABLE == 1) && (MEMSPACE > 0)) ||
         ((M0_SLAVE2ENABLE == 1 || M1_SLAVE2ENABLE == 1  || M2_SLAVE2ENABLE == 1 || M3_SLAVE2ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 1))) begin

   axi_matrix_s #(
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
     inst_matrix_S2(
                    // Global signals
                    .ACLK(ACLK),
                    .ARESETN(ARESETN),
                    .AWADDR_IS_int(AWADDR_IS_int),
                    .ARADDR_IS_int(ARADDR_IS_int),
                    
                    .gated_waddr(gated_waddr),
                    .gated_raddr(gated_raddr),

                    
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

                    // From Master Stage
                    .m0_rd_end(m0_rd_end),
                    .m1_rd_end(m1_rd_end),
                    .m2_rd_end(m2_rd_end),
                    .m3_rd_end(m3_rd_end),
                    .m0_wr_end(m0_wr_end),
                    .m1_wr_end(m1_wr_end),
                    .m2_wr_end(m2_wr_end),
                    .m3_wr_end(m3_wr_end),
                    
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
                    .AWREADY_IM0(AWREADY_S2IM0),
                    // AXI MASTER write data channel signals
                    .WID_MI0(WID_MI0),
                    .WDATA_MI0(WDATA_MI0),
                    .WSTRB_MI0(WSTRB_MI0),
                    .WLAST_MI0(WLAST_MI0),
                    .WVALID_MI0(WVALID_MI0),
                    .WREADY_IM0(WREADY_S2IM0),
                    // AXI MASTER read address channel signals
                    .ARID_MI0(ARID_MI0),
                    .ARADDR_MI0(ARADDR_MI0),
                    .ARLEN_MI0(ARLEN_MI0),
                    .ARSIZE_MI0(ARSIZE_MI0),
                    .ARBURST_MI0(ARBURST_MI0),
                    .ARLOCK_MI0(ARLOCK_MI0),
                    .ARCACHE_MI0(ARCACHE_MI0),
                    .ARPROT_MI0(ARPROT_MI0),
                    .ARVALID_MI0(ARVALID_MI0),
                    .ARREADY_IM0(ARREADY_S2IM0),
                    
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
                    .AWREADY_IM1(AWREADY_S2IM1),
                    // AXI MASTER write data channel signals
                    .WID_MI1(WID_MI1),
                    .WDATA_MI1(WDATA_MI1),
                    .WSTRB_MI1(WSTRB_MI1),
                    .WLAST_MI1(WLAST_MI1),
                    .WVALID_MI1(WVALID_MI1),
                    .WREADY_IM1(WREADY_S2IM1),
                    // AXI MASTER read address channel signals
                    .ARID_MI1(ARID_MI1),
                    .ARADDR_MI1(ARADDR_MI1),
                    .ARLEN_MI1(ARLEN_MI1),
                    .ARSIZE_MI1(ARSIZE_MI1),
                    .ARBURST_MI1(ARBURST_MI1),
                    .ARLOCK_MI1(ARLOCK_MI1),
                    .ARCACHE_MI1(ARCACHE_MI1),
                    .ARPROT_MI1(ARPROT_MI1),
                    .ARVALID_MI1(ARVALID_MI1),
                    .ARREADY_IM1(ARREADY_S2IM1),
                    
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
                    .AWREADY_IM2(AWREADY_S2IM2),
                    // AXI MASTER write data channel signals
                    .WID_MI2(WID_MI2),
                    .WDATA_MI2(WDATA_MI2),
                    .WSTRB_MI2(WSTRB_MI2),
                    .WLAST_MI2(WLAST_MI2),
                    .WVALID_MI2(WVALID_MI2),
                    .WREADY_IM2(WREADY_S2IM2),
                    // AXI MASTER read address channel signals
                    .ARID_MI2(ARID_MI2),
                    .ARADDR_MI2(ARADDR_MI2),
                    .ARLEN_MI2(ARLEN_MI2),
                    .ARSIZE_MI2(ARSIZE_MI2),
                    .ARBURST_MI2(ARBURST_MI2),
                    .ARLOCK_MI2(ARLOCK_MI2),
                    .ARCACHE_MI2(ARCACHE_MI2),
                    .ARPROT_MI2(ARPROT_MI2),
                    .ARVALID_MI2(ARVALID_MI2),
                    .ARREADY_IM2(ARREADY_S2IM2),
                    
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
                    .AWREADY_IM3(AWREADY_S2IM3),
                    // AXI MASTER write data channel signals
                    .WID_MI3(WID_MI3),
                    .WDATA_MI3(WDATA_MI3),
                    .WSTRB_MI3(WSTRB_MI3),
                    .WLAST_MI3(WLAST_MI3),
                    .WVALID_MI3(WVALID_MI3),
                    .WREADY_IM3(WREADY_S2IM3),
                    // AXI MASTER read address channel signals
                    .ARID_MI3(ARID_MI3),
                    .ARADDR_MI3(ARADDR_MI3),
                    .ARLEN_MI3(ARLEN_MI3),
                    .ARSIZE_MI3(ARSIZE_MI3),
                    .ARBURST_MI3(ARBURST_MI3),
                    .ARLOCK_MI3(ARLOCK_MI3),
                    .ARCACHE_MI3(ARCACHE_MI3),
                    .ARPROT_MI3(ARPROT_MI3),
                    .ARVALID_MI3(ARVALID_MI3),
                    .ARREADY_IM3(ARREADY_S2IM3),                    
                    
                    // SLAVE 2
                    // AXI SLAVE 2 write address channel signals
                    .AWID_IS(AWID_IS2_gated),
                    .AWADDR_IS(AWADDR_IS2_gated),
                    .AWLEN_IS(AWLEN_IS2_gated),
                    .AWSIZE_IS(AWSIZE_IS2_gated),
                    .AWBURST_IS(AWBURST_IS2_gated),
                    .AWLOCK_IS(AWLOCK_IS2_gated),
                    .AWCACHE_IS(AWCACHE_IS2_gated),
                    .AWPROT_IS(AWPROT_IS2_gated),
                    .AWVALID_IS(AWVALID_IS2_gated),
                    .AWREADY_SI(AWREADY_SI2),

                    .RVALID_SI(RVALID_SI2),
                    .RLAST_SI(RLAST_SI2),
                    .RREADY_IS(RREADY_IS2),

                    // AXI SLAVE 0 write data channel signals
                    .WID_IS(WID_IS2_gated),
                    .WDATA_IS(WDATA_IS2_gated),
                    .WSTRB_IS(WSTRB_IS2_gated),
                    .WLAST_IS(WLAST_IS2_gated),
                    .WVALID_IS(WVALID_IS2_gated),
                    .WREADY_SI(WREADY_SI2),
                    // AXI SLAVE 0 read address channel signals
                    .ARID_IS(ARID_IS2_gated),
                    .ARADDR_IS(ARADDR_IS2_gated),
                    .ARLEN_IS(ARLEN_IS2_gated),
                    .ARSIZE_IS(ARSIZE_IS2_gated),
                    .ARBURST_IS(ARBURST_IS2_gated),
                    .ARLOCK_IS(ARLOCK_IS2_gated),
                    .ARCACHE_IS(ARCACHE_IS2_gated),
                    .ARPROT_IS(ARPROT_IS2_gated),
                    .ARVALID_IS(ARVALID_IS2_gated),
                    .ARREADY_SI(ARREADY_SI2),
                    
                    .SLAVE_NUMBER(5'b00010),
                    //v3.2 - For Outstanding writes
                    .AWREADY_M0(AWREADY_M0),
                    .AWREADY_M1(AWREADY_M1),
                    .AWREADY_M2(AWREADY_M2),
                    .AWREADY_M3(AWREADY_M3),
                    .BVALID_M0(BVALID_M0),
                    .BVALID_M1(BVALID_M1),
                    .BVALID_M2(BVALID_M2),
                    .BVALID_M3(BVALID_M3),
                    .BREADY_M0(BREADY_M0),
                    .BREADY_M1(BREADY_M1),
                    .BREADY_M2(BREADY_M2),
                    .BREADY_M3(BREADY_M3),
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
                    .WLAST_M3 (WLAST_M3 ),
                    .slave_out_addr(slave_out_addr2)  
                    ,.slave_out_en (slave_out_en2)  
                    ,.pend_id_addr(pend_id_addr2)  
                    ,.pend_id_en(pend_id_en2)      
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

                    ,.outstnd_waddr(outstnd_waddr2)           
                    ,.outstnd_waddr_en(outstnd_waddr_en2)
                    );
      end
   endgenerate

   // --------------------------------------------------------------------------
   // Instance: matrix_s
   // --------------------------------------------------------------------------
   generate
      if(((M0_SLAVE3ENABLE == 1 || M1_SLAVE3ENABLE == 1  || M2_SLAVE3ENABLE == 1 || M3_SLAVE3ENABLE == 1) && (MEMSPACE > 0)) ||
         ((M0_SLAVE3ENABLE == 1 || M1_SLAVE3ENABLE == 1  || M2_SLAVE3ENABLE == 1 || M3_SLAVE3ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 1))) begin
   
   axi_matrix_s #(
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
     inst_matrix_S3(
                    // Global signals
                    .ACLK(ACLK),
                    .ARESETN(ARESETN),
                    .AWADDR_IS_int(AWADDR_IS_int),
                    .ARADDR_IS_int(ARADDR_IS_int),
                    
                    .gated_waddr(gated_waddr),
                    .gated_raddr(gated_raddr),

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

                    // From Master Stage
                    .m0_rd_end(m0_rd_end),
                    .m1_rd_end(m1_rd_end),
                    .m2_rd_end(m2_rd_end),
                    .m3_rd_end(m3_rd_end),
                    .m0_wr_end(m0_wr_end),
                    .m1_wr_end(m1_wr_end),
                    .m2_wr_end(m2_wr_end),
                    .m3_wr_end(m3_wr_end),
                    
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
                    .AWREADY_IM0(AWREADY_S3IM0),
                    // AXI MASTER write data channel signals
                    .WID_MI0(WID_MI0),
                    .WDATA_MI0(WDATA_MI0),
                    .WSTRB_MI0(WSTRB_MI0),
                    .WLAST_MI0(WLAST_MI0),
                    .WVALID_MI0(WVALID_MI0),
                    .WREADY_IM0(WREADY_S3IM0),
                    // AXI MASTER read address channel signals
                    .ARID_MI0(ARID_MI0),
                    .ARADDR_MI0(ARADDR_MI0),
                    .ARLEN_MI0(ARLEN_MI0),
                    .ARSIZE_MI0(ARSIZE_MI0),
                    .ARBURST_MI0(ARBURST_MI0),
                    .ARLOCK_MI0(ARLOCK_MI0),
                    .ARCACHE_MI0(ARCACHE_MI0),
                    .ARPROT_MI0(ARPROT_MI0),
                    .ARVALID_MI0(ARVALID_MI0),
                    .ARREADY_IM0(ARREADY_S3IM0),
                    
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
                    .AWREADY_IM1(AWREADY_S3IM1),
                    // AXI MASTER write data channel signals
                    .WID_MI1(WID_MI1),
                    .WDATA_MI1(WDATA_MI1),
                    .WSTRB_MI1(WSTRB_MI1),
                    .WLAST_MI1(WLAST_MI1),
                    .WVALID_MI1(WVALID_MI1),
                    .WREADY_IM1(WREADY_S3IM1),
                    // AXI MASTER read address channel signals
                    .ARID_MI1(ARID_MI1),
                    .ARADDR_MI1(ARADDR_MI1),
                    .ARLEN_MI1(ARLEN_MI1),
                    .ARSIZE_MI1(ARSIZE_MI1),
                    .ARBURST_MI1(ARBURST_MI1),
                    .ARLOCK_MI1(ARLOCK_MI1),
                    .ARCACHE_MI1(ARCACHE_MI1),
                    .ARPROT_MI1(ARPROT_MI1),
                    .ARVALID_MI1(ARVALID_MI1),
                    .ARREADY_IM1(ARREADY_S3IM1),
                    
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
                    .AWREADY_IM2(AWREADY_S3IM2),
                    // AXI MASTER write data channel signals
                    .WID_MI2(WID_MI2),
                    .WDATA_MI2(WDATA_MI2),
                    .WSTRB_MI2(WSTRB_MI2),
                    .WLAST_MI2(WLAST_MI2),
                    .WVALID_MI2(WVALID_MI2),
                    .WREADY_IM2(WREADY_S3IM2),
                    // AXI MASTER read address channel signals
                    .ARID_MI2(ARID_MI2),
                    .ARADDR_MI2(ARADDR_MI2),
                    .ARLEN_MI2(ARLEN_MI2),
                    .ARSIZE_MI2(ARSIZE_MI2),
                    .ARBURST_MI2(ARBURST_MI2),
                    .ARLOCK_MI2(ARLOCK_MI2),
                    .ARCACHE_MI2(ARCACHE_MI2),
                    .ARPROT_MI2(ARPROT_MI2),
                    .ARVALID_MI2(ARVALID_MI2),
                    .ARREADY_IM2(ARREADY_S3IM2),
                    
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
                    .AWREADY_IM3(AWREADY_S3IM3),
                    // AXI MASTER write data channel signals
                    .WID_MI3(WID_MI3),
                    .WDATA_MI3(WDATA_MI3),
                    .WSTRB_MI3(WSTRB_MI3),
                    .WLAST_MI3(WLAST_MI3),
                    .WVALID_MI3(WVALID_MI3),
                    .WREADY_IM3(WREADY_S3IM3),
                    // AXI MASTER read address channel signals
                    .ARID_MI3(ARID_MI3),
                    .ARADDR_MI3(ARADDR_MI3),
                    .ARLEN_MI3(ARLEN_MI3),
                    .ARSIZE_MI3(ARSIZE_MI3),
                    .ARBURST_MI3(ARBURST_MI3),
                    .ARLOCK_MI3(ARLOCK_MI3),
                    .ARCACHE_MI3(ARCACHE_MI3),
                    .ARPROT_MI3(ARPROT_MI3),
                    .ARVALID_MI3(ARVALID_MI3),
                    .ARREADY_IM3(ARREADY_S3IM3),
                    
                    
                    // SLAVE 3
                    // AXI SLAVE 3 write address channel signals
                    .AWID_IS(AWID_IS3_gated),
                    .AWADDR_IS(AWADDR_IS3_gated),
                    .AWLEN_IS(AWLEN_IS3_gated),
                    .AWSIZE_IS(AWSIZE_IS3_gated),
                    .AWBURST_IS(AWBURST_IS3_gated),
                    .AWLOCK_IS(AWLOCK_IS3_gated),
                    .AWCACHE_IS(AWCACHE_IS3_gated),
                    .AWPROT_IS(AWPROT_IS3_gated),
                    .AWVALID_IS(AWVALID_IS3_gated),
                    .AWREADY_SI(AWREADY_SI3),

                    .RVALID_SI(RVALID_SI3),
                    .RLAST_SI(RLAST_SI3),
                    .RREADY_IS(RREADY_IS3),

                    // AXI SLAVE 0 write data channel signals
                    .WID_IS(WID_IS3_gated),
                    .WDATA_IS(WDATA_IS3_gated),
                    .WSTRB_IS(WSTRB_IS3_gated),
                    .WLAST_IS(WLAST_IS3_gated),
                    .WVALID_IS(WVALID_IS3_gated),
                    .WREADY_SI(WREADY_SI3),
                    // AXI SLAVE 0 read address channel signals
                    .ARID_IS(ARID_IS3_gated),
                    .ARADDR_IS(ARADDR_IS3_gated),
                    .ARLEN_IS(ARLEN_IS3_gated),
                    .ARSIZE_IS(ARSIZE_IS3_gated),
                    .ARBURST_IS(ARBURST_IS3_gated),
                    .ARLOCK_IS(ARLOCK_IS3_gated),
                    .ARCACHE_IS(ARCACHE_IS3_gated),
                    .ARPROT_IS(ARPROT_IS3_gated),
                    .ARVALID_IS(ARVALID_IS3_gated),
                    .ARREADY_SI(ARREADY_SI3),
                    
                    .SLAVE_NUMBER(5'b00011),
                    //v3.2 - For Outstanding writes
                    .AWREADY_M0(AWREADY_M0),
                    .AWREADY_M1(AWREADY_M1),
                    .AWREADY_M2(AWREADY_M2),
                    .AWREADY_M3(AWREADY_M3),
                    .BVALID_M0(BVALID_M0),
                    .BVALID_M1(BVALID_M1),
                    .BVALID_M2(BVALID_M2),
                    .BVALID_M3(BVALID_M3),
                    .BREADY_M0(BREADY_M0),
                    .BREADY_M1(BREADY_M1),
                    .BREADY_M2(BREADY_M2),
                    .BREADY_M3(BREADY_M3),
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
                    .WLAST_M3 (WLAST_M3 ),
                    .slave_out_addr(slave_out_addr3)  
                    ,.slave_out_en (slave_out_en3)  
                    ,.pend_id_addr(pend_id_addr3)  
                    ,.pend_id_en(pend_id_en3)      
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

                    ,.outstnd_waddr(outstnd_waddr3)           
                    ,.outstnd_waddr_en(outstnd_waddr_en3)
                    );
      end
   endgenerate

   // --------------------------------------------------------------------------
   // Instance: matrix_s
   // --------------------------------------------------------------------------
   generate
      if(((M0_SLAVE4ENABLE == 1 || M1_SLAVE4ENABLE == 1  || M2_SLAVE4ENABLE == 1 || M3_SLAVE4ENABLE == 1) && (MEMSPACE > 0)) ||
         ((M0_SLAVE4ENABLE == 1 || M1_SLAVE4ENABLE == 1  || M2_SLAVE4ENABLE == 1 || M3_SLAVE4ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 1))) begin

   axi_matrix_s #(
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
     inst_matrix_S4(
                    // Global signals
                    .ACLK(ACLK),
                    .ARESETN(ARESETN),
                    .AWADDR_IS_int(AWADDR_IS_int),
                    .ARADDR_IS_int(ARADDR_IS_int),
                    
                    .gated_waddr(gated_waddr),
                    .gated_raddr(gated_raddr),

                    
                    
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

                    // From Master Stage
                    .m0_rd_end(m0_rd_end),
                    .m1_rd_end(m1_rd_end),
                    .m2_rd_end(m2_rd_end),
                    .m3_rd_end(m3_rd_end),
                    .m0_wr_end(m0_wr_end),
                    .m1_wr_end(m1_wr_end),
                    .m2_wr_end(m2_wr_end),
                    .m3_wr_end(m3_wr_end),
                    
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
                    .AWREADY_IM0(AWREADY_S4IM0),
                    // AXI MASTER write data channel signals
                    .WID_MI0(WID_MI0),
                    .WDATA_MI0(WDATA_MI0),
                    .WSTRB_MI0(WSTRB_MI0),
                    .WLAST_MI0(WLAST_MI0),
                    .WVALID_MI0(WVALID_MI0),
                    .WREADY_IM0(WREADY_S4IM0),
                    // AXI MASTER read address channel signals
                    .ARID_MI0(ARID_MI0),
                    .ARADDR_MI0(ARADDR_MI0),
                    .ARLEN_MI0(ARLEN_MI0),
                    .ARSIZE_MI0(ARSIZE_MI0),
                    .ARBURST_MI0(ARBURST_MI0),
                    .ARLOCK_MI0(ARLOCK_MI0),
                    .ARCACHE_MI0(ARCACHE_MI0),
                    .ARPROT_MI0(ARPROT_MI0),
                    .ARVALID_MI0(ARVALID_MI0),
                    .ARREADY_IM0(ARREADY_S4IM0),
                    
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
                    .AWREADY_IM1(AWREADY_S4IM1),
                    // AXI MASTER write data channel signals
                    .WID_MI1(WID_MI1),
                    .WDATA_MI1(WDATA_MI1),
                    .WSTRB_MI1(WSTRB_MI1),
                    .WLAST_MI1(WLAST_MI1),
                    .WVALID_MI1(WVALID_MI1),
                    .WREADY_IM1(WREADY_S4IM1),
                    // AXI MASTER read address channel signals
                    .ARID_MI1(ARID_MI1),
                    .ARADDR_MI1(ARADDR_MI1),
                    .ARLEN_MI1(ARLEN_MI1),
                    .ARSIZE_MI1(ARSIZE_MI1),
                    .ARBURST_MI1(ARBURST_MI1),
                    .ARLOCK_MI1(ARLOCK_MI1),
                    .ARCACHE_MI1(ARCACHE_MI1),
                    .ARPROT_MI1(ARPROT_MI1),
                    .ARVALID_MI1(ARVALID_MI1),
                    .ARREADY_IM1(ARREADY_S4IM1),
                    
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
                    .AWREADY_IM2(AWREADY_S4IM2),
                    // AXI MASTER write data channel signals
                    .WID_MI2(WID_MI2),
                    .WDATA_MI2(WDATA_MI2),
                    .WSTRB_MI2(WSTRB_MI2),
                    .WLAST_MI2(WLAST_MI2),
                    .WVALID_MI2(WVALID_MI2),
                    .WREADY_IM2(WREADY_S4IM2),
                    // AXI MASTER read address channel signals
                    .ARID_MI2(ARID_MI2),
                    .ARADDR_MI2(ARADDR_MI2),
                    .ARLEN_MI2(ARLEN_MI2),
                    .ARSIZE_MI2(ARSIZE_MI2),
                    .ARBURST_MI2(ARBURST_MI2),
                    .ARLOCK_MI2(ARLOCK_MI2),
                    .ARCACHE_MI2(ARCACHE_MI2),
                    .ARPROT_MI2(ARPROT_MI2),
                    .ARVALID_MI2(ARVALID_MI2),
                    .ARREADY_IM2(ARREADY_S4IM2),
                    
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
                    .AWREADY_IM3(AWREADY_S4IM3),
                    // AXI MASTER write data channel signals
                    .WID_MI3(WID_MI3),
                    .WDATA_MI3(WDATA_MI3),
                    .WSTRB_MI3(WSTRB_MI3),
                    .WLAST_MI3(WLAST_MI3),
                    .WVALID_MI3(WVALID_MI3),
                    .WREADY_IM3(WREADY_S4IM3),
                    // AXI MASTER read address channel signals
                    .ARID_MI3(ARID_MI3),
                    .ARADDR_MI3(ARADDR_MI3),
                    .ARLEN_MI3(ARLEN_MI3),
                    .ARSIZE_MI3(ARSIZE_MI3),
                    .ARBURST_MI3(ARBURST_MI3),
                    .ARLOCK_MI3(ARLOCK_MI3),
                    .ARCACHE_MI3(ARCACHE_MI3),
                    .ARPROT_MI3(ARPROT_MI3),
                    .ARVALID_MI3(ARVALID_MI3),
                    .ARREADY_IM3(ARREADY_S4IM3),
                    
                    
                    // SLAVE 4
                    // AXI SLAVE 4 write address channel signals
                    .AWID_IS(AWID_IS4_gated),
                    .AWADDR_IS(AWADDR_IS4_gated),
                    .AWLEN_IS(AWLEN_IS4_gated),
                    .AWSIZE_IS(AWSIZE_IS4_gated),
                    .AWBURST_IS(AWBURST_IS4_gated),
                    .AWLOCK_IS(AWLOCK_IS4_gated),
                    .AWCACHE_IS(AWCACHE_IS4_gated),
                    .AWPROT_IS(AWPROT_IS4_gated),
                    .AWVALID_IS(AWVALID_IS4_gated),
                    .AWREADY_SI(AWREADY_SI4),

                    .RVALID_SI(RVALID_SI4),
                    .RLAST_SI(RLAST_SI4),
                    .RREADY_IS(RREADY_IS4),

                    // AXI SLAVE 0 write data channel signals
                    .WID_IS(WID_IS4_gated),
                    .WDATA_IS(WDATA_IS4_gated),
                    .WSTRB_IS(WSTRB_IS4_gated),
                    .WLAST_IS(WLAST_IS4_gated),
                    .WVALID_IS(WVALID_IS4_gated),
                    .WREADY_SI(WREADY_SI4),
                    // AXI SLAVE 0 read address channel signals
                    .ARID_IS(ARID_IS4_gated),
                    .ARADDR_IS(ARADDR_IS4_gated),
                    .ARLEN_IS(ARLEN_IS4_gated),
                    .ARSIZE_IS(ARSIZE_IS4_gated),
                    .ARBURST_IS(ARBURST_IS4_gated),
                    .ARLOCK_IS(ARLOCK_IS4_gated),
                    .ARCACHE_IS(ARCACHE_IS4_gated),
                    .ARPROT_IS(ARPROT_IS4_gated),
                    .ARVALID_IS(ARVALID_IS4_gated),
                    .ARREADY_SI(ARREADY_SI4),
                    
                    .SLAVE_NUMBER(5'b00100), 
                    //v3.2 - For Outstanding writes
                    .AWREADY_M0(AWREADY_M0),
                    .AWREADY_M1(AWREADY_M1),
                    .AWREADY_M2(AWREADY_M2),
                    .AWREADY_M3(AWREADY_M3),
                    .BVALID_M0(BVALID_M0),
                    .BVALID_M1(BVALID_M1),
                    .BVALID_M2(BVALID_M2),
                    .BVALID_M3(BVALID_M3),
                    .BREADY_M0(BREADY_M0),
                    .BREADY_M1(BREADY_M1),
                    .BREADY_M2(BREADY_M2),
                    .BREADY_M3(BREADY_M3),
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
                    .WLAST_M3 (WLAST_M3 ),
                    .slave_out_addr(slave_out_addr4)  
                    ,.slave_out_en (slave_out_en4)  
                    ,.pend_id_addr(pend_id_addr4)  
                    ,.pend_id_en(pend_id_en4)      
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

                    ,.outstnd_waddr(outstnd_waddr4)           
                    ,.outstnd_waddr_en(outstnd_waddr_en4)
                    );
      end
   endgenerate

   // --------------------------------------------------------------------------
   // Instance: matrix_s
   // --------------------------------------------------------------------------
   generate
      if(((M0_SLAVE5ENABLE == 1 || M1_SLAVE5ENABLE == 1  || M2_SLAVE5ENABLE == 1 || M3_SLAVE5ENABLE == 1) && (MEMSPACE > 0)) ||
         ((M0_SLAVE5ENABLE == 1 || M1_SLAVE5ENABLE == 1  || M2_SLAVE5ENABLE == 1 || M3_SLAVE5ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 1))) begin
   axi_matrix_s #(
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
     inst_matrix_S5(
                    // Global signals
                    .ACLK(ACLK),
                    .ARESETN(ARESETN),
                    .AWADDR_IS_int(AWADDR_IS_int),
                    .ARADDR_IS_int(ARADDR_IS_int),
                    
                    .gated_waddr(gated_waddr),
                    .gated_raddr(gated_raddr),

                    
                    
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

                    // From Master Stage
                    .m0_rd_end(m0_rd_end),
                    .m1_rd_end(m1_rd_end),
                    .m2_rd_end(m2_rd_end),
                    .m3_rd_end(m3_rd_end),
                    .m0_wr_end(m0_wr_end),
                    .m1_wr_end(m1_wr_end),
                    .m2_wr_end(m2_wr_end),
                    .m3_wr_end(m3_wr_end),
                    
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
                    .AWREADY_IM0(AWREADY_S5IM0),
                    // AXI MASTER write data channel signals
                    .WID_MI0(WID_MI0),
                    .WDATA_MI0(WDATA_MI0),
                    .WSTRB_MI0(WSTRB_MI0),
                    .WLAST_MI0(WLAST_MI0),
                    .WVALID_MI0(WVALID_MI0),
                    .WREADY_IM0(WREADY_S5IM0),
                    // AXI MASTER read address channel signals
                    .ARID_MI0(ARID_MI0),
                    .ARADDR_MI0(ARADDR_MI0),
                    .ARLEN_MI0(ARLEN_MI0),
                    .ARSIZE_MI0(ARSIZE_MI0),
                    .ARBURST_MI0(ARBURST_MI0),
                    .ARLOCK_MI0(ARLOCK_MI0),
                    .ARCACHE_MI0(ARCACHE_MI0),
                    .ARPROT_MI0(ARPROT_MI0),
                    .ARVALID_MI0(ARVALID_MI0),
                    .ARREADY_IM0(ARREADY_S5IM0),
                    
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
                    .AWREADY_IM1(AWREADY_S5IM1),
                    // AXI MASTER write data channel signals
                    .WID_MI1(WID_MI1),
                    .WDATA_MI1(WDATA_MI1),
                    .WSTRB_MI1(WSTRB_MI1),
                    .WLAST_MI1(WLAST_MI1),
                    .WVALID_MI1(WVALID_MI1),
                    .WREADY_IM1(WREADY_S5IM1),
                    // AXI MASTER read address channel signals
                    .ARID_MI1(ARID_MI1),
                    .ARADDR_MI1(ARADDR_MI1),
                    .ARLEN_MI1(ARLEN_MI1),
                    .ARSIZE_MI1(ARSIZE_MI1),
                    .ARBURST_MI1(ARBURST_MI1),
                    .ARLOCK_MI1(ARLOCK_MI1),
                    .ARCACHE_MI1(ARCACHE_MI1),
                    .ARPROT_MI1(ARPROT_MI1),
                    .ARVALID_MI1(ARVALID_MI1),
                    .ARREADY_IM1(ARREADY_S5IM1),
                    
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
                    .AWREADY_IM2(AWREADY_S5IM2),
                    // AXI MASTER write data channel signals
                    .WID_MI2(WID_MI2),
                    .WDATA_MI2(WDATA_MI2),
                    .WSTRB_MI2(WSTRB_MI2),
                    .WLAST_MI2(WLAST_MI2),
                    .WVALID_MI2(WVALID_MI2),
                    .WREADY_IM2(WREADY_S5IM2),
                    // AXI MASTER read address channel signals
                    .ARID_MI2(ARID_MI2),
                    .ARADDR_MI2(ARADDR_MI2),
                    .ARLEN_MI2(ARLEN_MI2),
                    .ARSIZE_MI2(ARSIZE_MI2),
                    .ARBURST_MI2(ARBURST_MI2),
                    .ARLOCK_MI2(ARLOCK_MI2),
                    .ARCACHE_MI2(ARCACHE_MI2),
                    .ARPROT_MI2(ARPROT_MI2),
                    .ARVALID_MI2(ARVALID_MI2),
                    .ARREADY_IM2(ARREADY_S5IM2),
                    
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
                    .AWREADY_IM3(AWREADY_S5IM3),
                    // AXI MASTER write data channel signals
                    .WID_MI3(WID_MI3),
                    .WDATA_MI3(WDATA_MI3),
                    .WSTRB_MI3(WSTRB_MI3),
                    .WLAST_MI3(WLAST_MI3),
                    .WVALID_MI3(WVALID_MI3),
                    .WREADY_IM3(WREADY_S5IM3),
                    // AXI MASTER read address channel signals
                    .ARID_MI3(ARID_MI3),
                    .ARADDR_MI3(ARADDR_MI3),
                    .ARLEN_MI3(ARLEN_MI3),
                    .ARSIZE_MI3(ARSIZE_MI3),
                    .ARBURST_MI3(ARBURST_MI3),
                    .ARLOCK_MI3(ARLOCK_MI3),
                    .ARCACHE_MI3(ARCACHE_MI3),
                    .ARPROT_MI3(ARPROT_MI3),
                    .ARVALID_MI3(ARVALID_MI3),
                    .ARREADY_IM3(ARREADY_S5IM3),
                    
                    
                    // SLAVE 5
                    // AXI SLAVE 5 write address channel signals
                    .AWID_IS(AWID_IS5_gated),
                    .AWADDR_IS(AWADDR_IS5_gated),
                    .AWLEN_IS(AWLEN_IS5_gated),
                    .AWSIZE_IS(AWSIZE_IS5_gated),
                    .AWBURST_IS(AWBURST_IS5_gated),
                    .AWLOCK_IS(AWLOCK_IS5_gated),
                    .AWCACHE_IS(AWCACHE_IS5_gated),
                    .AWPROT_IS(AWPROT_IS5_gated),
                    .AWVALID_IS(AWVALID_IS5_gated),
                    .AWREADY_SI(AWREADY_SI5),

                    .RVALID_SI(RVALID_SI5),
                    .RLAST_SI(RLAST_SI5),
                    .RREADY_IS(RREADY_IS5),

                    // AXI SLAVE 0 write data channel signals
                    .WID_IS(WID_IS5_gated),
                    .WDATA_IS(WDATA_IS5_gated),
                    .WSTRB_IS(WSTRB_IS5_gated),
                    .WLAST_IS(WLAST_IS5_gated),
                    .WVALID_IS(WVALID_IS5_gated),
                    .WREADY_SI(WREADY_SI5),
                    // AXI SLAVE 0 read address channel signals
                    .ARID_IS(ARID_IS5_gated),
                    .ARADDR_IS(ARADDR_IS5_gated),
                    .ARLEN_IS(ARLEN_IS5_gated),
                    .ARSIZE_IS(ARSIZE_IS5_gated),
                    .ARBURST_IS(ARBURST_IS5_gated),
                    .ARLOCK_IS(ARLOCK_IS5_gated),
                    .ARCACHE_IS(ARCACHE_IS5_gated),
                    .ARPROT_IS(ARPROT_IS5_gated),
                    .ARVALID_IS(ARVALID_IS5_gated),
                    .ARREADY_SI(ARREADY_SI5),
                    
                    .SLAVE_NUMBER(5'b00101),
                    //v3.2 - For Outstanding writes
                    .AWREADY_M0(AWREADY_M0),
                    .AWREADY_M1(AWREADY_M1),
                    .AWREADY_M2(AWREADY_M2),
                    .AWREADY_M3(AWREADY_M3),
                    .BVALID_M0(BVALID_M0),
                    .BVALID_M1(BVALID_M1),
                    .BVALID_M2(BVALID_M2),
                    .BVALID_M3(BVALID_M3),
                    .BREADY_M0(BREADY_M0),
                    .BREADY_M1(BREADY_M1),
                    .BREADY_M2(BREADY_M2),
                    .BREADY_M3(BREADY_M3),
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
                    .WLAST_M3 (WLAST_M3 ),
                    .slave_out_addr(slave_out_addr5)  
                    ,.slave_out_en (slave_out_en5)  
                    ,.pend_id_addr(pend_id_addr5)  
                    ,.pend_id_en(pend_id_en5)      
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

                    ,.outstnd_waddr(outstnd_waddr5)           
                    ,.outstnd_waddr_en(outstnd_waddr_en5)
                    );
      end
   endgenerate

   // --------------------------------------------------------------------------
   // Instance: matrix_s
   // --------------------------------------------------------------------------
   generate
      if(((M0_SLAVE6ENABLE == 1 || M1_SLAVE6ENABLE == 1  || M2_SLAVE6ENABLE == 1 || M3_SLAVE6ENABLE == 1) && (MEMSPACE > 0)) ||
         ((M0_SLAVE6ENABLE == 1 || M1_SLAVE6ENABLE == 1  || M2_SLAVE6ENABLE == 1 || M3_SLAVE6ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 1))) begin
   
   axi_matrix_s #(
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
     inst_matrix_S6(
                    // Global signals
                    .ACLK(ACLK),
                    .ARESETN(ARESETN),
                    .AWADDR_IS_int(AWADDR_IS_int),
                    .ARADDR_IS_int(ARADDR_IS_int),
                    
                    .gated_waddr(gated_waddr),
                    .gated_raddr(gated_raddr),

                    
                    
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


                    // From Master Stage
                    .m0_rd_end(m0_rd_end),
                    .m1_rd_end(m1_rd_end),
                    .m2_rd_end(m2_rd_end),
                    .m3_rd_end(m3_rd_end),
                    .m0_wr_end(m0_wr_end),
                    .m1_wr_end(m1_wr_end),
                    .m2_wr_end(m2_wr_end),
                    .m3_wr_end(m3_wr_end),
                    
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
                    .AWREADY_IM0(AWREADY_S6IM0),
                    // AXI MASTER write data channel signals
                    .WID_MI0(WID_MI0),
                    .WDATA_MI0(WDATA_MI0),
                    .WSTRB_MI0(WSTRB_MI0),
                    .WLAST_MI0(WLAST_MI0),
                    .WVALID_MI0(WVALID_MI0),
                    .WREADY_IM0(WREADY_S6IM0),
                    // AXI MASTER read address channel signals
                    .ARID_MI0(ARID_MI0),
                    .ARADDR_MI0(ARADDR_MI0),
                    .ARLEN_MI0(ARLEN_MI0),
                    .ARSIZE_MI0(ARSIZE_MI0),
                    .ARBURST_MI0(ARBURST_MI0),
                    .ARLOCK_MI0(ARLOCK_MI0),
                    .ARCACHE_MI0(ARCACHE_MI0),
                    .ARPROT_MI0(ARPROT_MI0),
                    .ARVALID_MI0(ARVALID_MI0),
                    .ARREADY_IM0(ARREADY_S6IM0),
                    
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
                    .AWREADY_IM1(AWREADY_S6IM1),
                    // AXI MASTER write data channel signals
                    .WID_MI1(WID_MI1),
                    .WDATA_MI1(WDATA_MI1),
                    .WSTRB_MI1(WSTRB_MI1),
                    .WLAST_MI1(WLAST_MI1),
                    .WVALID_MI1(WVALID_MI1),
                    .WREADY_IM1(WREADY_S6IM1),
                    // AXI MASTER read address channel signals
                    .ARID_MI1(ARID_MI1),
                    .ARADDR_MI1(ARADDR_MI1),
                    .ARLEN_MI1(ARLEN_MI1),
                    .ARSIZE_MI1(ARSIZE_MI1),
                    .ARBURST_MI1(ARBURST_MI1),
                    .ARLOCK_MI1(ARLOCK_MI1),
                    .ARCACHE_MI1(ARCACHE_MI1),
                    .ARPROT_MI1(ARPROT_MI1),
                    .ARVALID_MI1(ARVALID_MI1),
                    .ARREADY_IM1(ARREADY_S6IM1),
                    
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
                    .AWREADY_IM2(AWREADY_S6IM2),
                    // AXI MASTER write data channel signals
                    .WID_MI2(WID_MI2),
                    .WDATA_MI2(WDATA_MI2),
                    .WSTRB_MI2(WSTRB_MI2),
                    .WLAST_MI2(WLAST_MI2),
                    .WVALID_MI2(WVALID_MI2),
                    .WREADY_IM2(WREADY_S6IM2),
                    // AXI MASTER read address channel signals
                    .ARID_MI2(ARID_MI2),
                    .ARADDR_MI2(ARADDR_MI2),
                    .ARLEN_MI2(ARLEN_MI2),
                    .ARSIZE_MI2(ARSIZE_MI2),
                    .ARBURST_MI2(ARBURST_MI2),
                    .ARLOCK_MI2(ARLOCK_MI2),
                    .ARCACHE_MI2(ARCACHE_MI2),
                    .ARPROT_MI2(ARPROT_MI2),
                    .ARVALID_MI2(ARVALID_MI2),
                    .ARREADY_IM2(ARREADY_S6IM2),
                    
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
                    .AWREADY_IM3(AWREADY_S6IM3),
                    // AXI MASTER write data channel signals
                    .WID_MI3(WID_MI3),
                    .WDATA_MI3(WDATA_MI3),
                    .WSTRB_MI3(WSTRB_MI3),
                    .WLAST_MI3(WLAST_MI3),
                    .WVALID_MI3(WVALID_MI3),
                    .WREADY_IM3(WREADY_S6IM3),
                    // AXI MASTER read address channel signals
                    .ARID_MI3(ARID_MI3),
                    .ARADDR_MI3(ARADDR_MI3),
                    .ARLEN_MI3(ARLEN_MI3),
                    .ARSIZE_MI3(ARSIZE_MI3),
                    .ARBURST_MI3(ARBURST_MI3),
                    .ARLOCK_MI3(ARLOCK_MI3),
                    .ARCACHE_MI3(ARCACHE_MI3),
                    .ARPROT_MI3(ARPROT_MI3),
                    .ARVALID_MI3(ARVALID_MI3),
                    .ARREADY_IM3(ARREADY_S6IM3),
                    
                    
                    // SLAVE 6
                    // AXI SLAVE 6 write address channel signals
                    .AWID_IS(AWID_IS6_gated),
                    .AWADDR_IS(AWADDR_IS6_gated),
                    .AWLEN_IS(AWLEN_IS6_gated),
                    .AWSIZE_IS(AWSIZE_IS6_gated),
                    .AWBURST_IS(AWBURST_IS6_gated),
                    .AWLOCK_IS(AWLOCK_IS6_gated),
                    .AWCACHE_IS(AWCACHE_IS6_gated),
                    .AWPROT_IS(AWPROT_IS6_gated),
                    .AWVALID_IS(AWVALID_IS6_gated),
                    .AWREADY_SI(AWREADY_SI6),

                    .RVALID_SI(RVALID_SI6),
                    .RLAST_SI(RLAST_SI6),
                    .RREADY_IS(RREADY_IS6),

                    // AXI SLAVE 0 write data channel signals
                    .WID_IS(WID_IS6_gated),
                    .WDATA_IS(WDATA_IS6_gated),
                    .WSTRB_IS(WSTRB_IS6_gated),
                    .WLAST_IS(WLAST_IS6_gated),
                    .WVALID_IS(WVALID_IS6_gated),
                    .WREADY_SI(WREADY_SI6),
                    // AXI SLAVE 0 read address channel signals
                    .ARID_IS(ARID_IS6_gated),
                    .ARADDR_IS(ARADDR_IS6_gated),
                    .ARLEN_IS(ARLEN_IS6_gated),
                    .ARSIZE_IS(ARSIZE_IS6_gated),
                    .ARBURST_IS(ARBURST_IS6_gated),
                    .ARLOCK_IS(ARLOCK_IS6_gated),
                    .ARCACHE_IS(ARCACHE_IS6_gated),
                    .ARPROT_IS(ARPROT_IS6_gated),
                    .ARVALID_IS(ARVALID_IS6_gated),
                    .ARREADY_SI(ARREADY_SI6),
                    
                    .SLAVE_NUMBER(5'b00110), 
                    //v3.2 - For Outstanding writes
                    .AWREADY_M0(AWREADY_M0),
                    .AWREADY_M1(AWREADY_M1),
                    .AWREADY_M2(AWREADY_M2),
                    .AWREADY_M3(AWREADY_M3),
                    .BVALID_M0(BVALID_M0),
                    .BVALID_M1(BVALID_M1),
                    .BVALID_M2(BVALID_M2),
                    .BVALID_M3(BVALID_M3),
                    .BREADY_M0(BREADY_M0),
                    .BREADY_M1(BREADY_M1),
                    .BREADY_M2(BREADY_M2),
                    .BREADY_M3(BREADY_M3),
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
                    .WLAST_M3 (WLAST_M3 ),
                    .slave_out_addr(slave_out_addr6)  
                    ,.slave_out_en (slave_out_en6)  
                    ,.pend_id_addr(pend_id_addr6)  
                    ,.pend_id_en(pend_id_en6)      
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

                    ,.outstnd_waddr(outstnd_waddr6)           
                    ,.outstnd_waddr_en(outstnd_waddr_en6)
                    );
      end
   endgenerate

   // --------------------------------------------------------------------------
   // Instance: matrix_s
   // --------------------------------------------------------------------------
   generate
      if(((M0_SLAVE7ENABLE == 1 || M1_SLAVE7ENABLE == 1  || M2_SLAVE7ENABLE == 1 || M3_SLAVE7ENABLE == 1) && (MEMSPACE > 0)) ||
         ((M0_SLAVE7ENABLE == 1 || M1_SLAVE7ENABLE == 1  || M2_SLAVE7ENABLE == 1 || M3_SLAVE7ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 1))) begin
   
   axi_matrix_s #(
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
     inst_matrix_S7(
                    // Global signals
                    .ACLK(ACLK),
                    .ARESETN(ARESETN),
                    .AWADDR_IS_int(AWADDR_IS_int),
                    .ARADDR_IS_int(ARADDR_IS_int),
                    
                    .gated_waddr(gated_waddr),
                    .gated_raddr(gated_raddr),

                    
                    
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

                    // From Master Stage
                    .m0_rd_end(m0_rd_end),
                    .m1_rd_end(m1_rd_end),
                    .m2_rd_end(m2_rd_end),
                    .m3_rd_end(m3_rd_end),
                    .m0_wr_end(m0_wr_end),
                    .m1_wr_end(m1_wr_end),
                    .m2_wr_end(m2_wr_end),
                    .m3_wr_end(m3_wr_end),
                    
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
                    .AWREADY_IM0(AWREADY_S7IM0),
                    // AXI MASTER write data channel signals
                    .WID_MI0(WID_MI0),
                    .WDATA_MI0(WDATA_MI0),
                    .WSTRB_MI0(WSTRB_MI0),
                    .WLAST_MI0(WLAST_MI0),
                    .WVALID_MI0(WVALID_MI0),
                    .WREADY_IM0(WREADY_S7IM0),
                    // AXI MASTER read address channel signals
                    .ARID_MI0(ARID_MI0),
                    .ARADDR_MI0(ARADDR_MI0),
                    .ARLEN_MI0(ARLEN_MI0),
                    .ARSIZE_MI0(ARSIZE_MI0),
                    .ARBURST_MI0(ARBURST_MI0),
                    .ARLOCK_MI0(ARLOCK_MI0),
                    .ARCACHE_MI0(ARCACHE_MI0),
                    .ARPROT_MI0(ARPROT_MI0),
                    .ARVALID_MI0(ARVALID_MI0),
                    .ARREADY_IM0(ARREADY_S7IM0),
                    
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
                    .AWREADY_IM1(AWREADY_S7IM1),
                    // AXI MASTER write data channel signals
                    .WID_MI1(WID_MI1),
                    .WDATA_MI1(WDATA_MI1),
                    .WSTRB_MI1(WSTRB_MI1),
                    .WLAST_MI1(WLAST_MI1),
                    .WVALID_MI1(WVALID_MI1),
                    .WREADY_IM1(WREADY_S7IM1),
                    // AXI MASTER read address channel signals
                    .ARID_MI1(ARID_MI1),
                    .ARADDR_MI1(ARADDR_MI1),
                    .ARLEN_MI1(ARLEN_MI1),
                    .ARSIZE_MI1(ARSIZE_MI1),
                    .ARBURST_MI1(ARBURST_MI1),
                    .ARLOCK_MI1(ARLOCK_MI1),
                    .ARCACHE_MI1(ARCACHE_MI1),
                    .ARPROT_MI1(ARPROT_MI1),
                    .ARVALID_MI1(ARVALID_MI1),
                    .ARREADY_IM1(ARREADY_S7IM1),
                    
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
                    .AWREADY_IM2(AWREADY_S7IM2),
                    // AXI MASTER write data channel signals
                    .WID_MI2(WID_MI2),
                    .WDATA_MI2(WDATA_MI2),
                    .WSTRB_MI2(WSTRB_MI2),
                    .WLAST_MI2(WLAST_MI2),
                    .WVALID_MI2(WVALID_MI2),
                    .WREADY_IM2(WREADY_S7IM2),
                    // AXI MASTER read address channel signals
                    .ARID_MI2(ARID_MI2),
                    .ARADDR_MI2(ARADDR_MI2),
                    .ARLEN_MI2(ARLEN_MI2),
                    .ARSIZE_MI2(ARSIZE_MI2),
                    .ARBURST_MI2(ARBURST_MI2),
                    .ARLOCK_MI2(ARLOCK_MI2),
                    .ARCACHE_MI2(ARCACHE_MI2),
                    .ARPROT_MI2(ARPROT_MI2),
                    .ARVALID_MI2(ARVALID_MI2),
                    .ARREADY_IM2(ARREADY_S7IM2),
                    
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
                    .AWREADY_IM3(AWREADY_S7IM3),
                    // AXI MASTER write data channel signals
                    .WID_MI3(WID_MI3),
                    .WDATA_MI3(WDATA_MI3),
                    .WSTRB_MI3(WSTRB_MI3),
                    .WLAST_MI3(WLAST_MI3),
                    .WVALID_MI3(WVALID_MI3),
                    .WREADY_IM3(WREADY_S7IM3),
                    // AXI MASTER read address channel signals
                    .ARID_MI3(ARID_MI3),
                    .ARADDR_MI3(ARADDR_MI3),
                    .ARLEN_MI3(ARLEN_MI3),
                    .ARSIZE_MI3(ARSIZE_MI3),
                    .ARBURST_MI3(ARBURST_MI3),
                    .ARLOCK_MI3(ARLOCK_MI3),
                    .ARCACHE_MI3(ARCACHE_MI3),
                    .ARPROT_MI3(ARPROT_MI3),
                    .ARVALID_MI3(ARVALID_MI3),
                    .ARREADY_IM3(ARREADY_S7IM3),
                    
                    
                    // SLAVE 7
                    // AXI SLAVE 7 write address channel signals
                    .AWID_IS(AWID_IS7_gated),
                    .AWADDR_IS(AWADDR_IS7_gated),
                    .AWLEN_IS(AWLEN_IS7_gated),
                    .AWSIZE_IS(AWSIZE_IS7_gated),
                    .AWBURST_IS(AWBURST_IS7_gated),
                    .AWLOCK_IS(AWLOCK_IS7_gated),
                    .AWCACHE_IS(AWCACHE_IS7_gated),
                    .AWPROT_IS(AWPROT_IS7_gated),
                    .AWVALID_IS(AWVALID_IS7_gated),
                    .AWREADY_SI(AWREADY_SI7),

                    .RVALID_SI(RVALID_SI7),
                    .RLAST_SI(RLAST_SI7),
                    .RREADY_IS(RREADY_IS7),

                    // AXI SLAVE 0 write data channel signals
                    .WID_IS(WID_IS7_gated),
                    .WDATA_IS(WDATA_IS7_gated),
                    .WSTRB_IS(WSTRB_IS7_gated),
                    .WLAST_IS(WLAST_IS7_gated),
                    .WVALID_IS(WVALID_IS7_gated),
                    .WREADY_SI(WREADY_SI7),
                    // AXI SLAVE 0 read address channel signals
                    .ARID_IS(ARID_IS7_gated),
                    .ARADDR_IS(ARADDR_IS7_gated),
                    .ARLEN_IS(ARLEN_IS7_gated),
                    .ARSIZE_IS(ARSIZE_IS7_gated),
                    .ARBURST_IS(ARBURST_IS7_gated),
                    .ARLOCK_IS(ARLOCK_IS7_gated),
                    .ARCACHE_IS(ARCACHE_IS7_gated),
                    .ARPROT_IS(ARPROT_IS7_gated),
                    .ARVALID_IS(ARVALID_IS7_gated),
                    .ARREADY_SI(ARREADY_SI7),
                    
                    .SLAVE_NUMBER(5'b00111),
                    //v3.2 - For Outstanding writes
                    .AWREADY_M0(AWREADY_M0),
                    .AWREADY_M1(AWREADY_M1),
                    .AWREADY_M2(AWREADY_M2),
                    .AWREADY_M3(AWREADY_M3),
                    .BVALID_M0(BVALID_M0),
                    .BVALID_M1(BVALID_M1),
                    .BVALID_M2(BVALID_M2),
                    .BVALID_M3(BVALID_M3),
                    .BREADY_M0(BREADY_M0),
                    .BREADY_M1(BREADY_M1),
                    .BREADY_M2(BREADY_M2),
                    .BREADY_M3(BREADY_M3),
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
                    .WLAST_M3 (WLAST_M3 ),
                    .slave_out_addr(slave_out_addr7)  
                    ,.slave_out_en (slave_out_en7)  
                    ,.pend_id_addr(pend_id_addr7)  
                    ,.pend_id_en(pend_id_en7)      
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

                    ,.outstnd_waddr(outstnd_waddr7)           
                    ,.outstnd_waddr_en(outstnd_waddr_en7)
                    );
      end
   endgenerate

   // --------------------------------------------------------------------------
   // Instance: matrix_s
   // --------------------------------------------------------------------------
   generate
      if(((M0_SLAVE8ENABLE == 1 || M1_SLAVE8ENABLE == 1  || M2_SLAVE8ENABLE == 1 || M3_SLAVE8ENABLE == 1) && (MEMSPACE > 0)) ||
         ((M0_SLAVE8ENABLE == 1 || M1_SLAVE8ENABLE == 1  || M2_SLAVE8ENABLE == 1 || M3_SLAVE8ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 0))) begin
   
   axi_matrix_s #(
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
     inst_matrix_S8(
                    // Global signals
                    .ACLK(ACLK),
                    .ARESETN(ARESETN),
                    .AWADDR_IS_int(AWADDR_IS_int),
                    .ARADDR_IS_int(ARADDR_IS_int),
                    
                    .gated_waddr(gated_waddr),
                    .gated_raddr(gated_raddr),

                    
                    
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

                    // From Master Stage
                    .m0_rd_end(m0_rd_end),
                    .m1_rd_end(m1_rd_end),
                    .m2_rd_end(m2_rd_end),
                    .m3_rd_end(m3_rd_end),
                    .m0_wr_end(m0_wr_end),
                    .m1_wr_end(m1_wr_end),
                    .m2_wr_end(m2_wr_end),
                    .m3_wr_end(m3_wr_end),
                    
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
                    .AWREADY_IM0(AWREADY_S8IM0),
                    // AXI MASTER write data channel signals
                    .WID_MI0(WID_MI0),
                    .WDATA_MI0(WDATA_MI0),
                    .WSTRB_MI0(WSTRB_MI0),
                    .WLAST_MI0(WLAST_MI0),
                    .WVALID_MI0(WVALID_MI0),
                    .WREADY_IM0(WREADY_S8IM0),
                    // AXI MASTER read address channel signals
                    .ARID_MI0(ARID_MI0),
                    .ARADDR_MI0(ARADDR_MI0),
                    .ARLEN_MI0(ARLEN_MI0),
                    .ARSIZE_MI0(ARSIZE_MI0),
                    .ARBURST_MI0(ARBURST_MI0),
                    .ARLOCK_MI0(ARLOCK_MI0),
                    .ARCACHE_MI0(ARCACHE_MI0),
                    .ARPROT_MI0(ARPROT_MI0),
                    .ARVALID_MI0(ARVALID_MI0),
                    .ARREADY_IM0(ARREADY_S8IM0),
                    
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
                    .AWREADY_IM1(AWREADY_S8IM1),
                    // AXI MASTER write data channel signals
                    .WID_MI1(WID_MI1),
                    .WDATA_MI1(WDATA_MI1),
                    .WSTRB_MI1(WSTRB_MI1),
                    .WLAST_MI1(WLAST_MI1),
                    .WVALID_MI1(WVALID_MI1),
                    .WREADY_IM1(WREADY_S8IM1),
                    // AXI MASTER read address channel signals
                    .ARID_MI1(ARID_MI1),
                    .ARADDR_MI1(ARADDR_MI1),
                    .ARLEN_MI1(ARLEN_MI1),
                    .ARSIZE_MI1(ARSIZE_MI1),
                    .ARBURST_MI1(ARBURST_MI1),
                    .ARLOCK_MI1(ARLOCK_MI1),
                    .ARCACHE_MI1(ARCACHE_MI1),
                    .ARPROT_MI1(ARPROT_MI1),
                    .ARVALID_MI1(ARVALID_MI1),
                    .ARREADY_IM1(ARREADY_S8IM1),
                    
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
                    .AWREADY_IM2(AWREADY_S8IM2),
                    // AXI MASTER write data channel signals
                    .WID_MI2(WID_MI2),
                    .WDATA_MI2(WDATA_MI2),
                    .WSTRB_MI2(WSTRB_MI2),
                    .WLAST_MI2(WLAST_MI2),
                    .WVALID_MI2(WVALID_MI2),
                    .WREADY_IM2(WREADY_S8IM2),
                    // AXI MASTER read address channel signals
                    .ARID_MI2(ARID_MI2),
                    .ARADDR_MI2(ARADDR_MI2),
                    .ARLEN_MI2(ARLEN_MI2),
                    .ARSIZE_MI2(ARSIZE_MI2),
                    .ARBURST_MI2(ARBURST_MI2),
                    .ARLOCK_MI2(ARLOCK_MI2),
                    .ARCACHE_MI2(ARCACHE_MI2),
                    .ARPROT_MI2(ARPROT_MI2),
                    .ARVALID_MI2(ARVALID_MI2),
                    .ARREADY_IM2(ARREADY_S8IM2),
                    
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
                    .AWREADY_IM3(AWREADY_S8IM3),
                    // AXI MASTER write data channel signals
                    .WID_MI3(WID_MI3),
                    .WDATA_MI3(WDATA_MI3),
                    .WSTRB_MI3(WSTRB_MI3),
                    .WLAST_MI3(WLAST_MI3),
                    .WVALID_MI3(WVALID_MI3),
                    .WREADY_IM3(WREADY_S8IM3),
                    // AXI MASTER read address channel signals
                    .ARID_MI3(ARID_MI3),
                    .ARADDR_MI3(ARADDR_MI3),
                    .ARLEN_MI3(ARLEN_MI3),
                    .ARSIZE_MI3(ARSIZE_MI3),
                    .ARBURST_MI3(ARBURST_MI3),
                    .ARLOCK_MI3(ARLOCK_MI3),
                    .ARCACHE_MI3(ARCACHE_MI3),
                    .ARPROT_MI3(ARPROT_MI3),
                    .ARVALID_MI3(ARVALID_MI3),
                    .ARREADY_IM3(ARREADY_S8IM3),
                    
                    
                    // SLAVE 8
                    // AXI SLAVE 8 write address channel signals
                    .AWID_IS(AWID_IS8_gated),
                    .AWADDR_IS(AWADDR_IS8_gated),
                    .AWLEN_IS(AWLEN_IS8_gated),
                    .AWSIZE_IS(AWSIZE_IS8_gated),
                    .AWBURST_IS(AWBURST_IS8_gated),
                    .AWLOCK_IS(AWLOCK_IS8_gated),
                    .AWCACHE_IS(AWCACHE_IS8_gated),
                    .AWPROT_IS(AWPROT_IS8_gated),
                    .AWVALID_IS(AWVALID_IS8_gated),
                    .AWREADY_SI(AWREADY_SI8),

                    .RVALID_SI(RVALID_SI8),
                    .RLAST_SI(RLAST_SI8),
                    .RREADY_IS(RREADY_IS8),

                    // AXI SLAVE 0 write data channel signals
                    .WID_IS(WID_IS8_gated),
                    .WDATA_IS(WDATA_IS8_gated),
                    .WSTRB_IS(WSTRB_IS8_gated),
                    .WLAST_IS(WLAST_IS8_gated),
                    .WVALID_IS(WVALID_IS8_gated),
                    .WREADY_SI(WREADY_SI8),
                    // AXI SLAVE 0 read address channel signals
                    .ARID_IS(ARID_IS8_gated),
                    .ARADDR_IS(ARADDR_IS8_gated),
                    .ARLEN_IS(ARLEN_IS8_gated),
                    .ARSIZE_IS(ARSIZE_IS8_gated),
                    .ARBURST_IS(ARBURST_IS8_gated),
                    .ARLOCK_IS(ARLOCK_IS8_gated),
                    .ARCACHE_IS(ARCACHE_IS8_gated),
                    .ARPROT_IS(ARPROT_IS8_gated),
                    .ARVALID_IS(ARVALID_IS8_gated),
                    .ARREADY_SI(ARREADY_SI8),
                    
                    .SLAVE_NUMBER(5'b01000), 
                    //v3.2 - For Outstanding writes
                    .AWREADY_M0(AWREADY_M0),
                    .AWREADY_M1(AWREADY_M1),
                    .AWREADY_M2(AWREADY_M2),
                    .AWREADY_M3(AWREADY_M3),
                    .BVALID_M0(BVALID_M0),
                    .BVALID_M1(BVALID_M1),
                    .BVALID_M2(BVALID_M2),
                    .BVALID_M3(BVALID_M3),
                    .BREADY_M0(BREADY_M0),
                    .BREADY_M1(BREADY_M1),
                    .BREADY_M2(BREADY_M2),
                    .BREADY_M3(BREADY_M3),
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
                    .WLAST_M3 (WLAST_M3 ),
                    .slave_out_addr(slave_out_addr8)  
                    ,.slave_out_en (slave_out_en8)  
                    ,.pend_id_addr(pend_id_addr8)  
                    ,.pend_id_en(pend_id_en8)      
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

                    ,.outstnd_waddr(outstnd_waddr8)           
                    ,.outstnd_waddr_en(outstnd_waddr_en8)
                    );

      end
   endgenerate

   // --------------------------------------------------------------------------
   // Instance: matrix_s
   // --------------------------------------------------------------------------
   generate
      if(((M0_SLAVE9ENABLE == 1 || M1_SLAVE9ENABLE == 1  || M2_SLAVE9ENABLE == 1 || M3_SLAVE9ENABLE == 1) && (MEMSPACE > 0)) ||
         ((M0_SLAVE9ENABLE == 1 || M1_SLAVE9ENABLE == 1  || M2_SLAVE9ENABLE == 1 || M3_SLAVE9ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 0))) begin
   axi_matrix_s #(
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
     inst_matrix_S9(
                    // Global signals
                    .ACLK(ACLK),
                    .ARESETN(ARESETN),
                    .AWADDR_IS_int(AWADDR_IS_int),
                    .ARADDR_IS_int(ARADDR_IS_int),
                    
                    .gated_waddr(gated_waddr),
                    .gated_raddr(gated_raddr),

                    
                    
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

                    // From Master Stage
                    .m0_rd_end(m0_rd_end),
                    .m1_rd_end(m1_rd_end),
                    .m2_rd_end(m2_rd_end),
                    .m3_rd_end(m3_rd_end),
                    .m0_wr_end(m0_wr_end),
                    .m1_wr_end(m1_wr_end),
                    .m2_wr_end(m2_wr_end),
                    .m3_wr_end(m3_wr_end),
                    
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
                    .AWREADY_IM0(AWREADY_S9IM0),
                    // AXI MASTER write data channel signals
                    .WID_MI0(WID_MI0),
                    .WDATA_MI0(WDATA_MI0),
                    .WSTRB_MI0(WSTRB_MI0),
                    .WLAST_MI0(WLAST_MI0),
                    .WVALID_MI0(WVALID_MI0),
                    .WREADY_IM0(WREADY_S9IM0),
                    // AXI MASTER read address channel signals
                    .ARID_MI0(ARID_MI0),
                    .ARADDR_MI0(ARADDR_MI0),
                    .ARLEN_MI0(ARLEN_MI0),
                    .ARSIZE_MI0(ARSIZE_MI0),
                    .ARBURST_MI0(ARBURST_MI0),
                    .ARLOCK_MI0(ARLOCK_MI0),
                    .ARCACHE_MI0(ARCACHE_MI0),
                    .ARPROT_MI0(ARPROT_MI0),
                    .ARVALID_MI0(ARVALID_MI0),
                    .ARREADY_IM0(ARREADY_S9IM0),
                    
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
                    .AWREADY_IM1(AWREADY_S9IM1),
                    // AXI MASTER write data channel signals
                    .WID_MI1(WID_MI1),
                    .WDATA_MI1(WDATA_MI1),
                    .WSTRB_MI1(WSTRB_MI1),
                    .WLAST_MI1(WLAST_MI1),
                    .WVALID_MI1(WVALID_MI1),
                    .WREADY_IM1(WREADY_S9IM1),
                    // AXI MASTER read address channel signals
                    .ARID_MI1(ARID_MI1),
                    .ARADDR_MI1(ARADDR_MI1),
                    .ARLEN_MI1(ARLEN_MI1),
                    .ARSIZE_MI1(ARSIZE_MI1),
                    .ARBURST_MI1(ARBURST_MI1),
                    .ARLOCK_MI1(ARLOCK_MI1),
                    .ARCACHE_MI1(ARCACHE_MI1),
                    .ARPROT_MI1(ARPROT_MI1),
                    .ARVALID_MI1(ARVALID_MI1),
                    .ARREADY_IM1(ARREADY_S9IM1),
                    
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
                    .AWREADY_IM2(AWREADY_S9IM2),
                    // AXI MASTER write data channel signals
                    .WID_MI2(WID_MI2),
                    .WDATA_MI2(WDATA_MI2),
                    .WSTRB_MI2(WSTRB_MI2),
                    .WLAST_MI2(WLAST_MI2),
                    .WVALID_MI2(WVALID_MI2),
                    .WREADY_IM2(WREADY_S9IM2),
                    // AXI MASTER read address channel signals
                    .ARID_MI2(ARID_MI2),
                    .ARADDR_MI2(ARADDR_MI2),
                    .ARLEN_MI2(ARLEN_MI2),
                    .ARSIZE_MI2(ARSIZE_MI2),
                    .ARBURST_MI2(ARBURST_MI2),
                    .ARLOCK_MI2(ARLOCK_MI2),
                    .ARCACHE_MI2(ARCACHE_MI2),
                    .ARPROT_MI2(ARPROT_MI2),
                    .ARVALID_MI2(ARVALID_MI2),
                    .ARREADY_IM2(ARREADY_S9IM2),
                    
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
                    .AWREADY_IM3(AWREADY_S9IM3),
                    // AXI MASTER write data channel signals
                    .WID_MI3(WID_MI3),
                    .WDATA_MI3(WDATA_MI3),
                    .WSTRB_MI3(WSTRB_MI3),
                    .WLAST_MI3(WLAST_MI3),
                    .WVALID_MI3(WVALID_MI3),
                    .WREADY_IM3(WREADY_S9IM3),
                    // AXI MASTER read address channel signals
                    .ARID_MI3(ARID_MI3),
                    .ARADDR_MI3(ARADDR_MI3),
                    .ARLEN_MI3(ARLEN_MI3),
                    .ARSIZE_MI3(ARSIZE_MI3),
                    .ARBURST_MI3(ARBURST_MI3),
                    .ARLOCK_MI3(ARLOCK_MI3),
                    .ARCACHE_MI3(ARCACHE_MI3),
                    .ARPROT_MI3(ARPROT_MI3),
                    .ARVALID_MI3(ARVALID_MI3),
                    .ARREADY_IM3(ARREADY_S9IM3),
                    
                    
                    // SLAVE 9
                    // AXI SLAVE 9 write address channel signals
                    .AWID_IS(AWID_IS9_gated),
                    .AWADDR_IS(AWADDR_IS9_gated),
                    .AWLEN_IS(AWLEN_IS9_gated),
                    .AWSIZE_IS(AWSIZE_IS9_gated),
                    .AWBURST_IS(AWBURST_IS9_gated),
                    .AWLOCK_IS(AWLOCK_IS9_gated),
                    .AWCACHE_IS(AWCACHE_IS9_gated),
                    .AWPROT_IS(AWPROT_IS9_gated),
                    .AWVALID_IS(AWVALID_IS9_gated),
                    .AWREADY_SI(AWREADY_SI9),

                    .RVALID_SI(RVALID_SI9),
                    .RLAST_SI(RLAST_SI9),
                    .RREADY_IS(RREADY_IS9),

                    // AXI SLAVE 0 write data channel signals
                    .WID_IS(WID_IS9_gated),
                    .WDATA_IS(WDATA_IS9_gated),
                    .WSTRB_IS(WSTRB_IS9_gated),
                    .WLAST_IS(WLAST_IS9_gated),
                    .WVALID_IS(WVALID_IS9_gated),
                    .WREADY_SI(WREADY_SI9),
                    // AXI SLAVE 0 read address channel signals
                    .ARID_IS(ARID_IS9_gated),
                    .ARADDR_IS(ARADDR_IS9_gated),
                    .ARLEN_IS(ARLEN_IS9_gated),
                    .ARSIZE_IS(ARSIZE_IS9_gated),
                    .ARBURST_IS(ARBURST_IS9_gated),
                    .ARLOCK_IS(ARLOCK_IS9_gated),
                    .ARCACHE_IS(ARCACHE_IS9_gated),
                    .ARPROT_IS(ARPROT_IS9_gated),
                    .ARVALID_IS(ARVALID_IS9_gated),
                    .ARREADY_SI(ARREADY_SI9),
                    
                    .SLAVE_NUMBER(5'b01001),
                    //v3.2 - For Outstanding writes
                    .AWREADY_M0(AWREADY_M0),
                    .AWREADY_M1(AWREADY_M1),
                    .AWREADY_M2(AWREADY_M2),
                    .AWREADY_M3(AWREADY_M3),
                    .BVALID_M0(BVALID_M0),
                    .BVALID_M1(BVALID_M1),
                    .BVALID_M2(BVALID_M2),
                    .BVALID_M3(BVALID_M3),
                    .BREADY_M0(BREADY_M0),
                    .BREADY_M1(BREADY_M1),
                    .BREADY_M2(BREADY_M2),
                    .BREADY_M3(BREADY_M3),
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
                    .WLAST_M3 (WLAST_M3 ),
                    .slave_out_addr(slave_out_addr9)  
                    ,.slave_out_en (slave_out_en9)  
                    ,.pend_id_addr(pend_id_addr9)  
                    ,.pend_id_en(pend_id_en9)      
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

                    ,.outstnd_waddr(outstnd_waddr9)           
                    ,.outstnd_waddr_en(outstnd_waddr_en9)
                    );
      end
   endgenerate

   // --------------------------------------------------------------------------
   // Instance: matrix_s
   // --------------------------------------------------------------------------
   generate
      if(((M0_SLAVE10ENABLE == 1 || M1_SLAVE10ENABLE == 1  || M2_SLAVE10ENABLE == 1 || M3_SLAVE10ENABLE == 1) && (MEMSPACE > 0)) ||
         ((M0_SLAVE10ENABLE == 1 || M1_SLAVE10ENABLE == 1  || M2_SLAVE10ENABLE == 1 || M3_SLAVE10ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 0))) begin
   axi_matrix_s #(
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
     inst_matrix_S10(
                    // Global signals
                    .ACLK(ACLK),
                    .ARESETN(ARESETN),
                    .AWADDR_IS_int(AWADDR_IS_int),
                    .ARADDR_IS_int(ARADDR_IS_int),
                     
                    .gated_waddr(gated_waddr),
                    .gated_raddr(gated_raddr),

                     
                    
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

                    // From Master Stage
                    .m0_rd_end(m0_rd_end),
                    .m1_rd_end(m1_rd_end),
                    .m2_rd_end(m2_rd_end),
                    .m3_rd_end(m3_rd_end),
                    .m0_wr_end(m0_wr_end),
                    .m1_wr_end(m1_wr_end),
                    .m2_wr_end(m2_wr_end),
                    .m3_wr_end(m3_wr_end),
                    
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
                    .AWREADY_IM0(AWREADY_S10IM0),
                    // AXI MASTER write data channel signals
                    .WID_MI0(WID_MI0),
                    .WDATA_MI0(WDATA_MI0),
                    .WSTRB_MI0(WSTRB_MI0),
                    .WLAST_MI0(WLAST_MI0),
                    .WVALID_MI0(WVALID_MI0),
                    .WREADY_IM0(WREADY_S10IM0),
                    // AXI MASTER read address channel signals
                    .ARID_MI0(ARID_MI0),
                    .ARADDR_MI0(ARADDR_MI0),
                    .ARLEN_MI0(ARLEN_MI0),
                    .ARSIZE_MI0(ARSIZE_MI0),
                    .ARBURST_MI0(ARBURST_MI0),
                    .ARLOCK_MI0(ARLOCK_MI0),
                    .ARCACHE_MI0(ARCACHE_MI0),
                    .ARPROT_MI0(ARPROT_MI0),
                    .ARVALID_MI0(ARVALID_MI0),
                    .ARREADY_IM0(ARREADY_S10IM0),
                    
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
                    .AWREADY_IM1(AWREADY_S10IM1),
                    // AXI MASTER write data channel signals
                    .WID_MI1(WID_MI1),
                    .WDATA_MI1(WDATA_MI1),
                    .WSTRB_MI1(WSTRB_MI1),
                    .WLAST_MI1(WLAST_MI1),
                    .WVALID_MI1(WVALID_MI1),
                    .WREADY_IM1(WREADY_S10IM1),
                    // AXI MASTER read address channel signals
                    .ARID_MI1(ARID_MI1),
                    .ARADDR_MI1(ARADDR_MI1),
                    .ARLEN_MI1(ARLEN_MI1),
                    .ARSIZE_MI1(ARSIZE_MI1),
                    .ARBURST_MI1(ARBURST_MI1),
                    .ARLOCK_MI1(ARLOCK_MI1),
                    .ARCACHE_MI1(ARCACHE_MI1),
                    .ARPROT_MI1(ARPROT_MI1),
                    .ARVALID_MI1(ARVALID_MI1),
                    .ARREADY_IM1(ARREADY_S10IM1),
                    
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
                    .AWREADY_IM2(AWREADY_S10IM2),
                    // AXI MASTER write data channel signals
                    .WID_MI2(WID_MI2),
                    .WDATA_MI2(WDATA_MI2),
                    .WSTRB_MI2(WSTRB_MI2),
                    .WLAST_MI2(WLAST_MI2),
                    .WVALID_MI2(WVALID_MI2),
                    .WREADY_IM2(WREADY_S10IM2),
                    // AXI MASTER read address channel signals
                    .ARID_MI2(ARID_MI2),
                    .ARADDR_MI2(ARADDR_MI2),
                    .ARLEN_MI2(ARLEN_MI2),
                    .ARSIZE_MI2(ARSIZE_MI2),
                    .ARBURST_MI2(ARBURST_MI2),
                    .ARLOCK_MI2(ARLOCK_MI2),
                    .ARCACHE_MI2(ARCACHE_MI2),
                    .ARPROT_MI2(ARPROT_MI2),
                    .ARVALID_MI2(ARVALID_MI2),
                    .ARREADY_IM2(ARREADY_S10IM2),
                    
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
                    .AWREADY_IM3(AWREADY_S10IM3),
                    // AXI MASTER write data channel signals
                    .WID_MI3(WID_MI3),
                    .WDATA_MI3(WDATA_MI3),
                    .WSTRB_MI3(WSTRB_MI3),
                    .WLAST_MI3(WLAST_MI3),
                    .WVALID_MI3(WVALID_MI3),
                    .WREADY_IM3(WREADY_S10IM3),
                    // AXI MASTER read address channel signals
                    .ARID_MI3(ARID_MI3),
                    .ARADDR_MI3(ARADDR_MI3),
                    .ARLEN_MI3(ARLEN_MI3),
                    .ARSIZE_MI3(ARSIZE_MI3),
                    .ARBURST_MI3(ARBURST_MI3),
                    .ARLOCK_MI3(ARLOCK_MI3),
                    .ARCACHE_MI3(ARCACHE_MI3),
                    .ARPROT_MI3(ARPROT_MI3),
                    .ARVALID_MI3(ARVALID_MI3),
                    .ARREADY_IM3(ARREADY_S10IM3),
                    
                    
                    // SLAVE 10
                    // AXI SLAVE 10 write address channel signals
                    .AWID_IS(AWID_IS10_gated),
                    .AWADDR_IS(AWADDR_IS10_gated),
                    .AWLEN_IS(AWLEN_IS10_gated),
                    .AWSIZE_IS(AWSIZE_IS10_gated),
                    .AWBURST_IS(AWBURST_IS10_gated),
                    .AWLOCK_IS(AWLOCK_IS10_gated),
                    .AWCACHE_IS(AWCACHE_IS10_gated),
                    .AWPROT_IS(AWPROT_IS10_gated),
                    .AWVALID_IS(AWVALID_IS10_gated),
                    .AWREADY_SI(AWREADY_SI10),

                    .RVALID_SI(RVALID_SI10),
                    .RLAST_SI(RLAST_SI10),
                    .RREADY_IS(RREADY_IS10),

                    // AXI SLAVE 0 write data channel signals
                    .WID_IS(WID_IS10_gated),
                    .WDATA_IS(WDATA_IS10_gated),
                    .WSTRB_IS(WSTRB_IS10_gated),
                    .WLAST_IS(WLAST_IS10_gated),
                    .WVALID_IS(WVALID_IS10_gated),
                    .WREADY_SI(WREADY_SI10),
                    // AXI SLAVE 0 read address channel signals
                    .ARID_IS(ARID_IS10_gated),
                    .ARADDR_IS(ARADDR_IS10_gated),
                    .ARLEN_IS(ARLEN_IS10_gated),
                    .ARSIZE_IS(ARSIZE_IS10_gated),
                    .ARBURST_IS(ARBURST_IS10_gated),
                    .ARLOCK_IS(ARLOCK_IS10_gated),
                    .ARCACHE_IS(ARCACHE_IS10_gated),
                    .ARPROT_IS(ARPROT_IS10_gated),
                    .ARVALID_IS(ARVALID_IS10_gated),
                    .ARREADY_SI(ARREADY_SI10),
                    
                    .SLAVE_NUMBER(5'b01010), 
                    //v3.2 - For Outstanding writes
                    .AWREADY_M0(AWREADY_M0),
                    .AWREADY_M1(AWREADY_M1),
                    .AWREADY_M2(AWREADY_M2),
                    .AWREADY_M3(AWREADY_M3),
                    .BVALID_M0(BVALID_M0),
                    .BVALID_M1(BVALID_M1),
                    .BVALID_M2(BVALID_M2),
                    .BVALID_M3(BVALID_M3),
                    .BREADY_M0(BREADY_M0),
                    .BREADY_M1(BREADY_M1),
                    .BREADY_M2(BREADY_M2),
                    .BREADY_M3(BREADY_M3),
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
                    .WLAST_M3 (WLAST_M3 ),
                    .slave_out_addr(slave_out_addr10)  
                    ,.slave_out_en (slave_out_en10)  
                    ,.pend_id_addr(pend_id_addr10)  
                    ,.pend_id_en(pend_id_en10)      
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

                    ,.outstnd_waddr(outstnd_waddr10)           
                    ,.outstnd_waddr_en(outstnd_waddr_en10)
                    );

      end
   endgenerate

   // --------------------------------------------------------------------------
   // Instance: matrix_s
   // --------------------------------------------------------------------------
   generate
      if(((M0_SLAVE11ENABLE == 1 || M1_SLAVE11ENABLE == 1  || M2_SLAVE11ENABLE == 1 || M3_SLAVE11ENABLE == 1) && (MEMSPACE > 0)) ||
         ((M0_SLAVE11ENABLE == 1 || M1_SLAVE11ENABLE == 1  || M2_SLAVE11ENABLE == 1 || M3_SLAVE11ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 0))) begin
   axi_matrix_s #(
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
     inst_matrix_S11(
                    // Global signals
                    .ACLK(ACLK),
                    .ARESETN(ARESETN),
                    .AWADDR_IS_int(AWADDR_IS_int),
                    .ARADDR_IS_int(ARADDR_IS_int),
                     
                    .gated_waddr(gated_waddr),
                    .gated_raddr(gated_raddr),

                     
                    
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

                    // From Master Stage
                    .m0_rd_end(m0_rd_end),
                    .m1_rd_end(m1_rd_end),
                    .m2_rd_end(m2_rd_end),
                    .m3_rd_end(m3_rd_end),
                    .m0_wr_end(m0_wr_end),
                    .m1_wr_end(m1_wr_end),
                    .m2_wr_end(m2_wr_end),
                    .m3_wr_end(m3_wr_end),
                    
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
                    .AWREADY_IM0(AWREADY_S11IM0),
                    // AXI MASTER write data channel signals
                    .WID_MI0(WID_MI0),
                    .WDATA_MI0(WDATA_MI0),
                    .WSTRB_MI0(WSTRB_MI0),
                    .WLAST_MI0(WLAST_MI0),
                    .WVALID_MI0(WVALID_MI0),
                    .WREADY_IM0(WREADY_S11IM0),
                    // AXI MASTER read address channel signals
                    .ARID_MI0(ARID_MI0),
                    .ARADDR_MI0(ARADDR_MI0),
                    .ARLEN_MI0(ARLEN_MI0),
                    .ARSIZE_MI0(ARSIZE_MI0),
                    .ARBURST_MI0(ARBURST_MI0),
                    .ARLOCK_MI0(ARLOCK_MI0),
                    .ARCACHE_MI0(ARCACHE_MI0),
                    .ARPROT_MI0(ARPROT_MI0),
                    .ARVALID_MI0(ARVALID_MI0),
                    .ARREADY_IM0(ARREADY_S11IM0),
                    
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
                    .AWREADY_IM1(AWREADY_S11IM1),
                    // AXI MASTER write data channel signals
                    .WID_MI1(WID_MI1),
                    .WDATA_MI1(WDATA_MI1),
                    .WSTRB_MI1(WSTRB_MI1),
                    .WLAST_MI1(WLAST_MI1),
                    .WVALID_MI1(WVALID_MI1),
                    .WREADY_IM1(WREADY_S11IM1),
                    // AXI MASTER read address channel signals
                    .ARID_MI1(ARID_MI1),
                    .ARADDR_MI1(ARADDR_MI1),
                    .ARLEN_MI1(ARLEN_MI1),
                    .ARSIZE_MI1(ARSIZE_MI1),
                    .ARBURST_MI1(ARBURST_MI1),
                    .ARLOCK_MI1(ARLOCK_MI1),
                    .ARCACHE_MI1(ARCACHE_MI1),
                    .ARPROT_MI1(ARPROT_MI1),
                    .ARVALID_MI1(ARVALID_MI1),
                    .ARREADY_IM1(ARREADY_S11IM1),
                    
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
                    .AWREADY_IM2(AWREADY_S11IM2),
                    // AXI MASTER write data channel signals
                    .WID_MI2(WID_MI2),
                    .WDATA_MI2(WDATA_MI2),
                    .WSTRB_MI2(WSTRB_MI2),
                    .WLAST_MI2(WLAST_MI2),
                    .WVALID_MI2(WVALID_MI2),
                    .WREADY_IM2(WREADY_S11IM2),
                    // AXI MASTER read address channel signals
                    .ARID_MI2(ARID_MI2),
                    .ARADDR_MI2(ARADDR_MI2),
                    .ARLEN_MI2(ARLEN_MI2),
                    .ARSIZE_MI2(ARSIZE_MI2),
                    .ARBURST_MI2(ARBURST_MI2),
                    .ARLOCK_MI2(ARLOCK_MI2),
                    .ARCACHE_MI2(ARCACHE_MI2),
                    .ARPROT_MI2(ARPROT_MI2),
                    .ARVALID_MI2(ARVALID_MI2),
                    .ARREADY_IM2(ARREADY_S11IM2),
                    
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
                    .AWREADY_IM3(AWREADY_S11IM3),
                    // AXI MASTER write data channel signals
                    .WID_MI3(WID_MI3),
                    .WDATA_MI3(WDATA_MI3),
                    .WSTRB_MI3(WSTRB_MI3),
                    .WLAST_MI3(WLAST_MI3),
                    .WVALID_MI3(WVALID_MI3),
                    .WREADY_IM3(WREADY_S11IM3),
                    // AXI MASTER read address channel signals
                    .ARID_MI3(ARID_MI3),
                    .ARADDR_MI3(ARADDR_MI3),
                    .ARLEN_MI3(ARLEN_MI3),
                    .ARSIZE_MI3(ARSIZE_MI3),
                    .ARBURST_MI3(ARBURST_MI3),
                    .ARLOCK_MI3(ARLOCK_MI3),
                    .ARCACHE_MI3(ARCACHE_MI3),
                    .ARPROT_MI3(ARPROT_MI3),
                    .ARVALID_MI3(ARVALID_MI3),
                    .ARREADY_IM3(ARREADY_S11IM3),
                    
                    
                    // SLAVE 11
                    // AXI SLAVE 11 write address channel signals
                    .AWID_IS(AWID_IS11_gated),
                    .AWADDR_IS(AWADDR_IS11_gated),
                    .AWLEN_IS(AWLEN_IS11_gated),
                    .AWSIZE_IS(AWSIZE_IS11_gated),
                    .AWBURST_IS(AWBURST_IS11_gated),
                    .AWLOCK_IS(AWLOCK_IS11_gated),
                    .AWCACHE_IS(AWCACHE_IS11_gated),
                    .AWPROT_IS(AWPROT_IS11_gated),
                    .AWVALID_IS(AWVALID_IS11_gated),
                    .AWREADY_SI(AWREADY_SI11),

                    .RVALID_SI(RVALID_SI11),
                    .RLAST_SI(RLAST_SI11),
                    .RREADY_IS(RREADY_IS11),

                    // AXI SLAVE 0 write data channel signals
                    .WID_IS(WID_IS11_gated),
                    .WDATA_IS(WDATA_IS11_gated),
                    .WSTRB_IS(WSTRB_IS11_gated),
                    .WLAST_IS(WLAST_IS11_gated),
                    .WVALID_IS(WVALID_IS11_gated),
                    .WREADY_SI(WREADY_SI11),
                    // AXI SLAVE 0 read address channel signals
                    .ARID_IS(ARID_IS11_gated),
                    .ARADDR_IS(ARADDR_IS11_gated),
                    .ARLEN_IS(ARLEN_IS11_gated),
                    .ARSIZE_IS(ARSIZE_IS11_gated),
                    .ARBURST_IS(ARBURST_IS11_gated),
                    .ARLOCK_IS(ARLOCK_IS11_gated),
                    .ARCACHE_IS(ARCACHE_IS11_gated),
                    .ARPROT_IS(ARPROT_IS11_gated),
                    .ARVALID_IS(ARVALID_IS11_gated),
                    .ARREADY_SI(ARREADY_SI11),
                    
                    .SLAVE_NUMBER(5'b01011),
                    //v3.2 - For Outstanding writes
                    .AWREADY_M0(AWREADY_M0),
                    .AWREADY_M1(AWREADY_M1),
                    .AWREADY_M2(AWREADY_M2),
                    .AWREADY_M3(AWREADY_M3),
                    .BVALID_M0(BVALID_M0),
                    .BVALID_M1(BVALID_M1),
                    .BVALID_M2(BVALID_M2),
                    .BVALID_M3(BVALID_M3),
                    .BREADY_M0(BREADY_M0),
                    .BREADY_M1(BREADY_M1),
                    .BREADY_M2(BREADY_M2),
                    .BREADY_M3(BREADY_M3),
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
                    .WLAST_M3 (WLAST_M3 ),
                    .slave_out_addr(slave_out_addr11)  
                    ,.slave_out_en (slave_out_en11)  
                    ,.pend_id_addr(pend_id_addr11)  
                    ,.pend_id_en(pend_id_en11)      
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

                    ,.outstnd_waddr(outstnd_waddr11)           
                    ,.outstnd_waddr_en(outstnd_waddr_en11)
                    );

      end
   endgenerate

   // --------------------------------------------------------------------------
   // Instance: matrix_s
   // --------------------------------------------------------------------------
   generate
      if(((M0_SLAVE12ENABLE == 1 || M1_SLAVE12ENABLE == 1  || M2_SLAVE12ENABLE == 1 || M3_SLAVE12ENABLE == 1) && (MEMSPACE > 0)) ||
         ((M0_SLAVE12ENABLE == 1 || M1_SLAVE12ENABLE == 1  || M2_SLAVE12ENABLE == 1 || M3_SLAVE12ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 0))) begin
   axi_matrix_s #(
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
     inst_matrix_S12(
                    // Global signals
                    .ACLK(ACLK),
                    .ARESETN(ARESETN),
                    .AWADDR_IS_int(AWADDR_IS_int),
                    .ARADDR_IS_int(ARADDR_IS_int),
                     
                    .gated_waddr(gated_waddr),
                    .gated_raddr(gated_raddr),

                     
                    
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

                    // From Master Stage
                    .m0_rd_end(m0_rd_end),
                    .m1_rd_end(m1_rd_end),
                    .m2_rd_end(m2_rd_end),
                    .m3_rd_end(m3_rd_end),
                    .m0_wr_end(m0_wr_end),
                    .m1_wr_end(m1_wr_end),
                    .m2_wr_end(m2_wr_end),
                    .m3_wr_end(m3_wr_end),
                    
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
                    .AWREADY_IM0(AWREADY_S12IM0),
                    // AXI MASTER write data channel signals
                    .WID_MI0(WID_MI0),
                    .WDATA_MI0(WDATA_MI0),
                    .WSTRB_MI0(WSTRB_MI0),
                    .WLAST_MI0(WLAST_MI0),
                    .WVALID_MI0(WVALID_MI0),
                    .WREADY_IM0(WREADY_S12IM0),
                    // AXI MASTER read address channel signals
                    .ARID_MI0(ARID_MI0),
                    .ARADDR_MI0(ARADDR_MI0),
                    .ARLEN_MI0(ARLEN_MI0),
                    .ARSIZE_MI0(ARSIZE_MI0),
                    .ARBURST_MI0(ARBURST_MI0),
                    .ARLOCK_MI0(ARLOCK_MI0),
                    .ARCACHE_MI0(ARCACHE_MI0),
                    .ARPROT_MI0(ARPROT_MI0),
                    .ARVALID_MI0(ARVALID_MI0),
                    .ARREADY_IM0(ARREADY_S12IM0),
                    
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
                    .AWREADY_IM1(AWREADY_S12IM1),
                    // AXI MASTER write data channel signals
                    .WID_MI1(WID_MI1),
                    .WDATA_MI1(WDATA_MI1),
                    .WSTRB_MI1(WSTRB_MI1),
                    .WLAST_MI1(WLAST_MI1),
                    .WVALID_MI1(WVALID_MI1),
                    .WREADY_IM1(WREADY_S12IM1),
                    // AXI MASTER read address channel signals
                    .ARID_MI1(ARID_MI1),
                    .ARADDR_MI1(ARADDR_MI1),
                    .ARLEN_MI1(ARLEN_MI1),
                    .ARSIZE_MI1(ARSIZE_MI1),
                    .ARBURST_MI1(ARBURST_MI1),
                    .ARLOCK_MI1(ARLOCK_MI1),
                    .ARCACHE_MI1(ARCACHE_MI1),
                    .ARPROT_MI1(ARPROT_MI1),
                    .ARVALID_MI1(ARVALID_MI1),
                    .ARREADY_IM1(ARREADY_S12IM1),
                    
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
                    .AWREADY_IM2(AWREADY_S12IM2),
                    // AXI MASTER write data channel signals
                    .WID_MI2(WID_MI2),
                    .WDATA_MI2(WDATA_MI2),
                    .WSTRB_MI2(WSTRB_MI2),
                    .WLAST_MI2(WLAST_MI2),
                    .WVALID_MI2(WVALID_MI2),
                    .WREADY_IM2(WREADY_S12IM2),
                    // AXI MASTER read address channel signals
                    .ARID_MI2(ARID_MI2),
                    .ARADDR_MI2(ARADDR_MI2),
                    .ARLEN_MI2(ARLEN_MI2),
                    .ARSIZE_MI2(ARSIZE_MI2),
                    .ARBURST_MI2(ARBURST_MI2),
                    .ARLOCK_MI2(ARLOCK_MI2),
                    .ARCACHE_MI2(ARCACHE_MI2),
                    .ARPROT_MI2(ARPROT_MI2),
                    .ARVALID_MI2(ARVALID_MI2),
                    .ARREADY_IM2(ARREADY_S12IM2),
                    
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
                    .AWREADY_IM3(AWREADY_S12IM3),
                    // AXI MASTER write data channel signals
                    .WID_MI3(WID_MI3),
                    .WDATA_MI3(WDATA_MI3),
                    .WSTRB_MI3(WSTRB_MI3),
                    .WLAST_MI3(WLAST_MI3),
                    .WVALID_MI3(WVALID_MI3),
                    .WREADY_IM3(WREADY_S12IM3),
                    // AXI MASTER read address channel signals
                    .ARID_MI3(ARID_MI3),
                    .ARADDR_MI3(ARADDR_MI3),
                    .ARLEN_MI3(ARLEN_MI3),
                    .ARSIZE_MI3(ARSIZE_MI3),
                    .ARBURST_MI3(ARBURST_MI3),
                    .ARLOCK_MI3(ARLOCK_MI3),
                    .ARCACHE_MI3(ARCACHE_MI3),
                    .ARPROT_MI3(ARPROT_MI3),
                    .ARVALID_MI3(ARVALID_MI3),
                    .ARREADY_IM3(ARREADY_S12IM3),
                    
                    
                    // SLAVE 12
                    // AXI SLAVE 12 write address channel signals
                    .AWID_IS(AWID_IS12_gated),
                    .AWADDR_IS(AWADDR_IS12_gated),
                    .AWLEN_IS(AWLEN_IS12_gated),
                    .AWSIZE_IS(AWSIZE_IS12_gated),
                    .AWBURST_IS(AWBURST_IS12_gated),
                    .AWLOCK_IS(AWLOCK_IS12_gated),
                    .AWCACHE_IS(AWCACHE_IS12_gated),
                    .AWPROT_IS(AWPROT_IS12_gated),
                    .AWVALID_IS(AWVALID_IS12_gated),
                    .AWREADY_SI(AWREADY_SI12),

                    .RVALID_SI(RVALID_SI12),
                    .RLAST_SI(RLAST_SI12),
                    .RREADY_IS(RREADY_IS12),

                    // AXI SLAVE 0 write data channel signals
                    .WID_IS(WID_IS12_gated),
                    .WDATA_IS(WDATA_IS12_gated),
                    .WSTRB_IS(WSTRB_IS12_gated),
                    .WLAST_IS(WLAST_IS12_gated),
                    .WVALID_IS(WVALID_IS12_gated),
                    .WREADY_SI(WREADY_SI12),
                    // AXI SLAVE 0 read address channel signals
                    .ARID_IS(ARID_IS12_gated),
                    .ARADDR_IS(ARADDR_IS12_gated),
                    .ARLEN_IS(ARLEN_IS12_gated),
                    .ARSIZE_IS(ARSIZE_IS12_gated),
                    .ARBURST_IS(ARBURST_IS12_gated),
                    .ARLOCK_IS(ARLOCK_IS12_gated),
                    .ARCACHE_IS(ARCACHE_IS12_gated),
                    .ARPROT_IS(ARPROT_IS12_gated),
                    .ARVALID_IS(ARVALID_IS12_gated),
                    .ARREADY_SI(ARREADY_SI12),
                    
                    .SLAVE_NUMBER(5'b01100),
                    //v3.2 - For Outstanding writes
                    .AWREADY_M0(AWREADY_M0),
                    .AWREADY_M1(AWREADY_M1),
                    .AWREADY_M2(AWREADY_M2),
                    .AWREADY_M3(AWREADY_M3),
                    .BVALID_M0(BVALID_M0),
                    .BVALID_M1(BVALID_M1),
                    .BVALID_M2(BVALID_M2),
                    .BVALID_M3(BVALID_M3),
                    .BREADY_M0(BREADY_M0),
                    .BREADY_M1(BREADY_M1),
                    .BREADY_M2(BREADY_M2),
                    .BREADY_M3(BREADY_M3),
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
                    .WLAST_M3 (WLAST_M3 ),
                    .slave_out_addr(slave_out_addr12)
                    ,.slave_out_en (slave_out_en12)  
                    ,.pend_id_addr(pend_id_addr12)  
                    ,.pend_id_en(pend_id_en12)      
                                        ,.AWID_M0(AWID_M0)  // v3.2.12 - 5a
                    ,.AWID_M1(AWID_M1)
                    ,.AWID_M2(AWID_M2)           
                    ,.AWID_M3(AWID_M3)
                   
                                                  
                           ,.mst_rd_inprog0(mst_rd_inprog0) // v3.2.12 - lock xfers
                           ,.mst_rd_inprog1(mst_rd_inprog1) // v3.2.12 - lock xfers
                           ,.mst_rd_inprog2(mst_rd_inprog2) // v3.2.12 - lock xfers
                           ,.mst_rd_inprog3(mst_rd_inprog3) // v3.2.12 - lock xfers
                           ,.mst_wr_inprog0(mst_wr_inprog0)                               
                           ,.mst_wr_inprog1(mst_wr_inprog1)                               
                           ,.mst_wr_inprog2(mst_wr_inprog2)                               
                           ,.mst_wr_inprog3(mst_wr_inprog3)                               

                    ,.outstnd_waddr(outstnd_waddr12)           // v3.2.13
                    ,.outstnd_waddr_en(outstnd_waddr_en12)
                    );


      end
   endgenerate

   // --------------------------------------------------------------------------
   // Instance: matrix_s
   // --------------------------------------------------------------------------
   generate
      if(((M0_SLAVE13ENABLE == 1 || M1_SLAVE13ENABLE == 1  || M2_SLAVE13ENABLE == 1 || M3_SLAVE13ENABLE == 1) && (MEMSPACE > 0)) ||
         ((M0_SLAVE13ENABLE == 1 || M1_SLAVE13ENABLE == 1  || M2_SLAVE13ENABLE == 1 || M3_SLAVE13ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 0))) begin
   axi_matrix_s #(
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
     inst_matrix_S13(
                    // Global signals
                    .ACLK(ACLK),
                    .ARESETN(ARESETN),
                    .AWADDR_IS_int(AWADDR_IS_int),
                    .ARADDR_IS_int(ARADDR_IS_int),
                     
                    .gated_waddr(gated_waddr),
                    .gated_raddr(gated_raddr),

                     
                    
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

                    // From Master Stage
                    .m0_rd_end(m0_rd_end),
                    .m1_rd_end(m1_rd_end),
                    .m2_rd_end(m2_rd_end),
                    .m3_rd_end(m3_rd_end),
                    .m0_wr_end(m0_wr_end),
                    .m1_wr_end(m1_wr_end),
                    .m2_wr_end(m2_wr_end),
                    .m3_wr_end(m3_wr_end),
                    
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
                    .AWREADY_IM0(AWREADY_S13IM0),
                    // AXI MASTER write data channel signals
                    .WID_MI0(WID_MI0),
                    .WDATA_MI0(WDATA_MI0),
                    .WSTRB_MI0(WSTRB_MI0),
                    .WLAST_MI0(WLAST_MI0),
                    .WVALID_MI0(WVALID_MI0),
                    .WREADY_IM0(WREADY_S13IM0),
                    // AXI MASTER read address channel signals
                    .ARID_MI0(ARID_MI0),
                    .ARADDR_MI0(ARADDR_MI0),
                    .ARLEN_MI0(ARLEN_MI0),
                    .ARSIZE_MI0(ARSIZE_MI0),
                    .ARBURST_MI0(ARBURST_MI0),
                    .ARLOCK_MI0(ARLOCK_MI0),
                    .ARCACHE_MI0(ARCACHE_MI0),
                    .ARPROT_MI0(ARPROT_MI0),
                    .ARVALID_MI0(ARVALID_MI0),
                    .ARREADY_IM0(ARREADY_S13IM0),
                    
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
                    .AWREADY_IM1(AWREADY_S13IM1),
                    // AXI MASTER write data channel signals
                    .WID_MI1(WID_MI1),
                    .WDATA_MI1(WDATA_MI1),
                    .WSTRB_MI1(WSTRB_MI1),
                    .WLAST_MI1(WLAST_MI1),
                    .WVALID_MI1(WVALID_MI1),
                    .WREADY_IM1(WREADY_S13IM1),
                    // AXI MASTER read address channel signals
                    .ARID_MI1(ARID_MI1),
                    .ARADDR_MI1(ARADDR_MI1),
                    .ARLEN_MI1(ARLEN_MI1),
                    .ARSIZE_MI1(ARSIZE_MI1),
                    .ARBURST_MI1(ARBURST_MI1),
                    .ARLOCK_MI1(ARLOCK_MI1),
                    .ARCACHE_MI1(ARCACHE_MI1),
                    .ARPROT_MI1(ARPROT_MI1),
                    .ARVALID_MI1(ARVALID_MI1),
                    .ARREADY_IM1(ARREADY_S13IM1),
                    
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
                    .AWREADY_IM2(AWREADY_S13IM2),
                    // AXI MASTER write data channel signals
                    .WID_MI2(WID_MI2),
                    .WDATA_MI2(WDATA_MI2),
                    .WSTRB_MI2(WSTRB_MI2),
                    .WLAST_MI2(WLAST_MI2),
                    .WVALID_MI2(WVALID_MI2),
                    .WREADY_IM2(WREADY_S13IM2),
                    // AXI MASTER read address channel signals
                    .ARID_MI2(ARID_MI2),
                    .ARADDR_MI2(ARADDR_MI2),
                    .ARLEN_MI2(ARLEN_MI2),
                    .ARSIZE_MI2(ARSIZE_MI2),
                    .ARBURST_MI2(ARBURST_MI2),
                    .ARLOCK_MI2(ARLOCK_MI2),
                    .ARCACHE_MI2(ARCACHE_MI2),
                    .ARPROT_MI2(ARPROT_MI2),
                    .ARVALID_MI2(ARVALID_MI2),
                    .ARREADY_IM2(ARREADY_S13IM2),
                    
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
                    .AWREADY_IM3(AWREADY_S13IM3),
                    // AXI MASTER write data channel signals
                    .WID_MI3(WID_MI3),
                    .WDATA_MI3(WDATA_MI3),
                    .WSTRB_MI3(WSTRB_MI3),
                    .WLAST_MI3(WLAST_MI3),
                    .WVALID_MI3(WVALID_MI3),
                    .WREADY_IM3(WREADY_S13IM3),
                    // AXI MASTER read address channel signals
                    .ARID_MI3(ARID_MI3),
                    .ARADDR_MI3(ARADDR_MI3),
                    .ARLEN_MI3(ARLEN_MI3),
                    .ARSIZE_MI3(ARSIZE_MI3),
                    .ARBURST_MI3(ARBURST_MI3),
                    .ARLOCK_MI3(ARLOCK_MI3),
                    .ARCACHE_MI3(ARCACHE_MI3),
                    .ARPROT_MI3(ARPROT_MI3),
                    .ARVALID_MI3(ARVALID_MI3),
                    .ARREADY_IM3(ARREADY_S13IM3),
                    
                    
                    // SLAVE 13
                    // AXI SLAVE 13 write address channel signals
                    .AWID_IS(AWID_IS13_gated),
                    .AWADDR_IS(AWADDR_IS13_gated),
                    .AWLEN_IS(AWLEN_IS13_gated),
                    .AWSIZE_IS(AWSIZE_IS13_gated),
                    .AWBURST_IS(AWBURST_IS13_gated),
                    .AWLOCK_IS(AWLOCK_IS13_gated),
                    .AWCACHE_IS(AWCACHE_IS13_gated),
                    .AWPROT_IS(AWPROT_IS13_gated),
                    .AWVALID_IS(AWVALID_IS13_gated),
                    .AWREADY_SI(AWREADY_SI13),

                    .RVALID_SI(RVALID_SI13),
                    .RLAST_SI(RLAST_SI13),
                    .RREADY_IS(RREADY_IS13),

                    // AXI SLAVE 0 write data channel signals
                    .WID_IS(WID_IS13_gated),
                    .WDATA_IS(WDATA_IS13_gated),
                    .WSTRB_IS(WSTRB_IS13_gated),
                    .WLAST_IS(WLAST_IS13_gated),
                    .WVALID_IS(WVALID_IS13_gated),
                    .WREADY_SI(WREADY_SI13),
                    // AXI SLAVE 0 read address channel signals
                    .ARID_IS(ARID_IS13_gated),
                    .ARADDR_IS(ARADDR_IS13_gated),
                    .ARLEN_IS(ARLEN_IS13_gated),
                    .ARSIZE_IS(ARSIZE_IS13_gated),
                    .ARBURST_IS(ARBURST_IS13_gated),
                    .ARLOCK_IS(ARLOCK_IS13_gated),
                    .ARCACHE_IS(ARCACHE_IS13_gated),
                    .ARPROT_IS(ARPROT_IS13_gated),
                    .ARVALID_IS(ARVALID_IS13_gated),
                    .ARREADY_SI(ARREADY_SI13),
                    
                    .SLAVE_NUMBER(5'b01101),
                    //v3.2 - For Outstanding writes
                    .AWREADY_M0(AWREADY_M0),
                    .AWREADY_M1(AWREADY_M1),
                    .AWREADY_M2(AWREADY_M2),
                    .AWREADY_M3(AWREADY_M3),
                    .BVALID_M0(BVALID_M0),
                    .BVALID_M1(BVALID_M1),
                    .BVALID_M2(BVALID_M2),
                    .BVALID_M3(BVALID_M3),
                    .BREADY_M0(BREADY_M0),
                    .BREADY_M1(BREADY_M1),
                    .BREADY_M2(BREADY_M2),
                    .BREADY_M3(BREADY_M3),
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
                    .WLAST_M3 (WLAST_M3 ),
                    .slave_out_addr(slave_out_addr13)  
                    ,.slave_out_en (slave_out_en13)  
                    ,.pend_id_addr(pend_id_addr13)  
                    ,.pend_id_en(pend_id_en13)      
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

                    ,.outstnd_waddr(outstnd_waddr13)           
                    ,.outstnd_waddr_en(outstnd_waddr_en13)
                    );


      end
   endgenerate

   // --------------------------------------------------------------------------
   // Instance: matrix_s
   // --------------------------------------------------------------------------
   generate
      if(((M0_SLAVE14ENABLE == 1 || M1_SLAVE14ENABLE == 1  || M2_SLAVE14ENABLE == 1 || M3_SLAVE14ENABLE == 1) && (MEMSPACE > 0)) ||
         ((M0_SLAVE14ENABLE == 1 || M1_SLAVE14ENABLE == 1  || M2_SLAVE14ENABLE == 1 || M3_SLAVE14ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 0))) begin
   axi_matrix_s #(
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
     inst_matrix_S14(
                    // Global signals
                    .ACLK(ACLK),
                    .ARESETN(ARESETN),
                    .AWADDR_IS_int(AWADDR_IS_int),
                    .ARADDR_IS_int(ARADDR_IS_int),
                     
                    .gated_waddr(gated_waddr),
                    .gated_raddr(gated_raddr),

                     
                    
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

                    // From Master Stage
                    .m0_rd_end(m0_rd_end),
                    .m1_rd_end(m1_rd_end),
                    .m2_rd_end(m2_rd_end),
                    .m3_rd_end(m3_rd_end),
                    .m0_wr_end(m0_wr_end),
                    .m1_wr_end(m1_wr_end),
                    .m2_wr_end(m2_wr_end),
                    .m3_wr_end(m3_wr_end),
                    
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
                    .AWREADY_IM0(AWREADY_S14IM0),
                    // AXI MASTER write data channel signals
                    .WID_MI0(WID_MI0),
                    .WDATA_MI0(WDATA_MI0),
                    .WSTRB_MI0(WSTRB_MI0),
                    .WLAST_MI0(WLAST_MI0),
                    .WVALID_MI0(WVALID_MI0),
                    .WREADY_IM0(WREADY_S14IM0),
                    // AXI MASTER read address channel signals
                    .ARID_MI0(ARID_MI0),
                    .ARADDR_MI0(ARADDR_MI0),
                    .ARLEN_MI0(ARLEN_MI0),
                    .ARSIZE_MI0(ARSIZE_MI0),
                    .ARBURST_MI0(ARBURST_MI0),
                    .ARLOCK_MI0(ARLOCK_MI0),
                    .ARCACHE_MI0(ARCACHE_MI0),
                    .ARPROT_MI0(ARPROT_MI0),
                    .ARVALID_MI0(ARVALID_MI0),
                    .ARREADY_IM0(ARREADY_S14IM0),
                    
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
                    .AWREADY_IM1(AWREADY_S14IM1),
                    // AXI MASTER write data channel signals
                    .WID_MI1(WID_MI1),
                    .WDATA_MI1(WDATA_MI1),
                    .WSTRB_MI1(WSTRB_MI1),
                    .WLAST_MI1(WLAST_MI1),
                    .WVALID_MI1(WVALID_MI1),
                    .WREADY_IM1(WREADY_S14IM1),
                    // AXI MASTER read address channel signals
                    .ARID_MI1(ARID_MI1),
                    .ARADDR_MI1(ARADDR_MI1),
                    .ARLEN_MI1(ARLEN_MI1),
                    .ARSIZE_MI1(ARSIZE_MI1),
                    .ARBURST_MI1(ARBURST_MI1),
                    .ARLOCK_MI1(ARLOCK_MI1),
                    .ARCACHE_MI1(ARCACHE_MI1),
                    .ARPROT_MI1(ARPROT_MI1),
                    .ARVALID_MI1(ARVALID_MI1),
                    .ARREADY_IM1(ARREADY_S14IM1),
                    
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
                    .AWREADY_IM2(AWREADY_S14IM2),
                    // AXI MASTER write data channel signals
                    .WID_MI2(WID_MI2),
                    .WDATA_MI2(WDATA_MI2),
                    .WSTRB_MI2(WSTRB_MI2),
                    .WLAST_MI2(WLAST_MI2),
                    .WVALID_MI2(WVALID_MI2),
                    .WREADY_IM2(WREADY_S14IM2),
                    // AXI MASTER read address channel signals
                    .ARID_MI2(ARID_MI2),
                    .ARADDR_MI2(ARADDR_MI2),
                    .ARLEN_MI2(ARLEN_MI2),
                    .ARSIZE_MI2(ARSIZE_MI2),
                    .ARBURST_MI2(ARBURST_MI2),
                    .ARLOCK_MI2(ARLOCK_MI2),
                    .ARCACHE_MI2(ARCACHE_MI2),
                    .ARPROT_MI2(ARPROT_MI2),
                    .ARVALID_MI2(ARVALID_MI2),
                    .ARREADY_IM2(ARREADY_S14IM2),
                    
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
                    .AWREADY_IM3(AWREADY_S14IM3),
                    // AXI MASTER write data channel signals
                    .WID_MI3(WID_MI3),
                    .WDATA_MI3(WDATA_MI3),
                    .WSTRB_MI3(WSTRB_MI3),
                    .WLAST_MI3(WLAST_MI3),
                    .WVALID_MI3(WVALID_MI3),
                    .WREADY_IM3(WREADY_S14IM3),
                    // AXI MASTER read address channel signals
                    .ARID_MI3(ARID_MI3),
                    .ARADDR_MI3(ARADDR_MI3),
                    .ARLEN_MI3(ARLEN_MI3),
                    .ARSIZE_MI3(ARSIZE_MI3),
                    .ARBURST_MI3(ARBURST_MI3),
                    .ARLOCK_MI3(ARLOCK_MI3),
                    .ARCACHE_MI3(ARCACHE_MI3),
                    .ARPROT_MI3(ARPROT_MI3),
                    .ARVALID_MI3(ARVALID_MI3),
                    .ARREADY_IM3(ARREADY_S14IM3),
                    
                    
                    // SLAVE 14
                    // AXI SLAVE 14 write address channel signals
                    .AWID_IS(AWID_IS14_gated),
                    .AWADDR_IS(AWADDR_IS14_gated),
                    .AWLEN_IS(AWLEN_IS14_gated),
                    .AWSIZE_IS(AWSIZE_IS14_gated),
                    .AWBURST_IS(AWBURST_IS14_gated),
                    .AWLOCK_IS(AWLOCK_IS14_gated),
                    .AWCACHE_IS(AWCACHE_IS14_gated),
                    .AWPROT_IS(AWPROT_IS14_gated),
                    .AWVALID_IS(AWVALID_IS14_gated),
                    .AWREADY_SI(AWREADY_SI14),

                    .RVALID_SI(RVALID_SI14),
                    .RLAST_SI(RLAST_SI14),
                    .RREADY_IS(RREADY_IS14),

                    // AXI SLAVE 0 write data channel signals
                    .WID_IS(WID_IS14_gated),
                    .WDATA_IS(WDATA_IS14_gated),
                    .WSTRB_IS(WSTRB_IS14_gated),
                    .WLAST_IS(WLAST_IS14_gated),
                    .WVALID_IS(WVALID_IS14_gated),
                    .WREADY_SI(WREADY_SI14),
                    // AXI SLAVE 0 read address channel signals
                    .ARID_IS(ARID_IS14_gated),
                    .ARADDR_IS(ARADDR_IS14_gated),
                    .ARLEN_IS(ARLEN_IS14_gated),
                    .ARSIZE_IS(ARSIZE_IS14_gated),
                    .ARBURST_IS(ARBURST_IS14_gated),
                    .ARLOCK_IS(ARLOCK_IS14_gated),
                    .ARCACHE_IS(ARCACHE_IS14_gated),
                    .ARPROT_IS(ARPROT_IS14_gated),
                    .ARVALID_IS(ARVALID_IS14_gated),
                    .ARREADY_SI(ARREADY_SI14),
                    
                    .SLAVE_NUMBER(5'b01110),
                    //v3.2 - For Outstanding writes
                    .AWREADY_M0(AWREADY_M0),
                    .AWREADY_M1(AWREADY_M1),
                    .AWREADY_M2(AWREADY_M2),
                    .AWREADY_M3(AWREADY_M3),
                    .BVALID_M0(BVALID_M0),
                    .BVALID_M1(BVALID_M1),
                    .BVALID_M2(BVALID_M2),
                    .BVALID_M3(BVALID_M3),
                    .BREADY_M0(BREADY_M0),
                    .BREADY_M1(BREADY_M1),
                    .BREADY_M2(BREADY_M2),
                    .BREADY_M3(BREADY_M3),
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
                    .WLAST_M3 (WLAST_M3 ),
                    .slave_out_addr(slave_out_addr14)  
                    ,.slave_out_en (slave_out_en14)  
                    ,.pend_id_addr(pend_id_addr14)  
                    ,.pend_id_en(pend_id_en14)      
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

                    ,.outstnd_waddr(outstnd_waddr14)           
                    ,.outstnd_waddr_en(outstnd_waddr_en14)
                    );

      end
   endgenerate

   // --------------------------------------------------------------------------
   // Instance: matrix_s
   // --------------------------------------------------------------------------
   generate
      if(((M0_SLAVE15ENABLE == 1 || M1_SLAVE15ENABLE == 1  || M2_SLAVE15ENABLE == 1 || M3_SLAVE15ENABLE == 1) && (MEMSPACE > 0)) ||
         ((M0_SLAVE15ENABLE == 1 || M1_SLAVE15ENABLE == 1  || M2_SLAVE15ENABLE == 1 || M3_SLAVE15ENABLE == 1) && (MEMSPACE == 0 && ADDR_HGS_CFG == 0))) begin
   axi_matrix_s #(
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
     inst_matrix_S15(
                    // Global signals
                    .ACLK(ACLK),
                    .ARESETN(ARESETN),
                    .AWADDR_IS_int(AWADDR_IS_int),
                    .ARADDR_IS_int(ARADDR_IS_int),
                     
                    .gated_waddr(gated_waddr),
                    .gated_raddr(gated_raddr),

                     
                    
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

                    // From Master Stage
                    .m0_rd_end(m0_rd_end),
                    .m1_rd_end(m1_rd_end),
                    .m2_rd_end(m2_rd_end),
                    .m3_rd_end(m3_rd_end),
                    .m0_wr_end(m0_wr_end),
                    .m1_wr_end(m1_wr_end),
                    .m2_wr_end(m2_wr_end),
                    .m3_wr_end(m3_wr_end),
                    
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
                    .AWREADY_IM0(AWREADY_S15IM0),
                    // AXI MASTER write data channel signals
                    .WID_MI0(WID_MI0),
                    .WDATA_MI0(WDATA_MI0),
                    .WSTRB_MI0(WSTRB_MI0),
                    .WLAST_MI0(WLAST_MI0),
                    .WVALID_MI0(WVALID_MI0),
                    .WREADY_IM0(WREADY_S15IM0),
                    // AXI MASTER read address channel signals
                    .ARID_MI0(ARID_MI0),
                    .ARADDR_MI0(ARADDR_MI0),
                    .ARLEN_MI0(ARLEN_MI0),
                    .ARSIZE_MI0(ARSIZE_MI0),
                    .ARBURST_MI0(ARBURST_MI0),
                    .ARLOCK_MI0(ARLOCK_MI0),
                    .ARCACHE_MI0(ARCACHE_MI0),
                    .ARPROT_MI0(ARPROT_MI0),
                    .ARVALID_MI0(ARVALID_MI0),
                    .ARREADY_IM0(ARREADY_S15IM0),
                    
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
                    .AWREADY_IM1(AWREADY_S15IM1),
                    // AXI MASTER write data channel signals
                    .WID_MI1(WID_MI1),
                    .WDATA_MI1(WDATA_MI1),
                    .WSTRB_MI1(WSTRB_MI1),
                    .WLAST_MI1(WLAST_MI1),
                    .WVALID_MI1(WVALID_MI1),
                    .WREADY_IM1(WREADY_S15IM1),
                    // AXI MASTER read address channel signals
                    .ARID_MI1(ARID_MI1),
                    .ARADDR_MI1(ARADDR_MI1),
                    .ARLEN_MI1(ARLEN_MI1),
                    .ARSIZE_MI1(ARSIZE_MI1),
                    .ARBURST_MI1(ARBURST_MI1),
                    .ARLOCK_MI1(ARLOCK_MI1),
                    .ARCACHE_MI1(ARCACHE_MI1),
                    .ARPROT_MI1(ARPROT_MI1),
                    .ARVALID_MI1(ARVALID_MI1),
                    .ARREADY_IM1(ARREADY_S15IM1),
                    
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
                    .AWREADY_IM2(AWREADY_S15IM2),
                    // AXI MASTER write data channel signals
                    .WID_MI2(WID_MI2),
                    .WDATA_MI2(WDATA_MI2),
                    .WSTRB_MI2(WSTRB_MI2),
                    .WLAST_MI2(WLAST_MI2),
                    .WVALID_MI2(WVALID_MI2),
                    .WREADY_IM2(WREADY_S15IM2),
                    // AXI MASTER read address channel signals
                    .ARID_MI2(ARID_MI2),
                    .ARADDR_MI2(ARADDR_MI2),
                    .ARLEN_MI2(ARLEN_MI2),
                    .ARSIZE_MI2(ARSIZE_MI2),
                    .ARBURST_MI2(ARBURST_MI2),
                    .ARLOCK_MI2(ARLOCK_MI2),
                    .ARCACHE_MI2(ARCACHE_MI2),
                    .ARPROT_MI2(ARPROT_MI2),
                    .ARVALID_MI2(ARVALID_MI2),
                    .ARREADY_IM2(ARREADY_S15IM2),
                    
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
                    .AWREADY_IM3(AWREADY_S15IM3),
                    // AXI MASTER write data channel signals
                    .WID_MI3(WID_MI3),
                    .WDATA_MI3(WDATA_MI3),
                    .WSTRB_MI3(WSTRB_MI3),
                    .WLAST_MI3(WLAST_MI3),
                    .WVALID_MI3(WVALID_MI3),
                    .WREADY_IM3(WREADY_S15IM3),
                    // AXI MASTER read address channel signals
                    .ARID_MI3(ARID_MI3),
                    .ARADDR_MI3(ARADDR_MI3),
                    .ARLEN_MI3(ARLEN_MI3),
                    .ARSIZE_MI3(ARSIZE_MI3),
                    .ARBURST_MI3(ARBURST_MI3),
                    .ARLOCK_MI3(ARLOCK_MI3),
                    .ARCACHE_MI3(ARCACHE_MI3),
                    .ARPROT_MI3(ARPROT_MI3),
                    .ARVALID_MI3(ARVALID_MI3),
                    .ARREADY_IM3(ARREADY_S15IM3),
                    
                    
                    // SLAVE 15
                    // AXI SLAVE 15 write address channel signals
                    .AWID_IS(AWID_IS15_gated),
                    .AWADDR_IS(AWADDR_IS15_gated),
                    .AWLEN_IS(AWLEN_IS15_gated),
                    .AWSIZE_IS(AWSIZE_IS15_gated),
                    .AWBURST_IS(AWBURST_IS15_gated),
                    .AWLOCK_IS(AWLOCK_IS15_gated),
                    .AWCACHE_IS(AWCACHE_IS15_gated),
                    .AWPROT_IS(AWPROT_IS15_gated),
                    .AWVALID_IS(AWVALID_IS15_gated),
                    .AWREADY_SI(AWREADY_SI15),

                    .RVALID_SI(RVALID_SI15),
                    .RLAST_SI(RLAST_SI15),
                    .RREADY_IS(RREADY_IS15),

                    // AXI SLAVE 0 write data channel signals
                    .WID_IS(WID_IS15_gated),
                    .WDATA_IS(WDATA_IS15_gated),
                    .WSTRB_IS(WSTRB_IS15_gated),
                    .WLAST_IS(WLAST_IS15_gated),
                    .WVALID_IS(WVALID_IS15_gated),
                    .WREADY_SI(WREADY_SI15),
                    // AXI SLAVE 0 read address channel signals
                    .ARID_IS(ARID_IS15_gated),
                    .ARADDR_IS(ARADDR_IS15_gated),
                    .ARLEN_IS(ARLEN_IS15_gated),
                    .ARSIZE_IS(ARSIZE_IS15_gated),
                    .ARBURST_IS(ARBURST_IS15_gated),
                    .ARLOCK_IS(ARLOCK_IS15_gated),
                    .ARCACHE_IS(ARCACHE_IS15_gated),
                    .ARPROT_IS(ARPROT_IS15_gated),
                    .ARVALID_IS(ARVALID_IS15_gated),
                    .ARREADY_SI(ARREADY_SI15),
                    
                    .SLAVE_NUMBER(5'b01111), 
                    //v3.2 - For Outstanding writes
                    .AWREADY_M0(AWREADY_M0),
                    .AWREADY_M1(AWREADY_M1),
                    .AWREADY_M2(AWREADY_M2),
                    .AWREADY_M3(AWREADY_M3),
                    .BVALID_M0(BVALID_M0),
                    .BVALID_M1(BVALID_M1),
                    .BVALID_M2(BVALID_M2),
                    .BVALID_M3(BVALID_M3),
                    .BREADY_M0(BREADY_M0),
                    .BREADY_M1(BREADY_M1),
                    .BREADY_M2(BREADY_M2),
                    .BREADY_M3(BREADY_M3),
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
                    .WLAST_M3 (WLAST_M3 ),
                    .slave_out_addr(slave_out_addr15)  
                    ,.slave_out_en (slave_out_en15)  
                    ,.pend_id_addr(pend_id_addr15)  
                    ,.pend_id_en(pend_id_en15)      
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

                    ,.outstnd_waddr(outstnd_waddr15)           
                    ,.outstnd_waddr_en(outstnd_waddr_en15)
                    );

      end
   endgenerate


   // --------------------------------------------------------------------------
   // Instance: matrix_s
   // --------------------------------------------------------------------------
   generate
      if(((M0_SLAVE16ENABLE == 1 || M1_SLAVE16ENABLE == 1  || M2_SLAVE16ENABLE == 1 || M3_SLAVE16ENABLE == 1) && (MEMSPACE == 0)) ||
         ((M0_SLAVE16ENABLE == 1 || M1_SLAVE16ENABLE == 1  || M2_SLAVE16ENABLE == 1 || M3_SLAVE16ENABLE == 1) && (MEMSPACE > 0 && (|COMB_REG)))) begin
   axi_matrix_s #(
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
     inst_matrix_S16(
                    // Global signals
                    .ACLK(ACLK),
                    .ARESETN(ARESETN),
                    .AWADDR_IS_int(AWADDR_IS_int),
                    .ARADDR_IS_int(ARADDR_IS_int),
                     
                    .gated_waddr(gated_waddr),
                    .gated_raddr(gated_raddr),

                     
                    
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

                    // From Master Stage
                    .m0_rd_end(m0_rd_end),
                    .m1_rd_end(m1_rd_end),
                    .m2_rd_end(m2_rd_end),
                    .m3_rd_end(m3_rd_end),
                    .m0_wr_end(m0_wr_end),
                    .m1_wr_end(m1_wr_end),
                    .m2_wr_end(m2_wr_end),
                    .m3_wr_end(m3_wr_end),
                    
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
                    .AWREADY_IM0(AWREADY_S16IM0),
                    // AXI MASTER write data channel signals
                    .WID_MI0(WID_MI0),
                    .WDATA_MI0(WDATA_MI0),
                    .WSTRB_MI0(WSTRB_MI0),
                    .WLAST_MI0(WLAST_MI0),
                    .WVALID_MI0(WVALID_MI0),
                    .WREADY_IM0(WREADY_S16IM0),
                    // AXI MASTER read address channel signals
                    .ARID_MI0(ARID_MI0),
                    .ARADDR_MI0(ARADDR_MI0),
                    .ARLEN_MI0(ARLEN_MI0),
                    .ARSIZE_MI0(ARSIZE_MI0),
                    .ARBURST_MI0(ARBURST_MI0),
                    .ARLOCK_MI0(ARLOCK_MI0),
                    .ARCACHE_MI0(ARCACHE_MI0),
                    .ARPROT_MI0(ARPROT_MI0),
                    .ARVALID_MI0(ARVALID_MI0),
                    .ARREADY_IM0(ARREADY_S16IM0),
                    
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
                    .AWREADY_IM1(AWREADY_S16IM1),
                    // AXI MASTER write data channel signals
                    .WID_MI1(WID_MI1),
                    .WDATA_MI1(WDATA_MI1),
                    .WSTRB_MI1(WSTRB_MI1),
                    .WLAST_MI1(WLAST_MI1),
                    .WVALID_MI1(WVALID_MI1),
                    .WREADY_IM1(WREADY_S16IM1),
                    // AXI MASTER read address channel signals
                    .ARID_MI1(ARID_MI1),
                    .ARADDR_MI1(ARADDR_MI1),
                    .ARLEN_MI1(ARLEN_MI1),
                    .ARSIZE_MI1(ARSIZE_MI1),
                    .ARBURST_MI1(ARBURST_MI1),
                    .ARLOCK_MI1(ARLOCK_MI1),
                    .ARCACHE_MI1(ARCACHE_MI1),
                    .ARPROT_MI1(ARPROT_MI1),
                    .ARVALID_MI1(ARVALID_MI1),
                    .ARREADY_IM1(ARREADY_S16IM1),
                    
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
                    .AWREADY_IM2(AWREADY_S16IM2),
                    // AXI MASTER write data channel signals
                    .WID_MI2(WID_MI2),
                    .WDATA_MI2(WDATA_MI2),
                    .WSTRB_MI2(WSTRB_MI2),
                    .WLAST_MI2(WLAST_MI2),
                    .WVALID_MI2(WVALID_MI2),
                    .WREADY_IM2(WREADY_S16IM2),
                    // AXI MASTER read address channel signals
                    .ARID_MI2(ARID_MI2),
                    .ARADDR_MI2(ARADDR_MI2),
                    .ARLEN_MI2(ARLEN_MI2),
                    .ARSIZE_MI2(ARSIZE_MI2),
                    .ARBURST_MI2(ARBURST_MI2),
                    .ARLOCK_MI2(ARLOCK_MI2),
                    .ARCACHE_MI2(ARCACHE_MI2),
                    .ARPROT_MI2(ARPROT_MI2),
                    .ARVALID_MI2(ARVALID_MI2),
                    .ARREADY_IM2(ARREADY_S16IM2),
                    
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
                    .AWREADY_IM3(AWREADY_S16IM3),
                    // AXI MASTER write data channel signals
                    .WID_MI3(WID_MI3),
                    .WDATA_MI3(WDATA_MI3),
                    .WSTRB_MI3(WSTRB_MI3),
                    .WLAST_MI3(WLAST_MI3),
                    .WVALID_MI3(WVALID_MI3),
                    .WREADY_IM3(WREADY_S16IM3),
                    // AXI MASTER read address channel signals
                    .ARID_MI3(ARID_MI3),
                    .ARADDR_MI3(ARADDR_MI3),
                    .ARLEN_MI3(ARLEN_MI3),
                    .ARSIZE_MI3(ARSIZE_MI3),
                    .ARBURST_MI3(ARBURST_MI3),
                    .ARLOCK_MI3(ARLOCK_MI3),
                    .ARCACHE_MI3(ARCACHE_MI3),
                    .ARPROT_MI3(ARPROT_MI3),
                    .ARVALID_MI3(ARVALID_MI3),
                    .ARREADY_IM3(ARREADY_S16IM3),
                    
                    
                    // SLAVE 16
                    // AXI SLAVE 16 write address channel signals
                    .AWID_IS(AWID_IS16_gated),
                    .AWADDR_IS(AWADDR_IS16_gated),
                    .AWLEN_IS(AWLEN_IS16_gated),
                    .AWSIZE_IS(AWSIZE_IS16_gated),
                    .AWBURST_IS(AWBURST_IS16_gated),
                    .AWLOCK_IS(AWLOCK_IS16_gated),
                    .AWCACHE_IS(AWCACHE_IS16_gated),
                    .AWPROT_IS(AWPROT_IS16_gated),
                    .AWVALID_IS(AWVALID_IS16_gated),
                    .AWREADY_SI(AWREADY_SI16),

                    .RVALID_SI(RVALID_SI16),
                    .RLAST_SI(RLAST_SI16),
                    .RREADY_IS(RREADY_IS16),

                    // AXI SLAVE 0 write data channel signals
                    .WID_IS(WID_IS16_gated),
                    .WDATA_IS(WDATA_IS16_gated),
                    .WSTRB_IS(WSTRB_IS16_gated),
                    .WLAST_IS(WLAST_IS16_gated),
                    .WVALID_IS(WVALID_IS16_gated),
                    .WREADY_SI(WREADY_SI16),
                    // AXI SLAVE 0 read address channel signals
                    .ARID_IS(ARID_IS16_gated),
                    .ARADDR_IS(ARADDR_IS16_gated),
                    .ARLEN_IS(ARLEN_IS16_gated),
                    .ARSIZE_IS(ARSIZE_IS16_gated),
                    .ARBURST_IS(ARBURST_IS16_gated),
                    .ARLOCK_IS(ARLOCK_IS16_gated),
                    .ARCACHE_IS(ARCACHE_IS16_gated),
                    .ARPROT_IS(ARPROT_IS16_gated),
                    .ARVALID_IS(ARVALID_IS16_gated),
                    .ARREADY_SI(ARREADY_SI16),
                    
                    .SLAVE_NUMBER(5'b10000),
                    //v3.2 - For Outstanding writes
                    .AWREADY_M0(AWREADY_M0),
                    .AWREADY_M1(AWREADY_M1),
                    .AWREADY_M2(AWREADY_M2),
                    .AWREADY_M3(AWREADY_M3),
                    .BVALID_M0(BVALID_M0),
                    .BVALID_M1(BVALID_M1),
                    .BVALID_M2(BVALID_M2),
                    .BVALID_M3(BVALID_M3),
                    .BREADY_M0(BREADY_M0),
                    .BREADY_M1(BREADY_M1),
                    .BREADY_M2(BREADY_M2),
                    .BREADY_M3(BREADY_M3),
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
                    .WLAST_M3 (WLAST_M3 ),
                    .slave_out_addr(slave_out_addr16)  
                    ,.slave_out_en (slave_out_en16)  
                    ,.pend_id_addr(pend_id_addr16)  
                    ,.pend_id_en(pend_id_en16)      
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

                    ,.outstnd_waddr(outstnd_waddr16)           
                    ,.outstnd_waddr_en(outstnd_waddr_en16)
                    );

      end
   endgenerate


   // --------------------------------------------------------------------------
   // Register signals
   // --------------------------------------------------------------------------
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         AWVALID_M0_r <= 1'b0;
         AWADDR_M0_r  <= 'h0;
         AWVALID_M1_r <= 1'b0;
         AWADDR_M1_r  <= 'h0;
         AWVALID_M2_r <= 1'b0;
         AWADDR_M2_r  <= 'h0;
         AWVALID_M3_r <= 1'b0;
         AWADDR_M3_r  <= 'h0;
         slave_out_en_r0   <= 'h0;
         slave_out_en_r1   <= 'h0;
         slave_out_en_r2   <= 'h0;
         slave_out_en_r3   <= 'h0;
         slave_out_en_r4   <= 'h0;
         slave_out_en_r5   <= 'h0;
         slave_out_en_r6   <= 'h0;
         slave_out_en_r7   <= 'h0;
         slave_out_en_r8   <= 'h0;
         slave_out_en_r9   <= 'h0;
         slave_out_en_r10  <= 'h0;
         slave_out_en_r11  <= 'h0;
         slave_out_en_r12  <= 'h0;
         slave_out_en_r13  <= 'h0;
         slave_out_en_r14  <= 'h0;
         slave_out_en_r15  <= 'h0;
         slave_out_en_r16  <= 'h0;
      end
      else begin
         AWVALID_M0_r <= AWVALID_M0;
         AWADDR_M0_r  <= AWADDR_M0;
         AWVALID_M1_r <= AWVALID_M1;
         AWADDR_M1_r  <= AWADDR_M1;
         AWVALID_M2_r <= AWVALID_M2;
         AWADDR_M2_r  <= AWADDR_M2;
         AWVALID_M3_r <= AWVALID_M3;
         AWADDR_M3_r  <= AWADDR_M3;
//         slave_out_en_r  <= slave_out_en;
         slave_out_en_r0   <= slave_out_en0;
         slave_out_en_r1   <= slave_out_en1;
         slave_out_en_r2   <= slave_out_en2;
         slave_out_en_r3   <= slave_out_en3;
         slave_out_en_r4   <= slave_out_en4;
         slave_out_en_r5   <= slave_out_en5;
         slave_out_en_r6   <= slave_out_en6;
         slave_out_en_r7   <= slave_out_en7;
         slave_out_en_r8   <= slave_out_en8;
         slave_out_en_r9   <= slave_out_en9;
         slave_out_en_r10  <= slave_out_en10;
         slave_out_en_r11  <= slave_out_en11;
         slave_out_en_r12  <= slave_out_en12;
         slave_out_en_r13  <= slave_out_en13;
         slave_out_en_r14  <= slave_out_en14;
         slave_out_en_r15  <= slave_out_en15;
         slave_out_en_r16  <= slave_out_en16;

      end
   end



endmodule // interconnect_ntom


   /////////////////////////////////////////////////////////////////////////////
   //                               End - of - Code                           //
   /////////////////////////////////////////////////////////////////////////////

