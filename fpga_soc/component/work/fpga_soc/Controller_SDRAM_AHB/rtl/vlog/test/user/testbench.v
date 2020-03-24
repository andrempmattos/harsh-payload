// ********************************************************************/
// Actel Corporation Proprietary and Confidential
// Copyright 2009 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: COREAHBSDR USER Testbench
//
//
// SVN Revision Information:
// SVN $Revision: $
// SVN $Date:  $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
//
// *********************************************************************/

`timescale 1ps/1ps

module testbench();

 `include "../../coreparameters.v"
 //`include "../coreparameters.v"

// propagation delay in ns
parameter TPD			= 3000;
reg                             SYSCLK;
reg                             SYSRSTN;

wire                            HREADY;
wire   [1:0]                    HRESP;
wire   [31:0]                   HRDATA;
wire   [1:0]                    HTRANS;
wire   [2:0]                    HSIZE;
wire                            HWRITE;
wire   [31:0]                   HADDR;
wire   [31:0]                   HWDATA;

wire    [SDRAM_DQSIZE-1:0]    DQ;
wire    [SDRAM_DQSIZE-1:0]    DQ_out;                 
reg    [SDRAM_DQSIZE-1:0]    DQ_delayed;                 

//control / data signals to prevent setup/hold errors with memory model
wire    [13:0]   mem_SA;             // SDRAM Clock Enable
wire    [13:0]                mem_SA_out;         // SDRAM Clock Enable
wire                          mem_CAS_N;          // SDRAM Address Bus
wire                          mem_CAS_N_out;          // SDRAM Address Bus
wire                          mem_RAS_N;          // SDRAM Bank Select
wire                          mem_RAS_N_out;          // SDRAM Bank Select
wire                          mem_WE_N;           // SDRAM Chip Select
wire                          mem_WE_N_out;           // SDRAM Chip Select
wire    [1:0]  mem_BA;             // SDRAM RAS Control Signal
wire    [1:0]  mem_BA_out;             // SDRAM RAS Control Signal
wire    [SDRAM_CHIPS-1:0]     mem_CS_N;           // SDRAM CAS Control Signal
wire    [SDRAM_CHIPS-1:0]     mem_CS_N_out;           // SDRAM CAS Control Signal
wire                          mem_CKE;            // SDRAM WE Control Signal
wire                          mem_CKE_out;            // SDRAM WE Control Signal
wire    [SDRAM_DQSIZE/8-1:0]  mem_DQM;            // Local Side Data Mask Input
wire    [SDRAM_DQSIZE/8-1:0]  mem_DQM_out;            // Local Side Data Mask Input


wire				FINISHED;

// AHB master bfm signals
wire	[15:0]				HSEL_ahb_bfm;
wire				        HSEL; 
wire				        HREADYIN; // driving from GP_OUT[0]

initial
begin
    SYSCLK = 1'b0;
    SYSRSTN = 1'b0;

    // Release system reset
    #60000
        SYSRSTN = 1'b1;

	// wait until both BFM's are finished
	while (!(FINISHED===1'b1))
	begin
		@ (posedge SYSCLK); #TPD;
	end
	#1;
	$finish;
end

// SYSCLK signal
always 
begin
    case (SYS_FREQ)
    0:  #7500 SYSCLK <= !SYSCLK;  //15ns / 66MHz
    1:  #7500 SYSCLK <= !SYSCLK;  //15ns / 66MHz
    2:  #15000 SYSCLK <= !SYSCLK;  //30ns / 33MHz
    default:
    begin 
        $display("invalid clock selection");
        $finish;
    end
    endcase
end

// Instantiate module to test
fpga_soc_Controller_SDRAM_AHB_CORESDR_AHB #( 
  // parameters 
        .FAMILY(FAMILY), .SDRAM_DQSIZE(SDRAM_DQSIZE), .SDRAM_CHIPS(SDRAM_CHIPS), .SDRAM_COLBITS(SDRAM_COLBITS), .SDRAM_ROWBITS(SDRAM_ROWBITS), .SDRAM_CHIPBITS(SDRAM_CHIPBITS), .SDRAM_BANKSTATMODULES(SDRAM_BANKSTATMODULES), .AUTO_PCH(AUTO_PCH), .RAS(RAS), .RCD(RCD), .RRD(RRD), .RP(RP), .RC(RC), .RFC(RFC), .WR(WR), .MRD(MRD), .CL(CL), .DELAY(DELAY), .REF(REF), .COLBITS(COLBITS), .ROWBITS(ROWBITS), .REGDIMM(REGDIMM), .SYS_FREQ(SYS_FREQ)) CORESDR_AHB(
    // Clock and Reset interface
    // Inputs
        .HCLK(HCLK),
        .HRESETN(HRESETN),
    // Inputs
        .HADDR(HADDR),
        .HSIZE(HSIZE),
	      .HSEL(HSEL),
        .HTRANS(HTRANS),
        .HWRITE(HWRITE),
        .HWDATA(HWDATA),
        .HREADYIN(HREADYIN),
    // Outputs
        .HRDATA(HRDATA),
        .HRESP(HRESP),
        .HREADY(HREADY),
	      .SDRCLK(SDRCLK),
        .OE(OE),
	      .SA(mem_SA), 
	      .BA(mem_BA), 
	      .CS_N(mem_CS_N), 
        .DQM(mem_DQM), 
	      .CKE(mem_CKE),
	      .RAS_N(mem_RAS_N), 
        .CAS_N(mem_CAS_N), 
	      .WE_N(mem_WE_N), 
	      .DQ(DQ)
          );

//define memory models for SDR
// 16M x 16 double wide, two chip selects

//memory under first chip select
generate 
if (SDRAM_CHIPS > 0)
 begin
   mt48lc16m16a2 mem000      (.Dq(DQ_out[15:0]),
                        .Addr(mem_SA_out[12:0]),
                        .Ba(mem_BA_out),
                        .Clk(SDRCLK),
                        .Cke(mem_CKE_out),
                        .Cs_n(mem_CS_N_out[0]),
                        .Cas_n(mem_CAS_N_out),
                        .Ras_n(mem_RAS_N_out),
                        .We_n(mem_WE_N_out),
                        .Dqm(mem_DQM_out[1:0]));
   if (SDRAM_DQSIZE > 16)
   begin
     mt48lc16m16a2 mem001     (.Dq(DQ_out[31:16]),
                          .Addr(mem_SA_out[12:0]),
                          .Ba(mem_BA_out),
                          .Clk(SDRCLK),
                          .Cke(mem_CKE_out),
                          .Cs_n(mem_CS_N_out[0]),
                          .Cas_n(mem_CAS_N_out),
                          .Ras_n(mem_RAS_N_out),
                          .We_n(mem_WE_N_out),
                          .Dqm(mem_DQM_out[3:2]));
   end
 end
endgenerate

generate 
if (SDRAM_CHIPS > 1)
 begin
   mt48lc16m16a2 mem010     (.Dq(DQ_out[15:0]),
                        .Addr(mem_SA_out[12:0]),
                        .Ba(mem_BA_out),
                        .Clk(SDRCLK),
                        .Cke(mem_CKE_out),
                        .Cs_n(mem_CS_N_out[1]),
                        .Cas_n(mem_CAS_N_out),
                        .Ras_n(mem_RAS_N_out),
                        .We_n(mem_WE_N_out),
                        .Dqm(mem_DQM_out[1:0]));

   if (SDRAM_DQSIZE > 16)
   begin
     mt48lc16m16a2 mem011     (.Dq(DQ_out[31:16]),
                          .Addr(mem_SA_out[12:0]),
                          .Ba(mem_BA_out),
                          .Clk(SDRCLK),
                          .Cke(mem_CKE_out),
                          .Cs_n(mem_CS_N_out[1]),
                          .Cas_n(mem_CAS_N_out),
                          .Ras_n(mem_RAS_N_out),
                          .We_n(mem_WE_N_out),
                          .Dqm(mem_DQM_out[3:2]));
   end
 end
endgenerate
  
//
// Delay commands going to memory devices to simulate a clock-to-out
//   (memory model will report setup/hold errors otherwise).
//
assign #2000 mem_CAS_N_out =    mem_CAS_N;
assign #2000 mem_RAS_N_out =    mem_RAS_N;
assign #2000 mem_WE_N_out =     mem_WE_N;
assign #2000 mem_SA_out =       mem_SA;
assign #2000 mem_BA_out =       mem_BA;
assign #2000 mem_CS_N_out =     mem_CS_N;
assign #2000 mem_CKE_out =      mem_CKE;
assign #2000 mem_DQM_out =      mem_DQM;                   //used for SDR only
assign #2000 DQ_out =           OE ? DQ : 32'bz;      //used for SDR only

assign    DQ = OE ? 32'bz : (REGDIMM? DQ_delayed : DQ_out);

always @(posedge SDRCLK) begin
 DQ_delayed <= DQ_out;  
end




    BFM_AHBL #(
	.VECTFILE("master.vec"),
        // passing testbench parameters to BFM ARGVALUE* parameters
	.ARGVALUE0(FAMILY),
	.ARGVALUE1(1'b1)
) master (
        .SYSCLK(SYSCLK),
        .SYSRSTN(SYSRSTN),
        .HREADY(HREADY),
        .HRESP(HRESP[0]),
        .HRDATA(HRDATA),
        .HCLK(HCLK),
        .HRESETN(HRESETN),
        .HTRANS(HTRANS),
        .HBURST(),
        .HSEL(HSEL_ahb_bfm),
        .HPROT(),
        .HSIZE(HSIZE),
        .HWRITE(HWRITE),
        .HMASTLOCK(HMASTLOCK),
        .HADDR(HADDR),
        .HWDATA(HWDATA),
	.INTERRUPT(256'b0),
	.GP_OUT(),
	.GP_IN(32'b0),
	.EXT_WR(),
	.EXT_RD(),
	.EXT_ADDR(),
	.EXT_DATA(),
	.EXT_WAIT(1'b0),
	.FINISHED(FINISHED),
	.FAILED(FAILED)
    );

   assign HSEL					= HSEL_ahb_bfm[0];
   assign HREADYIN			        = HREADY;

endmodule
