// ****************************************************************************/
// Microsemi Corporation Proprietary and Confidential
// Copyright 2015 Microsemi Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: axi_slave_stage.v
//
// SVN Revision Information:
// SVN $Revision: 25677 $
// SVN $Date: 2015-12-09 13:51:39 +0530 (Wed, 09 Dec 2015) $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
//
// ****************************************************************************/
`timescale 1ns/1ps

module axi_slave_stage (
                    // Global signals
                    ACLK,
                    ARESETN,
                    
                    // MASTER 0
                    // AXI MASTER 0 write address channel signals
                    AWID_IS,
                    AWADDR_IS,
                    AWLEN_IS,
                    AWSIZE_IS,
                    AWBURST_IS,
                    AWLOCK_IS,
                    AWCACHE_IS,
                    AWPROT_IS,
                    AWVALID_IS,
                    AWREADY_SI,
                    // AXI MASTER 0 write data channel signals
                    WID_IS,
                    WDATA_IS,
                    WSTRB_IS,
                    WLAST_IS,
                    WVALID_IS,
                    WREADY_SI,
                    // AXI MASTER 0 write response channel signals
                    BID_SI,
                    BRESP_SI,
                    BVALID_SI,
                    BREADY_IS,
                    // AXI MASTER 0 read address channel signals
                    ARID_IS,
                    ARADDR_IS,
                    ARLEN_IS,
                    ARSIZE_IS,
                    ARBURST_IS,
                    ARLOCK_IS,
                    ARCACHE_IS,
                    ARPROT_IS,
                    ARVALID_IS,
                    ARREADY_SI,
                    // AXI MASTER 0 read response channel signals
                    RID_SI,
                    RDATA_SI,
                    RRESP_SI,
                    RLAST_SI,
                    RVALID_SI,
                    RREADY_IS,

                    // SLAVE N
                    // AXI SLAVE 0 write address channel signals
                    AWID_S,
                    AWADDR_S,
                    AWLEN_S,
                    AWSIZE_S,
                    AWBURST_S,
                    AWLOCK_S,
                    AWCACHE_S,
                    AWPROT_S,
                    AWVALID_S,
                    AWREADY_S,
                    // AXI SLAVE 0 write data channel signals
                    WID_S,
                    WDATA_S,
                    WSTRB_S,
                    WLAST_S,
                    WVALID_S,
                    WREADY_S,
                    // AXI SLAVE 0 write response channel signals
                    BID_S,
                    BRESP_S,
                    BVALID_S,
                    BREADY_S,
                    // AXI SLAVE 0 read address channel signals
                    ARID_S,
                    ARADDR_S,
                    ARLEN_S,
                    ARSIZE_S,
                    ARBURST_S,
                    ARLOCK_S,
                    ARCACHE_S,
                    ARPROT_S,
                    ARVALID_S,
                    ARREADY_S,
                    // AXI SLAVE 0 read response channel signals
                    RID_S,
                    RDATA_S,
                    RRESP_S,
                    RLAST_S,
                    RVALID_S,
                    RREADY_S

                    );

   // --------------------------------------------------------------------------
   // Parameter Declaration
   // --------------------------------------------------------------------------
   parameter FAMILY               = 19;
   parameter AXI_AWIDTH           = 32;
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

   parameter NUM_SLAVE_SLOT       = 1;  // 1 - 16
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

   parameter WR_ACCEPTANCE        = 4;  // 1 - 4
   parameter RD_ACCEPTANCE        = 4;  // 1 - 4
   parameter BASE_ID_WIDTH        = 2;
   parameter SYNC_RESET           = 0;

   localparam AXI_STRBWIDTH              = AXI_DWIDTH/8;
   localparam SINGLE_MASTER              = (NUM_MASTER_SLOT == 1) ? 1 : 0;
   localparam SINGLE_SLAVE               = (NUM_SLAVE_SLOT  == 1) ? 1 : 0;
   localparam SINGLE_MASTER_SINGLE_SLAVE = (NUM_MASTER_SLOT == 1) ? ((NUM_SLAVE_SLOT == 1) ? 1 : 0 ) : 0;

   localparam SLAVE_0  =        17'b00000000000000001;
   localparam SLAVE_1  =        17'b00000000000000010;
   localparam SLAVE_2  =        17'b00000000000000100;
   localparam SLAVE_3  =        17'b00000000000001000;
   localparam SLAVE_4  =        17'b00000000000010000;
   localparam SLAVE_5  =        17'b00000000000100000;
   localparam SLAVE_6  =        17'b00000000001000000;
   localparam SLAVE_7  =        17'b00000000010000000;
   localparam SLAVE_8  =        17'b00000000100000000;
   localparam SLAVE_9  =        17'b00000001000000000;
   localparam SLAVE_A  =        17'b00000010000000000;
   localparam SLAVE_B  =        17'b00000100000000000;
   localparam SLAVE_C  =        17'b00001000000000000;
   localparam SLAVE_D  =        17'b00010000000000000;
   localparam SLAVE_E  =        17'b00100000000000000;
   localparam SLAVE_F  =        17'b01000000000000000;
   localparam SLAVE_N  =        17'b10000000000000000;

   // --------------------------------------------------------------------------
   // I/O Declaration
   // --------------------------------------------------------------------------

   // Global signals
   input                        ACLK;
   input                        ARESETN;

   // MASTER 0
   // AXI MASTER 0 write address channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH-1:0]        AWID_IS;
   input  [31:0]      AWADDR_IS;
   input  [3:0]                 AWLEN_IS;
   input  [2:0]                 AWSIZE_IS;
   input  [1:0]                 AWBURST_IS;
   input  [1:0]                 AWLOCK_IS;
   input  [3:0]                 AWCACHE_IS;
   input  [2:0]                 AWPROT_IS;
   input                        AWVALID_IS;
   output                       AWREADY_SI;
   // AXI MASTER 0 write data channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH-1:0]        WID_IS;
   input  [AXI_DWIDTH-1:0]      WDATA_IS;
   input  [AXI_STRBWIDTH-1:0]   WSTRB_IS;
   input                        WLAST_IS;
   input                        WVALID_IS;
   output                       WREADY_SI;
   // AXI MASTER 0 write response channel signals
   output [BASE_ID_WIDTH+ID_WIDTH-1:0]        BID_SI;
   output [1:0]                 BRESP_SI;
   output                       BVALID_SI;
   input                        BREADY_IS;
   // AXI MASTER 0 read address channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH-1:0]        ARID_IS;
   input  [31:0]      ARADDR_IS;
   input  [3:0]                 ARLEN_IS;
   input  [2:0]                 ARSIZE_IS;
   input  [1:0]                 ARBURST_IS;
   input  [1:0]                 ARLOCK_IS;
   input  [3:0]                 ARCACHE_IS;
   input  [2:0]                 ARPROT_IS;
   input                        ARVALID_IS;
   output                       ARREADY_SI;
   // AXI MASTER 0 read response channel signals
   output [BASE_ID_WIDTH+ID_WIDTH-1:0]        RID_SI;
   output [AXI_DWIDTH-1:0]      RDATA_SI;
   output [1:0]                 RRESP_SI;
   output                       RLAST_SI;
   output                       RVALID_SI;
   input                        RREADY_IS;

   // SLAVE 0
   // AXI SLAVE 0 write address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S;
   output [31:0]      AWADDR_S;
   output [3:0]                 AWLEN_S;
   output [2:0]                 AWSIZE_S;
   output [1:0]                 AWBURST_S;
   output [1:0]                 AWLOCK_S;
   output [3:0]                 AWCACHE_S;
   output [2:0]                 AWPROT_S;
   output                       AWVALID_S;
   input                        AWREADY_S;
   // AXI SLAVE 0 write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S;
   output [AXI_DWIDTH-1:0]      WDATA_S;
   output [AXI_STRBWIDTH-1:0]   WSTRB_S;
   output                       WLAST_S;
   output                       WVALID_S;
   input                        WREADY_S;
   // AXI SLAVE 0 write response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 BID_S;
   input  [1:0]                 BRESP_S;
   input                        BVALID_S;
   output                       BREADY_S;
   // AXI SLAVE 0 read address channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S;
   output [31:0]      ARADDR_S;
   output [3:0]                 ARLEN_S;
   output [2:0]                 ARSIZE_S;
   output [1:0]                 ARBURST_S;
   output [1:0]                 ARLOCK_S;
   output [3:0]                 ARCACHE_S;
   output [2:0]                 ARPROT_S;
   output                       ARVALID_S;
   input                        ARREADY_S;
   // AXI SLAVE 0 read response channel signals
   input  [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 RID_S;
   input  [AXI_DWIDTH-1:0]      RDATA_S;
   input  [1:0]                 RRESP_S;
   input                        RLAST_S;
   input                        RVALID_S;
   output                       RREADY_S;

   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 AWID_S;
   reg [31:0]      AWADDR_S;
   reg [3:0]                 AWLEN_S;
   reg [2:0]                 AWSIZE_S;
   reg [1:0]                 AWBURST_S;
   reg [1:0]                 AWLOCK_S;
   reg [3:0]                 AWCACHE_S;
   reg [2:0]                 AWPROT_S;
   reg                       AWVALID_S;

   // AXI SLAVE 0 write data channel signals
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 WID_S;
   reg [AXI_DWIDTH-1:0]      WDATA_S;
   reg [AXI_STRBWIDTH-1:0]   WSTRB_S;
   reg                       WLAST_S;
   reg                       WVALID_S;
    // AXI SLAVE 0 write response channel signals
   wire                       BREADY_S;

   // AXI SLAVE 0 read address channel signals
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0]                 ARID_S;
   reg [31:0]      ARADDR_S;
   reg [3:0]                 ARLEN_S;
   reg [2:0]                 ARSIZE_S;
   reg [1:0]                 ARBURST_S;
   reg [1:0]                 ARLOCK_S;
   reg [3:0]                 ARCACHE_S;
   reg [2:0]                 ARPROT_S;
   reg                       ARVALID_S;

   wire                      AWREADY_SI;
   reg                       ARREADY_SI;
   wire                       WREADY_SI;
   reg [BASE_ID_WIDTH+ID_WIDTH-1:0]        BID_SI;
   reg [1:0]                 BRESP_SI;
   reg                       BVALID_SI;
   reg [BASE_ID_WIDTH+ID_WIDTH-1:0]        RID_SI;
   reg [AXI_DWIDTH-1:0]      RDATA_SI;
   reg [1:0]                 RRESP_SI;
   reg                       RLAST_SI;
   reg                       RVALID_SI;

   reg                       RREADY_S;

   reg [BASE_ID_WIDTH+ID_WIDTH-1:0]        RID_S_FF1;
   reg [AXI_DWIDTH-1:0]      RDATA_S_FF1;
   reg [1:0]                 RRESP_S_FF1;
   reg                       RLAST_S_FF1;
   reg                       RVALID_S_FF1;
   reg [BASE_ID_WIDTH+ID_WIDTH-1:0]        RID_S_INPFF1;
   reg [AXI_DWIDTH-1:0]      RDATA_S_INPFF1;
   reg [1:0]                 RRESP_S_INPFF1;
   reg                       RLAST_S_INPFF1;
   reg                       RVALID_S_INPFF1;
   wire [BASE_ID_WIDTH+ID_WIDTH-1:0]        RID_S_pulse;
   wire [AXI_DWIDTH-1:0]      RDATA_S_pulse;
   wire [1:0]                 RRESP_S_pulse;
   wire                       RLAST_S_pulse;
   wire                       RVALID_S_pulse;

   reg [BASE_ID_WIDTH+ID_WIDTH-1:0]        BID_S_FF1;
   reg [1:0]                 BRESP_S_FF1;
   reg                       BVALID_S_FF1;
   reg [BASE_ID_WIDTH+ID_WIDTH-1:0]        BID_S_INPFF1;
   reg [1:0]                 BRESP_S_INPFF1;
   reg                       BVALID_S_INPFF1;
   wire [BASE_ID_WIDTH+ID_WIDTH-1:0]        BID_S_pulse;
   wire [1:0]                 BRESP_S_pulse;
   wire                       BVALID_S_pulse;

   wire                       gated_WVALID_S;   
   wire                       gated_AWVALID_flag;
   reg                        WLAST_S_int;
   reg                        WVALID_S_int;

   reg                        AWVALID_IS_r;
   reg                        ARVALID_IS_r;
   reg                        WVALID_IS_r;
   
   reg [BASE_ID_WIDTH+ID_WIDTH-1:0] RID_M_FF1;
   reg [AXI_DWIDTH-1:0]      RDATA_M_FF1;
   reg [1:0]                 RRESP_M_FF1;
   reg                       RLAST_M_FF1;
   reg                       RVALID_M_FF1;
   reg [BASE_ID_WIDTH+ID_WIDTH-1:0]        RID_M_INPFF1;
   reg [AXI_DWIDTH-1:0]      RDATA_M_INPFF1;
   reg [1:0]                 RRESP_M_INPFF1;
   reg                       RLAST_M_INPFF1;
   reg                       RVALID_M_INPFF1;

   reg [BASE_ID_WIDTH+ID_WIDTH-1:0]        RID_M_pulse;
   reg [AXI_DWIDTH-1:0]      RDATA_M_pulse;
   reg [1:0]                 RRESP_M_pulse;
   reg                       RLAST_M_pulse;
   reg                       RVALID_M_pulse;

   reg                       AWVALID_IS_r1;
   reg                       WVALID_IS_r1;
   
   reg                       AWVALID_S_r;
   reg                       WVALID_S_r;
   reg                       ARVALID_S_r;
   reg                       AWVALID_S_r1;
   reg                       WVALID_S_r1;
   reg                       ARVALID_S_r1;

   reg                       AWREADY_S_r;
   reg                       ARREADY_S_r;

   wire                      aresetn;
   wire                      sresetn;

   /////////////////////////////////////////////////////////////////////////////
   //                               Start - of - Code                         //
   /////////////////////////////////////////////////////////////////////////////

   // --------------------------------------------------------------------------
   // resets
   // --------------------------------------------------------------------------
   assign aresetn   = (SYNC_RESET == 1) ? 1'b1  : ARESETN;
   assign sresetn   = (SYNC_RESET == 1) ? ARESETN : 1'b1;

   // --------------------------------------------------------------------------
   // Register write address and write data control signals
   // --------------------------------------------------------------------------
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         AWVALID_IS_r <= 1'b0;
         ARVALID_IS_r <= 1'b0;
         WVALID_IS_r <= 1'b0;

         AWVALID_IS_r1 <= 1'b0;
         WVALID_IS_r1 <= 1'b0;
      end
      else begin
         AWVALID_IS_r <= AWVALID_IS;
         ARVALID_IS_r <= ARVALID_IS;
         WVALID_IS_r  <= WVALID_IS;

         AWVALID_IS_r1 <= AWVALID_IS_r;
         WVALID_IS_r1  <= WVALID_IS_r;
      end
   end


   generate

      if(OUT_REG_BUF == 1)  begin  

         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               AWVALID_S  <= 1'b0;
               AWLEN_S    <= 'h0;
               AWSIZE_S   <= 'h0;
               AWBURST_S  <= 'h0;
               AWLOCK_S   <= 'h0;
               AWCACHE_S  <= 'h0;
               AWPROT_S   <= 'h0;
               AWADDR_S   <= 'h0;
               AWID_S     <= 'h0;

               // Latched Read Address signals 
               ARVALID_S  <= 'h0;
               ARSIZE_S   <= 'h0;
               ARBURST_S  <= 'h0;
               ARLOCK_S   <= 'h0;
               ARCACHE_S  <= 'h0;
               ARPROT_S   <= 'h0;
               ARLEN_S    <= 'h0;
               ARID_S     <= 'h0;
               ARADDR_S   <= 'h0;               
            end
            else begin
               AWID_S     <= AWID_IS;
               AWLEN_S    <= AWLEN_IS;
               AWSIZE_S   <= AWSIZE_IS;
               AWBURST_S  <= AWBURST_IS;
               AWLOCK_S   <= AWLOCK_IS;
               AWCACHE_S  <= AWCACHE_IS;
               AWPROT_S   <= AWPROT_IS;
               AWADDR_S   <= AWADDR_IS;
               
               ARID_S     <= ARID_IS;
               ARSIZE_S   <= ARSIZE_IS;
               ARBURST_S  <= ARBURST_IS;
               ARLOCK_S   <= ARLOCK_IS;
               ARCACHE_S  <= ARCACHE_IS;
               ARPROT_S   <= ARPROT_IS;
               ARLEN_S    <= ARLEN_IS;
               ARADDR_S   <= ARADDR_IS;
               if(AWVALID_S && AWREADY_S) begin
                  AWVALID_S  <= 1'b0;
               end
               else if(AWVALID_IS && !AWVALID_IS_r) begin
                  AWVALID_S  <= 1'b1;
               end

               if(ARVALID_S && ARREADY_S) begin
                  ARVALID_S  <= 'h0;
               end
               else if(ARVALID_IS && !ARVALID_IS_r) begin
                  ARVALID_S  <= 1'b1;
               end
            end
         end
         
         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               WID_S      <= 'h0;
               WDATA_S    <= 'h0;
               WSTRB_S    <= 'h0;
               WLAST_S    <= 'h0;
               WVALID_S   <= 'h0;
            end
            else begin
               if(WVALID_S && WREADY_S) begin
                  WLAST_S    <= 'h0;
                  WVALID_S   <= 'h0;                  
               end
               else if(WVALID_IS_r  && !WVALID_IS_r1) begin
                  WID_S      <= WID_IS;
                  WDATA_S    <= WDATA_IS;
                  WSTRB_S    <= WSTRB_IS;
                  WLAST_S    <= WLAST_IS;
                  WVALID_S   <= WVALID_IS;
               end
            end
         end

         always @(*) begin
            ARREADY_SI = ARREADY_S & ARVALID_S;
         end
         assign WREADY_SI  = WREADY_S & WVALID_S;
         assign AWREADY_SI = AWREADY_S & AWVALID_S; 

         always @(*) begin
            // Latched Write Response signals
            BID_SI     = BID_S;               
            BRESP_SI   = BRESP_S;               
            BVALID_SI  = BVALID_S;               
         end

         always @(*) begin
            // Latched Read Response signals
            RID_SI     = RID_S;
            RDATA_SI   = RDATA_S;
            RRESP_SI   = RRESP_S;               
            RLAST_SI   = RLAST_S;               
            RVALID_SI  = RVALID_S;

         end

         assign BREADY_S = BREADY_IS;
         always @(*) begin
            RREADY_S = RREADY_IS;
         end

      end // if (OUT_REG_BUF == 1)
   endgenerate

   generate      
      if(OUT_REG_BUF == 0)  begin
         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               AWVALID_S  <= 1'b0;
               AWLEN_S    <= 'h0;
               AWSIZE_S   <= 'h0;
               AWBURST_S  <= 'h0;
               AWLOCK_S   <= 'h0;
               AWCACHE_S  <= 'h0;
               AWPROT_S   <= 'h0;
               AWADDR_S   <= 'h0;
               AWID_S     <= 'h0;

               // Latched Read Address signals 
               ARVALID_S  <= 'h0;
               ARSIZE_S   <= 'h0;
               ARBURST_S  <= 'h0;
               ARLOCK_S   <= 'h0;
               ARCACHE_S  <= 'h0;
               ARPROT_S   <= 'h0;
               ARLEN_S    <= 'h0;
               ARID_S     <= 'h0;
               ARADDR_S   <= 'h0;               
            end
            else begin
               AWID_S     <= AWID_IS;
               AWLEN_S    <= AWLEN_IS;
               AWSIZE_S   <= AWSIZE_IS;
               AWBURST_S  <= AWBURST_IS;
               AWLOCK_S   <= AWLOCK_IS;
               AWCACHE_S  <= AWCACHE_IS;
               AWPROT_S   <= AWPROT_IS;
               AWADDR_S   <= AWADDR_IS;
               
               ARID_S     <= ARID_IS;
               ARSIZE_S   <= ARSIZE_IS;
               ARBURST_S  <= ARBURST_IS;
               ARLOCK_S   <= ARLOCK_IS;
               ARCACHE_S  <= ARCACHE_IS;
               ARPROT_S   <= ARPROT_IS;
               ARLEN_S    <= ARLEN_IS;
               ARADDR_S   <= ARADDR_IS;
               if(AWVALID_S && AWREADY_S) begin
                  AWVALID_S  <= 1'b0;
               end
               else if(AWVALID_IS && !AWVALID_IS_r) begin
                  AWVALID_S  <= 1'b1;
               end

               if(ARVALID_S && ARREADY_S) begin
                  ARVALID_S  <= 'h0;
               end
               else if(ARVALID_IS && !ARVALID_IS_r) begin
                  ARVALID_S  <= 1'b1;
               end
            end
         end
         
         always @(posedge ACLK or negedge aresetn) begin
            if((!aresetn) || (!sresetn)) begin
               WID_S      <= 'h0;
               WDATA_S    <= 'h0;
               WSTRB_S    <= 'h0;
               WLAST_S    <= 'h0;
               WVALID_S   <= 'h0;
            end
            else begin
               if(WVALID_S && WREADY_S) begin
                  WLAST_S    <= 'h0;
                  WVALID_S   <= 'h0;                  
               end
               else if(WVALID_IS_r  && !WVALID_IS_r1) begin
                  WID_S      <= WID_IS;
                  WDATA_S    <= WDATA_IS;
                  WSTRB_S    <= WSTRB_IS;
                  WLAST_S    <= WLAST_IS;
                  WVALID_S   <= WVALID_IS;
               end
            end
         end

         always @(*) begin
            ARREADY_SI = ARVALID_S & ARREADY_S;
         end
         assign WREADY_SI  = WREADY_S & WVALID_S;
         assign AWREADY_SI = AWREADY_S & AWVALID_S; 

         always @(*) begin
            // Latched Write Response signals
            BID_SI     = BID_S; 
            BRESP_SI   = BRESP_S;
            BVALID_SI  = BVALID_S;
            
            // Latched Read Response signals
            RID_SI     = RID_S;
            RDATA_SI   = RDATA_S;
            RRESP_SI   = RRESP_S;               
            RLAST_SI   = RLAST_S;               
            RVALID_SI  = RVALID_S;
         end // always @ (*)

         assign BREADY_S = BREADY_IS;
         always @(*) begin
            RREADY_S = RREADY_IS;
         end


      end // if (OUT_REG_BUF == 0)      
   endgenerate

         
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
         ARVALID_S_r <= 'h0;
         AWVALID_S_r <= 'h0;
         WVALID_S_r  <= 'h0;

         ARVALID_S_r1 <= 'h0;
         AWVALID_S_r1 <= 'h0;
         WVALID_S_r1  <= 'h0;

         AWREADY_S_r <= 'h0;
         ARREADY_S_r <= 'h0;
      end
      else begin
         AWVALID_S_r <= AWVALID_S;
         ARVALID_S_r <= ARVALID_S;
         WVALID_S_r  <= WVALID_S;

         AWVALID_S_r1 <= AWVALID_S_r;
         ARVALID_S_r1 <= ARVALID_S_r;
         WVALID_S_r1  <= WVALID_S_r;

         AWREADY_S_r <= AWREADY_S;
         ARREADY_S_r <= ARREADY_S;
      end
   end
   
         
endmodule // slave_stage


   /////////////////////////////////////////////////////////////////////////////
   //                               End - of - Code                           //
   /////////////////////////////////////////////////////////////////////////////

