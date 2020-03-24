`timescale 1 ns / 100 ps
// ********************************************************************/ 
// Actel Corporation Proprietary and Confidential
// Copyright 2008 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED 
// IN ADVANCE IN WRITING.  
//  
// Description: AMBA BFMs
//              AHB Lite BFM  
//
// Revision Information:
// Date     Description
// SEE BFM main
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
module BFM_AHBSLAVEEXT (HCLK, HRESETN, HSEL, HWRITE, HADDR, HWDATA, HRDATA, 
                        HREADYIN, HREADYOUT, HTRANS, HSIZE, HBURST, HMASTLOCK, 
                        HPROT, HRESP, 
                        EXT_EN, EXT_WR, EXT_RD, EXT_ADDR, EXT_DATA, 
                        TXREADY, RXREADY);
   
   
    parameter AWIDTH    = 10;
    parameter DEPTH     = 256;
    parameter EXT_SIZE  = 2;
    parameter INITFILE  = " ";
    parameter ID        = 0;
    parameter ENFUNC    = 0;
    parameter ENFIFO    = 0;
    parameter TPD       = 1;
    parameter DEBUG     = -1;
   
    `include "bfm_package.v"


    localparam TPDns = TPD * 1; 

    input HCLK; 
    input HRESETN; 
    input HSEL; 
    input HWRITE; 
    input[AWIDTH - 1:0] HADDR; 
    input[31:0] HWDATA; 
    output[31:0] HRDATA; 
    reg[31:0] HRDATA;
    input HREADYIN; 
    output HREADYOUT; 
    wire   HREADYOUT;
    input[1:0] HTRANS; 
    input[2:0] HSIZE; 
    input[2:0] HBURST; 
    input HMASTLOCK; 
    input[3:0] HPROT; 
    output HRESP; 
    wire HRESP;
    input EXT_EN; 
    input EXT_WR; 
    input EXT_RD; 
    input[AWIDTH - 1:0] EXT_ADDR; 
    inout[31:0] EXT_DATA; 
 	wire [31:0] EXT_DATA;
    reg[31:0] EXT_DATAR;
    output TXREADY; 
    wire  TXREADY;
    output RXREADY; 
    wire  RXREADY;

    integer DEBUGN = DEBUG; 

    reg HSEL_PENDING; 
    reg[1:0] HTRANS_PENDING; 
    reg[2:0] HSIZE_PENDING; 
    reg[AWIDTH - 1:0] HADDR_PENDING; 
    reg HWRITE_PENDING; 
    reg HMASTLOCK_PENDING; 
    reg[3:0] HPROT_PENDING; 
    reg[2:0] HBURST_PENDING; 
    reg IRESP; 
    reg iHREADYOUT; 
    reg DATAPHASE; 
    reg iTXREADY; 
    reg iRXREADY; 
    reg swap_flags; 
    wire[31:0] ZERO; 
    // used by bus monitor
    reg BUSBUSY; 

    assign ZERO = {32{1'b0}} ;

    reg PURST;
    // This forces action at sim time zero
    initial
    begin
      PURST <= 1'b0;
      #1;
      PURST <= 1'b1;
    end

localparam [1:0] NONE = 0; 
localparam [1:0] ahb = 1; 
localparam [1:0] ext = 2; 


    //------------------------------------------------------------------------------    
    // The RAM block for storing data
    always @(posedge HCLK or negedge HRESETN or negedge PURST)
    begin : PRAM
        integer fdc ; 
        integer FSTR; 
        integer FLOG; 
        reg[7:0] RAM[0:DEPTH - 1]; 
        integer wordaddr; 
        integer offset; 
        reg[31:0] RDATA; 
        reg[31:0] ERDATA; 
        integer wait_count; 
        integer waitcycles; 
        reg IREADY; 
        reg HSEL_MUX; 
        reg[1:0] HTRANS_MUX; 
        reg[2:0] HSIZE_MUX; 
        reg[AWIDTH - 1:0] HADDR_MUX; 
        reg[3:0] HPROT_MUX; 
        reg[2:0] HBURST_MUX; 
        reg HWRITE_MUX; 
        reg HMASTLOCK_MUX; 
        integer delay_write_counter; 
        integer delay_write_time; 
        reg[31:0] delay_write_data; 
        reg[7:0] tmp; 
        reg[31:0] capture; 
        reg force_error; 
        integer resp_cycle; 
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
        reg misaligned; 
        reg misaligned_assert; 
        reg misaligned_hresp; 
        reg misaligned_rom; 
        reg misalign_ignore; 
        reg[AWIDTH - 1:0] misaligned_addr; 
        integer wait_seed; 
        reg drive_x; 
        reg[1:0] func_read; 
        reg[1:0] func_write; 
        integer func_waddr; 
        integer func_raddr; 
        reg[31:0] func_wdata; 
        reg[31:0] func_rdata; 
        reg[31:0] txfifo[0:ENFIFO]; 
        integer txfifo_wptr; 
        integer txfifo_rptr; 
        integer txfifo_cnt; 
        integer txfifo_femcnt; 
        integer txfifo_latcnt; 
        integer txfifo_delcnt; 
        reg[31:0] rxfifo[0:ENFIFO]; 
        integer rxfifo_wptr; 
        integer rxfifo_rptr; 
        integer rxfifo_cnt; 
        integer rxfifo_femcnt; 
        integer rxfifo_latcnt; 
        integer rxfifo_delcnt; 
        integer dataint; 
        integer b;
        reg [7:0] WBYTE;
        reg [15:0] WHALF;
        integer i;

        // Should only be executed once or on demand
        if ( INITFILE != 8'h20 && initdone == 0 && PURST==1'b1)
        begin
            $display("Opening BFM AHB Slave %0d Initialisation file %s", ID,INITFILE); 
            $readmemb(INITFILE,RAM);
            initdone = 1;
        end 
            
        if ( PURST==1'b0)
        begin 
          waitcycles  = 0;
          initdone    = 0;
          force_error = 0;
          misaligned_assert   = 1; 
          misaligned_hresp    = 0;
          misaligned_rom      = 0;
          misaligned_addr     = 0;
          misalign_ignore     = 0;
        end
        else
        if (HRESETN == 1'b0)
        begin
            IREADY = 1'b1; 
            IRESP <= 1'b0 ; 
            HRDATA <= {32{1'b0}} ; 
            HSEL_PENDING <= 1'b0 ; 
            HTRANS_PENDING <= 2'b00 ; 
            HWRITE_PENDING <= 1'b0 ; 
            HADDR_PENDING <= {AWIDTH - 1-(0)+1{1'b0}} ; 
            HSIZE_PENDING <= {3{1'b0}} ; 
            iHREADYOUT <= 1'b1 ; 
            EXT_DATAR <= {32{1'bz}} ; 
            iTXREADY <= 1'b1 ; 
            iRXREADY <= 1'b0 ; 
            wait_count = waitcycles; 
            RDATA = {32{1'b0}}; 
            ERDATA = {32{1'b0}}; 
            delay_write_counter = 0; 
            delay_write_time = 256; 
            force_error = 0; 
            resp_cycle = 0; 
            misaligned_assert = 1; 
            misaligned_hresp = 0; 
            misaligned_rom = 0; 
            misaligned_addr = {AWIDTH - 1-(0)+1{1'b0}}; 
            misalign_ignore = 0; 
            wait_seed = 67; 
            drive_x = 0; 
            txfifo_wptr = 0; 
            txfifo_rptr = 0; 
            txfifo_cnt = 0; 
            txfifo_latcnt = 0; 
            txfifo_femcnt = 0; 
            txfifo_delcnt = 0; 
            rxfifo_wptr = 0; 
            rxfifo_rptr = 0; 
            rxfifo_cnt = 0; 
            rxfifo_latcnt = 0; 
            rxfifo_femcnt = 0; 
            rxfifo_delcnt = 0; 
            swap_flags <= 0 ; 
        end
        else
        begin
            func_read = NONE; 
            func_write = NONE; 
            if (HREADYIN == 1'b1)
            begin
                HSEL_PENDING <= HSEL ; 
                HTRANS_PENDING <= HTRANS ; 
                HWRITE_PENDING <= HWRITE ; 
                HADDR_PENDING <= HADDR ; 
                HSIZE_PENDING <= HSIZE ; 
                HPROT_PENDING <= HPROT ; 
                HBURST_PENDING <= HBURST ; 
                HMASTLOCK_PENDING <= HMASTLOCK ; 
                // Capture the address cycle
                if (waitcycles >= 256)
                begin
                    // reload the timer
                    wait_seed = random(wait_seed); // create random value in range
                    wait_count = mask_randomS(wait_seed, waitcycles % 256); 
                end
                else
                begin
                    wait_count = waitcycles; // reload the timer
                end 
            end 
            // Mux to use actual values or delayed and held values
            if (HREADYIN == 1'b1)
            begin
                HSEL_MUX = HSEL; 
                HADDR_MUX = HADDR; 
                HTRANS_MUX = HTRANS; 
                HSIZE_MUX = HSIZE; 
                HWRITE_MUX = HWRITE; 
                HPROT_MUX = HPROT; 
                HBURST_MUX = HBURST; 
                HMASTLOCK_MUX = HMASTLOCK; 
            end
            else
            begin
                HSEL_MUX = HSEL_PENDING; 
                HADDR_MUX = HADDR_PENDING; 
                HTRANS_MUX = HTRANS_PENDING; 
                HSIZE_MUX = HSIZE_PENDING; 
                HWRITE_MUX = HWRITE_PENDING; 
                HPROT_MUX = HPROT_PENDING; 
                HBURST_MUX = HBURST_PENDING; 
                HMASTLOCK_MUX = HMASTLOCK_PENDING; 
            end 
            if (HREADYIN == 1'b1 & HSEL == 1'b1 & (HTRANS[1]) == 1'b1)
            begin
                // see whether ready for a data cycle
                if (waitcycles >= 256)
                begin
                    // reload the timer
                    wait_seed = random(wait_seed); // create random value in range
                    wait_count = mask_randomS(wait_seed, waitcycles % 256); 
                end
                else
                begin
                    wait_count = waitcycles; // reload the timer
                end 
                IREADY = 1'b0; // will reset in next if timer is zero
                if (resp_cycle > 0)
                begin
                    resp_cycle = resp_cycle - 1; 
                end 
                if (force_error & resp_cycle == 0 & wait_count == 0)
                begin
                    wait_count = 1; 
                end 
            end 
            if (HSEL == 1'b1 & HREADYIN == 1'b1 & (HTRANS[1]) == 1'b1 & misaligned_hresp)
            begin
                case (HSIZE)
                    3'b000 :
                                begin
                                end
                    // Byte
                    3'b001 :
                                begin
                                    // Half
                                    if ((HADDR[0]) != 1'b0)
                                    begin
                                        force_error = 1; 
                                        resp_cycle = 0; 
                                    end 
                                end
                    3'b010 :
                                begin
                                    // Word
                                    if (HADDR_PENDING[1:0] != 2'b00)
                                    begin
                                        force_error = 1; 
                                        resp_cycle = 0; 
                                    end 
                                end
                    default :
                                begin
                                    force_error = 1; 
                                end
                endcase 
                // Misaligned transfer detection, needed here to create error response
                if (HWRITE == 1'b1 & misaligned_rom & HADDR != misaligned_addr)
                begin
                    // note allow write to control register!
                    force_error = 1; 
                    resp_cycle = 0; 
                end 
            end 
            IRESP <= 1'b0 ; 
            if (wait_count > 0)
            begin
                wait_count = wait_count - 1; 
            end
            else
            begin
                if (~(force_error & resp_cycle == 0))
                begin
                    IREADY = 1'b1; 
                end
                else if (IRESP == 1'b0)
                begin
                    IRESP <= 1'b1 ; 
                    IREADY = 1'b0; 
                end
                else
                begin
                    IREADY = 1'b1; 
                    IRESP <= 1'b1 ; 
                    force_error = 0; 
                end 
            end 
            // Write transfers accept data when HREADY on bus true
            misaligned = 0; 
            if (HSEL_PENDING == 1'b1 & HWRITE_PENDING == 1'b1 & HREADYIN == 1'b1 & (HTRANS_PENDING[1]) == 1'b1)
            begin
                wordaddr = {HADDR_PENDING[AWIDTH - 1:2], 2'b00}; 
                offset   = HADDR_PENDING[1:0]; 
                if (~  (ENFUNC>0 & wordaddr>=ENFUNC & wordaddr<(ENFUNC + 256)))
                begin
                    case (HSIZE_PENDING)
                        3'b000 :
                                    begin
                                        // Byte
                                        if (~misaligned_rom)
                                        begin
                                          for (b=0;b<8;b=b+1) WBYTE[b] = HWDATA[offset * 8+b]; 
                                          RAM[wordaddr + offset] =WBYTE[7:0]; 
                                          if (DEBUGN == 1) $display( "AHBS:%0d Byte Write %08u=%02u at %0d ns", ID, wordaddr + offset, WBYTE, $time); 
                                        end
                                        else
                                        begin
                                            misaligned = 1; 
                                            if (DEBUGN == 1) $display( "AHBS:%0d Word Write %08u Misaligned or ROM at %0d ns", ID, wordaddr + offset, $time); 
                                        end 
                                    end
                        3'b001 :
                                    begin
                                        // Half
                                        if ((misalign_ignore | (HADDR_PENDING[0]) == 1'b0) & ~misaligned_rom)
                                          begin for (b=0;b<16;b=b+1) WHALF[b] = HWDATA[offset * 8+b]; 
                                          RAM[wordaddr + offset + 0] = WHALF[7:0]; 
                                          RAM[wordaddr + offset + 1] = WHALF[15:8]; 
                                          if (DEBUGN == 1) $display( "AHBS:%0d Half Write %08u=%02u at %0d ns", ID, wordaddr + offset, WHALF, $time); 
                                        end
                                        else
                                        begin
                                            misaligned = 1; 
                                            if (DEBUGN == 1) $display( "AHBS:%0d Half Write %08u Misaligned or ROM at %0d ns", ID, wordaddr + offset, $time); 
                                        end 
                                    end
                        3'b010 :
                                    begin
                                        // Word
                                        if ((misalign_ignore | HADDR_PENDING[1:0] == 2'b00) & ~misaligned_rom)
                                          begin
                                          RAM[wordaddr + 0] = HWDATA[7:0]; 
                                          RAM[wordaddr + 1] = HWDATA[15:8]; 
                                          RAM[wordaddr + 2] = HWDATA[23:16]; 
                                          RAM[wordaddr + 3] = HWDATA[31:24]; 
                                          if (DEBUGN == 1) $display( "AHBS:%0d Word Write %08u=%02u at %0d ns", ID, wordaddr + offset, HWDATA, $time );
                                        end
                                        else
                                        begin
                                            misaligned = 1; 
                                            if (DEBUGN == 1) $display( "AHBS:%0d Word Write %08u Misaligned or ROM at %0d ns", ID, wordaddr + offset, $time); 
                                        end 
                                    end
                        default :
                                    begin
                                        $display("BFM_AHBSLAVE: Illegal AHB SIZE Setting during write (ERROR)"); 
                                    end
                    endcase 
                    last_addr = wordaddr; 
                    last_data = HWDATA; 
                end
                else
                begin
                    //SPECIAL FUNCTIONS
                    func_write = ahb; 
                    func_waddr = wordaddr - ENFUNC; 
                    func_wdata = HWDATA; 
                end 
                capture = {ZERO[31:20], 2'b00, HMASTLOCK_PENDING, HWRITE_PENDING, 1'b0, HBURST_PENDING, HPROT_PENDING, 1'b0, HSIZE_PENDING, 2'b00, HTRANS_PENDING}; 
            end 
            // Note this model allows a write and read in consecutive cycles to work
            // Read transfers provide data in the same cycle as HREADY on bus true
            RDATA = {32{1'b0}}; 
            if (drive_x)
            begin
                RDATA = {32{1'bx}}; 
            end 
            if (IREADY == 1'b1 & HSEL_MUX == 1'b1 & (HTRANS_MUX[1]) == 1'b1 & HWRITE_MUX == 1'b0)
            begin
                wordaddr = {HADDR_MUX[AWIDTH - 1:2], 2'b00}; 
                offset   = HADDR_MUX[1:0]; 
                case (HSIZE_MUX)
                    3'b000 :
                                begin
                                    // Byte
                                    for (b=0; b<8; b=b+1) RDATA[offset * 8 + b] = RAM[wordaddr + offset][b]; 
                                    if (DEBUGN == 1) $display( "AHBS:%0d Byte Read %08u=%02u at %0d ns", ID, wordaddr,RAM[wordaddr + offset], $time); 
                                end
                    3'b001 :
                                begin
                                    // Half
                                    if (misalign_ignore | (HADDR_MUX[0]) == 1'b0)
                                    begin
                                      for (b=0; b<8; b=b+1)  RDATA[offset * 8 + b] = RAM[wordaddr + offset][b]; 
                                      for (b=8; b<16; b=b+1) RDATA[offset * 8 + b] = RAM[wordaddr + offset+1][b-8]; 
                                      if (DEBUGN == 1) $display( "AHBS:%0d Half Read %08u=%04u at %0d ns", ID, wordaddr + offset,{ RAM[wordaddr + 1], RAM[wordaddr + 0]} , $time); 
                                    end
                                    else
                                    begin
                                        if (DEBUGN == 1) $display( "AHBS:%0d Half Read %08u Misaligned at %0d ns", ID, wordaddr, $time); 
                                        misaligned = 1; 
                                        RDATA = {32{1'b0}}; 
                                    end 
                                end
                    3'b010 :
                                begin
                                    // Word
                                    if (misalign_ignore | HADDR_MUX[1:0] == 2'b00)
                                    begin
                                      RDATA = {RAM[wordaddr + 3], RAM[wordaddr + 2], RAM[wordaddr + 1], RAM[wordaddr + 0]}; 
                                      if (DEBUGN == 1) $display( "AHBS:%0d Word Read %08u=%08u at %0d ns", ID, wordaddr, RDATA, $time); 
                                    end
                                    else
                                    begin
                                        if (DEBUGN == 1) $display( "AHBS:%0d Word Read %08u Misaligned at %0d ns", ID, wordaddr, $time); 
                                        misaligned = 1; 
                                        RDATA = {32{1'b0}}; 
                                    end 
                                end
                    default :
                                begin
                                    $display("BFM_AHBSLAVE: Illegal AHB SIZE Setting during read (ERROR)"); 
                                end
                endcase 
                // SPECIAL FUNCTIONS
                if (~(ENFUNC > 0 & wordaddr >= ENFUNC & wordaddr < ENFUNC + 256))
                begin
                    capture = {ZERO[31:20], 2'b00, HMASTLOCK_MUX, HWRITE_MUX, 1'b0, HBURST_MUX, HPROT_MUX, 1'b0, HSIZE_MUX, 2'b00, HTRANS_MUX}; 
                    last_addr = wordaddr; 
                    last_data = to_int(RDATA); 
                end
                else
                begin
                    func_read = ahb; 
                    func_raddr = wordaddr - ENFUNC; 
                    func_rdata = RDATA; 
                end 
            end 
            // Code above detected misaligned transfer so signal IRESP if error detection on
            if (misaligned & misaligned_assert)
            begin
                $display("AHBS:%0d Misaligned Transfer - %08u", ID,wordaddr + offset); 
                $display("Misaligned Transfer Detected (ERROR)"); 
                $stop;
            end 
            	
            //-------------------------------------------------
            // Extention Data Reads and writes
            EXT_DATAR <= {32{1'bz}} ; 
            if (EXT_EN == 1'b1 & EXT_RD == 1'b1)
            begin
                case (EXT_SIZE)
                    0 :
                                begin
                                    wordaddr = EXT_ADDR[AWIDTH - 1:0]; 
                                end
                    1 :
                                begin
                                    wordaddr = {EXT_ADDR[AWIDTH - 1:1], 1'b0}; 
                                end
                    2 :
                                begin
                                    wordaddr = {EXT_ADDR[AWIDTH - 1:2], 2'b00}; 
                                end
                endcase 
                if (~(ENFUNC > 0 & wordaddr >= ENFUNC & wordaddr < ENFUNC + 256))
                begin
                  case (EXT_SIZE)
                      0 :
                                  begin
                                      wordaddr =EXT_ADDR[AWIDTH - 1:0]; 
                                      ERDATA = {ZERO[31:8], RAM[wordaddr + 0]}; 
                                  end
                      1 :
                                  begin
                                      wordaddr = {EXT_ADDR[AWIDTH - 1:1], 1'b0}; 
                                      ERDATA = {ZERO[31:16], RAM[wordaddr + 1], RAM[wordaddr + 0]}; 
                                  end
                      2 :
                                  begin
                                      wordaddr = {EXT_ADDR[AWIDTH - 1:2], 2'b00}; 
                                      ERDATA = {RAM[wordaddr + 3], RAM[wordaddr + 2], RAM[wordaddr + 1], RAM[wordaddr + 0]}; 
                                  end
                  endcase 
                  if (DEBUGN >= 1) $display("AHBS: Slot %0d Extension Read %04x=%04x ", ID, wordaddr, ERDATA); 
               	  EXT_DATAR <= ERDATA;
                end 
                else
                begin
                    if (~(func_read == NONE)) $display("AHBS slave does not allow simultanous EXT and AHB access to control registers (ERROR)"); 
                    func_read  = ext; 
                    func_raddr = wordaddr - ENFUNC; 
                    func_rdata = 32'b0; 
                end 
            end 
            if (EXT_EN == 1'b1 & EXT_WR == 1'b1)
            begin
                case (EXT_SIZE)
                    0 :
                                begin
                                    wordaddr = EXT_ADDR[AWIDTH - 1:0]; 
                                end
                    1 :
                                begin
                                    wordaddr = {EXT_ADDR[AWIDTH - 1:1], 1'b0}; 
                                end
                    2 :
                                begin
                                    wordaddr = {EXT_ADDR[AWIDTH - 1:2], 2'b00}; 
                                end
                endcase 
                if (~(ENFUNC > 0 & wordaddr >= ENFUNC & wordaddr < ENFUNC + 256))
                begin
                    case (EXT_SIZE)
                        0 :
                                    begin
                                        RAM[wordaddr + 0] = EXT_DATA[7:0]; 
                                    end
                        1 :
                                    begin
                                        RAM[wordaddr + 0] = EXT_DATA[7:0]; 
                                        RAM[wordaddr + 1] = EXT_DATA[15:8]; 
                                    end
                        2 :
                                    begin
                                        RAM[wordaddr + 0] = EXT_DATA[7:0]; 
                                        RAM[wordaddr + 1] = EXT_DATA[15:8]; 
                                        RAM[wordaddr + 2] = EXT_DATA[23:16]; 
                                        RAM[wordaddr + 3] = EXT_DATA[31:24]; 
                                    end
                    endcase 
                    if (DEBUGN >= 1) $display("AHBS: Slot %0d Extension Write %04x=%04x ", ID, wordaddr, EXT_DATA); 
                end
                else
                begin
                    if (~(func_read == NONE)) 
                    begin
                      $display("AHBS slave does not allow simultanous EXT and AHB access (ERROR)") ; 
                      $stop; 
                    end
                    func_write = ext; 
                    func_waddr = wordaddr - ENFUNC; 
                    func_wdata = EXT_DATA; 
                end 
            end 
            //-------------------------------------------------------------------------------------
            // This is the Special Function Registers
            //
            // Delayed Write
            if (delay_write_counter > 1)
            begin
                delay_write_counter = delay_write_counter - 1; 
            end
            else if (delay_write_counter == 1)
            begin
                $display("UPDATED %08x  %08x", ENFUNC + 28, delay_write_data); 
                RAM[ENFUNC + 28 + 0] = delay_write_data[7:0]; 
                RAM[ENFUNC + 28 + 1] = delay_write_data[15:8]; 
                RAM[ENFUNC + 28 + 2] = delay_write_data[23:16]; 
                RAM[ENFUNC + 28 + 3] = delay_write_data[31:24]; 
                delay_write_counter = 0; 
            end 
            if (func_write != NONE)
            begin
                $display("AHBS:%0d Setting ENFUNC %0d %0d", ID, func_waddr, func_wdata); 
                case (func_waddr)
                    0 :
                                begin
                                    force_error = 1; 
                                    resp_cycle = to_int(func_wdata[7:0]); 
                                    $display("AHBS: HRESP will be set on the %0d access", resp_cycle); 
                                end
                    4 :
                                begin
                                    waitcycles = to_int_unsigned(func_wdata[9:0]); 
                                    IREADY = 1'b1; 
                                    wait_count = 0; 
                                    if (waitcycles >= 256)
                                    begin
                                        $display("AHBS:HREADY timing random 0 to %0d cycles", waitcycles % 256); 
                                    end
                                    else
                                    begin
                                        $display("AHBS:HREADY timing %0d cycles ", waitcycles); 
                                    end 
                                end
                    8 :
                                begin
                                    DEBUGN <= func_wdata[7:0] ; 
                                end
                    12 :
                                begin
                                   for (i=0; i<DEPTH; i=i+1)  RAM[i] = 0; 
                                end
                    16 :
                                begin
                                    begin : xhdl_5
                                        integer i;
                                        for(i = 0; i <= DEPTH - 1; i = i + 1)
                                        begin
                                            RAM[i] = ~i; 
                                        end
                                    end 
                                end
                    24 :
                                begin
                                    misaligned_assert = ((func_wdata[0]) == 1'b1); 
                                    misaligned_hresp  = ((func_wdata[1]) == 1'b1); 
                                    misaligned_rom    = ((func_wdata[2]) == 1'b1); 
                                    misalign_ignore   = ((func_wdata[3]) == 1'b1); 
                                    misaligned_addr   = HADDR_PENDING; // this allows write to the register when in ROM mode
                                    $display("AHBS: Misaligned Transfer Detection set to %0d", HWDATA[2:0]); 
                                end
                    28 :
                                begin
                                    $display("AHBS: Delaying write of %08x for %0d Clocks", func_wdata, delay_write_time); 
                                    delay_write_data = func_wdata; 
                                    delay_write_counter = delay_write_time; 
                                end
                    32 :
                                begin
                                    delay_write_time = func_wdata; 
                                end
                    36 :
                                begin
                                    initdone = 0; 
                                end
                    40 :        begin
                                    $swrite(logfile,"image%0d.txt",ID);
                                    $display("AHBS:%0d: Dumping to %0s", ID, logfile); 
                                    fdc = $fopen(logfile,"w"); 
                                    begin : xhdl_6
                                        integer i;
                                        for(i = 0; i <= DEPTH - 1; i = i + 1) $fdisplay(fdc,"%08b",RAM[i]);
                                    end 
                                    $fflush(fdc); 
                                    $fclose(fdc); 
                                end
                    52 :
                                begin
                                    drive_x = ((func_wdata[0]) == 1'b1); 
                                    $display("AHBS: Special Mode Enables set to %0d", func_wdata[2:0]); 
                                end
                    128 :
                                begin
                                    txfifo[txfifo_wptr] = func_wdata; 
                                    txfifo_cnt = txfifo_cnt + 1; 
                                    if (txfifo_wptr == ENFIFO - 1)
                                    begin
                                        txfifo_wptr = 0; 
                                    end
                                    else
                                    begin
                                        txfifo_wptr = txfifo_wptr + 1; 
                                    end 
                                    if ((txfifo_femcnt > 0 & txfifo_delcnt <= txfifo_femcnt) | iTXREADY == 1'b0)
                                    begin
                                        $display("AHBS:Detected Write to TXFIFO when iTXREADY=0 (ERROR)"); 
                                        $stop;
                                    end 
                                    txfifo_delcnt = 0; 
                                end
                    136 :
                                begin
                                    dataint = to_int(func_wdata); 
                                    if (dataint == 0)
                                    begin
                                        txfifo_wptr = 0; 
                                        txfifo_rptr = 0; 
                                        txfifo_cnt = 0; 
                                    end
                                    else
                                    begin
                                    end 
                                end
                    140 :
                                begin
                                    txfifo_latcnt = func_wdata; 
                                end
                    144 :
                                begin
                                    txfifo_femcnt = func_wdata; 
                                    txfifo_delcnt = func_wdata;
                                end
                    148 :
                                begin
                                    swap_flags <= (func_wdata[0] == 1'b1) ; 
                                end
                    160 :
                                begin
                                    rxfifo[rxfifo_wptr] = func_wdata; 
                                    rxfifo_cnt = rxfifo_cnt + 1; 
                                    if (rxfifo_wptr == ENFIFO - 1)
                                    begin
                                        rxfifo_wptr = 0; 
                                    end
                                    else
                                    begin
                                        rxfifo_wptr = rxfifo_wptr + 1; 
                                    end 
                                end
                    168 :
                                begin
                                    dataint = to_int(func_wdata); 
                                    if (dataint == 0)
                                    begin
                                        rxfifo_wptr = 0; 
                                        rxfifo_rptr = 0; 
                                        rxfifo_cnt = 0; 
                                    end
                                    else
                                    begin
                                    end 
                                end
                    172 :
                                begin
                                    rxfifo_latcnt = func_wdata; 
                                end
                    176 :
                                begin
                                    rxfifo_femcnt = func_wdata; 
                                    rxfifo_delcnt = func_wdata;
                                end
                    default :
                                begin
                                end
                endcase 
            end 
            if (func_read != NONE)
            begin
                case (func_raddr)
                    20 :
                                begin
                                    func_rdata = capture; 
                                end
                    28 :
                                begin
                                    $display("ADDR 28   CNT %0d", delay_write_counter); 
                                end
                    44 :
                                begin
                                    func_rdata = last_addr; 
                                end
                    48 :
                                begin
                                    func_rdata = last_data; 
                                end
                    132 :
                                begin
                                    func_rdata = txfifo[txfifo_rptr]; 
                                    txfifo_cnt = txfifo_cnt - 1; 
                                    if (txfifo_rptr == ENFIFO - 1)
                                    begin
                                        txfifo_rptr = 0; 
                                    end
                                    else
                                    begin
                                        txfifo_rptr = txfifo_rptr + 1; 
                                    end 
                                end
                    136 :
                                begin
                                    func_rdata = to_slv32(txfifo_cnt); 
                                end
                    164 :
                                begin
                                    func_rdata = rxfifo[rxfifo_rptr]; 
                                    rxfifo_cnt = rxfifo_cnt - 1; 
                                    rxfifo_delcnt = 0; 
                                    if (rxfifo_rptr == ENFIFO - 1)
                                    begin
                                        rxfifo_rptr = 0; 
                                    end
                                    else
                                    begin
                                        rxfifo_rptr = rxfifo_rptr + 1; 
                                    end 
                                    if ((rxfifo_femcnt > 0 & rxfifo_delcnt <= rxfifo_femcnt) | iRXREADY == 1'b0)
                                    begin
                                        $display("AHBS:Detected Read from RXFIFO when iRXREADY=0 (ERROR)"); 
                                        $stop;
                                    end 
                                end
                    168 :
                                begin
                                    func_rdata = rxfifo_cnt; 
                                end
                    default :
                                begin
                                end
                endcase 
                if (func_read == ext)
                begin
                    EXT_DATAR <= func_rdata ; 
                end 
                if (func_read == ahb)
                begin
                    RDATA = func_rdata; 
                end 
            end 
            if (txfifo_delcnt >= txfifo_femcnt)
            begin
                iTXREADY <= 1'b1 ; 
                // READY flag control 
                if (txfifo_cnt == ENFIFO)
                begin
                    iTXREADY <= 1'b0 ; 
                end 
            end
            else
            begin
                if (txfifo_delcnt >= txfifo_latcnt)
                begin
                    iTXREADY <= 1'b0 ; 
                end 
            end 
            if (rxfifo_delcnt >= rxfifo_femcnt)
            begin
                iRXREADY <= 1'b1 ; 
                if (rxfifo_cnt == 0)
                begin
                    iRXREADY <= 1'b0 ; 
                end 
            end
            else
            begin
                if (rxfifo_delcnt >= rxfifo_latcnt)
                begin
                    iRXREADY <= 1'b0 ; 
                end 
            end 
            txfifo_delcnt = txfifo_delcnt + 1; 
            rxfifo_delcnt = rxfifo_delcnt + 1; 
            HRDATA     <= #TPDns RDATA ; 
            iHREADYOUT <= IREADY ; 
        end 
    end 
    	
	assign EXT_DATA = EXT_DATAR;

    assign #TPD HRESP = IRESP ;
    assign #TPD HREADYOUT = iHREADYOUT ;
    assign #TPD TXREADY = (~swap_flags) ? iTXREADY : iRXREADY ;
    assign #TPD RXREADY = (~swap_flags) ? iRXREADY : iTXREADY ;

      
    //-----------------------------------------------------------------------------------------------------  
    // This process monitors the BUS activity and detects some basic errors
   
   
    always @(posedge HCLK or negedge HRESETN)
    begin : PMON
        reg ERR; 
        if (HRESETN == 1'b0)
        begin
            BUSBUSY <= 1'b0 ; 
            DATAPHASE <= 1'b0 ; 
        end
        else
        begin
            ERR = 0; 
            if (HTRANS == 2'b00 & HREADYIN == 1'b1)
            begin
                BUSBUSY <= 1'b0 ; 
            end 
            if (HTRANS != 2'b00)
            begin
                BUSBUSY <= 1'b1 ; 
            end 
            if (HTRANS == 2'b11 & HADDR[9:0] == ZERO[9:0])
            begin
                $display("AHBS: AHB Violation: 1K Boundary Crossed"); 
                ERR = 1; 
            end 
            if (HREADYIN == 1'b1)
            begin
                DATAPHASE <= 1'b0 ; 
            end 
            if (HSEL == 1'b1 & HTRANS != 2'b00 & HREADYIN == 1'b1)
            begin
                DATAPHASE <= 1'b1 ; 
            end 
            if (DATAPHASE == 1'b1 & HREADYIN != iHREADYOUT)
            begin
                $display("AHBS: HREADYIN was not the same as HREADYOUT when selected (ERROR)"); 
                $stop;
            end 
            if (ERR)
            begin
                $display("AHB Violation (FAILURE)"); 
                $stop;
            end 
        end 
    end 
endmodule
