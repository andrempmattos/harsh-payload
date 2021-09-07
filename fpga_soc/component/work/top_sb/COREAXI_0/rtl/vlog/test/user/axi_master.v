// ****************************************************************************/
// Microsemi Corporation Proprietary and Confidential
// Copyright 2015 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: CoreAXI - AXI master model 
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

module axi_master (
    // Global signals
        ACLK
    ,   ARESETN

    // MASTER
    // AXI MASTER write address channel signals
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
    // AXI MASTER write data channel signals
    ,   WID
    ,   WDATA
    ,   WSTRB
    ,   WLAST
    ,   WVALID
    ,   WREADY
    // AXI MASTER write response channel signals
    ,   BID
    ,   BRESP
    ,   BVALID
    ,   BREADY
    // AXI MASTER read address channel signals
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
    // AXI MASTER read response channel signals
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

//    parameter NUM_SLAVE_SLOT       = 1;  // 1 - 16
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

    localparam BASE_ID_WIDTH = 0;
    localparam AXI_STRBWIDTH     = AXI_DWIDTH/8;

    // Global signals
    input                        ACLK;
    input                        ARESETN;

    // MASTER
    // AXI MASTER write address channel signals
    output reg [ID_WIDTH - 1:0]                 AWID;
    output reg [31:0]      AWADDR;
    output reg [3:0]                 AWLEN;
    output reg [2:0]                 AWSIZE;
    output reg [1:0]                 AWBURST;
    output reg [1:0]                 AWLOCK;
    output reg [3:0]                 AWCACHE;
    output reg [2:0]                 AWPROT;
    output reg                       AWVALID;
    input                        AWREADY;
    // AXI MASTER write data channel signals
    output reg [ID_WIDTH - 1:0]                 WID;
    output reg [AXI_DWIDTH-1:0]      WDATA;
    output reg [AXI_STRBWIDTH-1:0]   WSTRB;
    output reg                       WLAST;
    output reg                       WVALID;
    input                        WREADY;
    // AXI MASTER write response channel signals
    input  [ID_WIDTH - 1:0]                 BID;
    input  [1:0]                 BRESP;
    input                        BVALID;
    output reg                       BREADY;
    // AXI MASTER read address channel signals
    output reg [ID_WIDTH - 1:0]                 ARID;
    output reg [31:0]      ARADDR;
    output reg [3:0]                 ARLEN;
    output reg [2:0]                 ARSIZE;
    output reg [1:0]                 ARBURST;
    output reg [1:0]                 ARLOCK;
    output reg [3:0]                 ARCACHE;
    output reg [2:0]                 ARPROT;
    output reg                       ARVALID;
    input                        ARREADY;
    // AXI MASTER read response channel signals
    input  [ID_WIDTH - 1:0]                 RID;
    input  [AXI_DWIDTH-1:0]      RDATA;
    input  [1:0]                 RRESP;
    input                        RLAST;
    input                        RVALID;
    output reg                       RREADY;

    initial begin
        AWID      = 4'h0;
        AWADDR    = 32'h0;      
        AWLEN     = 4'b0000;
        AWSIZE    = 3'b000;
        AWBURST   = 2'b00;
        AWLOCK    = 2'b00;
        AWCACHE   = 4'b0000;
        AWPROT    = 3'b000;
        AWVALID   = 1'b0;
        WID       = 4'b0000;
        WDATA     = {AXI_DWIDTH{1'b0}};
        WSTRB     = {AXI_STRBWIDTH{1'b0}};
        WLAST     = 1'b0;
        WVALID    = 1'b0;
        BREADY    = 1'b0;
        ARID      = 4'b0000;
        ARADDR    = 'h0;
        ARLEN     = 4'b0000;
        ARSIZE    = 3'b000;
        ARBURST   = 2'b00;
        ARLOCK    = 2'b00;
        ARCACHE   = 4'b0000;
        ARPROT    = 3'b000;
        ARVALID   = 1'b0;
        RREADY    = 1'b0;
    end

// Reset AXI Write Address Channel Bus  
    task reset_axi_wraddrchan;
        begin
            AWID    = 4'h0;
            AWADDR  = 'h0;
            AWLEN   = 4'h0;
            AWSIZE  = 3'h0;
            AWBURST = 2'h0;
            AWLOCK  = 2'h0; 
            AWVALID = 1'b0;
        end
    endtask // reset_axi_wraddrchan

// Write Address Channel task
    task axi_write_addr_channel;
        input [ID_WIDTH - 1:0]              AWID_in;
        input [31:0]   AWADDR_in;
        input [3:0]              AWLEN_in;
        input [2:0]              AWSIZE_in;
        input [1:0]              AWBURST_in;
        input [1:0]              AWLOCK_in; 
        begin
            @(posedge ACLK);
            AWID    = AWID_in;
            AWADDR  = AWADDR_in;
            AWLEN   = AWLEN_in;
            AWSIZE  = AWSIZE_in;
            AWBURST = AWBURST_in;
            AWLOCK  = AWLOCK_in; 
            AWVALID = 1'b1;
            wait (AWREADY);
            @(posedge ACLK);
            reset_axi_wraddrchan;
        end
    endtask // axi_write_addr_channel 

// Reset AXI Write Data Channel Bus  
    task reset_axi_wrdatachan;
        begin
            WID    = 4'h0;
            WDATA  = {AXI_DWIDTH{1'b0}};
            WSTRB  = 4'h0;
            WLAST  = 1'b0;
            WVALID = 1'b0;
        end
    endtask // reset_axi_wrdatachan

// Write Data Channel task
    task axi_write_data_channel;
        input [ID_WIDTH - 1:0]              WID_in;
        input [31:0]   AWADDR_in;
        input [3:0]              AWLEN_in;
        input [2:0]              AWSIZE_in;
        input [1:0]              AWBURST_in;
        integer                  i;
        begin
            // send number of data transfer in one burst 
            for (i=0;i<=AWLEN_in;i=i+1) begin
                WID     = WID_in;
                WDATA   = 64'haaaa5555aaaa5555;
		$display("%t WRITE DATA = %h ",$time, WDATA);
                if (i==0) begin
                    WSTRB   = 8'b1111_1110;
                end else begin
                    WSTRB   = 8'b1111_1111;
                end
                WVALID  = 1'b1;
                WLAST   = (i==AWLEN_in) ? 1'b1 : 1'b0; 
                wait (WREADY);
                @(posedge ACLK);
            end
            // reset axi write data bus after burst transfer
            reset_axi_wrdatachan;
        end
    endtask // axi_write_data_channel 

// Write response channel task
    task axi_write_response_channel;
        begin
            wait (BVALID);
            @(posedge ACLK);
            BREADY = 1'b1;
            @(posedge ACLK);
            BREADY = 1'b0;
        end
    endtask // axi_write_response_channel

// AXI MASTER - Write task
    task axi_write;
        input [ID_WIDTH - 1:0]              AWID_in;
        input [31:0]   AWADDR_in;
        input [3:0]              AWLEN_in;
        input [2:0]              AWSIZE_in;
        input [1:0]              AWBURST_in;
        input [1:0]              AWLOCK_in; 
        begin
            axi_write_addr_channel(AWID_in,AWADDR_in,AWLEN_in,AWSIZE_in,AWBURST_in,AWLOCK_in);
            axi_write_data_channel(AWID_in,AWADDR_in,AWLEN_in,AWSIZE_in,AWBURST_in);
            axi_write_response_channel();
            $display("%t AXI WRITE address = %x", $time, AWADDR_in);
        end
    endtask // axi_write 

// Reset AXI read Address Channel Bus  
    task reset_axi_rdaddrchan;
        begin
            ARID    = 4'h0;
            ARADDR  = 'h0;
            ARLEN   = 4'h0;
            ARSIZE  = 3'h0;
            ARBURST = 2'h0;
            ARLOCK  = 2'h0; 
            ARVALID = 1'b0;
        end
    endtask // reset_axi_rdaddrchan

// read Address Channel task
    task axi_read_addr_channel;
        input [ID_WIDTH - 1:0]              ARID_in;
        input [31:0]   ARADDR_in;
        input [3:0]              ARLEN_in;
        input [2:0]              ARSIZE_in;
        input [1:0]              ARBURST_in;
        input [1:0]              ARLOCK_in; 
        begin
            @(posedge ACLK);
            ARID    = ARID_in;
            ARADDR  = ARADDR_in;
            ARLEN   = ARLEN_in;
            ARSIZE  = ARSIZE_in;
            ARBURST = ARBURST_in;
            ARLOCK  = ARLOCK_in; 
            ARVALID = 1'b1;
            wait (ARREADY);
            @(posedge ACLK);
            reset_axi_rdaddrchan;
        end
    endtask // axi_read_addr_channel 

// read data channel task
    task axi_read_response_channel;
        begin
            //wait (RVALID);
            @(posedge ACLK);
            RREADY = 1'b1;
        end
    endtask // axi_read_response_channel

// AXI MASTER - read task
    task axi_read;
        input [ID_WIDTH - 1:0]              ARID_in;
        input [31:0]   ARADDR_in;
        input [3:0]              ARLEN_in;
        input [2:0]              ARSIZE_in;
        input [1:0]              ARBURST_in;
        input [1:0]              ARLOCK_in; 
        begin
            axi_read_addr_channel(ARID_in,ARADDR_in,ARLEN_in,ARSIZE_in,ARBURST_in,ARLOCK_in);
            axi_read_response_channel();
            $display("%t AXI READ  address = %x", $time, ARADDR_in);
        end
    endtask // axi_read 

endmodule
