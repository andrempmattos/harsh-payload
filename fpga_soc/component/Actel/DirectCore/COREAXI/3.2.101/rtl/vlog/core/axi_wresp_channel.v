// ****************************************************************************/
// Actel Corporation Proprietary and Confidential
// Copyright 2010 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description: wrresp_channel.v
//              
//              Contains:
//                       - 
//                       - 
//
// Revision Information:
// Date            Description
// ----            -----------------------------------------
// 02Feb11         Inital. Ports and Parameters declaration
//
// SVN Revision Information:
// SVN $Revision: 25801 $
// SVN $Date: 2015-12-20 21:48:37 +0530 (Sun, 20 Dec 2015) $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
// 1. 
//
// ****************************************************************************/
`timescale 1ns/1ps

module axi_wresp_channel (
                      // Global signals
                      ACLK,
                      ARESETN,
                      
                      // From fwd master waselector
                      // MASTER 0
                      // AXI MASTER write data channel signals
                      BID_IM,
                      BRESP_IM,
                      BVALID_IM,
                      BREADY_MI,                                            

                      // SLAVE 0
                      BID_SI0,
                      BVALID_SI0,
                      BRESP_SI0,
                   
                      // SLAVE 1
                      BID_SI1,
                      BVALID_SI1,
                      BRESP_SI1,
                   
                      // SLAVE 2
                      BID_SI2,
                      BVALID_SI2,
                      BRESP_SI2,
                   

                      // SLAVE 3
                      BID_SI3,
                      BVALID_SI3,
                      BRESP_SI3,
                   
                      // SLAVE 4
                      BID_SI4,
                      BVALID_SI4,
                      BRESP_SI4,
                   
                      // SLAVE 5
                      BID_SI5,
                      BVALID_SI5,
                      BRESP_SI5,
                   
                      // SLAVE 6
                      BID_SI6,
                      BVALID_SI6,
                      BRESP_SI6,
                   
                      // SLAVE 7
                      BID_SI7,
                      BVALID_SI7,
                      BRESP_SI7,
                   
                      // SLAVE 8
                      BID_SI8,
                      BVALID_SI8,
                      BRESP_SI8,
                   
                      // SLAVE 9
                      BID_SI9,
                      BVALID_SI9,
                      BRESP_SI9,
                   
                      // SLAVE 10
                      BID_SI10,
                      BVALID_SI10,
                      BRESP_SI10,
                   
                      // SLAVE 11
                      BID_SI11,
                      BVALID_SI11,
                      BRESP_SI11,
                   
                      // SLAVE 12
                      BID_SI12,
                      BVALID_SI12,
                      BRESP_SI12,
                   
                      // SLAVE 13
                      BID_SI13,
                      BVALID_SI13,
                      BRESP_SI13,
                   
                      // SLAVE 14
                      BID_SI14,
                      BVALID_SI14,
                      BRESP_SI14,
                   
                      // SLAVE 15
                      BID_SI15,
                      BVALID_SI15,
                      BRESP_SI15,
                   
                      // SLAVE 16
                      BID_SI16,
                      BVALID_SI16,
                      BRESP_SI16,

                      // From Master
                      BREADY_IS0,
                      BREADY_IS1,
                      BREADY_IS2,
                      BREADY_IS3,
                      BREADY_IS4,
                      BREADY_IS5,
                      BREADY_IS6,
                      BREADY_IS7,
                      BREADY_IS8,
                      BREADY_IS9,
                      BREADY_IS10,
                      BREADY_IS11,
                      BREADY_IS12,
                      BREADY_IS13,
                      BREADY_IS14,
                      BREADY_IS15,
                      BREADY_IS16
                     ,pend_id_addr0  
                     ,pend_id_addr1  
                     ,pend_id_addr2  
                     ,pend_id_addr3  
                     ,pend_id_addr4  
                     ,pend_id_addr5  
                     ,pend_id_addr6  
                     ,pend_id_addr7  
                     ,pend_id_addr8  
                     ,pend_id_addr9  
                     ,pend_id_addr10  
                     ,pend_id_addr11  
                     ,pend_id_addr12  
                     ,pend_id_addr13  
                     ,pend_id_addr14  
                     ,pend_id_addr15  
                     ,pend_id_addr16  
                     ,pend_id_en0      
                     ,pend_id_en1      
                     ,pend_id_en2      
                     ,pend_id_en3      
                     ,pend_id_en4      
                     ,pend_id_en5      
                     ,pend_id_en6      
                     ,pend_id_en7      
                     ,pend_id_en8      
                     ,pend_id_en9      
                     ,pend_id_en10      
                     ,pend_id_en11      
                     ,pend_id_en12      
                     ,pend_id_en13      
                     ,pend_id_en14      
                     ,pend_id_en15      
                     ,pend_id_en16      

                     ,outstnd_waddr0  
                     ,outstnd_waddr1  
                     ,outstnd_waddr2  
                     ,outstnd_waddr3  
                     ,outstnd_waddr4  
                     ,outstnd_waddr5  
                     ,outstnd_waddr6  
                     ,outstnd_waddr7  
                     ,outstnd_waddr8  
                     ,outstnd_waddr9  
                     ,outstnd_waddr10  
                     ,outstnd_waddr11  
                     ,outstnd_waddr12  
                     ,outstnd_waddr13  
                     ,outstnd_waddr14  
                     ,outstnd_waddr15  
                     ,outstnd_waddr16  
                     ,outstnd_waddr_en0      
                     ,outstnd_waddr_en1      
                     ,outstnd_waddr_en2      
                     ,outstnd_waddr_en3      
                     ,outstnd_waddr_en4      
                     ,outstnd_waddr_en5      
                     ,outstnd_waddr_en6      
                     ,outstnd_waddr_en7      
                     ,outstnd_waddr_en8      
                     ,outstnd_waddr_en9      
                     ,outstnd_waddr_en10      
                     ,outstnd_waddr_en11      
                     ,outstnd_waddr_en12      
                     ,outstnd_waddr_en13      
                     ,outstnd_waddr_en14      
                     ,outstnd_waddr_en15      
                     ,outstnd_waddr_en16      

                      );

   // --------------------------------------------------------------------------
   // PARAMETER Declaration
   // --------------------------------------------------------------------------
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
   parameter M0_SLAVE16ENABLE    = 0;
   
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
   parameter BASE_ID_WIDTH        = 0;
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
   parameter UID_WIDTH            = 2'b00;
   parameter SYNC_RESET           = 0;

   localparam AXI_STRBWIDTH       = AXI_DWIDTH/8;

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
   input       ACLK;
   input       ARESETN;

   // From Master 0
   // AXI write data channel signals
   output [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM;
   output [1:0]                          BRESP_IM;
   output                                BVALID_IM;
   input                                 BREADY_MI;   

   // SLAVE 0
   // AXI SLAVE 0 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  BID_SI0;
   input [1:0]                           BRESP_SI0;
   input                                 BVALID_SI0;
   output                                BREADY_IS0;   
   
   // SLAVE 1
   // AXI SLAVE 1 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  BID_SI1;
   input [1:0]                           BRESP_SI1;
   input                                 BVALID_SI1;
   output                                BREADY_IS1;   
   
   // SLAVE 2
   // AXI SLAVE 2 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  BID_SI2;
   input [1:0]                           BRESP_SI2;
   input                                 BVALID_SI2;
   output                                BREADY_IS2;   

   // SLAVE 3
   // AXI SLAVE 3 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  BID_SI3;
   input [1:0]                           BRESP_SI3;
   input                                 BVALID_SI3;
   output                                BREADY_IS3;   

    // SLAVE 4
    // AXI SLAVE 4 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  BID_SI4;
   input [1:0]                           BRESP_SI4;
   input                                 BVALID_SI4;
   output                                BREADY_IS4;   

    // SLAVE 5
    // AXI SLAVE 5 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  BID_SI5;
   input [1:0]                           BRESP_SI5;
   input                                 BVALID_SI5;
   output                                BREADY_IS5;   

    // SLAVE 6
    // AXI SLAVE 6 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  BID_SI6;
   input [1:0]                           BRESP_SI6;
   input                                 BVALID_SI6;
   output                                BREADY_IS6;   

    // SLAVE 7
    // AXI SLAVE 7 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  BID_SI7;
   input [1:0]                           BRESP_SI7;
   input                                 BVALID_SI7;
   output                                BREADY_IS7;   

    // SLAVE 8
    // AXI SLAVE 8 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  BID_SI8;
   input [1:0]                           BRESP_SI8;
   input                                 BVALID_SI8;
   output                                BREADY_IS8;   

    // SLAVE 9
    // AXI SLAVE 9 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  BID_SI9;
   input [1:0]                           BRESP_SI9;
   input                                 BVALID_SI9;
   output                                BREADY_IS9;   

    // SLAVE 10
    // AXI SLAVE 10 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  BID_SI10;
   input [1:0]                           BRESP_SI10;
   input                                 BVALID_SI10;
   output                                BREADY_IS10;   

    // SLAVE 11
    // AXI SLAVE 11 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  BID_SI11;
   input [1:0]                           BRESP_SI11;
   input                                 BVALID_SI11;
   output                                BREADY_IS11;   

    // SLAVE 12
    // AXI SLAVE 12 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  BID_SI12;
   input [1:0]                           BRESP_SI12;
   input                                 BVALID_SI12;
   output                                BREADY_IS12;   

    // SLAVE 13
    // AXI SLAVE 13 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  BID_SI13;
   input [1:0]                           BRESP_SI13;
   input                                 BVALID_SI13;
   output                                BREADY_IS13;   

    // SLAVE 14
    // AXI SLAVE 14 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  BID_SI14;
   input [1:0]                           BRESP_SI14;
   input                                 BVALID_SI14;
   output                                BREADY_IS14;   

    // SLAVE 15
    // AXI SLAVE 15 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  BID_SI15;
   input [1:0]                           BRESP_SI15;
   input                                 BVALID_SI15;
   output                                BREADY_IS15;   

    // SLAVE 16
    // AXI SLAVE 16 write data channel signals
   input [BASE_ID_WIDTH+ID_WIDTH - 1:0]  BID_SI16;
   input [1:0]                           BRESP_SI16;
   input                                 BVALID_SI16;
   output                                BREADY_IS16;   
   input [3:0]                           pend_id_addr0;  
   input [3:0]                           pend_id_addr1;  
   input [3:0]                           pend_id_addr2;  
   input [3:0]                           pend_id_addr3;  
   input [3:0]                           pend_id_addr4;  
   input [3:0]                           pend_id_addr5;  
   input [3:0]                           pend_id_addr6;  
   input [3:0]                           pend_id_addr7;  
   input [3:0]                           pend_id_addr8;  
   input [3:0]                           pend_id_addr9;  
   input [3:0]                           pend_id_addr10;  
   input [3:0]                           pend_id_addr11;  
   input [3:0]                           pend_id_addr12;  
   input [3:0]                           pend_id_addr13;  
   input [3:0]                           pend_id_addr14;  
   input [3:0]                           pend_id_addr15;  
   input [3:0]                           pend_id_addr16;  
   input                                 pend_id_en0;      
   input                                 pend_id_en1;      
   input                                 pend_id_en2;      
   input                                 pend_id_en3;      
   input                                 pend_id_en4;      
   input                                 pend_id_en5;      
   input                                 pend_id_en6;      
   input                                 pend_id_en7;      
   input                                 pend_id_en8;      
   input                                 pend_id_en9;      
   input                                 pend_id_en10;      
   input                                 pend_id_en11;      
   input                                 pend_id_en12;      
   input                                 pend_id_en13;      
   input                                 pend_id_en14;      
   input                                 pend_id_en15;      
   input                                 pend_id_en16;      
   
   input [3:0]                           outstnd_waddr0;  
   input [3:0]                           outstnd_waddr1;  
   input [3:0]                           outstnd_waddr2;  
   input [3:0]                           outstnd_waddr3;  
   input [3:0]                           outstnd_waddr4;  
   input [3:0]                           outstnd_waddr5;  
   input [3:0]                           outstnd_waddr6;  
   input [3:0]                           outstnd_waddr7;  
   input [3:0]                           outstnd_waddr8;  
   input [3:0]                           outstnd_waddr9;  
   input [3:0]                           outstnd_waddr10;  
   input [3:0]                           outstnd_waddr11;  
   input [3:0]                           outstnd_waddr12;  
   input [3:0]                           outstnd_waddr13;  
   input [3:0]                           outstnd_waddr14;  
   input [3:0]                           outstnd_waddr15;  
   input [3:0]                           outstnd_waddr16;  
   input                                 outstnd_waddr_en0;      
   input                                 outstnd_waddr_en1;      
   input                                 outstnd_waddr_en2;      
   input                                 outstnd_waddr_en3;      
   input                                 outstnd_waddr_en4;      
   input                                 outstnd_waddr_en5;      
   input                                 outstnd_waddr_en6;      
   input                                 outstnd_waddr_en7;      
   input                                 outstnd_waddr_en8;      
   input                                 outstnd_waddr_en9;      
   input                                 outstnd_waddr_en10;      
   input                                 outstnd_waddr_en11;      
   input                                 outstnd_waddr_en12;      
   input                                 outstnd_waddr_en13;      
   input                                 outstnd_waddr_en14;      
   input                                 outstnd_waddr_en15;      
   input                                 outstnd_waddr_en16;      

   // --------------------------------------------------------------------------
   // Internal signals
   // --------------------------------------------------------------------------

   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM;
   reg [1:0]                          BRESP_IM;
   reg                                BVALID_IM;
   reg [BASE_ID_WIDTH+ID_WIDTH - 1:0] BID_IM_int;
   reg [1:0]                          BRESP_IM_int;
   reg                                BVALID_IM_int;

   reg                                  BREADY_IS0;
   reg                                  BREADY_IS1;
   reg                                  BREADY_IS2;
   reg                                  BREADY_IS3;
   reg                                  BREADY_IS4;
   reg                                  BREADY_IS5;
   reg                                  BREADY_IS6;
   reg                                  BREADY_IS7;
   reg                                  BREADY_IS8;
   reg                                  BREADY_IS9;
   reg                                  BREADY_IS10;
   reg                                  BREADY_IS11;
   reg                                  BREADY_IS12;
   reg                                  BREADY_IS13;
   reg                                  BREADY_IS14;
   reg                                  BREADY_IS15;
   reg                                  BREADY_IS16;

   wire                                 aresetn;
   wire                                 sresetn;

   /////////////////////////////////////////////////////////////////////////////
   //                               Start - of - Code                         //
   /////////////////////////////////////////////////////////////////////////////

   // --------------------------------------------------------------------------
   // resets
   // --------------------------------------------------------------------------
   assign aresetn   = (SYNC_RESET == 1) ? 1'b1  : ARESETN;
   assign sresetn   = (SYNC_RESET == 1) ? ARESETN : 1'b1;

   // --------------------------------------------------------------------------
   // BID_IMx/BRESP_IMx/BVALID_IMx:
   // --------------------------------------------------------------------------
   always @(posedge ACLK or negedge aresetn) begin
      if((!aresetn) || (!sresetn)) begin
           BID_IM    <= 'h0;
           BRESP_IM  <= 'h0; 
           BVALID_IM <= 1'b0;           
      end
      else begin
           BID_IM     <= BID_IM_int;
           BRESP_IM   <= BRESP_IM_int; 
           BVALID_IM  <= BREADY_MI ? 1'b0 : BVALID_IM_int;
      end
   end
   
   always @(*) begin
      // ID width change due to H/W issue
      if((BID_SI0[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI0 == 1'b1 && SC_0 == 1'b0)  && BID_SI0[1:0]  == pend_id_addr0[1:0] && BID_SI0[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr0[3:2] && pend_id_en0 && outstnd_waddr0 == 4'h0) begin  
           BREADY_IS0  = BREADY_MI;
           BREADY_IS1 = 1'b0; 
           BREADY_IS2 = 1'b0; 
           BREADY_IS3 = 1'b0;
           BREADY_IS4 = 1'b0; 
           BREADY_IS5 = 1'b0; 
           BREADY_IS6 = 1'b0; 
           BREADY_IS7 = 1'b0; 
           BREADY_IS8 = 1'b0; 
           BREADY_IS9 = 1'b0; 
           BREADY_IS10 = 1'b0;
           BREADY_IS11 = 1'b0;
           BREADY_IS12 = 1'b0;
           BREADY_IS13 = 1'b0;
           BREADY_IS14 = 1'b0;
           BREADY_IS15 = 1'b0;
           BREADY_IS16 = 1'b0;
        end
      else if((BID_SI1[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI1 == 1'b1 && SC_1 == 1'b0)  && BID_SI1[1:0]  == pend_id_addr1[1:0] && BID_SI1[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr1[3:2] && pend_id_en1 && outstnd_waddr1 == 4'h1) begin  
           BREADY_IS1  = BREADY_MI;
           BREADY_IS0 = 1'b0; 
           BREADY_IS2 = 1'b0; 
           BREADY_IS3 = 1'b0;
           BREADY_IS4 = 1'b0; 
           BREADY_IS5 = 1'b0; 
           BREADY_IS6 = 1'b0; 
           BREADY_IS7 = 1'b0; 
           BREADY_IS8 = 1'b0; 
           BREADY_IS9 = 1'b0; 
           BREADY_IS10 = 1'b0;
           BREADY_IS11 = 1'b0;
           BREADY_IS12 = 1'b0;
           BREADY_IS13 = 1'b0;
           BREADY_IS14 = 1'b0;
           BREADY_IS15 = 1'b0;
           BREADY_IS16 = 1'b0;
        end
      else if((BID_SI2[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI2 == 1'b1  && SC_2 == 1'b0)   && BID_SI2[1:0]  == pend_id_addr2[1:0] && BID_SI2[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr2[3:2] && pend_id_en2 && outstnd_waddr2 == 4'h2) begin 
           BREADY_IS2  = BREADY_MI;
           BREADY_IS0 = 1'b0; 
           BREADY_IS1 = 1'b0; 
           BREADY_IS3 = 1'b0;
           BREADY_IS4 = 1'b0; 
           BREADY_IS5 = 1'b0; 
           BREADY_IS6 = 1'b0; 
           BREADY_IS7 = 1'b0; 
           BREADY_IS8 = 1'b0; 
           BREADY_IS9 = 1'b0; 
           BREADY_IS10 = 1'b0;
           BREADY_IS11 = 1'b0;
           BREADY_IS12 = 1'b0;
           BREADY_IS13 = 1'b0;
           BREADY_IS14 = 1'b0;
           BREADY_IS15 = 1'b0;
           BREADY_IS16 = 1'b0;
        end
        else if((BID_SI3[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI3 == 1'b1 && SC_3 == 1'b0)   && BID_SI3[1:0]  == pend_id_addr3[1:0] && BID_SI3[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr3[3:2] && pend_id_en3 && outstnd_waddr3 == 4'h3) begin 
           BREADY_IS3  = BREADY_MI;
           BREADY_IS0 = 1'b0; 
           BREADY_IS2 = 1'b0; 
           BREADY_IS1 = 1'b0;
           BREADY_IS4 = 1'b0; 
           BREADY_IS5 = 1'b0; 
           BREADY_IS6 = 1'b0; 
           BREADY_IS7 = 1'b0; 
           BREADY_IS8 = 1'b0; 
           BREADY_IS9 = 1'b0; 
           BREADY_IS10 = 1'b0;
           BREADY_IS11 = 1'b0;
           BREADY_IS12 = 1'b0;
           BREADY_IS13 = 1'b0;
           BREADY_IS14 = 1'b0;
           BREADY_IS15 = 1'b0;
           BREADY_IS16 = 1'b0;

        end
        else if((BID_SI4[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI4 == 1'b1 && SC_4 == 1'b0)   && BID_SI4[1:0]  == pend_id_addr4[1:0] && BID_SI4[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr4[3:2] && pend_id_en4 && outstnd_waddr4 == 4'h4) begin
           
           BREADY_IS4  = BREADY_MI;
           BREADY_IS0 = 1'b0; 
           BREADY_IS2 = 1'b0; 
           BREADY_IS3 = 1'b0;
           BREADY_IS1 = 1'b0; 
           BREADY_IS5 = 1'b0; 
           BREADY_IS6 = 1'b0; 
           BREADY_IS7 = 1'b0; 
           BREADY_IS8 = 1'b0; 
           BREADY_IS9 = 1'b0; 
           BREADY_IS10 = 1'b0;
           BREADY_IS11 = 1'b0;
           BREADY_IS12 = 1'b0;
           BREADY_IS13 = 1'b0;
           BREADY_IS14 = 1'b0;
           BREADY_IS15 = 1'b0;
           BREADY_IS16 = 1'b0;

        end
        else if((BID_SI5[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI5 == 1'b1 && SC_5 == 1'b0)  && BID_SI5[1:0]  == pend_id_addr5[1:0] && BID_SI5[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr5[3:2] && pend_id_en5 && outstnd_waddr5 == 4'h5) begin
           
           BREADY_IS5  = BREADY_MI;
           BREADY_IS0 = 1'b0; 
           BREADY_IS2 = 1'b0; 
           BREADY_IS3 = 1'b0;
           BREADY_IS4 = 1'b0; 
           BREADY_IS1 = 1'b0; 
           BREADY_IS6 = 1'b0; 
           BREADY_IS7 = 1'b0; 
           BREADY_IS8 = 1'b0; 
           BREADY_IS9 = 1'b0; 
           BREADY_IS10 = 1'b0;
           BREADY_IS11 = 1'b0;
           BREADY_IS12 = 1'b0;
           BREADY_IS13 = 1'b0;
           BREADY_IS14 = 1'b0;
           BREADY_IS15 = 1'b0;
           BREADY_IS16 = 1'b0;
        end
        else if((BID_SI6[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI6 == 1'b1 && SC_6 == 1'b0)   && BID_SI6[1:0]  == pend_id_addr6[1:0] && BID_SI6[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr6[3:2] && pend_id_en6 && outstnd_waddr6 == 4'h6) begin
           
           BREADY_IS6  = BREADY_MI;

           BREADY_IS0 = 1'b0; 
           BREADY_IS2 = 1'b0; 
           BREADY_IS3 = 1'b0;
           BREADY_IS4 = 1'b0; 
           BREADY_IS5 = 1'b0; 
           BREADY_IS1 = 1'b0; 
           BREADY_IS7 = 1'b0; 
           BREADY_IS8 = 1'b0; 
           BREADY_IS9 = 1'b0; 
           BREADY_IS10 = 1'b0;
           BREADY_IS11 = 1'b0;
           BREADY_IS12 = 1'b0;
           BREADY_IS13 = 1'b0;
           BREADY_IS14 = 1'b0;
           BREADY_IS15 = 1'b0;
           BREADY_IS16 = 1'b0;
        end
        else if((BID_SI7[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI7 == 1'b1 && SC_7 == 1'b0)   && BID_SI7[1:0]  == pend_id_addr7[1:0] && BID_SI7[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr7[3:2] && pend_id_en7 && outstnd_waddr7 == 4'h7) begin
           
           BREADY_IS7  = BREADY_MI;
           BREADY_IS0 = 1'b0; 
           BREADY_IS2 = 1'b0; 
           BREADY_IS3 = 1'b0;
           BREADY_IS4 = 1'b0; 
           BREADY_IS5 = 1'b0; 
           BREADY_IS6 = 1'b0; 
           BREADY_IS1 = 1'b0; 
           BREADY_IS8 = 1'b0; 
           BREADY_IS9 = 1'b0; 
           BREADY_IS10 = 1'b0;
           BREADY_IS11 = 1'b0;
           BREADY_IS12 = 1'b0;
           BREADY_IS13 = 1'b0;
           BREADY_IS14 = 1'b0;
           BREADY_IS15 = 1'b0;
           BREADY_IS16 = 1'b0;
        end
        else if((BID_SI8[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI8 == 1'b1 && SC_8 == 1'b0)   && BID_SI8[1:0]  == pend_id_addr8[1:0] && BID_SI8[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr8[3:2] && pend_id_en8 && outstnd_waddr8 == 4'h8) begin
           
           BREADY_IS8  = BREADY_MI;
           BREADY_IS0 = 1'b0; 
           BREADY_IS2 = 1'b0; 
           BREADY_IS3 = 1'b0;
           BREADY_IS4 = 1'b0; 
           BREADY_IS5 = 1'b0; 
           BREADY_IS6 = 1'b0; 
           BREADY_IS7 = 1'b0; 
           BREADY_IS1 = 1'b0; 
           BREADY_IS9 = 1'b0; 
           BREADY_IS10 = 1'b0;
           BREADY_IS11 = 1'b0;
           BREADY_IS12 = 1'b0;
           BREADY_IS13 = 1'b0;
           BREADY_IS14 = 1'b0;
           BREADY_IS15 = 1'b0;
           BREADY_IS16 = 1'b0;
        end
        else if((BID_SI9[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI9 == 1'b1 && SC_9 == 1'b0)   && BID_SI9[1:0]  == pend_id_addr9[1:0] && BID_SI9[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr9[3:2] && pend_id_en9 && outstnd_waddr9 == 4'h9) begin
           
           BREADY_IS9  = BREADY_MI;
           BREADY_IS0 = 1'b0; 
           BREADY_IS2 = 1'b0; 
           BREADY_IS3 = 1'b0;
           BREADY_IS4 = 1'b0; 
           BREADY_IS5 = 1'b0; 
           BREADY_IS6 = 1'b0; 
           BREADY_IS7 = 1'b0; 
           BREADY_IS8 = 1'b0; 
           BREADY_IS1 = 1'b0; 
           BREADY_IS10 = 1'b0;
           BREADY_IS11 = 1'b0;
           BREADY_IS12 = 1'b0;
           BREADY_IS13 = 1'b0;
           BREADY_IS14 = 1'b0;
           BREADY_IS15 = 1'b0;
           BREADY_IS16 = 1'b0;
        end
        else if((BID_SI10[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI10 == 1'b1 && SC_10 == 1'b0)   && BID_SI10[1:0]  == pend_id_addr10[1:0] && BID_SI10[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr10[3:2] && pend_id_en10 && outstnd_waddr10 == 4'hA) begin
           
           BREADY_IS10  = BREADY_MI;
           BREADY_IS0 = 1'b0; 
           BREADY_IS2 = 1'b0; 
           BREADY_IS3 = 1'b0;
           BREADY_IS4 = 1'b0; 
           BREADY_IS5 = 1'b0; 
           BREADY_IS6 = 1'b0; 
           BREADY_IS7 = 1'b0; 
           BREADY_IS8 = 1'b0; 
           BREADY_IS9 = 1'b0; 
           BREADY_IS1 = 1'b0;
           BREADY_IS11 = 1'b0;
           BREADY_IS12 = 1'b0;
           BREADY_IS13 = 1'b0;
           BREADY_IS14 = 1'b0;
           BREADY_IS15 = 1'b0;
           BREADY_IS16 = 1'b0;
        end
        else if((BID_SI11[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI11 == 1'b1 && SC_11 == 1'b0)  && BID_SI11[1:0]  == pend_id_addr11[1:0] && BID_SI11[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr11[3:2] && pend_id_en11 && outstnd_waddr11 == 4'hB) begin
           
           BREADY_IS11  = BREADY_MI;
           BREADY_IS0 = 1'b0; 
           BREADY_IS2 = 1'b0; 
           BREADY_IS3 = 1'b0;
           BREADY_IS4 = 1'b0; 
           BREADY_IS5 = 1'b0; 
           BREADY_IS6 = 1'b0; 
           BREADY_IS7 = 1'b0; 
           BREADY_IS8 = 1'b0; 
           BREADY_IS9 = 1'b0; 
           BREADY_IS10 = 1'b0;
           BREADY_IS1 = 1'b0;
           BREADY_IS12 = 1'b0;
           BREADY_IS13 = 1'b0;
           BREADY_IS14 = 1'b0;
           BREADY_IS15 = 1'b0;
           BREADY_IS16 = 1'b0;
        end
        else if((BID_SI12[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI12 == 1'b1 && SC_12 == 1'b0)  && BID_SI12[1:0]  == pend_id_addr12[1:0] && BID_SI12[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr12[3:2] && pend_id_en12 && outstnd_waddr12 == 4'hC) begin
           
           BREADY_IS12  = BREADY_MI;
           BREADY_IS0 = 1'b0; 
           BREADY_IS2 = 1'b0; 
           BREADY_IS3 = 1'b0;
           BREADY_IS4 = 1'b0; 
           BREADY_IS5 = 1'b0; 
           BREADY_IS6 = 1'b0; 
           BREADY_IS7 = 1'b0; 
           BREADY_IS8 = 1'b0; 
           BREADY_IS9 = 1'b0; 
           BREADY_IS10 = 1'b0;
           BREADY_IS11 = 1'b0;
           BREADY_IS1 = 1'b0;
           BREADY_IS13 = 1'b0;
           BREADY_IS14 = 1'b0;
           BREADY_IS15 = 1'b0;
           BREADY_IS16 = 1'b0;
        end
        else if((BID_SI13[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI13 == 1'b1 && SC_13 == 1'b0)  && BID_SI13[1:0]  == pend_id_addr13[1:0] && BID_SI13[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr13[3:2] && pend_id_en13 && outstnd_waddr13 == 4'hD) begin
           
           BREADY_IS13  = BREADY_MI;
           BREADY_IS0 = 1'b0; 
           BREADY_IS2 = 1'b0; 
           BREADY_IS3 = 1'b0;
           BREADY_IS4 = 1'b0; 
           BREADY_IS5 = 1'b0; 
           BREADY_IS6 = 1'b0; 
           BREADY_IS7 = 1'b0; 
           BREADY_IS8 = 1'b0; 
           BREADY_IS9 = 1'b0; 
           BREADY_IS10 = 1'b0;
           BREADY_IS11 = 1'b0;
           BREADY_IS12 = 1'b0;
           BREADY_IS1 = 1'b0;
           BREADY_IS14 = 1'b0;
           BREADY_IS15 = 1'b0;
           BREADY_IS16 = 1'b0;
        end
        else if((BID_SI14[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI14 == 1'b1 && SC_14 == 1'b0)  && BID_SI14[1:0]  == pend_id_addr14[1:0] && BID_SI14[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr14[3:2] && pend_id_en14 && outstnd_waddr14 == 4'hE) begin
           
           BREADY_IS14  = BREADY_MI;
           BREADY_IS0 = 1'b0; 
           BREADY_IS2 = 1'b0; 
           BREADY_IS3 = 1'b0;
           BREADY_IS4 = 1'b0; 
           BREADY_IS5 = 1'b0; 
           BREADY_IS6 = 1'b0; 
           BREADY_IS7 = 1'b0; 
           BREADY_IS8 = 1'b0; 
           BREADY_IS9 = 1'b0; 
           BREADY_IS10 = 1'b0;
           BREADY_IS11 = 1'b0;
           BREADY_IS12 = 1'b0;
           BREADY_IS13 = 1'b0;
           BREADY_IS1 = 1'b0;
           BREADY_IS15 = 1'b0;
           BREADY_IS16 = 1'b0;
        end
        else if((BID_SI15[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI15 == 1'b1 && SC_15 == 1'b0) && BID_SI15[1:0]  == pend_id_addr15[1:0] && BID_SI15[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr15[3:2] && pend_id_en15 && outstnd_waddr15 == 4'hF) begin
           
           BREADY_IS15  = BREADY_MI;
           BREADY_IS0 = 1'b0; 
           BREADY_IS2 = 1'b0; 
           BREADY_IS3 = 1'b0;
           BREADY_IS4 = 1'b0; 
           BREADY_IS5 = 1'b0; 
           BREADY_IS6 = 1'b0; 
           BREADY_IS7 = 1'b0; 
           BREADY_IS8 = 1'b0; 
           BREADY_IS9 = 1'b0; 
           BREADY_IS10 = 1'b0;
           BREADY_IS11 = 1'b0;
           BREADY_IS12 = 1'b0;
           BREADY_IS13 = 1'b0;
           BREADY_IS14 = 1'b0;
           BREADY_IS1 = 1'b0;
           BREADY_IS16 = 1'b0;
        end
        else if((BID_SI16[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI16 == 1'b1)) begin
           
           BREADY_IS16  = BREADY_MI;
           BREADY_IS0 = 1'b0; 
           BREADY_IS2 = 1'b0; 
           BREADY_IS3 = 1'b0;
           BREADY_IS4 = 1'b0; 
           BREADY_IS5 = 1'b0; 
           BREADY_IS6 = 1'b0; 
           BREADY_IS7 = 1'b0; 
           BREADY_IS8 = 1'b0; 
           BREADY_IS9 = 1'b0; 
           BREADY_IS10 = 1'b0;
           BREADY_IS11 = 1'b0;
           BREADY_IS12 = 1'b0;
           BREADY_IS13 = 1'b0;
           BREADY_IS14 = 1'b0;
           BREADY_IS15 = 1'b0;
           BREADY_IS1 = 1'b0;
        end
        else begin
           
           BREADY_IS0 = 1'b0;
           BREADY_IS1 = 1'b0; 
           BREADY_IS2 = 1'b0; 
           BREADY_IS3 = 1'b0;
           BREADY_IS4 = 1'b0; 
           BREADY_IS5 = 1'b0; 
           BREADY_IS6 = 1'b0; 
           BREADY_IS7 = 1'b0; 
           BREADY_IS8 = 1'b0; 
           BREADY_IS9 = 1'b0; 
           BREADY_IS10 = 1'b0;
           BREADY_IS11 = 1'b0;
           BREADY_IS12 = 1'b0;
           BREADY_IS13 = 1'b0;
           BREADY_IS14 = 1'b0;
           BREADY_IS15 = 1'b0;
           BREADY_IS16 = 1'b0;
        end
   end

   always @(*) begin
      // ID width change due to H/W issue
      if((BID_SI0[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI0 == 1'b1 && SC_0 == 1'b0) && BID_SI0[1:0]  == pend_id_addr0[1:0] && BID_SI0[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr0[3:2] && pend_id_en0 && outstnd_waddr0 == 4'h0) begin  
           BID_IM_int     = BID_SI0;
           BRESP_IM_int   = BRESP_SI0; 
           BVALID_IM_int  = BVALID_SI0;
        end
      else if((BID_SI1[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI1 == 1'b1 && SC_1 == 1'b0) && BID_SI1[1:0]  == pend_id_addr1[1:0] && BID_SI1[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr1[3:2] && pend_id_en1 && outstnd_waddr1 == 4'h1) begin
           BID_IM_int     = BID_SI1;
           BRESP_IM_int   = BRESP_SI1; 
           BVALID_IM_int  = BVALID_SI1;
        end
      else if((BID_SI2[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI2 == 1'b1  && SC_2 == 1'b0) && BID_SI2[1:0]  == pend_id_addr2[1:0] && BID_SI2[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr2[3:2] && pend_id_en2 && outstnd_waddr2 == 4'h2) begin 
           BID_IM_int     = BID_SI2;
           BRESP_IM_int   = BRESP_SI2; 
           BVALID_IM_int  = BVALID_SI2;
        end
        else if((BID_SI3[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI3 == 1'b1 && SC_3 == 1'b0) && BID_SI3[1:0]  == pend_id_addr3[1:0] && BID_SI3[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr3[3:2] && pend_id_en3 && outstnd_waddr3 == 4'h3) begin 
           BID_IM_int     = BID_SI3;
           BRESP_IM_int   = BRESP_SI3; 
           BVALID_IM_int  = BVALID_SI3;

        end
        else if((BID_SI4[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI4 == 1'b1 && SC_4 == 1'b0) && BID_SI4[1:0]  == pend_id_addr4[1:0] && BID_SI4[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr4[3:2] && pend_id_en4 && outstnd_waddr4 == 4'h4) begin  
           BID_IM_int     = BID_SI4;
           BRESP_IM_int   = BRESP_SI4; 
           BVALID_IM_int  = BVALID_SI4;

        end
        else if((BID_SI5[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI5 == 1'b1 && SC_5 == 1'b0) && BID_SI5[1:0]  == pend_id_addr5[1:0] && BID_SI5[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr5[3:2] && pend_id_en5 && outstnd_waddr5 == 4'h5) begin  
           BID_IM_int     = BID_SI5;
           BRESP_IM_int   = BRESP_SI5; 
           BVALID_IM_int  = BVALID_SI5;
        end
        else if((BID_SI6[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI6 == 1'b1 && SC_6 == 1'b0) && BID_SI6[1:0]  == pend_id_addr6[1:0] && BID_SI6[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr6[3:2] && pend_id_en6 && outstnd_waddr6 == 4'h6) begin  
           BID_IM_int     = BID_SI6;
           BRESP_IM_int   = BRESP_SI6; 
           BVALID_IM_int  = BVALID_SI6;
        end
        else if((BID_SI7[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI7 == 1'b1 && SC_7 == 1'b0) && BID_SI7[1:0]  == pend_id_addr7[1:0] && BID_SI7[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr7[3:2] && pend_id_en7 && outstnd_waddr7 == 4'h7) begin  
           BID_IM_int     = BID_SI7;
           BRESP_IM_int   = BRESP_SI7; 
           BVALID_IM_int  = BVALID_SI7;
        end
        else if((BID_SI8[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI8 == 1'b1 && SC_8 == 1'b0) && BID_SI8[1:0]  == pend_id_addr8[1:0] && BID_SI8[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr8[3:2] && pend_id_en8 && outstnd_waddr8 == 4'h8) begin  
           BID_IM_int     = BID_SI8;
           BRESP_IM_int   = BRESP_SI8; 
           BVALID_IM_int  = BVALID_SI8;
        end
        else if((BID_SI9[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI9 == 1'b1 && SC_9 == 1'b0) && BID_SI9[1:0]  == pend_id_addr9[1:0] && BID_SI9[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr9[3:2] && pend_id_en9 && outstnd_waddr9 == 4'h9) begin  
           BID_IM_int     = BID_SI9;
           BRESP_IM_int   = BRESP_SI9; 
           BVALID_IM_int  = BVALID_SI9;
        end
        else if((BID_SI10[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI10 == 1'b1 && SC_10 == 1'b0) && BID_SI10[1:0]  == pend_id_addr10[1:0] && BID_SI10[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr10[3:2] && pend_id_en10 && outstnd_waddr10 == 4'hA) begin  
           BID_IM_int     = BID_SI10;
           BRESP_IM_int   = BRESP_SI10; 
           BVALID_IM_int  = BVALID_SI10;
        end
        else if((BID_SI11[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI11 == 1'b1 && SC_11 == 1'b0) && BID_SI11[1:0]  == pend_id_addr11[1:0] && BID_SI11[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr11[3:2] && pend_id_en11 && outstnd_waddr11 == 4'hB) begin  
           BID_IM_int     = BID_SI11;
           BRESP_IM_int   = BRESP_SI11; 
           BVALID_IM_int  = BVALID_SI11;
        end
        else if((BID_SI12[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI12 == 1'b1 && SC_12 == 1'b0) && BID_SI12[1:0]  == pend_id_addr12[1:0] && BID_SI12[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr12[3:2] && pend_id_en12 && outstnd_waddr12 == 4'hC) begin  
           BID_IM_int     = BID_SI12;
           BRESP_IM_int   = BRESP_SI12; 
           BVALID_IM_int  = BVALID_SI12;
        end
        else if((BID_SI13[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI13 == 1'b1 && SC_13 == 1'b0) && BID_SI13[1:0]  == pend_id_addr13[1:0] && BID_SI13[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr13[3:2] && pend_id_en13 && outstnd_waddr13 == 4'hD) begin  
           BID_IM_int     = BID_SI13;
           BRESP_IM_int   = BRESP_SI13; 
           BVALID_IM_int  = BVALID_SI13;
        end
        else if((BID_SI14[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI14 == 1'b1 && SC_14 == 1'b0) && BID_SI14[1:0]  == pend_id_addr14[1:0] && BID_SI14[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr14[3:2] && pend_id_en14 && outstnd_waddr14 == 4'hE) begin  
           BID_IM_int     = BID_SI14;
           BRESP_IM_int   = BRESP_SI14; 
           BVALID_IM_int  = BVALID_SI14;
        end
        else if((BID_SI15[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI15 == 1'b1 && SC_15 == 1'b0) && BID_SI15[1:0]  == pend_id_addr15[1:0] && BID_SI15[BASE_ID_WIDTH+ID_WIDTH-1:BASE_ID_WIDTH+ID_WIDTH-2]  == pend_id_addr15[3:2] && pend_id_en15 && outstnd_waddr15 == 4'hF) begin  
           BID_IM_int     = BID_SI15;
           BRESP_IM_int   = BRESP_SI15; 
           BVALID_IM_int  = BVALID_SI15;
        end
        else if((BID_SI16[BASE_ID_WIDTH+ID_WIDTH-3:ID_WIDTH-2]  == UID_WIDTH && BVALID_SI16 == 1'b1)) begin  
           BID_IM_int     = BID_SI16;
           BRESP_IM_int   = BRESP_SI16; 
           BVALID_IM_int  = BVALID_SI16;
        end
        else begin
           BID_IM_int    = 'h0;
           BRESP_IM_int  = 'h0; 
           BVALID_IM_int = 1'b0;
        end
   end




endmodule // wresp_channel



   /////////////////////////////////////////////////////////////////////////////
   //                               End - of - Code                           //
   /////////////////////////////////////////////////////////////////////////////

