--**************************************************************************-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description: interconnect_ntom - Bridge interconnect matrix 
--              This is n-to-m interconnect matrix file
--              Contains:
--                       - Arbiter
--                       - Decoder
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
   USE work.axi_pkg.all; 

ENTITY axi_wa_channel IS
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
      -- For Arbiter from Masters
-- To end grant to current master

      m0_wr_end               : IN std_logic;   
      m1_wr_end               : IN std_logic;   
      m2_wr_end               : IN std_logic;   
      m3_wr_end               : IN std_logic;   
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
      AWLEN_IS                : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS               : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS              : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS               : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS              : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS               : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS              : OUT std_logic;   
      AWREADY_SI              : IN std_logic;   
      AWADDR_IS_int           : OUT std_logic_vector(31 DOWNTO 0);   
      MST_WRGNT_NUM           : OUT std_logic_vector(3 DOWNTO 0);   
      gated_waddr             : OUT std_logic_vector(16 DOWNTO 0);   
      SLAVE_NUMBER            : IN std_logic_vector(4 DOWNTO 0));   
END ENTITY axi_wa_channel;

ARCHITECTURE translated OF axi_wa_channel IS

   COMPONENT axi_wrmatrix_4Mto1S
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

         AWID_MI0                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
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

         AWID_MI1                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
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

         AWID_MI2                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
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

         AWID_MI3                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
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

         AWID_IS                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
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
   END COMPONENT;

   COMPONENT axi_wrmatrix_4Mto1S_hgs_low
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

         AWID_MI0                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
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

         AWID_MI1                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
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

         AWID_MI2                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
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

         AWID_MI3                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
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

         AWID_IS                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
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
   END COMPONENT;

   COMPONENT axi_wrmatrix_4Mto1S_hgs_high
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

         AWID_MI0                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
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

         AWID_MI1                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
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

         AWID_MI2                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
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

         AWID_MI3                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
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

         AWID_IS                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
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
   END COMPONENT;


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
   SIGNAL AWID_IC                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IC                :  std_logic_vector(31 DOWNTO 0);   
   SIGNAL AWLEN_IC                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IC                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IC               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IC                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IC               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IC                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IC               :  std_logic;   
   SIGNAL AWREADY_IM0_xhdl1        :  std_logic;   
   SIGNAL AWREADY_IM1_xhdl2        :  std_logic;   
   SIGNAL AWREADY_IM2_xhdl3        :  std_logic;   
   SIGNAL AWREADY_IM3_xhdl4        :  std_logic;   
   SIGNAL AWID_IS_xhdl5            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS_xhdl6          :  std_logic_vector(31 DOWNTO 0);   
   SIGNAL AWLEN_IS_xhdl7           :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS_xhdl8          :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS_xhdl9         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS_xhdl10         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS_xhdl11        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS_xhdl12         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS_xhdl13        :  std_logic;   
   SIGNAL AWADDR_IS_int_xhdl14     :  std_logic_vector(31 DOWNTO 0);   
   SIGNAL gated_waddr_xhdl15       :  std_logic_vector(16 DOWNTO 0);   
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
   AWLEN_IS <= AWLEN_IS_xhdl7;
   AWSIZE_IS <= AWSIZE_IS_xhdl8;
   AWBURST_IS <= AWBURST_IS_xhdl9;
   AWLOCK_IS <= AWLOCK_IS_xhdl10;
   AWCACHE_IS <= AWCACHE_IS_xhdl11;
   AWPROT_IS <= AWPROT_IS_xhdl12;
   AWVALID_IS <= AWVALID_IS_xhdl13;
   AWADDR_IS_int <= AWADDR_IS_int_xhdl14;
   gated_waddr <= gated_waddr_xhdl15;
   MST_WRGNT_NUM <= MST_WRGNT_NUM_xhdl16;
   
   -- --------------------------------------------------------------------------
   -- Select the Master signals based the grant provided by the arbiter
   -- --------------------------------------------------------------------------

   L1: IF (MEMSPACE > 0) GENERATE

    inst_wrmatrix_4Mto1S : axi_wrmatrix_4Mto1S 
      GENERIC MAP (
         SYNC_RESET => SYNC_RESET,
         M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
         M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
         M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
         M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
         M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
         M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
         M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
         NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
         FEED_THROUGH => FEED_THROUGH,
         M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
         WR_ACCEPTANCE => WR_ACCEPTANCE,
         AXI_AWIDTH => AXI_AWIDTH,
         M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
         M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
         M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
         MEMSPACE => MEMSPACE,
         M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
         M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
         M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
         M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
         M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
         M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
         M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
         M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
         INP_REG_BUF => INP_REG_BUF,
         ID_WIDTH => ID_WIDTH,
         SC_10 => SC_10,
         SC_11 => SC_11,
         M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
         SC_12 => SC_12,
         M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
         SC_13 => SC_13,
         SC_14 => SC_14,
         M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
         SC_15 => SC_15,
         M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
         M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
         ADDR_HGS_CFG => ADDR_HGS_CFG,
         BASE_ID_WIDTH => BASE_ID_WIDTH,
         M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
         M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
         M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
         M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
         M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
         M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
         M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
         M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
         M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
         M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
         M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
         AXI_DWIDTH => AXI_DWIDTH,
         M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
         M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
         M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
         M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
         NUM_MASTER_SLOT => NUM_MASTER_SLOT,
         SC_0 => SC_0,
         M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
         SC_1 => SC_1,
         SC_2 => SC_2,
         M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
         SC_3 => SC_3,
         SC_4 => SC_4,
         M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
         M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
         SC_5 => SC_5,
         SC_6 => SC_6,
         M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
         SC_7 => SC_7,
         SC_8 => SC_8,
         M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
         SC_9 => SC_9,
         M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
         M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
         M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
         M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
         M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
         M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
         M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
         M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
         RD_ACCEPTANCE => RD_ACCEPTANCE,
         HGS_CFG => HGS_CFG,
         M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
         M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
         M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
         M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
         OUT_REG_BUF => OUT_REG_BUF,
         M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
         M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
         M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
         M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
         M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
         M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
         M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
         M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
         M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
         M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
         M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWADDR_M0 => AWADDR_M0,
         AWVALID_M0 => AWVALID_M0,
         AWLOCK_M0 => AWLOCK_M0,
         AWADDR_M1 => AWADDR_M1,
         AWVALID_M1 => AWVALID_M1,
         AWLOCK_M1 => AWLOCK_M1,
         AWADDR_M2 => AWADDR_M2,
         AWVALID_M2 => AWVALID_M2,
         AWLOCK_M2 => AWLOCK_M2,
         AWADDR_M3 => AWADDR_M3,
         AWVALID_M3 => AWVALID_M3,
         AWLOCK_M3 => AWLOCK_M3,
         m0_wr_end => m0_wr_end,
         m1_wr_end => m1_wr_end,
         m2_wr_end => m2_wr_end,
         m3_wr_end => m3_wr_end,
         AWREADY_SI => AWREADY_SI,
         BVALID_SI => BVALID_SI,
         BREADY_IS => BREADY_IS,
         AWID_MI0 => AWID_MI0,
         AWADDR_MI0 => AWADDR_MI0,
         AWLEN_MI0 => AWLEN_MI0,
         AWSIZE_MI0 => AWSIZE_MI0,
         AWBURST_MI0 => AWBURST_MI0,
         AWLOCK_MI0 => AWLOCK_MI0,
         AWCACHE_MI0 => AWCACHE_MI0,
         AWPROT_MI0 => AWPROT_MI0,
         AWVALID_MI0 => AWVALID_MI0,
         AWREADY_IM0 => AWREADY_IM0_xhdl1,
         AWID_MI1 => AWID_MI1,
         AWADDR_MI1 => AWADDR_MI1,
         AWLEN_MI1 => AWLEN_MI1,
         AWSIZE_MI1 => AWSIZE_MI1,
         AWBURST_MI1 => AWBURST_MI1,
         AWLOCK_MI1 => AWLOCK_MI1,
         AWCACHE_MI1 => AWCACHE_MI1,
         AWPROT_MI1 => AWPROT_MI1,
         AWVALID_MI1 => AWVALID_MI1,
         AWREADY_IM1 => AWREADY_IM1_xhdl2,
         AWID_MI2 => AWID_MI2,
         AWADDR_MI2 => AWADDR_MI2,
         AWLEN_MI2 => AWLEN_MI2,
         AWSIZE_MI2 => AWSIZE_MI2,
         AWBURST_MI2 => AWBURST_MI2,
         AWLOCK_MI2 => AWLOCK_MI2,
         AWCACHE_MI2 => AWCACHE_MI2,
         AWPROT_MI2 => AWPROT_MI2,
         AWVALID_MI2 => AWVALID_MI2,
         AWREADY_IM2 => AWREADY_IM2_xhdl3,
         AWID_MI3 => AWID_MI3,
         AWADDR_MI3 => AWADDR_MI3,
         AWLEN_MI3 => AWLEN_MI3,
         AWSIZE_MI3 => AWSIZE_MI3,
         AWBURST_MI3 => AWBURST_MI3,
         AWLOCK_MI3 => AWLOCK_MI3,
         AWCACHE_MI3 => AWCACHE_MI3,
         AWPROT_MI3 => AWPROT_MI3,
         AWVALID_MI3 => AWVALID_MI3,
         AWREADY_IM3 => AWREADY_IM3_xhdl4,
         AWID_IS => AWID_IS_xhdl5,
         AWADDR_IS => AWADDR_IS_xhdl6,
         AWLEN_IS => AWLEN_IS_xhdl7,
         AWSIZE_IS => AWSIZE_IS_xhdl8,
         AWBURST_IS => AWBURST_IS_xhdl9,
         AWLOCK_IS => AWLOCK_IS_xhdl10,
         AWCACHE_IS => AWCACHE_IS_xhdl11,
         AWPROT_IS => AWPROT_IS_xhdl12,
         AWVALID_IS => AWVALID_IS_xhdl13,
         AWADDR_IS_int => AWADDR_IS_int_xhdl14,
         MST_WRGNT_NUM => MST_WRGNT_NUM_xhdl16,
         SLAVE_SELECT_WADDRCH_M => gated_waddr_xhdl15,
         SLAVE_NUMBER => SLAVE_NUMBER);   
   
   
   --   end // if (MEMSPACE > 0)
   --endgenerate
   END GENERATE L1;

   --generate
   --   if(MEMSPACE == 0 && ADDR_HGS_CFG == 0) begin
   L2: IF (MEMSPACE = 0 AND ADDR_HGS_CFG = 0) GENERATE
   inst_wrmatrix_4Mto1S_hgs_low : axi_wrmatrix_4Mto1S_hgs_low 
      GENERIC MAP (
         SYNC_RESET => SYNC_RESET,
         M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
         M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
         M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
         M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
         M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
         M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
         M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
         NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
         FEED_THROUGH => FEED_THROUGH,
         M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
         WR_ACCEPTANCE => WR_ACCEPTANCE,
         AXI_AWIDTH => AXI_AWIDTH,
         M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
         M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
         M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
         MEMSPACE => MEMSPACE,
         M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
         M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
         M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
         M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
         M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
         M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
         M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
         M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
         INP_REG_BUF => INP_REG_BUF,
         ID_WIDTH => ID_WIDTH,
         SC_10 => SC_10,
         SC_11 => SC_11,
         M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
         SC_12 => SC_12,
         M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
         SC_13 => SC_13,
         SC_14 => SC_14,
         M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
         SC_15 => SC_15,
         M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
         M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
         ADDR_HGS_CFG => ADDR_HGS_CFG,
         BASE_ID_WIDTH => BASE_ID_WIDTH,
         M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
         M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
         M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
         M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
         M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
         M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
         M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
         M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
         M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
         M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
         M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
         AXI_DWIDTH => AXI_DWIDTH,
         M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
         M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
         M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
         M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
         NUM_MASTER_SLOT => NUM_MASTER_SLOT,
         SC_0 => SC_0,
         M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
         SC_1 => SC_1,
         SC_2 => SC_2,
         M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
         SC_3 => SC_3,
         SC_4 => SC_4,
         M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
         M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
         SC_5 => SC_5,
         SC_6 => SC_6,
         M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
         SC_7 => SC_7,
         SC_8 => SC_8,
         M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
         SC_9 => SC_9,
         M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
         M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
         M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
         M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
         M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
         M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
         M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
         M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
         RD_ACCEPTANCE => RD_ACCEPTANCE,
         HGS_CFG => HGS_CFG,
         M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
         M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
         M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
         M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
         OUT_REG_BUF => OUT_REG_BUF,
         M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
         M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
         M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
         M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
         M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
         M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
         M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
         M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
         M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
         M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
         M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWADDR_M0 => AWADDR_M0,
         AWVALID_M0 => AWVALID_M0,
         AWLOCK_M0 => AWLOCK_M0,
         AWADDR_M1 => AWADDR_M1,
         AWVALID_M1 => AWVALID_M1,
         AWLOCK_M1 => AWLOCK_M1,
         AWADDR_M2 => AWADDR_M2,
         AWVALID_M2 => AWVALID_M2,
         AWLOCK_M2 => AWLOCK_M2,
         AWADDR_M3 => AWADDR_M3,
         AWVALID_M3 => AWVALID_M3,
         AWLOCK_M3 => AWLOCK_M3,
         m0_wr_end => m0_wr_end,
         m1_wr_end => m1_wr_end,
         m2_wr_end => m2_wr_end,
         m3_wr_end => m3_wr_end,
         AWREADY_SI => AWREADY_SI,
         BVALID_SI => BVALID_SI,
         BREADY_IS => BREADY_IS,
         AWID_MI0 => AWID_MI0,
         AWADDR_MI0 => AWADDR_MI0,
         AWLEN_MI0 => AWLEN_MI0,
         AWSIZE_MI0 => AWSIZE_MI0,
         AWBURST_MI0 => AWBURST_MI0,
         AWLOCK_MI0 => AWLOCK_MI0,
         AWCACHE_MI0 => AWCACHE_MI0,
         AWPROT_MI0 => AWPROT_MI0,
         AWVALID_MI0 => AWVALID_MI0,
         AWREADY_IM0 => AWREADY_IM0_xhdl1,
         AWID_MI1 => AWID_MI1,
         AWADDR_MI1 => AWADDR_MI1,
         AWLEN_MI1 => AWLEN_MI1,
         AWSIZE_MI1 => AWSIZE_MI1,
         AWBURST_MI1 => AWBURST_MI1,
         AWLOCK_MI1 => AWLOCK_MI1,
         AWCACHE_MI1 => AWCACHE_MI1,
         AWPROT_MI1 => AWPROT_MI1,
         AWVALID_MI1 => AWVALID_MI1,
         AWREADY_IM1 => AWREADY_IM1_xhdl2,
         AWID_MI2 => AWID_MI2,
         AWADDR_MI2 => AWADDR_MI2,
         AWLEN_MI2 => AWLEN_MI2,
         AWSIZE_MI2 => AWSIZE_MI2,
         AWBURST_MI2 => AWBURST_MI2,
         AWLOCK_MI2 => AWLOCK_MI2,
         AWCACHE_MI2 => AWCACHE_MI2,
         AWPROT_MI2 => AWPROT_MI2,
         AWVALID_MI2 => AWVALID_MI2,
         AWREADY_IM2 => AWREADY_IM2_xhdl3,
         AWID_MI3 => AWID_MI3,
         AWADDR_MI3 => AWADDR_MI3,
         AWLEN_MI3 => AWLEN_MI3,
         AWSIZE_MI3 => AWSIZE_MI3,
         AWBURST_MI3 => AWBURST_MI3,
         AWLOCK_MI3 => AWLOCK_MI3,
         AWCACHE_MI3 => AWCACHE_MI3,
         AWPROT_MI3 => AWPROT_MI3,
         AWVALID_MI3 => AWVALID_MI3,
         AWREADY_IM3 => AWREADY_IM3_xhdl4,
         AWID_IS => AWID_IS_xhdl5,
         AWADDR_IS => AWADDR_IS_xhdl6,
         AWLEN_IS => AWLEN_IS_xhdl7,
         AWSIZE_IS => AWSIZE_IS_xhdl8,
         AWBURST_IS => AWBURST_IS_xhdl9,
         AWLOCK_IS => AWLOCK_IS_xhdl10,
         AWCACHE_IS => AWCACHE_IS_xhdl11,
         AWPROT_IS => AWPROT_IS_xhdl12,
         AWVALID_IS => AWVALID_IS_xhdl13,
         AWADDR_IS_int => AWADDR_IS_int_xhdl14,
         MST_WRGNT_NUM => MST_WRGNT_NUM_xhdl16,
         SLAVE_SELECT_WADDRCH_M => gated_waddr_xhdl15,
         SLAVE_NUMBER => SLAVE_NUMBER);   
   
   
   --   end // if (MEMSPACE == 0 && ADDR_HGS_CFG == 0)      
   --endgenerate
   END GENERATE L2;

   --generate
   --   if(MEMSPACE == 0 && ADDR_HGS_CFG == 1) begin
   L3: IF (MEMSPACE = 0 AND ADDR_HGS_CFG = 1) GENERATE
   inst_wrmatrix_4Mto1S_hgs_high : axi_wrmatrix_4Mto1S_hgs_high 
      GENERIC MAP (
         SYNC_RESET => SYNC_RESET,
         M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
         M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
         M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
         M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
         M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
         M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
         M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
         NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
         FEED_THROUGH => FEED_THROUGH,
         M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
         WR_ACCEPTANCE => WR_ACCEPTANCE,
         AXI_AWIDTH => AXI_AWIDTH,
         M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
         M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
         M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
         MEMSPACE => MEMSPACE,
         M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
         M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
         M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
         M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
         M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
         M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
         M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
         M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
         INP_REG_BUF => INP_REG_BUF,
         ID_WIDTH => ID_WIDTH,
         SC_10 => SC_10,
         SC_11 => SC_11,
         M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
         SC_12 => SC_12,
         M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
         SC_13 => SC_13,
         SC_14 => SC_14,
         M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
         SC_15 => SC_15,
         M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
         M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
         ADDR_HGS_CFG => ADDR_HGS_CFG,
         BASE_ID_WIDTH => BASE_ID_WIDTH,
         M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
         M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
         M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
         M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
         M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
         M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
         M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
         M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
         M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
         M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
         M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
         AXI_DWIDTH => AXI_DWIDTH,
         M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
         M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
         M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
         M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
         NUM_MASTER_SLOT => NUM_MASTER_SLOT,
         SC_0 => SC_0,
         M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
         SC_1 => SC_1,
         SC_2 => SC_2,
         M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
         SC_3 => SC_3,
         SC_4 => SC_4,
         M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
         M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
         SC_5 => SC_5,
         SC_6 => SC_6,
         M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
         SC_7 => SC_7,
         SC_8 => SC_8,
         M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
         SC_9 => SC_9,
         M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
         M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
         M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
         M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
         M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
         M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
         M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
         M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
         RD_ACCEPTANCE => RD_ACCEPTANCE,
         HGS_CFG => HGS_CFG,
         M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
         M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
         M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
         M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
         OUT_REG_BUF => OUT_REG_BUF,
         M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
         M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
         M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
         M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
         M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
         M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
         M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
         M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
         M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
         M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
         M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWADDR_M0 => AWADDR_M0,
         AWVALID_M0 => AWVALID_M0,
         AWLOCK_M0 => AWLOCK_M0,
         AWADDR_M1 => AWADDR_M1,
         AWVALID_M1 => AWVALID_M1,
         AWLOCK_M1 => AWLOCK_M1,
         AWADDR_M2 => AWADDR_M2,
         AWVALID_M2 => AWVALID_M2,
         AWLOCK_M2 => AWLOCK_M2,
         AWADDR_M3 => AWADDR_M3,
         AWVALID_M3 => AWVALID_M3,
         AWLOCK_M3 => AWLOCK_M3,
         m0_wr_end => m0_wr_end,
         m1_wr_end => m1_wr_end,
         m2_wr_end => m2_wr_end,
         m3_wr_end => m3_wr_end,
         AWREADY_SI => AWREADY_SI,
         BVALID_SI => BVALID_SI,
         BREADY_IS => BREADY_IS,
         AWID_MI0 => AWID_MI0,
         AWADDR_MI0 => AWADDR_MI0,
         AWLEN_MI0 => AWLEN_MI0,
         AWSIZE_MI0 => AWSIZE_MI0,
         AWBURST_MI0 => AWBURST_MI0,
         AWLOCK_MI0 => AWLOCK_MI0,
         AWCACHE_MI0 => AWCACHE_MI0,
         AWPROT_MI0 => AWPROT_MI0,
         AWVALID_MI0 => AWVALID_MI0,
         AWREADY_IM0 => AWREADY_IM0_xhdl1,
         AWID_MI1 => AWID_MI1,
         AWADDR_MI1 => AWADDR_MI1,
         AWLEN_MI1 => AWLEN_MI1,
         AWSIZE_MI1 => AWSIZE_MI1,
         AWBURST_MI1 => AWBURST_MI1,
         AWLOCK_MI1 => AWLOCK_MI1,
         AWCACHE_MI1 => AWCACHE_MI1,
         AWPROT_MI1 => AWPROT_MI1,
         AWVALID_MI1 => AWVALID_MI1,
         AWREADY_IM1 => AWREADY_IM1_xhdl2,
         AWID_MI2 => AWID_MI2,
         AWADDR_MI2 => AWADDR_MI2,
         AWLEN_MI2 => AWLEN_MI2,
         AWSIZE_MI2 => AWSIZE_MI2,
         AWBURST_MI2 => AWBURST_MI2,
         AWLOCK_MI2 => AWLOCK_MI2,
         AWCACHE_MI2 => AWCACHE_MI2,
         AWPROT_MI2 => AWPROT_MI2,
         AWVALID_MI2 => AWVALID_MI2,
         AWREADY_IM2 => AWREADY_IM2_xhdl3,
         AWID_MI3 => AWID_MI3,
         AWADDR_MI3 => AWADDR_MI3,
         AWLEN_MI3 => AWLEN_MI3,
         AWSIZE_MI3 => AWSIZE_MI3,
         AWBURST_MI3 => AWBURST_MI3,
         AWLOCK_MI3 => AWLOCK_MI3,
         AWCACHE_MI3 => AWCACHE_MI3,
         AWPROT_MI3 => AWPROT_MI3,
         AWVALID_MI3 => AWVALID_MI3,
         AWREADY_IM3 => AWREADY_IM3_xhdl4,
         AWID_IS => AWID_IS_xhdl5,
         AWADDR_IS => AWADDR_IS_xhdl6,
         AWLEN_IS => AWLEN_IS_xhdl7,
         AWSIZE_IS => AWSIZE_IS_xhdl8,
         AWBURST_IS => AWBURST_IS_xhdl9,
         AWLOCK_IS => AWLOCK_IS_xhdl10,
         AWCACHE_IS => AWCACHE_IS_xhdl11,
         AWPROT_IS => AWPROT_IS_xhdl12,
         AWVALID_IS => AWVALID_IS_xhdl13,
         AWADDR_IS_int => AWADDR_IS_int_xhdl14,
         MST_WRGNT_NUM => MST_WRGNT_NUM_xhdl16,
         SLAVE_SELECT_WADDRCH_M => gated_waddr_xhdl15,
         SLAVE_NUMBER => SLAVE_NUMBER);   
   
   --   end // if (MEMSPACE == 0 && ADDR_HGS_CFG == 1)      
   --endgenerate
   END GENERATE L3;
END ARCHITECTURE translated;
