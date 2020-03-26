-- ****************************************************************************/
-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description: CoreAXI - Multi - Master AXI bus interface that supports 
--                        up to 16 slaves 
--
-- Revision Information:
-- Date            Description
-- ----            -----------------------------------------
-- 02Feb11         Inital. Ports and Parameters declaration
--
-- SVN Revision Information:
-- SVN $Revision: 11146 $
-- SVN $Date: 2009-11-21 11:44:53 -0800 (Sat, 21 Nov 2009) $
--
-- Resolved SARs
-- SAR      Date     Who   Description
--
-- Notes:
-- 1. 
--
-- ****************************************************************************/

LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;
   USE work.XHDL_std_logic.all;
   USE work.XHDL_misc.all; 
   USE work.axi_pkg.all; 


ENTITY axi_slave_stage IS
   GENERIC (
      -- --------------------------------------------------------------------------
      -- Parameter Declaration
      -- --------------------------------------------------------------------------
      FAMILY                         :  integer := 19;    
      SYNC_RESET                     :  integer := 0;    
      AXI_AWIDTH                     :  integer := 32;    
      AXI_DWIDTH                     :  integer := 64;   
      M0_SLAVE0ENABLE                :  integer := 1;    
      M0_SLAVE1ENABLE                :  integer := 0;    
      M0_SLAVE2ENABLE                :  integer := 0;    
      M0_SLAVE3ENABLE                :  integer := 0;    
      M0_SLAVE4ENABLE                :  integer := 0;    
      M0_SLAVE5ENABLE                :  integer := 0;    
      M0_SLAVE6ENABLE                :  integer := 0;    
      M0_SLAVE7ENABLE                :  integer := 0;    
      M0_SLAVE8ENABLE                :  integer := 0;    
      M0_SLAVE9ENABLE                :  integer := 0;    
      M0_SLAVE10ENABLE               :  integer := 0;    
      M0_SLAVE11ENABLE               :  integer := 0;    
      M0_SLAVE12ENABLE               :  integer := 0;    
      M0_SLAVE13ENABLE               :  integer := 0;    
      M0_SLAVE14ENABLE               :  integer := 0;    
      M0_SLAVE15ENABLE               :  integer := 0;    
      M0_SLAVE16ENABLE               :  integer := 0;    
      M1_SLAVE0ENABLE                :  integer := 1;    
      M1_SLAVE1ENABLE                :  integer := 0;    
      M1_SLAVE2ENABLE                :  integer := 0;    
      M1_SLAVE3ENABLE                :  integer := 0;    
      M1_SLAVE4ENABLE                :  integer := 0;    
      M1_SLAVE5ENABLE                :  integer := 0;    
      M1_SLAVE6ENABLE                :  integer := 0;    
      M1_SLAVE7ENABLE                :  integer := 0;    
      M1_SLAVE8ENABLE                :  integer := 0;    
      M1_SLAVE9ENABLE                :  integer := 0;    
      M1_SLAVE10ENABLE               :  integer := 0;    
      M1_SLAVE11ENABLE               :  integer := 0;    
      M1_SLAVE12ENABLE               :  integer := 0;    
      M1_SLAVE13ENABLE               :  integer := 0;    
      M1_SLAVE14ENABLE               :  integer := 0;    
      M1_SLAVE15ENABLE               :  integer := 0;    
      M1_SLAVE16ENABLE               :  integer := 0;    
      M2_SLAVE0ENABLE                :  integer := 1;    
      M2_SLAVE1ENABLE                :  integer := 0;    
      M2_SLAVE2ENABLE                :  integer := 0;    
      M2_SLAVE3ENABLE                :  integer := 0;    
      M2_SLAVE4ENABLE                :  integer := 0;    
      M2_SLAVE5ENABLE                :  integer := 0;    
      M2_SLAVE6ENABLE                :  integer := 0;    
      M2_SLAVE7ENABLE                :  integer := 0;    
      M2_SLAVE8ENABLE                :  integer := 0;    
      M2_SLAVE9ENABLE                :  integer := 0;    
      M2_SLAVE10ENABLE               :  integer := 0;    
      M2_SLAVE11ENABLE               :  integer := 0;    
      M2_SLAVE12ENABLE               :  integer := 0;    
      M2_SLAVE13ENABLE               :  integer := 0;    
      M2_SLAVE14ENABLE               :  integer := 0;    
      M2_SLAVE15ENABLE               :  integer := 0;    
      M2_SLAVE16ENABLE               :  integer := 0;    
      M3_SLAVE0ENABLE                :  integer := 1;    
      M3_SLAVE1ENABLE                :  integer := 0;    
      M3_SLAVE2ENABLE                :  integer := 0;    
      M3_SLAVE3ENABLE                :  integer := 0;    
      M3_SLAVE4ENABLE                :  integer := 0;    
      M3_SLAVE5ENABLE                :  integer := 0;    
      M3_SLAVE6ENABLE                :  integer := 0;    
      M3_SLAVE7ENABLE                :  integer := 0;    
      M3_SLAVE8ENABLE                :  integer := 0;    
      M3_SLAVE9ENABLE                :  integer := 0;    
      M3_SLAVE10ENABLE               :  integer := 0;    
      M3_SLAVE11ENABLE               :  integer := 0;    
      M3_SLAVE12ENABLE               :  integer := 0;    
      M3_SLAVE13ENABLE               :  integer := 0;    
      M3_SLAVE14ENABLE               :  integer := 0;    
      M3_SLAVE15ENABLE               :  integer := 0;    
      M3_SLAVE16ENABLE               :  integer := 0;    
      ID_WIDTH                       :  integer := 4;    
      NUM_SLAVE_SLOT                 :  integer := 1;    --  1 - 16
      NUM_MASTER_SLOT                :  integer := 1;    --  1 - 4
      MEMSPACE                       :  integer := 1;    --  0 - 6
      HGS_CFG                        :  integer := 1;    --  1 - 6
      ADDR_HGS_CFG                   :  integer := 1;    --  0 - 1
      SC_0                           :  integer := 0;    
      SC_1                           :  integer := 0;    
      SC_2                           :  integer := 0;    
      SC_3                           :  integer := 0;    
      SC_4                           :  integer := 0;    
      SC_5                           :  integer := 0;    
      SC_6                           :  integer := 0;    
      SC_7                           :  integer := 0;    
      SC_8                           :  integer := 0;    
      SC_9                           :  integer := 0;    
      SC_10                          :  integer := 0;    
      SC_11                          :  integer := 0;    
      SC_12                          :  integer := 0;    
      SC_13                          :  integer := 0;    
      SC_14                          :  integer := 0;    
      SC_15                          :  integer := 0;    
      FEED_THROUGH                   :  integer := 0;    --  0 - 1
      INP_REG_BUF                    :  integer := 1;    --  0 - 1
      OUT_REG_BUF                    :  integer := 1;    --  0 - 1
      WR_ACCEPTANCE                  :  integer := 4;    --  1 - 4
      RD_ACCEPTANCE                  :  integer := 4;    --  1 - 4
      BASE_ID_WIDTH                  :  integer := 2);    
   PORT (
      -- --------------------------------------------------------------------------
-- I/O Declaration
-- --------------------------------------------------------------------------
-- Global signals

      ACLK                    : IN std_logic;   
      ARESETN                 : IN std_logic;   
      -- MASTER 0
-- AXI MASTER 0 write address channel signals

      AWID_IS                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_IS               : IN std_logic_vector(31 DOWNTO 0);   
      AWLEN_IS                : IN std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS               : IN std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS              : IN std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS               : IN std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS              : IN std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS               : IN std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS              : IN std_logic;   
      AWREADY_SI              : OUT std_logic;   
      -- AXI MASTER 0 write data channel signals

      WID_IS                  : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_IS                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      WSTRB_IS                : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_IS                : IN std_logic;   
      WVALID_IS               : IN std_logic;   
      WREADY_SI               : OUT std_logic;   
      -- AXI MASTER 0 write response channel signals

      BID_SI                  : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_SI                : OUT std_logic_vector(1 DOWNTO 0);   
      BVALID_SI               : OUT std_logic;   
      BREADY_IS               : IN std_logic;   
      -- AXI MASTER 0 read address channel signals

      ARID_IS                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_IS               : IN std_logic_vector(31 DOWNTO 0);   
      ARLEN_IS                : IN std_logic_vector(3 DOWNTO 0);   
      ARSIZE_IS               : IN std_logic_vector(2 DOWNTO 0);   
      ARBURST_IS              : IN std_logic_vector(1 DOWNTO 0);   
      ARLOCK_IS               : IN std_logic_vector(1 DOWNTO 0);   
      ARCACHE_IS              : IN std_logic_vector(3 DOWNTO 0);   
      ARPROT_IS               : IN std_logic_vector(2 DOWNTO 0);   
      ARVALID_IS              : IN std_logic;   
      ARREADY_SI              : OUT std_logic;   
      -- AXI MASTER 0 read response channel signals

      RID_SI                  : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_SI                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      RRESP_SI                : OUT std_logic_vector(1 DOWNTO 0);   
      RLAST_SI                : OUT std_logic;   
      RVALID_SI               : OUT std_logic;   
      RREADY_IS               : IN std_logic;   
      -- SLAVE 0
-- AXI SLAVE 0 write address channel signals

      AWID_S                  : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_S                : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_S                 : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_S                : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_S               : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_S                : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_S               : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_S                : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_S               : OUT std_logic;   
      AWREADY_S               : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_S                   : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_S                 : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S                 : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_S                 : OUT std_logic;   
      WVALID_S                : OUT std_logic;   
      WREADY_S                : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_S                   : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_S                 : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_S                : IN std_logic;   
      BREADY_S                : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_S                  : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_S                : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_S                 : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_S                : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_S               : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_S                : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_S               : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_S                : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_S               : OUT std_logic;   
      ARREADY_S               : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_S                   : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_S                 : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_S                 : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_S                 : IN std_logic;   
      RVALID_S                : IN std_logic;   
      RREADY_S                : OUT std_logic);   
END axi_slave_stage;

ARCHITECTURE translated OF axi_slave_stage IS


   CONSTANT  AXI_STRBWIDTH         :  integer := AXI_DWIDTH / 8;    
   CONSTANT  SLAVE_0               :  std_logic_vector(16 DOWNTO 0) := 
   "00000000000000001";    
   CONSTANT  SLAVE_1               :  std_logic_vector(16 DOWNTO 0) := 
   "00000000000000010";    
   CONSTANT  SLAVE_2               :  std_logic_vector(16 DOWNTO 0) := 
   "00000000000000100";    
   CONSTANT  SLAVE_3               :  std_logic_vector(16 DOWNTO 0) := 
   "00000000000001000";    
   CONSTANT  SLAVE_4               :  std_logic_vector(16 DOWNTO 0) := 
   "00000000000010000";    
   CONSTANT  SLAVE_5               :  std_logic_vector(16 DOWNTO 0) := 
   "00000000000100000";    
   CONSTANT  SLAVE_6               :  std_logic_vector(16 DOWNTO 0) := 
   "00000000001000000";    
   CONSTANT  SLAVE_7               :  std_logic_vector(16 DOWNTO 0) := 
   "00000000010000000";    
   CONSTANT  SLAVE_8               :  std_logic_vector(16 DOWNTO 0) := 
   "00000000100000000";    
   CONSTANT  SLAVE_9               :  std_logic_vector(16 DOWNTO 0) := 
   "00000001000000000";    
   CONSTANT  SLAVE_A               :  std_logic_vector(16 DOWNTO 0) := 
   "00000010000000000";    
   CONSTANT  SLAVE_B               :  std_logic_vector(16 DOWNTO 0) := 
   "00000100000000000";    
   CONSTANT  SLAVE_C               :  std_logic_vector(16 DOWNTO 0) := 
   "00001000000000000";    
   CONSTANT  SLAVE_D               :  std_logic_vector(16 DOWNTO 0) := 
   "00010000000000000";    
   CONSTANT  SLAVE_E               :  std_logic_vector(16 DOWNTO 0) := 
   "00100000000000000";    
   CONSTANT  SLAVE_F               :  std_logic_vector(16 DOWNTO 0) := 
   "01000000000000000";    
   CONSTANT  SLAVE_N               :  std_logic_vector(16 DOWNTO 0) := 
   "10000000000000000";    
   -- --------------------------------------------------------------------------
   -- Internal signals
   -- --------------------------------------------------------------------------
   -- AXI SLAVE 0 write data channel signals
   -- AXI SLAVE 0 write response channel signals
   -- AXI SLAVE 0 read address channel signals
   --   wire                       RREADY_S;
   SIGNAL RID_S_FF1                :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_S_FF1              :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_S_FF1              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S_FF1              :  std_logic;   
   SIGNAL RVALID_S_FF1             :  std_logic;   
   SIGNAL RID_S_INPFF1             :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_S_INPFF1           :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_S_INPFF1           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S_INPFF1           :  std_logic;   
   SIGNAL RVALID_S_INPFF1          :  std_logic;   
   SIGNAL RID_S_pulse              :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_S_pulse            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_S_pulse            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S_pulse            :  std_logic;   
   SIGNAL RVALID_S_pulse           :  std_logic;   
   SIGNAL BID_S_FF1                :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_S_FF1              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S_FF1             :  std_logic;   
   SIGNAL BID_S_INPFF1             :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_S_INPFF1           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S_INPFF1          :  std_logic;   
   SIGNAL BID_S_pulse              :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_S_pulse            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S_pulse           :  std_logic;   
   SIGNAL gated_WVALID_S           :  std_logic;   
   SIGNAL gated_AWVALID_flag       :  std_logic;   
   SIGNAL WLAST_S_int              :  std_logic;   
   SIGNAL WVALID_S_int             :  std_logic;   
   SIGNAL AWVALID_IS_r             :  std_logic;   
   SIGNAL ARVALID_IS_r             :  std_logic;   
   SIGNAL WVALID_IS_r              :  std_logic;   
   SIGNAL RID_M_FF1                :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_M_FF1              :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_M_FF1              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_M_FF1              :  std_logic;   
   SIGNAL RVALID_M_FF1             :  std_logic;   
   SIGNAL RID_M_INPFF1             :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_M_INPFF1           :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_M_INPFF1           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_M_INPFF1           :  std_logic;   
   SIGNAL RVALID_M_INPFF1          :  std_logic;   
   SIGNAL RID_M_pulse              :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_M_pulse            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_M_pulse            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_M_pulse            :  std_logic;   
   SIGNAL RVALID_M_pulse           :  std_logic;   
   SIGNAL AWVALID_IS_r1            :  std_logic;   
   SIGNAL WVALID_IS_r1             :  std_logic;   
   SIGNAL AWVALID_S_r              :  std_logic;   
   SIGNAL WVALID_S_r               :  std_logic;   
   SIGNAL ARVALID_S_r              :  std_logic;   
   SIGNAL AWVALID_S_r1             :  std_logic;   
   SIGNAL WVALID_S_r1              :  std_logic;   
   SIGNAL ARVALID_S_r1             :  std_logic;   
   SIGNAL AWREADY_S_r              :  std_logic;   
   SIGNAL ARREADY_S_r              :  std_logic;   
   SIGNAL AWREADY_SI_xhdl1         :  std_logic;   
   SIGNAL WREADY_SI_xhdl2          :  std_logic;   
   SIGNAL BID_SI_xhdl3             :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_SI_xhdl4           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_SI_xhdl5          :  std_logic;   
   SIGNAL ARREADY_SI_xhdl6         :  std_logic;   
   SIGNAL RID_SI_xhdl7             :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_SI_xhdl8           :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_SI_xhdl9           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_SI_xhdl10          :  std_logic;   
   SIGNAL RVALID_SI_xhdl11         :  std_logic;   
   SIGNAL AWID_S_xhdl12            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_S_xhdl13          :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_S_xhdl14           :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S_xhdl15          :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S_xhdl16         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S_xhdl17          :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S_xhdl18         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S_xhdl19          :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S_xhdl20         :  std_logic;   
   SIGNAL WID_S_xhdl21             :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_S_xhdl22           :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_S_xhdl23           :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_S_xhdl24           :  std_logic;   
   SIGNAL WVALID_S_xhdl25          :  std_logic;   
   SIGNAL BREADY_S_xhdl26          :  std_logic;   
   SIGNAL ARID_S_xhdl27            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_S_xhdl28          :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_S_xhdl29           :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S_xhdl30          :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S_xhdl31         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S_xhdl32          :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S_xhdl33         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S_xhdl34          :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S_xhdl35         :  std_logic;   
   SIGNAL RREADY_S_xhdl36          :  std_logic;   
   SIGNAL areset_n                 :  std_logic;   
   SIGNAL sresetn                  :  std_logic;   

BEGIN
   --///////////////////////////////////////////////////////////////////////////
   --                               Start - of - Code                         //
   --///////////////////////////////////////////////////////////////////////////

   areset_n  <= '1' WHEN (SYNC_RESET = 1) ELSE ARESETN;
   sresetn   <= ARESETN WHEN (SYNC_RESET = 1) ELSE '1';

   AWREADY_SI <= AWREADY_SI_xhdl1;
   WREADY_SI <= WREADY_SI_xhdl2;
   BID_SI <= BID_SI_xhdl3;
   BRESP_SI <= BRESP_SI_xhdl4;
   BVALID_SI <= BVALID_SI_xhdl5;
   ARREADY_SI <= ARREADY_SI_xhdl6;
   RID_SI <= RID_SI_xhdl7;
   RDATA_SI <= RDATA_SI_xhdl8;
   RRESP_SI <= RRESP_SI_xhdl9;
   RLAST_SI <= RLAST_SI_xhdl10;
   RVALID_SI <= RVALID_SI_xhdl11;
   AWID_S <= AWID_S_xhdl12;
   AWADDR_S <= AWADDR_S_xhdl13;
   AWLEN_S <= AWLEN_S_xhdl14;
   AWSIZE_S <= AWSIZE_S_xhdl15;
   AWBURST_S <= AWBURST_S_xhdl16;
   AWLOCK_S <= AWLOCK_S_xhdl17;
   AWCACHE_S <= AWCACHE_S_xhdl18;
   AWPROT_S <= AWPROT_S_xhdl19;
   AWVALID_S <= AWVALID_S_xhdl20;
   WID_S <= WID_S_xhdl21;
   WDATA_S <= WDATA_S_xhdl22;
   WSTRB_S <= WSTRB_S_xhdl23;
   WLAST_S <= WLAST_S_xhdl24;
   WVALID_S <= WVALID_S_xhdl25;
   BREADY_S <= BREADY_S_xhdl26;
   ARID_S <= ARID_S_xhdl27;
   ARADDR_S <= ARADDR_S_xhdl28;
   ARLEN_S <= ARLEN_S_xhdl29;
   ARSIZE_S <= ARSIZE_S_xhdl30;
   ARBURST_S <= ARBURST_S_xhdl31;
   ARLOCK_S <= ARLOCK_S_xhdl32;
   ARCACHE_S <= ARCACHE_S_xhdl33;
   ARPROT_S <= ARPROT_S_xhdl34;
   ARVALID_S <= ARVALID_S_xhdl35;
   RREADY_S <= RREADY_S_xhdl36;

   -- --------------------------------------------------------------------------
   -- 
   -- --------------------------------------------------------------------------
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (areset_n = '0') THEN
         AWVALID_IS_r <= '0';    
         ARVALID_IS_r <= '0';    
         WVALID_IS_r <= '0';    
         AWVALID_IS_r1 <= '0';    
         WVALID_IS_r1 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (sresetn = '0') THEN
         AWVALID_IS_r <= '0';    
         ARVALID_IS_r <= '0';    
         WVALID_IS_r <= '0';    
         AWVALID_IS_r1 <= '0';    
         WVALID_IS_r1 <= '0';
      ELSE 
         AWVALID_IS_r <= AWVALID_IS;    
         ARVALID_IS_r <= ARVALID_IS;    
         WVALID_IS_r <= WVALID_IS;    
         AWVALID_IS_r1 <= AWVALID_IS_r;    
         WVALID_IS_r1 <= WVALID_IS_r;    
      END IF;
      END IF;
   END PROCESS;


   L1: IF (OUT_REG_BUF = 1) GENERATE

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (areset_n = '0') THEN
         AWVALID_S_xhdl20 <= '0';    
         AWLEN_S_xhdl14 <= (OTHERS => '0');    
         AWSIZE_S_xhdl15 <= (OTHERS => '0');    
         AWBURST_S_xhdl16 <= (OTHERS => '0');    
         AWLOCK_S_xhdl17 <= (OTHERS => '0');    
         AWCACHE_S_xhdl18 <= (OTHERS => '0');    
         AWPROT_S_xhdl19 <= (OTHERS => '0');    
         AWADDR_S_xhdl13 <= (OTHERS => '0');    
         AWID_S_xhdl12 <= (OTHERS => '0');    
         -- Latched Read Address signals 
         
         ARVALID_S_xhdl35 <= '0';    
         ARSIZE_S_xhdl30 <= (OTHERS => '0');    
         ARBURST_S_xhdl31 <= (OTHERS => '0');    
         ARLOCK_S_xhdl32 <= (OTHERS => '0');    
         ARCACHE_S_xhdl33 <= (OTHERS => '0');    
         ARPROT_S_xhdl34 <= (OTHERS => '0');    
         ARLEN_S_xhdl29 <= (OTHERS => '0');    
         ARID_S_xhdl27 <= (OTHERS => '0');    
         ARADDR_S_xhdl28 <= (OTHERS => '0');    
      -- if (ARESETN == 1'b0)
      
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (sresetn = '0') THEN
         AWVALID_S_xhdl20 <= '0';    
         AWLEN_S_xhdl14 <= (OTHERS => '0');    
         AWSIZE_S_xhdl15 <= (OTHERS => '0');    
         AWBURST_S_xhdl16 <= (OTHERS => '0');    
         AWLOCK_S_xhdl17 <= (OTHERS => '0');    
         AWCACHE_S_xhdl18 <= (OTHERS => '0');    
         AWPROT_S_xhdl19 <= (OTHERS => '0');    
         AWADDR_S_xhdl13 <= (OTHERS => '0');    
         AWID_S_xhdl12 <= (OTHERS => '0');    
         -- Latched Read Address signals 
         
         ARVALID_S_xhdl35 <= '0';    
         ARSIZE_S_xhdl30 <= (OTHERS => '0');    
         ARBURST_S_xhdl31 <= (OTHERS => '0');    
         ARLOCK_S_xhdl32 <= (OTHERS => '0');    
         ARCACHE_S_xhdl33 <= (OTHERS => '0');    
         ARPROT_S_xhdl34 <= (OTHERS => '0');    
         ARLEN_S_xhdl29 <= (OTHERS => '0');    
         ARID_S_xhdl27 <= (OTHERS => '0');    
         ARADDR_S_xhdl28 <= (OTHERS => '0');    
      -- if (ARESETN == 1'b0)
      ELSE 
         IF ((AWVALID_S_xhdl20 AND AWREADY_S) = '1') THEN
            AWVALID_S_xhdl20 <= '0';    
            AWLEN_S_xhdl14 <= (OTHERS => '0');    
            AWSIZE_S_xhdl15 <= (OTHERS => '0');    
            AWBURST_S_xhdl16 <= (OTHERS => '0');    
            AWLOCK_S_xhdl17 <= (OTHERS => '0');    
            AWCACHE_S_xhdl18 <= (OTHERS => '0');    
            AWPROT_S_xhdl19 <= (OTHERS => '0');    
            AWADDR_S_xhdl13 <= (OTHERS => '0');    
            AWID_S_xhdl12 <= (OTHERS => '0');    
         ELSE
            IF (((AWVALID_IS AND NOT AWVALID_IS_r) AND NOT AWVALID_IS_r1) = '1')
            THEN
               -- Latched Write Address signals 
               
               AWID_S_xhdl12 <= AWID_IS;    
               AWVALID_S_xhdl20 <= '1';    
               AWLEN_S_xhdl14 <= AWLEN_IS;    
               AWSIZE_S_xhdl15 <= AWSIZE_IS;    
               AWBURST_S_xhdl16 <= AWBURST_IS;    
               AWLOCK_S_xhdl17 <= AWLOCK_IS;    
               AWCACHE_S_xhdl18 <= AWCACHE_IS;    
               AWPROT_S_xhdl19 <= AWPROT_IS;    
               AWADDR_S_xhdl13 <= AWADDR_IS;    
            END IF;
         END IF;
         IF ((ARVALID_S_xhdl35 AND ARREADY_S) = '1') THEN
            -- Latched Read Address signals 
            
            ARVALID_S_xhdl35 <= '0';    
            ARSIZE_S_xhdl30 <= (OTHERS => '0');    
            ARBURST_S_xhdl31 <= (OTHERS => '0');    
            ARLOCK_S_xhdl32 <= (OTHERS => '0');    
            ARCACHE_S_xhdl33 <= (OTHERS => '0');    
            ARPROT_S_xhdl34 <= (OTHERS => '0');    
            ARLEN_S_xhdl29 <= (OTHERS => '0');    
            ARID_S_xhdl27 <= (OTHERS => '0');    
            ARADDR_S_xhdl28 <= (OTHERS => '0');    
         ELSE
            IF ((ARVALID_IS AND NOT ARVALID_IS_r) = '1') THEN
               -- Latched Read Address signals 
               
               ARID_S_xhdl27 <= ARID_IS;    
               ARVALID_S_xhdl35 <= '1';    
               ARSIZE_S_xhdl30 <= ARSIZE_IS;    
               ARBURST_S_xhdl31 <= ARBURST_IS;    
               ARLOCK_S_xhdl32 <= ARLOCK_IS;    
               ARCACHE_S_xhdl33 <= ARCACHE_IS;    
               ARPROT_S_xhdl34 <= ARPROT_IS;    
               ARLEN_S_xhdl29 <= ARLEN_IS;    
               ARADDR_S_xhdl28 <= ARADDR_IS;    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (areset_n = '0') THEN
         WID_S_xhdl21 <= (OTHERS => '0');    
         WDATA_S_xhdl22 <= (OTHERS => '0');    
         WSTRB_S_xhdl23 <= (OTHERS => '0');    
         WLAST_S_xhdl24 <= '0';    
         WVALID_S_xhdl25 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (sresetn = '0') THEN
         WID_S_xhdl21 <= (OTHERS => '0');    
         WDATA_S_xhdl22 <= (OTHERS => '0');    
         WSTRB_S_xhdl23 <= (OTHERS => '0');    
         WLAST_S_xhdl24 <= '0';    
         WVALID_S_xhdl25 <= '0';
      ELSE 
         IF ((WVALID_S_xhdl25 AND WREADY_S) = '1') THEN
            WLAST_S_xhdl24 <= '0';    
            WVALID_S_xhdl25 <= '0';    
         ELSE
            IF (((WVALID_IS AND NOT WVALID_IS_r) AND NOT WVALID_IS_r1) = '1') 
            THEN
               WID_S_xhdl21 <= WID_IS;    
               WDATA_S_xhdl22 <= WDATA_IS;    
               WSTRB_S_xhdl23 <= WSTRB_IS;    
               WLAST_S_xhdl24 <= WLAST_IS;    
               WVALID_S_xhdl25 <= WVALID_IS;    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ARVALID_IS, ARSIZE_IS, WVALID_IS_r1, AWREADY_S, WVALID_IS, 
   ARBURST_IS, WVALID_S_xhdl25, ARADDR_IS, 
   WSTRB_IS, AWPROT_IS, ARCACHE_IS, 
   ARVALID_S_xhdl35, AWVALID_IS_r1, ARVALID_IS_r, AWVALID_S_xhdl20, 
   ARREADY_S, WVALID_IS_r, AWID_IS, AWLOCK_IS, ARID_IS,  
   ARPROT_IS, AWSIZE_IS, AWVALID_IS_r, AWVALID_IS,  
   AWBURST_IS, AWADDR_IS, ARLEN_IS, WLAST_IS, WDATA_IS, WID_IS, AWLEN_IS, 
   WREADY_S, ARLOCK_IS, AWCACHE_IS)
      VARIABLE ARREADY_SI_xhdl6_xhdl37  : std_logic;
   BEGIN
      ARREADY_SI_xhdl6_xhdl37 := ARREADY_S AND ARVALID_S_xhdl35;    
      ARREADY_SI_xhdl6 <= ARREADY_SI_xhdl6_xhdl37;
   END PROCESS;
   WREADY_SI_xhdl2 <= WREADY_S AND WVALID_S_xhdl25 ;
   AWREADY_SI_xhdl1 <= AWREADY_S AND AWVALID_S_xhdl20 ;

   PROCESS (BVALID_S, WREADY_S, BRESP_S, WVALID_S_xhdl25, AWREADY_S, 
   AWVALID_S_xhdl20, BID_S)
      VARIABLE BID_SI_xhdl3_xhdl38  : std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
      - 1 DOWNTO 0);
      VARIABLE BRESP_SI_xhdl4_xhdl39  : std_logic_vector(1 DOWNTO 0);
      VARIABLE BVALID_SI_xhdl5_xhdl40  : std_logic;
   BEGIN
      -- Latched Write Response signals
      
      BID_SI_xhdl3_xhdl38 := BID_S;    
      BRESP_SI_xhdl4_xhdl39 := BRESP_S;    
      BVALID_SI_xhdl5_xhdl40 := BVALID_S;    
      BID_SI_xhdl3 <= BID_SI_xhdl3_xhdl38;
      BRESP_SI_xhdl4 <= BRESP_SI_xhdl4_xhdl39;
      BVALID_SI_xhdl5 <= BVALID_SI_xhdl5_xhdl40;
   END PROCESS;

   PROCESS (RVALID_S, RRESP_S, RLAST_S, RDATA_S, RID_S)
      VARIABLE RID_SI_xhdl7_xhdl41  : std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
      - 1 DOWNTO 0);
      VARIABLE RDATA_SI_xhdl8_xhdl42  : std_logic_vector(AXI_DWIDTH - 1 DOWNTO 
      0);
      VARIABLE RRESP_SI_xhdl9_xhdl43  : std_logic_vector(1 DOWNTO 0);
      VARIABLE RLAST_SI_xhdl10_xhdl44  : std_logic;
      VARIABLE RVALID_SI_xhdl11_xhdl45  : std_logic;
   BEGIN
      -- Latched Read Response signals
      
      RID_SI_xhdl7_xhdl41 := RID_S;    
      RDATA_SI_xhdl8_xhdl42 := RDATA_S;    
      RRESP_SI_xhdl9_xhdl43 := RRESP_S;    
      RLAST_SI_xhdl10_xhdl44 := RLAST_S;    
      RVALID_SI_xhdl11_xhdl45 := RVALID_S;    
      RID_SI_xhdl7 <= RID_SI_xhdl7_xhdl41;
      RDATA_SI_xhdl8 <= RDATA_SI_xhdl8_xhdl42;
      RRESP_SI_xhdl9 <= RRESP_SI_xhdl9_xhdl43;
      RLAST_SI_xhdl10 <= RLAST_SI_xhdl10_xhdl44;
      RVALID_SI_xhdl11 <= RVALID_SI_xhdl11_xhdl45;
   END PROCESS;
   BREADY_S_xhdl26 <= BREADY_IS ;

   PROCESS (BREADY_IS, RREADY_IS)
      VARIABLE RREADY_S_xhdl36_xhdl46  : std_logic;
   BEGIN
      RREADY_S_xhdl36_xhdl46 := RREADY_IS;    
      RREADY_S_xhdl36 <= RREADY_S_xhdl36_xhdl46;
   END PROCESS;

   END GENERATE L1;

   L2: IF (OUT_REG_BUF = 0) GENERATE
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (areset_n = '0') THEN
         AWVALID_S_xhdl20 <= '0';    
         AWLEN_S_xhdl14 <= (OTHERS => '0');    
         AWSIZE_S_xhdl15 <= (OTHERS => '0');    
         AWBURST_S_xhdl16 <= (OTHERS => '0');    
         AWLOCK_S_xhdl17 <= (OTHERS => '0');    
         AWCACHE_S_xhdl18 <= (OTHERS => '0');    
         AWPROT_S_xhdl19 <= (OTHERS => '0');    
         AWADDR_S_xhdl13 <= (OTHERS => '0');    
         AWID_S_xhdl12 <= (OTHERS => '0');    
         -- Latched Read Address signals 
         
         ARVALID_S_xhdl35 <= '0';    
         ARSIZE_S_xhdl30 <= (OTHERS => '0');    
         ARBURST_S_xhdl31 <= (OTHERS => '0');    
         ARLOCK_S_xhdl32 <= (OTHERS => '0');    
         ARCACHE_S_xhdl33 <= (OTHERS => '0');    
         ARPROT_S_xhdl34 <= (OTHERS => '0');    
         ARLEN_S_xhdl29 <= (OTHERS => '0');    
         ARID_S_xhdl27 <= (OTHERS => '0');    
         ARADDR_S_xhdl28 <= (OTHERS => '0');    
      -- if (ARESETN == 1'b0)
      
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (sresetn = '0') THEN
         AWVALID_S_xhdl20 <= '0';    
         AWLEN_S_xhdl14 <= (OTHERS => '0');    
         AWSIZE_S_xhdl15 <= (OTHERS => '0');    
         AWBURST_S_xhdl16 <= (OTHERS => '0');    
         AWLOCK_S_xhdl17 <= (OTHERS => '0');    
         AWCACHE_S_xhdl18 <= (OTHERS => '0');    
         AWPROT_S_xhdl19 <= (OTHERS => '0');    
         AWADDR_S_xhdl13 <= (OTHERS => '0');    
         AWID_S_xhdl12 <= (OTHERS => '0');    
         -- Latched Read Address signals 
         
         ARVALID_S_xhdl35 <= '0';    
         ARSIZE_S_xhdl30 <= (OTHERS => '0');    
         ARBURST_S_xhdl31 <= (OTHERS => '0');    
         ARLOCK_S_xhdl32 <= (OTHERS => '0');    
         ARCACHE_S_xhdl33 <= (OTHERS => '0');    
         ARPROT_S_xhdl34 <= (OTHERS => '0');    
         ARLEN_S_xhdl29 <= (OTHERS => '0');    
         ARID_S_xhdl27 <= (OTHERS => '0');    
         ARADDR_S_xhdl28 <= (OTHERS => '0');    

      ELSE 
         IF ((AWVALID_S_xhdl20 AND AWREADY_S) = '1') THEN
            AWVALID_S_xhdl20 <= '0';    
            AWLEN_S_xhdl14 <= (OTHERS => '0');    
            AWSIZE_S_xhdl15 <= (OTHERS => '0');    
            AWBURST_S_xhdl16 <= (OTHERS => '0');    
            AWLOCK_S_xhdl17 <= (OTHERS => '0');    
            AWCACHE_S_xhdl18 <= (OTHERS => '0');    
            AWPROT_S_xhdl19 <= (OTHERS => '0');    
            AWADDR_S_xhdl13 <= (OTHERS => '0');    
            AWID_S_xhdl12 <= (OTHERS => '0');    
         ELSE
            IF (((AWVALID_IS AND NOT AWVALID_IS_r) AND NOT AWVALID_IS_r1) = '1')
            THEN
               -- Latched Write Address signals 
               
               AWID_S_xhdl12 <= AWID_IS;    
               AWVALID_S_xhdl20 <= '1';    
               AWLEN_S_xhdl14 <= AWLEN_IS;    
               AWSIZE_S_xhdl15 <= AWSIZE_IS;    
               AWBURST_S_xhdl16 <= AWBURST_IS;    
               AWLOCK_S_xhdl17 <= AWLOCK_IS;    
               AWCACHE_S_xhdl18 <= AWCACHE_IS;    
               AWPROT_S_xhdl19 <= AWPROT_IS;    
               AWADDR_S_xhdl13 <= AWADDR_IS;    
            END IF;
         END IF;
         IF ((ARVALID_S_xhdl35 AND ARREADY_S) = '1') THEN
            -- Latched Read Address signals 
            
            ARVALID_S_xhdl35 <= '0';    
            ARSIZE_S_xhdl30 <= (OTHERS => '0');    
            ARBURST_S_xhdl31 <= (OTHERS => '0');    
            ARLOCK_S_xhdl32 <= (OTHERS => '0');    
            ARCACHE_S_xhdl33 <= (OTHERS => '0');    
            ARPROT_S_xhdl34 <= (OTHERS => '0');    
            ARLEN_S_xhdl29 <= (OTHERS => '0');    
            ARID_S_xhdl27 <= (OTHERS => '0');    
            ARADDR_S_xhdl28 <= (OTHERS => '0');    
         ELSE
            IF ((ARVALID_IS AND NOT ARVALID_IS_r) = '1') THEN
               -- Latched Read Address signals 
               
               ARID_S_xhdl27 <= ARID_IS;    
               ARVALID_S_xhdl35 <= '1';    
               ARSIZE_S_xhdl30 <= ARSIZE_IS;    
               ARBURST_S_xhdl31 <= ARBURST_IS;    
               ARLOCK_S_xhdl32 <= ARLOCK_IS;    
               ARCACHE_S_xhdl33 <= ARCACHE_IS;    
               ARPROT_S_xhdl34 <= ARPROT_IS;    
               ARLEN_S_xhdl29 <= ARLEN_IS;    
               ARADDR_S_xhdl28 <= ARADDR_IS;    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (areset_n = '0') THEN
         WID_S_xhdl21 <= (OTHERS => '0');    
         WDATA_S_xhdl22 <= (OTHERS => '0');    
         WSTRB_S_xhdl23 <= (OTHERS => '0');    
         WLAST_S_xhdl24 <= '0';    
         WVALID_S_xhdl25 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (sresetn = '0') THEN
         WID_S_xhdl21 <= (OTHERS => '0');    
         WDATA_S_xhdl22 <= (OTHERS => '0');    
         WSTRB_S_xhdl23 <= (OTHERS => '0');    
         WLAST_S_xhdl24 <= '0';    
         WVALID_S_xhdl25 <= '0';
      ELSE 
         IF ((WVALID_S_xhdl25 AND WREADY_S) = '1') THEN
            WLAST_S_xhdl24 <= '0';    
            WVALID_S_xhdl25 <= '0';    
         ELSE
            IF (((WVALID_IS AND NOT WVALID_IS_r) AND NOT WVALID_IS_r1) = '1') 
            THEN
               WID_S_xhdl21 <= WID_IS;    
               WDATA_S_xhdl22 <= WDATA_IS;    
               WSTRB_S_xhdl23 <= WSTRB_IS;    
               WLAST_S_xhdl24 <= WLAST_IS;    
               WVALID_S_xhdl25 <= WVALID_IS;    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ARVALID_IS, AWLOCK_IS, AWID_IS, ARSIZE_IS, ARID_IS, WVALID_IS_r1, 
   WVALID_IS, AWREADY_S, ARBURST_IS, ARPROT_IS, WVALID_S_xhdl25, AWSIZE_IS, 
   ARADDR_IS, AWVALID_IS_r, WSTRB_IS, AWVALID_IS, AWPROT_IS, 
   ARCACHE_IS, AWVALID_IS_r1, AWBURST_IS, ARVALID_S_xhdl35, AWADDR_IS, ARLEN_IS,
   ARVALID_IS_r, AWVALID_S_xhdl20, WLAST_IS, WDATA_IS, WID_IS, AWLEN_IS, 
   WREADY_S, ARLOCK_IS, ARREADY_S, WVALID_IS_r, AWCACHE_IS)
      VARIABLE ARREADY_SI_xhdl6_xhdl47  : std_logic;
   BEGIN
      ARREADY_SI_xhdl6_xhdl47 := ARVALID_S_xhdl35 AND ARREADY_S;    
      ARREADY_SI_xhdl6 <= ARREADY_SI_xhdl6_xhdl47;
   END PROCESS;
   WREADY_SI_xhdl2 <= WREADY_S AND WVALID_S_xhdl25 ;
   AWREADY_SI_xhdl1 <= AWREADY_S AND AWVALID_S_xhdl20 ;

   PROCESS (RVALID_S, BVALID_S, RRESP_S, BRESP_S, AWREADY_S, RLAST_S, 
   AWVALID_S_xhdl20, RID_S, BID_S, WREADY_S, WVALID_S_xhdl25, RDATA_S)
      VARIABLE BID_SI_xhdl3_xhdl48  : std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
      - 1 DOWNTO 0);
      VARIABLE BRESP_SI_xhdl4_xhdl49  : std_logic_vector(1 DOWNTO 0);
      VARIABLE BVALID_SI_xhdl5_xhdl50  : std_logic;
      VARIABLE RID_SI_xhdl7_xhdl51  : std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
      - 1 DOWNTO 0);
      VARIABLE RDATA_SI_xhdl8_xhdl52  : std_logic_vector(AXI_DWIDTH - 1 DOWNTO 
      0);
      VARIABLE RRESP_SI_xhdl9_xhdl53  : std_logic_vector(1 DOWNTO 0);
      VARIABLE RLAST_SI_xhdl10_xhdl54  : std_logic;
      VARIABLE RVALID_SI_xhdl11_xhdl55  : std_logic;
   BEGIN
      -- Latched Write Response signals
      
      BID_SI_xhdl3_xhdl48 := BID_S;    
      BRESP_SI_xhdl4_xhdl49 := BRESP_S;    
      BVALID_SI_xhdl5_xhdl50 := BVALID_S;    
      -- Latched Read Response signals
      
      RID_SI_xhdl7_xhdl51 := RID_S;    
      RDATA_SI_xhdl8_xhdl52 := RDATA_S;    
      RRESP_SI_xhdl9_xhdl53 := RRESP_S;    
      RLAST_SI_xhdl10_xhdl54 := RLAST_S;    
      RVALID_SI_xhdl11_xhdl55 := RVALID_S;    
      BID_SI_xhdl3 <= BID_SI_xhdl3_xhdl48;
      BRESP_SI_xhdl4 <= BRESP_SI_xhdl4_xhdl49;
      BVALID_SI_xhdl5 <= BVALID_SI_xhdl5_xhdl50;
      RID_SI_xhdl7 <= RID_SI_xhdl7_xhdl51;
      RDATA_SI_xhdl8 <= RDATA_SI_xhdl8_xhdl52;
      RRESP_SI_xhdl9 <= RRESP_SI_xhdl9_xhdl53;
      RLAST_SI_xhdl10 <= RLAST_SI_xhdl10_xhdl54;
      RVALID_SI_xhdl11 <= RVALID_SI_xhdl11_xhdl55;
   END PROCESS;
   -- always @ (*)
   BREADY_S_xhdl26 <= BREADY_IS ;

   PROCESS (BREADY_IS, RREADY_IS)
      VARIABLE RREADY_S_xhdl36_xhdl56  : std_logic;
   BEGIN
      RREADY_S_xhdl36_xhdl56 := RREADY_IS;    
      RREADY_S_xhdl36 <= RREADY_S_xhdl36_xhdl56;
   END PROCESS;

   END GENERATE L2;
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (areset_n = '0') THEN
         ARVALID_S_r <= '0';    
         AWVALID_S_r <= '0';    
         WVALID_S_r <= '0';    
         ARVALID_S_r1 <= '0';    
         AWVALID_S_r1 <= '0';    
         WVALID_S_r1 <= '0';    
         AWREADY_S_r <= '0';    
         ARREADY_S_r <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (sresetn = '0') THEN
         ARVALID_S_r <= '0';    
         AWVALID_S_r <= '0';    
         WVALID_S_r <= '0';    
         ARVALID_S_r1 <= '0';    
         AWVALID_S_r1 <= '0';    
         WVALID_S_r1 <= '0';    
         AWREADY_S_r <= '0';    
         ARREADY_S_r <= '0';    
      ELSE 
         AWVALID_S_r <= AWVALID_S_xhdl20;    
         ARVALID_S_r <= ARVALID_S_xhdl35;    
         WVALID_S_r <= WVALID_S_xhdl25;    
         AWVALID_S_r1 <= AWVALID_S_r;    
         ARVALID_S_r1 <= ARVALID_S_r;    
         WVALID_S_r1 <= WVALID_S_r;    
         AWREADY_S_r <= AWREADY_S;    
         ARREADY_S_r <= ARREADY_S;    
      END IF;
      END IF;
   END PROCESS;

END translated;
