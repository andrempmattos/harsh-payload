--**************************************************************************-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description: matrix_m.v
--              
--              Contains:
--                       - Read Channel
--                       - Write Response channel
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

ENTITY axi_matrix_m IS
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
--      SLAVE_SELECT_WADDRCH_M  : IN std_logic_vector(16 DOWNTO 0);   
      -- AXI read response channel signals

      RID_IM                  : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_IM                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      RRESP_IM                : OUT std_logic_vector(1 DOWNTO 0);   
      RLAST_IM                : OUT std_logic;   
      RVALID_IM               : OUT std_logic;   
      RREADY_MI               : IN std_logic;   
      -- AXI write response channel signals

      BID_IM                  : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_IM                : OUT std_logic_vector(1 DOWNTO 0);   
      BVALID_IM               : OUT std_logic;   
      BREADY_MI               : IN std_logic;   
      -- SLAVE 0
-- AXI SLAVE 0 write data channel signals

      RID_SI0                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RVALID_SI0              : IN std_logic;   
      RRESP_SI0               : IN std_logic_vector(1 DOWNTO 0);   
      RDATA_SI0               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RLAST_SI0               : IN std_logic;   
      -- SLAVE 1
-- AXI SLAVE 1 write data channel signals

      RID_SI1                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RVALID_SI1              : IN std_logic;   
      RRESP_SI1               : IN std_logic_vector(1 DOWNTO 0);   
      RDATA_SI1               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RLAST_SI1               : IN std_logic;   
      -- SLAVE 2
-- AXI SLAVE 2 write data channel signals

      RID_SI2                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RVALID_SI2              : IN std_logic;   
      RRESP_SI2               : IN std_logic_vector(1 DOWNTO 0);   
      RDATA_SI2               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RLAST_SI2               : IN std_logic;   
      -- SLAVE 3
-- AXI SLAVE 3 write data channel signals

      RID_SI3                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RVALID_SI3              : IN std_logic;   
      RRESP_SI3               : IN std_logic_vector(1 DOWNTO 0);   
      RDATA_SI3               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RLAST_SI3               : IN std_logic;   
      -- SLAVE 4
-- AXI SLAVE 4 write data channel signals

      RID_SI4                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RVALID_SI4              : IN std_logic;   
      RRESP_SI4               : IN std_logic_vector(1 DOWNTO 0);   
      RDATA_SI4               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RLAST_SI4               : IN std_logic;   
      -- SLAVE 5
-- AXI SLAVE 5 write data channel signals

      RID_SI5                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RVALID_SI5              : IN std_logic;   
      RRESP_SI5               : IN std_logic_vector(1 DOWNTO 0);   
      RDATA_SI5               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RLAST_SI5               : IN std_logic;   
      -- SLAVE 6
-- AXI SLAVE 6 write data channel signals

      RID_SI6                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RVALID_SI6              : IN std_logic;   
      RRESP_SI6               : IN std_logic_vector(1 DOWNTO 0);   
      RDATA_SI6               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RLAST_SI6               : IN std_logic;   
      -- SLAVE 7
-- AXI SLAVE 7 write data channel signals

      RID_SI7                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RVALID_SI7              : IN std_logic;   
      RRESP_SI7               : IN std_logic_vector(1 DOWNTO 0);   
      RDATA_SI7               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RLAST_SI7               : IN std_logic;   
      -- SLAVE 8
-- AXI SLAVE 8 write data channel signals

      RID_SI8                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RVALID_SI8              : IN std_logic;   
      RRESP_SI8               : IN std_logic_vector(1 DOWNTO 0);   
      RDATA_SI8               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RLAST_SI8               : IN std_logic;   
      -- SLAVE 9
-- AXI SLAVE 9 write data channel signals

      RID_SI9                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RVALID_SI9              : IN std_logic;   
      RRESP_SI9               : IN std_logic_vector(1 DOWNTO 0);   
      RDATA_SI9               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RLAST_SI9               : IN std_logic;   
      -- SLAVE 10
-- AXI SLAVE 10 write data channel signals

      RID_SI10                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RVALID_SI10             : IN std_logic;   
      RRESP_SI10              : IN std_logic_vector(1 DOWNTO 0);   
      RDATA_SI10              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RLAST_SI10              : IN std_logic;   
      -- SLAVE 11
-- AXI SLAVE 11 write data channel signals

      RID_SI11                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RVALID_SI11             : IN std_logic;   
      RRESP_SI11              : IN std_logic_vector(1 DOWNTO 0);   
      RDATA_SI11              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RLAST_SI11              : IN std_logic;   
      -- SLAVE 12
-- AXI SLAVE 12 write data channel signals

      RID_SI12                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RVALID_SI12             : IN std_logic;   
      RRESP_SI12              : IN std_logic_vector(1 DOWNTO 0);   
      RDATA_SI12              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RLAST_SI12              : IN std_logic;   
      -- SLAVE 13
-- AXI SLAVE 13 write data channel signals

      RID_SI13                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RVALID_SI13             : IN std_logic;   
      RRESP_SI13              : IN std_logic_vector(1 DOWNTO 0);   
      RDATA_SI13              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RLAST_SI13              : IN std_logic;   
      -- SLAVE 14
-- AXI SLAVE 14 write data channel signals

      RID_SI14                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RVALID_SI14             : IN std_logic;   
      RRESP_SI14              : IN std_logic_vector(1 DOWNTO 0);   
      RDATA_SI14              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RLAST_SI14              : IN std_logic;   
      -- SLAVE 15
-- AXI SLAVE 15 write data channel signals

      RID_SI15                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RVALID_SI15             : IN std_logic;   
      RRESP_SI15              : IN std_logic_vector(1 DOWNTO 0);   
      RDATA_SI15              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RLAST_SI15              : IN std_logic;   
      -- SLAVE 16
-- AXI SLAVE 16 write data channel signals

      RID_SI16                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RVALID_SI16             : IN std_logic;   
      RRESP_SI16              : IN std_logic_vector(1 DOWNTO 0);   
      RDATA_SI16              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RLAST_SI16              : IN std_logic;   
      -- SLAVE 0
-- AXI SLAVE 0 write data channel signals

      BID_SI0                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BVALID_SI0              : IN std_logic;   
      BRESP_SI0               : IN std_logic_vector(1 DOWNTO 0);   
      -- SLAVE 1
-- AXI SLAVE 1 write data channel signals

      BID_SI1                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BVALID_SI1              : IN std_logic;   
      BRESP_SI1               : IN std_logic_vector(1 DOWNTO 0);   
      -- SLAVE 2
-- AXI SLAVE 2 write data channel signals

      BID_SI2                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BVALID_SI2              : IN std_logic;   
      BRESP_SI2               : IN std_logic_vector(1 DOWNTO 0);   
      -- SLAVE 3
-- AXI SLAVE 3 write data channel signals

      BID_SI3                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BVALID_SI3              : IN std_logic;   
      BRESP_SI3               : IN std_logic_vector(1 DOWNTO 0);   
      -- SLAVE 4
-- AXI SLAVE 4 write data channel signals

      BID_SI4                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BVALID_SI4              : IN std_logic;   
      BRESP_SI4               : IN std_logic_vector(1 DOWNTO 0);   
      -- SLAVE 5
-- AXI SLAVE 5 write data channel signals

      BID_SI5                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BVALID_SI5              : IN std_logic;   
      BRESP_SI5               : IN std_logic_vector(1 DOWNTO 0);   
      -- SLAVE 6
-- AXI SLAVE 6 write data channel signals

      BID_SI6                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BVALID_SI6              : IN std_logic;   
      BRESP_SI6               : IN std_logic_vector(1 DOWNTO 0);   
      -- SLAVE 7
-- AXI SLAVE 7 write data channel signals

      BID_SI7                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BVALID_SI7              : IN std_logic;   
      BRESP_SI7               : IN std_logic_vector(1 DOWNTO 0);   
      -- SLAVE 8
-- AXI SLAVE 8 write data channel signals

      BID_SI8                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BVALID_SI8              : IN std_logic;   
      BRESP_SI8               : IN std_logic_vector(1 DOWNTO 0);   
      -- SLAVE 9
-- AXI SLAVE 9 write data channel signals

      BID_SI9                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BVALID_SI9              : IN std_logic;   
      BRESP_SI9               : IN std_logic_vector(1 DOWNTO 0);   
      -- SLAVE 10
-- AXI SLAVE 10 write data channel signals

      BID_SI10                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BVALID_SI10             : IN std_logic;   
      BRESP_SI10              : IN std_logic_vector(1 DOWNTO 0);   
      -- SLAVE 11
-- AXI SLAVE 11 write data channel signals

      BID_SI11                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BVALID_SI11             : IN std_logic;   
      BRESP_SI11              : IN std_logic_vector(1 DOWNTO 0);   
      -- SLAVE 12
-- AXI SLAVE 12 write data channel signals

      BID_SI12                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BVALID_SI12             : IN std_logic;   
      BRESP_SI12              : IN std_logic_vector(1 DOWNTO 0);   
      -- SLAVE 13
-- AXI SLAVE 13 write data channel signals

      BID_SI13                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BVALID_SI13             : IN std_logic;   
      BRESP_SI13              : IN std_logic_vector(1 DOWNTO 0);   
      -- SLAVE 14
-- AXI SLAVE 14 write data channel signals

      BID_SI14                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BVALID_SI14             : IN std_logic;   
      BRESP_SI14              : IN std_logic_vector(1 DOWNTO 0);   
      -- SLAVE 15
-- AXI SLAVE 15 write data channel signals

      BID_SI15                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BVALID_SI15             : IN std_logic;   
      BRESP_SI15              : IN std_logic_vector(1 DOWNTO 0);   
      -- SLAVE 16
-- AXI SLAVE 16 write data channel signals

      BID_SI16                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BVALID_SI16             : IN std_logic;   
      BRESP_SI16              : IN std_logic_vector(1 DOWNTO 0);   
      RREADY_IS0              : OUT std_logic;   
      RREADY_IS1              : OUT std_logic;   
      RREADY_IS2              : OUT std_logic;   
      RREADY_IS3              : OUT std_logic;   
      RREADY_IS4              : OUT std_logic;   
      RREADY_IS5              : OUT std_logic;   
      RREADY_IS6              : OUT std_logic;   
      RREADY_IS7              : OUT std_logic;   
      RREADY_IS8              : OUT std_logic;   
      RREADY_IS9              : OUT std_logic;   
      RREADY_IS10             : OUT std_logic;   
      RREADY_IS11             : OUT std_logic;   
      RREADY_IS12             : OUT std_logic;   
      RREADY_IS13             : OUT std_logic;   
      RREADY_IS14             : OUT std_logic;   
      RREADY_IS15             : OUT std_logic;   
      RREADY_IS16             : OUT std_logic;   
      BREADY_IS0              : OUT std_logic;   
      BREADY_IS1              : OUT std_logic;   
      BREADY_IS2              : OUT std_logic;   
      BREADY_IS3              : OUT std_logic;   
      BREADY_IS4              : OUT std_logic;   
      BREADY_IS5              : OUT std_logic;   
      BREADY_IS6              : OUT std_logic;   
      BREADY_IS7              : OUT std_logic;   
      BREADY_IS8              : OUT std_logic;   
      BREADY_IS9              : OUT std_logic;   
      BREADY_IS10             : OUT std_logic;   
      BREADY_IS11             : OUT std_logic;   
      BREADY_IS12             : OUT std_logic;   
      BREADY_IS13             : OUT std_logic;   
      BREADY_IS14             : OUT std_logic;   
      BREADY_IS15             : OUT std_logic;   
      BREADY_IS16             : OUT std_logic);   
END ENTITY axi_matrix_m;

ARCHITECTURE translated OF axi_matrix_m IS


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

   COMPONENT axi_rd_channel
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
         RD_ACCEPTANCE                  :  integer := 4;    --  1 - 4
         UID_WIDTH                      :  std_logic_vector(1 DOWNTO 0) := "00")
         ;    
      PORT (
         -- --------------------------------------------------------------------------
-- I/O Declaration
-- --------------------------------------------------------------------------
-- Global signals

         ACLK                    : IN std_logic;   
         ARESETN                 : IN std_logic;   
--         SLAVE_SELECT_WADDRCH_M  : IN std_logic_vector(16 DOWNTO 0);   
         -- From Master 0
-- AXI write data channel signals

         RID_IM                  : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         RRESP_IM                : OUT std_logic_vector(1 DOWNTO 0);   
         RVALID_IM               : OUT std_logic;   
         RDATA_IM                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_IM                : OUT std_logic;   
         RREADY_MI               : IN std_logic;   
         -- SLAVE 0
-- AXI SLAVE 0 write data channel signals

         RID_SI0                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI0              : IN std_logic;   
         RRESP_SI0               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI0               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI0               : IN std_logic;   
         -- SLAVE 1
-- AXI SLAVE 1 write data channel signals

         RID_SI1                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI1              : IN std_logic;   
         RRESP_SI1               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI1               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI1               : IN std_logic;   
         -- SLAVE 2
-- AXI SLAVE 2 write data channel signals

         RID_SI2                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI2              : IN std_logic;   
         RRESP_SI2               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI2               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI2               : IN std_logic;   
         -- SLAVE 3
-- AXI SLAVE 3 write data channel signals

         RID_SI3                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI3              : IN std_logic;   
         RRESP_SI3               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI3               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI3               : IN std_logic;   
         -- SLAVE 4
-- AXI SLAVE 4 write data channel signals

         RID_SI4                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI4              : IN std_logic;   
         RRESP_SI4               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI4               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI4               : IN std_logic;   
         -- SLAVE 5
-- AXI SLAVE 5 write data channel signals

         RID_SI5                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI5              : IN std_logic;   
         RRESP_SI5               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI5               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI5               : IN std_logic;   
         -- SLAVE 6
-- AXI SLAVE 6 write data channel signals

         RID_SI6                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI6              : IN std_logic;   
         RRESP_SI6               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI6               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI6               : IN std_logic;   
         -- SLAVE 7
-- AXI SLAVE 7 write data channel signals

         RID_SI7                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI7              : IN std_logic;   
         RRESP_SI7               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI7               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI7               : IN std_logic;   
         -- SLAVE 8
-- AXI SLAVE 8 write data channel signals

         RID_SI8                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI8              : IN std_logic;   
         RRESP_SI8               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI8               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI8               : IN std_logic;   
         -- SLAVE 9
-- AXI SLAVE 9 write data channel signals

         RID_SI9                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI9              : IN std_logic;   
         RRESP_SI9               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI9               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI9               : IN std_logic;   
         -- SLAVE 10
-- AXI SLAVE 10 write data channel signals

         RID_SI10                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI10             : IN std_logic;   
         RRESP_SI10              : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI10              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI10              : IN std_logic;   
         -- SLAVE 11
-- AXI SLAVE 11 write data channel signals

         RID_SI11                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI11             : IN std_logic;   
         RRESP_SI11              : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI11              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI11              : IN std_logic;   
         -- SLAVE 12
-- AXI SLAVE 12 write data channel signals

         RID_SI12                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI12             : IN std_logic;   
         RRESP_SI12              : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI12              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI12              : IN std_logic;   
         -- SLAVE 13
-- AXI SLAVE 13 write data channel signals

         RID_SI13                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI13             : IN std_logic;   
         RRESP_SI13              : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI13              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI13              : IN std_logic;   
         -- SLAVE 14
-- AXI SLAVE 14 write data channel signals

         RID_SI14                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI14             : IN std_logic;   
         RRESP_SI14              : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI14              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI14              : IN std_logic;   
         -- SLAVE 15
-- AXI SLAVE 15 write data channel signals

         RID_SI15                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI15             : IN std_logic;   
         RRESP_SI15              : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI15              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI15              : IN std_logic;   
         -- SLAVE 16
-- AXI SLAVE 16 write data channel signals

         RID_SI16                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI16             : IN std_logic;   
         RRESP_SI16              : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI16              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI16              : IN std_logic;   
         RREADY_IS0              : OUT std_logic;   
         RREADY_IS1              : OUT std_logic;   
         RREADY_IS2              : OUT std_logic;   
         RREADY_IS3              : OUT std_logic;   
         RREADY_IS4              : OUT std_logic;   
         RREADY_IS5              : OUT std_logic;   
         RREADY_IS6              : OUT std_logic;   
         RREADY_IS7              : OUT std_logic;   
         RREADY_IS8              : OUT std_logic;   
         RREADY_IS9              : OUT std_logic;   
         RREADY_IS10             : OUT std_logic;   
         RREADY_IS11             : OUT std_logic;   
         RREADY_IS12             : OUT std_logic;   
         RREADY_IS13             : OUT std_logic;   
         RREADY_IS14             : OUT std_logic;   
         RREADY_IS15             : OUT std_logic;   
         RREADY_IS16             : OUT std_logic);
   END COMPONENT;

   COMPONENT axi_wresp_channel
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
         RD_ACCEPTANCE                  :  integer := 4;    --  1 - 4
         UID_WIDTH                      :  std_logic_vector(1 DOWNTO 0) := "00")
         ;    
      PORT (
         -- --------------------------------------------------------------------------
-- I/O Declaration
-- --------------------------------------------------------------------------
-- Global signals

         ACLK                    : IN std_logic;   
         ARESETN                 : IN std_logic;   
         -- From fwd master waselector

--         SLAVE_SELECT_WADDRCH_M  : IN std_logic_vector(16 DOWNTO 0);   
         -- From Master 0
-- AXI write data channel signals

         BID_IM                  : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         BRESP_IM                : OUT std_logic_vector(1 DOWNTO 0);   
         BVALID_IM               : OUT std_logic;   
         BREADY_MI               : IN std_logic;   
         -- SLAVE 0
-- AXI SLAVE 0 write data channel signals

         BID_SI0                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI0              : IN std_logic;   
         BRESP_SI0               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 1
-- AXI SLAVE 1 write data channel signals

         BID_SI1                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI1              : IN std_logic;   
         BRESP_SI1               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 2
-- AXI SLAVE 2 write data channel signals

         BID_SI2                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI2              : IN std_logic;   
         BRESP_SI2               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 3
-- AXI SLAVE 3 write data channel signals

         BID_SI3                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI3              : IN std_logic;   
         BRESP_SI3               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 4
-- AXI SLAVE 4 write data channel signals

         BID_SI4                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI4              : IN std_logic;   
         BRESP_SI4               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 5
-- AXI SLAVE 5 write data channel signals

         BID_SI5                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI5              : IN std_logic;   
         BRESP_SI5               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 6
-- AXI SLAVE 6 write data channel signals

         BID_SI6                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI6              : IN std_logic;   
         BRESP_SI6               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 7
-- AXI SLAVE 7 write data channel signals

         BID_SI7                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI7              : IN std_logic;   
         BRESP_SI7               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 8
-- AXI SLAVE 8 write data channel signals

         BID_SI8                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI8              : IN std_logic;   
         BRESP_SI8               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 9
-- AXI SLAVE 9 write data channel signals

         BID_SI9                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI9              : IN std_logic;   
         BRESP_SI9               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 10
-- AXI SLAVE 10 write data channel signals

         BID_SI10                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI10             : IN std_logic;   
         BRESP_SI10              : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 11
-- AXI SLAVE 11 write data channel signals

         BID_SI11                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI11             : IN std_logic;   
         BRESP_SI11              : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 12
-- AXI SLAVE 12 write data channel signals

         BID_SI12                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI12             : IN std_logic;   
         BRESP_SI12              : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 13
-- AXI SLAVE 13 write data channel signals

         BID_SI13                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI13             : IN std_logic;   
         BRESP_SI13              : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 14
-- AXI SLAVE 14 write data channel signals

         BID_SI14                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI14             : IN std_logic;   
         BRESP_SI14              : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 15
-- AXI SLAVE 15 write data channel signals

         BID_SI15                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI15             : IN std_logic;   
         BRESP_SI15              : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 16
-- AXI SLAVE 16 write data channel signals

         BID_SI16                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI16             : IN std_logic;   
         BRESP_SI16              : IN std_logic_vector(1 DOWNTO 0);   
         BREADY_IS0              : OUT std_logic;   
         BREADY_IS1              : OUT std_logic;   
         BREADY_IS2              : OUT std_logic;   
         BREADY_IS3              : OUT std_logic;   
         BREADY_IS4              : OUT std_logic;   
         BREADY_IS5              : OUT std_logic;   
         BREADY_IS6              : OUT std_logic;   
         BREADY_IS7              : OUT std_logic;   
         BREADY_IS8              : OUT std_logic;   
         BREADY_IS9              : OUT std_logic;   
         BREADY_IS10             : OUT std_logic;   
         BREADY_IS11             : OUT std_logic;   
         BREADY_IS12             : OUT std_logic;   
         BREADY_IS13             : OUT std_logic;   
         BREADY_IS14             : OUT std_logic;   
         BREADY_IS15             : OUT std_logic;   
         BREADY_IS16             : OUT std_logic);
   END COMPONENT;

   -- --------------------------------------------------------------------------
   -- Internal signals
   -- --------------------------------------------------------------------------
   SIGNAL RID_IM_int               :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_IM_int             :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RLAST_IM_int             :  std_logic;   
   SIGNAL RVALID_IM_int            :  std_logic;   
   SIGNAL RRESP_IM_int             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RREADY_IS                :  std_logic;   
   SIGNAL RRESP_IC                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RDATA_IC                 :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RID_IM_xhdl1             :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_IM_xhdl2           :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_IM_xhdl3           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_IM_xhdl4           :  std_logic;   
   SIGNAL RVALID_IM_xhdl5          :  std_logic;   
   SIGNAL BID_IM_xhdl6             :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_IM_xhdl7           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_IM_xhdl8          :  std_logic;   
   SIGNAL RREADY_IS0_xhdl9         :  std_logic;   
   SIGNAL RREADY_IS1_xhdl10        :  std_logic;   
   SIGNAL RREADY_IS2_xhdl11        :  std_logic;   
   SIGNAL RREADY_IS3_xhdl12        :  std_logic;   
   SIGNAL RREADY_IS4_xhdl13        :  std_logic;   
   SIGNAL RREADY_IS5_xhdl14        :  std_logic;   
   SIGNAL RREADY_IS6_xhdl15        :  std_logic;   
   SIGNAL RREADY_IS7_xhdl16        :  std_logic;   
   SIGNAL RREADY_IS8_xhdl17        :  std_logic;   
   SIGNAL RREADY_IS9_xhdl18        :  std_logic;   
   SIGNAL RREADY_IS10_xhdl19       :  std_logic;   
   SIGNAL RREADY_IS11_xhdl20       :  std_logic;   
   SIGNAL RREADY_IS12_xhdl21       :  std_logic;   
   SIGNAL RREADY_IS13_xhdl22       :  std_logic;   
   SIGNAL RREADY_IS14_xhdl23       :  std_logic;   
   SIGNAL RREADY_IS15_xhdl24       :  std_logic;   
   SIGNAL RREADY_IS16_xhdl25       :  std_logic;   
   SIGNAL BREADY_IS0_xhdl26        :  std_logic;   
   SIGNAL BREADY_IS1_xhdl27        :  std_logic;   
   SIGNAL BREADY_IS2_xhdl28        :  std_logic;   
   SIGNAL BREADY_IS3_xhdl29        :  std_logic;   
   SIGNAL BREADY_IS4_xhdl30        :  std_logic;   
   SIGNAL BREADY_IS5_xhdl31        :  std_logic;   
   SIGNAL BREADY_IS6_xhdl32        :  std_logic;   
   SIGNAL BREADY_IS7_xhdl33        :  std_logic;   
   SIGNAL BREADY_IS8_xhdl34        :  std_logic;   
   SIGNAL BREADY_IS9_xhdl35        :  std_logic;   
   SIGNAL BREADY_IS10_xhdl36       :  std_logic;   
   SIGNAL BREADY_IS11_xhdl37       :  std_logic;   
   SIGNAL BREADY_IS12_xhdl38       :  std_logic;   
   SIGNAL BREADY_IS13_xhdl39       :  std_logic;   
   SIGNAL BREADY_IS14_xhdl40       :  std_logic;   
   SIGNAL BREADY_IS15_xhdl41       :  std_logic;   
   SIGNAL BREADY_IS16_xhdl42       :  std_logic;   
   SIGNAL areset_n                 :  std_logic;   
   SIGNAL sresetn                  :  std_logic;   

BEGIN
   --///////////////////////////////////////////////////////////////////////////
   --                               Start - of - Code                         //
   --///////////////////////////////////////////////////////////////////////////

   areset_n  <= '1' WHEN (SYNC_RESET = 1) ELSE ARESETN;
   sresetn   <= ARESETN WHEN (SYNC_RESET = 1) ELSE '1';

   RID_IM <= RID_IM_xhdl1;
   RDATA_IM <= RDATA_IM_xhdl2;
   RRESP_IM <= RRESP_IM_xhdl3;
   RLAST_IM <= RLAST_IM_xhdl4;
   RVALID_IM <= RVALID_IM_xhdl5;
   BID_IM <= BID_IM_xhdl6;
   BRESP_IM <= BRESP_IM_xhdl7;
   BVALID_IM <= BVALID_IM_xhdl8;
   RREADY_IS0 <= RREADY_IS0_xhdl9;
   RREADY_IS1 <= RREADY_IS1_xhdl10;
   RREADY_IS2 <= RREADY_IS2_xhdl11;
   RREADY_IS3 <= RREADY_IS3_xhdl12;
   RREADY_IS4 <= RREADY_IS4_xhdl13;
   RREADY_IS5 <= RREADY_IS5_xhdl14;
   RREADY_IS6 <= RREADY_IS6_xhdl15;
   RREADY_IS7 <= RREADY_IS7_xhdl16;
   RREADY_IS8 <= RREADY_IS8_xhdl17;
   RREADY_IS9 <= RREADY_IS9_xhdl18;
   RREADY_IS10 <= RREADY_IS10_xhdl19;
   RREADY_IS11 <= RREADY_IS11_xhdl20;
   RREADY_IS12 <= RREADY_IS12_xhdl21;
   RREADY_IS13 <= RREADY_IS13_xhdl22;
   RREADY_IS14 <= RREADY_IS14_xhdl23;
   RREADY_IS15 <= RREADY_IS15_xhdl24;
   RREADY_IS16 <= RREADY_IS16_xhdl25;
   BREADY_IS0 <= BREADY_IS0_xhdl26;
   BREADY_IS1 <= BREADY_IS1_xhdl27;
   BREADY_IS2 <= BREADY_IS2_xhdl28;
   BREADY_IS3 <= BREADY_IS3_xhdl29;
   BREADY_IS4 <= BREADY_IS4_xhdl30;
   BREADY_IS5 <= BREADY_IS5_xhdl31;
   BREADY_IS6 <= BREADY_IS6_xhdl32;
   BREADY_IS7 <= BREADY_IS7_xhdl33;
   BREADY_IS8 <= BREADY_IS8_xhdl34;
   BREADY_IS9 <= BREADY_IS9_xhdl35;
   BREADY_IS10 <= BREADY_IS10_xhdl36;
   BREADY_IS11 <= BREADY_IS11_xhdl37;
   BREADY_IS12 <= BREADY_IS12_xhdl38;
   BREADY_IS13 <= BREADY_IS13_xhdl39;
   BREADY_IS14 <= BREADY_IS14_xhdl40;
   BREADY_IS15 <= BREADY_IS15_xhdl41;
   BREADY_IS16 <= BREADY_IS16_xhdl42;
   
   -- --------------------------------------------------------------------------
   -- Read data channel
   -- --------------------------------------------------------------------------
   inst_rd_channel : axi_rd_channel 
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
         UID_WIDTH => UID_WIDTH,
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
         RID_IM => RID_IM_xhdl1,
         RRESP_IM => RRESP_IM_xhdl3,
         RVALID_IM => RVALID_IM_xhdl5,
         RDATA_IM => RDATA_IM_xhdl2,
         RLAST_IM => RLAST_IM_xhdl4,
         RREADY_MI => RREADY_MI,
         RID_SI0 => RID_SI0,
         RVALID_SI0 => RVALID_SI0,
         RRESP_SI0 => RRESP_SI0,
         RDATA_SI0 => RDATA_SI0,
         RLAST_SI0 => RLAST_SI0,
         RID_SI1 => RID_SI1,
         RVALID_SI1 => RVALID_SI1,
         RRESP_SI1 => RRESP_SI1,
         RDATA_SI1 => RDATA_SI1,
         RLAST_SI1 => RLAST_SI1,
         RID_SI2 => RID_SI2,
         RVALID_SI2 => RVALID_SI2,
         RRESP_SI2 => RRESP_SI2,
         RDATA_SI2 => RDATA_SI2,
         RLAST_SI2 => RLAST_SI2,
         RID_SI3 => RID_SI3,
         RVALID_SI3 => RVALID_SI3,
         RRESP_SI3 => RRESP_SI3,
         RDATA_SI3 => RDATA_SI3,
         RLAST_SI3 => RLAST_SI3,
         RID_SI4 => RID_SI4,
         RVALID_SI4 => RVALID_SI4,
         RRESP_SI4 => RRESP_SI4,
         RDATA_SI4 => RDATA_SI4,
         RLAST_SI4 => RLAST_SI4,
         RID_SI5 => RID_SI5,
         RVALID_SI5 => RVALID_SI5,
         RRESP_SI5 => RRESP_SI5,
         RDATA_SI5 => RDATA_SI5,
         RLAST_SI5 => RLAST_SI5,
         RID_SI6 => RID_SI6,
         RVALID_SI6 => RVALID_SI6,
         RRESP_SI6 => RRESP_SI6,
         RDATA_SI6 => RDATA_SI6,
         RLAST_SI6 => RLAST_SI6,
         RID_SI7 => RID_SI7,
         RVALID_SI7 => RVALID_SI7,
         RRESP_SI7 => RRESP_SI7,
         RDATA_SI7 => RDATA_SI7,
         RLAST_SI7 => RLAST_SI7,
         RID_SI8 => RID_SI8,
         RVALID_SI8 => RVALID_SI8,
         RRESP_SI8 => RRESP_SI8,
         RDATA_SI8 => RDATA_SI8,
         RLAST_SI8 => RLAST_SI8,
         RID_SI9 => RID_SI9,
         RVALID_SI9 => RVALID_SI9,
         RRESP_SI9 => RRESP_SI9,
         RDATA_SI9 => RDATA_SI9,
         RLAST_SI9 => RLAST_SI9,
         RID_SI10 => RID_SI10,
         RVALID_SI10 => RVALID_SI10,
         RRESP_SI10 => RRESP_SI10,
         RDATA_SI10 => RDATA_SI10,
         RLAST_SI10 => RLAST_SI10,
         RID_SI11 => RID_SI11,
         RVALID_SI11 => RVALID_SI11,
         RRESP_SI11 => RRESP_SI11,
         RDATA_SI11 => RDATA_SI11,
         RLAST_SI11 => RLAST_SI11,
         RID_SI12 => RID_SI12,
         RVALID_SI12 => RVALID_SI12,
         RRESP_SI12 => RRESP_SI12,
         RDATA_SI12 => RDATA_SI12,
         RLAST_SI12 => RLAST_SI12,
         RID_SI13 => RID_SI13,
         RVALID_SI13 => RVALID_SI13,
         RRESP_SI13 => RRESP_SI13,
         RDATA_SI13 => RDATA_SI13,
         RLAST_SI13 => RLAST_SI13,
         RID_SI14 => RID_SI14,
         RVALID_SI14 => RVALID_SI14,
         RRESP_SI14 => RRESP_SI14,
         RDATA_SI14 => RDATA_SI14,
         RLAST_SI14 => RLAST_SI14,
         RID_SI15 => RID_SI15,
         RVALID_SI15 => RVALID_SI15,
         RRESP_SI15 => RRESP_SI15,
         RDATA_SI15 => RDATA_SI15,
         RLAST_SI15 => RLAST_SI15,
         RID_SI16 => RID_SI16,
         RVALID_SI16 => RVALID_SI16,
         RRESP_SI16 => RRESP_SI16,
         RDATA_SI16 => RDATA_SI16,
         RLAST_SI16 => RLAST_SI16,
         RREADY_IS0 => RREADY_IS0_xhdl9,
         RREADY_IS1 => RREADY_IS1_xhdl10,
         RREADY_IS2 => RREADY_IS2_xhdl11,
         RREADY_IS3 => RREADY_IS3_xhdl12,
         RREADY_IS4 => RREADY_IS4_xhdl13,
         RREADY_IS5 => RREADY_IS5_xhdl14,
         RREADY_IS6 => RREADY_IS6_xhdl15,
         RREADY_IS7 => RREADY_IS7_xhdl16,
         RREADY_IS8 => RREADY_IS8_xhdl17,
         RREADY_IS9 => RREADY_IS9_xhdl18,
         RREADY_IS10 => RREADY_IS10_xhdl19,
         RREADY_IS11 => RREADY_IS11_xhdl20,
         RREADY_IS12 => RREADY_IS12_xhdl21,
         RREADY_IS13 => RREADY_IS13_xhdl22,
         RREADY_IS14 => RREADY_IS14_xhdl23,
         RREADY_IS15 => RREADY_IS15_xhdl24,
         RREADY_IS16 => RREADY_IS16_xhdl25);   
   
   
   -- Write Response channel instance
   inst_wresp_channel : axi_wresp_channel 
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
         UID_WIDTH => UID_WIDTH,
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
         BID_IM => BID_IM_xhdl6,
         BRESP_IM => BRESP_IM_xhdl7,
         BVALID_IM => BVALID_IM_xhdl8,
         BREADY_MI => BREADY_MI,
         BID_SI0 => BID_SI0,
         BVALID_SI0 => BVALID_SI0,
         BRESP_SI0 => BRESP_SI0,
         BID_SI1 => BID_SI1,
         BVALID_SI1 => BVALID_SI1,
         BRESP_SI1 => BRESP_SI1,
         BID_SI2 => BID_SI2,
         BVALID_SI2 => BVALID_SI2,
         BRESP_SI2 => BRESP_SI2,
         BID_SI3 => BID_SI3,
         BVALID_SI3 => BVALID_SI3,
         BRESP_SI3 => BRESP_SI3,
         BID_SI4 => BID_SI4,
         BVALID_SI4 => BVALID_SI4,
         BRESP_SI4 => BRESP_SI4,
         BID_SI5 => BID_SI5,
         BVALID_SI5 => BVALID_SI5,
         BRESP_SI5 => BRESP_SI5,
         BID_SI6 => BID_SI6,
         BVALID_SI6 => BVALID_SI6,
         BRESP_SI6 => BRESP_SI6,
         BID_SI7 => BID_SI7,
         BVALID_SI7 => BVALID_SI7,
         BRESP_SI7 => BRESP_SI7,
         BID_SI8 => BID_SI8,
         BVALID_SI8 => BVALID_SI8,
         BRESP_SI8 => BRESP_SI8,
         BID_SI9 => BID_SI9,
         BVALID_SI9 => BVALID_SI9,
         BRESP_SI9 => BRESP_SI9,
         BID_SI10 => BID_SI10,
         BVALID_SI10 => BVALID_SI10,
         BRESP_SI10 => BRESP_SI10,
         BID_SI11 => BID_SI11,
         BVALID_SI11 => BVALID_SI11,
         BRESP_SI11 => BRESP_SI11,
         BID_SI12 => BID_SI12,
         BVALID_SI12 => BVALID_SI12,
         BRESP_SI12 => BRESP_SI12,
         BID_SI13 => BID_SI13,
         BVALID_SI13 => BVALID_SI13,
         BRESP_SI13 => BRESP_SI13,
         BID_SI14 => BID_SI14,
         BVALID_SI14 => BVALID_SI14,
         BRESP_SI14 => BRESP_SI14,
         BID_SI15 => BID_SI15,
         BVALID_SI15 => BVALID_SI15,
         BRESP_SI15 => BRESP_SI15,
         BID_SI16 => BID_SI16,
         BVALID_SI16 => BVALID_SI16,
         BRESP_SI16 => BRESP_SI16,
         BREADY_IS0 => BREADY_IS0_xhdl26,
         BREADY_IS1 => BREADY_IS1_xhdl27,
         BREADY_IS2 => BREADY_IS2_xhdl28,
         BREADY_IS3 => BREADY_IS3_xhdl29,
         BREADY_IS4 => BREADY_IS4_xhdl30,
         BREADY_IS5 => BREADY_IS5_xhdl31,
         BREADY_IS6 => BREADY_IS6_xhdl32,
         BREADY_IS7 => BREADY_IS7_xhdl33,
         BREADY_IS8 => BREADY_IS8_xhdl34,
         BREADY_IS9 => BREADY_IS9_xhdl35,
         BREADY_IS10 => BREADY_IS10_xhdl36,
         BREADY_IS11 => BREADY_IS11_xhdl37,
         BREADY_IS12 => BREADY_IS12_xhdl38,
         BREADY_IS13 => BREADY_IS13_xhdl39,
         BREADY_IS14 => BREADY_IS14_xhdl40,
         BREADY_IS15 => BREADY_IS15_xhdl41,
         BREADY_IS16 => BREADY_IS16_xhdl42);   
   

END ARCHITECTURE translated;
