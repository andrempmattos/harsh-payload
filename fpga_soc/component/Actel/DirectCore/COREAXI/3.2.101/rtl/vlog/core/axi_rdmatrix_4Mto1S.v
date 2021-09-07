// ****************************************************************************/
// Actel Corporation Proprietary and Confidential
// Copyright 2010 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: rdmatrix_4Mto1S.v
//              
//              
//                       - Arbiter
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

module axi_rdmatrix_4Mto1S (
                            // Global signals
                            ACLK,
                            ARESETN,                      
                            
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

                            m0_rd_end,
                            m1_rd_end,
                            m2_rd_end,
                            m3_rd_end,
                            
                            // AXI MASTER write address channel signals
                            ARREADY_SI,
                            RVALID_SI,
                            RLAST_SI,
                            RREADY_IS,
                            
                            // MASTER 0
                            // AXI MASTER write address channel signals
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
                            
                            // MASTER 1
                            // AXI MASTER write address channel signals
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
                            
                            // MASTER 2
                            // AXI MASTER write address channel signals
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
                            
                            // MASTER 3
                            // AXI MASTER write address channel signals
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
                            
                            // SLAVE 0
                            // AXI SLAVE 0 write address channel signals
                            ARID_IS,
                            ARADDR_IS,
                            ARADDR_IS_int,
                            ARLEN_IS,
                            ARSIZE_IS,
                            ARBURST_IS,
                            ARLOCK_IS,
                            ARCACHE_IS,
                            ARPROT_IS,
                            ARVALID_IS,
                            
                            MST_RDGNT_NUM,
                            rd_rdcntr,    
                            rd_wdcntr,
                            rd_wen_flag,
                            rd_ren_flag,
                            SLAVE_SELECT_RADDRCH_M,
                            SLAVE_NUMBER
                            
                            ,wr_lock_high 
                            ,rd_lock_high 
                            ,wr_normal_high 
                            ,rd_normal_high 
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

   localparam COMB_REG       = {SC_0, SC_1, SC_2, SC_3, SC_4, SC_5, SC_6, SC_7, SC_8, SC_9, SC_10, SC_11, SC_12, SC_13, SC_14, SC_15};
   localparam SINGLE_MASTER  = (NUM_MASTER_SLOT == 1) ? 1 : 0;

   // --------------------------------------------------------------------------
   // I/O Declaration
   // --------------------------------------------------------------------------
   // Global signals
   input       ACLK;
   input       ARESETN;
   // AXI MASTER write address channel signals
   input       ARREADY_SI;
   input       RVALID_SI;
   input       RLAST_SI;
   input       RREADY_IS;
   
   input [31:0]        ARADDR_M0;
   input [1:0]                   ARLOCK_M0;
   input                         ARVALID_M0;
   input [31:0]        ARADDR_M1;
   input [1:0]                   ARLOCK_M1;
   input                         ARVALID_M1;
   input [31:0]        ARADDR_M2;
   input [1:0]                   ARLOCK_M2;
   input                         ARVALID_M2;
   input [31:0]        ARADDR_M3;
   input [1:0]                   ARLOCK_M3;
   input                         ARVALID_M3;

    // For Arbiter from Masters
    // To end grant to current master
    input                   m0_rd_end;
    input                   m1_rd_end;
    input                   m2_rd_end;
    input                   m3_rd_end;

   // From Master 0
   // AXI write address channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_MI0;
   input [31:0]        ARADDR_MI0;
   input [3:0]                   ARLEN_MI0;
   input [2:0]                   ARSIZE_MI0;
   input [1:0]                   ARBURST_MI0;
   input [1:0]                   ARLOCK_MI0;
   input [3:0]                   ARCACHE_MI0;
   input [2:0]                   ARPROT_MI0;
   input                         ARVALID_MI0;
   output                        ARREADY_IM0;

   // From Master 1
   // AXI write address channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_MI1;
   input [31:0]        ARADDR_MI1;
   input [3:0]                   ARLEN_MI1;
   input [2:0]                   ARSIZE_MI1;
   input [1:0]                   ARBURST_MI1;
   input [1:0]                   ARLOCK_MI1;
   input [3:0]                   ARCACHE_MI1;
   input [2:0]                   ARPROT_MI1;
   input                         ARVALID_MI1;
   output                        ARREADY_IM1;

   // From Master 2
   // AXI write address channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_MI2;
   input [31:0]        ARADDR_MI2;
   input [3:0]                   ARLEN_MI2;
   input [2:0]                   ARSIZE_MI2;
   input [1:0]                   ARBURST_MI2;
   input [1:0]                   ARLOCK_MI2;
   input [3:0]                   ARCACHE_MI2;
   input [2:0]                   ARPROT_MI2;
   input                         ARVALID_MI2;
   output                        ARREADY_IM2;

   // From Master 3
   // AXI write address channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_MI3;
   input [31:0]        ARADDR_MI3;
   input [3:0]                   ARLEN_MI3;
   input [2:0]                   ARSIZE_MI3;
   input [1:0]                   ARBURST_MI3;
   input [1:0]                   ARLOCK_MI3;
   input [3:0]                   ARCACHE_MI3;
   input [2:0]                   ARPROT_MI3;
   input                         ARVALID_MI3;
   output                        ARREADY_IM3;
   
   // SLAVE 0
   // AXI SLAVE 0 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS;
   output [31:0]      ARADDR_IS;
   output [3:0]                 ARLEN_IS;
   output [2:0]                 ARSIZE_IS;
   output [1:0]                 ARBURST_IS;
   output [1:0]                 ARLOCK_IS;
   output [3:0]                 ARCACHE_IS;
   output [2:0]                 ARPROT_IS;
   output                       ARVALID_IS;
   output [31:0]      ARADDR_IS_int;

   output [16:0]                 SLAVE_SELECT_RADDRCH_M;
   input [4:0]                   SLAVE_NUMBER;                         
   output [3:0]                  MST_RDGNT_NUM; 
   output [3:0]                  rd_rdcntr;
   output [3:0]                  rd_wdcntr;     
   output                        rd_wen_flag;
   output                        rd_ren_flag;

   input                         wr_lock_high; 
   output                        rd_lock_high;  
   input                         wr_normal_high; 
   output                        rd_normal_high; 
   input                         mst_rd_inprog0;  
   input                         mst_rd_inprog1;  
   input                         mst_rd_inprog2;  
   input                         mst_rd_inprog3;  
   input                         mst_wr_inprog0;                                 
   input                         mst_wr_inprog1;                                 
   input                         mst_wr_inprog2;                                 
   input                         mst_wr_inprog3;                                 

   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------
   reg [16:0]                    SLAVE_SELECT_RADDRCH_M;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS;
   reg [31:0]               ARADDR_IS;
   reg [3:0]                          ARLEN_IS;
   reg [2:0]                          ARSIZE_IS;
   reg [1:0]                          ARBURST_IS;
   reg [1:0]                          ARLOCK_IS;
   reg [3:0]                          ARCACHE_IS;
   reg [2:0]                          ARPROT_IS;
   reg                                ARVALID_IS;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] ARID_IS_int;
   reg [31:0]               ARADDR_IS_int;
   reg [3:0]                          ARLEN_IS_int;
   reg [2:0]                          ARSIZE_IS_int;
   reg [1:0]                          ARBURST_IS_int;
   reg [1:0]                          ARLOCK_IS_int;
   reg [3:0]                          ARCACHE_IS_int;
   reg [2:0]                          ARPROT_IS_int;
   reg                                ARVALID_IS_int;

   reg [16:0]                         SLAVE_SELECT_RADDRCH_M_int;

   reg [16:0]                         SLAVE_SELECT_RADDRCH_M_r;


   // For Arbiter from Masters
   wire                               ARREADY_SI_int;
   reg [3:0]                          wr_rdcntr;
   reg [3:0]                          wr_wdcntr;
   reg [3:0]                          MST_RDGNT_NUM; 

   wire                               wr_wen_flag;
   wire                               wr_ren_flag;

   reg                                ARREADY_IM0;
   reg                                ARREADY_IM1;
   reg                                ARREADY_IM2;
   reg                                ARREADY_IM3;

   reg                                ARREADY_IM0_int;
   reg                                ARREADY_IM1_int;
   reg                                ARREADY_IM2_int;
   reg                                ARREADY_IM3_int;

   wire [3:0]                         AR_REQ_MI;

   reg [16:0]                         SLAVE_SELECT_READ_M0;
   reg [16:0]                         SLAVE_SELECT_READ_M1;
   reg [16:0]                         SLAVE_SELECT_READ_M2;
   reg [16:0]                         SLAVE_SELECT_READ_M3;

   reg                                mst0_rd_end;
   reg [RD_ACCEPTANCE - 1: 0]         mst0_outstd_rdcntr;
   reg                                mst0_rd_end_d1;

   reg                                mst1_rd_end;
   reg [RD_ACCEPTANCE - 1: 0]         mst1_outstd_rdcntr;
   reg                                mst1_rd_end_d1;

   reg                                mst2_rd_end;
   reg [RD_ACCEPTANCE - 1: 0]         mst2_outstd_rdcntr;
   reg                                mst2_rd_end_d1;

   reg                                mst3_rd_end;
   reg [RD_ACCEPTANCE - 1: 0]         mst3_outstd_rdcntr;
   reg                                mst3_rd_end_d1;

   reg [3:0]                          rd_rdcntr;
   reg [3:0]                          rd_wdcntr;     
   reg                                rd_wen_flag;
   reg                                rd_ren_flag;
   
   wire [3:0]                         AR_MASGNT_IC;

   reg                                AR_REQ_MI0;
   reg                                AR_REQ_MI1;
   reg                                AR_REQ_MI2;
   reg                                AR_REQ_MI3;
   
   wire                               aresetn;
   wire                               sresetn;

   /////////////////////////////////////////////////////////////////////////////
   //                               Start - of - Code                         //
   /////////////////////////////////////////////////////////////////////////////

   // --------------------------------------------------------------------------
   // resets
   // --------------------------------------------------------------------------
   assign aresetn   = (SYNC_RESET == 1) ? 1'b1  : ARESETN;
   assign sresetn   = (SYNC_RESET == 1) ? ARESETN : 1'b1;

   // --------------------------------------------------------------------------
   // rd_wdcntr: Counter to count the number of outstanding reads pending.
   // It increments on read address valid and read address ready. It resets on
   // reaching the limit.
   // --------------------------------------------------------------------------
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         rd_wdcntr <= 4'h0;
         rd_wen_flag <= 1'b0;
      end
      else begin
         if (rd_rdcntr == 4'hF) begin
            rd_wdcntr <= 4'h0;
            rd_wen_flag <= 1'b0;
         end
         else if (ARVALID_IS == 1'b1 && ARREADY_SI_int == 1'b1) begin
            rd_wdcntr <= rd_wdcntr + 1'b1;
            rd_wen_flag <= 1'b1;
         end
      end
   end

   // --------------------------------------------------------------------------
   // rd_rdcntr: Counter to count the number of completed reads.
   // It increments on valid read data received. It resets on
   // reaching the limit.
   // --------------------------------------------------------------------------
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         rd_rdcntr <= 4'h0;
         rd_ren_flag <= 1'b0;
      end
      else begin
         if (rd_rdcntr == 4'hF) begin
            rd_rdcntr <= 4'h0;
            rd_ren_flag  <= 1'b0;
         end
         else if (RLAST_SI == 1'b1 && RVALID_SI == 1'b1 && RREADY_IS == 1'b1) begin
            rd_rdcntr <= rd_rdcntr + 1'b1;
            rd_ren_flag <= 1'b1;
         end
      end
   end

   // --------------------------------------------------------------------------
   // Pass the ARDEADY_SI coming from the respective selected slave.
   // When the look-up is filled to limit of 16, the AWREADY going towards the
   // granted master is pulled low. This disallows anymore transactions to be
   // received in to the DUT.
   // --------------------------------------------------------------------------
   assign ARREADY_SI_int = ((rd_wdcntr - rd_rdcntr) == 4'h1) ? 1'b0 : ARREADY_SI;

   // --------------------------------------------------------------------------
   // Select the Master signals based the grant provided by the arbiter
   // Register the read address control signals passing to the slave interface.
   // The signals are passed only if it is meant for the intended slave. Otherwise
   // it gets blocked. This is done by checking the slave number with the received
   // read address.
   // --------------------------------------------------------------------------
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
  	     ARADDR_IS   <= 'h0;
		 ARID_IS     <= 'h0;
         ARLEN_IS    <= 'h0;
         ARSIZE_IS   <= 'h0;
         ARBURST_IS  <= 'h0;
         ARLOCK_IS   <= 'h0;
         ARCACHE_IS  <= 'h0;
         ARPROT_IS   <= 'h0;
         ARVALID_IS  <= 'h0; 

         ARREADY_IM0 <= 1'b0;
         ARREADY_IM1 <= 1'b0;
         ARREADY_IM2 <= 1'b0;
         ARREADY_IM3 <= 1'b0;
      end
      else begin

         ARREADY_IM0 <= ARREADY_IM0_int;
         ARREADY_IM1 <= ARREADY_IM1_int;
         ARREADY_IM2 <= ARREADY_IM2_int;
         ARREADY_IM3 <= ARREADY_IM3_int;
            
         if(SLAVE_NUMBER == ARADDR_IS_int[AXI_AWIDTH - 1 : AXI_AWIDTH - 4]  || SLAVE_NUMBER[4] == 1'b1) begin
  	        ARADDR_IS   <= ARADDR_IS_int;
		    ARID_IS     <= ARID_IS_int;
            ARLEN_IS    <= ARLEN_IS_int;
            ARSIZE_IS   <= ARSIZE_IS_int;
            ARBURST_IS  <= ARBURST_IS_int;
            ARLOCK_IS   <= ARLOCK_IS_int;
            ARCACHE_IS  <= ARCACHE_IS_int;
            ARPROT_IS   <= ARPROT_IS_int;
            ARVALID_IS  <= ARVALID_IS_int;

         end
         else begin
  	        ARADDR_IS   <= ARADDR_IS;
		    ARID_IS     <= 'h0;
            ARLEN_IS    <= 'h0;
            ARSIZE_IS   <= 'h0;
            ARBURST_IS  <= 'h0;
            ARLOCK_IS   <= 'h0;
            ARCACHE_IS  <= 'h0;
            ARPROT_IS   <= 'h0;
            ARVALID_IS  <= 'h0; 

         end
      end
   end
   
   generate 
      if(NUM_MASTER_SLOT == 1) begin
         always @(*) begin
	        case(AR_MASGNT_IC)
              4'b0001 : begin 
                 ARREADY_IM0_int <= ARREADY_SI;
    		  end
              default : begin 
                 ARREADY_IM0_int <= 1'b0;
    	      end
            endcase // case (AR_MASGNT_IC)       
         end // always @ (*)      


         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
	    	     ARADDR_IS_int   <= 'h0;
		         ARID_IS_int     <= 'h0;
                 ARLEN_IS_int    <= 'h0;
                 ARSIZE_IS_int   <= 'h0;
                 ARBURST_IS_int  <= 'h0;
                 ARLOCK_IS_int   <= 'h0;
                 ARCACHE_IS_int  <= 'h0;
                 ARPROT_IS_int   <= 'h0;
                 ARVALID_IS_int  <= 'h0;    
                 
	    	     MST_RDGNT_NUM <= 4'b0000;
            end
            else begin

	        case(AR_MASGNT_IC)
              4'b0001 : begin 
	    	     ARADDR_IS_int   <= ARADDR_MI0;
		         ARID_IS_int     <= ARID_MI0;
                 ARLEN_IS_int    <= ARLEN_MI0;
                 ARSIZE_IS_int   <= ARSIZE_MI0;
                 ARBURST_IS_int  <= ARBURST_MI0;
                 ARLOCK_IS_int   <= ARLOCK_MI0;
                 ARCACHE_IS_int  <= ARCACHE_MI0;
                 ARPROT_IS_int   <= ARPROT_MI0;
                 ARVALID_IS_int  <= ARVALID_MI0;    

	    	     MST_RDGNT_NUM <= 4'b0001;
    		  end
              default : begin 
		         ARID_IS_int     <= 'h0;
                 ARLEN_IS_int    <= 'h0;
                 ARSIZE_IS_int   <= 'h0;
                 ARBURST_IS_int  <= 'h0;
                 ARLOCK_IS_int   <= 'h0;
                 ARCACHE_IS_int  <= 'h0;
                 ARPROT_IS_int   <= 'h0;
                 ARVALID_IS_int  <= 'h0;    
                 
	    	     MST_RDGNT_NUM <= 4'b0000;
    	      end
            endcase // case (AR_MASGNT_IC)       
            end
         end // always @ (*)      
      end // if (NUM_MASTER_SLOT == 1)      
   endgenerate

   generate 
      if(NUM_MASTER_SLOT == 2) begin
         always @(*) begin
	        case(AR_MASGNT_IC)
              4'b0001 : begin 
                 ARREADY_IM0_int <= ARREADY_SI;
                 ARREADY_IM1_int <= 1'b0;
    		  end
              4'b0010 : begin 
                 ARREADY_IM1_int <= ARREADY_SI;
                 ARREADY_IM0_int <= 1'b0;                 
    	      end
              default : begin 
                 ARREADY_IM0_int <= 1'b0;
                 ARREADY_IM1_int <= 1'b0;
    	      end
            endcase // case (AR_MASGNT_IC)       
         end // always @ (*)      



         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
	    	     ARADDR_IS_int   <= 'h0;
		         ARID_IS_int     <= 'h0;
                 ARLEN_IS_int    <= 'h0;
                 ARSIZE_IS_int   <= 'h0;
                 ARBURST_IS_int  <= 'h0;
                 ARLOCK_IS_int   <= 'h0;
                 ARCACHE_IS_int  <= 'h0;
                 ARPROT_IS_int   <= 'h0;
                 ARVALID_IS_int  <= 'h0;    
                 
	    	     MST_RDGNT_NUM <= 4'b0000;
            end
            else begin

	        case(AR_MASGNT_IC)
              4'b0001 : begin 
	    	     ARADDR_IS_int   <= ARADDR_MI0;
		         ARID_IS_int     <= ARID_MI0;
                 ARLEN_IS_int    <= ARLEN_MI0;
                 ARSIZE_IS_int   <= ARSIZE_MI0;
                 ARBURST_IS_int  <= ARBURST_MI0;
                 ARLOCK_IS_int   <= ARLOCK_MI0;
                 ARCACHE_IS_int  <= ARCACHE_MI0;
                 ARPROT_IS_int   <= ARPROT_MI0;
                 ARVALID_IS_int  <= ARVALID_MI0;    

	    	     MST_RDGNT_NUM <= 4'b0001;
    		  end
              4'b0010 : begin 
	    	     ARADDR_IS_int   <= ARADDR_MI1;
		         ARID_IS_int     <= ARID_MI1;
                 ARLEN_IS_int    <= ARLEN_MI1;
                 ARSIZE_IS_int   <= ARSIZE_MI1;
                 ARBURST_IS_int  <= ARBURST_MI1;
                 ARLOCK_IS_int   <= ARLOCK_MI1;
                 ARCACHE_IS_int  <= ARCACHE_MI1;
                 ARPROT_IS_int   <= ARPROT_MI1;
                 ARVALID_IS_int  <= ARVALID_MI1;    
                 
	    	     MST_RDGNT_NUM <= 4'b0010;
    	      end
              default : begin 
		         ARID_IS_int     <= 'h0;
                 ARLEN_IS_int    <= 'h0;
                 ARSIZE_IS_int   <= 'h0;
                 ARBURST_IS_int  <= 'h0;
                 ARLOCK_IS_int   <= 'h0;
                 ARCACHE_IS_int  <= 'h0;
                 ARPROT_IS_int   <= 'h0;
                 ARVALID_IS_int  <= 'h0;    
                 
	    	     MST_RDGNT_NUM <= 4'b0000;
    	      end
            endcase // case (AR_MASGNT_IC)       
            end
         end // always @ (*)      
      end // if (NUM_MASTER_SLOT == 2)      
   endgenerate
   
   generate 
      if(NUM_MASTER_SLOT == 3) begin
         always @(*) begin
	        case(AR_MASGNT_IC)
              4'b0001 : begin 
                 ARREADY_IM0_int <= ARREADY_SI;
                 ARREADY_IM1_int <= 1'b0;
                 ARREADY_IM2_int <= 1'b0;
    		  end
              4'b0010 : begin 
                 ARREADY_IM1_int <= ARREADY_SI;
                 ARREADY_IM0_int <= 1'b0;
                 ARREADY_IM2_int <= 1'b0;
    		  end
              4'b0100 : begin 
                 ARREADY_IM2_int <= ARREADY_SI;
                 ARREADY_IM0_int <= 1'b0;
                 ARREADY_IM1_int <= 1'b0;
    		  end
              default : begin 
                 ARREADY_IM0_int <= 1'b0;
                 ARREADY_IM1_int <= 1'b0;
                 ARREADY_IM2_int <= 1'b0;
    		  end
            endcase // case (AR_MASGNT_IC)       
         end // always @ (*)      


         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
	    	     ARADDR_IS_int   <= 'h0;
		         ARID_IS_int     <= 'h0;
                 ARLEN_IS_int    <= 'h0;
                 ARSIZE_IS_int   <= 'h0;
                 ARBURST_IS_int  <= 'h0;
                 ARLOCK_IS_int   <= 'h0;
                 ARCACHE_IS_int  <= 'h0;
                 ARPROT_IS_int   <= 'h0;
                 ARVALID_IS_int  <= 'h0;    
                 
	    	     MST_RDGNT_NUM <= 4'b0000;
            end
            else begin
	        case(AR_MASGNT_IC)
              4'b0001 : begin 
	    	     ARADDR_IS_int   <= ARADDR_MI0;
		         ARID_IS_int     <= ARID_MI0;
                 ARLEN_IS_int    <= ARLEN_MI0;
                 ARSIZE_IS_int   <= ARSIZE_MI0;
                 ARBURST_IS_int  <= ARBURST_MI0;
                 ARLOCK_IS_int   <= ARLOCK_MI0;
                 ARCACHE_IS_int  <= ARCACHE_MI0;
                 ARPROT_IS_int   <= ARPROT_MI0;
                 ARVALID_IS_int  <= ARVALID_MI0;    

	    	     MST_RDGNT_NUM <= 4'b0001;
    		  end
              4'b0010 : begin 
	    		 ARADDR_IS_int   <= ARADDR_MI1;
		         ARID_IS_int     <= ARID_MI1;
                 ARLEN_IS_int    <= ARLEN_MI1;
                 ARSIZE_IS_int   <= ARSIZE_MI1;
                 ARBURST_IS_int  <= ARBURST_MI1;
                 ARLOCK_IS_int   <= ARLOCK_MI1;
                 ARCACHE_IS_int  <= ARCACHE_MI1;
                 ARPROT_IS_int   <= ARPROT_MI1;
                 ARVALID_IS_int  <= ARVALID_MI1;    

	    	     MST_RDGNT_NUM <= 4'b0010;
    		  end
              4'b0100 : begin 
	             ARADDR_IS_int   <= ARADDR_MI2;
		         ARID_IS_int     <= ARID_MI2;
                 ARLEN_IS_int    <= ARLEN_MI2;
                 ARSIZE_IS_int   <= ARSIZE_MI2;
                 ARBURST_IS_int  <= ARBURST_MI2;
                 ARLOCK_IS_int   <= ARLOCK_MI2;
                 ARCACHE_IS_int  <= ARCACHE_MI2;
                 ARPROT_IS_int   <= ARPROT_MI2;
                 ARVALID_IS_int  <= ARVALID_MI2;    

	    	     MST_RDGNT_NUM <= 4'b0100;
    		  end
              default : begin 
		         ARID_IS_int     <= 'h0;
                 ARLEN_IS_int    <= 'h0;
                 ARSIZE_IS_int   <= 'h0;
                 ARBURST_IS_int  <= 'h0;
                 ARLOCK_IS_int   <= 'h0;
                 ARCACHE_IS_int  <= 'h0;
                 ARPROT_IS_int   <= 'h0;
                 ARVALID_IS_int  <= 'h0;    

	    	     MST_RDGNT_NUM <= 4'b0000;
    		  end
            endcase // case (AR_MASGNT_IC)       
            end
         end // always @ (*)      
      end // if (NUM_MASTER_SLOT == 3)
   endgenerate

   generate 
      if(NUM_MASTER_SLOT == 4) begin
         always @(*) begin
	        case (AR_MASGNT_IC)
              4'b0001 : begin
                 ARREADY_IM0_int <= ARREADY_SI;
                 ARREADY_IM1_int <= 1'b0;
                 ARREADY_IM2_int <= 1'b0;
                 ARREADY_IM3_int <= 1'b0;
    		  end
              4'b0010 : begin 
                 ARREADY_IM0_int <= 1'b0;
                 ARREADY_IM1_int <= ARREADY_SI;
                 ARREADY_IM2_int <= 1'b0;
                 ARREADY_IM3_int <= 1'b0;
    		  end
              4'b0100 : begin 
                 ARREADY_IM0_int <= 1'b0;
                 ARREADY_IM1_int <= 1'b0;
                 ARREADY_IM2_int <= ARREADY_SI;
                 ARREADY_IM3_int <= 1'b0;
    		  end
              4'b1000 : begin 
                 ARREADY_IM0_int <= 1'b0;
                 ARREADY_IM1_int <= 1'b0;
                 ARREADY_IM2_int <= 1'b0;
                 ARREADY_IM3_int <= ARREADY_SI;
    		  end
              default : begin 
                 ARREADY_IM0_int <= 1'b0;
                 ARREADY_IM1_int <= 1'b0;
                 ARREADY_IM2_int <= 1'b0;
                 ARREADY_IM3_int <= 1'b0;
    		  end
            endcase // case (AR_MASGNT_IC)       
         end // always @ (*)      

         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
	    	     ARADDR_IS_int   <= 'h0;
		         ARID_IS_int     <= 'h0;
                 ARLEN_IS_int    <= 'h0;
                 ARSIZE_IS_int   <= 'h0;
                 ARBURST_IS_int  <= 'h0;
                 ARLOCK_IS_int   <= 'h0;
                 ARCACHE_IS_int  <= 'h0;
                 ARPROT_IS_int   <= 'h0;
                 ARVALID_IS_int  <= 'h0;    
                 
	    	     MST_RDGNT_NUM <= 4'b0000;
            end
            else begin

	        case (AR_MASGNT_IC)
              4'b0001 : begin
                 
	    		 ARADDR_IS_int   <= ARADDR_MI0;
		         ARID_IS_int     <= ARID_MI0;
                 ARLEN_IS_int    <= ARLEN_MI0;
                 ARSIZE_IS_int   <= ARSIZE_MI0;
                 ARBURST_IS_int  <= ARBURST_MI0;
                 ARLOCK_IS_int   <= ARLOCK_MI0;
                 ARCACHE_IS_int  <= ARCACHE_MI0;
                 ARPROT_IS_int   <= ARPROT_MI0;
                 ARVALID_IS_int  <= ARVALID_MI0;    

	    	     MST_RDGNT_NUM <= 4'b0001;
    		  end
              4'b0010 : begin 
        	     ARADDR_IS_int   <= ARADDR_MI1;
		         ARID_IS_int     <= ARID_MI1;
                 ARLEN_IS_int    <= ARLEN_MI1;
                 ARSIZE_IS_int   <= ARSIZE_MI1;
                 ARBURST_IS_int  <= ARBURST_MI1;
                 ARLOCK_IS_int   <= ARLOCK_MI1;
                 ARCACHE_IS_int  <= ARCACHE_MI1;
                 ARPROT_IS_int   <= ARPROT_MI1;
                 ARVALID_IS_int  <= ARVALID_MI1;    

	    	     MST_RDGNT_NUM <= 4'b0010;
    		  end
              4'b0100 : begin 
	    	     ARADDR_IS_int   <= ARADDR_MI2;
         		 ARID_IS_int     <= ARID_MI2;
                 ARLEN_IS_int    <= ARLEN_MI2;
                 ARSIZE_IS_int   <= ARSIZE_MI2;
                 ARBURST_IS_int  <= ARBURST_MI2;
                 ARLOCK_IS_int   <= ARLOCK_MI2;
                 ARCACHE_IS_int  <= ARCACHE_MI2;
                 ARPROT_IS_int   <= ARPROT_MI2;
                 ARVALID_IS_int  <= ARVALID_MI2;    

	    	     MST_RDGNT_NUM <= 4'b0100;
    		  end
              4'b1000 : begin 
        	     ARADDR_IS_int   <= ARADDR_MI3;
		         ARID_IS_int     <= ARID_MI3;
                 ARLEN_IS_int    <= ARLEN_MI3;
                 ARSIZE_IS_int   <= ARSIZE_MI3;
                 ARBURST_IS_int  <= ARBURST_MI3;
                 ARLOCK_IS_int   <= ARLOCK_MI3;
                 ARCACHE_IS_int  <= ARCACHE_MI3;
                 ARPROT_IS_int   <= ARPROT_MI3;
                 ARVALID_IS_int  <= ARVALID_MI3;    

	    	     MST_RDGNT_NUM <= 4'b1000;
    		  end
              default : begin 
		         ARID_IS_int     <= 'h0;
                 ARLEN_IS_int    <= 'h0;
                 ARSIZE_IS_int   <= 'h0;
                 ARBURST_IS_int  <= 'h0;
                 ARLOCK_IS_int   <= 'h0;
                 ARCACHE_IS_int  <= 'h0;
                 ARPROT_IS_int   <= 'h0;
                 ARVALID_IS_int  <= 'h0;    

 	    	     MST_RDGNT_NUM <= 4'b0000;
    		  end
            endcase // case (AR_MASGNT_IC)       
            end
         end // always @ (*)      
      end // if (NUM_MASTER_SLOT == 4)
   endgenerate


   // --------------------------------------------------------------------------
   // Select Slave slot for Write
   // --------------------------------------------------------------------------
         always @ (*) begin
      case ({ARVALID_M0,ARADDR_M0[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
        5'h10 : begin
           if((MEMSPACE > 0) && (SC_0 == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_0;
           end
           else if(((MEMSPACE > 0) && (SC_0 == 1)) || (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M0 = SLAVE_0;
           end
        end // case: 5'h10
        
        5'h11 : begin 
           if((MEMSPACE > 01) && (SC_1 == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_1;
           end
           else if(((MEMSPACE > 0) && (SC_1 == 1)) || (MEMSPACE == 0 && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M0 = SLAVE_1;
           end
        end // case: 5'h11
        
        5'h12 : begin
           if((MEMSPACE > 0) && (SC_2 == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_2;
           end
           else if(((MEMSPACE > 0) && (SC_2 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M0 = SLAVE_2;
           end
        end      

        5'h13 : begin
           if((MEMSPACE > 0) && (SC_3 == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_3;
           end
           else if(((MEMSPACE > 0) && (SC_3 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M0 = SLAVE_3;
           end
        end

        5'h14 : begin
           if((MEMSPACE > 0) && (SC_4 == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_4;
           end
           else if(((MEMSPACE > 0) && (SC_4 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M0 = SLAVE_4;
           end
        end

        5'h15 : begin
           if((MEMSPACE > 0) && (SC_5 == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_5;
           end
           else if(((MEMSPACE > 0) && (SC_5 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M0 = SLAVE_5;
           end
        end

        5'h16 : begin
           if((MEMSPACE > 0) && (SC_6 == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_6;
           end
           else if(((MEMSPACE > 0) && (SC_6 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M0 = SLAVE_6;
           end
        end

        5'h17 : begin
           if((MEMSPACE > 0) && (SC_7 == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_7;
           end
           else if(((MEMSPACE > 0) && (SC_7 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M0 = SLAVE_7;
           end
        end

        5'h18 : begin
           if((MEMSPACE > 0) && (SC_8 == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_8;
           end
           else if(((MEMSPACE > 0) && (SC_8 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M0 = SLAVE_8;
           end
        end

        5'h19 : begin
           if((MEMSPACE > 0) && (SC_9 == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_9;
           end
           else if(((MEMSPACE > 0) && (SC_9 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M0 = SLAVE_9;
           end
        end

        5'h1A : begin
           if((MEMSPACE > 0) && (SC_10 == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_A;
           end
           else if(((MEMSPACE > 0) && (SC_10 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M0 = SLAVE_A;
           end
        end

        5'h1B : begin
           if((MEMSPACE > 0) && (SC_11 == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_B;
           end
           else if(((MEMSPACE > 0) && (SC_11 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M0 = SLAVE_B;
           end
        end

        5'h1C : begin
           if((MEMSPACE > 0) && (SC_12 == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_C;
           end
           else if(((MEMSPACE > 0) && (SC_12 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M0 = SLAVE_C;
           end
        end

        5'h1D : begin
           if((MEMSPACE > 0) && (SC_13 == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_D;
           end
           else if(((MEMSPACE > 0) && (SC_13 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M0 = SLAVE_D;
           end
        end

        5'h1E : begin
           if((MEMSPACE > 0) && (SC_14 == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_E;
           end
           else if(((MEMSPACE > 0) && (SC_14 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M0 = SLAVE_E;
           end
        end

        5'h1F : begin
           if((MEMSPACE > 0) && (SC_15 == 0)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_F;
           end
           else if(((MEMSPACE > 0) && (SC_15 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M0 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M0 = SLAVE_F;
           end
        end

        default : begin SLAVE_SELECT_READ_M0 = 17'h00000; end
      endcase // case ({ARVALID_MI0,ARADDR_MI0[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
   end // always @ (*)

   // --------------------------------------------------------------------------
   // Select Slave slot for Write
   // --------------------------------------------------------------------------
   always @ (*) begin
      case ({ARVALID_M1,ARADDR_M1[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
        5'h10 : begin
           if((MEMSPACE > 0) && (SC_0 == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_0;
           end
           else if(((MEMSPACE > 0) && (SC_0 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M1 = SLAVE_0;
           end
        end // case: 5'h10
        
        5'h11 : begin 
           if((MEMSPACE > 0) && (SC_1 == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_1;
           end
           else if(((MEMSPACE > 0) && (SC_1 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M1 = SLAVE_1;
           end
        end // case: 5'h11
        
        5'h12 : begin
           if((MEMSPACE > 0) && (SC_2 == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_2;
           end
           else if(((MEMSPACE > 0) && (SC_2 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M1 = SLAVE_2;
           end
        end      

        5'h13 : begin
           if((MEMSPACE > 0) && (SC_3 == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_3;
           end
           else if(((MEMSPACE > 0) && (SC_3 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M1 = SLAVE_3;
           end
        end

        5'h14 : begin
           if((MEMSPACE > 0) && (SC_4 == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_4;
           end
           else if(((MEMSPACE > 0) && (SC_4 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M1 = SLAVE_4;
           end
        end

        5'h15 : begin
           if((MEMSPACE > 0) && (SC_5 == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_5;
           end
           else if(((MEMSPACE > 0) && (SC_5 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M1 = SLAVE_5;
           end
        end

        5'h16 : begin
           if((MEMSPACE > 0) && (SC_6 == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_6;
           end
           else if(((MEMSPACE > 0) && (SC_6 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M1 = SLAVE_6;
           end
        end

        5'h17 : begin
           if((MEMSPACE > 0) && (SC_7 == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_7;
           end
           else if(((MEMSPACE > 0) && (SC_7 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M1 = SLAVE_7;
           end
        end

        5'h18 : begin
           if((MEMSPACE > 0) && (SC_8 == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_8;
           end
           else if(((MEMSPACE > 0) && (SC_8 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M1 = SLAVE_8;
           end
        end

        5'h19 : begin
           if((MEMSPACE > 0) && (SC_9 == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_9;
           end
           else if(((MEMSPACE > 0) && (SC_9 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M1 = SLAVE_9;
           end
        end

        5'h1A : begin
           if((MEMSPACE > 0) && (SC_10 == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_A;
           end
           else if(((MEMSPACE > 0) && (SC_10 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M1 = SLAVE_A;
           end
        end

        5'h1B : begin
           if((MEMSPACE > 0) && (SC_11 == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_B;
           end
           else if(((MEMSPACE > 0) && (SC_11 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M1 = SLAVE_B;
           end
        end

        5'h1C : begin
           if((MEMSPACE > 0) && (SC_12 == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_C;
           end
           else if(((MEMSPACE > 0) && (SC_12 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M1 = SLAVE_C;
           end
        end

        5'h1D : begin
           if((MEMSPACE > 0) && (SC_13 == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_D;
           end
           else if(((MEMSPACE > 0) && (SC_13 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M1 = SLAVE_D;
           end
        end

        5'h1E : begin
           if((MEMSPACE > 0) && (SC_14 == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_E;
           end
           else if(((MEMSPACE > 0) && (SC_14 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M1 = SLAVE_E;
           end
        end

        5'h1F : begin
           if((MEMSPACE > 0) && (SC_15 == 0)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_F;
           end
           else if(((MEMSPACE > 0) && (SC_15 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M1 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M1 = SLAVE_F;
           end
        end

        default : begin SLAVE_SELECT_READ_M1 = 17'h00000; end
      endcase // case ({AWVALID_MI1,ARADDR_MI1[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
   end // always @ (*)


   // --------------------------------------------------------------------------
   // Select Slave slot for Write
   // --------------------------------------------------------------------------
   always @ (*) begin
      case ({ARVALID_M2,ARADDR_M2[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
        5'h10 : begin
           if((MEMSPACE > 0) && (SC_0 == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_0;
           end
           else if(((MEMSPACE > 0) && (SC_0 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M2 = SLAVE_0;
           end
        end // case: 5'h10
        
        5'h11 : begin 
           if((MEMSPACE > 0) && (SC_1 == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_1;
           end
           else if(((MEMSPACE > 0) && (SC_1 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M2 = SLAVE_1;
           end
        end // case: 5'h11
        
        5'h12 : begin
           if((MEMSPACE > 0) && (SC_2 == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_2;
           end
           else if(((MEMSPACE > 0) && (SC_2 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M2 = SLAVE_2;
           end
        end      

        5'h13 : begin
           if((MEMSPACE > 0) && (SC_3 == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_3;
           end
           else if(((MEMSPACE > 0) && (SC_3 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M2 = SLAVE_3;
           end
        end

        5'h14 : begin
           if((MEMSPACE > 0) && (SC_4 == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_4;
           end
           else if(((MEMSPACE > 0) && (SC_4 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M2 = SLAVE_4;
           end
        end

        5'h15 : begin
           if((MEMSPACE > 0) && (SC_5 == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_5;
           end
           else if(((MEMSPACE > 0) && (SC_5 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M2 = SLAVE_5;
           end
        end

        5'h16 : begin
           if((MEMSPACE > 0) && (SC_6 == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_6;
           end
           else if(((MEMSPACE > 0) && (SC_6 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M2 = SLAVE_6;
           end
        end

        5'h17 : begin
           if((MEMSPACE > 0) && (SC_7 == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_7;
           end
           else if(((MEMSPACE > 0) && (SC_7 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M2 = SLAVE_7;
           end
        end

        5'h18 : begin
           if((MEMSPACE > 0) && (SC_8 == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_8;
           end
           else if(((MEMSPACE > 0) && (SC_8 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M2 = SLAVE_8;
           end
        end

        5'h19 : begin
           if((MEMSPACE > 0) && (SC_9 == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_9;
           end
           else if(((MEMSPACE > 0) && (SC_9 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M2 = SLAVE_9;
           end
        end

        5'h1A : begin
           if((MEMSPACE > 0) && (SC_10 == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_A;
           end
           else if(((MEMSPACE > 0) && (SC_10 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M2 = SLAVE_A;
           end
        end

        5'h1B : begin
           if((MEMSPACE > 0) && (SC_11 == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_B;
           end
           else if(((MEMSPACE > 0) && (SC_11 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M2 = SLAVE_B;
           end
        end

        5'h1C : begin
           if((MEMSPACE > 0) && (SC_12 == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_C;
           end
           else if(((MEMSPACE > 0) && (SC_12 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M2 = SLAVE_C;
           end
        end

        5'h1D : begin
           if((MEMSPACE > 0) && (SC_13 == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_D;
           end
           else if(((MEMSPACE > 0) && (SC_13 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M2 = SLAVE_D;
           end
        end

        5'h1E : begin
           if((MEMSPACE > 0) && (SC_14 == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_E;
           end
           else if(((MEMSPACE > 0) && (SC_14 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M2 = SLAVE_E;
           end
        end

        5'h1F : begin
           if((MEMSPACE > 0) && (SC_15 == 0)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_F;
           end
           else if(((MEMSPACE > 0) && (SC_15 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M2 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M2 = SLAVE_F;
           end
        end

        default : begin SLAVE_SELECT_READ_M2 = 17'h00000; end
      endcase // case ({ARVALID_MI2,ARADDR_MI2[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
   end // always @ (*)


   // --------------------------------------------------------------------------
   // Select Slave slot for Write
   // --------------------------------------------------------------------------
   always @ (*) begin
      case ({ARVALID_M3,ARADDR_M3[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
        5'h10 : begin
           if((MEMSPACE > 0) && (SC_0 == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_0;
           end
           else if(((MEMSPACE > 0) && (SC_0 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M3 = SLAVE_0;
           end
        end // case: 5'h10
        
        5'h11 : begin 
           if((MEMSPACE > 0) && (SC_1 == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_1;
           end
           else if(((MEMSPACE > 0) && (SC_1 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M3 = SLAVE_1;
           end
        end // case: 5'h11
        
        5'h12 : begin
           if((MEMSPACE > 0) && (SC_2 == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_2;
           end
           else if(((MEMSPACE > 0) && (SC_2 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M3 = SLAVE_2;
           end
        end      

        5'h13 : begin
           if((MEMSPACE > 0) && (SC_3 == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_3;
           end
           else if(((MEMSPACE > 0) && (SC_3 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M3 = SLAVE_3;
           end
        end

        5'h14 : begin
           if((MEMSPACE > 0) && (SC_4 == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_4;
           end
           else if(((MEMSPACE > 0) && (SC_4 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M3 = SLAVE_4;
           end
        end

        5'h15 : begin
           if((MEMSPACE > 0) && (SC_5 == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_5;
           end
           else if(((MEMSPACE > 0) && (SC_5 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M3 = SLAVE_5;
           end
        end

        5'h16 : begin
           if((MEMSPACE > 0) && (SC_6 == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_6;
           end
           else if(((MEMSPACE > 0) && (SC_6 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M3 = SLAVE_6;
           end
        end

        5'h17 : begin
           if((MEMSPACE > 0) && (SC_7 == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_7;
           end
           else if(((MEMSPACE > 0) && (SC_7 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M3 = SLAVE_7;
           end
        end

        5'h18 : begin
           if((MEMSPACE > 0) && (SC_8 == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_8;
           end
           else if(((MEMSPACE > 0) && (SC_8 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M3 = SLAVE_8;
           end
        end

        5'h19 : begin
           if((MEMSPACE > 0) && (SC_9 == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_9;
           end
           else if(((MEMSPACE > 0) && (SC_9 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M3 = SLAVE_9;
           end
        end

        5'h1A : begin
           if((MEMSPACE > 0) && (SC_10 == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_A;
           end
           else if(((MEMSPACE > 0) && (SC_10 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M3 = SLAVE_A;
           end
        end

        5'h1B : begin
           if((MEMSPACE > 0) && (SC_11 == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_B;
           end
           else if(((MEMSPACE > 0) && (SC_11 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M3 = SLAVE_B;
           end
        end

        5'h1C : begin
           if((MEMSPACE > 0) && (SC_12 == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_C;
           end
           else if(((MEMSPACE > 0) && (SC_12 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M3 = SLAVE_C;
           end
        end

        5'h1D : begin
           if((MEMSPACE > 0) && (SC_13 == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_D;
           end
           else if(((MEMSPACE > 0) && (SC_13 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M3 = SLAVE_D;
           end
        end

        5'h1E : begin
           if((MEMSPACE > 0) && (SC_14 == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_E;
           end
           else if(((MEMSPACE > 0) && (SC_14 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M3 = SLAVE_E;
           end
        end

        5'h1F : begin
           if((MEMSPACE > 0) && (SC_15 == 0)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_F;
           end
           else if(((MEMSPACE > 0) && (SC_15 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_READ_M3 = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_READ_M3 = SLAVE_F;
           end
        end

        default : begin SLAVE_SELECT_READ_M3 = 17'h00000; end
      endcase // case ({ARVALID_MI3,ARADDR_MI3[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
   end // always @ (*)

   //---------------------------------------------------------------------------
   // Generate the read requests to the arbiter 
   //---------------------------------------------------------------------------
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         AR_REQ_MI0 <= 'h0;
         AR_REQ_MI1 <= 'h0;
         AR_REQ_MI2 <= 'h0;
         AR_REQ_MI3 <= 'h0;
      end
      else begin
         AR_REQ_MI0 <=  ((| SLAVE_SELECT_READ_M0) && ((SLAVE_NUMBER == ARADDR_M0[AXI_AWIDTH - 1:AXI_AWIDTH-4]) | (SLAVE_NUMBER[4] == 1'b1 && (|COMB_REG)))) | ((MEMSPACE == 0) & (| SLAVE_SELECT_READ_M0));
         AR_REQ_MI1 <=  ((| SLAVE_SELECT_READ_M1) && ((SLAVE_NUMBER == ARADDR_M1[AXI_AWIDTH - 1:AXI_AWIDTH-4]) | (SLAVE_NUMBER[4] == 1'b1 && (|COMB_REG)))) | ((MEMSPACE == 0) & (| SLAVE_SELECT_READ_M1));
         AR_REQ_MI2 <=  ((| SLAVE_SELECT_READ_M2) && ((SLAVE_NUMBER == ARADDR_M2[AXI_AWIDTH - 1:AXI_AWIDTH-4]) | (SLAVE_NUMBER[4] == 1'b1 && (|COMB_REG)))) | ((MEMSPACE == 0) & (| SLAVE_SELECT_READ_M2));
         AR_REQ_MI3 <=  ((| SLAVE_SELECT_READ_M3) && ((SLAVE_NUMBER == ARADDR_M3[AXI_AWIDTH - 1:AXI_AWIDTH-4]) | (SLAVE_NUMBER[4] == 1'b1 && (|COMB_REG)))) | ((MEMSPACE == 0) & (| SLAVE_SELECT_READ_M3));
      end
   end
   
   //---------------------------------------------------------------------------
   // Generate the Slave select signal for Write address based on the 
   // ARADDR coming from the selected(granted) Master stage
   //---------------------------------------------------------------------------
   // --------------------------------------------------------------------------
   // Select Slave slot for Write
   // --------------------------------------------------------------------------
   always @ (*) begin
      case ({ARVALID_IS,ARADDR_IS[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
        5'h10 : begin
           if((MEMSPACE > 0) && (SC_0 == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_0;
           end
           else if(((MEMSPACE > 0) && (SC_0 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_0;
           end
        end // case: 5'h10
        
        5'h11 : begin 
           if((MEMSPACE > 0) && (SC_1 == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_1;
           end
           else if(((MEMSPACE > 0) && (SC_1 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_1;
           end
        end // case: 5'h11
        
        5'h12 : begin
           if((MEMSPACE > 0) && (SC_2 == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_2;
           end
           else if(((MEMSPACE > 0) && (SC_2 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_2;
           end
        end      

        5'h13 : begin
           if((MEMSPACE > 0) && (SC_3 == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_3;
           end
           else if(((MEMSPACE > 0) && (SC_3 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_3;
           end
        end

        5'h14 : begin
           if((MEMSPACE > 0) && (SC_4 == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_4;
           end
           else if(((MEMSPACE > 0) && (SC_4 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_4;
           end
        end

        5'h15 : begin
           if((MEMSPACE > 0) && (SC_5 == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_5;
           end
           else if(((MEMSPACE > 0) && (SC_5 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_5;
           end
        end

        5'h16 : begin
           if((MEMSPACE > 0) && (SC_6 == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_6;
           end
           else if(((MEMSPACE > 0) && (SC_6 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_6;
           end
        end

        5'h17 : begin
           if((MEMSPACE > 0) && (SC_7 == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_7;
           end
           else if(((MEMSPACE > 0) && (SC_7 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_7;
           end
        end

        5'h18 : begin
           if((MEMSPACE > 0) && (SC_8 == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_8;
           end
           else if(((MEMSPACE > 0) && (SC_8 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_8;
           end
        end

        5'h19 : begin
           if((MEMSPACE > 0) && (SC_9 == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_9;
           end
           else if(((MEMSPACE > 0) && (SC_9 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_9;
           end
        end

        5'h1A : begin
           if((MEMSPACE > 0) && (SC_10 == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_A;
           end
           else if(((MEMSPACE > 0) && (SC_10 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_A;
           end
        end

        5'h1B : begin
           if((MEMSPACE > 0) && (SC_11 == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_B;
           end
           else if(((MEMSPACE > 0) && (SC_11 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_B;
           end
        end

        5'h1C : begin
           if((MEMSPACE > 0) && (SC_12 == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_C;
           end
           else if(((MEMSPACE > 0) && (SC_12 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_C;
           end
        end

        5'h1D : begin
           if((MEMSPACE > 0) && (SC_13 == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_D;
           end
           else if(((MEMSPACE > 0) && (SC_13 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_D;
           end
        end

        5'h1E : begin
           if((MEMSPACE > 0) && (SC_14 == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_E;
           end
           else if(((MEMSPACE > 0) && (SC_14 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_E;
           end
        end

        5'h1F : begin
           if((MEMSPACE > 0) && (SC_15 == 0)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_F;
           end
           else if(((MEMSPACE > 0) && (SC_15 == 1)) || (MEMSPACE == 0  && ADDR_HGS_CFG == 1)) begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_N;
           end
           else begin
              SLAVE_SELECT_RADDRCH_M = SLAVE_F;
           end
        end

        default : begin SLAVE_SELECT_RADDRCH_M = SLAVE_SELECT_RADDRCH_M_r; end
      endcase // case ({ARVALID_IS,ARADDR_IS[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
   end // always @ (*)


   // Latch Write data channel signals
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
	     SLAVE_SELECT_RADDRCH_M_r  <=  'h0;
      end
      else begin
	     SLAVE_SELECT_RADDRCH_M_r  <= SLAVE_SELECT_RADDRCH_M;
      end
   end   

   // -----------------------------------------------------
   // Read Arbiter Instance
   // -----------------------------------------------------
   axi_RA_ARBITER #( 
                 .SYNC_RESET(SYNC_RESET),
	             .AXI_AWIDTH(AXI_AWIDTH),
	             .AXI_DWIDTH(AXI_DWIDTH),
	             .AXI_STRBWIDTH(AXI_STRBWIDTH),
                 .INP_REG_BUF(INP_REG_BUF),
                 .OUT_REG_BUF(OUT_REG_BUF),
                 .NUM_MASTER_SLOT(NUM_MASTER_SLOT)
                 )
	 URA_ARBITER0 (
                  // Global signals
                  .ACLK       (ACLK)
                  ,.ARESETN    (ARESETN)
                  
                  // MASTER 0
                  ,   .ARLOCK_M0  (ARLOCK_M0)
                  
                  // MASTER 1
                  ,   .ARLOCK_M1  (ARLOCK_M1)
                  
                  // MASTER 2
                  ,   .ARLOCK_M2  (ARLOCK_M2)
                  
                  // MASTER 3
                  ,   .ARLOCK_M3  (ARLOCK_M3)

                  // 22 Apr: Added for lock issue
                  ,   .ARLOCK_MI0  (ARLOCK_MI0)
                  ,   .ARLOCK_MI1  (ARLOCK_MI1)
                  ,   .ARLOCK_MI2  (ARLOCK_MI2)
                  ,   .ARLOCK_MI3  (ARLOCK_MI3)
                  
                  // From Masters
                  // M0
                  ,  .m0_rd_end(m0_rd_end)
                  // M1
                  ,  .m1_rd_end(m1_rd_end)
                  // M2
                  ,  .m2_rd_end(m2_rd_end)
                  // M3
                  ,  .m3_rd_end(m3_rd_end)
                  
                  // AXI MASTER 0 
                  ,  .AR_REQ_MI0(AR_REQ_MI0)
                  
                  // AXI MASTER 1 
                  ,  .AR_REQ_MI1(AR_REQ_MI1)
                  
                  // AXI MASTER 2 
                  ,  .AR_REQ_MI2(AR_REQ_MI2)
                  
                  // AXI MASTER 3 
                  ,  .AR_REQ_MI3(AR_REQ_MI3)
                  
                  // Outputs 
                  ,  .AR_MASGNT_MI(AR_MASGNT_IC)

                   , .wr_lock_high (wr_lock_high) 
                   , .rd_lock_high (rd_lock_high) 
                   , .rd_normal_high (rd_normal_high) 
                   , .wr_normal_high (wr_normal_high) 
                   ,.mst_rd_inprog0(mst_rd_inprog0) 
                   ,.mst_rd_inprog1(mst_rd_inprog1) 
                   ,.mst_rd_inprog2(mst_rd_inprog2) 
                   ,.mst_rd_inprog3(mst_rd_inprog3) 
                   ,.mst_wr_inprog0(mst_wr_inprog0)                               
                   ,.mst_wr_inprog1(mst_wr_inprog1)                               
                   ,.mst_wr_inprog2(mst_wr_inprog2)                               
                   ,.mst_wr_inprog3(mst_wr_inprog3)                               

                  );


endmodule // rdmatrix_4Mto1S



   /////////////////////////////////////////////////////////////////////////////
   //                               End - of - Code                           //
   /////////////////////////////////////////////////////////////////////////////

