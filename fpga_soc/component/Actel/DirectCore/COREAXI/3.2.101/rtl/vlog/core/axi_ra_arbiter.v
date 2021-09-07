// ****************************************************************************/
// Actel Corporation Proprietary and Confidential
// Copyright 2010 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: CoreAXI - Read Arbiter
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
module axi_RA_ARBITER (
                   // Global signals
                   ACLK
                   ,   ARESETN
                   
                   // MASTER 0
                   ,   ARLOCK_M0
                   
                   // MASTER 1
                   ,   ARLOCK_M1
                   
                   // MASTER 2
                   ,   ARLOCK_M2
                   
                   // MASTER 3
                   ,   ARLOCK_M3
                   // MASTER 0
                   ,   ARLOCK_MI0
                   // MASTER 1
                   ,   ARLOCK_MI1
                   
                   // MASTER 2
                   ,   ARLOCK_MI2
                   
                   // MASTER 3
                   ,   ARLOCK_MI3
                   
                   // From Masters
                   // M0
                   ,  m0_rd_end
                   // M1
                   ,  m1_rd_end
                   // M2
                   ,  m2_rd_end
                   // M3
                   ,  m3_rd_end

                   // AXI MASTER 0 
                   ,   AR_REQ_MI0
                   
                   // AXI MASTER 1 
                   ,   AR_REQ_MI1
                   
                   // AXI MASTER 2 
                   ,   AR_REQ_MI2

                   // AXI MASTER 3 
                   ,   AR_REQ_MI3
                   
                   ,   AR_MASGNT_MI

                   , wr_lock_high 

                   , rd_lock_high 
                   , rd_normal_high 
                   , wr_normal_high 
                   , mst_rd_inprog0  
                   , mst_rd_inprog1  
                   , mst_rd_inprog2  
                   , mst_rd_inprog3  
                   , mst_wr_inprog0                                 
                   , mst_wr_inprog1                                 
                   , mst_wr_inprog2                                 
                   , mst_wr_inprog3                                 
                   );

   //------------------------------------------------------------------------
   // Parameter Declaration
   //------------------------------------------------------------------------
   parameter AXI_AWIDTH         = 32;
   parameter AXI_DWIDTH         = 64;
   parameter AXI_STRBWIDTH      = AXI_DWIDTH/8;
   parameter NUM_MASTER_SLOT    = 1;
   parameter INP_REG_BUF        = 1;
   parameter OUT_REG_BUF        = 1;
   parameter SYNC_RESET         = 0;

   //------------------------------------------------------------------------
   // Global signals
   //------------------------------------------------------------------------
   input                        ACLK;
   input                        ARESETN;

   // MASTER 0
   input  [1:0]                 ARLOCK_M0;
   // MASTER 1
   input  [1:0]                 ARLOCK_M1;
   // MASTER 2
   input  [1:0]                 ARLOCK_M2;
   // MASTER 3
   input  [1:0]                 ARLOCK_M3;
   // MASTER 0
   input  [1:0]                 ARLOCK_MI0;
   // MASTER 1
   input  [1:0]                 ARLOCK_MI1;
   // MASTER 2
   input  [1:0]                 ARLOCK_MI2;
   // MASTER 3
   input  [1:0]                 ARLOCK_MI3;

   // AXI MASTER 0 
   input                       AR_REQ_MI0;
   input                       m0_rd_end;

   // AXI MASTER 1 
   input                       AR_REQ_MI1;
   input                       m1_rd_end;

   // AXI MASTER 2 
   input                       AR_REQ_MI2;
   input                       m2_rd_end;

   // AXI MASTER 3 
   input                       AR_REQ_MI3;
   input                       m3_rd_end;

   output [3:0]                 AR_MASGNT_MI;
   input                        wr_lock_high;  
   
   output                       rd_lock_high;  
   output                       rd_normal_high;  
   input                        wr_normal_high;  
   input                        mst_rd_inprog0;  
   input                        mst_rd_inprog1;  
   input                        mst_rd_inprog2;  
   input                        mst_rd_inprog3;  
   input                        mst_wr_inprog0;                                 
   input                        mst_wr_inprog1;                                 
   input                        mst_wr_inprog2;                                 
   input                        mst_wr_inprog3;                                 

   //------------------------------------------------------------------------
   
   localparam MASTERS  =          4;
   localparam MASTER_0 =          5'b10001;
   localparam MASTER_1 =          5'b10010;
   localparam MASTER_2 =          5'b10100;
   localparam MASTER_3 =          5'b11000;

   localparam SLAVE_IDLE = 4'b0000;

   localparam RDID       = 4'b0001;
   localparam M0RD       = 4'b0010;
   localparam M1RD       = 4'b0011;
   localparam M2RD       = 4'b0100;
   localparam M3RD       = 4'b0101;
   localparam M0RWAIT    = 4'b0110;
   localparam M1RWAIT    = 4'b0111;
   localparam M2RWAIT    = 4'b1000;
   localparam M3RWAIT    = 4'b1001;

   localparam M0LOCKED   = 4'b1010;
   localparam M1LOCKED   = 4'b1011;
   localparam M2LOCKED   = 4'b1100;
   localparam M3LOCKED   = 4'b1101;

   //------------------------------------------------------------------------
   // Internal signals
   //------------------------------------------------------------------------
   reg         m0_lock_clear_read;
   reg         m1_lock_clear_read;
   reg         m2_lock_clear_read;
   reg         m3_lock_clear_read;

   reg [3:0]   rd_curr_state;
   reg [3:0]   rd_next_state;
   reg         rd_select_v;
   reg [3:0]   rd_owner;
   reg [3:0]   AR_MASGNT_MI;
   reg [3:0]   AR_MASGNT_MI_int;
   wire        aresetn;
   wire        sresetn;

   reg         rd_lock_high;  
   reg         rd_normal_high;  

   /////////////////////////////////////////////////////////////////////////////
   //                               Start - of - Code                         //
   /////////////////////////////////////////////////////////////////////////////

   // --------------------------------------------------------------------------
   // resets
   // --------------------------------------------------------------------------
   assign aresetn   = (SYNC_RESET == 1) ? 1'b1  : ARESETN;
   assign sresetn   = (SYNC_RESET == 1) ? ARESETN : 1'b1;

   //------------------------------------------------------------------------
   // Assign the Master which is granted access in the round-robin algorithm
   // This output is used to pass the selected masters signals to the
   // interconnect
   //------------------------------------------------------------------------
 
   generate
     if (INP_REG_BUF == 1 && OUT_REG_BUF == 1) begin
       always @ (posedge ACLK or negedge aresetn) begin
         if ((!aresetn) || (!sresetn)) begin
           AR_MASGNT_MI <= 'h1;
         end 
         else begin
             if(rd_select_v) begin
               AR_MASGNT_MI <= 'h0;
             end
             else begin
               AR_MASGNT_MI <= rd_owner;
             end
         end
       end
     end 
     endgenerate 
     
     generate 
     if (INP_REG_BUF == 0 && OUT_REG_BUF == 0) begin
        always @ (*) begin
          AR_MASGNT_MI = rd_owner;
        end
       
       always @ (posedge ACLK or negedge aresetn) begin
         if ((!aresetn) || (!sresetn)) begin
           AR_MASGNT_MI_int <= 'h1;
         end 
         else begin
           AR_MASGNT_MI_int <= rd_owner;
         end
       end
     end 
  endgenerate

   //------------------------------------------------------------------------
   // Read arbiter state machine
   //------------------------------------------------------------------------
   always @ (posedge ACLK or negedge aresetn) begin
       if ((!aresetn) || (!sresetn)) begin
           rd_curr_state <= SLAVE_IDLE;
       end 
       else begin
           rd_curr_state <= rd_next_state;
       end
   end


   always @ (*) begin
       rd_select_v = 1'b0;
       rd_owner = 4'b0001;
       rd_next_state = rd_curr_state;
       rd_lock_high = 1'b0;  
       rd_normal_high = 1'b0;  
      
       case (rd_curr_state) 
           SLAVE_IDLE : begin
               rd_select_v = 1'b0;
               rd_owner = 4'b0000;

               if ( (AR_REQ_MI0 == 1'b1 && ARLOCK_M0 == 2'b10)) begin
                   rd_next_state = M0LOCKED;
               end else if (AR_REQ_MI0 == 1'b1 && ARLOCK_M0 != 2'b10) begin
                   rd_next_state = M0RD;
               end else if ( (AR_REQ_MI1 == 1'b1 && ARLOCK_M1 == 2'b10)) begin
                   rd_next_state = M1LOCKED;
               end else if (AR_REQ_MI1 == 1'b1 && ARLOCK_M1 != 2'b10) begin
                   rd_next_state = M1RD;
               end else if ( (AR_REQ_MI2 == 1'b1 && ARLOCK_M2 == 2'b10)) begin
                   rd_next_state = M2LOCKED;
               end else if (AR_REQ_MI2 == 1'b1 && ARLOCK_M2 != 2'b10) begin
                   rd_next_state = M2RD;
               end else if ( (AR_REQ_MI3 == 1'b1 && ARLOCK_M3 == 2'b10)) begin
                   rd_next_state = M3LOCKED;
               end else if (AR_REQ_MI3 == 1'b1 && ARLOCK_M3 != 2'b10) begin
                   rd_next_state = M3RD;
               end else begin
                   rd_next_state = RDID;
               end
           end
           RDID       : begin
               rd_select_v = 1'b0;
               rd_owner =  (INP_REG_BUF == 0 && OUT_REG_BUF == 0) ? AR_MASGNT_MI_int : AR_MASGNT_MI;

               if ( (AR_REQ_MI0 == 1'b1 && ARLOCK_M0 == 2'b10)) begin
                   rd_next_state = M0LOCKED;
               end else if (AR_REQ_MI0 == 1'b1 && ARLOCK_M0 != 2'b10) begin
                   rd_next_state = M0RD;
               end else if ( (AR_REQ_MI1 == 1'b1 && ARLOCK_M1 == 2'b10)) begin
                   rd_next_state = M1LOCKED;
               end else if (AR_REQ_MI1 == 1'b1 && ARLOCK_M1 != 2'b10) begin
                   rd_next_state = M1RD;
               end else if ( (AR_REQ_MI2 == 1'b1 && ARLOCK_M2 == 2'b10)) begin
                   rd_next_state = M2LOCKED;
               end else if (AR_REQ_MI2 == 1'b1 && ARLOCK_M2 != 2'b10) begin
                   rd_next_state = M2RD;
               end else if ( (AR_REQ_MI3 == 1'b1 && ARLOCK_M3 == 2'b10)) begin
                   rd_next_state = M3LOCKED;
               end else if (AR_REQ_MI3 == 1'b1 && ARLOCK_M3 != 2'b10) begin
                   rd_next_state = M3RD;
               end
               else begin
                  rd_next_state = SLAVE_IDLE;
               end
           end
           M0RD       : begin
               rd_select_v = 1'b0;
               rd_owner = 4'b0001;
              rd_normal_high = 1'b1;  

               if (m0_rd_end == 1'b1) begin
               rd_select_v = 1'b1;
                    if ( (AR_REQ_MI0 == 1'b1 && ARLOCK_M0 == 2'b10)) begin  
               rd_select_v = 1'b0;
                       rd_next_state = M0LOCKED;
                   end else if (AR_REQ_MI0 == 1'b1 && ARLOCK_M0 != 2'b10) begin
               rd_select_v = 1'b0;
                       rd_next_state = M0RD;
                   end else if ((AR_REQ_MI1 == 1'b1 && ARLOCK_M1 == 2'b10)) begin
                       rd_next_state = M1LOCKED;
                   end else if (AR_REQ_MI1 == 1'b1 && ARLOCK_M1 != 2'b10) begin
                       rd_next_state = M1RD;
                   end else begin
                       rd_next_state = M0RWAIT;
                   end
               end
           end
           M0RWAIT       : begin
               rd_select_v = 1'b0;
              rd_owner = 4'b0000;   
              rd_normal_high = 1'b1;  

                   if ( (AR_REQ_MI2 == 1'b1 && ARLOCK_M2 == 2'b10)) begin
                       rd_next_state = M2LOCKED;
                   end else if (AR_REQ_MI2 == 1'b1 && ARLOCK_M2 != 2'b10) begin
                       rd_next_state = M2RD;
                   end else if ( (AR_REQ_MI3 == 1'b1 && ARLOCK_M3 == 2'b10)) begin
                       rd_next_state = M3LOCKED;
                   end else if (AR_REQ_MI3 == 1'b1 && ARLOCK_M3 != 2'b10) begin
                       rd_next_state = M3RD;
                   end else begin
                       rd_next_state = RDID;
                   end

           end
           M1RD       : begin
               rd_select_v = 1'b0;
               rd_owner = 4'b0010;
              rd_normal_high = 1'b1;  

               if (m1_rd_end == 1'b1) begin
               rd_select_v = 1'b1;
                   if ( (AR_REQ_MI1 == 1'b1 && ARLOCK_M1 == 2'b10)) begin
               rd_select_v = 1'b0;
                       rd_next_state = M1LOCKED;
                   end else if (AR_REQ_MI1 == 1'b1 && ARLOCK_M1 != 2'b10) begin
               rd_select_v = 1'b0;
                       rd_next_state = M1RD;
                   end else if ((AR_REQ_MI2 == 1'b1 && ARLOCK_M2 == 2'b10)) begin
                       rd_next_state = M2LOCKED;
                   end else if (AR_REQ_MI2 == 1'b1 && ARLOCK_M2 != 2'b10) begin
                       rd_next_state = M2RD;
                   end else begin
                       rd_next_state = M1RWAIT;
                   end
               end
           end
           M1RWAIT       : begin
               rd_select_v = 1'b0;
              rd_owner = 4'b0000;   
              rd_normal_high = 1'b1;  

                   if ( (AR_REQ_MI3 == 1'b1 && ARLOCK_M3 == 2'b10)) begin
                       rd_next_state = M3LOCKED;
                   end else if (AR_REQ_MI3 == 1'b1 && ARLOCK_M3 != 2'b10) begin
                       rd_next_state = M3RD;
                   end else begin
                       rd_next_state = RDID;
                   end

           end
           M2RD       : begin
               rd_select_v = 1'b0;
               rd_owner = 4'b0100;
              rd_normal_high = 1'b1;  

               if (m2_rd_end == 1'b1) begin
               rd_select_v = 1'b1;
                   if (( AR_REQ_MI2 == 1'b1 && ARLOCK_M2 == 2'b10)) begin
               rd_select_v = 1'b0;
                       rd_next_state = M2LOCKED;
                   end else if (AR_REQ_MI2 == 1'b1 && ARLOCK_M2 != 2'b10) begin
               rd_select_v = 1'b0;
                       rd_next_state = M2RD;
                   end else if (( AR_REQ_MI3 == 1'b1 && ARLOCK_M3 == 2'b10)) begin
                       rd_next_state = M3LOCKED;
                   end else if (AR_REQ_MI3 == 1'b1 && ARLOCK_M3 != 2'b10) begin
                       rd_next_state = M3RD;
                   end else begin
                       rd_next_state = M2RWAIT;
                   end
               end
           end	    

           M2RWAIT       : begin
              rd_select_v = 1'b0;
              rd_owner = 4'b0000;   
              rd_normal_high = 1'b1;  

              rd_next_state = RDID;
                   
           end	    
           M3RD       : begin
               rd_select_v = 1'b0;
               rd_owner = 4'b1000;
              rd_normal_high = 1'b1;  

               if (m3_rd_end == 1'b1) begin
                   if (( AR_REQ_MI3 == 1'b1 && ARLOCK_M3 == 2'b10)) begin
                       rd_next_state = M3LOCKED;
                   end else if (AR_REQ_MI3 == 1'b1 && ARLOCK_M3 != 2'b10) begin
                       rd_next_state = M3RD;
                   end
                   else begin
                      rd_next_state = M3RWAIT;
                   end
               end
           end	    	    

           M3RWAIT       : begin
              rd_select_v = 1'b0;
              rd_owner = 4'b0000;   
              rd_normal_high = 1'b1;  

              rd_next_state = RDID;
           end	    

           M0LOCKED   : begin
               rd_select_v = 1'b0;
               rd_owner = 4'b0001;
              rd_lock_high = 1'b1;  
              
               if (m0_rd_end == 1'b1 && m0_lock_clear_read == 1'b1 ) begin
               rd_select_v = 1'b1;
                  if ((AR_REQ_MI1 == 1'b1 && ARLOCK_M1 == 2'b10)) begin
                       rd_next_state = M1LOCKED;
                   end else if (AR_REQ_MI1 == 1'b1 && ARLOCK_M1 != 2'b10) begin
                       rd_next_state = M1RD;
                   end else if (( AR_REQ_MI2 == 1'b1 && ARLOCK_M2 == 2'b10)) begin
                       rd_next_state = M2LOCKED;
                   end else if (AR_REQ_MI2 == 1'b1 && ARLOCK_M2 != 2'b10) begin
                       rd_next_state = M2RD;
                   end else if ( (AR_REQ_MI3 == 1'b1 && ARLOCK_M3 == 2'b10)) begin
                       rd_next_state = M3LOCKED;
                   end else if (AR_REQ_MI3 == 1'b1 && ARLOCK_M3 != 2'b10) begin
                       rd_next_state = M3RD;
                   end else if ( (AR_REQ_MI0 == 1'b1 && ARLOCK_M0 == 2'b10)) begin
                       rd_next_state = M0LOCKED;
                   end else if (AR_REQ_MI0 == 1'b1 && ARLOCK_M0 != 2'b10) begin
                       rd_next_state = M0RD;
                   end else begin
                       rd_next_state = RDID;
                   end
               end
           end
           M1LOCKED   : begin
               rd_select_v = 1'b0;
               rd_owner = 4'b0010;
              rd_lock_high = 1'b1;  
               if (m1_rd_end == 1'b1 && m1_lock_clear_read == 1'b1 ) begin
               rd_select_v = 1'b1;
                   if ( (AR_REQ_MI2 == 1'b1 && ARLOCK_M2 == 2'b10)) begin
                       rd_next_state = M2LOCKED;
                   end else if (AR_REQ_MI2 == 1'b1 && ARLOCK_M2 != 2'b10) begin
                       rd_next_state = M2RD;
                   end else if ( (AR_REQ_MI3 == 1'b1 && ARLOCK_M3 == 2'b10)) begin
                       rd_next_state = M3LOCKED;
                   end else if (AR_REQ_MI3 == 1'b1 && ARLOCK_M3 != 2'b10) begin
                       rd_next_state = M3RD;
                   end else if ( (AR_REQ_MI0 == 1'b1 && ARLOCK_M0 == 2'b10)) begin
                       rd_next_state = M0LOCKED;
                   end else if (AR_REQ_MI0 == 1'b1 && ARLOCK_M0 != 2'b10) begin
                       rd_next_state = M0RD;
                   end else if ( (AR_REQ_MI1 == 1'b1 && ARLOCK_M1 == 2'b10)) begin
                       rd_next_state = M1LOCKED;
                   end else if (AR_REQ_MI1 == 1'b1 && ARLOCK_M1 != 2'b10) begin
                       rd_next_state = M1RD;
                   end else begin
                       rd_next_state = RDID;
                   end
               end
           end
           M2LOCKED   : begin
               rd_select_v = 1'b0;
               rd_owner = 4'b0100;
              rd_lock_high = 1'b1;  

               if (m2_rd_end == 1'b1 && m2_lock_clear_read == 1'b1 ) begin
               rd_select_v = 1'b1;
                   if ((AR_REQ_MI3 == 1'b1 && ARLOCK_M3 == 2'b10)) begin
                       rd_next_state = M3LOCKED;
                   end else if (AR_REQ_MI3 == 1'b1 && ARLOCK_M3 != 2'b10) begin
                       rd_next_state = M3RD;
                   end else if ((AR_REQ_MI0 == 1'b1 && ARLOCK_M0 == 2'b10)) begin
                       rd_next_state = M0LOCKED;
                   end else if (AR_REQ_MI0 == 1'b1 && ARLOCK_M0 != 2'b10) begin
                       rd_next_state = M0RD;
                   end else if ( (AR_REQ_MI1 == 1'b1 && ARLOCK_M1 == 2'b10)) begin
                       rd_next_state = M1LOCKED;
                   end else if (AR_REQ_MI1 == 1'b1 && ARLOCK_M1 != 2'b10) begin
                       rd_next_state = M1RD;
                   end else if (( AR_REQ_MI2 == 1'b1 && ARLOCK_M2 == 2'b10)) begin
                       rd_next_state = M2LOCKED;
                   end else if (AR_REQ_MI2 == 1'b1 && ARLOCK_M2 != 2'b10) begin
                       rd_next_state = M2RD;
                   end else begin
                       rd_next_state = RDID;
                   end
               end
           end	    
           M3LOCKED   : begin
               rd_select_v = 1'b0;
               rd_owner = 4'b1000;
              rd_lock_high = 1'b1;  
               if (m3_rd_end == 1'b1 && m3_lock_clear_read == 1'b1 ) begin
               rd_select_v = 1'b1;
                   if ( (AR_REQ_MI0 == 1'b1 && ARLOCK_M0 == 2'b10)) begin
                       rd_next_state = M0LOCKED;
                   end else if (AR_REQ_MI0 == 1'b1 && ARLOCK_M0 != 2'b10) begin
                       rd_next_state = M0RD;
                   end else if ( (AR_REQ_MI1 == 1'b1 && ARLOCK_M1 == 2'b10)) begin
                       rd_next_state = M1LOCKED;
                   end else if (AR_REQ_MI1 == 1'b1 && ARLOCK_M1 != 2'b10) begin
                       rd_next_state = M1RD;
                   end else if ((AR_REQ_MI2 == 1'b1 && ARLOCK_M2 == 2'b10)) begin
                       rd_next_state = M2LOCKED;
                   end else if (AR_REQ_MI2 == 1'b1 && ARLOCK_M2 != 2'b10) begin
                       rd_next_state = M2RD;
                   end else if ( (AR_REQ_MI3 == 1'b1 && ARLOCK_M3 == 2'b10)) begin
                       rd_next_state = M3LOCKED;
                   end else if (AR_REQ_MI3 == 1'b1 && ARLOCK_M3 != 2'b10) begin
                       rd_next_state = M3RD;
                   end else begin
                       rd_next_state = RDID;
                   end
               end
           end	    	    
           default    : begin
               rd_select_v = 1'b0;
               rd_owner = 4'b0001;
               rd_next_state = SLAVE_IDLE;
              rd_lock_high = 1'b0;  
           end
       endcase
   end

   //------------------------------------------------------------------------
   // mx_lock_clear_read: The signals is used to clear/unlock the locked 
   // transactions. Every lock transaction must be followed with last
   // unlock transfer. This signal is asserted when the last unlock transfer
   // is executed.
   //------------------------------------------------------------------------
   always @ (posedge ACLK or negedge aresetn) begin
       if ((!aresetn) || (!sresetn)) begin
           m3_lock_clear_read <= 1'b0;
       end else begin
           if (AR_REQ_MI3 == 1'b1 && ARLOCK_MI3 == 2'b10) begin
               m3_lock_clear_read <= 1'b0;
           end else if (AR_REQ_MI3 == 1'b1 && ARLOCK_MI3 == 2'b00) begin
               m3_lock_clear_read <= 1'b1;
           end
       end
   end

   always @ (posedge ACLK or negedge aresetn) begin
       if ((!aresetn) || (!sresetn)) begin
           m2_lock_clear_read <= 1'b0;
       end else begin
           if (AR_REQ_MI2 == 1'b1 && ARLOCK_MI2 == 2'b10) begin
               m2_lock_clear_read <= 1'b0;
           end else if (AR_REQ_MI2 == 1'b1 && ARLOCK_MI2 == 2'b00) begin
               m2_lock_clear_read <= 1'b1;
           end
       end
   end

   always @ (posedge ACLK or negedge aresetn) begin
       if ((!aresetn) || (!sresetn)) begin
           m1_lock_clear_read <= 1'b0;
       end else begin
           if (AR_REQ_MI1 == 1'b1 && ARLOCK_MI1 == 2'b10) begin
               m1_lock_clear_read <= 1'b0;
           end else if (AR_REQ_MI1 == 1'b1 && ARLOCK_MI1 == 2'b00) begin
               m1_lock_clear_read <= 1'b1;
           end
       end
   end

   always @ (posedge ACLK or negedge aresetn) begin
       if ((!aresetn) || (!sresetn)) begin
           m0_lock_clear_read <= 1'b0;
       end else begin
           if (AR_REQ_MI0 == 1'b1 && ARLOCK_MI0 == 2'b10) begin
               m0_lock_clear_read <= 1'b0;
           end else if (AR_REQ_MI0 == 1'b1 && ARLOCK_MI0 == 2'b00) begin
               m0_lock_clear_read <= 1'b1;
           end
       end
   end


endmodule // RA_ARBITER


   /////////////////////////////////////////////////////////////////////////////
   //                               End - of - Code                           //
   /////////////////////////////////////////////////////////////////////////////
