// ********************************************************************/ 
// Actel Corporation Proprietary and Confidential
// Copyright 2008 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED 
// IN ADVANCE IN WRITING.  
//  
// Description: AMBA BFMs
//              APB Master wrapper  
//
// Revision Information:
// Date     Description
// 01Sep07  Initial Release 
// 14Sep07  Updated for 1.2 functionality
// 25Sep07  Updated for 1.3 functionality
// 09Nov07  Updated for 1.4 functionality
//
//
// SVN Revision Information:
// SVN $Revision: 3739 $
// SVN $Date: 2008-10-21 19:06:55 +0530 (Tue, 21 Oct 2008) $
//
//
// Resolved SARs
// SAR      Date     Who  Description
//
//
// Notes: 
//        
// *********************************************************************/ 

`timescale 1 ns / 100 ps
module BFM_APBSLAVE (PCLK, PRESETN, PENABLE, PWRITE, PSEL, 
                     PADDR, PWDATA, PRDATA, PREADY, PSLVERR);

    parameter AWIDTH   = 10;
    parameter DEPTH    = 256;
    parameter DWIDTH   = 32;
    parameter INITFILE = " ";
    parameter ID       = 0;
    parameter TPD      = 1;
    parameter ENFUNC   = 0;
    parameter DEBUG    = 0;

	localparam EXT_SIZE = 2;

    `include "bfm_package.v"

    input PCLK; 
    input PRESETN; 
    input PENABLE; 
    input PWRITE; 
    input PSEL; 
    input[AWIDTH - 1:0] PADDR; 
    input[DWIDTH - 1:0] PWDATA; 
    output[DWIDTH - 1:0] PRDATA; 
    wire[DWIDTH - 1:0] #TPD PRDATA;
    output PREADY; 
    wire PREADY;
    output PSLVERR; 
    wire   PSLVERR;

    wire EXT_EN; 
    wire EXT_WR; 
    wire EXT_RD; 
    wire[AWIDTH - 1:0] EXT_ADDR; 
    wire[DWIDTH - 1:0] EXT_DATA; 

    assign EXT_EN = 1'b0 ;
    assign EXT_WR = 1'b0 ;
    assign EXT_RD = 1'b0 ;
    assign EXT_ADDR = {AWIDTH - 1-(0)+1{1'b0}} ;
    assign EXT_DATA = 0 ;

    BFM_APBSLAVEEXT #(.AWIDTH 	(AWIDTH), 
                      .DEPTH	(DEPTH),
                      .DWIDTH 	(DWIDTH), 
                      .EXT_SIZE (EXT_SIZE),
                      .INITFILE (INITFILE),
                      .ID 		(ID), 
                      .TPD 		(TPD), 
                      .ENFUNC 	(ENFUNC), 
                      .DEBUG	(DEBUG)
                     ) 
     USLV(
        .PCLK(PCLK), 
        .PRESETN(PRESETN), 
        .PENABLE(PENABLE), 
        .PWRITE(PWRITE), 
        .PSEL(PSEL), 
        .PADDR(PADDR), 
        .PWDATA(PWDATA), 
        .PRDATA(PRDATA), 
        .PREADY(PREADY), 
        .PSLVERR(PSLVERR), 
        .EXT_EN(EXT_EN), 
        .EXT_WR(EXT_WR), 
        .EXT_RD(EXT_RD), 
        .EXT_ADDR(EXT_ADDR), 
        .EXT_DATA(EXT_DATA)
    ); 

endmodule
