-- ****************************************************************************/
-- Actel Corporation Proprietary and Confidential
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

   USE work.XHDL_std_logic.all;
   USE work.XHDL_misc.all; 
   USE work.axi_pkg.all; 


ENTITY axi_rdmatrix_16Sto1M IS
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
      UID_WIDTH                      :  std_logic_vector(1 DOWNTO 0) := "00"); 
   PORT (
      -- --------------------------------------------------------------------------
-- I/O Declaration
-- --------------------------------------------------------------------------
-- Global signals

      ACLK                    : IN std_logic;   
      ARESETN                 : IN std_logic;   
      -- From Master 0
-- AXI write data channel signals

      RID_IM                  : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RRESP_IM                : OUT std_logic_vector(1 DOWNTO 0);   
      RVALID_IM               : OUT std_logic;   
      RDATA_IM                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      RLAST_IM                : OUT std_logic;   
      RREADY_MI               : IN std_logic;   
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
END ENTITY axi_rdmatrix_16Sto1M;

ARCHITECTURE translated OF axi_rdmatrix_16Sto1M IS


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
   CONSTANT  RD_IDLE               :  std_logic_vector(4 DOWNTO 0) := "00000";  
   CONSTANT  RD_S0_SEL             :  std_logic_vector(4 DOWNTO 0) := "00001";  
   CONSTANT  RD_S1_SEL             :  std_logic_vector(4 DOWNTO 0) := "00010";  
   CONSTANT  RD_S2_SEL             :  std_logic_vector(4 DOWNTO 0) := "00011";  
   CONSTANT  RD_S3_SEL             :  std_logic_vector(4 DOWNTO 0) := "00100";  
   CONSTANT  RD_S4_SEL             :  std_logic_vector(4 DOWNTO 0) := "00101";  
   CONSTANT  RD_S5_SEL             :  std_logic_vector(4 DOWNTO 0) := "00110";  
   CONSTANT  RD_S6_SEL             :  std_logic_vector(4 DOWNTO 0) := "00111";  
   CONSTANT  RD_S7_SEL             :  std_logic_vector(4 DOWNTO 0) := "01000";  
   CONSTANT  RD_S8_SEL             :  std_logic_vector(4 DOWNTO 0) := "01001";  
   CONSTANT  RD_S9_SEL             :  std_logic_vector(4 DOWNTO 0) := "01010";  
   CONSTANT  RD_S10_SEL            :  std_logic_vector(4 DOWNTO 0) := "01011";  
   CONSTANT  RD_S11_SEL            :  std_logic_vector(4 DOWNTO 0) := "01100";  
   CONSTANT  RD_S12_SEL            :  std_logic_vector(4 DOWNTO 0) := "01101";  
   CONSTANT  RD_S13_SEL            :  std_logic_vector(4 DOWNTO 0) := "01110";  
   CONSTANT  RD_S14_SEL            :  std_logic_vector(4 DOWNTO 0) := "01111";  
   CONSTANT  RD_S15_SEL            :  std_logic_vector(4 DOWNTO 0) := "10000";  
   CONSTANT  RD_S16_SEL            :  std_logic_vector(4 DOWNTO 0) := "10001";  

   -- --------------------------------------------------------------------------
   -- Internal signals
   -- --------------------------------------------------------------------------
   SIGNAL RVALID_IM_r              :  std_logic;   
   SIGNAL RID_IM_r                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RRESP_IM_r               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RDATA_IM_r               :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RLAST_IM_r               :  std_logic;   
   SIGNAL RVALID_IM_int            :  std_logic;   
   SIGNAL RID_IM_int               :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RRESP_IM_int             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RDATA_IM_int             :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RLAST_IM_int             :  std_logic;   
   SIGNAL prev_slv_rd              :  std_logic_vector(4 DOWNTO 0);   
   SIGNAL curr_slv_rd              :  std_logic_vector(4 DOWNTO 0);   
   SIGNAL rd_inprog                :  std_logic;   
   SIGNAL rd_inprog_r              :  std_logic;   
   SIGNAL curr_state               :  std_logic_vector(4 DOWNTO 0);   
   SIGNAL next_state               :  std_logic_vector(4 DOWNTO 0);   
   SIGNAL RID_IM_xhdl1             :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RRESP_IM_xhdl2           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RVALID_IM_xhdl3          :  std_logic;   
   SIGNAL RDATA_IM_xhdl4           :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RLAST_IM_xhdl5           :  std_logic;   
   SIGNAL RREADY_IS0_xhdl6         :  std_logic;   
   SIGNAL RREADY_IS1_xhdl7         :  std_logic;   
   SIGNAL RREADY_IS2_xhdl8         :  std_logic;   
   SIGNAL RREADY_IS3_xhdl9         :  std_logic;   
   SIGNAL RREADY_IS4_xhdl10        :  std_logic;   
   SIGNAL RREADY_IS5_xhdl11        :  std_logic;   
   SIGNAL RREADY_IS6_xhdl12        :  std_logic;   
   SIGNAL RREADY_IS7_xhdl13        :  std_logic;   
   SIGNAL RREADY_IS8_xhdl14        :  std_logic;   
   SIGNAL RREADY_IS9_xhdl15        :  std_logic;   
   SIGNAL RREADY_IS10_xhdl16       :  std_logic;   
   SIGNAL RREADY_IS11_xhdl17       :  std_logic;   
   SIGNAL RREADY_IS12_xhdl18       :  std_logic;   
   SIGNAL RREADY_IS13_xhdl19       :  std_logic;   
   SIGNAL RREADY_IS14_xhdl20       :  std_logic;   
   SIGNAL RREADY_IS15_xhdl21       :  std_logic;   
   SIGNAL RREADY_IS16_xhdl22       :  std_logic;   
   SIGNAL areset_n                 :  std_logic;   
   SIGNAL sresetn                  :  std_logic;   

BEGIN
   --///////////////////////////////////////////////////////////////////////////
   --                               Start - of - Code                         //
   --///////////////////////////////////////////////////////////////////////////

   areset_n  <= '1' WHEN (SYNC_RESET = 1) ELSE ARESETN;
   sresetn   <= ARESETN WHEN (SYNC_RESET = 1) ELSE '1';

   RID_IM <= RID_IM_xhdl1;
   RRESP_IM <= RRESP_IM_xhdl2;
   RVALID_IM <= RVALID_IM_xhdl3;
   RDATA_IM <= RDATA_IM_xhdl4;
   RLAST_IM <= RLAST_IM_xhdl5;
   RREADY_IS0 <= RREADY_IS0_xhdl6;
   RREADY_IS1 <= RREADY_IS1_xhdl7;
   RREADY_IS2 <= RREADY_IS2_xhdl8;
   RREADY_IS3 <= RREADY_IS3_xhdl9;
   RREADY_IS4 <= RREADY_IS4_xhdl10;
   RREADY_IS5 <= RREADY_IS5_xhdl11;
   RREADY_IS6 <= RREADY_IS6_xhdl12;
   RREADY_IS7 <= RREADY_IS7_xhdl13;
   RREADY_IS8 <= RREADY_IS8_xhdl14;
   RREADY_IS9 <= RREADY_IS9_xhdl15;
   RREADY_IS10 <= RREADY_IS10_xhdl16;
   RREADY_IS11 <= RREADY_IS11_xhdl17;
   RREADY_IS12 <= RREADY_IS12_xhdl18;
   RREADY_IS13 <= RREADY_IS13_xhdl19;
   RREADY_IS14 <= RREADY_IS14_xhdl20;
   RREADY_IS15 <= RREADY_IS15_xhdl21;
   RREADY_IS16 <= RREADY_IS16_xhdl22;

   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         RVALID_IM_r <= '0';    
         RID_IM_r <= (OTHERS => '0');    
         RDATA_IM_r <= (OTHERS => '0');    
         RLAST_IM_r <= '0';    
         RRESP_IM_r <= (OTHERS => '0');    
         prev_slv_rd <= (OTHERS => '0');        
         rd_inprog_r <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         RVALID_IM_r <= '0';    
         RID_IM_r <= (OTHERS => '0');    
         RDATA_IM_r <= (OTHERS => '0');    
         RLAST_IM_r <= '0';    
         RRESP_IM_r <= (OTHERS => '0');    
         prev_slv_rd <= (OTHERS => '0');        
         rd_inprog_r <= '0';    
      ELSE 
         RVALID_IM_r <= RVALID_IM_xhdl3;    
         RID_IM_r <= RID_IM_xhdl1;    
         RDATA_IM_r <= RDATA_IM_xhdl4;    
         RLAST_IM_r <= RLAST_IM_xhdl5;    
         RRESP_IM_r <= RRESP_IM_xhdl2;    
         prev_slv_rd <= curr_slv_rd;    
         rd_inprog_r <= rd_inprog;    
      END IF;
      END IF;
   END PROCESS;

   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         RVALID_IM_xhdl3 <= '0';    
         RID_IM_xhdl1 <= (OTHERS => '0');    
         RDATA_IM_xhdl4 <= (OTHERS => '0');    
         RLAST_IM_xhdl5 <= '0';    
         RRESP_IM_xhdl2 <= (OTHERS => '0');        
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         RVALID_IM_xhdl3 <= '0';    
         RID_IM_xhdl1 <= (OTHERS => '0');    
         RDATA_IM_xhdl4 <= (OTHERS => '0');    
         RLAST_IM_xhdl5 <= '0';    
         RRESP_IM_xhdl2 <= (OTHERS => '0'); 
      ELSE 
         RVALID_IM_xhdl3 <= RVALID_IM_int;    
         RID_IM_xhdl1 <= RID_IM_int;    
         RDATA_IM_xhdl4 <= RDATA_IM_int;    
         RLAST_IM_xhdl5 <= RLAST_IM_int;    
         RRESP_IM_xhdl2 <= RRESP_IM_int;    
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         curr_state <= (OTHERS => '0');        
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         curr_state <= (OTHERS => '0');
      ELSE 
         curr_state <= next_state;    
      END IF;
      END IF;
   END PROCESS;

   PROCESS (RID_IM_xhdl1, next_state, 
   RLAST_IM_int, RRESP_SI10, RRESP_SI11, RID_SI0, RRESP_SI12, rd_inprog, 
   RID_SI1, RRESP_SI13, RDATA_SI0, RID_SI2, RRESP_SI14, RDATA_SI1, RID_SI3, 
   RRESP_SI15, RDATA_SI2, RID_SI4, RRESP_IM_int, RRESP_SI16, RDATA_SI3, RID_SI5,
   RDATA_SI4, RID_SI6, RDATA_SI5, RID_SI7, RDATA_SI6, RID_SI8, 
   RDATA_SI7, RID_SI9, RDATA_SI8, RDATA_SI9, RRESP_IM_xhdl2, RDATA_IM_int, 
   curr_slv_rd, RVALID_SI0, RVALID_SI1,
   RVALID_SI2, RVALID_SI3, RVALID_SI4, RVALID_SI5, 
   RVALID_IM_xhdl3, RVALID_SI6, RVALID_SI7, RVALID_SI8, 
   RVALID_SI9, RVALID_IM_int, RRESP_SI0, RRESP_SI1, RRESP_SI2, RRESP_SI3, 
   RRESP_SI4, RRESP_SI5, RRESP_SI6, RRESP_SI7, RRESP_SI8, 
   RID_SI10, RRESP_SI9, RID_SI11, RID_SI12, RVALID_SI10, RID_SI13, 
   RVALID_SI11, RLAST_SI10, RID_SI14, RLAST_SI11, RVALID_SI12, RLAST_SI12, 
   RID_SI15, RVALID_SI13, RLAST_SI13, RID_SI16, RVALID_SI14, RLAST_SI14, 
   RVALID_SI15, RLAST_SI15, RVALID_SI16, RLAST_SI16, RID_IM_int, 
   RREADY_MI, RLAST_SI0, RLAST_SI1, RLAST_SI2, 
   RLAST_SI3, RLAST_SI4, RLAST_SI5, RLAST_SI6, RLAST_SI7, 
   RLAST_SI8, RVALID_IM_r, RLAST_SI9, RDATA_SI10, RDATA_SI11, RDATA_SI12, 
   RDATA_SI13, RDATA_SI14, RDATA_SI15, RDATA_SI16, RDATA_IM_xhdl4, 
   curr_state, RLAST_IM_xhdl5)
      VARIABLE next_state_xhdl23  : std_logic_vector(4 DOWNTO 0);
      VARIABLE rd_inprog_xhdl24  : std_logic;
      VARIABLE RREADY_IS0_xhdl6_xhdl25  : std_logic;
      VARIABLE RREADY_IS1_xhdl7_xhdl26  : std_logic;
      VARIABLE RREADY_IS2_xhdl8_xhdl27  : std_logic;
      VARIABLE RREADY_IS3_xhdl9_xhdl28  : std_logic;
      VARIABLE RREADY_IS4_xhdl10_xhdl29  : std_logic;
      VARIABLE RREADY_IS5_xhdl11_xhdl30  : std_logic;
      VARIABLE RREADY_IS6_xhdl12_xhdl31  : std_logic;
      VARIABLE RREADY_IS7_xhdl13_xhdl32  : std_logic;
      VARIABLE RREADY_IS8_xhdl14_xhdl33  : std_logic;
      VARIABLE RREADY_IS9_xhdl15_xhdl34  : std_logic;
      VARIABLE RREADY_IS10_xhdl16_xhdl35  : std_logic;
      VARIABLE RREADY_IS11_xhdl17_xhdl36  : std_logic;
      VARIABLE RREADY_IS12_xhdl18_xhdl37  : std_logic;
      VARIABLE RREADY_IS13_xhdl19_xhdl38  : std_logic;
      VARIABLE RREADY_IS14_xhdl20_xhdl39  : std_logic;
      VARIABLE RREADY_IS15_xhdl21_xhdl40  : std_logic;
      VARIABLE RREADY_IS16_xhdl22_xhdl41  : std_logic;
      VARIABLE RVALID_IM_int_xhdl42  : std_logic;
      VARIABLE RID_IM_int_xhdl43  : std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);
      VARIABLE RDATA_IM_int_xhdl44  : std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
      ;
      VARIABLE RLAST_IM_int_xhdl45  : std_logic;
      VARIABLE RRESP_IM_int_xhdl46  : std_logic_vector(1 DOWNTO 0);
   BEGIN
      next_state_xhdl23 := curr_state;    
      rd_inprog_xhdl24 := '0';    
      RREADY_IS0_xhdl6_xhdl25 := '0';    
      RREADY_IS1_xhdl7_xhdl26 := '0';    
      RREADY_IS2_xhdl8_xhdl27 := '0';    
      RREADY_IS3_xhdl9_xhdl28 := '0';    
      RREADY_IS4_xhdl10_xhdl29 := '0';    
      RREADY_IS5_xhdl11_xhdl30 := '0';    
      RREADY_IS6_xhdl12_xhdl31 := '0';    
      RREADY_IS7_xhdl13_xhdl32 := '0';    
      RREADY_IS8_xhdl14_xhdl33 := '0';    
      RREADY_IS9_xhdl15_xhdl34 := '0';    
      RREADY_IS10_xhdl16_xhdl35 := '0';    
      RREADY_IS11_xhdl17_xhdl36 := '0';    
      RREADY_IS12_xhdl18_xhdl37 := '0';    
      RREADY_IS13_xhdl19_xhdl38 := '0';    
      RREADY_IS14_xhdl20_xhdl39 := '0';    
      RREADY_IS15_xhdl21_xhdl40 := '0';    
      RREADY_IS16_xhdl22_xhdl41 := '0';    
      RVALID_IM_int_xhdl42 := '0';    
      RID_IM_int_xhdl43 := (OTHERS => '0');    
      RDATA_IM_int_xhdl44 := (OTHERS => '0');    
      RLAST_IM_int_xhdl45 := '0';    
      RRESP_IM_int_xhdl46 := (OTHERS => '0');       
      CASE curr_state IS
         WHEN RD_IDLE =>
                  RVALID_IM_int_xhdl42 := '0';    
                  RID_IM_int_xhdl43 := (OTHERS => '0');    
                  RDATA_IM_int_xhdl44 := (OTHERS => '0');    
                  RLAST_IM_int_xhdl45 := '0';    
                  RRESP_IM_int_xhdl46 := (OTHERS => '0');       
                  
                  IF (((RVALID_SI0 = '1' AND RID_SI0(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH) AND RVALID_SI0 = '1') AND SC_0 = 0) THEN
                     next_state_xhdl23 := RD_S0_SEL;    
                  ELSE
                     IF (((RVALID_SI1 = '1' AND RID_SI1(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH) AND RVALID_SI1 = 
                     '1') AND SC_1 = 0) THEN
                        next_state_xhdl23 := RD_S1_SEL;    
                     ELSE
                        IF (((RVALID_SI2 = '1' AND RID_SI2(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH) AND RVALID_SI2 = 
                        '1') AND SC_2 = 0) THEN
                           next_state_xhdl23 := RD_S2_SEL;    
                        ELSE
                           IF (((RVALID_SI3 = '1' AND RID_SI3(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH) AND 
                           RVALID_SI3 = '1') AND SC_3 = 0) THEN
                              next_state_xhdl23 := RD_S3_SEL;    
                           ELSE
                              IF (((RVALID_SI4 = '1' AND RID_SI4(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH) AND 
                              RVALID_SI4 = '1') AND SC_4 = 0) THEN
                                 next_state_xhdl23 := RD_S4_SEL;    
                              ELSE
                                 IF (((RVALID_SI5 = '1' AND 
                                 RID_SI5(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH) AND RVALID_SI5 = '1') 
                                 AND SC_5 = 0) THEN
                                    next_state_xhdl23 := RD_S5_SEL;    
                                 ELSE
                                    IF (((RVALID_SI6 = '1' AND 
                                    RID_SI6(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH) AND RVALID_SI6 = '1')
                                    AND SC_6 = 0) THEN
                                       next_state_xhdl23 := RD_S6_SEL;    
                                    ELSE
                                       IF (((RVALID_SI7 = '1' AND 
                                       RID_SI7(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH) AND RVALID_SI7 = 
                                       '1') AND SC_7 = 0) THEN
                                          next_state_xhdl23 := RD_S7_SEL;    
                                       ELSE
                                          IF (((RVALID_SI8 = '1' AND 
                                          RID_SI8(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH) AND 
                                          RVALID_SI8 = '1') AND SC_8 = 0) 
                                          THEN
                                             next_state_xhdl23 := RD_S8_SEL;    
                                          ELSE
                                             IF (((RVALID_SI9 = '1' AND 
                                             RID_SI9(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH) AND 
                                             RVALID_SI9 = '1') AND SC_9 = 0) 
                                             THEN
                                                next_state_xhdl23 := RD_S9_SEL; 
                                             ELSE
                                                IF (((RVALID_SI10 = '1' AND 
                                                RID_SI10(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = 
                                                UID_WIDTH) AND RVALID_SI10 = 
                                                '1') AND SC_10 = 0) THEN
                                                   next_state_xhdl23 := 
                                                   RD_S10_SEL;    
                                                ELSE
                                                   IF (((RVALID_SI11 = '1' AND 
                                                   RID_SI11(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = 
                                                   UID_WIDTH) AND RVALID_SI11 = 
                                                   '1') AND SC_11 = 0) THEN
                                                      next_state_xhdl23 := 
                                                      RD_S11_SEL;    
                                                   ELSE
                                                      IF (((RVALID_SI12 = '1' 
                                                      AND 
                                                      RID_SI12(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) 
                                                      = UID_WIDTH) AND 
                                                      RVALID_SI12 = '1') AND 
                                                      SC_12 = 0) THEN
                                                         next_state_xhdl23 := 
                                                         RD_S12_SEL;    
                                                      ELSE
                                                         IF (((RVALID_SI13 = 
                                                         '1' AND 
                                                         RID_SI13(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH) 
                                                         AND RVALID_SI13 = '1') 
                                                         AND SC_13 = 0) 
                                                         THEN
                                                            next_state_xhdl23 
                                                            := RD_S13_SEL;    
                                                         ELSE
                                                            IF (((RVALID_SI14 = 
                                                            '1' AND 
                                                            RID_SI14(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = 
                                                            UID_WIDTH) AND 
                                                            RVALID_SI14 = '1') 
                                                            AND SC_14 = 0) 
                                                            THEN
                                                               next_state_xhdl23 
                                                               := RD_S14_SEL;   
                                                            ELSE
                                                               IF 
                                                               (((RVALID_SI15 = 
                                                               '1' AND 
                                                               RID_SI15(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = 
                                                               UID_WIDTH) AND 
                                                               RVALID_SI15 = 
                                                               '1') AND SC_15 = 
                                                               0) THEN
                                                                  next_state_xhdl23 
                                                                  := 
                                                                  RD_S15_SEL;   
                                                               ELSE
                                                                  IF 
                                                                  ((RVALID_SI16 
                                                                  = '1' AND 
                                                                  RID_SI16(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2)
                                                                  = UID_WIDTH) 
                                                                  AND 
                                                                  RVALID_SI16 = 
                                                                  '1') THEN
                                                                     next_state_xhdl23 
                                                                     := 
                                                                     RD_S16_SEL;
                                                                  END IF;
                                                               END IF;
                                                            END IF;
                                                         END IF;
                                                      END IF;
                                                   END IF;
                                                END IF;
                                             END IF;
                                          END IF;
                                       END IF;
                                    END IF;
                                 END IF;
                              END IF;
                           END IF;
                        END IF;
                     END IF;
                  END IF;
         WHEN RD_S0_SEL =>
                  rd_inprog_xhdl24 := '1';    
                  IF ((RVALID_IM_r AND RREADY_MI) = '1') THEN
                     RVALID_IM_int_xhdl42 := '0';    
                     RID_IM_int_xhdl43 := (OTHERS => '0');    
                     RDATA_IM_int_xhdl44 := (OTHERS => '0');    
                     RLAST_IM_int_xhdl45 := '0';    
                     RRESP_IM_int_xhdl46 := (OTHERS => '0');       
                     next_state_xhdl23 := RD_IDLE;    
                     RREADY_IS0_xhdl6_xhdl25 := RREADY_MI;    
                  ELSE
                     RVALID_IM_int_xhdl42 := RVALID_SI0;    
                     RID_IM_int_xhdl43 := RID_SI0;    
                     RDATA_IM_int_xhdl44 := RDATA_SI0;    
                     RLAST_IM_int_xhdl45 := RLAST_SI0;    
                     RRESP_IM_int_xhdl46 := RRESP_SI0;    
                  END IF;
         WHEN RD_S1_SEL =>
                  rd_inprog_xhdl24 := '1';    
                  IF ((RVALID_IM_r AND RREADY_MI) = '1') THEN
                     RVALID_IM_int_xhdl42 := '0';    
                     RID_IM_int_xhdl43 := (OTHERS => '0');    
                     RDATA_IM_int_xhdl44 := (OTHERS => '0');    
                     RLAST_IM_int_xhdl45 := '0';    
                     RRESP_IM_int_xhdl46 := (OTHERS => '0');        
                     next_state_xhdl23 := RD_IDLE;    
                     RREADY_IS1_xhdl7_xhdl26 := RREADY_MI;    
                  ELSE
                     RVALID_IM_int_xhdl42 := RVALID_SI1;    
                     RID_IM_int_xhdl43 := RID_SI1;    
                     RDATA_IM_int_xhdl44 := RDATA_SI1;    
                     RLAST_IM_int_xhdl45 := RLAST_SI1;    
                     RRESP_IM_int_xhdl46 := RRESP_SI1;    
                  END IF;
         WHEN RD_S2_SEL =>
                  rd_inprog_xhdl24 := '1';    
                  IF ((RVALID_IM_r AND RREADY_MI) = '1') THEN
                     RVALID_IM_int_xhdl42 := '0';    
                     RID_IM_int_xhdl43 := (OTHERS => '0');    
                     RDATA_IM_int_xhdl44 := (OTHERS => '0');    
                     RLAST_IM_int_xhdl45 := '0';    
                     RRESP_IM_int_xhdl46 := (OTHERS => '0');        
                     next_state_xhdl23 := RD_IDLE;    
                     RREADY_IS2_xhdl8_xhdl27 := RREADY_MI;    
                  ELSE
                     RVALID_IM_int_xhdl42 := RVALID_SI2;    
                     RID_IM_int_xhdl43 := RID_SI2;    
                     RDATA_IM_int_xhdl44 := RDATA_SI2;    
                     RLAST_IM_int_xhdl45 := RLAST_SI2;    
                     RRESP_IM_int_xhdl46 := RRESP_SI2;    
                  END IF;
         WHEN RD_S3_SEL =>
                  rd_inprog_xhdl24 := '1';    
                  IF ((RVALID_IM_r AND RREADY_MI) = '1') THEN
                     RVALID_IM_int_xhdl42 := '0';    
                     RID_IM_int_xhdl43 := (OTHERS => '0');    
                     RDATA_IM_int_xhdl44 := (OTHERS => '0');    
                     RLAST_IM_int_xhdl45 := '0';    
                     RRESP_IM_int_xhdl46 := (OTHERS => '0');    
                     next_state_xhdl23 := RD_IDLE;    
                     RREADY_IS3_xhdl9_xhdl28 := RREADY_MI;    
                  ELSE
                     RVALID_IM_int_xhdl42 := RVALID_SI3;    
                     RID_IM_int_xhdl43 := RID_SI3;    
                     RDATA_IM_int_xhdl44 := RDATA_SI3;    
                     RLAST_IM_int_xhdl45 := RLAST_SI3;    
                     RRESP_IM_int_xhdl46 := RRESP_SI3;    
                  END IF;
         WHEN RD_S4_SEL =>
                  rd_inprog_xhdl24 := '1';    
                  IF ((RVALID_IM_r AND RREADY_MI) = '1') THEN
                     RVALID_IM_int_xhdl42 := '0';    
                     RID_IM_int_xhdl43 := (OTHERS => '0');    
                     RDATA_IM_int_xhdl44 := (OTHERS => '0');    
                     RLAST_IM_int_xhdl45 := '0';    
                     RRESP_IM_int_xhdl46 := (OTHERS => '0');        
                     next_state_xhdl23 := RD_IDLE;    
                     RREADY_IS4_xhdl10_xhdl29 := RREADY_MI;    
                  ELSE
                     RVALID_IM_int_xhdl42 := RVALID_SI4;    
                     RID_IM_int_xhdl43 := RID_SI4;    
                     RDATA_IM_int_xhdl44 := RDATA_SI4;    
                     RLAST_IM_int_xhdl45 := RLAST_SI4;    
                     RRESP_IM_int_xhdl46 := RRESP_SI4;    
                  END IF;
         WHEN RD_S5_SEL =>
                  rd_inprog_xhdl24 := '1';    
                  IF ((RVALID_IM_r AND RREADY_MI) = '1') THEN
                     RVALID_IM_int_xhdl42 := '0';    
                     RID_IM_int_xhdl43 := (OTHERS => '0');    
                     RDATA_IM_int_xhdl44 := (OTHERS => '0');    
                     RLAST_IM_int_xhdl45 := '0';    
                     RRESP_IM_int_xhdl46 := (OTHERS => '0');        
                     next_state_xhdl23 := RD_IDLE;    
                     RREADY_IS5_xhdl11_xhdl30 := RREADY_MI;    
                  ELSE
                     RVALID_IM_int_xhdl42 := RVALID_SI5;    
                     RID_IM_int_xhdl43 := RID_SI5;    
                     RDATA_IM_int_xhdl44 := RDATA_SI5;    
                     RLAST_IM_int_xhdl45 := RLAST_SI5;    
                     RRESP_IM_int_xhdl46 := RRESP_SI5;    
                  END IF;
         WHEN RD_S6_SEL =>
                  rd_inprog_xhdl24 := '1';    
                  IF ((RVALID_IM_r AND RREADY_MI) = '1') THEN
                     RVALID_IM_int_xhdl42 := '0';    
                     RID_IM_int_xhdl43 := (OTHERS => '0');    
                     RDATA_IM_int_xhdl44 := (OTHERS => '0');    
                     RLAST_IM_int_xhdl45 := '0';    
                     RRESP_IM_int_xhdl46 := (OTHERS => '0');       
                     next_state_xhdl23 := RD_IDLE;    
                     RREADY_IS6_xhdl12_xhdl31 := RREADY_MI;    
                  ELSE
                     RVALID_IM_int_xhdl42 := RVALID_SI6;    
                     RID_IM_int_xhdl43 := RID_SI6;    
                     RDATA_IM_int_xhdl44 := RDATA_SI6;    
                     RLAST_IM_int_xhdl45 := RLAST_SI6;    
                     RRESP_IM_int_xhdl46 := RRESP_SI6;    
                  END IF;
         WHEN RD_S7_SEL =>
                  rd_inprog_xhdl24 := '1';    
                  IF ((RVALID_IM_r AND RREADY_MI) = '1') THEN
                     RVALID_IM_int_xhdl42 := '0';    
                     RID_IM_int_xhdl43 := (OTHERS => '0');    
                     RDATA_IM_int_xhdl44 := (OTHERS => '0');    
                     RLAST_IM_int_xhdl45 := '0';    
                     RRESP_IM_int_xhdl46 := (OTHERS => '0');    
                     next_state_xhdl23 := RD_IDLE;    
                     RREADY_IS7_xhdl13_xhdl32 := RREADY_MI;    
                  ELSE
                     RVALID_IM_int_xhdl42 := RVALID_SI7;    
                     RID_IM_int_xhdl43 := RID_SI7;    
                     RDATA_IM_int_xhdl44 := RDATA_SI7;    
                     RLAST_IM_int_xhdl45 := RLAST_SI7;    
                     RRESP_IM_int_xhdl46 := RRESP_SI7;    
                  END IF;
         WHEN RD_S8_SEL =>
                  rd_inprog_xhdl24 := '1';    
                  IF ((RVALID_IM_r AND RREADY_MI) = '1') THEN
                     RVALID_IM_int_xhdl42 := '0';    
                     RID_IM_int_xhdl43 := (OTHERS => '0');    
                     RDATA_IM_int_xhdl44 := (OTHERS => '0');    
                     RLAST_IM_int_xhdl45 := '0';    
                     RRESP_IM_int_xhdl46 := (OTHERS => '0');        
                     next_state_xhdl23 := RD_IDLE;    
                     RREADY_IS8_xhdl14_xhdl33 := RREADY_MI;    
                  ELSE
                     RVALID_IM_int_xhdl42 := RVALID_SI8;    
                     RID_IM_int_xhdl43 := RID_SI8;    
                     RDATA_IM_int_xhdl44 := RDATA_SI8;    
                     RLAST_IM_int_xhdl45 := RLAST_SI8;    
                     RRESP_IM_int_xhdl46 := RRESP_SI8;    
                  END IF;
         WHEN RD_S9_SEL =>
                  rd_inprog_xhdl24 := '1';    
                  IF ((RVALID_IM_r AND RREADY_MI) = '1') THEN
                     RVALID_IM_int_xhdl42 := '0';    
                     RID_IM_int_xhdl43 := (OTHERS => '0');    
                     RDATA_IM_int_xhdl44 := (OTHERS => '0');    
                     RLAST_IM_int_xhdl45 := '0';    
                     RRESP_IM_int_xhdl46 := (OTHERS => '0');        
                     next_state_xhdl23 := RD_IDLE;    
                     RREADY_IS9_xhdl15_xhdl34 := RREADY_MI;    
                  ELSE
                     RVALID_IM_int_xhdl42 := RVALID_SI9;    
                     RID_IM_int_xhdl43 := RID_SI9;    
                     RDATA_IM_int_xhdl44 := RDATA_SI9;    
                     RLAST_IM_int_xhdl45 := RLAST_SI9;    
                     RRESP_IM_int_xhdl46 := RRESP_SI9;    
                  END IF;
         WHEN RD_S10_SEL =>
                  rd_inprog_xhdl24 := '1';    
                  IF ((RVALID_IM_r AND RREADY_MI) = '1') THEN
                     RVALID_IM_int_xhdl42 := '0';    
                     RID_IM_int_xhdl43 := (OTHERS => '0');    
                     RDATA_IM_int_xhdl44 := (OTHERS => '0');    
                     RLAST_IM_int_xhdl45 := '0';    
                     RRESP_IM_int_xhdl46 := (OTHERS => '0');       
                     next_state_xhdl23 := RD_IDLE;    
                     RREADY_IS10_xhdl16_xhdl35 := RREADY_MI;    
                  ELSE
                     RVALID_IM_int_xhdl42 := RVALID_SI10;    
                     RID_IM_int_xhdl43 := RID_SI10;    
                     RDATA_IM_int_xhdl44 := RDATA_SI10;    
                     RLAST_IM_int_xhdl45 := RLAST_SI10;    
                     RRESP_IM_int_xhdl46 := RRESP_SI10;    
                  END IF;
         WHEN RD_S11_SEL =>
                  rd_inprog_xhdl24 := '1';    
                  IF ((RVALID_IM_r AND RREADY_MI) = '1') THEN
                     RVALID_IM_int_xhdl42 := '0';    
                     RID_IM_int_xhdl43 := (OTHERS => '0');    
                     RDATA_IM_int_xhdl44 := (OTHERS => '0');    
                     RLAST_IM_int_xhdl45 := '0';    
                     RRESP_IM_int_xhdl46 := (OTHERS => '0');        
                     next_state_xhdl23 := RD_IDLE;    
                     RREADY_IS11_xhdl17_xhdl36 := RREADY_MI;    
                  ELSE
                     RVALID_IM_int_xhdl42 := RVALID_SI11;    
                     RID_IM_int_xhdl43 := RID_SI11;    
                     RDATA_IM_int_xhdl44 := RDATA_SI11;    
                     RLAST_IM_int_xhdl45 := RLAST_SI11;    
                     RRESP_IM_int_xhdl46 := RRESP_SI11;    
                  END IF;
         WHEN RD_S12_SEL =>
                  rd_inprog_xhdl24 := '1';    
                  IF ((RVALID_IM_r AND RREADY_MI) = '1') THEN
                     RVALID_IM_int_xhdl42 := '0';    
                     RID_IM_int_xhdl43 := (OTHERS => '0');    
                     RDATA_IM_int_xhdl44 := (OTHERS => '0');    
                     RLAST_IM_int_xhdl45 := '0';    
                     RRESP_IM_int_xhdl46 := (OTHERS => '0');        
                     next_state_xhdl23 := RD_IDLE;    
                     RREADY_IS12_xhdl18_xhdl37 := RREADY_MI;    
                  ELSE
                     RVALID_IM_int_xhdl42 := RVALID_SI12;    
                     RID_IM_int_xhdl43 := RID_SI12;    
                     RDATA_IM_int_xhdl44 := RDATA_SI12;    
                     RLAST_IM_int_xhdl45 := RLAST_SI12;    
                     RRESP_IM_int_xhdl46 := RRESP_SI12;    
                  END IF;
         WHEN RD_S13_SEL =>
                  rd_inprog_xhdl24 := '1';    
                  IF ((RVALID_IM_r AND RREADY_MI) = '1') THEN
                     RVALID_IM_int_xhdl42 := '0';    
                     RID_IM_int_xhdl43 := (OTHERS => '0');    
                     RDATA_IM_int_xhdl44 := (OTHERS => '0');    
                     RLAST_IM_int_xhdl45 := '0';    
                     RRESP_IM_int_xhdl46 := (OTHERS => '0');        
                     next_state_xhdl23 := RD_IDLE;    
                     RREADY_IS13_xhdl19_xhdl38 := RREADY_MI;    
                  ELSE
                     RVALID_IM_int_xhdl42 := RVALID_SI13;    
                     RID_IM_int_xhdl43 := RID_SI13;    
                     RDATA_IM_int_xhdl44 := RDATA_SI13;    
                     RLAST_IM_int_xhdl45 := RLAST_SI13;    
                     RRESP_IM_int_xhdl46 := RRESP_SI13;    
                  END IF;
         WHEN RD_S14_SEL =>
                  rd_inprog_xhdl24 := '1';    
                  IF ((RVALID_IM_r AND RREADY_MI) = '1') THEN
                     RVALID_IM_int_xhdl42 := '0';    
                     RID_IM_int_xhdl43 := (OTHERS => '0');    
                     RDATA_IM_int_xhdl44 := (OTHERS => '0');    
                     RLAST_IM_int_xhdl45 := '0';    
                     RRESP_IM_int_xhdl46 := (OTHERS => '0');        
                     next_state_xhdl23 := RD_IDLE;    
                     RREADY_IS14_xhdl20_xhdl39 := RREADY_MI;    
                  ELSE
                     RVALID_IM_int_xhdl42 := RVALID_SI14;    
                     RID_IM_int_xhdl43 := RID_SI14;    
                     RDATA_IM_int_xhdl44 := RDATA_SI14;    
                     RLAST_IM_int_xhdl45 := RLAST_SI14;    
                     RRESP_IM_int_xhdl46 := RRESP_SI14;    
                  END IF;
         WHEN RD_S15_SEL =>
                  rd_inprog_xhdl24 := '1';    
                  IF ((RVALID_IM_r AND RREADY_MI) = '1') THEN
                     RVALID_IM_int_xhdl42 := '0';    
                     RID_IM_int_xhdl43 := (OTHERS => '0');    
                     RDATA_IM_int_xhdl44 := (OTHERS => '0');    
                     RLAST_IM_int_xhdl45 := '0';    
                     RRESP_IM_int_xhdl46 := (OTHERS => '0');        
                     next_state_xhdl23 := RD_IDLE;    
                     RREADY_IS15_xhdl21_xhdl40 := RREADY_MI;    
                  ELSE
                     RVALID_IM_int_xhdl42 := RVALID_SI15;    
                     RID_IM_int_xhdl43 := RID_SI15;    
                     RDATA_IM_int_xhdl44 := RDATA_SI15;    
                     RLAST_IM_int_xhdl45 := RLAST_SI15;    
                     RRESP_IM_int_xhdl46 := RRESP_SI15;    
                  END IF;
         WHEN RD_S16_SEL =>
                  rd_inprog_xhdl24 := '1';    
                  IF ((RVALID_IM_r AND RREADY_MI) = '1') THEN
                     RVALID_IM_int_xhdl42 := '0';    
                     RID_IM_int_xhdl43 := (OTHERS => '0');    
                     RDATA_IM_int_xhdl44 := (OTHERS => '0');    
                     RLAST_IM_int_xhdl45 := '0';    
                     RRESP_IM_int_xhdl46 := (OTHERS => '0');    
                     next_state_xhdl23 := RD_IDLE;    
                     RREADY_IS16_xhdl22_xhdl41 := RREADY_MI;    
                  ELSE
                     RVALID_IM_int_xhdl42 := RVALID_SI16;    
                     RID_IM_int_xhdl43 := RID_SI16;    
                     RDATA_IM_int_xhdl44 := RDATA_SI16;    
                     RLAST_IM_int_xhdl45 := RLAST_SI16;    
                     RRESP_IM_int_xhdl46 := RRESP_SI16;    
                  END IF;
         WHEN OTHERS  =>
                  rd_inprog_xhdl24 := '0';    
                  RVALID_IM_int_xhdl42 := '0';    
                  RID_IM_int_xhdl43 := (OTHERS => '0');    
                  RDATA_IM_int_xhdl44 := (OTHERS => '0');    
                  RLAST_IM_int_xhdl45 := '0';    
                  RRESP_IM_int_xhdl46 := (OTHERS => '0');       
                  next_state_xhdl23 := RD_IDLE;    
         
      END CASE;
      -- case (curr_state)
      
      
      next_state <= next_state_xhdl23;
      rd_inprog <= rd_inprog_xhdl24;
      RREADY_IS0_xhdl6 <= RREADY_IS0_xhdl6_xhdl25;
      RREADY_IS1_xhdl7 <= RREADY_IS1_xhdl7_xhdl26;
      RREADY_IS2_xhdl8 <= RREADY_IS2_xhdl8_xhdl27;
      RREADY_IS3_xhdl9 <= RREADY_IS3_xhdl9_xhdl28;
      RREADY_IS4_xhdl10 <= RREADY_IS4_xhdl10_xhdl29;
      RREADY_IS5_xhdl11 <= RREADY_IS5_xhdl11_xhdl30;
      RREADY_IS6_xhdl12 <= RREADY_IS6_xhdl12_xhdl31;
      RREADY_IS7_xhdl13 <= RREADY_IS7_xhdl13_xhdl32;
      RREADY_IS8_xhdl14 <= RREADY_IS8_xhdl14_xhdl33;
      RREADY_IS9_xhdl15 <= RREADY_IS9_xhdl15_xhdl34;
      RREADY_IS10_xhdl16 <= RREADY_IS10_xhdl16_xhdl35;
      RREADY_IS11_xhdl17 <= RREADY_IS11_xhdl17_xhdl36;
      RREADY_IS12_xhdl18 <= RREADY_IS12_xhdl18_xhdl37;
      RREADY_IS13_xhdl19 <= RREADY_IS13_xhdl19_xhdl38;
      RREADY_IS14_xhdl20 <= RREADY_IS14_xhdl20_xhdl39;
      RREADY_IS15_xhdl21 <= RREADY_IS15_xhdl21_xhdl40;
      RREADY_IS16_xhdl22 <= RREADY_IS16_xhdl22_xhdl41;
      RVALID_IM_int <= RVALID_IM_int_xhdl42;
      RID_IM_int <= RID_IM_int_xhdl43;
      RDATA_IM_int <= RDATA_IM_int_xhdl44;
      RLAST_IM_int <= RLAST_IM_int_xhdl45;
      RRESP_IM_int <= RRESP_IM_int_xhdl46;
   END PROCESS;

END ARCHITECTURE translated;
