-- ****************************************************************************/
-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description: CoreAXI - slave stage 
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



ENTITY axi_RA_ARBITER IS
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
END ENTITY axi_RA_ARBITER;

ARCHITECTURE translated OF axi_RA_ARBITER IS


   --------------------------------------------------------------------------
   CONSTANT  MASTERS               :  integer := 4;    
   CONSTANT  MASTER_0              :  std_logic_vector(4 DOWNTO 0) := "10001";  
   CONSTANT  MASTER_1              :  std_logic_vector(4 DOWNTO 0) := "10010";  
   CONSTANT  MASTER_2              :  std_logic_vector(4 DOWNTO 0) := "10100";  
   CONSTANT  MASTER_3              :  std_logic_vector(4 DOWNTO 0) := "11000";  
   CONSTANT  SLAVE_IDLE            :  std_logic_vector(3 DOWNTO 0) := "0000";   
   CONSTANT  RDID                  :  std_logic_vector(3 DOWNTO 0) := "0001";   
   CONSTANT  M0RD                  :  std_logic_vector(3 DOWNTO 0) := "0010";   
   CONSTANT  M1RD                  :  std_logic_vector(3 DOWNTO 0) := "0011";   
   CONSTANT  M2RD                  :  std_logic_vector(3 DOWNTO 0) := "0100";   
   CONSTANT  M3RD                  :  std_logic_vector(3 DOWNTO 0) := "0101";   
   CONSTANT  M0RWAIT               :  std_logic_vector(3 DOWNTO 0) := "0110";   
   CONSTANT  M1RWAIT               :  std_logic_vector(3 DOWNTO 0) := "0111";   
   CONSTANT  M2RWAIT               :  std_logic_vector(3 DOWNTO 0) := "1000";   
   CONSTANT  M3RWAIT               :  std_logic_vector(3 DOWNTO 0) := "1001";   
   CONSTANT  M0LOCKED              :  std_logic_vector(3 DOWNTO 0) := "1010";   
   CONSTANT  M1LOCKED              :  std_logic_vector(3 DOWNTO 0) := "1011";   
   CONSTANT  M2LOCKED              :  std_logic_vector(3 DOWNTO 0) := "1100";   
   CONSTANT  M3LOCKED              :  std_logic_vector(3 DOWNTO 0) := "1101";   
   --------------------------------------------------------------------------
   -- Internal signals
   --------------------------------------------------------------------------
   SIGNAL m0_lock_clear_read       :  std_logic;   
   SIGNAL m1_lock_clear_read       :  std_logic;   
   SIGNAL m2_lock_clear_read       :  std_logic;   
   SIGNAL m3_lock_clear_read       :  std_logic;   
   SIGNAL rd_curr_state            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL rd_next_state            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL rd_select_v              :  std_logic;   
   SIGNAL rd_owner                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL m0_req_inprog            :  std_logic;   
   SIGNAL m1_req_inprog            :  std_logic;   
   SIGNAL m2_req_inprog            :  std_logic;   
   SIGNAL m3_req_inprog            :  std_logic;   
   SIGNAL AR_MASGNT_MI_xhdl1       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AR_MASGNT_MI_int_xhdl1       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL areset_n                 :  std_logic;   
   SIGNAL sresetn                  :  std_logic;   

BEGIN

   --///////////////////////////////////////////////////////////////////////////
   --                               Start - of - Code                         //
   --///////////////////////////////////////////////////////////////////////////

   areset_n  <= '1' WHEN (SYNC_RESET = 1) ELSE ARESETN;
   sresetn   <= ARESETN WHEN (SYNC_RESET = 1) ELSE '1';

   AR_MASGNT_MI <= AR_MASGNT_MI_xhdl1;

   --------------------------------------------------------------------------
   -- Assign the Master which is granted access in the round-robin algorithm
   -- This output is used to pass the selected masters signals to the
   -- interconnect
   --------------------------------------------------------------------------
   L1: IF (INP_REG_BUF = 1 AND OUT_REG_BUF = 1) GENERATE 
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         AR_MASGNT_MI_xhdl1 <= "0001";    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         AR_MASGNT_MI_xhdl1 <= "0001";    
      ELSE 
         IF (rd_select_v = '1') THEN
            AR_MASGNT_MI_xhdl1 <= (OTHERS => '0');    
         ELSE
            AR_MASGNT_MI_xhdl1 <= rd_owner;    
         END IF;
      END IF;
      END IF;
   END PROCESS;
   END GENERATE L1;

   L2: IF (INP_REG_BUF = 0 AND OUT_REG_BUF = 0) GENERATE 

   PROCESS (rd_owner) 
   BEGIN
      AR_MASGNT_MI_xhdl1 <= rd_owner;    
   END PROCESS;
   -- v3.1
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         AR_MASGNT_MI_int_xhdl1 <= "0001";    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         AR_MASGNT_MI_int_xhdl1 <= "0001";    
      ELSE 
         AR_MASGNT_MI_int_xhdl1 <= rd_owner;    
      END IF;
      END IF;
   END PROCESS;
   END GENERATE L2;

   --------------------------------------------------------------------------
   -- Read state machine
   --------------------------------------------------------------------------
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         rd_curr_state <= SLAVE_IDLE;    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         rd_curr_state <= SLAVE_IDLE;
      ELSE 
         rd_curr_state <= rd_next_state;    
      END IF;
      END IF;
   END PROCESS;

   PROCESS (m0_lock_clear_read, AR_REQ_MI0, 
   AR_REQ_MI1, m0_rd_end, AR_REQ_MI2, AR_REQ_MI3, m1_lock_clear_read,  
   rd_next_state, m1_rd_end, rd_curr_state,  
   ARLOCK_M0, ARLOCK_M1, ARLOCK_M2, ARLOCK_M3, m2_rd_end,  
   AR_MASGNT_MI_xhdl1,AR_MASGNT_MI_int_xhdl1, m2_lock_clear_read, m3_rd_end,  
   rd_owner, m3_lock_clear_read)
      VARIABLE rd_select_v_xhdl2  : std_logic;
      VARIABLE rd_owner_xhdl3  : std_logic_vector(3 DOWNTO 0);
      VARIABLE rd_next_state_xhdl4  : std_logic_vector(3 DOWNTO 0);
   BEGIN
      rd_select_v_xhdl2 := '0';    
      rd_owner_xhdl3 := "0001";    
      rd_next_state_xhdl4 := rd_curr_state;    
      CASE rd_curr_state IS
         WHEN SLAVE_IDLE =>
                  rd_select_v_xhdl2 := '0';    
                  rd_owner_xhdl3 := (OTHERS => '0');    
                  IF (AR_REQ_MI0 = '1' AND ARLOCK_M0 = "10") THEN
                     rd_next_state_xhdl4 := M0LOCKED;    
                  ELSE
                     IF (AR_REQ_MI0 = '1') THEN
                        rd_next_state_xhdl4 := M0RD;    
                     ELSE
                        IF (AR_REQ_MI1 = '1' AND ARLOCK_M1 = "10") THEN
                           rd_next_state_xhdl4 := M1LOCKED;    
                        ELSE
                           IF (AR_REQ_MI1 = '1') THEN
                              rd_next_state_xhdl4 := M1RD;    
                           ELSE
                              IF (AR_REQ_MI2 = '1' AND ARLOCK_M2 = "10") THEN
                                 rd_next_state_xhdl4 := M2LOCKED;    
                              ELSE
                                 IF (AR_REQ_MI2 = '1') THEN
                                    rd_next_state_xhdl4 := M2RD;    
                                 ELSE
                                    IF (AR_REQ_MI3 = '1' AND ARLOCK_M3 = "10") 
                                    THEN
                                       rd_next_state_xhdl4 := M3LOCKED;    
                                    ELSE
                                       IF (AR_REQ_MI3 = '1') THEN
                                          rd_next_state_xhdl4 := M3RD;    
                                       ELSE
                                          rd_next_state_xhdl4 := RDID;    
                                       END IF;
                                    END IF;
                                 END IF;
                              END IF;
                           END IF;
                        END IF;
                     END IF;
                  END IF;
         WHEN RDID =>
                  rd_select_v_xhdl2 := '0';    
                  --rd_owner_xhdl3 := AR_MASGNT_MI_xhdl1;     
		  IF ((INP_REG_BUF = 0 AND OUT_REG_BUF = 0)) THEN -- v3.1
                     rd_owner_xhdl3 := AR_MASGNT_MI_int_xhdl1;    
	          ELSE
                     rd_owner_xhdl3 := AR_MASGNT_MI_xhdl1;    
	          END IF;


                  
                  IF (AR_REQ_MI0 = '1' AND ARLOCK_M0 = "10") THEN
                     rd_next_state_xhdl4 := M0LOCKED;    
                  ELSE
                     IF (AR_REQ_MI0 = '1') THEN
                        rd_next_state_xhdl4 := M0RD;    
                     ELSE
                        IF (AR_REQ_MI1 = '1' AND ARLOCK_M1 = "10") THEN
                           rd_next_state_xhdl4 := M1LOCKED;    
                        ELSE
                           IF (AR_REQ_MI1 = '1') THEN
                              rd_next_state_xhdl4 := M1RD;    
                           ELSE
                              IF (AR_REQ_MI2 = '1' AND ARLOCK_M2 = "10") THEN
                                 rd_next_state_xhdl4 := M2LOCKED;    
                              ELSE
                                 IF (AR_REQ_MI2 = '1') THEN
                                    rd_next_state_xhdl4 := M2RD;    
                                 ELSE
                                    IF (AR_REQ_MI3 = '1' AND ARLOCK_M3 = "10") 
                                    THEN
                                       rd_next_state_xhdl4 := M3LOCKED;    
                                    ELSE
                                       IF (AR_REQ_MI3 = '1') THEN
                                          rd_next_state_xhdl4 := M3RD;    
                                       ELSE
                                          rd_next_state_xhdl4 := SLAVE_IDLE;    
                                       END IF;
                                    END IF;
                                 END IF;
                              END IF;
                           END IF;
                        END IF;
                     END IF;
                  END IF;
         WHEN M0RD =>
                  rd_select_v_xhdl2 := '0';    
                  rd_owner_xhdl3 := "0001";    
                  IF (m0_rd_end = '1') THEN
                     rd_select_v_xhdl2 := '1';    
                     IF (AR_REQ_MI0 = '1' AND ARLOCK_M0 = "10") THEN
                        rd_select_v_xhdl2 := '0';    
                        rd_next_state_xhdl4 := M0LOCKED;    
                     ELSIF (AR_REQ_MI0 = '1') THEN
                        rd_next_state_xhdl4 := M0RD;    
                        rd_select_v_xhdl2 := '0';    
                     ELSIF (AR_REQ_MI1 = '1' AND ARLOCK_M1 = "10") THEN
                        rd_next_state_xhdl4 := M1LOCKED;    
                     ELSIF (AR_REQ_MI1 = '1') THEN
                        rd_next_state_xhdl4 := M1RD;    
                     ELSE
                        rd_next_state_xhdl4 := M0RWAIT;    
                     END IF;
                  END IF;
         WHEN M0RWAIT =>
                  rd_select_v_xhdl2 := '0';    

                  rd_owner_xhdl3 := (OTHERS => '0');    
                  IF (AR_REQ_MI2 = '1' AND ARLOCK_M2 = "10") THEN
                     rd_next_state_xhdl4 := M2LOCKED;    
                  ELSE
                     IF (AR_REQ_MI2 = '1') THEN
                        rd_next_state_xhdl4 := M2RD;    
                     ELSE
                        IF (AR_REQ_MI3 = '1' AND ARLOCK_M3 = "10") THEN
                           rd_next_state_xhdl4 := M3LOCKED;    
                        ELSE
                           IF (AR_REQ_MI3 = '1') THEN
                              rd_next_state_xhdl4 := M3RD;    
                           ELSE
                              rd_next_state_xhdl4 := RDID;    
                           END IF;
                        END IF;
                     END IF;
                  END IF;
         WHEN M1RD =>
                  rd_select_v_xhdl2 := '0';    
                  rd_owner_xhdl3 := "0010";    
                  IF (m1_rd_end = '1') THEN
                     rd_select_v_xhdl2 := '1';    
                     IF (AR_REQ_MI1 = '1' AND ARLOCK_M1 = "10") THEN
                        rd_select_v_xhdl2 := '0';    
                        rd_next_state_xhdl4 := M1LOCKED;    
                     ELSIF (AR_REQ_MI1 = '1') THEN
                        rd_select_v_xhdl2 := '0';    
                        rd_next_state_xhdl4 := M1RD;    
                     ELSIF (AR_REQ_MI2 = '1' AND ARLOCK_M2 = "10") THEN
                        rd_next_state_xhdl4 := M2LOCKED;    
                     ELSIF (AR_REQ_MI2 = '1') THEN
                        rd_next_state_xhdl4 := M2RD;    
                     ELSE
                        rd_next_state_xhdl4 := M1RWAIT;    
                     END IF;
                  END IF;
         WHEN M1RWAIT =>
                  rd_select_v_xhdl2 := '0';    

                  rd_owner_xhdl3 := (OTHERS => '0');    
                  IF (AR_REQ_MI3 = '1' AND ARLOCK_M3 = "10") THEN
                     rd_next_state_xhdl4 := M3LOCKED;    
                  ELSE
                     IF (AR_REQ_MI3 = '1') THEN
                        rd_next_state_xhdl4 := M3RD;    
                     ELSE
                        rd_next_state_xhdl4 := RDID;    
                     END IF;
                  END IF;
         WHEN M2RD =>
                  rd_select_v_xhdl2 := '0';    
                  rd_owner_xhdl3 := "0100";    
                  IF (m2_rd_end = '1') THEN
                     rd_select_v_xhdl2 := '1';    
                     IF (AR_REQ_MI2 = '1' AND ARLOCK_M2 = "10") THEN
                        rd_next_state_xhdl4 := M2LOCKED;    
                        rd_select_v_xhdl2 := '0';    
                     ELSIF (AR_REQ_MI2 = '1') THEN
                        rd_next_state_xhdl4 := M2RD;    
                        rd_select_v_xhdl2 := '0';    
                     ELSIF (AR_REQ_MI3 = '1' AND ARLOCK_M3 = "10") THEN
                        rd_next_state_xhdl4 := M3LOCKED;    
                     ELSIF (AR_REQ_MI3 = '1') THEN
                        rd_next_state_xhdl4 := M3RD;    
                     ELSE
                        rd_next_state_xhdl4 := M2RWAIT;    
                     END IF;
                  END IF;
         WHEN M2RWAIT =>
                  rd_select_v_xhdl2 := '0';    
                  rd_owner_xhdl3 := (OTHERS => '0');    
                  rd_next_state_xhdl4 := RDID;    
         WHEN M3RD =>
                  rd_select_v_xhdl2 := '0';    
                  rd_owner_xhdl3 := "1000";    
                  IF (m3_rd_end = '1') THEN
                     rd_next_state_xhdl4 := M3RWAIT;    
                     IF (AR_REQ_MI3 = '1' AND ARLOCK_M3 = "10") THEN
                        rd_next_state_xhdl4 := M3LOCKED;    
                     ELSIF (AR_REQ_MI3 = '1') THEN
                        rd_next_state_xhdl4 := M3RD;    
                     END IF;
                  END IF;
         WHEN M3RWAIT =>
                  rd_select_v_xhdl2 := '0';    
                  rd_owner_xhdl3 := (OTHERS => '0');    
                  rd_next_state_xhdl4 := RDID;    
         WHEN M0LOCKED =>
                  rd_select_v_xhdl2 := '0';    
                  rd_owner_xhdl3 := "0001";    
                  IF (m0_rd_end = '1' AND m0_lock_clear_read = '1') THEN
                     rd_select_v_xhdl2 := '1';    
                     IF (AR_REQ_MI1 = '1' AND ARLOCK_M1 = "10") THEN
                        rd_next_state_xhdl4 := M1LOCKED;    
                     ELSE
                        IF (AR_REQ_MI1 = '1') THEN
                           rd_next_state_xhdl4 := M1RD;    
                        ELSE
                           IF (AR_REQ_MI2 = '1' AND ARLOCK_M1 = "10") THEN
                              rd_next_state_xhdl4 := M2LOCKED;    
                           ELSE
                              IF (AR_REQ_MI2 = '1') THEN
                                 rd_next_state_xhdl4 := M2RD;    
                              ELSE
                                 IF (AR_REQ_MI3 = '1' AND ARLOCK_M3 = "10") 
                                 THEN
                                    rd_next_state_xhdl4 := M3LOCKED;    
                                 ELSE
                                    IF (AR_REQ_MI3 = '1') THEN
                                       rd_next_state_xhdl4 := M3RD;    
                                    ELSE
                                       IF (AR_REQ_MI0 = '1' AND ARLOCK_M0 = 
                                       "10") THEN
                                          rd_next_state_xhdl4 := M0LOCKED;    
                                       ELSE
                                          IF (AR_REQ_MI0 = '1') THEN
                                             rd_next_state_xhdl4 := M0RD;    
                                          ELSE
                                             rd_next_state_xhdl4 := RDID;    
                                          END IF;
                                       END IF;
                                    END IF;
                                 END IF;
                              END IF;
                           END IF;
                        END IF;
                     END IF;
                  END IF;
         WHEN M1LOCKED =>
                  rd_select_v_xhdl2 := '0';    
                  rd_owner_xhdl3 := "0010";    
                  IF (m1_rd_end = '1' AND m1_lock_clear_read = '1') THEN
                     rd_select_v_xhdl2 := '1';    
                     IF (AR_REQ_MI2 = '1' AND ARLOCK_M2 = "10") THEN
                        rd_next_state_xhdl4 := M2LOCKED;    
                     ELSE
                        IF (AR_REQ_MI2 = '1') THEN
                           rd_next_state_xhdl4 := M2RD;    
                        ELSE
                           IF (AR_REQ_MI3 = '1' AND ARLOCK_M3 = "10") THEN
                              rd_next_state_xhdl4 := M3LOCKED;    
                           ELSE
                              IF (AR_REQ_MI3 = '1') THEN
                                 rd_next_state_xhdl4 := M3RD;    
                              ELSE
                                 IF (AR_REQ_MI0 = '1' AND ARLOCK_M0 = "10") 
                                 THEN
                                    rd_next_state_xhdl4 := M0LOCKED;    
                                 ELSE
                                    IF (AR_REQ_MI0 = '1') THEN
                                       rd_next_state_xhdl4 := M0RD;    
                                    ELSE
                                       IF (AR_REQ_MI1 = '1' AND ARLOCK_M1 = 
                                       "10") THEN
                                          rd_next_state_xhdl4 := M1LOCKED;    
                                       ELSE
                                          IF (AR_REQ_MI1 = '1') THEN
                                             rd_next_state_xhdl4 := M1RD;    
                                          ELSE
                                             rd_next_state_xhdl4 := RDID;    
                                          END IF;
                                       END IF;
                                    END IF;
                                 END IF;
                              END IF;
                           END IF;
                        END IF;
                     END IF;
                  END IF;
         WHEN M2LOCKED =>
                  rd_select_v_xhdl2 := '0';    
                  rd_owner_xhdl3 := "0100";    
                  IF (m2_rd_end = '1' AND m2_lock_clear_read = '1') THEN
                     rd_select_v_xhdl2 := '1';    
                     IF (AR_REQ_MI3 = '1' AND ARLOCK_M3 = "10") THEN
                        rd_next_state_xhdl4 := M3LOCKED;    
                     ELSE
                        IF (AR_REQ_MI3 = '1') THEN
                           rd_next_state_xhdl4 := M3RD;    
                        ELSE
                           IF (AR_REQ_MI0 = '1' AND ARLOCK_M0 = "10") THEN
                              rd_next_state_xhdl4 := M0LOCKED;    
                           ELSE
                              IF (AR_REQ_MI0 = '1') THEN
                                 rd_next_state_xhdl4 := M0RD;    
                              ELSE
                                 IF (AR_REQ_MI1 = '1' AND ARLOCK_M1 = "10") 
                                 THEN
                                    rd_next_state_xhdl4 := M1LOCKED;    
                                 ELSE
                                    IF (AR_REQ_MI1 = '1') THEN
                                       rd_next_state_xhdl4 := M1RD;    
                                    ELSE
                                       IF (AR_REQ_MI2 = '1' AND ARLOCK_M1 = 
                                       "10") THEN
                                          rd_next_state_xhdl4 := M2LOCKED;    
                                       ELSE
                                          IF (AR_REQ_MI2 = '1') THEN
                                             rd_next_state_xhdl4 := M2RD;    
                                          ELSE
                                             rd_next_state_xhdl4 := RDID;    
                                          END IF;
                                       END IF;
                                    END IF;
                                 END IF;
                              END IF;
                           END IF;
                        END IF;
                     END IF;
                  END IF;
         WHEN M3LOCKED =>
                  rd_select_v_xhdl2 := '0';    
                  rd_owner_xhdl3 := "1000";    
                  IF (m3_rd_end = '1' AND m3_lock_clear_read = '1') THEN
                     rd_select_v_xhdl2 := '1';    
                     IF (AR_REQ_MI0 = '1' AND ARLOCK_M0 = "10") THEN
                        rd_next_state_xhdl4 := M0LOCKED;    
                     ELSE
                        IF (AR_REQ_MI0 = '1') THEN
                           rd_next_state_xhdl4 := M0RD;    
                        ELSE
                           IF (AR_REQ_MI1 = '1' AND ARLOCK_M1 = "10") THEN
                              rd_next_state_xhdl4 := M1LOCKED;    
                           ELSE
                              IF (AR_REQ_MI1 = '1') THEN
                                 rd_next_state_xhdl4 := M1RD;    
                              ELSE
                                 IF (AR_REQ_MI2 = '1' AND ARLOCK_M1 = "10") 
                                 THEN
                                    rd_next_state_xhdl4 := M2LOCKED;    
                                 ELSE
                                    IF (AR_REQ_MI2 = '1') THEN
                                       rd_next_state_xhdl4 := M2RD;    
                                    ELSE
                                       IF (AR_REQ_MI3 = '1' AND ARLOCK_M3 = 
                                       "10") THEN
                                          rd_next_state_xhdl4 := M3LOCKED;    
                                       ELSE
                                          IF (AR_REQ_MI3 = '1') THEN
                                             rd_next_state_xhdl4 := M3RD;    
                                          ELSE
                                             rd_next_state_xhdl4 := RDID;    
                                          END IF;
                                       END IF;
                                    END IF;
                                 END IF;
                              END IF;
                           END IF;
                        END IF;
                     END IF;
                  END IF;
         WHEN OTHERS  =>
                  rd_select_v_xhdl2 := '0';    
                  rd_owner_xhdl3 := "0001";    
                  rd_next_state_xhdl4 := SLAVE_IDLE;    
         
      END CASE;
      rd_select_v <= rd_select_v_xhdl2;
      rd_owner <= rd_owner_xhdl3;
      rd_next_state <= rd_next_state_xhdl4;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         m0_req_inprog <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         m0_req_inprog <= '0'; 
      ELSE 
         IF (m0_rd_end = '1') THEN
            m0_req_inprog <= '0';    
         ELSE
            IF (AR_REQ_MI0 = '1') THEN
               m0_req_inprog <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         m1_req_inprog <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         m1_req_inprog <= '0';
      ELSE 
         IF (m1_rd_end = '1') THEN
            m1_req_inprog <= '0';    
         ELSE
            IF (AR_REQ_MI1 = '1') THEN
               m1_req_inprog <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         m2_req_inprog <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         m2_req_inprog <= '0';
      ELSE 
         IF (m2_rd_end = '1') THEN
            m2_req_inprog <= '0';    
         ELSE
            IF (AR_REQ_MI2 = '1') THEN
               m2_req_inprog <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         m3_req_inprog <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         m3_req_inprog <= '0';     
      ELSE 
         IF (m3_rd_end = '1') THEN
            m3_req_inprog <= '0';    
         ELSE
            IF (AR_REQ_MI3 = '1') THEN
               m3_req_inprog <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         m3_lock_clear_read <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         m3_lock_clear_read <= '0'; 
      ELSE 
          IF (AR_REQ_MI3 = '1' AND ARLOCK_MI3 = "10") THEN
            m3_lock_clear_read <= '0';    
          ELSE
            IF (AR_REQ_MI3 = '1' AND ARLOCK_MI3 = "00") THEN
               m3_lock_clear_read <= '1';    
            END IF;
          END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         m2_lock_clear_read <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         m2_lock_clear_read <= '0'; 
      ELSE 
         IF (AR_REQ_MI2 = '1' AND ARLOCK_MI2 = "10") THEN
            m2_lock_clear_read <= '0';    
         ELSE
            IF (AR_REQ_MI2 = '1' AND ARLOCK_MI2 = "00") THEN
               m2_lock_clear_read <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         m1_lock_clear_read <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         m1_lock_clear_read <= '0';
      ELSE 
         IF (AR_REQ_MI1 = '1' AND ARLOCK_MI1 = "10") THEN
            m1_lock_clear_read <= '0';    
         ELSE
            IF (AR_REQ_MI1 = '1' AND ARLOCK_MI1 = "00") THEN
               m1_lock_clear_read <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         m0_lock_clear_read <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         m0_lock_clear_read <= '0';    
      ELSE 
         IF (AR_REQ_MI0 = '1' AND ARLOCK_MI0 = "10") THEN
            m0_lock_clear_read <= '0';    
         ELSE
            IF (AR_REQ_MI0 = '1' AND ARLOCK_MI0 = "00") THEN
               m0_lock_clear_read <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

END ARCHITECTURE translated;
