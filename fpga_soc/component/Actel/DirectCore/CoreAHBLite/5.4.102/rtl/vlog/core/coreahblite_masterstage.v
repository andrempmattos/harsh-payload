// ********************************************************************/
// Actel Corporation Proprietary and Confidential
// Copyright 2010 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description:	CoreAHBLite master stage logic for
//				matrix (2 masters by 16 slaves),
//				instantiates the following modules:
//				COREAHBLITE_ADDRDEC, COREAHBLITE_DEFAULTSLAVESM
//
//
// SVN Revision Information:
// SVN $Revision: 33877 $
// SVN $Date: 2019-06-24 17:11:39 +0530 (Mon, 24 Jun 2019) $
//
//
// ***********************************************************************/
`timescale 1ns/1ps
module COREAHBLITE_MASTERSTAGE #(
parameter [2:0]MEMSPACE				= 0,
parameter [0:0]HADDR_SHG_CFG		= 1,
parameter [15:0]SC                  = 0,
parameter [16:0]M_AHBSLOTENABLE		= (2**17)-1,
parameter SYNC_RESET = 0
)
(
input						HCLK,
input						HRESETN,
input		[31:0]			HADDR,
input						HMASTLOCK,
input		[2:0]			HSIZE,
input		[1:0]			HTRANS, // AI : defined vector 2 bit
input       [2:0]           HBURST, // AI : Added input port
input						HWRITE,
output	reg					HRESP,
output	reg		[31:0]		HRDATA,
output	wire				HREADY_M,
input						REMAP,
input			[16:0]		SADDRREADY,			
input			[16:0]		SDATAREADY,			
input			[16:0]		SHRESP,				
output	wire	[31:0]		GATEDHADDR,			
output	reg					GATEDHMASTLOCK,		
output	reg		[2:0]		GATEDHSIZE,			
output	reg		[1:0]		GATEDHTRANS,    // AI 		
output	reg					GATEDHWRITE,		
output	reg		[2:0]			GATEDHBURST,// AI	: added output port	
output	wire	[16:0]		SADDRSEL,			
output	wire	[16:0]		SDATASEL,			
output	reg					PREVDATASLAVEREADY,	
input			[31:0]		HRDATA_S0,
input						HREADYOUT_S0,
input			[31:0]		HRDATA_S1,
input						HREADYOUT_S1,
input			[31:0]		HRDATA_S2,
input						HREADYOUT_S2,
input			[31:0]		HRDATA_S3,
input						HREADYOUT_S3,
input			[31:0]		HRDATA_S4,
input						HREADYOUT_S4,
input			[31:0]		HRDATA_S5,
input						HREADYOUT_S5,
input			[31:0]		HRDATA_S6,
input						HREADYOUT_S6,
input			[31:0]		HRDATA_S7,
input						HREADYOUT_S7,
input			[31:0]		HRDATA_S8,
input						HREADYOUT_S8,
input			[31:0]		HRDATA_S9,
input						HREADYOUT_S9,
input			[31:0]		HRDATA_S10,
input						HREADYOUT_S10,
input			[31:0]		HRDATA_S11,
input						HREADYOUT_S11,
input			[31:0]		HRDATA_S12,
input						HREADYOUT_S12,
input			[31:0]		HRDATA_S13,
input						HREADYOUT_S13,
input			[31:0]		HRDATA_S14,
input						HREADYOUT_S14,
input			[31:0]		HRDATA_S15,
input						HREADYOUT_S15,
input			[31:0]		HRDATA_S16,
input						HREADYOUT_S16
);
localparam IDLE				= 1'b0;
localparam REGISTERED		= 1'b1;
localparam SLAVE_NONE		=  17'b0_0000_0000_0000_0000;
reg				[31:0]		PREGATEDHADDR;
reg							masterRegAddrSel;		
reg							d_masterRegAddrSel;		
reg							masterAddrClockEnable;	
reg				[31:0]		regHADDR;				
reg							regHMASTLOCK;			
reg				[2:0]		regHSIZE;				
reg				[1:0]		regHTRANS;	// AI : defined vector 2 bit			
reg				[2:0]		regHBURST;	// AI : Added reg 			
reg							regHWRITE;				
reg							addrRegSMCurrentState;
reg							addrRegSMNextState;
wire			[16:0]		sAddrDec;				
reg				[16:0]		SADDRSELInt;
reg				[16:0]		SDATASELInt;
wire						DEFSLAVEDATAREADY;
wire						HRESP_DEFAULT;
wire						DEFSLAVEDATASEL;
wire						DEFSLAVEDATASEL0;
wire						DEFSLAVEDATASEL1;
wire						DEFSLAVEDATASEL2;
wire						DEFSLAVEDATASEL3;
wire						DEFSLAVEDATASEL4;
wire						DEFSLAVEDATASEL5;
wire						DEFSLAVEDATASEL6;
wire						DEFSLAVEDATASEL7;
wire						DEFSLAVEDATASEL8;
wire						DEFSLAVEDATASEL9;
wire						DEFSLAVEDATASEL10;
wire						DEFSLAVEDATASEL11;
wire						DEFSLAVEDATASEL12;
wire						DEFSLAVEDATASEL13;
wire						DEFSLAVEDATASEL14;
wire						DEFSLAVEDATASEL15;
wire						DEFSLAVEDATASEL16;
wire						ReservedDecode;
reg							RESERVEDADDRSELInt;
reg							RESERVEDDATASELInt;
reg							HREADY_M_pre;
wire aresetn;
wire sresetn; 
assign aresetn = (SYNC_RESET==1) ? 1'b1 : HRESETN;
assign sresetn = (SYNC_RESET==1) ? HRESETN : 1'b1;
assign SADDRSEL				= SADDRSELInt[16:0]; 
assign SDATASEL				= SDATASELInt[16:0];
assign DEFSLAVEDATASEL0		= (SDATASELInt[0]  & (!M_AHBSLOTENABLE[0] ));
assign DEFSLAVEDATASEL1		= (SDATASELInt[1]  & (!M_AHBSLOTENABLE[1] ));
assign DEFSLAVEDATASEL2		= (SDATASELInt[2]  & (!M_AHBSLOTENABLE[2] ));
assign DEFSLAVEDATASEL3		= (SDATASELInt[3]  & (!M_AHBSLOTENABLE[3] ));
assign DEFSLAVEDATASEL4		= (SDATASELInt[4]  & (!M_AHBSLOTENABLE[4] ));
assign DEFSLAVEDATASEL5		= (SDATASELInt[5]  & (!M_AHBSLOTENABLE[5] ));
assign DEFSLAVEDATASEL6		= (SDATASELInt[6]  & (!M_AHBSLOTENABLE[6] ));
assign DEFSLAVEDATASEL7		= (SDATASELInt[7]  & (!M_AHBSLOTENABLE[7] ));
assign DEFSLAVEDATASEL8		= (SDATASELInt[8]  & (!M_AHBSLOTENABLE[8] ));
assign DEFSLAVEDATASEL9		= (SDATASELInt[9]  & (!M_AHBSLOTENABLE[9] ));
assign DEFSLAVEDATASEL10	= (SDATASELInt[10] & (!M_AHBSLOTENABLE[10]));
assign DEFSLAVEDATASEL11	= (SDATASELInt[11] & (!M_AHBSLOTENABLE[11]));
assign DEFSLAVEDATASEL12	= (SDATASELInt[12] & (!M_AHBSLOTENABLE[12]));
assign DEFSLAVEDATASEL13	= (SDATASELInt[13] & (!M_AHBSLOTENABLE[13]));
assign DEFSLAVEDATASEL14	= (SDATASELInt[14] & (!M_AHBSLOTENABLE[14]));
assign DEFSLAVEDATASEL15	= (SDATASELInt[15] & (!M_AHBSLOTENABLE[15]));
assign DEFSLAVEDATASEL16	= (SDATASELInt[16] & (!M_AHBSLOTENABLE[16]));
assign DEFSLAVEDATASEL		=	(
									DEFSLAVEDATASEL0   | DEFSLAVEDATASEL1   |
									DEFSLAVEDATASEL2   | DEFSLAVEDATASEL3   |
									DEFSLAVEDATASEL4   | DEFSLAVEDATASEL5   |
									DEFSLAVEDATASEL6   | DEFSLAVEDATASEL7   |
									DEFSLAVEDATASEL8   | DEFSLAVEDATASEL9   |
									DEFSLAVEDATASEL10  | DEFSLAVEDATASEL11  |
									DEFSLAVEDATASEL12  | DEFSLAVEDATASEL13  |
									DEFSLAVEDATASEL14  | DEFSLAVEDATASEL15  |
									DEFSLAVEDATASEL16
									| RESERVEDDATASELInt
								);
always @ (posedge HCLK or negedge aresetn)
begin
	if ((!aresetn) || (!sresetn))
	begin
		regHADDR		<= 32'h0;
		regHMASTLOCK	<= 1'b0;
		regHSIZE		<= 3'b0;
		regHTRANS		<= 2'b0;
		regHWRITE		<= 1'b0;
		regHBURST       <= 3'b0; // AI : Added for burst 
	end
	else
	begin
		if (masterAddrClockEnable)
		begin
			regHADDR		<= HADDR;
			regHMASTLOCK	<= HMASTLOCK;
			regHSIZE		<= HSIZE;
			regHTRANS		<= HTRANS;
			regHWRITE		<= HWRITE;
			regHBURST       <= HBURST; // AI : Added for burst 
		end
	end
end
always @ (*)
begin
	if (masterRegAddrSel==1'b0)
	begin
		PREGATEDHADDR	= HADDR;
		GATEDHMASTLOCK	= HMASTLOCK;
		GATEDHSIZE		= HSIZE;
		GATEDHTRANS		= HTRANS;
		GATEDHWRITE		= HWRITE;
		GATEDHBURST     = HBURST;       // AI : Added for burst 
	end
	else
	begin
		PREGATEDHADDR	= regHADDR;
		GATEDHMASTLOCK	= regHMASTLOCK;
		GATEDHSIZE		= regHSIZE;
		GATEDHTRANS		= regHTRANS;
		GATEDHWRITE		= regHWRITE;
		GATEDHBURST     = regHBURST;    //  AI : Added for burst 
		
	end
end
COREAHBLITE_ADDRDEC #(
	.MEMSPACE(MEMSPACE),
    .HADDR_SHG_CFG(HADDR_SHG_CFG),
    .SC(SC),
	.M_AHBSLOTENABLE(M_AHBSLOTENABLE)
) address_decode (
	.ADDR(PREGATEDHADDR),
	.REMAP(REMAP),
	.ADDRDEC(sAddrDec[16:0]),
	.ABSOLUTEADDR(GATEDHADDR[31:0]),
    .RESERVEDDEC(ReservedDecode)
);
always @ (*)
begin
	if ((GATEDHTRANS == 3) || (GATEDHTRANS == 2) || (GATEDHTRANS == 1))
	begin 
		SADDRSELInt			= sAddrDec;
		RESERVEDADDRSELInt	= ReservedDecode;
	end
	else
	begin
		SADDRSELInt			= SLAVE_NONE;	
		RESERVEDADDRSELInt	= 1'b0;
	end
end
always @ (posedge HCLK or negedge aresetn)
begin
	if ((!aresetn) || (!sresetn))
		SDATASELInt		<= SLAVE_NONE; 
	else
		if (PREVDATASLAVEREADY)
			SDATASELInt		<= SADDRSELInt;
end
always @ (posedge HCLK or negedge aresetn)
begin
	if ((!aresetn) || (!sresetn))
	begin
		RESERVEDDATASELInt	<= 1'b0;
	end
	else if (PREVDATASLAVEREADY)
	begin
		RESERVEDDATASELInt	<= RESERVEDADDRSELInt;
	end
end
always @ (*)
begin
	if (RESERVEDDATASELInt)
	begin
		HREADY_M_pre		= DEFSLAVEDATAREADY;
		HRESP				= HRESP_DEFAULT;
		HRDATA				= 32'h0;
		PREVDATASLAVEREADY	= DEFSLAVEDATAREADY;
	end
	else
		casez (SDATASELInt[16:0])
		17'b????????????????1:
		begin
			if (M_AHBSLOTENABLE[0])
			begin
				HREADY_M_pre		= SDATAREADY[0];
				HRESP				= SHRESP[0];
				HRDATA				= HRDATA_S0;
				PREVDATASLAVEREADY	= HREADYOUT_S0;
			end
			else
			begin
				HREADY_M_pre		= DEFSLAVEDATAREADY;
				HRESP				= HRESP_DEFAULT;
				HRDATA				= 32'h0;
				PREVDATASLAVEREADY	= DEFSLAVEDATAREADY;
			end
		end
		17'b???????????????1?:
		begin
			if (M_AHBSLOTENABLE[1])
			begin
				HREADY_M_pre		= SDATAREADY[1];
				HRESP				= SHRESP[1];
				HRDATA				= HRDATA_S1;
				PREVDATASLAVEREADY	= HREADYOUT_S1;
			end
			else
			begin
				HREADY_M_pre		= DEFSLAVEDATAREADY;
				HRESP				= HRESP_DEFAULT;
				HRDATA				= 32'h0;
				PREVDATASLAVEREADY	= DEFSLAVEDATAREADY;
			end
		end
		17'b??????????????1??:
		begin
			if (M_AHBSLOTENABLE[2])
			begin
				HREADY_M_pre		= SDATAREADY[2];
				HRESP				= SHRESP[2];
				HRDATA				= HRDATA_S2;
				PREVDATASLAVEREADY	= HREADYOUT_S2;
			end
			else
			begin
				HREADY_M_pre		= DEFSLAVEDATAREADY;
				HRESP				= HRESP_DEFAULT;
				HRDATA				= 32'h0;
				PREVDATASLAVEREADY	= DEFSLAVEDATAREADY;
			end
		end
		17'b?????????????1???:
		begin
			if (M_AHBSLOTENABLE[3])
			begin
				HREADY_M_pre		= SDATAREADY[3];
				HRESP				= SHRESP[3];
				HRDATA				= HRDATA_S3;
				PREVDATASLAVEREADY	= HREADYOUT_S3;
			end
			else
			begin
				HREADY_M_pre		= DEFSLAVEDATAREADY;
				HRESP				= HRESP_DEFAULT;
				HRDATA				= 32'h0;
				PREVDATASLAVEREADY	= DEFSLAVEDATAREADY;
			end
		end
		17'b????????????1????:
		begin
			if (M_AHBSLOTENABLE[4])
			begin
				HREADY_M_pre		= SDATAREADY[4];
				HRESP				= SHRESP[4];
				HRDATA				= HRDATA_S4;
				PREVDATASLAVEREADY	= HREADYOUT_S4;
			end
			else
			begin
				HREADY_M_pre		= DEFSLAVEDATAREADY;
				HRESP				= HRESP_DEFAULT;
				HRDATA				= 32'h0;
				PREVDATASLAVEREADY	= DEFSLAVEDATAREADY;
			end
		end
		17'b???????????1?????:
		begin
			if (M_AHBSLOTENABLE[5])
			begin
				HREADY_M_pre		= SDATAREADY[5];
				HRESP				= SHRESP[5];
				HRDATA				= HRDATA_S5;
				PREVDATASLAVEREADY	= HREADYOUT_S5;
			end
			else
			begin
				HREADY_M_pre		= DEFSLAVEDATAREADY;
				HRESP				= HRESP_DEFAULT;
				HRDATA				= 32'h0;
				PREVDATASLAVEREADY	= DEFSLAVEDATAREADY;
			end
		end
		17'b??????????1??????:
		begin
			if (M_AHBSLOTENABLE[6])
			begin
				HREADY_M_pre		= SDATAREADY[6];
				HRESP				= SHRESP[6];
				HRDATA				= HRDATA_S6;
				PREVDATASLAVEREADY	= HREADYOUT_S6;
			end
			else
			begin
				HREADY_M_pre		= DEFSLAVEDATAREADY;
				HRESP				= HRESP_DEFAULT;
				HRDATA				= 32'h0;
				PREVDATASLAVEREADY	= DEFSLAVEDATAREADY;
			end
		end
		17'b?????????1???????:
		begin
			if (M_AHBSLOTENABLE[7])
			begin
				HREADY_M_pre		= SDATAREADY[7];
				HRESP				= SHRESP[7];
				HRDATA				= HRDATA_S7;
				PREVDATASLAVEREADY	= HREADYOUT_S7;
			end
			else
			begin
				HREADY_M_pre		= DEFSLAVEDATAREADY;
				HRESP				= HRESP_DEFAULT;
				HRDATA				= 32'h0;
				PREVDATASLAVEREADY	= DEFSLAVEDATAREADY;
			end
		end
		17'b????????1????????:
		begin
			if (M_AHBSLOTENABLE[8])
			begin
				HREADY_M_pre		= SDATAREADY[8];
				HRESP				= SHRESP[8];
				HRDATA				= HRDATA_S8;
				PREVDATASLAVEREADY	= HREADYOUT_S8;
			end
			else
			begin
				HREADY_M_pre		= DEFSLAVEDATAREADY;
				HRESP				= HRESP_DEFAULT;
				HRDATA				= 32'h0;
				PREVDATASLAVEREADY	= DEFSLAVEDATAREADY;
			end
		end
		17'b???????1?????????:
		begin
			if (M_AHBSLOTENABLE[9])
			begin
				HREADY_M_pre		= SDATAREADY[9];
				HRESP				= SHRESP[9];
				HRDATA				= HRDATA_S9;
				PREVDATASLAVEREADY	= HREADYOUT_S9;
			end
			else
			begin
				HREADY_M_pre		= DEFSLAVEDATAREADY;
				HRESP				= HRESP_DEFAULT;
				HRDATA				= 32'h0;
				PREVDATASLAVEREADY	= DEFSLAVEDATAREADY;
			end
		end
		17'b??????1??????????:
		begin
			if (M_AHBSLOTENABLE[10])
			begin
				HREADY_M_pre		= SDATAREADY[10];
				HRESP				= SHRESP[10];
				HRDATA				= HRDATA_S10;
				PREVDATASLAVEREADY	= HREADYOUT_S10;
			end
			else
			begin
				HREADY_M_pre		= DEFSLAVEDATAREADY;
				HRESP				= HRESP_DEFAULT;
				HRDATA				= 32'h0;
				PREVDATASLAVEREADY	= DEFSLAVEDATAREADY;
			end
		end
		17'b?????1???????????:
		begin
			if (M_AHBSLOTENABLE[11])
			begin
				HREADY_M_pre		= SDATAREADY[11];
				HRESP				= SHRESP[11];
				HRDATA				= HRDATA_S11;
				PREVDATASLAVEREADY	= HREADYOUT_S11;
			end
			else
			begin
				HREADY_M_pre		= DEFSLAVEDATAREADY;
				HRESP				= HRESP_DEFAULT;
				HRDATA				= 32'h0;
				PREVDATASLAVEREADY	= DEFSLAVEDATAREADY;
			end
		end
		17'b????1????????????:
		begin
			if (M_AHBSLOTENABLE[12])
			begin
				HREADY_M_pre		= SDATAREADY[12];
				HRESP				= SHRESP[12];
				HRDATA				= HRDATA_S12;
				PREVDATASLAVEREADY	= HREADYOUT_S12;
			end
			else
			begin
				HREADY_M_pre		= DEFSLAVEDATAREADY;
				HRESP				= HRESP_DEFAULT;
				HRDATA				= 32'h0;
				PREVDATASLAVEREADY	= DEFSLAVEDATAREADY;
			end
		end
		17'b???1?????????????:
		begin
			if (M_AHBSLOTENABLE[13])
			begin
				HREADY_M_pre		= SDATAREADY[13];
				HRESP				= SHRESP[13];
				HRDATA				= HRDATA_S13;
				PREVDATASLAVEREADY	= HREADYOUT_S13;
			end
			else
			begin
				HREADY_M_pre		= DEFSLAVEDATAREADY;
				HRESP				= HRESP_DEFAULT;
				HRDATA				= 32'h0;
				PREVDATASLAVEREADY	= DEFSLAVEDATAREADY;
			end
		end
		17'b??1??????????????:
		begin
			if (M_AHBSLOTENABLE[14])
			begin
				HREADY_M_pre		= SDATAREADY[14];
				HRESP				= SHRESP[14];
				HRDATA				= HRDATA_S14;
				PREVDATASLAVEREADY	= HREADYOUT_S14;
			end
			else
			begin
				HREADY_M_pre		= DEFSLAVEDATAREADY;
				HRESP				= HRESP_DEFAULT;
				HRDATA				= 32'h0;
				PREVDATASLAVEREADY	= DEFSLAVEDATAREADY;
			end
		end
		17'b?1???????????????:
		begin
			if (M_AHBSLOTENABLE[15])
			begin
				HREADY_M_pre		= SDATAREADY[15];
				HRESP				= SHRESP[15];
				HRDATA				= HRDATA_S15;
				PREVDATASLAVEREADY	= HREADYOUT_S15;
			end
			else
			begin
				HREADY_M_pre		= DEFSLAVEDATAREADY;
				HRESP				= HRESP_DEFAULT;
				HRDATA				= 32'h0;
				PREVDATASLAVEREADY	= DEFSLAVEDATAREADY;
			end
		end
		17'b1????????????????:
		begin
			if (M_AHBSLOTENABLE[16])
			begin
				HREADY_M_pre		= SDATAREADY[16];
				HRESP				= SHRESP[16];
				HRDATA				= HRDATA_S16;
				PREVDATASLAVEREADY	= HREADYOUT_S16;
			end
			else
			begin
				HREADY_M_pre		= DEFSLAVEDATAREADY;
				HRESP				= HRESP_DEFAULT;
				HRDATA				= 32'h0;
				PREVDATASLAVEREADY	= DEFSLAVEDATAREADY;
			end
		end
		default:
		begin
			HREADY_M_pre		= 1'b1;
			HRESP				= 1'b0;
			HRDATA				= 32'h0;
			PREVDATASLAVEREADY	= 1'b1;
		end
		endcase
end
always @ (*)
begin
	masterAddrClockEnable	= 1'b0;
	d_masterRegAddrSel		= 1'b0;
	case (addrRegSMCurrentState)
	IDLE:
	begin
		if (( (HTRANS == 2) || (HTRANS == 3) || (HTRANS == 1))  && HREADY_M &&      // AI :  Added for burst 
				(
					(sAddrDec[0]  && !SADDRREADY[0] ) ||
					(sAddrDec[1]  && !SADDRREADY[1] ) ||
					(sAddrDec[2]  && !SADDRREADY[2] ) ||
					(sAddrDec[3]  && !SADDRREADY[3] ) ||
					(sAddrDec[4]  && !SADDRREADY[4] ) ||
					(sAddrDec[5]  && !SADDRREADY[5] ) ||
					(sAddrDec[6]  && !SADDRREADY[6] ) ||
					(sAddrDec[7]  && !SADDRREADY[7] ) ||
					(sAddrDec[8]  && !SADDRREADY[8] ) ||
					(sAddrDec[9]  && !SADDRREADY[9] ) ||
					(sAddrDec[10] && !SADDRREADY[10]) ||
					(sAddrDec[11] && !SADDRREADY[11]) ||
					(sAddrDec[12] && !SADDRREADY[12]) ||
					(sAddrDec[13] && !SADDRREADY[13]) ||
					(sAddrDec[14] && !SADDRREADY[14]) ||
					(sAddrDec[15] && !SADDRREADY[15]) ||
					(sAddrDec[16] && !SADDRREADY[16])
				)
		)
		begin
			masterAddrClockEnable	= 1'b1;
			d_masterRegAddrSel		= 1'b1;
			addrRegSMNextState		= REGISTERED;
		end
		else
			addrRegSMNextState		= IDLE;
	end
	REGISTERED:
	begin
		if (
			(sAddrDec[0]  && SADDRREADY[0] ) ||
			(sAddrDec[1]  && SADDRREADY[1] ) ||
			(sAddrDec[2]  && SADDRREADY[2] ) ||
			(sAddrDec[3]  && SADDRREADY[3] ) ||
			(sAddrDec[4]  && SADDRREADY[4] ) ||
			(sAddrDec[5]  && SADDRREADY[5] ) ||
			(sAddrDec[6]  && SADDRREADY[6] ) ||
			(sAddrDec[7]  && SADDRREADY[7] ) ||
			(sAddrDec[8]  && SADDRREADY[8] ) ||
			(sAddrDec[9]  && SADDRREADY[9] ) ||
			(sAddrDec[10] && SADDRREADY[10]) ||
			(sAddrDec[11] && SADDRREADY[11]) ||
			(sAddrDec[12] && SADDRREADY[12]) ||
			(sAddrDec[13] && SADDRREADY[13]) ||
			(sAddrDec[14] && SADDRREADY[14]) ||
			(sAddrDec[15] && SADDRREADY[15]) ||
			(sAddrDec[16] && SADDRREADY[16])
		)
			addrRegSMNextState		= IDLE;
		else
		begin
			d_masterRegAddrSel		= 1'b1;
			addrRegSMNextState		= REGISTERED;
		end
	end
	default:
		addrRegSMNextState		= IDLE;
	endcase
end
always @ (posedge HCLK or negedge aresetn)
begin
	if ((!aresetn) || (!sresetn))
	begin
		addrRegSMCurrentState	<= IDLE;
		masterRegAddrSel		<= 1'b0;
	end
	else
	begin
		addrRegSMCurrentState	<= addrRegSMNextState;
		masterRegAddrSel		<= d_masterRegAddrSel;
	end
end
COREAHBLITE_DEFAULTSLAVESM #(.SYNC_RESET(SYNC_RESET)) 
    default_slave_sm (
	.HCLK(HCLK),
	.HRESETN(HRESETN),
	.DEFSLAVEDATASEL(DEFSLAVEDATASEL),
	.DEFSLAVEDATAREADY(DEFSLAVEDATAREADY),
	.HRESP_DEFAULT(HRESP_DEFAULT)
);
assign HREADY_M = HREADY_M_pre;
endmodule 
