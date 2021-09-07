// ****************************************************************************/
// Actel Corporation Proprietary and Confidential
// Copyright 2010 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: wa_arbiter.v
//
// Revision Information:
// Date            Description
// ----            -----------------------------------------
// 02Feb11         Inital. Ports and Parameters declaration
//
// SVN Revision Information:
// SVN $Revision: 25450 $
// SVN $Date: 2015-10-04 23:43:43 +0530 (Sun, 04 Oct 2015) $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
// 1. 
//
// ****************************************************************************/
`timescale 1ns/1ps
module axi_WD_ARBITER (
                   // Global signals
                   ACLK
                   ,   ARESETN

                   // From Masters
                   ,  m0_wr_end
                   ,  m1_wr_end
                   ,  m2_wr_end
                   ,  m3_wr_end

                   // AXI MASTER 0 
                   ,   AW_REQ_MI0
                   
                   // AXI MASTER 1 
                   ,   AW_REQ_MI1
                   
                   // AXI MASTER 2 
                   ,   AW_REQ_MI2

                   // AXI MASTER 3 
                   ,   AW_REQ_MI3
                   
                   ,   W_MASGNT_MI

                   ,   slave_out_en  // v3.2
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

    localparam MASTERS  =          4;
    localparam MASTER_0 =          5'b10001;
    localparam MASTER_1 =          5'b10010;
    localparam MASTER_2 =          5'b10100;
    localparam MASTER_3 =          5'b11000;

    localparam SLAVE_IDLE = 4'b0000;
    localparam WRID       = 4'b0001;
    localparam M0WR       = 4'b0010;
    localparam M1WR       = 4'b0011;
    localparam M2WR       = 4'b0100;
    localparam M3WR       = 4'b0101;
    localparam M0WAIT     = 4'b0110;
    localparam M1WAIT     = 4'b0111;
    localparam M2WAIT     = 4'b1000;
    localparam M3WAIT     = 4'b1001;

    localparam M0LOCKED   = 4'b1010;
    localparam M1LOCKED   = 4'b1011;
    localparam M2LOCKED   = 4'b1100;
    localparam M3LOCKED   = 4'b1101;


   //------------------------------------------------------------------------
   // Global signals
   //------------------------------------------------------------------------
   input       ACLK;
   input       ARESETN;


   // AXI MASTER 0 
   input                       AW_REQ_MI0;
   input                       m0_wr_end;

   // AXI MASTER 1 
   input                       AW_REQ_MI1;
   input                       m1_wr_end;    

   // AXI MASTER 2 
   input                       AW_REQ_MI2;
   input                       m2_wr_end;

   // AXI MASTER 3 
   input                       AW_REQ_MI3;
   input                       m3_wr_end;

   output [3:0]                W_MASGNT_MI;
   input                       slave_out_en;  // v3.2

   //------------------------------------------------------------------------
   // Internal signals
   //------------------------------------------------------------------------
   reg                             m0_lock_clear_write;
   reg                             m1_lock_clear_write;
   reg                             m2_lock_clear_write;
   reg                             m3_lock_clear_write;

   reg [3:0]                       wr_curr_state;
   reg [3:0]                       wr_next_state;
   reg                             wr_select_v;

   reg [3:0]                       wr_owner;
   reg [3:0]                       W_MASGNT_MI;
   reg [3:0]                       prev_AW_MASGNT_MI;
   wire                            gnt_change;
   reg                             gnt_change_r;

   reg                             m0_req_inprog;
   reg                             m1_req_inprog;
   reg                             m2_req_inprog;
   reg                             m3_req_inprog;
   
   reg                             wrid_flag;
   
   wire [3:0]                      AW_REQ_MI;
   wire                            aresetn;
   wire                            sresetn;
   reg [3:0]                       AW_MASGNT_MI_int;
   reg [3:0]                       wr_owner_r;
   /////////////////////////////////////////////////////////////////////////////
   //                               Start - of - Code                         //
   /////////////////////////////////////////////////////////////////////////////

   // --------------------------------------------------------------------------
   // resets
   // --------------------------------------------------------------------------
   assign aresetn   = (SYNC_RESET == 1) ? 1'b1  : ARESETN;
   assign sresetn   = (SYNC_RESET == 1) ? ARESETN : 1'b1;

   assign AW_REQ_MI = {AW_REQ_MI3,AW_REQ_MI2,AW_REQ_MI1,AW_REQ_MI0};
   
   //------------------------------------------------------------------------
   // Assign the Master which is granted access in the round-robin algorithm
   // This output is used to pass the selected masters signals to the
   // interconnect
   //------------------------------------------------------------------------

   generate
     if (INP_REG_BUF == 1 && OUT_REG_BUF == 1) begin

   always @ (posedge ACLK or negedge aresetn) begin
      if ((!aresetn) || (!sresetn)) begin
         W_MASGNT_MI <= 'h0;
      end else begin
         W_MASGNT_MI <= wr_owner;
      end
  end

     end 
     endgenerate 
     
     generate 
     if (INP_REG_BUF == 0 && OUT_REG_BUF == 0) begin
    always @ (*) begin
      W_MASGNT_MI <= wr_owner;
    end

     end 
    endgenerate 


   //------------------------------------------------------------------------
   // Write state machine
   //------------------------------------------------------------------------
   always @ (posedge ACLK or negedge aresetn) begin
      if ((!aresetn) || (!sresetn)) begin
         wr_curr_state <= SLAVE_IDLE;
      end else begin
         wr_curr_state <= wr_next_state;
      end
   end
    always @ (posedge ACLK or negedge aresetn) begin
      if ((!aresetn) || (!sresetn)) begin
         wr_owner_r <= 'h0;
      end else begin
         wr_owner_r <= wr_owner;
      end
   end
  
   always @ (*) begin
      wr_select_v = 1'b0;
      wr_owner = 4'b0001;
      wr_next_state = wr_curr_state;
      case (wr_curr_state) 
        SLAVE_IDLE : begin
           wr_select_v = 1'b0;
           wr_owner = (INP_REG_BUF == 0 && OUT_REG_BUF == 0) ? 4'b0000 : W_MASGNT_MI;

           if (AW_REQ_MI0 == 1'b1) begin
              wr_next_state = M0WR;
           end else if (AW_REQ_MI1 == 1'b1) begin
              wr_next_state = M1WR;
           end else if (AW_REQ_MI2 == 1'b1) begin
              wr_next_state = M2WR;
           end else if (AW_REQ_MI3 == 1'b1) begin
              wr_next_state = M3WR;
           end else begin
              wr_next_state = WRID;
           end
        end
        WRID       : begin
           wr_select_v = 1'b1;
           wr_owner = 4'b0000;

           if (AW_REQ_MI0 == 1'b1) begin
              wr_next_state = M0WR;
           end else if (AW_REQ_MI1 == 1'b1) begin
              wr_next_state = M1WR;
           end else if (AW_REQ_MI2 == 1'b1) begin
              wr_next_state = M2WR;
           end else if (AW_REQ_MI3 == 1'b1) begin
              wr_next_state = M3WR;
           end
        end
        M0WR       : begin
           wr_select_v = 1'b1;
           wr_owner = 4'b0001;
           if (m0_wr_end == 1'b1) begin
           if (AW_REQ_MI1 == 1'b1) begin
                 wr_next_state = M1WR;
           end else if (AW_REQ_MI2 == 1'b1) begin
              wr_next_state = M2WR;
           end else if (AW_REQ_MI3 == 1'b1) begin
              wr_next_state = M3WR;
           end else if (AW_REQ_MI0 == 1'b1 && slave_out_en) begin //v3.2
              wr_next_state = M0WR;
              end else begin
                 wr_next_state = WRID;
              end
           end
        end
        M0WAIT       : begin
           wr_select_v = 1'b1;
           wr_owner = wr_owner_r;

              if (AW_REQ_MI2 == 1'b1) begin
                 wr_next_state = M2WR;
              end else if (AW_REQ_MI3 == 1'b1) begin
                 wr_next_state = M3WR;
              end else begin
                 wr_next_state = WRID;
              end

        end
        M1WR       : begin
           wr_select_v = 1'b1;
           wr_owner = 4'b0010;
           if (m1_wr_end == 1'b1) begin
              if (AW_REQ_MI2 == 1'b1) begin
                 wr_next_state = M2WR;
              end else if (AW_REQ_MI3 == 1'b1) begin
                 wr_next_state = M3WR;
           end else if (AW_REQ_MI0 == 1'b1) begin
              wr_next_state = M0WR;
              end else if (AW_REQ_MI1 == 1'b1 && slave_out_en) begin  // v3.2
                 wr_next_state = M1WR;
              end else begin
                 wr_next_state = WRID;
              end
           end
        end
        M1WAIT       : begin
           wr_select_v = 1'b1;
           wr_owner = wr_owner_r;

              if (AW_REQ_MI3 == 1'b1) begin
                 wr_next_state = M3WR;
              end else begin
                 wr_next_state = WRID;
              end

        end
        M2WR       : begin
           wr_select_v = 1'b1;
           wr_owner = 4'b0100;
           if (m2_wr_end == 1'b1) begin
              if (AW_REQ_MI3 == 1'b1) begin
                 wr_next_state = M3WR;
           end else if (AW_REQ_MI0 == 1'b1) begin
              wr_next_state = M0WR;
              end else if (AW_REQ_MI1 == 1'b1) begin
                 wr_next_state = M1WR;
              end else if (AW_REQ_MI2 == 1'b1  && slave_out_en) begin //v3.2
                 wr_next_state = M2WR;
              end else begin
                 wr_next_state = WRID;
              end
           end
        end	   
        M2WAIT       : begin
           wr_select_v = 1'b1;
           wr_owner = wr_owner_r;

           wr_next_state = WRID;
        end	   
        M3WR       : begin
           wr_select_v = 1'b1;
           wr_owner = 4'b1000;
           if (m3_wr_end == 1'b1) begin
            if (AW_REQ_MI0 == 1'b1) begin
              wr_next_state = M0WR;
              end else if (AW_REQ_MI1 == 1'b1) begin
                 wr_next_state = M1WR;
              end else if (AW_REQ_MI2 == 1'b1) begin
                 wr_next_state = M2WR;
              end else if (AW_REQ_MI3 == 1'b1 && slave_out_en) begin //v3.2
                 wr_next_state = M3WR;
              end else begin
                 wr_next_state = WRID;
              end
           end
        end
        default    : begin
           wr_select_v = 1'b0;
           wr_owner = wr_owner_r;
           wr_next_state = SLAVE_IDLE;
        end
      endcase
   end

   always @ (posedge ACLK or negedge aresetn) begin
       if ((!aresetn) || (!sresetn)) begin
          m0_req_inprog <= 'h0;
       end 
       else begin
          if(m0_wr_end == 1'b1) begin
             m0_req_inprog <= 1'b0;
          end
          else if(AW_REQ_MI0 == 1'b1) begin   
             m0_req_inprog <= 1'b1;
          end
       end
   end
   always @ (posedge ACLK or negedge aresetn) begin
       if ((!aresetn) || (!sresetn)) begin
          m1_req_inprog <= 'h0;
       end 
       else begin
          if(m1_wr_end == 1'b1) begin
             m1_req_inprog <= 1'b0;
          end
          else if(AW_REQ_MI1 == 1'b1) begin   
             m1_req_inprog <= 1'b1;
          end
       end
   end
   always @ (posedge ACLK or negedge aresetn) begin
       if ((!aresetn) || (!sresetn)) begin
          m2_req_inprog <= 'h0;
       end 
       else begin
          if(m2_wr_end == 1'b1) begin
             m2_req_inprog <= 1'b0;
          end
          else if(AW_REQ_MI2 == 1'b1) begin   
             m2_req_inprog <= 1'b1;
          end
       end
   end
   always @ (posedge ACLK or negedge aresetn) begin
       if ((!aresetn) || (!sresetn)) begin
          m3_req_inprog <= 'h0;
       end 
       else begin
          if(m3_wr_end == 1'b1) begin
             m3_req_inprog <= 1'b0;
          end
          else if(AW_REQ_MI3 == 1'b1) begin   
             m3_req_inprog <= 1'b1;
          end
       end
   end


// v3.2 - SAR71476
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
        prev_AW_MASGNT_MI     <= 'h0;
        gnt_change_r     <= 'h0;
      end
      else begin
        prev_AW_MASGNT_MI     <= W_MASGNT_MI; 
        gnt_change_r     <= gnt_change;
      end 
  end

// v3.2 - SAR71476
  assign gnt_change = (prev_AW_MASGNT_MI != W_MASGNT_MI & !slave_out_en) ? 1'b1 : ((prev_AW_MASGNT_MI == W_MASGNT_MI & slave_out_en) ? 1'b0 : gnt_change_r);


endmodule // axi_WD_ARBITER


   /////////////////////////////////////////////////////////////////////////////
   //                               End - of - Code                           //
   /////////////////////////////////////////////////////////////////////////////
