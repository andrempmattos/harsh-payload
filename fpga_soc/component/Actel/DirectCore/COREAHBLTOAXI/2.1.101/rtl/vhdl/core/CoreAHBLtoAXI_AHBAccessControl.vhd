-- ********************************************************************/
-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description:	
--
-- Revision Information:
-- Date			Description
-- ----			-----------------------------------------
-- 04AUG10		Production Release Version 1.0
--
-- SVN Revision Information:
-- SVN $Revision: $
-- SVN $Date: $
--
-- Resolved SARs
-- SAR      Date     Who   Description
--
-- Notes: 
--
-- *********************************************************************/
library ieee;
use     ieee.std_logic_1164.all;
use     ieee.std_logic_arith.all;
use     ieee.std_logic_unsigned.all;
use     ieee.std_logic_misc.all;

ENTITY CoreAHBLtoAXI_AHBAccessControlHX IS
   GENERIC (
      -----------------------------------------------------
      -- Global parameters
      -----------------------------------------------------
      AHB_AWIDTH                     :  integer := 32;    
      AHB_DWIDTH                     :  integer := 32;    
      CLOCKS_ASYNC                   :  integer := 1;    
      UNDEF_BURST                    :  integer := 0);    --  if '0' then single transter else INCR16
   PORT (
      -----------------------------------------------------
-- Input-Output Ports
-----------------------------------------------------
-- Inputs on the AHBL interface

      HCLK                    : IN std_logic;   
      HRESETn                 : IN std_logic;   
      HSEL                    : IN std_logic;   
      HADDR                   : IN std_logic_vector(AHB_AWIDTH - 1 DOWNTO 0);   
      HWRITE                  : IN std_logic;   
      HREADY                  : IN std_logic;   
      HTRANS                  : IN std_logic_vector(1 DOWNTO 0);   
      HSIZE                   : IN std_logic_vector(2 DOWNTO 0);   
      HWDATA                  : IN std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0);   
      HBURST                  : IN std_logic_vector(2 DOWNTO 0);   
      HMASTLOCK               : IN std_logic;   
      BVALID_sync             : IN std_logic;   
      BRESP_sync              : IN std_logic_vector(1 DOWNTO 0);   
      wrch_fifo_full          : IN std_logic;   
      rdch_fifo_empty         : IN std_logic;   
      axi_read_rlast_sync     : IN std_logic;   
      RD_DATA                 : IN std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0);   
      -- Outputs on the AHBL Interface

      HREADYOUT               : OUT std_logic;   
      HRESP                   : OUT std_logic_vector(1 DOWNTO 0);   
      HRDATA                  : OUT std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0);  
      hwdata_r                : OUT std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0);  
      wrch_fifo_wr_en_r       : OUT std_logic;   
      rdch_fifo_rd_en_r       : OUT std_logic;   
      ahb_wr_done             : OUT std_logic;   
      ahb_rd_req              : OUT std_logic;   
      latch_ahb_sig           : OUT std_logic;   
      burst_count_r           : OUT std_logic_vector(3 DOWNTO 0);   
      burst_count_valid       : OUT std_logic;   
      HSEL_d                  : OUT std_logic;   
      HADDR_d                 : OUT std_logic_vector(AHB_AWIDTH - 1 DOWNTO 0);  
      HWRITE_d                : OUT std_logic;   
      HREADY_d                : OUT std_logic;   
      HTRANS_d                : OUT std_logic_vector(1 DOWNTO 0);   
      HSIZE_d                 : OUT std_logic_vector(2 DOWNTO 0);   
      HBURST_d                : OUT std_logic_vector(2 DOWNTO 0);   
      HMASTLOCK_d             : OUT std_logic;   
      valid_ahbcmd            : OUT std_logic;   
      ahb_busyidle_cyc        : OUT std_logic);   
END ENTITY CoreAHBLtoAXI_AHBAccessControlHX;

ARCHITECTURE translated OF CoreAHBLtoAXI_AHBAccessControlHX IS


   -- State machine variables
   CONSTANT  IDLE                  :  std_logic_vector(2 DOWNTO 0) := "000";    
   CONSTANT  WR_IN_FIFO            :  std_logic_vector(2 DOWNTO 0) := "001";    
   CONSTANT  WAIT_FOR_RESP         :  std_logic_vector(2 DOWNTO 0) := "010";    
   CONSTANT  RD_FROM_FIFO          :  std_logic_vector(2 DOWNTO 0) := "011";    
   CONSTANT  WR_RESP_ERR           :  std_logic_vector(2 DOWNTO 0) := "100";    
   CONSTANT  WAIT_STATE            :  std_logic_vector(2 DOWNTO 0) := "101";    
   CONSTANT  READ_DONE             :  std_logic_vector(2 DOWNTO 0) := "110";    
   CONSTANT  DUMMY_WAIT            :  std_logic_vector(2 DOWNTO 0) := "111";    
   CONSTANT  WRITE_C               :  std_logic := '1';    --  write constant
   CONSTANT  READ_C                :  std_logic := '0';    --  read constant
   CONSTANT  RESPOK_C              :  std_logic_vector(1 DOWNTO 0) := "00";    --  response OKAY from AXI
   CONSTANT  RESPERR_C             :  std_logic_vector(1 DOWNTO 0) := "01";    --  response ERROR from AXI
   -------------------------------------------------------------------------------
   -- Register Declarations
   -------------------------------------------------------------------------------
   SIGNAL current_state            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL next_state               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL latchahbcmd              :  std_logic;   
   SIGNAL burst_num_r              :  std_logic_vector(4 DOWNTO 0);   
   SIGNAL fifo_wr_en               :  std_logic;   
   SIGNAL fifo_rd_en               :  std_logic;   
   SIGNAL rdch_fifo_rd_en_r_d      :  std_logic;   
   SIGNAL burst_count_load         :  std_logic;   
   SIGNAL wr_resp_reg              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_sync_d            :  std_logic;   
   SIGNAL wait_count               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL count                    :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RD_DATA_d1               :  std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RD_DATA_d2               :  std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL set_idle_cyc             :  std_logic;   
   SIGNAL set_idle_cyc_r           :  std_logic;   
   SIGNAL latchahbcmd_r            :  std_logic;   
   SIGNAL latchahbcmd_undef        :  std_logic;   
   SIGNAL latchahbcmd_undef_r      :  std_logic;   
   SIGNAL latchahbcmd_rd_undef     :  std_logic;   
   SIGNAL latchahbcmd_rd_undef_r   :  std_logic;   
   SIGNAL valid_ahbcmd_undef       :  std_logic;   
   SIGNAL valid_ahbcmd_rd_undef    :  std_logic;   
   SIGNAL valid_ahbcmd_r           :  std_logic;   
   SIGNAL HSEL_undef_d             :  std_logic;   
   SIGNAL HADDR_undef_d            :  std_logic_vector(AHB_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL HWRITE_undef_d           :  std_logic;   
   SIGNAL HREADY_undef_d           :  std_logic;   
   SIGNAL HTRANS_undef_d           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL HSIZE_undef_d            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL HBURST_undef_d           :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL HMASTLOCK_undef_d        :  std_logic;   
   -------------------------------------------------------------------------------
   -- Wire Declarations
   -------------------------------------------------------------------------------
   SIGNAL busy_idle_state          :  std_logic;   
   SIGNAL burst_count              :  std_logic_vector(3 DOWNTO 0);   
   -------------------------------------------------------------------------------
   -- Calculate the burst count value to determine the number of bursts
   -------------------------------------------------------------------------------
   -- convert to INCR16
   SIGNAL temp_xhdl22              :  std_logic;   
   SIGNAL temp_xhdl23              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl24              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl25              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl26              :  std_logic_vector(3 DOWNTO 0);   
   -- convert to SINGLE 
   SIGNAL temp_xhdl27              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl28              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl29              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl30              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL HREADYOUT_xhdl1          :  std_logic;   
   SIGNAL HRESP_xhdl2              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL HRDATA_xhdl3             :  std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL hwdata_r_xhdl4           :  std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL wrch_fifo_wr_en_r_xhdl5  :  std_logic;   
   SIGNAL rdch_fifo_rd_en_r_xhdl6  :  std_logic;   
   SIGNAL ahb_wr_done_xhdl7        :  std_logic;   
   SIGNAL ahb_rd_req_xhdl8         :  std_logic;   
   SIGNAL latch_ahb_sig_xhdl9      :  std_logic;   
   SIGNAL burst_count_r_xhdl10     :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL burst_count_valid_xhdl11 :  std_logic;   
   SIGNAL HSEL_d_xhdl12            :  std_logic;   
   SIGNAL HADDR_d_xhdl13           :  std_logic_vector(AHB_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL HWRITE_d_xhdl14          :  std_logic;   
   SIGNAL HREADY_d_xhdl15          :  std_logic;   
   SIGNAL HTRANS_d_xhdl16          :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL HSIZE_d_xhdl17           :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL HBURST_d_xhdl18          :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL HMASTLOCK_d_xhdl19       :  std_logic;   
   SIGNAL valid_ahbcmd_xhdl20      :  std_logic;   
   SIGNAL ahb_busyidle_cyc_xhdl21  :  std_logic; 

   -------------------------------------------------------------------------------
   -- Functions
   -------------------------------------------------------------------------------
 
   FUNCTION to_stdlogic (
      val      : IN boolean) RETURN std_logic IS
   BEGIN
      IF (val) THEN
         RETURN('1');
      ELSE
         RETURN('0');
      END IF;
   END to_stdlogic;
   
   FUNCTION conv_std_logic (
      val      : IN boolean) RETURN std_logic IS
   BEGIN
      RETURN(to_stdlogic(val));
   END conv_std_logic;


BEGIN
   HREADYOUT <= HREADYOUT_xhdl1;
   HRESP <= HRESP_xhdl2;
   HRDATA <= HRDATA_xhdl3;
   hwdata_r <= hwdata_r_xhdl4;
   wrch_fifo_wr_en_r <= wrch_fifo_wr_en_r_xhdl5;
   rdch_fifo_rd_en_r <= rdch_fifo_rd_en_r_xhdl6;
   ahb_wr_done <= ahb_wr_done_xhdl7;
   ahb_rd_req <= ahb_rd_req_xhdl8;
   latch_ahb_sig <= latch_ahb_sig_xhdl9;
   burst_count_r <= burst_count_r_xhdl10;
   burst_count_valid <= burst_count_valid_xhdl11;
   HSEL_d <= HSEL_d_xhdl12;
   HADDR_d <= HADDR_d_xhdl13;
   HWRITE_d <= HWRITE_d_xhdl14;
   HREADY_d <= HREADY_d_xhdl15;
   HTRANS_d <= HTRANS_d_xhdl16;
   HSIZE_d <= HSIZE_d_xhdl17;
   HBURST_d <= HBURST_d_xhdl18;
   HMASTLOCK_d <= HMASTLOCK_d_xhdl19;
   valid_ahbcmd <= valid_ahbcmd_xhdl20;
   ahb_busyidle_cyc <= ahb_busyidle_cyc_xhdl21;

   --/////////////////////////////////////////////////////////////////////////////
   --                       Start-of-Code                                       //
   --/////////////////////////////////////////////////////////////////////////////
   -------------------------------------------------------------------------------
   -- Generate the valid ahb command signal
   -------------------------------------------------------------------------------
   valid_ahbcmd_xhdl20 <= (HSEL AND HREADY) AND CONV_STD_LOGIC(HTRANS(1 DOWNTO 
   0) = "10") ;

   -------------------------------------------------------------------------------
   -- Generate the valid ahb command signal for undefined transactions for write
   -------------------------------------------------------------------------------
   valid_ahbcmd_undef <= (HWRITE AND HSEL AND HREADY AND CONV_STD_LOGIC(HTRANS(1 DOWNTO 0) = "11"));  


   -------------------------------------------------------------------------------
   -- Generate the valid ahb command signal for undefined transactions for read
   -------------------------------------------------------------------------------
   valid_ahbcmd_rd_undef <= (NOT(HWRITE) AND HSEL AND HREADY AND CONV_STD_LOGIC(HTRANS(1 DOWNTO 0) = "11"));  


   PROCESS (HCLK, HRESETn)
   BEGIN
      IF (HRESETn = '0') THEN
         valid_ahbcmd_r <= '0';    
         latchahbcmd_r <= '0';    
         latchahbcmd_undef_r <= '0';    
         latchahbcmd_rd_undef_r <= '0';    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         valid_ahbcmd_r <= valid_ahbcmd_xhdl20;    
         latchahbcmd_r <= latchahbcmd;    
         latchahbcmd_undef_r <= latchahbcmd_undef;    
         latchahbcmd_rd_undef_r <= latchahbcmd_rd_undef;    
      END IF;
   END PROCESS;

   -------------------------------------------------------------------------------
   -- This signal is used by the AXI Access control to initiate its state m/c
   -------------------------------------------------------------------------------
   
   register_cntrl_signal : PROCESS (HCLK, HRESETn)
   BEGIN
      IF (HRESETn = '0') THEN
         latch_ahb_sig_xhdl9 <= '0';    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         IF (((valid_ahbcmd_xhdl20 OR valid_ahbcmd_undef OR valid_ahbcmd_rd_undef) AND latchahbcmd) = '1') THEN 
            latch_ahb_sig_xhdl9 <= '1';    
         ELSE
            latch_ahb_sig_xhdl9 <= '0';    
         END IF;
      END IF;
   END PROCESS register_cntrl_signal;

   -- block: register_cntrl_signal
   -------------------------------------------------------------------------------
   -- This register is read by AHB host to get Write response.
   -------------------------------------------------------------------------------
   
   latch_wr_resp : PROCESS (HCLK, HRESETn)
   BEGIN
      IF (HRESETn = '0') THEN
         wr_resp_reg <= "00";    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         IF (BVALID_sync = '1') THEN
            wr_resp_reg <= BRESP_sync(1 DOWNTO 0);    
         END IF;
      END IF;
   END PROCESS latch_wr_resp;

   -------------------------------------------------------------------------------
   -- Count is used to provide necessary wait and HREADYOUT is asserted high
   -- when when count=2'b00 in the READ_FROM_FIFO state
   -------------------------------------------------------------------------------
   
   PROCESS (HCLK, HRESETn)
   BEGIN
      IF (HRESETn = '0') THEN
         count <= "00";    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         IF (current_state = WAIT_STATE) THEN
            count <= "11";    
         ELSE
            IF ((CONV_STD_LOGIC(current_state = RD_FROM_FIFO) AND (NOT 
            busy_idle_state)) = '1') THEN
               count <= count - "01";    
            END IF;
         END IF;
      END IF;
   END PROCESS;

   -- always @ (posedge HCLK or negedge HRESETn)
   
   PROCESS (HCLK, HRESETn)
   BEGIN
      IF (HRESETn = '0') THEN
         burst_count_valid_xhdl11 <= '0';    
         BVALID_sync_d <= '0';    
         set_idle_cyc_r <= '0';    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         burst_count_valid_xhdl11 <= latchahbcmd;    
         BVALID_sync_d <= BVALID_sync;    
         set_idle_cyc_r <= set_idle_cyc;    
      END IF;
   END PROCESS;
   busy_idle_state <= CONV_STD_LOGIC(HTRANS_d_xhdl16(1) = '0') ;
   -------------------------------------------------------------------------------
   -- Generate the HRDATA read data to the AHB interface
   -------------------------------------------------------------------------------
   HRDATA_xhdl3 <= RD_DATA_d1 ;

   PROCESS (HCLK, HRESETn)
   BEGIN
      IF (HRESETn = '0') THEN
         wrch_fifo_wr_en_r_xhdl5 <= '0';    
         rdch_fifo_rd_en_r_xhdl6 <= '0';    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         wrch_fifo_wr_en_r_xhdl5 <= fifo_wr_en;    
         rdch_fifo_rd_en_r_xhdl6 <= fifo_rd_en;    
      END IF;
   END PROCESS;
   
   L0: IF (UNDEF_BURST = 1) GENERATE
      burst_count <= temp_xhdl26 ;
   END GENERATE L0;
   
   --L1: IF (NOT(UNDEF_BURST)) GENERATE
   L1: IF (UNDEF_BURST = 0) GENERATE
      burst_count <= temp_xhdl30 ;
   END GENERATE L1;

   WITH (HBURST(2 DOWNTO 1) ) SELECT
	   temp_xhdl26 <= "1111" WHEN "11",
			  "0111" WHEN "10",
			  "0011" WHEN "01", 
			  temp_xhdl27 WHEN OTHERS;

 

PROCESS (HBURST,temp_xhdl28) 
BEGIN
   IF (HBURST(0) = '1') THEN
      temp_xhdl27 <= "1111";
   ELSE
      temp_xhdl27 <= temp_xhdl28;
   END IF;
END PROCESS;

PROCESS (HWRITE) 
BEGIN	   
     IF (HWRITE = '1') THEN
        temp_xhdl28 <= "0001";
     ELSE 
        temp_xhdl28 <= "0000";
     END IF;
 END PROCESS;

   WITH (HBURST(2 DOWNTO 1)) SELECT
	   temp_xhdl30 <= "1111" WHEN "11",
			  "0111" WHEN "10",
			  "0011" WHEN "01", 
			  temp_xhdl29 WHEN OTHERS;

PROCESS (HWRITE) 
BEGIN	   
     IF (HWRITE = '1') THEN
        temp_xhdl29 <= "0001";
     ELSE 
        temp_xhdl29 <= "0000";
     END IF;
END PROCESS;
   -------------------------------------------------------------------------------
   -- Calculate the burst count
   -- burst_count_r = Burst value sent to the AXI interface
   -- burst_num_r   = Burst value used in AHB Access Control state machine
   --                 It is decremented for every write data written into Write
   --                 channel fifo OR every read data from Read Channel fifo.
   -------------------------------------------------------------------------------
   
   PROCESS (HCLK, HRESETn)
   BEGIN
      IF (HRESETn = '0') THEN
         burst_count_r_xhdl10 <= "0000";    
         burst_num_r <= "00000";    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         IF (latchahbcmd = '1') THEN
            burst_count_r_xhdl10 <= burst_count;    
         END IF;
         IF ((burst_count_load = '1') OR (axi_read_rlast_sync = '1')) THEN
            burst_num_r <= "0" & burst_count + (NOT HWRITE);    
         ELSE 
            IF (((fifo_wr_en AND CONV_STD_LOGIC(current_state = WR_IN_FIFO)) OR 
            (CONV_STD_LOGIC(current_state = DUMMY_WAIT OR current_state = RD_FROM_FIFO) AND (fifo_rd_en))) = 
            '1') THEN
               burst_num_r <= burst_num_r - "00001";    
            END IF;
         END IF;
      END IF;
   END PROCESS;

   -------------------------------------------------------------------------------
   -- wait_count is used is used in DUMMY_WAIT_STATE to generate the read enable
   -- to the Read channel fifo
   -------------------------------------------------------------------------------
   
   PROCESS (HCLK, HRESETn)
      VARIABLE wait_count_xhdl31  : std_logic_vector(1 DOWNTO 0);
   BEGIN
      IF (HRESETn = '0') THEN
         wait_count_xhdl31 := "00";    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         IF (current_state = DUMMY_WAIT) THEN
            wait_count_xhdl31 := wait_count_xhdl31 + "01";    
         ELSE
            wait_count_xhdl31 := "00";    
         END IF;
      END IF;
      wait_count <= wait_count_xhdl31;
   END PROCESS;

   -----------------------------------------------------------------------------//
   --                           STATE MACHINE LOGIC                             //
   -----------------------------------------------------------------------------//
   -------------------------------------------------------------------------------
   -- Sequential block for State Machine
   -------------------------------------------------------------------------------
   
   state_machine_seq_logic : PROCESS (HCLK, HRESETn)
   BEGIN
      IF (HRESETn = '0') THEN
         current_state <= IDLE;    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         current_state <= next_state;    
      END IF;
   END PROCESS state_machine_seq_logic;

   -------------------------------------------------------------------------------
   -- Combinational block for State Machine
   -------------------------------------------------------------------------------
   
   state_machine_combo_logic : PROCESS (wr_resp_reg, BVALID_sync_d, 
   axi_read_rlast_sync, valid_ahbcmd_xhdl20, RD_DATA_d1, 
   count, latchahbcmd_rd_undef, burst_count_load, latchahbcmd, 
   valid_ahbcmd_undef, wait_count, 
   burst_num_r, latchahbcmd_undef, next_state, fifo_rd_en, 
   set_idle_cyc, BVALID_sync, HWRITE, wrch_fifo_full, set_idle_cyc_r, 
   burst_count,  
   current_state, HBURST, valid_ahbcmd_rd_undef,  
   fifo_wr_en, rdch_fifo_empty, HBURST_d_xhdl18, 
   HTRANS  
   )
      VARIABLE next_state_xhdl32  : std_logic_vector(2 DOWNTO 0);
      VARIABLE HREADYOUT_xhdl1_xhdl33  : std_logic;
      VARIABLE latchahbcmd_xhdl34  : std_logic;
      VARIABLE latchahbcmd_undef_xhdl35  : std_logic;
      VARIABLE latchahbcmd_rd_undef_xhdl36  : std_logic;
      VARIABLE burst_count_load_xhdl37  : std_logic;
      VARIABLE fifo_wr_en_xhdl38  : std_logic;
      VARIABLE HRESP_xhdl2_xhdl39  : std_logic_vector(1 DOWNTO 0);
      VARIABLE fifo_rd_en_xhdl40  : std_logic;
      VARIABLE ahb_wr_done_xhdl7_xhdl41  : std_logic;
      VARIABLE ahb_rd_req_xhdl8_xhdl42  : std_logic;
      VARIABLE set_idle_cyc_xhdl43  : std_logic;
   BEGIN
      next_state_xhdl32 := current_state;    
      HREADYOUT_xhdl1_xhdl33 := '0';    
      latchahbcmd_xhdl34 := '0';    
      latchahbcmd_undef_xhdl35 := '0';    
      latchahbcmd_rd_undef_xhdl36 := '0';    
      burst_count_load_xhdl37 := '0';    
      fifo_wr_en_xhdl38 := '0';    
      HRESP_xhdl2_xhdl39 := RESPOK_C;    
      fifo_rd_en_xhdl40 := '0';    
      ahb_wr_done_xhdl7_xhdl41 := '0';    
      ahb_rd_req_xhdl8_xhdl42 := '0';    
      set_idle_cyc_xhdl43 := '0';    
      CASE current_state IS
         ----------------------------------------------------- 
         -- IDLE state
         ----------------------------------------------------- 
         
         WHEN IDLE =>
                  next_state_xhdl32 := current_state;    
                  HREADYOUT_xhdl1_xhdl33 := '1';    --  Ready for AHB transaction
                  IF (valid_ahbcmd_xhdl20 = '1' OR valid_ahbcmd_undef = '1' OR valid_ahbcmd_rd_undef = '1') THEN 
                     latchahbcmd_xhdl34 := '1';    
                     CASE HWRITE IS
                        -- Write Signal Generation
                        
                        WHEN WRITE_C =>
                                 burst_count_load_xhdl37 := '1';    
                                 next_state_xhdl32 := WR_IN_FIFO;    
                        -- Read Signal Generation
                        
                        WHEN READ_C =>
                                 burst_count_load_xhdl37 := '1';    
                                 next_state_xhdl32 := WAIT_STATE;    
                                 ahb_rd_req_xhdl8_xhdl42 := '1';    
                        WHEN OTHERS =>
                                 NULL;
                        
                     END CASE;
                     -- case (HWRITE)
                     
                     
                  END IF;
                  -- if (valid_ahbcmd == 1'b1)
                  
                  
         WHEN WR_IN_FIFO =>
                  IF ((burst_num_r(3 DOWNTO 0) /= "0000") AND NOT((HBURST = "000") OR (HBURST = "001" AND UNDEF_BURST = 0))) THEN
                        IF (wrch_fifo_full = '0') THEN
                           fifo_wr_en_xhdl38 := '1';    
                           HREADYOUT_xhdl1_xhdl33 := '1';
                        ELSE
                           fifo_wr_en_xhdl38 := '0';    
                           HREADYOUT_xhdl1_xhdl33 := '0';    
                        END IF;
                   ELSIF (NOT((HBURST_d_xhdl18 = "000") OR (HBURST_d_xhdl18 = "001" AND UNDEF_BURST = 0))) THEN
                        fifo_wr_en_xhdl38 := '1';    
                        HREADYOUT_xhdl1_xhdl33 := '1';
                        ahb_wr_done_xhdl7_xhdl41 := '1';    
                        next_state_xhdl32 := WAIT_FOR_RESP;    
		   ELSE
                        fifo_wr_en_xhdl38 := '1';    
                        HREADYOUT_xhdl1_xhdl33 := '0';
                        ahb_wr_done_xhdl7_xhdl41 := '1';    
                        next_state_xhdl32 := WAIT_FOR_RESP;    
		   END IF;


         WHEN WAIT_FOR_RESP =>
                  HREADYOUT_xhdl1_xhdl33 := '0';    
                  fifo_wr_en_xhdl38 := '0';    
                  ahb_wr_done_xhdl7_xhdl41 := '0';    
                  -- For Single and Bursts
                  
                  IF (BVALID_sync_d = '1' AND HBURST_d_xhdl18(2 DOWNTO 0) /= 
                  "001") THEN
                     -- Check OK response from AXI
                     
                     IF (wr_resp_reg = RESPOK_C) THEN
                        HRESP_xhdl2_xhdl39 := RESPOK_C;    
                        -- next AHB cycle  
                        
                        IF (valid_ahbcmd_xhdl20 = '1') THEN
                           latchahbcmd_xhdl34 := '1';    
                           CASE HWRITE IS
                              -- Write Signal Generation
                              
                              WHEN WRITE_C =>
                                       burst_count_load_xhdl37 := '1';    
                                       next_state_xhdl32 := WR_IN_FIFO;    
                              -- Read Signal Generation
                              
                              WHEN READ_C =>
                                       burst_count_load_xhdl37 := '1';    
                                       next_state_xhdl32 := WAIT_STATE;    
                                       ahb_rd_req_xhdl8_xhdl42 := '1';    
                              WHEN OTHERS =>
                                       NULL;
                              
                           END CASE;
                           -- case (HWRITE)
                           
                           
                        -- if (valid_ahbcmd == 1'b1)
                        
                        ELSE
                           next_state_xhdl32 := IDLE;    
                        END IF;
                        -- else: !if(valid_ahbcmd == 1'b1)
                        
                        
                     -- if (wr_resp_reg == RESPOK_C)
                     
                     ELSE
                        -- ERROR response from AXI
                        
                        HREADYOUT_xhdl1_xhdl33 := '0';    
                        HRESP_xhdl2_xhdl39 := RESPERR_C;    
                        --next state is Error state
                        
                        next_state_xhdl32 := WR_RESP_ERR;    
                     END IF;
                     -- else: !if(wr_resp_reg == RESPOK_C)
                     
                     
                  END IF;
                  -- if (BVALID_sync_d == 1'b1)
                  -- For undef
                  
                  IF (BVALID_sync = '1' AND HBURST_d_xhdl18(2 DOWNTO 0) = "001")
                  THEN
                     -- Check OK response from AXI
                     
                     IF (wr_resp_reg = RESPOK_C) THEN
                        HRESP_xhdl2_xhdl39 := RESPOK_C;    
                        -- next AHB cycle  
                        
                        IF (valid_ahbcmd_undef = '1') THEN
                           latchahbcmd_undef_xhdl35 := '1';    
                           CASE HWRITE IS
                              -- Write Signal Generation
                              
                              WHEN WRITE_C =>
                                       burst_count_load_xhdl37 := '1';    
                                       next_state_xhdl32 := WR_IN_FIFO;    
                              -- Read Signal Generation
                              
                              WHEN READ_C =>
                                       burst_count_load_xhdl37 := '1';    
                                       next_state_xhdl32 := WAIT_STATE;    
                                       ahb_rd_req_xhdl8_xhdl42 := '1';    
                              WHEN OTHERS =>
                                       NULL;
                              
                           END CASE;
                           -- case (HWRITE)
                           
                           
                        -- if (valid_ahbcmd_undef == 1'b1)
                        
                        ELSE
                           next_state_xhdl32 := IDLE;    
                        END IF;
                        -- else: !if(valid_ahbcmd_undef == 1'b1)
                        
                        
                     -- if (wr_resp_reg == RESPOK_C)
                     
                     ELSE
                        -- ERROR response from AXI
                        
                        HREADYOUT_xhdl1_xhdl33 := '0';    
                        HRESP_xhdl2_xhdl39 := RESPERR_C;    
                        --next state is Error state
                        
                        next_state_xhdl32 := WR_RESP_ERR;    
                     END IF;
                     -- else: !if(wr_resp_reg == RESPOK_C)
                     
                     
                  END IF;
                  -- if (BVALID_sync_d == 1'b1)
                  
                  
         -- case: WAIT_FOR_RESP
         ----------------------------------------------------- 
         -- RECEIVED WRITE ERROR RESPONSE FROM AXI
         ----------------------------------------------------- 
         
         WHEN WR_RESP_ERR =>
                  HREADYOUT_xhdl1_xhdl33 := '1';    
                  HRESP_xhdl2_xhdl39 := RESPERR_C;    
                  -- next AHB cycle  
                  
                  IF (valid_ahbcmd_xhdl20 = '1' OR valid_ahbcmd_undef = '1') 
                  THEN
                     latchahbcmd_xhdl34 := '1';    
                     latchahbcmd_undef_xhdl35 := '1';    
                     CASE HWRITE IS
                        -- Write Signal Generation
                        
                        WHEN WRITE_C =>
                                 burst_count_load_xhdl37 := '1';    
                                 next_state_xhdl32 := WR_IN_FIFO;    
                        -- Read Signal Generation
                        
                        WHEN READ_C =>
                                 burst_count_load_xhdl37 := '1';    
                                 next_state_xhdl32 := WAIT_STATE;    
                                 ahb_rd_req_xhdl8_xhdl42 := '1';    
                        WHEN OTHERS =>
                                 NULL;
                        
                     END CASE;
                     -- case (HWRITE)
                     
                     
                  -- if (valid_ahbcmd == 1'b1)
                  
                  ELSE
                     next_state_xhdl32 := IDLE;    
                  END IF;
                  -- else: !if(valid_ahbcmd == 1'b1)
                  
                  
         -- case: WR_RESP_ERR
         ----------------------------------------------------- 
         -- WAIT STATE
         ----------------------------------------------------- 
         
         WHEN WAIT_STATE =>
                  ahb_rd_req_xhdl8_xhdl42 := '0';    
                  HREADYOUT_xhdl1_xhdl33 := '0';    
                  IF (axi_read_rlast_sync = '1') THEN
                     IF (burst_count(1) = '0') THEN
                        next_state_xhdl32 := DUMMY_WAIT;    
                     ELSE
                        next_state_xhdl32 := RD_FROM_FIFO;    
                     END IF;
                  END IF;
         -- case: WAIT_STATE
         ----------------------------------------------------- 
         -- DUMMY WAIT STATE
         ----------------------------------------------------- 
         
         WHEN DUMMY_WAIT =>
                  ahb_rd_req_xhdl8_xhdl42 := '0';    
                  HREADYOUT_xhdl1_xhdl33 := '0';    
                  IF (wait_count = "10") THEN
                     next_state_xhdl32 := RD_FROM_FIFO;    
                  END IF;
                  -- for Single burst
                  
                  IF ((rdch_fifo_empty = '0' AND HBURST_d_xhdl18 = "000") AND 
                  wait_count = "00") THEN
                     fifo_rd_en_xhdl40 := '1';    
                  -- for undef
                  
                  ELSE
                     IF ((rdch_fifo_empty = '0' AND HBURST_d_xhdl18 = "001") 
                     AND wait_count = "00") THEN
                        fifo_rd_en_xhdl40 := '1';    
                     -- for other bursts
                     
                     ELSE
                        IF ((rdch_fifo_empty = '0' AND HBURST_d_xhdl18 /= "000")
                        AND HBURST_d_xhdl18 /= "001") THEN
                           fifo_rd_en_xhdl40 := '1';    
                        ELSE
                           fifo_rd_en_xhdl40 := '0';    
                        END IF;
                     END IF;
                  END IF;
         -- case: DUMMY_WAIT
         ----------------------------------------------------- 
         -- READ DATA FROM READ CHANNEL FIFO
         ----------------------------------------------------- 
         
         WHEN RD_FROM_FIFO =>
		  --15/02/13 - 1E CHANGE
                  IF ((burst_num_r /= "00000") AND NOT ((HBURST_d_xhdl18 = 
                  "000") OR (HBURST_d_xhdl18 = "001" AND UNDEF_BURST = 0))) 
                  THEN
                     IF ((rdch_fifo_empty = '0') AND (count = "11")) THEN
                        fifo_rd_en_xhdl40 := '1';    
                     ELSE
                        fifo_rd_en_xhdl40 := '0';    
                     END IF;
                     IF (count = "00") THEN
                        HREADYOUT_xhdl1_xhdl33 := '1';    
                     ELSE
                        HREADYOUT_xhdl1_xhdl33 := '0';    
                     END IF;
                  ELSE
                     -- Last read
	             IF (NOT((HBURST_d_xhdl18 = "000") OR (HBURST_d_xhdl18 = "001" AND UNDEF_BURST = 0))) THEN
                        fifo_rd_en_xhdl40 := '0';
                        next_state_xhdl32 := READ_DONE;
	             ELSE 
                        fifo_rd_en_xhdl40 := '0';
                        next_state_xhdl32 := READ_DONE;
                     END IF;		
                  END IF;


         WHEN READ_DONE =>
                  HREADYOUT_xhdl1_xhdl33 := '0';    
                  IF (valid_ahbcmd_xhdl20 = '1' AND HBURST(2 DOWNTO 0) /= "001")
                  THEN
                     latchahbcmd_xhdl34 := '1';    
                     HREADYOUT_xhdl1_xhdl33 := '1';    
                     CASE HWRITE IS
                        -- Write Signal Generation
                        
                        WHEN WRITE_C =>
                                 burst_count_load_xhdl37 := '1';    
                                 next_state_xhdl32 := WR_IN_FIFO;    
                        -- Read Signal Generation
                        
                        WHEN READ_C =>
                                 burst_count_load_xhdl37 := '1';    
                                 next_state_xhdl32 := WAIT_STATE;    
                                 ahb_rd_req_xhdl8_xhdl42 := '1';    
                        WHEN OTHERS =>
                                 NULL;
                        
                     END CASE;
                     -- case (HWRITE)
                     
                     
                  -- if (valid_ahbcmd == 1'b1)
                  
                  ELSE
                     HREADYOUT_xhdl1_xhdl33 := '0';    
                     next_state_xhdl32 := IDLE;    
                  END IF;
                  -- else: !if(valid_ahbcmd == 1'b1)
                  -- for undef
                  
                  IF (valid_ahbcmd_rd_undef = '1' AND HBURST(2 DOWNTO 0) = 
                  "001") THEN
                     latchahbcmd_rd_undef_xhdl36 := '1';    
                     HREADYOUT_xhdl1_xhdl33 := '1';    
                     CASE HWRITE IS
                        -- Write Signal Generation
                        
                        WHEN WRITE_C =>
                                 burst_count_load_xhdl37 := '1';    
                                 next_state_xhdl32 := WR_IN_FIFO;    
                        -- Read Signal Generation
                        
                        WHEN READ_C =>
                                 burst_count_load_xhdl37 := '1';    
                                 next_state_xhdl32 := WAIT_STATE;    
                                 ahb_rd_req_xhdl8_xhdl42 := '1';    
                        WHEN OTHERS =>
                                 NULL;
                        
                     END CASE;
                     -- case (HWRITE)
                     
                     
                  -- if (valid_ahbcmd == 1'b1)
                  
                  ELSE
                     HREADYOUT_xhdl1_xhdl33 := '0';    
                     next_state_xhdl32 := IDLE;    
                  END IF;
                  -- else: !if(valid_ahbcmd == 1'b1)
                  
                  
         WHEN -- case: READ_DONE
         
         OTHERS  =>
                  next_state_xhdl32 := current_state;    
         
      END CASE;
      -- case (current_state)
      
      
      next_state <= next_state_xhdl32;
      HREADYOUT_xhdl1 <= HREADYOUT_xhdl1_xhdl33;
      latchahbcmd <= latchahbcmd_xhdl34;
      latchahbcmd_undef <= latchahbcmd_undef_xhdl35;
      latchahbcmd_rd_undef <= latchahbcmd_rd_undef_xhdl36;
      burst_count_load <= burst_count_load_xhdl37;
      fifo_wr_en <= fifo_wr_en_xhdl38;
      HRESP_xhdl2 <= HRESP_xhdl2_xhdl39;
      fifo_rd_en <= fifo_rd_en_xhdl40;
      ahb_wr_done_xhdl7 <= ahb_wr_done_xhdl7_xhdl41;
      ahb_rd_req_xhdl8 <= ahb_rd_req_xhdl8_xhdl42;
      set_idle_cyc <= set_idle_cyc_xhdl43;
   END PROCESS state_machine_combo_logic;

   -- block: state_machine_combo_logic
   ---------------------------------------------------------------------
   -- For Single and bursts - Latch AHB interface signals on latchahbcmd 
   -- Only for undefined    - Copy latched signals and pass to AXI i/f on 
   --                         latchahbcmd_undef, latchahbcmd_rd_undef
   ---------------------------------------------------------------------
   
   register_ahb_signals : PROCESS (HCLK, HRESETn)
   BEGIN
      IF (HRESETn = '0') THEN
         HSEL_d_xhdl12 <= '0';    
         HADDR_d_xhdl13 <= (OTHERS => '0');    
         HWRITE_d_xhdl14 <= '0';    
         HREADY_d_xhdl15 <= '0';    
         HTRANS_d_xhdl16 <= "00";    
         HSIZE_d_xhdl17 <= "000";    
         HBURST_d_xhdl18 <= "000";    
         HMASTLOCK_d_xhdl19 <= '0';    
      -- for single and bursts
      
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         IF (latchahbcmd = '1') THEN
            HSEL_d_xhdl12 <= HSEL;    
            HADDR_d_xhdl13 <= HADDR;    
            HWRITE_d_xhdl14 <= HWRITE;    
            HREADY_d_xhdl15 <= HREADY;    
            HTRANS_d_xhdl16 <= HTRANS;    
            HSIZE_d_xhdl17 <= HSIZE;    
            HBURST_d_xhdl18 <= HBURST;    
            HMASTLOCK_d_xhdl19 <= HMASTLOCK;    
         -- for undef
         
         ELSE
            IF (latchahbcmd_undef = '1' OR latchahbcmd_rd_undef = '1') THEN
               HSEL_d_xhdl12 <= HSEL_undef_d;    
               HADDR_d_xhdl13 <= HADDR_undef_d;    
               HWRITE_d_xhdl14 <= HWRITE_undef_d;    
               HREADY_d_xhdl15 <= HREADY_undef_d;    
               HTRANS_d_xhdl16 <= HTRANS_undef_d;    
               HSIZE_d_xhdl17 <= HSIZE_undef_d;    
               HBURST_d_xhdl18 <= HBURST_undef_d;    
               HMASTLOCK_d_xhdl19 <= HMASTLOCK_undef_d;    
            END IF;
         END IF;
      END IF;
   END PROCESS register_ahb_signals;

   -- block: register_ahb_signals
   ---------------------------------------------------------------------
   -- For Undefined - Latch AHB interface signals on latchahbcmd_undef_r,
   --                 latchahbcmd_r, latchahbcmd_rd_undef_r
   ---------------------------------------------------------------------
   
   PROCESS (HCLK, HRESETn)
   BEGIN
      IF (HRESETn = '0') THEN
         HSEL_undef_d <= '0';    
         HADDR_undef_d <= (OTHERS => '0');    
         HWRITE_undef_d <= '0';    
         HREADY_undef_d <= '0';    
         HTRANS_undef_d <= "00";    
         HSIZE_undef_d <= "000";    
         HBURST_undef_d <= "000";    
         HMASTLOCK_undef_d <= '0';    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         IF (latchahbcmd_r = '1' OR latchahbcmd_undef_r = '1' OR 
         latchahbcmd_rd_undef_r = '1') THEN
            HSEL_undef_d <= HSEL;    
            HADDR_undef_d <= HADDR;    
            HWRITE_undef_d <= HWRITE;    
            HREADY_undef_d <= HREADY;    
            HTRANS_undef_d <= HTRANS;    
            HSIZE_undef_d <= HSIZE;    
            HBURST_undef_d <= HBURST;    
            HMASTLOCK_undef_d <= HMASTLOCK;    
         END IF;
      END IF;
   END PROCESS;

   ---------------------------------------------------------------------
   -- Generate busy idle cycle when HTRANS = IDLE
   ---------------------------------------------------------------------
   
   PROCESS (HCLK, HRESETn)
   BEGIN
      IF (HRESETn = '0') THEN
         ahb_busyidle_cyc_xhdl21 <= '0';    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         ahb_busyidle_cyc_xhdl21 <= CONV_STD_LOGIC(HTRANS_d_xhdl16(1) = '0');   
      END IF;
   END PROCESS;

   ---------------------------------------------------------------------
   -- Delayed HWDATA bus
   ---------------------------------------------------------------------
   
   PROCESS (HCLK, HRESETn)
   BEGIN
      IF (HRESETn = '0') THEN
         hwdata_r_xhdl4 <= (OTHERS => '0');    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         hwdata_r_xhdl4 <= HWDATA;    
      END IF;
   END PROCESS;

   ---------------------------------------------------------------------
   -- Delayed HWDATA bus
   ---------------------------------------------------------------------
   
   PROCESS (HCLK, HRESETn)
   BEGIN
      IF (HRESETn = '0') THEN
         RD_DATA_d1 <= (OTHERS => '0');    
         RD_DATA_d2 <= (OTHERS => '0');    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         IF (rdch_fifo_rd_en_r_d = '1') THEN
            RD_DATA_d1 <= RD_DATA;    
            RD_DATA_d2 <= RD_DATA_d1;    
         END IF;
      END IF;
   END PROCESS;

   PROCESS (HCLK, HRESETn)
   BEGIN
      IF (HRESETn = '0') THEN
         rdch_fifo_rd_en_r_d <= '0';    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         rdch_fifo_rd_en_r_d <= rdch_fifo_rd_en_r_xhdl6;    
      END IF;
   END PROCESS;

END ARCHITECTURE translated;
