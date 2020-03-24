// *********************************************************************/ 
// Copyright (c) 2009 Actel Corporation.  All rights reserved.  
// 
// Any use or redistribution in part or in whole must be handled in 
// accordance with the Actel license agreement and must be approved 
// in advance in writing.  
//  
// File : fastinit.vhd,v 
//     
// Description: This module handles the initialization of the SDRAM when the system
//              leaves the Reset state. After the system is running, this block also
//              handles the periodic refresh operations to the SDRAM
//
//
// Notes:
//
// *********************************************************************/ 

`timescale 1ps / 1ps

module sdr_fastinit (
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
                CL_HALF,
                BL,
                DS,
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

	parameter	SDRAM_RASIZE			= 31;
	parameter	SDRAM_CHIPS				= 8;
	parameter	SDRAM_COLBITS         	= 12;
	parameter	SDRAM_ROWBITS         	= 14;
	parameter	SDRAM_CHIPBITS        	= 3;
    parameter   SDRAM_BANKSTATMODULES   = 4;


input                           CLK;            // System Clock
input                           RESET_N;        // System Reset
input   [SDRAM_RASIZE-1:0]      RADDR;          // Memory Address to read/write
input                           R_REQ;          // Read Request
input                           W_REQ;          // Write Request
input   [3:0]                   B_SIZE;         // Burst Size
input                           AUTO_PCH;       // Auto precharge
input                           SD_INIT;        // SDRAM init control
input   [3:0]                   RAS;          // Minimum ACTIVE to PRECHARGE
input   [2:0]                   RCD;            // Minimum time between ACTIVATE and READ/WRITE
input   [1:0]                   RRD;            // Minimum time between ACTIVATE to ACTIVATE in different banks
input   [2:0]                   RP;             // Minimum PRECHARGE to ACTIVATE.
input   [3:0]                   RC;             // Minimum ACTIVATE to ACTIVATE/AUTO-REFRESH in same bank  
input   [3:0]                   RFC;            // Minimum AUTO-REFRESH to ACTIVATE/AUTO-REFRESH in same bank  
input   [1:0]                   WR;             // Minimum delay from write to PRECHARGE
input   [2:0]                   MRD;            // Minimum LOADMODE to ACTIVATE command.
input   [2:0]                   CL;             // Cas latency.
input                           CL_HALF;        // Half clock CAS latency (added to CL)
input   [1:0]                   BL;             // Burst length 0=1 1=2 2=4 3=8.
input   [1:0]                   DS;             // Drive strength programmed during ELMR
input   [15:0]                  REF;            // Refresh period
input   [15:0]                  DELAY;          // Initialization delay
input   [2:0]                   COLBITS;        // Number of column bits (0=8  1=9  2=10 3=11 4=12)
input   [1:0]                   ROWBITS;        // Number of row bits    (0=11 1=12 2=13 3=14)
input                           REGDIMM;        // Registered dimm support, 0=non-reg, 1=reg
 
output                          RW_ACK;         // Read/Write Acknowledge
output                          R_VALID;        // Clock Enable to latch data from SDRAM
output                          W_VALID;        // SDRAM Data Output Enable
output                          D_REQ;          // Clock Enable to input FIFO (Data Request)
output                          OE;             // Data output enable control
output  [13:0]                  SA;             // SDRAM Address Bus
output  [1:0]                   BA;             // SDRAM Bank Select
output  [SDRAM_CHIPS-1:0]       CS_N;           // SDRAM Chip Select
output                          DQM;            // SDRAM SDR write mask asserted during init and write burst terminate
output                          CKE;            // SDRAM Clock Enable
output                          RAS_N;          // SDRAM RAS Control Signal
output                          CAS_N;          // SDRAM CAS Control Signal
output                          WE_N;           // SDRAM WE Control Signal

reg     [7:0]                   dll_holdoff_timer; // Counter used to prevent read/write access until DDR DLL is stable
reg                             dll_holdoff_en; // Enables countdown of dll_holdoff_timer
reg     [15:0]                  timer;
reg                             inited;
reg                             P_REQ;
reg                             M_REQ;
reg                             RF_REQ;
reg                             EM_REQ;
reg                             M_REQ_DLL_RESET;

reg                             DQM_INIT;       
reg                             DQM_INIT_D0;
reg                             DQM_INIT_D1;

wire                            read_req;
wire                            write_req;

reg     [9:0]                   p_shift;
reg     [9:0]                   r_shift;
reg     [9:0]                   m_shift;
reg     [9:0]                   m_dr_shift;
reg     [9:0]                   em_shift;  

reg                             start_delay_done;   //flag set after startup delay has elapsed
reg                             timer_reset;
reg                             load;

	sdr_fastsdram  #(.SDRAM_RASIZE(SDRAM_RASIZE),.SDRAM_CHIPS(SDRAM_CHIPS),.SDRAM_COLBITS(SDRAM_COLBITS),.SDRAM_ROWBITS(SDRAM_ROWBITS),.SDRAM_CHIPBITS(SDRAM_CHIPBITS),.SDRAM_BANKSTATMODULES(SDRAM_BANKSTATMODULES))
	fastsdram   (
                        .CLK(CLK),
                        .RESET_N(RESET_N),
                        .SD_INIT(SD_INIT),
                        .RADDR(RADDR),
                        .R_REQ(read_req),
                        .W_REQ(write_req),
                        .B_SIZE(B_SIZE),
                        .AUTO_PCH(AUTO_PCH),
                        .RF_REQ(RF_REQ),
                        .P_REQ(P_REQ),
                        .M_REQ(M_REQ),
                        .M_REQ_DLL_RESET(M_REQ_DLL_RESET),
                        .EM_REQ(EM_REQ),
                        .RAS(RAS),
                        .RCD(RCD),
                        .RRD(RRD),
                        .RP(RP),
                        .RC(RC),
                        .RFC(RFC),
                        .WR(WR),
                        .MRD(MRD),
                        .CL(CL),
                        .CL_HALF(CL_HALF),
                        .BL(BL),
                        .DS(DS),
                        .COLBITS(COLBITS),
                        .ROWBITS(ROWBITS),
                        .REGDIMM(REGDIMM),
                        .DQM_WR_BTERM(DQM_WR_BTERM),
                        .RW_ACK(RW_ACK),
                        .S_ACK(S_ACK),
                        .R_VALID(R_VALID),
                        .W_VALID(W_VALID),
                        .D_REQ(D_REQ),
                        .OE(OE),
                        .SA(SA),
                        .BA(BA),
                        .CS_N(CS_N),
                        .CKE(CKE),
                        .RAS_N(RAS_N),
                        .CAS_N(CAS_N),
                        .WE_N(WE_N)
                        );

// Initialization Engine
//
//    Performs initialization of SDRAM devices when system comes out of reset of SD_INIT strobed.
//
//    Initialization sequence for DDR SDRAM:
//            Wait for timer_reset to expire
//            Issue precharge
//            Issue extended load mode register
//            Issue load mode register with DLL reset bit set
//            Issue precharge
//            Issue 2 refreshes
//            Issue load mode register with DLL reset bit clear
//            Wait for 200 clocks for DLL to stablize before any read / write command
//
//    Initialization sequence for SDR SDRAM:
//            Wait for reset_timer to expire
//            Issue Precharge
//            Issue 8 Refreshes
//            Issue mode Register Write
//

always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N==0 ) 
    begin
        begin  //SDR initial values
            p_shift <=    10'b00_0000_0001;
            r_shift <=    10'b01_1111_1110;
            m_shift <=    10'b10_0000_0000;
            m_dr_shift <= 10'b00_0000_0000;
            em_shift   <= 10'b00_0000_0000;
            P_REQ   <= 0;
            RF_REQ  <= 0;
            M_REQ   <= 0;
            EM_REQ     <= 0;
            M_REQ_DLL_RESET <= 0;
        end
    end
    else if (SD_INIT == 1) 
    begin
            // These are same reset values as above but must be outside of the
            //   async reset block for some synthesis tools (i.e. Synopsys DC)
        begin  //SDR initial values
            p_shift <=    10'b00_0000_0001;
            r_shift <=    10'b01_1111_1110;
            m_shift <=    10'b10_0000_0000;
            m_dr_shift <= 10'b00_0000_0000;
            em_shift   <= 10'b00_0000_0000;
            P_REQ   <= 0;
            RF_REQ  <= 0;
            M_REQ   <= 0;
            EM_REQ     <= 0;
            M_REQ_DLL_RESET <= 0;
        end
    end
    else if (timer_reset || (S_ACK==1 && start_delay_done==1)) 
    begin
        begin //SDR initialization sequence
            P_REQ   <= p_shift[0];
            p_shift <= {1'b0, p_shift[9:1]};
            RF_REQ  <= r_shift[0];
            r_shift <= {~r_shift[9], r_shift[9:1]};
            M_REQ   <= m_shift[0];
            m_shift <= {1'b0, m_shift[9:1]};
        end
    end
end

//
// start_delay_done -- flag cleared after SD_INIT or RESET_N and asserted after
//   startup delay has elapsed
//
always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N==0) 
        start_delay_done <= 0;
    else if (SD_INIT == 1)
        start_delay_done <= 0;
    else if (timer_reset == 1)
        start_delay_done <= 1;
end


//
// DQM asserted during initialization or during write burst terminate
//
always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N==0) 
            DQM_INIT <= 1;
    else if (SD_INIT == 1)
            DQM_INIT <= 1;
    else if (M_REQ & S_ACK)
            DQM_INIT <= 0;
end

// delay by 2 clocks so that DQM goes low one clock after MRS command is issued
always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N==0) 
    begin
        DQM_INIT_D0 <= 0;
        DQM_INIT_D1 <= 0;
    end
    else 
    begin
        DQM_INIT_D0 <= DQM_INIT;
        DQM_INIT_D1 <= DQM_INIT_D0;
    end
end

assign DQM = DQM_INIT_D1 | DQM_WR_BTERM;



// DLL Stablization Holdoff Timer
//      Timer to hold off accesses after init until DDR DLL has stablized (200 clocks)
//
always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N==0) 
    begin
        dll_holdoff_timer <= 8'd200;
        dll_holdoff_en <= 0;
    end
    else if (SD_INIT == 1) 
    begin
        dll_holdoff_timer <= 8'd200;
        dll_holdoff_en <= 0;
    end
    else 
    begin
        if (M_REQ==1 & S_ACK==1)
            dll_holdoff_en <= 1;
        if (dll_holdoff_en)
            dll_holdoff_timer <= dll_holdoff_timer - 1;
    end
end



// Timer
//
//      This code runs a simple timer which counts off
//      both the reset timer at startup and the refresh
//      timer during normal operation.
//

always @(posedge CLK or negedge RESET_N) 
begin
    if (RESET_N==0 ) 
    begin
        timer <= 4;
        inited <= 0;
        timer_reset <= 0;
        load <= 1;
    end
    else 
    begin
        if (SD_INIT == 1 | load == 1) 
        begin
            timer <= DELAY;
            inited <= 0;
            timer_reset <= 0;
            load <= 0;
        end
        else 
        begin
        //SDR
          if (M_REQ==1 & S_ACK==1)
              inited <= 1;
          
          if (timer_reset==1)
              timer <= REF;
          else
              timer <= timer - 1;
          if (timer==0)
              timer_reset <= 1;
          else
              timer_reset <= 0;
        end
    end
end

// Read/Write Requests
//
//      read and write requests are masked until initialization
//      has been completed
//

assign   write_req = W_REQ & inited;
assign   read_req  = R_REQ & inited;

endmodule
