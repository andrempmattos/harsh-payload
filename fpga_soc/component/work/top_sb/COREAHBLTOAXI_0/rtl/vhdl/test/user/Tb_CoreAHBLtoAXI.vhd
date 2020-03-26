-- ********************************************************************
-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description:	
-- Notes: 
--
-- *********************************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.xhdl_std_logic.all;
use work.xhdl_misc.all;
use work.coreparameters.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE translated OF testbench IS

  COMPONENT axi_slave
      GENERIC(
          AXI_AWIDTH                     :  integer := 32; 
          ID_WIDTH                       :  integer := 4;    
          AXI_DWIDTH                     :  integer := 64);    
      PORT (
         ACLK                    : IN  std_logic;
         ARESETN                 : IN  std_logic;
         AWID                    : IN  std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
         AWADDR                  : IN  std_logic_vector(AXI_AWIDTH - 1 DOWNTO 0);
         AWLEN                   : IN  std_logic_vector(3 DOWNTO 0);
         AWSIZE                  : IN  std_logic_vector(2 DOWNTO 0);
         AWBURST                 : IN  std_logic_vector(1 DOWNTO 0);
         AWLOCK                  : IN  std_logic_vector(1 DOWNTO 0);
         AWVALID                 : IN  std_logic;
         AWREADY                 : OUT std_logic;

         WID                     : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
         WDATA                   : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);
         WSTRB                   : IN std_logic_vector(7 DOWNTO 0);
         WLAST                   : IN std_logic;
         WVALID                  : IN std_logic;
         WREADY                  : OUT std_logic;
         
         RID                     : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
         RDATA                   : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);
         RRESP                   : OUT std_logic_vector(1 DOWNTO 0);
         RVALID                  : OUT std_logic;
         RLAST                   : OUT std_logic;
         RREADY                  : IN  std_logic;

         ARID                    : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
         ARADDR                  : IN std_logic_vector(AXI_AWIDTH - 1 DOWNTO 0);
         ARLEN                   : IN std_logic_vector(3 DOWNTO 0);
         ARSIZE                  : IN std_logic_vector(2 DOWNTO 0);
         ARBURST                 : IN std_logic_vector(1 DOWNTO 0);
         ARLOCK                  : IN std_logic_vector(1 DOWNTO 0);
         ARVALID                 : IN std_logic;
         ARREADY                 : OUT std_logic;
      
         BID                     : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
         BRESP                   : OUT std_logic_vector(1 DOWNTO 0);
         BVALID                  : OUT std_logic;
         BREADY                  : IN std_logic
     );
   END COMPONENT;

COMPONENT top_sb_COREAHBLTOAXI_0_COREAHBLTOAXI
   GENERIC (
      -----------------------------------------------------
      -- Global parameters
      -----------------------------------------------------
      FAMILY                         :  integer := 19;    
      AHB_AWIDTH                     :  integer := 32;    
      AHB_DWIDTH                     :  integer := 32;    
      AXI_AWIDTH                     :  integer := 32;    
      AXI_DWIDTH                     :  integer := 64;    
      CLOCKS_ASYNC                   :  integer := 0;    
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
      -- Outputs on the AHBL Interface
      HREADYOUT               : OUT std_logic;   
      HRESP                   : OUT std_logic_vector(1 DOWNTO 0);   
      HRDATA                  : OUT std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0);  
      -- Inputs on AXI Interface

      ACLK                    : IN std_logic;   
      ARESETn                 : IN std_logic;   
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
      RVALID                  : IN std_logic);   
END COMPONENT;
  CONSTANT xhdl_timescale         : time := 1 ns;
  CONSTANT AXI_CLK_PERIOD         : INTEGER := 5;
  CONSTANT AHB_CLK_PERIOD         : INTEGER := 5;

  CONSTANT   FAMILY       : integer :=19; 
  CONSTANT   AHB_AWIDTH   : integer :=32; 
  CONSTANT   AXI_AWIDTH   : integer :=32; 
  CONSTANT   AHB_DWIDTH   : integer :=32; 
  CONSTANT   AXI_DWIDTH   : integer :=64; 
  CONSTANT   CLOCKS_ASYNC : integer :=1; 
  CONSTANT   UNDEF_BURST  : integer :=0;  

   CONSTANT  IDLE                  :  std_logic_vector(1 DOWNTO 0) := "00";    
   CONSTANT  BUSY                  :  std_logic_vector(1 DOWNTO 0) := "01";    
   CONSTANT  NONSEQ                :  std_logic_vector(1 DOWNTO 0) := "10";    
   CONSTANT  SEQ                   :  std_logic_vector(1 DOWNTO 0) := "11";    
   CONSTANT  SINGLE                :  std_logic_vector(2 DOWNTO 0) := "000";    
   CONSTANT  INCR                  :  std_logic_vector(2 DOWNTO 0) := "001";    
   CONSTANT  WRAP4                 :  std_logic_vector(2 DOWNTO 0) := "010";    
   CONSTANT  INCR4                 :  std_logic_vector(2 DOWNTO 0) := "011";    
   CONSTANT  WRAP8                 :  std_logic_vector(2 DOWNTO 0) := "100";    
   CONSTANT  INCR8                 :  std_logic_vector(2 DOWNTO 0) := "101";    
   CONSTANT  WRAP16                :  std_logic_vector(2 DOWNTO 0) := "110";    
   CONSTANT  INCR16                :  std_logic_vector(2 DOWNTO 0) := "111";    
   CONSTANT  BYTE                  :  std_logic_vector(1 DOWNTO 0) := "00";    
   CONSTANT  HALFWORD              :  std_logic_vector(1 DOWNTO 0) := "01";    
   CONSTANT  WORD                  :  std_logic_vector(1 DOWNTO 0) := "10";    
   CONSTANT  DOUBLEWORD            :  std_logic_vector(1 DOWNTO 0) := "11";    
   CONSTANT  OKAY                  :  std_logic_vector(1 DOWNTO 0) := "00";    
   CONSTANT  ERROR                 :  std_logic_vector(1 DOWNTO 0) := "01";    
   CONSTANT  RETRY                 :  std_logic_vector(1 DOWNTO 0) := "10";    
   CONSTANT  SPLIT                 :  std_logic_vector(1 DOWNTO 0) := "11";    
   CONSTANT  AHB_WRITE_TYPE                 :  std_logic := '1';    
   CONSTANT  AHB_READ_TYPE                  :  std_logic := '0';    
   CONSTANT  HIGH                  :  std_logic := '1';    
   CONSTANT  LOW                   :  std_logic := '0';    
   CONSTANT  INTERM_VAL            :  integer := 1;
   CONSTANT SYS_CLK_CYCLE          : INTEGER := 20;         

   SIGNAL start_waddr              :  std_logic_vector((AHB_AWIDTH - 1) DOWNTO 0);   
   SIGNAL HCLK                     :  std_logic;   
   SIGNAL ACLK                     :  std_logic;   
  SIGNAL HSEL                     :  std_logic;   
  SIGNAL HWRITE                   :  std_logic;   
  SIGNAL HTRANS                   :  std_logic_vector(1 DOWNTO 0);   
  SIGNAL HSIZE                    :  std_logic_vector(2 DOWNTO 0);   
  SIGNAL HBURST                   :  std_logic_vector(2 DOWNTO 0);   
  SIGNAL HREADYIN                 :  std_logic;   
  SIGNAL HADDR                    :  std_logic_vector((AHB_AWIDTH - 1) DOWNTO 0);   
  SIGNAL HWDATA                   :  std_logic_vector((AHB_DWIDTH - 1) DOWNTO 0);   
  SIGNAL write_hwdata             :  std_logic_vector((AHB_DWIDTH - 1) DOWNTO 0);   
  SIGNAL HREADYOUT                :  std_logic;   
  SIGNAL HRESP                    :  std_logic_vector(1 DOWNTO 0);   
  SIGNAL HRDATA                   :  std_logic_vector((AHB_DWIDTH - 1) DOWNTO 0);   
  SIGNAL nreset                   :  std_logic;   
  SIGNAL read_data                :  std_logic_vector((AHB_DWIDTH - 1) DOWNTO 0);   
  SIGNAL haddr_w                  :  std_logic_vector((AHB_AWIDTH - 1) DOWNTO 0);   
  SIGNAL start_raddr              :  std_logic_vector((AHB_AWIDTH - 1) DOWNTO 0);   
  SIGNAL haddr_incr               :  std_logic_vector(3 DOWNTO 0);   
  SIGNAL hburst_value             :  std_logic_vector(4 DOWNTO 0);   
  SIGNAL wrap_enable              :  std_logic;   
  SIGNAL set_wrap_addr            :  std_logic_vector(7 DOWNTO 0);   
  SIGNAL write_resp               :  std_logic_vector(1 DOWNTO 0);   
  SIGNAL adr_0                    :  integer;   
  SIGNAL adr_00                   :  integer;   
  SIGNAL ii                       :  integer;   
  SIGNAL error_count_0            :  integer;   
  SIGNAL adr_1                    :  integer;   
  SIGNAL adr_11                   :  integer;   
  SIGNAL rr                       :  integer;   
  SIGNAL error_count_1            :  integer;   
  SIGNAL error_count              :  integer;   
  SIGNAL pound_str                :  std_logic_vector(8 * 79 DOWNTO 1);   
  SIGNAL test_str                 :  std_logic_vector(8 * 79 DOWNTO 1);   
  SIGNAL i                        :  integer;   
  SIGNAL r                        :  integer;   
  SIGNAL int                      :  integer;   
  SIGNAL burst                    :  std_logic_vector(2 DOWNTO 0);   
  SIGNAL size                     :  std_logic_vector(1 DOWNTO 0);   
  SIGNAL trans_no                 :  std_logic_vector(3 DOWNTO 0);   
  SIGNAL j                        :  integer;   
  SIGNAL iter                     :  integer;   
  SIGNAL haddr_set                :  std_logic_vector(31 DOWNTO 0);   
  SIGNAL hraddr_set               :  std_logic_vector(31 DOWNTO 0);   
  SIGNAL HRESETn                  :  std_logic;  
  SIGNAL HREADY                   :  std_logic;  
  SIGNAL HMASTLOCK                :  std_logic;  
  SIGNAL ARESETN                  :  std_logic;  
  SIGNAL END_OF_SIMULATIONS       :  BOOLEAN;
   SIGNAL  DEPTH                  :  integer;
   TYPE xhdl_3 IS ARRAY (31 DOWNTO 0) OF std_logic_vector((AHB_DWIDTH - 1) DOWNTO 0);
   TYPE xhdl_4 IS ARRAY (31 DOWNTO 0) OF std_logic_vector((AHB_AWIDTH - 1) DOWNTO 0);
   
   SIGNAL writeaddr               :  xhdl_4;
   SIGNAL readaddr                :  xhdl_4;
   SIGNAL writedata               :  xhdl_3;
   SIGNAL readdata                :  xhdl_3;

SIGNAL AWID                   :  std_logic_vector(3 DOWNTO 0);   
SIGNAL AWADDR                 :  std_logic_vector(AXI_AWIDTH - 1 DOWNTO 0);   
SIGNAL AWLEN                  :  std_logic_vector(3 DOWNTO 0);   
SIGNAL AWSIZE                 :  std_logic_vector(2 DOWNTO 0);   
SIGNAL AWBURST                :  std_logic_vector(1 DOWNTO 0);   
SIGNAL AWLOCK                 :  std_logic_vector(1 DOWNTO 0);   
SIGNAL AWVALID                :  std_logic;   
SIGNAL AWREADY                :  std_logic;   
SIGNAL WID                    :  std_logic_vector(3 DOWNTO 0);   
SIGNAL WDATA                  :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
SIGNAL WSTRB                  :  std_logic_vector((AXI_DWIDTH/8) - 1 DOWNTO 0);   
SIGNAL WLAST                  :  std_logic;   
SIGNAL WVALID                 :  std_logic;   
SIGNAL WREADY                 :  std_logic;   
SIGNAL BREADY                 :  std_logic;   
SIGNAL BID                    :  std_logic_vector(3 DOWNTO 0);   
SIGNAL BRESP                  :  std_logic_vector(1 DOWNTO 0);   
SIGNAL BVALID                 :  std_logic;   
SIGNAL ARID                   :  std_logic_vector(3 DOWNTO 0);   
SIGNAL ARADDR                 :  std_logic_vector(AXI_AWIDTH - 1 DOWNTO 0);   
SIGNAL ARLEN                  :  std_logic_vector(3 DOWNTO 0);   
SIGNAL ARSIZE                 :  std_logic_vector(2 DOWNTO 0);   
SIGNAL ARBURST                :  std_logic_vector(1 DOWNTO 0);   
SIGNAL ARLOCK                 :  std_logic_vector(1 DOWNTO 0);   
SIGNAL ARVALID                :  std_logic;   
SIGNAL ARREADY                :  std_logic;   
SIGNAL RREADY                 :  std_logic;   
SIGNAL RID                    :  std_logic_vector(3 DOWNTO 0);   
SIGNAL RDATA                  :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);
SIGNAL RRESP                  :  std_logic_vector(1 DOWNTO 0);   
SIGNAL RLAST                  :  std_logic;   
SIGNAL RVALID                 :  std_logic;

BEGIN

   PROCESS IS

   PROCEDURE set_wraddr_incr_value (
       SIGNAL haddr_incr              : OUT std_logic_vector(3 DOWNTO 0);
       SIGNAL hsize                   : IN std_logic_vector(1 DOWNTO 0))IS
   BEGIN
      CASE hsize IS
         WHEN "00" =>
                  haddr_incr <= "0001";    
         WHEN "01" =>
                  haddr_incr <= "0010";    
         WHEN "10" =>
                  haddr_incr <= "0100";    
         WHEN "11" =>
                  haddr_incr <= "1000";    
         WHEN OTHERS =>
                  NULL;
      END CASE;
   END set_wraddr_incr_value;

   PROCEDURE ahb_read (
      SIGNAL HCLK                    : IN std_logic;
      SIGNAL hburst_xhdl2            : IN std_logic_vector(2 DOWNTO 0);   
      SIGNAL hsize_xhdl5             : IN std_logic_vector(1 DOWNTO 0);   
      SIGNAL iter_xhdl7              : IN integer;
      SIGNAL readaddr                : OUT xhdl_4;
      SIGNAL  readdata               : OUT xhdl_3)IS
   
      VARIABLE i_xhdl8                :  integer;   
      VARIABLE cnt_xhdl9              :  integer;   
      
   BEGIN
      
      --WRITE("AHB_READ");
      WAIT UNTIL (HCLK'EVENT AND HCLK = '1');
      WAIT UNTIL (HCLK'EVENT AND HCLK = '1');
      
      HSEL <= HIGH;    
      HTRANS <= NONSEQ;    
      HADDR <= start_raddr;    
      HBURST <= hburst_xhdl2;    
      HWRITE <= AHB_READ_TYPE;    
      HSIZE <= "0" & hsize_xhdl5;    
      
      WAIT UNTIL (HCLK'EVENT AND HCLK = '1');
      WAIT UNTIL HREADYOUT = '1';
      set_wraddr_incr_value(haddr_incr, hsize_xhdl5);   
      cnt_xhdl9 := 0;
      WHILE (cnt_xhdl9 < iter_xhdl7 - 1) LOOP
         --WRITE("AHB_READ::2");
         readaddr(cnt_xhdl9) <= HADDR;    
         HSEL <= HIGH;    
         HTRANS <= NONSEQ;    
         HADDR <= HADDR + haddr_incr;    
         HBURST <= hburst_xhdl2;    
         HWRITE <= AHB_READ_TYPE;    
         HSIZE <= "0" & hsize_xhdl5;    
         
         set_wraddr_incr_value(haddr_incr, hsize_xhdl5);   
         readdata(cnt_xhdl9) <= HRDATA;    
         WAIT UNTIL (HCLK'EVENT AND HCLK = '1');
         
         WAIT UNTIL HREADYOUT = '1';
         cnt_xhdl9 := cnt_xhdl9 + 1;
      END LOOP;
      
      HSEL <= LOW;    
      HTRANS <= IDLE;    
      HBURST <= "000";    
      HWRITE <= '0';    
      HSIZE <= "000";    
      
      readaddr(cnt_xhdl9) <= HADDR;    
      readdata(cnt_xhdl9) <= HRDATA;    
      WAIT UNTIL (HCLK'EVENT AND HCLK = '1');
      
   END ahb_read;

   PROCEDURE ahb_write (
     SIGNAL HCLK        : IN std_logic;
     SIGNAL write_burst : IN std_logic_vector(2 DOWNTO 0);
     SIGNAL write_size  : IN std_logic_vector(1 DOWNTO 0);
     SIGNAL write_iter      : IN INTEGER;
     SIGNAL writeaddr       : OUT xhdl_4;
     SIGNAL writedata       : OUT xhdl_3)IS

     VARIABLE write_count :  INTEGER;
     VARIABLE hwdata_int :  INTEGER;

   BEGIN 
      
      --WRITE("AHB_WRITE");

      WAIT UNTIL (HCLK'EVENT AND HCLK = '1');
      WAIT UNTIL (HCLK'EVENT AND HCLK = '1');

      HSEL <= HIGH;    
      HTRANS <= NONSEQ;    
      HADDR <= start_waddr;    
      HBURST <= write_burst;    
      HWRITE <= AHB_WRITE_TYPE;    
      HSIZE <= "0" & write_size;

      hwdata_int  := 100;
      HWDATA <= (std_logic_vector(to_unsigned(hwdata_int+1, AHB_DWIDTH)));
         
      WAIT UNTIL HREADYOUT = '1';
      
      set_wraddr_incr_value(haddr_incr, write_size);
      write_count := 0;

      writeaddr(write_count) <= HADDR;
      
     -- WRITE(" WRITE ADDR = " & to_hexstring(write_count));
      writedata(write_count) <= HWDATA;


      WHILE (write_count < write_iter - 1) LOOP
         WAIT UNTIL (HCLK'EVENT AND HCLK = '1');

 	 write_count := write_count + 1;

         --WRITE("AHB_WRITE::2");
         --writeaddr(write_count) <= HADDR;

      
         HTRANS <= NONSEQ;    
         HADDR  <= HADDR + haddr_incr;
         HWDATA <= (std_logic_vector(to_unsigned(hwdata_int+1, AHB_DWIDTH)));

         writeaddr(write_count) <= HADDR;

         set_wraddr_incr_value(haddr_incr, write_size);
         
         --WAIT UNTIL (HCLK'EVENT AND HCLK = '1');
         WAIT UNTIL HREADYOUT = '1';
         
         writedata(write_count) <= HWDATA;
      END LOOP;
         
      --WAIT UNTIL (HCLK'EVENT AND HCLK = '1');
      --HWDATA <= (std_logic_vector(to_unsigned(hwdata_int, AHB_DWIDTH)));

      --writeaddr(write_count) <= HADDR;
      
      --WAIT UNTIL (HCLK'EVENT AND HCLK = '1');
      --writedata(write_count) <= HWDATA;

      HSEL <= LOW;    
      HTRANS <= IDLE;    
      HBURST <= SINGLE;    
      HWRITE <= AHB_WRITE_TYPE; 
  END ahb_write;
  
   PROCEDURE ahb_compare (
       SIGNAL size                    : IN std_logic_vector(1 DOWNTO 0);   
       SIGNAL DEPTH                   : IN integer;
       SIGNAL writeaddr               : IN xhdl_4;
       SIGNAL readaddr                : IN xhdl_4;
       SIGNAL writedata               : IN xhdl_3;
       SIGNAL readdata                : IN xhdl_3)IS
   
      VARIABLE i                      :  integer;   
      VARIABLE counter                :  integer;   
     
   BEGIN
      
      --WRITE("IAM IN TO AHB_COMPARE");
      counter := 0;    
      i := 0;
      WHILE (i < DEPTH) LOOP
         CASE size IS
            WHEN "10" =>
                     --WRITE("************** AHB_DWIDTH = 32 ****************");
                     IF (writeaddr(i) = readaddr(i)) THEN
                        IF (writedata(i) = readdata(i)) THEN
                           WRITE(" WRITE ADDRESS = " & to_hexstring(writeaddr(i)) & ", WRITE_DATA = " & to_hexstring(writedata(i)) & ", READ_ADDRESS = " & to_hexstring(readaddr(i)) & ", READ_DATA =" & to_hexstring(readdata(i)));   
                           WRITE("TEST CASE PASSED");   
                           counter := counter + 1;    
                           IF (counter = DEPTH) THEN
                              WRITE("TOTAL TESTCASE PASSED");   
                              counter := 0;    
                           END IF;
                        ELSE
                           WRITE(" WRITE ADDRESS = " & to_hexstring(writeaddr(i)) & ", WRITE_DATA = " & to_hexstring(writedata(i)) & ", READ_ADDRESS = " & to_hexstring(readaddr(i)) & ", READ_DATA =" & to_hexstring(readdata(i)));   
                            WRITE("----DATA MISMATCHED !!-----");
                        END IF;
                     ELSE
                        WRITE("---- ADDRESS MISMATCHED----- ");
                        WRITE("TEST CASE FAILED");   
                     END IF;
            WHEN "01" =>
                     CASE writeaddr(i)(1 DOWNTO 0) IS
                        WHEN "00" =>
                                 --WRITE("************** AHB_DWIDTH = 16 ****************");
                                 IF (writeaddr(i) = readaddr(i)) THEN
                                    IF (writedata(i)(15 DOWNTO 0) = readdata(i)(15 DOWNTO 0)) THEN
                                     WRITE(" WRITE ADDRESS = " & to_hexstring(writeaddr(i)) & ", WRITE_DATA = " & to_hexstring(writedata(i)) & ", READ_ADDRESS = " & to_hexstring(readaddr(i)) & ", READ_DATA =" & to_hexstring(readdata(i)));   
                                       WRITE("TEST CASE PASSED");   
                                       counter := counter + 1;    
                                       IF (counter = DEPTH) THEN					       
                                          WRITE("TOTAL TESTCASE PASSED");   
                                          counter := 0;    
                                       END IF;
                                    ELSE
                                    WRITE("----DATA MISMATCHED !!-----");
                                    END IF;
                                 ELSE
                                    WRITE("TEST CASE FAILED");   
                                 END IF;
                        WHEN "10" =>
                                 IF (writeaddr(i) = readaddr(i)) THEN
                                    IF (writedata(i)(31 DOWNTO 16) = readdata(i)(31 DOWNTO 16)) THEN
                                     WRITE(" WRITE ADDRESS = " & to_hexstring(writeaddr(i)) & ", WRITE_DATA = " & to_hexstring(writedata(i)) & ", READ_ADDRESS = " & to_hexstring(readaddr(i)) & ", READ_DATA =" & to_hexstring(readdata(i)));   
                                       WRITE("TEST CASE PASSED");   
                                       counter := counter + 1;    
                                       IF (counter = DEPTH) THEN
                                          WRITE("TOTAL TESTCASE PASSED");   
                                          counter := 0;    
                                       END IF;
                                    ELSE
                                      WRITE("----DATA MISMATCHED !!-----");
                                    END IF;
                                 ELSE
                                    WRITE("TEST CASE FAILED");   
                                 END IF;
                        WHEN OTHERS =>
                                 --WRITE("IAM IN TO HALFWORD----");
                                       WRITE(" WRITE ADDRESS = " & to_hexstring(writeaddr(i)) & ", WRITE_DATA = " & to_hexstring(writedata(i)) & ", READ_ADDRESS = " & to_hexstring(readaddr(i)) & ", READ_DATA =" & to_hexstring(readdata(i)));   
                                 NULL;
                        
                     END CASE;
            WHEN "00" =>
                     CASE writeaddr(i)(1 DOWNTO 0) IS
                        WHEN "00" =>
                                 IF (writeaddr(i) = readaddr(i)) THEN
                                    IF (writedata(i)(7 DOWNTO 0) = readdata(i)(7 DOWNTO 0)) THEN
                                       WRITE(" WRITE ADDRESS = " & to_hexstring(writeaddr(i)) & ", WRITE_DATA = " & to_hexstring(writedata(i)(7 DOWNTO 0)) & ", READ_ADDRESS = " & to_hexstring(readaddr(i)) & ", READ_DATA =" & to_hexstring(readdata(i)(7 DOWNTO 0)));   
                                       WRITE("TEST CASE PASSED");   
                                       counter := counter + 1;    
                                       IF (counter = DEPTH) THEN
                                          --WRITE("************** AHB_DWIDTH = 08 ****************");
                                          --WRITE("****** WR_SIZE = 0 and RD_SIZE = 0*********");
                                          WRITE("TOTAL TESTCASE PASSED");
                                          END_OF_SIMULATIONS <= TRUE;
                                          counter := 0;    
                                       END IF;
                                    ELSE
                                      WRITE("----DATA MISMATCHED !!-----");
                                    END IF;
                                 ELSE
                                    WRITE("TEST CASE FAILED");   
                                 END IF;
                        WHEN "01" =>
                                 IF (writeaddr(i) = readaddr(i)) THEN
                                    IF (writedata(i)(15 DOWNTO 8) = readdata(i)(15 DOWNTO 8)) THEN
                                       WRITE(" WRITE ADDRESS = " & to_hexstring(writeaddr(i)) & ", WRITE_DATA = " & to_hexstring(writedata(i)(15 DOWNTO 8)) & ", READ_ADDRESS = " & to_hexstring(readaddr(i)) & ", READ_DATA =" & to_hexstring(readdata(i)(15 DOWNTO 8)));   
                                       WRITE("TEST CASE PASSED");   
                                       counter := counter + 1;    
                                       IF (counter = DEPTH) THEN
                                          --WRITE("************** AHB_DWIDTH = 08 ****************");
                                          --WRITE("****** WR_SIZE = 0 and RD_SIZE = 0*********");
                                          WRITE("TOTAL TESTCASE PASSED");   
                                           END_OF_SIMULATIONS <= TRUE;
                                          counter := 0;    
                                       END IF;
                                    ELSE
                                      WRITE("----DATA MISMATCHED !!-----");
                                    END IF;
                                 ELSE
                                    WRITE("TEST CASE FAILED");   
                                 END IF;
                        WHEN "10" =>
                                 IF (writeaddr(i) = readaddr(i)) THEN
                                    IF (writedata(i)(23 DOWNTO 16) = readdata(i)(23 DOWNTO 16)) THEN
                                       WRITE(" WRITE ADDRESS = " & to_hexstring(writeaddr(i)) & ", WRITE_DATA = " & to_hexstring(writedata(i)(23 DOWNTO 16)) & ", READ_ADDRESS = " & to_hexstring(readaddr(i)) & ", READ_DATA =" & to_hexstring(readdata(i)(23 DOWNTO 16)));   
                                       WRITE("TEST CASE PASSED");   
                                       counter := counter + 1;    
                                       IF (counter = DEPTH) THEN
                                          --WRITE("************** AHB_DWIDTH = 08 ****************");
                                          --WRITE("****** WR_SIZE = 0 and RD_SIZE = 0*********");
                                          WRITE("TOTAL TESTCASE PASSED");   
                                          END_OF_SIMULATIONS <= TRUE;
                                          counter := 0;    
                                       END IF;
                                    ELSE
                                      WRITE("----DATA MISMATCHED !!-----");
                                    END IF;
                                 ELSE
                                    WRITE("TEST CASE FAILED");   
                                 END IF;
                        WHEN "11" =>
                                 IF (writeaddr(i) = readaddr(i)) THEN
                                    IF (writedata(i)(31 DOWNTO 24) = readdata(i)(31 DOWNTO 24)) THEN
                                       WRITE(" WRITE ADDRESS = " & to_hexstring(writeaddr(i)) & ", WRITE_DATA = " & to_hexstring(writedata(i)(31 DOWNTO 24)) & ", READ_ADDRESS = " & to_hexstring(readaddr(i)) & ", READ_DATA =" & to_hexstring(readdata(i)(31 DOWNTO 24)));   
                                       WRITE("TEST CASE PASSED");   
                                       counter := counter + 1;    
                                       IF (counter = DEPTH) THEN
                                          --WRITE("************** AHB_DWIDTH = 08 ****************");
                                          --WRITE("****** WR_SIZE = 0 and RD_SIZE = 0*********");
                                          WRITE("TOTAL TESTCASE PASSED"); 
                                          END_OF_SIMULATIONS <= TRUE;
                                          counter := 0;    
                                       END IF;
                                    ELSE
                                         WRITE("----DATA MISMATCHED !!-----");
                                    END IF;
                                 ELSE
                                    WRITE("TEST CASE FAILED");   
                                 END IF;
                        WHEN OTHERS =>
                                 NULL;
                        
                     END CASE;
            WHEN OTHERS =>
                     NULL;
            
         END CASE;
         i := i + 1;
      END LOOP;
   END ahb_compare;



     PROCEDURE dut_reset IS
       BEGIN
	 nreset <= '0';
         nreset <= '1' AFTER 100 * xhdl_timescale;    
         --nreset <= '1' AFTER 10 ns;    
     END dut_reset;

     VARIABLE xhdl_initial : BOOLEAN := TRUE;

   BEGIN

       --IF (xhdl_initial) THEN
         --dut_reset;   
         HSEL <= '0';    
         HSIZE <= (OTHERS => '0');   
         HBURST <= (OTHERS => '0');   
         HWRITE <= '0';    
         HADDR <= (OTHERS => '0');
         HWDATA <= (OTHERS => '0');    
         HRESETn <= '0';
         WAIT FOR  100 ns;    
         HRESETn <= '1';
	 
         iter <= 3;
         WAIT FOR 100 * xhdl_timescale;
         WAIT UNTIL (HCLK'EVENT AND HCLK = '1');
      
      	 DEPTH <= INTERM_VAL;         
      
      	 -- FIRST TRANSACTIONS
         WRITE("FIRST TRANSACTION");

         burst <= SINGLE;
         size  <= WORD;	 
         ahb_write(HCLK, burst, size,  DEPTH, writeaddr, writedata );   
         
         ahb_read(HCLK,burst, size, DEPTH, readaddr, readdata );   
         
         ahb_compare(size, DEPTH, writeaddr, readaddr, writedata, readdata);   
        
         WAIT FOR 100 * xhdl_timescale;
         WAIT UNTIL (HCLK'EVENT AND HCLK = '1');
        
        WRITE("SECOND TRANSACTION");
        -- SECOND TRANSACTIONS
        burst <= SINGLE;    
        size <= HALFWORD;    
        
        ahb_write(HCLK, burst, size, DEPTH, writeaddr, writedata);   
        
        ahb_read(HCLK,burst, size, DEPTH, readaddr, readdata );   
        
        ahb_compare(size, DEPTH, writeaddr, readaddr, writedata, readdata);

        WAIT FOR 100 * xhdl_timescale;
        WAIT UNTIL (HCLK'EVENT AND HCLK = '1');
        
        WRITE("THIRD TRANSACTION");
        -- THIRD TRANSACTIONS
        burst <= SINGLE;    
        size <= BYTE;    
        
        ahb_write(HCLK, burst, size, DEPTH, writeaddr, writedata);   
        
        ahb_read(HCLK, burst, size, DEPTH, readaddr, readdata );   
        
        ahb_compare(size, DEPTH, writeaddr, readaddr, writedata, readdata);   
         xhdl_initial := FALSE;
      --ELSE
      --   WAIT;
      --END IF;

   END PROCESS;

   PROCESS
   BEGIN
      HCLK <= '0';
      WAIT FOR AHB_CLK_PERIOD * 1 ns;
      HCLK <= '1';    
      WAIT FOR AHB_CLK_PERIOD * 1 ns;
      IF(END_OF_SIMULATIONS) THEN
           WAIT;
      END IF;
   END PROCESS;

   PROCESS
   BEGIN
      ACLK <= '0';
      WAIT FOR AXI_CLK_PERIOD * 1 ns;
      ACLK <= '1';    
      WAIT FOR AXI_CLK_PERIOD * 1 ns;
      IF(END_OF_SIMULATIONS) THEN
           WAIT;
      END IF;
   END PROCESS;

   PROCESS
      VARIABLE xhdl_initial : BOOLEAN := TRUE;

   BEGIN
      
      IF (xhdl_initial) THEN
         start_waddr <= (OTHERS => '0');    
         start_raddr <= (OTHERS => '0');    
         xhdl_initial := FALSE;
      ELSE
         WAIT;
      END IF;

   END PROCESS;


   HREADY <= HREADYOUT ;



-------------------------------------------------------------------------------
-- Instantiate DUT
-------------------------------------------------------------------------------
COREAHBLTOAXI_0  : top_sb_COREAHBLTOAXI_0_COREAHBLTOAXI 
      GENERIC MAP (
          FAMILY             => FAMILY,
          AHB_AWIDTH         => AHB_AWIDTH,
          AHB_DWIDTH         => AHB_DWIDTH,
          AXI_AWIDTH         => AXI_AWIDTH,
          AXI_DWIDTH         => AXI_DWIDTH,
          CLOCKS_ASYNC       => CLOCKS_ASYNC,
          UNDEF_BURST        => UNDEF_BURST)
  PORT MAP (

            -- AHB Interface
              HCLK             => HCLK
            , HRESETn          => HRESETn
            , HSEL             => HSEL
            , HADDR            => HADDR
            , HWRITE           => HWRITE
            , HREADY           => HREADY
            , HTRANS           => HTRANS
            , HSIZE            => HSIZE
            , HWDATA           => HWDATA
            , HBURST           => HBURST
            , HMASTLOCK        => HMASTLOCK
            , HREADYOUT        => HREADYOUT
            , HRESP            => HRESP
            , HRDATA           => HRDATA

            -- AXI Interface
            , ACLK		=> ACLK
            , ARESETn		=> HRESETn
            , AWID		=> AWID
            , AWADDR		=> AWADDR
            , AWLEN		=> AWLEN
            , AWSIZE		=> AWSIZE
            , AWBURST		=> AWBURST
            , AWLOCK		=> AWLOCK
            , AWVALID		=> AWVALID
            , AWREADY		=> AWREADY
            , WID		=> WID
            , WDATA		=> WDATA
            , WSTRB		=> WSTRB
            , WLAST		=> WLAST
            , WVALID		=> WVALID
            , WREADY		=> WREADY
            , BREADY		=> BREADY
            , BID		=> BID
            , BRESP		=> BRESP
            , BVALID		=> BVALID
            , ARID		=> ARID
            , ARADDR		=> ARADDR
            , ARLEN		=> ARLEN
            , ARSIZE		=> ARSIZE
            , ARBURST		=> ARBURST
            , ARLOCK		=> ARLOCK
            , ARVALID		=> ARVALID
            , ARREADY		=> ARREADY
            , RREADY		=> RREADY
            , RID		=> RID
            , RDATA		=> RDATA
            , RRESP		=> RRESP
            , RLAST            => RLAST
            , RVALID           => RVALID
          );


-------------------------------------------------------------------------------
-- Instantiate AHBL Master BFM
-------------------------------------------------------------------------------
-- AHBL_Master_0 : AHBL_Master
--     GENERIC MAP (
--         .AHB_AWIDTH         => AHB_AWIDTH,
--         .AHB_DWIDTH         => AHB_DWIDTH,
--         .UNDEF_BURST        => UNDEF_BURST)      
--  PORT MAP(
--           -- AHB Interface
--             HCLK             => HCLK
--           , HRESETn          => HRESETn
--           , HSEL             => HSEL
--           , HADDR            => HADDR
--           , HWRITE           => HWRITE
--           , HREADY           => HREADY
--           , HTRANS           => HTRANS
--           , HSIZE            => HSIZE
--           , HWDATA           => HWDATA
--           , HBURST           => HBURST
--           , HMASTLOCK        => HMASTLOCK
--           , HREADYOUT        => HREADYOUT
--           , HRESP            => HRESP
--           , HRDATA           => HRDATA
--          );

-------------------------------------------------------------------------------
-- Instantiate AXI Slave model
-------------------------------------------------------------------------------
U_AXI_Slave :AXI_Slave 
  GENERIC MAP(
          AXI_AWIDTH         => AXI_AWIDTH,
          AXI_DWIDTH         => AXI_DWIDTH
           )      
  PORT MAP (
            -- OUTPUT signals
              AWREADY		=> AWREADY
            , WREADY		=> WREADY
            , BID		=> BID
            , BRESP		=> BRESP
            , BVALID		=> BVALID
            , ARREADY		=> ARREADY
            , RID		=> RID
            , RDATA		=> RDATA
            , RRESP		=> RRESP
            , RLAST            => RLAST
            , RVALID           => RVALID

            -- INPUT signals
            , ACLK		=>ACLK
            , ARESETN           =>ARESETN	    
            , AWID		=>AWID
            , AWADDR		=>AWADDR
            , AWLEN		=>AWLEN
            , AWSIZE		=>AWSIZE
            , AWBURST		=>AWBURST
            , AWLOCK		=>AWLOCK
            , AWVALID		=>AWVALID
            , WID		=>WID
            , WDATA		=>WDATA
            , WSTRB		=>WSTRB
            , WLAST		=>WLAST
            , WVALID		=>WVALID
            , BREADY		=>BREADY
            , ARID		=>ARID
            , ARADDR		=>ARADDR
            , ARLEN		=>ARLEN
            , ARSIZE		=>ARSIZE
            , ARBURST		=>ARBURST
            , ARLOCK		=>ARLOCK
            , ARVALID		=>ARVALID
            , RREADY		=>RREADY);
            --, RDATA_TRIGGER => RDATA_TRIGGER);


END translated;

-------------------------------------------------------------------------------
-- File End
-------------------------------------------------------------------------------
