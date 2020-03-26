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


ENTITY CoreAHBLtoAXI_AXIAccessControlHX IS
   GENERIC (
      -----------------------------------------------------
      -- Global parameters
      -----------------------------------------------------
      AHB_AWIDTH                     :  integer := 32;    
      AHB_DWIDTH                     :  integer := 32;    
      AXI_AWIDTH                     :  integer := 32;    
      AXI_DWIDTH                     :  integer := 64;    
      CLOCKS_ASYNC                   :  integer := 1;    
      UNDEF_BURST                    :  integer := 0);    --  if '0' then single transter else INCR16
   PORT (
      -----------------------------------------------------
-- Input-Output Ports
-----------------------------------------------------
-- Inputs on the AHBL interface

      HSEL                    : IN std_logic;   
      HADDR                   : IN std_logic_vector(AHB_AWIDTH - 1 DOWNTO 0);   
      HWRITE                  : IN std_logic;   
      HREADY                  : IN std_logic;   
      HTRANS                  : IN std_logic_vector(1 DOWNTO 0);   
      HSIZE                   : IN std_logic_vector(2 DOWNTO 0);   
      HBURST                  : IN std_logic_vector(2 DOWNTO 0);   
      HMASTLOCK               : IN std_logic;   
      latch_ahb_sig_sync      : IN std_logic;   
      ahb_wr_done_sync        : IN std_logic;   
      ahb_rd_req_sync         : IN std_logic;   
      burst_count_valid_sync  : IN std_logic;   
      burst_count_r           : IN std_logic_vector(3 DOWNTO 0);   
      rdch_fifo_full          : IN std_logic;   
      wrch_fifo_empty         : IN std_logic;   
      -- Inputs on AXI Interface

      ACLK                    : IN std_logic;   
      ARESETn                 : IN std_logic;   
      axi_wr_data             : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      -- Outputs on AXI Interface

      AWID                    : OUT std_logic_vector(3 DOWNTO 0);   
      AWADDR                  : OUT std_logic_vector(AXI_AWIDTH - 1 DOWNTO 0);  
      AWLEN                   : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE                  : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST                 : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK                  : OUT std_logic_vector(1 DOWNTO 0);   
      AWVALID                 : OUT std_logic;   
      AWREADY                 : IN std_logic;   
      WID                     : OUT std_logic_vector(3 DOWNTO 0);   
      WDATA                   : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB                   : OUT std_logic_vector((AXI_DWIDTH / 8) - 1 DOWNTO 0);   
      WLAST                   : OUT std_logic;   
      WVALID                  : OUT std_logic;   
      WREADY                  : IN std_logic;   
      BREADY                  : OUT std_logic;   
      BID                     : IN std_logic_vector(3 DOWNTO 0);   
      BRESP                   : IN std_logic_vector(1 DOWNTO 0);   
      BVALID                  : IN std_logic;   
      ARID                    : OUT std_logic_vector(3 DOWNTO 0);   
      ARADDR                  : OUT std_logic_vector(AXI_AWIDTH - 1 DOWNTO 0);  
      ARLEN                   : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE                  : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST                 : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK                  : OUT std_logic_vector(1 DOWNTO 0);   
      ARVALID                 : OUT std_logic;   
      ARREADY                 : IN std_logic;   
      RREADY                  : OUT std_logic;   
      RID                     : IN std_logic_vector(3 DOWNTO 0);   
      RDATA                   : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP                   : IN std_logic_vector(1 DOWNTO 0);   
      RLAST                   : IN std_logic;   
      RVALID                  : IN std_logic;   
      WRCH_fifo_rd_en         : OUT std_logic;   
      BRESP_sync              : OUT std_logic_vector(1 DOWNTO 0);   
      rdch_fifo_wr_en_r       : OUT std_logic;   
      rdch_fifo_wr_data       : OUT std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0);  
      axi_read_rlast          : OUT std_logic);   
END ENTITY CoreAHBLtoAXI_AXIAccessControlHX;

ARCHITECTURE translated OF CoreAHBLtoAXI_AXIAccessControlHX IS


   CONSTANT  AXI_WRSTB             :  integer := AXI_DWIDTH / 8;    
   CONSTANT  WRITE_C               :  std_logic := '1';    --  write constant
   CONSTANT  READ_C                :  std_logic := '0';    --  read constant
   CONSTANT  RESPOK_C              :  std_logic_vector(1 DOWNTO 0) := "00";    --  response OKAY from AXI
   CONSTANT  RESPERR_C             :  std_logic_vector(1 DOWNTO 0) := "01";    --  response ERROR from AXI
   -- State machine variables
   CONSTANT  IDLE                  :  std_logic_vector(2 DOWNTO 0) := "000";    
   CONSTANT  SEND_WR_ADDR          :  std_logic_vector(2 DOWNTO 0) := "001";    
   CONSTANT  SEND_WR_DATA          :  std_logic_vector(2 DOWNTO 0) := "010";    
   CONSTANT  READ_WR_RESP          :  std_logic_vector(2 DOWNTO 0) := "011";    
   CONSTANT  SEND_RD_ADDR          :  std_logic_vector(2 DOWNTO 0) := "100";    
   CONSTANT  READ_RD_DATA          :  std_logic_vector(2 DOWNTO 0) := "101";    

   CONSTANT  SHIFT_DATA_BYTE       :  std_logic_vector(7 DOWNTO 0) := "00000001";    
   CONSTANT  SHIFT_DATA_HW         :  std_logic_vector(7 DOWNTO 0) := "00000011";    
   CONSTANT  SHIFT_DATA_WORD       :  std_logic_vector(7 DOWNTO 0) := "00001111";    
   
  FUNCTION to_integer (
      val      : std_logic_vector) RETURN integer IS

      CONSTANT vec      : std_logic_vector(val'high-val'low DOWNTO 0) := val;      
      VARIABLE rtn      : integer := 0;
   BEGIN
      FOR index IN vec'RANGE LOOP
         IF (vec(index) = '1') THEN
            rtn := rtn + (2**index);
         END IF;
      END LOOP;
      RETURN(rtn);
   END to_integer;

   FUNCTION ShiftRight (
      val      : std_logic_vector;
      shft     : integer) RETURN std_logic_vector IS
      
      VARIABLE int      : std_logic_vector(val'LENGTH+shft-1 DOWNTO 0);
      VARIABLE rtn      : std_logic_vector(val'RANGE);
      VARIABLE fill     : std_logic_vector(shft-1 DOWNTO 0) := (others => '0');
   BEGIN
      int := fill & val;
      rtn := int(val'LENGTH+shft-1 DOWNTO shft);
      RETURN(rtn);
   END ShiftRight;  

FUNCTION ShiftLeft(s1:std_logic_vector;nn:integer) return std_logic_vector is 
  -- shift left by nn bits, add nn 0s to LSBs 
  -- Example s1 = 11111101, nn = 3, return = 11101000 
  --It is in effect unsigned multiplication by 2^nn 
    --variable rr : std_logic_vector(s1'high downto s1'low); 
    variable rr : std_logic_vector(7 downto 0); 
  begin 
    if(nn < 0) then 
    assert false 
      report "shln: shift index nn is negative,can't shift" severity error; 
    end if; 
    if(nn = 0) then 
      rr := s1; 
    else 
      rr := (others => '0'); 
      --for ii in s1'high downto s1'low+1 loop 
      for ii in 7 downto 0 loop 
        rr(ii) := s1(ii-nn); 
        if(ii = nn) then 
          exit; 
        end if; 
      end loop; 
    end if; 
    return rr; 
  end ShiftLeft; 


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


   -------------------------------------------------------------------------------
   -- Register Declarations
   -------------------------------------------------------------------------------
   SIGNAL wvalid_reg               :  std_logic;   
   SIGNAL axi_current_state        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL axi_next_state           :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL HSEL_sync                :  std_logic;   
   SIGNAL HADDR_sync               :  std_logic_vector(AHB_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL HWRITE_sync              :  std_logic;   
   SIGNAL HREADY_sync              :  std_logic;   
   SIGNAL HTRANS_sync              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL HSIZE_sync               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL HBURST_sync              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL HMASTLOCK_sync           :  std_logic;   
   SIGNAL awaddr_awvalid_set       :  std_logic;   
   SIGNAL wvalid_set               :  std_logic;   
   SIGNAL wvalid_clr               :  std_logic;   
   SIGNAL bready_set               :  std_logic;   
   SIGNAL burstcount_load          :  std_logic;   
   SIGNAL burstcount_dec           :  std_logic;   
   SIGNAL burstcount_dec_r         :  std_logic;   
   SIGNAL latch_wr_resp            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL latch_wr_resp_set        :  std_logic;   
   SIGNAL axiwr_burst_length       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL axird_burst_length       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL axi_burst_type           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL awaddr_awvalid_clr       :  std_logic;   
   SIGNAL burstcount_reg           :  std_logic_vector(4 DOWNTO 0);   
   SIGNAL burstcount_reg_r         :  std_logic_vector(4 DOWNTO 0);   
   SIGNAL burst_count_r_sync       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL rdch_write_data_r        :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL rd_data_c                :  std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL axi_read_data            :  std_logic;   
   SIGNAL rready_set               :  std_logic;   
   SIGNAL axi_read_resp            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ahb_rd_req_sync_d        :  std_logic;   
   SIGNAL latch_ahb_sig_sync_d     :  std_logic;   
   SIGNAL axi_wstrb                :  std_logic_vector((AXI_DWIDTH / 8) - 1 DOWNTO 0); 
   SIGNAL swap_rd_data_byte        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL axi_wrdata               :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL wrstb_count              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWADDR_incr              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL axi_wr_data_d            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL awaddr_awvalid_clr_d     :  std_logic;   
   SIGNAL araddr_arvalid_clr_d     :  std_logic;   
   SIGNAL araddr_arvalid_set       :  std_logic;   
   SIGNAL araddr_arvalid_clr       :  std_logic;   
   SIGNAL WREADY_reg               :  std_logic;   
   SIGNAL BVALID_reg               :  std_logic;   
   SIGNAL wvalid_reg_r             :  std_logic;   
   SIGNAL wvalid_set_r             :  std_logic;   
   SIGNAL wvalid_set_r1            :  std_logic;   
   SIGNAL wvalid_clr_t             :  std_logic;   
   SIGNAL wvalid_clr_r             :  std_logic;   
   SIGNAL axi_wr_data_lat          :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   -------------------------------------------------------------------------------
   -- Wire Declarations
   -------------------------------------------------------------------------------
   SIGNAL rd_haddr                 :  std_logic_vector(AHB_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL axi_rd_start             :  std_logic;   
   SIGNAL store_ahb_sig            :  std_logic;   
   SIGNAL undef_wr_burst_size_32   :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL undef_rd_burst_size_32   :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL undef_wr_burst_size_64   :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL undef_rd_burst_size_64   :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl28              :  std_logic_vector(63 DOWNTO 0);   
   SIGNAL temp_xhdl29              :  std_logic_vector(63 DOWNTO 0);   
   SIGNAL temp_xhdl30              :  std_logic_vector(63 DOWNTO 0);   
   SIGNAL temp_xhdl31              :  std_logic_vector(63 DOWNTO 0);   
   SIGNAL temp_xhdl32              :  std_logic_vector(63 DOWNTO 0);   
   SIGNAL temp_xhdl33              :  std_logic_vector(63 DOWNTO 0);   
   SIGNAL temp_xhdl34              :  std_logic_vector(63 DOWNTO 0);   
   SIGNAL temp_xhdl35              :  std_logic_vector(63 DOWNTO 0);   
   SIGNAL temp_xhdl36              :  std_logic_vector(63 DOWNTO 0);   
   SIGNAL temp_xhdl37              :  std_logic_vector(63 DOWNTO 0);   
   SIGNAL temp_xhdl38              :  std_logic_vector(63 DOWNTO 0);   
   SIGNAL temp_xhdl39              :  std_logic_vector(63 DOWNTO 0);   
   SIGNAL temp_xhdl40              :  std_logic_vector(63 DOWNTO 0);   
   SIGNAL temp_xhdl41              :  std_logic_vector(7 DOWNTO 0);   
   SIGNAL temp_xhdl42              :  std_logic;   
   SIGNAL temp_xhdl43              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl45              :  std_logic_vector(31 DOWNTO 0);   
   SIGNAL temp_xhdl46              :  std_logic_vector(63 DOWNTO 32);   
   SIGNAL temp_xhdl47              :  std_logic_vector(31 DOWNTO 0);   
   SIGNAL temp_xhdl48              :  std_logic_vector(31 DOWNTO 0);   
   SIGNAL temp_xhdl49              :  std_logic_vector(63 DOWNTO 32);   
   SIGNAL temp_xhdl50              :  std_logic_vector(63 DOWNTO 32);   
   SIGNAL temp_xhdl51              :  std_logic_vector(31 DOWNTO 0);   
   SIGNAL temp_xhdl52              :  std_logic_vector(63 DOWNTO 32);   
   SIGNAL temp_xhdl53              :  std_logic_vector(31 DOWNTO 0);   
   SIGNAL temp_xhdl54              :  std_logic_vector(63 DOWNTO 32);   
   SIGNAL temp_xhdl70              :  std_logic;   
   SIGNAL AWID_xhdl1               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWADDR_xhdl2             :  std_logic_vector(AXI_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL AWLEN_xhdl3              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_xhdl4             :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_xhdl5            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWVALID_xhdl6            :  std_logic;  
   SIGNAL AWVALID_xhdl6_int        :  std_logic; 
   SIGNAL WID_xhdl7                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL WDATA_xhdl8              :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_xhdl9              :  std_logic_vector(AXI_WRSTB - 1 DOWNTO 0); 
   SIGNAL WLAST_xhdl10             :  std_logic;   
   SIGNAL WVALID_xhdl11            :  std_logic;   
   SIGNAL BREADY_xhdl12            :  std_logic;   
   SIGNAL ARID_xhdl13              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARADDR_xhdl14            :  std_logic_vector(AXI_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL ARLEN_xhdl15             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_xhdl16            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_xhdl17           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_xhdl18            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARVALID_xhdl19           :  std_logic; 
   SIGNAL ARVALID_xhdl19_int       :  std_logic;  
   SIGNAL RREADY_xhdl20            :  std_logic;   
   SIGNAL AWLOCK_xhdl21            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL WRCH_fifo_rd_en_xhdl22   :  std_logic;   
   SIGNAL BRESP_sync_xhdl23        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL rdch_fifo_wr_en_r_xhdl24 :  std_logic;   
   SIGNAL rdch_fifo_wr_data_xhdl25 :  std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL axi_read_rlast_xhdl26    :  std_logic;   
   SIGNAL axi_burst_length_ahb32   :  std_logic;   
   SIGNAL axi_burst_length_ahb64   :  std_logic;   
   SIGNAL axiwr_burst_length_ahb32 :  std_logic;   
   SIGNAL axiwr_burst_length_ahb64 :  std_logic;   

BEGIN
   AWID <= AWID_xhdl1;
   AWADDR <= AWADDR_xhdl2;
   AWLEN <= AWLEN_xhdl3;
   AWSIZE <= AWSIZE_xhdl4;
   AWBURST <= AWBURST_xhdl5;
   AWVALID <= AWVALID_xhdl6;
   WID <= WID_xhdl7;
   WDATA <= WDATA_xhdl8;
   WSTRB <= WSTRB_xhdl9;
   WLAST <= WLAST_xhdl10;
   WVALID <= WVALID_xhdl11;
   BREADY <= BREADY_xhdl12;
   ARID <= ARID_xhdl13;
   ARADDR <= ARADDR_xhdl14;
   ARLEN <= ARLEN_xhdl15;
   ARSIZE <= ARSIZE_xhdl16;
   ARBURST <= ARBURST_xhdl17;
   ARLOCK <= ARLOCK_xhdl18;
   ARVALID <= ARVALID_xhdl19;
   RREADY <= RREADY_xhdl20;
   AWLOCK <= AWLOCK_xhdl21;
   WRCH_fifo_rd_en <= WRCH_fifo_rd_en_xhdl22;
   BRESP_sync <= BRESP_sync_xhdl23;
   rdch_fifo_wr_en_r <= rdch_fifo_wr_en_r_xhdl24;
   rdch_fifo_wr_data <= rdch_fifo_wr_data_xhdl25;
   axi_read_rlast <= axi_read_rlast_xhdl26;
   temp_xhdl28 <= axi_wr_data(31 DOWNTO 0) & axi_wr_data(63 DOWNTO 32) WHEN 
   (AWADDR_incr(2) = '1') ELSE axi_wr_data(63 DOWNTO 32) & axi_wr_data(31 
   DOWNTO 0);
   temp_xhdl29 <= axi_wr_data(31 DOWNTO 0) & axi_wr_data(63 DOWNTO 32) WHEN 
   (AWADDR_incr(2) = '1') ELSE axi_wr_data;
   temp_xhdl30 <= "00000000000000000000000000000000" & axi_wr_data(63 DOWNTO 48)
   & axi_wr_data(15 DOWNTO 0) WHEN (burstcount_reg(0) = '1') ELSE 
   axi_wr_data(63 DOWNTO 48) & axi_wr_data(15 DOWNTO 0) & 
   "00000000000000000000000000000000";
   temp_xhdl31 <= axi_wr_data(63 DOWNTO 48) & axi_wr_data(15 DOWNTO 0) & 
   "00000000000000000000000000000000" WHEN (burstcount_reg(0) = '1') ELSE 
   "00000000000000000000000000000000" & axi_wr_data(63 DOWNTO 48) & 
   axi_wr_data(15 DOWNTO 0);
   temp_xhdl32 <= axi_wr_data(31 DOWNTO 0) & axi_wr_data(63 DOWNTO 32) WHEN 
   (AWADDR_incr(2) = '1') ELSE axi_wr_data;
   temp_xhdl33 <= "00000000000000000000000000000000" & axi_wr_data(63 DOWNTO 48)
   & axi_wr_data(15 DOWNTO 0) WHEN (burstcount_reg(0) = '1') ELSE 
   "00000000000000000000000000000000" & axi_wr_data(63 DOWNTO 48) & 
   axi_wr_data(47 DOWNTO 32);
   temp_xhdl34 <= "00000000000000000000000000000000" & axi_wr_data(31 DOWNTO 16)
   & axi_wr_data(15 DOWNTO 0) WHEN (burstcount_reg(0) = '1') ELSE 
   "00000000000000000000000000000000" & axi_wr_data(63 DOWNTO 48) & 
   axi_wr_data(15 DOWNTO 0);
   temp_xhdl35 <= axi_wr_data(63 DOWNTO 48) & axi_wr_data(15 DOWNTO 0) & 
   "00000000000000000000000000000000" WHEN (burstcount_reg(0) = '1') ELSE 
   axi_wr_data(63 DOWNTO 48) & axi_wr_data(47 DOWNTO 32) & 
   "00000000000000000000000000000000";
   temp_xhdl36 <= axi_wr_data(31 DOWNTO 16) & axi_wr_data(15 DOWNTO 0) & 
   "00000000000000000000000000000000" WHEN (burstcount_reg(0) = '1') ELSE 
   axi_wr_data(63 DOWNTO 48) & axi_wr_data(15 DOWNTO 0) & 
   "00000000000000000000000000000000";
   temp_xhdl37 <= axi_wr_data(31 DOWNTO 0) & axi_wr_data(31 DOWNTO 0) WHEN 
   (AWADDR_incr(2) = '1') ELSE axi_wr_data;
   temp_xhdl38 <= axi_wr_data(31 DOWNTO 0) & axi_wr_data(63 DOWNTO 32) WHEN 
   (AWADDR_incr(2) = '1') ELSE axi_wr_data;
   temp_xhdl39 <= axi_wr_data(31 DOWNTO 0) & "00000000000000000000000000000000" 
   WHEN (burstcount_reg(0) = '1') ELSE axi_wr_data_d(63 DOWNTO 32) & 
   "00000000000000000000000000000000";
   temp_xhdl40 <= "00000000000000000000000000000000" & axi_wr_data(31 DOWNTO 0) 
   WHEN (burstcount_reg(0) = '1') ELSE "00000000000000000000000000000000" & 
   axi_wr_data_d(63 DOWNTO 32);

   --/////////////////////////////////////////////////////////////////////////////
   --                         Start-of-code                                     //
   --/////////////////////////////////////////////////////////////////////////////
   -------------------------------------------------------------------------------
   -- Generate the write data to be sent to the AXI interface
   -- This is the 64-bit data read from the WRCHANNEL fifo and sent on the Write
   -- data channel on the AXI bus 
   -------------------------------------------------------------------------------
   
   PROCESS (AWADDR_incr, HSIZE_sync, HBURST_sync,  
   axi_wr_data, HADDR_sync, temp_xhdl28, temp_xhdl29, temp_xhdl30, temp_xhdl31, temp_xhdl32,
   temp_xhdl33, temp_xhdl34,temp_xhdl35, temp_xhdl36, temp_xhdl37, temp_xhdl38, temp_xhdl39, temp_xhdl40
   )
      VARIABLE axi_wrdata_xhdl27  : std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);
   BEGIN
      CASE HSIZE_sync(1 DOWNTO 0) IS
         WHEN "11" =>
                  axi_wrdata_xhdl27 := axi_wr_data(AXI_DWIDTH - 1 DOWNTO 0);    
         WHEN "10" =>
                  IF (HBURST_sync(2 DOWNTO 0) = "000") THEN
                     axi_wrdata_xhdl27 := temp_xhdl28;    
                  ELSE
                     IF (HBURST_sync(2 DOWNTO 0) = "001") THEN
                        axi_wrdata_xhdl27 := temp_xhdl29;    
                     ELSE
                        -- For all bursts
                        
                        IF (HBURST_sync(0) = '1') THEN
                           -- For incr bursts
                           
                           IF (HADDR_sync(2) = '0') THEN
                              axi_wrdata_xhdl27 := axi_wr_data(AXI_DWIDTH - 1 
                              DOWNTO 0);    
                           ELSE
                              axi_wrdata_xhdl27 := axi_wr_data(31 DOWNTO 0) & 
                              axi_wr_data(63 DOWNTO 32);    
                           END IF;
                        ELSE
                           -- For wrap bursts
                           
                           IF (HADDR_sync(2) = '0') THEN
                              axi_wrdata_xhdl27 := axi_wr_data(AXI_DWIDTH - 1 
                              DOWNTO 0);    
                           ELSE
                              axi_wrdata_xhdl27 := axi_wr_data(31 DOWNTO 0) & 
                              axi_wr_data(63 DOWNTO 32);    
                           END IF;
                        END IF;
                     END IF;
                  END IF;
         WHEN "01" =>
                  IF (HBURST_sync(2 DOWNTO 0) = "000") THEN
                     -- For Single
                     
                     IF (HADDR_sync(2 DOWNTO 1) = "00") THEN
                        axi_wrdata_xhdl27 := temp_xhdl30;    
                     ELSE
                        IF (HADDR_sync(2 DOWNTO 1) = "10") THEN
                           axi_wrdata_xhdl27 := temp_xhdl31;    
                        ELSE
                           IF (HADDR_sync(2 DOWNTO 1) = "11") THEN
                              axi_wrdata_xhdl27 := axi_wr_data(31 DOWNTO 16) & 
	                                           axi_wr_data(15 DOWNTO 0) &
                                                   "00000000000000000000000000000000";    
                           ELSE
                              axi_wrdata_xhdl27 := axi_wr_data(AXI_DWIDTH - 1 
                              DOWNTO 0);    
                           END IF;
                        END IF;
                     END IF;
                  ELSE
                     IF (HBURST_sync(2 DOWNTO 0) = "001") THEN
                        axi_wrdata_xhdl27 := temp_xhdl32;    
                     ELSE
                        -- For Bursts
                        
                        IF (AWADDR_incr(2 DOWNTO 1) = "00") THEN
                           axi_wrdata_xhdl27 := temp_xhdl33;    
                        ELSE
                           IF (AWADDR_incr(2 DOWNTO 1) = "01") THEN
                              axi_wrdata_xhdl27 := temp_xhdl34;    
                           ELSE
                              IF (AWADDR_incr(2 DOWNTO 1) = "10") THEN
                                 axi_wrdata_xhdl27 := temp_xhdl35;    
                              ELSE
                                 axi_wrdata_xhdl27 := temp_xhdl36;    
                              END IF;
                           END IF;
                        END IF;
                     END IF;
                  END IF;
         WHEN "00" =>
                  IF (HBURST_sync(2 DOWNTO 0) = "000") THEN
                     axi_wrdata_xhdl27 := temp_xhdl37;    
                  ELSE
                     IF (HBURST_sync(2 DOWNTO 0) = "001") THEN
                        axi_wrdata_xhdl27 := temp_xhdl38;    
                     ELSE
                        IF (HBURST_sync(0) = '1') THEN
                           -- For incr bursts
                           
                           IF (AWADDR_incr(2) = '1') THEN
                              axi_wrdata_xhdl27 := temp_xhdl39;    
                           ELSE
                              axi_wrdata_xhdl27 := temp_xhdl40;    
                           END IF;
                        ELSE
                           -- For wrap bursts
                           
                           IF (HADDR_sync(2) = '0') THEN
                              -- Address less than 4 - lower range
                              
                              IF (AWADDR_incr(2 DOWNTO 0) < "100") THEN
                                 IF (AWADDR_incr(0) = '1') THEN
                                    axi_wrdata_xhdl27 := axi_wr_data(31 DOWNTO 
                                    0) & axi_wr_data(63 DOWNTO 32);    
                                 ELSE
                                    axi_wrdata_xhdl27 := axi_wr_data;    
                                 END IF;
                              ELSE
                                 IF (AWADDR_incr(0) = '0') THEN
                                    axi_wrdata_xhdl27 := axi_wr_data(31 DOWNTO 
                                    0) & axi_wr_data(63 DOWNTO 32);    
                                 ELSE
                                    axi_wrdata_xhdl27 := axi_wr_data;    
                                 END IF;
                              END IF;
                           ELSE
                              -- Address falling in upper range
                              
                              IF (AWADDR_incr(2 DOWNTO 0) >= "100") THEN
                                 IF (AWADDR_incr(0) = '1') THEN
                                    axi_wrdata_xhdl27 := axi_wr_data;    
                                 ELSE
                                    axi_wrdata_xhdl27 := axi_wr_data(31 DOWNTO 
                                    0) & axi_wr_data(63 DOWNTO 32);    
                                 END IF;
                              ELSE
                                 IF (AWADDR_incr(0) = '0') THEN
                                    axi_wrdata_xhdl27 := axi_wr_data;    
                                 ELSE
                                    axi_wrdata_xhdl27 := axi_wr_data(31 DOWNTO 
                                    0) & axi_wr_data(63 DOWNTO 32);    
                                 END IF;
                              END IF;
                           END IF;
                        END IF;
                        -- else: !if(HBURST_sync[0] == 1'b1)                   
                        
                        
                     END IF;
                  END IF;
                  -- else: !if(HBURST_sync[2:0] == 3'b001)           
                  
                  
         WHEN -- case: 2'b00
         
         OTHERS  =>
                  axi_wrdata_xhdl27 := (OTHERS => '0');    
         
      END CASE;
      axi_wrdata <= axi_wrdata_xhdl27;
   END PROCESS;

   PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         burstcount_dec_r <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         burstcount_dec_r <= burstcount_dec;    
      END IF;
   END PROCESS;
   temp_xhdl41 <= "00001111" WHEN (AWADDR_incr(2 DOWNTO 0) = "000") ELSE 
   "11110000";

   -------------------------------------------------------------------------------
   -- Generate the write strobe to be sent to the AXI interface
   -------------------------------------------------------------------------------
   
   PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         axi_wstrb <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         CASE HSIZE_sync(1 DOWNTO 0) IS
            WHEN "11" =>
                     axi_wstrb <= '1' & '1' & '1' & '1' & '1' & '1' & '1' & 
                     '1';    
            WHEN "10" =>
                     IF ((HBURST_sync(2 DOWNTO 0) = "000") OR ((HBURST_sync(2 
                     DOWNTO 0) = "001") AND (UNDEF_BURST = 0))) THEN
                        -- For Single/Undef
                        
                        IF (HADDR_sync(2 DOWNTO 0) = "000") THEN
                           axi_wstrb <= "00001111";    
                        ELSE
                           IF (HADDR_sync(2 DOWNTO 0) = "100") THEN
                              axi_wstrb <= "11110000";    
                           END IF;
                        END IF;
                     ELSE
                        -- For all bursts
                        
                        IF (HBURST_sync(0) = '1') THEN
                           -- For incr bursts
                           IF (HADDR_sync(2) = '1') THEN
                              -- 30/01/13 - check whether start addr = '4
                              
                              IF ((AWVALID_xhdl6 AND AWREADY) = '1') THEN
                                 --axi_wstrb <= ShiftLeft("00001111", to_integer(HADDR_sync(2 DOWNTO 0))) ;    
                                 IF ((HADDR_sync(2)) = '1') THEN
			            axi_wstrb <= "11110000";
		                 ELSE
			            axi_wstrb <= "00001111";
			         END IF;
                              ELSE
                                 IF ((WVALID_xhdl11 AND WREADY) = '1') THEN
                                    IF (axi_wstrb = "11110000") THEN
                                       axi_wstrb <= "00001111";    
                                    ELSE
                                       --axi_wstrb <= ShiftLeft(axi_wstrb, 4);    
			               axi_wstrb <= axi_wstrb(3 DOWNTO 0) & "0000";	 
                                    END IF;
                                 END IF;
                              END IF;
                           -- if (HADDR_sync[2] == 1'b1)
                           
                           ELSE
                              axi_wstrb <= '1' & '1' & '1' & '1' & '1' & '1' & 
                              '1' & '1';    
                           END IF;
                        ELSE
                           -- For wrap bursts
                           
                           IF (burstcount_reg = "00000") THEN
                              axi_wstrb <= axi_wstrb;    
                           ELSE
                              IF (((WVALID_xhdl11 AND WREADY) AND 
                              CONV_STD_LOGIC(axi_wstrb = "11110000")) = '1') 
                              THEN
                                 axi_wstrb <= "00001111";    
                              ELSE
                                 IF ((WVALID_xhdl11 AND WREADY) = '1') THEN
				    --axi_wstrb <= ShiftLeft(axi_wstrb, 4); 
			            axi_wstrb <= axi_wstrb(3 DOWNTO 0) & "0000";	 
                                 ELSE
                                    IF (wvalid_set_r = '1') THEN
                                       axi_wstrb <= temp_xhdl41;    
                                    END IF;
                                 END IF;
                              END IF;
                           END IF;
                        END IF;
                     END IF;
            WHEN "01" =>
                     IF ((HBURST_sync(2 DOWNTO 0) = "000") OR ((HBURST_sync(2 
                     DOWNTO 0) = "001") AND (UNDEF_BURST = 0))) THEN
         		--axi_wstrb <= ShiftLeft("00000011", to_integer(HADDR_sync(2 DOWNTO 0)));    
                        IF ((HADDR_sync(2 DOWNTO 1)) = "00") THEN
			   axi_wstrb <= "00000011";
			ELSIF ((HADDR_sync(2 DOWNTO 1)) = "01") THEN
			   axi_wstrb <= "00001100";
			ELSIF ((HADDR_sync(2 DOWNTO 1)) = "10") THEN
			   axi_wstrb <= "00110000";
		        ELSE
			   axi_wstrb <= "11000000";
			END IF;
                     ELSE
                        -- For all bursts
                        
                        IF ((AWVALID_xhdl6 AND AWREADY) = '1') THEN
			   --axi_wstrb <= ShiftLeft("00000011", to_integer(HADDR_sync(2 DOWNTO 0)));
                          IF ((HADDR_sync(2 DOWNTO 1)) = "00") THEN
			     axi_wstrb <= "00000011";
			  ELSIF ((HADDR_sync(2 DOWNTO 1)) = "01") THEN
			     axi_wstrb <= "00001100";
			  ELSIF ((HADDR_sync(2 DOWNTO 1)) = "10") THEN
			     axi_wstrb <= "00110000";
		          ELSE
			     axi_wstrb <= "11000000";
			  END IF;
                        ELSE
                           IF ((WVALID_xhdl11 AND WREADY) = '1') THEN
                              IF (axi_wstrb = "11000000") THEN
                                 axi_wstrb <= "00000011";    
                              ELSE
			         --axi_wstrb <= ShiftLeft(axi_wstrb, 2);	 
			         axi_wstrb <= axi_wstrb(5 DOWNTO 0) & "00";	 
                              END IF;
                           END IF;
			  
                        END IF;
                     END IF;
            WHEN "00" =>
                     IF ((HBURST_sync(2 DOWNTO 0) = "000") OR ((HBURST_sync(2 
                     DOWNTO 0) = "001") AND (UNDEF_BURST = 0))) THEN
			--axi_wstrb <= ShiftLeft("00000001", to_integer(HADDR_sync(2 DOWNTO 0)));        
                        IF ((HADDR_sync(2 DOWNTO 0)) = "111") THEN
			   axi_wstrb <= "10000000";
			ELSIF ((HADDR_sync(2 DOWNTO 0)) = "110") THEN
			   axi_wstrb <= "01000000";
			ELSIF ((HADDR_sync(2 DOWNTO 0)) = "101") THEN
			   axi_wstrb <= "00100000";
			ELSIF ((HADDR_sync(2 DOWNTO 0)) = "100") THEN
			   axi_wstrb <= "00010000";
			ELSIF ((HADDR_sync(2 DOWNTO 0)) = "011") THEN
			   axi_wstrb <= "00001000";
			ELSIF ((HADDR_sync(2 DOWNTO 0)) = "010") THEN
			   axi_wstrb <= "00000100";
			ELSIF ((HADDR_sync(2 DOWNTO 0)) = "001") THEN
			   axi_wstrb <= "00000010";
		        ELSE
			   axi_wstrb <= "00000001";
		        END IF;
                     ELSE
                        -- For all bursts
                        
                        IF ((AWVALID_xhdl6 AND AWREADY) = '1') THEN
		           --axi_wstrb <= ShiftLeft("00000001", to_integer(HADDR_sync(2 DOWNTO 0)));
                          IF ((HADDR_sync(2 DOWNTO 0)) = "111") THEN
			     axi_wstrb <= "10000000";
			  ELSIF ((HADDR_sync(2 DOWNTO 0)) = "110") THEN
			     axi_wstrb <= "01000000";
			  ELSIF ((HADDR_sync(2 DOWNTO 0)) = "101") THEN
			     axi_wstrb <= "00100000";
			  ELSIF ((HADDR_sync(2 DOWNTO 0)) = "100") THEN
			     axi_wstrb <= "00010000";
		  	  ELSIF ((HADDR_sync(2 DOWNTO 0)) = "011") THEN
			     axi_wstrb <= "00001000";
			  ELSIF ((HADDR_sync(2 DOWNTO 0)) = "010") THEN
			     axi_wstrb <= "00000100";
			  ELSIF ((HADDR_sync(2 DOWNTO 0)) = "001") THEN
			     axi_wstrb <= "00000010";
		          ELSE
			     axi_wstrb <= "00000001";
		          END IF;
                        ELSE
                           IF ((WVALID_xhdl11 AND WREADY) = '1') THEN
                              IF (axi_wstrb = "10000000") THEN
                                 axi_wstrb <= "00000001";    
                              ELSE
				 --axi_wstrb <= ShiftLeft(axi_wstrb, 1);   
		                 axi_wstrb <= axi_wstrb(6 DOWNTO 0) & '0';   
                              END IF;
                           END IF;
                        END IF;
                     END IF;
            -- For Single/Undef
            
            WHEN OTHERS  =>
                     axi_wstrb <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & 
                     '0';    
            
         END CASE;
      END IF;
   END PROCESS;

   PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         wrstb_count <= "00";    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         IF (WLAST_xhdl10 = '1') THEN
            wrstb_count <= "00";    
         ELSE
            IF ((wvalid_reg = '1') AND (axi_next_state = SEND_WR_DATA)) THEN
               wrstb_count <= wrstb_count + "01";    
            END IF;
         END IF;
      END IF;
   END PROCESS;

   -------------------------------------------------------------------------------
   -- Generate the address increment logic on AXI
   -- This is write data generation on the AXI interface
   -------------------------------------------------------------------------------
   
   PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         latch_ahb_sig_sync_d <= '0';    
         axi_wr_data_d <= (OTHERS => '0');    
         AWADDR_incr <= "000";    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         latch_ahb_sig_sync_d <= latch_ahb_sig_sync;    
         axi_wr_data_d <= axi_wr_data(AXI_DWIDTH - 1 DOWNTO 0);    
         IF ((AWVALID_xhdl6 AND AWREADY) = '1') THEN
            AWADDR_incr <= AWADDR_xhdl2(2 DOWNTO 0);    
         ELSE
            IF ((WVALID_xhdl11 AND WREADY) = '1') THEN
               IF ((HSIZE_sync(1 DOWNTO 0)) = "00") THEN	      
  	         AWADDR_incr <= AWADDR_incr + "001";    
	       ELSIF ((HSIZE_sync(1 DOWNTO 0)) = "01") THEN
	         AWADDR_incr <= AWADDR_incr + "010";    
               ELSE
	         AWADDR_incr <= AWADDR_incr + "100";    
	       END IF;
            END IF;
         END IF;
      END IF;
   END PROCESS;
   -------------------------------------------------------------------------------
   -- Create a sync pulse to trigger the AXI state machine when there is valid
   -- AHB command
   -------------------------------------------------------------------------------
   store_ahb_sig <= latch_ahb_sig_sync AND (NOT latch_ahb_sig_sync_d) ;

   -------------------------------------------------------------------------------
   -- Synchronize the AHB signals to AXI clock on store_ahb_sig signal
   -------------------------------------------------------------------------------
   
   ahb_to_axi_latch_logic : PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         HSEL_sync <= '0';    
         HADDR_sync <= (OTHERS => '0');    
         HWRITE_sync <= '0';    
         HREADY_sync <= '0';    
         HTRANS_sync <= "00";    
         HSIZE_sync <= "000";    
         HBURST_sync <= "000";    
         HMASTLOCK_sync <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         IF (store_ahb_sig = '1') THEN
            HSEL_sync <= HSEL;    
            HADDR_sync <= HADDR;    
            HWRITE_sync <= HWRITE;    
            HREADY_sync <= HREADY;    
            HTRANS_sync <= HTRANS;    
            HSIZE_sync <= HSIZE;    
            HBURST_sync <= HBURST;    
            HMASTLOCK_sync <= HMASTLOCK;    
         END IF;
      END IF;
   END PROCESS ahb_to_axi_latch_logic;
   
   L0: IF (UNDEF_BURST = 1) GENERATE
      undef_wr_burst_size_32 <= "0111" ;
      undef_wr_burst_size_64 <= "1111" ;
      undef_rd_burst_size_32 <= "1111" ;
      undef_rd_burst_size_64 <= "1111" ;
   END GENERATE L0;
   
   L1: IF (NOT(UNDEF_BURST = 1)) GENERATE
      undef_wr_burst_size_32 <= "0000" ;
      undef_wr_burst_size_64 <= "0000" ;
      undef_rd_burst_size_32 <= "0000" ;
      undef_rd_burst_size_64 <= "0000" ;
   END GENERATE L1;
   
   L2: IF (AHB_DWIDTH = 32) GENERATE
      -------------------------------------------------------------------------------
      -- Generate AXI Write channel Burst Length from HBURST and HSYNC
      -------------------------------------------------------------------------------
      
      PROCESS ( 
      HSIZE_sync, HADDR_sync, undef_wr_burst_size_32,  
      HBURST_sync)
      BEGIN
         IF (HSIZE_sync(1 DOWNTO 0) = "00") THEN
            CASE HBURST_sync(2 DOWNTO 0) IS
               WHEN "000" =>
                        axiwr_burst_length <= "0000";    
               WHEN "001" =>
                        axiwr_burst_length <= undef_wr_burst_size_32;    
               WHEN "010" =>
                        axiwr_burst_length <= "0011";    
               WHEN "011" =>
                        axiwr_burst_length <= "0011";    
               WHEN "100" =>
                        axiwr_burst_length <= "0111";    
               WHEN "101" =>
                        axiwr_burst_length <= "0111";    
               WHEN "110" =>
                        axiwr_burst_length <= "1111";    
               WHEN "111" =>
                        axiwr_burst_length <= "1111";    
               WHEN OTHERS =>
                        NULL;
               
            END CASE;
            -- case (HBURST_sync[2:0])
            
            
         -- if (HSIZE_sync[1:0] == 2'b00)
         
         ELSE
            IF (HSIZE_sync(1 DOWNTO 0) = "01") THEN
               CASE HBURST_sync(2 DOWNTO 0) IS
                  WHEN "000" =>
                           axiwr_burst_length <= "0000";    
                  WHEN "001" =>
                           axiwr_burst_length <= undef_wr_burst_size_32;    
                  WHEN "010" =>
                           axiwr_burst_length <= "0011";    
                  WHEN "011" =>
                           axiwr_burst_length <= "0011";    
                  WHEN "100" =>
                           axiwr_burst_length <= "0111";    
                  WHEN "101" =>
                           axiwr_burst_length <= "0111";    
                  WHEN "110" =>
                           axiwr_burst_length <= "1111";    
                  WHEN "111" =>
                           axiwr_burst_length <= "1111";    
                  WHEN OTHERS =>
                           NULL;
                  
               END CASE;
               -- case (HBURST_sync[2:0])
               
               
            -- if (HSIZE_sync[1:0] == 2'b01)     
            
            ELSE
               IF (HADDR_sync(2) = '0') THEN
                  CASE HBURST_sync(2 DOWNTO 0) IS
                     WHEN "000" =>
                              axiwr_burst_length <= "0000";    
                     WHEN "001" =>
                              axiwr_burst_length <= undef_wr_burst_size_32;    
                     WHEN "010" =>
                              axiwr_burst_length <= "0011";    
                     WHEN "011" =>
                              axiwr_burst_length <= "0001";    
                     WHEN "100" =>
                              axiwr_burst_length <= "0111";    
                     WHEN "101" =>
                              axiwr_burst_length <= "0011";    
                     WHEN "110" =>
                              axiwr_burst_length <= "1111";    
                     WHEN "111" =>
                              axiwr_burst_length <= "0111";    
                     WHEN OTHERS =>
                              NULL;
                     
                  END CASE;
                  -- case (HBURST_sync[2:0])
                  
                  
               -- if (HSIZE_sync[1:0] == 2'b01)
               
               ELSE
                  CASE HBURST_sync(2 DOWNTO 0) IS
                     WHEN "000" =>
                              axiwr_burst_length <= "0000";    
                     WHEN "001" =>
                              axiwr_burst_length <= undef_wr_burst_size_32;    
                     WHEN "010" =>
                              axiwr_burst_length <= "0011";    
                     WHEN "011" =>
                              axiwr_burst_length <= "0011";    
                     WHEN "100" =>
                              axiwr_burst_length <= "0111";    
                     WHEN "101" =>
                              axiwr_burst_length <= "0111";    
                     WHEN "110" =>
                              axiwr_burst_length <= "1111";    
                     WHEN "111" =>
                              axiwr_burst_length <= "1111";    
                     WHEN OTHERS =>
                              NULL;
                     
                  END CASE;
                  -- case (HBURST_sync[2:0])
                  
                  
               END IF;
            END IF;
         END IF;
         -- else: !if(HSIZE_sync[1:0] == 2'b10)     
         
         
      END PROCESS;
   END GENERATE L2;
   
   L3: IF (NOT(AHB_DWIDTH = 32)) GENERATE
      -- always @ (*)   
      -- block: axiwr_burst_length_ahb32   
      
      PROCESS (undef_wr_burst_size_64, HBURST_sync)
      BEGIN
         CASE HBURST_sync(2 DOWNTO 0) IS
            WHEN "000" =>
                     axiwr_burst_length <= "0000";    
            WHEN "001" =>
                     axiwr_burst_length <= undef_wr_burst_size_64;    
            WHEN "010" =>
                     axiwr_burst_length <= "0011";    
            WHEN "011" =>
                     axiwr_burst_length <= "0011";    
            WHEN "100" =>
                     axiwr_burst_length <= "0111";    
            WHEN "101" =>
                     axiwr_burst_length <= "0111";    
            WHEN "110" =>
                     axiwr_burst_length <= "1111";    
            WHEN "111" =>
                     axiwr_burst_length <= "1111";    
            WHEN OTHERS =>
                     NULL;
            
         END CASE;
         -- case (HBURST_sync[2:0])
         
         
      END PROCESS;
   END GENERATE L3;
   
   L4: IF (AHB_DWIDTH = 32) GENERATE
      -------------------------------------------------------------------------------
      -- Generate AXI Read channel Burst Length from HBURST and HSYNC
      -------------------------------------------------------------------------------
      
      PROCESS (undef_rd_burst_size_32, HBURST_sync)
      BEGIN
         -- orig
         
         CASE HBURST_sync(2 DOWNTO 0) IS
            WHEN "000" =>
                     axird_burst_length <= "0000";    
            WHEN "001" =>
                     axird_burst_length <= undef_rd_burst_size_32;    
            WHEN "010" =>
                     axird_burst_length <= "0011";    
            WHEN "011" =>
                     axird_burst_length <= "0011";    
            WHEN "100" =>
                     axird_burst_length <= "0111";    
            WHEN "101" =>
                     axird_burst_length <= "0111";    
            WHEN "110" =>
                     axird_burst_length <= "1111";    
            WHEN "111" =>
                     axird_burst_length <= "1111";    
            WHEN OTHERS =>
                     NULL;
            
         END CASE;
      END PROCESS;
   END GENERATE L4;
   
   L5: IF (NOT(AHB_DWIDTH = 32)) GENERATE
      -- always @ (*)   
      
      PROCESS (undef_rd_burst_size_64, HBURST_sync)
      BEGIN
         CASE HBURST_sync(2 DOWNTO 0) IS
            WHEN "000" =>
                     axird_burst_length <= "0000";    
            WHEN "001" =>
                     axird_burst_length <= undef_rd_burst_size_64;    
            WHEN "010" =>
                     axird_burst_length <= "0011";    
            WHEN "011" =>
                     axird_burst_length <= "0011";    
            WHEN "100" =>
                     axird_burst_length <= "0111";    
            WHEN "101" =>
                     axird_burst_length <= "0111";    
            WHEN "110" =>
                     axird_burst_length <= "1111";    
            WHEN "111" =>
                     axird_burst_length <= "1111";    
            WHEN OTHERS =>
                     NULL;
            
         END CASE;
      END PROCESS;
   END GENERATE L5;

   -------------------------------------------------------------------------------
   -- Extract AXI Burst type from HBURST
   -------------------------------------------------------------------------------
   
   PROCESS (HBURST_sync)
   BEGIN
      CASE HBURST_sync(2 DOWNTO 0) IS
         WHEN "000" =>
                  axi_burst_type <= "01";    
         WHEN "001" =>
                  axi_burst_type <= "01";    
         WHEN "010" =>
                  axi_burst_type <= "10";    
         WHEN "011" =>
                  axi_burst_type <= "01";    
         WHEN "100" =>
                  axi_burst_type <= "10";    
         WHEN "101" =>
                  axi_burst_type <= "01";    
         WHEN "110" =>
                  axi_burst_type <= "10";    
         WHEN "111" =>
                  axi_burst_type <= "01";    
         WHEN OTHERS =>
                  NULL;
         
      END CASE;
   END PROCESS;

   -------------------------------------------------------------------------------
   -- Synchronize burst count value received from the AHB Access Control logic
   -- This is used for for loading the initial value in burstcount_reg signal
   -------------------------------------------------------------------------------
   
   sync_ahb_2_axi : PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         burst_count_r_sync <= "0000";    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         IF (burst_count_valid_sync = '1') THEN
            burst_count_r_sync <= burst_count_r(3 DOWNTO 0);    
         END IF;
      END IF;
   END PROCESS sync_ahb_2_axi;

   PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         awaddr_awvalid_clr_d <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         awaddr_awvalid_clr_d <= awaddr_awvalid_clr;
      END IF;
   END PROCESS;

   PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         araddr_arvalid_clr_d <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         araddr_arvalid_clr_d <= araddr_arvalid_clr;    
      END IF;
   END PROCESS;

   --*****************************************************************//
   --                  Write  Data Channel                            //
   --*****************************************************************//
   -------------------------------------------------------------------------------
   -- Latch AHB signals into AXI domain on synchronised control signal
   -------------------------------------------------------------------------------
   WDATA_xhdl8 <= axi_wrdata(AXI_DWIDTH - 1 DOWNTO 0) ;
   WSTRB_xhdl9 <= axi_wstrb ;
   WID_xhdl7 <= "0000" ;
   WLAST_xhdl10 <= wvalid_clr ;

   PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         WREADY_reg <= '0';    
         wvalid_reg_r <= '0';    
         wvalid_clr_r <= '0';    
         axi_wr_data_lat <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         WREADY_reg <= WREADY;    
         wvalid_reg_r <= wvalid_reg;    
         wvalid_clr_r <= wvalid_clr;    
         axi_wr_data_lat <= axi_wrdata;    
      END IF;
   END PROCESS;

   PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         wvalid_set_r <= '0';    
         wvalid_set_r1 <= '0';    
         burstcount_reg_r <= "00000";    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         wvalid_set_r <= wvalid_set AND NOT wvalid_reg;    
         wvalid_set_r1 <= wvalid_set_r;    
         burstcount_reg_r <= burstcount_reg;    
      END IF;
   END PROCESS;

   -------------------------------------------------------------------------------
   -- The logic is used to de-assert the WVALID
   -------------------------------------------------------------------------------
   
   PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         wvalid_clr_t <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         IF (axi_current_state = SEND_WR_DATA AND wvalid_clr = '1') THEN
            wvalid_clr_t <= '1';    
         ELSE
            wvalid_clr_t <= '0';    
         END IF;
      END IF;
   END PROCESS;
   temp_xhdl42 <= ((NOT wvalid_clr AND wvalid_reg) AND 
   CONV_STD_LOGIC(axi_next_state = SEND_WR_DATA)) WHEN WREADY = '1' ELSE 
   wvalid_reg;

   -------------------------------------------------------------------------------
   -- Generation of WVALID signal
   -- wvalid_set asserts the WVALID and wvalid_clr signal de-asserts it.
   -------------------------------------------------------------------------------
   
   PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         WVALID_xhdl11 <= '0';    
         wvalid_reg <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         IF (wvalid_clr = '1' AND WREADY = '1') THEN
            wvalid_reg <= '0';    
         ELSE
            IF (wvalid_set = '1' AND wvalid_clr_t = '0') THEN
               wvalid_reg <= '1';    
            END IF;
         END IF;
         WVALID_xhdl11 <= temp_xhdl42;    
      END IF;
   END PROCESS;

   --*****************************************************************//
   --                  Write  Address Channel                         //
   --*****************************************************************//
   -------------------------------------------------------------------------------
   -- Write address channel generation
   -------------------------------------------------------------------------------
AWVALID_xhdl6 <= '0' WHEN awaddr_awvalid_clr_d = '1' ELSE AWVALID_xhdl6_int;
AWVALID_xhdl6_int <= '1' WHEN awaddr_awvalid_set = '1' ELSE '0';
PROCESS (HADDR_sync, axiwr_burst_length(3 DOWNTO 0), axi_burst_type(1 DOWNTO 0), HMASTLOCK_sync, HBURST_sync(2 DOWNTO 0), HSIZE_sync(2 DOWNTO 0))
   BEGIN
               AWADDR_xhdl2 <= HADDR_sync(AXI_AWIDTH - 1 DOWNTO 0);    
               AWID_xhdl1 <= "0000";    
               AWLEN_xhdl3 <= axiwr_burst_length(3 DOWNTO 0);    
               AWBURST_xhdl5 <= axi_burst_type(1 DOWNTO 0);    
               AWLOCK_xhdl21 <= HMASTLOCK_sync & '0';    
               IF (HBURST_sync(2 DOWNTO 0) = "000" OR HBURST_sync(2 DOWNTO 0) = 
               "001") THEN
                  AWSIZE_xhdl4 <= HSIZE_sync(2 DOWNTO 0);    
               ELSE
                  -- For all bursts
                  
                  IF (HBURST_sync(0) = '1') THEN
                     -- For incr
                     
                     IF (HADDR_sync(2) = '0') THEN
                        -- 30/01/13 added to check whether address starts from '4
                        
                        CASE HSIZE_sync(1 DOWNTO 0) IS
                           WHEN "00" =>
                                    AWSIZE_xhdl4 <= "000";    --  1 bytes in one transfer
                           WHEN "01" =>
                                    AWSIZE_xhdl4 <= "001";    --  2 bytes in one transfer
                           WHEN "10" =>
                                    AWSIZE_xhdl4 <= "011";    --  8 bytes in one transfer
                           WHEN "11" =>
                                    AWSIZE_xhdl4 <= "011";    
                           WHEN OTHERS  =>
                                    AWSIZE_xhdl4 <= "011";    
                           
                        END CASE;
                        -- case (HSIZE_sync[1:0])
                        
                        
                     ELSE
                        CASE HSIZE_sync(1 DOWNTO 0) IS
                           WHEN "00" =>
                                    AWSIZE_xhdl4 <= "000";    --  1 bytes in one transfer
                           WHEN "01" =>
                                    AWSIZE_xhdl4 <= "001";    --  2 bytes in one transfer
                           WHEN "10" =>
                                    AWSIZE_xhdl4 <= "010";    --  4 bytes in one transfer
                           WHEN "11" =>
                                    AWSIZE_xhdl4 <= "011";    
                           WHEN OTHERS  =>
                                    AWSIZE_xhdl4 <= "011";    
                           
                        END CASE;
                        -- case (HSIZE_sync[1:0])
                        
                        
                     END IF;
                  ELSE
                     -- For wrap
                     
                     CASE HSIZE_sync(1 DOWNTO 0) IS
                        WHEN "00" =>
                                 AWSIZE_xhdl4 <= "000";    --  1 bytes in one transfer
                        WHEN "01" =>
                                 AWSIZE_xhdl4 <= "001";    --  2 bytes in one transfer
                        WHEN "10" =>
                                 AWSIZE_xhdl4 <= "010";    --  4 bytes in one transfer
                        WHEN "11" =>
                                 AWSIZE_xhdl4 <= "011";    
                        WHEN OTHERS  =>
                                 AWSIZE_xhdl4 <= "011";    
                        
                     END CASE;
                     -- case (HSIZE_sync[1:0])
                     
                     
                  END IF;
               END IF;
   END PROCESS;
   temp_xhdl43 <= ShiftRight(burst_count_r_sync(3 DOWNTO 0), 1) WHEN (HADDR_sync(2) = 
   '0') ELSE burst_count_r_sync(3 DOWNTO 0);

   -------------------------------------------------------------------------------
   -- burstcount_reg holds the burst count value
   -- The count value is decremented on the burstcount_dec assertion
   -------------------------------------------------------------------------------
   
   PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         burstcount_reg <= "00000";    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         -- Load the burst count value
         
         IF (burstcount_load = '1') THEN
            IF ((HSIZE_sync(1 DOWNTO 0) = "00" AND HBURST_sync /= "000") AND 
            HBURST_sync /= "001") THEN
               -- Byte bursts
               
               IF (HBURST_sync(0) = '1') THEN
                  -- incr
                  
                  burstcount_reg <= "00001" + (burst_count_r_sync(3 DOWNTO 0)); 
               ELSE
                  -- wrap
                  
                  burstcount_reg <= "0" & burst_count_r_sync(3 DOWNTO 0);    
               END IF;
            ELSE
               IF ((HSIZE_sync(1 DOWNTO 0) = "01" AND HBURST_sync /= "000") AND 
               HBURST_sync /= "001") THEN
                  -- HW bursts
                  
                  burstcount_reg <= "00001" + (burst_count_r_sync(3 DOWNTO 0)); 
               ELSE
                  IF ((HSIZE_sync(1 DOWNTO 0) = "10" AND HBURST_sync /= "000") 
                  AND HBURST_sync /= "001") THEN
                     -- Word bursts
                     
                     IF (HBURST_sync(0) = '1') THEN
                        burstcount_reg <= "00001" + (temp_xhdl43);    
                     ELSE
                        -- wrap
                        
                        burstcount_reg <= "0" & burst_count_r_sync(3 DOWNTO 0); 
                     END IF;
                  ELSE
                     IF (HSIZE_sync(1 DOWNTO 0) = "10" AND HBURST_sync = "001") THEN
                        -- Word undef 
                        
                        burstcount_reg <= "00001" + ShiftRight(burst_count_r_sync(3 DOWNTO 0), 1);    
                     ELSE
                        -- Single
                        
                        burstcount_reg <= "00001" + ShiftRight(burst_count_r_sync(3 DOWNTO 0), 1);    
                     END IF;
                  END IF;
               END IF;
            END IF;
         ELSE
            IF (burstcount_dec = '1') THEN
               burstcount_reg <= burstcount_reg - "00001";    
            END IF;
         END IF;
      END IF;
   END PROCESS;
   --*****************************************************************//
   --                  Write Response Channel                         //
   --*****************************************************************//
   -------------------------------------------------------------------------------
   -- Generation of BREADY write response ready signal
   -- BREADY is always asserted
   -------------------------------------------------------------------------------
   BREADY_xhdl12 <= '1' ;
   BRESP_sync_xhdl23 <= latch_wr_resp(1 DOWNTO 0) ;

   -------------------------------------------------------------------------------
   -- Latch the write response received on the response channel
   -------------------------------------------------------------------------------
   
   PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         latch_wr_resp <= "00";    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         -- write response
         
         IF (latch_wr_resp_set = '1') THEN
            latch_wr_resp(1 DOWNTO 0) <= BRESP(1 DOWNTO 0);    
         END IF;
      END IF;
      -- else: !if(ARESETn == 1'b0)
      
      
   END PROCESS;

   -- always @ (posedge ACLK or negedge ARESETn)
   
   PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         BVALID_reg <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         BVALID_reg <= BVALID;    
      END IF;
   END PROCESS;

   --*****************************************************************//
   --                  Read Address Channel                           //
   --*****************************************************************//
   -------------------------------------------------------------------------------
   -- AXI Read Address channel generation
   -------------------------------------------------------------------------------
ARVALID_xhdl19 <= '0' WHEN araddr_arvalid_clr_d = '1' ELSE ARVALID_xhdl19_int; 
ARVALID_xhdl19_int <= '1' WHEN araddr_arvalid_set = '1' ELSE '0'; 
 
   PROCESS (HADDR_sync, axird_burst_length(3 DOWNTO 0),
            HSIZE_sync(2 DOWNTO 0), axi_burst_type(1 DOWNTO 0), HMASTLOCK_sync)
   BEGIN
      ARADDR_xhdl14 <= HADDR_sync(AXI_AWIDTH - 1 DOWNTO 0);    
      ARID_xhdl13 <= "0000";    
      ARLEN_xhdl15 <= axird_burst_length(3 DOWNTO 0);    
      ARSIZE_xhdl16 <= HSIZE_sync(2 DOWNTO 0);    
      ARBURST_xhdl17 <= axi_burst_type(1 DOWNTO 0);    
      ARLOCK_xhdl18 <= HMASTLOCK_sync & '0';    
   END PROCESS;

   -------------------------------------------------------------------------------
   -- Generation of write enable to RDCHANNEL fifo
   -------------------------------------------------------------------------------
   
   PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         ahb_rd_req_sync_d <= '0';    
         rdch_fifo_wr_en_r_xhdl24 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         ahb_rd_req_sync_d <= ahb_rd_req_sync;    
         rdch_fifo_wr_en_r_xhdl24 <= axi_read_data;    
      END IF;
   END PROCESS;

   --*****************************************************************//
   --                  Read Data Channel                              //
   --*****************************************************************//
   -------------------------------------------------------------------------------
   -- Generation of RREADY 
   -------------------------------------------------------------------------------
   
   PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         RREADY_xhdl20 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         IF (rready_set = '1') THEN
            RREADY_xhdl20 <= '1';    
         ELSE
            RREADY_xhdl20 <= '0';    
         END IF;
      END IF;
   END PROCESS;
   rd_haddr <= HADDR_sync ;

   -------------------------------------------------------------------------------
   -- Latch the incoming read data from the AXI Read data channel 
   -------------------------------------------------------------------------------
   
   PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         rdch_write_data_r <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         IF (axi_read_data = '1') THEN
            rdch_write_data_r(AXI_DWIDTH - 1 DOWNTO 0) <= RDATA(AXI_DWIDTH - 1 
            DOWNTO 0);    
         END IF;
      END IF;
   END PROCESS;
   temp_xhdl45 <= rdch_write_data_r(31 DOWNTO 0) WHEN (swap_rd_data_byte(0) = 
   '1') ELSE rdch_write_data_r(63 DOWNTO 32);
   temp_xhdl46 <= rdch_write_data_r(63 DOWNTO 32) WHEN (swap_rd_data_byte(0) = 
   '1') ELSE rdch_write_data_r(31 DOWNTO 0);
   temp_xhdl47 <= rdch_write_data_r(31 DOWNTO 0) WHEN ((swap_rd_data_byte(1 
   DOWNTO 0) = "01") OR (swap_rd_data_byte(1 DOWNTO 0) = "10")) ELSE 
   rdch_write_data_r(63 DOWNTO 32);
   temp_xhdl48 <= rdch_write_data_r(31 DOWNTO 0) WHEN ((swap_rd_data_byte(1 
   DOWNTO 0) = "11") OR (swap_rd_data_byte(1 DOWNTO 0) = "10")) ELSE 
   rdch_write_data_r(63 DOWNTO 32);
   temp_xhdl49 <= rdch_write_data_r(63 DOWNTO 32) WHEN ((swap_rd_data_byte(1 
   DOWNTO 0) = "01") OR (swap_rd_data_byte(1 DOWNTO 0) = "10")) ELSE 
   rdch_write_data_r(31 DOWNTO 0);
   temp_xhdl50 <= rdch_write_data_r(63 DOWNTO 32) WHEN ((swap_rd_data_byte(1 
   DOWNTO 0) = "11") OR (swap_rd_data_byte(1 DOWNTO 0) = "10")) ELSE 
   rdch_write_data_r(31 DOWNTO 0);
   temp_xhdl51 <= rdch_write_data_r(31 DOWNTO 0) WHEN ((swap_rd_data_byte(2 
   DOWNTO 0) = "001") OR (swap_rd_data_byte(2 DOWNTO 0) = "010") OR 
   (swap_rd_data_byte(2 DOWNTO 0) = "011") OR (swap_rd_data_byte(2 DOWNTO 0) = 
   "000")) ELSE rdch_write_data_r(63 DOWNTO 32);
   temp_xhdl52 <= rdch_write_data_r(63 DOWNTO 32) WHEN ((swap_rd_data_byte(2 
   DOWNTO 0) = "101") OR (swap_rd_data_byte(2 DOWNTO 0) = "110") OR 
   (swap_rd_data_byte(2 DOWNTO 0) = "111") OR (swap_rd_data_byte(2 DOWNTO 0) = 
   "100")) ELSE rdch_write_data_r(31 DOWNTO 0);
   temp_xhdl53 <= rdch_write_data_r(31 DOWNTO 0) WHEN ((swap_rd_data_byte(3 
   DOWNTO 0) = "0001") OR (swap_rd_data_byte(3 DOWNTO 0) = "0010") OR 
   (swap_rd_data_byte(3 DOWNTO 0) = "1001") OR (swap_rd_data_byte(3 DOWNTO 0) = 
   "1010") OR (swap_rd_data_byte(3 DOWNTO 0) = "1011") OR (swap_rd_data_byte(3 
   DOWNTO 0) = "1100") OR (swap_rd_data_byte(3 DOWNTO 0) = "0011") OR 
   (swap_rd_data_byte(3 DOWNTO 0) = "0100")) ELSE rdch_write_data_r(63 DOWNTO 
   32);
   temp_xhdl54 <= rdch_write_data_r(63 DOWNTO 32) WHEN ((swap_rd_data_byte(3 
   DOWNTO 0) = "1000") OR (swap_rd_data_byte(3 DOWNTO 0) = "0101") OR 
   (swap_rd_data_byte(3 DOWNTO 0) = "1101") OR (swap_rd_data_byte(3 DOWNTO 0) = 
   "1110") OR (swap_rd_data_byte(3 DOWNTO 0) = "1111") OR (swap_rd_data_byte(3 
   DOWNTO 0) = "0000") OR (swap_rd_data_byte(3 DOWNTO 0) = "0110") OR 
   (swap_rd_data_byte(3 DOWNTO 0) = "0111")) ELSE rdch_write_data_r(31 DOWNTO 0)
   ;

   PROCESS (rdch_write_data_r, HSIZE_sync, HBURST_sync, temp_xhdl45, rd_haddr, 
          temp_xhdl46, temp_xhdl47, temp_xhdl48, temp_xhdl49, temp_xhdl50, temp_xhdl51, temp_xhdl52, temp_xhdl53,temp_xhdl54
   )
      VARIABLE rd_data_c_xhdl44  : std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0);
   BEGIN
      CASE HSIZE_sync(1 DOWNTO 0) IS
         WHEN "11" =>
                  rd_data_c_xhdl44 := rdch_write_data_r(AXI_DWIDTH - 1 DOWNTO 0)
                  (31 DOWNTO 0);    
         WHEN "10" =>
                  IF (HBURST_sync(2 DOWNTO 0) = "000" OR HBURST_sync(2 DOWNTO 0)
                  = "001") THEN
                     -- For Single/undef
                     
                     IF (rd_haddr(2 DOWNTO 0) = "000") THEN
                        rd_data_c_xhdl44(31 DOWNTO 0) := rdch_write_data_r(31 
                        DOWNTO 0);    
                     ELSE
                        rd_data_c_xhdl44(31 DOWNTO 0) := rdch_write_data_r(63 
                        DOWNTO 32);    
                     END IF;
                  ELSE
                     -- For all other burst types
                     
                     IF (rd_haddr(2 DOWNTO 0) = "000") THEN
                        rd_data_c_xhdl44(31 DOWNTO 0) := temp_xhdl45;    
                     ELSE
                        rd_data_c_xhdl44(31 DOWNTO 0) := temp_xhdl46;    
                     END IF;
                  END IF;
                  -- else: !if(HBURST_sync[2:0] == 3'b000)
                  
                  
         WHEN "01" =>
                  IF (HBURST_sync(2 DOWNTO 0) = "000" OR HBURST_sync(2 DOWNTO 0)
                  = "001") THEN
                     -- For Single/undef
                     
                     IF (rd_haddr(2 DOWNTO 0) < "100") THEN
                        IF (rd_haddr(1 DOWNTO 0) = "00" OR rd_haddr(1 DOWNTO 0) 
                        = "10") THEN
                           rd_data_c_xhdl44(31 DOWNTO 0) := 
                           rdch_write_data_r(31 DOWNTO 0);    
                        ELSE
                           rd_data_c_xhdl44(31 DOWNTO 0) := 
                           rdch_write_data_r(63 DOWNTO 32);    
                        END IF;
                     ELSE
                        IF (rd_haddr(1 DOWNTO 0) = "00" OR rd_haddr(1 DOWNTO 0) 
                        = "10") THEN
                           rd_data_c_xhdl44(31 DOWNTO 0) := 
                           rdch_write_data_r(63 DOWNTO 32);    
                        ELSE
                           rd_data_c_xhdl44(31 DOWNTO 0) := 
                           rdch_write_data_r(31 DOWNTO 0);    
                        END IF;
                     END IF;
                     -- else: !if(rd_haddr[2:0] < 3'b100)
                     
                     
                  ELSE
                     -- For all other burst types
                     
                     IF (rd_haddr(2 DOWNTO 0) < "100") THEN
                        IF (rd_haddr(1 DOWNTO 0) = "00") THEN
                           rd_data_c_xhdl44(31 DOWNTO 0) := temp_xhdl47;    
                        ELSE
                           rd_data_c_xhdl44(31 DOWNTO 0) := temp_xhdl48;    
                        END IF;
                     ELSE
                        IF (rd_haddr(1 DOWNTO 0) = "00") THEN
                           rd_data_c_xhdl44(31 DOWNTO 0) := temp_xhdl49;    
                        ELSE
                           rd_data_c_xhdl44(31 DOWNTO 0) := temp_xhdl50;    
                        END IF;
                     END IF;
                     -- else: !if(rd_haddr[2:0] < 3'b100)
                     
                     
                  END IF;
                  -- else: !if(HBURST_sync[2:0] == 3'b000)
                  
                  
         WHEN "00" =>
                  IF (HBURST_sync(2 DOWNTO 0) = "000" OR HBURST_sync(2 DOWNTO 0)
                  = "001") THEN
                     -- For Single/undef
                     
                     IF (rd_haddr(2 DOWNTO 0) < "100") THEN
                        rd_data_c_xhdl44(31 DOWNTO 0) := temp_xhdl51;    
                     ELSE
                        rd_data_c_xhdl44(31 DOWNTO 0) := temp_xhdl52;    
                     END IF;
                  ELSE
                     -- For all other burst types
                     
                     IF (rd_haddr(2 DOWNTO 0) < "100") THEN
                        rd_data_c_xhdl44(31 DOWNTO 0) := temp_xhdl53;    
                     ELSE
                        rd_data_c_xhdl44(31 DOWNTO 0) := temp_xhdl54;    
                     END IF;
                  END IF;
         WHEN OTHERS  =>
                  rd_data_c_xhdl44 := (OTHERS => '0');    
         
      END CASE;
      rd_data_c <= rd_data_c_xhdl44;
   END PROCESS;

   PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         swap_rd_data_byte <= "0000";    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         IF (HBURST_sync(2 DOWNTO 0) = "000" OR HBURST_sync(2 DOWNTO 0) = "001")
         THEN
            swap_rd_data_byte <= '0' & HADDR_sync(2 DOWNTO 0);    
         ELSE
            IF ((ARREADY AND ARVALID_xhdl19) = '1') THEN
               swap_rd_data_byte <= '0' & ARADDR_xhdl14(2 DOWNTO 0);    
            ELSE
               IF ((RREADY_xhdl20 AND RVALID) = '1') THEN
                  swap_rd_data_byte <= swap_rd_data_byte + "0001";    
               END IF;
            END IF;
         END IF;
      END IF;
   END PROCESS;
   -------------------------------------------------------------------------------
   -- Write data to RDCHANNEL fifo
   -- The data is the Read data from AXI Read data channel
   -------------------------------------------------------------------------------
   rdch_fifo_wr_data_xhdl25 <= rd_data_c ;

   -------------------------------------------------------------------------------
   -- Generate start signal for read channel fifo to enable read from AHB side
   -------------------------------------------------------------------------------
   
   gen_start_for_rdch_read : PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         axi_read_rlast_xhdl26 <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         axi_read_rlast_xhdl26 <= (RLAST AND RVALID) AND RREADY_xhdl20;    
      END IF;
   END PROCESS gen_start_for_rdch_read;
   -------------------------------------------------------------------------------
   -- Invokes the AXI State machine on ahb_rd_req coming from the AHB Access Ctrl
   -------------------------------------------------------------------------------
   axi_rd_start <= NOT ahb_rd_req_sync AND ahb_rd_req_sync_d ;

   -------------------------------------------------------------------------------
   -- Sequential block for State Machine
   -------------------------------------------------------------------------------
   
   axi_state_machine_seq_logic : PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         axi_current_state <= IDLE;    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         axi_current_state <= axi_next_state;    
      END IF;
   END PROCESS axi_state_machine_seq_logic;
   temp_xhdl70 <= burstcount_reg(0) WHEN (HSIZE_sync(1 DOWNTO 0) = "00") ELSE 
   '1';

   -------------------------------------------------------------------------------
   -- Combinational block for State Machine
   -------------------------------------------------------------------------------
   
   axi_state_machine_combo_logic : PROCESS (axi_current_state,  
   HSIZE_sync, RVALID, ahb_wr_done_sync, RREADY_xhdl20,  
   HADDR_sync, AWREADY, RLAST, wvalid_reg_r, axi_next_state, ARREADY, 
   BREADY_xhdl12,  
   BVALID_reg, wvalid_set_r, HWRITE_sync, 
   HBURST_sync, WREADY, 
   burstcount_reg, RRESP, wvalid_set_r1, temp_xhdl70,
   wvalid_reg, axi_rd_start)
      VARIABLE axi_next_state_xhdl55  : std_logic_vector(2 DOWNTO 0);
      VARIABLE awaddr_awvalid_set_xhdl56  : std_logic;
      VARIABLE araddr_arvalid_set_xhdl57  : std_logic;
      VARIABLE awaddr_awvalid_clr_xhdl58  : std_logic;
      VARIABLE araddr_arvalid_clr_xhdl59  : std_logic;
      VARIABLE wvalid_set_xhdl60  : std_logic;
      VARIABLE wvalid_clr_xhdl61  : std_logic;
      VARIABLE bready_set_xhdl62  : std_logic;
      VARIABLE burstcount_load_xhdl63  : std_logic;
      VARIABLE burstcount_dec_xhdl64  : std_logic;
      VARIABLE WRCH_fifo_rd_en_xhdl22_xhdl65  : std_logic;
      VARIABLE latch_wr_resp_set_xhdl66  : std_logic;
      VARIABLE axi_read_resp_xhdl67  : std_logic_vector(1 DOWNTO 0);
      VARIABLE axi_read_data_xhdl68  : std_logic;
      VARIABLE rready_set_xhdl69  : std_logic;
   BEGIN
      axi_next_state_xhdl55 := axi_current_state;    
      awaddr_awvalid_set_xhdl56 := '0';    
      araddr_arvalid_set_xhdl57 := '0';    
      awaddr_awvalid_clr_xhdl58 := '0';    
      araddr_arvalid_clr_xhdl59 := '0';    
      wvalid_set_xhdl60 := '0';    
      wvalid_clr_xhdl61 := '0';    
      bready_set_xhdl62 := '0';    
      burstcount_load_xhdl63 := '0';    
      burstcount_dec_xhdl64 := '0';    
      WRCH_fifo_rd_en_xhdl22_xhdl65 := '0';    
      latch_wr_resp_set_xhdl66 := '0';    
      axi_read_resp_xhdl67(1 DOWNTO 0) := "00";    
      axi_read_data_xhdl68 := '0';    
      rready_set_xhdl69 := '0';    
      CASE axi_current_state IS
         -----------------------------------------
         -- IDLE STATE
         -----------------------------------------
         
         WHEN IDLE =>
                  IF (ahb_wr_done_sync = '1') THEN
                     axi_next_state_xhdl55 := SEND_WR_ADDR;    
                  ELSE
                     IF (axi_rd_start = '1') THEN
                        axi_next_state_xhdl55 := SEND_RD_ADDR;    
                     END IF;
                  END IF;
         ---------------------------------------------
         -- SEND WRITE ADDRESS AND CONTROL ON AXI BUS
         ---------------------------------------------
         
         WHEN SEND_WR_ADDR =>
                  awaddr_awvalid_set_xhdl56 := '1';    
                  burstcount_load_xhdl63 := '1';    
                  IF (AWREADY = '1') THEN
                     awaddr_awvalid_clr_xhdl58 := '1';    
                     CASE HWRITE_sync IS
                        WHEN WRITE_C =>
                                 axi_next_state_xhdl55 := SEND_WR_DATA;    
                        WHEN READ_C =>
                                 axi_next_state_xhdl55 := READ_RD_DATA;    
                        WHEN OTHERS =>
                                 NULL;
                        
                     END CASE;
                  ELSE
                     awaddr_awvalid_clr_xhdl58 := '0';    
                  END IF;
         WHEN SEND_WR_DATA =>
                  burstcount_load_xhdl63 := '0';    
                  bready_set_xhdl62 := '1';    
                  wvalid_set_xhdl60 := '1';    
                  IF (HBURST_sync = "000") THEN
                     -- All Single
                     
                     --IF (wvalid_reg_r = '1' AND WREADY = '1') THEN
                     IF (wvalid_reg_r = '1' AND wvalid_reg = '1') THEN --SAR#57250 - WREADY condition added
                        wvalid_clr_xhdl61 := '1';    
                     ELSE
                        wvalid_clr_xhdl61 := '0';    
                     END IF;
                     IF (burstcount_reg = "00000") THEN
                        -- Last burst count
                        
                        axi_next_state_xhdl55 := READ_WR_RESP;    
                     ELSE
                        -- Not a last burst count
                        
                        IF (wvalid_reg = '1' AND wvalid_set_r = '1') THEN
                           WRCH_fifo_rd_en_xhdl22_xhdl65 := temp_xhdl70;    
                        ELSE
                           WRCH_fifo_rd_en_xhdl22_xhdl65 := '0';    
                        END IF;
                        IF (wvalid_reg_r = '1' AND WREADY = '1') THEN --SAR#57250 - WREADY condition added
                           burstcount_dec_xhdl64 := '1';    
                        ELSE
                           burstcount_dec_xhdl64 := '0';    
                        END IF;
                     END IF;
                  -- For word undef
                  
                  ELSE
                     IF (HBURST_sync = "001" AND HSIZE_sync(1 DOWNTO 0) = "10") 
                     THEN
                        IF (burstcount_reg = "00000") THEN
                           IF (wvalid_reg = '1') THEN
                              wvalid_clr_xhdl61 := '1';    
                           ELSE
                              wvalid_clr_xhdl61 := '0';    
                           END IF;
                           IF (wvalid_reg = '1' AND WREADY = '1') THEN
                              axi_next_state_xhdl55 := READ_WR_RESP;    
                           END IF;
                        ELSE
                           -- Not a last burst count
                           
                           IF ((WREADY AND wvalid_reg) = '1') THEN
                              burstcount_dec_xhdl64 := '1';    
                              WRCH_fifo_rd_en_xhdl22_xhdl65 := '1';    
                           ELSE
                              burstcount_dec_xhdl64 := '0';    
                              WRCH_fifo_rd_en_xhdl22_xhdl65 := '0';    
                           END IF;
                        END IF;
                     -- For Halfword undef
                     
                     ELSE
                        IF (HBURST_sync = "001" AND HSIZE_sync(1 DOWNTO 0) = 
                        "01") THEN
                           IF (burstcount_reg = "00000") THEN
                              IF (wvalid_reg = '1') THEN
                                 wvalid_clr_xhdl61 := '1';    
                              ELSE
                                 wvalid_clr_xhdl61 := '0';    
                              END IF;
                              IF (wvalid_reg = '1' AND WREADY = '1') THEN
                                 axi_next_state_xhdl55 := READ_WR_RESP;    
                              END IF;
                           ELSE
                              -- Not a last burst count
                              
                              IF ((WREADY AND wvalid_reg) = '1') THEN
                                 burstcount_dec_xhdl64 := '1';    
                                 WRCH_fifo_rd_en_xhdl22_xhdl65 := '1';    
                              ELSE
                                 burstcount_dec_xhdl64 := '0';    
                                 WRCH_fifo_rd_en_xhdl22_xhdl65 := '0';    
                              END IF;
                           END IF;
                        -- For Byte undef
                        
                        ELSE
                           IF (HBURST_sync = "001" AND HSIZE_sync(1 DOWNTO 0) = 
                           "00") THEN
                              IF (burstcount_reg = "00000") THEN
                                 IF (wvalid_reg = '1') THEN
                                    wvalid_clr_xhdl61 := '1';    
                                 ELSE
                                    wvalid_clr_xhdl61 := '0';    
                                 END IF;
                                 IF (wvalid_reg = '1' AND WREADY = '1') THEN
                                    axi_next_state_xhdl55 := READ_WR_RESP;    
                                 END IF;
                              ELSE
                                 -- Not a last burst count
                                 
                                 IF ((WREADY AND wvalid_reg) = '1') THEN
                                    burstcount_dec_xhdl64 := '1';    
                                    WRCH_fifo_rd_en_xhdl22_xhdl65 := '1';    
                                 ELSE
                                    burstcount_dec_xhdl64 := '0';    
                                    WRCH_fifo_rd_en_xhdl22_xhdl65 := '0';    
                                 END IF;
                              END IF;
                           ELSE
                              -- All Bursts
                              
                              IF (burstcount_reg = "00000") THEN
                                 IF (wvalid_reg = '1') THEN
                                    wvalid_clr_xhdl61 := '1';    
                                 ELSE
                                    wvalid_clr_xhdl61 := '0';    
                                 END IF;
                                 IF (wvalid_reg = '1' AND WREADY = '1') THEN
                                    axi_next_state_xhdl55 := READ_WR_RESP;    
                                 END IF;
                              ELSE
                                 -- Not a last burst count
                                 
                                 IF (HBURST_sync(0) = '1') THEN
                                    -- incr bursts
                                    
                                    IF ((WREADY AND wvalid_reg) = '1') THEN
                                       burstcount_dec_xhdl64 := '1';    
                                       IF (HSIZE_sync(1 DOWNTO 0) = "00" OR 
                                       HSIZE_sync(1 DOWNTO 0) = "01") THEN
                                          -- 30/01/13 - check whether start addr = '4
                                          
                                          WRCH_fifo_rd_en_xhdl22_xhdl65 := NOT 
                                          burstcount_reg(0);    
                                       ELSE
                                          IF (HSIZE_sync(1 DOWNTO 0) = "10" AND 
                                          HADDR_sync(2) = '1') THEN
                                             -- 30/01/13 - check whether start addr = '4
                                             
                                             WRCH_fifo_rd_en_xhdl22_xhdl65 := 
                                             NOT burstcount_reg(0);    
                                          --                       else if (HADDR_sync[2] == 1'b0 && HSIZE_sync[1:0] == 2'b10) begin  // 30/01/13 - check whether start addr = '4
                                          
                                          ELSE
                                             -- 30/01/13 - check whether start addr = '4
                                             
                                             WRCH_fifo_rd_en_xhdl22_xhdl65 := 
                                             '1';    
                                          END IF;
                                       END IF;
                                    ELSE
                                       burstcount_dec_xhdl64 := '0';    
                                       WRCH_fifo_rd_en_xhdl22_xhdl65 := '0';    
                                    END IF;
                                 ELSE
                                    -- wrap bursts
                                    
                                    IF (((WREADY AND wvalid_reg) AND NOT 
                                    wvalid_set_r1) = '1') THEN
                                       burstcount_dec_xhdl64 := '1';    
                                    ELSE
                                       burstcount_dec_xhdl64 := '0';    
                                    END IF;
                                    IF ((wvalid_set_r OR ((NOT burstcount_reg(0)
                                    AND WREADY) AND NOT wvalid_set_r1)) = '1') 
                                    THEN
                                       -- wrap
                                       
                                       WRCH_fifo_rd_en_xhdl22_xhdl65 := '1';    
                                    ELSE
                                       WRCH_fifo_rd_en_xhdl22_xhdl65 := '0';    
                                    END IF;
                                 END IF;
                                 -- else: !if(HBURST_sync[0] == 1'b1)
                                 
                                 
                              END IF;
                           END IF;
                        END IF;
                     END IF;
                  END IF;
         ---------------------------------------------
         -- GET WRITE RESPONSE FROM AXI SLAVE
         ---------------------------------------------
         
         WHEN READ_WR_RESP =>
                  IF ((BVALID_reg = '1') AND (BREADY_xhdl12 = '1')) THEN
                     latch_wr_resp_set_xhdl66 := '1';    
                     axi_next_state_xhdl55 := IDLE;    
                  ELSE
                     latch_wr_resp_set_xhdl66 := '0';    
                  END IF;
         ---------------------------------------------
         -- SEND READ ADDRESS AND CONTROL ON AXI BUS
         ---------------------------------------------
         
         WHEN SEND_RD_ADDR =>
                  araddr_arvalid_set_xhdl57 := '1';    
                  burstcount_load_xhdl63 := '1';    
                  rready_set_xhdl69 := '1';    
                  IF (ARREADY = '1') THEN
                     araddr_arvalid_clr_xhdl59 := '1';    
                     CASE HWRITE_sync IS
                        WHEN WRITE_C =>
                                 axi_next_state_xhdl55 := SEND_WR_DATA;    
                        WHEN READ_C =>
                                 axi_next_state_xhdl55 := READ_RD_DATA;    
                        WHEN OTHERS =>
                                 NULL;
                        
                     END CASE;
                  ELSE
                     araddr_arvalid_clr_xhdl59 := '0';    
                  END IF;
         -- Error respnose
         
         WHEN READ_RD_DATA =>
                  burstcount_load_xhdl63 := '0';    
                  rready_set_xhdl69 := '1';    
                  axi_read_data_xhdl68 := '0';    
                  IF (RLAST = '1') THEN
                     -- Last burst transfer
                     
                     IF (RVALID = '1') THEN
                        axi_read_data_xhdl68 := '1';    
                        IF (RRESP = RESPOK_C) THEN
                           axi_read_resp_xhdl67(1 DOWNTO 0) := RESPOK_C;    
                        ELSE
                           axi_read_resp_xhdl67(1 DOWNTO 0) := RESPERR_C;    
                        END IF;
                        axi_next_state_xhdl55 := IDLE;    
                        rready_set_xhdl69 := '0';    
                     ELSE
                        
                     END IF;
                  ELSE
                     IF ((RVALID = '1') AND (RREADY_xhdl20 = '1')) THEN
                        axi_read_data_xhdl68 := '1';    
                        IF (RRESP = RESPOK_C) THEN
                           axi_read_resp_xhdl67(1 DOWNTO 0) := RESPOK_C;    
                        ELSE
                           axi_read_resp_xhdl67(1 DOWNTO 0) := RESPERR_C;    
                        END IF;
                     ELSE
                        
                     END IF;
                  END IF;
         -- OKAY response
         
         WHEN OTHERS  =>
                  axi_next_state_xhdl55 := axi_current_state;    
         
      END CASE;
      axi_next_state <= axi_next_state_xhdl55;
      awaddr_awvalid_set <= awaddr_awvalid_set_xhdl56;
      araddr_arvalid_set <= araddr_arvalid_set_xhdl57;
      awaddr_awvalid_clr <= awaddr_awvalid_clr_xhdl58;
      araddr_arvalid_clr <= araddr_arvalid_clr_xhdl59;
      wvalid_set <= wvalid_set_xhdl60;
      wvalid_clr <= wvalid_clr_xhdl61;
      bready_set <= bready_set_xhdl62;
      burstcount_load <= burstcount_load_xhdl63;
      burstcount_dec <= burstcount_dec_xhdl64;
      WRCH_fifo_rd_en_xhdl22 <= WRCH_fifo_rd_en_xhdl22_xhdl65;
      latch_wr_resp_set <= latch_wr_resp_set_xhdl66;
      axi_read_resp <= axi_read_resp_xhdl67;
      axi_read_data <= axi_read_data_xhdl68;
      rready_set <= rready_set_xhdl69;
   END PROCESS axi_state_machine_combo_logic;

END ARCHITECTURE translated;
