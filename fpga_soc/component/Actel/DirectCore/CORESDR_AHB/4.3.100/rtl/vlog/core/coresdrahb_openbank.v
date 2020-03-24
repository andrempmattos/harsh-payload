// *********************************************************************/ 
// Copyright (c) 2009 Actel Corporation.  All rights reserved.  
// 
// Any use or redistribution in part or in whole must be handled in 
// accordance with the Actel license agreement and must be approved 
// in advance in writing.  
//  
// File : openbank.v 
//     
// Description: This block of code tracks the state of one bank insode the SDRAM.
//              Based on the commands issued to this bank, and the SDRAM timing parameters,
//              this state machine indicates when commands can be issued to the SDRAM.
//
//
// Notes:
//
// *********************************************************************/ 

`timescale 1ps / 1ps

module sdr_openbank (
                CLK,                    
                RESET_N,                
                SD_INIT,                
                GOACTIVE,               
                DORW,                   
                READCMD,
                DOPC,                   
                ACTV,                   
                DOREF,                  
                DOPCH,                  
                DOMODE,                 
                BSIZE,                  
                AUTO_PCH,
                LINEADDR,               
                CHIPADDR,               
                RAS,
                RCD,                    
                RRD,                    
                RP,                     
                MRD,                    
                RC,                     
                RFC,
                WR,
                BL,                     
                ACTABLE,                
                RWABLE,                 
                PCABLE,                 
                ACTIVE,                 
                LINE,                   
                CHIP                    
	            );
	
parameter	SDRAM_CHIPBITS        	= 3;    
parameter	SDRAM_ROWBITS         	= 14;


input                                   CLK;          // System clock
input                                   RESET_N;      // System reset (active low)
input                                   SD_INIT;      // Strobe to cause reinitialization of SDRAM
input                                   GOACTIVE;     // Signal to activate this bank
input                                   DORW;         // Signal to begin a read or write on this bank
input                                   READCMD;      // Inidcates whether DORW is read or write
input                                   DOPC;         // Signal to start a precharge of this bank
input                                   ACTV;         // Signal to activate a bank (any bank)
input                                   DOREF;        // Signal to begin a refresh
input                                   DOPCH;        // Signal to begin a global precharge
input                                   DOMODE;       // Signal to begin a mode write
input   [3:0]                           BSIZE;        // Number of beats to the burst
input                                   AUTO_PCH;     // Auto precharge request
input   [SDRAM_ROWBITS-1:0]             LINEADDR;     // Line Address
input   [SDRAM_CHIPBITS-1:0]            CHIPADDR;     // Chip Address
input   [3:0]                           RAS;          // Minimum ACTIVE to PRECHARGE
input   [2:0]                           RCD;          // Minimum time between ACTIVATE and READ/WRITE  
input   [1:0]                           RRD;          // Minimum time between ACTIVATE to ACTIVATE in different banks  
input   [2:0]                           RP;           // Minimum PRECHARGE to ACTIVATE  
input   [2:0]                           MRD;          // Minimum LOADMODE to ACTIVATE command  
input   [3:0]                           RC;           // Minimum ACTIVATE to ACTIVATE/AUTO-REFRESH in same bank  
input   [3:0]                           RFC;          // Minimum AUTO-REFRESH to ACTIVATE/AUTO-REFRESH in same bank  
input   [1:0]                           WR;           // Minimum delay from write to PRECHARGE
input   [1:0]                           BL;           // Burst length  
output                                  ACTABLE;      // Flag to indicate bank can go active
output                                  RWABLE;       // Flag to indicate bank can read/write  
output                                  PCABLE;       // Flag to indicate bank can be precharged  
output                                  ACTIVE;       // Flag to indicate bank is active
output  [SDRAM_ROWBITS-1:0]             LINE;         // Active line for this bank
output  [SDRAM_CHIPBITS-1:0]            CHIP;         // Active chip address


reg                                     ACTABLE;
reg                                     RWABLE;
reg                                     PCABLE;
reg                                     ACTIVE;
reg     [SDRAM_ROWBITS-1:0]             LINE;
reg     [SDRAM_CHIPBITS-1:0]            CHIP;

reg     [8:0]                           rc_shift;
reg     [12:0]                          actable_shift;
reg     [4:0]                           rwable_shift;
reg     [8:0]                           pcable_shift;
reg     [6:0]                           ras_shift;
reg     [3:0]                           BLEN;
reg                                     prev_cmd_read;   // Indicates if previous DORW was a read or write
reg                                     rw_ap_in_progress;
reg                                     auto_pch_event;



//
// Track chip and line (row) last activated -- used by fastsdram to determine line hit/miss
//
always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N == 0) 
    begin
        LINE <= 0;
        CHIP <= 0;
    end
    else if (SD_INIT == 1) 
    begin
        LINE <= 0;
        CHIP <= 0;
    end
    else 
    begin
        if (GOACTIVE==1) 
        begin
            LINE <= LINEADDR;
            CHIP <= CHIPADDR;
        end
    end
end


//
// ACTIVE -- indicates when bank is active (open)
//
always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N == 0) 
        ACTIVE <= 0;
    else if (SD_INIT == 1) 
        ACTIVE <= 0;
    else if (GOACTIVE==1)
        ACTIVE <= 1;
    else if (DOPCH==1 | DOPC==1 | (DORW & AUTO_PCH))
        ACTIVE <= 0;
end


//
// actable_shift --  shift register to track when bank can be activated based on RFC,
//   RP, BLEN, 
// ACTABLE -- asserted when bank ready for read/write command
//
always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N == 0) 
    begin
        actable_shift <= 13'b1_1111_1111_1111;
        ACTABLE <= 1;
    end
    else if (SD_INIT == 1) 
    begin
        actable_shift <= 13'b1_1111_1111_1111;
        ACTABLE <= 1;
    end
    else
    begin
        actable_shift <= {~ACTIVE, actable_shift[12:1]};
        ACTABLE <= actable_shift[0] & rc_shift[0];
        if (DOREF == 1) 
        begin
            if (RFC >= 3 || rc_shift[0] == 0)
                ACTABLE <= 0;
            else
                ACTABLE <= 1;
            if (RFC >= 4) 
                actable_shift[0] <= 0;
            if (RFC >= 5)
                actable_shift[1] <= 0;
            if (RFC >= 6)
                actable_shift[2] <= 0;
            if (RFC >= 7)
                actable_shift[3] <= 0;
            if (RFC >= 8)
                actable_shift[4] <= 0;
            if (RFC >= 9)
                actable_shift[5] <= 0;
            if (RFC >= 10)
                actable_shift[6] <= 0;
            if (RFC >= 11)
                actable_shift[7] <= 0;
            if (RFC >= 12)
                actable_shift[8] <= 0;
            if (RFC >= 13)
                actable_shift[9] <= 0;
            if (RFC >= 14)
                actable_shift[10] <= 0;
        end
        else if (DOPCH==1 | DOPC==1 | auto_pch_event) 
        begin
            actable_shift <= 13'b1_1111_1111_1111;
            if (RP >= 3 || rc_shift[0] == 0)                       
                    ACTABLE <= 0;
            else
                    ACTABLE <= 1;
            if (RP >= 4) 
                    actable_shift[0] <= 0;
        end
        else if (DORW == 1 & AUTO_PCH == 1)
            //disable activate until auto_pch_event happens 
            actable_shift <= 13'b0_0000_0000_0000;
        else if (DOMODE == 1) 
        begin
            if (MRD >= 3 || rc_shift[0] == 0)
                ACTABLE <= 0;
            else
                ACTABLE <= 1;
            if ( MRD >= 4) 
                    actable_shift[1:0] <= 0;
            if ( MRD >= 5)
                    actable_shift[2] <= 0;
            if ( MRD >= 6)
                    actable_shift[3] <= 0;
            if ( MRD == 7)
                    actable_shift[4] <= 0;
        end
        else if (GOACTIVE == 1) 
        begin
            actable_shift <= 13'b0;
            ACTABLE <= 0;                                      
        end
        else if (ACTV==1 & ACTIVE==0) 
        begin
            if (RRD >= 2)
                 actable_shift[0] <= 1; 
            if (RRD == 3)
                 actable_shift[1] <= 0;
            ACTABLE <= 0;
        end
    end
end

//
// rc_shift -- shift register to track activate command period to prevent RC violation
//
always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N == 0) 
        rc_shift <= 0;
    else if (GOACTIVE == 1)
    begin
        rc_shift <= 9'b1_1111_1111;
        if (RC >= 4)
            rc_shift[0] <= 0;
        if (RC >= 5)
            rc_shift[1] <= 0;
        if (RC >= 6)
            rc_shift[2] <= 0;
        if (RC >= 7)
            rc_shift[3] <= 0;
        if (RC >= 8)
            rc_shift[4] <= 0;
        if (RC >= 9)
            rc_shift[5] <= 0;
        if (RC >= 10)
            rc_shift[6] <= 0;
        if (RC >= 11)
            rc_shift[7] <= 0;
        if (RC >= 12)
            rc_shift[8] <= 0;
    end
    else
        rc_shift <= {1'b1,rc_shift[8:1]};
end


//
// auto_pch_event -- strobes when autoprecharge happens.  This is used in actable computation to delay
//   activate after precharge for meeting RP spec
//
always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N == 0) 
    begin
        rw_ap_in_progress <= 0;
        auto_pch_event <= 0;
    end
    else
    begin
        if (DORW == 1 && AUTO_PCH == 1)
            rw_ap_in_progress <= 1;
        else if (auto_pch_event == 1)
            rw_ap_in_progress <= 0;
        
        if (rw_ap_in_progress == 1 && PCABLE == 1 && auto_pch_event == 0)
            auto_pch_event <= 1;
        else
            auto_pch_event <= 0;
    end     
end

//
// rwable_shift --  shift register to track when bank is ready for read/write command
// RWABLE -- asserted when bank ready for read/write command
//
always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N == 0) 
    begin
        rwable_shift <= 5'b0;
        RWABLE <= 0;
    end
    else 
    begin
        rwable_shift <= {ACTIVE, rwable_shift[4:1]};
        RWABLE <= rwable_shift[0];
        if (GOACTIVE == 1) 
        begin
            rwable_shift <= 5'b11111;
            if (AUTO_PCH == 1 & READCMD == 1 & (BLEN == 2 | BLEN == 1))
            begin  //for read w/ autoprecharge and BLEN 1, or BLEN 2, use 5 clks to guarantee tRAP
                    // Note: this is not optimal for many values of RAS, but BLEN 1 and 2 are inefficient anyway.
                    //   May be fine tuned for specific values of RAS, BLEN, and RCD, possibly at the expense of fmax.
                rwable_shift[1:0] <= 0;
                RWABLE <= 0;
            end
            else if (RCD==5) 
            begin
                rwable_shift[1:0] <= 0;
                RWABLE <= 0;
            end
            else if (RCD==4)
            begin                            
                rwable_shift[0] <= 0;
                RWABLE <= 0;
            end
            else if (RCD==3) 
                RWABLE <= 0;
            else
                RWABLE <= 1;
          end
        else if (DOPCH==1 | DOPC==1) 
        begin
            rwable_shift <= 5'b0;
            RWABLE <= 0;
        end
        else if (DORW ==1 & AUTO_PCH == 1) 
        begin
            rwable_shift <= 0;  //nothing rw-able after read/write w/ auto precharge
            RWABLE <= 0;
        end
    end
end

//
// pcable_shift -- shift register used for tracking when bank can be precharged
//
always @(posedge CLK or negedge RESET_N)
begin
    if (RESET_N == 0)
        pcable_shift <= 9'b111111111;
    else
    begin
        if (DORW ==1) 
        begin
 
            begin //SDR cases
                if (AUTO_PCH == 1)  //for auto precharge, wait entire burst length before precharge, regardless of BSIZE
                    case (BL)
                    3: pcable_shift <= 9'b000000000;                          //BL 3 = BLEN 8
                    2: pcable_shift <= {1'b1, pcable_shift[8:6], 5'b00000};   //BL 2 = BLEN 4
                    1: pcable_shift <= {1'b1, pcable_shift[8:4], 3'b000};     //BL 1 = BLEN 2
                    0: pcable_shift <= {1'b1, pcable_shift[8:3], 2'b00};      //BL 0 = BLEN 1
                    endcase
                else 
                begin
                    case (BSIZE)
                    8,7: pcable_shift <= 9'b000000000;
                    6:   pcable_shift <= {1'b1, 8'b00000000};
                    5:   pcable_shift <= {1'b1,pcable_shift[8], 7'b0000000};
                    4:   
                        if (BLEN == 8)
                            pcable_shift <= {1'b1, pcable_shift[8:7], 6'b000000};
                        else
                            pcable_shift <= {1'b1, pcable_shift[8:6], 5'b00000};
                    default: // BSIZE 3,2,1
                        pcable_shift <= {1'b1, pcable_shift[8:1]};
                                    //these cases will get held off by logic in fastsdram, so no reason to 
                                    //hold off here (would just waste logic)
                    endcase
                end  
            end
        end
        else
            pcable_shift <= {1'b1, pcable_shift[8:1]};
    end
end

//
// ras_shift -- shift register used for tracking when precharge can be issued after activate (per tRAS spec)
//
always @(posedge CLK or negedge RESET_N)
begin
    if (RESET_N == 0)
        ras_shift <= 7'b1111111;
    else if (ACTV == 1)
        case (RAS)
        15,14,13,12,11: ras_shift <= 7'b111_1111; //invalid values
        10: ras_shift <= 7'b000_0000;
        9:  ras_shift <= 7'b100_0000;
        8:  ras_shift <= 7'b110_0000;
        7:  ras_shift <= 7'b111_0000;
        6:  ras_shift <= 7'b111_1000;
        5:  ras_shift <= 7'b111_1100;
        4:  ras_shift <= 7'b111_1110;
        default: ras_shift <= 7'b111_1111;
        endcase
    else
        ras_shift <= {1'b1, ras_shift[6:1]};
end


//
// PCABLE -- flags when bank can be precharged
//     For reads, bank is prechargeable x clocks after the read command, where x is the BSIZE
//     For writes, bank is prechargable x + WR clocks after write command, where x is BLEN, WR is tWR (in full clocks)
//
always @(posedge CLK or negedge RESET_N)
begin
    if (RESET_N == 0)
        PCABLE <= 1;
    else if (DORW == 1)
        PCABLE <= 0;
    else 
    begin
    // SDRAM_SDR
        begin
            if (prev_cmd_read == 0) //prev_cmd was a write -- precharge'able at end of burst + tWR for write
                case (WR)
                3: if (pcable_shift[2] == 1 && ras_shift[0] == 1)
                      PCABLE <= 1;
                   else
                      PCABLE <= 0;
                2: if (pcable_shift[3] == 1 && ras_shift[0] == 1)
                      PCABLE <= 1;
                   else
                      PCABLE <= 0;
                1,0:  //WR = 0 is invalid, but used here to prevent feedback mux
                   if (pcable_shift[4] == 1 && ras_shift[0] == 1)
                      PCABLE <= 1;
                   else
                      PCABLE <= 0;
                endcase
            else //prev_cmd was a read -- precharge'able at end of burst for read   
                if (pcable_shift[4] == 1 && ras_shift[0] == 1)
                    PCABLE <= 1;
                else
                    PCABLE <= 0;
        end
    end
end        

//
// prev_cmd_read -- tracks whether previous command was read or write
//
always @(posedge CLK or negedge RESET_N)
begin
    if (RESET_N == 0)
        prev_cmd_read <= 1;
    else if (DORW == 1)
    begin
        if (READCMD == 1)
          prev_cmd_read <= 1;
        else
          prev_cmd_read <= 0;
    end
end
      

always @(BL)
begin
    if (BL == 0)
         BLEN <= 1;
    else if (BL == 1)
         BLEN <= 2;
    else if (BL == 2)
         BLEN <= 4;
    else 
         BLEN <= 8;
end      
endmodule
