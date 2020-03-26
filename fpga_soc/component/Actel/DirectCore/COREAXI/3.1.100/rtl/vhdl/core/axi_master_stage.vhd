-- ****************************************************************************/
-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description: master_stage - Module defines interface with Master 
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

   USE work.XHDL_std_logic.all;
   USE work.XHDL_misc.all; 
   USE work.axi_pkg.all; 


ENTITY axi_master_stage IS
   GENERIC (
      -- --------------------------------------------------------------------------
      -- PARAMETER Declaration
      -- --------------------------------------------------------------------------
      SYNC_RESET                     :  integer := 0;    
      AXI_AWIDTH                     :  integer := 32;    
      AXI_DWIDTH                     :  integer := 64;    --  64/128/256
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
      UID_WIDTH                      :  std_logic_vector(1 DOWNTO 0) := "00";   
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

      AWID_M                  : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);   
      AWADDR_M                : IN std_logic_vector(31 DOWNTO 0);   
      AWLEN_M                 : IN std_logic_vector(3 DOWNTO 0);   
      AWSIZE_M                : IN std_logic_vector(2 DOWNTO 0);   
      AWBURST_M               : IN std_logic_vector(1 DOWNTO 0);   
      AWLOCK_M                : IN std_logic_vector(1 DOWNTO 0);   
      AWCACHE_M               : IN std_logic_vector(3 DOWNTO 0);   
      AWPROT_M                : IN std_logic_vector(2 DOWNTO 0);   
      AWVALID_M               : IN std_logic;   
      AWREADY_M               : OUT std_logic;   
      -- AXI MASTER 0 write data channel signals

      WID_M                   : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);   
      WDATA_M                 : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      WSTRB_M                 : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_M                 : IN std_logic;   
      WVALID_M                : IN std_logic;   
      WREADY_M                : OUT std_logic;   
      -- AXI MASTER 0 write response channel signals

      BID_M                   : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0);   
      BRESP_M                 : OUT std_logic_vector(1 DOWNTO 0);   
      BVALID_M                : OUT std_logic;   
      BREADY_M                : IN std_logic;   
      -- AXI MASTER 0 read address channel signals

      ARID_M                  : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);   
      ARADDR_M                : IN std_logic_vector(31 DOWNTO 0);   
      ARLEN_M                 : IN std_logic_vector(3 DOWNTO 0);   
      ARSIZE_M                : IN std_logic_vector(2 DOWNTO 0);   
      ARBURST_M               : IN std_logic_vector(1 DOWNTO 0);   
      ARLOCK_M                : IN std_logic_vector(1 DOWNTO 0);   
      ARCACHE_M               : IN std_logic_vector(3 DOWNTO 0);   
      ARPROT_M                : IN std_logic_vector(2 DOWNTO 0);   
      ARVALID_M               : IN std_logic;   
      ARREADY_M               : OUT std_logic;   
      -- AXI MASTER 0 read response channel signals

      RID_M                   : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0);   
      RDATA_M                 : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      RRESP_M                 : OUT std_logic_vector(1 DOWNTO 0);   
      RLAST_M                 : OUT std_logic;   
      RVALID_M                : OUT std_logic;   
      RREADY_M                : IN std_logic;   
      -- SLAVE 0
-- AXI SLAVE 0 write address channel signals

      AWID_MI                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_MI               : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_MI                : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_MI               : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_MI              : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_MI               : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_MI              : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_MI               : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_MI              : OUT std_logic;   
      AWREADY_IM              : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_MI                  : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_MI                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_MI                : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_MI                : OUT std_logic;   
      WVALID_MI               : OUT std_logic;   
      WREADY_IM               : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_IM                  : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_IM                : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_IM               : IN std_logic;   
      BREADY_MI               : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_MI                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_MI               : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_MI                : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_MI               : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_MI              : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_MI               : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_MI              : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_MI               : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_MI              : OUT std_logic;   
      ARREADY_IM              : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_IM                  : IN std_logic_vector((BASE_ID_WIDTH + ID_WIDTH) 
      - 1 DOWNTO 0);   
      RDATA_IM                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_IM                : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_IM                : IN std_logic;   
      RVALID_IM               : IN std_logic;   
      RREADY_MI               : OUT std_logic;   
      master_rd_end           : OUT std_logic;   
      master_wr_end           : OUT std_logic);   
END axi_master_stage;

ARCHITECTURE translated OF axi_master_stage IS


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
   CONSTANT  COMB_REG              :  integer := to_integer(CONV_STD_LOGIC(SC_0)
   & CONV_STD_LOGIC(SC_1) & CONV_STD_LOGIC(SC_2) & CONV_STD_LOGIC(SC_3) & 
   CONV_STD_LOGIC(SC_4) & CONV_STD_LOGIC(SC_5) & CONV_STD_LOGIC(SC_6) & 
   CONV_STD_LOGIC(SC_7) & CONV_STD_LOGIC(SC_8) & CONV_STD_LOGIC(SC_9) & 
   CONV_STD_LOGIC(SC_10) & CONV_STD_LOGIC(SC_11) & CONV_STD_LOGIC(SC_12) & 
   CONV_STD_LOGIC(SC_13) & CONV_STD_LOGIC(SC_14) & CONV_STD_LOGIC(SC_15));    
   -- --------------------------------------------------------------------------
   -- Internal signals
   -- --------------------------------------------------------------------------
   --   wire                      RREADY_MI;
   SIGNAL AWID_M_FF1               :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_M_FF1             :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_M_FF1              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_M_FF1             :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_M_FF1            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_M_FF1             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_M_FF1            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_M_FF1             :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_M_FF1            :  std_logic;   
   SIGNAL ARID_M_FF1               :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_M_FF1             :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_M_FF1              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_M_FF1             :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_M_FF1            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_M_FF1             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_M_FF1            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_M_FF1             :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_M_FF1            :  std_logic;   
   SIGNAL RREADY_M_FF1             :  std_logic;   
   SIGNAL BREADY_M_FF1             :  std_logic;   
   SIGNAL WID_M_FF1                :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_M_FF1              :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WVALID_M_FF1             :  std_logic;   
   SIGNAL WLAST_M_FF1              :  std_logic;   
   SIGNAL WSTRB_M_FF1              :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL AWID_M_INPFF1            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_M_INPFF1          :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_M_INPFF1           :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_M_INPFF1          :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_M_INPFF1         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_M_INPFF1          :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_M_INPFF1         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_M_INPFF1          :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_M_INPFF1         :  std_logic;   
   SIGNAL ARID_M_INPFF1            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_M_INPFF1          :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_M_INPFF1           :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_M_INPFF1          :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_M_INPFF1         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_M_INPFF1          :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_M_INPFF1         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_M_INPFF1          :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_M_INPFF1         :  std_logic;   
   SIGNAL RREADY_M_INPFF1          :  std_logic;   
   SIGNAL BREADY_M_INPFF1          :  std_logic;   
   SIGNAL WID_M_INPFF1             :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_M_INPFF1           :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WVALID_M_INPFF1          :  std_logic;   
   SIGNAL WLAST_M_INPFF1           :  std_logic;   
   SIGNAL WSTRB_M_INPFF1           :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL AWID_M_pulse             :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_M_pulse           :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_M_pulse            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_M_pulse           :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_M_pulse          :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_M_pulse           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_M_pulse          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_M_pulse           :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_M_pulse          :  std_logic;   
   SIGNAL ARID_M_pulse             :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_M_pulse           :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_M_pulse            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_M_pulse           :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_M_pulse          :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_M_pulse           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_M_pulse          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_M_pulse           :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_M_pulse          :  std_logic;   
   SIGNAL RREADY_M_pulse           :  std_logic;   
   SIGNAL BREADY_M_pulse           :  std_logic;   
   SIGNAL WID_M_pulse              :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_M_pulse            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WVALID_M_pulse           :  std_logic;   
   SIGNAL WLAST_M_pulse            :  std_logic;   
   SIGNAL WSTRB_M_pulse            :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
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
   SIGNAL RVALID_M_pulse_r         :  std_logic;   
   SIGNAL BID_M_FF1                :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_M_FF1              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_M_FF1             :  std_logic;   
   SIGNAL BID_M_INPFF1             :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_M_INPFF1           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_M_INPFF1          :  std_logic;   
   SIGNAL BID_M_pulse              :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_M_pulse            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_M_pulse           :  std_logic;   
   -- AXI MASTER 0 write response channel signals
   SIGNAL BID_M_r                  :  std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
   SIGNAL BRESP_M_r                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_M_r               :  std_logic;   
   -- AXI MASTER 0 read response channel signals
   SIGNAL AWID_int                 :  std_logic_vector((BASE_ID_WIDTH + 
   ID_WIDTH) - 1 DOWNTO 0);   
   SIGNAL WID_int                  :  std_logic_vector((BASE_ID_WIDTH + 
   ID_WIDTH) - 1 DOWNTO 0);   
   SIGNAL ARID_int                 :  std_logic_vector((BASE_ID_WIDTH + 
   ID_WIDTH) - 1 DOWNTO 0);   
   SIGNAL k                        :  integer;   
   SIGNAL p                        :  integer;   
   SIGNAL SLAVE_SELECT_WRITE_M     :  std_logic_vector(16 DOWNTO 0);   
   SIGNAL SLAVE_SELECT_READ_M      :  std_logic_vector(16 DOWNTO 0);   
   SIGNAL mst_wr_end               :  std_logic;   
   SIGNAL mst_rd_end               :  std_logic;   
   SIGNAL WREADY_IM_r              :  std_logic;   
   SIGNAL WLAST_M_r                :  std_logic;   
   SIGNAL AWVALID_M_r              :  std_logic;   
   SIGNAL ARVALID_M_r              :  std_logic;   
   SIGNAL next_valid_sample        :  std_logic;   
   SIGNAL next_valid_sample_r      :  std_logic;   
   SIGNAL next_rvalid_sample       :  std_logic;   
   SIGNAL next_rvalid_sample_r     :  std_logic;   
   SIGNAL RLAST_IM_r               :  std_logic;   
   SIGNAL gated_WREADY_M           :  std_logic;   
   SIGNAL gated_AWVALID_M_flag     :  std_logic;   
   SIGNAL WREADY_M_int             :  std_logic;   
   SIGNAL RVALID_IM_r              :  std_logic;   
   SIGNAL BVALID_IM_r              :  std_logic;   
   SIGNAL RREADY_M_r               :  std_logic;   
   SIGNAL RVALID_M_r               :  std_logic;   
   SIGNAL gatedWA_Rdy              :  std_logic;   
   SIGNAL rd_rdcntr                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL rd_wdcntr                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL rd_wen_flag              :  std_logic;   
   SIGNAL rd_ren_flag              :  std_logic;   
   SIGNAL ARREADY_M_int            :  std_logic;   
   SIGNAL ARREADY_M_int1           :  std_logic;   
   SIGNAL rd_acceptance_limit      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL WVALID_MI_r1             :  std_logic;   
   SIGNAL WVALID_MI_r2             :  std_logic;   
   SIGNAL prev_ARADDR              :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL prev_ARID                :  std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
   SIGNAL rdtrans_inprog           :  std_logic;   
   SIGNAL stall_trans              :  std_logic;   
   SIGNAL stall_trans_rd           :  std_logic;   
   SIGNAL RID_M_int                :  std_logic_vector((BASE_ID_WIDTH + 
   ID_WIDTH) - 1 DOWNTO 0);   
   SIGNAL RDATA_M_int              :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_M_int              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_M_int              :  std_logic;   
   SIGNAL RVALID_M_int             :  std_logic;   
   SIGNAL AWREADY_M_r              :  std_logic;   
   SIGNAL ARREADY_M_r              :  std_logic;   
   SIGNAL WREADY_M_r               :  std_logic;   
   --               ARREADY_M <= (((rd_wdcntr - rd_rdcntr) == RD_ACCEPTANCE) | (stall_trans == 1'b1)) ? 1'b0: ARREADY_M_int;  
   SIGNAL temp_xhdl44              :  std_logic;   
   SIGNAL temp_xhdl46              :  std_logic;   
   SIGNAL add_rdtran               :  std_logic;

   -- --------------------------------------------------------------------------
   -- ***************************************************************************   
   SIGNAL temp_xhdl70              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl71              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl72              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl73              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWREADY_M_xhdl1          :  std_logic;   
   SIGNAL WREADY_M_xhdl2           :  std_logic;   
   SIGNAL BID_M_xhdl3              :  std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
   SIGNAL BRESP_M_xhdl4            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_M_xhdl5           :  std_logic;   
   SIGNAL ARREADY_M_xhdl6          :  std_logic;   
   SIGNAL RID_M_xhdl7              :  std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
   SIGNAL RDATA_M_xhdl8            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_M_xhdl9            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_M_xhdl10           :  std_logic;   
   SIGNAL RVALID_M_xhdl11          :  std_logic;   
   SIGNAL AWID_MI_xhdl12           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_MI_xhdl13         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_MI_xhdl14          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_MI_xhdl15         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_MI_xhdl16        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_MI_xhdl17         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_MI_xhdl18        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_MI_xhdl19         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_MI_xhdl20        :  std_logic;   
   SIGNAL WID_MI_xhdl21            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_MI_xhdl22          :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_MI_xhdl23          :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_MI_xhdl24          :  std_logic;   
   SIGNAL WVALID_MI_xhdl25         :  std_logic;   
   SIGNAL BREADY_MI_xhdl26         :  std_logic;   
   SIGNAL ARID_MI_xhdl27           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_MI_xhdl28         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_MI_xhdl29          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_MI_xhdl30         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_MI_xhdl31        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_MI_xhdl32         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_MI_xhdl33        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_MI_xhdl34         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_MI_xhdl35        :  std_logic;   
   SIGNAL RREADY_MI_xhdl36         :  std_logic;   
   SIGNAL master_wr_end_xhdl37     :  std_logic;   
   SIGNAL master_rd_end_xhdl38     :  std_logic;   
   SIGNAL rdtrans_inprog_r         :  std_logic;   
   SIGNAL AWID_msb_lat             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARID_msb_lat             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL areset_n                 :  std_logic;   
   SIGNAL sresetn                  :  std_logic;   

BEGIN
   --///////////////////////////////////////////////////////////////////////////
   --                               Start - of - Code                         //
   --///////////////////////////////////////////////////////////////////////////

   areset_n  <= '1' WHEN (SYNC_RESET = 1) ELSE ARESETN;
   sresetn   <= ARESETN WHEN (SYNC_RESET = 1) ELSE '1';

   AWREADY_M <= AWREADY_M_xhdl1;
   WREADY_M <= WREADY_M_xhdl2;
   BID_M <= BID_M_xhdl3;
   BRESP_M <= BRESP_M_xhdl4;
   BVALID_M <= BVALID_M_xhdl5;
   ARREADY_M <= ARREADY_M_xhdl6;
   RID_M <= RID_M_xhdl7;
   RDATA_M <= RDATA_M_xhdl8;
   RRESP_M <= RRESP_M_xhdl9;
   RLAST_M <= RLAST_M_xhdl10;
   RVALID_M <= RVALID_M_xhdl11;
   AWID_MI <= AWID_MI_xhdl12;
   AWADDR_MI <= AWADDR_MI_xhdl13;
   AWLEN_MI <= AWLEN_MI_xhdl14;
   AWSIZE_MI <= AWSIZE_MI_xhdl15;
   AWBURST_MI <= AWBURST_MI_xhdl16;
   AWLOCK_MI <= AWLOCK_MI_xhdl17;
   AWCACHE_MI <= AWCACHE_MI_xhdl18;
   AWPROT_MI <= AWPROT_MI_xhdl19;
   AWVALID_MI <= AWVALID_MI_xhdl20;
   WID_MI <= WID_MI_xhdl21;
   WDATA_MI <= WDATA_MI_xhdl22;
   WSTRB_MI <= WSTRB_MI_xhdl23;
   WLAST_MI <= WLAST_MI_xhdl24;
   WVALID_MI <= WVALID_MI_xhdl25;
   BREADY_MI <= BREADY_MI_xhdl26;
   ARID_MI <= ARID_MI_xhdl27;
   ARADDR_MI <= ARADDR_MI_xhdl28;
   ARLEN_MI <= ARLEN_MI_xhdl29;
   ARSIZE_MI <= ARSIZE_MI_xhdl30;
   ARBURST_MI <= ARBURST_MI_xhdl31;
   ARLOCK_MI <= ARLOCK_MI_xhdl32;
   ARCACHE_MI <= ARCACHE_MI_xhdl33;
   ARPROT_MI <= ARPROT_MI_xhdl34;
   ARVALID_MI <= ARVALID_MI_xhdl35;
   RREADY_MI <= RREADY_MI_xhdl36;
   master_wr_end <= master_wr_end_xhdl37;
   master_rd_end <= master_rd_end_xhdl38;

   -- ##########################################################################
   ---------------------------------------------------------------
   -- mst_wr_end: Generate signal to indicate to the write address
   -- arbiter to terminate the grant for the current master
   -- The grant to the master is terminated when the write response
   -- is received.
   ---------------------------------------------------------------
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         mst_wr_end <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         mst_wr_end <= '0';    ELSE 
         mst_wr_end <= BVALID_M_xhdl5 AND BREADY_M;    
      END IF;
      END IF;
   END PROCESS;

   ---------------------------------------------------------------
   -- mst_rd_end: Generate signal to indicate to the read address
   -- arbiter to terminate the grant for the current master
   -- The grant to the master is terminated when the last read
   -- data is received.
   ---------------------------------------------------------------
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         mst_rd_end <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         mst_rd_end <= '0';    ELSE 
         mst_rd_end <= (RLAST_M_xhdl10 AND RVALID_M_xhdl11) AND RREADY_M;    
      END IF;
      END IF;
   END PROCESS;

   -- ##########################################################################
   -- --------------------------------------------------------------------------
   -- SLAVE_SELECT_READ_M: Select Slave slot for Read
   -- This is used to generate the read request to the arbiter in the slave side
   -- --------------------------------------------------------------------------
   
   PROCESS (RVALID_M_xhdl11, RREADY_M, BREADY_M, BVALID_M_xhdl5, 
   RLAST_M_xhdl10,  
   ARADDR_MI_xhdl28,
   ARVALID_MI_xhdl35)
      VARIABLE SLAVE_SELECT_READ_M_xhdl39  : std_logic_vector(16 DOWNTO 0);
      VARIABLE temp_xhdl40  : std_logic_vector(4 DOWNTO 0);
   BEGIN
      temp_xhdl40 := ARVALID_MI_xhdl35 & ARADDR_MI_xhdl28(AXI_AWIDTH - 1 DOWNTO 
      AXI_AWIDTH - 4);
      CASE temp_xhdl40 IS
         WHEN "10000" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_READ_M_xhdl39 := SLAVE_0;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_0;    
                     END IF;
                  END IF;
         -- case: 5'h10
         
         WHEN "10001" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_READ_M_xhdl39 := SLAVE_1;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_1;    
                     END IF;
                  END IF;
         -- case: 5'h11
         
         WHEN "10010" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_READ_M_xhdl39 := SLAVE_2;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_2;    
                     END IF;
                  END IF;
         WHEN "10011" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_READ_M_xhdl39 := SLAVE_3;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_3;    
                     END IF;
                  END IF;
         WHEN "10100" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_READ_M_xhdl39 := SLAVE_4;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_4;    
                     END IF;
                  END IF;
         WHEN "10101" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_READ_M_xhdl39 := SLAVE_5;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_5;    
                     END IF;
                  END IF;
         WHEN "10110" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_READ_M_xhdl39 := SLAVE_6;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_6;    
                     END IF;
                  END IF;
         WHEN "10111" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_READ_M_xhdl39 := SLAVE_7;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_7;    
                     END IF;
                  END IF;
         WHEN "11000" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_READ_M_xhdl39 := SLAVE_8;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_8;    
                     END IF;
                  END IF;
         WHEN "11001" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_READ_M_xhdl39 := SLAVE_9;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_9;    
                     END IF;
                  END IF;
         WHEN "11010" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_READ_M_xhdl39 := SLAVE_A;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_A;    
                     END IF;
                  END IF;
         WHEN "11011" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_READ_M_xhdl39 := SLAVE_B;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_B;    
                     END IF;
                  END IF;
         WHEN "11100" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_READ_M_xhdl39 := SLAVE_C;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_C;    
                     END IF;
                  END IF;
         WHEN "11101" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_READ_M_xhdl39 := SLAVE_D;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_D;    
                     END IF;
                  END IF;
         WHEN "11110" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_READ_M_xhdl39 := SLAVE_E;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_E;    
                     END IF;
                  END IF;
         WHEN "11111" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_READ_M_xhdl39 := SLAVE_F;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_READ_M_xhdl39 := SLAVE_F;    
                     END IF;
                  END IF;
         WHEN OTHERS  =>
                  SLAVE_SELECT_READ_M_xhdl39 := (OTHERS => '0');        
         
      END CASE;
      -- case ({ARVALID_MI,ARADDR_MI[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
      
      
      SLAVE_SELECT_READ_M <= SLAVE_SELECT_READ_M_xhdl39;
   END PROCESS;

   -- always @ (*)
   -- --------------------------------------------------------------------------
   -- Select Slave slot for Write
   -- This is used to generate the write request to the arbiter in the slave side
   -- --------------------------------------------------------------------------
   
   PROCESS (AWVALID_MI_xhdl20, 
   AWADDR_MI_xhdl13)
      VARIABLE SLAVE_SELECT_WRITE_M_xhdl41  : std_logic_vector(16 DOWNTO 0);
      VARIABLE temp_xhdl42  : std_logic_vector(4 DOWNTO 0);
   BEGIN
      temp_xhdl42 := AWVALID_MI_xhdl20 & AWADDR_MI_xhdl13(AXI_AWIDTH - 1 DOWNTO 
      AXI_AWIDTH - 4);
      CASE temp_xhdl42 IS
         WHEN "10000" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_0;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_0;    
                     END IF;
                  END IF;
         -- case: 5'h10
         
         WHEN "10001" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_1;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_1;    
                     END IF;
                  END IF;
         -- case: 5'h11
         
         WHEN "10010" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_2;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_2;    
                     END IF;
                  END IF;
         WHEN "10011" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_3;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_3;    
                     END IF;
                  END IF;
         WHEN "10100" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_4;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_4;    
                     END IF;
                  END IF;
         WHEN "10101" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_5;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_5;    
                     END IF;
                  END IF;
         WHEN "10110" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_6;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_6;    
                     END IF;
                  END IF;
         WHEN "10111" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_7;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_7;    
                     END IF;
                  END IF;
         WHEN "11000" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_8;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_8;    
                     END IF;
                  END IF;
         WHEN "11001" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_9;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_9;    
                     END IF;
                  END IF;
         WHEN "11010" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_A;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_A;    
                     END IF;
                  END IF;
         WHEN "11011" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_B;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_B;    
                     END IF;
                  END IF;
         WHEN "11100" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_C;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_C;    
                     END IF;
                  END IF;
         WHEN "11101" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_D;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_D;    
                     END IF;
                  END IF;
         WHEN "11110" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_E;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_E;    
                     END IF;
                  END IF;
         WHEN "11111" =>
                  IF ((MEMSPACE > 0) AND (COMB_REG = 0)) THEN
                     SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_F;    
                  ELSE
                     IF (((MEMSPACE > 0) AND (COMB_REG = 1)) OR (MEMSPACE = 0)) 
                     THEN
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_N;    
                     ELSE
                        SLAVE_SELECT_WRITE_M_xhdl41 := SLAVE_F;    
                     END IF;
                  END IF;
         WHEN OTHERS  =>
                  SLAVE_SELECT_WRITE_M_xhdl41 := (OTHERS => '0');        
         
      END CASE;
      -- case ({AWVALID_MI,AWADDR_MI[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
      
      
      SLAVE_SELECT_WRITE_M <= SLAVE_SELECT_WRITE_M_xhdl41;
   END PROCESS;

   -- ##########################################################################
   -----------------------------------------------------------------------------
   -- Write address signals to the Interconnect
   -----------------------------------------------------------------------------

   L1: IF(INP_REG_BUF = 1) GENERATE

   -- --------------------------------------------
   -- Write address
   -- --------------------------------------------
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         AWVALID_M_INPFF1 <= '0';    
         AWLEN_M_INPFF1 <= (OTHERS => '0');     
         AWSIZE_M_INPFF1 <= (OTHERS => '0');    
         AWBURST_M_INPFF1 <= (OTHERS => '0');    
         AWLOCK_M_INPFF1 <= (OTHERS=>'0');
         AWCACHE_M_INPFF1 <= (OTHERS=>'0');
         AWPROT_M_INPFF1 <= (OTHERS=>'0');
         AWADDR_M_INPFF1 <= (OTHERS => '0');    
         AWID_M_INPFF1 <= (OTHERS => '0');    
         ARVALID_M_INPFF1 <= '0';   
         ARLEN_M_INPFF1 <= (OTHERS=>'0');  
         ARSIZE_M_INPFF1 <= (OTHERS=>'0');
         ARBURST_M_INPFF1 <= (OTHERS=>'0');
         ARLOCK_M_INPFF1 <= (OTHERS=>'0');
         ARCACHE_M_INPFF1 <= (OTHERS=>'0');
         ARPROT_M_INPFF1 <= (OTHERS=>'0');
         ARADDR_M_INPFF1 <= (OTHERS => '0');    
         ARID_M_INPFF1 <= (OTHERS => '0');    
         prev_ARADDR <= (OTHERS => '0');    
         prev_ARID <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         AWVALID_M_INPFF1 <= '0';    
         AWLEN_M_INPFF1 <= (OTHERS => '0');     
         AWSIZE_M_INPFF1 <= (OTHERS => '0');    
         AWBURST_M_INPFF1 <= (OTHERS => '0');    
         AWLOCK_M_INPFF1 <= (OTHERS=>'0');
         AWCACHE_M_INPFF1 <= (OTHERS=>'0');
         AWPROT_M_INPFF1 <= (OTHERS=>'0');
         AWADDR_M_INPFF1 <= (OTHERS => '0');    
         AWID_M_INPFF1 <= (OTHERS => '0');    
         ARVALID_M_INPFF1 <= '0';   
         ARLEN_M_INPFF1 <= (OTHERS=>'0');  
         ARSIZE_M_INPFF1 <= (OTHERS=>'0');
         ARBURST_M_INPFF1 <= (OTHERS=>'0');
         ARLOCK_M_INPFF1 <= (OTHERS=>'0');
         ARCACHE_M_INPFF1 <= (OTHERS=>'0');
         ARPROT_M_INPFF1 <= (OTHERS=>'0');
         ARADDR_M_INPFF1 <= (OTHERS => '0');    
         ARID_M_INPFF1 <= (OTHERS => '0');    
         prev_ARADDR <= (OTHERS => '0');    
         prev_ARID <= (OTHERS => '0');    ELSE 
         IF ((AWREADY_M_xhdl1 AND AWVALID_M) = '1') THEN
            AWVALID_M_INPFF1 <= '0';    
            AWLEN_M_INPFF1 <= (OTHERS=>'0');
            AWSIZE_M_INPFF1 <= (OTHERS=>'0');
            AWBURST_M_INPFF1 <= (OTHERS=>'0');
            AWCACHE_M_INPFF1 <= (OTHERS=>'0');
            AWPROT_M_INPFF1 <= (OTHERS=>'0');            
            AWID_M_INPFF1 <= (OTHERS => '0');    
         ELSIF (AWVALID_M = '1') THEN
            AWVALID_M_INPFF1 <= '1';    
            AWID_M_INPFF1 <= AWID_int;    
            AWLEN_M_INPFF1 <= AWLEN_M;    
            AWSIZE_M_INPFF1 <= AWSIZE_M;    
            AWBURST_M_INPFF1 <= AWBURST_M;    
            AWLOCK_M_INPFF1 <= AWLOCK_M;    
            AWCACHE_M_INPFF1 <= AWCACHE_M;    
            AWPROT_M_INPFF1 <= AWPROT_M;    
            AWADDR_M_INPFF1 <= AWADDR_M;    
         END IF;
         IF ((ARREADY_M_xhdl6 AND ARVALID_M) = '1') THEN
            ARVALID_M_INPFF1 <= '0';    
            ARLEN_M_INPFF1 <= (OTHERS => '0');
            ARSIZE_M_INPFF1 <= (OTHERS => '0');
            ARBURST_M_INPFF1 <= (OTHERS => '0');
            ARCACHE_M_INPFF1 <= (OTHERS => '0');
            ARPROT_M_INPFF1 <= (OTHERS => '0');
            ARID_M_INPFF1 <= (OTHERS => '0');    
            prev_ARADDR <= ARADDR_M;    
            prev_ARID <= ARID_M;    
         ELSIF (ARVALID_M = '1') THEN
            -- Number of outstanding reads allowed is equal to RD_ACCEPTANCE.
            -- This is used to block any further transaction if it the number of pending reads are greater than
            ARVALID_M_INPFF1 <= (('1' AND CONV_STD_LOGIC(NOT ((rd_wdcntr 
            - rd_rdcntr) = rd_acceptance_limit))) AND NOT stall_trans) AND NOT 
            stall_trans_rd;    
            ARID_M_INPFF1 <= ARID_int;    
            ARLEN_M_INPFF1 <= ARLEN_M;    
            ARSIZE_M_INPFF1 <= ARSIZE_M;    
            ARBURST_M_INPFF1 <= ARBURST_M;    
            ARLOCK_M_INPFF1 <= ARLOCK_M;    
            ARCACHE_M_INPFF1 <= ARCACHE_M;    
            ARPROT_M_INPFF1 <= ARPROT_M;    
            ARADDR_M_INPFF1 <= ARADDR_M;    
         END IF;
         END IF;
      END IF;
      -- else: !if(!ARESETN)            
      
      
   END PROCESS;

   -- always @ (posedge ACLK or negedge ARESETN)
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         AWVALID_M_FF1 <= '0';    
         ARVALID_M_FF1 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         AWVALID_M_FF1 <= '0';    
         ARVALID_M_FF1 <= '0';    ELSE 
         IF ((AWREADY_M_xhdl1 AND AWVALID_M) = '1') THEN
            AWVALID_M_FF1 <= '0';    
         ELSE
            AWVALID_M_FF1 <= AWVALID_M_INPFF1;    
         END IF;
         IF ((ARREADY_M_xhdl6 AND ARVALID_M) = '1') THEN
            ARVALID_M_FF1 <= '0';    
         ELSE
            ARVALID_M_FF1 <= ((ARVALID_M_INPFF1 AND NOT stall_trans) AND 
            CONV_STD_LOGIC(NOT ((rd_wdcntr - rd_rdcntr) = rd_acceptance_limit)))
            AND NOT stall_trans_rd;    
         END IF;
         END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      -- registering on clock 
      
      IF (areset_n = '0') THEN
         AWVALID_M_pulse <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (sresetn = '0') THEN
         AWVALID_M_pulse <= '0';    
      ELSE 
         IF ((AWREADY_M_xhdl1 AND AWVALID_M) = '1') THEN
            AWVALID_M_pulse <= '0';    
         ELSE
            IF ((AWVALID_M_INPFF1 AND NOT AWVALID_M_FF1) = '1') THEN
               AWVALID_M_pulse <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      -- registering on clock 
      
      IF (areset_n = '0') THEN
         ARVALID_M_pulse <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (sresetn = '0') THEN
         ARVALID_M_pulse <= '0';    
      ELSE
         IF ((ARREADY_M_xhdl6 AND ARVALID_M) = '1') THEN
            ARVALID_M_pulse <= '0';    
         ELSE
            IF (((ARVALID_M_INPFF1 AND NOT ARVALID_M_FF1) AND 
            ((CONV_STD_LOGIC(NOT ((rd_wdcntr - rd_rdcntr) = rd_acceptance_limit)
            ) AND NOT stall_trans) AND NOT stall_trans_rd)) = '1') THEN
               ARVALID_M_pulse <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   -- --------------------------------------------
   -- Write data
   -- --------------------------------------------
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         WVALID_M_INPFF1 <= '0';    
         WID_M_INPFF1 <= (OTHERS => '0');    
         WLAST_M_INPFF1 <= '0';    
         WDATA_M_INPFF1 <= (OTHERS => '0');    
         WSTRB_M_INPFF1 <= (OTHERS=>'0');
         BREADY_M_INPFF1 <= '0';    
         RREADY_M_INPFF1 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         WVALID_M_INPFF1 <= '0';    
         WID_M_INPFF1 <= (OTHERS => '0');    
         WLAST_M_INPFF1 <= '0';    
         WDATA_M_INPFF1 <= (OTHERS => '0');    
         WSTRB_M_INPFF1 <= (OTHERS=>'0');
         BREADY_M_INPFF1 <= '0';    
         RREADY_M_INPFF1 <= '0';    
      ELSE 
         IF ((WREADY_M_xhdl2 AND WVALID_M) = '1') THEN
            WVALID_M_INPFF1 <= '0';    
            WLAST_M_INPFF1 <= '0';    
         ELSE
            WVALID_M_INPFF1 <= WVALID_M;    
            WDATA_M_INPFF1 <= WDATA_M;    
            WID_M_INPFF1 <= WID_int;    
            WSTRB_M_INPFF1 <= WSTRB_M;    
            WLAST_M_INPFF1 <= WLAST_M;    
         END IF;
         BREADY_M_INPFF1 <= BREADY_M;    
         RREADY_M_INPFF1 <= RREADY_M;    
      END IF;
      END IF;
   END PROCESS;

   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         WVALID_M_FF1 <= '0';    
         BREADY_M_FF1 <= '0';    
         RREADY_M_FF1 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         WVALID_M_FF1 <= '0';    
         BREADY_M_FF1 <= '0';    
         RREADY_M_FF1 <= '0';    
      ELSE 
         WVALID_M_FF1 <= WVALID_M_INPFF1;    
         BREADY_M_FF1 <= BREADY_M_INPFF1;    
         RREADY_M_FF1 <= RREADY_M_INPFF1;    
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         WVALID_M_pulse <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         WVALID_M_pulse <= '0';    
      ELSE 
         IF ((WREADY_M_xhdl2 AND WVALID_M) = '1') THEN
            WVALID_M_pulse <= '0';    
         ELSE
            IF ((WVALID_M_INPFF1 AND NOT WVALID_M_FF1) = '1') THEN
               WVALID_M_pulse <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;
   BREADY_M_pulse <= NOT BREADY_M_FF1 AND BREADY_M_INPFF1 ;
   RREADY_M_pulse <= NOT RREADY_M_FF1 AND RREADY_M_INPFF1 ;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         next_valid_sample <= '0';    
         next_valid_sample_r <= '0';    
         WLAST_M_r <= '0';    
         AWVALID_M_r <= '0';    
         ARVALID_M_r <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         next_valid_sample <= '0';    
         next_valid_sample_r <= '0';    
         WLAST_M_r <= '0';    
         AWVALID_M_r <= '0';    
         ARVALID_M_r <= '0';    
      ELSE 
         IF (WREADY_M_xhdl2 = '1') THEN
            next_valid_sample <= '0';    
         ELSE
            IF (WVALID_M_INPFF1 = '1') THEN
               next_valid_sample <= '1';    
            END IF;
         END IF;
         next_valid_sample_r <= next_valid_sample;    
         WLAST_M_r <= WLAST_M AND NOT gated_AWVALID_M_flag;    
         AWVALID_M_r <= AWVALID_M;    
         ARVALID_M_r <= ARVALID_M;    
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         next_rvalid_sample <= '0';    
         next_rvalid_sample_r <= '0';    
         RLAST_IM_r <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         next_rvalid_sample <= '0';    
         next_rvalid_sample_r <= '0';    
         RLAST_IM_r <= '0';    
      ELSE 
         IF (RREADY_MI_xhdl36 = '1') THEN
            next_rvalid_sample <= '0';    
         ELSE
            IF (RVALID_M_INPFF1 = '1') THEN
               next_rvalid_sample <= '1';    
            END IF;
         END IF;
         next_rvalid_sample_r <= next_rvalid_sample;    
         RLAST_IM_r <= RLAST_IM;    
      END IF;
      END IF;
   END PROCESS;

   -- --------------------------------------------------
   -- Read data
   -- --------------------------------------------------
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (areset_n = '0') THEN
         -- Latched Write Response signals
         
         BVALID_M_INPFF1 <= '0';    
         BID_M_INPFF1 <= (OTHERS => '0');    
         BRESP_M_INPFF1 <= (OTHERS => '0');    
         -- Latched Read Response signals
         
         RID_M_INPFF1 <= (OTHERS => '0');    
         RDATA_M_INPFF1 <= (OTHERS => '0');    
         RRESP_M_INPFF1 <= (OTHERS => '0');    
         RLAST_M_INPFF1 <= '0';    
         RVALID_M_INPFF1 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (sresetn = '0') THEN
         -- Latched Write Response signals
         
         BVALID_M_INPFF1 <= '0';    
         BID_M_INPFF1 <= (OTHERS => '0');    
         BRESP_M_INPFF1 <= (OTHERS => '0');    
         -- Latched Read Response signals
         
         RID_M_INPFF1 <= (OTHERS => '0');    
         RDATA_M_INPFF1 <= (OTHERS => '0');    
         RRESP_M_INPFF1 <= (OTHERS => '0');    
         RLAST_M_INPFF1 <= '0';    
         RVALID_M_INPFF1 <= '0';    
      ELSE 
         IF ((BVALID_M_xhdl5 AND BREADY_M) = '1') THEN
            BVALID_M_INPFF1 <= '0';    
            BID_M_INPFF1 <= (OTHERS => '0');    
            BRESP_M_INPFF1 <= (OTHERS => '0');    
         ELSE
            -- Latched Write Response signals
            
            BID_M_INPFF1 <= BID_IM;    
            BRESP_M_INPFF1 <= BRESP_IM;    
            BVALID_M_INPFF1 <= BVALID_IM AND NOT BVALID_IM_r;    
         END IF;
         IF ((RVALID_M_xhdl11 AND RREADY_M) = '1') THEN
            RID_M_INPFF1 <= (OTHERS => '0');    
            RDATA_M_INPFF1 <= (OTHERS => '0');    
            RRESP_M_INPFF1 <= (OTHERS => '0');    
            RLAST_M_INPFF1 <= '0';    
            RVALID_M_INPFF1 <= '0';    
         ELSE
            RID_M_INPFF1 <= RID_IM;    
            RDATA_M_INPFF1 <= RDATA_IM;    
            RRESP_M_INPFF1 <= RRESP_IM;    
            RLAST_M_INPFF1 <= RLAST_IM;    
            RVALID_M_INPFF1 <= RVALID_IM;    
         END IF;
      END IF;
      END IF;
   END PROCESS;
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (areset_n = '0') THEN
         -- Latched Write Response signals
         
         BVALID_M_FF1 <= '0';    
         BID_M_FF1 <= (OTHERS => '0');    
         BRESP_M_FF1 <= (OTHERS => '0');    
         RID_M_FF1 <= (OTHERS => '0');    
         RDATA_M_FF1 <= (OTHERS => '0');    
         RRESP_M_FF1 <= (OTHERS => '0');    
         RLAST_M_FF1 <= '0';    
         RVALID_M_FF1 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (sresetn = '0') THEN
         -- Latched Write Response signals
         
         BVALID_M_FF1 <= '0';    
         BID_M_FF1 <= (OTHERS => '0');    
         BRESP_M_FF1 <= (OTHERS => '0');    
         RID_M_FF1 <= (OTHERS => '0');    
         RDATA_M_FF1 <= (OTHERS => '0');    
         RRESP_M_FF1 <= (OTHERS => '0');    
         RLAST_M_FF1 <= '0';    
         RVALID_M_FF1 <= '0';    
      ELSE 
         BID_M_FF1 <= BID_M_INPFF1;    
         BRESP_M_FF1 <= BRESP_M_INPFF1;    
         BVALID_M_FF1 <= BVALID_M_INPFF1;    
         RID_M_FF1 <= RID_M_INPFF1;    
         RDATA_M_FF1 <= RDATA_M_INPFF1;    
         RRESP_M_FF1 <= RRESP_M_INPFF1;    
         RLAST_M_FF1 <= RLAST_M_INPFF1;    
         RVALID_M_FF1 <= RVALID_M_INPFF1;    
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         RVALID_M_pulse <= '0';    
         RID_M_pulse <= (OTHERS => '0');    
         RRESP_M_pulse <= (OTHERS => '0');     
         RDATA_M_pulse <= (OTHERS => '0');    
         RLAST_M_pulse <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         RVALID_M_pulse <= '0';    
         RID_M_pulse <= (OTHERS => '0');    
         RRESP_M_pulse <= (OTHERS => '0');     
         RDATA_M_pulse <= (OTHERS => '0');    
         RLAST_M_pulse <= '0';    
      ELSE 
         IF ((RVALID_M_xhdl11 AND RREADY_M) = '1') THEN
            RVALID_M_pulse <= '0';    
            RID_M_pulse <= (OTHERS => '0');    
            RRESP_M_pulse <= (OTHERS => '0');     
            RDATA_M_pulse <= (OTHERS => '0');    
            RLAST_M_pulse <= '0';    
         ELSE
            IF ((RVALID_M_INPFF1 AND NOT RVALID_M_FF1) = '1') THEN
               RVALID_M_pulse <= '1';    
               RID_M_pulse <= RID_M_INPFF1;    
               RRESP_M_pulse <= RRESP_M_INPFF1;    
               RDATA_M_pulse <= RDATA_M_INPFF1;    
               RLAST_M_pulse <= RLAST_M_INPFF1;    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   -- Write Resp
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         BVALID_M_pulse <= '0';    
         BID_M_pulse <= (OTHERS => '0');    
         BRESP_M_pulse <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         BVALID_M_pulse <= '0';    
         BID_M_pulse <= (OTHERS => '0');    
         BRESP_M_pulse <= (OTHERS => '0');    
      ELSE 
         IF ((BVALID_M_xhdl5 AND BREADY_M) = '1') THEN
            BVALID_M_pulse <= '0';    
            BID_M_pulse <= (OTHERS => '0');    
            BRESP_M_pulse <= (OTHERS => '0');    
         ELSE
            IF ((BVALID_M_INPFF1 AND NOT BVALID_M_FF1) = '1') THEN
               BVALID_M_pulse <= '1';    
               BID_M_pulse <= BID_M_INPFF1;    
               BRESP_M_pulse <= BRESP_M_INPFF1;    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   END GENERATE L1;

   L2: IF(INP_REG_BUF = 0) GENERATE
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         AWVALID_M_INPFF1 <= '0';    
         AWLEN_M_INPFF1 <= (OTHERS => '0');     
         AWSIZE_M_INPFF1 <= (OTHERS => '0');    
         AWBURST_M_INPFF1 <= (OTHERS => '0');    
         AWLOCK_M_INPFF1 <= (OTHERS => '0');    
         AWCACHE_M_INPFF1 <= (OTHERS => '0');    
         AWPROT_M_INPFF1 <= (OTHERS => '0');    
         AWADDR_M_INPFF1 <= (OTHERS => '0');    
         AWID_M_INPFF1 <= (OTHERS => '0');    
         ARVALID_M_INPFF1 <= '0';    
         ARLEN_M_INPFF1 <= (OTHERS => '0');    
         ARSIZE_M_INPFF1 <= (OTHERS => '0');    
         ARBURST_M_INPFF1 <= (OTHERS => '0');    
         ARLOCK_M_INPFF1 <= (OTHERS => '0');    
         ARCACHE_M_INPFF1 <= (OTHERS => '0');    
         ARPROT_M_INPFF1 <= (OTHERS => '0');    
         ARADDR_M_INPFF1 <= (OTHERS => '0');    
         ARID_M_INPFF1 <= (OTHERS => '0');    
         prev_ARADDR <= (OTHERS => '0');    
         prev_ARID <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         AWVALID_M_INPFF1 <= '0';    
         AWLEN_M_INPFF1 <= (OTHERS => '0');     
         AWSIZE_M_INPFF1 <= (OTHERS => '0');    
         AWBURST_M_INPFF1 <= (OTHERS => '0');    
         AWLOCK_M_INPFF1 <= (OTHERS => '0');    
         AWCACHE_M_INPFF1 <= (OTHERS => '0');    
         AWPROT_M_INPFF1 <= (OTHERS => '0');    
         AWADDR_M_INPFF1 <= (OTHERS => '0');    
         AWID_M_INPFF1 <= (OTHERS => '0');    
         ARVALID_M_INPFF1 <= '0';    
         ARLEN_M_INPFF1 <= (OTHERS => '0');    
         ARSIZE_M_INPFF1 <= (OTHERS => '0');    
         ARBURST_M_INPFF1 <= (OTHERS => '0');    
         ARLOCK_M_INPFF1 <= (OTHERS => '0');    
         ARCACHE_M_INPFF1 <= (OTHERS => '0');    
         ARPROT_M_INPFF1 <= (OTHERS => '0');    
         ARADDR_M_INPFF1 <= (OTHERS => '0');    
         ARID_M_INPFF1 <= (OTHERS => '0');    
         prev_ARADDR <= (OTHERS => '0');    
         prev_ARID <= (OTHERS => '0');    
      ELSE 
         IF ((AWREADY_M_xhdl1 AND AWVALID_M) = '1') THEN
            AWVALID_M_INPFF1 <= '0';    
            AWLEN_M_INPFF1 <= (OTHERS => '0');    
            AWSIZE_M_INPFF1 <= (OTHERS => '0');    
            AWBURST_M_INPFF1 <= (OTHERS => '0');    
            AWCACHE_M_INPFF1 <= (OTHERS => '0');    
            AWPROT_M_INPFF1 <= (OTHERS => '0');    
            AWID_M_INPFF1 <= (OTHERS => '0');    
         ELSIF (AWVALID_M = '1') THEN
            AWVALID_M_INPFF1 <= '1';    
            AWID_M_INPFF1 <= AWID_int;    
            AWLEN_M_INPFF1 <= AWLEN_M;    
            AWSIZE_M_INPFF1 <= AWSIZE_M;    
            AWBURST_M_INPFF1 <= AWBURST_M;    
            AWLOCK_M_INPFF1 <= AWLOCK_M;    
            AWCACHE_M_INPFF1 <= AWCACHE_M;    
            AWPROT_M_INPFF1 <= AWPROT_M;    
            AWADDR_M_INPFF1 <= AWADDR_M;    
         END IF;
         IF ((ARREADY_M_xhdl6 AND ARVALID_M) = '1') THEN
            ARVALID_M_INPFF1 <= '0';    
            ARLEN_M_INPFF1 <= (OTHERS => '0');    
            ARSIZE_M_INPFF1 <= (OTHERS => '0');    
            ARBURST_M_INPFF1 <= (OTHERS => '0');    
            ARCACHE_M_INPFF1 <= (OTHERS => '0');    
            ARPROT_M_INPFF1 <= (OTHERS => '0');    
            ARID_M_INPFF1 <= (OTHERS => '0');    
            prev_ARADDR <= ARADDR_M;    
            prev_ARID <= ARID_M;    
         ELSIF (ARVALID_M = '1') THEN  
            ARVALID_M_INPFF1 <= (('1' AND CONV_STD_LOGIC(NOT ((rd_wdcntr 
            - rd_rdcntr) = rd_acceptance_limit))) AND NOT stall_trans) AND NOT 
            stall_trans_rd;    
            ARID_M_INPFF1 <= ARID_int;    
            ARLEN_M_INPFF1 <= ARLEN_M;    
            ARSIZE_M_INPFF1 <= ARSIZE_M;    
            ARBURST_M_INPFF1 <= ARBURST_M;    
            ARLOCK_M_INPFF1 <= ARLOCK_M;    
            ARCACHE_M_INPFF1 <= ARCACHE_M;    
            ARPROT_M_INPFF1 <= ARPROT_M;    
            ARADDR_M_INPFF1 <= ARADDR_M;    
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (areset_n = '0') THEN
         AWVALID_M_pulse <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (sresetn = '0') THEN
         AWVALID_M_pulse <= '0';    
      ELSE 
         IF ((AWREADY_M_xhdl1 AND AWVALID_M) = '1') THEN
            AWVALID_M_pulse <= '0';    
         ELSE
            IF (((AWVALID_M AND NOT AWVALID_M_INPFF1) ) = '1') THEN
               AWVALID_M_pulse <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (areset_n = '0') THEN
         ARVALID_M_pulse <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (sresetn = '0') THEN
         ARVALID_M_pulse <= '0';    
      ELSE 
         IF ((ARREADY_M_xhdl6 AND ARVALID_M) = '1') THEN
            ARVALID_M_pulse <= '0';    
         ELSE
            IF (((((ARVALID_M AND NOT ARVALID_M_INPFF1) AND NOT stall_trans) 
            AND NOT stall_trans_rd) AND CONV_STD_LOGIC(NOT ((rd_wdcntr - 
            rd_rdcntr) = rd_acceptance_limit))) = '1') THEN
               ARVALID_M_pulse <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         WVALID_M_INPFF1 <= '0';    
         WLAST_M_INPFF1 <= '0';    
         WDATA_M_INPFF1 <= (OTHERS => '0');    
         WSTRB_M_INPFF1 <= (OTHERS => '0');    
         WID_M_INPFF1 <= (OTHERS => '0');    
         BREADY_M_FF1 <= '0';    
         RREADY_M_FF1 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         WVALID_M_INPFF1 <= '0';    
         WLAST_M_INPFF1 <= '0';    
         WDATA_M_INPFF1 <= (OTHERS => '0');    
         WSTRB_M_INPFF1 <= (OTHERS => '0');    
         WID_M_INPFF1 <= (OTHERS => '0');    
         BREADY_M_FF1 <= '0';    
         RREADY_M_FF1 <= '0';    
      ELSE 
         IF ((WREADY_M_xhdl2 AND WVALID_M) = '1') THEN
            WVALID_M_INPFF1 <= '0';    
            WLAST_M_INPFF1 <= '0';    
            WID_M_INPFF1 <= (OTHERS => '0');    
         ELSE
            WVALID_M_INPFF1 <= WVALID_M;    
            WDATA_M_INPFF1 <= WDATA_M;    
            WID_M_INPFF1 <= WID_int;    
            WSTRB_M_INPFF1 <= WSTRB_M;    
            WLAST_M_INPFF1 <= WLAST_M;    
         END IF;
         BREADY_M_FF1 <= BREADY_M;    
         RREADY_M_FF1 <= RREADY_M;    
      END IF;
      END IF;
   END PROCESS;

   -- --------------------------------------------
   -- Write data (INP_REG_BUF = 0)
   -- --------------------------------------------
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         WVALID_M_pulse <= '0';    
         WLAST_M_pulse <= '0';    
         WID_M_pulse <= (OTHERS => '0');    
         WDATA_M_pulse <= (OTHERS => '0');    
         WSTRB_M_pulse <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         WVALID_M_pulse <= '0';    
         WLAST_M_pulse <= '0';    
         WID_M_pulse <= (OTHERS => '0');    
         WDATA_M_pulse <= (OTHERS => '0');    
         WSTRB_M_pulse <= (OTHERS => '0');    
      ELSE 
         IF ((WREADY_M_xhdl2 AND WVALID_M) = '1') THEN
            WVALID_M_pulse <= '0';    
            WLAST_M_pulse <= '0';    
         ELSE
            IF ((WVALID_M AND NOT WVALID_M_INPFF1) = '1') THEN
               WVALID_M_pulse <= '1';    
               WLAST_M_pulse <= WLAST_M;    
               WID_M_pulse <= WID_int;    
               WDATA_M_pulse <= WDATA_M;    
               WSTRB_M_pulse <= WSTRB_M;    
            END IF;
         END IF;
         WDATA_M_pulse <= WDATA_M;    
         WSTRB_M_pulse <= WSTRB_M;    
         WID_M_pulse <= WID_int;    
      END IF;
      END IF;
   END PROCESS;

   BREADY_M_pulse <= NOT BREADY_M_FF1 AND BREADY_M ;
   RREADY_M_pulse <= NOT RREADY_M_FF1 AND RREADY_M ;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         next_valid_sample <= '0';    
         next_valid_sample_r <= '0';    
         WLAST_M_r <= '0';    
         AWVALID_M_r <= '0';    
         ARVALID_M_r <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         next_valid_sample <= '0';    
         next_valid_sample_r <= '0';    
         WLAST_M_r <= '0';    
         AWVALID_M_r <= '0';    
         ARVALID_M_r <= '0';    
      ELSE 
         IF (WREADY_M_xhdl2 = '1') THEN
            next_valid_sample <= '0';    
         ELSE
            IF (WVALID_M_pulse = '1') THEN
               next_valid_sample <= '1';    
            END IF;
         END IF;
         next_valid_sample_r <= next_valid_sample;    
         WLAST_M_r <= WLAST_M AND NOT gated_AWVALID_M_flag;    
         AWVALID_M_r <= AWVALID_M;    
         ARVALID_M_r <= ARVALID_M;    
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (areset_n = '0') THEN
         -- Latched Read Response signals
         
         RID_M_FF1 <= (OTHERS => '0');    
         RDATA_M_FF1 <= (OTHERS => '0');    
         RRESP_M_FF1 <= (OTHERS => '0');    
         RLAST_M_FF1 <= '0';    
         RVALID_M_FF1 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (sresetn = '0') THEN
         -- Latched Read Response signals
         
         RID_M_FF1 <= (OTHERS => '0');    
         RDATA_M_FF1 <= (OTHERS => '0');    
         RRESP_M_FF1 <= (OTHERS => '0');    
         RLAST_M_FF1 <= '0';    
         RVALID_M_FF1 <= '0';    
      ELSE 
         IF ((RVALID_M_xhdl11 AND RREADY_M) = '1') THEN
            RID_M_FF1 <= (OTHERS => '0');    
            RDATA_M_FF1 <= (OTHERS => '0');    
            RRESP_M_FF1 <= (OTHERS => '0');    
            RLAST_M_FF1 <= '0';    
            RVALID_M_FF1 <= '0';    
         ELSE
            -- Latched Read Response signals
            
            RID_M_FF1 <= RID_IM;    
            RDATA_M_FF1 <= RDATA_IM;    
            RRESP_M_FF1 <= RRESP_IM;    
            RLAST_M_FF1 <= RLAST_IM;    
            RVALID_M_FF1 <= RVALID_IM;    
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         RVALID_M_pulse <= '0';    
         RID_M_pulse <= (OTHERS => '0');    
         RRESP_M_pulse <= (OTHERS => '0');    
         RDATA_M_pulse <= (OTHERS => '0');    
         RLAST_M_pulse <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         RVALID_M_pulse <= '0';    
         RID_M_pulse <= (OTHERS => '0');    
         RRESP_M_pulse <= (OTHERS => '0');    
         RDATA_M_pulse <= (OTHERS => '0');    
         RLAST_M_pulse <= '0';    
      ELSE 
         IF ((RVALID_M_xhdl11 AND RREADY_M) = '1') THEN
            RVALID_M_pulse <= '0';    
            RID_M_pulse <= (OTHERS => '0');    
            RRESP_M_pulse <= (OTHERS => '0');    
            RDATA_M_pulse <= (OTHERS => '0');    
            RLAST_M_pulse <= '0';    
         ELSE
            IF ((RVALID_IM AND NOT RVALID_M_FF1) = '1') THEN
               RVALID_M_pulse <= '1';    
               RID_M_pulse <= RID_IM;    
               RRESP_M_pulse <= RRESP_IM;    
               RDATA_M_pulse <= RDATA_IM;    
               RLAST_M_pulse <= RLAST_IM;    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (areset_n = '0') THEN
         -- Latched Write Response signals
         
         BVALID_M_FF1 <= '0';    
         BID_M_FF1 <= (OTHERS => '0');    
         BRESP_M_FF1 <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (sresetn = '0') THEN
         -- Latched Write Response signals
         
         BVALID_M_FF1 <= '0';    
         BID_M_FF1 <= (OTHERS => '0');    
         BRESP_M_FF1 <= (OTHERS => '0');    ELSE 
         IF ((BVALID_M_xhdl5 AND BREADY_M) = '1') THEN
            BVALID_M_FF1 <= '0';    
            BID_M_FF1 <= (OTHERS => '0');    
            BRESP_M_FF1 <= (OTHERS => '0');    
         ELSE
            -- Latched Write Response signals
            
            BID_M_FF1 <= BID_IM;    
            BRESP_M_FF1 <= BRESP_IM;    
            BVALID_M_FF1 <= BVALID_IM AND NOT BVALID_IM_r;    
         END IF;
      END IF;
      END IF;
   END PROCESS;

   -- Write Resp
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         BVALID_M_pulse <= '0';    
         BID_M_pulse <= (OTHERS => '0');    
         BRESP_M_pulse <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         BVALID_M_pulse <= '0';    
         BID_M_pulse <= (OTHERS => '0');    
         BRESP_M_pulse <= (OTHERS => '0');    
      ELSE 
         IF ((BVALID_M_xhdl5 AND BREADY_M) = '1') THEN
            BVALID_M_pulse <= '0';    
            BID_M_pulse <= (OTHERS => '0');    
            BRESP_M_pulse <= (OTHERS => '0');    
         ELSE
            IF ((BVALID_IM AND NOT BVALID_IM_r) = '1') THEN
               BVALID_M_pulse <= '1';    
               BID_M_pulse <= BID_IM;    
               BRESP_M_pulse <= BRESP_IM;    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   END GENERATE L2;
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         RVALID_IM_r <= '0';    
         BVALID_IM_r <= '0';    
         RVALID_M_r <= '0';    
         RREADY_M_r <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         RVALID_IM_r <= '0';    
         BVALID_IM_r <= '0';    
         RVALID_M_r <= '0';    
         RREADY_M_r <= '0';    
      ELSE 
         RVALID_IM_r <= RVALID_IM;    
         BVALID_IM_r <= BVALID_IM;    
         RVALID_M_r <= RVALID_M_xhdl11;    
         RREADY_M_r <= RREADY_M;    
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      -- registering on clock 
      
      IF (areset_n = '0') THEN
         WREADY_IM_r <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (sresetn = '0') THEN
         WREADY_IM_r <= '0';    
      ELSE 
         WREADY_IM_r <= WREADY_IM;    
      END IF;
      END IF;
   END PROCESS;

   BREADY_MI_xhdl26 <= BREADY_M AND BVALID_M_xhdl5 ;

   PROCESS (BID_M_INPFF1, gated_AWVALID_M_flag, BVALID_IM_r, ARADDR_M, 
   BVALID_M_FF1, RDATA_M_INPFF1, ARVALID_M, RVALID_M_xhdl11, AWLEN_M, RLAST_IM, 
   ARLEN_M, RDATA_IM, RREADY_M, BREADY_M, BVALID_M_xhdl5, AWVALID_M_INPFF1, 
   RVALID_M_INPFF1, AWBURST_M, WLAST_M, WVALID_M_pulse, stall_trans_rd, 
   BRESP_M_INPFF1, ACLK, AWSIZE_M, BVALID_M_INPFF1, RLAST_M_INPFF1, 
   RREADY_MI_xhdl36, ARVALID_M_INPFF1, RREADY_M_INPFF1, WID_int, AWLOCK_M, 
   BREADY_M_FF1, ARID_M, ARREADY_M_xhdl6, AWVALID_M, AWID_int, RID_IM, 
   BREADY_M_INPFF1, AWPROT_M, BVALID_IM, WSTRB_M, RID_M_INPFF1, WVALID_M_FF1, 
   RVALID_M_FF1, AWADDR_M, rd_wdcntr, rd_rdcntr, AWREADY_M_xhdl1, WDATA_M, 
   RVALID_IM, ARCACHE_M, AWVALID_M_FF1, WREADY_IM, BID_IM, ARVALID_M_FF1, 
   next_valid_sample, rd_acceptance_limit, ARSIZE_M, WREADY_M_xhdl2, WVALID_M, 
   next_rvalid_sample, ARLOCK_M, ARBURST_M, RREADY_M_FF1, ARID_int,  
   stall_trans, RRESP_M_INPFF1, ARPROT_M, AWCACHE_M, BRESP_IM,  
   WVALID_M_INPFF1, RRESP_IM)
      VARIABLE RREADY_MI_xhdl36_xhdl43  : std_logic;
   BEGIN
      RREADY_MI_xhdl36_xhdl43 := RREADY_M AND RVALID_M_xhdl11;    
      RREADY_MI_xhdl36 <= RREADY_MI_xhdl36_xhdl43;
   END PROCESS;

   -- ##########################################################################
   -- --------------------------------------------------------------------------
   -- Towards Master interface
   -- --------------------------------------------------------------------------
   -- Pass Write address/Read address and write data ready signals back to the master top
   -- Register the AND'ing of READY from the slave and the outgoing valid 
   -- from the master stage
   -- --------------------------------------------------------------------------
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         WVALID_MI_r1 <= '0';    
         WVALID_MI_r2 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         WVALID_MI_r1 <= '0';    
         WVALID_MI_r2 <= '0';    
      ELSE 
         IF ((WREADY_M_xhdl2 AND WVALID_M) = '1') THEN
            WVALID_MI_r1 <= '0';    
            WVALID_MI_r2 <= '0';    
         ELSE
            WVALID_MI_r1 <= WVALID_MI_xhdl25;    
            WVALID_MI_r2 <= WVALID_MI_r1;    
         END IF;
      END IF;
      END IF;
   END PROCESS;
   
   -- --------------------------------------------------------------------------
   -- Pass the ARDEADY_SI coming from the respective selected slave.
   -- When the look-up is filled to limit of 16, the AWREADY going towards the
   -- granted master is pulled low. This disallows anymore transactions to be
   -- received in to the DUT.
   -- --------------------------------------------------------------------------
   --   generate      
   --      if(OUT_REG_BUF == 1)  begin
   L3: IF (OUT_REG_BUF = 1) GENERATE

   ARREADY_M_int <= (ARREADY_IM AND ARVALID_MI_xhdl35) AND NOT ARREADY_M_xhdl6 
   ;
   temp_xhdl44 <= '0' WHEN (((rd_wdcntr - rd_rdcntr) = 
   CONV_STD_LOGIC_VECTOR(RD_ACCEPTANCE, 4)) OR (stall_trans = '1') OR 
   (stall_trans_rd = '1')) ELSE ARREADY_M_int;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         AWREADY_M_xhdl1 <= '0';    
         ARREADY_M_xhdl6 <= '0';    
         WREADY_M_xhdl2 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         AWREADY_M_xhdl1 <= '0';    
         ARREADY_M_xhdl6 <= '0';    
         WREADY_M_xhdl2 <= '0';    
      ELSE 
         AWREADY_M_xhdl1 <= ((AWREADY_IM AND AWVALID_MI_xhdl20) AND NOT AWREADY_M_xhdl1) ;    
         ARREADY_M_xhdl6 <= temp_xhdl44;    
         WREADY_M_xhdl2 <= (WREADY_IM AND WVALID_MI_xhdl25) AND NOT 
         WREADY_M_xhdl2;    
      END IF;
      END IF;
   END PROCESS;

   END GENERATE L3;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         AWREADY_M_r <= '0';    
         ARREADY_M_r <= '0';    
         WREADY_M_r <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         AWREADY_M_r <= '0';    
         ARREADY_M_r <= '0';    
         WREADY_M_r <= '0';    
      ELSE 
         AWREADY_M_r <= AWREADY_M_xhdl1;    
         ARREADY_M_r <= ARREADY_M_xhdl6;    
         WREADY_M_r <= WREADY_M_xhdl2;    
      END IF;
      END IF;
   END PROCESS;

   L4: IF (OUT_REG_BUF = 0) GENERATE

   ARREADY_M_int <= ARREADY_IM AND ARVALID_MI_xhdl35 ;
   temp_xhdl46 <= '0' WHEN (((rd_wdcntr - rd_rdcntr) = 
   CONV_STD_LOGIC_VECTOR(RD_ACCEPTANCE, 4)) OR (stall_trans = '1') OR 
   (stall_trans_rd = '1')) ELSE ARREADY_M_int;

   PROCESS (WVALID_M, AWVALID_MI_xhdl20, AWREADY_M_r, rd_wdcntr,  
   rd_rdcntr, ARREADY_M_xhdl6, AWREADY_M_xhdl1, WVALID_MI_r1, 
   ARREADY_IM, WREADY_IM, stall_trans, stall_trans_rd, 
   WVALID_MI_xhdl25, WREADY_M_r, ARREADY_M_int, ARVALID_MI_xhdl35, 
   WREADY_M_xhdl2, AWREADY_IM, temp_xhdl46)
      VARIABLE AWREADY_M_xhdl1_xhdl45  : std_logic;
      VARIABLE ARREADY_M_xhdl6_xhdl47  : std_logic;
      VARIABLE WREADY_M_xhdl2_xhdl48  : std_logic;
   BEGIN
      AWREADY_M_xhdl1_xhdl45 := ((AWREADY_IM AND AWVALID_MI_xhdl20) ) AND NOT AWREADY_M_r;    
      ARREADY_M_xhdl6_xhdl47 := temp_xhdl46;    
      WREADY_M_xhdl2_xhdl48 := (WREADY_IM AND WVALID_MI_xhdl25) AND NOT 
      WREADY_M_r;    
      AWREADY_M_xhdl1 <= AWREADY_M_xhdl1_xhdl45;
      ARREADY_M_xhdl6 <= ARREADY_M_xhdl6_xhdl47;
      WREADY_M_xhdl2 <= WREADY_M_xhdl2_xhdl48;
   END PROCESS;

   END GENERATE L4;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         gatedWA_Rdy <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         gatedWA_Rdy <= '0';    
      ELSE 
         IF ((BVALID_M_xhdl5 AND BREADY_M) = '1') THEN
            gatedWA_Rdy <= '0';    
         ELSE
            IF ((AWVALID_M AND AWREADY_M_xhdl1) = '1') THEN
               gatedWA_Rdy <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ARVALID_M_pulse, ARSIZE_M_INPFF1, ARBURST_M_INPFF1, AWVALID_M_pulse,
   ARPROT_M_INPFF1, ARCACHE_M_INPFF1, BREADY_M, BVALID_M_xhdl5, AWSIZE_M_INPFF1,
   AWREADY_M_xhdl1, ARADDR_M_INPFF1, ARESETN, AWVALID_M, AWID_M_INPFF1, 
   AWPROT_M_INPFF1, ARLEN_M_INPFF1, AWLEN_M_INPFF1, AWBURST_M_INPFF1, 
   ARLOCK_M_INPFF1, ARID_M_INPFF1, AWADDR_M_INPFF1, AWCACHE_M_INPFF1, 
   AWLOCK_M_INPFF1)
      VARIABLE AWVALID_MI_xhdl20_xhdl49  : std_logic;
      VARIABLE AWID_MI_xhdl12_xhdl50  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE AWLEN_MI_xhdl14_xhdl51  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWSIZE_MI_xhdl15_xhdl52  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWBURST_MI_xhdl16_xhdl53  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWLOCK_MI_xhdl17_xhdl54  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWCACHE_MI_xhdl18_xhdl55  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWPROT_MI_xhdl19_xhdl56  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWADDR_MI_xhdl13_xhdl57  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE ARVALID_MI_xhdl35_xhdl58  : std_logic;
      VARIABLE ARID_MI_xhdl27_xhdl59  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE ARSIZE_MI_xhdl30_xhdl60  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARBURST_MI_xhdl31_xhdl61  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARLOCK_MI_xhdl32_xhdl62  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARCACHE_MI_xhdl33_xhdl63  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARPROT_MI_xhdl34_xhdl64  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARLEN_MI_xhdl29_xhdl65  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARADDR_MI_xhdl28_xhdl66  : std_logic_vector(31 
      DOWNTO 0);
   BEGIN
      -- Latched Write Address signals 
      
      AWVALID_MI_xhdl20_xhdl49 := AWVALID_M_pulse;    
      AWID_MI_xhdl12_xhdl50 := AWID_M_INPFF1;    
      AWLEN_MI_xhdl14_xhdl51 := AWLEN_M_INPFF1;    
      AWSIZE_MI_xhdl15_xhdl52 := AWSIZE_M_INPFF1;    
      AWBURST_MI_xhdl16_xhdl53 := AWBURST_M_INPFF1;    
      AWLOCK_MI_xhdl17_xhdl54 := AWLOCK_M_INPFF1;    
      AWCACHE_MI_xhdl18_xhdl55 := AWCACHE_M_INPFF1;    
      AWPROT_MI_xhdl19_xhdl56 := AWPROT_M_INPFF1;    
      AWADDR_MI_xhdl13_xhdl57 := AWADDR_M_INPFF1;    
      -- Latched Read Address signals 
      
      ARVALID_MI_xhdl35_xhdl58 := ARVALID_M_pulse;    
      ARID_MI_xhdl27_xhdl59 := ARID_M_INPFF1;    
      ARSIZE_MI_xhdl30_xhdl60 := ARSIZE_M_INPFF1;    
      ARBURST_MI_xhdl31_xhdl61 := ARBURST_M_INPFF1;    
      ARLOCK_MI_xhdl32_xhdl62 := ARLOCK_M_INPFF1;    
      ARCACHE_MI_xhdl33_xhdl63 := ARCACHE_M_INPFF1;    
      ARPROT_MI_xhdl34_xhdl64 := ARPROT_M_INPFF1;    
      ARLEN_MI_xhdl29_xhdl65 := ARLEN_M_INPFF1;    
      ARADDR_MI_xhdl28_xhdl66 := ARADDR_M_INPFF1;    
      AWVALID_MI_xhdl20 <= AWVALID_MI_xhdl20_xhdl49;
      AWID_MI_xhdl12 <= AWID_MI_xhdl12_xhdl50;
      AWLEN_MI_xhdl14 <= AWLEN_MI_xhdl14_xhdl51;
      AWSIZE_MI_xhdl15 <= AWSIZE_MI_xhdl15_xhdl52;
      AWBURST_MI_xhdl16 <= AWBURST_MI_xhdl16_xhdl53;
      AWLOCK_MI_xhdl17 <= AWLOCK_MI_xhdl17_xhdl54;
      AWCACHE_MI_xhdl18 <= AWCACHE_MI_xhdl18_xhdl55;
      AWPROT_MI_xhdl19 <= AWPROT_MI_xhdl19_xhdl56;
      AWADDR_MI_xhdl13 <= AWADDR_MI_xhdl13_xhdl57;
      ARVALID_MI_xhdl35 <= ARVALID_MI_xhdl35_xhdl58;
      ARID_MI_xhdl27 <= ARID_MI_xhdl27_xhdl59;
      ARSIZE_MI_xhdl30 <= ARSIZE_MI_xhdl30_xhdl60;
      ARBURST_MI_xhdl31 <= ARBURST_MI_xhdl31_xhdl61;
      ARLOCK_MI_xhdl32 <= ARLOCK_MI_xhdl32_xhdl62;
      ARCACHE_MI_xhdl33 <= ARCACHE_MI_xhdl33_xhdl63;
      ARPROT_MI_xhdl34 <= ARPROT_MI_xhdl34_xhdl64;
      ARLEN_MI_xhdl29 <= ARLEN_MI_xhdl29_xhdl65;
      ARADDR_MI_xhdl28 <= ARADDR_MI_xhdl28_xhdl66;
   END PROCESS;

   -- ----------------------------------------------------
   -- From slave_stage
   -- ----------------------------------------------------
   -------------------------------------------------------
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         WID_MI_xhdl21 <= (OTHERS => '0');    
         WDATA_MI_xhdl22 <= (OTHERS => '0');    
         WSTRB_MI_xhdl23 <= (OTHERS => '0');    
         WLAST_MI_xhdl24 <= '0';    
         WVALID_MI_xhdl25 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         WID_MI_xhdl21 <= (OTHERS => '0');    
         WDATA_MI_xhdl22 <= (OTHERS => '0');    
         WSTRB_MI_xhdl23 <= (OTHERS => '0');    
         WLAST_MI_xhdl24 <= '0';    
         WVALID_MI_xhdl25 <= '0';    
      ELSE 
         IF ((WREADY_M_xhdl2 AND WVALID_M) = '1') THEN
            WID_MI_xhdl21 <= (OTHERS => '0');    
            WLAST_MI_xhdl24 <= '0';    
            WVALID_MI_xhdl25 <= '0';    
         ELSE
            WVALID_MI_xhdl25 <= WVALID_M_pulse;    
            WID_MI_xhdl21 <= WID_M_INPFF1;    
            WDATA_MI_xhdl22 <= WDATA_M_INPFF1;    
            WSTRB_MI_xhdl23 <= WSTRB_M_INPFF1;    
            WLAST_MI_xhdl24 <= WLAST_M_INPFF1;    
         END IF;
      END IF;
      END IF;
   END PROCESS;

   L5: IF (OUT_REG_BUF = 1) GENERATE
   -- Pass Read response signals back to the master top
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         RVALID_M_pulse_r <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         RVALID_M_pulse_r <= '0';    
      ELSE 
         RVALID_M_pulse_r <= RVALID_M_pulse;    
      END IF;
      END IF;
   END PROCESS;

   -- Pass Read response signals back to the master top
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         RID_M_xhdl7 <= (OTHERS => '0');    
         RVALID_M_xhdl11 <= '0';    
         RRESP_M_xhdl9 <= (OTHERS => '0');    
         RDATA_M_xhdl8 <= (OTHERS => '0');    
         RLAST_M_xhdl10 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         RID_M_xhdl7 <= (OTHERS => '0');    
         RVALID_M_xhdl11 <= '0';    
         RRESP_M_xhdl9 <= (OTHERS => '0');    
         RDATA_M_xhdl8 <= (OTHERS => '0');    
         RLAST_M_xhdl10 <= '0';    
      ELSE 
         IF ((RVALID_M_xhdl11 AND RREADY_M) = '1') THEN
            RID_M_xhdl7 <= (OTHERS => '0');    
            RVALID_M_xhdl11 <= '0';    
            RRESP_M_xhdl9 <= (OTHERS => '0');    
            RDATA_M_xhdl8 <= (OTHERS => '0');    
            RLAST_M_xhdl10 <= '0';    
         ELSE
            IF (RID_M_int(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH-2) = 
            UID_WIDTH) THEN
               RID_M_xhdl7 <= ARID_msb_lat & RID_M_int(1 DOWNTO 0);    
               RVALID_M_xhdl11 <= RVALID_M_int;    
               RRESP_M_xhdl9 <= RRESP_M_int;    
               RDATA_M_xhdl8 <= RDATA_M_int;    
               RLAST_M_xhdl10 <= RLAST_M_int;    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   -- Pass Read response signals back to the master top
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         RID_M_int <= (OTHERS => '0');    
         RVALID_M_int <= '0';    
         RRESP_M_int <= (OTHERS => '0');     
         RDATA_M_int <= (OTHERS => '0');    
         RLAST_M_int <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         RID_M_int <= (OTHERS => '0');    
         RVALID_M_int <= '0';    
         RRESP_M_int <= (OTHERS => '0');     
         RDATA_M_int <= (OTHERS => '0');    
         RLAST_M_int <= '0';    
      ELSE 
         IF ((RVALID_M_xhdl11 AND RREADY_M) = '1') THEN
            RID_M_int <= (OTHERS => '0');    
            RVALID_M_int <= '0';    
            RRESP_M_int <= (OTHERS => '0');    
            RDATA_M_int <= (OTHERS => '0');    
            RLAST_M_int <= '0';    
         ELSE
            IF (RID_IM(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH-2) = 
            UID_WIDTH) THEN
               RID_M_int <= RID_IM;    
               RVALID_M_int <= RVALID_IM;    
               RRESP_M_int <= RRESP_IM;    
               RDATA_M_int <= RDATA_IM;    
               RLAST_M_int <= RLAST_IM;    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         BID_M_xhdl3 <= (OTHERS => '0');    
         BVALID_M_xhdl5 <= '0';    
         BRESP_M_xhdl4 <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         BID_M_xhdl3 <= (OTHERS => '0');    
         BVALID_M_xhdl5 <= '0';    
         BRESP_M_xhdl4 <= (OTHERS => '0');    
      ELSE 
         IF ((BVALID_M_xhdl5 AND BREADY_M) = '1') THEN
            BID_M_xhdl3 <= (OTHERS => '0');    
            BVALID_M_xhdl5 <= '0';    
            BRESP_M_xhdl4 <= (OTHERS => '0');    
         ELSE 
            BVALID_M_xhdl5 <= BVALID_M_pulse;    
            BID_M_xhdl3 <= AWID_msb_lat & BID_M_pulse(1 DOWNTO 0);    
            BRESP_M_xhdl4 <= BRESP_M_pulse;    
         END IF;
      END IF;
      END IF;
   END PROCESS;

   END GENERATE L5;

   L6: IF (OUT_REG_BUF = 0) GENERATE
   -- Pass Read response signals back to the master top
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         RID_M_xhdl7 <= (OTHERS => '0');    
         RVALID_M_xhdl11 <= '0';    
         RRESP_M_xhdl9 <= (OTHERS => '0');    
         RDATA_M_xhdl8 <= (OTHERS => '0');    
         RLAST_M_xhdl10 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         RID_M_xhdl7 <= (OTHERS => '0');    
         RVALID_M_xhdl11 <= '0';    
         RRESP_M_xhdl9 <= (OTHERS => '0');    
         RDATA_M_xhdl8 <= (OTHERS => '0');    
         RLAST_M_xhdl10 <= '0';    
      ELSE 
         IF ((RVALID_M_xhdl11 AND RREADY_M) = '1') THEN
            RID_M_xhdl7 <= (OTHERS => '0');    
            RVALID_M_xhdl11 <= '0';    
            RRESP_M_xhdl9 <= (OTHERS => '0');    
            RDATA_M_xhdl8 <= (OTHERS => '0');    
            RLAST_M_xhdl10 <= '0';    
         ELSE
            IF (RID_IM(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH-2) = 
            UID_WIDTH) THEN
               RID_M_xhdl7 <= ARID_msb_lat & RID_IM(1 DOWNTO 0);    
               RVALID_M_xhdl11 <= RVALID_IM;    
               RRESP_M_xhdl9 <= RRESP_IM;    
               RDATA_M_xhdl8 <= RDATA_IM;    
               RLAST_M_xhdl10 <= RLAST_IM;    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   -- Pass Write response signals back to the master top
   
   PROCESS (RID_M_int, WVALID_M, RVALID_M_int, 
   RVALID_M_xhdl11, WLAST_M_INPFF1, RLAST_IM, WSTRB_M_INPFF1, RDATA_IM, 
   BREADY_M, RREADY_M, BVALID_M_xhdl5, RLAST_M_int, WDATA_M_INPFF1,  
   BVALID_M_pulse, RVALID_IM, RVALID_M_pulse, RRESP_M_int,  
   RID_IM, BID_M_pulse, WVALID_M_pulse, RRESP_IM, BRESP_M_pulse, 
   WREADY_M_xhdl2, RDATA_M_int, WID_M_INPFF1)
      VARIABLE BVALID_M_xhdl5_xhdl67  : std_logic;
      VARIABLE BID_M_xhdl3_xhdl68  : std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
      VARIABLE BRESP_M_xhdl4_xhdl69  : std_logic_vector(1 DOWNTO 0);
   BEGIN
      BVALID_M_xhdl5_xhdl67 := BVALID_M_pulse;    
      BID_M_xhdl3_xhdl68 := AWID_msb_lat & BID_M_pulse(1 DOWNTO 0);    
      BRESP_M_xhdl4_xhdl69 := BRESP_M_pulse;    
      BVALID_M_xhdl5 <= BVALID_M_xhdl5_xhdl67;
      BID_M_xhdl3 <= BID_M_xhdl3_xhdl68;
      BRESP_M_xhdl4 <= BRESP_M_xhdl4_xhdl69;
   END PROCESS;

   --     end // if (OUT_REG_BUF == 1'b0)      
   --  endgenerate
   END GENERATE L6;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         ARID_msb_lat <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         ARID_msb_lat <= (OTHERS => '0');    
      ELSE 
         IF ((ARVALID_MI_xhdl35 AND ARREADY_M_xhdl6) = '1') THEN
           ARID_msb_lat <= ARID_M(3 DOWNTO 2);
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         AWID_msb_lat <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         AWID_msb_lat <= (OTHERS => '0');
      ELSE 
         IF ((AWVALID_MI_xhdl20 AND AWREADY_M_xhdl1) = '1') THEN
           AWID_msb_lat <= AWID_M(3 DOWNTO 2);
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         BID_M_r <= (OTHERS => '0');    
         BVALID_M_r <= '0';    
         BRESP_M_r <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         BID_M_r <= (OTHERS => '0');    
         BVALID_M_r <= '0';    
         BRESP_M_r <= (OTHERS => '0');
      ELSE 
         BID_M_r <= BID_M_xhdl3;    
         BVALID_M_r <= BVALID_M_xhdl5;    
         BRESP_M_r <= BRESP_M_xhdl4;    
      END IF;
      END IF;
   END PROCESS;
   ---------------------------------------------------------------
   -- Generate output to the arbiter to enable
   -- This enables the arbiter to end the grant given to 
   -- the current master
   ---------------------------------------------------------------
   master_rd_end_xhdl38 <= mst_rd_end ;
   master_wr_end_xhdl37 <= mst_wr_end ;
   -----------------------------------------------------------------------------
   -- ID Calculations
   -----------------------------------------------------------------------------
   -- Write address channel ID assignment towards the Interconnect
   AWID_int <= AWID_M(3 DOWNTO 2) & UID_WIDTH & AWID_M(1 DOWNTO 0) ;
   -- Read address channel ID assignment towards the Interconnect
   ARID_int <= ARID_M(3 DOWNTO 2) & UID_WIDTH & ARID_M(1 DOWNTO 0) ;
   -- Write data channel ID assignment towards the Interconnect
   WID_int <= WID_M(3 DOWNTO 2) & UID_WIDTH & WID_M(1 DOWNTO 0) ;
   temp_xhdl70 <= "0001" WHEN (RD_ACCEPTANCE = 1) ELSE "0001";
   temp_xhdl71 <= "0010" WHEN (RD_ACCEPTANCE = 2) ELSE (temp_xhdl70);
   temp_xhdl72 <= "0011" WHEN (RD_ACCEPTANCE = 3) ELSE (temp_xhdl71);
   temp_xhdl73 <= "0100" WHEN (RD_ACCEPTANCE = 4) ELSE (temp_xhdl72);
   rd_acceptance_limit <= temp_xhdl73 ;

    PROCESS (ACLK, areset_n)
    BEGIN
      IF (NOT areset_n = '1') THEN
          add_rdtran <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
          add_rdtran <= '0';
      ELSE 
 	    IF (add_rdtran = '1') THEN
             add_rdtran <= '0';    
        ELSIF (RLAST_M_xhdl10 = '1' AND RVALID_M_xhdl11 = '1' AND RREADY_M = '1' AND ARVALID_M = '1' AND ARREADY_M_xhdl6 = '1') THEN
              add_rdtran <= '1';    
        END IF;
      END IF;
      END IF;
     END PROCESS;

    PROCESS (ACLK, areset_n)
    BEGIN
       IF (NOT areset_n = '1') THEN
          rd_wdcntr <= (OTHERS => '0');
          rd_wen_flag <= '0';    
       ELSIF (ACLK'EVENT AND ACLK = '1') THEN
       IF (NOT sresetn = '1') THEN
          rd_wdcntr <= (OTHERS => '0');
          rd_wen_flag <= '0';     
       ELSE 
          IF ((RLAST_M_xhdl10 = '1' AND RVALID_M_xhdl11 = '1' AND RREADY_M = '1' AND ARVALID_M = '1' AND ARREADY_M_xhdl6 = '1')) THEN
             rd_wdcntr <= rd_wdcntr;
          ELSIF ((RLAST_M_xhdl10 = '1' AND RVALID_M_xhdl11 = '1' AND RREADY_M = '1') ) THEN
             rd_wdcntr <= rd_wdcntr - "0001";
          ELSIF ((ARVALID_M = '1' AND ARREADY_M_xhdl6 = '1' AND NOT(rd_wdcntr = rd_acceptance_limit) AND stall_trans = '0' AND stall_trans_rd = '0')) THEN
                rd_wdcntr <= rd_wdcntr + "0001";
                rd_wen_flag <= '1';    
          END IF;
       END IF;
       END IF;
    END PROCESS;

    PROCESS (ACLK, areset_n)
    BEGIN
       IF (NOT areset_n = '1') THEN
          rd_rdcntr <= (OTHERS=> '0');
          rd_ren_flag <= '0';    
       ELSIF (ACLK'EVENT AND ACLK = '1') THEN
       IF (NOT sresetn = '1') THEN
          rd_rdcntr <= (OTHERS=> '0');
          rd_ren_flag <= '0';     
       ELSE 
          rd_rdcntr <= (OTHERS => '0');
          rd_ren_flag <= '0';    
       END IF;
       END IF;
    END PROCESS;


   -- Cyclic dependency scheme for read addresses
   -- Slave scheme is employed in this module. This scheme prevents a deadlock 
   -- prevention scheme in an interconnect that is connected to a slave that
   -- reorders the read data.
   -- This scheme accepts or stalls new transactions based on the following rules:
   --   - A master can initiate a transaction to any slave if the master has no
   -- outstanding transactions.
   --   - If master does have outstanding transactions then:
   --     a master can initiate a transaction to same slave as the current
   -- outstanding transaction.
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         stall_trans <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         stall_trans <= '0';    
      ELSE 
         IF ((ARVALID_M = '1' AND prev_ARADDR(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH 
         - 4) /= ARADDR_M(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4)) AND 
         rdtrans_inprog = '1') THEN
            stall_trans <= '1';    
         ELSE
            stall_trans <= '0';    
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (prev_ARADDR, AWID_M, ARADDR_M, rdtrans_inprog, ARVALID_M,
   RVALID_M_xhdl11, rd_wdcntr, rd_rdcntr, ARID_M, RREADY_M, 
   ARREADY_M_xhdl6, BVALID_M_xhdl5, BID_M_xhdl3, mst_rd_end, 
   mst_wr_end, BRESP_M_xhdl4, rd_acceptance_limit, 
   RLAST_M_xhdl10, WID_M)
      VARIABLE stall_trans_rd_xhdl74  : std_logic;
   BEGIN
      IF ((rdtrans_inprog AND CONV_STD_LOGIC(prev_ARADDR(AXI_AWIDTH - 1 DOWNTO 
      AXI_AWIDTH - 4) /= ARADDR_M(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4))) = '1')
      THEN
         stall_trans_rd_xhdl74 := '1';    
      ELSE
         stall_trans_rd_xhdl74 := '0';    
      END IF;
      stall_trans_rd <= stall_trans_rd_xhdl74;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         rdtrans_inprog <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         rdtrans_inprog <= '0';    
      ELSE 
         IF ((((RVALID_M_xhdl11 AND RREADY_M) AND RLAST_M_xhdl10) AND 
         CONV_STD_LOGIC((rd_wdcntr - (rd_rdcntr + "0001")) = "0000")) = '1') 
         THEN
            rdtrans_inprog <= '0';    
         ELSE
            IF (((ARVALID_M AND ARREADY_M_xhdl6) = '1') OR (add_rdtran = '1')) THEN
               rdtrans_inprog <= '1';    
            END IF;
         END IF;
       END IF;
      END IF;
   END PROCESS;
   -- ***************************************************************************   

END translated;
