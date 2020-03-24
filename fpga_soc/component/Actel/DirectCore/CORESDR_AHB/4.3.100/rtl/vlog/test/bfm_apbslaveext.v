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
// SVN $Revision: 5574 $
// SVN $Date: 2008-12-22 18:41:33 +0530 (Mon, 22 Dec 2008) $
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

module BFM_APBSLAVEEXT (PCLK, PRESETN, PENABLE, PWRITE, PSEL, 
                        PADDR, PWDATA, PRDATA, PREADY, PSLVERR,
                        EXT_EN, EXT_WR, EXT_RD, EXT_ADDR, EXT_DATA);

    parameter AWIDTH   = 10;
    parameter DEPTH    = 256;
    parameter DWIDTH   = 32;
    parameter EXT_SIZE = 2;
    parameter INITFILE = " ";
    parameter ID       = 0;
    parameter TPD      = 1;
    parameter ENFUNC   = 0;
    parameter DEBUG    = 0;

    `include "bfm_package.v"

    input PCLK; 
    input PRESETN; 
    input PENABLE; 
    input PWRITE; 
    input PSEL; 
    input[AWIDTH - 1:0] PADDR; 
    input[DWIDTH - 1:0] PWDATA; 
    output[DWIDTH - 1:0] PRDATA; 
    wire[DWIDTH - 1:0] PRDATA;
    output PREADY; 
    wire  PREADY;
    output PSLVERR; 
    wire PSLVERR;
    input EXT_EN; 
    input EXT_WR; 
    input EXT_RD; 
    input[AWIDTH - 1:0] EXT_ADDR; 
    inout[DWIDTH - 1:0] EXT_DATA; 
    reg  [DWIDTH - 1:0] EXT_DATAR;

    integer DEBUGN = DEBUG; 
    wire PENABLE_D0; 
    reg PENABLE_D1; 
    reg PENABLE_D2; 
    wire PWRITE_D0; 
    reg PWRITE_D1; 
    reg PWRITE_D2; 
    wire PSEL_D0; 
    reg PSEL_D1; 
    reg PSEL_D2; 
    wire[AWIDTH - 1:0] PADDR_D0; 
    reg[AWIDTH - 1:0] PADDR_D1; 
    reg[AWIDTH - 1:0] PADDR_D2; 
    wire[DWIDTH - 1:0] PWDATA_D0; 
    reg[DWIDTH - 1:0] PWDATA_D1; 
    reg[DWIDTH - 1:0] PWDATA_D2; 
    reg[31:0] PWDATA_P0; 
    reg[31:0] PRDATA_P0; 
    reg PREADY_P0; 
    reg PSLVERR_P0; 
    parameter TPDns = TPD * 1; 
    reg [31:0] XDATA;

    wire[31:0] ZERO; 
    assign ZERO = {32{1'b0}} ;

    reg PURST;
	// This forces action at sim time zero
    initial
    begin
	  PURST <= 1'b0;
      #1;
	  PURST <= 1'b1;
    end


    //------------------------------------------------------------------------------    
    // The RAM block for storing data
    always @(posedge PCLK or negedge PRESETN or negedge PURST)
    begin : PRAM
        integer fdc; 
        reg[7:0] RAM[0:DEPTH - 1]; 
        integer wordaddr; 
        reg[31:0] RDATA; 
        reg IREADY; 
        integer delay_write_counter; 
        integer delay_write_time; 
        reg[31:0] delay_write_data; 
        reg force_error; 
        integer resp_cycle; 
        integer waitcycles; 
        integer WAIT_COUNT; 
        reg[7:0] tmp; 
        reg filedone; 
        reg L; 
        reg FSTATUS; 
        reg initdone; 
        reg ch; 
        integer v; 
        integer last_addr; 
        integer last_data; 
        reg[1:(80)*8] logfile; 
        reg[1:(80)*8] logstr; 
        integer wait_seed; 
        integer tmpwc; 
        integer drive_x;

        // Should only be executed once or on demand
        if ( INITFILE != 8'h20 && initdone == 0 && PURST==1'b1)
        begin
            $display("Opening BFM APB Slave %0d Initialisation file %s", ID,INITFILE); 
            $readmemb(INITFILE,RAM);
            initdone = 1;
        end 

        if ( PURST==1'b0)
        begin 
          waitcycles  = 0;
          initdone    = 0;
		  force_error = 0;
        end
        else
        if (PRESETN == 1'b0)
        begin
            delay_write_counter = 0; 
            delay_write_time = 256; 
            force_error = 0; 
            resp_cycle = 0; 
            waitcycles = 0; 
            IREADY = 1'b0; 
            PREADY_P0 <= 1'b0 ; 
            PSLVERR_P0 <= 1'b0 ; 
            EXT_DATAR <= {DWIDTH{1'bz}} ; 
            wait_seed = 69;
            drive_x = 0;
            XDATA = 0;
        end
        else
        begin
            IREADY = 1'b0; 
            PSLVERR_P0 <= 1'b0 ; 
            if (PSEL == 1'b1)
            begin
                wordaddr = { PADDR[AWIDTH - 1:2], 2'b00}; 
                if (PSEL == 1'b1 & PENABLE == 1'b0)
                begin
                    if (waitcycles >= 256)
                    begin
                        // reload the timer
                        wait_seed = random(wait_seed); // create random value in range
                        tmpwc = mask_randomS(wait_seed, waitcycles % 256); 
                    end
                    else
                    begin
                        tmpwc = waitcycles; // reload the timer
                    end 
                    WAIT_COUNT = tmpwc - 1; 
                    if (tmpwc == 0)
                    begin
                        IREADY = 1'b1; 
                        WAIT_COUNT = 0; 
                    end 
                end 
                if (PSEL == 1'b1 & PENABLE == 1'b1 & waitcycles > 0)
                begin
                    if (WAIT_COUNT > 0)
                    begin
                        WAIT_COUNT = WAIT_COUNT - 1; 
                    end
                    else if (PREADY_P0 == 1'b0)
                    begin
                        IREADY = 1'b1; 
                        if (waitcycles >= 256)
                        begin
                            // reload the timer
                            wait_seed = random(wait_seed); // create random value in range
                            WAIT_COUNT = mask_randomS(wait_seed, waitcycles % 256); 
                        end
                        else
                        begin
                            WAIT_COUNT = waitcycles; // reload the timer
                        end 
                    end
                    else
                    begin
                        IREADY = 1'b0; 
                    end 
                end 
                if (PSEL == 1'b1 & IREADY == 1'b1)
                begin
                    if (force_error)
                    begin
                        if (resp_cycle > 1)
                        begin
                            resp_cycle = resp_cycle - 1; 
                        end
                        else
                        begin
                            force_error = 0; 
                            PSLVERR_P0 <= 1'b1 ; 
                        end 
                    end 
                end 
                if (PENABLE == 1'b1 & PWRITE == 1'b1 & PREADY_P0 == 1'b1)
                begin
                    if (~(ENFUNC > 0 & wordaddr >= ENFUNC & wordaddr < ENFUNC + 256))
                    begin
                        RAM[wordaddr + 0] = PWDATA_P0[7:0]; 
                        RAM[wordaddr + 1] = PWDATA_P0[15:8]; 
                        RAM[wordaddr + 2] = PWDATA_P0[23:16]; 
                        RAM[wordaddr + 3] = PWDATA_P0[31:24]; 
                        if (DEBUGN >= 1) $display("APBS: Slot %0d Write %04x=%04x ", ID, wordaddr, PWDATA); 
                        last_addr = wordaddr; 
                        last_data = to_int(PWDATA); 
                    end
                    else
                    begin
                        if (ENFUNC > 0 & wordaddr >= ENFUNC & wordaddr < ENFUNC + 256)
                        begin
                            $display("APBS:%0d Setting ENFUNC %0d %0d", ID, wordaddr - ENFUNC, PWDATA); 
                            case (wordaddr - ENFUNC)
                                0 :
                                            begin
                                                force_error = 1; 
                                                resp_cycle = to_int(PWDATA[7:0]); 
                                                $display("APBS: PSLVERR  will be set on the %0d access", resp_cycle); 
                                            end
                                4 :
                                            begin
                                                waitcycles = to_int(PWDATA[9:0]); 
                                                if (waitcycles >= 256)
                                                begin
                                                    $display("APBS:PREADY timing random 0 to %0d cycles", (waitcycles % 256)); 
                                                end
                                                else
                                                begin
                                                    $display("APBS:PREADY timing %0d cycles ", waitcycles); 
                                                end 
                                            end
                                8 :
                                            begin
                                                DEBUGN <= to_int(PWDATA[7:0]) ; 
                                            end
                                12 :
                                            begin
                                                begin : xhdl_4
                                                    integer i;
                                                    for(i = 0; i <= DEPTH - 1; i = i + 1)
                                                    begin
                                                        RAM[i] = 0; 
                                                    end
                                                end 
                                            end
                                16 :
                                            begin
                                                begin : xhdl_4a
                                                    integer i;
                                                    for(i = 0; i <= DEPTH - 1; i = i + 1)
                                                    begin
                                                        RAM[i] = ~i; 
                                                    end
                                                end 
                                            end
                                28 :
                                            begin
                                                delay_write_data = PWDATA_P0; 
                                                delay_write_counter = delay_write_time; 
                                            end
                                32 :
                                            begin
                                                delay_write_time = to_int(PWDATA); 
                                            end
                                36 :
                                            begin
                                                initdone = 0; 
                                            end
                                40 :
                                            begin
                                              $swrite(logfile,"image%0d.txt",ID);
                                              $display("APBS:%0d: Dumping to %0s", ID, logfile); 
                                              fdc = $fopen(logfile,"w"); 
                                              begin : xhdl_6
                                                  integer i;
                                                  for(i = 0; i <= DEPTH - 1; i = i + 1) $fdisplay(fdc,"%08b",RAM[i]);
                                              end 
                                              $fflush(fdc); 
                                              $fclose(fdc); 
                                            end
                                52 :        begin
                                             drive_x = (PWDATA[0]==1'b1);
                                             $display("APBS: Special Mode Enables set to %d",PWDATA[2:0]);
					                         if (drive_x==1'b1) 
					           	                XDATA = {32{1'bX}};
					           	             else
					           	                XDATA = {32{1'b0}};
                               				end
                                 default :
                                            begin
                                            end
                            endcase 
                        end 
                    end 
                end // PSEL   
                if (PSEL == 1'b1 & PWRITE == 1'b0 & IREADY == 1'b1)
                begin
                    RDATA = {RAM[wordaddr + 3], RAM[wordaddr + 2], RAM[wordaddr + 1], RAM[wordaddr + 0]}; 
                    //--------------------------------------
                    if (~(ENFUNC > 0 & wordaddr >= ENFUNC & wordaddr < ENFUNC + 256))
                    begin
                        // Actions for special functions
                        last_addr = wordaddr; 
                        last_data = to_int(RDATA); 
                    end
                    else
                    begin
                        //SPECIAL FUNCTIONS
                        case (wordaddr - ENFUNC)
                            44 :
                                        begin
                                            RDATA = to_slv32(last_addr); 
                                        end
                            48 :
                                        begin
                                            RDATA = to_slv32(last_data); 
                                        end
                            default :
                                        begin
                                        end
                        endcase 
                    end 
                    PRDATA_P0 <= RDATA ; 
                end 
                if (PSEL == 1'b1 & PWRITE == 1'b0 & PENABLE == 1'b1 & PREADY_P0 == 1'b1)
                begin
                    if (DEBUGN >=1 ) $display("APBS: Slot %0d Read %04x=%04x ", ID, wordaddr, RDATA); 
                end 
            end
            //-------------------------------------- 
            PREADY_P0 <= IREADY ; 
            // Special Control Code
            if (delay_write_counter > 1)
            begin
                delay_write_counter = delay_write_counter - 1; 
            end
            else if (delay_write_counter == 1)
            begin
                RAM[ENFUNC + 28 + 0] = delay_write_data[7:0]; 
                RAM[ENFUNC + 28 + 1] = delay_write_data[15:8]; 
                RAM[ENFUNC + 28 + 2] = delay_write_data[23:16]; 
                RAM[ENFUNC + 28 + 3] = delay_write_data[31:24]; 
                delay_write_counter = 0; 
            end
            
            //-------------------------------------------------
            // Extention Data Reads and writes
            EXT_DATAR <= {DWIDTH{1'bz}} ; 
            if (EXT_EN == 1'b1 & EXT_RD == 1'b1)
            begin
                case (EXT_SIZE)
                    0 :
                                begin
                                    wordaddr = EXT_ADDR[AWIDTH - 1:0]; 
                                    RDATA = {ZERO[31:8], RAM[wordaddr + 0]}; 
                                end
                    1 :
                                begin
                                    wordaddr = {EXT_ADDR[AWIDTH - 1:1], 1'b0}; 
                                    RDATA = {ZERO[31:16], RAM[wordaddr + 1], RAM[wordaddr + 0]}; 
                                end
                    2 :
                                begin
                                    wordaddr = {EXT_ADDR[AWIDTH - 1:2], 2'b00}; 
                                    RDATA = {RAM[wordaddr + 3], RAM[wordaddr + 2], RAM[wordaddr + 1], RAM[wordaddr + 0]}; 
                                end
                endcase 
                if (DEBUGN >= 1) $display("APBS:%0d Extension Read %04x=%04x ", ID, wordaddr, RDATA); 
                EXT_DATAR <= RDATA ; 
            end 
            if (EXT_EN == 1'b1 & EXT_WR == 1'b1)
            begin
                case (EXT_SIZE)
                    0 :
                                begin
                                    wordaddr = EXT_ADDR[AWIDTH - 1:0]; 
                                    RAM[wordaddr + 0] = EXT_DATA[7:0]; 
                                end
                    1 :
                                begin
                                    wordaddr = {EXT_ADDR[AWIDTH - 1:1], 1'b0}; 
                                    RAM[wordaddr + 0] = EXT_DATA[7:0]; 
                                    RAM[wordaddr + 1] = EXT_DATA[15:8]; 
                                end
                    2 :
                                begin
                                    wordaddr = {EXT_ADDR[AWIDTH - 1:2], 2'b00}; 
                                    RAM[wordaddr + 0] = EXT_DATA[7:0]; 
                                    RAM[wordaddr + 1] = EXT_DATA[15:8]; 
                                    RAM[wordaddr + 2] = EXT_DATA[23:16]; 
                                    RAM[wordaddr + 3] = EXT_DATA[31:24]; 
                                end
                endcase 
                if (DEBUGN >= 1) $display("APBS:%0d Extension Write %04x=%04x ", ID, wordaddr, EXT_DATA); 
            end 
        //------------------------------------------------- 
        end 
    end 
    assign #TPD PRDATA  = (PENABLE == 1'b1) ? PRDATA_P0[DWIDTH - 1:0] : XDATA[DWIDTH - 1:0];
    assign #TPD PREADY  = PREADY_P0 ;
    assign #TPD PSLVERR = PSLVERR_P0 ;

    wire[DWIDTH - 1:0] EXT_DATA = EXT_DATAR;

    always @(PWDATA)
    begin
        PWDATA_P0 <= {32{1'b0}} ; 
        PWDATA_P0[DWIDTH - 1:0] <= PWDATA ; 
    end 
    	
    //------------------------------------------------------------------------------    
    // APB Protocol Checks
    assign PENABLE_D0 = PENABLE ;
    assign PWRITE_D0 = PWRITE ;
    assign PSEL_D0 = PSEL ;
    assign PADDR_D0  = clean(PADDR) ;
    assign PWDATA_D0 = clean(PWDATA) ;

    always @(posedge PCLK)
    begin : xhdl_18
        reg ERR; 
        PENABLE_D1 <= PENABLE_D0 ; 
        PENABLE_D2 <= PENABLE_D1 ; 
        PWRITE_D1 <= PWRITE_D0 ; 
        PWRITE_D2 <= PWRITE_D1 ; 
        PSEL_D1 <= PSEL_D0 ; 
        PSEL_D2 <= PSEL_D1 ; 
        PADDR_D1 <= PADDR_D0 ; 
        PADDR_D2 <= PADDR_D1 ; 
        PWDATA_D1 <= PWDATA_D0 ; 
        PWDATA_D2 <= PWDATA_D1 ; 
        ERR = 0; 
        if (PENABLE_D0 == 1'b1 & PSEL_D0 == 1'b1)
        begin
            // second cycle
            if (PADDR_D0 != PADDR_D1)
            begin
                $display("APBS:%0d Address not stable in both cycles", ID); 
                ERR = 1; 
            end 
            if (PWRITE_D0 != PWRITE_D1)
            begin
                $display("APBS:%0d PWRITE not stable in both cycles", ID); 
                ERR = 1; 
            end 
            if (PSEL_D0 != PSEL_D1)
            begin
                $display("APBS:%0d PSEL not stable in both cycles", ID); 
                ERR = 1; 
            end 
            if (PWDATA_D0 != PWDATA_D1 & PWRITE_D0 == 1'b1)
            begin
                $display("APBS:%0d PWDATA not stable in both cycles", ID); 
                ERR = 1; 
            end 
            if (PSEL_D1 != 1'b1)
            begin
                $display("APBS:%0d PSEL was not active in cycle before PENABLE", ID); 
                ERR = 1; 
            end 
        end 
        // General Checks     
        // Test removes as PREADY_P0 can cas
        //if PENABLE_D0='1' and PENABLE_D1='1' then
        //  $display("APBS:%0d PENABLE active for more than one clocks",ID));
        //  ERR := TRUE;
        //end if;
        // Test removes as PREADY_P0 can cas
        //if PSEL_D0='1' and PSEL_D1='1' and PSEL_D2='1'  then
        //  $display("APBS:%0d PSEL active for more than two clocks",ID));
        //  ERR := TRUE;
        //end if;
        if (ERR)
        begin
            $display("APB Protocol violation (ERROR)"); 
        end  
    end 
endmodule
