// *********************************************************************/ 
// Copyright (c) 2009 Actel Corporation.  All rights reserved.  
// 
// Any use or redistribution in part or in whole must be handled in 
// accordance with the Actel license agreement and must be approved 
// in advance in writing.  
//  
// File : CORESDR.v 
//     
// Description: This module is the top level module for the Local bus version of the
//              SDRAM controller.
//
// Notes:
//
// *********************************************************************/ 
`timescale 1ps / 1ps
module sdr_CORESDR(
        CLK,
        RESET_N,
        RADDR,
        R_REQ,
        W_REQ,
        B_SIZE,
        AUTO_PCH,
        SD_INIT,
        RAS,
        RCD,
        RRD,
        RP,
        RC,
        RFC,
        WR,
        MRD,
        CL,
        BL,
        DELAY,
        REF,
        COLBITS,
        ROWBITS,
        REGDIMM,
        RW_ACK,
        R_VALID,
        D_REQ,
        W_VALID,
        OE,
        SA,
        BA,
        CS_N,
        DQM,
        CKE,
        RAS_N,
        CAS_N,
        WE_N
        );

        parameter       FAMILY = 16; // DEVICE FAMILY
	parameter	SDRAM_RASIZE			= 31;
	parameter	SDRAM_CHIPS				= 8;
	parameter	SDRAM_COLBITS         	= 12;
	parameter	SDRAM_ROWBITS         	= 14;
	parameter	SDRAM_CHIPBITS        	= 3;
        parameter       SDRAM_BANKSTATMODULES   = 4;



input                           CLK;                    // System Clock
input                           RESET_N;                // System Reset
input   [SDRAM_RASIZE-1:0]      RADDR;                  // Memory Address to read/write
input                           R_REQ;                  // Read Request
input                           W_REQ;                  // Write Request
input   [3:0]                   B_SIZE;                 // Burst Size
input                           AUTO_PCH;               // Autoprecharge
input                           SD_INIT;                // Sdram init control
input   [3:0]                   RAS;                    // Minimum ACTIVE to PRECHARGE
input   [2:0]                   RCD;                    // Minimum time between ACTIVATE and READ/WRITE
input   [1:0]                   RRD;                    // Minimum time between ACTIVATE to ACTIVATE in different banks
input   [2:0]                   RP;                     // Minimum PRECHARGE to ACTIVATE.
input   [3:0]                   RC;                     // Minimum ACTIVATE to ACTIVATE in same bank.
input   [3:0]                   RFC;                    // Minimum AUTO-REFRESH to ACTIVATE/AUTO-REFRESH in same bank  
input   [1:0]                   WR;                     // Minimum write to precharge
input   [2:0]                   MRD;                    // Minimum LOADMODE to ACTIVATE command.
input   [2:0]                   CL;                     // Cas latency.
input   [1:0]                   BL;                     // Burst length 0=1 1=2 2=4 3=8.
input   [15:0]                  REF;                    // Refresh period
input   [15:0]                  DELAY;                  // Initialization delay
input   [2:0]                   COLBITS;                // Column bits setting (encoded)
input   [1:0]                   ROWBITS;                // Row bits setting (encoded)
input                           REGDIMM;                // Registered dimm selection, 0=non-reg 1=reg

output                          RW_ACK;                 // Read/Write Acknowledge
output                          R_VALID;                // Read Data Valid
output                          D_REQ;                  // Data Request
output                          W_VALID;                // Write Data Valid
output                          OE;                     // Data output enable
output  [13:0]                  SA;                     // SDRAM Address Bus
output  [1:0]                   BA;                     // SDRAM Bank Select
output  [SDRAM_CHIPS-1:0]       CS_N;                   // SDRAM Chip Select
output                          DQM;                    // DQM asserted during init and write burst terminate
output                          CKE;                    // SDRAM Clock Enable
output                          RAS_N;                  // SDRAM RAS Control Signal
output                          CAS_N;                  // SDRAM CAS Control Signal
output                          WE_N;                   // SDRAM WE Control Signal

reg     [13:0]                  SA;
reg     [1:0]                   BA;
reg     [SDRAM_CHIPS-1:0]       CS_N;
reg                             DQM;
reg                             CKE;
reg                             RAS_N;
reg                             CAS_N;
reg                             WE_N;
reg                             RW_ACK;
reg                             R_VALID;
reg                             D_REQ;
reg                             W_VALID;

wire    [SDRAM_RASIZE-1:0]      IRADDR;
reg                             IR_REQ;
reg                             IW_REQ;
wire                            IAUTO_PCH;
wire    [3:0]                   IB_SIZE;

wire    [13:0]                  ISA;
wire    [1:0]                   IBA;
wire    [SDRAM_CHIPS-1:0]       ICS_N;
wire                            ICKE;
wire                            IRAS_N;
wire                            ICAS_N;
wire                            IWE_N;
wire                            IRW_ACK;
wire                            IR_VALID;
wire                            ID_REQ;
wire                            IW_VALID;

//Parameter Settings -- These parameter ports may be hardwired here prior to synthesis
//   to generate higher fmax, more compact route. 
wire                            SD_INIT_I = SD_INIT;    // Sdram init control
wire      [3:0]                 RAS_I = RAS;            // Minimum ACTIVE to PRECHARGE
wire      [2:0]                 RCD_I = RCD;            // Minimum time between ACTIVATE and READ/WRITE
wire      [1:0]                 RRD_I = RRD;            // Minimum time between ACTIVATE to ACTIVATE in different banks
wire      [2:0]                 RP_I = RP;              // Minimum PRECHARGE to ACTIVATE.
wire      [3:0]                 RC_I = RC;              // Minimum ACTIVATE to ACTIVATE in same bank.
wire      [3:0]                 RFC_I = RFC;            // Minimum AUTO-REFRESH to AUTO-REFRESH/ACTIVATE
wire      [1:0]                 WR_I = WR;              // Minimum write to autoprecharge
wire      [2:0]                 MRD_I = MRD;            // Minimum LOADMODE to ACTIVATE command.
wire      [2:0]                 CL_I = CL;              // Cas latency.
wire                            CL_HALF_I = 0;          // Half clock cas latency 
wire      [1:0]                 BL_I = BL;              // Local Burst length 0=1 1=2 2=4 3=8.
wire      [1:0]                 DS_I = 2'b00;           // Drive strength (not used for SDR)
wire      [15:0]                REF_I = REF;            // Refresh period
wire      [15:0]                DELAY_I = DELAY;        // Initialization delay
wire      [2:0]                 COLBITS_I = COLBITS;    // Number of column bits
wire      [1:0]                 ROWBITS_I = ROWBITS;    // Number of row bits   
wire                            REGDIMM_I = REGDIMM;    // Registered dimm selection, 0=non-reg 1=reg

sdr_fastinit #( 	.SDRAM_RASIZE(SDRAM_RASIZE),.SDRAM_CHIPS(SDRAM_CHIPS),.SDRAM_COLBITS(SDRAM_COLBITS),.SDRAM_ROWBITS(SDRAM_ROWBITS),.SDRAM_CHIPBITS(SDRAM_CHIPBITS),.SDRAM_BANKSTATMODULES(SDRAM_BANKSTATMODULES)) 
		fastinit (
                .CLK(CLK),
                .RESET_N(RESET_N),
                .RADDR(IRADDR),
                .R_REQ(IR_REQ&R_REQ),
                .W_REQ(IW_REQ&W_REQ),
                .B_SIZE(IB_SIZE),
                .AUTO_PCH(IAUTO_PCH),
                .SD_INIT(SD_INIT_I),
                .RAS(RAS_I),
                .RCD(RCD_I),
                .RRD(RRD_I),
                .RP(RP_I),
                .RC(RC_I),
                .RFC            (RFC_I),
                .WR(WR_I),
                .MRD(MRD_I),
                .CL(CL_I),
                .CL_HALF(CL_HALF_I), 
                .BL(BL_I),
                .DS(DS_I),
                .DELAY(DELAY_I),
                .REF(REF_I),
                .COLBITS(COLBITS_I),
                .ROWBITS(ROWBITS_I),
                .REGDIMM(REGDIMM_I),
                .RW_ACK(IRW_ACK),
                .R_VALID(IR_VALID),
                .D_REQ(ID_REQ),
                .W_VALID(IW_VALID),
                .OE(OE),
                .SA(ISA),
                .BA(IBA),
                .CS_N(ICS_N),
                .CKE(ICKE),
                .DQM(IDQM),
                .RAS_N(IRAS_N),
                .CAS_N(ICAS_N),
                .WE_N(IWE_N)
                );

// Output register for SDRAM control signals -- these can be placed in IO Cells
//   They are not reset because RAS_N, CAS_N, WE_N, CS_N need to reset high
//   Reset high signal is passed from previous stage.
always @(posedge CLK)
begin
        SA <= ISA;
        BA <= IBA;
        CS_N <= ICS_N;
        CKE <= ICKE;
        RAS_N <= IRAS_N;
        CAS_N <= ICAS_N;
        WE_N <= IWE_N;
        DQM <= IDQM;
end

// Register localbus signals to ease routing to external signals 
always @(posedge CLK or negedge RESET_N)
begin
    if (RESET_N == 0)
      begin
        RW_ACK <= 0;
        R_VALID <= 0;
        D_REQ <= 0;
        W_VALID <= 0;
        IR_REQ <= 0;
        IW_REQ <= 0;
      end
    else
      begin
        RW_ACK <= IRW_ACK;
        R_VALID <= IR_VALID;
        D_REQ <= ID_REQ;
        W_VALID <= IW_VALID;
        IR_REQ <= R_REQ;
        IW_REQ <= W_REQ;
      end
end

assign IAUTO_PCH = AUTO_PCH;
assign IB_SIZE = B_SIZE;
assign IRADDR = RADDR;

endmodule

