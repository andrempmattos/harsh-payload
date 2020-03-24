// ********************************************************************/
// Actel Corporation Proprietary and Confidential
// Copyright 2013 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description:	CoreAHBLite matrix logic for
//				4 masters by 16 slaves,
//				instantiates the following modules:
//				COREAHBLITE_MASTERSTAGE, COREAHBLITE_SLAVESTAGE,
//				COREAHBLITE_INITCFG
//
//
// SVN Revision Information:
// SVN $Revision: 33369 $
// SVN $Date: 2019-04-04 11:54:27 +0530 (Thu, 04 Apr 2019) $
//
//
// ***********************************************************************/
`timescale 1ns/1ps
module COREAHBLITE_MATRIX4X16 #(
parameter [2:0]MEMSPACE				= 0,
parameter [0:0]HADDR_SHG_CFG		= 1,
parameter [15:0]SC                  = 0,
parameter [16:0]M0_AHBSLOTENABLE	= (2**17)-1,
parameter [16:0]M1_AHBSLOTENABLE	= (2**17)-1,
parameter [16:0]M2_AHBSLOTENABLE	= (2**17)-1,
parameter [16:0]M3_AHBSLOTENABLE	= (2**17)-1,
 parameter SYNC_RESET = 0
)
(
input								HCLK,
input								HRESETN,
input								REMAP_M0,
input	[31:0]						HADDR_M0,
input								HMASTLOCK_M0,
input	[2:0]						HSIZE_M0,
input	[1:0]						HTRANS_M0,  // AI defined vector 
input	[2:0]						HBURST_M0,  // AI : Added
input								HWRITE_M0,
input	[31:0]						HWDATA_M0,
output	wire						HRESP_M0,
output	wire	[31:0]				HRDATA_M0,
output	wire						HREADY_M0,
input	[31:0]						HADDR_M1,
input								HMASTLOCK_M1,
input	[2:0]						HSIZE_M1,
input	[1:0]								HTRANS_M1, // AI defined vector
input	[2:0]						HBURST_M1, // AI : Added
input								HWRITE_M1,
input	[31:0]						HWDATA_M1,
output	wire						HRESP_M1,
output	wire	[31:0]				HRDATA_M1,
output	wire						HREADY_M1,
input	[31:0]						HADDR_M2,
input								HMASTLOCK_M2,
input	[2:0]						HSIZE_M2,
input	[1:0]								HTRANS_M2,
input	[2:0]						HBURST_M2, // AI : Added
input								HWRITE_M2,
input	[31:0]						HWDATA_M2,
output	wire						HRESP_M2,
output	wire	[31:0]				HRDATA_M2,
output	wire						HREADY_M2,
input	[31:0]						HADDR_M3,
input								HMASTLOCK_M3,
input	[2:0]						HSIZE_M3,
input	[1:0]								HTRANS_M3,
input	[2:0]						HBURST_M3, //  AI : added 
input								HWRITE_M3,
input	[31:0]						HWDATA_M3,
output	wire						HRESP_M3,
output	wire	[31:0]				HRDATA_M3,
output	wire						HREADY_M3,
input	[31:0]						HRDATA_S0,
input								HREADYOUT_S0,
input								HRESP_S0,
output	wire						HSEL_S0,
output	wire	[31:0]				HADDR_S0,
output	wire	[2:0]				HSIZE_S0,
output	wire	[1:0]					HTRANS_S0,  // AI 
output	wire	[2:0]					HBURST_S0, // AI : Added for burst
output	wire						HWRITE_S0,
output	wire	[31:0]				HWDATA_S0,
output	wire						HREADY_S0,
output	wire						HMASTLOCK_S0,
input	[31:0]						HRDATA_S1,
input								HREADYOUT_S1,
input								HRESP_S1,
output	wire						HSEL_S1,
output	wire	[31:0]				HADDR_S1,
output	wire	[2:0]				HSIZE_S1,
output	wire	[1:0]					HTRANS_S1,  // AI : Vector 
output	wire	[2:0]					HBURST_S1, // AI : Added for burst
output	wire						HWRITE_S1,
output	wire	[31:0]				HWDATA_S1,
output	wire						HREADY_S1,
output	wire						HMASTLOCK_S1,
input	[31:0]						HRDATA_S2,
input								HREADYOUT_S2,
input								HRESP_S2,
output	wire						HSEL_S2,
output	wire	[31:0]				HADDR_S2,
output	wire	[2:0]				HSIZE_S2,
output	wire	[1:0]					HTRANS_S2,  //  AI : Vector 
output	wire	[2:0]					HBURST_S2, // AI : Added for burst
output	wire						HWRITE_S2,
output	wire	[31:0]				HWDATA_S2,
output	wire						HREADY_S2,
output	wire						HMASTLOCK_S2,
input	[31:0]						HRDATA_S3,
input								HREADYOUT_S3,
input								HRESP_S3,
output	wire						HSEL_S3,
output	wire	[31:0]				HADDR_S3,
output	wire	[2:0]				HSIZE_S3,
output	wire	[1:0]					HTRANS_S3, // AI : vector
output	wire	[2:0]					HBURST_S3, // AI : Added for burst
output	wire						HWRITE_S3,
output	wire	[31:0]				HWDATA_S3,
output	wire						HREADY_S3,
output	wire						HMASTLOCK_S3,
input	[31:0]						HRDATA_S4,
input								HREADYOUT_S4,
input								HRESP_S4,
output	wire						HSEL_S4,
output	wire	[31:0]				HADDR_S4,
output	wire	[2:0]				HSIZE_S4,
output	wire	[1:0]					HTRANS_S4,  // AI : vector
output	wire	[2:0]					HBURST_S4, // AI : Added for burst
output	wire						HWRITE_S4,
output	wire	[31:0]				HWDATA_S4,
output	wire						HREADY_S4,
output	wire						HMASTLOCK_S4,
input	[31:0]						HRDATA_S5,
input								HREADYOUT_S5,
input								HRESP_S5,
output	wire						HSEL_S5,
output	wire	[31:0]				HADDR_S5,
output	wire	[2:0]				HSIZE_S5,
output	wire	[1:0]					HTRANS_S5,  // AI: vector
output	wire	[2:0]					HBURST_S5, // AI : Added for burst
output	wire						HWRITE_S5,
output	wire	[31:0]				HWDATA_S5,
output	wire						HREADY_S5,
output	wire						HMASTLOCK_S5,
input	[31:0]						HRDATA_S6,
input								HREADYOUT_S6,
input								HRESP_S6,
output	wire						HSEL_S6,
output	wire	[31:0]				HADDR_S6,
output	wire	[2:0]				HSIZE_S6,
output	wire	[1:0]						HTRANS_S6, // AI: vector
output	wire	[2:0]					HBURST_S6, // AI : Added for burst
output	wire						HWRITE_S6,
output	wire	[31:0]				HWDATA_S6,
output	wire						HREADY_S6,
output	wire						HMASTLOCK_S6,
input	[31:0]						HRDATA_S7,
input								HREADYOUT_S7,
input								HRESP_S7,
output	wire						HSEL_S7,
output	wire	[31:0]				HADDR_S7,
output	wire	[2:0]				HSIZE_S7,
output	wire	[1:0]						HTRANS_S7, // AI: vector
output	wire	[2:0]					HBURST_S7, // AI : Added for burst
output	wire						HWRITE_S7,
output	wire	[31:0]				HWDATA_S7,
output	wire						HREADY_S7,
output	wire						HMASTLOCK_S7,
input	[31:0]						HRDATA_S8,
input								HREADYOUT_S8,
input								HRESP_S8,
output	wire						HSEL_S8,
output	wire	[31:0]				HADDR_S8,
output	wire	[2:0]				HSIZE_S8,
output	wire	[1:0]						HTRANS_S8, // AI: vector
output	wire	[2:0]					HBURST_S8, // AI : Added for burst
output	wire						HWRITE_S8,
output	wire	[31:0]				HWDATA_S8,
output	wire						HREADY_S8,
output	wire						HMASTLOCK_S8,
input	[31:0]						HRDATA_S9,
input								HREADYOUT_S9,
input								HRESP_S9,
output	wire						HSEL_S9,
output	wire	[31:0]				HADDR_S9,
output	wire	[2:0]				HSIZE_S9,
output	wire	[1:0]						HTRANS_S9, // AI: vector
output	wire	[2:0]					HBURST_S9, // AI : Added for burst
output	wire						HWRITE_S9,
output	wire	[31:0]				HWDATA_S9,
output	wire						HREADY_S9,
output	wire						HMASTLOCK_S9,
input	[31:0]						HRDATA_S10,
input								HREADYOUT_S10,
input								HRESP_S10,
output	wire						HSEL_S10,
output	wire	[31:0]				HADDR_S10,
output	wire	[2:0]				HSIZE_S10,
output	wire	[1:0]						HTRANS_S10, // AI: vector
output	wire	[2:0]					HBURST_S10, // AI : Added for burst
output	wire						HWRITE_S10,
output	wire	[31:0]				HWDATA_S10,
output	wire						HREADY_S10,
output	wire						HMASTLOCK_S10,
input	[31:0]						HRDATA_S11,
input								HREADYOUT_S11,
input								HRESP_S11,
output	wire						HSEL_S11,
output	wire	[31:0]				HADDR_S11,
output	wire	[2:0]				HSIZE_S11,
output	wire	[1:0]						HTRANS_S11, //AI: vector
output	wire	[2:0]					HBURST_S11, // AI : Added for burst
output	wire						HWRITE_S11,
output	wire	[31:0]				HWDATA_S11,
output	wire						HREADY_S11,
output	wire						HMASTLOCK_S11,
input	[31:0]						HRDATA_S12,
input								HREADYOUT_S12,
input								HRESP_S12,
output	wire						HSEL_S12,
output	wire	[31:0]				HADDR_S12,
output	wire	[2:0]				HSIZE_S12,
output	wire	[1:0]						HTRANS_S12, // AI: vector
output	wire	[2:0]					HBURST_S12, // AI : Added for burst
output	wire						HWRITE_S12,
output	wire	[31:0]				HWDATA_S12,
output	wire						HREADY_S12,
output	wire						HMASTLOCK_S12,
input	[31:0]						HRDATA_S13,
input								HREADYOUT_S13,
input								HRESP_S13,
output	wire						HSEL_S13,
output	wire	[31:0]				HADDR_S13,
output	wire	[2:0]				HSIZE_S13,
output	wire	[1:0]						HTRANS_S13, // AI: vector
output	wire	[2:0]					HBURST_S13, // AI : Added for burst
output	wire						HWRITE_S13,
output	wire	[31:0]				HWDATA_S13,
output	wire						HREADY_S13,
output	wire						HMASTLOCK_S13,
input	[31:0]						HRDATA_S14,
input								HREADYOUT_S14,
input								HRESP_S14,
output	wire						HSEL_S14,
output	wire	[31:0]				HADDR_S14,
output	wire	[2:0]				HSIZE_S14,
output	wire	[1:0]						HTRANS_S14, // AI: vector
output	wire	[2:0]					HBURST_S14, // AI : Added for burst
output	wire						HWRITE_S14,
output	wire	[31:0]				HWDATA_S14,
output	wire						HREADY_S14,
output	wire						HMASTLOCK_S14,
input	[31:0]						HRDATA_S15,
input								HREADYOUT_S15,
input								HRESP_S15,
output	wire						HSEL_S15,
output	wire	[31:0]				HADDR_S15,
output	wire	[2:0]				HSIZE_S15,
output	wire	[1:0]						HTRANS_S15, // AI: vector
output	wire	[2:0]					HBURST_S15, // AI : Added for burst
output	wire						HWRITE_S15,
output	wire	[31:0]				HWDATA_S15,
output	wire						HREADY_S15,
output	wire						HMASTLOCK_S15,
input			[31:0]				HRDATA_S16,
input								HREADYOUT_S16,
input								HRESP_S16,
output	wire						HSEL_S16,
output	wire	[31:0]				HADDR_S16,
output	wire	[2:0]				HSIZE_S16,
output	wire	[1:0]					HTRANS_S16, // AI: vector
output	wire	[2:0]					HBURST_S16, // AI : Added for burst
output	wire						HWRITE_S16,
output	wire	[31:0]				HWDATA_S16,
output	wire						HREADY_S16,
output	wire						HMASTLOCK_S16
);
wire	[31:0]				M0GATEDHADDR;
wire						M0GATEDHMASTLOCK;
wire	[2:0]				M0GATEDHSIZE;
wire	[1:0]					M0GATEDHTRANS;
wire	[2:0]				M0GATEDHBURST; // AI : Added
wire						M0GATEDHWRITE;
wire						m0PrevDataSlaveReady;
wire						m0s0AddrSel;
wire						m0s0DataSel;
wire						s0m0AddrReady;
wire						s0m0DataReady;
wire						s0m0HResp;
wire						m0s0AddrSel_int;
wire						m0s0DataSel_int;
wire						s0m0AddrReady_int;
wire						s0m0DataReady_int;
wire						s0m0HResp_int;
wire						m0s1AddrSel;
wire						m0s1DataSel;
wire						s1m0AddrReady;
wire						s1m0DataReady;
wire						s1m0HResp;
wire						m0s1AddrSel_int;
wire						m0s1DataSel_int;
wire						s1m0AddrReady_int;
wire						s1m0DataReady_int;
wire						s1m0HResp_int;
wire						m0s2AddrSel;
wire						m0s2DataSel;
wire						s2m0AddrReady;
wire						s2m0DataReady;
wire						s2m0HResp;
wire						m0s2AddrSel_int;
wire						m0s2DataSel_int;
wire						s2m0AddrReady_int;
wire						s2m0DataReady_int;
wire						s2m0HResp_int;
wire						m0s3AddrSel;
wire						m0s3DataSel;
wire						s3m0AddrReady;
wire						s3m0DataReady;
wire						s3m0HResp;
wire						m0s3AddrSel_int;
wire						m0s3DataSel_int;
wire						s3m0AddrReady_int;
wire						s3m0DataReady_int;
wire						s3m0HResp_int;
wire						m0s4AddrSel;
wire						m0s4DataSel;
wire						s4m0AddrReady;
wire						s4m0DataReady;
wire						s4m0HResp;
wire						m0s4AddrSel_int;
wire						m0s4DataSel_int;
wire						s4m0AddrReady_int;
wire						s4m0DataReady_int;
wire						s4m0HResp_int;
wire						m0s5AddrSel;
wire						m0s5DataSel;
wire						s5m0AddrReady;
wire						s5m0DataReady;
wire						s5m0HResp;
wire						m0s5AddrSel_int;
wire						m0s5DataSel_int;
wire						s5m0AddrReady_int;
wire						s5m0DataReady_int;
wire						s5m0HResp_int;
wire						m0s6AddrSel;
wire						m0s6DataSel;
wire						s6m0AddrReady;
wire						s6m0DataReady;
wire						s6m0HResp;
wire						m0s6AddrSel_int;
wire						m0s6DataSel_int;
wire						s6m0AddrReady_int;
wire						s6m0DataReady_int;
wire						s6m0HResp_int;
wire						m0s7AddrSel;
wire						m0s7DataSel;
wire						s7m0AddrReady;
wire						s7m0DataReady;
wire						s7m0HResp;
wire						m0s7AddrSel_int;
wire						m0s7DataSel_int;
wire						s7m0AddrReady_int;
wire						s7m0DataReady_int;
wire						s7m0HResp_int;
wire						m0s8AddrSel;
wire						m0s8DataSel;
wire						s8m0AddrReady;
wire						s8m0DataReady;
wire						s8m0HResp;
wire						m0s8AddrSel_int;
wire						m0s8DataSel_int;
wire						s8m0AddrReady_int;
wire						s8m0DataReady_int;
wire						s8m0HResp_int;
wire						m0s9AddrSel;
wire						m0s9DataSel;
wire						s9m0AddrReady;
wire						s9m0DataReady;
wire						s9m0HResp;
wire						m0s9AddrSel_int;
wire						m0s9DataSel_int;
wire						s9m0AddrReady_int;
wire						s9m0DataReady_int;
wire						s9m0HResp_int;
wire						m0s10AddrSel;
wire						m0s10DataSel;
wire						s10m0AddrReady;
wire						s10m0DataReady;
wire						s10m0HResp;
wire						m0s10AddrSel_int;
wire						m0s10DataSel_int;
wire						s10m0AddrReady_int;
wire						s10m0DataReady_int;
wire						s10m0HResp_int;
wire						m0s11AddrSel;
wire						m0s11DataSel;
wire						s11m0AddrReady;
wire						s11m0DataReady;
wire						s11m0HResp;
wire						m0s11AddrSel_int;
wire						m0s11DataSel_int;
wire						s11m0AddrReady_int;
wire						s11m0DataReady_int;
wire						s11m0HResp_int;
wire						m0s12AddrSel;
wire						m0s12DataSel;
wire						s12m0AddrReady;
wire						s12m0DataReady;
wire						s12m0HResp;
wire						m0s12AddrSel_int;
wire						m0s12DataSel_int;
wire						s12m0AddrReady_int;
wire						s12m0DataReady_int;
wire						s12m0HResp_int;
wire						m0s13AddrSel;
wire						m0s13DataSel;
wire						s13m0AddrReady;
wire						s13m0DataReady;
wire						s13m0HResp;
wire						m0s13AddrSel_int;
wire						m0s13DataSel_int;
wire						s13m0AddrReady_int;
wire						s13m0DataReady_int;
wire						s13m0HResp_int;
wire						m0s14AddrSel;
wire						m0s14DataSel;
wire						s14m0AddrReady;
wire						s14m0DataReady;
wire						s14m0HResp;
wire						m0s14AddrSel_int;
wire						m0s14DataSel_int;
wire						s14m0AddrReady_int;
wire						s14m0DataReady_int;
wire						s14m0HResp_int;
wire						m0s15AddrSel;
wire						m0s15DataSel;
wire						s15m0AddrReady;
wire						s15m0DataReady;
wire						s15m0HResp;
wire						m0s15AddrSel_int;
wire						m0s15DataSel_int;
wire						s15m0AddrReady_int;
wire						s15m0DataReady_int;
wire						s15m0HResp_int;
wire						m0s16AddrSel;
wire						m0s16DataSel;
wire						s16m0AddrReady;
wire						s16m0DataReady;
wire						s16m0HResp;
wire						m0s16AddrSel_int;
wire						m0s16DataSel_int;
wire						s16m0AddrReady_int;
wire						s16m0DataReady_int;
wire						s16m0HResp_int;
wire	[31:0]				M1GATEDHADDR;
wire						M1GATEDHMASTLOCK;
wire	[2:0]				M1GATEDHSIZE;
wire	[1:0]					M1GATEDHTRANS; // AI : defined vector 
wire	[2:0]				M1GATEDHBURST; // AI : Added
wire						M1GATEDHWRITE;
wire						m1PrevDataSlaveReady;
wire						m1s0AddrSel;
wire						m1s0DataSel;
wire						s0m1AddrReady;
wire						s0m1DataReady;
wire						s0m1HResp;
wire						m1s0AddrSel_int;
wire						m1s0DataSel_int;
wire						s0m1AddrReady_int;
wire						s0m1DataReady_int;
wire						s0m1HResp_int;
wire						m1s1AddrSel;
wire						m1s1DataSel;
wire						s1m1AddrReady;
wire						s1m1DataReady;
wire						s1m1HResp;
wire						m1s1AddrSel_int;
wire						m1s1DataSel_int;
wire						s1m1AddrReady_int;
wire						s1m1DataReady_int;
wire						s1m1HResp_int;
wire						m1s2AddrSel;
wire						m1s2DataSel;
wire						s2m1AddrReady;
wire						s2m1DataReady;
wire						s2m1HResp;
wire						m1s2AddrSel_int;
wire						m1s2DataSel_int;
wire						s2m1AddrReady_int;
wire						s2m1DataReady_int;
wire						s2m1HResp_int;
wire						m1s3AddrSel;
wire						m1s3DataSel;
wire						s3m1AddrReady;
wire						s3m1DataReady;
wire						s3m1HResp;
wire						m1s3AddrSel_int;
wire						m1s3DataSel_int;
wire						s3m1AddrReady_int;
wire						s3m1DataReady_int;
wire						s3m1HResp_int;
wire						m1s4AddrSel;
wire						m1s4DataSel;
wire						s4m1AddrReady;
wire						s4m1DataReady;
wire						s4m1HResp;
wire						m1s4AddrSel_int;
wire						m1s4DataSel_int;
wire						s4m1AddrReady_int;
wire						s4m1DataReady_int;
wire						s4m1HResp_int;
wire						m1s5AddrSel;
wire						m1s5DataSel;
wire						s5m1AddrReady;
wire						s5m1DataReady;
wire						s5m1HResp;
wire						m1s5AddrSel_int;
wire						m1s5DataSel_int;
wire						s5m1AddrReady_int;
wire						s5m1DataReady_int;
wire						s5m1HResp_int;
wire						m1s6AddrSel;
wire						m1s6DataSel;
wire						s6m1AddrReady;
wire						s6m1DataReady;
wire						s6m1HResp;
wire						m1s6AddrSel_int;
wire						m1s6DataSel_int;
wire						s6m1AddrReady_int;
wire						s6m1DataReady_int;
wire						s6m1HResp_int;
wire						m1s7AddrSel;
wire						m1s7DataSel;
wire						s7m1AddrReady;
wire						s7m1DataReady;
wire						s7m1HResp;
wire						m1s7AddrSel_int;
wire						m1s7DataSel_int;
wire						s7m1AddrReady_int;
wire						s7m1DataReady_int;
wire						s7m1HResp_int;
wire						m1s8AddrSel;
wire						m1s8DataSel;
wire						s8m1AddrReady;
wire						s8m1DataReady;
wire						s8m1HResp;
wire						m1s8AddrSel_int;
wire						m1s8DataSel_int;
wire						s8m1AddrReady_int;
wire						s8m1DataReady_int;
wire						s8m1HResp_int;
wire						m1s9AddrSel;
wire						m1s9DataSel;
wire						s9m1AddrReady;
wire						s9m1DataReady;
wire						s9m1HResp;
wire						m1s9AddrSel_int;
wire						m1s9DataSel_int;
wire						s9m1AddrReady_int;
wire						s9m1DataReady_int;
wire						s9m1HResp_int;
wire						m1s10AddrSel;
wire						m1s10DataSel;
wire						s10m1AddrReady;
wire						s10m1DataReady;
wire						s10m1HResp;
wire						m1s10AddrSel_int;
wire						m1s10DataSel_int;
wire						s10m1AddrReady_int;
wire						s10m1DataReady_int;
wire						s10m1HResp_int;
wire						m1s11AddrSel;
wire						m1s11DataSel;
wire						s11m1AddrReady;
wire						s11m1DataReady;
wire						s11m1HResp;
wire						m1s11AddrSel_int;
wire						m1s11DataSel_int;
wire						s11m1AddrReady_int;
wire						s11m1DataReady_int;
wire						s11m1HResp_int;
wire						m1s12AddrSel;
wire						m1s12DataSel;
wire						s12m1AddrReady;
wire						s12m1DataReady;
wire						s12m1HResp;
wire						m1s12AddrSel_int;
wire						m1s12DataSel_int;
wire						s12m1AddrReady_int;
wire						s12m1DataReady_int;
wire						s12m1HResp_int;
wire						m1s13AddrSel;
wire						m1s13DataSel;
wire						s13m1AddrReady;
wire						s13m1DataReady;
wire						s13m1HResp;
wire						m1s13AddrSel_int;
wire						m1s13DataSel_int;
wire						s13m1AddrReady_int;
wire						s13m1DataReady_int;
wire						s13m1HResp_int;
wire						m1s14AddrSel;
wire						m1s14DataSel;
wire						s14m1AddrReady;
wire						s14m1DataReady;
wire						s14m1HResp;
wire						m1s14AddrSel_int;
wire						m1s14DataSel_int;
wire						s14m1AddrReady_int;
wire						s14m1DataReady_int;
wire						s14m1HResp_int;
wire						m1s15AddrSel;
wire						m1s15DataSel;
wire						s15m1AddrReady;
wire						s15m1DataReady;
wire						s15m1HResp;
wire						m1s15AddrSel_int;
wire						m1s15DataSel_int;
wire						s15m1AddrReady_int;
wire						s15m1DataReady_int;
wire						s15m1HResp_int;
wire						m1s16AddrSel;
wire						m1s16DataSel;
wire						s16m1AddrReady;
wire						s16m1DataReady;
wire						s16m1HResp;
wire						m1s16AddrSel_int;
wire						m1s16DataSel_int;
wire						s16m1AddrReady_int;
wire						s16m1DataReady_int;
wire						s16m1HResp_int;
wire	[31:0]				M2GATEDHADDR;
wire						M2GATEDHMASTLOCK;
wire	[2:0]				M2GATEDHSIZE;
wire	[1:0]					M2GATEDHTRANS; // AI : defined vector 
wire	[2:0]				M2GATEDHBURST; // AI : Added
wire						M2GATEDHWRITE;
wire						m2PrevDataSlaveReady;
wire						m2s0AddrSel;
wire						m2s0DataSel;
wire						s0m2AddrReady;
wire						s0m2DataReady;
wire						s0m2HResp;
wire						m2s0AddrSel_int;
wire						m2s0DataSel_int;
wire						s0m2AddrReady_int;
wire						s0m2DataReady_int;
wire						s0m2HResp_int;
wire						m2s1AddrSel;
wire						m2s1DataSel;
wire						s1m2AddrReady;
wire						s1m2DataReady;
wire						s1m2HResp;
wire						m2s1AddrSel_int;
wire						m2s1DataSel_int;
wire						s1m2AddrReady_int;
wire						s1m2DataReady_int;
wire						s1m2HResp_int;
wire						m2s2AddrSel;
wire						m2s2DataSel;
wire						s2m2AddrReady;
wire						s2m2DataReady;
wire						s2m2HResp;
wire						m2s2AddrSel_int;
wire						m2s2DataSel_int;
wire						s2m2AddrReady_int;
wire						s2m2DataReady_int;
wire						s2m2HResp_int;
wire						m2s3AddrSel;
wire						m2s3DataSel;
wire						s3m2AddrReady;
wire						s3m2DataReady;
wire						s3m2HResp;
wire						m2s3AddrSel_int;
wire						m2s3DataSel_int;
wire						s3m2AddrReady_int;
wire						s3m2DataReady_int;
wire						s3m2HResp_int;
wire						m2s4AddrSel;
wire						m2s4DataSel;
wire						s4m2AddrReady;
wire						s4m2DataReady;
wire						s4m2HResp;
wire						m2s4AddrSel_int;
wire						m2s4DataSel_int;
wire						s4m2AddrReady_int;
wire						s4m2DataReady_int;
wire						s4m2HResp_int;
wire						m2s5AddrSel;
wire						m2s5DataSel;
wire						s5m2AddrReady;
wire						s5m2DataReady;
wire						s5m2HResp;
wire						m2s5AddrSel_int;
wire						m2s5DataSel_int;
wire						s5m2AddrReady_int;
wire						s5m2DataReady_int;
wire						s5m2HResp_int;
wire						m2s6AddrSel;
wire						m2s6DataSel;
wire						s6m2AddrReady;
wire						s6m2DataReady;
wire						s6m2HResp;
wire						m2s6AddrSel_int;
wire						m2s6DataSel_int;
wire						s6m2AddrReady_int;
wire						s6m2DataReady_int;
wire						s6m2HResp_int;
wire						m2s7AddrSel;
wire						m2s7DataSel;
wire						s7m2AddrReady;
wire						s7m2DataReady;
wire						s7m2HResp;
wire						m2s7AddrSel_int;
wire						m2s7DataSel_int;
wire						s7m2AddrReady_int;
wire						s7m2DataReady_int;
wire						s7m2HResp_int;
wire						m2s8AddrSel;
wire						m2s8DataSel;
wire						s8m2AddrReady;
wire						s8m2DataReady;
wire						s8m2HResp;
wire						m2s8AddrSel_int;
wire						m2s8DataSel_int;
wire						s8m2AddrReady_int;
wire						s8m2DataReady_int;
wire						s8m2HResp_int;
wire						m2s9AddrSel;
wire						m2s9DataSel;
wire						s9m2AddrReady;
wire						s9m2DataReady;
wire						s9m2HResp;
wire						m2s9AddrSel_int;
wire						m2s9DataSel_int;
wire						s9m2AddrReady_int;
wire						s9m2DataReady_int;
wire						s9m2HResp_int;
wire						m2s10AddrSel;
wire						m2s10DataSel;
wire						s10m2AddrReady;
wire						s10m2DataReady;
wire						s10m2HResp;
wire						m2s10AddrSel_int;
wire						m2s10DataSel_int;
wire						s10m2AddrReady_int;
wire						s10m2DataReady_int;
wire						s10m2HResp_int;
wire						m2s11AddrSel;
wire						m2s11DataSel;
wire						s11m2AddrReady;
wire						s11m2DataReady;
wire						s11m2HResp;
wire						m2s11AddrSel_int;
wire						m2s11DataSel_int;
wire						s11m2AddrReady_int;
wire						s11m2DataReady_int;
wire						s11m2HResp_int;
wire						m2s12AddrSel;
wire						m2s12DataSel;
wire						s12m2AddrReady;
wire						s12m2DataReady;
wire						s12m2HResp;
wire						m2s12AddrSel_int;
wire						m2s12DataSel_int;
wire						s12m2AddrReady_int;
wire						s12m2DataReady_int;
wire						s12m2HResp_int;
wire						m2s13AddrSel;
wire						m2s13DataSel;
wire						s13m2AddrReady;
wire						s13m2DataReady;
wire						s13m2HResp;
wire						m2s13AddrSel_int;
wire						m2s13DataSel_int;
wire						s13m2AddrReady_int;
wire						s13m2DataReady_int;
wire						s13m2HResp_int;
wire						m2s14AddrSel;
wire						m2s14DataSel;
wire						s14m2AddrReady;
wire						s14m2DataReady;
wire						s14m2HResp;
wire						m2s14AddrSel_int;
wire						m2s14DataSel_int;
wire						s14m2AddrReady_int;
wire						s14m2DataReady_int;
wire						s14m2HResp_int;
wire						m2s15AddrSel;
wire						m2s15DataSel;
wire						s15m2AddrReady;
wire						s15m2DataReady;
wire						s15m2HResp;
wire						m2s15AddrSel_int;
wire						m2s15DataSel_int;
wire						s15m2AddrReady_int;
wire						s15m2DataReady_int;
wire						s15m2HResp_int;
wire						m2s16AddrSel;
wire						m2s16DataSel;
wire						s16m2AddrReady;
wire						s16m2DataReady;
wire						s16m2HResp;
wire						m2s16AddrSel_int;
wire						m2s16DataSel_int;
wire						s16m2AddrReady_int;
wire						s16m2DataReady_int;
wire						s16m2HResp_int;
wire	[31:0]				M3GATEDHADDR;
wire						M3GATEDHMASTLOCK;
wire	[2:0]				M3GATEDHSIZE;
wire	[1:0]					M3GATEDHTRANS; // AI : defined vector 
wire	[2:0]				M3GATEDHBURST; // AI : Added
wire						M3GATEDHWRITE;
wire						m3PrevDataSlaveReady;
wire						m3s0AddrSel;
wire						m3s0DataSel;
wire						s0m3AddrReady;
wire						s0m3DataReady;
wire						s0m3HResp;
wire						m3s0AddrSel_int;
wire						m3s0DataSel_int;
wire						s0m3AddrReady_int;
wire						s0m3DataReady_int;
wire						s0m3HResp_int;
wire						m3s1AddrSel;
wire						m3s1DataSel;
wire						s1m3AddrReady;
wire						s1m3DataReady;
wire						s1m3HResp;
wire						m3s1AddrSel_int;
wire						m3s1DataSel_int;
wire						s1m3AddrReady_int;
wire						s1m3DataReady_int;
wire						s1m3HResp_int;
wire						m3s2AddrSel;
wire						m3s2DataSel;
wire						s2m3AddrReady;
wire						s2m3DataReady;
wire						s2m3HResp;
wire						m3s2AddrSel_int;
wire						m3s2DataSel_int;
wire						s2m3AddrReady_int;
wire						s2m3DataReady_int;
wire						s2m3HResp_int;
wire						m3s3AddrSel;
wire						m3s3DataSel;
wire						s3m3AddrReady;
wire						s3m3DataReady;
wire						s3m3HResp;
wire						m3s3AddrSel_int;
wire						m3s3DataSel_int;
wire						s3m3AddrReady_int;
wire						s3m3DataReady_int;
wire						s3m3HResp_int;
wire						m3s4AddrSel;
wire						m3s4DataSel;
wire						s4m3AddrReady;
wire						s4m3DataReady;
wire						s4m3HResp;
wire						m3s4AddrSel_int;
wire						m3s4DataSel_int;
wire						s4m3AddrReady_int;
wire						s4m3DataReady_int;
wire						s4m3HResp_int;
wire						m3s5AddrSel;
wire						m3s5DataSel;
wire						s5m3AddrReady;
wire						s5m3DataReady;
wire						s5m3HResp;
wire						m3s5AddrSel_int;
wire						m3s5DataSel_int;
wire						s5m3AddrReady_int;
wire						s5m3DataReady_int;
wire						s5m3HResp_int;
wire						m3s6AddrSel;
wire						m3s6DataSel;
wire						s6m3AddrReady;
wire						s6m3DataReady;
wire						s6m3HResp;
wire						m3s6AddrSel_int;
wire						m3s6DataSel_int;
wire						s6m3AddrReady_int;
wire						s6m3DataReady_int;
wire						s6m3HResp_int;
wire						m3s7AddrSel;
wire						m3s7DataSel;
wire						s7m3AddrReady;
wire						s7m3DataReady;
wire						s7m3HResp;
wire						m3s7AddrSel_int;
wire						m3s7DataSel_int;
wire						s7m3AddrReady_int;
wire						s7m3DataReady_int;
wire						s7m3HResp_int;
wire						m3s8AddrSel;
wire						m3s8DataSel;
wire						s8m3AddrReady;
wire						s8m3DataReady;
wire						s8m3HResp;
wire						m3s8AddrSel_int;
wire						m3s8DataSel_int;
wire						s8m3AddrReady_int;
wire						s8m3DataReady_int;
wire						s8m3HResp_int;
wire						m3s9AddrSel;
wire						m3s9DataSel;
wire						s9m3AddrReady;
wire						s9m3DataReady;
wire						s9m3HResp;
wire						m3s9AddrSel_int;
wire						m3s9DataSel_int;
wire						s9m3AddrReady_int;
wire						s9m3DataReady_int;
wire						s9m3HResp_int;
wire						m3s10AddrSel;
wire						m3s10DataSel;
wire						s10m3AddrReady;
wire						s10m3DataReady;
wire						s10m3HResp;
wire						m3s10AddrSel_int;
wire						m3s10DataSel_int;
wire						s10m3AddrReady_int;
wire						s10m3DataReady_int;
wire						s10m3HResp_int;
wire						m3s11AddrSel;
wire						m3s11DataSel;
wire						s11m3AddrReady;
wire						s11m3DataReady;
wire						s11m3HResp;
wire						m3s11AddrSel_int;
wire						m3s11DataSel_int;
wire						s11m3AddrReady_int;
wire						s11m3DataReady_int;
wire						s11m3HResp_int;
wire						m3s12AddrSel;
wire						m3s12DataSel;
wire						s12m3AddrReady;
wire						s12m3DataReady;
wire						s12m3HResp;
wire						m3s12AddrSel_int;
wire						m3s12DataSel_int;
wire						s12m3AddrReady_int;
wire						s12m3DataReady_int;
wire						s12m3HResp_int;
wire						m3s13AddrSel;
wire						m3s13DataSel;
wire						s13m3AddrReady;
wire						s13m3DataReady;
wire						s13m3HResp;
wire						m3s13AddrSel_int;
wire						m3s13DataSel_int;
wire						s13m3AddrReady_int;
wire						s13m3DataReady_int;
wire						s13m3HResp_int;
wire						m3s14AddrSel;
wire						m3s14DataSel;
wire						s14m3AddrReady;
wire						s14m3DataReady;
wire						s14m3HResp;
wire						m3s14AddrSel_int;
wire						m3s14DataSel_int;
wire						s14m3AddrReady_int;
wire						s14m3DataReady_int;
wire						s14m3HResp_int;
wire						m3s15AddrSel;
wire						m3s15DataSel;
wire						s15m3AddrReady;
wire						s15m3DataReady;
wire						s15m3HResp;
wire						m3s15AddrSel_int;
wire						m3s15DataSel_int;
wire						s15m3AddrReady_int;
wire						s15m3DataReady_int;
wire						s15m3HResp_int;
wire						m3s16AddrSel;
wire						m3s16DataSel;
wire						s16m3AddrReady;
wire						s16m3DataReady;
wire						s16m3HResp;
wire						m3s16AddrSel_int;
wire						m3s16DataSel_int;
wire						s16m3AddrReady_int;
wire						s16m3DataReady_int;
wire						s16m3HResp_int;
wire	[31:0]				M0_HRDATA_S0;
wire	[31:0]				M0_HRDATA_S1;
wire	[31:0]				M0_HRDATA_S2;
wire	[31:0]				M0_HRDATA_S3;
wire	[31:0]				M0_HRDATA_S4;
wire	[31:0]				M0_HRDATA_S5;
wire	[31:0]				M0_HRDATA_S6;
wire	[31:0]				M0_HRDATA_S7;
wire	[31:0]				M0_HRDATA_S8;
wire	[31:0]				M0_HRDATA_S9;
wire	[31:0]				M0_HRDATA_S10;
wire	[31:0]				M0_HRDATA_S11;
wire	[31:0]				M0_HRDATA_S12;
wire	[31:0]				M0_HRDATA_S13;
wire	[31:0]				M0_HRDATA_S14;
wire	[31:0]				M0_HRDATA_S15;
wire	[31:0]				M0_HRDATA_S16;
wire	[31:0]				M1_HRDATA_S0;
wire	[31:0]				M1_HRDATA_S1;
wire	[31:0]				M1_HRDATA_S2;
wire	[31:0]				M1_HRDATA_S3;
wire	[31:0]				M1_HRDATA_S4;
wire	[31:0]				M1_HRDATA_S5;
wire	[31:0]				M1_HRDATA_S6;
wire	[31:0]				M1_HRDATA_S7;
wire	[31:0]				M1_HRDATA_S8;
wire	[31:0]				M1_HRDATA_S9;
wire	[31:0]				M1_HRDATA_S10;
wire	[31:0]				M1_HRDATA_S11;
wire	[31:0]				M1_HRDATA_S12;
wire	[31:0]				M1_HRDATA_S13;
wire	[31:0]				M1_HRDATA_S14;
wire	[31:0]				M1_HRDATA_S15;
wire	[31:0]				M1_HRDATA_S16;
wire	[31:0]				M2_HRDATA_S0;
wire	[31:0]				M2_HRDATA_S1;
wire	[31:0]				M2_HRDATA_S2;
wire	[31:0]				M2_HRDATA_S3;
wire	[31:0]				M2_HRDATA_S4;
wire	[31:0]				M2_HRDATA_S5;
wire	[31:0]				M2_HRDATA_S6;
wire	[31:0]				M2_HRDATA_S7;
wire	[31:0]				M2_HRDATA_S8;
wire	[31:0]				M2_HRDATA_S9;
wire	[31:0]				M2_HRDATA_S10;
wire	[31:0]				M2_HRDATA_S11;
wire	[31:0]				M2_HRDATA_S12;
wire	[31:0]				M2_HRDATA_S13;
wire	[31:0]				M2_HRDATA_S14;
wire	[31:0]				M2_HRDATA_S15;
wire	[31:0]				M2_HRDATA_S16;
wire	[31:0]				M3_HRDATA_S0;
wire	[31:0]				M3_HRDATA_S1;
wire	[31:0]				M3_HRDATA_S2;
wire	[31:0]				M3_HRDATA_S3;
wire	[31:0]				M3_HRDATA_S4;
wire	[31:0]				M3_HRDATA_S5;
wire	[31:0]				M3_HRDATA_S6;
wire	[31:0]				M3_HRDATA_S7;
wire	[31:0]				M3_HRDATA_S8;
wire	[31:0]				M3_HRDATA_S9;
wire	[31:0]				M3_HRDATA_S10;
wire	[31:0]				M3_HRDATA_S11;
wire	[31:0]				M3_HRDATA_S12;
wire	[31:0]				M3_HRDATA_S13;
wire	[31:0]				M3_HRDATA_S14;
wire	[31:0]				M3_HRDATA_S15;
wire	[31:0]				M3_HRDATA_S16;
wire						M0_HREADYOUT_S0;
wire						M0_HREADYOUT_S1;
wire						M0_HREADYOUT_S2;
wire						M0_HREADYOUT_S3;
wire						M0_HREADYOUT_S4;
wire						M0_HREADYOUT_S5;
wire						M0_HREADYOUT_S6;
wire						M0_HREADYOUT_S7;
wire						M0_HREADYOUT_S8;
wire						M0_HREADYOUT_S9;
wire						M0_HREADYOUT_S10;
wire						M0_HREADYOUT_S11;
wire						M0_HREADYOUT_S12;
wire						M0_HREADYOUT_S13;
wire						M0_HREADYOUT_S14;
wire						M0_HREADYOUT_S15;
wire						M0_HREADYOUT_S16;
wire						M1_HREADYOUT_S0;
wire						M1_HREADYOUT_S1;
wire						M1_HREADYOUT_S2;
wire						M1_HREADYOUT_S3;
wire						M1_HREADYOUT_S4;
wire						M1_HREADYOUT_S5;
wire						M1_HREADYOUT_S6;
wire						M1_HREADYOUT_S7;
wire						M1_HREADYOUT_S8;
wire						M1_HREADYOUT_S9;
wire						M1_HREADYOUT_S10;
wire						M1_HREADYOUT_S11;
wire						M1_HREADYOUT_S12;
wire						M1_HREADYOUT_S13;
wire						M1_HREADYOUT_S14;
wire						M1_HREADYOUT_S15;
wire						M1_HREADYOUT_S16;
wire						M2_HREADYOUT_S0;
wire						M2_HREADYOUT_S1;
wire						M2_HREADYOUT_S2;
wire						M2_HREADYOUT_S3;
wire						M2_HREADYOUT_S4;
wire						M2_HREADYOUT_S5;
wire						M2_HREADYOUT_S6;
wire						M2_HREADYOUT_S7;
wire						M2_HREADYOUT_S8;
wire						M2_HREADYOUT_S9;
wire						M2_HREADYOUT_S10;
wire						M2_HREADYOUT_S11;
wire						M2_HREADYOUT_S12;
wire						M2_HREADYOUT_S13;
wire						M2_HREADYOUT_S14;
wire						M2_HREADYOUT_S15;
wire						M2_HREADYOUT_S16;
wire						M3_HREADYOUT_S0;
wire						M3_HREADYOUT_S1;
wire						M3_HREADYOUT_S2;
wire						M3_HREADYOUT_S3;
wire						M3_HREADYOUT_S4;
wire						M3_HREADYOUT_S5;
wire						M3_HREADYOUT_S6;
wire						M3_HREADYOUT_S7;
wire						M3_HREADYOUT_S8;
wire						M3_HREADYOUT_S9;
wire						M3_HREADYOUT_S10;
wire						M3_HREADYOUT_S11;
wire						M3_HREADYOUT_S12;
wire						M3_HREADYOUT_S13;
wire						M3_HREADYOUT_S14;
wire						M3_HREADYOUT_S15;
wire						M3_HREADYOUT_S16;
wire						INT_HREADYOUT_S0;
wire						INT_HREADYOUT_S1;
wire						INT_HREADYOUT_S2;
wire						INT_HREADYOUT_S3;
wire						INT_HREADYOUT_S4;
wire						INT_HREADYOUT_S5;
wire						INT_HREADYOUT_S6;
wire						INT_HREADYOUT_S7;
wire						INT_HREADYOUT_S8;
wire						INT_HREADYOUT_S9;
wire						INT_HREADYOUT_S10;
wire						INT_HREADYOUT_S11;
wire						INT_HREADYOUT_S12;
wire						INT_HREADYOUT_S13;
wire						INT_HREADYOUT_S14;
wire						INT_HREADYOUT_S15;
wire						INT_HREADYOUT_S16;
wire						INT_HRESP_S0;
wire						INT_HRESP_S1;
wire						INT_HRESP_S2;
wire						INT_HRESP_S3;
wire						INT_HRESP_S4;
wire						INT_HRESP_S5;
wire						INT_HRESP_S6;
wire						INT_HRESP_S7;
wire						INT_HRESP_S8;
wire						INT_HRESP_S9;
wire						INT_HRESP_S10;
wire						INT_HRESP_S11;
wire						INT_HRESP_S12;
wire						INT_HRESP_S13;
wire						INT_HRESP_S14;
wire						INT_HRESP_S15;
wire						INT_HRESP_S16;
wire	[31:0]				HWDATA_M0S0;
wire	[31:0]				HWDATA_M0S1;
wire	[31:0]				HWDATA_M0S2;
wire	[31:0]				HWDATA_M0S3;
wire	[31:0]				HWDATA_M0S4;
wire	[31:0]				HWDATA_M0S5;
wire	[31:0]				HWDATA_M0S6;
wire	[31:0]				HWDATA_M0S7;
wire	[31:0]				HWDATA_M0S8;
wire	[31:0]				HWDATA_M0S9;
wire	[31:0]				HWDATA_M0S10;
wire	[31:0]				HWDATA_M0S11;
wire	[31:0]				HWDATA_M0S12;
wire	[31:0]				HWDATA_M0S13;
wire	[31:0]				HWDATA_M0S14;
wire	[31:0]				HWDATA_M0S15;
wire	[31:0]				HWDATA_M0S16;
wire	[31:0]				HWDATA_M1S0;
wire	[31:0]				HWDATA_M1S1;
wire	[31:0]				HWDATA_M1S2;
wire	[31:0]				HWDATA_M1S3;
wire	[31:0]				HWDATA_M1S4;
wire	[31:0]				HWDATA_M1S5;
wire	[31:0]				HWDATA_M1S6;
wire	[31:0]				HWDATA_M1S7;
wire	[31:0]				HWDATA_M1S8;
wire	[31:0]				HWDATA_M1S9;
wire	[31:0]				HWDATA_M1S10;
wire	[31:0]				HWDATA_M1S11;
wire	[31:0]				HWDATA_M1S12;
wire	[31:0]				HWDATA_M1S13;
wire	[31:0]				HWDATA_M1S14;
wire	[31:0]				HWDATA_M1S15;
wire	[31:0]				HWDATA_M1S16;
wire	[31:0]				HWDATA_M2S0;
wire	[31:0]				HWDATA_M2S1;
wire	[31:0]				HWDATA_M2S2;
wire	[31:0]				HWDATA_M2S3;
wire	[31:0]				HWDATA_M2S4;
wire	[31:0]				HWDATA_M2S5;
wire	[31:0]				HWDATA_M2S6;
wire	[31:0]				HWDATA_M2S7;
wire	[31:0]				HWDATA_M2S8;
wire	[31:0]				HWDATA_M2S9;
wire	[31:0]				HWDATA_M2S10;
wire	[31:0]				HWDATA_M2S11;
wire	[31:0]				HWDATA_M2S12;
wire	[31:0]				HWDATA_M2S13;
wire	[31:0]				HWDATA_M2S14;
wire	[31:0]				HWDATA_M2S15;
wire	[31:0]				HWDATA_M2S16;
wire	[31:0]				HWDATA_M3S0;
wire	[31:0]				HWDATA_M3S1;
wire	[31:0]				HWDATA_M3S2;
wire	[31:0]				HWDATA_M3S3;
wire	[31:0]				HWDATA_M3S4;
wire	[31:0]				HWDATA_M3S5;
wire	[31:0]				HWDATA_M3S6;
wire	[31:0]				HWDATA_M3S7;
wire	[31:0]				HWDATA_M3S8;
wire	[31:0]				HWDATA_M3S9;
wire	[31:0]				HWDATA_M3S10;
wire	[31:0]				HWDATA_M3S11;
wire	[31:0]				HWDATA_M3S12;
wire	[31:0]				HWDATA_M3S13;
wire	[31:0]				HWDATA_M3S14;
wire	[31:0]				HWDATA_M3S15;
wire	[31:0]				HWDATA_M3S16;
wire	[31:0]				m0s0GatedHADDR;
wire	[31:0]				m0s1GatedHADDR;
wire	[31:0]				m0s2GatedHADDR;
wire	[31:0]				m0s3GatedHADDR;
wire	[31:0]				m0s4GatedHADDR;
wire	[31:0]				m0s5GatedHADDR;
wire	[31:0]				m0s6GatedHADDR;
wire	[31:0]				m0s7GatedHADDR;
wire	[31:0]				m0s8GatedHADDR;
wire	[31:0]				m0s9GatedHADDR;
wire	[31:0]				m0s10GatedHADDR;
wire	[31:0]				m0s11GatedHADDR;
wire	[31:0]				m0s12GatedHADDR;
wire	[31:0]				m0s13GatedHADDR;
wire	[31:0]				m0s14GatedHADDR;
wire	[31:0]				m0s15GatedHADDR;
wire	[31:0]				m0s16GatedHADDR;
wire	[31:0]				m1s0GatedHADDR;
wire	[31:0]				m1s1GatedHADDR;
wire	[31:0]				m1s2GatedHADDR;
wire	[31:0]				m1s3GatedHADDR;
wire	[31:0]				m1s4GatedHADDR;
wire	[31:0]				m1s5GatedHADDR;
wire	[31:0]				m1s6GatedHADDR;
wire	[31:0]				m1s7GatedHADDR;
wire	[31:0]				m1s8GatedHADDR;
wire	[31:0]				m1s9GatedHADDR;
wire	[31:0]				m1s10GatedHADDR;
wire	[31:0]				m1s11GatedHADDR;
wire	[31:0]				m1s12GatedHADDR;
wire	[31:0]				m1s13GatedHADDR;
wire	[31:0]				m1s14GatedHADDR;
wire	[31:0]				m1s15GatedHADDR;
wire	[31:0]				m1s16GatedHADDR;
wire	[31:0]				m2s0GatedHADDR;
wire	[31:0]				m2s1GatedHADDR;
wire	[31:0]				m2s2GatedHADDR;
wire	[31:0]				m2s3GatedHADDR;
wire	[31:0]				m2s4GatedHADDR;
wire	[31:0]				m2s5GatedHADDR;
wire	[31:0]				m2s6GatedHADDR;
wire	[31:0]				m2s7GatedHADDR;
wire	[31:0]				m2s8GatedHADDR;
wire	[31:0]				m2s9GatedHADDR;
wire	[31:0]				m2s10GatedHADDR;
wire	[31:0]				m2s11GatedHADDR;
wire	[31:0]				m2s12GatedHADDR;
wire	[31:0]				m2s13GatedHADDR;
wire	[31:0]				m2s14GatedHADDR;
wire	[31:0]				m2s15GatedHADDR;
wire	[31:0]				m2s16GatedHADDR;
wire	[31:0]				m3s0GatedHADDR;
wire	[31:0]				m3s1GatedHADDR;
wire	[31:0]				m3s2GatedHADDR;
wire	[31:0]				m3s3GatedHADDR;
wire	[31:0]				m3s4GatedHADDR;
wire	[31:0]				m3s5GatedHADDR;
wire	[31:0]				m3s6GatedHADDR;
wire	[31:0]				m3s7GatedHADDR;
wire	[31:0]				m3s8GatedHADDR;
wire	[31:0]				m3s9GatedHADDR;
wire	[31:0]				m3s10GatedHADDR;
wire	[31:0]				m3s11GatedHADDR;
wire	[31:0]				m3s12GatedHADDR;
wire	[31:0]				m3s13GatedHADDR;
wire	[31:0]				m3s14GatedHADDR;
wire	[31:0]				m3s15GatedHADDR;
wire	[31:0]				m3s16GatedHADDR;
wire	[2:0]				m0s0GatedHSIZE;
wire	[2:0]				m0s1GatedHSIZE;
wire	[2:0]				m0s2GatedHSIZE;
wire	[2:0]				m0s3GatedHSIZE;
wire	[2:0]				m0s4GatedHSIZE;
wire	[2:0]				m0s5GatedHSIZE;
wire	[2:0]				m0s6GatedHSIZE;
wire	[2:0]				m0s7GatedHSIZE;
wire	[2:0]				m0s8GatedHSIZE;
wire	[2:0]				m0s9GatedHSIZE;
wire	[2:0]				m0s10GatedHSIZE;
wire	[2:0]				m0s11GatedHSIZE;
wire	[2:0]				m0s12GatedHSIZE;
wire	[2:0]				m0s13GatedHSIZE;
wire	[2:0]				m0s14GatedHSIZE;
wire	[2:0]				m0s15GatedHSIZE;
wire	[2:0]				m0s16GatedHSIZE;
wire	[2:0]				m1s0GatedHSIZE;
wire	[2:0]				m1s1GatedHSIZE;
wire	[2:0]				m1s2GatedHSIZE;
wire	[2:0]				m1s3GatedHSIZE;
wire	[2:0]				m1s4GatedHSIZE;
wire	[2:0]				m1s5GatedHSIZE;
wire	[2:0]				m1s6GatedHSIZE;
wire	[2:0]				m1s7GatedHSIZE;
wire	[2:0]				m1s8GatedHSIZE;
wire	[2:0]				m1s9GatedHSIZE;
wire	[2:0]				m1s10GatedHSIZE;
wire	[2:0]				m1s11GatedHSIZE;
wire	[2:0]				m1s12GatedHSIZE;
wire	[2:0]				m1s13GatedHSIZE;
wire	[2:0]				m1s14GatedHSIZE;
wire	[2:0]				m1s15GatedHSIZE;
wire	[2:0]				m1s16GatedHSIZE;
wire	[2:0]				m2s0GatedHSIZE;
wire	[2:0]				m2s1GatedHSIZE;
wire	[2:0]				m2s2GatedHSIZE;
wire	[2:0]				m2s3GatedHSIZE;
wire	[2:0]				m2s4GatedHSIZE;
wire	[2:0]				m2s5GatedHSIZE;
wire	[2:0]				m2s6GatedHSIZE;
wire	[2:0]				m2s7GatedHSIZE;
wire	[2:0]				m2s8GatedHSIZE;
wire	[2:0]				m2s9GatedHSIZE;
wire	[2:0]				m2s10GatedHSIZE;
wire	[2:0]				m2s11GatedHSIZE;
wire	[2:0]				m2s12GatedHSIZE;
wire	[2:0]				m2s13GatedHSIZE;
wire	[2:0]				m2s14GatedHSIZE;
wire	[2:0]				m2s15GatedHSIZE;
wire	[2:0]				m2s16GatedHSIZE;
wire	[2:0]				m3s0GatedHSIZE;
wire	[2:0]				m3s1GatedHSIZE;
wire	[2:0]				m3s2GatedHSIZE;
wire	[2:0]				m3s3GatedHSIZE;
wire	[2:0]				m3s4GatedHSIZE;
wire	[2:0]				m3s5GatedHSIZE;
wire	[2:0]				m3s6GatedHSIZE;
wire	[2:0]				m3s7GatedHSIZE;
wire	[2:0]				m3s8GatedHSIZE;
wire	[2:0]				m3s9GatedHSIZE;
wire	[2:0]				m3s10GatedHSIZE;
wire	[2:0]				m3s11GatedHSIZE;
wire	[2:0]				m3s12GatedHSIZE;
wire	[2:0]				m3s13GatedHSIZE;
wire	[2:0]				m3s14GatedHSIZE;
wire	[2:0]				m3s15GatedHSIZE;
wire	[2:0]				m3s16GatedHSIZE;
wire						m0s0GatedHMASTLOCK;
wire						m0s1GatedHMASTLOCK;
wire						m0s2GatedHMASTLOCK;
wire						m0s3GatedHMASTLOCK;
wire						m0s4GatedHMASTLOCK;
wire						m0s5GatedHMASTLOCK;
wire						m0s6GatedHMASTLOCK;
wire						m0s7GatedHMASTLOCK;
wire						m0s8GatedHMASTLOCK;
wire						m0s9GatedHMASTLOCK;
wire						m0s10GatedHMASTLOCK;
wire						m0s11GatedHMASTLOCK;
wire						m0s12GatedHMASTLOCK;
wire						m0s13GatedHMASTLOCK;
wire						m0s14GatedHMASTLOCK;
wire						m0s15GatedHMASTLOCK;
wire						m0s16GatedHMASTLOCK;
wire						m1s0GatedHMASTLOCK;
wire						m1s1GatedHMASTLOCK;
wire						m1s2GatedHMASTLOCK;
wire						m1s3GatedHMASTLOCK;
wire						m1s4GatedHMASTLOCK;
wire						m1s5GatedHMASTLOCK;
wire						m1s6GatedHMASTLOCK;
wire						m1s7GatedHMASTLOCK;
wire						m1s8GatedHMASTLOCK;
wire						m1s9GatedHMASTLOCK;
wire						m1s10GatedHMASTLOCK;
wire						m1s11GatedHMASTLOCK;
wire						m1s12GatedHMASTLOCK;
wire						m1s13GatedHMASTLOCK;
wire						m1s14GatedHMASTLOCK;
wire						m1s15GatedHMASTLOCK;
wire						m1s16GatedHMASTLOCK;
wire						m2s0GatedHMASTLOCK;
wire						m2s1GatedHMASTLOCK;
wire						m2s2GatedHMASTLOCK;
wire						m2s3GatedHMASTLOCK;
wire						m2s4GatedHMASTLOCK;
wire						m2s5GatedHMASTLOCK;
wire						m2s6GatedHMASTLOCK;
wire						m2s7GatedHMASTLOCK;
wire						m2s8GatedHMASTLOCK;
wire						m2s9GatedHMASTLOCK;
wire						m2s10GatedHMASTLOCK;
wire						m2s11GatedHMASTLOCK;
wire						m2s12GatedHMASTLOCK;
wire						m2s13GatedHMASTLOCK;
wire						m2s14GatedHMASTLOCK;
wire						m2s15GatedHMASTLOCK;
wire						m2s16GatedHMASTLOCK;
wire						m3s0GatedHMASTLOCK;
wire						m3s1GatedHMASTLOCK;
wire						m3s2GatedHMASTLOCK;
wire						m3s3GatedHMASTLOCK;
wire						m3s4GatedHMASTLOCK;
wire						m3s5GatedHMASTLOCK;
wire						m3s6GatedHMASTLOCK;
wire						m3s7GatedHMASTLOCK;
wire						m3s8GatedHMASTLOCK;
wire						m3s9GatedHMASTLOCK;
wire						m3s10GatedHMASTLOCK;
wire						m3s11GatedHMASTLOCK;
wire						m3s12GatedHMASTLOCK;
wire						m3s13GatedHMASTLOCK;
wire						m3s14GatedHMASTLOCK;
wire						m3s15GatedHMASTLOCK;
wire						m3s16GatedHMASTLOCK;
////////////////////////////////////////////////////////// AI : changed to vector
wire	[1:0]					m0s0GatedHTRANS;
wire	[1:0]				m0s1GatedHTRANS;
wire	[1:0]				m0s2GatedHTRANS;
wire	[1:0]				m0s3GatedHTRANS;
wire	[1:0]				m0s4GatedHTRANS;
wire	[1:0]				m0s5GatedHTRANS;
wire	[1:0]				m0s6GatedHTRANS;
wire	[1:0]				m0s7GatedHTRANS;
wire	[1:0]				m0s8GatedHTRANS;
wire	[1:0]				m0s9GatedHTRANS;
wire	[1:0]				m0s10GatedHTRANS;
wire	[1:0]				m0s11GatedHTRANS;
wire	[1:0]				m0s12GatedHTRANS;
wire	[1:0]				m0s13GatedHTRANS;
wire	[1:0]				m0s14GatedHTRANS;
wire	[1:0]				m0s15GatedHTRANS;
wire	[1:0]				m0s16GatedHTRANS;
wire	[1:0]				m1s0GatedHTRANS;
wire	[1:0]				m1s1GatedHTRANS;
wire	[1:0]				m1s2GatedHTRANS;
wire	[1:0]				m1s3GatedHTRANS;
wire	[1:0]				m1s4GatedHTRANS;
wire	[1:0]				m1s5GatedHTRANS;
wire	[1:0]				m1s6GatedHTRANS;
wire	[1:0]				m1s7GatedHTRANS;
wire	[1:0]				m1s8GatedHTRANS;
wire	[1:0]				m1s9GatedHTRANS;
wire	[1:0]				m1s10GatedHTRANS;
wire	[1:0]				m1s11GatedHTRANS;
wire	[1:0]				m1s12GatedHTRANS;
wire	[1:0]				m1s13GatedHTRANS;
wire	[1:0]				m1s14GatedHTRANS;
wire	[1:0]				m1s15GatedHTRANS;
wire	[1:0]				m1s16GatedHTRANS;
wire	[1:0]				m2s0GatedHTRANS;
wire	[1:0]				m2s1GatedHTRANS;
wire	[1:0]				m2s2GatedHTRANS;
wire	[1:0]				m2s3GatedHTRANS;
wire	[1:0]				m2s4GatedHTRANS;
wire	[1:0]				m2s5GatedHTRANS;
wire	[1:0]				m2s6GatedHTRANS;
wire	[1:0]				m2s7GatedHTRANS;
wire	[1:0]				m2s8GatedHTRANS;
wire	[1:0]				m2s9GatedHTRANS;
wire	[1:0]				m2s10GatedHTRANS;
wire	[1:0]				m2s11GatedHTRANS;
wire	[1:0]				m2s12GatedHTRANS;
wire	[1:0]				m2s13GatedHTRANS;
wire	[1:0]				m2s14GatedHTRANS;
wire	[1:0]				m2s15GatedHTRANS;
wire	[1:0]				m2s16GatedHTRANS;
wire	[1:0]				m3s0GatedHTRANS;
wire	[1:0]				m3s1GatedHTRANS;
wire	[1:0]				m3s2GatedHTRANS;
wire	[1:0]				m3s3GatedHTRANS;
wire	[1:0]				m3s4GatedHTRANS;
wire	[1:0]				m3s5GatedHTRANS;
wire	[1:0]				m3s6GatedHTRANS;
wire	[1:0]				m3s7GatedHTRANS;
wire	[1:0]				m3s8GatedHTRANS;
wire	[1:0]				m3s9GatedHTRANS;
wire	[1:0]				m3s10GatedHTRANS;
wire	[1:0]				m3s11GatedHTRANS;
wire	[1:0]				m3s12GatedHTRANS;
wire	[1:0]				m3s13GatedHTRANS;
wire	[1:0]				m3s14GatedHTRANS;
wire	[1:0]				m3s15GatedHTRANS;
wire	[1:0]				m3s16GatedHTRANS;
//////////////////////////////////////////////////////// AI : Added for burst 
wire    [2:0]                    m0s0GatedHBURST ;
wire    [2:0]               m0s1GatedHBURST ;
wire    [2:0]               m0s2GatedHBURST ;
wire    [2:0]               m0s3GatedHBURST ;
wire    [2:0]               m0s4GatedHBURST ;
wire    [2:0]               m0s5GatedHBURST ;
wire    [2:0]               m0s6GatedHBURST ;
wire    [2:0]               m0s7GatedHBURST ;
wire    [2:0]               m0s8GatedHBURST ;
wire    [2:0]               m0s9GatedHBURST ;
wire    [2:0]               m0s10GatedHBURST;
wire    [2:0]               m0s11GatedHBURST;
wire    [2:0]               m0s12GatedHBURST;
wire    [2:0]               m0s13GatedHBURST;
wire    [2:0]               m0s14GatedHBURST;
wire    [2:0]               m0s15GatedHBURST;
wire    [2:0]               m0s16GatedHBURST;
wire    [2:0]               m1s0GatedHBURST ;
wire    [2:0]               m1s1GatedHBURST ;
wire    [2:0]               m1s2GatedHBURST ;
wire    [2:0]               m1s3GatedHBURST ;
wire    [2:0]               m1s4GatedHBURST ;
wire    [2:0]               m1s5GatedHBURST ;
wire    [2:0]               m1s6GatedHBURST ;
wire    [2:0]               m1s7GatedHBURST ;
wire    [2:0]               m1s8GatedHBURST ;
wire    [2:0]               m1s9GatedHBURST ;
wire    [2:0]               m1s10GatedHBURST;
wire    [2:0]               m1s11GatedHBURST;
wire    [2:0]               m1s12GatedHBURST;
wire    [2:0]               m1s13GatedHBURST;
wire    [2:0]               m1s14GatedHBURST;
wire    [2:0]               m1s15GatedHBURST;
wire    [2:0]               m1s16GatedHBURST;
wire    [2:0]               m2s0GatedHBURST ;
wire    [2:0]               m2s1GatedHBURST ;
wire    [2:0]               m2s2GatedHBURST ;
wire    [2:0]               m2s3GatedHBURST ;
wire    [2:0]                m2s4GatedHBURST ;
wire    [2:0]                m2s5GatedHBURST ;
wire    [2:0]                m2s6GatedHBURST ;
wire    [2:0]                m2s7GatedHBURST ;
wire    [2:0]                m2s8GatedHBURST ;
wire    [2:0]                m2s9GatedHBURST ;
wire    [2:0]                m2s10GatedHBURST;
wire    [2:0]                m2s11GatedHBURST;
wire    [2:0]                m2s12GatedHBURST;
wire    [2:0]                m2s13GatedHBURST;
wire    [2:0]                m2s14GatedHBURST;
wire    [2:0]                m2s15GatedHBURST;
wire    [2:0]                m2s16GatedHBURST;
wire    [2:0]                m3s0GatedHBURST ;
wire    [2:0]                m3s1GatedHBURST ;
wire    [2:0]                m3s2GatedHBURST ;
wire    [2:0]                m3s3GatedHBURST ;
wire    [2:0]                m3s4GatedHBURST ;
wire    [2:0]                m3s5GatedHBURST ;
wire    [2:0]                m3s6GatedHBURST ;
wire    [2:0]                m3s7GatedHBURST ;
wire    [2:0]                m3s8GatedHBURST ;
wire    [2:0]                m3s9GatedHBURST ;
wire    [2:0]                m3s10GatedHBURST;
wire    [2:0]                m3s11GatedHBURST;
wire    [2:0]                m3s12GatedHBURST;
wire    [2:0]                m3s13GatedHBURST;
wire    [2:0]                m3s14GatedHBURST;
wire    [2:0]                m3s15GatedHBURST;
wire    [2:0]                m3s16GatedHBURST;


///////////////////////////////////////////////////

wire						m0s0GatedHWRITE;
wire						m0s1GatedHWRITE;
wire						m0s2GatedHWRITE;
wire						m0s3GatedHWRITE;
wire						m0s4GatedHWRITE;
wire						m0s5GatedHWRITE;
wire						m0s6GatedHWRITE;
wire						m0s7GatedHWRITE;
wire						m0s8GatedHWRITE;
wire						m0s9GatedHWRITE;
wire						m0s10GatedHWRITE;
wire						m0s11GatedHWRITE;
wire						m0s12GatedHWRITE;
wire						m0s13GatedHWRITE;
wire						m0s14GatedHWRITE;
wire						m0s15GatedHWRITE;
wire						m0s16GatedHWRITE;
wire						m1s0GatedHWRITE;
wire						m1s1GatedHWRITE;
wire						m1s2GatedHWRITE;
wire						m1s3GatedHWRITE;
wire						m1s4GatedHWRITE;
wire						m1s5GatedHWRITE;
wire						m1s6GatedHWRITE;
wire						m1s7GatedHWRITE;
wire						m1s8GatedHWRITE;
wire						m1s9GatedHWRITE;
wire						m1s10GatedHWRITE;
wire						m1s11GatedHWRITE;
wire						m1s12GatedHWRITE;
wire						m1s13GatedHWRITE;
wire						m1s14GatedHWRITE;
wire						m1s15GatedHWRITE;
wire						m1s16GatedHWRITE;
wire						m2s0GatedHWRITE;
wire						m2s1GatedHWRITE;
wire						m2s2GatedHWRITE;
wire						m2s3GatedHWRITE;
wire						m2s4GatedHWRITE;
wire						m2s5GatedHWRITE;
wire						m2s6GatedHWRITE;
wire						m2s7GatedHWRITE;
wire						m2s8GatedHWRITE;
wire						m2s9GatedHWRITE;
wire						m2s10GatedHWRITE;
wire						m2s11GatedHWRITE;
wire						m2s12GatedHWRITE;
wire						m2s13GatedHWRITE;
wire						m2s14GatedHWRITE;
wire						m2s15GatedHWRITE;
wire						m2s16GatedHWRITE;
wire						m3s0GatedHWRITE;
wire						m3s1GatedHWRITE;
wire						m3s2GatedHWRITE;
wire						m3s3GatedHWRITE;
wire						m3s4GatedHWRITE;
wire						m3s5GatedHWRITE;
wire						m3s6GatedHWRITE;
wire						m3s7GatedHWRITE;
wire						m3s8GatedHWRITE;
wire						m3s9GatedHWRITE;
wire						m3s10GatedHWRITE;
wire						m3s11GatedHWRITE;
wire						m3s12GatedHWRITE;
wire						m3s13GatedHWRITE;
wire						m3s14GatedHWRITE;
wire						m3s15GatedHWRITE;
wire						m3s16GatedHWRITE;
wire						m0s0PrevDataSlaveReady;
wire						m0s1PrevDataSlaveReady;
wire						m0s2PrevDataSlaveReady;
wire						m0s3PrevDataSlaveReady;
wire						m0s4PrevDataSlaveReady;
wire						m0s5PrevDataSlaveReady;
wire						m0s6PrevDataSlaveReady;
wire						m0s7PrevDataSlaveReady;
wire						m0s8PrevDataSlaveReady;
wire						m0s9PrevDataSlaveReady;
wire						m0s10PrevDataSlaveReady;
wire						m0s11PrevDataSlaveReady;
wire						m0s12PrevDataSlaveReady;
wire						m0s13PrevDataSlaveReady;
wire						m0s14PrevDataSlaveReady;
wire						m0s15PrevDataSlaveReady;
wire						m0s16PrevDataSlaveReady;
wire						m1s0PrevDataSlaveReady;
wire						m1s1PrevDataSlaveReady;
wire						m1s2PrevDataSlaveReady;
wire						m1s3PrevDataSlaveReady;
wire						m1s4PrevDataSlaveReady;
wire						m1s5PrevDataSlaveReady;
wire						m1s6PrevDataSlaveReady;
wire						m1s7PrevDataSlaveReady;
wire						m1s8PrevDataSlaveReady;
wire						m1s9PrevDataSlaveReady;
wire						m1s10PrevDataSlaveReady;
wire						m1s11PrevDataSlaveReady;
wire						m1s12PrevDataSlaveReady;
wire						m1s13PrevDataSlaveReady;
wire						m1s14PrevDataSlaveReady;
wire						m1s15PrevDataSlaveReady;
wire						m1s16PrevDataSlaveReady;
wire						m2s0PrevDataSlaveReady;
wire						m2s1PrevDataSlaveReady;
wire						m2s2PrevDataSlaveReady;
wire						m2s3PrevDataSlaveReady;
wire						m2s4PrevDataSlaveReady;
wire						m2s5PrevDataSlaveReady;
wire						m2s6PrevDataSlaveReady;
wire						m2s7PrevDataSlaveReady;
wire						m2s8PrevDataSlaveReady;
wire						m2s9PrevDataSlaveReady;
wire						m2s10PrevDataSlaveReady;
wire						m2s11PrevDataSlaveReady;
wire						m2s12PrevDataSlaveReady;
wire						m2s13PrevDataSlaveReady;
wire						m2s14PrevDataSlaveReady;
wire						m2s15PrevDataSlaveReady;
wire						m2s16PrevDataSlaveReady;
wire						m3s0PrevDataSlaveReady;
wire						m3s1PrevDataSlaveReady;
wire						m3s2PrevDataSlaveReady;
wire						m3s3PrevDataSlaveReady;
wire						m3s4PrevDataSlaveReady;
wire						m3s5PrevDataSlaveReady;
wire						m3s6PrevDataSlaveReady;
wire						m3s7PrevDataSlaveReady;
wire						m3s8PrevDataSlaveReady;
wire						m3s9PrevDataSlaveReady;
wire						m3s10PrevDataSlaveReady;
wire						m3s11PrevDataSlaveReady;
wire						m3s12PrevDataSlaveReady;
wire						m3s13PrevDataSlaveReady;
wire						m3s14PrevDataSlaveReady;
wire						m3s15PrevDataSlaveReady;
wire						m3s16PrevDataSlaveReady;
wire						HREADY_M0_pre;
wire						HREADY_M1_pre;
wire						HREADY_M2_pre;
wire						HREADY_M3_pre;
  generate
    if (M0_AHBSLOTENABLE[0])  assign s0m0AddrReady_int  = s0m0AddrReady;  else assign s0m0AddrReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[1])  assign s1m0AddrReady_int  = s1m0AddrReady;  else assign s1m0AddrReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[2])  assign s2m0AddrReady_int  = s2m0AddrReady;  else assign s2m0AddrReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[3])  assign s3m0AddrReady_int  = s3m0AddrReady;  else assign s3m0AddrReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[4])  assign s4m0AddrReady_int  = s4m0AddrReady;  else assign s4m0AddrReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[5])  assign s5m0AddrReady_int  = s5m0AddrReady;  else assign s5m0AddrReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[6])  assign s6m0AddrReady_int  = s6m0AddrReady;  else assign s6m0AddrReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[7])  assign s7m0AddrReady_int  = s7m0AddrReady;  else assign s7m0AddrReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[8])  assign s8m0AddrReady_int  = s8m0AddrReady;  else assign s8m0AddrReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[9])  assign s9m0AddrReady_int  = s9m0AddrReady;  else assign s9m0AddrReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[10])  assign s10m0AddrReady_int  = s10m0AddrReady;  else assign s10m0AddrReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[11])  assign s11m0AddrReady_int  = s11m0AddrReady;  else assign s11m0AddrReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[12])  assign s12m0AddrReady_int  = s12m0AddrReady;  else assign s12m0AddrReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[13])  assign s13m0AddrReady_int  = s13m0AddrReady;  else assign s13m0AddrReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[14])  assign s14m0AddrReady_int  = s14m0AddrReady;  else assign s14m0AddrReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[15])  assign s15m0AddrReady_int  = s15m0AddrReady;  else assign s15m0AddrReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[16])  assign s16m0AddrReady_int  = s16m0AddrReady;  else assign s16m0AddrReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[0])  assign s0m1AddrReady_int  = s0m1AddrReady;  else assign s0m1AddrReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[1])  assign s1m1AddrReady_int  = s1m1AddrReady;  else assign s1m1AddrReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[2])  assign s2m1AddrReady_int  = s2m1AddrReady;  else assign s2m1AddrReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[3])  assign s3m1AddrReady_int  = s3m1AddrReady;  else assign s3m1AddrReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[4])  assign s4m1AddrReady_int  = s4m1AddrReady;  else assign s4m1AddrReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[5])  assign s5m1AddrReady_int  = s5m1AddrReady;  else assign s5m1AddrReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[6])  assign s6m1AddrReady_int  = s6m1AddrReady;  else assign s6m1AddrReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[7])  assign s7m1AddrReady_int  = s7m1AddrReady;  else assign s7m1AddrReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[8])  assign s8m1AddrReady_int  = s8m1AddrReady;  else assign s8m1AddrReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[9])  assign s9m1AddrReady_int  = s9m1AddrReady;  else assign s9m1AddrReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[10])  assign s10m1AddrReady_int  = s10m1AddrReady;  else assign s10m1AddrReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[11])  assign s11m1AddrReady_int  = s11m1AddrReady;  else assign s11m1AddrReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[12])  assign s12m1AddrReady_int  = s12m1AddrReady;  else assign s12m1AddrReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[13])  assign s13m1AddrReady_int  = s13m1AddrReady;  else assign s13m1AddrReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[14])  assign s14m1AddrReady_int  = s14m1AddrReady;  else assign s14m1AddrReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[15])  assign s15m1AddrReady_int  = s15m1AddrReady;  else assign s15m1AddrReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[16])  assign s16m1AddrReady_int  = s16m1AddrReady;  else assign s16m1AddrReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[0])  assign s0m2AddrReady_int  = s0m2AddrReady;  else assign s0m2AddrReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[1])  assign s1m2AddrReady_int  = s1m2AddrReady;  else assign s1m2AddrReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[2])  assign s2m2AddrReady_int  = s2m2AddrReady;  else assign s2m2AddrReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[3])  assign s3m2AddrReady_int  = s3m2AddrReady;  else assign s3m2AddrReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[4])  assign s4m2AddrReady_int  = s4m2AddrReady;  else assign s4m2AddrReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[5])  assign s5m2AddrReady_int  = s5m2AddrReady;  else assign s5m2AddrReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[6])  assign s6m2AddrReady_int  = s6m2AddrReady;  else assign s6m2AddrReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[7])  assign s7m2AddrReady_int  = s7m2AddrReady;  else assign s7m2AddrReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[8])  assign s8m2AddrReady_int  = s8m2AddrReady;  else assign s8m2AddrReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[9])  assign s9m2AddrReady_int  = s9m2AddrReady;  else assign s9m2AddrReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[10])  assign s10m2AddrReady_int  = s10m2AddrReady;  else assign s10m2AddrReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[11])  assign s11m2AddrReady_int  = s11m2AddrReady;  else assign s11m2AddrReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[12])  assign s12m2AddrReady_int  = s12m2AddrReady;  else assign s12m2AddrReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[13])  assign s13m2AddrReady_int  = s13m2AddrReady;  else assign s13m2AddrReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[14])  assign s14m2AddrReady_int  = s14m2AddrReady;  else assign s14m2AddrReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[15])  assign s15m2AddrReady_int  = s15m2AddrReady;  else assign s15m2AddrReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[16])  assign s16m2AddrReady_int  = s16m2AddrReady;  else assign s16m2AddrReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[0])  assign s0m3AddrReady_int  = s0m3AddrReady;  else assign s0m3AddrReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[1])  assign s1m3AddrReady_int  = s1m3AddrReady;  else assign s1m3AddrReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[2])  assign s2m3AddrReady_int  = s2m3AddrReady;  else assign s2m3AddrReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[3])  assign s3m3AddrReady_int  = s3m3AddrReady;  else assign s3m3AddrReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[4])  assign s4m3AddrReady_int  = s4m3AddrReady;  else assign s4m3AddrReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[5])  assign s5m3AddrReady_int  = s5m3AddrReady;  else assign s5m3AddrReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[6])  assign s6m3AddrReady_int  = s6m3AddrReady;  else assign s6m3AddrReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[7])  assign s7m3AddrReady_int  = s7m3AddrReady;  else assign s7m3AddrReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[8])  assign s8m3AddrReady_int  = s8m3AddrReady;  else assign s8m3AddrReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[9])  assign s9m3AddrReady_int  = s9m3AddrReady;  else assign s9m3AddrReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[10])  assign s10m3AddrReady_int  = s10m3AddrReady;  else assign s10m3AddrReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[11])  assign s11m3AddrReady_int  = s11m3AddrReady;  else assign s11m3AddrReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[12])  assign s12m3AddrReady_int  = s12m3AddrReady;  else assign s12m3AddrReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[13])  assign s13m3AddrReady_int  = s13m3AddrReady;  else assign s13m3AddrReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[14])  assign s14m3AddrReady_int  = s14m3AddrReady;  else assign s14m3AddrReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[15])  assign s15m3AddrReady_int  = s15m3AddrReady;  else assign s15m3AddrReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[16])  assign s16m3AddrReady_int  = s16m3AddrReady;  else assign s16m3AddrReady_int = 1'b1;
  endgenerate
  generate
    if (M0_AHBSLOTENABLE[0])  assign s0m0DataReady_int  = s0m0DataReady;  else assign s0m0DataReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[1])  assign s1m0DataReady_int  = s1m0DataReady;  else assign s1m0DataReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[2])  assign s2m0DataReady_int  = s2m0DataReady;  else assign s2m0DataReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[3])  assign s3m0DataReady_int  = s3m0DataReady;  else assign s3m0DataReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[4])  assign s4m0DataReady_int  = s4m0DataReady;  else assign s4m0DataReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[5])  assign s5m0DataReady_int  = s5m0DataReady;  else assign s5m0DataReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[6])  assign s6m0DataReady_int  = s6m0DataReady;  else assign s6m0DataReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[7])  assign s7m0DataReady_int  = s7m0DataReady;  else assign s7m0DataReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[8])  assign s8m0DataReady_int  = s8m0DataReady;  else assign s8m0DataReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[9])  assign s9m0DataReady_int  = s9m0DataReady;  else assign s9m0DataReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[10])  assign s10m0DataReady_int  = s10m0DataReady;  else assign s10m0DataReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[11])  assign s11m0DataReady_int  = s11m0DataReady;  else assign s11m0DataReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[12])  assign s12m0DataReady_int  = s12m0DataReady;  else assign s12m0DataReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[13])  assign s13m0DataReady_int  = s13m0DataReady;  else assign s13m0DataReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[14])  assign s14m0DataReady_int  = s14m0DataReady;  else assign s14m0DataReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[15])  assign s15m0DataReady_int  = s15m0DataReady;  else assign s15m0DataReady_int = 1'b1;
    if (M0_AHBSLOTENABLE[16])  assign s16m0DataReady_int  = s16m0DataReady;  else assign s16m0DataReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[0])  assign s0m1DataReady_int  = s0m1DataReady;  else assign s0m1DataReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[1])  assign s1m1DataReady_int  = s1m1DataReady;  else assign s1m1DataReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[2])  assign s2m1DataReady_int  = s2m1DataReady;  else assign s2m1DataReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[3])  assign s3m1DataReady_int  = s3m1DataReady;  else assign s3m1DataReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[4])  assign s4m1DataReady_int  = s4m1DataReady;  else assign s4m1DataReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[5])  assign s5m1DataReady_int  = s5m1DataReady;  else assign s5m1DataReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[6])  assign s6m1DataReady_int  = s6m1DataReady;  else assign s6m1DataReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[7])  assign s7m1DataReady_int  = s7m1DataReady;  else assign s7m1DataReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[8])  assign s8m1DataReady_int  = s8m1DataReady;  else assign s8m1DataReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[9])  assign s9m1DataReady_int  = s9m1DataReady;  else assign s9m1DataReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[10])  assign s10m1DataReady_int  = s10m1DataReady;  else assign s10m1DataReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[11])  assign s11m1DataReady_int  = s11m1DataReady;  else assign s11m1DataReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[12])  assign s12m1DataReady_int  = s12m1DataReady;  else assign s12m1DataReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[13])  assign s13m1DataReady_int  = s13m1DataReady;  else assign s13m1DataReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[14])  assign s14m1DataReady_int  = s14m1DataReady;  else assign s14m1DataReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[15])  assign s15m1DataReady_int  = s15m1DataReady;  else assign s15m1DataReady_int = 1'b1;
    if (M1_AHBSLOTENABLE[16])  assign s16m1DataReady_int  = s16m1DataReady;  else assign s16m1DataReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[0])  assign s0m2DataReady_int  = s0m2DataReady;  else assign s0m2DataReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[1])  assign s1m2DataReady_int  = s1m2DataReady;  else assign s1m2DataReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[2])  assign s2m2DataReady_int  = s2m2DataReady;  else assign s2m2DataReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[3])  assign s3m2DataReady_int  = s3m2DataReady;  else assign s3m2DataReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[4])  assign s4m2DataReady_int  = s4m2DataReady;  else assign s4m2DataReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[5])  assign s5m2DataReady_int  = s5m2DataReady;  else assign s5m2DataReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[6])  assign s6m2DataReady_int  = s6m2DataReady;  else assign s6m2DataReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[7])  assign s7m2DataReady_int  = s7m2DataReady;  else assign s7m2DataReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[8])  assign s8m2DataReady_int  = s8m2DataReady;  else assign s8m2DataReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[9])  assign s9m2DataReady_int  = s9m2DataReady;  else assign s9m2DataReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[10])  assign s10m2DataReady_int  = s10m2DataReady;  else assign s10m2DataReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[11])  assign s11m2DataReady_int  = s11m2DataReady;  else assign s11m2DataReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[12])  assign s12m2DataReady_int  = s12m2DataReady;  else assign s12m2DataReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[13])  assign s13m2DataReady_int  = s13m2DataReady;  else assign s13m2DataReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[14])  assign s14m2DataReady_int  = s14m2DataReady;  else assign s14m2DataReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[15])  assign s15m2DataReady_int  = s15m2DataReady;  else assign s15m2DataReady_int = 1'b1;
    if (M2_AHBSLOTENABLE[16])  assign s16m2DataReady_int  = s16m2DataReady;  else assign s16m2DataReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[0])  assign s0m3DataReady_int  = s0m3DataReady;  else assign s0m3DataReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[1])  assign s1m3DataReady_int  = s1m3DataReady;  else assign s1m3DataReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[2])  assign s2m3DataReady_int  = s2m3DataReady;  else assign s2m3DataReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[3])  assign s3m3DataReady_int  = s3m3DataReady;  else assign s3m3DataReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[4])  assign s4m3DataReady_int  = s4m3DataReady;  else assign s4m3DataReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[5])  assign s5m3DataReady_int  = s5m3DataReady;  else assign s5m3DataReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[6])  assign s6m3DataReady_int  = s6m3DataReady;  else assign s6m3DataReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[7])  assign s7m3DataReady_int  = s7m3DataReady;  else assign s7m3DataReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[8])  assign s8m3DataReady_int  = s8m3DataReady;  else assign s8m3DataReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[9])  assign s9m3DataReady_int  = s9m3DataReady;  else assign s9m3DataReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[10])  assign s10m3DataReady_int  = s10m3DataReady;  else assign s10m3DataReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[11])  assign s11m3DataReady_int  = s11m3DataReady;  else assign s11m3DataReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[12])  assign s12m3DataReady_int  = s12m3DataReady;  else assign s12m3DataReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[13])  assign s13m3DataReady_int  = s13m3DataReady;  else assign s13m3DataReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[14])  assign s14m3DataReady_int  = s14m3DataReady;  else assign s14m3DataReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[15])  assign s15m3DataReady_int  = s15m3DataReady;  else assign s15m3DataReady_int = 1'b1;
    if (M3_AHBSLOTENABLE[16])  assign s16m3DataReady_int  = s16m3DataReady;  else assign s16m3DataReady_int = 1'b1;
  endgenerate
  generate
    if (M0_AHBSLOTENABLE[0])  assign s0m0HResp_int  = s0m0HResp;  else assign s0m0HResp_int = 1'b0;
    if (M0_AHBSLOTENABLE[1])  assign s1m0HResp_int  = s1m0HResp;  else assign s1m0HResp_int = 1'b0;
    if (M0_AHBSLOTENABLE[2])  assign s2m0HResp_int  = s2m0HResp;  else assign s2m0HResp_int = 1'b0;
    if (M0_AHBSLOTENABLE[3])  assign s3m0HResp_int  = s3m0HResp;  else assign s3m0HResp_int = 1'b0;
    if (M0_AHBSLOTENABLE[4])  assign s4m0HResp_int  = s4m0HResp;  else assign s4m0HResp_int = 1'b0;
    if (M0_AHBSLOTENABLE[5])  assign s5m0HResp_int  = s5m0HResp;  else assign s5m0HResp_int = 1'b0;
    if (M0_AHBSLOTENABLE[6])  assign s6m0HResp_int  = s6m0HResp;  else assign s6m0HResp_int = 1'b0;
    if (M0_AHBSLOTENABLE[7])  assign s7m0HResp_int  = s7m0HResp;  else assign s7m0HResp_int = 1'b0;
    if (M0_AHBSLOTENABLE[8])  assign s8m0HResp_int  = s8m0HResp;  else assign s8m0HResp_int = 1'b0;
    if (M0_AHBSLOTENABLE[9])  assign s9m0HResp_int  = s9m0HResp;  else assign s9m0HResp_int = 1'b0;
    if (M0_AHBSLOTENABLE[10])  assign s10m0HResp_int  = s10m0HResp;  else assign s10m0HResp_int = 1'b0;
    if (M0_AHBSLOTENABLE[11])  assign s11m0HResp_int  = s11m0HResp;  else assign s11m0HResp_int = 1'b0;
    if (M0_AHBSLOTENABLE[12])  assign s12m0HResp_int  = s12m0HResp;  else assign s12m0HResp_int = 1'b0;
    if (M0_AHBSLOTENABLE[13])  assign s13m0HResp_int  = s13m0HResp;  else assign s13m0HResp_int = 1'b0;
    if (M0_AHBSLOTENABLE[14])  assign s14m0HResp_int  = s14m0HResp;  else assign s14m0HResp_int = 1'b0;
    if (M0_AHBSLOTENABLE[15])  assign s15m0HResp_int  = s15m0HResp;  else assign s15m0HResp_int = 1'b0;
    if (M0_AHBSLOTENABLE[16])  assign s16m0HResp_int  = s16m0HResp;  else assign s16m0HResp_int = 1'b0;
    if (M1_AHBSLOTENABLE[0])  assign s0m1HResp_int  = s0m1HResp;  else assign s0m1HResp_int = 1'b0;
    if (M1_AHBSLOTENABLE[1])  assign s1m1HResp_int  = s1m1HResp;  else assign s1m1HResp_int = 1'b0;
    if (M1_AHBSLOTENABLE[2])  assign s2m1HResp_int  = s2m1HResp;  else assign s2m1HResp_int = 1'b0;
    if (M1_AHBSLOTENABLE[3])  assign s3m1HResp_int  = s3m1HResp;  else assign s3m1HResp_int = 1'b0;
    if (M1_AHBSLOTENABLE[4])  assign s4m1HResp_int  = s4m1HResp;  else assign s4m1HResp_int = 1'b0;
    if (M1_AHBSLOTENABLE[5])  assign s5m1HResp_int  = s5m1HResp;  else assign s5m1HResp_int = 1'b0;
    if (M1_AHBSLOTENABLE[6])  assign s6m1HResp_int  = s6m1HResp;  else assign s6m1HResp_int = 1'b0;
    if (M1_AHBSLOTENABLE[7])  assign s7m1HResp_int  = s7m1HResp;  else assign s7m1HResp_int = 1'b0;
    if (M1_AHBSLOTENABLE[8])  assign s8m1HResp_int  = s8m1HResp;  else assign s8m1HResp_int = 1'b0;
    if (M1_AHBSLOTENABLE[9])  assign s9m1HResp_int  = s9m1HResp;  else assign s9m1HResp_int = 1'b0;
    if (M1_AHBSLOTENABLE[10])  assign s10m1HResp_int  = s10m1HResp;  else assign s10m1HResp_int = 1'b0;
    if (M1_AHBSLOTENABLE[11])  assign s11m1HResp_int  = s11m1HResp;  else assign s11m1HResp_int = 1'b0;
    if (M1_AHBSLOTENABLE[12])  assign s12m1HResp_int  = s12m1HResp;  else assign s12m1HResp_int = 1'b0;
    if (M1_AHBSLOTENABLE[13])  assign s13m1HResp_int  = s13m1HResp;  else assign s13m1HResp_int = 1'b0;
    if (M1_AHBSLOTENABLE[14])  assign s14m1HResp_int  = s14m1HResp;  else assign s14m1HResp_int = 1'b0;
    if (M1_AHBSLOTENABLE[15])  assign s15m1HResp_int  = s15m1HResp;  else assign s15m1HResp_int = 1'b0;
    if (M1_AHBSLOTENABLE[16])  assign s16m1HResp_int  = s16m1HResp;  else assign s16m1HResp_int = 1'b0;
    if (M2_AHBSLOTENABLE[0])  assign s0m2HResp_int  = s0m2HResp;  else assign s0m2HResp_int = 1'b0;
    if (M2_AHBSLOTENABLE[1])  assign s1m2HResp_int  = s1m2HResp;  else assign s1m2HResp_int = 1'b0;
    if (M2_AHBSLOTENABLE[2])  assign s2m2HResp_int  = s2m2HResp;  else assign s2m2HResp_int = 1'b0;
    if (M2_AHBSLOTENABLE[3])  assign s3m2HResp_int  = s3m2HResp;  else assign s3m2HResp_int = 1'b0;
    if (M2_AHBSLOTENABLE[4])  assign s4m2HResp_int  = s4m2HResp;  else assign s4m2HResp_int = 1'b0;
    if (M2_AHBSLOTENABLE[5])  assign s5m2HResp_int  = s5m2HResp;  else assign s5m2HResp_int = 1'b0;
    if (M2_AHBSLOTENABLE[6])  assign s6m2HResp_int  = s6m2HResp;  else assign s6m2HResp_int = 1'b0;
    if (M2_AHBSLOTENABLE[7])  assign s7m2HResp_int  = s7m2HResp;  else assign s7m2HResp_int = 1'b0;
    if (M2_AHBSLOTENABLE[8])  assign s8m2HResp_int  = s8m2HResp;  else assign s8m2HResp_int = 1'b0;
    if (M2_AHBSLOTENABLE[9])  assign s9m2HResp_int  = s9m2HResp;  else assign s9m2HResp_int = 1'b0;
    if (M2_AHBSLOTENABLE[10])  assign s10m2HResp_int  = s10m2HResp;  else assign s10m2HResp_int = 1'b0;
    if (M2_AHBSLOTENABLE[11])  assign s11m2HResp_int  = s11m2HResp;  else assign s11m2HResp_int = 1'b0;
    if (M2_AHBSLOTENABLE[12])  assign s12m2HResp_int  = s12m2HResp;  else assign s12m2HResp_int = 1'b0;
    if (M2_AHBSLOTENABLE[13])  assign s13m2HResp_int  = s13m2HResp;  else assign s13m2HResp_int = 1'b0;
    if (M2_AHBSLOTENABLE[14])  assign s14m2HResp_int  = s14m2HResp;  else assign s14m2HResp_int = 1'b0;
    if (M2_AHBSLOTENABLE[15])  assign s15m2HResp_int  = s15m2HResp;  else assign s15m2HResp_int = 1'b0;
    if (M2_AHBSLOTENABLE[16])  assign s16m2HResp_int  = s16m2HResp;  else assign s16m2HResp_int = 1'b0;
    if (M3_AHBSLOTENABLE[0])  assign s0m3HResp_int  = s0m3HResp;  else assign s0m3HResp_int = 1'b0;
    if (M3_AHBSLOTENABLE[1])  assign s1m3HResp_int  = s1m3HResp;  else assign s1m3HResp_int = 1'b0;
    if (M3_AHBSLOTENABLE[2])  assign s2m3HResp_int  = s2m3HResp;  else assign s2m3HResp_int = 1'b0;
    if (M3_AHBSLOTENABLE[3])  assign s3m3HResp_int  = s3m3HResp;  else assign s3m3HResp_int = 1'b0;
    if (M3_AHBSLOTENABLE[4])  assign s4m3HResp_int  = s4m3HResp;  else assign s4m3HResp_int = 1'b0;
    if (M3_AHBSLOTENABLE[5])  assign s5m3HResp_int  = s5m3HResp;  else assign s5m3HResp_int = 1'b0;
    if (M3_AHBSLOTENABLE[6])  assign s6m3HResp_int  = s6m3HResp;  else assign s6m3HResp_int = 1'b0;
    if (M3_AHBSLOTENABLE[7])  assign s7m3HResp_int  = s7m3HResp;  else assign s7m3HResp_int = 1'b0;
    if (M3_AHBSLOTENABLE[8])  assign s8m3HResp_int  = s8m3HResp;  else assign s8m3HResp_int = 1'b0;
    if (M3_AHBSLOTENABLE[9])  assign s9m3HResp_int  = s9m3HResp;  else assign s9m3HResp_int = 1'b0;
    if (M3_AHBSLOTENABLE[10])  assign s10m3HResp_int  = s10m3HResp;  else assign s10m3HResp_int = 1'b0;
    if (M3_AHBSLOTENABLE[11])  assign s11m3HResp_int  = s11m3HResp;  else assign s11m3HResp_int = 1'b0;
    if (M3_AHBSLOTENABLE[12])  assign s12m3HResp_int  = s12m3HResp;  else assign s12m3HResp_int = 1'b0;
    if (M3_AHBSLOTENABLE[13])  assign s13m3HResp_int  = s13m3HResp;  else assign s13m3HResp_int = 1'b0;
    if (M3_AHBSLOTENABLE[14])  assign s14m3HResp_int  = s14m3HResp;  else assign s14m3HResp_int = 1'b0;
    if (M3_AHBSLOTENABLE[15])  assign s15m3HResp_int  = s15m3HResp;  else assign s15m3HResp_int = 1'b0;
    if (M3_AHBSLOTENABLE[16])  assign s16m3HResp_int  = s16m3HResp;  else assign s16m3HResp_int = 1'b0;
  endgenerate
  generate
    if (M0_AHBSLOTENABLE[0])  assign m0s0AddrSel_int  = m0s0AddrSel;  else assign m0s0AddrSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[1])  assign m0s1AddrSel_int  = m0s1AddrSel;  else assign m0s1AddrSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[2])  assign m0s2AddrSel_int  = m0s2AddrSel;  else assign m0s2AddrSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[3])  assign m0s3AddrSel_int  = m0s3AddrSel;  else assign m0s3AddrSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[4])  assign m0s4AddrSel_int  = m0s4AddrSel;  else assign m0s4AddrSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[5])  assign m0s5AddrSel_int  = m0s5AddrSel;  else assign m0s5AddrSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[6])  assign m0s6AddrSel_int  = m0s6AddrSel;  else assign m0s6AddrSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[7])  assign m0s7AddrSel_int  = m0s7AddrSel;  else assign m0s7AddrSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[8])  assign m0s8AddrSel_int  = m0s8AddrSel;  else assign m0s8AddrSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[9])  assign m0s9AddrSel_int  = m0s9AddrSel;  else assign m0s9AddrSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[10])  assign m0s10AddrSel_int  = m0s10AddrSel;  else assign m0s10AddrSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[11])  assign m0s11AddrSel_int  = m0s11AddrSel;  else assign m0s11AddrSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[12])  assign m0s12AddrSel_int  = m0s12AddrSel;  else assign m0s12AddrSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[13])  assign m0s13AddrSel_int  = m0s13AddrSel;  else assign m0s13AddrSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[14])  assign m0s14AddrSel_int  = m0s14AddrSel;  else assign m0s14AddrSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[15])  assign m0s15AddrSel_int  = m0s15AddrSel;  else assign m0s15AddrSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[16])  assign m0s16AddrSel_int  = m0s16AddrSel;  else assign m0s16AddrSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[0])  assign m1s0AddrSel_int  = m1s0AddrSel;  else assign m1s0AddrSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[1])  assign m1s1AddrSel_int  = m1s1AddrSel;  else assign m1s1AddrSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[2])  assign m1s2AddrSel_int  = m1s2AddrSel;  else assign m1s2AddrSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[3])  assign m1s3AddrSel_int  = m1s3AddrSel;  else assign m1s3AddrSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[4])  assign m1s4AddrSel_int  = m1s4AddrSel;  else assign m1s4AddrSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[5])  assign m1s5AddrSel_int  = m1s5AddrSel;  else assign m1s5AddrSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[6])  assign m1s6AddrSel_int  = m1s6AddrSel;  else assign m1s6AddrSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[7])  assign m1s7AddrSel_int  = m1s7AddrSel;  else assign m1s7AddrSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[8])  assign m1s8AddrSel_int  = m1s8AddrSel;  else assign m1s8AddrSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[9])  assign m1s9AddrSel_int  = m1s9AddrSel;  else assign m1s9AddrSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[10])  assign m1s10AddrSel_int  = m1s10AddrSel;  else assign m1s10AddrSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[11])  assign m1s11AddrSel_int  = m1s11AddrSel;  else assign m1s11AddrSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[12])  assign m1s12AddrSel_int  = m1s12AddrSel;  else assign m1s12AddrSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[13])  assign m1s13AddrSel_int  = m1s13AddrSel;  else assign m1s13AddrSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[14])  assign m1s14AddrSel_int  = m1s14AddrSel;  else assign m1s14AddrSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[15])  assign m1s15AddrSel_int  = m1s15AddrSel;  else assign m1s15AddrSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[16])  assign m1s16AddrSel_int  = m1s16AddrSel;  else assign m1s16AddrSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[0])  assign m2s0AddrSel_int  = m2s0AddrSel;  else assign m2s0AddrSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[1])  assign m2s1AddrSel_int  = m2s1AddrSel;  else assign m2s1AddrSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[2])  assign m2s2AddrSel_int  = m2s2AddrSel;  else assign m2s2AddrSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[3])  assign m2s3AddrSel_int  = m2s3AddrSel;  else assign m2s3AddrSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[4])  assign m2s4AddrSel_int  = m2s4AddrSel;  else assign m2s4AddrSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[5])  assign m2s5AddrSel_int  = m2s5AddrSel;  else assign m2s5AddrSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[6])  assign m2s6AddrSel_int  = m2s6AddrSel;  else assign m2s6AddrSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[7])  assign m2s7AddrSel_int  = m2s7AddrSel;  else assign m2s7AddrSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[8])  assign m2s8AddrSel_int  = m2s8AddrSel;  else assign m2s8AddrSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[9])  assign m2s9AddrSel_int  = m2s9AddrSel;  else assign m2s9AddrSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[10])  assign m2s10AddrSel_int  = m2s10AddrSel;  else assign m2s10AddrSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[11])  assign m2s11AddrSel_int  = m2s11AddrSel;  else assign m2s11AddrSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[12])  assign m2s12AddrSel_int  = m2s12AddrSel;  else assign m2s12AddrSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[13])  assign m2s13AddrSel_int  = m2s13AddrSel;  else assign m2s13AddrSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[14])  assign m2s14AddrSel_int  = m2s14AddrSel;  else assign m2s14AddrSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[15])  assign m2s15AddrSel_int  = m2s15AddrSel;  else assign m2s15AddrSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[16])  assign m2s16AddrSel_int  = m2s16AddrSel;  else assign m2s16AddrSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[0])  assign m3s0AddrSel_int  = m3s0AddrSel;  else assign m3s0AddrSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[1])  assign m3s1AddrSel_int  = m3s1AddrSel;  else assign m3s1AddrSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[2])  assign m3s2AddrSel_int  = m3s2AddrSel;  else assign m3s2AddrSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[3])  assign m3s3AddrSel_int  = m3s3AddrSel;  else assign m3s3AddrSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[4])  assign m3s4AddrSel_int  = m3s4AddrSel;  else assign m3s4AddrSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[5])  assign m3s5AddrSel_int  = m3s5AddrSel;  else assign m3s5AddrSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[6])  assign m3s6AddrSel_int  = m3s6AddrSel;  else assign m3s6AddrSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[7])  assign m3s7AddrSel_int  = m3s7AddrSel;  else assign m3s7AddrSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[8])  assign m3s8AddrSel_int  = m3s8AddrSel;  else assign m3s8AddrSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[9])  assign m3s9AddrSel_int  = m3s9AddrSel;  else assign m3s9AddrSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[10])  assign m3s10AddrSel_int  = m3s10AddrSel;  else assign m3s10AddrSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[11])  assign m3s11AddrSel_int  = m3s11AddrSel;  else assign m3s11AddrSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[12])  assign m3s12AddrSel_int  = m3s12AddrSel;  else assign m3s12AddrSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[13])  assign m3s13AddrSel_int  = m3s13AddrSel;  else assign m3s13AddrSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[14])  assign m3s14AddrSel_int  = m3s14AddrSel;  else assign m3s14AddrSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[15])  assign m3s15AddrSel_int  = m3s15AddrSel;  else assign m3s15AddrSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[16])  assign m3s16AddrSel_int  = m3s16AddrSel;  else assign m3s16AddrSel_int = 1'b0;
  endgenerate
  generate
    if (M0_AHBSLOTENABLE[0])  assign m0s0DataSel_int  = m0s0DataSel;  else assign m0s0DataSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[1])  assign m0s1DataSel_int  = m0s1DataSel;  else assign m0s1DataSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[2])  assign m0s2DataSel_int  = m0s2DataSel;  else assign m0s2DataSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[3])  assign m0s3DataSel_int  = m0s3DataSel;  else assign m0s3DataSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[4])  assign m0s4DataSel_int  = m0s4DataSel;  else assign m0s4DataSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[5])  assign m0s5DataSel_int  = m0s5DataSel;  else assign m0s5DataSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[6])  assign m0s6DataSel_int  = m0s6DataSel;  else assign m0s6DataSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[7])  assign m0s7DataSel_int  = m0s7DataSel;  else assign m0s7DataSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[8])  assign m0s8DataSel_int  = m0s8DataSel;  else assign m0s8DataSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[9])  assign m0s9DataSel_int  = m0s9DataSel;  else assign m0s9DataSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[10])  assign m0s10DataSel_int  = m0s10DataSel;  else assign m0s10DataSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[11])  assign m0s11DataSel_int  = m0s11DataSel;  else assign m0s11DataSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[12])  assign m0s12DataSel_int  = m0s12DataSel;  else assign m0s12DataSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[13])  assign m0s13DataSel_int  = m0s13DataSel;  else assign m0s13DataSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[14])  assign m0s14DataSel_int  = m0s14DataSel;  else assign m0s14DataSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[15])  assign m0s15DataSel_int  = m0s15DataSel;  else assign m0s15DataSel_int = 1'b0;
    if (M0_AHBSLOTENABLE[16])  assign m0s16DataSel_int  = m0s16DataSel;  else assign m0s16DataSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[0])  assign m1s0DataSel_int  = m1s0DataSel;  else assign m1s0DataSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[1])  assign m1s1DataSel_int  = m1s1DataSel;  else assign m1s1DataSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[2])  assign m1s2DataSel_int  = m1s2DataSel;  else assign m1s2DataSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[3])  assign m1s3DataSel_int  = m1s3DataSel;  else assign m1s3DataSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[4])  assign m1s4DataSel_int  = m1s4DataSel;  else assign m1s4DataSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[5])  assign m1s5DataSel_int  = m1s5DataSel;  else assign m1s5DataSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[6])  assign m1s6DataSel_int  = m1s6DataSel;  else assign m1s6DataSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[7])  assign m1s7DataSel_int  = m1s7DataSel;  else assign m1s7DataSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[8])  assign m1s8DataSel_int  = m1s8DataSel;  else assign m1s8DataSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[9])  assign m1s9DataSel_int  = m1s9DataSel;  else assign m1s9DataSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[10])  assign m1s10DataSel_int  = m1s10DataSel;  else assign m1s10DataSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[11])  assign m1s11DataSel_int  = m1s11DataSel;  else assign m1s11DataSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[12])  assign m1s12DataSel_int  = m1s12DataSel;  else assign m1s12DataSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[13])  assign m1s13DataSel_int  = m1s13DataSel;  else assign m1s13DataSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[14])  assign m1s14DataSel_int  = m1s14DataSel;  else assign m1s14DataSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[15])  assign m1s15DataSel_int  = m1s15DataSel;  else assign m1s15DataSel_int = 1'b0;
    if (M1_AHBSLOTENABLE[16])  assign m1s16DataSel_int  = m1s16DataSel;  else assign m1s16DataSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[0])  assign m2s0DataSel_int  = m2s0DataSel;  else assign m2s0DataSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[1])  assign m2s1DataSel_int  = m2s1DataSel;  else assign m2s1DataSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[2])  assign m2s2DataSel_int  = m2s2DataSel;  else assign m2s2DataSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[3])  assign m2s3DataSel_int  = m2s3DataSel;  else assign m2s3DataSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[4])  assign m2s4DataSel_int  = m2s4DataSel;  else assign m2s4DataSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[5])  assign m2s5DataSel_int  = m2s5DataSel;  else assign m2s5DataSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[6])  assign m2s6DataSel_int  = m2s6DataSel;  else assign m2s6DataSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[7])  assign m2s7DataSel_int  = m2s7DataSel;  else assign m2s7DataSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[8])  assign m2s8DataSel_int  = m2s8DataSel;  else assign m2s8DataSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[9])  assign m2s9DataSel_int  = m2s9DataSel;  else assign m2s9DataSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[10])  assign m2s10DataSel_int  = m2s10DataSel;  else assign m2s10DataSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[11])  assign m2s11DataSel_int  = m2s11DataSel;  else assign m2s11DataSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[12])  assign m2s12DataSel_int  = m2s12DataSel;  else assign m2s12DataSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[13])  assign m2s13DataSel_int  = m2s13DataSel;  else assign m2s13DataSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[14])  assign m2s14DataSel_int  = m2s14DataSel;  else assign m2s14DataSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[15])  assign m2s15DataSel_int  = m2s15DataSel;  else assign m2s15DataSel_int = 1'b0;
    if (M2_AHBSLOTENABLE[16])  assign m2s16DataSel_int  = m2s16DataSel;  else assign m2s16DataSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[0])  assign m3s0DataSel_int  = m3s0DataSel;  else assign m3s0DataSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[1])  assign m3s1DataSel_int  = m3s1DataSel;  else assign m3s1DataSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[2])  assign m3s2DataSel_int  = m3s2DataSel;  else assign m3s2DataSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[3])  assign m3s3DataSel_int  = m3s3DataSel;  else assign m3s3DataSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[4])  assign m3s4DataSel_int  = m3s4DataSel;  else assign m3s4DataSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[5])  assign m3s5DataSel_int  = m3s5DataSel;  else assign m3s5DataSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[6])  assign m3s6DataSel_int  = m3s6DataSel;  else assign m3s6DataSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[7])  assign m3s7DataSel_int  = m3s7DataSel;  else assign m3s7DataSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[8])  assign m3s8DataSel_int  = m3s8DataSel;  else assign m3s8DataSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[9])  assign m3s9DataSel_int  = m3s9DataSel;  else assign m3s9DataSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[10])  assign m3s10DataSel_int  = m3s10DataSel;  else assign m3s10DataSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[11])  assign m3s11DataSel_int  = m3s11DataSel;  else assign m3s11DataSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[12])  assign m3s12DataSel_int  = m3s12DataSel;  else assign m3s12DataSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[13])  assign m3s13DataSel_int  = m3s13DataSel;  else assign m3s13DataSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[14])  assign m3s14DataSel_int  = m3s14DataSel;  else assign m3s14DataSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[15])  assign m3s15DataSel_int  = m3s15DataSel;  else assign m3s15DataSel_int = 1'b0;
    if (M3_AHBSLOTENABLE[16])  assign m3s16DataSel_int  = m3s16DataSel;  else assign m3s16DataSel_int = 1'b0;
  endgenerate
  generate
    if (M0_AHBSLOTENABLE[0])  assign m0s0GatedHADDR  = M0GATEDHADDR;  else assign m0s0GatedHADDR = 32'h0;
    if (M0_AHBSLOTENABLE[1])  assign m0s1GatedHADDR  = M0GATEDHADDR;  else assign m0s1GatedHADDR = 32'h0;
    if (M0_AHBSLOTENABLE[2])  assign m0s2GatedHADDR  = M0GATEDHADDR;  else assign m0s2GatedHADDR = 32'h0;
    if (M0_AHBSLOTENABLE[3])  assign m0s3GatedHADDR  = M0GATEDHADDR;  else assign m0s3GatedHADDR = 32'h0;
    if (M0_AHBSLOTENABLE[4])  assign m0s4GatedHADDR  = M0GATEDHADDR;  else assign m0s4GatedHADDR = 32'h0;
    if (M0_AHBSLOTENABLE[5])  assign m0s5GatedHADDR  = M0GATEDHADDR;  else assign m0s5GatedHADDR = 32'h0;
    if (M0_AHBSLOTENABLE[6])  assign m0s6GatedHADDR  = M0GATEDHADDR;  else assign m0s6GatedHADDR = 32'h0;
    if (M0_AHBSLOTENABLE[7])  assign m0s7GatedHADDR  = M0GATEDHADDR;  else assign m0s7GatedHADDR = 32'h0;
    if (M0_AHBSLOTENABLE[8])  assign m0s8GatedHADDR  = M0GATEDHADDR;  else assign m0s8GatedHADDR = 32'h0;
    if (M0_AHBSLOTENABLE[9])  assign m0s9GatedHADDR  = M0GATEDHADDR;  else assign m0s9GatedHADDR = 32'h0;
    if (M0_AHBSLOTENABLE[10])  assign m0s10GatedHADDR  = M0GATEDHADDR;  else assign m0s10GatedHADDR = 32'h0;
    if (M0_AHBSLOTENABLE[11])  assign m0s11GatedHADDR  = M0GATEDHADDR;  else assign m0s11GatedHADDR = 32'h0;
    if (M0_AHBSLOTENABLE[12])  assign m0s12GatedHADDR  = M0GATEDHADDR;  else assign m0s12GatedHADDR = 32'h0;
    if (M0_AHBSLOTENABLE[13])  assign m0s13GatedHADDR  = M0GATEDHADDR;  else assign m0s13GatedHADDR = 32'h0;
    if (M0_AHBSLOTENABLE[14])  assign m0s14GatedHADDR  = M0GATEDHADDR;  else assign m0s14GatedHADDR = 32'h0;
    if (M0_AHBSLOTENABLE[15])  assign m0s15GatedHADDR  = M0GATEDHADDR;  else assign m0s15GatedHADDR = 32'h0;
    if (M0_AHBSLOTENABLE[16])  assign m0s16GatedHADDR  = M0GATEDHADDR;  else assign m0s16GatedHADDR = 32'h0;
    if (M1_AHBSLOTENABLE[0])  assign m1s0GatedHADDR  = M1GATEDHADDR;  else assign m1s0GatedHADDR = 32'h0;
    if (M1_AHBSLOTENABLE[1])  assign m1s1GatedHADDR  = M1GATEDHADDR;  else assign m1s1GatedHADDR = 32'h0;
    if (M1_AHBSLOTENABLE[2])  assign m1s2GatedHADDR  = M1GATEDHADDR;  else assign m1s2GatedHADDR = 32'h0;
    if (M1_AHBSLOTENABLE[3])  assign m1s3GatedHADDR  = M1GATEDHADDR;  else assign m1s3GatedHADDR = 32'h0;
    if (M1_AHBSLOTENABLE[4])  assign m1s4GatedHADDR  = M1GATEDHADDR;  else assign m1s4GatedHADDR = 32'h0;
    if (M1_AHBSLOTENABLE[5])  assign m1s5GatedHADDR  = M1GATEDHADDR;  else assign m1s5GatedHADDR = 32'h0;
    if (M1_AHBSLOTENABLE[6])  assign m1s6GatedHADDR  = M1GATEDHADDR;  else assign m1s6GatedHADDR = 32'h0;
    if (M1_AHBSLOTENABLE[7])  assign m1s7GatedHADDR  = M1GATEDHADDR;  else assign m1s7GatedHADDR = 32'h0;
    if (M1_AHBSLOTENABLE[8])  assign m1s8GatedHADDR  = M1GATEDHADDR;  else assign m1s8GatedHADDR = 32'h0;
    if (M1_AHBSLOTENABLE[9])  assign m1s9GatedHADDR  = M1GATEDHADDR;  else assign m1s9GatedHADDR = 32'h0;
    if (M1_AHBSLOTENABLE[10])  assign m1s10GatedHADDR  = M1GATEDHADDR;  else assign m1s10GatedHADDR = 32'h0;
    if (M1_AHBSLOTENABLE[11])  assign m1s11GatedHADDR  = M1GATEDHADDR;  else assign m1s11GatedHADDR = 32'h0;
    if (M1_AHBSLOTENABLE[12])  assign m1s12GatedHADDR  = M1GATEDHADDR;  else assign m1s12GatedHADDR = 32'h0;
    if (M1_AHBSLOTENABLE[13])  assign m1s13GatedHADDR  = M1GATEDHADDR;  else assign m1s13GatedHADDR = 32'h0;
    if (M1_AHBSLOTENABLE[14])  assign m1s14GatedHADDR  = M1GATEDHADDR;  else assign m1s14GatedHADDR = 32'h0;
    if (M1_AHBSLOTENABLE[15])  assign m1s15GatedHADDR  = M1GATEDHADDR;  else assign m1s15GatedHADDR = 32'h0;
    if (M1_AHBSLOTENABLE[16])  assign m1s16GatedHADDR  = M1GATEDHADDR;  else assign m1s16GatedHADDR = 32'h0;
    if (M2_AHBSLOTENABLE[0])  assign m2s0GatedHADDR  = M2GATEDHADDR;  else assign m2s0GatedHADDR = 32'h0;
    if (M2_AHBSLOTENABLE[1])  assign m2s1GatedHADDR  = M2GATEDHADDR;  else assign m2s1GatedHADDR = 32'h0;
    if (M2_AHBSLOTENABLE[2])  assign m2s2GatedHADDR  = M2GATEDHADDR;  else assign m2s2GatedHADDR = 32'h0;
    if (M2_AHBSLOTENABLE[3])  assign m2s3GatedHADDR  = M2GATEDHADDR;  else assign m2s3GatedHADDR = 32'h0;
    if (M2_AHBSLOTENABLE[4])  assign m2s4GatedHADDR  = M2GATEDHADDR;  else assign m2s4GatedHADDR = 32'h0;
    if (M2_AHBSLOTENABLE[5])  assign m2s5GatedHADDR  = M2GATEDHADDR;  else assign m2s5GatedHADDR = 32'h0;
    if (M2_AHBSLOTENABLE[6])  assign m2s6GatedHADDR  = M2GATEDHADDR;  else assign m2s6GatedHADDR = 32'h0;
    if (M2_AHBSLOTENABLE[7])  assign m2s7GatedHADDR  = M2GATEDHADDR;  else assign m2s7GatedHADDR = 32'h0;
    if (M2_AHBSLOTENABLE[8])  assign m2s8GatedHADDR  = M2GATEDHADDR;  else assign m2s8GatedHADDR = 32'h0;
    if (M2_AHBSLOTENABLE[9])  assign m2s9GatedHADDR  = M2GATEDHADDR;  else assign m2s9GatedHADDR = 32'h0;
    if (M2_AHBSLOTENABLE[10])  assign m2s10GatedHADDR  = M2GATEDHADDR;  else assign m2s10GatedHADDR = 32'h0;
    if (M2_AHBSLOTENABLE[11])  assign m2s11GatedHADDR  = M2GATEDHADDR;  else assign m2s11GatedHADDR = 32'h0;
    if (M2_AHBSLOTENABLE[12])  assign m2s12GatedHADDR  = M2GATEDHADDR;  else assign m2s12GatedHADDR = 32'h0;
    if (M2_AHBSLOTENABLE[13])  assign m2s13GatedHADDR  = M2GATEDHADDR;  else assign m2s13GatedHADDR = 32'h0;
    if (M2_AHBSLOTENABLE[14])  assign m2s14GatedHADDR  = M2GATEDHADDR;  else assign m2s14GatedHADDR = 32'h0;
    if (M2_AHBSLOTENABLE[15])  assign m2s15GatedHADDR  = M2GATEDHADDR;  else assign m2s15GatedHADDR = 32'h0;
    if (M2_AHBSLOTENABLE[16])  assign m2s16GatedHADDR  = M2GATEDHADDR;  else assign m2s16GatedHADDR = 32'h0;
    if (M3_AHBSLOTENABLE[0])  assign m3s0GatedHADDR  = M3GATEDHADDR;  else assign m3s0GatedHADDR = 32'h0;
    if (M3_AHBSLOTENABLE[1])  assign m3s1GatedHADDR  = M3GATEDHADDR;  else assign m3s1GatedHADDR = 32'h0;
    if (M3_AHBSLOTENABLE[2])  assign m3s2GatedHADDR  = M3GATEDHADDR;  else assign m3s2GatedHADDR = 32'h0;
    if (M3_AHBSLOTENABLE[3])  assign m3s3GatedHADDR  = M3GATEDHADDR;  else assign m3s3GatedHADDR = 32'h0;
    if (M3_AHBSLOTENABLE[4])  assign m3s4GatedHADDR  = M3GATEDHADDR;  else assign m3s4GatedHADDR = 32'h0;
    if (M3_AHBSLOTENABLE[5])  assign m3s5GatedHADDR  = M3GATEDHADDR;  else assign m3s5GatedHADDR = 32'h0;
    if (M3_AHBSLOTENABLE[6])  assign m3s6GatedHADDR  = M3GATEDHADDR;  else assign m3s6GatedHADDR = 32'h0;
    if (M3_AHBSLOTENABLE[7])  assign m3s7GatedHADDR  = M3GATEDHADDR;  else assign m3s7GatedHADDR = 32'h0;
    if (M3_AHBSLOTENABLE[8])  assign m3s8GatedHADDR  = M3GATEDHADDR;  else assign m3s8GatedHADDR = 32'h0;
    if (M3_AHBSLOTENABLE[9])  assign m3s9GatedHADDR  = M3GATEDHADDR;  else assign m3s9GatedHADDR = 32'h0;
    if (M3_AHBSLOTENABLE[10])  assign m3s10GatedHADDR  = M3GATEDHADDR;  else assign m3s10GatedHADDR = 32'h0;
    if (M3_AHBSLOTENABLE[11])  assign m3s11GatedHADDR  = M3GATEDHADDR;  else assign m3s11GatedHADDR = 32'h0;
    if (M3_AHBSLOTENABLE[12])  assign m3s12GatedHADDR  = M3GATEDHADDR;  else assign m3s12GatedHADDR = 32'h0;
    if (M3_AHBSLOTENABLE[13])  assign m3s13GatedHADDR  = M3GATEDHADDR;  else assign m3s13GatedHADDR = 32'h0;
    if (M3_AHBSLOTENABLE[14])  assign m3s14GatedHADDR  = M3GATEDHADDR;  else assign m3s14GatedHADDR = 32'h0;
    if (M3_AHBSLOTENABLE[15])  assign m3s15GatedHADDR  = M3GATEDHADDR;  else assign m3s15GatedHADDR = 32'h0;
    if (M3_AHBSLOTENABLE[16])  assign m3s16GatedHADDR  = M3GATEDHADDR;  else assign m3s16GatedHADDR = 32'h0;
  endgenerate
  generate
    if (M0_AHBSLOTENABLE[0])  assign m0s0GatedHMASTLOCK  = M0GATEDHMASTLOCK;  else assign m0s0GatedHMASTLOCK = 1'b0;
    if (M0_AHBSLOTENABLE[1])  assign m0s1GatedHMASTLOCK  = M0GATEDHMASTLOCK;  else assign m0s1GatedHMASTLOCK = 1'b0;
    if (M0_AHBSLOTENABLE[2])  assign m0s2GatedHMASTLOCK  = M0GATEDHMASTLOCK;  else assign m0s2GatedHMASTLOCK = 1'b0;
    if (M0_AHBSLOTENABLE[3])  assign m0s3GatedHMASTLOCK  = M0GATEDHMASTLOCK;  else assign m0s3GatedHMASTLOCK = 1'b0;
    if (M0_AHBSLOTENABLE[4])  assign m0s4GatedHMASTLOCK  = M0GATEDHMASTLOCK;  else assign m0s4GatedHMASTLOCK = 1'b0;
    if (M0_AHBSLOTENABLE[5])  assign m0s5GatedHMASTLOCK  = M0GATEDHMASTLOCK;  else assign m0s5GatedHMASTLOCK = 1'b0;
    if (M0_AHBSLOTENABLE[6])  assign m0s6GatedHMASTLOCK  = M0GATEDHMASTLOCK;  else assign m0s6GatedHMASTLOCK = 1'b0;
    if (M0_AHBSLOTENABLE[7])  assign m0s7GatedHMASTLOCK  = M0GATEDHMASTLOCK;  else assign m0s7GatedHMASTLOCK = 1'b0;
    if (M0_AHBSLOTENABLE[8])  assign m0s8GatedHMASTLOCK  = M0GATEDHMASTLOCK;  else assign m0s8GatedHMASTLOCK = 1'b0;
    if (M0_AHBSLOTENABLE[9])  assign m0s9GatedHMASTLOCK  = M0GATEDHMASTLOCK;  else assign m0s9GatedHMASTLOCK = 1'b0;
    if (M0_AHBSLOTENABLE[10])  assign m0s10GatedHMASTLOCK  = M0GATEDHMASTLOCK;  else assign m0s10GatedHMASTLOCK = 1'b0;
    if (M0_AHBSLOTENABLE[11])  assign m0s11GatedHMASTLOCK  = M0GATEDHMASTLOCK;  else assign m0s11GatedHMASTLOCK = 1'b0;
    if (M0_AHBSLOTENABLE[12])  assign m0s12GatedHMASTLOCK  = M0GATEDHMASTLOCK;  else assign m0s12GatedHMASTLOCK = 1'b0;
    if (M0_AHBSLOTENABLE[13])  assign m0s13GatedHMASTLOCK  = M0GATEDHMASTLOCK;  else assign m0s13GatedHMASTLOCK = 1'b0;
    if (M0_AHBSLOTENABLE[14])  assign m0s14GatedHMASTLOCK  = M0GATEDHMASTLOCK;  else assign m0s14GatedHMASTLOCK = 1'b0;
    if (M0_AHBSLOTENABLE[15])  assign m0s15GatedHMASTLOCK  = M0GATEDHMASTLOCK;  else assign m0s15GatedHMASTLOCK = 1'b0;
    if (M0_AHBSLOTENABLE[16])  assign m0s16GatedHMASTLOCK  = M0GATEDHMASTLOCK;  else assign m0s16GatedHMASTLOCK = 1'b0;
    if (M1_AHBSLOTENABLE[0])  assign m1s0GatedHMASTLOCK  = M1GATEDHMASTLOCK;  else assign m1s0GatedHMASTLOCK = 1'b0;
    if (M1_AHBSLOTENABLE[1])  assign m1s1GatedHMASTLOCK  = M1GATEDHMASTLOCK;  else assign m1s1GatedHMASTLOCK = 1'b0;
    if (M1_AHBSLOTENABLE[2])  assign m1s2GatedHMASTLOCK  = M1GATEDHMASTLOCK;  else assign m1s2GatedHMASTLOCK = 1'b0;
    if (M1_AHBSLOTENABLE[3])  assign m1s3GatedHMASTLOCK  = M1GATEDHMASTLOCK;  else assign m1s3GatedHMASTLOCK = 1'b0;
    if (M1_AHBSLOTENABLE[4])  assign m1s4GatedHMASTLOCK  = M1GATEDHMASTLOCK;  else assign m1s4GatedHMASTLOCK = 1'b0;
    if (M1_AHBSLOTENABLE[5])  assign m1s5GatedHMASTLOCK  = M1GATEDHMASTLOCK;  else assign m1s5GatedHMASTLOCK = 1'b0;
    if (M1_AHBSLOTENABLE[6])  assign m1s6GatedHMASTLOCK  = M1GATEDHMASTLOCK;  else assign m1s6GatedHMASTLOCK = 1'b0;
    if (M1_AHBSLOTENABLE[7])  assign m1s7GatedHMASTLOCK  = M1GATEDHMASTLOCK;  else assign m1s7GatedHMASTLOCK = 1'b0;
    if (M1_AHBSLOTENABLE[8])  assign m1s8GatedHMASTLOCK  = M1GATEDHMASTLOCK;  else assign m1s8GatedHMASTLOCK = 1'b0;
    if (M1_AHBSLOTENABLE[9])  assign m1s9GatedHMASTLOCK  = M1GATEDHMASTLOCK;  else assign m1s9GatedHMASTLOCK = 1'b0;
    if (M1_AHBSLOTENABLE[10])  assign m1s10GatedHMASTLOCK  = M1GATEDHMASTLOCK;  else assign m1s10GatedHMASTLOCK = 1'b0;
    if (M1_AHBSLOTENABLE[11])  assign m1s11GatedHMASTLOCK  = M1GATEDHMASTLOCK;  else assign m1s11GatedHMASTLOCK = 1'b0;
    if (M1_AHBSLOTENABLE[12])  assign m1s12GatedHMASTLOCK  = M1GATEDHMASTLOCK;  else assign m1s12GatedHMASTLOCK = 1'b0;
    if (M1_AHBSLOTENABLE[13])  assign m1s13GatedHMASTLOCK  = M1GATEDHMASTLOCK;  else assign m1s13GatedHMASTLOCK = 1'b0;
    if (M1_AHBSLOTENABLE[14])  assign m1s14GatedHMASTLOCK  = M1GATEDHMASTLOCK;  else assign m1s14GatedHMASTLOCK = 1'b0;
    if (M1_AHBSLOTENABLE[15])  assign m1s15GatedHMASTLOCK  = M1GATEDHMASTLOCK;  else assign m1s15GatedHMASTLOCK = 1'b0;
    if (M1_AHBSLOTENABLE[16])  assign m1s16GatedHMASTLOCK  = M1GATEDHMASTLOCK;  else assign m1s16GatedHMASTLOCK = 1'b0;
    if (M2_AHBSLOTENABLE[0])  assign m2s0GatedHMASTLOCK  = M2GATEDHMASTLOCK;  else assign m2s0GatedHMASTLOCK = 1'b0;
    if (M2_AHBSLOTENABLE[1])  assign m2s1GatedHMASTLOCK  = M2GATEDHMASTLOCK;  else assign m2s1GatedHMASTLOCK = 1'b0;
    if (M2_AHBSLOTENABLE[2])  assign m2s2GatedHMASTLOCK  = M2GATEDHMASTLOCK;  else assign m2s2GatedHMASTLOCK = 1'b0;
    if (M2_AHBSLOTENABLE[3])  assign m2s3GatedHMASTLOCK  = M2GATEDHMASTLOCK;  else assign m2s3GatedHMASTLOCK = 1'b0;
    if (M2_AHBSLOTENABLE[4])  assign m2s4GatedHMASTLOCK  = M2GATEDHMASTLOCK;  else assign m2s4GatedHMASTLOCK = 1'b0;
    if (M2_AHBSLOTENABLE[5])  assign m2s5GatedHMASTLOCK  = M2GATEDHMASTLOCK;  else assign m2s5GatedHMASTLOCK = 1'b0;
    if (M2_AHBSLOTENABLE[6])  assign m2s6GatedHMASTLOCK  = M2GATEDHMASTLOCK;  else assign m2s6GatedHMASTLOCK = 1'b0;
    if (M2_AHBSLOTENABLE[7])  assign m2s7GatedHMASTLOCK  = M2GATEDHMASTLOCK;  else assign m2s7GatedHMASTLOCK = 1'b0;
    if (M2_AHBSLOTENABLE[8])  assign m2s8GatedHMASTLOCK  = M2GATEDHMASTLOCK;  else assign m2s8GatedHMASTLOCK = 1'b0;
    if (M2_AHBSLOTENABLE[9])  assign m2s9GatedHMASTLOCK  = M2GATEDHMASTLOCK;  else assign m2s9GatedHMASTLOCK = 1'b0;
    if (M2_AHBSLOTENABLE[10])  assign m2s10GatedHMASTLOCK  = M2GATEDHMASTLOCK;  else assign m2s10GatedHMASTLOCK = 1'b0;
    if (M2_AHBSLOTENABLE[11])  assign m2s11GatedHMASTLOCK  = M2GATEDHMASTLOCK;  else assign m2s11GatedHMASTLOCK = 1'b0;
    if (M2_AHBSLOTENABLE[12])  assign m2s12GatedHMASTLOCK  = M2GATEDHMASTLOCK;  else assign m2s12GatedHMASTLOCK = 1'b0;
    if (M2_AHBSLOTENABLE[13])  assign m2s13GatedHMASTLOCK  = M2GATEDHMASTLOCK;  else assign m2s13GatedHMASTLOCK = 1'b0;
    if (M2_AHBSLOTENABLE[14])  assign m2s14GatedHMASTLOCK  = M2GATEDHMASTLOCK;  else assign m2s14GatedHMASTLOCK = 1'b0;
    if (M2_AHBSLOTENABLE[15])  assign m2s15GatedHMASTLOCK  = M2GATEDHMASTLOCK;  else assign m2s15GatedHMASTLOCK = 1'b0;
    if (M2_AHBSLOTENABLE[16])  assign m2s16GatedHMASTLOCK  = M2GATEDHMASTLOCK;  else assign m2s16GatedHMASTLOCK = 1'b0;
    if (M3_AHBSLOTENABLE[0])  assign m3s0GatedHMASTLOCK  = M3GATEDHMASTLOCK;  else assign m3s0GatedHMASTLOCK = 1'b0;
    if (M3_AHBSLOTENABLE[1])  assign m3s1GatedHMASTLOCK  = M3GATEDHMASTLOCK;  else assign m3s1GatedHMASTLOCK = 1'b0;
    if (M3_AHBSLOTENABLE[2])  assign m3s2GatedHMASTLOCK  = M3GATEDHMASTLOCK;  else assign m3s2GatedHMASTLOCK = 1'b0;
    if (M3_AHBSLOTENABLE[3])  assign m3s3GatedHMASTLOCK  = M3GATEDHMASTLOCK;  else assign m3s3GatedHMASTLOCK = 1'b0;
    if (M3_AHBSLOTENABLE[4])  assign m3s4GatedHMASTLOCK  = M3GATEDHMASTLOCK;  else assign m3s4GatedHMASTLOCK = 1'b0;
    if (M3_AHBSLOTENABLE[5])  assign m3s5GatedHMASTLOCK  = M3GATEDHMASTLOCK;  else assign m3s5GatedHMASTLOCK = 1'b0;
    if (M3_AHBSLOTENABLE[6])  assign m3s6GatedHMASTLOCK  = M3GATEDHMASTLOCK;  else assign m3s6GatedHMASTLOCK = 1'b0;
    if (M3_AHBSLOTENABLE[7])  assign m3s7GatedHMASTLOCK  = M3GATEDHMASTLOCK;  else assign m3s7GatedHMASTLOCK = 1'b0;
    if (M3_AHBSLOTENABLE[8])  assign m3s8GatedHMASTLOCK  = M3GATEDHMASTLOCK;  else assign m3s8GatedHMASTLOCK = 1'b0;
    if (M3_AHBSLOTENABLE[9])  assign m3s9GatedHMASTLOCK  = M3GATEDHMASTLOCK;  else assign m3s9GatedHMASTLOCK = 1'b0;
    if (M3_AHBSLOTENABLE[10])  assign m3s10GatedHMASTLOCK  = M3GATEDHMASTLOCK;  else assign m3s10GatedHMASTLOCK = 1'b0;
    if (M3_AHBSLOTENABLE[11])  assign m3s11GatedHMASTLOCK  = M3GATEDHMASTLOCK;  else assign m3s11GatedHMASTLOCK = 1'b0;
    if (M3_AHBSLOTENABLE[12])  assign m3s12GatedHMASTLOCK  = M3GATEDHMASTLOCK;  else assign m3s12GatedHMASTLOCK = 1'b0;
    if (M3_AHBSLOTENABLE[13])  assign m3s13GatedHMASTLOCK  = M3GATEDHMASTLOCK;  else assign m3s13GatedHMASTLOCK = 1'b0;
    if (M3_AHBSLOTENABLE[14])  assign m3s14GatedHMASTLOCK  = M3GATEDHMASTLOCK;  else assign m3s14GatedHMASTLOCK = 1'b0;
    if (M3_AHBSLOTENABLE[15])  assign m3s15GatedHMASTLOCK  = M3GATEDHMASTLOCK;  else assign m3s15GatedHMASTLOCK = 1'b0;
    if (M3_AHBSLOTENABLE[16])  assign m3s16GatedHMASTLOCK  = M3GATEDHMASTLOCK;  else assign m3s16GatedHMASTLOCK = 1'b0;
  endgenerate
  generate
    if (M0_AHBSLOTENABLE[0])  assign m0s0GatedHSIZE  = M0GATEDHSIZE;  else assign m0s0GatedHSIZE = 1'b0;
    if (M0_AHBSLOTENABLE[1])  assign m0s1GatedHSIZE  = M0GATEDHSIZE;  else assign m0s1GatedHSIZE = 1'b0;
    if (M0_AHBSLOTENABLE[2])  assign m0s2GatedHSIZE  = M0GATEDHSIZE;  else assign m0s2GatedHSIZE = 1'b0;
    if (M0_AHBSLOTENABLE[3])  assign m0s3GatedHSIZE  = M0GATEDHSIZE;  else assign m0s3GatedHSIZE = 1'b0;
    if (M0_AHBSLOTENABLE[4])  assign m0s4GatedHSIZE  = M0GATEDHSIZE;  else assign m0s4GatedHSIZE = 1'b0;
    if (M0_AHBSLOTENABLE[5])  assign m0s5GatedHSIZE  = M0GATEDHSIZE;  else assign m0s5GatedHSIZE = 1'b0;
    if (M0_AHBSLOTENABLE[6])  assign m0s6GatedHSIZE  = M0GATEDHSIZE;  else assign m0s6GatedHSIZE = 1'b0;
    if (M0_AHBSLOTENABLE[7])  assign m0s7GatedHSIZE  = M0GATEDHSIZE;  else assign m0s7GatedHSIZE = 1'b0;
    if (M0_AHBSLOTENABLE[8])  assign m0s8GatedHSIZE  = M0GATEDHSIZE;  else assign m0s8GatedHSIZE = 1'b0;
    if (M0_AHBSLOTENABLE[9])  assign m0s9GatedHSIZE  = M0GATEDHSIZE;  else assign m0s9GatedHSIZE = 1'b0;
    if (M0_AHBSLOTENABLE[10])  assign m0s10GatedHSIZE  = M0GATEDHSIZE;  else assign m0s10GatedHSIZE = 1'b0;
    if (M0_AHBSLOTENABLE[11])  assign m0s11GatedHSIZE  = M0GATEDHSIZE;  else assign m0s11GatedHSIZE = 1'b0;
    if (M0_AHBSLOTENABLE[12])  assign m0s12GatedHSIZE  = M0GATEDHSIZE;  else assign m0s12GatedHSIZE = 1'b0;
    if (M0_AHBSLOTENABLE[13])  assign m0s13GatedHSIZE  = M0GATEDHSIZE;  else assign m0s13GatedHSIZE = 1'b0;
    if (M0_AHBSLOTENABLE[14])  assign m0s14GatedHSIZE  = M0GATEDHSIZE;  else assign m0s14GatedHSIZE = 1'b0;
    if (M0_AHBSLOTENABLE[15])  assign m0s15GatedHSIZE  = M0GATEDHSIZE;  else assign m0s15GatedHSIZE = 1'b0;
    if (M0_AHBSLOTENABLE[16])  assign m0s16GatedHSIZE  = M0GATEDHSIZE;  else assign m0s16GatedHSIZE = 1'b0;
    if (M1_AHBSLOTENABLE[0])  assign m1s0GatedHSIZE  = M1GATEDHSIZE;  else assign m1s0GatedHSIZE = 1'b0;
    if (M1_AHBSLOTENABLE[1])  assign m1s1GatedHSIZE  = M1GATEDHSIZE;  else assign m1s1GatedHSIZE = 1'b0;
    if (M1_AHBSLOTENABLE[2])  assign m1s2GatedHSIZE  = M1GATEDHSIZE;  else assign m1s2GatedHSIZE = 1'b0;
    if (M1_AHBSLOTENABLE[3])  assign m1s3GatedHSIZE  = M1GATEDHSIZE;  else assign m1s3GatedHSIZE = 1'b0;
    if (M1_AHBSLOTENABLE[4])  assign m1s4GatedHSIZE  = M1GATEDHSIZE;  else assign m1s4GatedHSIZE = 1'b0;
    if (M1_AHBSLOTENABLE[5])  assign m1s5GatedHSIZE  = M1GATEDHSIZE;  else assign m1s5GatedHSIZE = 1'b0;
    if (M1_AHBSLOTENABLE[6])  assign m1s6GatedHSIZE  = M1GATEDHSIZE;  else assign m1s6GatedHSIZE = 1'b0;
    if (M1_AHBSLOTENABLE[7])  assign m1s7GatedHSIZE  = M1GATEDHSIZE;  else assign m1s7GatedHSIZE = 1'b0;
    if (M1_AHBSLOTENABLE[8])  assign m1s8GatedHSIZE  = M1GATEDHSIZE;  else assign m1s8GatedHSIZE = 1'b0;
    if (M1_AHBSLOTENABLE[9])  assign m1s9GatedHSIZE  = M1GATEDHSIZE;  else assign m1s9GatedHSIZE = 1'b0;
    if (M1_AHBSLOTENABLE[10])  assign m1s10GatedHSIZE  = M1GATEDHSIZE;  else assign m1s10GatedHSIZE = 1'b0;
    if (M1_AHBSLOTENABLE[11])  assign m1s11GatedHSIZE  = M1GATEDHSIZE;  else assign m1s11GatedHSIZE = 1'b0;
    if (M1_AHBSLOTENABLE[12])  assign m1s12GatedHSIZE  = M1GATEDHSIZE;  else assign m1s12GatedHSIZE = 1'b0;
    if (M1_AHBSLOTENABLE[13])  assign m1s13GatedHSIZE  = M1GATEDHSIZE;  else assign m1s13GatedHSIZE = 1'b0;
    if (M1_AHBSLOTENABLE[14])  assign m1s14GatedHSIZE  = M1GATEDHSIZE;  else assign m1s14GatedHSIZE = 1'b0;
    if (M1_AHBSLOTENABLE[15])  assign m1s15GatedHSIZE  = M1GATEDHSIZE;  else assign m1s15GatedHSIZE = 1'b0;
    if (M1_AHBSLOTENABLE[16])  assign m1s16GatedHSIZE  = M1GATEDHSIZE;  else assign m1s16GatedHSIZE = 1'b0;
    if (M2_AHBSLOTENABLE[0])  assign m2s0GatedHSIZE  = M2GATEDHSIZE;  else assign m2s0GatedHSIZE = 1'b0;
    if (M2_AHBSLOTENABLE[1])  assign m2s1GatedHSIZE  = M2GATEDHSIZE;  else assign m2s1GatedHSIZE = 1'b0;
    if (M2_AHBSLOTENABLE[2])  assign m2s2GatedHSIZE  = M2GATEDHSIZE;  else assign m2s2GatedHSIZE = 1'b0;
    if (M2_AHBSLOTENABLE[3])  assign m2s3GatedHSIZE  = M2GATEDHSIZE;  else assign m2s3GatedHSIZE = 1'b0;
    if (M2_AHBSLOTENABLE[4])  assign m2s4GatedHSIZE  = M2GATEDHSIZE;  else assign m2s4GatedHSIZE = 1'b0;
    if (M2_AHBSLOTENABLE[5])  assign m2s5GatedHSIZE  = M2GATEDHSIZE;  else assign m2s5GatedHSIZE = 1'b0;
    if (M2_AHBSLOTENABLE[6])  assign m2s6GatedHSIZE  = M2GATEDHSIZE;  else assign m2s6GatedHSIZE = 1'b0;
    if (M2_AHBSLOTENABLE[7])  assign m2s7GatedHSIZE  = M2GATEDHSIZE;  else assign m2s7GatedHSIZE = 1'b0;
    if (M2_AHBSLOTENABLE[8])  assign m2s8GatedHSIZE  = M2GATEDHSIZE;  else assign m2s8GatedHSIZE = 1'b0;
    if (M2_AHBSLOTENABLE[9])  assign m2s9GatedHSIZE  = M2GATEDHSIZE;  else assign m2s9GatedHSIZE = 1'b0;
    if (M2_AHBSLOTENABLE[10])  assign m2s10GatedHSIZE  = M2GATEDHSIZE;  else assign m2s10GatedHSIZE = 1'b0;
    if (M2_AHBSLOTENABLE[11])  assign m2s11GatedHSIZE  = M2GATEDHSIZE;  else assign m2s11GatedHSIZE = 1'b0;
    if (M2_AHBSLOTENABLE[12])  assign m2s12GatedHSIZE  = M2GATEDHSIZE;  else assign m2s12GatedHSIZE = 1'b0;
    if (M2_AHBSLOTENABLE[13])  assign m2s13GatedHSIZE  = M2GATEDHSIZE;  else assign m2s13GatedHSIZE = 1'b0;
    if (M2_AHBSLOTENABLE[14])  assign m2s14GatedHSIZE  = M2GATEDHSIZE;  else assign m2s14GatedHSIZE = 1'b0;
    if (M2_AHBSLOTENABLE[15])  assign m2s15GatedHSIZE  = M2GATEDHSIZE;  else assign m2s15GatedHSIZE = 1'b0;
    if (M2_AHBSLOTENABLE[16])  assign m2s16GatedHSIZE  = M2GATEDHSIZE;  else assign m2s16GatedHSIZE = 1'b0;
    if (M3_AHBSLOTENABLE[0])  assign m3s0GatedHSIZE  = M3GATEDHSIZE;  else assign m3s0GatedHSIZE = 1'b0;
    if (M3_AHBSLOTENABLE[1])  assign m3s1GatedHSIZE  = M3GATEDHSIZE;  else assign m3s1GatedHSIZE = 1'b0;
    if (M3_AHBSLOTENABLE[2])  assign m3s2GatedHSIZE  = M3GATEDHSIZE;  else assign m3s2GatedHSIZE = 1'b0;
    if (M3_AHBSLOTENABLE[3])  assign m3s3GatedHSIZE  = M3GATEDHSIZE;  else assign m3s3GatedHSIZE = 1'b0;
    if (M3_AHBSLOTENABLE[4])  assign m3s4GatedHSIZE  = M3GATEDHSIZE;  else assign m3s4GatedHSIZE = 1'b0;
    if (M3_AHBSLOTENABLE[5])  assign m3s5GatedHSIZE  = M3GATEDHSIZE;  else assign m3s5GatedHSIZE = 1'b0;
    if (M3_AHBSLOTENABLE[6])  assign m3s6GatedHSIZE  = M3GATEDHSIZE;  else assign m3s6GatedHSIZE = 1'b0;
    if (M3_AHBSLOTENABLE[7])  assign m3s7GatedHSIZE  = M3GATEDHSIZE;  else assign m3s7GatedHSIZE = 1'b0;
    if (M3_AHBSLOTENABLE[8])  assign m3s8GatedHSIZE  = M3GATEDHSIZE;  else assign m3s8GatedHSIZE = 1'b0;
    if (M3_AHBSLOTENABLE[9])  assign m3s9GatedHSIZE  = M3GATEDHSIZE;  else assign m3s9GatedHSIZE = 1'b0;
    if (M3_AHBSLOTENABLE[10])  assign m3s10GatedHSIZE  = M3GATEDHSIZE;  else assign m3s10GatedHSIZE = 1'b0;
    if (M3_AHBSLOTENABLE[11])  assign m3s11GatedHSIZE  = M3GATEDHSIZE;  else assign m3s11GatedHSIZE = 1'b0;
    if (M3_AHBSLOTENABLE[12])  assign m3s12GatedHSIZE  = M3GATEDHSIZE;  else assign m3s12GatedHSIZE = 1'b0;
    if (M3_AHBSLOTENABLE[13])  assign m3s13GatedHSIZE  = M3GATEDHSIZE;  else assign m3s13GatedHSIZE = 1'b0;
    if (M3_AHBSLOTENABLE[14])  assign m3s14GatedHSIZE  = M3GATEDHSIZE;  else assign m3s14GatedHSIZE = 1'b0;
    if (M3_AHBSLOTENABLE[15])  assign m3s15GatedHSIZE  = M3GATEDHSIZE;  else assign m3s15GatedHSIZE = 1'b0;
    if (M3_AHBSLOTENABLE[16])  assign m3s16GatedHSIZE  = M3GATEDHSIZE;  else assign m3s16GatedHSIZE = 1'b0;
  endgenerate
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////// AI :  For burst support
  
    generate
    if (M0_AHBSLOTENABLE[0])  assign m0s0GatedHBURST  = M0GATEDHBURST;  else assign m0s0GatedHBURST = 3'b0;
    if (M0_AHBSLOTENABLE[1])  assign m0s1GatedHBURST  = M0GATEDHBURST;  else assign m0s1GatedHBURST = 3'b0;
    if (M0_AHBSLOTENABLE[2])  assign m0s2GatedHBURST  = M0GATEDHBURST;  else assign m0s2GatedHBURST = 3'b0;
    if (M0_AHBSLOTENABLE[3])  assign m0s3GatedHBURST  = M0GATEDHBURST;  else assign m0s3GatedHBURST = 3'b0;
    if (M0_AHBSLOTENABLE[4])  assign m0s4GatedHBURST  = M0GATEDHBURST;  else assign m0s4GatedHBURST = 3'b0;
    if (M0_AHBSLOTENABLE[5])  assign m0s5GatedHBURST  = M0GATEDHBURST;  else assign m0s5GatedHBURST = 3'b0;
    if (M0_AHBSLOTENABLE[6])  assign m0s6GatedHBURST  = M0GATEDHBURST;  else assign m0s6GatedHBURST = 3'b0;
    if (M0_AHBSLOTENABLE[7])  assign m0s7GatedHBURST  = M0GATEDHBURST;  else assign m0s7GatedHBURST = 3'b0;
    if (M0_AHBSLOTENABLE[8])  assign m0s8GatedHBURST  = M0GATEDHBURST;  else assign m0s8GatedHBURST = 3'b0;
    if (M0_AHBSLOTENABLE[9])  assign m0s9GatedHBURST  = M0GATEDHBURST;  else assign m0s9GatedHBURST = 3'b0;
    if (M0_AHBSLOTENABLE[10]) assign m0s10GatedHBURST  = M0GATEDHBURST;  else assign m0s10GatedHBURST = 3'b0;
    if (M0_AHBSLOTENABLE[11]) assign m0s11GatedHBURST  = M0GATEDHBURST;  else assign m0s11GatedHBURST = 3'b0;
    if (M0_AHBSLOTENABLE[12]) assign m0s12GatedHBURST  = M0GATEDHBURST;  else assign m0s12GatedHBURST = 3'b0;
    if (M0_AHBSLOTENABLE[13]) assign m0s13GatedHBURST  = M0GATEDHBURST;  else assign m0s13GatedHBURST = 3'b0;
    if (M0_AHBSLOTENABLE[14]) assign m0s14GatedHBURST  = M0GATEDHBURST;  else assign m0s14GatedHBURST = 3'b0;
    if (M0_AHBSLOTENABLE[15]) assign m0s15GatedHBURST  = M0GATEDHBURST;  else assign m0s15GatedHBURST = 3'b0;
    if (M0_AHBSLOTENABLE[16]) assign m0s16GatedHBURST  = M0GATEDHBURST;  else assign m0s16GatedHBURST = 3'b0;
    if (M1_AHBSLOTENABLE[0])  assign m1s0GatedHBURST  = M1GATEDHBURST;  else assign m1s0GatedHBURST = 3'b0;
    if (M1_AHBSLOTENABLE[1])  assign m1s1GatedHBURST  = M1GATEDHBURST;  else assign m1s1GatedHBURST = 3'b0;
    if (M1_AHBSLOTENABLE[2])  assign m1s2GatedHBURST  = M1GATEDHBURST;  else assign m1s2GatedHBURST = 3'b0;
    if (M1_AHBSLOTENABLE[3])  assign m1s3GatedHBURST  = M1GATEDHBURST;  else assign m1s3GatedHBURST = 3'b0;
    if (M1_AHBSLOTENABLE[4])  assign m1s4GatedHBURST  = M1GATEDHBURST;  else assign m1s4GatedHBURST = 3'b0;
    if (M1_AHBSLOTENABLE[5])  assign m1s5GatedHBURST  = M1GATEDHBURST;  else assign m1s5GatedHBURST = 3'b0;
    if (M1_AHBSLOTENABLE[6])  assign m1s6GatedHBURST  = M1GATEDHBURST;  else assign m1s6GatedHBURST = 3'b0;
    if (M1_AHBSLOTENABLE[7])  assign m1s7GatedHBURST  = M1GATEDHBURST;  else assign m1s7GatedHBURST = 3'b0;
    if (M1_AHBSLOTENABLE[8])  assign m1s8GatedHBURST  = M1GATEDHBURST;  else assign m1s8GatedHBURST = 3'b0;
    if (M1_AHBSLOTENABLE[9])  assign m1s9GatedHBURST  = M1GATEDHBURST;  else assign m1s9GatedHBURST = 3'b0;
    if (M1_AHBSLOTENABLE[10]) assign m1s10GatedHBURST  = M1GATEDHBURST;  else assign m1s10GatedHBURST = 3'b0;
    if (M1_AHBSLOTENABLE[11]) assign m1s11GatedHBURST  = M1GATEDHBURST;  else assign m1s11GatedHBURST = 3'b0;
    if (M1_AHBSLOTENABLE[12]) assign m1s12GatedHBURST  = M1GATEDHBURST;  else assign m1s12GatedHBURST = 3'b0;
    if (M1_AHBSLOTENABLE[13]) assign m1s13GatedHBURST  = M1GATEDHBURST;  else assign m1s13GatedHBURST = 3'b0;
    if (M1_AHBSLOTENABLE[14]) assign m1s14GatedHBURST  = M1GATEDHBURST;  else assign m1s14GatedHBURST = 3'b0;
    if (M1_AHBSLOTENABLE[15]) assign m1s15GatedHBURST  = M1GATEDHBURST;  else assign m1s15GatedHBURST = 3'b0;
    if (M1_AHBSLOTENABLE[16]) assign m1s16GatedHBURST  = M1GATEDHBURST;  else assign m1s16GatedHBURST = 3'b0;
    if (M2_AHBSLOTENABLE[0])  assign m2s0GatedHBURST  = M2GATEDHBURST;  else assign m2s0GatedHBURST = 3'b0;
    if (M2_AHBSLOTENABLE[1])  assign m2s1GatedHBURST  = M2GATEDHBURST;  else assign m2s1GatedHBURST = 3'b0;
    if (M2_AHBSLOTENABLE[2])  assign m2s2GatedHBURST  = M2GATEDHBURST;  else assign m2s2GatedHBURST = 3'b0;
    if (M2_AHBSLOTENABLE[3])  assign m2s3GatedHBURST  = M2GATEDHBURST;  else assign m2s3GatedHBURST = 3'b0;
    if (M2_AHBSLOTENABLE[4])  assign m2s4GatedHBURST  = M2GATEDHBURST;  else assign m2s4GatedHBURST = 3'b0;
    if (M2_AHBSLOTENABLE[5])  assign m2s5GatedHBURST  = M2GATEDHBURST;  else assign m2s5GatedHBURST = 3'b0;
    if (M2_AHBSLOTENABLE[6])  assign m2s6GatedHBURST  = M2GATEDHBURST;  else assign m2s6GatedHBURST = 3'b0;
    if (M2_AHBSLOTENABLE[7])  assign m2s7GatedHBURST  = M2GATEDHBURST;  else assign m2s7GatedHBURST = 3'b0;
    if (M2_AHBSLOTENABLE[8])  assign m2s8GatedHBURST  = M2GATEDHBURST;  else assign m2s8GatedHBURST = 3'b0;
    if (M2_AHBSLOTENABLE[9])  assign m2s9GatedHBURST  = M2GATEDHBURST;  else assign m2s9GatedHBURST = 3'b0;
    if (M2_AHBSLOTENABLE[10]) assign m2s10GatedHBURST  = M2GATEDHBURST;  else assign m2s10GatedHBURST = 3'b0;
    if (M2_AHBSLOTENABLE[11]) assign m2s11GatedHBURST  = M2GATEDHBURST;  else assign m2s11GatedHBURST = 3'b0;
    if (M2_AHBSLOTENABLE[12]) assign m2s12GatedHBURST = M2GATEDHBURST;  else assign m2s12GatedHBURST  = 3'b0;
    if (M2_AHBSLOTENABLE[13]) assign m2s13GatedHBURST = M2GATEDHBURST;  else assign m2s13GatedHBURST  = 3'b0;
    if (M2_AHBSLOTENABLE[14]) assign m2s14GatedHBURST  = M2GATEDHBURST;  else assign m2s14GatedHBURST = 3'b0;
    if (M2_AHBSLOTENABLE[15]) assign m2s15GatedHBURST  = M2GATEDHBURST;  else assign m2s15GatedHBURST = 3'b0;
    if (M2_AHBSLOTENABLE[16]) assign m2s16GatedHBURST  = M2GATEDHBURST;  else assign m2s16GatedHBURST = 3'b0;
    if (M3_AHBSLOTENABLE[0])  assign m3s0GatedHBURST  = M3GATEDHBURST;  else assign m3s0GatedHBURST = 3'b0;
    if (M3_AHBSLOTENABLE[1])  assign m3s1GatedHBURST  = M3GATEDHBURST;  else assign m3s1GatedHBURST = 3'b0;
    if (M3_AHBSLOTENABLE[2])  assign m3s2GatedHBURST = M3GATEDHBURST;  else assign  m3s2GatedHBURST = 3'b0;
    if (M3_AHBSLOTENABLE[3])  assign m3s3GatedHBURST  = M3GATEDHBURST;  else assign m3s3GatedHBURST = 3'b0;
    if (M3_AHBSLOTENABLE[4])  assign m3s4GatedHBURST  = M3GATEDHBURST;  else assign m3s4GatedHBURST = 3'b0;
    if (M3_AHBSLOTENABLE[5])  assign m3s5GatedHBURST  = M3GATEDHBURST;  else assign m3s5GatedHBURST = 3'b0;
    if (M3_AHBSLOTENABLE[6])  assign m3s6GatedHBURST  = M3GATEDHBURST;  else assign m3s6GatedHBURST = 3'b0;
    if (M3_AHBSLOTENABLE[7])  assign m3s7GatedHBURST  = M3GATEDHBURST;  else assign m3s7GatedHBURST = 3'b0;
    if (M3_AHBSLOTENABLE[8])  assign m3s8GatedHBURST  = M3GATEDHBURST;  else assign m3s8GatedHBURST = 3'b0;
    if (M3_AHBSLOTENABLE[9])  assign m3s9GatedHBURST  = M3GATEDHBURST;  else assign m3s9GatedHBURST = 3'b0;
    if (M3_AHBSLOTENABLE[10]) assign m3s10GatedHBURST  = M3GATEDHBURST;  else assign m3s10GatedHBURST = 3'b0;
    if (M3_AHBSLOTENABLE[11]) assign m3s11GatedHBURST  = M3GATEDHBURST;  else assign m3s11GatedHBURST = 3'b0;
    if (M3_AHBSLOTENABLE[12]) assign m3s12GatedHBURST  = M3GATEDHBURST;  else assign m3s12GatedHBURST = 3'b0;
    if (M3_AHBSLOTENABLE[13]) assign m3s13GatedHBURST  = M3GATEDHBURST;  else assign m3s13GatedHBURST = 3'b0;
    if (M3_AHBSLOTENABLE[14]) assign m3s14GatedHBURST  = M3GATEDHBURST;  else assign m3s14GatedHBURST = 3'b0;
    if (M3_AHBSLOTENABLE[15]) assign m3s15GatedHBURST  = M3GATEDHBURST;  else assign m3s15GatedHBURST = 3'b0;
    if (M3_AHBSLOTENABLE[16]) assign m3s16GatedHBURST  = M3GATEDHBURST;  else assign m3s16GatedHBURST = 3'b0;
  endgenerate
  
  /////////////////
  
  generate
    if (M0_AHBSLOTENABLE[0])  assign m0s0GatedHTRANS  = M0GATEDHTRANS;  else assign m0s0GatedHTRANS = 2'b0;
    if (M0_AHBSLOTENABLE[1])  assign m0s1GatedHTRANS  = M0GATEDHTRANS;  else assign m0s1GatedHTRANS = 2'b0;
    if (M0_AHBSLOTENABLE[2])  assign m0s2GatedHTRANS  = M0GATEDHTRANS;  else assign m0s2GatedHTRANS = 2'b0;
    if (M0_AHBSLOTENABLE[3])  assign m0s3GatedHTRANS  = M0GATEDHTRANS;  else assign m0s3GatedHTRANS = 2'b0;
    if (M0_AHBSLOTENABLE[4])  assign m0s4GatedHTRANS  = M0GATEDHTRANS;  else assign m0s4GatedHTRANS = 2'b0;
    if (M0_AHBSLOTENABLE[5])  assign m0s5GatedHTRANS  = M0GATEDHTRANS;  else assign m0s5GatedHTRANS = 2'b0;
    if (M0_AHBSLOTENABLE[6])  assign m0s6GatedHTRANS  = M0GATEDHTRANS;  else assign m0s6GatedHTRANS = 2'b0;
    if (M0_AHBSLOTENABLE[7])  assign m0s7GatedHTRANS  = M0GATEDHTRANS;  else assign m0s7GatedHTRANS = 2'b0;
    if (M0_AHBSLOTENABLE[8])  assign m0s8GatedHTRANS  = M0GATEDHTRANS;  else assign m0s8GatedHTRANS = 2'b0;
    if (M0_AHBSLOTENABLE[9])  assign m0s9GatedHTRANS  = M0GATEDHTRANS;  else assign m0s9GatedHTRANS = 2'b0;
    if (M0_AHBSLOTENABLE[10])  assign m0s10GatedHTRANS  = M0GATEDHTRANS;  else assign m0s10GatedHTRANS = 2'b0;
    if (M0_AHBSLOTENABLE[11])  assign m0s11GatedHTRANS  = M0GATEDHTRANS;  else assign m0s11GatedHTRANS = 2'b0;
    if (M0_AHBSLOTENABLE[12])  assign m0s12GatedHTRANS  = M0GATEDHTRANS;  else assign m0s12GatedHTRANS = 2'b0;
    if (M0_AHBSLOTENABLE[13])  assign m0s13GatedHTRANS  = M0GATEDHTRANS;  else assign m0s13GatedHTRANS = 2'b0;
    if (M0_AHBSLOTENABLE[14])  assign m0s14GatedHTRANS  = M0GATEDHTRANS;  else assign m0s14GatedHTRANS = 2'b0;
    if (M0_AHBSLOTENABLE[15])  assign m0s15GatedHTRANS  = M0GATEDHTRANS;  else assign m0s15GatedHTRANS = 2'b0;
    if (M0_AHBSLOTENABLE[16])  assign m0s16GatedHTRANS  = M0GATEDHTRANS;  else assign m0s16GatedHTRANS = 2'b0;
    if (M1_AHBSLOTENABLE[0])  assign m1s0GatedHTRANS  = M1GATEDHTRANS;  else assign m1s0GatedHTRANS = 2'b0;
    if (M1_AHBSLOTENABLE[1])  assign m1s1GatedHTRANS  = M1GATEDHTRANS;  else assign m1s1GatedHTRANS = 2'b0;
    if (M1_AHBSLOTENABLE[2])  assign m1s2GatedHTRANS  = M1GATEDHTRANS;  else assign m1s2GatedHTRANS = 2'b0;
    if (M1_AHBSLOTENABLE[3])  assign m1s3GatedHTRANS  = M1GATEDHTRANS;  else assign m1s3GatedHTRANS = 2'b0;
    if (M1_AHBSLOTENABLE[4])  assign m1s4GatedHTRANS  = M1GATEDHTRANS;  else assign m1s4GatedHTRANS = 2'b0;
    if (M1_AHBSLOTENABLE[5])  assign m1s5GatedHTRANS  = M1GATEDHTRANS;  else assign m1s5GatedHTRANS = 2'b0;
    if (M1_AHBSLOTENABLE[6])  assign m1s6GatedHTRANS  = M1GATEDHTRANS;  else assign m1s6GatedHTRANS = 2'b0;
    if (M1_AHBSLOTENABLE[7])  assign m1s7GatedHTRANS  = M1GATEDHTRANS;  else assign m1s7GatedHTRANS = 2'b0;
    if (M1_AHBSLOTENABLE[8])  assign m1s8GatedHTRANS  = M1GATEDHTRANS;  else assign m1s8GatedHTRANS = 2'b0;
    if (M1_AHBSLOTENABLE[9])  assign m1s9GatedHTRANS  = M1GATEDHTRANS;  else assign m1s9GatedHTRANS = 2'b0;
    if (M1_AHBSLOTENABLE[10])  assign m1s10GatedHTRANS  = M1GATEDHTRANS;  else assign m1s10GatedHTRANS = 2'b0;
    if (M1_AHBSLOTENABLE[11])  assign m1s11GatedHTRANS  = M1GATEDHTRANS;  else assign m1s11GatedHTRANS = 2'b0;
    if (M1_AHBSLOTENABLE[12])  assign m1s12GatedHTRANS  = M1GATEDHTRANS;  else assign m1s12GatedHTRANS = 2'b0;
    if (M1_AHBSLOTENABLE[13])  assign m1s13GatedHTRANS  = M1GATEDHTRANS;  else assign m1s13GatedHTRANS = 2'b0;
    if (M1_AHBSLOTENABLE[14])  assign m1s14GatedHTRANS  = M1GATEDHTRANS;  else assign m1s14GatedHTRANS = 2'b0;
    if (M1_AHBSLOTENABLE[15])  assign m1s15GatedHTRANS  = M1GATEDHTRANS;  else assign m1s15GatedHTRANS = 2'b0;
    if (M1_AHBSLOTENABLE[16])  assign m1s16GatedHTRANS  = M1GATEDHTRANS;  else assign m1s16GatedHTRANS = 2'b0;
    if (M2_AHBSLOTENABLE[0])  assign m2s0GatedHTRANS  = M2GATEDHTRANS;  else assign m2s0GatedHTRANS = 2'b0;
    if (M2_AHBSLOTENABLE[1])  assign m2s1GatedHTRANS  = M2GATEDHTRANS;  else assign m2s1GatedHTRANS = 2'b0;
    if (M2_AHBSLOTENABLE[2])  assign m2s2GatedHTRANS  = M2GATEDHTRANS;  else assign m2s2GatedHTRANS = 2'b0;
    if (M2_AHBSLOTENABLE[3])  assign m2s3GatedHTRANS  = M2GATEDHTRANS;  else assign m2s3GatedHTRANS = 2'b0;
    if (M2_AHBSLOTENABLE[4])  assign m2s4GatedHTRANS  = M2GATEDHTRANS;  else assign m2s4GatedHTRANS = 2'b0;
    if (M2_AHBSLOTENABLE[5])  assign m2s5GatedHTRANS  = M2GATEDHTRANS;  else assign m2s5GatedHTRANS = 2'b0;
    if (M2_AHBSLOTENABLE[6])  assign m2s6GatedHTRANS  = M2GATEDHTRANS;  else assign m2s6GatedHTRANS = 2'b0;
    if (M2_AHBSLOTENABLE[7])  assign m2s7GatedHTRANS  = M2GATEDHTRANS;  else assign m2s7GatedHTRANS = 2'b0;
    if (M2_AHBSLOTENABLE[8])  assign m2s8GatedHTRANS  = M2GATEDHTRANS;  else assign m2s8GatedHTRANS = 2'b0;
    if (M2_AHBSLOTENABLE[9])  assign m2s9GatedHTRANS  = M2GATEDHTRANS;  else assign m2s9GatedHTRANS = 2'b0;
    if (M2_AHBSLOTENABLE[10])  assign m2s10GatedHTRANS  = M2GATEDHTRANS;  else assign m2s10GatedHTRANS = 2'b0;
    if (M2_AHBSLOTENABLE[11])  assign m2s11GatedHTRANS  = M2GATEDHTRANS;  else assign m2s11GatedHTRANS = 2'b0;
    if (M2_AHBSLOTENABLE[12])  assign m2s12GatedHTRANS  = M2GATEDHTRANS;  else assign m2s12GatedHTRANS = 2'b0;
    if (M2_AHBSLOTENABLE[13])  assign m2s13GatedHTRANS  = M2GATEDHTRANS;  else assign m2s13GatedHTRANS = 2'b0;
    if (M2_AHBSLOTENABLE[14])  assign m2s14GatedHTRANS  = M2GATEDHTRANS;  else assign m2s14GatedHTRANS = 2'b0;
    if (M2_AHBSLOTENABLE[15])  assign m2s15GatedHTRANS  = M2GATEDHTRANS;  else assign m2s15GatedHTRANS = 2'b0;
    if (M2_AHBSLOTENABLE[16])  assign m2s16GatedHTRANS  = M2GATEDHTRANS;  else assign m2s16GatedHTRANS = 2'b0;
    if (M3_AHBSLOTENABLE[0])  assign m3s0GatedHTRANS  = M3GATEDHTRANS;  else assign m3s0GatedHTRANS = 2'b0;
    if (M3_AHBSLOTENABLE[1])  assign m3s1GatedHTRANS  = M3GATEDHTRANS;  else assign m3s1GatedHTRANS = 2'b0;
    if (M3_AHBSLOTENABLE[2])  assign m3s2GatedHTRANS  = M3GATEDHTRANS;  else assign m3s2GatedHTRANS = 2'b0;
    if (M3_AHBSLOTENABLE[3])  assign m3s3GatedHTRANS  = M3GATEDHTRANS;  else assign m3s3GatedHTRANS = 2'b0;
    if (M3_AHBSLOTENABLE[4])  assign m3s4GatedHTRANS  = M3GATEDHTRANS;  else assign m3s4GatedHTRANS = 2'b0;
    if (M3_AHBSLOTENABLE[5])  assign m3s5GatedHTRANS  = M3GATEDHTRANS;  else assign m3s5GatedHTRANS = 2'b0;
    if (M3_AHBSLOTENABLE[6])  assign m3s6GatedHTRANS  = M3GATEDHTRANS;  else assign m3s6GatedHTRANS = 2'b0;
    if (M3_AHBSLOTENABLE[7])  assign m3s7GatedHTRANS  = M3GATEDHTRANS;  else assign m3s7GatedHTRANS = 2'b0;
    if (M3_AHBSLOTENABLE[8])  assign m3s8GatedHTRANS  = M3GATEDHTRANS;  else assign m3s8GatedHTRANS = 2'b0;
    if (M3_AHBSLOTENABLE[9])  assign m3s9GatedHTRANS  = M3GATEDHTRANS;  else assign m3s9GatedHTRANS = 2'b0;
    if (M3_AHBSLOTENABLE[10])  assign m3s10GatedHTRANS  = M3GATEDHTRANS;  else assign m3s10GatedHTRANS = 2'b0;
    if (M3_AHBSLOTENABLE[11])  assign m3s11GatedHTRANS  = M3GATEDHTRANS;  else assign m3s11GatedHTRANS = 2'b0;
    if (M3_AHBSLOTENABLE[12])  assign m3s12GatedHTRANS  = M3GATEDHTRANS;  else assign m3s12GatedHTRANS = 2'b0;
    if (M3_AHBSLOTENABLE[13])  assign m3s13GatedHTRANS  = M3GATEDHTRANS;  else assign m3s13GatedHTRANS = 2'b0;
    if (M3_AHBSLOTENABLE[14])  assign m3s14GatedHTRANS  = M3GATEDHTRANS;  else assign m3s14GatedHTRANS = 2'b0;
    if (M3_AHBSLOTENABLE[15])  assign m3s15GatedHTRANS  = M3GATEDHTRANS;  else assign m3s15GatedHTRANS = 2'b0;
    if (M3_AHBSLOTENABLE[16])  assign m3s16GatedHTRANS  = M3GATEDHTRANS;  else assign m3s16GatedHTRANS = 2'b0;
  endgenerate
  generate
    if (M0_AHBSLOTENABLE[0])  assign m0s0GatedHWRITE  = M0GATEDHWRITE;  else assign m0s0GatedHWRITE = 1'b0;
    if (M0_AHBSLOTENABLE[1])  assign m0s1GatedHWRITE  = M0GATEDHWRITE;  else assign m0s1GatedHWRITE = 1'b0;
    if (M0_AHBSLOTENABLE[2])  assign m0s2GatedHWRITE  = M0GATEDHWRITE;  else assign m0s2GatedHWRITE = 1'b0;
    if (M0_AHBSLOTENABLE[3])  assign m0s3GatedHWRITE  = M0GATEDHWRITE;  else assign m0s3GatedHWRITE = 1'b0;
    if (M0_AHBSLOTENABLE[4])  assign m0s4GatedHWRITE  = M0GATEDHWRITE;  else assign m0s4GatedHWRITE = 1'b0;
    if (M0_AHBSLOTENABLE[5])  assign m0s5GatedHWRITE  = M0GATEDHWRITE;  else assign m0s5GatedHWRITE = 1'b0;
    if (M0_AHBSLOTENABLE[6])  assign m0s6GatedHWRITE  = M0GATEDHWRITE;  else assign m0s6GatedHWRITE = 1'b0;
    if (M0_AHBSLOTENABLE[7])  assign m0s7GatedHWRITE  = M0GATEDHWRITE;  else assign m0s7GatedHWRITE = 1'b0;
    if (M0_AHBSLOTENABLE[8])  assign m0s8GatedHWRITE  = M0GATEDHWRITE;  else assign m0s8GatedHWRITE = 1'b0;
    if (M0_AHBSLOTENABLE[9])  assign m0s9GatedHWRITE  = M0GATEDHWRITE;  else assign m0s9GatedHWRITE = 1'b0;
    if (M0_AHBSLOTENABLE[10])  assign m0s10GatedHWRITE  = M0GATEDHWRITE;  else assign m0s10GatedHWRITE = 1'b0;
    if (M0_AHBSLOTENABLE[11])  assign m0s11GatedHWRITE  = M0GATEDHWRITE;  else assign m0s11GatedHWRITE = 1'b0;
    if (M0_AHBSLOTENABLE[12])  assign m0s12GatedHWRITE  = M0GATEDHWRITE;  else assign m0s12GatedHWRITE = 1'b0;
    if (M0_AHBSLOTENABLE[13])  assign m0s13GatedHWRITE  = M0GATEDHWRITE;  else assign m0s13GatedHWRITE = 1'b0;
    if (M0_AHBSLOTENABLE[14])  assign m0s14GatedHWRITE  = M0GATEDHWRITE;  else assign m0s14GatedHWRITE = 1'b0;
    if (M0_AHBSLOTENABLE[15])  assign m0s15GatedHWRITE  = M0GATEDHWRITE;  else assign m0s15GatedHWRITE = 1'b0;
    if (M0_AHBSLOTENABLE[16])  assign m0s16GatedHWRITE  = M0GATEDHWRITE;  else assign m0s16GatedHWRITE = 1'b0;
    if (M1_AHBSLOTENABLE[0])  assign m1s0GatedHWRITE  = M1GATEDHWRITE;  else assign m1s0GatedHWRITE = 1'b0;
    if (M1_AHBSLOTENABLE[1])  assign m1s1GatedHWRITE  = M1GATEDHWRITE;  else assign m1s1GatedHWRITE = 1'b0;
    if (M1_AHBSLOTENABLE[2])  assign m1s2GatedHWRITE  = M1GATEDHWRITE;  else assign m1s2GatedHWRITE = 1'b0;
    if (M1_AHBSLOTENABLE[3])  assign m1s3GatedHWRITE  = M1GATEDHWRITE;  else assign m1s3GatedHWRITE = 1'b0;
    if (M1_AHBSLOTENABLE[4])  assign m1s4GatedHWRITE  = M1GATEDHWRITE;  else assign m1s4GatedHWRITE = 1'b0;
    if (M1_AHBSLOTENABLE[5])  assign m1s5GatedHWRITE  = M1GATEDHWRITE;  else assign m1s5GatedHWRITE = 1'b0;
    if (M1_AHBSLOTENABLE[6])  assign m1s6GatedHWRITE  = M1GATEDHWRITE;  else assign m1s6GatedHWRITE = 1'b0;
    if (M1_AHBSLOTENABLE[7])  assign m1s7GatedHWRITE  = M1GATEDHWRITE;  else assign m1s7GatedHWRITE = 1'b0;
    if (M1_AHBSLOTENABLE[8])  assign m1s8GatedHWRITE  = M1GATEDHWRITE;  else assign m1s8GatedHWRITE = 1'b0;
    if (M1_AHBSLOTENABLE[9])  assign m1s9GatedHWRITE  = M1GATEDHWRITE;  else assign m1s9GatedHWRITE = 1'b0;
    if (M1_AHBSLOTENABLE[10])  assign m1s10GatedHWRITE  = M1GATEDHWRITE;  else assign m1s10GatedHWRITE = 1'b0;
    if (M1_AHBSLOTENABLE[11])  assign m1s11GatedHWRITE  = M1GATEDHWRITE;  else assign m1s11GatedHWRITE = 1'b0;
    if (M1_AHBSLOTENABLE[12])  assign m1s12GatedHWRITE  = M1GATEDHWRITE;  else assign m1s12GatedHWRITE = 1'b0;
    if (M1_AHBSLOTENABLE[13])  assign m1s13GatedHWRITE  = M1GATEDHWRITE;  else assign m1s13GatedHWRITE = 1'b0;
    if (M1_AHBSLOTENABLE[14])  assign m1s14GatedHWRITE  = M1GATEDHWRITE;  else assign m1s14GatedHWRITE = 1'b0;
    if (M1_AHBSLOTENABLE[15])  assign m1s15GatedHWRITE  = M1GATEDHWRITE;  else assign m1s15GatedHWRITE = 1'b0;
    if (M1_AHBSLOTENABLE[16])  assign m1s16GatedHWRITE  = M1GATEDHWRITE;  else assign m1s16GatedHWRITE = 1'b0;
    if (M2_AHBSLOTENABLE[0])  assign m2s0GatedHWRITE  = M2GATEDHWRITE;  else assign m2s0GatedHWRITE = 1'b0;
    if (M2_AHBSLOTENABLE[1])  assign m2s1GatedHWRITE  = M2GATEDHWRITE;  else assign m2s1GatedHWRITE = 1'b0;
    if (M2_AHBSLOTENABLE[2])  assign m2s2GatedHWRITE  = M2GATEDHWRITE;  else assign m2s2GatedHWRITE = 1'b0;
    if (M2_AHBSLOTENABLE[3])  assign m2s3GatedHWRITE  = M2GATEDHWRITE;  else assign m2s3GatedHWRITE = 1'b0;
    if (M2_AHBSLOTENABLE[4])  assign m2s4GatedHWRITE  = M2GATEDHWRITE;  else assign m2s4GatedHWRITE = 1'b0;
    if (M2_AHBSLOTENABLE[5])  assign m2s5GatedHWRITE  = M2GATEDHWRITE;  else assign m2s5GatedHWRITE = 1'b0;
    if (M2_AHBSLOTENABLE[6])  assign m2s6GatedHWRITE  = M2GATEDHWRITE;  else assign m2s6GatedHWRITE = 1'b0;
    if (M2_AHBSLOTENABLE[7])  assign m2s7GatedHWRITE  = M2GATEDHWRITE;  else assign m2s7GatedHWRITE = 1'b0;
    if (M2_AHBSLOTENABLE[8])  assign m2s8GatedHWRITE  = M2GATEDHWRITE;  else assign m2s8GatedHWRITE = 1'b0;
    if (M2_AHBSLOTENABLE[9])  assign m2s9GatedHWRITE  = M2GATEDHWRITE;  else assign m2s9GatedHWRITE = 1'b0;
    if (M2_AHBSLOTENABLE[10])  assign m2s10GatedHWRITE  = M2GATEDHWRITE;  else assign m2s10GatedHWRITE = 1'b0;
    if (M2_AHBSLOTENABLE[11])  assign m2s11GatedHWRITE  = M2GATEDHWRITE;  else assign m2s11GatedHWRITE = 1'b0;
    if (M2_AHBSLOTENABLE[12])  assign m2s12GatedHWRITE  = M2GATEDHWRITE;  else assign m2s12GatedHWRITE = 1'b0;
    if (M2_AHBSLOTENABLE[13])  assign m2s13GatedHWRITE  = M2GATEDHWRITE;  else assign m2s13GatedHWRITE = 1'b0;
    if (M2_AHBSLOTENABLE[14])  assign m2s14GatedHWRITE  = M2GATEDHWRITE;  else assign m2s14GatedHWRITE = 1'b0;
    if (M2_AHBSLOTENABLE[15])  assign m2s15GatedHWRITE  = M2GATEDHWRITE;  else assign m2s15GatedHWRITE = 1'b0;
    if (M2_AHBSLOTENABLE[16])  assign m2s16GatedHWRITE  = M2GATEDHWRITE;  else assign m2s16GatedHWRITE = 1'b0;
    if (M3_AHBSLOTENABLE[0])  assign m3s0GatedHWRITE  = M3GATEDHWRITE;  else assign m3s0GatedHWRITE = 1'b0;
    if (M3_AHBSLOTENABLE[1])  assign m3s1GatedHWRITE  = M3GATEDHWRITE;  else assign m3s1GatedHWRITE = 1'b0;
    if (M3_AHBSLOTENABLE[2])  assign m3s2GatedHWRITE  = M3GATEDHWRITE;  else assign m3s2GatedHWRITE = 1'b0;
    if (M3_AHBSLOTENABLE[3])  assign m3s3GatedHWRITE  = M3GATEDHWRITE;  else assign m3s3GatedHWRITE = 1'b0;
    if (M3_AHBSLOTENABLE[4])  assign m3s4GatedHWRITE  = M3GATEDHWRITE;  else assign m3s4GatedHWRITE = 1'b0;
    if (M3_AHBSLOTENABLE[5])  assign m3s5GatedHWRITE  = M3GATEDHWRITE;  else assign m3s5GatedHWRITE = 1'b0;
    if (M3_AHBSLOTENABLE[6])  assign m3s6GatedHWRITE  = M3GATEDHWRITE;  else assign m3s6GatedHWRITE = 1'b0;
    if (M3_AHBSLOTENABLE[7])  assign m3s7GatedHWRITE  = M3GATEDHWRITE;  else assign m3s7GatedHWRITE = 1'b0;
    if (M3_AHBSLOTENABLE[8])  assign m3s8GatedHWRITE  = M3GATEDHWRITE;  else assign m3s8GatedHWRITE = 1'b0;
    if (M3_AHBSLOTENABLE[9])  assign m3s9GatedHWRITE  = M3GATEDHWRITE;  else assign m3s9GatedHWRITE = 1'b0;
    if (M3_AHBSLOTENABLE[10])  assign m3s10GatedHWRITE  = M3GATEDHWRITE;  else assign m3s10GatedHWRITE = 1'b0;
    if (M3_AHBSLOTENABLE[11])  assign m3s11GatedHWRITE  = M3GATEDHWRITE;  else assign m3s11GatedHWRITE = 1'b0;
    if (M3_AHBSLOTENABLE[12])  assign m3s12GatedHWRITE  = M3GATEDHWRITE;  else assign m3s12GatedHWRITE = 1'b0;
    if (M3_AHBSLOTENABLE[13])  assign m3s13GatedHWRITE  = M3GATEDHWRITE;  else assign m3s13GatedHWRITE = 1'b0;
    if (M3_AHBSLOTENABLE[14])  assign m3s14GatedHWRITE  = M3GATEDHWRITE;  else assign m3s14GatedHWRITE = 1'b0;
    if (M3_AHBSLOTENABLE[15])  assign m3s15GatedHWRITE  = M3GATEDHWRITE;  else assign m3s15GatedHWRITE = 1'b0;
    if (M3_AHBSLOTENABLE[16])  assign m3s16GatedHWRITE  = M3GATEDHWRITE;  else assign m3s16GatedHWRITE = 1'b0;
  endgenerate
  generate
    if (M0_AHBSLOTENABLE[0])  assign m0s0PrevDataSlaveReady  = m0PrevDataSlaveReady;  else assign m0s0PrevDataSlaveReady = 1'b1;
    if (M0_AHBSLOTENABLE[1])  assign m0s1PrevDataSlaveReady  = m0PrevDataSlaveReady;  else assign m0s1PrevDataSlaveReady = 1'b1;
    if (M0_AHBSLOTENABLE[2])  assign m0s2PrevDataSlaveReady  = m0PrevDataSlaveReady;  else assign m0s2PrevDataSlaveReady = 1'b1;
    if (M0_AHBSLOTENABLE[3])  assign m0s3PrevDataSlaveReady  = m0PrevDataSlaveReady;  else assign m0s3PrevDataSlaveReady = 1'b1;
    if (M0_AHBSLOTENABLE[4])  assign m0s4PrevDataSlaveReady  = m0PrevDataSlaveReady;  else assign m0s4PrevDataSlaveReady = 1'b1;
    if (M0_AHBSLOTENABLE[5])  assign m0s5PrevDataSlaveReady  = m0PrevDataSlaveReady;  else assign m0s5PrevDataSlaveReady = 1'b1;
    if (M0_AHBSLOTENABLE[6])  assign m0s6PrevDataSlaveReady  = m0PrevDataSlaveReady;  else assign m0s6PrevDataSlaveReady = 1'b1;
    if (M0_AHBSLOTENABLE[7])  assign m0s7PrevDataSlaveReady  = m0PrevDataSlaveReady;  else assign m0s7PrevDataSlaveReady = 1'b1;
    if (M0_AHBSLOTENABLE[8])  assign m0s8PrevDataSlaveReady  = m0PrevDataSlaveReady;  else assign m0s8PrevDataSlaveReady = 1'b1;
    if (M0_AHBSLOTENABLE[9])  assign m0s9PrevDataSlaveReady  = m0PrevDataSlaveReady;  else assign m0s9PrevDataSlaveReady = 1'b1;
    if (M0_AHBSLOTENABLE[10])  assign m0s10PrevDataSlaveReady  = m0PrevDataSlaveReady;  else assign m0s10PrevDataSlaveReady = 1'b1;
    if (M0_AHBSLOTENABLE[11])  assign m0s11PrevDataSlaveReady  = m0PrevDataSlaveReady;  else assign m0s11PrevDataSlaveReady = 1'b1;
    if (M0_AHBSLOTENABLE[12])  assign m0s12PrevDataSlaveReady  = m0PrevDataSlaveReady;  else assign m0s12PrevDataSlaveReady = 1'b1;
    if (M0_AHBSLOTENABLE[13])  assign m0s13PrevDataSlaveReady  = m0PrevDataSlaveReady;  else assign m0s13PrevDataSlaveReady = 1'b1;
    if (M0_AHBSLOTENABLE[14])  assign m0s14PrevDataSlaveReady  = m0PrevDataSlaveReady;  else assign m0s14PrevDataSlaveReady = 1'b1;
    if (M0_AHBSLOTENABLE[15])  assign m0s15PrevDataSlaveReady  = m0PrevDataSlaveReady;  else assign m0s15PrevDataSlaveReady = 1'b1;
    if (M0_AHBSLOTENABLE[16])  assign m0s16PrevDataSlaveReady  = m0PrevDataSlaveReady;  else assign m0s16PrevDataSlaveReady = 1'b1;
    if (M1_AHBSLOTENABLE[0])  assign m1s0PrevDataSlaveReady  = m1PrevDataSlaveReady;  else assign m1s0PrevDataSlaveReady = 1'b1;
    if (M1_AHBSLOTENABLE[1])  assign m1s1PrevDataSlaveReady  = m1PrevDataSlaveReady;  else assign m1s1PrevDataSlaveReady = 1'b1;
    if (M1_AHBSLOTENABLE[2])  assign m1s2PrevDataSlaveReady  = m1PrevDataSlaveReady;  else assign m1s2PrevDataSlaveReady = 1'b1;
    if (M1_AHBSLOTENABLE[3])  assign m1s3PrevDataSlaveReady  = m1PrevDataSlaveReady;  else assign m1s3PrevDataSlaveReady = 1'b1;
    if (M1_AHBSLOTENABLE[4])  assign m1s4PrevDataSlaveReady  = m1PrevDataSlaveReady;  else assign m1s4PrevDataSlaveReady = 1'b1;
    if (M1_AHBSLOTENABLE[5])  assign m1s5PrevDataSlaveReady  = m1PrevDataSlaveReady;  else assign m1s5PrevDataSlaveReady = 1'b1;
    if (M1_AHBSLOTENABLE[6])  assign m1s6PrevDataSlaveReady  = m1PrevDataSlaveReady;  else assign m1s6PrevDataSlaveReady = 1'b1;
    if (M1_AHBSLOTENABLE[7])  assign m1s7PrevDataSlaveReady  = m1PrevDataSlaveReady;  else assign m1s7PrevDataSlaveReady = 1'b1;
    if (M1_AHBSLOTENABLE[8])  assign m1s8PrevDataSlaveReady  = m1PrevDataSlaveReady;  else assign m1s8PrevDataSlaveReady = 1'b1;
    if (M1_AHBSLOTENABLE[9])  assign m1s9PrevDataSlaveReady  = m1PrevDataSlaveReady;  else assign m1s9PrevDataSlaveReady = 1'b1;
    if (M1_AHBSLOTENABLE[10])  assign m1s10PrevDataSlaveReady  = m1PrevDataSlaveReady;  else assign m1s10PrevDataSlaveReady = 1'b1;
    if (M1_AHBSLOTENABLE[11])  assign m1s11PrevDataSlaveReady  = m1PrevDataSlaveReady;  else assign m1s11PrevDataSlaveReady = 1'b1;
    if (M1_AHBSLOTENABLE[12])  assign m1s12PrevDataSlaveReady  = m1PrevDataSlaveReady;  else assign m1s12PrevDataSlaveReady = 1'b1;
    if (M1_AHBSLOTENABLE[13])  assign m1s13PrevDataSlaveReady  = m1PrevDataSlaveReady;  else assign m1s13PrevDataSlaveReady = 1'b1;
    if (M1_AHBSLOTENABLE[14])  assign m1s14PrevDataSlaveReady  = m1PrevDataSlaveReady;  else assign m1s14PrevDataSlaveReady = 1'b1;
    if (M1_AHBSLOTENABLE[15])  assign m1s15PrevDataSlaveReady  = m1PrevDataSlaveReady;  else assign m1s15PrevDataSlaveReady = 1'b1;
    if (M1_AHBSLOTENABLE[16])  assign m1s16PrevDataSlaveReady  = m1PrevDataSlaveReady;  else assign m1s16PrevDataSlaveReady = 1'b1;
    if (M2_AHBSLOTENABLE[0])  assign m2s0PrevDataSlaveReady  = m2PrevDataSlaveReady;  else assign m2s0PrevDataSlaveReady = 1'b1;
    if (M2_AHBSLOTENABLE[1])  assign m2s1PrevDataSlaveReady  = m2PrevDataSlaveReady;  else assign m2s1PrevDataSlaveReady = 1'b1;
    if (M2_AHBSLOTENABLE[2])  assign m2s2PrevDataSlaveReady  = m2PrevDataSlaveReady;  else assign m2s2PrevDataSlaveReady = 1'b1;
    if (M2_AHBSLOTENABLE[3])  assign m2s3PrevDataSlaveReady  = m2PrevDataSlaveReady;  else assign m2s3PrevDataSlaveReady = 1'b1;
    if (M2_AHBSLOTENABLE[4])  assign m2s4PrevDataSlaveReady  = m2PrevDataSlaveReady;  else assign m2s4PrevDataSlaveReady = 1'b1;
    if (M2_AHBSLOTENABLE[5])  assign m2s5PrevDataSlaveReady  = m2PrevDataSlaveReady;  else assign m2s5PrevDataSlaveReady = 1'b1;
    if (M2_AHBSLOTENABLE[6])  assign m2s6PrevDataSlaveReady  = m2PrevDataSlaveReady;  else assign m2s6PrevDataSlaveReady = 1'b1;
    if (M2_AHBSLOTENABLE[7])  assign m2s7PrevDataSlaveReady  = m2PrevDataSlaveReady;  else assign m2s7PrevDataSlaveReady = 1'b1;
    if (M2_AHBSLOTENABLE[8])  assign m2s8PrevDataSlaveReady  = m2PrevDataSlaveReady;  else assign m2s8PrevDataSlaveReady = 1'b1;
    if (M2_AHBSLOTENABLE[9])  assign m2s9PrevDataSlaveReady  = m2PrevDataSlaveReady;  else assign m2s9PrevDataSlaveReady = 1'b1;
    if (M2_AHBSLOTENABLE[10])  assign m2s10PrevDataSlaveReady  = m2PrevDataSlaveReady;  else assign m2s10PrevDataSlaveReady = 1'b1;
    if (M2_AHBSLOTENABLE[11])  assign m2s11PrevDataSlaveReady  = m2PrevDataSlaveReady;  else assign m2s11PrevDataSlaveReady = 1'b1;
    if (M2_AHBSLOTENABLE[12])  assign m2s12PrevDataSlaveReady  = m2PrevDataSlaveReady;  else assign m2s12PrevDataSlaveReady = 1'b1;
    if (M2_AHBSLOTENABLE[13])  assign m2s13PrevDataSlaveReady  = m2PrevDataSlaveReady;  else assign m2s13PrevDataSlaveReady = 1'b1;
    if (M2_AHBSLOTENABLE[14])  assign m2s14PrevDataSlaveReady  = m2PrevDataSlaveReady;  else assign m2s14PrevDataSlaveReady = 1'b1;
    if (M2_AHBSLOTENABLE[15])  assign m2s15PrevDataSlaveReady  = m2PrevDataSlaveReady;  else assign m2s15PrevDataSlaveReady = 1'b1;
    if (M2_AHBSLOTENABLE[16])  assign m2s16PrevDataSlaveReady  = m2PrevDataSlaveReady;  else assign m2s16PrevDataSlaveReady = 1'b1;
    if (M3_AHBSLOTENABLE[0])  assign m3s0PrevDataSlaveReady  = m3PrevDataSlaveReady;  else assign m3s0PrevDataSlaveReady = 1'b1;
    if (M3_AHBSLOTENABLE[1])  assign m3s1PrevDataSlaveReady  = m3PrevDataSlaveReady;  else assign m3s1PrevDataSlaveReady = 1'b1;
    if (M3_AHBSLOTENABLE[2])  assign m3s2PrevDataSlaveReady  = m3PrevDataSlaveReady;  else assign m3s2PrevDataSlaveReady = 1'b1;
    if (M3_AHBSLOTENABLE[3])  assign m3s3PrevDataSlaveReady  = m3PrevDataSlaveReady;  else assign m3s3PrevDataSlaveReady = 1'b1;
    if (M3_AHBSLOTENABLE[4])  assign m3s4PrevDataSlaveReady  = m3PrevDataSlaveReady;  else assign m3s4PrevDataSlaveReady = 1'b1;
    if (M3_AHBSLOTENABLE[5])  assign m3s5PrevDataSlaveReady  = m3PrevDataSlaveReady;  else assign m3s5PrevDataSlaveReady = 1'b1;
    if (M3_AHBSLOTENABLE[6])  assign m3s6PrevDataSlaveReady  = m3PrevDataSlaveReady;  else assign m3s6PrevDataSlaveReady = 1'b1;
    if (M3_AHBSLOTENABLE[7])  assign m3s7PrevDataSlaveReady  = m3PrevDataSlaveReady;  else assign m3s7PrevDataSlaveReady = 1'b1;
    if (M3_AHBSLOTENABLE[8])  assign m3s8PrevDataSlaveReady  = m3PrevDataSlaveReady;  else assign m3s8PrevDataSlaveReady = 1'b1;
    if (M3_AHBSLOTENABLE[9])  assign m3s9PrevDataSlaveReady  = m3PrevDataSlaveReady;  else assign m3s9PrevDataSlaveReady = 1'b1;
    if (M3_AHBSLOTENABLE[10])  assign m3s10PrevDataSlaveReady  = m3PrevDataSlaveReady;  else assign m3s10PrevDataSlaveReady = 1'b1;
    if (M3_AHBSLOTENABLE[11])  assign m3s11PrevDataSlaveReady  = m3PrevDataSlaveReady;  else assign m3s11PrevDataSlaveReady = 1'b1;
    if (M3_AHBSLOTENABLE[12])  assign m3s12PrevDataSlaveReady  = m3PrevDataSlaveReady;  else assign m3s12PrevDataSlaveReady = 1'b1;
    if (M3_AHBSLOTENABLE[13])  assign m3s13PrevDataSlaveReady  = m3PrevDataSlaveReady;  else assign m3s13PrevDataSlaveReady = 1'b1;
    if (M3_AHBSLOTENABLE[14])  assign m3s14PrevDataSlaveReady  = m3PrevDataSlaveReady;  else assign m3s14PrevDataSlaveReady = 1'b1;
    if (M3_AHBSLOTENABLE[15])  assign m3s15PrevDataSlaveReady  = m3PrevDataSlaveReady;  else assign m3s15PrevDataSlaveReady = 1'b1;
    if (M3_AHBSLOTENABLE[16])  assign m3s16PrevDataSlaveReady  = m3PrevDataSlaveReady;  else assign m3s16PrevDataSlaveReady = 1'b1;
  endgenerate
  generate
    if (M0_AHBSLOTENABLE[0])  assign M0_HRDATA_S0  = HRDATA_S0;  else assign M0_HRDATA_S0 = 32'h0;
    if (M0_AHBSLOTENABLE[1])  assign M0_HRDATA_S1  = HRDATA_S1;  else assign M0_HRDATA_S1 = 32'h0;
    if (M0_AHBSLOTENABLE[2])  assign M0_HRDATA_S2  = HRDATA_S2;  else assign M0_HRDATA_S2 = 32'h0;
    if (M0_AHBSLOTENABLE[3])  assign M0_HRDATA_S3  = HRDATA_S3;  else assign M0_HRDATA_S3 = 32'h0;
    if (M0_AHBSLOTENABLE[4])  assign M0_HRDATA_S4  = HRDATA_S4;  else assign M0_HRDATA_S4 = 32'h0;
    if (M0_AHBSLOTENABLE[5])  assign M0_HRDATA_S5  = HRDATA_S5;  else assign M0_HRDATA_S5 = 32'h0;
    if (M0_AHBSLOTENABLE[6])  assign M0_HRDATA_S6  = HRDATA_S6;  else assign M0_HRDATA_S6 = 32'h0;
    if (M0_AHBSLOTENABLE[7])  assign M0_HRDATA_S7  = HRDATA_S7;  else assign M0_HRDATA_S7 = 32'h0;
    if (M0_AHBSLOTENABLE[8])  assign M0_HRDATA_S8  = HRDATA_S8;  else assign M0_HRDATA_S8 = 32'h0;
    if (M0_AHBSLOTENABLE[9])  assign M0_HRDATA_S9  = HRDATA_S9;  else assign M0_HRDATA_S9 = 32'h0;
    if (M0_AHBSLOTENABLE[10])  assign M0_HRDATA_S10  = HRDATA_S10;  else assign M0_HRDATA_S10 = 32'h0;
    if (M0_AHBSLOTENABLE[11])  assign M0_HRDATA_S11  = HRDATA_S11;  else assign M0_HRDATA_S11 = 32'h0;
    if (M0_AHBSLOTENABLE[12])  assign M0_HRDATA_S12  = HRDATA_S12;  else assign M0_HRDATA_S12 = 32'h0;
    if (M0_AHBSLOTENABLE[13])  assign M0_HRDATA_S13  = HRDATA_S13;  else assign M0_HRDATA_S13 = 32'h0;
    if (M0_AHBSLOTENABLE[14])  assign M0_HRDATA_S14  = HRDATA_S14;  else assign M0_HRDATA_S14 = 32'h0;
    if (M0_AHBSLOTENABLE[15])  assign M0_HRDATA_S15  = HRDATA_S15;  else assign M0_HRDATA_S15 = 32'h0;
    if (M0_AHBSLOTENABLE[16])  assign M0_HRDATA_S16  = HRDATA_S16;  else assign M0_HRDATA_S16 = 32'h0;
    if (M1_AHBSLOTENABLE[0])  assign M1_HRDATA_S0  = HRDATA_S0;  else assign M1_HRDATA_S0 = 32'h0;
    if (M1_AHBSLOTENABLE[1])  assign M1_HRDATA_S1  = HRDATA_S1;  else assign M1_HRDATA_S1 = 32'h0;
    if (M1_AHBSLOTENABLE[2])  assign M1_HRDATA_S2  = HRDATA_S2;  else assign M1_HRDATA_S2 = 32'h0;
    if (M1_AHBSLOTENABLE[3])  assign M1_HRDATA_S3  = HRDATA_S3;  else assign M1_HRDATA_S3 = 32'h0;
    if (M1_AHBSLOTENABLE[4])  assign M1_HRDATA_S4  = HRDATA_S4;  else assign M1_HRDATA_S4 = 32'h0;
    if (M1_AHBSLOTENABLE[5])  assign M1_HRDATA_S5  = HRDATA_S5;  else assign M1_HRDATA_S5 = 32'h0;
    if (M1_AHBSLOTENABLE[6])  assign M1_HRDATA_S6  = HRDATA_S6;  else assign M1_HRDATA_S6 = 32'h0;
    if (M1_AHBSLOTENABLE[7])  assign M1_HRDATA_S7  = HRDATA_S7;  else assign M1_HRDATA_S7 = 32'h0;
    if (M1_AHBSLOTENABLE[8])  assign M1_HRDATA_S8  = HRDATA_S8;  else assign M1_HRDATA_S8 = 32'h0;
    if (M1_AHBSLOTENABLE[9])  assign M1_HRDATA_S9  = HRDATA_S9;  else assign M1_HRDATA_S9 = 32'h0;
    if (M1_AHBSLOTENABLE[10])  assign M1_HRDATA_S10  = HRDATA_S10;  else assign M1_HRDATA_S10 = 32'h0;
    if (M1_AHBSLOTENABLE[11])  assign M1_HRDATA_S11  = HRDATA_S11;  else assign M1_HRDATA_S11 = 32'h0;
    if (M1_AHBSLOTENABLE[12])  assign M1_HRDATA_S12  = HRDATA_S12;  else assign M1_HRDATA_S12 = 32'h0;
    if (M1_AHBSLOTENABLE[13])  assign M1_HRDATA_S13  = HRDATA_S13;  else assign M1_HRDATA_S13 = 32'h0;
    if (M1_AHBSLOTENABLE[14])  assign M1_HRDATA_S14  = HRDATA_S14;  else assign M1_HRDATA_S14 = 32'h0;
    if (M1_AHBSLOTENABLE[15])  assign M1_HRDATA_S15  = HRDATA_S15;  else assign M1_HRDATA_S15 = 32'h0;
    if (M1_AHBSLOTENABLE[16])  assign M1_HRDATA_S16  = HRDATA_S16;  else assign M1_HRDATA_S16 = 32'h0;
    if (M2_AHBSLOTENABLE[0])  assign M2_HRDATA_S0  = HRDATA_S0;  else assign M2_HRDATA_S0 = 32'h0;
    if (M2_AHBSLOTENABLE[1])  assign M2_HRDATA_S1  = HRDATA_S1;  else assign M2_HRDATA_S1 = 32'h0;
    if (M2_AHBSLOTENABLE[2])  assign M2_HRDATA_S2  = HRDATA_S2;  else assign M2_HRDATA_S2 = 32'h0;
    if (M2_AHBSLOTENABLE[3])  assign M2_HRDATA_S3  = HRDATA_S3;  else assign M2_HRDATA_S3 = 32'h0;
    if (M2_AHBSLOTENABLE[4])  assign M2_HRDATA_S4  = HRDATA_S4;  else assign M2_HRDATA_S4 = 32'h0;
    if (M2_AHBSLOTENABLE[5])  assign M2_HRDATA_S5  = HRDATA_S5;  else assign M2_HRDATA_S5 = 32'h0;
    if (M2_AHBSLOTENABLE[6])  assign M2_HRDATA_S6  = HRDATA_S6;  else assign M2_HRDATA_S6 = 32'h0;
    if (M2_AHBSLOTENABLE[7])  assign M2_HRDATA_S7  = HRDATA_S7;  else assign M2_HRDATA_S7 = 32'h0;
    if (M2_AHBSLOTENABLE[8])  assign M2_HRDATA_S8  = HRDATA_S8;  else assign M2_HRDATA_S8 = 32'h0;
    if (M2_AHBSLOTENABLE[9])  assign M2_HRDATA_S9  = HRDATA_S9;  else assign M2_HRDATA_S9 = 32'h0;
    if (M2_AHBSLOTENABLE[10])  assign M2_HRDATA_S10  = HRDATA_S10;  else assign M2_HRDATA_S10 = 32'h0;
    if (M2_AHBSLOTENABLE[11])  assign M2_HRDATA_S11  = HRDATA_S11;  else assign M2_HRDATA_S11 = 32'h0;
    if (M2_AHBSLOTENABLE[12])  assign M2_HRDATA_S12  = HRDATA_S12;  else assign M2_HRDATA_S12 = 32'h0;
    if (M2_AHBSLOTENABLE[13])  assign M2_HRDATA_S13  = HRDATA_S13;  else assign M2_HRDATA_S13 = 32'h0;
    if (M2_AHBSLOTENABLE[14])  assign M2_HRDATA_S14  = HRDATA_S14;  else assign M2_HRDATA_S14 = 32'h0;
    if (M2_AHBSLOTENABLE[15])  assign M2_HRDATA_S15  = HRDATA_S15;  else assign M2_HRDATA_S15 = 32'h0;
    if (M2_AHBSLOTENABLE[16])  assign M2_HRDATA_S16  = HRDATA_S16;  else assign M2_HRDATA_S16 = 32'h0;
    if (M3_AHBSLOTENABLE[0])  assign M3_HRDATA_S0  = HRDATA_S0;  else assign M3_HRDATA_S0 = 32'h0;
    if (M3_AHBSLOTENABLE[1])  assign M3_HRDATA_S1  = HRDATA_S1;  else assign M3_HRDATA_S1 = 32'h0;
    if (M3_AHBSLOTENABLE[2])  assign M3_HRDATA_S2  = HRDATA_S2;  else assign M3_HRDATA_S2 = 32'h0;
    if (M3_AHBSLOTENABLE[3])  assign M3_HRDATA_S3  = HRDATA_S3;  else assign M3_HRDATA_S3 = 32'h0;
    if (M3_AHBSLOTENABLE[4])  assign M3_HRDATA_S4  = HRDATA_S4;  else assign M3_HRDATA_S4 = 32'h0;
    if (M3_AHBSLOTENABLE[5])  assign M3_HRDATA_S5  = HRDATA_S5;  else assign M3_HRDATA_S5 = 32'h0;
    if (M3_AHBSLOTENABLE[6])  assign M3_HRDATA_S6  = HRDATA_S6;  else assign M3_HRDATA_S6 = 32'h0;
    if (M3_AHBSLOTENABLE[7])  assign M3_HRDATA_S7  = HRDATA_S7;  else assign M3_HRDATA_S7 = 32'h0;
    if (M3_AHBSLOTENABLE[8])  assign M3_HRDATA_S8  = HRDATA_S8;  else assign M3_HRDATA_S8 = 32'h0;
    if (M3_AHBSLOTENABLE[9])  assign M3_HRDATA_S9  = HRDATA_S9;  else assign M3_HRDATA_S9 = 32'h0;
    if (M3_AHBSLOTENABLE[10])  assign M3_HRDATA_S10  = HRDATA_S10;  else assign M3_HRDATA_S10 = 32'h0;
    if (M3_AHBSLOTENABLE[11])  assign M3_HRDATA_S11  = HRDATA_S11;  else assign M3_HRDATA_S11 = 32'h0;
    if (M3_AHBSLOTENABLE[12])  assign M3_HRDATA_S12  = HRDATA_S12;  else assign M3_HRDATA_S12 = 32'h0;
    if (M3_AHBSLOTENABLE[13])  assign M3_HRDATA_S13  = HRDATA_S13;  else assign M3_HRDATA_S13 = 32'h0;
    if (M3_AHBSLOTENABLE[14])  assign M3_HRDATA_S14  = HRDATA_S14;  else assign M3_HRDATA_S14 = 32'h0;
    if (M3_AHBSLOTENABLE[15])  assign M3_HRDATA_S15  = HRDATA_S15;  else assign M3_HRDATA_S15 = 32'h0;
    if (M3_AHBSLOTENABLE[16])  assign M3_HRDATA_S16  = HRDATA_S16;  else assign M3_HRDATA_S16 = 32'h0;
  endgenerate
  generate
    if (M0_AHBSLOTENABLE[0])  assign HWDATA_M0S0  = HWDATA_M0;  else assign HWDATA_M0S0 = 32'h0;
    if (M0_AHBSLOTENABLE[1])  assign HWDATA_M0S1  = HWDATA_M0;  else assign HWDATA_M0S1 = 32'h0;
    if (M0_AHBSLOTENABLE[2])  assign HWDATA_M0S2  = HWDATA_M0;  else assign HWDATA_M0S2 = 32'h0;
    if (M0_AHBSLOTENABLE[3])  assign HWDATA_M0S3  = HWDATA_M0;  else assign HWDATA_M0S3 = 32'h0;
    if (M0_AHBSLOTENABLE[4])  assign HWDATA_M0S4  = HWDATA_M0;  else assign HWDATA_M0S4 = 32'h0;
    if (M0_AHBSLOTENABLE[5])  assign HWDATA_M0S5  = HWDATA_M0;  else assign HWDATA_M0S5 = 32'h0;
    if (M0_AHBSLOTENABLE[6])  assign HWDATA_M0S6  = HWDATA_M0;  else assign HWDATA_M0S6 = 32'h0;
    if (M0_AHBSLOTENABLE[7])  assign HWDATA_M0S7  = HWDATA_M0;  else assign HWDATA_M0S7 = 32'h0;
    if (M0_AHBSLOTENABLE[8])  assign HWDATA_M0S8  = HWDATA_M0;  else assign HWDATA_M0S8 = 32'h0;
    if (M0_AHBSLOTENABLE[9])  assign HWDATA_M0S9  = HWDATA_M0;  else assign HWDATA_M0S9 = 32'h0;
    if (M0_AHBSLOTENABLE[10])  assign HWDATA_M0S10  = HWDATA_M0;  else assign HWDATA_M0S10 = 32'h0;
    if (M0_AHBSLOTENABLE[11])  assign HWDATA_M0S11  = HWDATA_M0;  else assign HWDATA_M0S11 = 32'h0;
    if (M0_AHBSLOTENABLE[12])  assign HWDATA_M0S12  = HWDATA_M0;  else assign HWDATA_M0S12 = 32'h0;
    if (M0_AHBSLOTENABLE[13])  assign HWDATA_M0S13  = HWDATA_M0;  else assign HWDATA_M0S13 = 32'h0;
    if (M0_AHBSLOTENABLE[14])  assign HWDATA_M0S14  = HWDATA_M0;  else assign HWDATA_M0S14 = 32'h0;
    if (M0_AHBSLOTENABLE[15])  assign HWDATA_M0S15  = HWDATA_M0;  else assign HWDATA_M0S15 = 32'h0;
    if (M0_AHBSLOTENABLE[16])  assign HWDATA_M0S16  = HWDATA_M0;  else assign HWDATA_M0S16 = 32'h0;
    if (M1_AHBSLOTENABLE[0])  assign HWDATA_M1S0  = HWDATA_M1;  else assign HWDATA_M1S0 = 32'h0;
    if (M1_AHBSLOTENABLE[1])  assign HWDATA_M1S1  = HWDATA_M1;  else assign HWDATA_M1S1 = 32'h0;
    if (M1_AHBSLOTENABLE[2])  assign HWDATA_M1S2  = HWDATA_M1;  else assign HWDATA_M1S2 = 32'h0;
    if (M1_AHBSLOTENABLE[3])  assign HWDATA_M1S3  = HWDATA_M1;  else assign HWDATA_M1S3 = 32'h0;
    if (M1_AHBSLOTENABLE[4])  assign HWDATA_M1S4  = HWDATA_M1;  else assign HWDATA_M1S4 = 32'h0;
    if (M1_AHBSLOTENABLE[5])  assign HWDATA_M1S5  = HWDATA_M1;  else assign HWDATA_M1S5 = 32'h0;
    if (M1_AHBSLOTENABLE[6])  assign HWDATA_M1S6  = HWDATA_M1;  else assign HWDATA_M1S6 = 32'h0;
    if (M1_AHBSLOTENABLE[7])  assign HWDATA_M1S7  = HWDATA_M1;  else assign HWDATA_M1S7 = 32'h0;
    if (M1_AHBSLOTENABLE[8])  assign HWDATA_M1S8  = HWDATA_M1;  else assign HWDATA_M1S8 = 32'h0;
    if (M1_AHBSLOTENABLE[9])  assign HWDATA_M1S9  = HWDATA_M1;  else assign HWDATA_M1S9 = 32'h0;
    if (M1_AHBSLOTENABLE[10])  assign HWDATA_M1S10  = HWDATA_M1;  else assign HWDATA_M1S10 = 32'h0;
    if (M1_AHBSLOTENABLE[11])  assign HWDATA_M1S11  = HWDATA_M1;  else assign HWDATA_M1S11 = 32'h0;
    if (M1_AHBSLOTENABLE[12])  assign HWDATA_M1S12  = HWDATA_M1;  else assign HWDATA_M1S12 = 32'h0;
    if (M1_AHBSLOTENABLE[13])  assign HWDATA_M1S13  = HWDATA_M1;  else assign HWDATA_M1S13 = 32'h0;
    if (M1_AHBSLOTENABLE[14])  assign HWDATA_M1S14  = HWDATA_M1;  else assign HWDATA_M1S14 = 32'h0;
    if (M1_AHBSLOTENABLE[15])  assign HWDATA_M1S15  = HWDATA_M1;  else assign HWDATA_M1S15 = 32'h0;
    if (M1_AHBSLOTENABLE[16])  assign HWDATA_M1S16  = HWDATA_M1;  else assign HWDATA_M1S16 = 32'h0;
    if (M2_AHBSLOTENABLE[0])  assign HWDATA_M2S0  = HWDATA_M2;  else assign HWDATA_M2S0 = 32'h0;
    if (M2_AHBSLOTENABLE[1])  assign HWDATA_M2S1  = HWDATA_M2;  else assign HWDATA_M2S1 = 32'h0;
    if (M2_AHBSLOTENABLE[2])  assign HWDATA_M2S2  = HWDATA_M2;  else assign HWDATA_M2S2 = 32'h0;
    if (M2_AHBSLOTENABLE[3])  assign HWDATA_M2S3  = HWDATA_M2;  else assign HWDATA_M2S3 = 32'h0;
    if (M2_AHBSLOTENABLE[4])  assign HWDATA_M2S4  = HWDATA_M2;  else assign HWDATA_M2S4 = 32'h0;
    if (M2_AHBSLOTENABLE[5])  assign HWDATA_M2S5  = HWDATA_M2;  else assign HWDATA_M2S5 = 32'h0;
    if (M2_AHBSLOTENABLE[6])  assign HWDATA_M2S6  = HWDATA_M2;  else assign HWDATA_M2S6 = 32'h0;
    if (M2_AHBSLOTENABLE[7])  assign HWDATA_M2S7  = HWDATA_M2;  else assign HWDATA_M2S7 = 32'h0;
    if (M2_AHBSLOTENABLE[8])  assign HWDATA_M2S8  = HWDATA_M2;  else assign HWDATA_M2S8 = 32'h0;
    if (M2_AHBSLOTENABLE[9])  assign HWDATA_M2S9  = HWDATA_M2;  else assign HWDATA_M2S9 = 32'h0;
    if (M2_AHBSLOTENABLE[10])  assign HWDATA_M2S10  = HWDATA_M2;  else assign HWDATA_M2S10 = 32'h0;
    if (M2_AHBSLOTENABLE[11])  assign HWDATA_M2S11  = HWDATA_M2;  else assign HWDATA_M2S11 = 32'h0;
    if (M2_AHBSLOTENABLE[12])  assign HWDATA_M2S12  = HWDATA_M2;  else assign HWDATA_M2S12 = 32'h0;
    if (M2_AHBSLOTENABLE[13])  assign HWDATA_M2S13  = HWDATA_M2;  else assign HWDATA_M2S13 = 32'h0;
    if (M2_AHBSLOTENABLE[14])  assign HWDATA_M2S14  = HWDATA_M2;  else assign HWDATA_M2S14 = 32'h0;
    if (M2_AHBSLOTENABLE[15])  assign HWDATA_M2S15  = HWDATA_M2;  else assign HWDATA_M2S15 = 32'h0;
    if (M2_AHBSLOTENABLE[16])  assign HWDATA_M2S16  = HWDATA_M2;  else assign HWDATA_M2S16 = 32'h0;
    if (M3_AHBSLOTENABLE[0])  assign HWDATA_M3S0  = HWDATA_M3;  else assign HWDATA_M3S0 = 32'h0;
    if (M3_AHBSLOTENABLE[1])  assign HWDATA_M3S1  = HWDATA_M3;  else assign HWDATA_M3S1 = 32'h0;
    if (M3_AHBSLOTENABLE[2])  assign HWDATA_M3S2  = HWDATA_M3;  else assign HWDATA_M3S2 = 32'h0;
    if (M3_AHBSLOTENABLE[3])  assign HWDATA_M3S3  = HWDATA_M3;  else assign HWDATA_M3S3 = 32'h0;
    if (M3_AHBSLOTENABLE[4])  assign HWDATA_M3S4  = HWDATA_M3;  else assign HWDATA_M3S4 = 32'h0;
    if (M3_AHBSLOTENABLE[5])  assign HWDATA_M3S5  = HWDATA_M3;  else assign HWDATA_M3S5 = 32'h0;
    if (M3_AHBSLOTENABLE[6])  assign HWDATA_M3S6  = HWDATA_M3;  else assign HWDATA_M3S6 = 32'h0;
    if (M3_AHBSLOTENABLE[7])  assign HWDATA_M3S7  = HWDATA_M3;  else assign HWDATA_M3S7 = 32'h0;
    if (M3_AHBSLOTENABLE[8])  assign HWDATA_M3S8  = HWDATA_M3;  else assign HWDATA_M3S8 = 32'h0;
    if (M3_AHBSLOTENABLE[9])  assign HWDATA_M3S9  = HWDATA_M3;  else assign HWDATA_M3S9 = 32'h0;
    if (M3_AHBSLOTENABLE[10])  assign HWDATA_M3S10  = HWDATA_M3;  else assign HWDATA_M3S10 = 32'h0;
    if (M3_AHBSLOTENABLE[11])  assign HWDATA_M3S11  = HWDATA_M3;  else assign HWDATA_M3S11 = 32'h0;
    if (M3_AHBSLOTENABLE[12])  assign HWDATA_M3S12  = HWDATA_M3;  else assign HWDATA_M3S12 = 32'h0;
    if (M3_AHBSLOTENABLE[13])  assign HWDATA_M3S13  = HWDATA_M3;  else assign HWDATA_M3S13 = 32'h0;
    if (M3_AHBSLOTENABLE[14])  assign HWDATA_M3S14  = HWDATA_M3;  else assign HWDATA_M3S14 = 32'h0;
    if (M3_AHBSLOTENABLE[15])  assign HWDATA_M3S15  = HWDATA_M3;  else assign HWDATA_M3S15 = 32'h0;
    if (M3_AHBSLOTENABLE[16])  assign HWDATA_M3S16  = HWDATA_M3;  else assign HWDATA_M3S16 = 32'h0;
  endgenerate
  generate
    if (M0_AHBSLOTENABLE[0])  assign M0_HREADYOUT_S0  = HREADYOUT_S0;  else assign M0_HREADYOUT_S0 = 1'b1;
    if (M0_AHBSLOTENABLE[1])  assign M0_HREADYOUT_S1  = HREADYOUT_S1;  else assign M0_HREADYOUT_S1 = 1'b1;
    if (M0_AHBSLOTENABLE[2])  assign M0_HREADYOUT_S2  = HREADYOUT_S2;  else assign M0_HREADYOUT_S2 = 1'b1;
    if (M0_AHBSLOTENABLE[3])  assign M0_HREADYOUT_S3  = HREADYOUT_S3;  else assign M0_HREADYOUT_S3 = 1'b1;
    if (M0_AHBSLOTENABLE[4])  assign M0_HREADYOUT_S4  = HREADYOUT_S4;  else assign M0_HREADYOUT_S4 = 1'b1;
    if (M0_AHBSLOTENABLE[5])  assign M0_HREADYOUT_S5  = HREADYOUT_S5;  else assign M0_HREADYOUT_S5 = 1'b1;
    if (M0_AHBSLOTENABLE[6])  assign M0_HREADYOUT_S6  = HREADYOUT_S6;  else assign M0_HREADYOUT_S6 = 1'b1;
    if (M0_AHBSLOTENABLE[7])  assign M0_HREADYOUT_S7  = HREADYOUT_S7;  else assign M0_HREADYOUT_S7 = 1'b1;
    if (M0_AHBSLOTENABLE[8])  assign M0_HREADYOUT_S8  = HREADYOUT_S8;  else assign M0_HREADYOUT_S8 = 1'b1;
    if (M0_AHBSLOTENABLE[9])  assign M0_HREADYOUT_S9  = HREADYOUT_S9;  else assign M0_HREADYOUT_S9 = 1'b1;
    if (M0_AHBSLOTENABLE[10])  assign M0_HREADYOUT_S10  = HREADYOUT_S10;  else assign M0_HREADYOUT_S10 = 1'b1;
    if (M0_AHBSLOTENABLE[11])  assign M0_HREADYOUT_S11  = HREADYOUT_S11;  else assign M0_HREADYOUT_S11 = 1'b1;
    if (M0_AHBSLOTENABLE[12])  assign M0_HREADYOUT_S12  = HREADYOUT_S12;  else assign M0_HREADYOUT_S12 = 1'b1;
    if (M0_AHBSLOTENABLE[13])  assign M0_HREADYOUT_S13  = HREADYOUT_S13;  else assign M0_HREADYOUT_S13 = 1'b1;
    if (M0_AHBSLOTENABLE[14])  assign M0_HREADYOUT_S14  = HREADYOUT_S14;  else assign M0_HREADYOUT_S14 = 1'b1;
    if (M0_AHBSLOTENABLE[15])  assign M0_HREADYOUT_S15  = HREADYOUT_S15;  else assign M0_HREADYOUT_S15 = 1'b1;
    if (M0_AHBSLOTENABLE[16])  assign M0_HREADYOUT_S16  = HREADYOUT_S16;  else assign M0_HREADYOUT_S16 = 1'b1;
    if (M1_AHBSLOTENABLE[0])  assign M1_HREADYOUT_S0  = HREADYOUT_S0;  else assign M1_HREADYOUT_S0 = 1'b1;
    if (M1_AHBSLOTENABLE[1])  assign M1_HREADYOUT_S1  = HREADYOUT_S1;  else assign M1_HREADYOUT_S1 = 1'b1;
    if (M1_AHBSLOTENABLE[2])  assign M1_HREADYOUT_S2  = HREADYOUT_S2;  else assign M1_HREADYOUT_S2 = 1'b1;
    if (M1_AHBSLOTENABLE[3])  assign M1_HREADYOUT_S3  = HREADYOUT_S3;  else assign M1_HREADYOUT_S3 = 1'b1;
    if (M1_AHBSLOTENABLE[4])  assign M1_HREADYOUT_S4  = HREADYOUT_S4;  else assign M1_HREADYOUT_S4 = 1'b1;
    if (M1_AHBSLOTENABLE[5])  assign M1_HREADYOUT_S5  = HREADYOUT_S5;  else assign M1_HREADYOUT_S5 = 1'b1;
    if (M1_AHBSLOTENABLE[6])  assign M1_HREADYOUT_S6  = HREADYOUT_S6;  else assign M1_HREADYOUT_S6 = 1'b1;
    if (M1_AHBSLOTENABLE[7])  assign M1_HREADYOUT_S7  = HREADYOUT_S7;  else assign M1_HREADYOUT_S7 = 1'b1;
    if (M1_AHBSLOTENABLE[8])  assign M1_HREADYOUT_S8  = HREADYOUT_S8;  else assign M1_HREADYOUT_S8 = 1'b1;
    if (M1_AHBSLOTENABLE[9])  assign M1_HREADYOUT_S9  = HREADYOUT_S9;  else assign M1_HREADYOUT_S9 = 1'b1;
    if (M1_AHBSLOTENABLE[10])  assign M1_HREADYOUT_S10  = HREADYOUT_S10;  else assign M1_HREADYOUT_S10 = 1'b1;
    if (M1_AHBSLOTENABLE[11])  assign M1_HREADYOUT_S11  = HREADYOUT_S11;  else assign M1_HREADYOUT_S11 = 1'b1;
    if (M1_AHBSLOTENABLE[12])  assign M1_HREADYOUT_S12  = HREADYOUT_S12;  else assign M1_HREADYOUT_S12 = 1'b1;
    if (M1_AHBSLOTENABLE[13])  assign M1_HREADYOUT_S13  = HREADYOUT_S13;  else assign M1_HREADYOUT_S13 = 1'b1;
    if (M1_AHBSLOTENABLE[14])  assign M1_HREADYOUT_S14  = HREADYOUT_S14;  else assign M1_HREADYOUT_S14 = 1'b1;
    if (M1_AHBSLOTENABLE[15])  assign M1_HREADYOUT_S15  = HREADYOUT_S15;  else assign M1_HREADYOUT_S15 = 1'b1;
    if (M1_AHBSLOTENABLE[16])  assign M1_HREADYOUT_S16  = HREADYOUT_S16;  else assign M1_HREADYOUT_S16 = 1'b1;
    if (M2_AHBSLOTENABLE[0])  assign M2_HREADYOUT_S0  = HREADYOUT_S0;  else assign M2_HREADYOUT_S0 = 1'b1;
    if (M2_AHBSLOTENABLE[1])  assign M2_HREADYOUT_S1  = HREADYOUT_S1;  else assign M2_HREADYOUT_S1 = 1'b1;
    if (M2_AHBSLOTENABLE[2])  assign M2_HREADYOUT_S2  = HREADYOUT_S2;  else assign M2_HREADYOUT_S2 = 1'b1;
    if (M2_AHBSLOTENABLE[3])  assign M2_HREADYOUT_S3  = HREADYOUT_S3;  else assign M2_HREADYOUT_S3 = 1'b1;
    if (M2_AHBSLOTENABLE[4])  assign M2_HREADYOUT_S4  = HREADYOUT_S4;  else assign M2_HREADYOUT_S4 = 1'b1;
    if (M2_AHBSLOTENABLE[5])  assign M2_HREADYOUT_S5  = HREADYOUT_S5;  else assign M2_HREADYOUT_S5 = 1'b1;
    if (M2_AHBSLOTENABLE[6])  assign M2_HREADYOUT_S6  = HREADYOUT_S6;  else assign M2_HREADYOUT_S6 = 1'b1;
    if (M2_AHBSLOTENABLE[7])  assign M2_HREADYOUT_S7  = HREADYOUT_S7;  else assign M2_HREADYOUT_S7 = 1'b1;
    if (M2_AHBSLOTENABLE[8])  assign M2_HREADYOUT_S8  = HREADYOUT_S8;  else assign M2_HREADYOUT_S8 = 1'b1;
    if (M2_AHBSLOTENABLE[9])  assign M2_HREADYOUT_S9  = HREADYOUT_S9;  else assign M2_HREADYOUT_S9 = 1'b1;
    if (M2_AHBSLOTENABLE[10])  assign M2_HREADYOUT_S10  = HREADYOUT_S10;  else assign M2_HREADYOUT_S10 = 1'b1;
    if (M2_AHBSLOTENABLE[11])  assign M2_HREADYOUT_S11  = HREADYOUT_S11;  else assign M2_HREADYOUT_S11 = 1'b1;
    if (M2_AHBSLOTENABLE[12])  assign M2_HREADYOUT_S12  = HREADYOUT_S12;  else assign M2_HREADYOUT_S12 = 1'b1;
    if (M2_AHBSLOTENABLE[13])  assign M2_HREADYOUT_S13  = HREADYOUT_S13;  else assign M2_HREADYOUT_S13 = 1'b1;
    if (M2_AHBSLOTENABLE[14])  assign M2_HREADYOUT_S14  = HREADYOUT_S14;  else assign M2_HREADYOUT_S14 = 1'b1;
    if (M2_AHBSLOTENABLE[15])  assign M2_HREADYOUT_S15  = HREADYOUT_S15;  else assign M2_HREADYOUT_S15 = 1'b1;
    if (M2_AHBSLOTENABLE[16])  assign M2_HREADYOUT_S16  = HREADYOUT_S16;  else assign M2_HREADYOUT_S16 = 1'b1;
    if (M3_AHBSLOTENABLE[0])  assign M3_HREADYOUT_S0  = HREADYOUT_S0;  else assign M3_HREADYOUT_S0 = 1'b1;
    if (M3_AHBSLOTENABLE[1])  assign M3_HREADYOUT_S1  = HREADYOUT_S1;  else assign M3_HREADYOUT_S1 = 1'b1;
    if (M3_AHBSLOTENABLE[2])  assign M3_HREADYOUT_S2  = HREADYOUT_S2;  else assign M3_HREADYOUT_S2 = 1'b1;
    if (M3_AHBSLOTENABLE[3])  assign M3_HREADYOUT_S3  = HREADYOUT_S3;  else assign M3_HREADYOUT_S3 = 1'b1;
    if (M3_AHBSLOTENABLE[4])  assign M3_HREADYOUT_S4  = HREADYOUT_S4;  else assign M3_HREADYOUT_S4 = 1'b1;
    if (M3_AHBSLOTENABLE[5])  assign M3_HREADYOUT_S5  = HREADYOUT_S5;  else assign M3_HREADYOUT_S5 = 1'b1;
    if (M3_AHBSLOTENABLE[6])  assign M3_HREADYOUT_S6  = HREADYOUT_S6;  else assign M3_HREADYOUT_S6 = 1'b1;
    if (M3_AHBSLOTENABLE[7])  assign M3_HREADYOUT_S7  = HREADYOUT_S7;  else assign M3_HREADYOUT_S7 = 1'b1;
    if (M3_AHBSLOTENABLE[8])  assign M3_HREADYOUT_S8  = HREADYOUT_S8;  else assign M3_HREADYOUT_S8 = 1'b1;
    if (M3_AHBSLOTENABLE[9])  assign M3_HREADYOUT_S9  = HREADYOUT_S9;  else assign M3_HREADYOUT_S9 = 1'b1;
    if (M3_AHBSLOTENABLE[10])  assign M3_HREADYOUT_S10  = HREADYOUT_S10;  else assign M3_HREADYOUT_S10 = 1'b1;
    if (M3_AHBSLOTENABLE[11])  assign M3_HREADYOUT_S11  = HREADYOUT_S11;  else assign M3_HREADYOUT_S11 = 1'b1;
    if (M3_AHBSLOTENABLE[12])  assign M3_HREADYOUT_S12  = HREADYOUT_S12;  else assign M3_HREADYOUT_S12 = 1'b1;
    if (M3_AHBSLOTENABLE[13])  assign M3_HREADYOUT_S13  = HREADYOUT_S13;  else assign M3_HREADYOUT_S13 = 1'b1;
    if (M3_AHBSLOTENABLE[14])  assign M3_HREADYOUT_S14  = HREADYOUT_S14;  else assign M3_HREADYOUT_S14 = 1'b1;
    if (M3_AHBSLOTENABLE[15])  assign M3_HREADYOUT_S15  = HREADYOUT_S15;  else assign M3_HREADYOUT_S15 = 1'b1;
    if (M3_AHBSLOTENABLE[16])  assign M3_HREADYOUT_S16  = HREADYOUT_S16;  else assign M3_HREADYOUT_S16 = 1'b1;
  endgenerate
  generate
    if (M0_AHBSLOTENABLE[0]  | M1_AHBSLOTENABLE[0]  | M2_AHBSLOTENABLE[0]  | M3_AHBSLOTENABLE[0] )  assign INT_HREADYOUT_S0   = HREADYOUT_S0;   else assign INT_HREADYOUT_S0  = 1'b1;
    if (M0_AHBSLOTENABLE[1]  | M1_AHBSLOTENABLE[1]  | M2_AHBSLOTENABLE[1]  | M3_AHBSLOTENABLE[1] )  assign INT_HREADYOUT_S1   = HREADYOUT_S1;   else assign INT_HREADYOUT_S1  = 1'b1;
    if (M0_AHBSLOTENABLE[2]  | M1_AHBSLOTENABLE[2]  | M2_AHBSLOTENABLE[2]  | M3_AHBSLOTENABLE[2] )  assign INT_HREADYOUT_S2   = HREADYOUT_S2;   else assign INT_HREADYOUT_S2  = 1'b1;
    if (M0_AHBSLOTENABLE[3]  | M1_AHBSLOTENABLE[3]  | M2_AHBSLOTENABLE[3]  | M3_AHBSLOTENABLE[3] )  assign INT_HREADYOUT_S3   = HREADYOUT_S3;   else assign INT_HREADYOUT_S3  = 1'b1;
    if (M0_AHBSLOTENABLE[4]  | M1_AHBSLOTENABLE[4]  | M2_AHBSLOTENABLE[4]  | M3_AHBSLOTENABLE[4] )  assign INT_HREADYOUT_S4   = HREADYOUT_S4;   else assign INT_HREADYOUT_S4  = 1'b1;
    if (M0_AHBSLOTENABLE[5]  | M1_AHBSLOTENABLE[5]  | M2_AHBSLOTENABLE[5]  | M3_AHBSLOTENABLE[5] )  assign INT_HREADYOUT_S5   = HREADYOUT_S5;   else assign INT_HREADYOUT_S5  = 1'b1;
    if (M0_AHBSLOTENABLE[6]  | M1_AHBSLOTENABLE[6]  | M2_AHBSLOTENABLE[6]  | M3_AHBSLOTENABLE[6] )  assign INT_HREADYOUT_S6   = HREADYOUT_S6;   else assign INT_HREADYOUT_S6  = 1'b1;
    if (M0_AHBSLOTENABLE[7]  | M1_AHBSLOTENABLE[7]  | M2_AHBSLOTENABLE[7]  | M3_AHBSLOTENABLE[7] )  assign INT_HREADYOUT_S7   = HREADYOUT_S7;   else assign INT_HREADYOUT_S7  = 1'b1;
    if (M0_AHBSLOTENABLE[8]  | M1_AHBSLOTENABLE[8]  | M2_AHBSLOTENABLE[8]  | M3_AHBSLOTENABLE[8] )  assign INT_HREADYOUT_S8   = HREADYOUT_S8;   else assign INT_HREADYOUT_S8  = 1'b1;
    if (M0_AHBSLOTENABLE[9]  | M1_AHBSLOTENABLE[9]  | M2_AHBSLOTENABLE[9]  | M3_AHBSLOTENABLE[9] )  assign INT_HREADYOUT_S9   = HREADYOUT_S9;   else assign INT_HREADYOUT_S9  = 1'b1;
    if (M0_AHBSLOTENABLE[10] | M1_AHBSLOTENABLE[10] | M2_AHBSLOTENABLE[10] | M3_AHBSLOTENABLE[10])  assign INT_HREADYOUT_S10  = HREADYOUT_S10;  else assign INT_HREADYOUT_S10 = 1'b1;
    if (M0_AHBSLOTENABLE[11] | M1_AHBSLOTENABLE[11] | M2_AHBSLOTENABLE[11] | M3_AHBSLOTENABLE[11])  assign INT_HREADYOUT_S11  = HREADYOUT_S11;  else assign INT_HREADYOUT_S11 = 1'b1;
    if (M0_AHBSLOTENABLE[12] | M1_AHBSLOTENABLE[12] | M2_AHBSLOTENABLE[12] | M3_AHBSLOTENABLE[12])  assign INT_HREADYOUT_S12  = HREADYOUT_S12;  else assign INT_HREADYOUT_S12 = 1'b1;
    if (M0_AHBSLOTENABLE[13] | M1_AHBSLOTENABLE[13] | M2_AHBSLOTENABLE[13] | M3_AHBSLOTENABLE[13])  assign INT_HREADYOUT_S13  = HREADYOUT_S13;  else assign INT_HREADYOUT_S13 = 1'b1;
    if (M0_AHBSLOTENABLE[14] | M1_AHBSLOTENABLE[14] | M2_AHBSLOTENABLE[14] | M3_AHBSLOTENABLE[14])  assign INT_HREADYOUT_S14  = HREADYOUT_S14;  else assign INT_HREADYOUT_S14 = 1'b1;
    if (M0_AHBSLOTENABLE[15] | M1_AHBSLOTENABLE[15] | M2_AHBSLOTENABLE[15] | M3_AHBSLOTENABLE[15])  assign INT_HREADYOUT_S15  = HREADYOUT_S15;  else assign INT_HREADYOUT_S15 = 1'b1;
    if (M0_AHBSLOTENABLE[16] | M1_AHBSLOTENABLE[16] | M2_AHBSLOTENABLE[16] | M3_AHBSLOTENABLE[16])  assign INT_HREADYOUT_S16  = HREADYOUT_S16;  else assign INT_HREADYOUT_S16 = 1'b1;
  endgenerate
  generate
    if (M0_AHBSLOTENABLE[0]  | M1_AHBSLOTENABLE[0]  | M2_AHBSLOTENABLE[0]  | M3_AHBSLOTENABLE[0] )  assign INT_HRESP_S0   = HRESP_S0;   else assign INT_HRESP_S0  = 1'b0;
    if (M0_AHBSLOTENABLE[1]  | M1_AHBSLOTENABLE[1]  | M2_AHBSLOTENABLE[1]  | M3_AHBSLOTENABLE[1] )  assign INT_HRESP_S1   = HRESP_S1;   else assign INT_HRESP_S1  = 1'b0;
    if (M0_AHBSLOTENABLE[2]  | M1_AHBSLOTENABLE[2]  | M2_AHBSLOTENABLE[2]  | M3_AHBSLOTENABLE[2] )  assign INT_HRESP_S2   = HRESP_S2;   else assign INT_HRESP_S2  = 1'b0;
    if (M0_AHBSLOTENABLE[3]  | M1_AHBSLOTENABLE[3]  | M2_AHBSLOTENABLE[3]  | M3_AHBSLOTENABLE[3] )  assign INT_HRESP_S3   = HRESP_S3;   else assign INT_HRESP_S3  = 1'b0;
    if (M0_AHBSLOTENABLE[4]  | M1_AHBSLOTENABLE[4]  | M2_AHBSLOTENABLE[4]  | M3_AHBSLOTENABLE[4] )  assign INT_HRESP_S4   = HRESP_S4;   else assign INT_HRESP_S4  = 1'b0;
    if (M0_AHBSLOTENABLE[5]  | M1_AHBSLOTENABLE[5]  | M2_AHBSLOTENABLE[5]  | M3_AHBSLOTENABLE[5] )  assign INT_HRESP_S5   = HRESP_S5;   else assign INT_HRESP_S5  = 1'b0;
    if (M0_AHBSLOTENABLE[6]  | M1_AHBSLOTENABLE[6]  | M2_AHBSLOTENABLE[6]  | M3_AHBSLOTENABLE[6] )  assign INT_HRESP_S6   = HRESP_S6;   else assign INT_HRESP_S6  = 1'b0;
    if (M0_AHBSLOTENABLE[7]  | M1_AHBSLOTENABLE[7]  | M2_AHBSLOTENABLE[7]  | M3_AHBSLOTENABLE[7] )  assign INT_HRESP_S7   = HRESP_S7;   else assign INT_HRESP_S7  = 1'b0;
    if (M0_AHBSLOTENABLE[8]  | M1_AHBSLOTENABLE[8]  | M2_AHBSLOTENABLE[8]  | M3_AHBSLOTENABLE[8] )  assign INT_HRESP_S8   = HRESP_S8;   else assign INT_HRESP_S8  = 1'b0;
    if (M0_AHBSLOTENABLE[9]  | M1_AHBSLOTENABLE[9]  | M2_AHBSLOTENABLE[9]  | M3_AHBSLOTENABLE[9] )  assign INT_HRESP_S9   = HRESP_S9;   else assign INT_HRESP_S9  = 1'b0;
    if (M0_AHBSLOTENABLE[10] | M1_AHBSLOTENABLE[10] | M2_AHBSLOTENABLE[10] | M3_AHBSLOTENABLE[10])  assign INT_HRESP_S10  = HRESP_S10;  else assign INT_HRESP_S10 = 1'b0;
    if (M0_AHBSLOTENABLE[11] | M1_AHBSLOTENABLE[11] | M2_AHBSLOTENABLE[11] | M3_AHBSLOTENABLE[11])  assign INT_HRESP_S11  = HRESP_S11;  else assign INT_HRESP_S11 = 1'b0;
    if (M0_AHBSLOTENABLE[12] | M1_AHBSLOTENABLE[12] | M2_AHBSLOTENABLE[12] | M3_AHBSLOTENABLE[12])  assign INT_HRESP_S12  = HRESP_S12;  else assign INT_HRESP_S12 = 1'b0;
    if (M0_AHBSLOTENABLE[13] | M1_AHBSLOTENABLE[13] | M2_AHBSLOTENABLE[13] | M3_AHBSLOTENABLE[13])  assign INT_HRESP_S13  = HRESP_S13;  else assign INT_HRESP_S13 = 1'b0;
    if (M0_AHBSLOTENABLE[14] | M1_AHBSLOTENABLE[14] | M2_AHBSLOTENABLE[14] | M3_AHBSLOTENABLE[14])  assign INT_HRESP_S14  = HRESP_S14;  else assign INT_HRESP_S14 = 1'b0;
    if (M0_AHBSLOTENABLE[15] | M1_AHBSLOTENABLE[15] | M2_AHBSLOTENABLE[15] | M3_AHBSLOTENABLE[15])  assign INT_HRESP_S15  = HRESP_S15;  else assign INT_HRESP_S15 = 1'b0;
    if (M0_AHBSLOTENABLE[16] | M1_AHBSLOTENABLE[16] | M2_AHBSLOTENABLE[16] | M3_AHBSLOTENABLE[16])  assign INT_HRESP_S16  = HRESP_S16;  else assign INT_HRESP_S16 = 1'b0;
  endgenerate
COREAHBLITE_MASTERSTAGE #(
	.MEMSPACE(MEMSPACE),
    .HADDR_SHG_CFG(HADDR_SHG_CFG),
    .SC(SC),
	.M_AHBSLOTENABLE(M0_AHBSLOTENABLE),
	.SYNC_RESET(SYNC_RESET)
) masterstage_0 (
	.HCLK(HCLK),
	.HRESETN(HRESETN),
	.HADDR(HADDR_M0),
	.HMASTLOCK(HMASTLOCK_M0),
	.HSIZE(HSIZE_M0),
	.HTRANS(HTRANS_M0),
	.HBURST(HBURST_M0), // AI : added for burst
	.HWRITE(HWRITE_M0),
	.REMAP(REMAP_M0),
	.HRESP(HRESP_M0),
	.HRDATA(HRDATA_M0),
	.HREADY_M(HREADY_M0_pre),
	.SADDRREADY({s16m0AddrReady_int,s15m0AddrReady_int,s14m0AddrReady_int,s13m0AddrReady_int,s12m0AddrReady_int,s11m0AddrReady_int,s10m0AddrReady_int,s9m0AddrReady_int,s8m0AddrReady_int,s7m0AddrReady_int,s6m0AddrReady_int,s5m0AddrReady_int,s4m0AddrReady_int,s3m0AddrReady_int,s2m0AddrReady_int,s1m0AddrReady_int,s0m0AddrReady_int}),  
	.SDATAREADY({s16m0DataReady_int,s15m0DataReady_int,s14m0DataReady_int,s13m0DataReady_int,s12m0DataReady_int,s11m0DataReady_int,s10m0DataReady_int,s9m0DataReady_int,s8m0DataReady_int,s7m0DataReady_int,s6m0DataReady_int,s5m0DataReady_int,s4m0DataReady_int,s3m0DataReady_int,s2m0DataReady_int,s1m0DataReady_int,s0m0DataReady_int}),  
	.SHRESP({s16m0HResp_int,s15m0HResp_int,s14m0HResp_int,s13m0HResp_int,s12m0HResp_int,s11m0HResp_int,s10m0HResp_int,s9m0HResp_int,s8m0HResp_int,s7m0HResp_int,s6m0HResp_int,s5m0HResp_int,s4m0HResp_int,s3m0HResp_int,s2m0HResp_int,s1m0HResp_int,s0m0HResp_int}),  
	.GATEDHADDR(M0GATEDHADDR),     
	.GATEDHMASTLOCK(M0GATEDHMASTLOCK), 
	.GATEDHSIZE(M0GATEDHSIZE),     
	.GATEDHTRANS(M0GATEDHTRANS), 
    .GATEDHBURST (M0GATEDHBURST),	 // AI : Added for burst
	.GATEDHWRITE(M0GATEDHWRITE),    
	.SADDRSEL({m0s16AddrSel,m0s15AddrSel,m0s14AddrSel,m0s13AddrSel,m0s12AddrSel,m0s11AddrSel,m0s10AddrSel,m0s9AddrSel,m0s8AddrSel,m0s7AddrSel,m0s6AddrSel,m0s5AddrSel,m0s4AddrSel,m0s3AddrSel,m0s2AddrSel,m0s1AddrSel,m0s0AddrSel}),
	.SDATASEL({m0s16DataSel,m0s15DataSel,m0s14DataSel,m0s13DataSel,m0s12DataSel,m0s11DataSel,m0s10DataSel,m0s9DataSel,m0s8DataSel,m0s7DataSel,m0s6DataSel,m0s5DataSel,m0s4DataSel,m0s3DataSel,m0s2DataSel,m0s1DataSel,m0s0DataSel}),
	.PREVDATASLAVEREADY(m0PrevDataSlaveReady),
        .HRDATA_S0(M0_HRDATA_S0),          
        .HREADYOUT_S0(M0_HREADYOUT_S0),    
        .HRDATA_S1(M0_HRDATA_S1),          
        .HREADYOUT_S1(M0_HREADYOUT_S1),    
        .HRDATA_S2(M0_HRDATA_S2),          
        .HREADYOUT_S2(M0_HREADYOUT_S2),    
        .HRDATA_S3(M0_HRDATA_S3),          
        .HREADYOUT_S3(M0_HREADYOUT_S3),    
        .HRDATA_S4(M0_HRDATA_S4),              
        .HREADYOUT_S4(M0_HREADYOUT_S4),            
        .HRDATA_S5(M0_HRDATA_S5),              
        .HREADYOUT_S5(M0_HREADYOUT_S5),            
        .HRDATA_S6(M0_HRDATA_S6),              
        .HREADYOUT_S6(M0_HREADYOUT_S6),            
        .HRDATA_S7(M0_HRDATA_S7),              
        .HREADYOUT_S7(M0_HREADYOUT_S7),             
        .HRDATA_S8(M0_HRDATA_S8),          
        .HREADYOUT_S8(M0_HREADYOUT_S8),    
        .HRDATA_S9(M0_HRDATA_S9),          
        .HREADYOUT_S9(M0_HREADYOUT_S9),    
        .HRDATA_S10(M0_HRDATA_S10),          
        .HREADYOUT_S10(M0_HREADYOUT_S10),    
        .HRDATA_S11(M0_HRDATA_S11),          
        .HREADYOUT_S11(M0_HREADYOUT_S11),    
        .HRDATA_S12(M0_HRDATA_S12),              
        .HREADYOUT_S12(M0_HREADYOUT_S12),            
        .HRDATA_S13(M0_HRDATA_S13),              
        .HREADYOUT_S13(M0_HREADYOUT_S13),            
        .HRDATA_S14(M0_HRDATA_S14),              
        .HREADYOUT_S14(M0_HREADYOUT_S14),            
        .HRDATA_S15(M0_HRDATA_S15),              
        .HREADYOUT_S15(M0_HREADYOUT_S15),            
		.HRDATA_S16(M0_HRDATA_S16),
		.HREADYOUT_S16(M0_HREADYOUT_S16)
);
COREAHBLITE_MASTERSTAGE #(
	.MEMSPACE(MEMSPACE),
    .HADDR_SHG_CFG(HADDR_SHG_CFG),
    .SC(SC),
	.M_AHBSLOTENABLE(M1_AHBSLOTENABLE),
	.SYNC_RESET(SYNC_RESET)
) masterstage_1 (
	.HCLK(HCLK),
	.HRESETN(HRESETN),
	.REMAP(1'b0),
	.HADDR(HADDR_M1),
	.HMASTLOCK(HMASTLOCK_M1),
	.HSIZE(HSIZE_M1),
	.HTRANS(HTRANS_M1),
	.HBURST(HBURST_M1), // AI  : added for burst
	.HWRITE(HWRITE_M1),
	.HRESP(HRESP_M1),
	.HRDATA(HRDATA_M1),
	.HREADY_M(HREADY_M1_pre),
	.SADDRREADY({s16m1AddrReady_int,s15m1AddrReady_int,s14m1AddrReady_int,s13m1AddrReady_int,s12m1AddrReady_int,s11m1AddrReady_int,s10m1AddrReady_int,s9m1AddrReady_int,s8m1AddrReady_int,s7m1AddrReady_int,s6m1AddrReady_int,s5m1AddrReady_int,s4m1AddrReady_int,s3m1AddrReady_int,s2m1AddrReady_int,s1m1AddrReady_int,s0m1AddrReady_int}),  
	.SDATAREADY({s16m1DataReady_int,s15m1DataReady_int,s14m1DataReady_int,s13m1DataReady_int,s12m1DataReady_int,s11m1DataReady_int,s10m1DataReady_int,s9m1DataReady_int,s8m1DataReady_int,s7m1DataReady_int,s6m1DataReady_int,s5m1DataReady_int,s4m1DataReady_int,s3m1DataReady_int,s2m1DataReady_int,s1m1DataReady_int,s0m1DataReady_int}),  
	.SHRESP({s16m1HResp_int,s15m1HResp_int,s14m1HResp_int,s13m1HResp_int,s12m1HResp_int,s11m1HResp_int,s10m1HResp_int,s9m1HResp_int,s8m1HResp_int,s7m1HResp_int,s6m1HResp_int,s5m1HResp_int,s4m1HResp_int,s3m1HResp_int,s2m1HResp_int,s1m1HResp_int,s0m1HResp_int}),  
	.GATEDHADDR(M1GATEDHADDR),     
	.GATEDHMASTLOCK(M1GATEDHMASTLOCK), 
	.GATEDHSIZE(M1GATEDHSIZE),     
	.GATEDHTRANS(M1GATEDHTRANS),   
    .GATEDHBURST (M1GATEDHBURST),	// AI : Added for burst	
	.GATEDHWRITE(M1GATEDHWRITE),    
	.SADDRSEL({m1s16AddrSel,m1s15AddrSel,m1s14AddrSel,m1s13AddrSel,m1s12AddrSel,m1s11AddrSel,m1s10AddrSel,m1s9AddrSel,m1s8AddrSel, m1s7AddrSel,m1s6AddrSel,m1s5AddrSel,m1s4AddrSel,m1s3AddrSel,m1s2AddrSel,m1s1AddrSel,m1s0AddrSel}),
	.SDATASEL({m1s16DataSel,m1s15DataSel,m1s14DataSel,m1s13DataSel,m1s12DataSel,m1s11DataSel,m1s10DataSel,m1s9DataSel,m1s8DataSel, m1s7DataSel,m1s6DataSel,m1s5DataSel,m1s4DataSel,m1s3DataSel,m1s2DataSel,m1s1DataSel,m1s0DataSel}),
        .PREVDATASLAVEREADY(m1PrevDataSlaveReady),
        .HRDATA_S0(M1_HRDATA_S0),              
        .HREADYOUT_S0(M1_HREADYOUT_S0),    
        .HRDATA_S1(M1_HRDATA_S1),          
        .HREADYOUT_S1(M1_HREADYOUT_S1),    
        .HRDATA_S2(M1_HRDATA_S2),              
        .HREADYOUT_S2(M1_HREADYOUT_S2),    
        .HRDATA_S3(M1_HRDATA_S3),              
        .HREADYOUT_S3(M1_HREADYOUT_S3),    
        .HRDATA_S4(M1_HRDATA_S4),              
        .HREADYOUT_S4(M1_HREADYOUT_S4),            
        .HRDATA_S5(M1_HRDATA_S5),              
        .HREADYOUT_S5(M1_HREADYOUT_S5),            
        .HRDATA_S6(M1_HRDATA_S6),              
        .HREADYOUT_S6(M1_HREADYOUT_S6),            
        .HRDATA_S7(M1_HRDATA_S7),              
        .HREADYOUT_S7(M1_HREADYOUT_S7),             
        .HRDATA_S8(M1_HRDATA_S8),          
        .HREADYOUT_S8(M1_HREADYOUT_S8),    
        .HRDATA_S9(M1_HRDATA_S9),          
        .HREADYOUT_S9(M1_HREADYOUT_S9),    
        .HRDATA_S10(M1_HRDATA_S10),          
        .HREADYOUT_S10(M1_HREADYOUT_S10),    
        .HRDATA_S11(M1_HRDATA_S11),          
        .HREADYOUT_S11(M1_HREADYOUT_S11),    
        .HRDATA_S12(M1_HRDATA_S12),              
        .HREADYOUT_S12(M1_HREADYOUT_S12),            
        .HRDATA_S13(M1_HRDATA_S13),              
        .HREADYOUT_S13(M1_HREADYOUT_S13),            
        .HRDATA_S14(M1_HRDATA_S14),              
        .HREADYOUT_S14(M1_HREADYOUT_S14),            
        .HRDATA_S15(M1_HRDATA_S15),              
        .HREADYOUT_S15(M1_HREADYOUT_S15),            
		.HRDATA_S16(M1_HRDATA_S16),
		.HREADYOUT_S16(M1_HREADYOUT_S16)
	);
COREAHBLITE_MASTERSTAGE #(
	.MEMSPACE(MEMSPACE),
    .HADDR_SHG_CFG(HADDR_SHG_CFG),
    .SC(SC),
	.M_AHBSLOTENABLE(M2_AHBSLOTENABLE),
	.SYNC_RESET(SYNC_RESET)
) masterstage_2 (
	.HCLK(HCLK),
	.HRESETN(HRESETN),
	.REMAP(1'b0),
	.HADDR(HADDR_M2),
	.HMASTLOCK(HMASTLOCK_M2),
	.HSIZE(HSIZE_M2),
	.HTRANS(HTRANS_M2),
	.HBURST(HBURST_M2), // AI  : added for  burst
	.HWRITE(HWRITE_M2),
	.HRESP(HRESP_M2),
	.HRDATA(HRDATA_M2),
	.HREADY_M(HREADY_M2_pre),
	.SADDRREADY({s16m2AddrReady_int,s15m2AddrReady_int,s14m2AddrReady_int,s13m2AddrReady_int,s12m2AddrReady_int,s11m2AddrReady_int,s10m2AddrReady_int,s9m2AddrReady_int,s8m2AddrReady_int,s7m2AddrReady_int,s6m2AddrReady_int,s5m2AddrReady_int,s4m2AddrReady_int,s3m2AddrReady_int,s2m2AddrReady_int,s1m2AddrReady_int,s0m2AddrReady_int}),
	.SDATAREADY({s16m2DataReady_int,s15m2DataReady_int,s14m2DataReady_int,s13m2DataReady_int,s12m2DataReady_int,s11m2DataReady_int,s10m2DataReady_int,s9m2DataReady_int,s8m2DataReady_int,s7m2DataReady_int,s6m2DataReady_int,s5m2DataReady_int,s4m2DataReady_int,s3m2DataReady_int,s2m2DataReady_int,s1m2DataReady_int,s0m2DataReady_int}),
	.SHRESP({s16m2HResp_int,s15m2HResp_int,s14m2HResp_int,s13m2HResp_int,s12m2HResp_int,s11m2HResp_int,s10m2HResp_int,s9m2HResp_int,s8m2HResp_int,s7m2HResp_int,s6m2HResp_int,s5m2HResp_int,s4m2HResp_int,s3m2HResp_int,s2m2HResp_int,s1m2HResp_int,s0m2HResp_int}),
	.GATEDHADDR(M2GATEDHADDR),
	.GATEDHMASTLOCK(M2GATEDHMASTLOCK),
	.GATEDHSIZE(M2GATEDHSIZE),
	.GATEDHTRANS(M2GATEDHTRANS),
	.GATEDHBURST (M2GATEDHBURST),	// AI  : added for  burst
	.GATEDHWRITE(M2GATEDHWRITE),
	.SADDRSEL({m2s16AddrSel,m2s15AddrSel,m2s14AddrSel,m2s13AddrSel,m2s12AddrSel,m2s11AddrSel,m2s10AddrSel,m2s9AddrSel,m2s8AddrSel, m2s7AddrSel,m2s6AddrSel,m2s5AddrSel,m2s4AddrSel,m2s3AddrSel,m2s2AddrSel,m2s1AddrSel,m2s0AddrSel}),
	.SDATASEL({m2s16DataSel,m2s15DataSel,m2s14DataSel,m2s13DataSel,m2s12DataSel,m2s11DataSel,m2s10DataSel,m2s9DataSel,m2s8DataSel, m2s7DataSel,m2s6DataSel,m2s5DataSel,m2s4DataSel,m2s3DataSel,m2s2DataSel,m2s1DataSel,m2s0DataSel}),
    .PREVDATASLAVEREADY(m2PrevDataSlaveReady),
    .HRDATA_S0(M2_HRDATA_S0),
    .HREADYOUT_S0(M2_HREADYOUT_S0),
    .HRDATA_S1(M2_HRDATA_S1),
    .HREADYOUT_S1(M2_HREADYOUT_S1),
    .HRDATA_S2(M2_HRDATA_S2),
    .HREADYOUT_S2(M2_HREADYOUT_S2),
    .HRDATA_S3(M2_HRDATA_S3),
    .HREADYOUT_S3(M2_HREADYOUT_S3),
    .HRDATA_S4(M2_HRDATA_S4),
    .HREADYOUT_S4(M2_HREADYOUT_S4),
    .HRDATA_S5(M2_HRDATA_S5),
    .HREADYOUT_S5(M2_HREADYOUT_S5),
    .HRDATA_S6(M2_HRDATA_S6),
    .HREADYOUT_S6(M2_HREADYOUT_S6),
    .HRDATA_S7(M2_HRDATA_S7),
    .HREADYOUT_S7(M2_HREADYOUT_S7),
    .HRDATA_S8(M2_HRDATA_S8),
    .HREADYOUT_S8(M2_HREADYOUT_S8),
    .HRDATA_S9(M2_HRDATA_S9),
    .HREADYOUT_S9(M2_HREADYOUT_S9),
    .HRDATA_S10(M2_HRDATA_S10),
    .HREADYOUT_S10(M2_HREADYOUT_S10),
    .HRDATA_S11(M2_HRDATA_S11),
    .HREADYOUT_S11(M2_HREADYOUT_S11),
    .HRDATA_S12(M2_HRDATA_S12),
    .HREADYOUT_S12(M2_HREADYOUT_S12),
    .HRDATA_S13(M2_HRDATA_S13),
    .HREADYOUT_S13(M2_HREADYOUT_S13),
    .HRDATA_S14(M2_HRDATA_S14),
    .HREADYOUT_S14(M2_HREADYOUT_S14),
    .HRDATA_S15(M2_HRDATA_S15),
    .HREADYOUT_S15(M2_HREADYOUT_S15),
	.HRDATA_S16(M2_HRDATA_S16),
	.HREADYOUT_S16(M2_HREADYOUT_S16)
	);
COREAHBLITE_MASTERSTAGE #(
	.MEMSPACE(MEMSPACE),
    .HADDR_SHG_CFG(HADDR_SHG_CFG),
    .SC(SC),
	.M_AHBSLOTENABLE(M3_AHBSLOTENABLE),
	.SYNC_RESET(SYNC_RESET)
) masterstage_3 (
	.HCLK(HCLK),
	.HRESETN(HRESETN),
	.REMAP(1'b0),
	.HADDR(HADDR_M3),
	.HMASTLOCK(HMASTLOCK_M3),
	.HSIZE(HSIZE_M3),
	.HTRANS(HTRANS_M3),
	.HBURST(HBURST_M3), // AI : added for burst
	.HWRITE(HWRITE_M3),
	.HRESP(HRESP_M3),
	.HRDATA(HRDATA_M3),
	.HREADY_M(HREADY_M3_pre),
	.SADDRREADY({s16m3AddrReady_int,s15m3AddrReady_int,s14m3AddrReady_int,s13m3AddrReady_int,s12m3AddrReady_int,s11m3AddrReady_int,s10m3AddrReady_int,s9m3AddrReady_int,s8m3AddrReady_int,s7m3AddrReady_int,s6m3AddrReady_int,s5m3AddrReady_int,s4m3AddrReady_int,s3m3AddrReady_int,s2m3AddrReady_int,s1m3AddrReady_int,s0m3AddrReady_int}),
	.SDATAREADY({s16m3DataReady_int,s15m3DataReady_int,s14m3DataReady_int,s13m3DataReady_int,s12m3DataReady_int,s11m3DataReady_int,s10m3DataReady_int,s9m3DataReady_int,s8m3DataReady_int,s7m3DataReady_int,s6m3DataReady_int,s5m3DataReady_int,s4m3DataReady_int,s3m3DataReady_int,s2m3DataReady_int,s1m3DataReady_int,s0m3DataReady_int}),
	.SHRESP({s16m3HResp_int,s15m3HResp_int,s14m3HResp_int,s13m3HResp_int,s12m3HResp_int,s11m3HResp_int,s10m3HResp_int,s9m3HResp_int,s8m3HResp_int,s7m3HResp_int,s6m3HResp_int,s5m3HResp_int,s4m3HResp_int,s3m3HResp_int,s2m3HResp_int,s1m3HResp_int,s0m3HResp_int}),
	.GATEDHADDR(M3GATEDHADDR),
	.GATEDHMASTLOCK(M3GATEDHMASTLOCK),
	.GATEDHSIZE(M3GATEDHSIZE),
	.GATEDHTRANS(M3GATEDHTRANS),
	.GATEDHBURST (M3GATEDHBURST),	// AI : added for burst
	.GATEDHWRITE(M3GATEDHWRITE),
	.SADDRSEL({m3s16AddrSel,m3s15AddrSel,m3s14AddrSel,m3s13AddrSel,m3s12AddrSel,m3s11AddrSel,m3s10AddrSel,m3s9AddrSel,m3s8AddrSel, m3s7AddrSel,m3s6AddrSel,m3s5AddrSel,m3s4AddrSel,m3s3AddrSel,m3s2AddrSel,m3s1AddrSel,m3s0AddrSel}),
	.SDATASEL({m3s16DataSel,m3s15DataSel,m3s14DataSel,m3s13DataSel,m3s12DataSel,m3s11DataSel,m3s10DataSel,m3s9DataSel,m3s8DataSel, m3s7DataSel,m3s6DataSel,m3s5DataSel,m3s4DataSel,m3s3DataSel,m3s2DataSel,m3s1DataSel,m3s0DataSel}),
    .PREVDATASLAVEREADY(m3PrevDataSlaveReady),
    .HRDATA_S0(M3_HRDATA_S0),
    .HREADYOUT_S0(M3_HREADYOUT_S0),
    .HRDATA_S1(M3_HRDATA_S1),
    .HREADYOUT_S1(M3_HREADYOUT_S1),
    .HRDATA_S2(M3_HRDATA_S2),
    .HREADYOUT_S2(M3_HREADYOUT_S2),
    .HRDATA_S3(M3_HRDATA_S3),
    .HREADYOUT_S3(M3_HREADYOUT_S3),
    .HRDATA_S4(M3_HRDATA_S4),
    .HREADYOUT_S4(M3_HREADYOUT_S4),
    .HRDATA_S5(M3_HRDATA_S5),
    .HREADYOUT_S5(M3_HREADYOUT_S5),
    .HRDATA_S6(M3_HRDATA_S6),
    .HREADYOUT_S6(M3_HREADYOUT_S6),
    .HRDATA_S7(M3_HRDATA_S7),
    .HREADYOUT_S7(M3_HREADYOUT_S7),
    .HRDATA_S8(M3_HRDATA_S8),
    .HREADYOUT_S8(M3_HREADYOUT_S8),
    .HRDATA_S9(M3_HRDATA_S9),
    .HREADYOUT_S9(M3_HREADYOUT_S9),
    .HRDATA_S10(M3_HRDATA_S10),
    .HREADYOUT_S10(M3_HREADYOUT_S10),
    .HRDATA_S11(M3_HRDATA_S11),
    .HREADYOUT_S11(M3_HREADYOUT_S11),
    .HRDATA_S12(M3_HRDATA_S12),
    .HREADYOUT_S12(M3_HREADYOUT_S12),
    .HRDATA_S13(M3_HRDATA_S13),
    .HREADYOUT_S13(M3_HREADYOUT_S13),
    .HRDATA_S14(M3_HRDATA_S14),
    .HREADYOUT_S14(M3_HREADYOUT_S14),
    .HRDATA_S15(M3_HRDATA_S15),
    .HREADYOUT_S15(M3_HREADYOUT_S15),
	.HRDATA_S16(M3_HRDATA_S16),
	.HREADYOUT_S16(M3_HREADYOUT_S16)
	);
    COREAHBLITE_SLAVESTAGE #(.SYNC_RESET(SYNC_RESET))
	slavestage_0
    (
        .HCLK(HCLK),
        .HRESETN(HRESETN),
        .HREADYOUT(INT_HREADYOUT_S0),
        .HRESP(INT_HRESP_S0),
        .HSEL(HSEL_S0),
        .HADDR(HADDR_S0),
        .HSIZE(HSIZE_S0),
        .HTRANS(HTRANS_S0),
		.HBURST (HBURST_S0),           // AI  : added for burst	
        .HWRITE(HWRITE_S0),
        .HWDATA(HWDATA_S0),
        .HREADY_S(HREADY_S0),
        .HMASTLOCK(HMASTLOCK_S0),
        .MADDRSEL({m3s0AddrSel_int,m2s0AddrSel_int,m1s0AddrSel_int,m0s0AddrSel_int}),           
        .MDATASEL({m3s0DataSel_int,m2s0DataSel_int,m1s0DataSel_int,m0s0DataSel_int}),           
        .MPREVDATASLAVEREADY({m3s0PrevDataSlaveReady,m2s0PrevDataSlaveReady,m1s0PrevDataSlaveReady,m0s0PrevDataSlaveReady}), 
        .MADDRREADY({s0m3AddrReady,s0m2AddrReady,s0m1AddrReady,s0m0AddrReady}),      
        .MDATAREADY({s0m3DataReady,s0m2DataReady,s0m1DataReady,s0m0DataReady}),      
        .MHRESP({s0m3HResp,s0m2HResp,s0m1HResp,s0m0HResp}),      
        .M0GATEDHADDR(m0s0GatedHADDR),       
        .M0GATEDHMASTLOCK(m0s0GatedHMASTLOCK),   
        .M0GATEDHSIZE(m0s0GatedHSIZE),       
        .M0GATEDHTRANS(m0s0GatedHTRANS),
        .M0GATEDHBURST(m0s0GatedHBURST), // AI  : added for burst		
        .M0GATEDHWRITE(m0s0GatedHWRITE),      
        .M1GATEDHADDR(m1s0GatedHADDR),       
        .M1GATEDHMASTLOCK(m1s0GatedHMASTLOCK),   
        .M1GATEDHSIZE(m1s0GatedHSIZE),       
        .M1GATEDHTRANS(m1s0GatedHTRANS), 
        .M1GATEDHBURST(m1s0GatedHBURST),// AI	 : added for burst	
        .M1GATEDHWRITE(m1s0GatedHWRITE),      
        .M2GATEDHADDR(m2s0GatedHADDR),       
        .M2GATEDHMASTLOCK(m2s0GatedHMASTLOCK),   
        .M2GATEDHSIZE(m2s0GatedHSIZE), 
        .M2GATEDHBURST(m2s0GatedHBURST), // AI 	 : added for burst	
        .M2GATEDHTRANS(m2s0GatedHTRANS),      
        .M2GATEDHWRITE(m2s0GatedHWRITE),      
        .M3GATEDHADDR(m3s0GatedHADDR),       
        .M3GATEDHMASTLOCK(m3s0GatedHMASTLOCK),   
        .M3GATEDHSIZE(m3s0GatedHSIZE),       
        .M3GATEDHTRANS(m3s0GatedHTRANS),
        .M3GATEDHBURST(m3s0GatedHBURST), // AI 	 : added for burst
        .M3GATEDHWRITE(m3s0GatedHWRITE),      
        .HWDATA_M0(HWDATA_M0S0),          
        .HWDATA_M1(HWDATA_M1S0),          
        .HWDATA_M2(HWDATA_M2S0),          
        .HWDATA_M3(HWDATA_M3S0)           
    );
    COREAHBLITE_SLAVESTAGE #(.SYNC_RESET(SYNC_RESET))
	 slavestage_1
    (
        .HCLK(HCLK),
        .HRESETN(HRESETN),
        .HREADYOUT(INT_HREADYOUT_S1),
        .HRESP(INT_HRESP_S1),
        .HSEL(HSEL_S1),
        .HADDR(HADDR_S1),
        .HSIZE(HSIZE_S1),
        .HTRANS(HTRANS_S1),
		.HBURST (HBURST_S1),            // AI  : added for burst	
        .HWRITE(HWRITE_S1),
        .HWDATA(HWDATA_S1),
        .HREADY_S(HREADY_S1),
        .HMASTLOCK(HMASTLOCK_S1),
        .MADDRSEL({m3s1AddrSel_int,m2s1AddrSel_int,m1s1AddrSel_int,m0s1AddrSel_int}),           
        .MDATASEL({m3s1DataSel_int,m2s1DataSel_int,m1s1DataSel_int,m0s1DataSel_int}),           
        .MPREVDATASLAVEREADY({m3s1PrevDataSlaveReady,m2s1PrevDataSlaveReady,m1s1PrevDataSlaveReady,m0s1PrevDataSlaveReady}), 
        .MADDRREADY({s1m3AddrReady,s1m2AddrReady,s1m1AddrReady,s1m0AddrReady}),      
        .MDATAREADY({s1m3DataReady,s1m2DataReady,s1m1DataReady,s1m0DataReady}),      
        .MHRESP({s1m3HResp,s1m2HResp,s1m1HResp,s1m0HResp}),      
        .M0GATEDHADDR(m0s1GatedHADDR),       
        .M0GATEDHMASTLOCK(m0s1GatedHMASTLOCK),   
        .M0GATEDHSIZE(m0s1GatedHSIZE),       
        .M0GATEDHTRANS(m0s1GatedHTRANS),  
        .M0GATEDHBURST(m0s1GatedHBURST), //AI	 : added for burst	
        .M0GATEDHWRITE(m0s1GatedHWRITE),      
        .M1GATEDHADDR(m1s1GatedHADDR),       
        .M1GATEDHMASTLOCK(m1s1GatedHMASTLOCK),   
        .M1GATEDHSIZE(m1s1GatedHSIZE),       
        .M1GATEDHTRANS(m1s1GatedHTRANS), 
        .M1GATEDHBURST(m1s1GatedHBURST), //  AI  : added for burst			
        .M1GATEDHWRITE(m1s1GatedHWRITE),      
        .M2GATEDHADDR(m2s1GatedHADDR),       
        .M2GATEDHMASTLOCK(m2s1GatedHMASTLOCK),   
        .M2GATEDHSIZE(m2s1GatedHSIZE),       
        .M2GATEDHTRANS(m2s1GatedHTRANS),
        .M2GATEDHBURST(m2s1GatedHBURST), // AI 	 : added for burst		
        .M2GATEDHWRITE(m2s1GatedHWRITE),      
        .M3GATEDHADDR(m3s1GatedHADDR),       
        .M3GATEDHMASTLOCK(m3s1GatedHMASTLOCK),   
        .M3GATEDHSIZE(m3s1GatedHSIZE),       
        .M3GATEDHTRANS(m3s1GatedHTRANS),
        .M3GATEDHBURST(m3s1GatedHBURST), // AI 	 : added for burst		
        .M3GATEDHWRITE(m3s1GatedHWRITE),      
        .HWDATA_M0(HWDATA_M0S1),          
        .HWDATA_M1(HWDATA_M1S1),          
        .HWDATA_M2(HWDATA_M2S1),          
        .HWDATA_M3(HWDATA_M3S1)           
    );
    COREAHBLITE_SLAVESTAGE #(.SYNC_RESET(SYNC_RESET))
	 slavestage_2
    (
        .HCLK(HCLK),
        .HRESETN(HRESETN),
        .HREADYOUT(INT_HREADYOUT_S2),
        .HRESP(INT_HRESP_S2),
        .HSEL(HSEL_S2),
        .HADDR(HADDR_S2),
        .HSIZE(HSIZE_S2),
        .HTRANS(HTRANS_S2),
		.HBURST (HBURST_S2),                    // AI  : added for burst	
        .HWRITE(HWRITE_S2),
        .HWDATA(HWDATA_S2),
        .HREADY_S(HREADY_S2),
        .HMASTLOCK(HMASTLOCK_S2),
        .MADDRSEL({m3s2AddrSel_int,m2s2AddrSel_int,m1s2AddrSel_int,m0s2AddrSel_int}),           
        .MDATASEL({m3s2DataSel_int,m2s2DataSel_int,m1s2DataSel_int,m0s2DataSel_int}),           
        .MPREVDATASLAVEREADY({m3s2PrevDataSlaveReady,m2s2PrevDataSlaveReady,m1s2PrevDataSlaveReady,m0s2PrevDataSlaveReady}), 
        .MADDRREADY({s2m3AddrReady,s2m2AddrReady,s2m1AddrReady,s2m0AddrReady}),      
        .MDATAREADY({s2m3DataReady,s2m2DataReady,s2m1DataReady,s2m0DataReady}),      
        .MHRESP({s2m3HResp,s2m2HResp,s2m1HResp,s2m0HResp}),      
        .M0GATEDHADDR(m0s2GatedHADDR),       
        .M0GATEDHMASTLOCK(m0s2GatedHMASTLOCK),   
        .M0GATEDHSIZE(m0s2GatedHSIZE),       
        .M0GATEDHTRANS(m0s2GatedHTRANS), 
        .M0GATEDHBURST(m0s2GatedHBURST), // AI 	 : added for burst		
        .M0GATEDHWRITE(m0s2GatedHWRITE),      
        .M1GATEDHADDR(m1s2GatedHADDR),       
        .M1GATEDHMASTLOCK(m1s2GatedHMASTLOCK),   
        .M1GATEDHSIZE(m1s2GatedHSIZE),       
        .M1GATEDHTRANS(m1s2GatedHTRANS),
        .M1GATEDHBURST(m1s2GatedHBURST), // AI 	 : added for burst		
        .M1GATEDHWRITE(m1s2GatedHWRITE),      
        .M2GATEDHADDR(m2s2GatedHADDR),       
        .M2GATEDHMASTLOCK(m2s2GatedHMASTLOCK),   
        .M2GATEDHSIZE(m2s2GatedHSIZE),       
        .M2GATEDHTRANS(m2s2GatedHTRANS), 
        .M2GATEDHBURST(m2s2GatedHBURST), // AI 	 : added for burst		
        .M2GATEDHWRITE(m2s2GatedHWRITE),      
        .M3GATEDHADDR(m3s2GatedHADDR),       
        .M3GATEDHMASTLOCK(m3s2GatedHMASTLOCK),   
        .M3GATEDHSIZE(m3s2GatedHSIZE),       
        .M3GATEDHTRANS(m3s2GatedHTRANS),
        .M3GATEDHBURST(m3s2GatedHBURST), // AI 		 : added for burst	
        .M3GATEDHWRITE(m3s2GatedHWRITE),      
        .HWDATA_M0(HWDATA_M0S2),          
        .HWDATA_M1(HWDATA_M1S2),          
        .HWDATA_M2(HWDATA_M2S2),          
        .HWDATA_M3(HWDATA_M3S2)           
    );
    COREAHBLITE_SLAVESTAGE #(.SYNC_RESET(SYNC_RESET))
	 slavestage_3
    (
        .HCLK(HCLK),
        .HRESETN(HRESETN),
        .HREADYOUT(INT_HREADYOUT_S3),
        .HRESP(INT_HRESP_S3),
        .HSEL(HSEL_S3),
        .HADDR(HADDR_S3),
        .HSIZE(HSIZE_S3),
        .HTRANS(HTRANS_S3),
		.HBURST (HBURST_S3),                     // AI  : added for burst	
        .HWRITE(HWRITE_S3),
        .HWDATA(HWDATA_S3),
        .HREADY_S(HREADY_S3),
        .HMASTLOCK(HMASTLOCK_S3),
        .MADDRSEL({m3s3AddrSel_int,m2s3AddrSel_int,m1s3AddrSel_int,m0s3AddrSel_int}),           
        .MDATASEL({m3s3DataSel_int,m2s3DataSel_int,m1s3DataSel_int,m0s3DataSel_int}),           
        .MPREVDATASLAVEREADY({m3s3PrevDataSlaveReady,m2s3PrevDataSlaveReady,m1s3PrevDataSlaveReady,m0s3PrevDataSlaveReady}), 
        .MADDRREADY({s3m3AddrReady,s3m2AddrReady,s3m1AddrReady,s3m0AddrReady}),      
        .MDATAREADY({s3m3DataReady,s3m2DataReady,s3m1DataReady,s3m0DataReady}),      
        .MHRESP({s3m3HResp,s3m2HResp,s3m1HResp,s3m0HResp}),      
        .M0GATEDHADDR(m0s3GatedHADDR),       
        .M0GATEDHMASTLOCK(m0s3GatedHMASTLOCK),   
        .M0GATEDHSIZE(m0s3GatedHSIZE),       
        .M0GATEDHTRANS(m0s3GatedHTRANS),
        .M0GATEDHBURST(m0s3GatedHBURST), // AI  : added for burst			
        .M0GATEDHWRITE(m0s3GatedHWRITE),      
        .M1GATEDHADDR(m1s3GatedHADDR),       
        .M1GATEDHMASTLOCK(m1s3GatedHMASTLOCK),   
        .M1GATEDHSIZE(m1s3GatedHSIZE),       
        .M1GATEDHTRANS(m1s3GatedHTRANS),      
		.M1GATEDHBURST(m1s3GatedHBURST), // AI 	 : added for burst
        .M1GATEDHWRITE(m1s3GatedHWRITE),      
        .M2GATEDHADDR(m2s3GatedHADDR),       
        .M2GATEDHMASTLOCK(m2s3GatedHMASTLOCK),   
        .M2GATEDHSIZE(m2s3GatedHSIZE),       
        .M2GATEDHTRANS(m2s3GatedHTRANS),      
		.M2GATEDHBURST(m2s3GatedHBURST), // AI 	 : added for burst
        .M2GATEDHWRITE(m2s3GatedHWRITE),      
        .M3GATEDHADDR(m3s3GatedHADDR),       
        .M3GATEDHMASTLOCK(m3s3GatedHMASTLOCK),   
        .M3GATEDHSIZE(m3s3GatedHSIZE),       
        .M3GATEDHTRANS(m3s3GatedHTRANS),      
		.M3GATEDHBURST(m3s3GatedHBURST), // AI 	 : added for burst
        .M3GATEDHWRITE(m3s3GatedHWRITE),      
        .HWDATA_M0(HWDATA_M0S3),          
        .HWDATA_M1(HWDATA_M1S3),          
        .HWDATA_M2(HWDATA_M2S3),          
        .HWDATA_M3(HWDATA_M3S3)           
    );
    COREAHBLITE_SLAVESTAGE #(.SYNC_RESET(SYNC_RESET))
	 slavestage_4
    (
        .HCLK(HCLK),
        .HRESETN(HRESETN),
        .HREADYOUT(INT_HREADYOUT_S4),
        .HRESP(INT_HRESP_S4),
        .HSEL(HSEL_S4),
        .HADDR(HADDR_S4),
        .HSIZE(HSIZE_S4),
        .HTRANS(HTRANS_S4),
		.HBURST (HBURST_S4),                      // AI  : added for burst	
        .HWRITE(HWRITE_S4),
        .HWDATA(HWDATA_S4),
        .HREADY_S(HREADY_S4),
        .HMASTLOCK(HMASTLOCK_S4),
        .MADDRSEL({m3s4AddrSel_int,m2s4AddrSel_int,m1s4AddrSel_int,m0s4AddrSel_int}),           
        .MDATASEL({m3s4DataSel_int,m2s4DataSel_int,m1s4DataSel_int,m0s4DataSel_int}),           
        .MPREVDATASLAVEREADY({m3s4PrevDataSlaveReady,m2s4PrevDataSlaveReady,m1s4PrevDataSlaveReady,m0s4PrevDataSlaveReady}), 
        .MADDRREADY({s4m3AddrReady,s4m2AddrReady,s4m1AddrReady,s4m0AddrReady}),      
        .MDATAREADY({s4m3DataReady,s4m2DataReady,s4m1DataReady,s4m0DataReady}),      
        .MHRESP({s4m3HResp,s4m2HResp,s4m1HResp,s4m0HResp}),      
        .M0GATEDHADDR(m0s4GatedHADDR),       
        .M0GATEDHMASTLOCK(m0s4GatedHMASTLOCK),   
        .M0GATEDHSIZE(m0s4GatedHSIZE),       
        .M0GATEDHTRANS(m0s4GatedHTRANS), 
        .M0GATEDHBURST(m0s4GatedHBURST), // AI 	 : added for burst		
        .M0GATEDHWRITE(m0s4GatedHWRITE),      
        .M1GATEDHADDR(m1s4GatedHADDR),       
        .M1GATEDHMASTLOCK(m1s4GatedHMASTLOCK),   
        .M1GATEDHSIZE(m1s4GatedHSIZE),       
        .M1GATEDHTRANS(m1s4GatedHTRANS),      
		.M1GATEDHBURST(m1s4GatedHBURST), // AI 	 : added for burst
        .M1GATEDHWRITE(m1s4GatedHWRITE),      
        .M2GATEDHADDR(m2s4GatedHADDR),       
        .M2GATEDHMASTLOCK(m2s4GatedHMASTLOCK),   
        .M2GATEDHSIZE(m2s4GatedHSIZE),       
        .M2GATEDHTRANS(m2s4GatedHTRANS),
        .M2GATEDHBURST(m2s4GatedHBURST), // AI 	 : added for burst		
        .M2GATEDHWRITE(m2s4GatedHWRITE),      
        .M3GATEDHADDR(m3s4GatedHADDR),       
        .M3GATEDHMASTLOCK(m3s4GatedHMASTLOCK),   
        .M3GATEDHSIZE(m3s4GatedHSIZE),       
        .M3GATEDHTRANS(m3s4GatedHTRANS),
        .M3GATEDHBURST(m3s4GatedHBURST), // AI 		 : added for burst	
        .M3GATEDHWRITE(m3s4GatedHWRITE),      
        .HWDATA_M0(HWDATA_M0S4),          
        .HWDATA_M1(HWDATA_M1S4),          
        .HWDATA_M2(HWDATA_M2S4),          
        .HWDATA_M3(HWDATA_M3S4)           
    );
    COREAHBLITE_SLAVESTAGE #(.SYNC_RESET(SYNC_RESET))
	 slavestage_5
    (
        .HCLK(HCLK),
        .HRESETN(HRESETN),
        .HREADYOUT(INT_HREADYOUT_S5),
        .HRESP(INT_HRESP_S5),
        .HSEL(HSEL_S5),
        .HADDR(HADDR_S5),
        .HSIZE(HSIZE_S5),
        .HTRANS(HTRANS_S5),
		.HBURST (HBURST_S5),                     // AI  : added for burst	
        .HWRITE(HWRITE_S5),
        .HWDATA(HWDATA_S5),
        .HREADY_S(HREADY_S5),
        .HMASTLOCK(HMASTLOCK_S5),
        .MADDRSEL({m3s5AddrSel_int,m2s5AddrSel_int,m1s5AddrSel_int,m0s5AddrSel_int}),           
        .MDATASEL({m3s5DataSel_int,m2s5DataSel_int,m1s5DataSel_int,m0s5DataSel_int}),           
        .MPREVDATASLAVEREADY({m3s5PrevDataSlaveReady,m2s5PrevDataSlaveReady,m1s5PrevDataSlaveReady,m0s5PrevDataSlaveReady}), 
        .MADDRREADY({s5m3AddrReady,s5m2AddrReady,s5m1AddrReady,s5m0AddrReady}),      
        .MDATAREADY({s5m3DataReady,s5m2DataReady,s5m1DataReady,s5m0DataReady}),      
        .MHRESP({s5m3HResp,s5m2HResp,s5m1HResp,s5m0HResp}),      
        .M0GATEDHADDR(m0s5GatedHADDR),       
        .M0GATEDHMASTLOCK(m0s5GatedHMASTLOCK),   
        .M0GATEDHSIZE(m0s5GatedHSIZE),       
        .M0GATEDHTRANS(m0s5GatedHTRANS),
        .M0GATEDHBURST(m0s5GatedHBURST), // AI 	 : added for burst		
        .M0GATEDHWRITE(m0s5GatedHWRITE),      
        .M1GATEDHADDR(m1s5GatedHADDR),       
        .M1GATEDHMASTLOCK(m1s5GatedHMASTLOCK),   
        .M1GATEDHSIZE(m1s5GatedHSIZE),       
        .M1GATEDHTRANS(m1s5GatedHTRANS),     
        .M1GATEDHBURST(m1s5GatedHBURST), // AI 	 : added for burst		
        .M1GATEDHWRITE(m1s5GatedHWRITE),      
        .M2GATEDHADDR(m2s5GatedHADDR),       
        .M2GATEDHMASTLOCK(m2s5GatedHMASTLOCK),   
        .M2GATEDHSIZE(m2s5GatedHSIZE),       
        .M2GATEDHTRANS(m2s5GatedHTRANS),
		.M2GATEDHBURST(m2s5GatedHBURST), // AI 	 : added for burst
        .M2GATEDHWRITE(m2s5GatedHWRITE),      
        .M3GATEDHADDR(m3s5GatedHADDR),       
        .M3GATEDHMASTLOCK(m3s5GatedHMASTLOCK),   
        .M3GATEDHSIZE(m3s5GatedHSIZE),       
        .M3GATEDHTRANS(m3s5GatedHTRANS),
        .M3GATEDHBURST(m3s5GatedHBURST), // AI 	 : added for burst		
        .M3GATEDHWRITE(m3s5GatedHWRITE),      
        .HWDATA_M0(HWDATA_M0S5),          
        .HWDATA_M1(HWDATA_M1S5),          
        .HWDATA_M2(HWDATA_M2S5),          
        .HWDATA_M3(HWDATA_M3S5)           
    );
    COREAHBLITE_SLAVESTAGE #(.SYNC_RESET(SYNC_RESET))
	 slavestage_6
    (
        .HCLK(HCLK),
        .HRESETN(HRESETN),
        .HREADYOUT(INT_HREADYOUT_S6),
        .HRESP(INT_HRESP_S6),
        .HSEL(HSEL_S6),
        .HADDR(HADDR_S6),
        .HSIZE(HSIZE_S6),
        .HTRANS(HTRANS_S6),
		.HBURST (HBURST_S6),                      // AI  : added for burst	
        .HWRITE(HWRITE_S6),
        .HWDATA(HWDATA_S6),
        .HREADY_S(HREADY_S6),
        .HMASTLOCK(HMASTLOCK_S6),
        .MADDRSEL({m3s6AddrSel_int,m2s6AddrSel_int,m1s6AddrSel_int,m0s6AddrSel_int}),           
        .MDATASEL({m3s6DataSel_int,m2s6DataSel_int,m1s6DataSel_int,m0s6DataSel_int}),           
        .MPREVDATASLAVEREADY({m3s6PrevDataSlaveReady,m2s6PrevDataSlaveReady,m1s6PrevDataSlaveReady,m0s6PrevDataSlaveReady}), 
        .MADDRREADY({s6m3AddrReady,s6m2AddrReady,s6m1AddrReady,s6m0AddrReady}),      
        .MDATAREADY({s6m3DataReady,s6m2DataReady,s6m1DataReady,s6m0DataReady}),      
        .MHRESP({s6m3HResp,s6m2HResp,s6m1HResp,s6m0HResp}),      
        .M0GATEDHADDR(m0s6GatedHADDR),       
        .M0GATEDHMASTLOCK(m0s6GatedHMASTLOCK),   
        .M0GATEDHSIZE(m0s6GatedHSIZE),       
        .M0GATEDHTRANS(m0s6GatedHTRANS),
		.M0GATEDHBURST(m0s6GatedHBURST), // AI     : added for burst    
        .M0GATEDHWRITE(m0s6GatedHWRITE),      
        .M1GATEDHADDR(m1s6GatedHADDR),       
        .M1GATEDHMASTLOCK(m1s6GatedHMASTLOCK),   
        .M1GATEDHSIZE(m1s6GatedHSIZE),       
        .M1GATEDHTRANS(m1s6GatedHTRANS),
		.M1GATEDHBURST(m1s6GatedHBURST), // AI     : added for burst    
        .M1GATEDHWRITE(m1s6GatedHWRITE),      
        .M2GATEDHADDR(m2s6GatedHADDR),       
        .M2GATEDHMASTLOCK(m2s6GatedHMASTLOCK),   
        .M2GATEDHSIZE(m2s6GatedHSIZE),       
        .M2GATEDHTRANS(m2s6GatedHTRANS),
		.M2GATEDHBURST(m2s6GatedHBURST), // AI    : added for burst     
        .M2GATEDHWRITE(m2s6GatedHWRITE),      
        .M3GATEDHADDR(m3s6GatedHADDR),       
        .M3GATEDHMASTLOCK(m3s6GatedHMASTLOCK),   
        .M3GATEDHSIZE(m3s6GatedHSIZE),       
        .M3GATEDHTRANS(m3s6GatedHTRANS), 
        .M3GATEDHBURST(m3s6GatedHBURST), // AI 	 : added for burst	
        .M3GATEDHWRITE(m3s6GatedHWRITE),      
        .HWDATA_M0(HWDATA_M0S6),          
        .HWDATA_M1(HWDATA_M1S6),          
        .HWDATA_M2(HWDATA_M2S6),          
        .HWDATA_M3(HWDATA_M3S6)           
    );
    COREAHBLITE_SLAVESTAGE #(.SYNC_RESET(SYNC_RESET))
	 slavestage_7
    (
        .HCLK(HCLK),
        .HRESETN(HRESETN),
        .HREADYOUT(INT_HREADYOUT_S7),
        .HRESP(INT_HRESP_S7),
        .HSEL(HSEL_S7),
        .HADDR(HADDR_S7),
        .HSIZE(HSIZE_S7),
        .HTRANS(HTRANS_S7),
		.HBURST (HBURST_S7),                          // AI  : added for burst	
        .HWRITE(HWRITE_S7),
        .HWDATA(HWDATA_S7),
        .HREADY_S(HREADY_S7),
        .HMASTLOCK(HMASTLOCK_S7),
        .MADDRSEL({m3s7AddrSel_int,m2s7AddrSel_int,m1s7AddrSel_int,m0s7AddrSel_int}),           
        .MDATASEL({m3s7DataSel_int,m2s7DataSel_int,m1s7DataSel_int,m0s7DataSel_int}),           
        .MPREVDATASLAVEREADY({m3s7PrevDataSlaveReady,m2s7PrevDataSlaveReady,m1s7PrevDataSlaveReady,m0s7PrevDataSlaveReady}), 
        .MADDRREADY({s7m3AddrReady,s7m2AddrReady,s7m1AddrReady,s7m0AddrReady}),      
        .MDATAREADY({s7m3DataReady,s7m2DataReady,s7m1DataReady,s7m0DataReady}),      
        .MHRESP({s7m3HResp,s7m2HResp,s7m1HResp,s7m0HResp}),      
        .M0GATEDHADDR(m0s7GatedHADDR),       
        .M0GATEDHMASTLOCK(m0s7GatedHMASTLOCK),   
        .M0GATEDHSIZE(m0s7GatedHSIZE),       
        .M0GATEDHTRANS(m0s7GatedHTRANS),
		.M0GATEDHBURST(m0s7GatedHBURST), // AI    : added for burst     
        .M0GATEDHWRITE(m0s7GatedHWRITE),      
        .M1GATEDHADDR(m1s7GatedHADDR),       
        .M1GATEDHMASTLOCK(m1s7GatedHMASTLOCK),   
        .M1GATEDHSIZE(m1s7GatedHSIZE),       
        .M1GATEDHTRANS(m1s7GatedHTRANS), 
		.M1GATEDHBURST(m1s7GatedHBURST), // AI     : added for burst   
        .M1GATEDHWRITE(m1s7GatedHWRITE),      
        .M2GATEDHADDR(m2s7GatedHADDR),       
        .M2GATEDHMASTLOCK(m2s7GatedHMASTLOCK),   
        .M2GATEDHSIZE(m2s7GatedHSIZE),       
        .M2GATEDHTRANS(m2s7GatedHTRANS),
		.M2GATEDHBURST(m2s7GatedHBURST), // AI     : added for burst    
        .M2GATEDHWRITE(m2s7GatedHWRITE),      
        .M3GATEDHADDR(m3s7GatedHADDR),       
        .M3GATEDHMASTLOCK(m3s7GatedHMASTLOCK),   
        .M3GATEDHSIZE(m3s7GatedHSIZE),       
        .M3GATEDHTRANS(m3s7GatedHTRANS),
        .M3GATEDHBURST(m3s7GatedHBURST), // AI 		 : added for burst
        .M3GATEDHWRITE(m3s7GatedHWRITE),      
        .HWDATA_M0(HWDATA_M0S7),          
        .HWDATA_M1(HWDATA_M1S7),          
        .HWDATA_M2(HWDATA_M2S7),          
        .HWDATA_M3(HWDATA_M3S7)           
    );
    COREAHBLITE_SLAVESTAGE #(.SYNC_RESET(SYNC_RESET))
	 slavestage_8
    (
        .HCLK(HCLK),
        .HRESETN(HRESETN),
        .HREADYOUT(INT_HREADYOUT_S8),
        .HRESP(INT_HRESP_S8),
        .HSEL(HSEL_S8),
        .HADDR(HADDR_S8),
        .HSIZE(HSIZE_S8),
        .HTRANS(HTRANS_S8),
		.HBURST (HBURST_S8),                     // AI  : added for burst	
        .HWRITE(HWRITE_S8),
        .HWDATA(HWDATA_S8),
        .HREADY_S(HREADY_S8),
        .HMASTLOCK(HMASTLOCK_S8),
        .MADDRSEL({m3s8AddrSel_int,m2s8AddrSel_int,m1s8AddrSel_int,m0s8AddrSel_int}),           
        .MDATASEL({m3s8DataSel_int,m2s8DataSel_int,m1s8DataSel_int,m0s8DataSel_int}),           
        .MPREVDATASLAVEREADY({m3s8PrevDataSlaveReady,m2s8PrevDataSlaveReady,m1s8PrevDataSlaveReady,m0s8PrevDataSlaveReady}), 
        .MADDRREADY({s8m3AddrReady,s8m2AddrReady,s8m1AddrReady,s8m0AddrReady}),      
        .MDATAREADY({s8m3DataReady,s8m2DataReady,s8m1DataReady,s8m0DataReady}),      
        .MHRESP({s8m3HResp,s8m2HResp,s8m1HResp,s8m0HResp}),      
        .M0GATEDHADDR(m0s8GatedHADDR),       
        .M0GATEDHMASTLOCK(m0s8GatedHMASTLOCK),   
        .M0GATEDHSIZE(m0s8GatedHSIZE),       
        .M0GATEDHTRANS(m0s8GatedHTRANS), 
		.M0GATEDHBURST(m0s8GatedHBURST), // AI    : added for burst    
        .M0GATEDHWRITE(m0s8GatedHWRITE),      
        .M1GATEDHADDR(m1s8GatedHADDR),       
        .M1GATEDHMASTLOCK(m1s8GatedHMASTLOCK),   
        .M1GATEDHSIZE(m1s8GatedHSIZE),       
        .M1GATEDHTRANS(m1s8GatedHTRANS),
		.M1GATEDHBURST(m1s8GatedHBURST), // AI     : added for burst    
        .M1GATEDHWRITE(m1s8GatedHWRITE),      
        .M2GATEDHADDR(m2s8GatedHADDR),       
        .M2GATEDHMASTLOCK(m2s8GatedHMASTLOCK),   
        .M2GATEDHSIZE(m2s8GatedHSIZE),       
        .M2GATEDHTRANS(m2s8GatedHTRANS),
		.M2GATEDHBURST(m2s8GatedHBURST), // AI     : added for burst    
        .M2GATEDHWRITE(m2s8GatedHWRITE),      
        .M3GATEDHADDR(m3s8GatedHADDR),       
        .M3GATEDHMASTLOCK(m3s8GatedHMASTLOCK),   
        .M3GATEDHSIZE(m3s8GatedHSIZE),       
        .M3GATEDHTRANS(m3s8GatedHTRANS),  
		.M3GATEDHBURST(m3s8GatedHBURST), // AI      : added for burst 
        .M3GATEDHWRITE(m3s8GatedHWRITE),      
        .HWDATA_M0(HWDATA_M0S8),          
        .HWDATA_M1(HWDATA_M1S8),          
        .HWDATA_M2(HWDATA_M2S8),          
        .HWDATA_M3(HWDATA_M3S8)           
    );
   COREAHBLITE_SLAVESTAGE #(.SYNC_RESET(SYNC_RESET))
	 slavestage_9
    (
        .HCLK(HCLK),
        .HRESETN(HRESETN),
        .HREADYOUT(INT_HREADYOUT_S9),
        .HRESP(INT_HRESP_S9),
        .HSEL(HSEL_S9),
        .HADDR(HADDR_S9),
        .HSIZE(HSIZE_S9),
        .HTRANS(HTRANS_S9),
		.HBURST (HBURST_S9),                // AI  : added for burst	
        .HWRITE(HWRITE_S9),
        .HWDATA(HWDATA_S9),
        .HREADY_S(HREADY_S9),
        .HMASTLOCK(HMASTLOCK_S9),
        .MADDRSEL({m3s9AddrSel_int,m2s9AddrSel_int,m1s9AddrSel_int,m0s9AddrSel_int}),           
        .MDATASEL({m3s9DataSel_int,m2s9DataSel_int,m1s9DataSel_int,m0s9DataSel_int}),           
        .MPREVDATASLAVEREADY({m3s9PrevDataSlaveReady,m2s9PrevDataSlaveReady,m1s9PrevDataSlaveReady,m0s9PrevDataSlaveReady}), 
        .MADDRREADY({s9m3AddrReady,s9m2AddrReady,s9m1AddrReady,s9m0AddrReady}),      
        .MDATAREADY({s9m3DataReady,s9m2DataReady,s9m1DataReady,s9m0DataReady}),      
        .MHRESP({s9m3HResp,s9m2HResp,s9m1HResp,s9m0HResp}),      
        .M0GATEDHADDR(m0s9GatedHADDR),       
        .M0GATEDHMASTLOCK(m0s9GatedHMASTLOCK),   
        .M0GATEDHSIZE(m0s9GatedHSIZE),       
        .M0GATEDHTRANS(m0s9GatedHTRANS), 
		.M0GATEDHBURST(m0s9GatedHBURST), // AI   : added for burst     
        .M0GATEDHWRITE(m0s9GatedHWRITE),      
        .M1GATEDHADDR(m1s9GatedHADDR),       
        .M1GATEDHMASTLOCK(m1s9GatedHMASTLOCK),   
        .M1GATEDHSIZE(m1s9GatedHSIZE),       
        .M1GATEDHTRANS(m1s9GatedHTRANS), 
		.M1GATEDHBURST(m1s9GatedHBURST), // AI   : added for burst     
        .M1GATEDHWRITE(m1s9GatedHWRITE),      
        .M2GATEDHADDR(m2s9GatedHADDR),       
        .M2GATEDHMASTLOCK(m2s9GatedHMASTLOCK),   
        .M2GATEDHSIZE(m2s9GatedHSIZE),       
        .M2GATEDHTRANS(m2s9GatedHTRANS),
		.M2GATEDHBURST(m2s9GatedHBURST), // AI   : added for burst      
        .M2GATEDHWRITE(m2s9GatedHWRITE),      
        .M3GATEDHADDR(m3s9GatedHADDR),       
        .M3GATEDHMASTLOCK(m3s9GatedHMASTLOCK),   
        .M3GATEDHSIZE(m3s9GatedHSIZE),       
        .M3GATEDHTRANS(m3s9GatedHTRANS),      
		.M3GATEDHBURST(m3s9GatedHBURST), // AI   : added for burst 
        .M3GATEDHWRITE(m3s9GatedHWRITE),      
        .HWDATA_M0(HWDATA_M0S9),          
        .HWDATA_M1(HWDATA_M1S9),          
        .HWDATA_M2(HWDATA_M2S9),          
        .HWDATA_M3(HWDATA_M3S9)           
    );
    COREAHBLITE_SLAVESTAGE #(.SYNC_RESET(SYNC_RESET))
	 slavestage_10
    (
        .HCLK(HCLK),
        .HRESETN(HRESETN),
        .HREADYOUT(INT_HREADYOUT_S10),
        .HRESP(INT_HRESP_S10),
        .HSEL(HSEL_S10),
        .HADDR(HADDR_S10),
        .HSIZE(HSIZE_S10),
        .HTRANS(HTRANS_S10),
		.HBURST (HBURST_S10),           // AI  : added for burst	
        .HWRITE(HWRITE_S10),
        .HWDATA(HWDATA_S10),
        .HREADY_S(HREADY_S10),
        .HMASTLOCK(HMASTLOCK_S10),
        .MADDRSEL({m3s10AddrSel_int,m2s10AddrSel_int,m1s10AddrSel_int,m0s10AddrSel_int}),           
        .MDATASEL({m3s10DataSel_int,m2s10DataSel_int,m1s10DataSel_int,m0s10DataSel_int}),           
        .MPREVDATASLAVEREADY({m3s10PrevDataSlaveReady,m2s10PrevDataSlaveReady,m1s10PrevDataSlaveReady,m0s10PrevDataSlaveReady}), 
        .MADDRREADY({s10m3AddrReady,s10m2AddrReady,s10m1AddrReady,s10m0AddrReady}),      
        .MDATAREADY({s10m3DataReady,s10m2DataReady,s10m1DataReady,s10m0DataReady}),      
        .MHRESP({s10m3HResp,s10m2HResp,s10m1HResp,s10m0HResp}),      
        .M0GATEDHADDR(m0s10GatedHADDR),       
        .M0GATEDHMASTLOCK(m0s10GatedHMASTLOCK),   
        .M0GATEDHSIZE(m0s10GatedHSIZE),       
        .M0GATEDHTRANS(m0s10GatedHTRANS),
		.M0GATEDHBURST(m0s10GatedHBURST), // AI  : added for burst       
        .M0GATEDHWRITE(m0s10GatedHWRITE),      
        .M1GATEDHADDR(m1s10GatedHADDR),       
        .M1GATEDHMASTLOCK(m1s10GatedHMASTLOCK),   
        .M1GATEDHSIZE(m1s10GatedHSIZE),       
        .M1GATEDHTRANS(m1s10GatedHTRANS),
		.M1GATEDHBURST(m1s10GatedHBURST), // AI    : added for burst     
        .M1GATEDHWRITE(m1s10GatedHWRITE),      
        .M2GATEDHADDR(m2s10GatedHADDR),       
        .M2GATEDHMASTLOCK(m2s10GatedHMASTLOCK),   
        .M2GATEDHSIZE(m2s10GatedHSIZE),       
        .M2GATEDHTRANS(m2s10GatedHTRANS),
		.M2GATEDHBURST(m2s10GatedHBURST), // AI     : added for burst   
        .M2GATEDHWRITE(m2s10GatedHWRITE),      
        .M3GATEDHADDR(m3s10GatedHADDR),       
        .M3GATEDHMASTLOCK(m3s10GatedHMASTLOCK),   
        .M3GATEDHSIZE(m3s10GatedHSIZE),       
        .M3GATEDHTRANS(m3s10GatedHTRANS), 
		.M3GATEDHBURST(m3s10GatedHBURST), // AI     : added for burst   
        .M3GATEDHWRITE(m3s10GatedHWRITE),      
        .HWDATA_M0(HWDATA_M0S10),          
        .HWDATA_M1(HWDATA_M1S10),          
        .HWDATA_M2(HWDATA_M2S10),          
        .HWDATA_M3(HWDATA_M3S10)           
    );
    COREAHBLITE_SLAVESTAGE #(.SYNC_RESET(SYNC_RESET))
	 slavestage_11
    (
        .HCLK(HCLK),
        .HRESETN(HRESETN),
        .HREADYOUT(INT_HREADYOUT_S11),
        .HRESP(INT_HRESP_S11),
        .HSEL(HSEL_S11),
        .HADDR(HADDR_S11),
        .HSIZE(HSIZE_S11),
        .HTRANS(HTRANS_S11),
		.HBURST (HBURST_S11),               // AI  : added for burst	
        .HWRITE(HWRITE_S11),
        .HWDATA(HWDATA_S11),
        .HREADY_S(HREADY_S11),
        .HMASTLOCK(HMASTLOCK_S11),
        .MADDRSEL({m3s11AddrSel_int,m2s11AddrSel_int,m1s11AddrSel_int,m0s11AddrSel_int}),           
        .MDATASEL({m3s11DataSel_int,m2s11DataSel_int,m1s11DataSel_int,m0s11DataSel_int}),           
        .MPREVDATASLAVEREADY({m3s11PrevDataSlaveReady,m2s11PrevDataSlaveReady,m1s11PrevDataSlaveReady,m0s11PrevDataSlaveReady}), 
        .MADDRREADY({s11m3AddrReady,s11m2AddrReady,s11m1AddrReady,s11m0AddrReady}),      
        .MDATAREADY({s11m3DataReady,s11m2DataReady,s11m1DataReady,s11m0DataReady}),      
        .MHRESP({s11m3HResp,s11m2HResp,s11m1HResp,s11m0HResp}),      
        .M0GATEDHADDR(m0s11GatedHADDR),       
        .M0GATEDHMASTLOCK(m0s11GatedHMASTLOCK),   
        .M0GATEDHSIZE(m0s11GatedHSIZE),       
        .M0GATEDHTRANS(m0s11GatedHTRANS), 
		.M0GATEDHBURST(m0s11GatedHBURST), // AI   : added for burst     
        .M0GATEDHWRITE(m0s11GatedHWRITE),      
        .M1GATEDHADDR(m1s11GatedHADDR),       
        .M1GATEDHMASTLOCK(m1s11GatedHMASTLOCK),   
        .M1GATEDHSIZE(m1s11GatedHSIZE),       
        .M1GATEDHTRANS(m1s11GatedHTRANS),
		.M1GATEDHBURST(m1s11GatedHBURST), // AI    : added for burst    
        .M1GATEDHWRITE(m1s11GatedHWRITE),      
        .M2GATEDHADDR(m2s11GatedHADDR),       
        .M2GATEDHMASTLOCK(m2s11GatedHMASTLOCK),   
        .M2GATEDHSIZE(m2s11GatedHSIZE),       
        .M2GATEDHTRANS(m2s11GatedHTRANS), 
		.M2GATEDHBURST(m2s11GatedHBURST), // AI    : added for burst   
        .M2GATEDHWRITE(m2s11GatedHWRITE),      
        .M3GATEDHADDR(m3s11GatedHADDR),       
        .M3GATEDHMASTLOCK(m3s11GatedHMASTLOCK),   
        .M3GATEDHSIZE(m3s11GatedHSIZE),       
        .M3GATEDHTRANS(m3s11GatedHTRANS),  
		.M3GATEDHBURST(m3s11GatedHBURST), // AI      : added for burst 
        .M3GATEDHWRITE(m3s11GatedHWRITE),      
        .HWDATA_M0(HWDATA_M0S11),          
        .HWDATA_M1(HWDATA_M1S11),          
        .HWDATA_M2(HWDATA_M2S11),          
        .HWDATA_M3(HWDATA_M3S11)           
    );
    COREAHBLITE_SLAVESTAGE #(.SYNC_RESET(SYNC_RESET))
	 slavestage_12
    (
        .HCLK(HCLK),
        .HRESETN(HRESETN),
        .HREADYOUT(INT_HREADYOUT_S12),
        .HRESP(INT_HRESP_S12),
        .HSEL(HSEL_S12),
        .HADDR(HADDR_S12),
        .HSIZE(HSIZE_S12),
        .HTRANS(HTRANS_S12),
		.HBURST (HBURST_S12),              // AI  : added for burst	
        .HWRITE(HWRITE_S12),
        .HWDATA(HWDATA_S12),
        .HREADY_S(HREADY_S12),
        .HMASTLOCK(HMASTLOCK_S12),
        .MADDRSEL({m3s12AddrSel_int,m2s12AddrSel_int,m1s12AddrSel_int,m0s12AddrSel_int}),           
        .MDATASEL({m3s12DataSel_int,m2s12DataSel_int,m1s12DataSel_int,m0s12DataSel_int}),           
        .MPREVDATASLAVEREADY({m3s12PrevDataSlaveReady,m2s12PrevDataSlaveReady,m1s12PrevDataSlaveReady,m0s12PrevDataSlaveReady}), 
        .MADDRREADY({s12m3AddrReady,s12m2AddrReady,s12m1AddrReady,s12m0AddrReady}),      
        .MDATAREADY({s12m3DataReady,s12m2DataReady,s12m1DataReady,s12m0DataReady}),      
        .MHRESP({s12m3HResp,s12m2HResp,s12m1HResp,s12m0HResp}),      
        .M0GATEDHADDR(m0s12GatedHADDR),       
        .M0GATEDHMASTLOCK(m0s12GatedHMASTLOCK),   
        .M0GATEDHSIZE(m0s12GatedHSIZE),       
        .M0GATEDHTRANS(m0s12GatedHTRANS),
		.M0GATEDHBURST(m0s12GatedHBURST), // AI     : added for burst    
        .M0GATEDHWRITE(m0s12GatedHWRITE),      
        .M1GATEDHADDR(m1s12GatedHADDR),       
        .M1GATEDHMASTLOCK(m1s12GatedHMASTLOCK),   
        .M1GATEDHSIZE(m1s12GatedHSIZE),       
        .M1GATEDHTRANS(m1s12GatedHTRANS),
		.M1GATEDHBURST(m1s12GatedHBURST), // AI   : added for burst     
        .M1GATEDHWRITE(m1s12GatedHWRITE),      
        .M2GATEDHADDR(m2s12GatedHADDR),       
        .M2GATEDHMASTLOCK(m2s12GatedHMASTLOCK),   
        .M2GATEDHSIZE(m2s12GatedHSIZE),       
        .M2GATEDHTRANS(m2s12GatedHTRANS),
		.M2GATEDHBURST(m2s12GatedHBURST), // AI     : added for burst    
        .M2GATEDHWRITE(m2s12GatedHWRITE),      
        .M3GATEDHADDR(m3s12GatedHADDR),       
        .M3GATEDHMASTLOCK(m3s12GatedHMASTLOCK),   
        .M3GATEDHSIZE(m3s12GatedHSIZE),       
        .M3GATEDHTRANS(m3s12GatedHTRANS), 
		.M3GATEDHBURST(m3s12GatedHBURST), // AI    : added for burst    
        .M3GATEDHWRITE(m3s12GatedHWRITE),      
        .HWDATA_M0(HWDATA_M0S12),          
        .HWDATA_M1(HWDATA_M1S12),          
        .HWDATA_M2(HWDATA_M2S12),          
        .HWDATA_M3(HWDATA_M3S12)           
    );
    COREAHBLITE_SLAVESTAGE #(.SYNC_RESET(SYNC_RESET))
	 slavestage_13
    (
        .HCLK(HCLK),
        .HRESETN(HRESETN),
        .HREADYOUT(INT_HREADYOUT_S13),
        .HRESP(INT_HRESP_S13),
        .HSEL(HSEL_S13),
        .HADDR(HADDR_S13),
        .HSIZE(HSIZE_S13),
        .HTRANS(HTRANS_S13),
		.HBURST (HBURST_S13),                   // AI  : added for burst	
        .HWRITE(HWRITE_S13),
        .HWDATA(HWDATA_S13),
        .HREADY_S(HREADY_S13),
        .HMASTLOCK(HMASTLOCK_S13),
        .MADDRSEL({m3s13AddrSel_int,m2s13AddrSel_int,m1s13AddrSel_int,m0s13AddrSel_int}),           
        .MDATASEL({m3s13DataSel_int,m2s13DataSel_int,m1s13DataSel_int,m0s13DataSel_int}),           
        .MPREVDATASLAVEREADY({m3s13PrevDataSlaveReady,m2s13PrevDataSlaveReady,m1s13PrevDataSlaveReady,m0s13PrevDataSlaveReady}), 
        .MADDRREADY({s13m3AddrReady,s13m2AddrReady,s13m1AddrReady,s13m0AddrReady}),      
        .MDATAREADY({s13m3DataReady,s13m2DataReady,s13m1DataReady,s13m0DataReady}),      
        .MHRESP({s13m3HResp,s13m2HResp,s13m1HResp,s13m0HResp}),      
        .M0GATEDHADDR(m0s13GatedHADDR),       
        .M0GATEDHMASTLOCK(m0s13GatedHMASTLOCK),   
        .M0GATEDHSIZE(m0s13GatedHSIZE),       
        .M0GATEDHTRANS(m0s13GatedHTRANS),
		.M0GATEDHBURST(m0s13GatedHBURST), // AI    : added for burst     
        .M0GATEDHWRITE(m0s13GatedHWRITE),      
        .M1GATEDHADDR(m1s13GatedHADDR),       
        .M1GATEDHMASTLOCK(m1s13GatedHMASTLOCK),   
        .M1GATEDHSIZE(m1s13GatedHSIZE),       
        .M1GATEDHTRANS(m1s13GatedHTRANS), 
		.M1GATEDHBURST(m1s13GatedHBURST), // AI  : added for burst      
        .M1GATEDHWRITE(m1s13GatedHWRITE),      
        .M2GATEDHADDR(m2s13GatedHADDR),       
        .M2GATEDHMASTLOCK(m2s13GatedHMASTLOCK),   
        .M2GATEDHSIZE(m2s13GatedHSIZE),       
        .M2GATEDHTRANS(m2s13GatedHTRANS),
		.M2GATEDHBURST(m2s13GatedHBURST), // AI    : added for burst    
        .M2GATEDHWRITE(m2s13GatedHWRITE),      
        .M3GATEDHADDR(m3s13GatedHADDR),       
        .M3GATEDHMASTLOCK(m3s13GatedHMASTLOCK),   
        .M3GATEDHSIZE(m3s13GatedHSIZE),       
        .M3GATEDHTRANS(m3s13GatedHTRANS), 
		.M3GATEDHBURST(m3s13GatedHBURST), // AI    : added for burst   
        .M3GATEDHWRITE(m3s13GatedHWRITE),      
        .HWDATA_M0(HWDATA_M0S13),          
        .HWDATA_M1(HWDATA_M1S13),          
        .HWDATA_M2(HWDATA_M2S13),          
        .HWDATA_M3(HWDATA_M3S13)           
    );
    COREAHBLITE_SLAVESTAGE #(.SYNC_RESET(SYNC_RESET))
	 slavestage_14
    (
        .HCLK(HCLK),
        .HRESETN(HRESETN),
        .HREADYOUT(INT_HREADYOUT_S14),
        .HRESP(INT_HRESP_S14),
        .HSEL(HSEL_S14),
        .HADDR(HADDR_S14),
        .HSIZE(HSIZE_S14),
        .HTRANS(HTRANS_S14),
		.HBURST (HBURST_S14),                   // AI  : added for burst	
        .HWRITE(HWRITE_S14),
        .HWDATA(HWDATA_S14),
        .HREADY_S(HREADY_S14),
        .HMASTLOCK(HMASTLOCK_S14),
        .MADDRSEL({m3s14AddrSel_int,m2s14AddrSel_int,m1s14AddrSel_int,m0s14AddrSel_int}),           
        .MDATASEL({m3s14DataSel_int,m2s14DataSel_int,m1s14DataSel_int,m0s14DataSel_int}),           
        .MPREVDATASLAVEREADY({m3s14PrevDataSlaveReady,m2s14PrevDataSlaveReady,m1s14PrevDataSlaveReady,m0s14PrevDataSlaveReady}), 
        .MADDRREADY({s14m3AddrReady,s14m2AddrReady,s14m1AddrReady,s14m0AddrReady}),      
        .MDATAREADY({s14m3DataReady,s14m2DataReady,s14m1DataReady,s14m0DataReady}),      
        .MHRESP({s14m3HResp,s14m2HResp,s14m1HResp,s14m0HResp}),      
        .M0GATEDHADDR(m0s14GatedHADDR),       
        .M0GATEDHMASTLOCK(m0s14GatedHMASTLOCK),   
        .M0GATEDHSIZE(m0s14GatedHSIZE),       
        .M0GATEDHTRANS(m0s14GatedHTRANS), 
		.M0GATEDHBURST(m0s14GatedHBURST), // AI    : added for burst    
        .M0GATEDHWRITE(m0s14GatedHWRITE),      
        .M1GATEDHADDR(m1s14GatedHADDR),       
        .M1GATEDHMASTLOCK(m1s14GatedHMASTLOCK),   
        .M1GATEDHSIZE(m1s14GatedHSIZE),       
        .M1GATEDHTRANS(m1s14GatedHTRANS),
		.M1GATEDHBURST(m1s14GatedHBURST), // AI     : added for burst    
        .M1GATEDHWRITE(m1s14GatedHWRITE),      
        .M2GATEDHADDR(m2s14GatedHADDR),       
        .M2GATEDHMASTLOCK(m2s14GatedHMASTLOCK),   
        .M2GATEDHSIZE(m2s14GatedHSIZE),       
        .M2GATEDHTRANS(m2s14GatedHTRANS),
		.M2GATEDHBURST(m2s14GatedHBURST), // AI     : added for burst    
        .M2GATEDHWRITE(m2s14GatedHWRITE),      
        .M3GATEDHADDR(m3s14GatedHADDR),       
        .M3GATEDHMASTLOCK(m3s14GatedHMASTLOCK),   
        .M3GATEDHSIZE(m3s14GatedHSIZE),       
        .M3GATEDHTRANS(m3s14GatedHTRANS),
		.M3GATEDHBURST(m3s14GatedHBURST), // AI    : added for burst    
        .M3GATEDHWRITE(m3s14GatedHWRITE),      
        .HWDATA_M0(HWDATA_M0S14),          
        .HWDATA_M1(HWDATA_M1S14),          
        .HWDATA_M2(HWDATA_M2S14),          
        .HWDATA_M3(HWDATA_M3S14)           
    );
    COREAHBLITE_SLAVESTAGE #(.SYNC_RESET(SYNC_RESET))
	 slavestage_15
    (
        .HCLK(HCLK),
        .HRESETN(HRESETN),
        .HREADYOUT(INT_HREADYOUT_S15),
        .HRESP(INT_HRESP_S15),
        .HSEL(HSEL_S15),
        .HADDR(HADDR_S15),
        .HSIZE(HSIZE_S15),
        .HTRANS(HTRANS_S15),
		.HBURST (HBURST_S15),          // AI  : added for burst	
        .HWRITE(HWRITE_S15),
        .HWDATA(HWDATA_S15),
        .HREADY_S(HREADY_S15),
        .HMASTLOCK(HMASTLOCK_S15),
        .MADDRSEL({m3s15AddrSel_int,m2s15AddrSel_int,m1s15AddrSel_int,m0s15AddrSel_int}),           
        .MDATASEL({m3s15DataSel_int,m2s15DataSel_int,m1s15DataSel_int,m0s15DataSel_int}),           
        .MPREVDATASLAVEREADY({m3s15PrevDataSlaveReady,m2s15PrevDataSlaveReady,m1s15PrevDataSlaveReady,m0s15PrevDataSlaveReady}), 
        .MADDRREADY({s15m3AddrReady,s15m2AddrReady,s15m1AddrReady,s15m0AddrReady}),      
        .MDATAREADY({s15m3DataReady,s15m2DataReady,s15m1DataReady,s15m0DataReady}),      
        .MHRESP({s15m3HResp,s15m2HResp,s15m1HResp,s15m0HResp}),      
        .M0GATEDHADDR(m0s15GatedHADDR),       
        .M0GATEDHMASTLOCK(m0s15GatedHMASTLOCK),   
        .M0GATEDHSIZE(m0s15GatedHSIZE),       
        .M0GATEDHTRANS(m0s15GatedHTRANS),
		.M0GATEDHBURST(m0s15GatedHBURST), // AI     : added for burst    
        .M0GATEDHWRITE(m0s15GatedHWRITE),      
        .M1GATEDHADDR(m1s15GatedHADDR),       
        .M1GATEDHMASTLOCK(m1s15GatedHMASTLOCK),   
        .M1GATEDHSIZE(m1s15GatedHSIZE),       
        .M1GATEDHTRANS(m1s15GatedHTRANS),
		.M1GATEDHBURST(m1s15GatedHBURST), // AI     : added for burst    
        .M1GATEDHWRITE(m1s15GatedHWRITE),      
        .M2GATEDHADDR(m2s15GatedHADDR),       
        .M2GATEDHMASTLOCK(m2s15GatedHMASTLOCK),   
        .M2GATEDHSIZE(m2s15GatedHSIZE),       
        .M2GATEDHTRANS(m2s15GatedHTRANS),
		.M2GATEDHBURST(m2s15GatedHBURST), // AI    : added for burst     
        .M2GATEDHWRITE(m2s15GatedHWRITE),      
        .M3GATEDHADDR(m3s15GatedHADDR),       
        .M3GATEDHMASTLOCK(m3s15GatedHMASTLOCK),   
        .M3GATEDHSIZE(m3s15GatedHSIZE),       
        .M3GATEDHTRANS(m3s15GatedHTRANS),  
		.M3GATEDHBURST(m3s15GatedHBURST), // AI       : added for burst 
        .M3GATEDHWRITE(m3s15GatedHWRITE),      
        .HWDATA_M0(HWDATA_M0S15),          
        .HWDATA_M1(HWDATA_M1S15),          
        .HWDATA_M2(HWDATA_M2S15),          
        .HWDATA_M3(HWDATA_M3S15)           
    );
    COREAHBLITE_SLAVESTAGE #(.SYNC_RESET(SYNC_RESET))
	 slavestage_16
    (
        .HCLK(HCLK),
        .HRESETN(HRESETN),
        .HREADYOUT(INT_HREADYOUT_S16),
        .HRESP(INT_HRESP_S16),
        .HSEL(HSEL_S16),
        .HADDR(HADDR_S16),
        .HSIZE(HSIZE_S16),
        .HTRANS(HTRANS_S16),
		.HBURST (HBURST_S16),            // AI  : added for burst	
        .HWRITE(HWRITE_S16),
        .HWDATA(HWDATA_S16),
        .HREADY_S(HREADY_S16),
        .HMASTLOCK(HMASTLOCK_S16),
        .MADDRSEL({m3s16AddrSel_int,m2s16AddrSel_int,m1s16AddrSel_int,m0s16AddrSel_int}),           
        .MDATASEL({m3s16DataSel_int,m2s16DataSel_int,m1s16DataSel_int,m0s16DataSel_int}),           
        .MPREVDATASLAVEREADY({m3s16PrevDataSlaveReady,m2s16PrevDataSlaveReady,m1s16PrevDataSlaveReady,m0s16PrevDataSlaveReady}), 
        .MADDRREADY({s16m3AddrReady,s16m2AddrReady,s16m1AddrReady,s16m0AddrReady}),      
        .MDATAREADY({s16m3DataReady,s16m2DataReady,s16m1DataReady,s16m0DataReady}),      
        .MHRESP({s16m3HResp,s16m2HResp,s16m1HResp,s16m0HResp}),      
        .M0GATEDHADDR(m0s16GatedHADDR),       
        .M0GATEDHMASTLOCK(m0s16GatedHMASTLOCK),   
        .M0GATEDHSIZE(m0s16GatedHSIZE),       
        .M0GATEDHTRANS(m0s16GatedHTRANS),      
        .M0GATEDHBURST(m0s16GatedHBURST),   // AI    : added for burst
        .M0GATEDHWRITE(m0s16GatedHWRITE),      
        .M1GATEDHADDR(m1s16GatedHADDR),       
        .M1GATEDHMASTLOCK(m1s16GatedHMASTLOCK),   
        .M1GATEDHSIZE(m1s16GatedHSIZE),       
        .M1GATEDHTRANS(m1s16GatedHTRANS),      
        .M1GATEDHBURST(m1s16GatedHBURST),  // AI     : added for burst
        .M1GATEDHWRITE(m1s16GatedHWRITE),      
        .M2GATEDHADDR(m2s16GatedHADDR),       
        .M2GATEDHMASTLOCK(m2s16GatedHMASTLOCK),   
        .M2GATEDHSIZE(m2s16GatedHSIZE),       
        .M2GATEDHTRANS(m2s16GatedHTRANS), 
		.M2GATEDHBURST(m2s16GatedHBURST), // AI      : added for burst
        .M2GATEDHWRITE(m2s16GatedHWRITE),      
        .M3GATEDHADDR(m3s16GatedHADDR),       
        .M3GATEDHMASTLOCK(m3s16GatedHMASTLOCK),   
        .M3GATEDHSIZE(m3s16GatedHSIZE),       
        .M3GATEDHTRANS(m3s16GatedHTRANS),
		.M3GATEDHBURST(m3s16GatedHBURST), // AI       : added for burst
        .M3GATEDHWRITE(m3s16GatedHWRITE),      
        .HWDATA_M0(HWDATA_M0S16),          
        .HWDATA_M1(HWDATA_M1S16),          
        .HWDATA_M2(HWDATA_M2S16),          
        .HWDATA_M3(HWDATA_M3S16)           
    );
// 
assign HREADY_M0 = HREADY_M0_pre ;
assign HREADY_M1 = HREADY_M1_pre ;
assign HREADY_M2 = HREADY_M2_pre ;
assign HREADY_M3 = HREADY_M3_pre ;
endmodule 
