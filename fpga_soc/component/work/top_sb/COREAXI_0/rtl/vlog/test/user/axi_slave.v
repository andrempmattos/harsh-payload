// ****************************************************************************/
// Microsemi Corporation Proprietary and Confidential
// Copyright 2015 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: CoreAXI - AXI slave model
//
// SVN Revision Information:
// SVN $Revision: 25697 $
// SVN $Date: 2015-12-09 15:27:35 +0530 (Wed, 09 Dec 2015) $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
//
// ****************************************************************************/
`timescale 1ns/1ps

module axi_slave (
    // Global signals
        ACLK
    ,   ARESETN

    // SLAVE
    // AXI SLAVE write address channel signals
    ,   AWID
    ,   AWADDR
    ,   AWLEN
    ,   AWSIZE
    ,   AWBURST
    ,   AWLOCK
    ,   AWCACHE
    ,   AWPROT
    ,   AWVALID
    ,   AWREADY
    // AXI SLAVE write data channel signals
    ,   WID
    ,   WDATA
    ,   WSTRB
    ,   WLAST
    ,   WVALID
    ,   WREADY
    // AXI SLAVE write response channel signals
    ,   BID
    ,   BRESP
    ,   BVALID
    ,   BREADY
    // AXI SLAVE read address channel signals
    ,   ARID
    ,   ARADDR
    ,   ARLEN
    ,   ARSIZE
    ,   ARBURST
    ,   ARLOCK
    ,   ARCACHE
    ,   ARPROT
    ,   ARVALID
    ,   ARREADY
    // AXI SLAVE read response channel signals
    ,   RID
    ,   RDATA
    ,   RRESP
    ,   RLAST
    ,   RVALID
    ,   RREADY
);
    parameter AXI_DWIDTH           = 64;   // 64/128/256

    parameter M0_SLAVE0ENABLE      = 1;
    parameter M0_SLAVE1ENABLE      = 0;
    parameter M0_SLAVE2ENABLE      = 0;
    parameter M0_SLAVE3ENABLE      = 0;
    parameter M0_SLAVE4ENABLE      = 0;
    parameter M0_SLAVE5ENABLE      = 0;
    parameter M0_SLAVE6ENABLE      = 0;
    parameter M0_SLAVE7ENABLE      = 0;
    parameter M0_SLAVE8ENABLE      = 0;
    parameter M0_SLAVE9ENABLE      = 0;
    parameter M0_SLAVE10ENABLE     = 0;
    parameter M0_SLAVE11ENABLE     = 0;
    parameter M0_SLAVE12ENABLE     = 0;
    parameter M0_SLAVE13ENABLE     = 0;
    parameter M0_SLAVE14ENABLE     = 0;
    parameter M0_SLAVE15ENABLE     = 0;
    parameter M0_SLAVE16ENABLE     = 0;

    parameter M1_SLAVE0ENABLE      = 1;
    parameter M1_SLAVE1ENABLE      = 0;
    parameter M1_SLAVE2ENABLE      = 0;
    parameter M1_SLAVE3ENABLE      = 0;
    parameter M1_SLAVE4ENABLE      = 0;
    parameter M1_SLAVE5ENABLE      = 0;
    parameter M1_SLAVE6ENABLE      = 0;
    parameter M1_SLAVE7ENABLE      = 0;
    parameter M1_SLAVE8ENABLE      = 0;
    parameter M1_SLAVE9ENABLE      = 0;
    parameter M1_SLAVE10ENABLE     = 0;
    parameter M1_SLAVE11ENABLE     = 0;
    parameter M1_SLAVE12ENABLE     = 0;
    parameter M1_SLAVE13ENABLE     = 0;
    parameter M1_SLAVE14ENABLE     = 0;
    parameter M1_SLAVE15ENABLE     = 0;
    parameter M1_SLAVE16ENABLE     = 0;

    parameter M2_SLAVE0ENABLE      = 1;
    parameter M2_SLAVE1ENABLE      = 0;
    parameter M2_SLAVE2ENABLE      = 0;
    parameter M2_SLAVE3ENABLE      = 0;
    parameter M2_SLAVE4ENABLE      = 0;
    parameter M2_SLAVE5ENABLE      = 0;
    parameter M2_SLAVE6ENABLE      = 0;
    parameter M2_SLAVE7ENABLE      = 0;
    parameter M2_SLAVE8ENABLE      = 0;
    parameter M2_SLAVE9ENABLE      = 0;
    parameter M2_SLAVE10ENABLE     = 0;
    parameter M2_SLAVE11ENABLE     = 0;
    parameter M2_SLAVE12ENABLE     = 0;
    parameter M2_SLAVE13ENABLE     = 0;
    parameter M2_SLAVE14ENABLE     = 0;
    parameter M2_SLAVE15ENABLE     = 0;
    parameter M2_SLAVE16ENABLE     = 0;

    parameter M3_SLAVE0ENABLE      = 1;
    parameter M3_SLAVE1ENABLE      = 0;
    parameter M3_SLAVE2ENABLE      = 0;
    parameter M3_SLAVE3ENABLE      = 0;
    parameter M3_SLAVE4ENABLE      = 0;
    parameter M3_SLAVE5ENABLE      = 0;
    parameter M3_SLAVE6ENABLE      = 0;
    parameter M3_SLAVE7ENABLE      = 0;
    parameter M3_SLAVE8ENABLE      = 0;
    parameter M3_SLAVE9ENABLE      = 0;
    parameter M3_SLAVE10ENABLE     = 0;
    parameter M3_SLAVE11ENABLE     = 0;
    parameter M3_SLAVE12ENABLE     = 0;
    parameter M3_SLAVE13ENABLE     = 0;
    parameter M3_SLAVE14ENABLE     = 0;
    parameter M3_SLAVE15ENABLE     = 0;    
    parameter M3_SLAVE16ENABLE     = 0;    

    parameter ID_WIDTH             = 4;

//   parameter NUM_SLAVE_SLOT       = 1;  // 1 - 16
    parameter NUM_MASTER_SLOT      = 1;  // 1 - 4
    parameter MEMSPACE             = 1;  // 0 - 6
    parameter HGS_CFG              = 1;  // 1 - 6
    parameter ADDR_HGS_CFG         = 1;  // 0 - 1

    parameter SC_0                 = 0;
    parameter SC_1                 = 0;
    parameter SC_2                 = 0;
    parameter SC_3                 = 0;
    parameter SC_4                 = 0;
    parameter SC_5                 = 0;
    parameter SC_6                 = 0;
    parameter SC_7                 = 0;
    parameter SC_8                 = 0;
    parameter SC_9                 = 0;
    parameter SC_10                = 0;
    parameter SC_11                = 0;
    parameter SC_12                = 0;
    parameter SC_13                = 0;
    parameter SC_14                = 0;
    parameter SC_15                = 0;

    parameter FEED_THROUGH         = 0;  // 0 - 1
    parameter INP_REG_BUF          = 1;  // 0 - 1
    parameter OUT_REG_BUF          = 1;  // 0 - 1

    parameter RD_ACCEPTANCE        = 4;  // 1 - 4
    parameter WR_ACCEPTANCE        = 4;  // 1 - 4

    localparam BASE_ID_WIDTH = 2;
    localparam AXI_STRBWIDTH    = AXI_DWIDTH/8;

    // Global signals
    input                          ACLK;
    input                          ARESETN;

    // SLAVE
    // AXI SLAVE write address channel signals
    input      [BASE_ID_WIDTH +  ID_WIDTH - 1:0]               AWID;
    input      [31:0]    AWADDR;
    input      [3:0]               AWLEN;
    input      [2:0]               AWSIZE;
    input      [1:0]               AWBURST;
    input      [1:0]               AWLOCK;
    input      [3:0]               AWCACHE;
    input      [2:0]               AWPROT;
    input                          AWVALID;
    output                      AWREADY;
    // AXI SLAVE write data channel signals
    input      [BASE_ID_WIDTH +  ID_WIDTH - 1:0]               WID;
    input      [AXI_DWIDTH-1:0]    WDATA;
    input      [AXI_STRBWIDTH-1:0] WSTRB;
    input                          WLAST;
    input                          WVALID;
    output                      WREADY;
    // AXI SLAVE write response channel signals
    output reg [BASE_ID_WIDTH +  ID_WIDTH - 1:0]               BID;
    output reg [1:0]               BRESP;
    output reg                     BVALID;
    input                          BREADY;
    // AXI SLAVE read address channel signals
    input      [BASE_ID_WIDTH +  ID_WIDTH - 1:0]               ARID;
    input      [31:0]    ARADDR;
    input      [3:0]               ARLEN;
    input      [2:0]               ARSIZE;
    input      [1:0]               ARBURST;
    input      [1:0]               ARLOCK;
    input      [3:0]               ARCACHE;
    input      [2:0]               ARPROT;
    input                          ARVALID;
    output                      ARREADY;
    // AXI SLAVE read response channel signals
    output reg [BASE_ID_WIDTH +  ID_WIDTH - 1:0]               RID;
    output reg [AXI_DWIDTH-1:0]    RDATA;
    output reg [1:0]               RRESP;
    output reg                     RLAST;
    output reg                     RVALID;
    input                          RREADY;
    integer                        i;

    wire WREADY;
    wire AWREADY;
    wire ARREADY;
   reg   ARVALID_d1;
   


    always @ (negedge ARESETN or posedge ACLK) begin
        if (!ARESETN) begin
            RID= 6'b000000;
            RDATA = {AXI_DWIDTH{1'b0}};
            RRESP = 2'b00;
            RLAST = 1'b0;
            RVALID = 1'b0;
        end else begin
        end
    end

// read data Channel task
    task reset_axi_rddatachan;
        begin
            @(posedge ACLK);
            RID    = 6'b000000;
            RDATA  = 64'h0000000000000000;
            RRESP  = 2'b00;
            RLAST  = 1'b0;
            RVALID = 1'b0;
        end
    endtask // reset_axi_rddatachan 

// read data Channel task
    task axi_respond_to_read;
        begin
            @(posedge ACLK);
            RID    = 6'b000000;
            RDATA  = 64'h0101010101010101;
            RRESP  = 2'b00;
            RLAST  = 1'b1;
            RVALID = 1'b1;
	    $display("READ DATA = %x", $time,RDATA);
            wait (RREADY);
            @(posedge ACLK);
            reset_axi_rddatachan;
        end
    endtask // axi_respond_to_read 

    always @ (negedge ARESETN or posedge ACLK) begin
        if (!ARESETN) begin
           ARVALID_d1 <= 1'b0;
        end else begin
           ARVALID_d1 <= ARVALID;
        end
    end

    always @ (negedge ARESETN or posedge ACLK) begin
        if (!ARESETN) begin
        end else begin
            if (RVALID == 1'b1 && RREADY == 1'b1) begin
                RID    = 6'b000000;
                RDATA  = 64'h0000000000000000;
                RRESP  = 2'b00;
                RLAST  = 1'b0;
                RVALID = 1'b0;
            end
            else if (ARVALID_d1 == 1'b1 && ARREADY == 1'b1) begin
                RID    = 6'b000000;
                RDATA  = 64'haaaa5555aaaa5555;
                //RDATA  = $random;
                RRESP  = 2'b00;
                RLAST  = 1'b1;
                RVALID = 1'b1;
                $display("%t READ DATA = %h", $time,RDATA);
            end

        end
    end

   assign AWREADY = 1'b1;
   assign WREADY  = 1'b1;
   assign ARREADY = 1'b1;


    always @ (negedge ARESETN or posedge ACLK) begin
        if (!ARESETN) begin
            BID = 6'b000000;
            BRESP = 2'b00;
            BVALID = 1'b0;
        end else begin
            if (BREADY) begin
                BID = 6'b000000;
                BRESP = 2'b00;
                BVALID = 1'b0;
            end else if (WLAST == 1'b1 && WVALID == 1'b1 && WREADY == 1'b1) begin
                BID = 6'b000000;
                BRESP = 2'b00;
                BVALID = 1'b1;
            end
        end
    end

endmodule
