-- ****************************************************************************/
-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description: wrresp_channel.v
--              
--              Contains:
--                       - 
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

ENTITY axi_wresp_channel IS
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
      -- From fwd master waselector

--      SLAVE_SELECT_WADDRCH_M  : IN std_logic_vector(16 DOWNTO 0);   
      -- From Master 0
-- AXI write data channel signals

      BID_IM                  : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_IM                : OUT std_logic_vector(1 DOWNTO 0);   
      BVALID_IM               : OUT std_logic;   
      BREADY_MI               : IN std_logic;   
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
END ENTITY axi_wresp_channel;

ARCHITECTURE translated OF axi_wresp_channel IS


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
   SIGNAL BID_IM_int               :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_IM_int             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_IM_int            :  std_logic;   
   SIGNAL BID_IM_xhdl1             :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_IM_xhdl2           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_IM_xhdl3          :  std_logic;   
   SIGNAL BREADY_IS0_xhdl4         :  std_logic;   
   SIGNAL BREADY_IS1_xhdl5         :  std_logic;   
   SIGNAL BREADY_IS2_xhdl6         :  std_logic;   
   SIGNAL BREADY_IS3_xhdl7         :  std_logic;   
   SIGNAL BREADY_IS4_xhdl8         :  std_logic;   
   SIGNAL BREADY_IS5_xhdl9         :  std_logic;   
   SIGNAL BREADY_IS6_xhdl10        :  std_logic;   
   SIGNAL BREADY_IS7_xhdl11        :  std_logic;   
   SIGNAL BREADY_IS8_xhdl12        :  std_logic;   
   SIGNAL BREADY_IS9_xhdl13        :  std_logic;   
   SIGNAL BREADY_IS10_xhdl14       :  std_logic;   
   SIGNAL BREADY_IS11_xhdl15       :  std_logic;   
   SIGNAL BREADY_IS12_xhdl16       :  std_logic;   
   SIGNAL BREADY_IS13_xhdl17       :  std_logic;   
   SIGNAL BREADY_IS14_xhdl18       :  std_logic;   
   SIGNAL BREADY_IS15_xhdl19       :  std_logic;   
   SIGNAL BREADY_IS16_xhdl20       :  std_logic;   
   SIGNAL areset_n                 :  std_logic;   
   SIGNAL sresetn                  :  std_logic;   

BEGIN
   --///////////////////////////////////////////////////////////////////////////
   --                               Start - of - Code                         //
   --///////////////////////////////////////////////////////////////////////////

   areset_n  <= '1' WHEN (SYNC_RESET = 1) ELSE ARESETN;
   sresetn   <= ARESETN WHEN (SYNC_RESET = 1) ELSE '1';

   BID_IM <= BID_IM_xhdl1;
   BRESP_IM <= BRESP_IM_xhdl2;
   BVALID_IM <= BVALID_IM_xhdl3;
   BREADY_IS0 <= BREADY_IS0_xhdl4;
   BREADY_IS1 <= BREADY_IS1_xhdl5;
   BREADY_IS2 <= BREADY_IS2_xhdl6;
   BREADY_IS3 <= BREADY_IS3_xhdl7;
   BREADY_IS4 <= BREADY_IS4_xhdl8;
   BREADY_IS5 <= BREADY_IS5_xhdl9;
   BREADY_IS6 <= BREADY_IS6_xhdl10;
   BREADY_IS7 <= BREADY_IS7_xhdl11;
   BREADY_IS8 <= BREADY_IS8_xhdl12;
   BREADY_IS9 <= BREADY_IS9_xhdl13;
   BREADY_IS10 <= BREADY_IS10_xhdl14;
   BREADY_IS11 <= BREADY_IS11_xhdl15;
   BREADY_IS12 <= BREADY_IS12_xhdl16;
   BREADY_IS13 <= BREADY_IS13_xhdl17;
   BREADY_IS14 <= BREADY_IS14_xhdl18;
   BREADY_IS15 <= BREADY_IS15_xhdl19;
   BREADY_IS16 <= BREADY_IS16_xhdl20;

   -- --------------------------------------------------------------------------
   -- Instance
   -- --------------------------------------------------------------------------
   -- BID_IMx/BRESP_IMx/BVALID_IMx:
   -- --------------------------------------------------------------------------
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         BID_IM_xhdl1 <= (OTHERS => '0');    
         BRESP_IM_xhdl2 <= (OTHERS => '0');        
         BVALID_IM_xhdl3 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         BID_IM_xhdl1 <= (OTHERS => '0');    
         BRESP_IM_xhdl2 <= (OTHERS => '0');        
         BVALID_IM_xhdl3 <= '0';    
      ELSE 
         BID_IM_xhdl1 <= BID_IM_int;    
         BRESP_IM_xhdl2 <= BRESP_IM_int;    
         BVALID_IM_xhdl3 <= BVALID_IM_int;    
      END IF;
      END IF;
   END PROCESS;

   PROCESS (BRESP_SI10, BRESP_SI11, BRESP_SI12, 
   BVALID_IM_int, BRESP_SI13, BRESP_SI14, BRESP_SI15, BRESP_SI16, 
   BREADY_MI, 
   BVALID_SI0, BVALID_SI1, BVALID_SI2, BVALID_SI3, BVALID_SI4, 
   BVALID_SI5, BVALID_SI6, BVALID_SI7, BVALID_SI8, BVALID_SI9, BVALID_SI10, 
   BID_SI0, BVALID_SI11, BID_SI1, BID_SI2, BVALID_SI12, BID_SI3, BVALID_SI13, 
   BVALID_SI14, BID_SI4, BVALID_SI15, BID_SI5, BVALID_SI16, BID_SI6, 
   BID_SI7, BID_SI8, BID_SI9, 
   BRESP_SI0, BRESP_SI1, BRESP_SI2, BRESP_SI3, BID_IM_int, 
   BRESP_SI4, BRESP_SI5, BRESP_SI6, BRESP_SI7, BRESP_SI8, BRESP_SI9, BID_SI10, 
   BID_SI11, BID_SI12, BID_SI13, BID_SI14, BID_SI15, BID_SI16, 
   BRESP_IM_int)
      VARIABLE BID_IM_int_xhdl21  : std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);
      VARIABLE BRESP_IM_int_xhdl22  : std_logic_vector(1 DOWNTO 0);
      VARIABLE BVALID_IM_int_xhdl23  : std_logic;
      VARIABLE BREADY_IS0_xhdl4_xhdl24  : std_logic;
      VARIABLE BREADY_IS1_xhdl5_xhdl25  : std_logic;
      VARIABLE BREADY_IS2_xhdl6_xhdl26  : std_logic;
      VARIABLE BREADY_IS3_xhdl7_xhdl27  : std_logic;
      VARIABLE BREADY_IS4_xhdl8_xhdl28  : std_logic;
      VARIABLE BREADY_IS5_xhdl9_xhdl29  : std_logic;
      VARIABLE BREADY_IS6_xhdl10_xhdl30  : std_logic;
      VARIABLE BREADY_IS7_xhdl11_xhdl31  : std_logic;
      VARIABLE BREADY_IS8_xhdl12_xhdl32  : std_logic;
      VARIABLE BREADY_IS9_xhdl13_xhdl33  : std_logic;
      VARIABLE BREADY_IS10_xhdl14_xhdl34  : std_logic;
      VARIABLE BREADY_IS11_xhdl15_xhdl35  : std_logic;
      VARIABLE BREADY_IS12_xhdl16_xhdl36  : std_logic;
      VARIABLE BREADY_IS13_xhdl17_xhdl37  : std_logic;
      VARIABLE BREADY_IS14_xhdl18_xhdl38  : std_logic;
      VARIABLE BREADY_IS15_xhdl19_xhdl39  : std_logic;
      VARIABLE BREADY_IS16_xhdl20_xhdl40  : std_logic;
   BEGIN
      IF ((BID_SI0(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH AND 
      BVALID_SI0 = '1') AND SC_0 = 0) THEN
         BID_IM_int_xhdl21 := BID_SI0;    
         BRESP_IM_int_xhdl22 := BRESP_SI0;    
         BVALID_IM_int_xhdl23 := BVALID_SI0;    
         BREADY_IS0_xhdl4_xhdl24 := BREADY_MI;    
         BREADY_IS1_xhdl5_xhdl25 := '0';    
         BREADY_IS2_xhdl6_xhdl26 := '0';    
         BREADY_IS3_xhdl7_xhdl27 := '0';    
         BREADY_IS4_xhdl8_xhdl28 := '0';    
         BREADY_IS5_xhdl9_xhdl29 := '0';    
         BREADY_IS6_xhdl10_xhdl30 := '0';    
         BREADY_IS7_xhdl11_xhdl31 := '0';    
         BREADY_IS8_xhdl12_xhdl32 := '0';    
         BREADY_IS9_xhdl13_xhdl33 := '0';    
         BREADY_IS10_xhdl14_xhdl34 := '0';    
         BREADY_IS11_xhdl15_xhdl35 := '0';    
         BREADY_IS12_xhdl16_xhdl36 := '0';    
         BREADY_IS13_xhdl17_xhdl37 := '0';    
         BREADY_IS14_xhdl18_xhdl38 := '0';    
         BREADY_IS15_xhdl19_xhdl39 := '0';    
         BREADY_IS16_xhdl20_xhdl40 := '0';    
      ELSE
         IF ((BID_SI1(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH AND 
         BVALID_SI1 = '1') AND SC_1 = 0) THEN
            BID_IM_int_xhdl21 := BID_SI1;    
            BRESP_IM_int_xhdl22 := BRESP_SI1;    
            BVALID_IM_int_xhdl23 := BVALID_SI1;    
            BREADY_IS1_xhdl5_xhdl25 := BREADY_MI;    
            BREADY_IS0_xhdl4_xhdl24 := '0';    
            BREADY_IS2_xhdl6_xhdl26 := '0';    
            BREADY_IS3_xhdl7_xhdl27 := '0';    
            BREADY_IS4_xhdl8_xhdl28 := '0';    
            BREADY_IS5_xhdl9_xhdl29 := '0';    
            BREADY_IS6_xhdl10_xhdl30 := '0';    
            BREADY_IS7_xhdl11_xhdl31 := '0';    
            BREADY_IS8_xhdl12_xhdl32 := '0';    
            BREADY_IS9_xhdl13_xhdl33 := '0';    
            BREADY_IS10_xhdl14_xhdl34 := '0';    
            BREADY_IS11_xhdl15_xhdl35 := '0';    
            BREADY_IS12_xhdl16_xhdl36 := '0';    
            BREADY_IS13_xhdl17_xhdl37 := '0';    
            BREADY_IS14_xhdl18_xhdl38 := '0';    
            BREADY_IS15_xhdl19_xhdl39 := '0';    
            BREADY_IS16_xhdl20_xhdl40 := '0';    
         ELSE
            IF ((BID_SI2(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH 
            AND BVALID_SI2 = '1') AND SC_2 = 0) THEN
               BID_IM_int_xhdl21 := BID_SI2;    
               BRESP_IM_int_xhdl22 := BRESP_SI2;    
               BVALID_IM_int_xhdl23 := BVALID_SI2;    
               BREADY_IS2_xhdl6_xhdl26 := BREADY_MI;    
               BREADY_IS0_xhdl4_xhdl24 := '0';    
               BREADY_IS1_xhdl5_xhdl25 := '0';    
               BREADY_IS3_xhdl7_xhdl27 := '0';    
               BREADY_IS4_xhdl8_xhdl28 := '0';    
               BREADY_IS5_xhdl9_xhdl29 := '0';    
               BREADY_IS6_xhdl10_xhdl30 := '0';    
               BREADY_IS7_xhdl11_xhdl31 := '0';    
               BREADY_IS8_xhdl12_xhdl32 := '0';    
               BREADY_IS9_xhdl13_xhdl33 := '0';    
               BREADY_IS10_xhdl14_xhdl34 := '0';    
               BREADY_IS11_xhdl15_xhdl35 := '0';    
               BREADY_IS12_xhdl16_xhdl36 := '0';    
               BREADY_IS13_xhdl17_xhdl37 := '0';    
               BREADY_IS14_xhdl18_xhdl38 := '0';    
               BREADY_IS15_xhdl19_xhdl39 := '0';    
               BREADY_IS16_xhdl20_xhdl40 := '0';    
            ELSE
               IF ((BID_SI3(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = 
               UID_WIDTH AND BVALID_SI3 = '1') AND SC_3 = 0) THEN
                  BID_IM_int_xhdl21 := BID_SI3;    
                  BRESP_IM_int_xhdl22 := BRESP_SI3;    
                  BVALID_IM_int_xhdl23 := BVALID_SI3;    
                  BREADY_IS3_xhdl7_xhdl27 := BREADY_MI;    
                  BREADY_IS0_xhdl4_xhdl24 := '0';    
                  BREADY_IS2_xhdl6_xhdl26 := '0';    
                  BREADY_IS1_xhdl5_xhdl25 := '0';    
                  BREADY_IS4_xhdl8_xhdl28 := '0';    
                  BREADY_IS5_xhdl9_xhdl29 := '0';    
                  BREADY_IS6_xhdl10_xhdl30 := '0';    
                  BREADY_IS7_xhdl11_xhdl31 := '0';    
                  BREADY_IS8_xhdl12_xhdl32 := '0';    
                  BREADY_IS9_xhdl13_xhdl33 := '0';    
                  BREADY_IS10_xhdl14_xhdl34 := '0';    
                  BREADY_IS11_xhdl15_xhdl35 := '0';    
                  BREADY_IS12_xhdl16_xhdl36 := '0';    
                  BREADY_IS13_xhdl17_xhdl37 := '0';    
                  BREADY_IS14_xhdl18_xhdl38 := '0';    
                  BREADY_IS15_xhdl19_xhdl39 := '0';    
                  BREADY_IS16_xhdl20_xhdl40 := '0';    
               ELSE
                  IF ((BID_SI4(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = 
                  UID_WIDTH AND BVALID_SI4 = '1') AND SC_4 = 0) THEN
                     BID_IM_int_xhdl21 := BID_SI4;    
                     BRESP_IM_int_xhdl22 := BRESP_SI4;    
                     BVALID_IM_int_xhdl23 := BVALID_SI4;    
                     BREADY_IS4_xhdl8_xhdl28 := BREADY_MI;    
                     BREADY_IS0_xhdl4_xhdl24 := '0';    
                     BREADY_IS2_xhdl6_xhdl26 := '0';    
                     BREADY_IS3_xhdl7_xhdl27 := '0';    
                     BREADY_IS1_xhdl5_xhdl25 := '0';    
                     BREADY_IS5_xhdl9_xhdl29 := '0';    
                     BREADY_IS6_xhdl10_xhdl30 := '0';    
                     BREADY_IS7_xhdl11_xhdl31 := '0';    
                     BREADY_IS8_xhdl12_xhdl32 := '0';    
                     BREADY_IS9_xhdl13_xhdl33 := '0';    
                     BREADY_IS10_xhdl14_xhdl34 := '0';    
                     BREADY_IS11_xhdl15_xhdl35 := '0';    
                     BREADY_IS12_xhdl16_xhdl36 := '0';    
                     BREADY_IS13_xhdl17_xhdl37 := '0';    
                     BREADY_IS14_xhdl18_xhdl38 := '0';    
                     BREADY_IS15_xhdl19_xhdl39 := '0';    
                     BREADY_IS16_xhdl20_xhdl40 := '0';    
                  ELSE
                     IF ((BID_SI5(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = 
                     UID_WIDTH AND BVALID_SI5 = '1') AND SC_5 = 0) THEN
                        BID_IM_int_xhdl21 := BID_SI5;    
                        BRESP_IM_int_xhdl22 := BRESP_SI5;    
                        BVALID_IM_int_xhdl23 := BVALID_SI5;    
                        BREADY_IS5_xhdl9_xhdl29 := BREADY_MI;    
                        BREADY_IS0_xhdl4_xhdl24 := '0';    
                        BREADY_IS2_xhdl6_xhdl26 := '0';    
                        BREADY_IS3_xhdl7_xhdl27 := '0';    
                        BREADY_IS4_xhdl8_xhdl28 := '0';    
                        BREADY_IS1_xhdl5_xhdl25 := '0';    
                        BREADY_IS6_xhdl10_xhdl30 := '0';    
                        BREADY_IS7_xhdl11_xhdl31 := '0';    
                        BREADY_IS8_xhdl12_xhdl32 := '0';    
                        BREADY_IS9_xhdl13_xhdl33 := '0';    
                        BREADY_IS10_xhdl14_xhdl34 := '0';    
                        BREADY_IS11_xhdl15_xhdl35 := '0';    
                        BREADY_IS12_xhdl16_xhdl36 := '0';    
                        BREADY_IS13_xhdl17_xhdl37 := '0';    
                        BREADY_IS14_xhdl18_xhdl38 := '0';    
                        BREADY_IS15_xhdl19_xhdl39 := '0';    
                        BREADY_IS16_xhdl20_xhdl40 := '0';    
                     ELSE
                        IF ((BID_SI6(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) 
                        = UID_WIDTH AND BVALID_SI6 = '1') AND SC_6 = 0) 
                        THEN
                           BID_IM_int_xhdl21 := BID_SI6;    
                           BRESP_IM_int_xhdl22 := BRESP_SI6;    
                           BVALID_IM_int_xhdl23 := BVALID_SI6;    
                           BREADY_IS6_xhdl10_xhdl30 := BREADY_MI;    
                           BREADY_IS0_xhdl4_xhdl24 := '0';    
                           BREADY_IS2_xhdl6_xhdl26 := '0';    
                           BREADY_IS3_xhdl7_xhdl27 := '0';    
                           BREADY_IS4_xhdl8_xhdl28 := '0';    
                           BREADY_IS5_xhdl9_xhdl29 := '0';    
                           BREADY_IS1_xhdl5_xhdl25 := '0';    
                           BREADY_IS7_xhdl11_xhdl31 := '0';    
                           BREADY_IS8_xhdl12_xhdl32 := '0';    
                           BREADY_IS9_xhdl13_xhdl33 := '0';    
                           BREADY_IS10_xhdl14_xhdl34 := '0';    
                           BREADY_IS11_xhdl15_xhdl35 := '0';    
                           BREADY_IS12_xhdl16_xhdl36 := '0';    
                           BREADY_IS13_xhdl17_xhdl37 := '0';    
                           BREADY_IS14_xhdl18_xhdl38 := '0';    
                           BREADY_IS15_xhdl19_xhdl39 := '0';    
                           BREADY_IS16_xhdl20_xhdl40 := '0';    
                        ELSE
                           IF ((BID_SI7(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH AND BVALID_SI7 = '1') AND SC_7 
                           = 0) THEN
                              BID_IM_int_xhdl21 := BID_SI7;    
                              BRESP_IM_int_xhdl22 := BRESP_SI7;    
                              BVALID_IM_int_xhdl23 := BVALID_SI7;    
                              BREADY_IS7_xhdl11_xhdl31 := BREADY_MI;    
                              BREADY_IS0_xhdl4_xhdl24 := '0';    
                              BREADY_IS2_xhdl6_xhdl26 := '0';    
                              BREADY_IS3_xhdl7_xhdl27 := '0';    
                              BREADY_IS4_xhdl8_xhdl28 := '0';    
                              BREADY_IS5_xhdl9_xhdl29 := '0';    
                              BREADY_IS6_xhdl10_xhdl30 := '0';    
                              BREADY_IS1_xhdl5_xhdl25 := '0';    
                              BREADY_IS8_xhdl12_xhdl32 := '0';    
                              BREADY_IS9_xhdl13_xhdl33 := '0';    
                              BREADY_IS10_xhdl14_xhdl34 := '0';    
                              BREADY_IS11_xhdl15_xhdl35 := '0';    
                              BREADY_IS12_xhdl16_xhdl36 := '0';    
                              BREADY_IS13_xhdl17_xhdl37 := '0';    
                              BREADY_IS14_xhdl18_xhdl38 := '0';    
                              BREADY_IS15_xhdl19_xhdl39 := '0';    
                              BREADY_IS16_xhdl20_xhdl40 := '0';    
                           ELSE
                              IF ((BID_SI8(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH AND BVALID_SI8 = '1') AND 
                              SC_8 = 0) THEN
                                 BID_IM_int_xhdl21 := BID_SI8;    
                                 BRESP_IM_int_xhdl22 := BRESP_SI8;    
                                 BVALID_IM_int_xhdl23 := BVALID_SI8;    
                                 BREADY_IS8_xhdl12_xhdl32 := BREADY_MI;    
                                 BREADY_IS0_xhdl4_xhdl24 := '0';    
                                 BREADY_IS2_xhdl6_xhdl26 := '0';    
                                 BREADY_IS3_xhdl7_xhdl27 := '0';    
                                 BREADY_IS4_xhdl8_xhdl28 := '0';    
                                 BREADY_IS5_xhdl9_xhdl29 := '0';    
                                 BREADY_IS6_xhdl10_xhdl30 := '0';    
                                 BREADY_IS7_xhdl11_xhdl31 := '0';    
                                 BREADY_IS1_xhdl5_xhdl25 := '0';    
                                 BREADY_IS9_xhdl13_xhdl33 := '0';    
                                 BREADY_IS10_xhdl14_xhdl34 := '0';    
                                 BREADY_IS11_xhdl15_xhdl35 := '0';    
                                 BREADY_IS12_xhdl16_xhdl36 := '0';    
                                 BREADY_IS13_xhdl17_xhdl37 := '0';    
                                 BREADY_IS14_xhdl18_xhdl38 := '0';    
                                 BREADY_IS15_xhdl19_xhdl39 := '0';    
                                 BREADY_IS16_xhdl20_xhdl40 := '0';    
                              ELSE
                                 IF ((BID_SI9(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH AND BVALID_SI9 = '1') 
                                 AND SC_9 = 0) THEN
                                    BID_IM_int_xhdl21 := BID_SI9;    
                                    BRESP_IM_int_xhdl22 := BRESP_SI9;    
                                    BVALID_IM_int_xhdl23 := BVALID_SI9;    
                                    BREADY_IS9_xhdl13_xhdl33 := BREADY_MI;    
                                    BREADY_IS0_xhdl4_xhdl24 := '0';    
                                    BREADY_IS2_xhdl6_xhdl26 := '0';    
                                    BREADY_IS3_xhdl7_xhdl27 := '0';    
                                    BREADY_IS4_xhdl8_xhdl28 := '0';    
                                    BREADY_IS5_xhdl9_xhdl29 := '0';    
                                    BREADY_IS6_xhdl10_xhdl30 := '0';    
                                    BREADY_IS7_xhdl11_xhdl31 := '0';    
                                    BREADY_IS8_xhdl12_xhdl32 := '0';    
                                    BREADY_IS1_xhdl5_xhdl25 := '0';    
                                    BREADY_IS10_xhdl14_xhdl34 := '0';    
                                    BREADY_IS11_xhdl15_xhdl35 := '0';    
                                    BREADY_IS12_xhdl16_xhdl36 := '0';    
                                    BREADY_IS13_xhdl17_xhdl37 := '0';    
                                    BREADY_IS14_xhdl18_xhdl38 := '0';    
                                    BREADY_IS15_xhdl19_xhdl39 := '0';    
                                    BREADY_IS16_xhdl20_xhdl40 := '0';    
                                 ELSE
                                    IF ((BID_SI10(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH AND BVALID_SI10 = 
                                    '1') AND SC_10 = 0) THEN
                                       BID_IM_int_xhdl21 := BID_SI10;    
                                       BRESP_IM_int_xhdl22 := BRESP_SI10;    
                                       BVALID_IM_int_xhdl23 := BVALID_SI10;    
                                       BREADY_IS10_xhdl14_xhdl34 := BREADY_MI;  
                                       BREADY_IS0_xhdl4_xhdl24 := '0';    
                                       BREADY_IS2_xhdl6_xhdl26 := '0';    
                                       BREADY_IS3_xhdl7_xhdl27 := '0';    
                                       BREADY_IS4_xhdl8_xhdl28 := '0';    
                                       BREADY_IS5_xhdl9_xhdl29 := '0';    
                                       BREADY_IS6_xhdl10_xhdl30 := '0';    
                                       BREADY_IS7_xhdl11_xhdl31 := '0';    
                                       BREADY_IS8_xhdl12_xhdl32 := '0';    
                                       BREADY_IS9_xhdl13_xhdl33 := '0';    
                                       BREADY_IS1_xhdl5_xhdl25 := '0';    
                                       BREADY_IS11_xhdl15_xhdl35 := '0';    
                                       BREADY_IS12_xhdl16_xhdl36 := '0';    
                                       BREADY_IS13_xhdl17_xhdl37 := '0';    
                                       BREADY_IS14_xhdl18_xhdl38 := '0';    
                                       BREADY_IS15_xhdl19_xhdl39 := '0';    
                                       BREADY_IS16_xhdl20_xhdl40 := '0';    
                                    ELSE
                                       IF ((BID_SI11(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH AND 
                                       BVALID_SI11 = '1') AND SC_11 = 0) 
                                       THEN
                                          BID_IM_int_xhdl21 := BID_SI11;    
                                          BRESP_IM_int_xhdl22 := BRESP_SI11;    
                                          BVALID_IM_int_xhdl23 := BVALID_SI11;  
                                          BREADY_IS11_xhdl15_xhdl35 := 
                                          BREADY_MI;    
                                          BREADY_IS0_xhdl4_xhdl24 := '0';    
                                          BREADY_IS2_xhdl6_xhdl26 := '0';    
                                          BREADY_IS3_xhdl7_xhdl27 := '0';    
                                          BREADY_IS4_xhdl8_xhdl28 := '0';    
                                          BREADY_IS5_xhdl9_xhdl29 := '0';    
                                          BREADY_IS6_xhdl10_xhdl30 := '0';    
                                          BREADY_IS7_xhdl11_xhdl31 := '0';    
                                          BREADY_IS8_xhdl12_xhdl32 := '0';    
                                          BREADY_IS9_xhdl13_xhdl33 := '0';    
                                          BREADY_IS10_xhdl14_xhdl34 := '0';    
                                          BREADY_IS1_xhdl5_xhdl25 := '0';    
                                          BREADY_IS12_xhdl16_xhdl36 := '0';    
                                          BREADY_IS13_xhdl17_xhdl37 := '0';    
                                          BREADY_IS14_xhdl18_xhdl38 := '0';    
                                          BREADY_IS15_xhdl19_xhdl39 := '0';    
                                          BREADY_IS16_xhdl20_xhdl40 := '0';    
                                       ELSE
                                          IF ((BID_SI12(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = UID_WIDTH 
                                          AND BVALID_SI12 = '1') AND SC_12 = 
                                          0) THEN
                                             BID_IM_int_xhdl21 := BID_SI12;    
                                             BRESP_IM_int_xhdl22 := BRESP_SI12; 
                                             BVALID_IM_int_xhdl23 := 
                                             BVALID_SI12;    
                                             BREADY_IS12_xhdl16_xhdl36 := 
                                             BREADY_MI;    
                                             BREADY_IS0_xhdl4_xhdl24 := '0';    
                                             BREADY_IS2_xhdl6_xhdl26 := '0';    
                                             BREADY_IS3_xhdl7_xhdl27 := '0';    
                                             BREADY_IS4_xhdl8_xhdl28 := '0';    
                                             BREADY_IS5_xhdl9_xhdl29 := '0';    
                                             BREADY_IS6_xhdl10_xhdl30 := '0';   
                                             BREADY_IS7_xhdl11_xhdl31 := '0';   
                                             BREADY_IS8_xhdl12_xhdl32 := '0';   
                                             BREADY_IS9_xhdl13_xhdl33 := '0';   
                                             BREADY_IS10_xhdl14_xhdl34 := '0';  
                                             BREADY_IS11_xhdl15_xhdl35 := '0';  
                                             BREADY_IS1_xhdl5_xhdl25 := '0';    
                                             BREADY_IS13_xhdl17_xhdl37 := '0';  
                                             BREADY_IS14_xhdl18_xhdl38 := '0';  
                                             BREADY_IS15_xhdl19_xhdl39 := '0';  
                                             BREADY_IS16_xhdl20_xhdl40 := '0';  
                                          ELSE
                                             IF ((BID_SI13(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = 
                                             UID_WIDTH AND BVALID_SI13 = '1') 
                                             AND SC_13 = 0) THEN
                                                BID_IM_int_xhdl21 := BID_SI13;  
                                                BRESP_IM_int_xhdl22 := 
                                                BRESP_SI13;    
                                                BVALID_IM_int_xhdl23 := 
                                                BVALID_SI13;    
                                                BREADY_IS13_xhdl17_xhdl37 := 
                                                BREADY_MI;    
                                                BREADY_IS0_xhdl4_xhdl24 := '0'; 
                                                BREADY_IS2_xhdl6_xhdl26 := '0'; 
                                                BREADY_IS3_xhdl7_xhdl27 := '0'; 
                                                BREADY_IS4_xhdl8_xhdl28 := '0'; 
                                                BREADY_IS5_xhdl9_xhdl29 := '0'; 
                                                BREADY_IS6_xhdl10_xhdl30 := 
                                                '0';    
                                                BREADY_IS7_xhdl11_xhdl31 := 
                                                '0';    
                                                BREADY_IS8_xhdl12_xhdl32 := 
                                                '0';    
                                                BREADY_IS9_xhdl13_xhdl33 := 
                                                '0';    
                                                BREADY_IS10_xhdl14_xhdl34 := 
                                                '0';    
                                                BREADY_IS11_xhdl15_xhdl35 := 
                                                '0';    
                                                BREADY_IS12_xhdl16_xhdl36 := 
                                                '0';    
                                                BREADY_IS1_xhdl5_xhdl25 := '0'; 
                                                BREADY_IS14_xhdl18_xhdl38 := 
                                                '0';    
                                                BREADY_IS15_xhdl19_xhdl39 := 
                                                '0';    
                                                BREADY_IS16_xhdl20_xhdl40 := 
                                                '0';    
                                             ELSE
                                                IF ((BID_SI14(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) = 
                                                UID_WIDTH AND BVALID_SI14 = '1')
                                                AND SC_14 = 0) THEN
                                                   BID_IM_int_xhdl21 := 
                                                   BID_SI14;    
                                                   BRESP_IM_int_xhdl22 := 
                                                   BRESP_SI14;    
                                                   BVALID_IM_int_xhdl23 := 
                                                   BVALID_SI14;    
                                                   BREADY_IS14_xhdl18_xhdl38 := 
                                                   BREADY_MI;    
                                                   BREADY_IS0_xhdl4_xhdl24 := 
                                                   '0';    
                                                   BREADY_IS2_xhdl6_xhdl26 := 
                                                   '0';    
                                                   BREADY_IS3_xhdl7_xhdl27 := 
                                                   '0';    
                                                   BREADY_IS4_xhdl8_xhdl28 := 
                                                   '0';    
                                                   BREADY_IS5_xhdl9_xhdl29 := 
                                                   '0';    
                                                   BREADY_IS6_xhdl10_xhdl30 := 
                                                   '0';    
                                                   BREADY_IS7_xhdl11_xhdl31 := 
                                                   '0';    
                                                   BREADY_IS8_xhdl12_xhdl32 := 
                                                   '0';    
                                                   BREADY_IS9_xhdl13_xhdl33 := 
                                                   '0';    
                                                   BREADY_IS10_xhdl14_xhdl34 := 
                                                   '0';    
                                                   BREADY_IS11_xhdl15_xhdl35 := 
                                                   '0';    
                                                   BREADY_IS12_xhdl16_xhdl36 := 
                                                   '0';    
                                                   BREADY_IS13_xhdl17_xhdl37 := 
                                                   '0';    
                                                   BREADY_IS1_xhdl5_xhdl25 := 
                                                   '0';    
                                                   BREADY_IS15_xhdl19_xhdl39 := 
                                                   '0';    
                                                   BREADY_IS16_xhdl20_xhdl40 := 
                                                   '0';    
                                                ELSE
                                                   IF ((BID_SI15(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) 
                                                   = UID_WIDTH AND BVALID_SI15 
                                                   = '1') AND SC_15 = 0) 
                                                   THEN
                                                      BID_IM_int_xhdl21 := 
                                                      BID_SI15;    
                                                      BRESP_IM_int_xhdl22 := 
                                                      BRESP_SI15;    
                                                      BVALID_IM_int_xhdl23 := 
                                                      BVALID_SI15;    
                                                      BREADY_IS15_xhdl19_xhdl39 
                                                      := BREADY_MI;    
                                                      BREADY_IS0_xhdl4_xhdl24 
                                                      := '0';    
                                                      BREADY_IS2_xhdl6_xhdl26 
                                                      := '0';    
                                                      BREADY_IS3_xhdl7_xhdl27 
                                                      := '0';    
                                                      BREADY_IS4_xhdl8_xhdl28 
                                                      := '0';    
                                                      BREADY_IS5_xhdl9_xhdl29 
                                                      := '0';    
                                                      BREADY_IS6_xhdl10_xhdl30 
                                                      := '0';    
                                                      BREADY_IS7_xhdl11_xhdl31 
                                                      := '0';    
                                                      BREADY_IS8_xhdl12_xhdl32 
                                                      := '0';    
                                                      BREADY_IS9_xhdl13_xhdl33 
                                                      := '0';    
                                                      BREADY_IS10_xhdl14_xhdl34 
                                                      := '0';    
                                                      BREADY_IS11_xhdl15_xhdl35 
                                                      := '0';    
                                                      BREADY_IS12_xhdl16_xhdl36 
                                                      := '0';    
                                                      BREADY_IS13_xhdl17_xhdl37 
                                                      := '0';    
                                                      BREADY_IS14_xhdl18_xhdl38 
                                                      := '0';    
                                                      BREADY_IS1_xhdl5_xhdl25 
                                                      := '0';    
                                                      BREADY_IS16_xhdl20_xhdl40 
                                                      := '0';    
                                                   ELSE
                                                      IF 
                                                      (BID_SI16(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH - 2) 
                                                      = UID_WIDTH AND 
                                                      BVALID_SI16 = '1') THEN
                                                         BID_IM_int_xhdl21 := 
                                                         BID_SI16;    
                                                         BRESP_IM_int_xhdl22 := 
                                                         BRESP_SI16;    
                                                         BVALID_IM_int_xhdl23 
                                                         := BVALID_SI16;    
                                                         BREADY_IS16_xhdl20_xhdl40 
                                                         := BREADY_MI;    
                                                         BREADY_IS0_xhdl4_xhdl24 
                                                         := '0';    
                                                         BREADY_IS2_xhdl6_xhdl26 
                                                         := '0';    
                                                         BREADY_IS3_xhdl7_xhdl27 
                                                         := '0';    
                                                         BREADY_IS4_xhdl8_xhdl28 
                                                         := '0';    
                                                         BREADY_IS5_xhdl9_xhdl29 
                                                         := '0';    
                                                         BREADY_IS6_xhdl10_xhdl30 
                                                         := '0';    
                                                         BREADY_IS7_xhdl11_xhdl31 
                                                         := '0';    
                                                         BREADY_IS8_xhdl12_xhdl32 
                                                         := '0';    
                                                         BREADY_IS9_xhdl13_xhdl33 
                                                         := '0';    
                                                         BREADY_IS10_xhdl14_xhdl34 
                                                         := '0';    
                                                         BREADY_IS11_xhdl15_xhdl35 
                                                         := '0';    
                                                         BREADY_IS12_xhdl16_xhdl36 
                                                         := '0';    
                                                         BREADY_IS13_xhdl17_xhdl37 
                                                         := '0';    
                                                         BREADY_IS14_xhdl18_xhdl38 
                                                         := '0';    
                                                         BREADY_IS15_xhdl19_xhdl39 
                                                         := '0';    
                                                         BREADY_IS1_xhdl5_xhdl25 
                                                         := '0';    
                                                      ELSE
                                                         BID_IM_int_xhdl21 := 
                                                         (OTHERS => '0');    
                                                         BRESP_IM_int_xhdl22 := 
                                                         (OTHERS => '0');        
                                                         BVALID_IM_int_xhdl23 
                                                         := '0';    
                                                         BREADY_IS0_xhdl4_xhdl24 
                                                         := '0';    
                                                         BREADY_IS1_xhdl5_xhdl25 
                                                         := '0';    
                                                         BREADY_IS2_xhdl6_xhdl26 
                                                         := '0';    
                                                         BREADY_IS3_xhdl7_xhdl27 
                                                         := '0';    
                                                         BREADY_IS4_xhdl8_xhdl28 
                                                         := '0';    
                                                         BREADY_IS5_xhdl9_xhdl29 
                                                         := '0';    
                                                         BREADY_IS6_xhdl10_xhdl30 
                                                         := '0';    
                                                         BREADY_IS7_xhdl11_xhdl31 
                                                         := '0';    
                                                         BREADY_IS8_xhdl12_xhdl32 
                                                         := '0';    
                                                         BREADY_IS9_xhdl13_xhdl33 
                                                         := '0';    
                                                         BREADY_IS10_xhdl14_xhdl34 
                                                         := '0';    
                                                         BREADY_IS11_xhdl15_xhdl35 
                                                         := '0';    
                                                         BREADY_IS12_xhdl16_xhdl36 
                                                         := '0';    
                                                         BREADY_IS13_xhdl17_xhdl37 
                                                         := '0';    
                                                         BREADY_IS14_xhdl18_xhdl38 
                                                         := '0';    
                                                         BREADY_IS15_xhdl19_xhdl39 
                                                         := '0';    
                                                         BREADY_IS16_xhdl20_xhdl40 
                                                         := '0';    
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
      BID_IM_int <= BID_IM_int_xhdl21;
      BRESP_IM_int <= BRESP_IM_int_xhdl22;
      BVALID_IM_int <= BVALID_IM_int_xhdl23;
      BREADY_IS0_xhdl4 <= BREADY_IS0_xhdl4_xhdl24;
      BREADY_IS1_xhdl5 <= BREADY_IS1_xhdl5_xhdl25;
      BREADY_IS2_xhdl6 <= BREADY_IS2_xhdl6_xhdl26;
      BREADY_IS3_xhdl7 <= BREADY_IS3_xhdl7_xhdl27;
      BREADY_IS4_xhdl8 <= BREADY_IS4_xhdl8_xhdl28;
      BREADY_IS5_xhdl9 <= BREADY_IS5_xhdl9_xhdl29;
      BREADY_IS6_xhdl10 <= BREADY_IS6_xhdl10_xhdl30;
      BREADY_IS7_xhdl11 <= BREADY_IS7_xhdl11_xhdl31;
      BREADY_IS8_xhdl12 <= BREADY_IS8_xhdl12_xhdl32;
      BREADY_IS9_xhdl13 <= BREADY_IS9_xhdl13_xhdl33;
      BREADY_IS10_xhdl14 <= BREADY_IS10_xhdl14_xhdl34;
      BREADY_IS11_xhdl15 <= BREADY_IS11_xhdl15_xhdl35;
      BREADY_IS12_xhdl16 <= BREADY_IS12_xhdl16_xhdl36;
      BREADY_IS13_xhdl17 <= BREADY_IS13_xhdl17_xhdl37;
      BREADY_IS14_xhdl18 <= BREADY_IS14_xhdl18_xhdl38;
      BREADY_IS15_xhdl19 <= BREADY_IS15_xhdl19_xhdl39;
      BREADY_IS16_xhdl20 <= BREADY_IS16_xhdl20_xhdl40;
   END PROCESS;

END ARCHITECTURE translated;
