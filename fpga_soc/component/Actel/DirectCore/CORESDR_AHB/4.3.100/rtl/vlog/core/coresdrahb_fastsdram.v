// *********************************************************************/ 
// Copyright (c) 2009 Actel Corporation.  All rights reserved.  
// 
// Any use or redistribution in part or in whole must be handled in 
// accordance with the Actel license agreement and must be approved 
// in advance in writing.  
//  
// File : fastsdram.v 
//     
// Description: Handles all direct control of the SDRAM.
//
//
// Notes:
//
// *********************************************************************/ 

`timescale 1ps / 1ps

module sdr_fastsdram(
                CLK,
                RESET_N,
                SD_INIT,
                RADDR,
                R_REQ,
                W_REQ,
                B_SIZE,
                AUTO_PCH,
                RF_REQ,
                P_REQ,
                M_REQ,
                M_REQ_DLL_RESET,
                EM_REQ,
                RAS,
                RCD,
                RRD,
                RP,
                RC,
                RFC,
                WR,
                MRD,
                CL,
                CL_HALF,
                BL,
                DS,
                COLBITS,
                ROWBITS,
                REGDIMM,
                DQM_WR_BTERM,
                RW_ACK,
                S_ACK,
                R_VALID,
                W_VALID,
                D_REQ,
                OE,
                SA,
                BA,
                CS_N,
                CKE,
                RAS_N,
                CAS_N,
                WE_N
                );

	parameter	SDRAM_RASIZE			= 31;
	parameter	SDRAM_CHIPS				= 8;
	parameter	SDRAM_COLBITS         	= 12;
	parameter	SDRAM_BANKBITS        	= 2; 
	parameter	SDRAM_ROWBITS         	= 14;
	parameter	SDRAM_CHIPBITS        	= 3;
    parameter   SDRAM_BANKSTATMODULES   = 4;



input                                   CLK;            // System Clock
input                                   RESET_N;        // System reset
input                                   SD_INIT;        // Strobe to cause reinitialization of SDRAM
input   [SDRAM_RASIZE-1:0]              RADDR;          // Memory Address to Read/Write
input                                   R_REQ;          // Read Request
input                                   W_REQ;          // Write Request
input   [3:0]                           B_SIZE;         // Burst Size
input                                   AUTO_PCH;       // Auto precharge request
input                                   RF_REQ;         // Refresh Request
input                                   P_REQ;          // Precharge Request
input                                   M_REQ;          // Mode Register Write Request
input                                   M_REQ_DLL_RESET; // Mode Register Write Request with DLL Reset
input                                   EM_REQ;         // DDR Extended Mode Register Write Request
input   [3:0]                           RAS;          // Minimum ACTIVE to PRECHARGE
input   [2:0]                           RCD;            // Minimum time between ACTIVATE and READ/WRITE
input   [1:0]                           RRD;            // Minimum time between ACTIVATE to ACTIVATE in different banks
input   [2:0]                           RP;             // Minimum PRECHARGE to ACTIVATE.
input   [3:0]                           RC;             // Minimum ACTIVATE to ACTIVATE/AUTO-REFRESH in same bank  
input   [3:0]                           RFC;            // Minimum AUTO-REFRESH to ACTIVATE/AUTO-REFRESH in same bank  
input   [1:0]                           WR;             // Minimum delay from write to PRECHARGE.
input   [2:0]                           MRD;            // Minimum LOADMODE to ACTIVATE command.
input   [2:0]                           CL;             // CAS latency
input                                   CL_HALF;        // Half clock CAS latency (added to CL)
input   [1:0]                           BL;             // Burst length 0=1 1=2 2=4 3=8.
input   [1:0]                           DS;             // Drive strength programmed during ELMR
input   [2:0]                           COLBITS;        // Number of column bits (0=8  1=9  2=10 3=11 4=12)
input   [1:0]                           ROWBITS;        // Number of row bits    (0=10 1=11 2=12 3=13)
input                                   REGDIMM;        // Registered dimm selection, 0=non-reg 1=reg

output                                  DQM_WR_BTERM;   // Asserted when DQM must be asserted for burst terminate
output                                  RW_ACK;         // Read/Write Acknowledge
output                                  S_ACK;          // Refresh/Precharge/Mode Acknowledge
output                                  R_VALID;        // Clock Enable to latch data from SDRAM
output                                  W_VALID;        // SDRAM Data Bus Output Enable
output                                  D_REQ;          // Clock Enable to read data from the input FIFO
output                                  OE;             // data output enable
output  [13:0]                          SA;             // SDRAM Address Bus
output  [1:0]                           BA;             // SDRAM Bank Select
output  [SDRAM_CHIPS-1:0]               CS_N;           // SDRAM Chip Select
output                                  CKE;            // SDRAM Clock Enable

output                                  RAS_N;          // SDRAM RAS Control Signal
output                                  CAS_N;          // SDRAM CAS Control Signal
output                                  WE_N;           // SDRAM WE Control Signal

// Configuration mappings
`define		COLBITS8    3'b011
`define		COLBITS9    3'b100
`define		COLBITS10   3'b101
`define		COLBITS11   3'b110
`define 	COLBITS12   3'b111

`define		ROWBITS11   2'b00
`define		ROWBITS12   2'b01
`define     ROWBITS13   2'b10
`define     ROWBITS14   2'b11

`define     BANKBITS1   1'b0
`define     BANKBITS2   1'b1


reg     [13:0]                          SA;
reg     [1:0]                           BA;
reg     [SDRAM_CHIPS-1:0]               CS_N;
reg                                     CKE;
reg                                     RAS_N;
reg                                     CAS_N;
reg                                     WE_N;
wire                                    RW_ACK;
reg                                     S_ACK;
reg                                     OE;
reg                                     DQM_WR_BTERM;

reg     [SDRAM_CHIPBITS-1:0]            chipaddr;       // encoded chip address extracted from RADDR
reg     [SDRAM_ROWBITS-1:0]             rowaddr;        // row address extracted from RADDR
reg     [1:0]                           bankaddr;       // bank address extracted from RADDR
reg     [12:0]                          coladdr;        // column address extracted from RADDR

reg     [3:0]                           wcount;         // counter to determine when bus available after write
reg                                     wc_zero;        // flag indicates bus available after write
reg     [3:0]                           rcount;         // counter to determine when bus available after read
reg                                     rc_zero;        // flag indicates bus available for read after read or write
reg                                     rc_zero_d;      // delayed version of rc_zero used for holding off read for turnaround cycle
reg                                     r_valid_delay;  // used to determine r_valid for case of registered DIMM
reg                                     w_valid_d;      // used for generation of w_valid and oe
reg                                     w_valid_i;      // internal reg from which w_valid is derived
reg                                     R_VALID;        // frames valid read data

wire    [7:0]                           actable;        // Flag to indicate bank can go active
wire    [7:0]                           rwable;         // Flag to indicate bank can read/write  
wire    [7:0]                           pcable;         // Flag to indicate bank can be precharged  
wire    [7:0]                           active;         // Flag to indicate bank is active
reg     [7:0]                           goact;          // Signal to activate bank
reg     [7:0]                           dorw;           // Signal to begin a read or write on bank
reg     [7:0]                           prch;           // Signal to start a precharge of bank

reg                                     act;            // Signal to activate a bank
reg                                     rw ;            // Signal to issue read/write command to SDRAM
reg                                     doread;         // Indicates command is a read
reg                                     dowrite;        // Indicates command is a write
reg                                     bterm;          // Burst terminate command
reg                                     refresh;        // Signal to issue refresh command to SDRAM
reg                                     pch;            // Signal to issue bank precharge command to SDRAM
reg                                     precharge;      // Signal to issue precharge all command to SDRAM 
reg                                     mode;           //Signal to issues load mode register command to SDRAM

reg     [10:0]                          rshift;         // Shift register used to derive r_valid flow control signal
reg     [7:0]                           wshift;         // Shift register used to derive w_valid, d_req flow control signals
reg     [3:0]                           bcount;         // Registered version of b_size
reg     [3:0]                           bdcnt;          // Burst counter used to derive bterm_cmd
reg                                     bdzero;         // Signal used to derive bterm_cmd

reg                                     rfsh_cmd;       // First stage registration of refresh request from upper level
reg                                     prch_cmd;       // First stage registration of precharge command from upper level
reg                                     mode_cmd;       // First stage registration of LMR command from upper level
reg     [7:0]                           rdwr_cmd;       // First stage registration of read/write command (from r_req/w_req)
reg                                     read_cmd;       // First stage registration indicates request is read
reg                                     new_cmd;        // State bit goes low when command detected
reg     [7:0]                           lnht_cmd;       // Indicates if current address is a line hit (for each bank)
reg                                     bterm_cmd;      // Causes burst-terminate command to be issued
reg     [3:0]                           BLEN;           // Decoded version of BL (used to simplify coding)

wire    [SDRAM_ROWBITS-1:0]             line0;          // Active row number for bank 0
wire    [SDRAM_ROWBITS-1:0]             line1;          // Active row number for bank 1
wire    [SDRAM_ROWBITS-1:0]             line2;          // Active row number for bank 2
wire    [SDRAM_ROWBITS-1:0]             line3;          // Active row number for bank 3
wire    [SDRAM_ROWBITS-1:0]             line4;          // Active row number for bank 0
wire    [SDRAM_ROWBITS-1:0]             line5;          // Active row number for bank 1
wire    [SDRAM_ROWBITS-1:0]             line6;          // Active row number for bank 2
wire    [SDRAM_ROWBITS-1:0]             line7;          // Active row number for bank 3

wire    [SDRAM_CHIPBITS-1:0]            chp0;           // Active chip number for bank 0
wire    [SDRAM_CHIPBITS-1:0]            chp1;           // Active chip number for bank 1
wire    [SDRAM_CHIPBITS-1:0]            chp2;           // Active chip number for bank 2
wire    [SDRAM_CHIPBITS-1:0]            chp3;           // Active chip number for bank 3
wire    [SDRAM_CHIPBITS-1:0]            chp4;           // Active chip number for bank 0
wire    [SDRAM_CHIPBITS-1:0]            chp5;           // Active chip number for bank 1
wire    [SDRAM_CHIPBITS-1:0]            chp6;           // Active chip number for bank 2
wire    [SDRAM_CHIPBITS-1:0]            chp7;           // Active chip number for bank 3

reg     [SDRAM_CHIPBITS-1:0]            oldchip;        // previously accessed chip number
reg     [SDRAM_CHIPBITS-1:0]            pchaddr;        // chip number to precharge

reg                                     ack;            // command acknowledge

reg     [13:0]                          pSA;            //Address bus formation used during ELMR and LMR
reg     [3:0]                           dqs_hold_sr;    //used to hold off read command to prevent DQS contention when switching between chips
reg                                     turnaround_hold; //indicates if chip switch has happened and read command should be held off
                                                        //to allow turnaround cycle.

integer                                 j,k,l,m;        //indexes for logic duplication -- multiple integers used to
                                                        //  prevent hazard conditions that may show up in simulation.


// Bank Status Management Modules
//


sdr_openbank #(.SDRAM_CHIPBITS(SDRAM_CHIPBITS), .SDRAM_ROWBITS(SDRAM_ROWBITS)) 
        openbank_0     (
                        .CLK(CLK),
                        .RESET_N(RESET_N),
                        .SD_INIT(SD_INIT),
                        .GOACTIVE(goact[0]),
                        .DORW(dorw[0]),
                        .READCMD(read_cmd),
                        .DOPC(prch[0]),
                        .ACTV(act),
                        .DOREF(refresh),
                        .DOPCH(precharge),
                        .DOMODE(mode),
                        .BSIZE(bcount),
                        .AUTO_PCH(AUTO_PCH),
                        .LINEADDR(rowaddr),
                        .CHIPADDR(chipaddr),
                        .RAS(RAS),
                        .RCD(RCD),
                        .RRD(RRD),
                        .RP(RP),
                        .MRD(MRD),
                        .RC(RC),
                        .RFC(RFC),
                        .WR(WR),
                        .BL(BL),
                        .ACTABLE(actable[0]),
                        .RWABLE(rwable[0]),
                        .PCABLE(pcable[0]),
                        .ACTIVE(active[0]),
                        .LINE(line0),
                        .CHIP(chp0)
                        );

sdr_openbank #(.SDRAM_CHIPBITS(SDRAM_CHIPBITS), .SDRAM_ROWBITS(SDRAM_ROWBITS))
         openbank_1     (
                        .CLK(CLK),
                        .RESET_N(RESET_N),
                        .SD_INIT(SD_INIT),
                        .GOACTIVE(goact[1]),
                        .DORW(dorw[1]),
                        .READCMD(read_cmd),
                        .DOPC(prch[1]),
                        .ACTV(act),
                        .DOREF(refresh),
                        .DOPCH(precharge),
                        .DOMODE(mode),
                        .BSIZE(bcount),
                        .AUTO_PCH(AUTO_PCH),
                        .LINEADDR(rowaddr),
                        .CHIPADDR(chipaddr),
                        .RAS(RAS),
                        .RCD(RCD),
                        .RRD(RRD),
                        .RP(RP),
                        .MRD(MRD),
                        .RC(RC),
                        .RFC(RFC),
                        .WR(WR),
                        .BL(BL),
                        .ACTABLE(actable[1]),
                        .RWABLE(rwable[1]),
                        .PCABLE(pcable[1]),
                        .ACTIVE(active[1]),
                        .LINE(line1),
                        .CHIP(chp1)
                        );

sdr_openbank #(.SDRAM_CHIPBITS(SDRAM_CHIPBITS), .SDRAM_ROWBITS(SDRAM_ROWBITS))
        openbank_2     (
                        .CLK(CLK),
                        .RESET_N(RESET_N),
                        .SD_INIT(SD_INIT),
                        .GOACTIVE(goact[2]),
                        .DORW(dorw[2]),
                        .READCMD(read_cmd),
                        .DOPC(prch[2]),
                        .ACTV(act),
                        .DOREF(refresh),
                        .DOPCH(precharge),
                        .DOMODE(mode),
                        .BSIZE(bcount),
                        .AUTO_PCH(AUTO_PCH),
                        .LINEADDR(rowaddr),
                        .CHIPADDR(chipaddr),
                        .RAS(RAS),
                        .RCD(RCD),
                        .RRD(RRD),
                        .RP(RP),
                        .MRD(MRD),
                        .RC(RC),
                        .RFC(RFC),
                        .WR(WR),
                        .BL(BL),
                        .ACTABLE(actable[2]),
                        .RWABLE(rwable[2]),
                        .PCABLE(pcable[2]),
                        .ACTIVE(active[2]),
                        .LINE(line2),
                        .CHIP(chp2)
                        );

sdr_openbank #(.SDRAM_CHIPBITS(SDRAM_CHIPBITS), .SDRAM_ROWBITS(SDRAM_ROWBITS))
        openbank_3     (
                        .CLK(CLK),
                        .RESET_N(RESET_N),
                        .SD_INIT(SD_INIT),
                        .GOACTIVE(goact[3]),
                        .DORW(dorw[3]),
                        .READCMD(read_cmd),
                        .DOPC(prch[3]),
                        .ACTV(act),
                        .DOREF(refresh),
                        .DOPCH(precharge),
                        .DOMODE(mode),
                        .BSIZE(bcount),
                        .AUTO_PCH(AUTO_PCH),
                        .LINEADDR(rowaddr),
                        .CHIPADDR(chipaddr),
                        .RAS(RAS),
                        .RCD(RCD),
                        .RRD(RRD),
                        .RP(RP),
                        .MRD(MRD),
                        .RC(RC),
                        .RFC(RFC),
                        .WR(WR),
                        .BL(BL),
                        .ACTABLE(actable[3]),
                        .RWABLE(rwable[3]),
                        .PCABLE(pcable[3]),
                        .ACTIVE(active[3]),
                        .LINE(line3),
                        .CHIP(chp3)
                        );
         
sdr_openbank #(.SDRAM_CHIPBITS(SDRAM_CHIPBITS), .SDRAM_ROWBITS(SDRAM_ROWBITS))
        openbank_4     (
                        .CLK(CLK),
                        .RESET_N(RESET_N),
                        .SD_INIT(SD_INIT),
                        .GOACTIVE(goact[4]),
                        .DORW(dorw[4]),
                        .READCMD(read_cmd),
                        .DOPC(prch[4]),
                        .ACTV(act),
                        .DOREF(refresh),
                        .DOPCH(precharge),
                        .DOMODE(mode),
                        .BSIZE(bcount),
                        .AUTO_PCH(AUTO_PCH),
                        .LINEADDR(rowaddr),
                        .CHIPADDR(chipaddr),
                        .RAS(RAS),
                        .RCD(RCD),
                        .RRD(RRD),
                        .RP(RP),
                        .MRD(MRD),
                        .RC(RC),
                        .RFC(RFC),
                        .WR(WR),
                        .BL(BL),
                        .ACTABLE(actable[4]),
                        .RWABLE(rwable[4]),
                        .PCABLE(pcable[4]),
                        .ACTIVE(active[4]),
                        .LINE(line4),
                        .CHIP(chp4)
                        );

sdr_openbank #(.SDRAM_CHIPBITS(SDRAM_CHIPBITS), .SDRAM_ROWBITS(SDRAM_ROWBITS))
        openbank_5     (
                        .CLK(CLK),
                        .RESET_N(RESET_N),
                        .SD_INIT(SD_INIT),
                        .GOACTIVE(goact[5]),
                        .DORW(dorw[5]),
                        .READCMD(read_cmd),
                        .DOPC(prch[5]),
                        .ACTV(act),
                        .DOREF(refresh),
                        .DOPCH(precharge),
                        .DOMODE(mode),
                        .BSIZE(bcount),
                        .AUTO_PCH(AUTO_PCH),
                        .LINEADDR(rowaddr),
                        .CHIPADDR(chipaddr),
                        .RAS(RAS),
                        .RCD(RCD),
                        .RRD(RRD),
                        .RP(RP),
                        .MRD(MRD),
                        .RC(RC),
                        .RFC(RFC),
                        .WR(WR),
                        .BL(BL),
                        .ACTABLE(actable[5]),
                        .RWABLE(rwable[5]),
                        .PCABLE(pcable[5]),
                        .ACTIVE(active[5]),
                        .LINE(line5),
                        .CHIP(chp5)
                        );

sdr_openbank #(.SDRAM_CHIPBITS(SDRAM_CHIPBITS), .SDRAM_ROWBITS(SDRAM_ROWBITS))
        openbank_6     (
                        .CLK(CLK),
                        .RESET_N(RESET_N),
                        .SD_INIT(SD_INIT),
                        .GOACTIVE(goact[6]),
                        .DORW(dorw[6]),
                        .READCMD(read_cmd),
                        .DOPC(prch[6]),
                        .ACTV(act),
                        .DOREF(refresh),
                        .DOPCH(precharge),
                        .DOMODE(mode),
                        .BSIZE(bcount),
                        .AUTO_PCH(AUTO_PCH),
                        .LINEADDR(rowaddr),
                        .CHIPADDR(chipaddr),
                        .RAS(RAS),
                        .RCD(RCD),
                        .RRD(RRD),
                        .RP(RP),
                        .MRD(MRD),
                        .RC(RC),
                        .RFC(RFC),
                        .WR(WR),
                        .BL(BL),
                        .ACTABLE(actable[6]),
                        .RWABLE(rwable[6]),
                        .PCABLE(pcable[6]),
                        .ACTIVE(active[6]),
                        .LINE(line6),
                        .CHIP(chp6)
                        );

sdr_openbank #(.SDRAM_CHIPBITS(SDRAM_CHIPBITS), .SDRAM_ROWBITS(SDRAM_ROWBITS))
        openbank_7     (
                        .CLK(CLK),
                        .RESET_N(RESET_N),
                        .SD_INIT(SD_INIT),
                        .GOACTIVE(goact[7]),
                        .DORW(dorw[7]),
                        .READCMD(read_cmd),
                        .DOPC(prch[7]),
                        .ACTV(act),
                        .DOREF(refresh),
                        .DOPCH(precharge),
                        .DOMODE(mode),
                        .BSIZE(bcount),
                        .AUTO_PCH(AUTO_PCH),
                        .LINEADDR(rowaddr),
                        .CHIPADDR(chipaddr),
                        .RAS(RAS),
                        .RCD(RCD),
                        .RRD(RRD),
                        .RP(RP),
                        .MRD(MRD),
                        .RC(RC),
                        .RFC(RFC),
                        .WR(WR),
                        .BL(BL),
                        .ACTABLE(actable[7]),
                        .RWABLE(rwable[7]),
                        .PCABLE(pcable[7]),
                        .ACTIVE(active[7]),
                        .LINE(line7),
                        .CHIP(chp7)
                        );


//  Address Segmentation
//
//  The Memory address is split into Column, Row, Bank
//  
//  The following rowbit and column bit combinations are supported:
//              rowbits      colbits        bankbits
//                 12           8              2
//                 12           9              2
//                 12           10             2
//                 12           11             2
//                 11           8              2
//                 13           8              2
//                 13           9              2
//                 13           10             2
//                 13           11             2
//                 13           12             2     //512Mb (128M x 4)
//                 14           10             2     //1024Mb (256M x 4)
//                 14           11             2     //1024Mb (128M x 8)
//                 14           12             2     //1024Mb (64M x 16)
//                 

// bankaddr needs asynch update so that proper command is generated
always @(RADDR or COLBITS) 
begin
    bankaddr <=    {  2{ (COLBITS == `COLBITS8)  }} & RADDR[9:8]  |
                   {  2{ (COLBITS == `COLBITS9)  }} & RADDR[10:9] |
                   {  2{ (COLBITS == `COLBITS10) }} & RADDR[11:10] |
                   {  2{ (COLBITS == `COLBITS11) }} & RADDR[12:11] |
                   {  2{ (COLBITS == `COLBITS12) }} & RADDR[13:12]  ;
end		

always @(ROWBITS or COLBITS or RADDR)  //2 bankbits assumed 
begin
    chipaddr <= 
            { SDRAM_CHIPBITS{    ((COLBITS == `COLBITS8)  & (ROWBITS == `ROWBITS11)) }} & RADDR[SDRAM_CHIPBITS+21-1:21]  |  
            { SDRAM_CHIPBITS{    ((COLBITS == `COLBITS8)  & (ROWBITS == `ROWBITS12)) }} & RADDR[SDRAM_CHIPBITS+22-1:22]  |
            { SDRAM_CHIPBITS{    ((COLBITS == `COLBITS9)  & (ROWBITS == `ROWBITS12)) }} & RADDR[SDRAM_CHIPBITS+23-1:23]  |
            { SDRAM_CHIPBITS{    ((COLBITS == `COLBITS10) & (ROWBITS == `ROWBITS12)) }} & RADDR[SDRAM_CHIPBITS+24-1:24]  |
            { SDRAM_CHIPBITS{    ((COLBITS == `COLBITS11) & (ROWBITS == `ROWBITS12)) }} & RADDR[SDRAM_CHIPBITS+25-1:25]  |
            { SDRAM_CHIPBITS{    ((COLBITS == `COLBITS8)  & (ROWBITS == `ROWBITS13)) }} & RADDR[SDRAM_CHIPBITS+23-1:23]  |
            { SDRAM_CHIPBITS{    ((COLBITS == `COLBITS9)  & (ROWBITS == `ROWBITS13)) }} & RADDR[SDRAM_CHIPBITS+24-1:24]  |
            { SDRAM_CHIPBITS{    ((COLBITS == `COLBITS10)  & (ROWBITS == `ROWBITS13)) }} & RADDR[SDRAM_CHIPBITS+25-1:25]  |
            { SDRAM_CHIPBITS{    ((COLBITS == `COLBITS11)  & (ROWBITS == `ROWBITS13)) }} & RADDR[SDRAM_CHIPBITS+26-1:26]  |
            { SDRAM_CHIPBITS{    ((COLBITS == `COLBITS12)  & (ROWBITS == `ROWBITS13)) }} & RADDR[SDRAM_CHIPBITS+27-1:27]  |
            { SDRAM_CHIPBITS{    ((COLBITS == `COLBITS10)  & (ROWBITS == `ROWBITS14)) }} & RADDR[SDRAM_CHIPBITS+26-1:26]  |
            { SDRAM_CHIPBITS{    ((COLBITS == `COLBITS11)  & (ROWBITS == `ROWBITS14)) }} & RADDR[SDRAM_CHIPBITS+27-1:27]  |
            { SDRAM_CHIPBITS{    ((COLBITS == `COLBITS12)  & (ROWBITS == `ROWBITS14)) }} & RADDR[SDRAM_CHIPBITS+28-1:28]  ;
    
    rowaddr <= 
           { SDRAM_ROWBITS{ ((COLBITS == `COLBITS8)  & (ROWBITS == `ROWBITS11)) }} & {3'b0,RADDR[20:10]} |   
           { SDRAM_ROWBITS{ ((COLBITS == `COLBITS8)  & (ROWBITS == `ROWBITS12)) }} & {2'b0,RADDR[21:10]} | 
           { SDRAM_ROWBITS{ ((COLBITS == `COLBITS9)  & (ROWBITS == `ROWBITS12)) }} & {2'b0,RADDR[22:11]} |
           { SDRAM_ROWBITS{ ((COLBITS == `COLBITS10) & (ROWBITS == `ROWBITS12)) }} & {2'b0,RADDR[23:12]} |
           { SDRAM_ROWBITS{ ((COLBITS == `COLBITS11) & (ROWBITS == `ROWBITS12)) }} & {2'b0,RADDR[24:13]} |
           { SDRAM_ROWBITS{ ((COLBITS == `COLBITS8)  & (ROWBITS == `ROWBITS13)) }} & {1'b0,RADDR[22:10]} |
           { SDRAM_ROWBITS{ ((COLBITS == `COLBITS9)  & (ROWBITS == `ROWBITS13)) }} & {1'b0,RADDR[23:11]} |
           { SDRAM_ROWBITS{ ((COLBITS == `COLBITS10) & (ROWBITS == `ROWBITS13)) }} & {1'b0,RADDR[24:12]} |
           { SDRAM_ROWBITS{ ((COLBITS == `COLBITS11) & (ROWBITS == `ROWBITS13)) }} & {1'b0,RADDR[25:13]} |
           { SDRAM_ROWBITS{ ((COLBITS == `COLBITS12) & (ROWBITS == `ROWBITS13)) }} & {1'b0,RADDR[26:14]} |
           { SDRAM_ROWBITS{ ((COLBITS == `COLBITS10) & (ROWBITS == `ROWBITS14)) }} & RADDR[25:12] |
           { SDRAM_ROWBITS{ ((COLBITS == `COLBITS11) & (ROWBITS == `ROWBITS14)) }} & RADDR[26:13] |
           { SDRAM_ROWBITS{ ((COLBITS == `COLBITS12) & (ROWBITS == `ROWBITS14)) }} & RADDR[27:14] ;
            
    coladdr <= { SDRAM_COLBITS{ (COLBITS == `COLBITS8) }} & {5'b00000,RADDR[7:0]}  |
               { SDRAM_COLBITS{ (COLBITS == `COLBITS9) }} & {4'b0000,RADDR[8:0] }  |
               { SDRAM_COLBITS{ (COLBITS == `COLBITS10) }} & {3'b000,RADDR[9:0] }  |
               { SDRAM_COLBITS{ (COLBITS == `COLBITS11) }} & {1'b0,RADDR[10],1'b0,RADDR[9:0]} |
               { SDRAM_COLBITS{ (COLBITS == `COLBITS12) }} & {RADDR[11:10],1'b0,RADDR[9:0]} ;
end //always                            


// Translate requests into a command word
//
// Inputs:      R_REQ, W_REQ, RF_REQ, P_REQ, M_REQ              request lines
//              ack                                             command acknowledge
//              chipaddr, rowaddr, bankaddr                     current request's address
//              line0, line1, line2, line3,
//              line4, line5, line6, line7                      active lines in each bank
//
// Outputs:     rfsh_cmd, prch_cmd, mode_cmd, rdwr_cmd, read_cmd, lnht_cmd, new_cmd      Command Bits
//
    
always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N==0) 
    begin
        rfsh_cmd <= 0;
        prch_cmd <= 0;
        mode_cmd <= 0;
        rdwr_cmd <= 0;
        read_cmd <= 0;
        new_cmd  <= 1;
        lnht_cmd <= 0;
    end
    else 
    begin
        if (ack ) 
        begin                                 // During an ACK, null out command
            rfsh_cmd <= 0;
            prch_cmd <= 0;
            mode_cmd <= 0;
            rdwr_cmd <= 0;
            new_cmd  <= 1;
        end
        else if (RF_REQ==1 & new_cmd==1) 
        begin          // Refresh has highest priority
            rfsh_cmd <= 1;
            prch_cmd <= 0;
            mode_cmd <= 0;
            rdwr_cmd <= 0;
            new_cmd  <= 0;
        end
        else if (P_REQ==1 & new_cmd==1) 
        begin           // Precharge has second priority
            rfsh_cmd <= 0;
            prch_cmd <= 1;
            mode_cmd <= 0;
            rdwr_cmd <= 0;
            new_cmd  <= 0;
        end
        else if ((M_REQ==1 | EM_REQ==1 | M_REQ_DLL_RESET==1) & new_cmd==1) 
        begin           // Mode Load has third priority
            rfsh_cmd <= 0;
            prch_cmd <= 0;
            mode_cmd <= 1;
            rdwr_cmd <= 0;
            new_cmd  <= 0;
        end
        else if ((R_REQ==1 | W_REQ==1) & new_cmd==1) 
        begin      // Read/Write has lowest priority and
            rfsh_cmd <= 0;                                                   // must be encoded to the proper bank
            prch_cmd <= 0;
            mode_cmd <= 0;
            if (SDRAM_BANKSTATMODULES == 8)
              rdwr_cmd <= 1 << {chipaddr[0],bankaddr[SDRAM_BANKBITS-1:0]};
            else // SDRAM_BANKSTATMODULES == 4
              rdwr_cmd <= 1 << bankaddr[SDRAM_BANKBITS-1:0];
            new_cmd  <= 0;
        end                                                     // No actions requested
        else if (new_cmd==1) 
        begin
            rfsh_cmd <= 0;
            prch_cmd <= 0;
            mode_cmd <= 0;
            rdwr_cmd <= 0;
        end
        read_cmd <= R_REQ;
        
        if (({chipaddr,rowaddr}=={chp0,line0}) | goact[0]==1)  	     // Detect Line-Hit reads and writes
            lnht_cmd[0] <= 1;
        else
            lnht_cmd[0] <= 0;
        if (({chipaddr,rowaddr}=={chp1,line1}) | goact[1]==1)
            lnht_cmd[1] <= 1;
        else
            lnht_cmd[1] <= 0;
        if (({chipaddr,rowaddr}=={chp2,line2}) | goact[2]==1)
            lnht_cmd[2] <= 1;
        else
            lnht_cmd[2] <= 0;
        if (({chipaddr,rowaddr}=={chp3,line3}) | goact[3]==1)
            lnht_cmd[3] <= 1;
        else
            lnht_cmd[3] <= 0;
        if (({chipaddr,rowaddr}=={chp4,line4}) | goact[4]==1)
            lnht_cmd[4] <= 1;
        else
            lnht_cmd[4] <= 0;
        if (({chipaddr,rowaddr}=={chp5,line5}) | goact[5]==1)
            lnht_cmd[5] <= 1;
        else
            lnht_cmd[5] <= 0;
        if (({chipaddr,rowaddr}=={chp6,line6}) | goact[6]==1)
            lnht_cmd[6] <= 1;
        else
            lnht_cmd[6] <= 0;
        if (({chipaddr,rowaddr}=={chp7,line7}) | goact[7]==1)
            lnht_cmd[7] <= 1;
        else
            lnht_cmd[7] <= 0;
    end
end	


// Take Command and State Info and Issue Actions 
//
// Inputs:      rfsh_cmd, prch_cmd, mode_cmd, rdwr_cmd, read_cmd, lnht_cmd        Command Bits
//              actable, rwable, pcable, active, rc_zero, wc_zero                 State Bits
//              ack         	     	     	     	     	     	     	  Acknowledge bit
//
// Outputs:     goact, dorw, prch, doread, dowrite, refresh, precharge, mode, act, rw, pch, bcount    Actions
//

always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N==0) 
    begin
        goact     <= 0;
        dorw      <= 0;
        prch      <= 0;
        doread    <= 0;
        dowrite   <= 0;
        refresh   <= 0;
        precharge <= 0;
        mode      <= 0;
        act       <= 0;
        rw        <= 0;
        pch       <= 0;
        bcount    <= 0;
        pchaddr   <= 0;
    end
    else 
    begin

//	
// Refresh is issued once all banks are actable (not active)
//
        if (rfsh_cmd==1 & (&actable[SDRAM_BANKSTATMODULES-1:0]) & refresh==0 & bterm_cmd==0) 
                // Refresh waits for all banks actable
            refresh <= 1;
        else
            refresh <= 0;
	
//
// Precharge is issued when refresh is requested and banks are active
// or when precharge is requested and all banks are actable	
//	

        if (rfsh_cmd==1 & (&pcable[SDRAM_BANKSTATMODULES-1:0]) & (|active[SDRAM_BANKSTATMODULES-1:0]) & precharge==0 & bterm_cmd==0)
                // Precharge before Refresh if needed
            precharge <= 1;
        else if (prch_cmd==1 & (&actable[SDRAM_BANKSTATMODULES-1:0]) & precharge==0) // Precharge waits for all banks actable
            precharge <= 1;
        else  
            precharge <= 0;

//
// Mode Write is issued when all banks are actable
//
        if (mode_cmd==1 & (&actable[SDRAM_BANKSTATMODULES-1:0]) & mode==0)     // Mode waits for all banks actable
            mode <= 1;
        else 
            mode <= 0;

//
// Active issued on active command with bank actable
// or read/write command with bank actable but not rwable
//

        act <= 0;
        for (j = 0 ; j < SDRAM_BANKSTATMODULES ; j = j + 1)
        begin
            if (rdwr_cmd[j]==1 & actable[j]==1 & goact[j]==0 & bterm_cmd==0 & ack == 0) 
            begin
                    goact[j] <= 1;
                    act <= 1;
            end
            else 
                    goact[j] <= 0;
        end

//
// Read/Write issued on read/write command with bank rwable and 
//   the appropriate counter is zero.
//
        rw  <= 0;
        pch <= 0;
	    for (k = 0 ; k < SDRAM_BANKSTATMODULES ; k = k + 1)
        begin
            begin   //SDR
                if (rdwr_cmd[k]==1 & bterm_cmd==0 & ack==0 & rwable[k]==1 & dorw[k]==0 & lnht_cmd[k]==1 & 
                    ((read_cmd==1 & rc_zero==1 & (turnaround_hold == 0 | rc_zero_d == 1)) | (read_cmd==0 & wc_zero==1))) 
                begin
                    dorw[k] <= 1;
                    rw <= 1;
                end
                else
                    dorw[k] <= 0;
            end

            if (rdwr_cmd[k]==1 & lnht_cmd[k]==0 & active[k] & pcable[k]==1 & pch==0 & bterm_cmd==0) 
            begin 
                prch[k] <= 1;
                pch <= 1;
                case (k)
                  0: pchaddr <= chp0;
                  1: pchaddr <= chp1;
                  2: pchaddr <= chp2;
                  3: pchaddr <= chp3;
                  4: pchaddr <= chp4;
                  5: pchaddr <= chp5;
                  6: pchaddr <= chp6;
                  7: pchaddr <= chp7;
                endcase
            end
            else  
                prch[k] <= 0;
        end //for

        bcount  <= B_SIZE;
        doread  <= read_cmd;
        dowrite <= ~read_cmd;
    end
end

//
// Issue a Burst Terminate whenever a shortened burst is requested
//

always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N==0) 
    begin
        bterm  <= 0;
        bterm_cmd <= 0;
        bdcnt <= 0;
        bdzero <= 1;
    end
    else 
    begin
        if (rw==1) 
        begin
            if (bcount==1 | bcount==0) 
            begin
                bterm <= 1;
                bterm_cmd <= 0;
                bdcnt <= 0;
                bdzero <= 1;
            end
            else if (bcount==BLEN) 
            begin
                bterm <= 0;
                bterm_cmd <= 0;
                bdcnt <= 0;
                bdzero <= 1;
            end
            else if (bcount==2) 
            begin
                bterm <= 0;
                bterm_cmd <= 1;
                bdcnt <= 2;
                bdzero <= 0;
            end
            else 
            begin
                bterm <= 0;
                bterm_cmd <= 0;
                bdcnt <= bcount;
                bdzero <= 0;
            end
        end
        else if (bdzero==0) 
        begin
            bdcnt <= bdcnt - 1;
            if (bdcnt==3)
                    bterm_cmd <= 1;
            else
                    bterm_cmd <= 0;
            if (bdcnt==2)
                    bterm <= 1;
            else
                    bterm <= 0;
            if (bdcnt==2)
                    bdzero <= 1;
            else
                    bdzero <= 0;
        end
        else 
        begin
            bterm <= 0;
            bterm_cmd <= 0;
            bdcnt <= 0;
            bdzero <= 1;
        end
    end
end



// Translate Action into Control Signals to the SDRAM
//
// Inputs:      refresh, precharge, mode, rw, act, bterm, pch, doburst          Action Bits
//              rowaddr, bankaddr, chipaddr, coladdr                            Address
//
// Outputs:     SA, BA, S, RAS_N, CAS_N, WE_N, CKE                                  SDRAM Control signals
//

// Precompute SA for precharge, mode, etc.

always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N==0)
        pSA <= 14'b0;
    else 
    begin
        if (prch_cmd==1 | rfsh_cmd==1)
            pSA <= 14'b00_0101_0000_0000;
        else if (mode_cmd==1) 
        begin
           //SDR
            begin
                case (BL)
                  2'b00: pSA[2:0] <= 3'b000; //SDR BL = 1 
                  2'b01: pSA[2:0] <= 3'b001; //SDR BL = 2
                  2'b10: pSA[2:0] <= 3'b010; //SDR BL = 4
                  2'b11: pSA[2:0] <= 3'b011; //SDR BL = 8
                endcase
               
                pSA[3] <= 0; // burst type = sequential

                case (CL)
                  4'b001: pSA[6:4] <= 3'b001; //CL = 1.0
                  4'b010: pSA[6:4] <= 3'b010; //CL = 2.0
                  4'b011: pSA[6:4] <= 3'b011; //CL = 3.0
                  4'b100: pSA[6:4] <= 3'b100; //CL = 4.0
                  default: pSA[6:4] <= 3'b011; //not valid, set at CL = 3
                endcase

                pSA[13:7] <= 7'b000_0000;

            end
        end
        else
            pSA <= 14'b0;
    end
end // always
    
always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N==0) 
    begin
        SA <= 0;
        BA <= 0;
        CS_N  <= {SDRAM_CHIPS{1'b1}};
        RAS_N <= 1;
        CAS_N <= 1;
        WE_N  <= 1;
        CKE  <= 0;
        oldchip <= 0;
    end     
    else 
    begin
        CKE <= 1;
	
        if (precharge==1 | mode==1 | bterm==1 | pch==1)
                SA <= pSA;
        else if (act==1)
                SA <= rowaddr;
        else if (AUTO_PCH)
                SA <= {coladdr[12:11], 1'b1, coladdr[9:0]};
        else
                SA <= {coladdr[12:11], 1'b0, coladdr[9:0]};
	
	    if (precharge==1 | mode==1)
	      begin
	        if (EM_REQ == 0) //base mode register	
	          BA <= 2'b00;
            else          //extended mode register
              BA <= 2'b01;
          end
	    else
	        BA <= bankaddr[1:0];

        if (refresh==1 | precharge==1 | mode==1)
            CS_N <= 0;
        else if (bterm==1 ) 
        begin
            for(l = 0; l < SDRAM_CHIPS; l = l + 1)
            begin
                if (l == oldchip)
                  CS_N[l] <= 0;
                else
                  CS_N[l] <= 1;
            end
        end
        else if (pch == 1)
        begin
            for(l = 0; l < SDRAM_CHIPS; l = l + 1)
            begin
                if (l == pchaddr)
                  CS_N[l] <= 0;
                else
                  CS_N[l] <= 1;
            end
        end
        else 
        begin
            for(l = 0; l < SDRAM_CHIPS; l = l + 1)
            begin
                if (l == chipaddr)
                  CS_N[l] <= 0;
                else
                  CS_N[l] <= 1;
            end
        end

        if (rw==1)
        oldchip <= chipaddr;
	
        if (refresh==1) 
        begin                   // Refresh
            RAS_N <= 0;
            CAS_N <= 0;
            WE_N  <= 1;
        end
        else if (precharge==1) 
        begin            // Precharge All
            RAS_N <= 0;
            CAS_N <= 1;
            WE_N  <= 0;
        end
        else if (mode==1) 
        begin                 // Mode Write
            RAS_N <= 0;
            CAS_N <= 0;
            WE_N  <= 0;
        end
        else if (act==1) 
        begin                  // Activate
            RAS_N <= 0;
            CAS_N <= 1;
            WE_N  <= 1;
        end
        else if (rw==1) 
        begin                   // Read/Write
            RAS_N <= 1;
            CAS_N <= 0;
            WE_N  <= doread;
        end
        else if (bterm==1) 
        begin                // Burst Terminate
            RAS_N <= 1;
            CAS_N <= 1;
            WE_N  <= 0;
        end
        else if (pch==1) 
        begin                  // Precharge a bank
           RAS_N <= 0;
           CAS_N <= 1;
           WE_N  <= 0;
        end
        else 
        begin                              // No Operation
            RAS_N <= 1;
            CAS_N <= 1;
            WE_N  <= 1;
        end
    end
end

//
// Assert DQM during write burst terminate per JEDEC 21-C
//
always @(posedge CLK or negedge RESET_N)
begin
    if (RESET_N == 0)
        DQM_WR_BTERM <= 0;
    else if (bterm & w_valid_i)
        DQM_WR_BTERM <= 1;
    else
        DQM_WR_BTERM <= 0;
end


//
// Prevent contention of multiple chips during cascaded reads switching between chips by adding
//      turnaround cycles.
//      In DDR, this would be a DQS premable contention during a cascaded switch to new chip select.
//      This can happen when switching from chip 'a' to chip 'b' during reads where chip 'a'
//      is still asserting DQS (due to DQS postamble) when chip 'b' starts asserting DQS
//      (due to DQS preamble).
//      In SDR, DQ lines may contend without one turnaround cycle.
//
// Inputs:       rw
//
// Outputs:      turnaround_hold --  tells controller to insert turnaround cycle to delay read command
//                                 to new chip to prevent DQS contention (DDR) or DQ contention (SDR).      
//               dqs_hold_sr   --  shift register initiated by the read / write command (rw) used to 
//                                 delay next read from previous read.  Used for DDR only.
// 
always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N==0) 
    begin
        turnaround_hold <= 0;
        dqs_hold_sr <= 0;
    end
    else 
    begin
        if (rw)
            dqs_hold_sr <= 4'b1111;
        else 
            dqs_hold_sr <= {1'b0,dqs_hold_sr[3:1]};

        if (R_REQ==1 & new_cmd==1 & chipaddr != oldchip)  
            turnaround_hold <= 1;
        else if (rw)
            turnaround_hold <= 0;
    end
end
                                  


// RC and WC counters keep track of data bus availablity for Read and Write
//
// Inputs:      rw, doread, dowrite    Action Bits
//
// Outputs:     rcount, wcount    	Down counters until bus free
//              rc_zero, wc_zero  Flags indicating bus available for read or write
//
always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N==0) 
    begin
        wcount <= 0;
        wc_zero <= 1;
    end
    else 
    begin
        if (rw==1 & dowrite==0) 
        begin

            wcount <= bcount+CL;
            wc_zero <= 0;
        end
        else if (rw==1 & dowrite==1) 
        begin
            if (bcount>2) 
            begin
                wcount <= bcount-2;     
                wc_zero <= 0;
            end
            else 
            begin
                wcount <= 0;
                wc_zero <= 1;
            end
        end
        else if (wc_zero==0) 
        begin
            wcount <= wcount - 1;
            if (wcount==1 | wcount==0)
                wc_zero <= 1;
        end
        else 
        begin
            wcount <= 0;
            wc_zero <= 1;
        end
    end
end

always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N==0) 
    begin
        rcount <= 0;
        rc_zero <= 1;
        rc_zero_d <= 1;
    end
    else 
    begin
        rc_zero_d <= rc_zero;
        if (rw==1 & doread==0) 
        begin
            begin
                if (bcount==BLEN ) 
                begin
                    if (BLEN <= 2)
                    begin
                        rcount <= 0;
                        rc_zero <= 1;
                    end
                    else
                    begin
                        rcount <= BLEN-2;
                        rc_zero <= 0;
                    end
                end
                else if (bcount>(CL+1)) 
                begin   
                    rcount <= bcount-1;           
                    rc_zero <= 0;
                end
                else 
                begin
                    rcount <= 0;		
                    rc_zero <= 1;
                end
            end
        end
        else if (rw==1 & doread==1) 
        begin
            if (bcount>2)
            begin
                rcount <= bcount-2;
                rc_zero <= 0;
            end
            else 
            begin
                rcount <= 0;
                rc_zero <= 1;
            end
        end
        else if (rc_zero==0) 
        begin
            rcount <= rcount - 1;
            if (rcount==1 | rcount==0)
                rc_zero <= 1;
        end
        else 
        begin
            rcount <= 0;
            rc_zero <= 1;
        end
    end
end


// Data flow control signals --
//   R_VALID derived using shift register (rshift) that keeps track of where read data is in pipeline
//   D_REQ / W_VALID derived using shift register (wshift) that keeps track of where write data is
//     in pipeline
always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N==0) 
    begin
        rshift        <= 0;
        wshift        <= 0;
        R_VALID       <= 0;
        r_valid_delay <= 0;
    end
    else 
    begin
        if (rw==1 & doread==1) 
        begin  // burst read
            case (CL)
            1: begin
                 if (bcount==1)
                      rshift[10:0] <= 11'b000_0000_0001;
                 else if (bcount==2)
                      rshift[10:0] <= 11'b000_0000_0011;
                 else if (bcount==3)
                      rshift[10:0] <= 11'b000_0000_0111;
                 else if (bcount==4)
                      rshift[10:0] <= 11'b000_0000_1111;
                 else if (bcount==5)
                      rshift[10:0] <= 11'b000_0001_1111;
                 else if (bcount==6)
                      rshift[10:0] <= 11'b000_0011_1111;
                 else if (bcount==7)
                      rshift[10:0] <= 11'b000_0111_1111;
                 else if (bcount==8)
                      rshift[10:0] <= 11'b000_1111_1111;
               end           
            2: begin
                 rshift[0] <= rshift[1];
                 if (bcount==1)
                      rshift[10:1] <= 10'b00_0000_0001;
                 else if (bcount==2)
                      rshift[10:1] <= 10'b00_0000_0011;
                 else if (bcount==3)
                      rshift[10:1] <= 10'b00_0000_0111;
                 else if (bcount==4)
                      rshift[10:1] <= 10'b00_0000_1111;
                 else if (bcount==5)
                      rshift[10:1] <= 10'b00_0001_1111;
                 else if (bcount==6)
                      rshift[10:1] <= 10'b00_0011_1111;
                 else if (bcount==7)
                      rshift[10:1] <= 10'b00_0111_1111;
                 else if (bcount==8)
                      rshift[10:1] <= 10'b00_1111_1111;
               end           
            3: begin
                 rshift[1:0] <= rshift[2:1];    		
                 if (bcount==1)
                      rshift[10:2] <= 9'b0_0000_0001;
                 else if (bcount==2)
                      rshift[10:2] <= 9'b0_0000_0011;
                 else if (bcount==3)
                      rshift[10:2] <= 9'b0_0000_0111;
                 else if (bcount==4)
                      rshift[10:2] <= 9'b0_0000_1111;
                 else if (bcount==5)
                      rshift[10:2] <= 9'b0_0001_1111;
                 else if (bcount==6)
                      rshift[10:2] <= 9'b0_0011_1111;
                 else if (bcount==7)
                      rshift[10:2] <= 9'b0_0111_1111;
                 else if (bcount==8)
                      rshift[10:2] <= 9'b0_1111_1111;
               end
            4: begin
                 rshift[2:0] <= rshift[3:1];    		
                 if (bcount==1)
                      rshift[10:3] <= 8'b0000_0001;
                 else if (bcount==2)
                      rshift[10:3] <= 8'b0000_0011;
                 else if (bcount==3)
                      rshift[10:3] <= 8'b0000_0111;
                 else if (bcount==4)
                      rshift[10:3] <= 8'b0000_1111;
                 else if (bcount==5)
                      rshift[10:3] <= 8'b0001_1111;
                 else if (bcount==6)
                      rshift[10:3] <= 8'b0011_1111;
                 else if (bcount==7)
                      rshift[10:3] <= 8'b0111_1111;
                 else if (bcount==8)
                      rshift[10:3] <= 8'b1111_1111;
               end
            endcase
            if (REGDIMM==1 ) 
            begin
                R_VALID <= r_valid_delay;
                r_valid_delay <= rshift[0];
            end
            else 
            begin  
                R_VALID <= rshift[0];
                r_valid_delay <= 0;
            end
        end
        else 
        begin
            rshift <= {1'b0, rshift[10:1]};
            if (REGDIMM==1 ) 
            begin
               R_VALID <= r_valid_delay;
               r_valid_delay <= rshift[0];
            end
            else 
            begin  
               R_VALID <= rshift[0];
               r_valid_delay <= 0;
            end
        end
        if (rw==1 & doread==0) 
        begin
            case (bcount)
            1: wshift <= 8'b0000_0001;
            2: wshift <= 8'b0000_0011;
            3: wshift <= 8'b0000_0111;
            4: wshift <= 8'b0000_1111;
            5: wshift <= 8'b0001_1111;
            6: wshift <= 8'b0011_1111;
            7: wshift <= 8'b0111_1111;
            8: wshift <= 8'b1111_1111;
            default: wshift <= 8'bxxxx_xxxx; //any other value for bcount is invalid
            endcase
        end
        else 
        begin
            wshift <= {1'b0, wshift[7:1]};
        end
    end
end //always

        
// Data Write Requests, Valids, and Output Enables
//
// D_REQ -- This is registered again at higher level
// W_VALID -- Delayed version of D_REQ, registered again at higher level
// Output Enable -- Simialar to W_VALID but not delayed at higher level so that it is active one clock
//                  the output needs to be enabled to allow for long tco on tri-state drivers.  This
//                  OE is typically not used with DDR
//
always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N==0) 
    begin
        w_valid_i <= 0;
        w_valid_d <= 0;
        OE <= 0;
    end
    else 
    begin
        w_valid_i <= (rw & dowrite) | wshift[1];
        w_valid_d <= w_valid_i;

            if (REGDIMM)
              OE <= w_valid_i | w_valid_d;
            else
              OE <= (rw & dowrite) | wshift[1] | w_valid_i;
        
    end

end

assign     D_REQ = REGDIMM ? w_valid_i : (rw & dowrite ) | wshift[1];
assign     W_VALID = REGDIMM ? w_valid_d : w_valid_i;

    
// Command Acknowledge
//
// Inputs:      rfsh_cmd, prch_cmd, mode_cmd            Command Bits
//              actable                                 State Bits
//              rw                                      Action Bit
//
// Outputs:     RW_ACK, S_ACK                           Acknowledge bits
//              ack                                     Flag for command acknowledge
//
    	     		
always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N==0) 
    begin
        S_ACK  <= 0;
        ack    <= 0;
    end
    else 
    begin
        if (rfsh_cmd==1 & (&actable[SDRAM_BANKSTATMODULES-1:0]) & ack==0) 
        begin
            S_ACK  <= 1;
            ack    <= 1;
        end
        else if (prch_cmd==1 & (&actable[SDRAM_BANKSTATMODULES-1:0]) & ack==0) 
        begin
            S_ACK  <= 1;
            ack    <= 1;
        end
        else if (mode_cmd==1 & (&actable[SDRAM_BANKSTATMODULES-1:0]) & ack==0) 
        begin
            S_ACK  <= 1;
            ack    <= 1;
        end
        else if (rw==1) 
        begin
            S_ACK  <= 0;
            ack    <= 1;
        end
        else 
        begin
            S_ACK  <= 0;
            ack    <= 0;
        end
    end
end

//
// Decode BL into actual burst length (number of local side data transfers)
//
always @(BL)
begin
     if (BL == 0)
          BLEN <= 1;
     else if ( BL==1 )
          BLEN <= 2;
     else if ( BL == 2)
          BLEN <= 4;
     else
          BLEN <= 8;
end

assign   RW_ACK = rw;

endmodule
