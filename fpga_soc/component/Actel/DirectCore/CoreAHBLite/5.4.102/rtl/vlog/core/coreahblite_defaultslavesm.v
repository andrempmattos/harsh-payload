// ********************************************************************/
// Actel Corporation Proprietary and Confidential
// Copyright 2010 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description:	CoreAHBLite default slave state machine logic for
//				matrix (2 masters by 16 slaves)
//
//
// SVN Revision Information:
// SVN $Revision: 23120 $
// SVN $Date: 2014-07-17 19:56:23 +0530 (Thu, 17 Jul 2014) $
//
//
// *********************************************************************/
`timescale 1ns/1ps
module COREAHBLITE_DEFAULTSLAVESM
(
input						HCLK,
input						HRESETN,
input						DEFSLAVEDATASEL,
output	reg					DEFSLAVEDATAREADY,
output	reg					HRESP_DEFAULT
);
parameter SYNC_RESET = 0;

localparam IDLE				= 1'b0;
localparam HRESPEXTEND		= 1'b1;
reg							defSlaveSMNextState;
reg							defSlaveSMCurrentState;
wire aresetn;
wire sresetn; 
assign aresetn = (SYNC_RESET==1) ? 1'b1 : HRESETN;
assign sresetn = (SYNC_RESET==1) ? HRESETN : 1'b1;
 
    always @ ( * )
    begin
        DEFSLAVEDATAREADY = 1'b1;
        HRESP_DEFAULT = 1'b0;
        case ( defSlaveSMCurrentState )
        IDLE:
        begin
            if ( DEFSLAVEDATASEL )
            begin
                DEFSLAVEDATAREADY = 1'b0;
                HRESP_DEFAULT = 1'b1;
                defSlaveSMNextState = HRESPEXTEND;
            end
            else
                defSlaveSMNextState = IDLE;
        end
        HRESPEXTEND:
        begin
            HRESP_DEFAULT = 1'b1;
            defSlaveSMNextState = IDLE;
        end
        default:
            defSlaveSMNextState = IDLE;
        endcase
    end
    always @ ( posedge HCLK or negedge aresetn )
    begin
        if (( !aresetn ) || ( !sresetn ))
            defSlaveSMCurrentState <= IDLE;
        else
            defSlaveSMCurrentState <= defSlaveSMNextState;
    end
endmodule 
