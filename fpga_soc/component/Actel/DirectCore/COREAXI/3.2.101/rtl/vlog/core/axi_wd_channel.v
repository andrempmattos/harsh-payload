// ****************************************************************************/
// Actel Corporation Proprietary and Confidential
// Copyright 2010 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: wd_channel.v
//              
//              
//                       - 
//                       - 
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

module axi_wd_channel (
                   // Global signals
                   ACLK,
                   ARESETN,               

                   // From fwd master waselector
                   MST_GNT_NUM, 

                   // MASTER 0
                   // AXI MASTER write data channel signals
                   WID_MI0,
                   WDATA_MI0,
                   WSTRB_MI0,
                   WLAST_MI0,
                   WVALID_MI0,
                   WREADY_IM0,
                   
                   // MASTER 1
                   // AXI MASTER write data channel signals
                   WID_MI1,
                   WDATA_MI1,
                   WSTRB_MI1,
                   WLAST_MI1,
                   WVALID_MI1,
                   WREADY_IM1,

                   // MASTER 2
                   // AXI MASTER write data channel signals
                   WID_MI2,
                   WDATA_MI2,
                   WSTRB_MI2,
                   WLAST_MI2,
                   WVALID_MI2,
                   WREADY_IM2,
                   
                   // MASTER 3
                   // AXI MASTER write data channel signals
                   WID_MI3,
                   WDATA_MI3,
                   WSTRB_MI3,
                   WLAST_MI3,
                   WVALID_MI3,
                   WREADY_IM3,

                   // SLAVE 0
                   // AXI SLAVE 0 write data channel signals
                   WID_IS,  
                   WDATA_IS,    
                   WVALID_IS,
                   WSTRB_IS,   
                   WLAST_IS, 

                   // SLAVE 0
                   WREADY_SI,
                   SLAVE_NUMBER,
                   AWADDR_IS_int,
                   AWVALID_IS,
                   AWADDR_IS,
                   // v3.2 - For outstanding writes
                   pending_wr_gnt,
                   pending_wraddr_gnt,
                   slave_out_en,
                   m0_wr_end,
                   m1_wr_end,
                   m2_wr_end,
                   m3_wr_end,
                   pending_wr0,
                   pending_wr1,
                   pending_wr2,
                   pending_wr3,
                   slave_out_addr  
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

   localparam AXI_STRBWIDTH              = AXI_DWIDTH/8;
   localparam COMB_REG       = {SC_0, SC_1, SC_2, SC_3, SC_4, SC_5, SC_6, SC_7, SC_8, SC_9, SC_10, SC_11, SC_12, SC_13, SC_14, SC_15};

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

   // From fwd master waselector
   input [3:0]                  MST_GNT_NUM; 

   // From Master 0
   // AXI write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_MI0;
   input [AXI_DWIDTH-1:0]        WDATA_MI0;
   input [AXI_STRBWIDTH-1:0]     WSTRB_MI0;
   input                         WLAST_MI0;
   input                         WVALID_MI0;
   output                        WREADY_IM0;   

   // From Master 1
   // AXI write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_MI1;
   input [AXI_DWIDTH-1:0]        WDATA_MI1;
   input [AXI_STRBWIDTH-1:0]     WSTRB_MI1;
   input                         WLAST_MI1;
   input                         WVALID_MI1;
   output                        WREADY_IM1;

   // From Master 2
   // AXI write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_MI2;
   input [AXI_DWIDTH-1:0]        WDATA_MI2;
   input [AXI_STRBWIDTH-1:0]     WSTRB_MI2;
   input                         WLAST_MI2;
   input                         WVALID_MI2;
   output                        WREADY_IM2;

   // From Master 3
   // AXI write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_MI3;
   input [AXI_DWIDTH-1:0]        WDATA_MI3;
   input [AXI_STRBWIDTH-1:0]     WSTRB_MI3;
   input                         WLAST_MI3;
   input                         WVALID_MI3;
   output                        WREADY_IM3;

    // SLAVE 0
    // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] WID_IS;
   output [AXI_DWIDTH-1:0]               WDATA_IS;
   output [AXI_STRBWIDTH-1:0]            WSTRB_IS;
   output                                WLAST_IS;
   output                                WVALID_IS;

   // SLAVE 0
   // AXI SLAVE 0 write address channel signals
   input                                 WREADY_SI;
//   input [4:0]                           SLAVE_GATED;
   input [4:0]                           SLAVE_NUMBER;
   input [31:0]                AWADDR_IS_int;
   input [31:0]                AWADDR_IS;
   input                       AWVALID_IS;

   //v3.2 - For outstanding writes
   input [NUM_MASTER_SLOT-1:0]       pending_wr_gnt;  
   input [NUM_MASTER_SLOT*4 - 1:0]   pending_wraddr_gnt;  
   output                            slave_out_en;  
   output [3:0]                      slave_out_addr; 

   
   // For Arbiter from Masters
   // To end grant to current master
   input       m0_wr_end;
   input       m1_wr_end;
   input       m2_wr_end;
   input       m3_wr_end;
   input [WR_ACCEPTANCE-1:0]       pending_wr0;
   input [WR_ACCEPTANCE-1:0]       pending_wr1;
   input [WR_ACCEPTANCE-1:0]       pending_wr2;
   input [WR_ACCEPTANCE-1:0]       pending_wr3;

   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------

   // --------------------------------------------------------------------------
   // Internal signals
   reg                                   WREADY_IM0;
   reg                                   WREADY_IM1;
   reg                                   WREADY_IM2;
   reg                                   WREADY_IM3;

   reg                                   WREADY_IM0_int;
   reg                                   WREADY_IM1_int;
   reg                                   WREADY_IM2_int;
   reg                                   WREADY_IM3_int;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0]    WID_IS;
   reg [AXI_DWIDTH-1:0]                  WDATA_IS;
   reg [AXI_STRBWIDTH-1:0]               WSTRB_IS;
   reg                                   WLAST_IS;
   reg                                   WVALID_IS;

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0]    WID_IS_int;
   reg [AXI_DWIDTH-1:0]                  WDATA_IS_int;
   reg [AXI_STRBWIDTH-1:0]               WSTRB_IS_int;
   reg                                   WLAST_IS_int;
   reg                                   WVALID_IS_int;
   reg [3:0]                             MST_GNT_NUM_r;

   wire                                  aresetn;
   wire                                  sresetn;

   reg [3:0]                             slave_out_addr; 
   reg                                   slave_out_en;
   reg [3:0] prev_MST_GNT_NUM;
   wire  gnt_change;
   reg   gnt_change_r;
   reg                                AW_REQ_MI0_r;
   reg                                AW_REQ_MI1_r;
   reg                                AW_REQ_MI2_r;
   reg                                AW_REQ_MI3_r;
   reg                               pend_AW_REQ_MI0;
   reg                                pend_AW_REQ_MI1;
   reg                                pend_AW_REQ_MI2;
   reg                                pend_AW_REQ_MI3;
   wire [3:0]                         W_MASGNT_IC;
   /////////////////////////////////////////////////////////////////////////////
   //                               Start - of - Code                         //
   /////////////////////////////////////////////////////////////////////////////
   
   // --------------------------------------------------------------------------
   // resets
   // --------------------------------------------------------------------------
   assign aresetn   = (SYNC_RESET == 1) ? 1'b1  : ARESETN;
   assign sresetn   = (SYNC_RESET == 1) ? ARESETN : 1'b1;

   generate 
     if(NUM_MASTER_SLOT == 1) begin  
   // Based on grant, decides which Master's write address is selected. 
   always @(*) begin
     case(MST_GNT_NUM)   
         4'b0001: slave_out_addr = pending_wraddr_gnt[3:0];  // Address from M0
         default: slave_out_addr = 4'b0000;
     endcase
   end
   always @(*) begin
     case(MST_GNT_NUM) 
         4'b0001: slave_out_en = pending_wr_gnt[0]; // enable from M0
         default: slave_out_en = 4'b0000;
     endcase
   end

   end
   endgenerate

   generate 
     if(NUM_MASTER_SLOT == 2) begin  
   // Based on grant, decides which Master's write address is selected. 
   always @(*) begin
     case(MST_GNT_NUM)   
         4'b0001: slave_out_addr = pending_wraddr_gnt[3:0];  // Address from M0
         4'b0010: slave_out_addr = pending_wraddr_gnt[7:4];  // Address from M1
         default: slave_out_addr = 4'b0000;
     endcase
   end
   always @(*) begin
     case(MST_GNT_NUM) 
         4'b0001: slave_out_en = pending_wr_gnt[0]; // enable from M0
         4'b0010: slave_out_en = pending_wr_gnt[1]; // enable from M1 
         default: slave_out_en = 4'b0000;
     endcase
   end

   end
   endgenerate

   generate 
     if(NUM_MASTER_SLOT == 3) begin  
   // Based on grant, decides which Master's write address is selected. 
   always @(*) begin
     case(MST_GNT_NUM) 
         4'b0001: slave_out_addr = pending_wraddr_gnt[3:0];  // Address from M0
         4'b0010: slave_out_addr = pending_wraddr_gnt[7:4];  // Address from M1
         4'b0100: slave_out_addr = pending_wraddr_gnt[11:8]; // Address from M2
         default: slave_out_addr = 4'b0000;
     endcase
   end
   always @(*) begin
     case(MST_GNT_NUM) 
         4'b0001: slave_out_en = pending_wr_gnt[0]; // enable from M0
         4'b0010: slave_out_en = pending_wr_gnt[1]; // enable from M1 
         4'b0100: slave_out_en = pending_wr_gnt[2]; // enable from M2
         default: slave_out_en = 4'b0000;
     endcase
   end

   end
   endgenerate

   generate 
     if(NUM_MASTER_SLOT == 4) begin  
   // Based on grant, decides which Master's write address is selected. 
   always @(*) begin
     case(MST_GNT_NUM) 
         4'b0001: slave_out_addr = pending_wraddr_gnt[3:0];  // Address from M0
         4'b0010: slave_out_addr = pending_wraddr_gnt[7:4];  // Address from M1
         4'b0100: slave_out_addr = pending_wraddr_gnt[11:8]; // Address from M2
         4'b1000: slave_out_addr = pending_wraddr_gnt[15:12];// Address from M3
         default: slave_out_addr = 4'b0000;
     endcase
   end
   always @(*) begin
     case(MST_GNT_NUM) 
         4'b0001: slave_out_en = pending_wr_gnt[0]; // enable from M0
         4'b0010: slave_out_en = pending_wr_gnt[1]; // enable from M1 
         4'b0100: slave_out_en = pending_wr_gnt[2]; // enable from M2
         4'b1000: slave_out_en = pending_wr_gnt[3]; // enable from M3
         default: slave_out_en = 4'b0000;
     endcase
   end

   end
   endgenerate

  // --
   generate
      if(MEMSPACE > 0) begin
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
  	     WDATA_IS   <= 'h0;
		 WID_IS     <= 'h0;
         WLAST_IS   <= 'h0;
         WSTRB_IS   <= 'h0;
         WVALID_IS  <= 'h0; 


         WREADY_IM0  <= 1'b0;
         WREADY_IM1  <= 1'b0;
         WREADY_IM2  <= 1'b0;
         WREADY_IM3  <= 1'b0;       

         MST_GNT_NUM_r <= 'h0;
         
      end
      else begin
         MST_GNT_NUM_r <= MST_GNT_NUM;         

         WREADY_IM0  <= WREADY_IM0_int;
         WREADY_IM1  <= WREADY_IM1_int;
         WREADY_IM2  <= WREADY_IM2_int;
         WREADY_IM3  <= WREADY_IM3_int;
         
         // Determines based on correct slave address whether to drive the write data signals 
         if(((SLAVE_NUMBER[3:0] == slave_out_addr) && slave_out_en) || SLAVE_NUMBER[4] == 1'b1) begin  
  	        WDATA_IS   <= WDATA_IS_int;
		    WID_IS     <= WID_IS_int;
            WLAST_IS   <= WLAST_IS_int;
            WSTRB_IS   <= WSTRB_IS_int;
            WVALID_IS  <= WVALID_IS_int;

         end
         // Commented  - v3.2
         else begin
  	        WDATA_IS   <= 'h0;
		    WID_IS     <= 'h0;
            WLAST_IS   <= 'h0;
            WSTRB_IS   <= 'h0;
            WVALID_IS  <= 'h0;  
         end    
        
      end
   end
      end // if (MEMSPACE > 0)
   endgenerate
   
   generate
      if(MEMSPACE == 0 && ADDR_HGS_CFG == 0) begin
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
  	     WDATA_IS   <= 'h0;
		 WID_IS     <= 'h0;
         WLAST_IS   <= 'h0;
         WSTRB_IS   <= 'h0;
         WVALID_IS  <= 'h0; 


         WREADY_IM0  <= 1'b0;
         WREADY_IM1  <= 1'b0;
         WREADY_IM2  <= 1'b0;
         WREADY_IM3  <= 1'b0;       

         MST_GNT_NUM_r <= 'h0;
         
      end
      else begin
         MST_GNT_NUM_r <= MST_GNT_NUM;         

         WREADY_IM0  <= WREADY_IM0_int;
         WREADY_IM1  <= WREADY_IM1_int;
         WREADY_IM2  <= WREADY_IM2_int;
         WREADY_IM3  <= WREADY_IM3_int;
         
         if((slave_out_en && (SLAVE_NUMBER[3:0] == slave_out_addr)) || SLAVE_NUMBER[4] == 1'b1) begin
  	        WDATA_IS   <= WDATA_IS_int;
		    WID_IS     <= WID_IS_int;
            WLAST_IS   <= WLAST_IS_int;
            WSTRB_IS   <= WSTRB_IS_int;
            WVALID_IS  <= WVALID_IS_int;
         end
         // Commented - v3.2
         else begin
  	        WDATA_IS   <= 'h0;
		    WID_IS     <= 'h0;
            WLAST_IS   <= 'h0;
            WSTRB_IS   <= 'h0;
            WVALID_IS  <= 'h0; 
         end              
      end
   end
      end // if (MEMSPACE == 0 && ADDR_HGS_CFG == 0)      
   endgenerate

   generate
      if(MEMSPACE == 0 && ADDR_HGS_CFG == 1) begin
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
  	     WDATA_IS   <= 'h0;
		 WID_IS     <= 'h0;
         WLAST_IS   <= 'h0;
         WSTRB_IS   <= 'h0;
         WVALID_IS  <= 'h0; 


         WREADY_IM0  <= 1'b0;
         WREADY_IM1  <= 1'b0;
         WREADY_IM2  <= 1'b0;
         WREADY_IM3  <= 1'b0;       

         MST_GNT_NUM_r <= 'h0;
         
      end
      else begin
         MST_GNT_NUM_r <= MST_GNT_NUM;         

         WREADY_IM0  <= WREADY_IM0_int;
         WREADY_IM1  <= WREADY_IM1_int;
         WREADY_IM2  <= WREADY_IM2_int;
         WREADY_IM3  <= WREADY_IM3_int;
         
         if((slave_out_en && (SLAVE_NUMBER[3:0] == slave_out_addr)) || SLAVE_NUMBER[4] == 1'b1) begin
  	        WDATA_IS   <= WDATA_IS_int;
		    WID_IS     <= WID_IS_int;
            WLAST_IS   <= WLAST_IS_int;
            WSTRB_IS   <= WSTRB_IS_int;
            WVALID_IS  <= WVALID_IS_int;
         end

         else begin
  	        WDATA_IS   <= 'h0;
		    WID_IS     <= 'h0;
            WLAST_IS   <= 'h0;
            WSTRB_IS   <= 'h0;
            WVALID_IS  <= 'h0; 
         end              
      end
   end
      end // if (MEMSPACE == 0 && ADDR_HGS_CFG == 1)      
   endgenerate


   generate 
      if(NUM_MASTER_SLOT == 1) begin

         always @ (*) begin

            case({(!gnt_change && (SLAVE_NUMBER[3:0] == slave_out_addr || SLAVE_NUMBER[4] == 1'b1)),MST_GNT_NUM})  // v3.2 - SAR71476
              5'b10001 : begin 
     
		         WID_IS_int      = WID_MI0;
                 WDATA_IS_int    = WDATA_MI0;
                 WSTRB_IS_int    = WSTRB_MI0;
                 WLAST_IS_int    = WLAST_MI0;
                 WVALID_IS_int   = WVALID_MI0;
     
    	      end
              default : begin 
		         WID_IS_int      = 'h0;
                 WDATA_IS_int    = 'h0;
                 WSTRB_IS_int    = 'h0;
                 WLAST_IS_int    = 'h0;
                 WVALID_IS_int   = 'h0;
                 
    	      end
            endcase // case (wdata_seq_str[18:17])       
         end // always @ (*)      

         always @ (*) begin

            case({1'b1,MST_GNT_NUM_r})
              5'b10001 : begin 
                 WREADY_IM0_int  = WREADY_SI;
    	      end
              default : begin 
                 WREADY_IM0_int  = 1'b0;
    	      end
            endcase // case (wdata_seq_str[18:17])       
         end // always @ (*)      

      end // if (NUM_MASTER_SLOT == 1)
   endgenerate
   

   generate 
      if(NUM_MASTER_SLOT == 2) begin

         always @ (*) begin
            case({(!gnt_change && (SLAVE_NUMBER[3:0] == slave_out_addr || SLAVE_NUMBER[4] == 1'b1)),MST_GNT_NUM})  // v3.2 - SAR71476
              5'b10001 : begin 
                 
		         WID_IS_int      = WID_MI0;
                 WDATA_IS_int    = WDATA_MI0;
                 WSTRB_IS_int    = WSTRB_MI0;
                 WLAST_IS_int    = WLAST_MI0;
                 WVALID_IS_int   = WVALID_MI0;
    	      end
              5'b10010 : begin 
                 
		         WID_IS_int      = WID_MI1;
                 WDATA_IS_int    = WDATA_MI1;
                 WSTRB_IS_int    = WSTRB_MI1;
                 WLAST_IS_int    = WLAST_MI1;
                 WVALID_IS_int   = WVALID_MI1;
    	      end
              default : begin 
		         WID_IS_int      = 'h0;
                 WDATA_IS_int    = 'h0;
                 WSTRB_IS_int    = 'h0;
                 WLAST_IS_int    = 'h0;
                 WVALID_IS_int   = 'h0;
    	      end
            endcase // case (wdata_seq_str[18:17])       
         end // always @ (*)      

         always @ (*) begin
            case({1'b1,MST_GNT_NUM_r})  // v3.2
              5'b10001 : begin 
                 WREADY_IM0_int  = WREADY_SI;
                 WREADY_IM1_int  = 1'b0;
    	      end
              5'b10010 : begin 
                 WREADY_IM0_int  = 1'b0;
                 WREADY_IM1_int  = WREADY_SI;
    	      end
              default : begin 
                 WREADY_IM0_int  = 1'b0;
                 WREADY_IM1_int  = 1'b0;
    	      end
            endcase // case (wdata_seq_str[18:17])       
         end // always @ (*)      

      end // if (NUM_MASTER_SLOT == 2)
   endgenerate      

   generate 
      if(NUM_MASTER_SLOT == 3) begin

         always @ (*) begin
            case({(!gnt_change && (SLAVE_NUMBER[3:0] == slave_out_addr || SLAVE_NUMBER[4] == 1'b1)),MST_GNT_NUM})  // v3.2 - SAR71476
              5'b10001 : begin 
     
		         WID_IS_int    = WID_MI0;
                 WDATA_IS_int    = WDATA_MI0;
                 WSTRB_IS_int    = WSTRB_MI0;
                 WLAST_IS_int    = WLAST_MI0;
                 WVALID_IS_int   = WVALID_MI0;
    		  end
              5'b10010 : begin 
     
		         WID_IS_int      = WID_MI1;
                 WDATA_IS_int    = WDATA_MI1;
                 WSTRB_IS_int    = WSTRB_MI1;
                 WLAST_IS_int    = WLAST_MI1;
                 WVALID_IS_int   = WVALID_MI1;
    		  end
              5'b10100 : begin 
     
        		 WID_IS_int      = WID_MI2;
                 WDATA_IS_int    = WDATA_MI2;
                 WSTRB_IS_int    = WSTRB_MI2;
                 WLAST_IS_int    = WLAST_MI2;
                 WVALID_IS_int   = WVALID_MI2;
    		  end
              default : begin 
		         WID_IS_int      = 'h0;
                 WDATA_IS_int    = 'h0;
                 WSTRB_IS_int    = 'h0;
                 WLAST_IS_int    = 'h0;
                 WVALID_IS_int   = 'h0;
    		  end
            endcase // case (wdata_seq_str[18:17])       
         end // always @ (*)

         always @ (*) begin
            case({1'b1,MST_GNT_NUM_r})
              5'b10001 : begin 
                 WREADY_IM0_int  = WREADY_SI;
                 WREADY_IM1_int  = 1'b0;
                 WREADY_IM2_int  = 1'b0;
    		  end
              5'b10010 : begin 
                 WREADY_IM0_int = 1'b0;
                 WREADY_IM1_int = WREADY_SI;
                 WREADY_IM2_int = 1'b0;
    		  end
              5'b10100 : begin 
                 WREADY_IM0_int = 1'b0;
                 WREADY_IM1_int = 1'b0;
                 WREADY_IM2_int = WREADY_SI;
    		  end
              default : begin 
                 WREADY_IM0_int = 1'b0;
                 WREADY_IM1_int = 1'b0;
                 WREADY_IM2_int = 1'b0;
    		  end
            endcase // case (wdata_seq_str[18:17])       
         end // always @ (*)

      end // if (NUM_MASTER_SLOT == 3)      
   endgenerate

   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
        prev_MST_GNT_NUM     <= 'h0;
        gnt_change_r     <= 'h0;
      end
      else begin
        prev_MST_GNT_NUM     <= MST_GNT_NUM; 
        gnt_change_r     <= gnt_change;
      end 
  end

  assign gnt_change = (prev_MST_GNT_NUM != MST_GNT_NUM & !slave_out_en) ? 1'b1 : ((prev_MST_GNT_NUM == MST_GNT_NUM & slave_out_en) ? 1'b0 : gnt_change_r);
 
   generate 
      if(NUM_MASTER_SLOT == 4) begin

   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
   		         WID_IS_int       <= 'h0;
                 WDATA_IS_int     <= 'h0;
                 WSTRB_IS_int     <= 'h0;
                 WLAST_IS_int     <= 'h0;
                 WVALID_IS_int    <= 'h0;
      end
      else begin
            case({(!gnt_change && (SLAVE_NUMBER[3:0] == slave_out_addr || SLAVE_NUMBER[4] == 1'b1)),MST_GNT_NUM})
              5'b10001 : begin 
		         WID_IS_int       <= WID_MI0;
                 WDATA_IS_int     <= WDATA_MI0;
                 WSTRB_IS_int     <= WSTRB_MI0;
                 WLAST_IS_int     <= WLAST_MI0;
                 WVALID_IS_int   <= WVALID_MI0;
    		  end
              5'b10010 : begin 
		         WID_IS_int    <= WID_MI1;
                 WDATA_IS_int    <= WDATA_MI1;
                 WSTRB_IS_int    <= WSTRB_MI1;
                 WLAST_IS_int    <= WLAST_MI1;
                 WVALID_IS_int  <= WVALID_MI1;
    		end
              5'b10100 : begin 
		         WID_IS_int       <= WID_MI2;
                 WDATA_IS_int     <= WDATA_MI2;
                 WSTRB_IS_int     <= WSTRB_MI2;
                 WLAST_IS_int     <= WLAST_MI2;
                 WVALID_IS_int    <= WVALID_MI2;
    		  end
              5'b11000 : begin 
		         WID_IS_int       <= WID_MI3;
                 WDATA_IS_int     <= WDATA_MI3;
                 WSTRB_IS_int     <= WSTRB_MI3;
                 WLAST_IS_int     <= WLAST_MI3;
                 WVALID_IS_int    <= WVALID_MI3;
    		  end
              default : begin 
		         WID_IS_int       <= 'h0;
                 WDATA_IS_int     <= 'h0;
                 WSTRB_IS_int     <= 'h0;
                 WLAST_IS_int     <= 'h0;
                 WVALID_IS_int    <= 'h0;
    		  end
            endcase // case (wdata_seq_str[18:17])         
    	    end
         end // always @ (*)

   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
                 WREADY_IM0_int  <= 1'b0;
                 WREADY_IM1_int <= 1'b0;
                 WREADY_IM2_int  <= 1'b0;
                 WREADY_IM3_int  <= 1'b0;
    		  end     
      else begin
            case({1'b1,MST_GNT_NUM_r})  
              5'b10001 : begin     
                 WREADY_IM0_int  <= WREADY_SI;
                 WREADY_IM1_int  <= 1'b0;
                 WREADY_IM2_int  <= 1'b0;
                 WREADY_IM3_int  <= 1'b0;
    		  end
              5'b10010 : begin 
                 WREADY_IM1_int  <= WREADY_SI;
                 WREADY_IM0_int  <= 1'b0;
                 WREADY_IM2_int  <= 1'b0;
                 WREADY_IM3_int  <= 1'b0;
    		end
              5'b10100 : begin 
                 WREADY_IM2_int  <= WREADY_SI;
                 WREADY_IM0_int  <= 1'b0;
                 WREADY_IM1_int  <= 1'b0;
                 WREADY_IM3_int  <= 1'b0;
    		  end
              5'b11000 : begin 
                 WREADY_IM3_int  <= WREADY_SI;
                 WREADY_IM1_int  <= 1'b0;
                 WREADY_IM2_int  <= 1'b0;
                 WREADY_IM0_int  <= 1'b0;
    		  end
              default : begin 
                 WREADY_IM0_int  <= 1'b0;
                 WREADY_IM1_int  <= 1'b0;
                 WREADY_IM2_int  <= 1'b0;
                 WREADY_IM3_int  <= 1'b0;
    		  end
            endcase // case (wdata_seq_str[18:17])         
         end // always @ (*)
         end // always @ (*)

      end // if (NUM_MASTER_SLOT == 4)      
   endgenerate

   // -----------------------------------------------------
   // Write Arbiter Instance
   // -----------------------------------------------------
   axi_WD_ARBITER #( 
                 .SYNC_RESET(SYNC_RESET),
	             .AXI_AWIDTH(AXI_AWIDTH),
	             .AXI_DWIDTH(AXI_DWIDTH),
	             .AXI_STRBWIDTH(AXI_STRBWIDTH),
                     .INP_REG_BUF(INP_REG_BUF),
	             .OUT_REG_BUF(OUT_REG_BUF),
                     .NUM_MASTER_SLOT(NUM_MASTER_SLOT)
            )
	   UWD_ARBITER (
                    // Global signals
                    .ACLK       (ACLK)
                    ,   .ARESETN    (ARESETN)
                    
                    // From Masters
                    ,  .m0_wr_end(m0_wr_end)
                    ,  .m1_wr_end(m1_wr_end)
                    ,  .m2_wr_end(m2_wr_end)
                    ,  .m3_wr_end(m3_wr_end)
                    
                    // AXI MASTER 0 
                    ,  .AW_REQ_MI0(pend_AW_REQ_MI0)
                    
                    // AXI MASTER 1 
                    ,  .AW_REQ_MI1(pend_AW_REQ_MI1)
                    
                    // AXI MASTER 2 
                    ,  .AW_REQ_MI2(pend_AW_REQ_MI2)
                    
                    // AXI MASTER 3 
                    ,  .AW_REQ_MI3(pend_AW_REQ_MI3)

                    // Outputs 
                    ,  .W_MASGNT_MI(W_MASGNT_IC)
                    ,  .slave_out_en (slave_out_en)

                    );

   // Generate the Write request based on the pending requests
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         AW_REQ_MI0_r <= 'h0;
         AW_REQ_MI1_r <= 'h0;
         AW_REQ_MI2_r <= 'h0;
         AW_REQ_MI3_r <= 'h0;
      end
      else begin
         AW_REQ_MI0_r <= (| pending_wr0);   
         AW_REQ_MI1_r <= (| pending_wr1);   
         AW_REQ_MI2_r <= (| pending_wr2);   
         AW_REQ_MI3_r <= (| pending_wr3);   
       end
   end

   always @ (*) begin
        pend_AW_REQ_MI0 = AW_REQ_MI0_r  & (pending_wr0[WR_ACCEPTANCE-1] );
        pend_AW_REQ_MI1 = AW_REQ_MI1_r  & (pending_wr1[WR_ACCEPTANCE-1] );
        pend_AW_REQ_MI2 = AW_REQ_MI2_r  & (pending_wr2[WR_ACCEPTANCE-1] );
        pend_AW_REQ_MI3 = AW_REQ_MI3_r  & (pending_wr3[WR_ACCEPTANCE-1] );
   end

endmodule // wd_channel


   /////////////////////////////////////////////////////////////////////////////
   //                               End - of - Code                           //
   /////////////////////////////////////////////////////////////////////////////
