
--
--      Input file         : 
--      Design name        : axi_master
--      Author             : 
--      Company            : 
--
--      Description        : 
--
--
----------------------------------------------------------------------------------------------
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.xhdl_std_logic.all;
use work.xhdl_misc.all;
use work.coreparameters.all;

ENTITY axi_master IS
   GENERIC (
         FAMILY                         :  integer := 19;    
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
         --NUM_SLAVE_SLOT                 :  integer := 1;    --  1 - 16
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
         FEED_THROUGH                   :  integer := 0;
         INP_REG_BUF                    :  integer := 1;
         OUT_REG_BUF                    :  integer := 1;
         RD_ACCEPTANCE                  :  integer := 4);  
   PORT (
      ACLK                    : IN std_logic;   
      ARESETN                 : IN std_logic;
      AWREADY                 : IN std_logic;
      ARREADY                 : IN std_logic;
      WREADY                  : IN std_logic;
      BID                     : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
      BRESP                   : IN std_logic_vector(1 DOWNTO 0);
      BVALID                  : IN std_logic;
      RID                     : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
      RDATA                   : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);
      RRESP                   : IN std_logic_vector(1 DOWNTO 0);
      RVALID                  : IN std_logic;
      RLAST                   : IN std_logic;
      TRIGGER_M0              : IN std_logic;

   -- OUTPUTS 
      AWID                    : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
      AWADDR                  : OUT std_logic_vector(31 DOWNTO 0);
      AWLEN                   : OUT std_logic_vector(3 DOWNTO 0);
      AWSIZE                  : OUT std_logic_vector(2 DOWNTO 0);  
      AWBURST                 : OUT std_logic_vector(1 DOWNTO 0);
      AWLOCK                  : OUT std_logic_vector(1 DOWNTO 0);
      AWCACHE                 : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT                  : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID                 : OUT std_logic;

      WID                     : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
      WDATA                   : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);
      WSTRB                   : OUT std_logic_vector(7 DOWNTO 0);
      WLAST                   : OUT std_logic;
      WVALID                  : OUT std_logic;
   
      ARID                    : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
      ARADDR                  : OUT std_logic_vector(31 DOWNTO 0);
      ARLEN                   : OUT std_logic_vector(3 DOWNTO 0);
      ARSIZE                  : OUT std_logic_vector(2 DOWNTO 0);  
      ARBURST                 : OUT std_logic_vector(1 DOWNTO 0);
      ARLOCK                  : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE                 : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT                  : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID                 : OUT std_logic;

      BREADY                  : OUT std_logic;
      RREADY                  : OUT std_logic;
      RDATA_TRIGGER           : OUT std_logic;
      END_OF_SIMULATION       : OUT boolean
);   
END axi_master;

ARCHITECTURE translated OF axi_master IS

-- RESET PROCEDURE FOR READ CHANNEL AND WRITE CHANNEL
   CONSTANT  AXI_STRBWIDTH         :  integer := AXI_DWIDTH / 8;    
   CONSTANT  AXI_AWIDTH         :  integer := 32;       
   SIGNAL temp_xhdl1               :  std_logic;   
  SIGNAL AWID_IN     : std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
  SIGNAL AWADDR_IN   : std_logic_vector(31 DOWNTO 0);
  SIGNAL AWLEN_IN    : std_logic_vector(3 DOWNTO 0);
  SIGNAL AWSIZE_IN   : std_logic_vector(2 DOWNTO 0);  
  SIGNAL AWBURST_IN  : std_logic_vector(1 DOWNTO 0);
  SIGNAL AWLOCK_IN   : std_logic_vector(1 DOWNTO 0);
  SIGNAL ARID_IN     : std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
  SIGNAL ARADDR_IN   : std_logic_vector(31 DOWNTO 0);
  SIGNAL ARLEN_IN    : std_logic_vector(3 DOWNTO 0);
  SIGNAL ARSIZE_IN   : std_logic_vector(2 DOWNTO 0);  
  SIGNAL ARBURST_IN  : std_logic_vector(1 DOWNTO 0);
  SIGNAL ARLOCK_IN   : std_logic_vector(1 DOWNTO 0);
  SIGNAL ADDRESS_MSB : std_logic_vector(3 DOWNTO 0);
  SIGNAL ADDRESS0 : std_logic_vector(AXI_AWIDTH - 5 DOWNTO 0);
  SIGNAL ADDRESS1 : std_logic_vector(AXI_AWIDTH - 5  DOWNTO 0);
  SIGNAL ADDRESS2 : std_logic_vector(AXI_AWIDTH - 5 DOWNTO 0);
  SIGNAL ADDRESS3 : std_logic_vector(AXI_AWIDTH - 5 DOWNTO 0);
  SIGNAL WDATA_INT :std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);

BEGIN

 PROCESS IS
  PROCEDURE reset_axi_rdaddrchan IS
    BEGIN
      ARID <= (others => '0');    
      ARADDR <= (others => '0');    
      ARLEN <= "0000";    
      ARSIZE <= "000";    
      ARBURST <= '0' & '0';    
      ARLOCK <= '0' & '0';    
      ARVALID <= '0';    
      RDATA_TRIGGER <= '0';
   END reset_axi_rdaddrchan;

   PROCEDURE reset_axi_wraddrchan IS
   BEGIN
      AWID <= (others => '0');    
      AWADDR <= (others => '0');    
      AWLEN <= '0' & '0' & '0' & '0';    
      AWSIZE <=  '0' & '0' & '0';    
      AWBURST <= '0' & '0';    
      AWLOCK <= '0' & '0';    
      AWVALID <= '0';   
   END reset_axi_wraddrchan;

   PROCEDURE reset_axi_wrdatachan IS
   BEGIN
      WID <= (others => '0');  
      WDATA <= X"0000000000000000";
      WSTRB <= "00000000";    
      WLAST <= '0';    
      WVALID <= '0';    
   END reset_axi_wrdatachan;


-- READ ADDRESS CHANNEL
  PROCEDURE axi_read_addr_channel (
        SIGNAL ARID_in                 : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);   
        SIGNAL ARADDR_in               : IN std_logic_vector(31 DOWNTO 0);   
        SIGNAL ARLEN_in                : IN std_logic_vector(3 DOWNTO 0);   
        SIGNAL ARSIZE_in               : IN std_logic_vector(2 DOWNTO 0);   
        SIGNAL ARBURST_in              : IN std_logic_vector(1 DOWNTO 0);   
        SIGNAL ARLOCK_in               : IN std_logic_vector(1 DOWNTO 0))IS
   
      
   BEGIN
      WAIT UNTIL (ACLK'EVENT AND ACLK = '1');
      
      ARID <= ARID_in;    
      ARADDR <= ARADDR_in;    
      ARLEN <= ARLEN_in;    
      ARSIZE <= ARSIZE_in;    
      ARBURST <= ARBURST_in;    
      ARLOCK <= ARLOCK_in;    
      ARVALID <= '1';    
      WHILE(ARREADY = '0') LOOP
        WAIT UNTIL (ACLK'EVENT AND ACLK = '1');
      END LOOP;
      
     -- WAIT UNTIL (ACLK'EVENT AND ACLK = '1');
      
      reset_axi_rdaddrchan;   
   END axi_read_addr_channel;

-- READ RESPONSE CHANNEL
   PROCEDURE axi_read_response_channel IS
   BEGIN
      RREADY <= '1';    
    END axi_read_response_channel;

-- READ CHANNEL
   PROCEDURE axi_read (
     SIGNAL ARID_in                 : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);   
     SIGNAL ARADDR_in               : IN std_logic_vector(31 DOWNTO 0);   
     SIGNAL ARLEN_in                : IN std_logic_vector(3 DOWNTO 0);   
     SIGNAL ARSIZE_in               : IN std_logic_vector(2 DOWNTO 0);   
     SIGNAL ARBURST_in              : IN std_logic_vector(1 DOWNTO 0);   
     SIGNAL ARLOCK_in               : IN std_logic_vector(1 DOWNTO 0))IS
   
      
   BEGIN
      axi_read_addr_channel(ARID_in, ARADDR_in, ARLEN_in, ARSIZE_in, ARBURST_in, ARLOCK_in);   
      axi_read_response_channel;   
      WRITE(" AXI READ  address = " & to_hexstring(ARADDR_in));   
   END axi_read;


-- AXI WRITE ADDRESS CHANNEL 
  PROCEDURE axi_write_addr_channel (
       SIGNAL AWID_in                 : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);   
       SIGNAL AWADDR_in               : IN std_logic_vector(31 DOWNTO 0);   
       SIGNAL AWLEN_in                : IN std_logic_vector(3 DOWNTO 0);   
       SIGNAL AWSIZE_in               : IN std_logic_vector(2 DOWNTO 0);   
       SIGNAL AWBURST_in              : IN std_logic_vector(1 DOWNTO 0);   
       SIGNAL AWLOCK_in               : IN std_logic_vector(1 DOWNTO 0))IS
   
      
   BEGIN
      WAIT UNTIL (ACLK'EVENT AND ACLK = '1');
      
      AWID <= AWID_in;    
      AWADDR <= AWADDR_in;    
      AWLEN <= AWLEN_in;    
      AWSIZE <= AWSIZE_in;    
      AWBURST <= AWBURST_in;    
      AWLOCK <= AWLOCK_in;    
      AWVALID <= '1';    
      WHILE(AWREADY = '0') LOOP
        WAIT UNTIL (ACLK'EVENT AND ACLK = '1');
      END LOOP;
      
      reset_axi_wraddrchan;   

      WAIT UNTIL (ACLK'EVENT AND ACLK = '1');
      
      --reset_axi_wraddrchan;   
   END axi_write_addr_channel;

-- AXI WRITE DATA CHANNEL
    PROCEDURE axi_write_data_channel (
      SIGNAL WID_in                  : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
      SIGNAL AWLEN_in                : IN std_logic_vector(3 DOWNTO 0))IS   
   
      VARIABLE i                      :  integer;   
      
   BEGIN
      i := 0;
      WHILE (i<=AWLEN_in) LOOP

        -- WRITE("IAM IN TO AXI_WRITE");
         WID <= WID_in;    
         WDATA <= (std_logic_vector(to_unsigned(i+1 * 1024,AXI_DWIDTH))); 
         WSTRB <= '1' & '1' & '1' & '1' & '1' & '1' & '1' & '1';   
         WVALID <= '1';
         IF (i < AWLEN_in) THEN
           WLAST <= '0';
         ELSE
           WLAST <= '1';
         END IF;
         
        -- WAIT UNTIL WREADY = '1';
         WHILE (WREADY = '0') LOOP
           WAIT UNTIL (ACLK'EVENT AND ACLK = '1');
         END LOOP;
         
         --WAIT UNTIL (ACLK'EVENT AND ACLK = '1');
         
         i := i + 1;
      END LOOP;
       WLAST <= '0';
      reset_axi_wrdatachan;   
   END axi_write_data_channel;

-- AXI WRITE RESPONSE CHANNEL
   PROCEDURE axi_write_response_channel IS
   BEGIN
      
      BREADY <= '1';    
      WAIT UNTIL (ACLK'EVENT AND ACLK = '1');
      
   END axi_write_response_channel;

-- WRITE CHANNEL 
   PROCEDURE axi_write (
    SIGNAL AWID_in                 : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);   
    SIGNAL AWADDR_in               : IN std_logic_vector(31 DOWNTO 0);   
    SIGNAL AWLEN_in                : IN std_logic_vector(3 DOWNTO 0);   
    SIGNAL AWSIZE_in               : IN std_logic_vector(2 DOWNTO 0);   
    SIGNAL AWBURST_in              : IN std_logic_vector(1 DOWNTO 0);   
    SIGNAL AWLOCK_in               : IN std_logic_vector(1 DOWNTO 0))IS
   
      
   BEGIN
      axi_write_addr_channel(AWID_in, AWADDR_in, AWLEN_in, AWSIZE_in, AWBURST_in, AWLOCK_in);   
      axi_write_data_channel(AWID_in, AWLEN_in);   
      axi_write_response_channel;   
      WRITE(" AXI WRITE address = " & to_hexstring(AWADDR_in));   
   END axi_write;

 
  -- PROCESS
      VARIABLE xhdl_initial : BOOLEAN := TRUE;
   BEGIN
      IF (xhdl_initial) THEN

        AWID <= (others => '0');    
        AWADDR <= (others => '0');    
        AWCACHE <= (others => '0');    
        AWPROT <= (others => '0');    
        AWLEN <= "0000";    
        AWSIZE <= "000";    
        AWBURST <= "00";    
        AWLOCK <= "00";    
        AWVALID <= '0';   

         WID <= (others => '0');    
         WDATA <= X"0000000000000000";
         WSTRB <= "00000000";    
         WLAST <= '0';    
         WVALID <= '0';    
         BREADY <= '0';    
         ARID <= (others => '0');    
         ARADDR <= (others => '0'); 
         ARCACHE <= (others => '0');    
         ARPROT <= (others => '0');    
         ARLEN <= "0000";    
         ARSIZE <= "000";    
         ARBURST <= "00";    
         ARLOCK <= "00";    
         ARVALID <= '0';  
         RDATA_TRIGGER <= '0';
         RREADY <= '1';   

         IF (M0_SLAVE0ENABLE = 1 )THEN
             ADDRESS_MSB <= "0000";
         END IF;
         IF (M0_SLAVE1ENABLE = 1)THEN
             ADDRESS_MSB <= "0001";
	 END IF;
         IF (M0_SLAVE2ENABLE = 1)THEN
             ADDRESS_MSB <= "0010";
	 END IF;
         IF (M0_SLAVE3ENABLE = 1)THEN
             ADDRESS_MSB <= "0011";
	 END IF;
         IF (M0_SLAVE4ENABLE = 1)THEN
             ADDRESS_MSB <= "0100";
	 END IF;
         IF (M0_SLAVE5ENABLE = 1)THEN
             ADDRESS_MSB <= "0101";
	 END IF;
         IF (M0_SLAVE6ENABLE = 1)THEN
             ADDRESS_MSB <= "0110";
	 END IF;
         IF (M0_SLAVE7ENABLE = 1)THEN
             ADDRESS_MSB <= "0111";
	 END IF;
         IF (M0_SLAVE8ENABLE = 1)THEN
             ADDRESS_MSB <= "1000";
	 END IF;
         IF (M0_SLAVE9ENABLE = 1)THEN
             ADDRESS_MSB <= X"9";
	 END IF;
         IF (M0_SLAVE10ENABLE = 1)THEN
             ADDRESS_MSB <= "1010";
	 END IF;
         IF (M0_SLAVE11ENABLE = 1)THEN
             ADDRESS_MSB <= "1011";
	 END IF;
         IF (M0_SLAVE12ENABLE = 1)THEN
             ADDRESS_MSB <= "1100";
	 END IF;
         IF (M0_SLAVE13ENABLE = 1)THEN
             ADDRESS_MSB <= "1101";
	 END IF;
         IF (M0_SLAVE14ENABLE = 1)THEN
             ADDRESS_MSB <= "1110";
	 END IF;
         IF (M0_SLAVE15ENABLE = 1)THEN
             ADDRESS_MSB <= "1111";
	 END IF;

	 IF (AXI_AWIDTH = 32) THEN
            ADDRESS0 <= X"0000000";
            ADDRESS1 <= X"0000004";
            ADDRESS2 <= X"0000008";
            ADDRESS3 <= X"000000C";
          END IF;

	  IF (AXI_AWIDTH = 28) THEN
            ADDRESS0 <= X"000000";
            ADDRESS1 <= X"000004";
            ADDRESS2 <= X"000008";
            ADDRESS3 <= X"00000C";
          END IF;
	  
	  IF (AXI_AWIDTH = 24) THEN
            ADDRESS0 <= X"00000";
            ADDRESS1 <= X"00004";
            ADDRESS2 <= X"00008";
            ADDRESS3 <= X"0000C";
          END IF;
	  
	  IF (AXI_AWIDTH = 20) THEN
            ADDRESS0 <= X"0000";
            ADDRESS1 <= X"0004";
            ADDRESS2 <= X"0008";
            ADDRESS3 <= X"000c";
          END IF;

	  IF (AXI_AWIDTH = 16) THEN
            ADDRESS0 <= X"000";
            ADDRESS1 <= X"004";
            ADDRESS2 <= X"008";
            ADDRESS3 <= X"00C";
          END IF;

	  IF (AXI_AWIDTH = 12) THEN
            ADDRESS0 <= X"00";
            ADDRESS1 <= X"04";
            ADDRESS2 <= X"08";
            ADDRESS3 <= X"0C";
          END IF;

	  IF (AXI_AWIDTH = 8) THEN
            ADDRESS0 <= X"0";
            ADDRESS1 <= X"4";
            ADDRESS2 <= X"8";
            ADDRESS3 <= X"C";
          END IF;

         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');

          --AWID_IN <= "0000";
          AWID_IN <= (others => '0');
          AWADDR_IN <=  ADDRESS_MSB & ADDRESS0;
          AWLEN_IN <= "0000";
          AWSIZE_IN <= "011";
          AWBURST_IN <= "01";
          AWLOCK_IN <= "10";
             axi_write(AWID_IN,AWADDR_IN,AWLEN_IN,AWSIZE_IN,AWBURST_IN,AWLOCK_IN);

         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');

          --AWID_IN <= "0001";
          AWID_IN <= (others => '0');
          AWADDR_IN <=  ADDRESS_MSB & ADDRESS1;
          --AWADDR_IN <= X"00000001";
          AWLEN_IN <= "0000";
          AWSIZE_IN <= "011";
          AWBURST_IN <= "01";
          AWLOCK_IN <= "10";
             axi_write(AWID_IN,AWADDR_IN,AWLEN_IN,AWSIZE_IN,AWBURST_IN,AWLOCK_IN);

         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');

          --AWID_IN <= "0010";
          AWID_IN <= (others => '0');
          AWADDR_IN <=  ADDRESS_MSB & ADDRESS2;
          --AWADDR_IN <= X"00000002";
          AWLEN_IN <= "0000";
          AWSIZE_IN <= "011";
          AWBURST_IN <= "01";
          AWLOCK_IN <= "10";
             axi_write(AWID_IN,AWADDR_IN,AWLEN_IN,AWSIZE_IN,AWBURST_IN,AWLOCK_IN);

         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');

          --AWID_IN <= "0011";
          AWID_IN <= (others => '0');
          AWADDR_IN <=  ADDRESS_MSB & ADDRESS3;
          --AWADDR_IN <= X"00000003";
          AWLEN_IN <= "0000";
          AWSIZE_IN <= "011";
          AWBURST_IN <= "01";
          AWLOCK_IN <= "10";
             axi_write(AWID_IN,AWADDR_IN,AWLEN_IN,AWSIZE_IN,AWBURST_IN,AWLOCK_IN);

         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');

          ARID_IN <= (others => '0');
          ARADDR_IN <=  ADDRESS_MSB & ADDRESS0;
          --ARADDR_IN <= X"00000000";
          ARLEN_IN <= "0000";
          ARSIZE_IN <= "011";
          ARBURST_IN <= "01";
          ARLOCK_IN <= "10";
             axi_read(ARID_IN,ARADDR_IN,ARLEN_IN,ARSIZE_IN,ARBURST_IN,ARLOCK_IN);

         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');

          --ARID_IN <= "0001";
          ARID_IN <= (others => '0');
          ARADDR_IN <=  ADDRESS_MSB & ADDRESS1;
          --ARADDR_IN <= X"00000001";
          ARLEN_IN <= "0000";
          ARSIZE_IN <= "011";
          ARBURST_IN <= "01";
          ARLOCK_IN <= "10";
            axi_read(ARID_IN,ARADDR_IN,ARLEN_IN,ARSIZE_IN,ARBURST_IN,ARLOCK_IN);

         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');

          --ARID_IN <= "0010";
          ARID_IN <= (others => '0');
          ARADDR_IN <=  ADDRESS_MSB & ADDRESS2;
         -- ARADDR_IN <= X"00000002";
          ARLEN_IN <= "0000";
          ARSIZE_IN <= "011";
          ARBURST_IN <= "01";
          ARLOCK_IN <= "10";
             axi_read(ARID_IN,ARADDR_IN,ARLEN_IN,ARSIZE_IN,ARBURST_IN,ARLOCK_IN);
         
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');

          --ARID_IN <= "0011";
          ARID_IN <= (others => '0');
          ARADDR_IN <=  ADDRESS_MSB & ADDRESS3;
          --ARADDR_IN <= X"00000003";
          ARLEN_IN <= "0000";
          ARSIZE_IN <= "011";
          ARBURST_IN <= "01";
          ARLOCK_IN <= "10";
             axi_read(ARID_IN,ARADDR_IN,ARLEN_IN,ARSIZE_IN,ARBURST_IN,ARLOCK_IN);

         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');
         WAIT UNTIL(ACLK'EVENT AND ACLK = '1');

         END_OF_SIMULATION <= TRUE;

        -- END IF;
         xhdl_initial := FALSE;
      ELSE
         WAIT;
      END IF;
   END PROCESS;

END translated;
