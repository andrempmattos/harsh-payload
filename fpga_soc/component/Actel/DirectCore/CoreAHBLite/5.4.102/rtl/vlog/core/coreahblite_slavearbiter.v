// ********************************************************************/
// Actel Corporation Proprietary and Confidential
// Copyright 2013 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description:	CoreAHBLite slave arbiter logic for
//				matrix (4 masters by 16 slaves)
//
//
// SVN Revision Information:
// SVN $Revision: 23120 $
// SVN $Date: 2014-07-17 19:56:23 +0530 (Thu, 17 Jul 2014) $
//
//
// *********************************************************************/
`timescale 1ns/1ps
module COREAHBLITE_SLAVEARBITER #( parameter SYNC_RESET = 0)
(
input						HCLK,
input						HRESETN,
input			[3:0]		MADDRSEL,
input						ADDRPHEND,
input						M0GATEDHMASTLOCK,
input						M1GATEDHMASTLOCK,
input						M2GATEDHMASTLOCK,
input						M3GATEDHMASTLOCK,
output	reg		[3:0]		MASTERADDRINPROG
);
localparam M0EXTEND			= 4'b0000;
localparam M0DONE			= 4'b0001;
localparam M0LOCK			= 4'b0010;
localparam M0LOCKEXTEND		= 4'b0011;
localparam M1EXTEND			= 4'b0100;
localparam M1DONE			= 4'b0101;
localparam M1LOCK			= 4'b0110;
localparam M1LOCKEXTEND		= 4'b0111;
localparam M2EXTEND			= 4'b1000;
localparam M2DONE			= 4'b1001;
localparam M2LOCK			= 4'b1010;
localparam M2LOCKEXTEND		= 4'b1011;
localparam M3EXTEND			= 4'b1100;
localparam M3DONE			= 4'b1101;
localparam M3LOCK			= 4'b1110;
localparam M3LOCKEXTEND		= 4'b1111;
localparam MASTER_0			= 4'b0001;
localparam MASTER_1			= 4'b0010;
localparam MASTER_2			= 4'b0100;
localparam MASTER_3			= 4'b1000;
localparam MASTER_NONE		= 4'b0000;
reg [127:0] state_name;
reg				[3:0]		arbRegSMNextState;
reg				[3:0]		arbRegSMCurrentState;
wire aresetn;
wire sresetn; 
assign aresetn = (SYNC_RESET==1) ? 1'b1 : HRESETN;
assign sresetn = (SYNC_RESET==1) ? HRESETN : 1'b1;

    always @ ( * )
     begin
        MASTERADDRINPROG = MASTER_NONE;
        case ( arbRegSMCurrentState )
        M3DONE:
        begin
            state_name = "M3DONE";
            if ( MADDRSEL[0] )
            begin
                if ( M0GATEDHMASTLOCK )
                    arbRegSMNextState = M0LOCK;
                else
                begin
                    MASTERADDRINPROG = MASTER_0;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M0DONE;
                    else
                        arbRegSMNextState = M0EXTEND;
                end
            end
            else if ( MADDRSEL[1] )
            begin
                if ( M1GATEDHMASTLOCK )
                    arbRegSMNextState = M1LOCK;
                else
                begin
                    MASTERADDRINPROG = MASTER_1;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M1DONE;
                    else
                        arbRegSMNextState = M1EXTEND;
                end
            end
            else if ( MADDRSEL[2] )
            begin
                if ( M2GATEDHMASTLOCK )
                    arbRegSMNextState = M2LOCK;
                else
                begin
                    MASTERADDRINPROG = MASTER_2;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M2DONE;
                    else
                        arbRegSMNextState = M2EXTEND;
                end
            end
            else if ( MADDRSEL[3] )
            begin
                if ( M3GATEDHMASTLOCK )
                    arbRegSMNextState = M3LOCK;
                else
                begin
                    MASTERADDRINPROG = MASTER_3;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M3DONE;
                    else
                        arbRegSMNextState = M3EXTEND;
                end
            end
            else
            begin
                arbRegSMNextState = M3DONE;
            end
        end
        M2DONE:
        begin
            state_name = "M2DONE";
            if ( MADDRSEL[3] )
            begin
                if ( M3GATEDHMASTLOCK )
                    arbRegSMNextState = M3LOCK;
                else
                begin
                    MASTERADDRINPROG = MASTER_3;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M3DONE;
                    else
                        arbRegSMNextState = M3EXTEND;
                end
            end
            else if ( MADDRSEL[0] )
            begin
                if ( M0GATEDHMASTLOCK )
                    arbRegSMNextState = M0LOCK;
                else
                begin
                    MASTERADDRINPROG = MASTER_0;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M0DONE;
                    else
                        arbRegSMNextState = M0EXTEND;
                end
            end
            else if ( MADDRSEL[1] )
            begin
                if ( M1GATEDHMASTLOCK )
                    arbRegSMNextState = M1LOCK;
                else
                begin
                    MASTERADDRINPROG = MASTER_1;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M1DONE;
                    else
                        arbRegSMNextState = M1EXTEND;
                end
            end
            else if ( MADDRSEL[2] )
            begin
                if ( M2GATEDHMASTLOCK )
                    arbRegSMNextState = M2LOCK;
                else
                begin
                    MASTERADDRINPROG = MASTER_2;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M2DONE;
                    else
                        arbRegSMNextState = M2EXTEND;
                end
            end
            else
            begin
                arbRegSMNextState = M2DONE;
            end
        end
        M1DONE:
        begin
            state_name = "M1DONE";
            if ( MADDRSEL[2] )
            begin
                if ( M2GATEDHMASTLOCK )
                    arbRegSMNextState = M2LOCK;
                else
                begin
                    MASTERADDRINPROG = MASTER_2;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M2DONE;
                    else
                        arbRegSMNextState = M2EXTEND;
                end
            end
            else if ( MADDRSEL[3] )
            begin
                if ( M3GATEDHMASTLOCK )
                    arbRegSMNextState = M3LOCK;
                else
                begin
                    MASTERADDRINPROG = MASTER_3;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M3DONE;
                    else
                        arbRegSMNextState = M3EXTEND;
                end
            end
            else if ( MADDRSEL[0] )
            begin
                if ( M0GATEDHMASTLOCK )
                    arbRegSMNextState = M0LOCK;
                else
                begin
                    MASTERADDRINPROG = MASTER_0;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M0DONE;
                    else
                        arbRegSMNextState = M0EXTEND;
                end
            end
            else if ( MADDRSEL[1] )
            begin
                if ( M1GATEDHMASTLOCK )
                    arbRegSMNextState = M1LOCK;
                else
                begin
                    MASTERADDRINPROG = MASTER_1;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M1DONE;
                    else
                        arbRegSMNextState = M1EXTEND;
                end
            end
            else
            begin
                arbRegSMNextState = M1DONE;
            end
        end
        M0DONE:
        begin
            state_name = "M0DONE";
            if ( MADDRSEL[1] )
            begin
                if ( M1GATEDHMASTLOCK )
                    arbRegSMNextState = M1LOCK;
                else
                begin
                    MASTERADDRINPROG = MASTER_1;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M1DONE;
                    else
                        arbRegSMNextState = M1EXTEND;
                end
            end
            else if ( MADDRSEL[2] )
            begin
                if ( M2GATEDHMASTLOCK )
                    arbRegSMNextState = M2LOCK;
                else
                begin
                    MASTERADDRINPROG = MASTER_2;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M2DONE;
                    else
                        arbRegSMNextState = M2EXTEND;
                end
            end
            else if ( MADDRSEL[3] )
            begin
                if ( M3GATEDHMASTLOCK )
                    arbRegSMNextState = M3LOCK;
                else
                begin
                    MASTERADDRINPROG = MASTER_3;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M3DONE;
                    else
                        arbRegSMNextState = M3EXTEND;
                end
            end
            else if ( MADDRSEL[0] )
            begin
                if ( M0GATEDHMASTLOCK )
                    arbRegSMNextState = M0LOCK;
                else
                begin
                    MASTERADDRINPROG = MASTER_0;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M0DONE;
                    else
                        arbRegSMNextState = M0EXTEND;
                end
            end
            else
            begin
                arbRegSMNextState = M0DONE;
            end
        end
        M0EXTEND:
        begin
            state_name = "M0EXTEND";
            MASTERADDRINPROG = MASTER_0;
            if ( ADDRPHEND )
                arbRegSMNextState = M0DONE;
            else
                arbRegSMNextState = M0EXTEND;
        end
        M1EXTEND:
        begin
            state_name = "M1EXTEND";
            MASTERADDRINPROG = MASTER_1;
            if ( ADDRPHEND )
                arbRegSMNextState = M1DONE;
            else
                arbRegSMNextState = M1EXTEND;
        end
        M2EXTEND:
        begin
            state_name = "M2EXTEND";
            MASTERADDRINPROG = MASTER_2;
            if ( ADDRPHEND )
                arbRegSMNextState = M2DONE;
            else
                arbRegSMNextState = M2EXTEND;
        end
        M3EXTEND:
        begin
            state_name = "M3EXTEND";
            MASTERADDRINPROG = MASTER_3;
            if ( ADDRPHEND )
                arbRegSMNextState = M3DONE;
            else
                arbRegSMNextState = M3EXTEND;
        end
        M0LOCK:
        begin
            state_name = "M0LOCK";
            if ( M0GATEDHMASTLOCK )
                if ( MADDRSEL[0] )
                begin
                    MASTERADDRINPROG = MASTER_0;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M0LOCK;
                    else
                        arbRegSMNextState = M0LOCKEXTEND;
                end
                else
                    arbRegSMNextState = M0LOCK;
            else
                arbRegSMNextState = M0DONE;
        end
        M0LOCKEXTEND:
        begin
            state_name = "M0LOCKEXTEND";
            MASTERADDRINPROG = MASTER_0;
            if ( ADDRPHEND )
                arbRegSMNextState = M0LOCK;
            else
                arbRegSMNextState = M0LOCKEXTEND;
        end
        M1LOCK:
        begin
            state_name = "M1LOCK";
            if ( M1GATEDHMASTLOCK )
                if ( MADDRSEL[1] )
                begin
                    MASTERADDRINPROG = MASTER_1;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M1LOCK;
                    else
                        arbRegSMNextState = M1LOCKEXTEND;
                end
                else
                    arbRegSMNextState = M1LOCK;
            else
                arbRegSMNextState = M1DONE;
        end
        M1LOCKEXTEND:
        begin
            state_name = "M1LOCKEXTEND";
            MASTERADDRINPROG = MASTER_1;
            if ( ADDRPHEND )
                arbRegSMNextState = M1LOCK;
            else
                arbRegSMNextState = M1LOCKEXTEND;
        end
        M2LOCK:
        begin
            state_name = "M2LOCK";
            if ( M2GATEDHMASTLOCK )
                if ( MADDRSEL[2] )
                begin
                    MASTERADDRINPROG = MASTER_2;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M2LOCK;
                    else
                        arbRegSMNextState = M2LOCKEXTEND;
                end
                else
                    arbRegSMNextState = M2LOCK;
            else
                arbRegSMNextState = M2DONE;
        end
        M2LOCKEXTEND:
        begin
            state_name = "M2LOCKEXTEND";
            MASTERADDRINPROG = MASTER_2;
            if ( ADDRPHEND )
                arbRegSMNextState = M2LOCK;
            else
                arbRegSMNextState = M2LOCKEXTEND;
        end
        M3LOCK:
        begin
            state_name = "M3LOCK";
            if ( M3GATEDHMASTLOCK )
                if ( MADDRSEL[3] )
                begin
                    MASTERADDRINPROG = MASTER_3;
                    if ( ADDRPHEND )
                        arbRegSMNextState = M3LOCK;
                    else
                        arbRegSMNextState = M3LOCKEXTEND;
                end
                else
                    arbRegSMNextState = M3LOCK;
            else
                arbRegSMNextState = M3DONE;
        end
        M3LOCKEXTEND:
        begin
            state_name = "M3LOCKEXTEND";
            MASTERADDRINPROG = MASTER_3;
            if ( ADDRPHEND )
                arbRegSMNextState = M3LOCK;
            else
                arbRegSMNextState = M3LOCKEXTEND;
        end
        default:
            arbRegSMNextState = M3DONE;
       endcase
     end
    always @ ( posedge HCLK or negedge aresetn )
    begin
        if (( !aresetn ) ||  ( !sresetn ))
            arbRegSMCurrentState <= M3DONE;
        else
            arbRegSMCurrentState <= arbRegSMNextState;
    end
endmodule 
