-- ****************************************************************************/
-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description: wrmatrix_4Mto1S.v
--              
--              Contains:
--                       - Arbiter
--                       - 
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

ENTITY axi_wrmatrix_4Mto1S_hgs_low IS
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
      BASE_ID_WIDTH                  :  integer := 0;    
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
      RD_ACCEPTANCE                  :  integer := 4);    --  1 - 4
   PORT (
      -- --------------------------------------------------------------------------
-- I/O Declaration
-- --------------------------------------------------------------------------
-- Global signals

      ACLK                    : IN std_logic;   
      ARESETN                 : IN std_logic;   
      AWADDR_M0               : IN std_logic_vector(31 DOWNTO 0);   
      AWVALID_M0              : IN std_logic;   
      AWLOCK_M0               : IN std_logic_vector(1 DOWNTO 0);   
      AWADDR_M1               : IN std_logic_vector(31 DOWNTO 0);   
      AWVALID_M1              : IN std_logic;   
      AWLOCK_M1               : IN std_logic_vector(1 DOWNTO 0);   
      AWADDR_M2               : IN std_logic_vector(31 DOWNTO 0);   
      AWVALID_M2              : IN std_logic;   
      AWLOCK_M2               : IN std_logic_vector(1 DOWNTO 0);   
      AWADDR_M3               : IN std_logic_vector(31 DOWNTO 0);   
      AWVALID_M3              : IN std_logic;   
      AWLOCK_M3               : IN std_logic_vector(1 DOWNTO 0);   
      -- For Arbiter from Masters
-- To end grant to current master

      m0_wr_end               : IN std_logic;   
      m1_wr_end               : IN std_logic;   
      m2_wr_end               : IN std_logic;   
      m3_wr_end               : IN std_logic;   
      -- AXI MASTER write address channel signals

      AWREADY_SI              : IN std_logic;   
      BVALID_SI               : IN std_logic;   
      BREADY_IS               : IN std_logic;   
      -- From Master 0
-- AXI write address channel signals

      AWID_MI0                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_MI0              : IN std_logic_vector(31 DOWNTO 0);   
      AWLEN_MI0               : IN std_logic_vector(3 DOWNTO 0);   
      AWSIZE_MI0              : IN std_logic_vector(2 DOWNTO 0);   
      AWBURST_MI0             : IN std_logic_vector(1 DOWNTO 0);   
      AWLOCK_MI0              : IN std_logic_vector(1 DOWNTO 0);   
      AWCACHE_MI0             : IN std_logic_vector(3 DOWNTO 0);   
      AWPROT_MI0              : IN std_logic_vector(2 DOWNTO 0);   
      AWVALID_MI0             : IN std_logic;   
      AWREADY_IM0             : OUT std_logic;   
      -- From Master 1
-- AXI write address channel signals

      AWID_MI1                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_MI1              : IN std_logic_vector(31 DOWNTO 0);   
      AWLEN_MI1               : IN std_logic_vector(3 DOWNTO 0);   
      AWSIZE_MI1              : IN std_logic_vector(2 DOWNTO 0);   
      AWBURST_MI1             : IN std_logic_vector(1 DOWNTO 0);   
      AWLOCK_MI1              : IN std_logic_vector(1 DOWNTO 0);   
      AWCACHE_MI1             : IN std_logic_vector(3 DOWNTO 0);   
      AWPROT_MI1              : IN std_logic_vector(2 DOWNTO 0);   
      AWVALID_MI1             : IN std_logic;   
      AWREADY_IM1             : OUT std_logic;   
      -- From Master 2
-- AXI write address channel signals

      AWID_MI2                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_MI2              : IN std_logic_vector(31 DOWNTO 0);   
      AWLEN_MI2               : IN std_logic_vector(3 DOWNTO 0);   
      AWSIZE_MI2              : IN std_logic_vector(2 DOWNTO 0);   
      AWBURST_MI2             : IN std_logic_vector(1 DOWNTO 0);   
      AWLOCK_MI2              : IN std_logic_vector(1 DOWNTO 0);   
      AWCACHE_MI2             : IN std_logic_vector(3 DOWNTO 0);   
      AWPROT_MI2              : IN std_logic_vector(2 DOWNTO 0);   
      AWVALID_MI2             : IN std_logic;   
      AWREADY_IM2             : OUT std_logic;   
      -- From Master 3
-- AXI write address channel signals

      AWID_MI3                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_MI3              : IN std_logic_vector(31 DOWNTO 0);   
      AWLEN_MI3               : IN std_logic_vector(3 DOWNTO 0);   
      AWSIZE_MI3              : IN std_logic_vector(2 DOWNTO 0);   
      AWBURST_MI3             : IN std_logic_vector(1 DOWNTO 0);   
      AWLOCK_MI3              : IN std_logic_vector(1 DOWNTO 0);   
      AWCACHE_MI3             : IN std_logic_vector(3 DOWNTO 0);   
      AWPROT_MI3              : IN std_logic_vector(2 DOWNTO 0);   
      AWVALID_MI3             : IN std_logic;   
      AWREADY_IM3             : OUT std_logic;   
      -- SLAVE 0
-- AXI SLAVE 0 write address channel signals

      AWID_IS                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_IS               : OUT std_logic_vector(31 DOWNTO 0);   
      AWADDR_IS_int           : OUT std_logic_vector(31 DOWNTO 0);   
      AWLEN_IS                : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS               : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS              : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS               : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS              : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS               : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS              : OUT std_logic;   
      MST_WRGNT_NUM           : OUT std_logic_vector(3 DOWNTO 0);   
      SLAVE_SELECT_WADDRCH_M  : OUT std_logic_vector(16 DOWNTO 0);   
      SLAVE_NUMBER            : IN std_logic_vector(4 DOWNTO 0));   
END ENTITY axi_wrmatrix_4Mto1S_hgs_low;

ARCHITECTURE translated OF axi_wrmatrix_4Mto1S_hgs_low IS


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
COMPONENT axi_WA_ARBITER
      GENERIC (
         --------------------------------------------------------------------------
         -- Parameter Declaration
         --------------------------------------------------------------------------
         SYNC_RESET                     :  integer := 0;    
         AXI_AWIDTH                     :  integer := 32;    
         AXI_DWIDTH                     :  integer := 64;    
         AXI_STRBWIDTH                  :  integer := 8;    
         INP_REG_BUF                    :  integer := 1;
         OUT_REG_BUF                    :  integer := 1;
         NUM_MASTER_SLOT                :  integer := 1);    
      PORT (
         --------------------------------------------------------------------------
-- Global signals
--------------------------------------------------------------------------

         ACLK                    : IN std_logic;   
         ARESETN                 : IN std_logic;   
         -- MASTER 0

         AWLOCK_M0               : IN std_logic_vector(1 DOWNTO 0);   
         -- MASTER 1

         AWLOCK_M1               : IN std_logic_vector(1 DOWNTO 0);   
         -- MASTER 2

         AWLOCK_M2               : IN std_logic_vector(1 DOWNTO 0);   
         -- MASTER 3

         AWLOCK_M3               : IN std_logic_vector(1 DOWNTO 0);   
         AWLOCK_MI0               : IN std_logic_vector(1 DOWNTO 0);   
         AWLOCK_MI1               : IN std_logic_vector(1 DOWNTO 0);   
         AWLOCK_MI2               : IN std_logic_vector(1 DOWNTO 0);   
         AWLOCK_MI3               : IN std_logic_vector(1 DOWNTO 0);   
         m0_wr_end               : IN std_logic;   
         m1_wr_end               : IN std_logic;   
         m2_wr_end               : IN std_logic;   
         m3_wr_end               : IN std_logic;   
         -- AXI MASTER 0 

         AW_REQ_MI0              : IN std_logic;   
         -- AXI MASTER 1 

         AW_REQ_MI1              : IN std_logic;   
         -- AXI MASTER 2 

         AW_REQ_MI2              : IN std_logic;   
         -- AXI MASTER 3 

         AW_REQ_MI3              : IN std_logic;   
         AW_MASGNT_MI            : OUT std_logic_vector(3 DOWNTO 0));
   END COMPONENT;
   -- --------------------------------------------------------------------------
   -- Internal signals
   -- --------------------------------------------------------------------------
   SIGNAL SLAVE_SELECT_WADDRCH_M_r :  std_logic_vector(16 DOWNTO 0);   
   SIGNAL AWID_IS_int              :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWLEN_IS_int             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS_int            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS_int           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS_int            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS_int           :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS_int            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS_int           :  std_logic;   
   -- For Arbiter from Masters
   SIGNAL AWREADY_SI_int           :  std_logic;   
   SIGNAL wr_rdcntr                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL wr_wdcntr                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL wr_wen_flag              :  std_logic;   
   SIGNAL wr_ren_flag              :  std_logic;   
   SIGNAL AW_REQ_MI                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL SLAVE_SELECT_WRITE_M0    :  std_logic_vector(16 DOWNTO 0);   
   SIGNAL SLAVE_SELECT_WRITE_M1    :  std_logic_vector(16 DOWNTO 0);   
   SIGNAL SLAVE_SELECT_WRITE_M2    :  std_logic_vector(16 DOWNTO 0);   
   SIGNAL SLAVE_SELECT_WRITE_M3    :  std_logic_vector(16 DOWNTO 0);   
   SIGNAL mst0_wr_end              :  std_logic;   
   SIGNAL mst0_outstd_wrcntr       :  std_logic_vector(WR_ACCEPTANCE - 1 DOWNTO 
   0);   
   SIGNAL mst0_wr_end_d1           :  std_logic;   
   SIGNAL mst1_wr_end              :  std_logic;   
   SIGNAL mst1_outstd_wrcntr       :  std_logic_vector(WR_ACCEPTANCE - 1 DOWNTO 
   0);   
   SIGNAL mst1_wr_end_d1           :  std_logic;   
   SIGNAL mst2_wr_end              :  std_logic;   
   SIGNAL mst2_outstd_wrcntr       :  std_logic_vector(WR_ACCEPTANCE - 1 DOWNTO 
   0);   
   SIGNAL mst2_wr_end_d1           :  std_logic;   
   SIGNAL mst3_wr_end              :  std_logic;   
   SIGNAL mst3_outstd_wrcntr       :  std_logic_vector(WR_ACCEPTANCE - 1 DOWNTO 
   0);   
   SIGNAL mst3_wr_end_d1           :  std_logic;   
   SIGNAL AW_MASGNT_IC             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AW_REQ_MI0               :  std_logic;   
   SIGNAL AW_REQ_MI1               :  std_logic;   
   SIGNAL AW_REQ_MI2               :  std_logic;   
   SIGNAL AW_REQ_MI3               :  std_logic;   
   SIGNAL AWREADY_IM0_xhdl1        :  std_logic;   
   SIGNAL AWREADY_IM1_xhdl2        :  std_logic;   
   SIGNAL AWREADY_IM2_xhdl3        :  std_logic;   
   SIGNAL AWREADY_IM3_xhdl4        :  std_logic;   
   SIGNAL AWID_IS_xhdl5            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS_xhdl6          :  std_logic_vector(31 DOWNTO 0);   
   SIGNAL AWADDR_IS_int_xhdl7      :  std_logic_vector(31 DOWNTO 0);   
   SIGNAL AWLEN_IS_xhdl8           :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS_xhdl9          :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS_xhdl10        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS_xhdl11         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS_xhdl12        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS_xhdl13         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS_xhdl14        :  std_logic;   
   SIGNAL SLAVE_SELECT_WADDRCH_M_xhdl15   :  std_logic_vector(16 DOWNTO 0);   
   SIGNAL MST_WRGNT_NUM_xhdl16     :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL areset_n                 :  std_logic;   
   SIGNAL sresetn                  :  std_logic;   

BEGIN
   --///////////////////////////////////////////////////////////////////////////
   --                               Start - of - Code                         //
   --///////////////////////////////////////////////////////////////////////////

   areset_n  <= '1' WHEN (SYNC_RESET = 1) ELSE ARESETN;
   sresetn   <= ARESETN WHEN (SYNC_RESET = 1) ELSE '1';

   AWREADY_IM0 <= AWREADY_IM0_xhdl1;
   AWREADY_IM1 <= AWREADY_IM1_xhdl2;
   AWREADY_IM2 <= AWREADY_IM2_xhdl3;
   AWREADY_IM3 <= AWREADY_IM3_xhdl4;
   AWID_IS <= AWID_IS_xhdl5;
   AWADDR_IS <= AWADDR_IS_xhdl6;
   AWADDR_IS_int <= AWADDR_IS_int_xhdl7;
   AWLEN_IS <= AWLEN_IS_xhdl8;
   AWSIZE_IS <= AWSIZE_IS_xhdl9;
   AWBURST_IS <= AWBURST_IS_xhdl10;
   AWLOCK_IS <= AWLOCK_IS_xhdl11;
   AWCACHE_IS <= AWCACHE_IS_xhdl12;
   AWPROT_IS <= AWPROT_IS_xhdl13;
   AWVALID_IS <= AWVALID_IS_xhdl14;
   SLAVE_SELECT_WADDRCH_M <= SLAVE_SELECT_WADDRCH_M_xhdl15;
   MST_WRGNT_NUM <= MST_WRGNT_NUM_xhdl16;
   
   -- -----------------------------------------------------
   -- Write Arbiter Instance
   -- -----------------------------------------------------
   UWA_ARBITER : axi_WA_ARBITER 
      GENERIC MAP (
         SYNC_RESET => SYNC_RESET,
         NUM_MASTER_SLOT => NUM_MASTER_SLOT,
         AXI_AWIDTH => AXI_AWIDTH,
         AXI_STRBWIDTH => AXI_STRBWIDTH,
         INP_REG_BUF => INP_REG_BUF,
         OUT_REG_BUF => OUT_REG_BUF,
         AXI_DWIDTH => AXI_DWIDTH)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWLOCK_M0 => AWLOCK_M0,
         AWLOCK_M1 => AWLOCK_M1,
         AWLOCK_M2 => AWLOCK_M2,
         AWLOCK_M3 => AWLOCK_M3,
         AWLOCK_MI0 => AWLOCK_MI0,
         AWLOCK_MI1 => AWLOCK_MI1,
         AWLOCK_MI2 => AWLOCK_MI2,
         AWLOCK_MI3 => AWLOCK_MI3,
         m0_wr_end => m0_wr_end,
         m1_wr_end => m1_wr_end,
         m2_wr_end => m2_wr_end,
         m3_wr_end => m3_wr_end,
         AW_REQ_MI0 => AW_REQ_MI0,
         AW_REQ_MI1 => AW_REQ_MI1,
         AW_REQ_MI2 => AW_REQ_MI2,
         AW_REQ_MI3 => AW_REQ_MI3,
         AW_MASGNT_MI => AW_MASGNT_IC);   
   

   -- --------------------------------------------------------------------------
   -- Register the write address control signals passing to the slave interface.
   -- The signals are passed only if it is meant for the intended slave. Otherwise
   -- it gets blocked. This is done by checking the slave number with the received
   -- write address.
   -- --------------------------------------------------------------------------
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         AWADDR_IS_xhdl6 <= (OTHERS => '0');    
         AWID_IS_xhdl5 <= (OTHERS => '0');    
         AWLEN_IS_xhdl8 <= (OTHERS => '0');    
         AWSIZE_IS_xhdl9 <= (OTHERS => '0');    
         AWBURST_IS_xhdl10 <= (OTHERS => '0');    
         AWLOCK_IS_xhdl11 <= (OTHERS => '0');    
         AWCACHE_IS_xhdl12 <= (OTHERS => '0');    
         AWPROT_IS_xhdl13 <= (OTHERS => '0');    
         AWVALID_IS_xhdl14 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         AWADDR_IS_xhdl6 <= (OTHERS => '0');    
         AWID_IS_xhdl5 <= (OTHERS => '0');    
         AWLEN_IS_xhdl8 <= (OTHERS => '0');    
         AWSIZE_IS_xhdl9 <= (OTHERS => '0');    
         AWBURST_IS_xhdl10 <= (OTHERS => '0');    
         AWLOCK_IS_xhdl11 <= (OTHERS => '0');    
         AWCACHE_IS_xhdl12 <= (OTHERS => '0');    
         AWPROT_IS_xhdl13 <= (OTHERS => '0');    
         AWVALID_IS_xhdl14 <= '0';    
      ELSE 
         IF ((AWADDR_IS_int_xhdl7(31) = '0' AND SLAVE_NUMBER = 
         AWADDR_IS_int_xhdl7(31 DOWNTO 28)) OR SLAVE_NUMBER(4) = '1') THEN
            AWADDR_IS_xhdl6 <= AWADDR_IS_int_xhdl7;    
            AWID_IS_xhdl5 <= AWID_IS_int;    
            AWLEN_IS_xhdl8 <= AWLEN_IS_int;    
            AWSIZE_IS_xhdl9 <= AWSIZE_IS_int;    
            AWBURST_IS_xhdl10 <= AWBURST_IS_int;    
            AWLOCK_IS_xhdl11 <= AWLOCK_IS_int;    
            AWCACHE_IS_xhdl12 <= AWCACHE_IS_int;    
            AWPROT_IS_xhdl13 <= AWPROT_IS_int;    
            AWVALID_IS_xhdl14 <= AWVALID_IS_int;    
         ELSE
            IF ((AWADDR_IS_int_xhdl7(31) = '1' AND SLAVE_NUMBER = 
            AWADDR_IS_int_xhdl7(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4)) OR 
            SLAVE_NUMBER(4) = '1') THEN
               AWADDR_IS_xhdl6 <= AWADDR_IS_int_xhdl7;    
               AWID_IS_xhdl5 <= AWID_IS_int;    
               AWLEN_IS_xhdl8 <= AWLEN_IS_int;    
               AWSIZE_IS_xhdl9 <= AWSIZE_IS_int;    
               AWBURST_IS_xhdl10 <= AWBURST_IS_int;    
               AWLOCK_IS_xhdl11 <= AWLOCK_IS_int;    
               AWCACHE_IS_xhdl12 <= AWCACHE_IS_int;    
               AWPROT_IS_xhdl13 <= AWPROT_IS_int;    
               AWVALID_IS_xhdl14 <= AWVALID_IS_int;    
            ELSE
               AWADDR_IS_xhdl6 <= AWADDR_IS_xhdl6;    
               AWID_IS_xhdl5 <= (OTHERS => '0');    
               AWLEN_IS_xhdl8 <= (OTHERS => '0');    
               AWSIZE_IS_xhdl9 <= (OTHERS => '0');    
               AWBURST_IS_xhdl10 <= (OTHERS => '0');    
               AWLOCK_IS_xhdl11 <= (OTHERS => '0');    
               AWCACHE_IS_xhdl12 <= (OTHERS => '0');    
               AWPROT_IS_xhdl13 <= (OTHERS => '0');    
               AWVALID_IS_xhdl14 <= '0';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   -- always @ (posedge ACLK or negedge ARESETN)
   -- --------------------------------------------------------------------------
   -- Select the Master signals based the grant provided by the arbiter
   -- The Write address channel signals are passed through from the master
   -- selected by the grant from the arbiter.
   -- The write address control signals are routed to the slave interface and
   -- the write address ready is sent back to the granted master.
   -- --------------------------------------------------------------------------

   L1: IF (NUM_MASTER_SLOT = 1) GENERATE
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         AWADDR_IS_int_xhdl7 <= (OTHERS => '0');    
         AWID_IS_int <= (OTHERS => '0');    
         AWLEN_IS_int <= (OTHERS => '0');    
         AWSIZE_IS_int <= (OTHERS => '0');    
         AWBURST_IS_int <= (OTHERS => '0');    
         AWLOCK_IS_int <= (OTHERS => '0');    
         AWCACHE_IS_int <= (OTHERS => '0');    
         AWPROT_IS_int <= (OTHERS => '0');    
         AWVALID_IS_int <= '0';    
         AWREADY_IM0_xhdl1 <= '0';    
         MST_WRGNT_NUM_xhdl16 <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         AWADDR_IS_int_xhdl7 <= (OTHERS => '0');    
         AWID_IS_int <= (OTHERS => '0');    
         AWLEN_IS_int <= (OTHERS => '0');    
         AWSIZE_IS_int <= (OTHERS => '0');    
         AWBURST_IS_int <= (OTHERS => '0');    
         AWLOCK_IS_int <= (OTHERS => '0');    
         AWCACHE_IS_int <= (OTHERS => '0');    
         AWPROT_IS_int <= (OTHERS => '0');    
         AWVALID_IS_int <= '0';    
         AWREADY_IM0_xhdl1 <= '0';    
         MST_WRGNT_NUM_xhdl16 <= (OTHERS => '0');    
      ELSE 
         CASE AW_MASGNT_IC IS
            WHEN "0001" =>
                     AWADDR_IS_int_xhdl7 <= AWADDR_MI0;    
                     AWID_IS_int <= AWID_MI0;    
                     AWLEN_IS_int <= AWLEN_MI0;    
                     AWSIZE_IS_int <= AWSIZE_MI0;    
                     AWBURST_IS_int <= AWBURST_MI0;    
                     AWLOCK_IS_int <= AWLOCK_MI0;    
                     AWCACHE_IS_int <= AWCACHE_MI0;    
                     AWPROT_IS_int <= AWPROT_MI0;    
                     AWVALID_IS_int <= AWVALID_MI0;    
                     AWREADY_IM0_xhdl1 <= AWREADY_SI;    
                     MST_WRGNT_NUM_xhdl16 <= "0001";    
		
            WHEN OTHERS  =>
                     AWID_IS_int <= (OTHERS => '0');    
                     AWLEN_IS_int <= (OTHERS => '0');    
                     AWSIZE_IS_int <= (OTHERS => '0');    
                     AWBURST_IS_int <= (OTHERS => '0');    
                     AWLOCK_IS_int <= (OTHERS => '0');    
                     AWCACHE_IS_int <= (OTHERS => '0');    
                     AWPROT_IS_int <= (OTHERS => '0');    
                     AWVALID_IS_int <= '0';    
                     AWREADY_IM0_xhdl1 <= '0';    
                     MST_WRGNT_NUM_xhdl16 <= (OTHERS => '0');    
            
         END CASE;
         -- case (AW_MASGNT_IC)
         
      END IF;
      END IF;
   END PROCESS;

   END GENERATE L1;

   L2: IF (NUM_MASTER_SLOT = 2) GENERATE
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         AWADDR_IS_int_xhdl7 <= (OTHERS => '0');    
         AWID_IS_int <= (OTHERS => '0');    
         AWLEN_IS_int <= (OTHERS => '0');    
         AWSIZE_IS_int <= (OTHERS => '0');    
         AWBURST_IS_int <= (OTHERS => '0');    
         AWLOCK_IS_int <= (OTHERS => '0');    
         AWCACHE_IS_int <= (OTHERS => '0');    
         AWPROT_IS_int <= (OTHERS => '0');    
         AWVALID_IS_int <= '0';    
         AWREADY_IM0_xhdl1 <= '0';    
         AWREADY_IM1_xhdl2 <= '0';    
         MST_WRGNT_NUM_xhdl16 <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         AWADDR_IS_int_xhdl7 <= (OTHERS => '0');    
         AWID_IS_int <= (OTHERS => '0');    
         AWLEN_IS_int <= (OTHERS => '0');    
         AWSIZE_IS_int <= (OTHERS => '0');    
         AWBURST_IS_int <= (OTHERS => '0');    
         AWLOCK_IS_int <= (OTHERS => '0');    
         AWCACHE_IS_int <= (OTHERS => '0');    
         AWPROT_IS_int <= (OTHERS => '0');    
         AWVALID_IS_int <= '0';    
         AWREADY_IM0_xhdl1 <= '0';    
         AWREADY_IM1_xhdl2 <= '0';    
         MST_WRGNT_NUM_xhdl16 <= (OTHERS => '0');    
      ELSE 
         CASE AW_MASGNT_IC IS
            WHEN "0001" =>
                     AWADDR_IS_int_xhdl7 <= AWADDR_MI0;    
                     AWID_IS_int <= AWID_MI0;    
                     AWLEN_IS_int <= AWLEN_MI0;    
                     AWSIZE_IS_int <= AWSIZE_MI0;    
                     AWBURST_IS_int <= AWBURST_MI0;    
                     AWLOCK_IS_int <= AWLOCK_MI0;    
                     AWCACHE_IS_int <= AWCACHE_MI0;    
                     AWPROT_IS_int <= AWPROT_MI0;    
                     AWVALID_IS_int <= AWVALID_MI0;    
                     AWREADY_IM0_xhdl1 <= AWREADY_SI;    
                     AWREADY_IM1_xhdl2 <= '0';    
                     MST_WRGNT_NUM_xhdl16 <= "0001";    
            WHEN "0010" =>
                     AWADDR_IS_int_xhdl7 <= AWADDR_MI1;    
                     AWID_IS_int <= AWID_MI1;    
                     AWLEN_IS_int <= AWLEN_MI1;    
                     AWSIZE_IS_int <= AWSIZE_MI1;    
                     AWBURST_IS_int <= AWBURST_MI1;    
                     AWLOCK_IS_int <= AWLOCK_MI1;    
                     AWCACHE_IS_int <= AWCACHE_MI1;    
                     AWPROT_IS_int <= AWPROT_MI1;    
                     AWVALID_IS_int <= AWVALID_MI1;    
                     AWREADY_IM1_xhdl2 <= AWREADY_SI;    
                     AWREADY_IM0_xhdl1 <= '0';    
                     MST_WRGNT_NUM_xhdl16 <= "0010";    
            WHEN OTHERS  =>
                     AWID_IS_int <= (OTHERS => '0');    
                     AWLEN_IS_int <= (OTHERS => '0');    
                     AWSIZE_IS_int <= (OTHERS => '0');    
                     AWBURST_IS_int <= (OTHERS => '0');    
                     AWLOCK_IS_int <= (OTHERS => '0');    
                     AWCACHE_IS_int <= (OTHERS => '0');    
                     AWPROT_IS_int <= (OTHERS => '0');    
                     AWVALID_IS_int <= '0';    
                     AWREADY_IM0_xhdl1 <= '0';    
                     AWREADY_IM1_xhdl2 <= '0';    
                     MST_WRGNT_NUM_xhdl16 <= (OTHERS => '0');    
            
         END CASE;
         -- case (AW_MASGNT_IC)       
         
      END IF;
      END IF;
   END PROCESS;

   END GENERATE L2;

   L3: IF (NUM_MASTER_SLOT = 3) GENERATE
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         AWADDR_IS_int_xhdl7 <= (OTHERS => '0');    
         AWID_IS_int <= (OTHERS => '0');    
         AWLEN_IS_int <= (OTHERS => '0');    
         AWSIZE_IS_int <= (OTHERS => '0');    
         AWBURST_IS_int <= (OTHERS => '0');    
         AWLOCK_IS_int <= (OTHERS => '0');    
         AWCACHE_IS_int <= (OTHERS => '0');    
         AWPROT_IS_int <= (OTHERS => '0');    
         AWVALID_IS_int <= '0';    
         AWREADY_IM0_xhdl1 <= '0';    
         AWREADY_IM1_xhdl2 <= '0';    
         AWREADY_IM2_xhdl3 <= '0';    
         MST_WRGNT_NUM_xhdl16 <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         AWADDR_IS_int_xhdl7 <= (OTHERS => '0');    
         AWID_IS_int <= (OTHERS => '0');    
         AWLEN_IS_int <= (OTHERS => '0');    
         AWSIZE_IS_int <= (OTHERS => '0');    
         AWBURST_IS_int <= (OTHERS => '0');    
         AWLOCK_IS_int <= (OTHERS => '0');    
         AWCACHE_IS_int <= (OTHERS => '0');    
         AWPROT_IS_int <= (OTHERS => '0');    
         AWVALID_IS_int <= '0';    
         AWREADY_IM0_xhdl1 <= '0';    
         AWREADY_IM1_xhdl2 <= '0';    
         AWREADY_IM2_xhdl3 <= '0';    
         MST_WRGNT_NUM_xhdl16 <= (OTHERS => '0');    
      ELSE 
         CASE AW_MASGNT_IC IS
            WHEN "0001" =>
                     AWADDR_IS_int_xhdl7 <= AWADDR_MI0;    
                     AWID_IS_int <= AWID_MI0;    
                     AWLEN_IS_int <= AWLEN_MI0;    
                     AWSIZE_IS_int <= AWSIZE_MI0;    
                     AWBURST_IS_int <= AWBURST_MI0;    
                     AWLOCK_IS_int <= AWLOCK_MI0;    
                     AWCACHE_IS_int <= AWCACHE_MI0;    
                     AWPROT_IS_int <= AWPROT_MI0;    
                     AWVALID_IS_int <= AWVALID_MI0;    
                     AWREADY_IM0_xhdl1 <= AWREADY_SI;    
                     AWREADY_IM1_xhdl2 <= '0';    
                     AWREADY_IM2_xhdl3 <= '0';    
                     MST_WRGNT_NUM_xhdl16 <= "0001";    
            WHEN "0010" =>
                     AWADDR_IS_int_xhdl7 <= AWADDR_MI1;    
                     AWID_IS_int <= AWID_MI1;    
                     AWLEN_IS_int <= AWLEN_MI1;    
                     AWSIZE_IS_int <= AWSIZE_MI1;    
                     AWBURST_IS_int <= AWBURST_MI1;    
                     AWLOCK_IS_int <= AWLOCK_MI1;    
                     AWCACHE_IS_int <= AWCACHE_MI1;    
                     AWPROT_IS_int <= AWPROT_MI1;    
                     AWVALID_IS_int <= AWVALID_MI1;    
                     AWREADY_IM1_xhdl2 <= AWREADY_SI;    
                     AWREADY_IM0_xhdl1 <= '0';    
                     AWREADY_IM2_xhdl3 <= '0';    
                     MST_WRGNT_NUM_xhdl16 <= "0010";    
            WHEN "0100" =>
                     AWADDR_IS_int_xhdl7 <= AWADDR_MI2;    
                     AWID_IS_int <= AWID_MI2;    
                     AWLEN_IS_int <= AWLEN_MI2;    
                     AWSIZE_IS_int <= AWSIZE_MI2;    
                     AWBURST_IS_int <= AWBURST_MI2;    
                     AWLOCK_IS_int <= AWLOCK_MI2;    
                     AWCACHE_IS_int <= AWCACHE_MI2;    
                     AWPROT_IS_int <= AWPROT_MI2;    
                     AWVALID_IS_int <= AWVALID_MI2;    
                     AWREADY_IM2_xhdl3 <= AWREADY_SI;    
                     AWREADY_IM0_xhdl1 <= '0';    
                     AWREADY_IM1_xhdl2 <= '0';    
                     MST_WRGNT_NUM_xhdl16 <= "0100";    
            WHEN OTHERS  =>
                     AWID_IS_int <= (OTHERS => '0');    
                     AWLEN_IS_int <= (OTHERS => '0');    
                     AWSIZE_IS_int <= (OTHERS => '0');    
                     AWBURST_IS_int <= (OTHERS => '0');    
                     AWLOCK_IS_int <= (OTHERS => '0');    
                     AWCACHE_IS_int <= (OTHERS => '0');    
                     AWPROT_IS_int <= (OTHERS => '0');    
                     AWVALID_IS_int <= '0';    
                     AWREADY_IM0_xhdl1 <= '0';    
                     AWREADY_IM1_xhdl2 <= '0';    
                     AWREADY_IM2_xhdl3 <= '0';    
                     MST_WRGNT_NUM_xhdl16 <= (OTHERS => '0');    
            
         END CASE;
         -- case (AW_MASGNT_IC)       
         
      END IF;
      END IF;
      
   END PROCESS;

   END GENERATE L3;

   L4: IF (NUM_MASTER_SLOT = 4) GENERATE
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         AWADDR_IS_int_xhdl7 <= (OTHERS => '0');    
         AWID_IS_int <= (OTHERS => '0');    
         AWLEN_IS_int <= (OTHERS => '0');    
         AWSIZE_IS_int <= (OTHERS => '0');    
         AWBURST_IS_int <= (OTHERS => '0');    
         AWLOCK_IS_int <= (OTHERS => '0');    
         AWCACHE_IS_int <= (OTHERS => '0');    
         AWPROT_IS_int <= (OTHERS => '0');    
         AWVALID_IS_int <= '0';    
         AWREADY_IM0_xhdl1 <= '0';    
         AWREADY_IM1_xhdl2 <= '0';    
         AWREADY_IM2_xhdl3 <= '0';    
         AWREADY_IM3_xhdl4 <= '0';    
         MST_WRGNT_NUM_xhdl16 <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         AWADDR_IS_int_xhdl7 <= (OTHERS => '0');    
         AWID_IS_int <= (OTHERS => '0');    
         AWLEN_IS_int <= (OTHERS => '0');    
         AWSIZE_IS_int <= (OTHERS => '0');    
         AWBURST_IS_int <= (OTHERS => '0');    
         AWLOCK_IS_int <= (OTHERS => '0');    
         AWCACHE_IS_int <= (OTHERS => '0');    
         AWPROT_IS_int <= (OTHERS => '0');    
         AWVALID_IS_int <= '0';    
         AWREADY_IM0_xhdl1 <= '0';    
         AWREADY_IM1_xhdl2 <= '0';    
         AWREADY_IM2_xhdl3 <= '0';    
         AWREADY_IM3_xhdl4 <= '0';    
         MST_WRGNT_NUM_xhdl16 <= (OTHERS => '0');    
      ELSE 
         CASE AW_MASGNT_IC IS
            WHEN "0001" =>
                     AWADDR_IS_int_xhdl7 <= AWADDR_MI0;    
                     AWID_IS_int <= AWID_MI0;    
                     AWLEN_IS_int <= AWLEN_MI0;    
                     AWSIZE_IS_int <= AWSIZE_MI0;    
                     AWBURST_IS_int <= AWBURST_MI0;    
                     AWLOCK_IS_int <= AWLOCK_MI0;    
                     AWCACHE_IS_int <= AWCACHE_MI0;    
                     AWPROT_IS_int <= AWPROT_MI0;    
                     AWVALID_IS_int <= AWVALID_MI0;    
                     AWREADY_IM0_xhdl1 <= AWREADY_SI;    
                     AWREADY_IM1_xhdl2 <= '0';    
                     AWREADY_IM2_xhdl3 <= '0';    
                     AWREADY_IM3_xhdl4 <= '0';    
                     MST_WRGNT_NUM_xhdl16 <= "0001";    
            WHEN "0010" =>
                     AWADDR_IS_int_xhdl7 <= AWADDR_MI1;    
                     AWID_IS_int <= AWID_MI1;    
                     AWLEN_IS_int <= AWLEN_MI1;    
                     AWSIZE_IS_int <= AWSIZE_MI1;    
                     AWBURST_IS_int <= AWBURST_MI1;    
                     AWLOCK_IS_int <= AWLOCK_MI1;    
                     AWCACHE_IS_int <= AWCACHE_MI1;    
                     AWPROT_IS_int <= AWPROT_MI1;    
                     AWVALID_IS_int <= AWVALID_MI1;    
                     AWREADY_IM0_xhdl1 <= '0';    
                     AWREADY_IM1_xhdl2 <= AWREADY_SI;    
                     AWREADY_IM2_xhdl3 <= '0';    
                     AWREADY_IM3_xhdl4 <= '0';    
                     MST_WRGNT_NUM_xhdl16 <= "0010";    
            WHEN "0100" =>
                     AWADDR_IS_int_xhdl7 <= AWADDR_MI2;    
                     AWID_IS_int <= AWID_MI2;    
                     AWLEN_IS_int <= AWLEN_MI2;    
                     AWSIZE_IS_int <= AWSIZE_MI2;    
                     AWBURST_IS_int <= AWBURST_MI2;    
                     AWLOCK_IS_int <= AWLOCK_MI2;    
                     AWCACHE_IS_int <= AWCACHE_MI2;    
                     AWPROT_IS_int <= AWPROT_MI2;    
                     AWVALID_IS_int <= AWVALID_MI2;    
                     AWREADY_IM0_xhdl1 <= '0';    
                     AWREADY_IM1_xhdl2 <= '0';    
                     AWREADY_IM2_xhdl3 <= AWREADY_SI;    
                     AWREADY_IM3_xhdl4 <= '0';    
                     MST_WRGNT_NUM_xhdl16 <= "0100";    
            WHEN "1000" =>
                     AWADDR_IS_int_xhdl7 <= AWADDR_MI3;    
                     AWID_IS_int <= AWID_MI3;    
                     AWLEN_IS_int <= AWLEN_MI3;    
                     AWSIZE_IS_int <= AWSIZE_MI3;    
                     AWBURST_IS_int <= AWBURST_MI3;    
                     AWLOCK_IS_int <= AWLOCK_MI3;    
                     AWCACHE_IS_int <= AWCACHE_MI3;    
                     AWPROT_IS_int <= AWPROT_MI3;    
                     AWVALID_IS_int <= AWVALID_MI3;    
                     AWREADY_IM0_xhdl1 <= '0';    
                     AWREADY_IM1_xhdl2 <= '0';    
                     AWREADY_IM2_xhdl3 <= '0';    
                     AWREADY_IM3_xhdl4 <= AWREADY_SI;    
                     MST_WRGNT_NUM_xhdl16 <= "1000";    
            WHEN OTHERS  =>
                     AWID_IS_int <= (OTHERS => '0');    
                     AWLEN_IS_int <= (OTHERS => '0');    
                     AWSIZE_IS_int <= (OTHERS => '0');    
                     AWBURST_IS_int <= (OTHERS => '0');    
                     AWLOCK_IS_int <= (OTHERS => '0');    
                     AWCACHE_IS_int <= (OTHERS => '0');    
                     AWPROT_IS_int <= (OTHERS => '0');     
                     AWVALID_IS_int <= '0';    
                     AWREADY_IM0_xhdl1 <= '0';    
                     AWREADY_IM1_xhdl2 <= '0';    
                     AWREADY_IM2_xhdl3 <= '0';    
                     AWREADY_IM3_xhdl4 <= '0';    
                     MST_WRGNT_NUM_xhdl16 <= (OTHERS => '0');    
            
         END CASE;
         -- case (AW_MASGNT_IC)       
         
      END IF;
      END IF;
   END PROCESS;

   END GENERATE L4;

   -- --------------------------------------------------------------------------
   -- Select Slave slot for Write
   -- --------------------------------------------------------------------------
   
   PROCESS (AW_REQ_MI1, AW_REQ_MI2, AW_REQ_MI3, AWLOCK_MI0, AWLOCK_MI1, 
   AWLOCK_MI2, AWLOCK_MI3, AWADDR_IS_int_xhdl7, AW_MASGNT_IC, AWLEN_MI0, 
   AWVALID_M0, AWLEN_MI1, AWLEN_MI2, AWLEN_MI3, 
   AWID_IS_int, AWBURST_MI0, AWBURST_MI1, AWBURST_MI2, AWBURST_MI3, 
   AWPROT_IS_int, AWID_MI0, 
   AWID_MI1, AWID_MI2, AWID_MI3, AWBURST_IS_int, AWLOCK_M0, 
   AWLOCK_M1, AWLOCK_IS_int, AWLOCK_M2, AWLOCK_M3,  
   AWADDR_MI0, AWADDR_MI1, AWADDR_MI2, AWADDR_MI3,  
   AWREADY_SI, AWCACHE_IS_int, AWCACHE_MI0, 
   AWCACHE_MI1, AWCACHE_MI2, AWCACHE_MI3, AWPROT_MI0, 
   AWPROT_MI1, AWPROT_MI2, AWPROT_MI3, AWSIZE_IS_int, 
   AWADDR_M0, m0_wr_end, m1_wr_end, AWSIZE_MI0, AWSIZE_MI1, 
   AWSIZE_MI2, AWSIZE_MI3, AWADDR_IS_xhdl6, m2_wr_end,  
   AWVALID_IS_int, m3_wr_end, 
   AWLEN_IS_int, AWVALID_MI0, AWVALID_MI1, AWVALID_MI2, AWVALID_MI3, 
   AW_REQ_MI0)
      VARIABLE SLAVE_SELECT_WRITE_M0_xhdl35  : std_logic_vector(16 DOWNTO 0);
      VARIABLE temp_xhdl36  : std_logic_vector(4 DOWNTO 0);
   BEGIN
      IF (AWVALID_M0 = '1' AND AWADDR_M0(31) = '0') THEN
         SLAVE_SELECT_WRITE_M0_xhdl35 := SLAVE_N;    
      ELSE
         temp_xhdl36 := AWVALID_M0 & AWADDR_M0(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH 
         - 4);
         CASE temp_xhdl36 IS
            WHEN "10000" |
                 "11000" =>
                     SLAVE_SELECT_WRITE_M0_xhdl35 := SLAVE_8;    
            WHEN "10001" |
                 "11001" =>
                     SLAVE_SELECT_WRITE_M0_xhdl35 := SLAVE_9;    
            WHEN "10010" |
                 "11010" =>
                     SLAVE_SELECT_WRITE_M0_xhdl35 := SLAVE_A;    
            WHEN "10011" |
                 "11011" =>
                     SLAVE_SELECT_WRITE_M0_xhdl35 := SLAVE_B;    
            WHEN "10100" |
                 "11100" =>
                     SLAVE_SELECT_WRITE_M0_xhdl35 := SLAVE_C;    
            WHEN "10101" |
                 "11101" =>
                     SLAVE_SELECT_WRITE_M0_xhdl35 := SLAVE_D;    
            WHEN "10110" |
                 "11110" =>
                     SLAVE_SELECT_WRITE_M0_xhdl35 := SLAVE_E;    
            WHEN "10111" |
                 "11111" =>
                     SLAVE_SELECT_WRITE_M0_xhdl35 := SLAVE_F;    
            WHEN OTHERS  =>
                     SLAVE_SELECT_WRITE_M0_xhdl35 := (OTHERS => '0');    
            
         END CASE;
         -- case ({AWVALID_MI0,AWADDR_MI0[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
      END IF;
      
      SLAVE_SELECT_WRITE_M0 <= SLAVE_SELECT_WRITE_M0_xhdl35;
   END PROCESS;

   -- --------------------------------------------------------------------------
   -- Select Slave slot for Write
   -- --------------------------------------------------------------------------
   
   PROCESS (AWVALID_M1, AWADDR_M1)
      VARIABLE SLAVE_SELECT_WRITE_M1_xhdl37  : std_logic_vector(16 DOWNTO 0);
      VARIABLE temp_xhdl38  : std_logic_vector(4 DOWNTO 0);
   BEGIN
      IF (AWVALID_M1 = '1' AND AWADDR_M1(31) = '0') THEN
         SLAVE_SELECT_WRITE_M1_xhdl37 := SLAVE_N;    
      ELSE
         temp_xhdl38 := AWVALID_M1 & AWADDR_M1(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH 
         - 4);
         CASE temp_xhdl38 IS
            WHEN "10000" |
                 "11000" =>
                     SLAVE_SELECT_WRITE_M1_xhdl37 := SLAVE_8;    
            WHEN "10001" |
                 "11001" =>
                     SLAVE_SELECT_WRITE_M1_xhdl37 := SLAVE_9;    
            WHEN "10010" |
                 "11010" =>
                     SLAVE_SELECT_WRITE_M1_xhdl37 := SLAVE_A;    
            WHEN "10011" |
                 "11011" =>
                     SLAVE_SELECT_WRITE_M1_xhdl37 := SLAVE_B;    
            WHEN "10100" |
                 "11100" =>
                     SLAVE_SELECT_WRITE_M1_xhdl37 := SLAVE_C;    
            WHEN "10101" |
                 "11101" =>
                     SLAVE_SELECT_WRITE_M1_xhdl37 := SLAVE_D;    
            WHEN "10110" |
                 "11110" =>
                     SLAVE_SELECT_WRITE_M1_xhdl37 := SLAVE_E;    
            WHEN "10111" |
                 "11111" =>
                     SLAVE_SELECT_WRITE_M1_xhdl37 := SLAVE_F;    
            WHEN OTHERS  =>
                     SLAVE_SELECT_WRITE_M1_xhdl37 := (OTHERS => '0');    
            
         END CASE;
         -- case ({AWVALID_MI0,AWADDR_MI0[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
         
      END IF;
      
      SLAVE_SELECT_WRITE_M1 <= SLAVE_SELECT_WRITE_M1_xhdl37;
   END PROCESS;

   -- --------------------------------------------------------------------------
   -- Select Slave slot for Write
   -- --------------------------------------------------------------------------
   
   PROCESS (AWVALID_M2, AWADDR_M2)
      VARIABLE SLAVE_SELECT_WRITE_M2_xhdl39  : std_logic_vector(16 DOWNTO 0);
      VARIABLE temp_xhdl40  : std_logic_vector(4 DOWNTO 0);
   BEGIN
      IF (AWVALID_M2 = '1' AND AWADDR_M2(31) = '0') THEN
         SLAVE_SELECT_WRITE_M2_xhdl39 := SLAVE_N;    
      ELSE
         temp_xhdl40 := AWVALID_M2 & AWADDR_M2(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH 
         - 4);
         CASE temp_xhdl40 IS
            WHEN "10000" |
                 "11000" =>
                     SLAVE_SELECT_WRITE_M2_xhdl39 := SLAVE_8;    
            WHEN "10001" |
                 "11001" =>
                     SLAVE_SELECT_WRITE_M2_xhdl39 := SLAVE_9;    
            WHEN "10010" |
                 "11010" =>
                     SLAVE_SELECT_WRITE_M2_xhdl39 := SLAVE_A;    
            WHEN "10011" |
                 "11011" =>
                     SLAVE_SELECT_WRITE_M2_xhdl39 := SLAVE_B;    
            WHEN "10100" |
                 "11100" =>
                     SLAVE_SELECT_WRITE_M2_xhdl39 := SLAVE_C;    
            WHEN "10101" |
                 "11101" =>
                     SLAVE_SELECT_WRITE_M2_xhdl39 := SLAVE_D;    
            WHEN "10110" |
                 "11110" =>
                     SLAVE_SELECT_WRITE_M2_xhdl39 := SLAVE_E;    
            WHEN "10111" |
                 "11111" =>
                     SLAVE_SELECT_WRITE_M2_xhdl39 := SLAVE_F;    
            WHEN OTHERS  =>
                     SLAVE_SELECT_WRITE_M2_xhdl39 := (OTHERS => '0');    
            
         END CASE;
         -- case ({AWVALID_MI0,AWADDR_MI0[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
      END IF;
      SLAVE_SELECT_WRITE_M2 <= SLAVE_SELECT_WRITE_M2_xhdl39;
   END PROCESS;

   -- --------------------------------------------------------------------------
   -- Select Slave slot for Write
   -- --------------------------------------------------------------------------
   
   PROCESS (AWVALID_M3, AWADDR_M3)
      VARIABLE SLAVE_SELECT_WRITE_M3_xhdl41  : std_logic_vector(16 DOWNTO 0);
      VARIABLE temp_xhdl42  : std_logic_vector(4 DOWNTO 0);
   BEGIN
      IF (AWVALID_M3 = '1' AND AWADDR_M3(31) = '0') THEN
         SLAVE_SELECT_WRITE_M3_xhdl41 := SLAVE_N;    
      ELSE
         temp_xhdl42 := AWVALID_M3 & AWADDR_M3(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH 
         - 4);
         CASE temp_xhdl42 IS
            WHEN "10000" |
                 "11000" =>
                     SLAVE_SELECT_WRITE_M3_xhdl41 := SLAVE_8;    
            WHEN "10001" |
                 "11001" =>
                     SLAVE_SELECT_WRITE_M3_xhdl41 := SLAVE_9;    
            WHEN "10010" |
                 "11010" =>
                     SLAVE_SELECT_WRITE_M3_xhdl41 := SLAVE_A;    
            WHEN "10011" |
                 "11011" =>
                     SLAVE_SELECT_WRITE_M3_xhdl41 := SLAVE_B;    
            WHEN "10100" |
                 "11100" =>
                     SLAVE_SELECT_WRITE_M3_xhdl41 := SLAVE_C;    
            WHEN "10101" |
                 "11101" =>
                     SLAVE_SELECT_WRITE_M3_xhdl41 := SLAVE_D;    
            WHEN "10110" |
                 "11110" =>
                     SLAVE_SELECT_WRITE_M3_xhdl41 := SLAVE_E;    
            WHEN "10111" |
                 "11111" =>
                     SLAVE_SELECT_WRITE_M3_xhdl41 := SLAVE_F;    
            WHEN OTHERS  =>
                     SLAVE_SELECT_WRITE_M3_xhdl41 := (OTHERS => '0');    
            
         END CASE;
         -- case ({AWVALID_MI3,AWADDR_MI3[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
         
      END IF;
      SLAVE_SELECT_WRITE_M3 <= SLAVE_SELECT_WRITE_M3_xhdl41;
   END PROCESS;

   -----------------------------------------------------------------------------
   -- Generate the write requests to the arbiter 
   -----------------------------------------------------------------------------
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         AW_REQ_MI0 <= '0';    
         AW_REQ_MI1 <= '0';    
         AW_REQ_MI2 <= '0';    
         AW_REQ_MI3 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         AW_REQ_MI0 <= '0';    
         AW_REQ_MI1 <= '0';    
         AW_REQ_MI2 <= '0';    
         AW_REQ_MI3 <= '0';    
      ELSE 
         IF ( (or_br(SLAVE_SELECT_WRITE_M0) = '1') AND ((SLAVE_NUMBER = AWADDR_M0(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) AND (AWADDR_M0(31) = '1')) OR (SLAVE_NUMBER(4) = '1' AND AWADDR_M0(31) = '0')) ) THEN
            AW_REQ_MI0 <= '1';
         ELSE 
            AW_REQ_MI0 <= '0';
         END IF;

         IF ( (or_br(SLAVE_SELECT_WRITE_M1) = '1') AND ((SLAVE_NUMBER = AWADDR_M1(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) AND (AWADDR_M1(31) = '1')) OR (SLAVE_NUMBER(4) = '1' AND AWADDR_M1(31) = '0')) ) THEN
            AW_REQ_MI1 <= '1';
         ELSE 
            AW_REQ_MI1 <= '0';
         END IF;

         IF ( (or_br(SLAVE_SELECT_WRITE_M2) = '1') AND ((SLAVE_NUMBER = AWADDR_M2(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) AND (AWADDR_M2(31) = '1')) OR (SLAVE_NUMBER(4) = '1' AND AWADDR_M2(31) = '0')) ) THEN
            AW_REQ_MI2 <= '1';
         ELSE 
            AW_REQ_MI2 <= '0';
         END IF;

         IF ( (or_br(SLAVE_SELECT_WRITE_M3) = '1') AND ((SLAVE_NUMBER = AWADDR_M3(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) AND (AWADDR_M3(31) = '1')) OR (SLAVE_NUMBER(4) = '1' AND AWADDR_M3(31) = '0')) ) THEN
            AW_REQ_MI3 <= '1';
         ELSE 
            AW_REQ_MI3 <= '0';
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (AWADDR_IS_xhdl6, AWVALID_IS_xhdl14,
   AWADDR_M0, AWADDR_M1, AWADDR_M2, SLAVE_SELECT_WADDRCH_M_r, 
   AWADDR_M3, SLAVE_SELECT_WRITE_M0, SLAVE_SELECT_WRITE_M1, 
   SLAVE_SELECT_WRITE_M2, SLAVE_SELECT_WRITE_M3)
      VARIABLE SLAVE_SELECT_WADDRCH_M_xhdl15_xhdl43  : std_logic_vector(16 
      DOWNTO 0);
      VARIABLE temp_xhdl44  : std_logic_vector(4 DOWNTO 0);
   BEGIN
      IF (AWVALID_IS_xhdl14 = '1' AND AWADDR_IS_xhdl6(31) = '0') THEN
         SLAVE_SELECT_WADDRCH_M_xhdl15_xhdl43 := SLAVE_N;    
      ELSE
         temp_xhdl44 := AWVALID_IS_xhdl14 & AWADDR_IS_xhdl6(AXI_AWIDTH - 1 
         DOWNTO AXI_AWIDTH - 4);
         CASE temp_xhdl44 IS
            WHEN "10000" |
                 "11000" =>
                     SLAVE_SELECT_WADDRCH_M_xhdl15_xhdl43 := SLAVE_8;    
            WHEN "10001" |
                 "11001" =>
                     SLAVE_SELECT_WADDRCH_M_xhdl15_xhdl43 := SLAVE_9;    
            WHEN "10010" |
                 "11010" =>
                     SLAVE_SELECT_WADDRCH_M_xhdl15_xhdl43 := SLAVE_A;    
            WHEN "10011" |
                 "11011" =>
                     SLAVE_SELECT_WADDRCH_M_xhdl15_xhdl43 := SLAVE_B;    
            WHEN "10100" |
                 "11100" =>
                     SLAVE_SELECT_WADDRCH_M_xhdl15_xhdl43 := SLAVE_C;    
            WHEN "10101" |
                 "11101" =>
                     SLAVE_SELECT_WADDRCH_M_xhdl15_xhdl43 := SLAVE_D;    
            WHEN "10110" |
                 "11110" =>
                     SLAVE_SELECT_WADDRCH_M_xhdl15_xhdl43 := SLAVE_E;    
            WHEN "10111" |
                 "11111" =>
                     SLAVE_SELECT_WADDRCH_M_xhdl15_xhdl43 := SLAVE_F;    
            WHEN OTHERS  =>
                     SLAVE_SELECT_WADDRCH_M_xhdl15_xhdl43 := 
                     SLAVE_SELECT_WADDRCH_M_r;    
            
         END CASE;
      END IF;
      
      SLAVE_SELECT_WADDRCH_M_xhdl15 <= SLAVE_SELECT_WADDRCH_M_xhdl15_xhdl43;
   END PROCESS;

   -- Latch Write data channel signals
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         SLAVE_SELECT_WADDRCH_M_r <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         SLAVE_SELECT_WADDRCH_M_r <= (OTHERS => '0');    
      ELSE 
         SLAVE_SELECT_WADDRCH_M_r <= SLAVE_SELECT_WADDRCH_M_xhdl15;    
      END IF;
      END IF;
   END PROCESS;

END ARCHITECTURE translated;
