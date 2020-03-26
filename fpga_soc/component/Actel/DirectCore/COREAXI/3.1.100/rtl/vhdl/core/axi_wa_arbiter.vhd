-- ****************************************************************************/
-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description: wa_arbiter.v
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


ENTITY axi_WA_ARBITER IS
   GENERIC (
      --------------------------------------------------------------------------
      -- Parameter Declaration
      --------------------------------------------------------------------------
      SYNC_RESET                     :  integer := 0;    
      AXI_AWIDTH                     :  integer := 32;    
      AXI_DWIDTH                     :  integer := 64;    
      INP_REG_BUF                    :  integer := 1;    
      OUT_REG_BUF                    :  integer := 1;    
      AXI_STRBWIDTH                  :  integer := 8;    
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
END ENTITY axi_WA_ARBITER;

ARCHITECTURE translated OF axi_WA_ARBITER IS


   CONSTANT  MASTERS               :  integer := 4;    
   CONSTANT  MASTER_0              :  std_logic_vector(4 DOWNTO 0) := "10001";  
   CONSTANT  MASTER_1              :  std_logic_vector(4 DOWNTO 0) := "10010";  
   CONSTANT  MASTER_2              :  std_logic_vector(4 DOWNTO 0) := "10100";  
   CONSTANT  MASTER_3              :  std_logic_vector(4 DOWNTO 0) := "11000";  
   CONSTANT  SLAVE_IDLE            :  std_logic_vector(3 DOWNTO 0) := "0000";   
   CONSTANT  WRID                  :  std_logic_vector(3 DOWNTO 0) := "0001";   
   CONSTANT  M0WR                  :  std_logic_vector(3 DOWNTO 0) := "0010";   
   CONSTANT  M1WR                  :  std_logic_vector(3 DOWNTO 0) := "0011";   
   CONSTANT  M2WR                  :  std_logic_vector(3 DOWNTO 0) := "0100";   
   CONSTANT  M3WR                  :  std_logic_vector(3 DOWNTO 0) := "0101";   
   CONSTANT  M0WAIT                :  std_logic_vector(3 DOWNTO 0) := "0110";   
   CONSTANT  M1WAIT                :  std_logic_vector(3 DOWNTO 0) := "0111";   
   CONSTANT  M2WAIT                :  std_logic_vector(3 DOWNTO 0) := "1000";   
   CONSTANT  M3WAIT                :  std_logic_vector(3 DOWNTO 0) := "1001";   
   CONSTANT  M0LOCKED              :  std_logic_vector(3 DOWNTO 0) := "1010";   
   CONSTANT  M1LOCKED              :  std_logic_vector(3 DOWNTO 0) := "1011";   
   CONSTANT  M2LOCKED              :  std_logic_vector(3 DOWNTO 0) := "1100";   
   CONSTANT  M3LOCKED              :  std_logic_vector(3 DOWNTO 0) := "1101";   
   --------------------------------------------------------------------------
   -- Internal signals
   --------------------------------------------------------------------------
   SIGNAL m0_lock_clear_write      :  std_logic;   
   SIGNAL m1_lock_clear_write      :  std_logic;   
   SIGNAL m2_lock_clear_write      :  std_logic;   
   SIGNAL m3_lock_clear_write      :  std_logic;   
   SIGNAL wr_curr_state            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL wr_next_state            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL wr_select_v              :  std_logic;   
   SIGNAL wr_owner                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL m0_req_inprog            :  std_logic;   
   SIGNAL m1_req_inprog            :  std_logic;   
   SIGNAL m2_req_inprog            :  std_logic;   
   SIGNAL m3_req_inprog            :  std_logic;   
   SIGNAL wrid_flag                :  std_logic;   
   SIGNAL AW_REQ_MI                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AW_MASGNT_MI_xhdl1       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL areset_n                 :  std_logic;   
   SIGNAL sresetn                  :  std_logic;   

BEGIN
   --///////////////////////////////////////////////////////////////////////////
   --                               Start - of - Code                         //
   --///////////////////////////////////////////////////////////////////////////

   areset_n  <= '1' WHEN (SYNC_RESET = 1) ELSE ARESETN;
   sresetn   <= ARESETN WHEN (SYNC_RESET = 1) ELSE '1';

   AW_MASGNT_MI <= AW_MASGNT_MI_xhdl1;
   AW_REQ_MI <= AW_REQ_MI3 & AW_REQ_MI2 & AW_REQ_MI1 & AW_REQ_MI0 ;

   --------------------------------------------------------------------------
   -- Assign the Master which is granted access in the round-robin algorithm
   -- This output is used to pass the selected masters signals to the
   -- interconnect
   --------------------------------------------------------------------------
   L1: IF (INP_REG_BUF = 1 AND OUT_REG_BUF = 1) GENERATE
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         AW_MASGNT_MI_xhdl1 <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         AW_MASGNT_MI_xhdl1 <= (OTHERS => '0');
      ELSE 
         AW_MASGNT_MI_xhdl1 <= wr_owner;    
      END IF;
      END IF;
   END PROCESS;
   END GENERATE L1;

   L2: IF (INP_REG_BUF = 0 AND OUT_REG_BUF = 0) GENERATE
   PROCESS (wr_owner)
   BEGIN
      AW_MASGNT_MI_xhdl1 <= wr_owner;    
   END PROCESS;
   END GENERATE L2;

   --------------------------------------------------------------------------
   -- Write state machine
   --------------------------------------------------------------------------
   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         wr_curr_state <= SLAVE_IDLE;    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         wr_curr_state <= SLAVE_IDLE;
      ELSE 
         wr_curr_state <= wr_next_state;    
      END IF;
      END IF;
   END PROCESS;

   PROCESS (AW_REQ_MI1, AW_REQ_MI2, wr_next_state, AW_REQ_MI3, AWLOCK_M0, 
   AWLOCK_M1, wr_curr_state, AWLOCK_M2, AWLOCK_M3, 
   m1_lock_clear_write, m0_wr_end,  
   m0_lock_clear_write, AW_REQ_MI, m1_wr_end, m2_wr_end,  
   m3_lock_clear_write, m3_wr_end,  
   wr_owner, AW_MASGNT_MI_xhdl1, m2_lock_clear_write, 
   AW_REQ_MI0)
      VARIABLE wr_select_v_xhdl2  : std_logic;
      VARIABLE wr_owner_xhdl3  : std_logic_vector(3 DOWNTO 0);
      VARIABLE wr_next_state_xhdl4  : std_logic_vector(3 DOWNTO 0);
   BEGIN
      wr_select_v_xhdl2 := '0';    
      wr_owner_xhdl3 := "0001";    
      wr_next_state_xhdl4 := wr_curr_state;    
      CASE wr_curr_state IS
         WHEN SLAVE_IDLE =>
                  wr_select_v_xhdl2 := '0';  

                  --wr_owner_xhdl3 := AW_MASGNT_MI_xhdl1;    
		  -- v3.1
		  IF (INP_REG_BUF = 1 AND OUT_REG_BUF = 1) THEN
                     wr_owner_xhdl3 := AW_MASGNT_MI_xhdl1;    
		  ELSE 
                     wr_owner_xhdl3 := "0000";    
		  END IF;

                  IF (AW_REQ_MI0 = '1' AND AWLOCK_M0 = "10") THEN
                     wr_next_state_xhdl4 := M0LOCKED;    
                  ELSE
                     IF (AW_REQ_MI0 = '1') THEN
                        wr_next_state_xhdl4 := M0WR;    
                     ELSE
                        IF (AW_REQ_MI1 = '1' AND AWLOCK_M1 = "10") THEN
                           wr_next_state_xhdl4 := M1LOCKED;    
                        ELSE
                           IF (AW_REQ_MI1 = '1') THEN
                              wr_next_state_xhdl4 := M1WR;    
                           ELSE
                              IF (AW_REQ_MI2 = '1' AND AWLOCK_M2 = "10") THEN
                                 wr_next_state_xhdl4 := M2LOCKED;    
                              ELSE
                                 IF (AW_REQ_MI2 = '1') THEN
                                    wr_next_state_xhdl4 := M2WR;    
                                 ELSE
                                    IF (AW_REQ_MI3 = '1' AND AWLOCK_M3 = "10") 
                                    THEN
                                       wr_next_state_xhdl4 := M3LOCKED;    
                                    ELSE
                                       IF (AW_REQ_MI3 = '1') THEN
                                          wr_next_state_xhdl4 := M3WR;    
                                       ELSE
                                          wr_next_state_xhdl4 := WRID;    
                                       END IF;
                                    END IF;
                                 END IF;
                              END IF;
                           END IF;
                        END IF;
                     END IF;
                  END IF;
         WHEN WRID =>
                  wr_select_v_xhdl2 := '1';    

                  wr_owner_xhdl3 := (OTHERS => '0');
                  
                  IF (AW_REQ_MI0 = '1' AND AWLOCK_M0 = "10") THEN
                     wr_next_state_xhdl4 := M0LOCKED;    
                  ELSE
                     IF (AW_REQ_MI0 = '1') THEN
                        wr_next_state_xhdl4 := M0WR;    
                     ELSE
                        IF (AW_REQ_MI1 = '1' AND AWLOCK_M1 = "10") THEN
                           wr_next_state_xhdl4 := M1LOCKED;    
                        ELSE
                           IF (AW_REQ_MI1 = '1') THEN
                              wr_next_state_xhdl4 := M1WR;    
                           ELSE
                              IF (AW_REQ_MI2 = '1' AND AWLOCK_M2 = "10") THEN
                                 wr_next_state_xhdl4 := M2LOCKED;    
                              ELSE
                                 IF (AW_REQ_MI2 = '1') THEN
                                    wr_next_state_xhdl4 := M2WR;    
                                 ELSE
                                    IF (AW_REQ_MI3 = '1' AND AWLOCK_M3 = "10") 
                                    THEN
                                       wr_next_state_xhdl4 := M3LOCKED;    
                                    ELSE
                                       IF (AW_REQ_MI3 = '1') THEN
                                          wr_next_state_xhdl4 := M3WR;    
                                       END IF;
                                    END IF;
                                 END IF;
                              END IF;
                           END IF;
                        END IF;
                     END IF;
                  END IF;
         WHEN M0WR =>
                  wr_select_v_xhdl2 := '1';    
                  wr_owner_xhdl3 := "0001";    
                  IF (m0_wr_end = '1') THEN
                     IF (AW_REQ_MI1 = '1' AND AWLOCK_M1 = "10") THEN
                        wr_next_state_xhdl4 := M1LOCKED;    
                     ELSE
                        IF (AW_REQ_MI1 = '1') THEN
                           wr_next_state_xhdl4 := M1WR;    
                        ELSE
                           wr_next_state_xhdl4 := M0WAIT;    
                        END IF;
                     END IF;
                  END IF;
         WHEN M0WAIT =>
                  wr_select_v_xhdl2 := '1';    

                  wr_owner_xhdl3 := (OTHERS => '0');
                  IF (AW_REQ_MI2 = '1' AND AWLOCK_M2 = "10") THEN
                     wr_next_state_xhdl4 := M2LOCKED;    
                  ELSE
                     IF (AW_REQ_MI2 = '1') THEN
                        wr_next_state_xhdl4 := M2WR;    
                     ELSE
                        IF (AW_REQ_MI3 = '1' AND AWLOCK_M3 = "10") THEN
                           wr_next_state_xhdl4 := M3LOCKED;    
                        ELSE
                           IF (AW_REQ_MI3 = '1') THEN
                              wr_next_state_xhdl4 := M3WR;    
                           ELSE
                              wr_next_state_xhdl4 := WRID;    
                           END IF;
                        END IF;
                     END IF;
                  END IF;
         WHEN M1WR =>
                  wr_select_v_xhdl2 := '1';    
                  wr_owner_xhdl3 := "0010";    
                  IF (m1_wr_end = '1') THEN
                     IF (AW_REQ_MI2 = '1' AND AWLOCK_M2 = "10") THEN
                        wr_next_state_xhdl4 := M2LOCKED;    
                     ELSE
                        IF (AW_REQ_MI2 = '1') THEN
                           wr_next_state_xhdl4 := M2WR;    
                        ELSE
                           wr_next_state_xhdl4 := M1WAIT;    
                        END IF;
                     END IF;
                  END IF;
         WHEN M1WAIT =>
                  wr_select_v_xhdl2 := '1';    

                  wr_owner_xhdl3 := (OTHERS => '0');
                  IF (AW_REQ_MI3 = '1' AND AWLOCK_M3 = "10") THEN
                     wr_next_state_xhdl4 := M3LOCKED;    
                  ELSE
                     IF (AW_REQ_MI3 = '1') THEN
                        wr_next_state_xhdl4 := M3WR;    
                     ELSE
                        wr_next_state_xhdl4 := WRID;    
                     END IF;
                  END IF;
         WHEN M2WR =>
                  wr_select_v_xhdl2 := '1';    
                  wr_owner_xhdl3 := "0100";    
                  IF (m2_wr_end = '1') THEN
                     IF (AW_REQ_MI3 = '1' AND AWLOCK_M3 = "10") THEN
                        wr_next_state_xhdl4 := M3LOCKED;    
                     ELSE
                        IF (AW_REQ_MI3 = '1') THEN
                           wr_next_state_xhdl4 := M3WR;    
                        ELSE
                           wr_next_state_xhdl4 := M2WAIT;    
                        END IF;
                     END IF;
                  END IF;
         WHEN M2WAIT =>
                  wr_select_v_xhdl2 := '1';    

                  wr_owner_xhdl3 := (OTHERS => '0');
                  wr_next_state_xhdl4 := WRID;    
         WHEN M3WR =>
                  wr_select_v_xhdl2 := '1';    
                  wr_owner_xhdl3 := "1000";    
                  IF (m3_wr_end = '1') THEN
                     wr_next_state_xhdl4 := WRID;    
                  END IF;
         WHEN M0LOCKED =>
                  wr_select_v_xhdl2 := '1';    
                  wr_owner_xhdl3 := "0001";    
                  IF (m0_wr_end = '1' AND m0_lock_clear_write = '1') THEN
                     IF (AW_REQ_MI1 = '1' AND AWLOCK_M1 = "10") THEN
                        wr_next_state_xhdl4 := M1LOCKED;    
                     ELSE
                        IF (AW_REQ_MI1 = '1') THEN
                           wr_next_state_xhdl4 := M1WR;    
                        ELSE
                           IF (AW_REQ_MI2 = '1' AND AWLOCK_M2 = "10") THEN
                              wr_next_state_xhdl4 := M2LOCKED;    
                           ELSE
                              IF (AW_REQ_MI2 = '1') THEN
                                 wr_next_state_xhdl4 := M2WR;    
                              ELSE
                                 IF (AW_REQ_MI3 = '1' AND AWLOCK_M3 = "10") 
                                 THEN
                                    wr_next_state_xhdl4 := M3LOCKED;    
                                 ELSE
                                    IF (AW_REQ_MI3 = '1') THEN
                                       wr_next_state_xhdl4 := M3WR;    
                                    ELSE
                                       IF (AW_REQ_MI0 = '1' AND AWLOCK_M0 = 
                                       "10") THEN
                                          wr_next_state_xhdl4 := M0LOCKED;    
                                       ELSE
                                          IF (AW_REQ_MI0 = '1') THEN
                                             wr_next_state_xhdl4 := M0WR;    
                                          ELSE
                                             wr_next_state_xhdl4 := WRID;    
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
                  wr_select_v_xhdl2 := '1';    
                  wr_owner_xhdl3 := "0010";    
                  IF (m1_wr_end = '1' AND m1_lock_clear_write = '1') THEN
                     IF (AW_REQ_MI2 = '1' AND AWLOCK_M2 = "10") THEN
                        wr_next_state_xhdl4 := M2LOCKED;    
                     ELSE
                        IF (AW_REQ_MI2 = '1') THEN
                           wr_next_state_xhdl4 := M2WR;    
                        ELSE
                           IF (AW_REQ_MI3 = '1' AND AWLOCK_M3 = "10") THEN
                              wr_next_state_xhdl4 := M3LOCKED;    
                           ELSE
                              IF (AW_REQ_MI3 = '1') THEN
                                 wr_next_state_xhdl4 := M3WR;    
                              ELSE
                                 IF (AW_REQ_MI0 = '1' AND AWLOCK_M0 = "10") 
                                 THEN
                                    wr_next_state_xhdl4 := M0LOCKED;    
                                 ELSE
                                    IF (AW_REQ_MI0 = '1') THEN
                                       wr_next_state_xhdl4 := M0WR;    
                                    ELSE
                                       IF (AW_REQ_MI1 = '1' AND AWLOCK_M1 = 
                                       "10") THEN
                                          wr_next_state_xhdl4 := M1LOCKED;    
                                       ELSE
                                          IF (AW_REQ_MI1 = '1') THEN
                                             wr_next_state_xhdl4 := M1WR;    
                                          ELSE
                                             wr_next_state_xhdl4 := WRID;    
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
                  wr_select_v_xhdl2 := '1';    
                  wr_owner_xhdl3 := "0100";    
                  IF (m2_wr_end = '1' AND m2_lock_clear_write = '1') THEN
                     IF (AW_REQ_MI3 = '1' AND AWLOCK_M3 = "10") THEN
                        wr_next_state_xhdl4 := M3LOCKED;    
                     ELSE
                        IF (AW_REQ_MI3 = '1') THEN
                           wr_next_state_xhdl4 := M3WR;    
                        ELSE
                           IF (AW_REQ_MI0 = '1' AND AWLOCK_M0 = "10") THEN
                              wr_next_state_xhdl4 := M0LOCKED;    
                           ELSE
                              IF (AW_REQ_MI0 = '1') THEN
                                 wr_next_state_xhdl4 := M0WR;    
                              ELSE
                                 IF (AW_REQ_MI1 = '1' AND AWLOCK_M1 = "10") 
                                 THEN
                                    wr_next_state_xhdl4 := M1LOCKED;    
                                 ELSE
                                    IF (AW_REQ_MI1 = '1') THEN
                                       wr_next_state_xhdl4 := M1WR;    
                                    ELSE
                                       IF (AW_REQ_MI2 = '1' AND AWLOCK_M2 = 
                                       "10") THEN
                                          wr_next_state_xhdl4 := M2LOCKED;    
                                       ELSE
                                          IF (AW_REQ_MI2 = '1') THEN
                                             wr_next_state_xhdl4 := M2WR;    
                                          ELSE
                                             wr_next_state_xhdl4 := WRID;    
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
                  wr_select_v_xhdl2 := '1';    
                  wr_owner_xhdl3 := "1000";    
                  IF (m3_wr_end = '1' AND m3_lock_clear_write = '1') THEN
                     IF (AW_REQ_MI0 = '1' AND AWLOCK_M0 = "10") THEN
                        wr_next_state_xhdl4 := M0LOCKED;    
                     ELSE
                        IF (AW_REQ_MI0 = '1') THEN
                           wr_next_state_xhdl4 := M0WR;    
                        ELSE
                           IF (AW_REQ_MI1 = '1' AND AWLOCK_M1 = "10") THEN
                              wr_next_state_xhdl4 := M1LOCKED;    
                           ELSE
                              IF (AW_REQ_MI1 = '1') THEN
                                 wr_next_state_xhdl4 := M1WR;    
                              ELSE
                                 IF (AW_REQ_MI2 = '1' AND AWLOCK_M2 = "10") 
                                 THEN
                                    wr_next_state_xhdl4 := M2LOCKED;    
                                 ELSE
                                    IF (AW_REQ_MI2 = '1') THEN
                                       wr_next_state_xhdl4 := M2WR;    
                                    ELSE
                                       IF (AW_REQ_MI3 = '1' AND AWLOCK_M3 = 
                                       "10") THEN
                                          wr_next_state_xhdl4 := M3LOCKED;    
                                       ELSE
                                          IF (AW_REQ_MI3 = '1') THEN
                                             wr_next_state_xhdl4 := M3WR;    
                                          ELSE
                                             wr_next_state_xhdl4 := WRID;    
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
                  wr_select_v_xhdl2 := '0';    
                  wr_owner_xhdl3 := "0010";    
                  wr_next_state_xhdl4 := SLAVE_IDLE;    
         
      END CASE;
      wr_select_v <= wr_select_v_xhdl2;
      wr_owner <= wr_owner_xhdl3;
      wr_next_state <= wr_next_state_xhdl4;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         m0_req_inprog <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         m0_req_inprog <= '0';
      ELSE 
         IF (m0_wr_end = '1') THEN
            m0_req_inprog <= '0';    
         ELSE
            IF (AW_REQ_MI0 = '1') THEN
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
         IF (m1_wr_end = '1') THEN
            m1_req_inprog <= '0';    
         ELSE
            IF (AW_REQ_MI1 = '1') THEN
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
         IF (m2_wr_end = '1') THEN
            m2_req_inprog <= '0';    
         ELSE
            IF (AW_REQ_MI2 = '1') THEN
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
         IF (m3_wr_end = '1') THEN
            m3_req_inprog <= '0';    
         ELSE
            IF (AW_REQ_MI3 = '1') THEN
               m3_req_inprog <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         m3_lock_clear_write <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         m3_lock_clear_write <= '0';
      ELSE 
         IF (AW_REQ_MI3 = '1' AND AWLOCK_MI3 = "10") THEN
            m3_lock_clear_write <= '0';    
         ELSE
            IF (AW_REQ_MI3 = '1' AND AWLOCK_MI3 = "00") THEN
               m3_lock_clear_write <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         m2_lock_clear_write <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         m2_lock_clear_write <= '0';
      ELSE 
         IF (AW_REQ_MI2 = '1' AND AWLOCK_MI2 = "10") THEN
            m2_lock_clear_write <= '0';    
         ELSE
            IF (AW_REQ_MI2 = '1' AND AWLOCK_MI2 = "00") THEN
               m2_lock_clear_write <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         m1_lock_clear_write <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         m1_lock_clear_write <= '0';
      ELSE 
         IF (AW_REQ_MI1 = '1' AND AWLOCK_MI1 = "10") THEN
            m1_lock_clear_write <= '0';    
         ELSE
            IF (AW_REQ_MI1 = '1' AND AWLOCK_MI1 = "00") THEN
               m1_lock_clear_write <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         m0_lock_clear_write <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         m0_lock_clear_write <= '0';    
      ELSE 
         IF (AW_REQ_MI0 = '1' AND AWLOCK_MI0 = "10") THEN
            m0_lock_clear_write <= '0';    
         ELSE
            IF (AW_REQ_MI0 = '1' AND AWLOCK_MI0 = "00") THEN
               m0_lock_clear_write <= '1';    
            END IF;
         END IF;
      END IF;
      END IF;
   END PROCESS;

END ARCHITECTURE translated;
