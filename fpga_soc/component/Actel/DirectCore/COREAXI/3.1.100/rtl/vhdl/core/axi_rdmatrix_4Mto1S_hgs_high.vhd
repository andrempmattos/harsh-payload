-- ****************************************************************************/
-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description: rdmatrix_4Mto1S.v
--              
--              
--                       - Arbiter
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

ENTITY axi_rdmatrix_4Mto1S_hgs_high IS
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
      ARADDR_M0               : IN std_logic_vector(31 DOWNTO 0);   
      ARLOCK_M0               : IN std_logic_vector(1 DOWNTO 0);   
      ARVALID_M0              : IN std_logic;   
      ARADDR_M1               : IN std_logic_vector(31 DOWNTO 0);   
      ARLOCK_M1               : IN std_logic_vector(1 DOWNTO 0);   
      ARVALID_M1              : IN std_logic;   
      ARADDR_M2               : IN std_logic_vector(31 DOWNTO 0);   
      ARLOCK_M2               : IN std_logic_vector(1 DOWNTO 0);   
      ARVALID_M2              : IN std_logic;   
      ARADDR_M3               : IN std_logic_vector(31 DOWNTO 0);   
      ARLOCK_M3               : IN std_logic_vector(1 DOWNTO 0);   
      ARVALID_M3              : IN std_logic;   
      --   output [3:0] AR_MASGNT_IC;
-- For Arbiter from Masters
-- To end grant to current master

      m0_rd_end               : IN std_logic;   
      m1_rd_end               : IN std_logic;   
      m2_rd_end               : IN std_logic;   
      m3_rd_end               : IN std_logic;   
      -- AXI MASTER write address channel signals

      ARREADY_SI              : IN std_logic;   
      RVALID_SI               : IN std_logic;   
      RLAST_SI                : IN std_logic;   
      RREADY_IS               : IN std_logic;   
      -- From Master 0
-- AXI write address channel signals

      ARID_MI0                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_MI0              : IN std_logic_vector(31 DOWNTO 0);   
      ARLEN_MI0               : IN std_logic_vector(3 DOWNTO 0);   
      ARSIZE_MI0              : IN std_logic_vector(2 DOWNTO 0);   
      ARBURST_MI0             : IN std_logic_vector(1 DOWNTO 0);   
      ARLOCK_MI0              : IN std_logic_vector(1 DOWNTO 0);   
      ARCACHE_MI0             : IN std_logic_vector(3 DOWNTO 0);   
      ARPROT_MI0              : IN std_logic_vector(2 DOWNTO 0);   
      ARVALID_MI0             : IN std_logic;   
      ARREADY_IM0             : OUT std_logic;   
      -- From Master 1
-- AXI write address channel signals

      ARID_MI1                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_MI1              : IN std_logic_vector(31 DOWNTO 0);   
      ARLEN_MI1               : IN std_logic_vector(3 DOWNTO 0);   
      ARSIZE_MI1              : IN std_logic_vector(2 DOWNTO 0);   
      ARBURST_MI1             : IN std_logic_vector(1 DOWNTO 0);   
      ARLOCK_MI1              : IN std_logic_vector(1 DOWNTO 0);   
      ARCACHE_MI1             : IN std_logic_vector(3 DOWNTO 0);   
      ARPROT_MI1              : IN std_logic_vector(2 DOWNTO 0);   
      ARVALID_MI1             : IN std_logic;   
      ARREADY_IM1             : OUT std_logic;   
      -- From Master 2
-- AXI write address channel signals

      ARID_MI2                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_MI2              : IN std_logic_vector(31 DOWNTO 0);   
      ARLEN_MI2               : IN std_logic_vector(3 DOWNTO 0);   
      ARSIZE_MI2              : IN std_logic_vector(2 DOWNTO 0);   
      ARBURST_MI2             : IN std_logic_vector(1 DOWNTO 0);   
      ARLOCK_MI2              : IN std_logic_vector(1 DOWNTO 0);   
      ARCACHE_MI2             : IN std_logic_vector(3 DOWNTO 0);   
      ARPROT_MI2              : IN std_logic_vector(2 DOWNTO 0);   
      ARVALID_MI2             : IN std_logic;   
      ARREADY_IM2             : OUT std_logic;   
      -- From Master 3
-- AXI write address channel signals

      ARID_MI3                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_MI3              : IN std_logic_vector(31 DOWNTO 0);   
      ARLEN_MI3               : IN std_logic_vector(3 DOWNTO 0);   
      ARSIZE_MI3              : IN std_logic_vector(2 DOWNTO 0);   
      ARBURST_MI3             : IN std_logic_vector(1 DOWNTO 0);   
      ARLOCK_MI3              : IN std_logic_vector(1 DOWNTO 0);   
      ARCACHE_MI3             : IN std_logic_vector(3 DOWNTO 0);   
      ARPROT_MI3              : IN std_logic_vector(2 DOWNTO 0);   
      ARVALID_MI3             : IN std_logic;   
      ARREADY_IM3             : OUT std_logic;   
      -- SLAVE 0
-- AXI SLAVE 0 write address channel signals

      ARID_IS                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_IS               : OUT std_logic_vector(31 DOWNTO 0);   
      ARADDR_IS_int           : OUT std_logic_vector(31 DOWNTO 0);   
      ARLEN_IS                : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_IS               : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_IS              : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_IS               : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_IS              : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_IS               : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_IS              : OUT std_logic;   
      MST_RDGNT_NUM           : OUT std_logic_vector(3 DOWNTO 0);   
      rd_rdcntr               : OUT std_logic_vector(3 DOWNTO 0);   
      rd_wdcntr               : OUT std_logic_vector(3 DOWNTO 0);   
      rd_wen_flag             : OUT std_logic;   
      rd_ren_flag             : OUT std_logic;   
      SLAVE_SELECT_RADDRCH_M  : OUT std_logic_vector(16 DOWNTO 0);   
      SLAVE_NUMBER            : IN std_logic_vector(4 DOWNTO 0));   
END ENTITY axi_rdmatrix_4Mto1S_hgs_high;

ARCHITECTURE translated OF axi_rdmatrix_4Mto1S_hgs_high IS


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

COMPONENT axi_RA_ARBITER
      GENERIC (
         --------------------------------------------------------------------------
         -- Parameter Declaration
         --------------------------------------------------------------------------
         SYNC_RESET                     :  integer := 0;    
         AXI_AWIDTH                     :  integer := 32;    
         AXI_DWIDTH                     :  integer := 64;    
         AXI_STRBWIDTH                  :  integer := 8;    
         NUM_MASTER_SLOT                :  integer := 1;
         INP_REG_BUF                    :  integer := 1;
         OUT_REG_BUF                    :  integer := 1);    
      PORT (
         --------------------------------------------------------------------------
-- Global signals
--------------------------------------------------------------------------

         ACLK                    : IN std_logic;   
         ARESETN                 : IN std_logic;   
         -- MASTER 0

         ARLOCK_M0               : IN std_logic_vector(1 DOWNTO 0);   
         -- MASTER 1

         ARLOCK_M1               : IN std_logic_vector(1 DOWNTO 0);   
         -- MASTER 2

         ARLOCK_M2               : IN std_logic_vector(1 DOWNTO 0);   
         -- MASTER 3

         ARLOCK_M3               : IN std_logic_vector(1 DOWNTO 0);   
         ARLOCK_MI0               : IN std_logic_vector(1 DOWNTO 0);   
         ARLOCK_MI1               : IN std_logic_vector(1 DOWNTO 0);   
         ARLOCK_MI2               : IN std_logic_vector(1 DOWNTO 0);   
         ARLOCK_MI3               : IN std_logic_vector(1 DOWNTO 0);   
         m0_rd_end               : IN std_logic;   
         m1_rd_end               : IN std_logic;   
         m2_rd_end               : IN std_logic;   
         m3_rd_end               : IN std_logic;   
         -- AXI MASTER 0 

         AR_REQ_MI0              : IN std_logic;   
         -- AXI MASTER 1 

         AR_REQ_MI1              : IN std_logic;   
         -- AXI MASTER 2 

         AR_REQ_MI2              : IN std_logic;   
         -- AXI MASTER 3 

         AR_REQ_MI3              : IN std_logic;   
         AR_MASGNT_MI            : OUT std_logic_vector(3 DOWNTO 0));
   END COMPONENT;
   -- --------------------------------------------------------------------------
   -- Internal signals
   -- --------------------------------------------------------------------------
   SIGNAL ARID_IS_int              :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARLEN_IS_int             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS_int            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS_int           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS_int            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS_int           :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS_int            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS_int           :  std_logic;   
   SIGNAL SLAVE_SELECT_RADDRCH_M_int      :  std_logic_vector(16 DOWNTO 0);   
   SIGNAL SLAVE_SELECT_RADDRCH_M_r :  std_logic_vector(16 DOWNTO 0);   
   -- For Arbiter from Masters
   SIGNAL ARREADY_SI_int           :  std_logic;   
   SIGNAL wr_rdcntr                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL wr_wdcntr                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL wr_wen_flag              :  std_logic;   
   SIGNAL wr_ren_flag              :  std_logic;   
   SIGNAL ARREADY_IM0_int          :  std_logic;   
   SIGNAL ARREADY_IM1_int          :  std_logic;   
   SIGNAL ARREADY_IM2_int          :  std_logic;   
   SIGNAL ARREADY_IM3_int          :  std_logic;   
   SIGNAL AR_REQ_MI                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL SLAVE_SELECT_READ_M0     :  std_logic_vector(16 DOWNTO 0);   
   SIGNAL SLAVE_SELECT_READ_M1     :  std_logic_vector(16 DOWNTO 0);   
   SIGNAL SLAVE_SELECT_READ_M2     :  std_logic_vector(16 DOWNTO 0);   
   SIGNAL SLAVE_SELECT_READ_M3     :  std_logic_vector(16 DOWNTO 0);   
   SIGNAL mst0_rd_end              :  std_logic;   
   SIGNAL mst0_outstd_rdcntr       :  std_logic_vector(RD_ACCEPTANCE - 1 DOWNTO 
   0);   
   SIGNAL mst0_rd_end_d1           :  std_logic;   
   SIGNAL mst1_rd_end              :  std_logic;   
   SIGNAL mst1_outstd_rdcntr       :  std_logic_vector(RD_ACCEPTANCE - 1 DOWNTO 
   0);   
   SIGNAL mst1_rd_end_d1           :  std_logic;   
   SIGNAL mst2_rd_end              :  std_logic;   
   SIGNAL mst2_outstd_rdcntr       :  std_logic_vector(RD_ACCEPTANCE - 1 DOWNTO 
   0);   
   SIGNAL mst2_rd_end_d1           :  std_logic;   
   SIGNAL mst3_rd_end              :  std_logic;   
   SIGNAL mst3_outstd_rdcntr       :  std_logic_vector(RD_ACCEPTANCE - 1 DOWNTO 
   0);   
   SIGNAL mst3_rd_end_d1           :  std_logic;   
   SIGNAL AR_MASGNT_IC             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AR_REQ_MI0               :  std_logic;   
   SIGNAL AR_REQ_MI1               :  std_logic;   
   SIGNAL AR_REQ_MI2               :  std_logic;   
   SIGNAL AR_REQ_MI3               :  std_logic;   
   -- --------------------------------------------------------------------------
   -- Pass the ARDEADY_SI coming from the respective selected slave.
   -- When the look-up is filled to limit of 16, the AWREADY going towards the
   -- granted master is pulled low. This disallows anymore transactions to be
   -- received in to the DUT.
   -- --------------------------------------------------------------------------
   SIGNAL temp_xhdl21              :  std_logic;   
   SIGNAL ARREADY_IM0_xhdl1        :  std_logic;   
   SIGNAL ARREADY_IM1_xhdl2        :  std_logic;   
   SIGNAL ARREADY_IM2_xhdl3        :  std_logic;   
   SIGNAL ARREADY_IM3_xhdl4        :  std_logic;   
   SIGNAL ARID_IS_xhdl5            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS_xhdl6          :  std_logic_vector(31 DOWNTO 0);   
   SIGNAL ARLEN_IS_xhdl7           :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS_xhdl8          :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS_xhdl9         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS_xhdl10         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS_xhdl11        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS_xhdl12         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS_xhdl13        :  std_logic;   
   SIGNAL ARADDR_IS_int_xhdl14     :  std_logic_vector(31 DOWNTO 0);   
   SIGNAL SLAVE_SELECT_RADDRCH_M_xhdl15   :  std_logic_vector(16 DOWNTO 0);   
   SIGNAL MST_RDGNT_NUM_xhdl16     :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL rd_rdcntr_xhdl17         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL rd_wdcntr_xhdl18         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL rd_wen_flag_xhdl19       :  std_logic;   
   SIGNAL rd_ren_flag_xhdl20       :  std_logic;   
   SIGNAL areset_n                 :  std_logic;   
   SIGNAL sresetn                  :  std_logic;   

BEGIN
   --///////////////////////////////////////////////////////////////////////////
   --                               Start - of - Code                         //
   --///////////////////////////////////////////////////////////////////////////

   areset_n  <= '1' WHEN (SYNC_RESET = 1) ELSE ARESETN;
   sresetn   <= ARESETN WHEN (SYNC_RESET = 1) ELSE '1';

   ARREADY_IM0 <= ARREADY_IM0_xhdl1;
   ARREADY_IM1 <= ARREADY_IM1_xhdl2;
   ARREADY_IM2 <= ARREADY_IM2_xhdl3;
   ARREADY_IM3 <= ARREADY_IM3_xhdl4;
   ARID_IS <= ARID_IS_xhdl5;
   ARADDR_IS <= ARADDR_IS_xhdl6;
   ARLEN_IS <= ARLEN_IS_xhdl7;
   ARSIZE_IS <= ARSIZE_IS_xhdl8;
   ARBURST_IS <= ARBURST_IS_xhdl9;
   ARLOCK_IS <= ARLOCK_IS_xhdl10;
   ARCACHE_IS <= ARCACHE_IS_xhdl11;
   ARPROT_IS <= ARPROT_IS_xhdl12;
   ARVALID_IS <= ARVALID_IS_xhdl13;
   ARADDR_IS_int <= ARADDR_IS_int_xhdl14;
   SLAVE_SELECT_RADDRCH_M <= SLAVE_SELECT_RADDRCH_M_xhdl15;
   MST_RDGNT_NUM <= MST_RDGNT_NUM_xhdl16;
   rd_rdcntr <= rd_rdcntr_xhdl17;
   rd_wdcntr <= rd_wdcntr_xhdl18;
   rd_wen_flag <= rd_wen_flag_xhdl19;
   rd_ren_flag <= rd_ren_flag_xhdl20;

   -- --------------------------------------------------------------------------
   -- rd_wdcntr: Counter to count the number of outstanding reads pending.
   -- It increments on read address valid and read address ready. It resets on
   -- reaching the limit.
   -- --------------------------------------------------------------------------
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         rd_wdcntr_xhdl18 <= (OTHERS => '0');        
         rd_wen_flag_xhdl19 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         rd_wdcntr_xhdl18 <= (OTHERS => '0');        
         rd_wen_flag_xhdl19 <= '0';    
      ELSE 
         IF (rd_rdcntr_xhdl17 = "1111") THEN
            rd_wdcntr_xhdl18 <= (OTHERS => '0');    
            rd_wen_flag_xhdl19 <= '0';    
         ELSE
            IF (ARVALID_IS_xhdl13 = '1' AND ARREADY_SI_int = '1') THEN
               rd_wdcntr_xhdl18 <= rd_wdcntr_xhdl18 + "0001";    
               rd_wen_flag_xhdl19 <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   -- --------------------------------------------------------------------------
   -- rd_rdcntr: Counter to count the number of completed reads.
   -- It increments on valid read data received. It resets on
   -- reaching the limit.
   -- --------------------------------------------------------------------------
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         rd_rdcntr_xhdl17 <= (OTHERS => '0');    
         rd_ren_flag_xhdl20 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         rd_rdcntr_xhdl17 <= (OTHERS => '0');    
         rd_ren_flag_xhdl20 <= '0';
      ELSE 
         IF (rd_rdcntr_xhdl17 = "1111") THEN
            rd_rdcntr_xhdl17 <= (OTHERS => '0');       
            rd_ren_flag_xhdl20 <= '0';    
         ELSE
            IF ((RLAST_SI = '1' AND RVALID_SI = '1') AND RREADY_IS = '1') THEN
               rd_rdcntr_xhdl17 <= rd_rdcntr_xhdl17 + "0001";    
               rd_ren_flag_xhdl20 <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;
   temp_xhdl21 <= '0' WHEN ((rd_wdcntr_xhdl18 - rd_rdcntr_xhdl17) = "0001") 
   ELSE ARREADY_SI;
   ARREADY_SI_int <= temp_xhdl21 ;

   -- --------------------------------------------------------------------------
   -- Select the Master signals based the grant provided by the arbiter
   -- Register the read address control signals passing to the slave interface.
   -- The signals are passed only if it is meant for the intended slave. Otherwise
   -- it gets blocked. This is done by checking the slave number with the received
   -- read address.
   -- --------------------------------------------------------------------------
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         ARADDR_IS_xhdl6 <= (OTHERS => '0');    
         ARID_IS_xhdl5 <= (OTHERS => '0');    
         ARLEN_IS_xhdl7 <= (OTHERS => '0');    
         ARSIZE_IS_xhdl8 <= (OTHERS => '0');    
         ARBURST_IS_xhdl9 <= (OTHERS => '0');    
         ARLOCK_IS_xhdl10 <= (OTHERS => '0');    
         ARCACHE_IS_xhdl11 <= (OTHERS => '0');    
         ARPROT_IS_xhdl12 <= (OTHERS => '0');    
         ARVALID_IS_xhdl13 <= '0';    
         ARREADY_IM0_xhdl1 <= '0';    
         ARREADY_IM1_xhdl2 <= '0';    
         ARREADY_IM2_xhdl3 <= '0';    
         ARREADY_IM3_xhdl4 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         ARADDR_IS_xhdl6 <= (OTHERS => '0');    
         ARID_IS_xhdl5 <= (OTHERS => '0');    
         ARLEN_IS_xhdl7 <= (OTHERS => '0');    
         ARSIZE_IS_xhdl8 <= (OTHERS => '0');    
         ARBURST_IS_xhdl9 <= (OTHERS => '0');    
         ARLOCK_IS_xhdl10 <= (OTHERS => '0');    
         ARCACHE_IS_xhdl11 <= (OTHERS => '0');    
         ARPROT_IS_xhdl12 <= (OTHERS => '0');    
         ARVALID_IS_xhdl13 <= '0';    
         ARREADY_IM0_xhdl1 <= '0';    
         ARREADY_IM1_xhdl2 <= '0';    
         ARREADY_IM2_xhdl3 <= '0';    
         ARREADY_IM3_xhdl4 <= '0';
      ELSE 
         ARREADY_IM0_xhdl1 <= ARREADY_IM0_int;    
         ARREADY_IM1_xhdl2 <= ARREADY_IM1_int;    
         ARREADY_IM2_xhdl3 <= ARREADY_IM2_int;    
         ARREADY_IM3_xhdl4 <= ARREADY_IM3_int;    
         IF ((ARADDR_IS_int_xhdl14(31) = '1' AND SLAVE_NUMBER = 
         ARADDR_IS_int_xhdl14(31 DOWNTO 28)) OR SLAVE_NUMBER(4) = '1') THEN
            ARADDR_IS_xhdl6 <= ARADDR_IS_int_xhdl14;    
            ARID_IS_xhdl5 <= ARID_IS_int;    
            ARLEN_IS_xhdl7 <= ARLEN_IS_int;    
            ARSIZE_IS_xhdl8 <= ARSIZE_IS_int;    
            ARBURST_IS_xhdl9 <= ARBURST_IS_int;    
            ARLOCK_IS_xhdl10 <= ARLOCK_IS_int;    
            ARCACHE_IS_xhdl11 <= ARCACHE_IS_int;    
            ARPROT_IS_xhdl12 <= ARPROT_IS_int;    
            ARVALID_IS_xhdl13 <= ARVALID_IS_int;    
         ELSE
            IF ((ARADDR_IS_int_xhdl14(31) = '0' AND SLAVE_NUMBER = 
            ARADDR_IS_int_xhdl14(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4)) OR 
            SLAVE_NUMBER(4) = '1') THEN
               ARADDR_IS_xhdl6 <= ARADDR_IS_int_xhdl14;    
               ARID_IS_xhdl5 <= ARID_IS_int;    
               ARLEN_IS_xhdl7 <= ARLEN_IS_int;    
               ARSIZE_IS_xhdl8 <= ARSIZE_IS_int;    
               ARBURST_IS_xhdl9 <= ARBURST_IS_int;    
               ARLOCK_IS_xhdl10 <= ARLOCK_IS_int;    
               ARCACHE_IS_xhdl11 <= ARCACHE_IS_int;    
               ARPROT_IS_xhdl12 <= ARPROT_IS_int;    
               ARVALID_IS_xhdl13 <= ARVALID_IS_int;    
            ELSE
               ARADDR_IS_xhdl6 <= ARADDR_IS_xhdl6;    
               ARID_IS_xhdl5 <= (OTHERS => '0');    
               ARLEN_IS_xhdl7 <= (OTHERS => '0');    
               ARSIZE_IS_xhdl8 <= (OTHERS => '0');    
               ARBURST_IS_xhdl9 <= (OTHERS => '0');    
               ARLOCK_IS_xhdl10 <= (OTHERS => '0');    
               ARCACHE_IS_xhdl11 <= (OTHERS => '0');    
               ARPROT_IS_xhdl12 <= (OTHERS => '0');    
               ARVALID_IS_xhdl13 <= '0';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   --    if(NUM_MASTER_SLOT == 1) begin
   L1: IF (NUM_MASTER_SLOT = 1) GENERATE
   
   PROCESS (ARID_IS_int, ARREADY_IM0_int,  
   ARLOCK_IS_int, ARREADY_IM1_int, ARCACHE_IS_int, 
   ARREADY_IM2_int, 
   ARREADY_IM3_int, ARADDR_IS_int_xhdl14, RLAST_SI, ARSIZE_IS_int, 
   ARLEN_IS_int, RVALID_SI, ARVALID_IS_xhdl13, ARREADY_SI_int, ARREADY_SI, 
   ARPROT_IS_int, rd_rdcntr_xhdl17,
   rd_wdcntr_xhdl18, RREADY_IS, ARVALID_IS_int, 
   ARBURST_IS_int, AR_MASGNT_IC, ARADDR_IS_xhdl6)
   BEGIN
      CASE AR_MASGNT_IC IS
         WHEN "0001" =>
                  ARREADY_IM0_int <= ARREADY_SI;    
         WHEN OTHERS  =>
                  ARREADY_IM0_int <= '0';    
         
      END CASE;
      -- case (AR_MASGNT_IC)       
      
      
   END PROCESS;

   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         ARADDR_IS_int_xhdl14 <= (OTHERS => '0');    
         ARID_IS_int <= (OTHERS => '0');    
         ARLEN_IS_int <= (OTHERS => '0');    
         ARSIZE_IS_int <= (OTHERS => '0');    
         ARBURST_IS_int <= (OTHERS => '0');    
         ARLOCK_IS_int <= (OTHERS => '0');    
         ARCACHE_IS_int <= (OTHERS => '0');    
         ARPROT_IS_int <= (OTHERS => '0');    
         ARVALID_IS_int <= '0';    
         MST_RDGNT_NUM_xhdl16 <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         ARADDR_IS_int_xhdl14 <= (OTHERS => '0');    
         ARID_IS_int <= (OTHERS => '0');    
         ARLEN_IS_int <= (OTHERS => '0');    
         ARSIZE_IS_int <= (OTHERS => '0');    
         ARBURST_IS_int <= (OTHERS => '0');    
         ARLOCK_IS_int <= (OTHERS => '0');    
         ARCACHE_IS_int <= (OTHERS => '0');    
         ARPROT_IS_int <= (OTHERS => '0');    
         ARVALID_IS_int <= '0';    
         MST_RDGNT_NUM_xhdl16 <= (OTHERS => '0');    
      ELSE 
         CASE AR_MASGNT_IC IS
            WHEN "0001" =>
                     ARADDR_IS_int_xhdl14 <= ARADDR_MI0;    
                     ARID_IS_int <= ARID_MI0;    
                     ARLEN_IS_int <= ARLEN_MI0;    
                     ARSIZE_IS_int <= ARSIZE_MI0;    
                     ARBURST_IS_int <= ARBURST_MI0;    
                     ARLOCK_IS_int <= ARLOCK_MI0;    
                     ARCACHE_IS_int <= ARCACHE_MI0;    
                     ARPROT_IS_int <= ARPROT_MI0;    
                     ARVALID_IS_int <= ARVALID_MI0;    
                     MST_RDGNT_NUM_xhdl16 <= "0001";    
            WHEN OTHERS  =>
                     ARID_IS_int <= (OTHERS => '0');    
                     ARLEN_IS_int <= (OTHERS => '0');        
                     ARSIZE_IS_int <= (OTHERS => '0');    
                     ARBURST_IS_int <= (OTHERS => '0');    
                     ARLOCK_IS_int <= (OTHERS => '0');    
                     ARCACHE_IS_int <= (OTHERS => '0');    
                     ARPROT_IS_int <= (OTHERS => '0');    
                     ARVALID_IS_int <= '0';    
                     MST_RDGNT_NUM_xhdl16 <= (OTHERS => '0');    
            
         END CASE;
         -- case (AR_MASGNT_IC)       
         
         
      END IF;
      END IF;
   END PROCESS;

   END GENERATE L1;
   L2: IF (NUM_MASTER_SLOT = 2) GENERATE
   
   PROCESS (ARREADY_SI, ARVALID_MI0, AR_MASGNT_IC, ARLOCK_MI0, ARLEN_MI0, 
   ARPROT_MI0, ARBURST_MI0, ARSIZE_MI0, ARCACHE_MI0, ARADDR_MI0,  
   ARID_MI0)
   BEGIN
      CASE AR_MASGNT_IC IS
         WHEN "0001" =>
                  ARREADY_IM0_int <= ARREADY_SI;    
                  ARREADY_IM1_int <= '0';    
         WHEN "0010" =>
                  ARREADY_IM1_int <= ARREADY_SI;    
                  ARREADY_IM0_int <= '0';    
         WHEN OTHERS  =>
                  ARREADY_IM0_int <= '0';    
                  ARREADY_IM1_int <= '0';    
         
      END CASE;
      -- case (AR_MASGNT_IC)       
      
      
   END PROCESS;

   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         ARADDR_IS_int_xhdl14 <= (OTHERS => '0');    
         ARID_IS_int <= (OTHERS => '0');    
         ARLEN_IS_int <= (OTHERS => '0');    
         ARSIZE_IS_int <= (OTHERS => '0');    
         ARBURST_IS_int <= (OTHERS => '0');    
         ARLOCK_IS_int <= (OTHERS => '0');    
         ARCACHE_IS_int <= (OTHERS => '0');    
         ARPROT_IS_int <= "000";    
         ARVALID_IS_int <= '0';    
         MST_RDGNT_NUM_xhdl16 <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         ARADDR_IS_int_xhdl14 <= (OTHERS => '0');    
         ARID_IS_int <= (OTHERS => '0');    
         ARLEN_IS_int <= (OTHERS => '0');    
         ARSIZE_IS_int <= (OTHERS => '0');    
         ARBURST_IS_int <= (OTHERS => '0');    
         ARLOCK_IS_int <= (OTHERS => '0');    
         ARCACHE_IS_int <= (OTHERS => '0');    
         ARPROT_IS_int <= "000";    
         ARVALID_IS_int <= '0';    
         MST_RDGNT_NUM_xhdl16 <= (OTHERS => '0');
      ELSE 
         CASE AR_MASGNT_IC IS
            WHEN "0001" =>
                     ARADDR_IS_int_xhdl14 <= ARADDR_MI0;    
                     ARID_IS_int <= ARID_MI0;    
                     ARLEN_IS_int <= ARLEN_MI0;    
                     ARSIZE_IS_int <= ARSIZE_MI0;    
                     ARBURST_IS_int <= ARBURST_MI0;    
                     ARLOCK_IS_int <= ARLOCK_MI0;    
                     ARCACHE_IS_int <= ARCACHE_MI0;    
                     ARPROT_IS_int <= ARPROT_MI0;    
                     ARVALID_IS_int <= ARVALID_MI0;    
                     MST_RDGNT_NUM_xhdl16 <= "0001";    
            WHEN "0010" =>
                     ARADDR_IS_int_xhdl14 <= ARADDR_MI1;    
                     ARID_IS_int <= ARID_MI1;    
                     ARLEN_IS_int <= ARLEN_MI1;    
                     ARSIZE_IS_int <= ARSIZE_MI1;    
                     ARBURST_IS_int <= ARBURST_MI1;    
                     ARLOCK_IS_int <= ARLOCK_MI1;    
                     ARCACHE_IS_int <= ARCACHE_MI1;    
                     ARPROT_IS_int <= ARPROT_MI1;    
                     ARVALID_IS_int <= ARVALID_MI1;    
                     MST_RDGNT_NUM_xhdl16 <= "0010";    
            WHEN OTHERS  =>
                     ARID_IS_int <= (OTHERS => '0');    
                     ARLEN_IS_int <= (OTHERS => '0');    
                     ARSIZE_IS_int <= (OTHERS => '0');    
                     ARBURST_IS_int <= (OTHERS => '0');    
                     ARLOCK_IS_int <= (OTHERS => '0');    
                     ARCACHE_IS_int <= (OTHERS => '0');    
                     ARPROT_IS_int <= (OTHERS => '0');    
                     ARVALID_IS_int <= '0';    
                     MST_RDGNT_NUM_xhdl16 <= (OTHERS => '0');    
            
         END CASE;
         -- case (AR_MASGNT_IC)       
         
         
      END IF;
      END IF;
   END PROCESS;

   END GENERATE L2;
   L3: IF (NUM_MASTER_SLOT = 3) GENERATE
   
   PROCESS (ARREADY_SI, ARPROT_MI0, ARPROT_MI1, ARID_MI0, ARID_MI1, ARVALID_MI0,
   ARVALID_MI1, ARLEN_MI0, ARLEN_MI1, ARBURST_MI0, ARBURST_MI1,  
   ARSIZE_MI0, ARSIZE_MI1, AR_MASGNT_IC, ARLOCK_MI0, ARLOCK_MI1, 
   ARCACHE_MI0, ARADDR_MI0, ARCACHE_MI1, ARADDR_MI1)
   BEGIN
      CASE AR_MASGNT_IC IS
         WHEN "0001" =>
                  ARREADY_IM0_int <= ARREADY_SI;    
                  ARREADY_IM1_int <= '0';    
                  ARREADY_IM2_int <= '0';    
         WHEN "0010" =>
                  ARREADY_IM1_int <= ARREADY_SI;    
                  ARREADY_IM0_int <= '0';    
                  ARREADY_IM2_int <= '0';    
         WHEN "0100" =>
                  ARREADY_IM2_int <= ARREADY_SI;    
                  ARREADY_IM0_int <= '0';    
                  ARREADY_IM1_int <= '0';    
         WHEN OTHERS  =>
                  ARREADY_IM0_int <= '0';    
                  ARREADY_IM1_int <= '0';    
                  ARREADY_IM2_int <= '0';    
         
      END CASE;
      -- case (AR_MASGNT_IC)       
      
      
   END PROCESS;

   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         ARADDR_IS_int_xhdl14 <= (OTHERS => '0');    
         ARID_IS_int <= (OTHERS => '0');    
         ARLEN_IS_int <= (OTHERS => '0');    
         ARSIZE_IS_int <= (OTHERS => '0');    
         ARBURST_IS_int <= (OTHERS => '0');    
         ARLOCK_IS_int <= (OTHERS => '0');    
         ARCACHE_IS_int <= (OTHERS => '0');    
         ARPROT_IS_int <= (OTHERS => '0');    
         ARVALID_IS_int <= '0';    
         MST_RDGNT_NUM_xhdl16 <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         ARADDR_IS_int_xhdl14 <= (OTHERS => '0');    
         ARID_IS_int <= (OTHERS => '0');    
         ARLEN_IS_int <= (OTHERS => '0');    
         ARSIZE_IS_int <= (OTHERS => '0');    
         ARBURST_IS_int <= (OTHERS => '0');    
         ARLOCK_IS_int <= (OTHERS => '0');    
         ARCACHE_IS_int <= (OTHERS => '0');    
         ARPROT_IS_int <= (OTHERS => '0');    
         ARVALID_IS_int <= '0';    
         MST_RDGNT_NUM_xhdl16 <= (OTHERS => '0');
      ELSE 
         CASE AR_MASGNT_IC IS
            WHEN "0001" =>
                     ARADDR_IS_int_xhdl14 <= ARADDR_MI0;    
                     ARID_IS_int <= ARID_MI0;    
                     ARLEN_IS_int <= ARLEN_MI0;    
                     ARSIZE_IS_int <= ARSIZE_MI0;    
                     ARBURST_IS_int <= ARBURST_MI0;    
                     ARLOCK_IS_int <= ARLOCK_MI0;    
                     ARCACHE_IS_int <= ARCACHE_MI0;    
                     ARPROT_IS_int <= ARPROT_MI0;    
                     ARVALID_IS_int <= ARVALID_MI0;    
                     MST_RDGNT_NUM_xhdl16 <= "0001";    
            WHEN "0010" =>
                     ARADDR_IS_int_xhdl14 <= ARADDR_MI1;    
                     ARID_IS_int <= ARID_MI1;    
                     ARLEN_IS_int <= ARLEN_MI1;    
                     ARSIZE_IS_int <= ARSIZE_MI1;    
                     ARBURST_IS_int <= ARBURST_MI1;    
                     ARLOCK_IS_int <= ARLOCK_MI1;    
                     ARCACHE_IS_int <= ARCACHE_MI1;    
                     ARPROT_IS_int <= ARPROT_MI1;    
                     ARVALID_IS_int <= ARVALID_MI1;    
                     MST_RDGNT_NUM_xhdl16 <= "0010";    
            WHEN "0100" =>
                     ARADDR_IS_int_xhdl14 <= ARADDR_MI2;    
                     ARID_IS_int <= ARID_MI2;    
                     ARLEN_IS_int <= ARLEN_MI2;    
                     ARSIZE_IS_int <= ARSIZE_MI2;    
                     ARBURST_IS_int <= ARBURST_MI2;    
                     ARLOCK_IS_int <= ARLOCK_MI2;    
                     ARCACHE_IS_int <= ARCACHE_MI2;    
                     ARPROT_IS_int <= ARPROT_MI2;    
                     ARVALID_IS_int <= ARVALID_MI2;    
                     MST_RDGNT_NUM_xhdl16 <= "0100";    
            WHEN OTHERS  =>
                     ARID_IS_int <= (OTHERS => '0');    
                     ARLEN_IS_int <= (OTHERS => '0');    
                     ARSIZE_IS_int <= (OTHERS => '0');    
                     ARBURST_IS_int <= (OTHERS => '0');    
                     ARLOCK_IS_int <= (OTHERS => '0');    
                     ARCACHE_IS_int <= (OTHERS => '0');    
                     ARPROT_IS_int <= (OTHERS => '0');    
                     ARVALID_IS_int <= '0';    
                     MST_RDGNT_NUM_xhdl16 <= (OTHERS => '0');    
            
         END CASE;
         -- case (AR_MASGNT_IC)       
         
         
      END IF;
      END IF;
   END PROCESS;

   END GENERATE L3;
   L4: IF (NUM_MASTER_SLOT = 4) GENERATE
   
   PROCESS (ARREADY_SI, ARPROT_MI0, ARPROT_MI1, ARPROT_MI2, ARID_MI0, ARID_MI1, 
   ARID_MI2, ARVALID_MI0, ARVALID_MI1, ARLEN_MI0, ARVALID_MI2, ARLEN_MI1, 
   ARLEN_MI2, ARBURST_MI0, ARBURST_MI1, ARBURST_MI2, ARSIZE_MI0, 
   ARSIZE_MI1, ARSIZE_MI2, AR_MASGNT_IC, ARLOCK_MI0, ARLOCK_MI1, 
   ARLOCK_MI2, ARCACHE_MI0, ARADDR_MI0, ARCACHE_MI1, ARADDR_MI1, ARCACHE_MI2, 
   ARADDR_MI2)
   BEGIN
      CASE AR_MASGNT_IC IS
         WHEN "0001" =>
                  ARREADY_IM0_int <= ARREADY_SI;    
                  ARREADY_IM1_int <= '0';    
                  ARREADY_IM2_int <= '0';    
                  ARREADY_IM3_int <= '0';    
         WHEN "0010" =>
                  ARREADY_IM0_int <= '0';    
                  ARREADY_IM1_int <= ARREADY_SI;    
                  ARREADY_IM2_int <= '0';    
                  ARREADY_IM3_int <= '0';    
         WHEN "0100" =>
                  ARREADY_IM0_int <= '0';    
                  ARREADY_IM1_int <= '0';    
                  ARREADY_IM2_int <= ARREADY_SI;    
                  ARREADY_IM3_int <= '0';    
         WHEN "1000" =>
                  ARREADY_IM0_int <= '0';    
                  ARREADY_IM1_int <= '0';    
                  ARREADY_IM2_int <= '0';    
                  ARREADY_IM3_int <= ARREADY_SI;    
         WHEN OTHERS  =>
                  ARREADY_IM0_int <= '0';    
                  ARREADY_IM1_int <= '0';    
                  ARREADY_IM2_int <= '0';    
                  ARREADY_IM3_int <= '0';    
         
      END CASE;
      -- case (AR_MASGNT_IC)       
      
      
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         ARADDR_IS_int_xhdl14 <= (OTHERS => '0');    
         ARID_IS_int <= (OTHERS => '0');    
         ARLEN_IS_int <= (OTHERS => '0');       
         ARSIZE_IS_int <= (OTHERS => '0');    
         ARBURST_IS_int <= (OTHERS => '0');    
         ARLOCK_IS_int <= (OTHERS => '0');    
         ARCACHE_IS_int <= (OTHERS => '0');    
         ARPROT_IS_int <= (OTHERS => '0');    
         ARVALID_IS_int <= '0';    
         MST_RDGNT_NUM_xhdl16 <= (OTHERS => '0');
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         ARADDR_IS_int_xhdl14 <= (OTHERS => '0');    
         ARID_IS_int <= (OTHERS => '0');    
         ARLEN_IS_int <= (OTHERS => '0');       
         ARSIZE_IS_int <= (OTHERS => '0');    
         ARBURST_IS_int <= (OTHERS => '0');    
         ARLOCK_IS_int <= (OTHERS => '0');    
         ARCACHE_IS_int <= (OTHERS => '0');    
         ARPROT_IS_int <= (OTHERS => '0');    
         ARVALID_IS_int <= '0';    
         MST_RDGNT_NUM_xhdl16 <= (OTHERS => '0');
      ELSE 
         CASE AR_MASGNT_IC IS
            WHEN "0001" =>
                     ARADDR_IS_int_xhdl14 <= ARADDR_MI0;    
                     ARID_IS_int <= ARID_MI0;    
                     ARLEN_IS_int <= ARLEN_MI0;    
                     ARSIZE_IS_int <= ARSIZE_MI0;    
                     ARBURST_IS_int <= ARBURST_MI0;    
                     ARLOCK_IS_int <= ARLOCK_MI0;    
                     ARCACHE_IS_int <= ARCACHE_MI0;    
                     ARPROT_IS_int <= ARPROT_MI0;    
                     ARVALID_IS_int <= ARVALID_MI0;    
                     MST_RDGNT_NUM_xhdl16 <= "0001";    
            WHEN "0010" =>
                     ARADDR_IS_int_xhdl14 <= ARADDR_MI1;    
                     ARID_IS_int <= ARID_MI1;    
                     ARLEN_IS_int <= ARLEN_MI1;    
                     ARSIZE_IS_int <= ARSIZE_MI1;    
                     ARBURST_IS_int <= ARBURST_MI1;    
                     ARLOCK_IS_int <= ARLOCK_MI1;    
                     ARCACHE_IS_int <= ARCACHE_MI1;    
                     ARPROT_IS_int <= ARPROT_MI1;    
                     ARVALID_IS_int <= ARVALID_MI1;    
                     MST_RDGNT_NUM_xhdl16 <= "0010";    
            WHEN "0100" =>
                     ARADDR_IS_int_xhdl14 <= ARADDR_MI2;    
                     ARID_IS_int <= ARID_MI2;    
                     ARLEN_IS_int <= ARLEN_MI2;    
                     ARSIZE_IS_int <= ARSIZE_MI2;    
                     ARBURST_IS_int <= ARBURST_MI2;    
                     ARLOCK_IS_int <= ARLOCK_MI2;    
                     ARCACHE_IS_int <= ARCACHE_MI2;    
                     ARPROT_IS_int <= ARPROT_MI2;    
                     ARVALID_IS_int <= ARVALID_MI2;    
                     MST_RDGNT_NUM_xhdl16 <= "0100";    
            WHEN "1000" =>
                     ARADDR_IS_int_xhdl14 <= ARADDR_MI3;    
                     ARID_IS_int <= ARID_MI3;    
                     ARLEN_IS_int <= ARLEN_MI3;    
                     ARSIZE_IS_int <= ARSIZE_MI3;    
                     ARBURST_IS_int <= ARBURST_MI3;    
                     ARLOCK_IS_int <= ARLOCK_MI3;    
                     ARCACHE_IS_int <= ARCACHE_MI3;    
                     ARPROT_IS_int <= ARPROT_MI3;    
                     ARVALID_IS_int <= ARVALID_MI3;    
                     MST_RDGNT_NUM_xhdl16 <= "1000";    
            WHEN OTHERS  =>
                     ARID_IS_int <= (OTHERS => '0');    
                     ARLEN_IS_int <= (OTHERS => '0');     
                     ARSIZE_IS_int <= (OTHERS => '0');    
                     ARBURST_IS_int <= (OTHERS => '0');    
                     ARLOCK_IS_int <= (OTHERS => '0');    
                     ARCACHE_IS_int <= (OTHERS => '0');    
                     ARPROT_IS_int <= (OTHERS => '0');    
                     ARVALID_IS_int <= '0';    
                     MST_RDGNT_NUM_xhdl16 <= (OTHERS => '0');    
            
         END CASE;
         -- case (AR_MASGNT_IC)       
         
         
      END IF;
      END IF;
   END PROCESS;

   END GENERATE L4;
   -- --------------------------------------------------------------------------
   -- Select Slave slot for Write
   -- --------------------------------------------------------------------------
   
   PROCESS (ARCACHE_MI3, ARBURST_MI0, ARBURST_MI1, ARBURST_MI2, ARBURST_MI3, 
   ARLOCK_MI0, ARLOCK_MI1, ARLOCK_MI2, ARLOCK_MI3, ARADDR_MI0,
   ARADDR_MI1, ARADDR_MI2, ARADDR_MI3, ARPROT_MI0, ARVALID_M0,
   ARPROT_MI1, ARPROT_MI2, ARID_MI0, ARPROT_MI3, ARID_MI1,  
   ARVALID_MI0, ARID_MI2, ARLEN_MI0, ARVALID_MI1, ARID_MI3,  
   ARLEN_MI1, ARVALID_MI2, ARVALID_MI3, ARLEN_MI2, ARLEN_MI3, 
   ARADDR_M0, ARSIZE_MI0, ARSIZE_MI1, ARSIZE_MI2, ARSIZE_MI3, 
   AR_MASGNT_IC, ARCACHE_MI0, ARCACHE_MI1, ARCACHE_MI2)
      VARIABLE SLAVE_SELECT_READ_M0_xhdl22  : std_logic_vector(16 DOWNTO 0);
      VARIABLE temp_xhdl23  : std_logic_vector(4 DOWNTO 0);
   BEGIN
      IF (ARVALID_M0 = '1' AND ARADDR_M0(31) = '1') THEN
         SLAVE_SELECT_READ_M0_xhdl22 := SLAVE_N;    
      ELSE
         temp_xhdl23 := ARVALID_M0 & ARADDR_M0(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH 
         - 4);
         CASE temp_xhdl23 IS
            WHEN "10000" |
                 "11000" =>
                     SLAVE_SELECT_READ_M0_xhdl22 := SLAVE_8;    
            WHEN "10001" |
                 "11001" =>
                     SLAVE_SELECT_READ_M0_xhdl22 := SLAVE_9;    
            WHEN "10010" |
                 "11010" =>
                     SLAVE_SELECT_READ_M0_xhdl22 := SLAVE_A;    
            WHEN "10011" |
                 "11011" =>
                     SLAVE_SELECT_READ_M0_xhdl22 := SLAVE_B;    
            WHEN "10100" |
                 "11100" =>
                     SLAVE_SELECT_READ_M0_xhdl22 := SLAVE_C;    
            WHEN "10101" |
                 "11101" =>
                     SLAVE_SELECT_READ_M0_xhdl22 := SLAVE_D;    
            WHEN "10110" |
                 "11110" =>
                     SLAVE_SELECT_READ_M0_xhdl22 := SLAVE_E;    
            WHEN "10111" |
                 "11111" =>
                     SLAVE_SELECT_READ_M0_xhdl22 := SLAVE_F;    
            WHEN OTHERS  =>
                     SLAVE_SELECT_READ_M0_xhdl22 := (OTHERS => '0');    
            
         END CASE;
         -- case ({ARVALID_MI0,ARADDR_MI0[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
         
         
      END IF;
      
      SLAVE_SELECT_READ_M0 <= SLAVE_SELECT_READ_M0_xhdl22;
   END PROCESS;


   -- --------------------------------------------------------------------------
   -- Select Slave slot for Write
   -- --------------------------------------------------------------------------
   
   PROCESS (ARADDR_M1, ARVALID_M1)
      VARIABLE SLAVE_SELECT_READ_M1_xhdl24  : std_logic_vector(16 DOWNTO 0);
      VARIABLE temp_xhdl25  : std_logic_vector(4 DOWNTO 0);
   BEGIN
      IF (ARVALID_M1 = '1' AND ARADDR_M1(31) = '1') THEN
         SLAVE_SELECT_READ_M1_xhdl24 := SLAVE_N;    
      ELSE
         temp_xhdl25 := ARVALID_M1 & ARADDR_M1(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH 
         - 4);
         CASE temp_xhdl25 IS
            WHEN "10000" |
                 "11000" =>
                     SLAVE_SELECT_READ_M1_xhdl24 := SLAVE_8;    
            WHEN "10001" |
                 "11001" =>
                     SLAVE_SELECT_READ_M1_xhdl24 := SLAVE_9;    
            WHEN "10010" |
                 "11010" =>
                     SLAVE_SELECT_READ_M1_xhdl24 := SLAVE_A;    
            WHEN "10011" |
                 "11011" =>
                     SLAVE_SELECT_READ_M1_xhdl24 := SLAVE_B;    
            WHEN "10100" |
                 "11100" =>
                     SLAVE_SELECT_READ_M1_xhdl24 := SLAVE_C;    
            WHEN "10101" |
                 "11101" =>
                     SLAVE_SELECT_READ_M1_xhdl24 := SLAVE_D;    
            WHEN "10110" |
                 "11110" =>
                     SLAVE_SELECT_READ_M1_xhdl24 := SLAVE_E;    
            WHEN "10111" |
                 "11111" =>
                     SLAVE_SELECT_READ_M1_xhdl24 := SLAVE_F;    
            WHEN OTHERS  =>
                     SLAVE_SELECT_READ_M1_xhdl24 := (OTHERS => '0');    
            
         END CASE;
         -- case ({ARVALID_MI1,ARADDR_MI1[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
         
         
      END IF;
      
      
      SLAVE_SELECT_READ_M1 <= SLAVE_SELECT_READ_M1_xhdl24;
   END PROCESS;

   
   PROCESS (ARADDR_M2, ARVALID_M2)
      VARIABLE SLAVE_SELECT_READ_M2_xhdl26  : std_logic_vector(16 DOWNTO 0);
      VARIABLE temp_xhdl27  : std_logic_vector(4 DOWNTO 0);
   BEGIN
      IF (ARVALID_M2 = '1' AND ARADDR_M2(31) = '1') THEN
         SLAVE_SELECT_READ_M2_xhdl26 := SLAVE_N;    
      ELSE
         temp_xhdl27 := ARVALID_M2 & ARADDR_M2(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH 
         - 4);
         CASE temp_xhdl27 IS
            WHEN "10000" |
                 "11000" =>
                     SLAVE_SELECT_READ_M2_xhdl26 := SLAVE_8;    
            WHEN "10001" |
                 "11001" =>
                     SLAVE_SELECT_READ_M2_xhdl26 := SLAVE_9;    
            WHEN "10010" |
                 "11010" =>
                     SLAVE_SELECT_READ_M2_xhdl26 := SLAVE_A;    
            WHEN "10011" |
                 "11011" =>
                     SLAVE_SELECT_READ_M2_xhdl26 := SLAVE_B;    
            WHEN "10100" |
                 "11100" =>
                     SLAVE_SELECT_READ_M2_xhdl26 := SLAVE_C;    
            WHEN "10101" |
                 "11101" =>
                     SLAVE_SELECT_READ_M2_xhdl26 := SLAVE_D;    
            WHEN "10110" |
                 "11110" =>
                     SLAVE_SELECT_READ_M2_xhdl26 := SLAVE_E;    
            WHEN "10111" |
                 "11111" =>
                     SLAVE_SELECT_READ_M2_xhdl26 := SLAVE_F;    
            WHEN OTHERS  =>
                     SLAVE_SELECT_READ_M2_xhdl26 := (OTHERS => '0');    
            
         END CASE;
         -- case ({ARVALID_MI2,ARADDR_MI2[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
         
         
      END IF;
      
      SLAVE_SELECT_READ_M2 <= SLAVE_SELECT_READ_M2_xhdl26;
   END PROCESS;

   PROCESS (ARADDR_M3,ARVALID_M3)
      VARIABLE SLAVE_SELECT_READ_M3_xhdl28  : std_logic_vector(16 DOWNTO 0);
      VARIABLE temp_xhdl29  : std_logic_vector(4 DOWNTO 0);
   BEGIN
      IF (ARVALID_M3 = '1' AND ARADDR_M3(31) = '1') THEN
         SLAVE_SELECT_READ_M3_xhdl28 := SLAVE_N;    
      ELSE
         temp_xhdl29 := ARVALID_M3 & ARADDR_M3(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH 
         - 4);
         CASE temp_xhdl29 IS
            WHEN "10000" |
                 "11000" =>
                     SLAVE_SELECT_READ_M3_xhdl28 := SLAVE_8;    
            WHEN "10001" |
                 "11001" =>
                     SLAVE_SELECT_READ_M3_xhdl28 := SLAVE_9;    
            WHEN "10010" |
                 "11010" =>
                     SLAVE_SELECT_READ_M3_xhdl28 := SLAVE_A;    
            WHEN "10011" |
                 "11011" =>
                     SLAVE_SELECT_READ_M3_xhdl28 := SLAVE_B;    
            WHEN "10100" |
                 "11100" =>
                     SLAVE_SELECT_READ_M3_xhdl28 := SLAVE_C;    
            WHEN "10101" |
                 "11101" =>
                     SLAVE_SELECT_READ_M3_xhdl28 := SLAVE_D;    
            WHEN "10110" |
                 "11110" =>
                     SLAVE_SELECT_READ_M3_xhdl28 := SLAVE_E;    
            WHEN "10111" |
                 "11111" =>
                     SLAVE_SELECT_READ_M3_xhdl28 := SLAVE_F;    
            WHEN OTHERS  =>
                     SLAVE_SELECT_READ_M3_xhdl28 := (OTHERS => '0');    
            
         END CASE;
         -- case ({ARVALID_MI3,ARADDR_MI3[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
         
         
      END IF;
      
      SLAVE_SELECT_READ_M3 <= SLAVE_SELECT_READ_M3_xhdl28;
   END PROCESS;

   -----------------------------------------------------------------------------
   -- Generate the read requests to the arbiter 
   -----------------------------------------------------------------------------
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         AR_REQ_MI0 <= '0';    
         AR_REQ_MI1 <= '0';    
         AR_REQ_MI2 <= '0';    
         AR_REQ_MI3 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         AR_REQ_MI0 <= '0';    
         AR_REQ_MI1 <= '0';    
         AR_REQ_MI2 <= '0';    
         AR_REQ_MI3 <= '0';
      ELSE 
         IF ( (or_br(SLAVE_SELECT_READ_M0) = '1') AND ((SLAVE_NUMBER = ARADDR_M0(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) AND (ARADDR_M0(31) = '0')) OR (ARADDR_M0(31) = '1'))) THEN
            AR_REQ_MI0 <= '1';
         ELSE 
            AR_REQ_MI0 <= '0';
         END IF;

         IF ( (or_br(SLAVE_SELECT_READ_M1) = '1') AND ((SLAVE_NUMBER = ARADDR_M1(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) AND (ARADDR_M1(31) = '0')) OR (ARADDR_M1(31) = '1'))) THEN
            AR_REQ_MI1 <= '1';
         ELSE 
            AR_REQ_MI1 <= '0';
         END IF;

         IF ( (or_br(SLAVE_SELECT_READ_M2) = '1') AND ((SLAVE_NUMBER = ARADDR_M2(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) AND (ARADDR_M2(31) = '0')) OR (ARADDR_M2(31) = '1'))) THEN
            AR_REQ_MI2 <= '1';
         ELSE 
            AR_REQ_MI2 <= '0';
         END IF;

         IF ( (or_br(SLAVE_SELECT_READ_M3) = '1') AND ((SLAVE_NUMBER = ARADDR_M3(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) AND (ARADDR_M3(31) = '0')) OR (ARADDR_M3(31) = '1'))) THEN
            AR_REQ_MI3 <= '1';
         ELSE 
            AR_REQ_MI3 <= '0';
         END IF;
      END IF;
      END IF;
   END PROCESS;
   
   -----------------------------------------------------------------------------
   -- Generate the Slave select signal for Write address based on the 
   -- ARADDR coming from the selected(granted) Master stage
   -----------------------------------------------------------------------------
   -- --------------------------------------------------------------------------
   -- Select Slave slot for Write
   -- --------------------------------------------------------------------------
   
   PROCESS (ARVALID_IS_xhdl13, SLAVE_SELECT_RADDRCH_M_r,  
   SLAVE_SELECT_READ_M0, 
   SLAVE_SELECT_READ_M1, SLAVE_SELECT_READ_M2, 
   SLAVE_SELECT_READ_M3, ARADDR_M0, ARADDR_M1, ARADDR_M2, ARADDR_M3, 
   ARADDR_IS_xhdl6)
      VARIABLE SLAVE_SELECT_RADDRCH_M_xhdl15_xhdl30  : std_logic_vector(16 
      DOWNTO 0);
      VARIABLE temp_xhdl31  : std_logic_vector(4 DOWNTO 0);
   BEGIN
      IF (ARVALID_IS_xhdl13 = '1' AND ARADDR_IS_xhdl6(31) = '1') THEN
         SLAVE_SELECT_RADDRCH_M_xhdl15_xhdl30 := SLAVE_N;    
      ELSE
         temp_xhdl31 := ARVALID_IS_xhdl13 & ARADDR_IS_xhdl6(AXI_AWIDTH - 1 
         DOWNTO AXI_AWIDTH - 4);
         CASE temp_xhdl31 IS
            WHEN "10000" |
                 "11000" =>
                     SLAVE_SELECT_RADDRCH_M_xhdl15_xhdl30 := SLAVE_8;    
            WHEN "10001" |
                 "11001" =>
                     SLAVE_SELECT_RADDRCH_M_xhdl15_xhdl30 := SLAVE_9;    
            WHEN "10010" |
                 "11010" =>
                     SLAVE_SELECT_RADDRCH_M_xhdl15_xhdl30 := SLAVE_A;    
            WHEN "10011" |
                 "11011" =>
                     SLAVE_SELECT_RADDRCH_M_xhdl15_xhdl30 := SLAVE_B;    
            WHEN "10100" |
                 "11100" =>
                     SLAVE_SELECT_RADDRCH_M_xhdl15_xhdl30 := SLAVE_C;    
            WHEN "10101" |
                 "11101" =>
                     SLAVE_SELECT_RADDRCH_M_xhdl15_xhdl30 := SLAVE_D;    
            WHEN "10110" |
                 "11110" =>
                     SLAVE_SELECT_RADDRCH_M_xhdl15_xhdl30 := SLAVE_E;    
            WHEN "10111" |
                 "11111" =>
                     SLAVE_SELECT_RADDRCH_M_xhdl15_xhdl30 := SLAVE_F;    
            WHEN OTHERS  =>
                     SLAVE_SELECT_RADDRCH_M_xhdl15_xhdl30 := 
                     SLAVE_SELECT_RADDRCH_M_r;    
            
         END CASE;
         -- case ({ARVALID_IS,ARADDR_IS[AXI_AWIDTH - 1:AXI_AWIDTH-4]})
         
         
      END IF;
      
      SLAVE_SELECT_RADDRCH_M_xhdl15 <= SLAVE_SELECT_RADDRCH_M_xhdl15_xhdl30;
   END PROCESS;

   -- Latch Write data channel signals
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         SLAVE_SELECT_RADDRCH_M_r <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         SLAVE_SELECT_RADDRCH_M_r <= (OTHERS => '0');    
      ELSE 
         SLAVE_SELECT_RADDRCH_M_r <= SLAVE_SELECT_RADDRCH_M_xhdl15;    
      END IF;
      END IF;
   END PROCESS;
   
   -- -----------------------------------------------------
   -- Read Arbiter Instance
   -- -----------------------------------------------------
   URA_ARBITER0 : axi_RA_ARBITER 
      GENERIC MAP (
         SYNC_RESET => SYNC_RESET,
         NUM_MASTER_SLOT => NUM_MASTER_SLOT,
         AXI_AWIDTH => AXI_AWIDTH,
         AXI_STRBWIDTH => AXI_STRBWIDTH,
         AXI_DWIDTH => AXI_DWIDTH,
         INP_REG_BUF => INP_REG_BUF,
         OUT_REG_BUF => OUT_REG_BUF)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         ARLOCK_M0 => ARLOCK_M0,
         ARLOCK_M1 => ARLOCK_M1,
         ARLOCK_M2 => ARLOCK_M2,
         ARLOCK_M3 => ARLOCK_M3,
         ARLOCK_MI0 => ARLOCK_MI0,
         ARLOCK_MI1 => ARLOCK_MI1,
         ARLOCK_MI2 => ARLOCK_MI2,
         ARLOCK_MI3 => ARLOCK_MI3,
         m0_rd_end => m0_rd_end,
         m1_rd_end => m1_rd_end,
         m2_rd_end => m2_rd_end,
         m3_rd_end => m3_rd_end,
         AR_REQ_MI0 => AR_REQ_MI0,
         AR_REQ_MI1 => AR_REQ_MI1,
         AR_REQ_MI2 => AR_REQ_MI2,
         AR_REQ_MI3 => AR_REQ_MI3,
         AR_MASGNT_MI => AR_MASGNT_IC);   
   

END ARCHITECTURE translated;
