// ********************************************************************/
// Actel Corporation Proprietary and Confidential
// Copyright 2010 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description:	CoreAHBLite address decode logic
//				for master 0 and master 1
//
//
// SVN Revision Information:
// SVN $Revision: 22340 $
// SVN $Date: 2014-04-11 21:59:35 +0530 (Fri, 11 Apr 2014) $
//
//
// *********************************************************************/
`timescale 1ns/1ps
module COREAHBLITE_ADDRDEC #(
parameter [2:0]MEMSPACE				= 0,
parameter [0:0]HADDR_SHG_CFG		= 1,
parameter [15:0]SC                  = 0,
parameter [16:0]M_AHBSLOTENABLE		= (2**17)-1
)
(
input			[31:0]	ADDR,
input					REMAP,
output	wire	[16:0]	ADDRDEC,	
output	wire	[31:0]	ABSOLUTEADDR,
output  wire            RESERVEDDEC
);
localparam MSB_ADDR = (MEMSPACE == 1) ? 31 :
                      (MEMSPACE == 2) ? 27 :
                      (MEMSPACE == 3) ? 23 :
                      (MEMSPACE == 4) ? 19 :
                      (MEMSPACE == 5) ? 15 :
                      (MEMSPACE == 6) ? 11 :
                                        31 ;
localparam SLAVE_0		= 16'b0000000000000001;
localparam SLAVE_1		= 16'b0000000000000010;
localparam SLAVE_2		= 16'b0000000000000100;
localparam SLAVE_3		= 16'b0000000000001000;
localparam SLAVE_4		= 16'b0000000000010000;
localparam SLAVE_5		= 16'b0000000000100000;
localparam SLAVE_6		= 16'b0000000001000000;
localparam SLAVE_7		= 16'b0000000010000000;
localparam SLAVE_8		= 16'b0000000100000000;
localparam SLAVE_9		= 16'b0000001000000000;
localparam SLAVE_10		= 16'b0000010000000000;
localparam SLAVE_11		= 16'b0000100000000000;
localparam SLAVE_12		= 16'b0001000000000000;
localparam SLAVE_13		= 16'b0010000000000000;
localparam SLAVE_14		= 16'b0100000000000000;
localparam SLAVE_15		= 16'b1000000000000000;
localparam NONE			= 16'b0000000000000000;
reg		[15:0]	sdec_raw;
reg		[15:0]	sdec;
reg				s16dec;
reg		[31:0]	absaddr;
wire	[16:0]	ADDRDEC_pre;
wire    [3:0]   slotdec;
wire            m0_hugeslotdec;
wire            m0_otherslotsdec;
generate
begin: g_modes
	if (MEMSPACE == 0)
    begin: g_mem_0
        assign m0_hugeslotdec   = (ADDR[31]==1'b1);
        assign m0_otherslotsdec = (ADDR[30:20]==11'h000);
        assign slotdec          = ADDR[19:16];
        always @ ( * )
        begin
            absaddr[31:0]	= ADDR[31:0];
            sdec_raw[15:0]	= NONE;
            if (m0_hugeslotdec)
            begin
                s16dec = 1'b1;
                if (HADDR_SHG_CFG == 0)
                begin
                    absaddr[31] = 1'b0;
                end
                else
                begin
                    absaddr[31] = 1'b1;
                end
			end
            else if (m0_otherslotsdec)
            begin
                case (slotdec)
                4'h0:
                begin
                    if (REMAP==1'b0)
                    begin
                        sdec_raw[15:0]	= SLAVE_0;
                    end
                    else
                    begin
                        absaddr[16]	= 1'b1;
                        sdec_raw[15:0]	= SLAVE_1;
                    end
                end
                4'h1:
                begin
                    if (REMAP==1'b0)
                    begin
                        sdec_raw[15:0]	= SLAVE_1;
                    end
                    else
                    begin
                        absaddr[16]	= 1'b0;
                        sdec_raw[15:0]	= SLAVE_0;
                    end
                end
                4'h2: sdec_raw[15:0] = SLAVE_2;
                4'h3: sdec_raw[15:0] = SLAVE_3;
                4'h4: sdec_raw[15:0] = SLAVE_4;
                4'h5: sdec_raw[15:0] = SLAVE_5;
                4'h6: sdec_raw[15:0] = SLAVE_6;
                4'h7: sdec_raw[15:0] = SLAVE_7;
                4'h8: sdec_raw[15:0] = SLAVE_8;
                4'h9: sdec_raw[15:0] = SLAVE_9;
                4'hA: sdec_raw[15:0] = SLAVE_10;
                4'hB: sdec_raw[15:0] = SLAVE_11;
                4'hC: sdec_raw[15:0] = SLAVE_12;
                4'hD: sdec_raw[15:0] = SLAVE_13;
                4'hE: sdec_raw[15:0] = SLAVE_14;
                4'hF: sdec_raw[15:0] = SLAVE_15;
                endcase
            end
            sdec = sdec_raw;
            s16dec = m0_hugeslotdec;
        end
        assign RESERVEDDEC = m0_hugeslotdec==1'b0 & m0_otherslotsdec==1'b0;
    end
    else
    begin: g_mem_1
        assign m0_hugeslotdec   = 1'b0;
        assign m0_otherslotsdec = 1'b0;
        assign slotdec          = ADDR[MSB_ADDR:MSB_ADDR-3];
        always @ ( * )
        begin
            absaddr[31:0] = ADDR[31:0];
            case (slotdec)
            4'h0:
            begin
                if (REMAP == 1'b0)
                    sdec_raw[15:0]	= SLAVE_0;
                else
                begin
                    absaddr[MSB_ADDR-3]	= 1'b1;
                    sdec_raw[15:0]	= SLAVE_1;
                end
            end
            4'h1:
            begin
                if (REMAP == 1'b0)
                    sdec_raw[15:0]	= SLAVE_1;
                else
                begin
                    absaddr[MSB_ADDR-3]	= 1'b0;
                    sdec_raw[15:0]	= SLAVE_0;
                end
            end
            4'h2: sdec_raw[15:0] = SLAVE_2;
            4'h3: sdec_raw[15:0] = SLAVE_3;
            4'h4: sdec_raw[15:0] = SLAVE_4;
            4'h5: sdec_raw[15:0] = SLAVE_5;
            4'h6: sdec_raw[15:0] = SLAVE_6;
            4'h7: sdec_raw[15:0] = SLAVE_7;
            4'h8: sdec_raw[15:0] = SLAVE_8;
            4'h9: sdec_raw[15:0] = SLAVE_9;
            4'hA: sdec_raw[15:0] = SLAVE_10;
            4'hB: sdec_raw[15:0] = SLAVE_11;
            4'hC: sdec_raw[15:0] = SLAVE_12;
            4'hD: sdec_raw[15:0] = SLAVE_13;
            4'hE: sdec_raw[15:0] = SLAVE_14;
            4'hF: sdec_raw[15:0] = SLAVE_15;
            endcase
            sdec = sdec_raw & ~SC;      
            s16dec = |(sdec_raw & SC);  
        end
        assign RESERVEDDEC = 1'b0;
    end
	assign ADDRDEC_pre[16:0]	= {s16dec,sdec[15:0]};
	assign ABSOLUTEADDR[31:0]	= absaddr[31:0];
	assign ADDRDEC[16:0]		= ADDRDEC_pre[16:0];
end
endgenerate
endmodule 
