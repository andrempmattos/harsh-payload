// *********************************************************************/ 
// Copyright (c) 2009 Actel Corporation.  All rights reserved.  
// 
// Any use or redistribution in part or in whole must be handled in 
// accordance with the Actel license agreement and must be approved 
// in advance in writing.  
//  
// File : CORESDRAHB.v 
//     
// Description: This module is interfaces with the AHB I/F and Local bus of 
//              SDRAM controller.
//
// Notes:
//   - Fix for SAR 43183 http://bugzilla/show_bug.cgi?id=43183
// *********************************************************************/ 
`timescale 1ns/1ps

module fpga_soc_Controller_SDRAM_AHB_CORESDR_AHB (HCLK, HRESETN, HADDR, HSIZE, HSEL, HTRANS, HWRITE, HWDATA, HREADYIN, HRESP, HRDATA, HREADY, SDRCLK, OE, SA, BA, CS_N, DQM, CKE, RAS_N, CAS_N, WE_N, DQ);

   parameter FAMILY  = 16;
   parameter SYS_FREQ  = 0; // 0=HCLK; 1=2*HCLK; 2=4*HCLK
   parameter SDRAM_RASIZE  = 31;
   parameter SDRAM_CHIPS  = 8;
   parameter SDRAM_COLBITS  = 12;
   parameter SDRAM_ROWBITS  = 14;
   parameter SDRAM_CHIPBITS  = 3;
   parameter SDRAM_BANKSTATMODULES  = 4;
   parameter SDRAM_DQSIZE  = 32;

   parameter [3:0] RAS = 2;                // Minimum ACTIVE to PRECHARGE
   parameter [2:0] RCD = 1;                // Minimum time between ACTIVATE and READ/WRITE
   parameter [1:0] RRD = 1;                // Minimum time between ACTIVATE to ACTIVATE in different banks
   parameter [2:0] RP = 1;                 // Minimum PRECHARGE to ACTIVATE.
   parameter [3:0] RC = 3;                 // Minimum ACTIVATE to ACTIVATE in same bank.
   parameter [3:0] RFC = 10;                // Minimum AUTO-REFRESH to ACTIVATE/AUTO-REFRESH in same bank  
   parameter [1:0] WR = 2;                 // Minimum delay from write to PRECHARGE
   parameter [2:0] MRD = 2;                // Minimum LOADMODE to ACTIVATE command.
   parameter [2:0] CL = 3;                 // Cas latency.
   parameter [15:0] DELAY = 6800;              // Initialization delay
   parameter [15:0] REF = 4096;                // Refresh Period.
   parameter [1:0] ROWBITS = 3;            // # of row bits on sdram device(s)
   parameter [2:0] COLBITS = 7;            // # of column bits on sdram device(s)
   parameter [0:0] REGDIMM = 0;           // Registered/Buffered DIMMS
   parameter [0:0] AUTO_PCH = 0;         // issues read with auto precharge or write with auto precharge

   localparam SDRAM_DQMSIZE  = SDRAM_DQSIZE / 8;
   
   input HCLK; 
   input HRESETN; 
   input HSEL; 
   input HWRITE; 
   input HREADYIN; 
   input[1:0] HTRANS; 
   input[2:0] HSIZE; 
   input[31:0] HWDATA; 
   input[31:0] HADDR; 
   output HREADY; 
   reg HREADY;
   output[1:0] HRESP; 
   reg[1:0] HRESP;
   output[31:0] HRDATA; 
   reg[31:0] HRDATA;

   output SDRCLK; 
   wire SDRCLK;
   output OE; 
   wire OE;
   wire OE_int; // added on june 20th
   output[13:0] SA; 
   wire[13:0] SA;
   output[1:0] BA; 
   wire[1:0] BA;
   output[SDRAM_CHIPS - 1:0] CS_N; 
   wire[SDRAM_CHIPS - 1:0] CS_N;
   output[SDRAM_DQMSIZE - 1:0] DQM; 
   wire[SDRAM_DQMSIZE - 1:0] DQM;
   wire dqm_sdr;
   output CKE; 
   wire CKE;
   output RAS_N; 
   wire RAS_N;
   output CAS_N; 
   wire CAS_N;
   output WE_N; 
   wire WE_N;
   inout[SDRAM_DQSIZE - 1:0] DQ; 
   wire[SDRAM_DQSIZE - 1:0] DQ;

   reg OE_reg;
   reg OE_reg_d;
   reg write_lat_sdr;

   parameter[1:0] IDLE = 0; 
   parameter[1:0] ADDRESS = 1; 

   reg[1:0] current_state; 
   reg[1:0] next_state; 
   reg[3:0] byte_en; 
   reg HSELREG; 
   reg[31:0] HRDATA_IN; 
   reg[31:0] HRDATA_0, HRDATA_1, HRDATA_2, HRDATA_3, HRDATA_4;
   reg[31:0] HRDATA_reg;
   reg[31:0] HWDATA_reg; 
   reg hready_gen; 
   reg[31:0] haddr_reg; 
   reg[31:0] haddr_reg_d; 
   reg HWRITE_reg; 
   reg[2:0] hsize_reg; 
   reg[2:0] hsize_reg_d; 
   reg haddr_sel; 
   reg haddr_nextsel; 
   reg hready_holdlow; 
   wire hready_int; 
   wire valid; // selects valid transfer
   reg valid_reg; // register valid signal
   wire acen; // Enable for address and control registers
   reg acen_reg; // Enable for address and control registers
   wire[31:0] dataout; 
   reg[31:0] datain; 
   // AS: added HWDATA register for case of DQ_SIZE==16 and word-sized AHB write
   reg[31:0] datain_reg;
   reg[31:0] dataout_reg; 
   reg[SDRAM_RASIZE - 1:0] RADDR;
//   wire[SDRAM_RASIZE - 1:0] RADDR; 
   reg R_REQ; 
   reg R_REQ_reg; 
   reg R_REQ_reg0; 
   reg R_REQ_reg1; 
   wire R_REQ_int; 
   reg W_REQ; 
   wire W_REQ_int; 
   reg W_REQ_reg; 
   reg W_REQ_reg0; 
   reg W_REQ_reg1; 
   wire RW_ACK; 
   wire R_VALID; 
   reg R_VALID_reg; 
   reg R_VALID_reg1; 
   reg R_VALID_reg2; 
   reg R_VALID_reg3; 
   wire D_REQ; 
   wire W_VALID; 
   reg W_VALID_reg; 
   reg W_VALID_reg1; 
   reg W_VALID_reg2; 
   reg [SDRAM_DQSIZE - 1:0] DQ_2X;
   reg [SDRAM_DQSIZE - 1:0] DQ_4X;
   wire data_valid;
   wire wdata_valid;
   wire R_REQ_temp;
   reg R_REQ_ahb;
   reg R_REQ_sdr;
   reg W_REQ_int_d1;
   reg W_REQ_int_d2;
   reg flag_read;
   reg flag_write;
   reg   hwrite_ct; // this signals signifies hwrite only when hready is high
   reg   hwrite_flag;
   
   // AS: added B_SIZE register dependent on SDRAM_DQSIZE
   //     and a word select bit for MSB/LSB
   //     HREADY_reg to add another cycle of latency
   wire[3:0] B_SIZE_reg;
   reg word_sel, rword_sel;
   reg HREADY_i;

   // SDR data in
   // AS: use registered datain (datain_reg)
   // assign DQ[SDRAM_DQSIZE-1:0] = (OE == 1'b1) ? datain[SDRAM_DQSIZE-1:0] : {SDRAM_DQSIZE{1'bz}} ;
   assign DQ[SDRAM_DQSIZE-1:0] = (OE == 1'b1) ? datain_reg[SDRAM_DQSIZE-1:0] : {SDRAM_DQSIZE{1'bz}} ;

   // SDR data out for clock 1x
   generate
   if  (SYS_FREQ == 0) 
    begin
      assign dataout[SDRAM_DQSIZE-1:0] = DQ[SDRAM_DQSIZE-1:0] ;
      assign data_valid = R_VALID_reg ;
      assign wdata_valid = W_VALID ;
      assign W_REQ_int = W_REQ ;
      assign R_REQ_int =  R_REQ_sdr & !W_REQ_int_d2;
    end
  endgenerate

  // SDR data out for clock 2x
   generate
   if  (SYS_FREQ == 1) 
    begin
      assign dataout = DQ_2X[SDRAM_DQSIZE-1:0] ;
      assign data_valid =  R_VALID_reg | R_VALID_reg1 ;
      assign wdata_valid = W_VALID | W_VALID_reg;
      assign W_REQ_int = W_REQ_reg1 ;
      assign R_REQ_int =  R_REQ_sdr & !W_REQ_int_d2;
    end
  endgenerate

  // SDR data out for clock 4x
   generate
   if  (SYS_FREQ == 2) 
    begin
      assign dataout = DQ_4X[SDRAM_DQSIZE-1:0] ;
      assign data_valid =  R_VALID_reg | R_VALID_reg1 | R_VALID_reg2 | R_VALID_reg3;
      assign wdata_valid = W_VALID | W_VALID_reg | W_VALID_reg1 | W_VALID_reg2;
      assign W_REQ_int = W_REQ_reg ;
      assign R_REQ_int = R_REQ_sdr & !W_REQ_int_d2; 
    end
  endgenerate

  // Generate clock 1x 
  generate
   if  (SYS_FREQ == 0) 
    begin
      assign SDRCLK = HCLK ;
    end
  endgenerate

  // Generate clock 2x
  generate
   if  (SYS_FREQ == 1) 
    begin
      PLL_2X pll_2x (.POWERDOWN(1'b1), .CLKA(HCLK), .LOCK(), .GLA(SDRCLK));
    end
  endgenerate

  // Generate clock 4x
  generate
   if  (SYS_FREQ == 2) 
    begin
      PLL_4X pll_4x (.POWERDOWN(1'b1), .CLKA(HCLK), .LOCK(), .GLA(SDRCLK));
    end
  endgenerate

   assign DQM[0] = dqm_sdr | (OE & (byte_en[0]) );
   assign DQM[1] = dqm_sdr | (OE & (byte_en[1]) ) ;
   
   // AS: add generate statement for variable DQM size
   // (only 16-bit or 32-bit memories supported... 8-bits do not exist)
   generate
   if (SDRAM_DQSIZE > 16)
   begin
     assign DQM[2] = dqm_sdr | (OE & byte_en[2]) ;
     assign DQM[3] = dqm_sdr | (OE & byte_en[3]) ;
   end
   endgenerate

   // Register HSEL
   always @(posedge HCLK or negedge HRESETN )
    begin 
      if (HRESETN == 1'b0)
       begin
         HSELREG <= 1'b0 ; 
       end
      else 
       begin
         if (HREADYIN == 1'b1)
          begin
            HSELREG <= HSEL ; 
          end 
       end 
    end 

//------------------------------------------------------------------------------
// Valid transfer detection
//------------------------------------------------------------------------------
// Valid AHB transfers only take place when a non-sequential or sequential
//  transfer is shown on HTRANS - an idle or busy transfer should be ignored.
//
   wire valid_read;

   assign valid = ((HSEL == 1'b1) & (HREADYIN == 1'b1) & ((HTRANS == 2'b10) | (HTRANS == 2'b11))) ? 1'b1 : 1'b0 ;
   assign valid_read = ((HSEL == 1'b1) & (HREADYIN == 1'b1) & ((HTRANS == 2'b10) | (HTRANS == 2'b11)) & HWRITE == 1'b0) ? 1'b1 : 1'b0 ;

   reg valid_read_reg;
   always@(posedge HCLK or negedge HRESETN) begin
       if (HRESETN == 1'b0) begin
           valid_read_reg <= 1'b0;
       end else begin
           valid_read_reg <= valid_read;
       end
   end


assign B_SIZE_reg = (SDRAM_DQSIZE > 16)? 4'b0001 : (hsize_reg[2:0] == 3'b010)? 4'b0010 : 4'b0001;

//------------------------------------------------------------------------------
// Halfword selector
//------------------------------------------------------------------------------
generate
if (SDRAM_DQSIZE < 32) // 16
begin
  always@(posedge SDRCLK or negedge HRESETN)
  begin
    if (HRESETN == 1'b0)
      word_sel <= 1'b0;
    else
    begin
      if (OE == 1'b1)
        word_sel <= ~word_sel;
      else
        word_sel <= 1'b0;
    end
  end
end  
else
begin // 32
  always@(*)
  begin
    word_sel <= 1'b0; // unused
  end
end
endgenerate

//------------------------------------------------------------------------------
// Address and control registers
//------------------------------------------------------------------------------
// Registers are used to store the address and control signals from the address
//  phase for use in the data phase of the transfer.
// Only enabled when the HREADYIN input is HIGH and the module is addressed.

   //------------------------------------------------
   // LOGIC GENERATION FOR acen_reg
   // -----------------------------------------------

   reg acen_htrans;

   assign acen = HSEL & HREADYIN;
  
   // Acen_htrans for nonpipe line ahb address
   always@(posedge HCLK or negedge HRESETN) begin
      if (HRESETN == 1'b0) begin
          acen_htrans <= 1'b0;
      end else begin
          if (HREADY == 1'b1 && (HTRANS == 2'b10 || HTRANS == 2'b11)) begin
            acen_htrans <= 1'b1;
          end else if (HREADY == 1'b1 && !(HTRANS == 2'b10 || HTRANS == 2'b11))begin
            acen_htrans <= 1'b0;
          end 
      end
   end

   //------------------------------------------------
   // LOGIC GENRATION FOR HADDR_REG_D
   // -----------------------------------------------
   
   always @(posedge HCLK or negedge HRESETN ) begin
       if ( HRESETN == 1'b0) begin
         haddr_reg_d <= {32{1'b0}};
         hsize_reg_d <= {2{1'b0}};
       end else begin
          if (HREADY == 1'b1 ) begin
            haddr_reg_d <= haddr_reg;
            hsize_reg_d <= hsize_reg;
          end
       end
   end

   reg [31:0] HWDATA_reg_d;
   reg HWRITE_reg_d;

   // Register HADDR, HWDATA, HTRANS, HWRITE and HSIZE
   always @(posedge HCLK or negedge HRESETN )
    begin 
      if (HRESETN == 1'b0)
      begin
         haddr_reg <= 32'b0 ; 
         HWDATA_reg <= 32'b0 ;
         HWDATA_reg_d <= 32'b0 ; 
         HWRITE_reg <= 1'b0 ; 
         HWRITE_reg_d <= 1'b0 ; 
         hsize_reg <= 3'b0 ; 
         valid_reg <= 1'b0;
      end
      else 
      begin 
         valid_reg <= valid; // register valid signal
         if (acen == 1'b1) // added on 25th june-14 
         begin
           haddr_reg <= HADDR ; 
           HWRITE_reg <= HWRITE ;
           HWRITE_reg_d <= HWRITE_reg;
           hsize_reg <= HSIZE ; 
         end 
         // AS: register data after data ready
         if (HWRITE_reg == 1'b1 && HREADY == 1'b1) begin
           HWDATA_reg <= HWDATA;
           HWDATA_reg_d <= HWDATA_reg;
         end
      end 
    end 

    reg [31:0] hready_counter;

    // Counter for number of hready.
    always@(posedge HCLK or negedge HRESETN)  begin
        if (HRESETN == 1'b0) begin
          hready_counter <= {31{1'b0}};   
        end else begin
            if (HWRITE == 1'b1 && HREADY == 1'b1 ) begin
                hready_counter <= hready_counter + 1'b1;
            end else if ( (HWRITE == 1'b0 && HREADY == 1'b1) || (acen_htrans == 1'b0 && !W_REQ_int)) begin
                hready_counter <= {31{1'b0}};
            end 
        end
    end


// This signal is used to generate hready_int which is sent out to AHB
// interface
   always @(posedge HCLK or negedge HRESETN )
    begin 
      if (HRESETN == 1'b0)
       begin
         hready_gen <= 1'b1 ; 
       end
      else 
       begin
         if (HWRITE == 1'b1) begin
            if (hready_counter == 'h0 && flag_read == 1'b0 && flag_write == 1'b0) begin
                hready_gen <= 1'b1;
            end else if (wdata_valid == 1'b1 && flag_read == 1'b0) begin
                hready_gen <= 1'b1;
            end else begin
                hready_gen <= 1'b0 ;
            end
         end else if (HWRITE == 1'b0) begin
              if (hready_counter != 'h0) begin
                  if (wdata_valid == 1'b1) begin
                      hready_gen <= 1'b1;
                  end else begin
                      hready_gen <= 1'b0;
                  end
              end else if (((data_valid == 1'b1)) | ((HSEL == 1'b1) & (HREADYIN == 1'b1) & (HTRANS == 2'b00))) begin
                  hready_gen <= 1'b1 ;
              end else if (wdata_valid == 1'b1 && flag_read == 1'b0)begin
                  hready_gen <= 1'b1 ;
              end else begin
                  hready_gen <= 1'b0 ;
              end
          end else begin 
                  hready_gen <= 1'b0 ;
          end
      end 
    end

// Generate hready_int which is used in the generation of HREADY
  // assign hready_int = (hready_holdlow == 1'b1) ? 1'b0 : hready_gen ;
   assign hready_int =  hready_gen ;

// Generate HREADY which is sent out to AHB interface
   always @(*)
    begin 
      HREADY = 1'b1 ; 
      HRESP = 2'b0 ; 
      HRDATA = 32'b0 ; 
      if (HSELREG == 1'b1)
      begin
        HREADY = hready_int ; 
        HRDATA = HRDATA_reg ; 
      end
    end 

//  Generate datain which is input data to the SDRAM
  generate
  if (SDRAM_DQSIZE > 16)
  begin
   always @(*)
    begin 
      datain = 32'b0 ; 
      if ((HSELREG == 1'b1) & (HWRITE_reg_d == 1'b1)) // using registered version to sync with haddr_reg_d
       begin
         datain = HWDATA_reg[31:0] ; // changed to hwdata_reg on july14th 
       end
    end 
  end
  else
  begin
    // AS: added this block for mux'ing write data properly
    // SDRAM_DQSIZE = 16
    begin 
      always @(*)
      begin
        datain = 32'b0 ; 
        if ((HSELREG == 1'b1) & (HWRITE_reg_d == 1'b1))
         begin
           case (hsize_reg[2:0])
            3'b000: // byte (same as word, below)
              if (haddr_reg_d[1] == 1'b0) // added on 25th june 14
                datain[SDRAM_DQSIZE-1:0] = HWDATA_reg[SDRAM_DQSIZE-1:0] ; // changed to hwdata_reg on july14th 
              else
                datain[SDRAM_DQSIZE-1:0] = HWDATA_reg[31:SDRAM_DQSIZE]; 
            3'b001: // halfword
              if(haddr_reg_d[1] == 1'b0)
                datain[SDRAM_DQSIZE-1:0] = HWDATA_reg[SDRAM_DQSIZE-1:0]; 
              else
                datain[SDRAM_DQSIZE-1:0] = HWDATA_reg[31:SDRAM_DQSIZE]; 
            3'b010: // word
              if (word_sel == 1'b0)
                datain[SDRAM_DQSIZE-1:0] = HWDATA_reg[SDRAM_DQSIZE-1:0]; 
              else
                datain[SDRAM_DQSIZE-1:0] = HWDATA_reg[31:SDRAM_DQSIZE]; 
           endcase
         end
       end
    end
  end
  endgenerate
  
// AS: added block to register datain to datain_reg
//     - modified to run on SDRCLK so input data isn't missed
always@ (posedge SDRCLK or negedge HRESETN)
begin
  if (HRESETN == 1'b0)
  begin
    datain_reg <= 32'h00000000;
  end
  else
  begin
    if ((HSELREG == 1'b1) & (HWRITE_reg_d == 1'b1))
      datain_reg <= datain;
    else
      datain_reg <= datain_reg;
  end
end
  
//  State machine comb. logic. This state machine controls hready and
//  read/write data from/to SDRAM
   always @(*)
   begin 
      haddr_nextsel = 1'b1 ; 
      hready_holdlow = 1'b0 ; 
      case (current_state)
         IDLE :
                  begin
                    next_state = IDLE ; 
                    if (valid == 1'b1)
                     begin
                        next_state = ADDRESS ; 
                     end
                  end
         ADDRESS :
                  begin
                    hready_holdlow = 1'b1 ; 
                    next_state = IDLE ; 
                  end
	default :
                  begin
                    next_state = IDLE ; 
                  end
      endcase 
   end 

// Register state machine's state logic 
   always @(posedge HCLK or negedge HRESETN)
    begin 
      if (HRESETN == 1'b0)
       begin
         current_state <= IDLE ; 
         haddr_sel <= 1'b0 ; 
       end
      else 
       begin
         current_state <= next_state ; 
         haddr_sel <= haddr_nextsel ; 
       end 
    end

 // Generate address for the SDR controller
 // AS: added mux to ensure correct address alignment 
 // for byte/halfword/word
 
 reg [SDRAM_RASIZE-1 : 0] raddr_sdr;

 // synchronizer fo RADDR
 always@(posedge SDRCLK or negedge HRESETN) begin
     if (HRESETN == 1'b0) begin
         raddr_sdr <= {SDRAM_RASIZE{1'b0}};
     end else begin
         raddr_sdr <= RADDR;
     end
 end

  generate
  if (SDRAM_DQSIZE > 16)
  begin
    always@(*)
      if (flag_write == 1'b0) begin
        RADDR = ({haddr_reg[30:2], 2'b00});
      end  else begin
        RADDR = ({haddr_reg_d[30:2], 2'b00});
      end
  end
  else
  begin
    always@(*)
    begin
        if ( flag_write == 1'b0 ) begin
           case (hsize_reg[2:0])
            3'b000 :   // for byte size
              RADDR <= ({1'b0, haddr_reg[SDRAM_RASIZE-1:1]}) ; // changed to haddr_reg from haddr_reg_d
            3'b001 :   // for half word
              RADDR <= ({1'b0, haddr_reg[SDRAM_RASIZE-1:1]}) ;
            3'b010 :   // for word
              RADDR <= ({haddr_reg[SDRAM_RASIZE-1:2], 1'b0}) ;
            default:
              RADDR <= ({1'b0, haddr_reg[SDRAM_RASIZE-1:1]}) ;
           endcase
        end else begin
          case (hsize_reg[2:0])
            3'b000 :   // for byte size
              RADDR <= ({1'b0, haddr_reg_d[SDRAM_RASIZE-1:1]}) ; // changed to haddr_reg from haddr_reg_d
            3'b001 :   // for half word
              RADDR <= ({1'b0, haddr_reg_d[SDRAM_RASIZE-1:1]}) ;
            3'b010 :   // for word
              RADDR <= ({haddr_reg_d[SDRAM_RASIZE-1:2], 1'b0}) ;
            default:
              RADDR <= ({1'b0, haddr_reg_d[SDRAM_RASIZE-1:1]}) ;
          endcase
        end
    end
  end
  endgenerate

 always@(*) begin // working code
   hwrite_ct = 1'b0;
   if( HREADY == 1'b1 ) begin
       hwrite_ct = HWRITE_reg;
   end
 end

  reg  hwrite_ct_read;
  always@(*) begin
    hwrite_ct_read = 1'b0;
    if (HWRITE_reg == 1'b0 && valid == 1'b1) begin
        hwrite_ct_read = 1'b1;
    end
  end

  // Logic generation for flag_read indicates pending read is not addressed 
  always@ (posedge HCLK or negedge HRESETN) begin
      if (HRESETN == 1'b0) begin
          flag_read <= 1'b0;
      end else begin
          if (flag_read == 1'b1 && (data_valid == 1'b1)) begin
              flag_read <= 1'b0;
          end else if (HSEL == 1'b1 && HWRITE == 1'b0 && HREADY == 1'b1 && (HTRANS == 2'b10 || HTRANS == 2'b11)) begin
              flag_read <= 1'b1;
          end 
      end
  end

  reg [3:0]  write_cnt;
  // counter for number of writes to be addressed 
  always@ (posedge HCLK or negedge HRESETN) begin
      if (HRESETN == 1'b0 ) begin
          write_cnt <= {4{1'b0}};
      end else begin
          if (HWRITE == 1'b1 && HREADY == 1'b1 && ( HTRANS == 2'b10 || HTRANS == 2'b11)) begin
             write_cnt <= write_cnt + 1'b1;
          end else if (wdata_valid == 1'b1 && write_cnt != 0) begin
             write_cnt <= write_cnt - 1'b1;
          end
      end
  end

  always @(*) begin
      flag_write = 1'b0;
      if (write_cnt != 4'h0) begin
          flag_write = 1'b1;
      end else begin
          flag_write = 1'b0;
      end
  end
 
  always@ (posedge HCLK or negedge HRESETN) begin
      if (HRESETN == 1'b0) begin
        hwrite_flag <= 1'b0;
      end else begin
          if (hwrite_flag == 1'b1 && HREADY == 1'b1 && !(HTRANS == 2'b10 || HTRANS == 2'b11) ) begin
              hwrite_flag <= 1'b0;
          end else if (HWRITE == 1'b1 && HREADY == 1'b1 && ( HTRANS == 2'b10 || HTRANS == 2'b11) ) begin
              hwrite_flag <= 1'b1;
          end
      end
  end
 
  // Generate write and read request to SDR
   always @(posedge SDRCLK or negedge HRESETN )
    begin 
      if (HRESETN == 1'b0)
       begin
         R_REQ <= 1'b0 ; 
         R_REQ_reg <= 1'b0 ; 
         R_REQ_reg0 <= 1'b0 ; 
         R_REQ_reg1 <= 1'b0 ; 
         W_REQ <= 1'b0 ; 
         W_REQ_reg <= 1'b0 ; 
         W_REQ_reg0 <= 1'b0 ; 
         W_REQ_reg1 <= 1'b0 ;
       end
      else 
       begin
         W_REQ_reg0 <= W_REQ ; 
         W_REQ_reg1 <= W_REQ_reg0 ; 
         W_REQ_reg <= W_REQ_reg1 ; 
         R_REQ_reg0 <= R_REQ; 
         R_REQ_reg1 <= R_REQ_reg0 ; 
         R_REQ_reg <= R_REQ_reg1 ; 
         if (RW_ACK == 1'b1)
          begin
            //Clear all request signals on RW_ACK
            W_REQ_reg0 <= 1'b0 ; 
            W_REQ_reg1 <= 1'b0 ; 
            W_REQ_reg <= 1'b0 ; 
            R_REQ_reg <= 1'b0 ; 
            R_REQ_reg0 <= 1'b0 ; 
            R_REQ_reg1 <= 1'b0 ; 
            R_REQ <= 1'b0 ; 
            W_REQ <= 1'b0 ; 
          end
         else if (hwrite_ct == 1'b1 && acen_htrans == 1'b1)
          begin
            R_REQ <= 1'b0; //~hwrite_flag ; 
            W_REQ <= 1'b1; //hwrite_flag ; 
        end else if (valid_read_reg == 1'b1) begin
            R_REQ <= 1'b1;
        end
       end 
    end 

    always@(posedge SDRCLK or negedge HRESETN) begin
        if (HRESETN == 1'b0) begin
            W_REQ_int_d1 <= 1'b0;
            W_REQ_int_d2 <= 1'b0;
        end else begin
            W_REQ_int_d1 <= W_REQ_int;
            W_REQ_int_d2 <= W_REQ_int_d1;
        end 
    end


    always@(posedge SDRCLK or negedge HRESETN) begin
        if (HRESETN == 1'b0) begin
            R_REQ_sdr <= 1'b0;
        end else if (RW_ACK == 1'b1 && W_REQ_int_d2 == 1'b0 )begin
            R_REQ_sdr <= 1'b0;
        end else if (R_REQ_ahb == 1'b1) begin
            R_REQ_sdr <= 1'b1;
        end 
    end

    always@(posedge HCLK or negedge HRESETN) begin
        if (HRESETN == 1'b0) begin
            R_REQ_ahb <= 1'b0;
        end else begin
            if (valid_read_reg == 1'b1) begin
                R_REQ_ahb <= 1'b1;
            end else begin
                R_REQ_ahb <= 1'b0;
            end
        end
    end

// Generate data valid for both read and write data 
   always @(posedge SDRCLK or negedge HRESETN )
    begin 
      if (HRESETN == 1'b0)
       begin
         R_VALID_reg3 <= 1'b0 ; 
         R_VALID_reg2 <= 1'b0 ; 
         R_VALID_reg1 <= 1'b0 ; 
         R_VALID_reg <= 1'b0 ; 
         W_VALID_reg2 <= 1'b0 ; 
         W_VALID_reg1 <= 1'b0 ; 
         W_VALID_reg <= 1'b0 ; 
         DQ_2X <= 1'b0 ; 
         DQ_4X <= 1'b0 ; 
       end
      else 
       begin
         R_VALID_reg <= R_VALID ; 
         R_VALID_reg1 <= R_VALID_reg ; 
         R_VALID_reg2 <= R_VALID_reg1 ; 
         R_VALID_reg3 <= R_VALID_reg2 ; 
         W_VALID_reg <= W_VALID ; 
         W_VALID_reg1 <= W_VALID_reg ; 
         W_VALID_reg2 <= W_VALID_reg1 ; 
         DQ_2X <= DQ ; 
         DQ_4X <= DQ ; 
       end 
    end 

// Register output data from SDRAM
// AS: modified registering of data for SDRAM_DQSIZE = 16
generate
if (SDRAM_DQSIZE > 16)
begin
  always @(posedge SDRCLK or negedge HRESETN )
  begin 
    if (HRESETN == 1'b0)
    begin
      dataout_reg <= 32'b0 ; 
    end
    else 
    begin
      if (SYS_FREQ == 0)
      begin
        if (R_VALID == 1'b1)
        begin
            dataout_reg <= dataout[31:0] ;
        end 
      end 
      else 
      begin
        if (data_valid == 1'b1)
        begin
          dataout_reg <= dataout[31:0] ; 
        end 
      end 
    end 
  end 
end
else
begin
  always @(posedge SDRCLK or negedge HRESETN )
  begin 
    if (HRESETN == 1'b0)
    begin
      dataout_reg <= 32'b0 ; 
      rword_sel <= 1'b0;
    end
    else 
    begin
      if (SYS_FREQ == 0)
      begin
        if (R_VALID == 1'b1)
        begin
          rword_sel <= ~rword_sel;
          if (rword_sel == 1'b0)
            dataout_reg[15:0] <= dataout[15:0] ;
          else
            dataout_reg[31:16] <= dataout[15:0] ;
        end 
        else
          rword_sel <= 1'b0;
      end 
      else 
      begin
        if (data_valid == 1'b1)
        begin
          rword_sel <= ~rword_sel;
          if (rword_sel == 1'b0)
            dataout_reg[15:0] <= dataout[15:0] ;
          else
            dataout_reg[31:16] <= dataout[15:0] ;
        end
        else
          rword_sel <= 1'b0;
      end 
    end 
  end 
end
endgenerate

// AS: modified AHB read data mux'ing for SDRAM_DQSIZE==16
// Transfer SDRAM output data to local register based on size
   always @(*)
    begin 
      HRDATA_IN = 32'b0 ; 
      if (OE == 1'b0)
      begin
         case (hsize_reg)
            3'b000 :   // for byte size
                     begin
                        case (haddr_reg[1:0])
                           2'b00 :
                                    begin
                                       HRDATA_IN = ({dataout_reg[7:0], dataout_reg[7:0], dataout_reg[7:0], dataout_reg[7:0]}) ; 
                                    end
                           2'b01 :
                                    begin
                                       HRDATA_IN = ({dataout_reg[15:8], dataout_reg[15:8], dataout_reg[15:8], dataout_reg[15:8]}) ; 
                                    end
                           2'b10 :
                                    begin
                                       if (SDRAM_DQSIZE > 16)
                                        HRDATA_IN = ({dataout_reg[23:16], dataout_reg[23:16], dataout_reg[23:16], dataout_reg[23:16]}) ; 
                                       else
                                        HRDATA_IN = ({dataout_reg[7:0], dataout_reg[7:0], dataout_reg[7:0], dataout_reg[7:0]}) ; 
                                    end
                           2'b11 :
                                    begin
                                       if (SDRAM_DQSIZE > 16)
                                        HRDATA_IN = ({dataout_reg[31:24], dataout_reg[31:24], dataout_reg[31:24], dataout_reg[31:24]}) ; 
                                       else
                                        HRDATA_IN = ({dataout_reg[15:8], dataout_reg[15:8], dataout_reg[15:8], dataout_reg[15:8]}) ; 
                                    end
                           default :
                                    begin
                                       HRDATA_IN = dataout_reg[31:0] ; 
                                    end
                        endcase 
                     end
            3'b001 :  // for half word
                     begin
                        case (haddr_reg[1])
                           1'b0 :
                                    begin
                                       HRDATA_IN = ({dataout_reg[15:0], dataout_reg[15:0]}) ; 
                                    end
                           1'b1 :
                                    begin
                                       if (SDRAM_DQSIZE > 16)
                                        HRDATA_IN = ({dataout_reg[31:16], dataout_reg[31:16]}) ;
                                       else
                                        HRDATA_IN = ({dataout_reg[15:0], dataout_reg[15:0]}) ; 
                                    end
                           default :
                                    begin
                                       HRDATA_IN = dataout_reg[31:0] ; 
                                    end
                        endcase 
                     end
            3'b010 :  // for word
                     begin
                        HRDATA_IN = dataout_reg[31:0] ; 
                     end
            default :
                     begin
                        HRDATA_IN = dataout_reg[31:0] ; 
                     end
         endcase 
      end
   end 

   // Register Read data 
   // AS: added 3 more registers for SYS_FREQ = 1,2
   always @(posedge SDRCLK or negedge HRESETN )
    begin 
      if (HRESETN == 1'b0)
       begin
         HRDATA_reg <= 32'h00000000;
         HRDATA_0 <= 32'h00000000;
         HRDATA_1 <= 32'h00000000;
         HRDATA_2 <= 32'h00000000;
         HRDATA_3 <= 32'h00000000;
         HRDATA_4 <= 32'h00000000;
       end
      else 
       begin
         if (SYS_FREQ == 0)
         begin
          HRDATA_reg <= HRDATA_IN ; 
         end
         else if (SYS_FREQ == 1)
         begin
          if (( (B_SIZE_reg == 4'b0001) && (CL != 3) ) || ( (B_SIZE_reg == 4'b0010) && (CL == 3) ))
          begin
            if (data_valid == 1'b1) begin
              HRDATA_reg <= HRDATA_IN;
            end else begin
              HRDATA_reg <= HRDATA_reg;
            end
          end
          else
          begin
            if (data_valid == 1'b1) begin
              HRDATA_reg <= HRDATA_IN;
            end else begin
              HRDATA_reg <= HRDATA_reg;
            end
          end
         end
         else // SYS_FREQ == 2
         begin
          if (B_SIZE_reg == 4'b0001)
          begin
            HRDATA_0 <= HRDATA_IN; 
            HRDATA_1 <= HRDATA_0;
            HRDATA_2 <= HRDATA_1;
            HRDATA_3 <= HRDATA_2;
            HRDATA_4 <= HRDATA_3;
            
            // AS:  to account for precharge timing when crossing
            //      page boundaries
            if (data_valid == 1'b1)
              HRDATA_reg <= HRDATA_1;
            else
              HRDATA_reg <= HRDATA_reg;
          end
          else
          begin
            HRDATA_0 <= HRDATA_IN; 
            HRDATA_1 <= HRDATA_0;
            HRDATA_2 <= HRDATA_1;
            HRDATA_3 <= HRDATA_2;
            HRDATA_4 <= HRDATA_3;
            
            // AS: to account for precharge timing for single burst trans
            if (data_valid == 1'b1)
            begin
              HRDATA_reg <= HRDATA_1;
            end
            else
              HRDATA_reg <= HRDATA_reg;
          end
         end
       end 
    end 

generate
if (SDRAM_DQSIZE > 16)
begin
  // Enable the byte lanes for bytes, half word and word
  always @(*)
  begin 
    byte_en = 4'b1111 ; 
    if (OE == 1'b1)
    begin
     case (hsize_reg_d)
        3'b000 : // for byte size
                 begin
                    case (haddr_reg_d[1:0])
                       2'b00 :
                                begin
                                   byte_en = 4'b1110 ; // Byte0 enabled
                                end
                       2'b01 :
                                begin
                                   byte_en = 4'b1101 ; // Byte1 enabled
                                end
                       2'b10 :
                                begin
                                   byte_en = 4'b1011 ; // Byte2 enabled
                                end
                       2'b11 :
                                begin
                                   byte_en = 4'b0111 ; // Byte3 enabled
                                end
                       default :
                                begin
                                   byte_en = 4'b1111 ; // None of the byte lanes are enabled
                                end
                    endcase 
                 end
        3'b001 :  // for half word
                 begin
                    case (haddr_reg_d[1])
                       1'b0 :
                                begin
                                   byte_en = 4'b1100 ; // lower half bytes are enabled 
                                end
                       1'b1 :
                                begin
                                   byte_en = 4'b0011 ;  // upper half bytes are enabled
                                end
                       default :
                                begin
                                   byte_en = 4'b1111 ; // None of the byte lanes are enabled
                                end
                    endcase 
                 end
        3'b010 : // for word
                 begin
                    byte_en = 4'b0000 ; // all the byte lanes are enabled
                 end
        default :
                 begin
                    byte_en = 4'b1111 ; // all the byte lanes are disabled
                 end
     endcase 
    end
  end
end
    else
    begin
      // ------------------------------------------------------------------
      // AS: added another block for byte_en generation for SDRAM_DQSIZE=16
      // ------------------------------------------------------------------
      always @(*)
      begin 
        byte_en = 4'b1111 ; 
        if (OE == 1'b1)
         begin
           case (hsize_reg_d)
              3'b000 : // for byte size
                       begin
                          case (haddr_reg_d[1:0])
                             2'b00 :
                                      begin
                                         byte_en = 4'b1110 ; // Byte0 enabled
                                      end
                             2'b01 :
                                      begin
                                         byte_en = 4'b1101 ; // Byte1 enabled
                                      end
                             2'b10 :
                                      begin
                                         byte_en = 4'b1110 ; // Byte0 enabled
                                      end
                             2'b11 :
                                      begin
                                         byte_en = 4'b1101 ; // Byte1 enabled
                                      end
                             default :
                                      begin
                                         byte_en = 4'b1111 ; // None of the byte lanes are enabled
                                      end
                          endcase 
                       end
              3'b001 :  // for half word
                       begin
  
                         byte_en = 4'b1100 ; // lower half bytes are enabled (always)

                       end
              3'b010 : // for word
                       begin
                          byte_en = 4'b0000 ; // all the byte lanes are enabled
                       end
              default :
                       begin
                          byte_en = 4'b1111 ; // all the byte lanes are disabled
                       end
           endcase 
         end
    end
  end
  endgenerate


 // Instantiation SDR controller top level
   sdr_CORESDR #(.SDRAM_RASIZE(SDRAM_RASIZE), .SDRAM_CHIPS(SDRAM_CHIPS), .SDRAM_COLBITS(SDRAM_COLBITS), .SDRAM_ROWBITS(SDRAM_ROWBITS), .SDRAM_CHIPBITS(SDRAM_CHIPBITS), .SDRAM_BANKSTATMODULES(SDRAM_BANKSTATMODULES)) CoreSDR_0(
      .CLK(SDRCLK), 
      .RESET_N(HRESETN), 
      .RADDR(raddr_sdr), 
      .B_SIZE(B_SIZE_reg), // AS: changed to burst-of 2
      //.B_SIZE(4'b0001), // fixed to single transfer
      .R_REQ(R_REQ_int), 
      .W_REQ(W_REQ_int), 
      .AUTO_PCH(AUTO_PCH), 
      .RW_ACK(RW_ACK), 
      .D_REQ(D_REQ), 
      .W_VALID(W_VALID), 
      .R_VALID(R_VALID), 
      .SD_INIT(1'b0), 
      .RAS(RAS), 
      .RCD(RCD), 
      .RRD(RRD), 
      .RP(RP), 
      .RC(RC), 
      .RFC(RFC), 
      .MRD(MRD), 
      .CL(CL), 
      .BL(2'b1), 
      .WR(WR), 
      .DELAY(DELAY), 
      .REF(REF), 
      .COLBITS(COLBITS), 
      .ROWBITS(ROWBITS), 
      .REGDIMM(REGDIMM), 
      .SA(SA), 
      .BA(BA), 
      .CS_N(CS_N), 
      .CKE(CKE), 
      .RAS_N(RAS_N), 
      .CAS_N(CAS_N), 
      .WE_N(WE_N), 
      .OE(OE), 
      .DQM(dqm_sdr)
   ); 

endmodule
