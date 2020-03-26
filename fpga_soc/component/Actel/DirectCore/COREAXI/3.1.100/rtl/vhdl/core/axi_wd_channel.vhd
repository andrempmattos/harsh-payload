-- ****************************************************************************/
-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description: wd_channel.v
--              
--              
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
   USE ieee.numeric_std.all;
   USE work.XHDL_std_logic.all;
   USE work.XHDL_misc.all; 
   USE work.axi_pkg.all; 

ENTITY axi_wd_channel IS
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
      -- From fwd master waselector

      MST_GNT_NUM             : IN std_logic_vector(3 DOWNTO 0);   
      -- From Master 0
-- AXI write data channel signals

      WID_MI0                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_MI0               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      WSTRB_MI0               : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_MI0               : IN std_logic;   
      WVALID_MI0              : IN std_logic;   
      WREADY_IM0              : OUT std_logic;   
      -- From Master 1
-- AXI write data channel signals

      WID_MI1                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_MI1               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      WSTRB_MI1               : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_MI1               : IN std_logic;   
      WVALID_MI1              : IN std_logic;   
      WREADY_IM1              : OUT std_logic;   
      -- From Master 2
-- AXI write data channel signals

      WID_MI2                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_MI2               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      WSTRB_MI2               : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_MI2               : IN std_logic;   
      WVALID_MI2              : IN std_logic;   
      WREADY_IM2              : OUT std_logic;   
      -- From Master 3
-- AXI write data channel signals

      WID_MI3                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_MI3               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      WSTRB_MI3               : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_MI3               : IN std_logic;   
      WVALID_MI3              : IN std_logic;   
      WREADY_IM3              : OUT std_logic;   
      -- SLAVE 0
-- AXI SLAVE 0 write data channel signals

      WID_IS                  : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_IS                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WVALID_IS               : OUT std_logic;   
      WSTRB_IS                : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_IS                : OUT std_logic;   
      -- SLAVE 0
-- AXI SLAVE 0 write address channel signals

      WREADY_SI               : IN std_logic;   
      SLAVE_NUMBER            : IN std_logic_vector(4 DOWNTO 0);   
      AWADDR_IS_int           : IN std_logic_vector(31 DOWNTO 0));   
END axi_wd_channel;

ARCHITECTURE translated OF axi_wd_channel IS


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
   -- --------------------------------------------------------------------------
   -- Internal signals
   SIGNAL WREADY_IM0_int           :  std_logic;   
   SIGNAL WREADY_IM1_int           :  std_logic;   
   SIGNAL WREADY_IM2_int           :  std_logic;   
   SIGNAL WREADY_IM3_int           :  std_logic;   
   SIGNAL WID_IS_int               :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS_int             :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS_int             :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS_int             :  std_logic;   
   SIGNAL WVALID_IS_int            :  std_logic;   
   SIGNAL MST_GNT_NUM_r            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL WREADY_IM0_xhdl1         :  std_logic;   
   SIGNAL WREADY_IM1_xhdl2         :  std_logic;   
   SIGNAL WREADY_IM2_xhdl3         :  std_logic;   
   SIGNAL WREADY_IM3_xhdl4         :  std_logic;   
   SIGNAL WID_IS_xhdl5             :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS_xhdl6           :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS_xhdl7           :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS_xhdl8           :  std_logic;   
   SIGNAL WVALID_IS_xhdl9          :  std_logic;   
   SIGNAL areset_n                 :  std_logic;   
   SIGNAL sresetn                  :  std_logic;   

BEGIN
   --///////////////////////////////////////////////////////////////////////////
   --                               Start - of - Code                         //
   --///////////////////////////////////////////////////////////////////////////

   areset_n  <= '1' WHEN (SYNC_RESET = 1) ELSE ARESETN;
   sresetn   <= ARESETN WHEN (SYNC_RESET = 1) ELSE '1';
   
   WREADY_IM0 <= WREADY_IM0_xhdl1;
   WREADY_IM1 <= WREADY_IM1_xhdl2;
   WREADY_IM2 <= WREADY_IM2_xhdl3;
   WREADY_IM3 <= WREADY_IM3_xhdl4;
   WID_IS <= WID_IS_xhdl5;
   WDATA_IS <= WDATA_IS_xhdl6;
   WSTRB_IS <= WSTRB_IS_xhdl7;
   WLAST_IS <= WLAST_IS_xhdl8;
   WVALID_IS <= WVALID_IS_xhdl9;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         WDATA_IS_xhdl6 <= (OTHERS => '0');    
         WID_IS_xhdl5 <= (OTHERS => '0');    
         WLAST_IS_xhdl8 <= '0';    
         WSTRB_IS_xhdl7 <= (OTHERS => '0');      
         WVALID_IS_xhdl9 <= '0';    
         WREADY_IM0_xhdl1 <= '0';    
         WREADY_IM1_xhdl2 <= '0';    
         WREADY_IM2_xhdl3 <= '0';    
         WREADY_IM3_xhdl4 <= '0';    
         MST_GNT_NUM_r <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         WDATA_IS_xhdl6 <= (OTHERS => '0');    
         WID_IS_xhdl5 <= (OTHERS => '0');    
         WLAST_IS_xhdl8 <= '0';    
         WSTRB_IS_xhdl7 <= (OTHERS => '0');      
         WVALID_IS_xhdl9 <= '0';    
         WREADY_IM0_xhdl1 <= '0';    
         WREADY_IM1_xhdl2 <= '0';    
         WREADY_IM2_xhdl3 <= '0';    
         WREADY_IM3_xhdl4 <= '0';    
         MST_GNT_NUM_r <= (OTHERS => '0');    
      ELSE 
         MST_GNT_NUM_r <= MST_GNT_NUM;    
         
         WREADY_IM0_xhdl1 <= WREADY_IM0_int;    
         WREADY_IM1_xhdl2 <= WREADY_IM1_int;    
         WREADY_IM2_xhdl3 <= WREADY_IM2_int;    
         WREADY_IM3_xhdl4 <= WREADY_IM3_int;    
         IF (SLAVE_NUMBER = AWADDR_IS_int(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) 
         OR SLAVE_NUMBER(4) = '1') THEN
            WDATA_IS_xhdl6 <= WDATA_IS_int;    
            WID_IS_xhdl5 <= WID_IS_int;    
            WLAST_IS_xhdl8 <= WLAST_IS_int;    
            WSTRB_IS_xhdl7 <= WSTRB_IS_int;    
            WVALID_IS_xhdl9 <= WVALID_IS_int;    
         ELSE
            WDATA_IS_xhdl6 <= (OTHERS => '0');    
            WID_IS_xhdl5 <= (OTHERS => '0');    
            WLAST_IS_xhdl8 <= '0';    
            WSTRB_IS_xhdl7 <= (OTHERS => '0');    
            WVALID_IS_xhdl9 <= '0';    
         END IF;
      END IF;
      END IF;
   END PROCESS;

   L1: IF (NUM_MASTER_SLOT = 1) GENERATE

   PROCESS (WREADY_IM1_int, WLAST_IS_int, WLAST_MI0, WREADY_IM2_int, 
   WREADY_IM3_int, WDATA_MI0,  
   WVALID_MI0, 
   WDATA_IS_int, MST_GNT_NUM, AWADDR_IS_int, WID_MI0, WSTRB_MI0,  
   WID_IS_int,  
   WSTRB_IS_int, WREADY_IM0_int, WVALID_IS_int)
      VARIABLE WID_IS_int_xhdl10  : std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);
      VARIABLE WDATA_IS_int_xhdl11  : std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
      ;
      VARIABLE WSTRB_IS_int_xhdl12  : std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
      0);
      VARIABLE WLAST_IS_int_xhdl13  : std_logic;
      VARIABLE WVALID_IS_int_xhdl14  : std_logic;
   BEGIN
      CASE MST_GNT_NUM IS
         WHEN "0001" =>
                  WID_IS_int_xhdl10 := WID_MI0;    
                  WDATA_IS_int_xhdl11 := WDATA_MI0;    
                  WSTRB_IS_int_xhdl12 := WSTRB_MI0;    
                  WLAST_IS_int_xhdl13 := WLAST_MI0;    
                  WVALID_IS_int_xhdl14 := WVALID_MI0;    
         WHEN OTHERS  =>
                  WID_IS_int_xhdl10 := (OTHERS => '0');    
                  WDATA_IS_int_xhdl11 := (OTHERS => '0');    
                  WSTRB_IS_int_xhdl12 := (OTHERS => '0');        
                  WLAST_IS_int_xhdl13 := '0';    
                  WVALID_IS_int_xhdl14 := '0';    
         
      END CASE;
      -- case (wdata_seq_str[18:17])       
      
      
      WID_IS_int <= WID_IS_int_xhdl10;
      WDATA_IS_int <= WDATA_IS_int_xhdl11;
      WSTRB_IS_int <= WSTRB_IS_int_xhdl12;
      WLAST_IS_int <= WLAST_IS_int_xhdl13;
      WVALID_IS_int <= WVALID_IS_int_xhdl14;
   END PROCESS;

   
   PROCESS (WREADY_SI, MST_GNT_NUM_r)
      VARIABLE WREADY_IM0_int_xhdl15  : std_logic;
   BEGIN
      CASE MST_GNT_NUM_r IS
         WHEN "0001" =>
                  WREADY_IM0_int_xhdl15 := WREADY_SI;    
         WHEN OTHERS  =>
                  WREADY_IM0_int_xhdl15 := '0';    
         
      END CASE;
      -- case (wdata_seq_str[18:17])       
      
      
      WREADY_IM0_int <= WREADY_IM0_int_xhdl15;
   END PROCESS;

   END GENERATE L1;

   L2: IF (NUM_MASTER_SLOT = 2) GENERATE
   
   PROCESS (WID_MI0, WID_MI1, WSTRB_MI0, WSTRB_MI1, WLAST_MI0, WLAST_MI1, 
   MST_GNT_NUM, WDATA_MI0, WDATA_MI1, WVALID_MI0, WVALID_MI1)
      VARIABLE WID_IS_int_xhdl16  : std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);
      VARIABLE WDATA_IS_int_xhdl17  : std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
      ;
      VARIABLE WSTRB_IS_int_xhdl18  : std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
      0);
      VARIABLE WLAST_IS_int_xhdl19  : std_logic;
      VARIABLE WVALID_IS_int_xhdl20  : std_logic;
   BEGIN
      CASE MST_GNT_NUM IS
         WHEN "0001" =>
                  WID_IS_int_xhdl16 := WID_MI0;    
                  WDATA_IS_int_xhdl17 := WDATA_MI0;    
                  WSTRB_IS_int_xhdl18 := WSTRB_MI0;    
                  WLAST_IS_int_xhdl19 := WLAST_MI0;    
                  WVALID_IS_int_xhdl20 := WVALID_MI0;    
         WHEN "0010" =>
                  WID_IS_int_xhdl16 := WID_MI1;    
                  WDATA_IS_int_xhdl17 := WDATA_MI1;    
                  WSTRB_IS_int_xhdl18 := WSTRB_MI1;    
                  WLAST_IS_int_xhdl19 := WLAST_MI1;    
                  WVALID_IS_int_xhdl20 := WVALID_MI1;    
         WHEN OTHERS  =>
                  WID_IS_int_xhdl16 := (OTHERS => '0');    
                  WDATA_IS_int_xhdl17 := (OTHERS => '0');    
                  WSTRB_IS_int_xhdl18 := (OTHERS => '0');    
                  WLAST_IS_int_xhdl19 := '0';    
                  WVALID_IS_int_xhdl20 := '0';    
         
      END CASE;
      -- case (wdata_seq_str[18:17])       
      
      
      WID_IS_int <= WID_IS_int_xhdl16;
      WDATA_IS_int <= WDATA_IS_int_xhdl17;
      WSTRB_IS_int <= WSTRB_IS_int_xhdl18;
      WLAST_IS_int <= WLAST_IS_int_xhdl19;
      WVALID_IS_int <= WVALID_IS_int_xhdl20;
   END PROCESS;

   PROCESS (WREADY_SI, MST_GNT_NUM_r)
      VARIABLE WREADY_IM0_int_xhdl21  : std_logic;
      VARIABLE WREADY_IM1_int_xhdl22  : std_logic;
   BEGIN
      CASE MST_GNT_NUM_r IS
         WHEN "0001" =>
                  WREADY_IM0_int_xhdl21 := WREADY_SI;    
                  WREADY_IM1_int_xhdl22 := '0';    
         WHEN "0010" =>
                  WREADY_IM0_int_xhdl21 := '0';    
                  WREADY_IM1_int_xhdl22 := WREADY_SI;    
         WHEN OTHERS  =>
                  WREADY_IM0_int_xhdl21 := '0';    
                  WREADY_IM1_int_xhdl22 := '0';    
         
      END CASE;
      -- case (wdata_seq_str[18:17])       
      
      
      WREADY_IM0_int <= WREADY_IM0_int_xhdl21;
      WREADY_IM1_int <= WREADY_IM1_int_xhdl22;
   END PROCESS;

   END GENERATE L2;

   L3: IF (NUM_MASTER_SLOT = 3) GENERATE
   
   PROCESS (WVALID_MI2, WID_MI0, WID_MI1, WID_MI2, WSTRB_MI0, WSTRB_MI1, 
   WSTRB_MI2, WLAST_MI0, WLAST_MI1, WLAST_MI2, MST_GNT_NUM, WDATA_MI0, 
   WDATA_MI1, WDATA_MI2, WVALID_MI0, WVALID_MI1)
      VARIABLE WID_IS_int_xhdl23  : std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);
      VARIABLE WDATA_IS_int_xhdl24  : std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
      ;
      VARIABLE WSTRB_IS_int_xhdl25  : std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
      0);
      VARIABLE WLAST_IS_int_xhdl26  : std_logic;
      VARIABLE WVALID_IS_int_xhdl27  : std_logic;
   BEGIN
      CASE MST_GNT_NUM IS
         WHEN "0001" =>
                  WID_IS_int_xhdl23 := WID_MI0;    
                  WDATA_IS_int_xhdl24 := WDATA_MI0;    
                  WSTRB_IS_int_xhdl25 := WSTRB_MI0;    
                  WLAST_IS_int_xhdl26 := WLAST_MI0;    
                  WVALID_IS_int_xhdl27 := WVALID_MI0;    
         WHEN "0010" =>
                  WID_IS_int_xhdl23 := WID_MI1;    
                  WDATA_IS_int_xhdl24 := WDATA_MI1;    
                  WSTRB_IS_int_xhdl25 := WSTRB_MI1;    
                  WLAST_IS_int_xhdl26 := WLAST_MI1;    
                  WVALID_IS_int_xhdl27 := WVALID_MI1;    
         WHEN "0100" =>
                  WID_IS_int_xhdl23 := WID_MI2;    
                  WDATA_IS_int_xhdl24 := WDATA_MI2;    
                  WSTRB_IS_int_xhdl25 := WSTRB_MI2;    
                  WLAST_IS_int_xhdl26 := WLAST_MI2;    
                  WVALID_IS_int_xhdl27 := WVALID_MI2;    
         WHEN OTHERS  =>
                  WID_IS_int_xhdl23 := (OTHERS => '0');    
                  WDATA_IS_int_xhdl24 := (OTHERS => '0');    
                  WSTRB_IS_int_xhdl25 := (OTHERS => '0');    
                  WLAST_IS_int_xhdl26 := '0';    
                  WVALID_IS_int_xhdl27 := '0';    
         
      END CASE;
      -- case (wdata_seq_str[18:17])       
      
      WID_IS_int <= WID_IS_int_xhdl23;
      WDATA_IS_int <= WDATA_IS_int_xhdl24;
      WSTRB_IS_int <= WSTRB_IS_int_xhdl25;
      WLAST_IS_int <= WLAST_IS_int_xhdl26;
      WVALID_IS_int <= WVALID_IS_int_xhdl27;
   END PROCESS;

   
   PROCESS (WREADY_SI, MST_GNT_NUM_r)
      VARIABLE WREADY_IM0_int_xhdl28  : std_logic;
      VARIABLE WREADY_IM1_int_xhdl29  : std_logic;
      VARIABLE WREADY_IM2_int_xhdl30  : std_logic;
   BEGIN
      CASE MST_GNT_NUM_r IS
         WHEN "0001" =>
                  WREADY_IM0_int_xhdl28 := WREADY_SI;    
                  WREADY_IM1_int_xhdl29 := '0';    
                  WREADY_IM2_int_xhdl30 := '0';    
         WHEN "0010" =>
                  WREADY_IM0_int_xhdl28 := '0';    
                  WREADY_IM1_int_xhdl29 := WREADY_SI;    
                  WREADY_IM2_int_xhdl30 := '0';    
         WHEN "0100" =>
                  WREADY_IM0_int_xhdl28 := '0';    
                  WREADY_IM1_int_xhdl29 := '0';    
                  WREADY_IM2_int_xhdl30 := WREADY_SI;    
         WHEN OTHERS  =>
                  WREADY_IM0_int_xhdl28 := '0';    
                  WREADY_IM1_int_xhdl29 := '0';    
                  WREADY_IM2_int_xhdl30 := '0';    
         
      END CASE;
      -- case (wdata_seq_str[18:17])       
      
      
      WREADY_IM0_int <= WREADY_IM0_int_xhdl28;
      WREADY_IM1_int <= WREADY_IM1_int_xhdl29;
      WREADY_IM2_int <= WREADY_IM2_int_xhdl30;
   END PROCESS;

   END GENERATE L3;

   L4: IF (NUM_MASTER_SLOT = 4) GENERATE
   
   PROCESS (WID_MI0, WID_MI1, WID_MI2, WID_MI3, WSTRB_MI0, WSTRB_MI1, WSTRB_MI2,
   WSTRB_MI3, WLAST_MI0, WLAST_MI1, WLAST_MI2, WLAST_MI3, WDATA_MI0, WDATA_MI1, 
   WDATA_MI2, WVALID_MI0, WDATA_MI3, WVALID_MI1, WVALID_MI2, WVALID_MI3, 
   MST_GNT_NUM)
      VARIABLE WID_IS_int_xhdl31  : std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);
      VARIABLE WDATA_IS_int_xhdl32  : std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
      ;
      VARIABLE WSTRB_IS_int_xhdl33  : std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
      0);
      VARIABLE WLAST_IS_int_xhdl34  : std_logic;
      VARIABLE WVALID_IS_int_xhdl35  : std_logic;
   BEGIN
      CASE MST_GNT_NUM IS
         WHEN "0001" =>
                  WID_IS_int_xhdl31 := WID_MI0;    
                  WDATA_IS_int_xhdl32 := WDATA_MI0;    
                  WSTRB_IS_int_xhdl33 := WSTRB_MI0;    
                  WLAST_IS_int_xhdl34 := WLAST_MI0;    
                  WVALID_IS_int_xhdl35 := WVALID_MI0;    
         WHEN "0010" =>
                  WID_IS_int_xhdl31 := WID_MI1;    
                  WDATA_IS_int_xhdl32 := WDATA_MI1;    
                  WSTRB_IS_int_xhdl33 := WSTRB_MI1;    
                  WLAST_IS_int_xhdl34 := WLAST_MI1;    
                  WVALID_IS_int_xhdl35 := WVALID_MI1;    
         WHEN "0100" =>
                  WID_IS_int_xhdl31 := WID_MI2;    
                  WDATA_IS_int_xhdl32 := WDATA_MI2;    
                  WSTRB_IS_int_xhdl33 := WSTRB_MI2;    
                  WLAST_IS_int_xhdl34 := WLAST_MI2;    
                  WVALID_IS_int_xhdl35 := WVALID_MI2;    
         WHEN "1000" =>
                  WID_IS_int_xhdl31 := WID_MI3;    
                  WDATA_IS_int_xhdl32 := WDATA_MI3;    
                  WSTRB_IS_int_xhdl33 := WSTRB_MI3;    
                  WLAST_IS_int_xhdl34 := WLAST_MI3;    
                  WVALID_IS_int_xhdl35 := WVALID_MI3;    
         WHEN OTHERS  =>
                  WID_IS_int_xhdl31 := (OTHERS => '0');    
                  WDATA_IS_int_xhdl32 := (OTHERS => '0');    
                  WSTRB_IS_int_xhdl33 := (OTHERS => '0');    
                  WLAST_IS_int_xhdl34 := '0';    
                  WVALID_IS_int_xhdl35 := '0';    
         
      END CASE;
      -- case (wdata_seq_str[18:17])         
      
      
      WID_IS_int <= WID_IS_int_xhdl31;
      WDATA_IS_int <= WDATA_IS_int_xhdl32;
      WSTRB_IS_int <= WSTRB_IS_int_xhdl33;
      WLAST_IS_int <= WLAST_IS_int_xhdl34;
      WVALID_IS_int <= WVALID_IS_int_xhdl35;
   END PROCESS;

   PROCESS (WREADY_SI, MST_GNT_NUM_r)
      VARIABLE WREADY_IM0_int_xhdl36  : std_logic;
      VARIABLE WREADY_IM1_int_xhdl37  : std_logic;
      VARIABLE WREADY_IM2_int_xhdl38  : std_logic;
      VARIABLE WREADY_IM3_int_xhdl39  : std_logic;
   BEGIN
      CASE MST_GNT_NUM_r IS
         WHEN "0001" =>
                  WREADY_IM0_int_xhdl36 := WREADY_SI;    
                  WREADY_IM1_int_xhdl37 := '0';    
                  WREADY_IM2_int_xhdl38 := '0';    
                  WREADY_IM3_int_xhdl39 := '0';    
         WHEN "0010" =>
                  WREADY_IM1_int_xhdl37 := WREADY_SI;    
                  WREADY_IM0_int_xhdl36 := '0';    
                  WREADY_IM2_int_xhdl38 := '0';    
                  WREADY_IM3_int_xhdl39 := '0';    
         WHEN "0100" =>
                  WREADY_IM2_int_xhdl38 := WREADY_SI;    
                  WREADY_IM0_int_xhdl36 := '0';    
                  WREADY_IM1_int_xhdl37 := '0';    
                  WREADY_IM3_int_xhdl39 := '0';    
         WHEN "1000" =>
                  WREADY_IM3_int_xhdl39 := WREADY_SI;    
                  WREADY_IM1_int_xhdl37 := '0';    
                  WREADY_IM2_int_xhdl38 := '0';    
                  WREADY_IM0_int_xhdl36 := '0';    
         WHEN OTHERS  =>
                  WREADY_IM0_int_xhdl36 := '0';    
                  WREADY_IM1_int_xhdl37 := '0';    
                  WREADY_IM2_int_xhdl38 := '0';    
                  WREADY_IM3_int_xhdl39 := '0';    
         
      END CASE;
      -- case (wdata_seq_str[18:17])         
      
      
      WREADY_IM0_int <= WREADY_IM0_int_xhdl36;
      WREADY_IM1_int <= WREADY_IM1_int_xhdl37;
      WREADY_IM2_int <= WREADY_IM2_int_xhdl38;
      WREADY_IM3_int <= WREADY_IM3_int_xhdl39;
   END PROCESS;
   END GENERATE L4;
END translated;
