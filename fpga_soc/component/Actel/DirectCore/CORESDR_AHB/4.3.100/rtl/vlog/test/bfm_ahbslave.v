// ********************************************************************/ 
// Actel Corporation Proprietary and Confidential
// Copyright 2007 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED 
// IN ADVANCE IN WRITING.  
//  
// Description: AMBA BFMs
//              AHB Slave  
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

module BFM_AHBSLAVE ( HCLK, HRESETN, HSEL, HWRITE, 
                      HADDR, HWDATA, HRDATA, HREADYIN, HREADYOUT, HTRANS, HSIZE, HBURST, HMASTLOCK, HPROT, HRESP);

    parameter AWIDTH    = 10;
    parameter DEPTH     = 256;
    parameter INITFILE  = " ";
    parameter ID        = 0;
    parameter ENFUNC    = 0;
    parameter TPD       = 1;
    parameter DEBUG     = -1;
   
	localparam ENFIFO   = 0;
	localparam EXT_SIZE = 2;

    input HCLK; 
    input HRESETN; 
    input HSEL; 
    input HWRITE; 
    input[AWIDTH - 1:0] HADDR; 
    input [31:0] HWDATA; 
    output[31:0] HRDATA; 
    input HREADYIN; 
    output HREADYOUT; 
    input[1:0] HTRANS; 
    input[2:0] HSIZE; 
    input[2:0] HBURST; 
    input HMASTLOCK; 
    input[3:0] HPROT; 
    output HRESP; 
   
    wire EXT_EN; 
    wire EXT_WR; 
    wire EXT_RD; 
    wire[AWIDTH - 1:0] EXT_ADDR; 
    wire[31:0] EXT_DATA; 

    assign EXT_EN = 1'b0 ;
    assign EXT_WR = 1'b0 ;
    assign EXT_RD = 1'b0 ;
    assign EXT_ADDR = 0 ;
    assign EXT_DATA = {32{1'bz}} ;

    BFM_AHBSLAVEEXT #(.AWIDTH   (AWIDTH), 
                      .DEPTH    (DEPTH), 
                      .EXT_SIZE (EXT_SIZE), 
                      .INITFILE (INITFILE), 
                      .ID       (ID), 
                      .ENFUNC   (ENFUNC), 
					  .ENFIFO   (ENFIFO),
                      .TPD      (TPD), 
                      .DEBUG    (DEBUG) 
                     ) 
      USLV(
        .HCLK(HCLK), 
        .HRESETN(HRESETN), 
        .HSEL(HSEL), 
        .HWRITE(HWRITE), 
        .HADDR(HADDR), 
        .HWDATA(HWDATA), 
        .HRDATA(HRDATA), 
        .HREADYIN(HREADYIN), 
        .HREADYOUT(HREADYOUT), 
        .HTRANS(HTRANS), 
        .HSIZE(HSIZE), 
        .HBURST(HBURST), 
        .HMASTLOCK(HMASTLOCK), 
        .HPROT(HPROT), 
        .HRESP(HRESP), 
        .TXREADY(open),
        .RXREADY(open),
        .EXT_EN(EXT_EN), 
        .EXT_WR(EXT_WR), 
        .EXT_RD(EXT_RD), 
        .EXT_ADDR(EXT_ADDR), 
        .EXT_DATA(EXT_DATA)
    ); 
    	
endmodule
