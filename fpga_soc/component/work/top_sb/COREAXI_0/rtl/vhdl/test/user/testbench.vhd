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

ENTITY testbench IS
 END testbench;

ARCHITECTURE translated OF testbench IS

  CONSTANT xhdl_timescale         : time := 1 ns;
  CONSTANT AXI_CLK_PERIOD         : INTEGER := 5;

   COMPONENT top_sb_COREAXI_0_COREAXI
      GENERIC (
         -- --------------------------------------------------------------------------
         -- Parameter Declaration
         -- --------------------------------------------------------------------------
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
         -- --------------------------------------------------------------------------
-- I/O Declaration
-- --------------------------------------------------------------------------
-- Global signals

         ACLK                    : IN std_logic;   
         ARESETN                 : IN std_logic;   
         -- MASTER 0
-- AXI MASTER 0 write address channel signals

         AWID_M0                 : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
         AWADDR_M0               : IN std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_M0                : IN std_logic_vector(3 DOWNTO 0);   
         AWSIZE_M0               : IN std_logic_vector(2 DOWNTO 0);   
         AWBURST_M0              : IN std_logic_vector(1 DOWNTO 0);   
         AWLOCK_M0               : IN std_logic_vector(1 DOWNTO 0);   
         AWCACHE_M0              : IN std_logic_vector(3 DOWNTO 0);   
         AWPROT_M0               : IN std_logic_vector(2 DOWNTO 0);   
         AWVALID_M0              : IN std_logic;   
         AWREADY_M0              : OUT std_logic;   
         -- AXI MASTER 0 write data channel signals

         WID_M0                  : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
         WDATA_M0                : IN std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_M0                : IN std_logic_vector(7 DOWNTO 
         0);   
         WLAST_M0                : IN std_logic;   
         WVALID_M0               : IN std_logic;   
         WREADY_M0               : OUT std_logic;   
         -- AXI MASTER 0 write response channel signals

         BID_M0                  : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0); 
         BRESP_M0                : OUT std_logic_vector(1 DOWNTO 0);   
         BVALID_M0               : OUT std_logic;   
         BREADY_M0               : IN std_logic;   
         -- AXI MASTER 0 read address channel signals

         ARID_M0                 : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
         ARADDR_M0               : IN std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_M0                : IN std_logic_vector(3 DOWNTO 0);   
         ARSIZE_M0               : IN std_logic_vector(2 DOWNTO 0);   
         ARBURST_M0              : IN std_logic_vector(1 DOWNTO 0);   
         ARLOCK_M0               : IN std_logic_vector(1 DOWNTO 0);   
         ARCACHE_M0              : IN std_logic_vector(3 DOWNTO 0);   
         ARPROT_M0               : IN std_logic_vector(2 DOWNTO 0);   
         ARVALID_M0              : IN std_logic;   
         ARREADY_M0              : OUT std_logic;   
         -- AXI MASTER 0 read response channel signals

         RID_M0                  : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0); 
         RDATA_M0                : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_M0                : OUT std_logic_vector(1 DOWNTO 0);   
         RLAST_M0                : OUT std_logic;   
         RVALID_M0               : OUT std_logic;   
         RREADY_M0               : IN std_logic;   
         -- MASTER 1
-- AXI MASTER 0 write address channel signals

         AWID_M1                 : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
         AWADDR_M1               : IN std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_M1                : IN std_logic_vector(3 DOWNTO 0);   
         AWSIZE_M1               : IN std_logic_vector(2 DOWNTO 0);   
         AWBURST_M1              : IN std_logic_vector(1 DOWNTO 0);   
         AWLOCK_M1               : IN std_logic_vector(1 DOWNTO 0);   
         AWCACHE_M1              : IN std_logic_vector(3 DOWNTO 0);   
         AWPROT_M1               : IN std_logic_vector(2 DOWNTO 0);   
         AWVALID_M1              : IN std_logic;   
         AWREADY_M1              : OUT std_logic;   
         -- AXI MASTER 0 write data channel signals

         WID_M1                  : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
         WDATA_M1                : IN std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_M1                : IN std_logic_vector(7 DOWNTO 
         0);   
         WLAST_M1                : IN std_logic;   
         WVALID_M1               : IN std_logic;   
         WREADY_M1               : OUT std_logic;   
         -- AXI MASTER 0 write response channel signals

         BID_M1                  : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0); 
         BRESP_M1                : OUT std_logic_vector(1 DOWNTO 0);   
         BVALID_M1               : OUT std_logic;   
         BREADY_M1               : IN std_logic;   
         -- AXI MASTER 0 read address channel signals

         ARID_M1                 : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
         ARADDR_M1               : IN std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_M1                : IN std_logic_vector(3 DOWNTO 0);   
         ARSIZE_M1               : IN std_logic_vector(2 DOWNTO 0);   
         ARBURST_M1              : IN std_logic_vector(1 DOWNTO 0);   
         ARLOCK_M1               : IN std_logic_vector(1 DOWNTO 0);   
         ARCACHE_M1              : IN std_logic_vector(3 DOWNTO 0);   
         ARPROT_M1               : IN std_logic_vector(2 DOWNTO 0);   
         ARVALID_M1              : IN std_logic;   
         ARREADY_M1              : OUT std_logic;   
         -- AXI MASTER 0 read response channel signals

         RID_M1                  : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0); 
         RDATA_M1                : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_M1                : OUT std_logic_vector(1 DOWNTO 0);   
         RLAST_M1                : OUT std_logic;   
         RVALID_M1               : OUT std_logic;   
         RREADY_M1               : IN std_logic;   
         -- MASTER 2
-- AXI MASTER 0 write address channel signals

         AWID_M2                 : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
         AWADDR_M2               : IN std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_M2                : IN std_logic_vector(3 DOWNTO 0);   
         AWSIZE_M2               : IN std_logic_vector(2 DOWNTO 0);   
         AWBURST_M2              : IN std_logic_vector(1 DOWNTO 0);   
         AWLOCK_M2               : IN std_logic_vector(1 DOWNTO 0);   
         AWCACHE_M2              : IN std_logic_vector(3 DOWNTO 0);   
         AWPROT_M2               : IN std_logic_vector(2 DOWNTO 0);   
         AWVALID_M2              : IN std_logic;   
         AWREADY_M2              : OUT std_logic;   
         -- AXI MASTER 0 write data channel signals

         WID_M2                  : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
         WDATA_M2                : IN std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_M2                : IN std_logic_vector(7 DOWNTO 
         0);   
         WLAST_M2                : IN std_logic;   
         WVALID_M2               : IN std_logic;   
         WREADY_M2               : OUT std_logic;   
         -- AXI MASTER 0 write response channel signals

         BID_M2                  : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0); 
         BRESP_M2                : OUT std_logic_vector(1 DOWNTO 0);   
         BVALID_M2               : OUT std_logic;   
         BREADY_M2               : IN std_logic;   
         -- AXI MASTER 0 read address channel signals

         ARID_M2                 : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
         ARADDR_M2               : IN std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_M2                : IN std_logic_vector(3 DOWNTO 0);   
         ARSIZE_M2               : IN std_logic_vector(2 DOWNTO 0);   
         ARBURST_M2              : IN std_logic_vector(1 DOWNTO 0);   
         ARLOCK_M2               : IN std_logic_vector(1 DOWNTO 0);   
         ARCACHE_M2              : IN std_logic_vector(3 DOWNTO 0);   
         ARPROT_M2               : IN std_logic_vector(2 DOWNTO 0);   
         ARVALID_M2              : IN std_logic;   
         ARREADY_M2              : OUT std_logic;   
         -- AXI MASTER 0 read response channel signals

         RID_M2                  : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0); 
         RDATA_M2                : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_M2                : OUT std_logic_vector(1 DOWNTO 0);   
         RLAST_M2                : OUT std_logic;   
         RVALID_M2               : OUT std_logic;   
         RREADY_M2               : IN std_logic;   
         -- MASTER 3
-- AXI MASTER 0 write address channel signals

         AWID_M3                 : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
         AWADDR_M3               : IN std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_M3                : IN std_logic_vector(3 DOWNTO 0);   
         AWSIZE_M3               : IN std_logic_vector(2 DOWNTO 0);   
         AWBURST_M3              : IN std_logic_vector(1 DOWNTO 0);   
         AWLOCK_M3               : IN std_logic_vector(1 DOWNTO 0);   
         AWCACHE_M3              : IN std_logic_vector(3 DOWNTO 0);   
         AWPROT_M3               : IN std_logic_vector(2 DOWNTO 0);   
         AWVALID_M3              : IN std_logic;   
         AWREADY_M3              : OUT std_logic;   
         -- AXI MASTER 0 write data channel signals

         WID_M3                  : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
         WDATA_M3                : IN std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_M3                : IN std_logic_vector(7 DOWNTO 
         0);   
         WLAST_M3                : IN std_logic;   
         WVALID_M3               : IN std_logic;   
         WREADY_M3               : OUT std_logic;   
         -- AXI MASTER 0 write response channel signals

         BID_M3                  : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0); 
         BRESP_M3                : OUT std_logic_vector(1 DOWNTO 0);   
         BVALID_M3               : OUT std_logic;   
         BREADY_M3               : IN std_logic;   
         -- AXI MASTER 0 read address channel signals

         ARID_M3                 : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
         ARADDR_M3               : IN std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_M3                : IN std_logic_vector(3 DOWNTO 0);   
         ARSIZE_M3               : IN std_logic_vector(2 DOWNTO 0);   
         ARBURST_M3              : IN std_logic_vector(1 DOWNTO 0);   
         ARLOCK_M3               : IN std_logic_vector(1 DOWNTO 0);   
         ARCACHE_M3              : IN std_logic_vector(3 DOWNTO 0);   
         ARPROT_M3               : IN std_logic_vector(2 DOWNTO 0);   
         ARVALID_M3              : IN std_logic;   
         ARREADY_M3              : OUT std_logic;   
         -- AXI MASTER 0 read response channel signals

         RID_M3                  : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0); 
         RDATA_M3                : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_M3                : OUT std_logic_vector(1 DOWNTO 0);   
         RLAST_M3                : OUT std_logic;   
         RVALID_M3               : OUT std_logic;   
         RREADY_M3               : IN std_logic;   
         -- SLAVE 0
-- AXI SLAVE 0 write address channel signals

         AWID_S0                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_S0               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_S0                : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_S0               : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_S0              : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_S0               : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_S0              : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_S0               : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_S0              : OUT std_logic;   
         AWREADY_S0              : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_S0                  : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_S0                : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_S0                : OUT std_logic_vector(7 
         DOWNTO 0);   
         WLAST_S0                : OUT std_logic;   
         WVALID_S0               : OUT std_logic;   
         WREADY_S0               : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_S0                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_S0                : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_S0               : IN std_logic;   
         BREADY_S0               : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_S0                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_S0               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_S0                : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_S0               : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_S0              : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_S0               : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_S0              : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_S0               : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_S0              : OUT std_logic;   
         ARREADY_S0              : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_S0                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_S0                : IN std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_S0                : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_S0                : IN std_logic;   
         RVALID_S0               : IN std_logic;   
         RREADY_S0               : OUT std_logic;   
         -- SLAVE 1
-- AXI SLAVE 1 write address channel signals

         AWID_S1                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_S1               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_S1                : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_S1               : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_S1              : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_S1               : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_S1              : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_S1               : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_S1              : OUT std_logic;   
         AWREADY_S1              : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_S1                  : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_S1                : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_S1                : OUT std_logic_vector(7 
         DOWNTO 0);   
         WLAST_S1                : OUT std_logic;   
         WVALID_S1               : OUT std_logic;   
         WREADY_S1               : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_S1                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_S1                : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_S1               : IN std_logic;   
         BREADY_S1               : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_S1                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_S1               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_S1                : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_S1               : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_S1              : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_S1               : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_S1              : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_S1               : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_S1              : OUT std_logic;   
         ARREADY_S1              : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_S1                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_S1                : IN std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_S1                : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_S1                : IN std_logic;   
         RVALID_S1               : IN std_logic;   
         RREADY_S1               : OUT std_logic;   
         -- SLAVE 2
-- AXI SLAVE 2 write address channel signals

         AWID_S2                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_S2               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_S2                : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_S2               : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_S2              : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_S2               : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_S2              : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_S2               : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_S2              : OUT std_logic;   
         AWREADY_S2              : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_S2                  : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_S2                : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_S2                : OUT std_logic_vector(7 
         DOWNTO 0);   
         WLAST_S2                : OUT std_logic;   
         WVALID_S2               : OUT std_logic;   
         WREADY_S2               : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_S2                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_S2                : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_S2               : IN std_logic;   
         BREADY_S2               : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_S2                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_S2               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_S2                : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_S2               : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_S2              : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_S2               : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_S2              : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_S2               : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_S2              : OUT std_logic;   
         ARREADY_S2              : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_S2                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_S2                : IN std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_S2                : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_S2                : IN std_logic;   
         RVALID_S2               : IN std_logic;   
         RREADY_S2               : OUT std_logic;   
         -- SLAVE 3
-- AXI SLAVE 3 write address channel signals

         AWID_S3                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_S3               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_S3                : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_S3               : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_S3              : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_S3               : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_S3              : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_S3               : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_S3              : OUT std_logic;   
         AWREADY_S3              : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_S3                  : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_S3                : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_S3                : OUT std_logic_vector(7 
         DOWNTO 0);   
         WLAST_S3                : OUT std_logic;   
         WVALID_S3               : OUT std_logic;   
         WREADY_S3               : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_S3                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_S3                : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_S3               : IN std_logic;   
         BREADY_S3               : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_S3                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_S3               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_S3                : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_S3               : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_S3              : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_S3               : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_S3              : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_S3               : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_S3              : OUT std_logic;   
         ARREADY_S3              : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_S3                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_S3                : IN std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_S3                : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_S3                : IN std_logic;   
         RVALID_S3               : IN std_logic;   
         RREADY_S3               : OUT std_logic;   
         -- SLAVE 4
-- AXI SLAVE 4 write address channel signals

         AWID_S4                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_S4               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_S4                : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_S4               : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_S4              : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_S4               : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_S4              : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_S4               : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_S4              : OUT std_logic;   
         AWREADY_S4              : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_S4                  : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_S4                : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_S4                : OUT std_logic_vector(7 
         DOWNTO 0);   
         WLAST_S4                : OUT std_logic;   
         WVALID_S4               : OUT std_logic;   
         WREADY_S4               : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_S4                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_S4                : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_S4               : IN std_logic;   
         BREADY_S4               : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_S4                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_S4               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_S4                : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_S4               : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_S4              : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_S4               : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_S4              : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_S4               : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_S4              : OUT std_logic;   
         ARREADY_S4              : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_S4                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_S4                : IN std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_S4                : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_S4                : IN std_logic;   
         RVALID_S4               : IN std_logic;   
         RREADY_S4               : OUT std_logic;   
         -- SLAVE 5
-- AXI SLAVE 5 write address channel signals

         AWID_S5                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_S5               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_S5                : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_S5               : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_S5              : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_S5               : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_S5              : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_S5               : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_S5              : OUT std_logic;   
         AWREADY_S5              : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_S5                  : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_S5                : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_S5                : OUT std_logic_vector(7 
         DOWNTO 0);   
         WLAST_S5                : OUT std_logic;   
         WVALID_S5               : OUT std_logic;   
         WREADY_S5               : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_S5                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_S5                : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_S5               : IN std_logic;   
         BREADY_S5               : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_S5                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_S5               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_S5                : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_S5               : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_S5              : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_S5               : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_S5              : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_S5               : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_S5              : OUT std_logic;   
         ARREADY_S5              : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_S5                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_S5                : IN std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_S5                : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_S5                : IN std_logic;   
         RVALID_S5               : IN std_logic;   
         RREADY_S5               : OUT std_logic;   
         -- SLAVE 6
-- AXI SLAVE 6 write address channel signals

         AWID_S6                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_S6               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_S6                : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_S6               : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_S6              : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_S6               : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_S6              : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_S6               : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_S6              : OUT std_logic;   
         AWREADY_S6              : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_S6                  : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_S6                : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_S6                : OUT std_logic_vector(7 
         DOWNTO 0);   
         WLAST_S6                : OUT std_logic;   
         WVALID_S6               : OUT std_logic;   
         WREADY_S6               : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_S6                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_S6                : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_S6               : IN std_logic;   
         BREADY_S6               : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_S6                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_S6               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_S6                : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_S6               : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_S6              : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_S6               : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_S6              : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_S6               : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_S6              : OUT std_logic;   
         ARREADY_S6              : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_S6                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_S6                : IN std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_S6                : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_S6                : IN std_logic;   
         RVALID_S6               : IN std_logic;   
         RREADY_S6               : OUT std_logic;   
         -- SLAVE 7
-- AXI SLAVE 7 write address channel signals

         AWID_S7                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_S7               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_S7                : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_S7               : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_S7              : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_S7               : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_S7              : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_S7               : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_S7              : OUT std_logic;   
         AWREADY_S7              : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_S7                  : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_S7                : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_S7                : OUT std_logic_vector(7 
         DOWNTO 0);   
         WLAST_S7                : OUT std_logic;   
         WVALID_S7               : OUT std_logic;   
         WREADY_S7               : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_S7                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_S7                : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_S7               : IN std_logic;   
         BREADY_S7               : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_S7                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_S7               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_S7                : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_S7               : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_S7              : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_S7               : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_S7              : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_S7               : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_S7              : OUT std_logic;   
         ARREADY_S7              : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_S7                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_S7                : IN std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_S7                : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_S7                : IN std_logic;   
         RVALID_S7               : IN std_logic;   
         RREADY_S7               : OUT std_logic;   
         -- SLAVE 8
-- AXI SLAVE 8 write address channel signals

         AWID_S8                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_S8               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_S8                : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_S8               : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_S8              : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_S8               : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_S8              : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_S8               : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_S8              : OUT std_logic;   
         AWREADY_S8              : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_S8                  : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_S8                : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_S8                : OUT std_logic_vector(7 
         DOWNTO 0);   
         WLAST_S8                : OUT std_logic;   
         WVALID_S8               : OUT std_logic;   
         WREADY_S8               : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_S8                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_S8                : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_S8               : IN std_logic;   
         BREADY_S8               : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_S8                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_S8               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_S8                : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_S8               : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_S8              : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_S8               : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_S8              : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_S8               : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_S8              : OUT std_logic;   
         ARREADY_S8              : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_S8                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_S8                : IN std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_S8                : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_S8                : IN std_logic;   
         RVALID_S8               : IN std_logic;   
         RREADY_S8               : OUT std_logic;   
         -- SLAVE 9
-- AXI SLAVE 9 write address channel signals

         AWID_S9                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_S9               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_S9                : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_S9               : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_S9              : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_S9               : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_S9              : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_S9               : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_S9              : OUT std_logic;   
         AWREADY_S9              : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_S9                  : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_S9                : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_S9                : OUT std_logic_vector(7 
         DOWNTO 0);   
         WLAST_S9                : OUT std_logic;   
         WVALID_S9               : OUT std_logic;   
         WREADY_S9               : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_S9                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_S9                : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_S9               : IN std_logic;   
         BREADY_S9               : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_S9                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_S9               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_S9                : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_S9               : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_S9              : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_S9               : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_S9              : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_S9               : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_S9              : OUT std_logic;   
         ARREADY_S9              : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_S9                  : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_S9                : IN std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_S9                : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_S9                : IN std_logic;   
         RVALID_S9               : IN std_logic;   
         RREADY_S9               : OUT std_logic;   
         -- SLAVE 10
-- AXI SLAVE 10 write address channel signals

         AWID_S10                : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_S10              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_S10               : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_S10              : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_S10             : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_S10              : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_S10             : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_S10              : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_S10             : OUT std_logic;   
         AWREADY_S10             : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_S10                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_S10               : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_S10               : OUT std_logic_vector(7 
         DOWNTO 0);   
         WLAST_S10               : OUT std_logic;   
         WVALID_S10              : OUT std_logic;   
         WREADY_S10              : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_S10                 : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_S10               : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_S10              : IN std_logic;   
         BREADY_S10              : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_S10                : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_S10              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_S10               : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_S10              : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_S10             : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_S10              : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_S10             : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_S10              : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_S10             : OUT std_logic;   
         ARREADY_S10             : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_S10                 : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_S10               : IN std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_S10               : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_S10               : IN std_logic;   
         RVALID_S10              : IN std_logic;   
         RREADY_S10              : OUT std_logic;   
         -- SLAVE 11
-- AXI SLAVE 11 write address channel signals

         AWID_S11                : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_S11              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_S11               : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_S11              : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_S11             : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_S11              : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_S11             : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_S11              : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_S11             : OUT std_logic;   
         AWREADY_S11             : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_S11                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_S11               : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_S11               : OUT std_logic_vector(7 
         DOWNTO 0);   
         WLAST_S11               : OUT std_logic;   
         WVALID_S11              : OUT std_logic;   
         WREADY_S11              : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_S11                 : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_S11               : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_S11              : IN std_logic;   
         BREADY_S11              : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_S11                : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_S11              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_S11               : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_S11              : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_S11             : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_S11              : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_S11             : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_S11              : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_S11             : OUT std_logic;   
         ARREADY_S11             : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_S11                 : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_S11               : IN std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_S11               : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_S11               : IN std_logic;   
         RVALID_S11              : IN std_logic;   
         RREADY_S11              : OUT std_logic;   
         -- SLAVE 12
-- AXI SLAVE 12 write address channel signals

         AWID_S12                : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_S12              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_S12               : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_S12              : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_S12             : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_S12              : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_S12             : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_S12              : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_S12             : OUT std_logic;   
         AWREADY_S12             : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_S12                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_S12               : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_S12               : OUT std_logic_vector(7 
         DOWNTO 0);   
         WLAST_S12               : OUT std_logic;   
         WVALID_S12              : OUT std_logic;   
         WREADY_S12              : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_S12                 : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_S12               : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_S12              : IN std_logic;   
         BREADY_S12              : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_S12                : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_S12              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_S12               : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_S12              : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_S12             : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_S12              : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_S12             : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_S12              : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_S12             : OUT std_logic;   
         ARREADY_S12             : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_S12                 : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_S12               : IN std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_S12               : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_S12               : IN std_logic;   
         RVALID_S12              : IN std_logic;   
         RREADY_S12              : OUT std_logic;   
         -- SLAVE 13
-- AXI SLAVE 13 write address channel signals

         AWID_S13                : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_S13              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_S13               : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_S13              : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_S13             : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_S13              : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_S13             : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_S13              : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_S13             : OUT std_logic;   
         AWREADY_S13             : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_S13                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_S13               : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_S13               : OUT std_logic_vector(7 
         DOWNTO 0);   
         WLAST_S13               : OUT std_logic;   
         WVALID_S13              : OUT std_logic;   
         WREADY_S13              : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_S13                 : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_S13               : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_S13              : IN std_logic;   
         BREADY_S13              : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_S13                : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_S13              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_S13               : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_S13              : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_S13             : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_S13              : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_S13             : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_S13              : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_S13             : OUT std_logic;   
         ARREADY_S13             : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_S13                 : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_S13               : IN std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_S13               : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_S13               : IN std_logic;   
         RVALID_S13              : IN std_logic;   
         RREADY_S13              : OUT std_logic;   
         -- SLAVE 14
-- AXI SLAVE 14 write address channel signals

         AWID_S14                : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_S14              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_S14               : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_S14              : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_S14             : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_S14              : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_S14             : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_S14              : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_S14             : OUT std_logic;   
         AWREADY_S14             : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_S14                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_S14               : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_S14               : OUT std_logic_vector(7 
         DOWNTO 0);   
         WLAST_S14               : OUT std_logic;   
         WVALID_S14              : OUT std_logic;   
         WREADY_S14              : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_S14                 : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_S14               : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_S14              : IN std_logic;   
         BREADY_S14              : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_S14                : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_S14              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_S14               : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_S14              : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_S14             : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_S14              : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_S14             : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_S14              : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_S14             : OUT std_logic;   
         ARREADY_S14             : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_S14                 : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_S14               : IN std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_S14               : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_S14               : IN std_logic;   
         RVALID_S14              : IN std_logic;   
         RREADY_S14              : OUT std_logic;   
         -- SLAVE 15
-- AXI SLAVE 15 write address channel signals

         AWID_S15                : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_S15              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_S15               : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_S15              : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_S15             : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_S15              : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_S15             : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_S15              : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_S15             : OUT std_logic;   
         AWREADY_S15             : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_S15                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_S15               : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_S15               : OUT std_logic_vector(7 
         DOWNTO 0);   
         WLAST_S15               : OUT std_logic;   
         WVALID_S15              : OUT std_logic;   
         WREADY_S15              : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_S15                 : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_S15               : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_S15              : IN std_logic;   
         BREADY_S15              : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_S15                : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_S15              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_S15               : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_S15              : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_S15             : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_S15              : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_S15             : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_S15              : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_S15             : OUT std_logic;   
         ARREADY_S15             : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_S15                 : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_S15               : IN std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_S15               : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_S15               : IN std_logic;   
         RVALID_S15              : IN std_logic;   
         RREADY_S15              : OUT std_logic;   
         -- SLAVE 16
-- AXI SLAVE 16 write address channel signals

         AWID_S16                : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_S16              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_S16               : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_S16              : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_S16             : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_S16              : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_S16             : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_S16              : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_S16             : OUT std_logic;   
         AWREADY_S16             : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_S16                 : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_S16               : OUT std_logic_vector(63 DOWNTO 0)
         ;   
         WSTRB_S16               : OUT std_logic_vector(7 
         DOWNTO 0);   
         WLAST_S16               : OUT std_logic;   
         WVALID_S16              : OUT std_logic;   
         WREADY_S16              : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_S16                 : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_S16               : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_S16              : IN std_logic;   
         BREADY_S16              : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_S16                : OUT std_logic_vector(2 + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_S16              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_S16               : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_S16              : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_S16             : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_S16              : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_S16             : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_S16              : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_S16             : OUT std_logic;   
         ARREADY_S16             : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_S16                 : IN std_logic_vector(2 + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_S16               : IN std_logic_vector(63 DOWNTO 0)
         ;   
         RRESP_S16               : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_S16               : IN std_logic;   
         RVALID_S16              : IN std_logic;   
         RREADY_S16              : OUT std_logic);
   END COMPONENT;

  COMPONENT axi_master
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
         ACLK                    : IN  std_logic;
         ARESETN                 : IN  std_logic;
                                 
         AWREADY                 : IN std_logic;
         ARREADY                 : IN std_logic;
         WREADY                  : IN std_logic;
         BID                     : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
         BRESP                   : IN std_logic_vector(1 DOWNTO 0);
         BVALID                  : IN std_logic;
         RID                     : IN std_logic_vector(ID_WIDTH - 1  DOWNTO 0);
         RDATA                   : IN std_logic_vector(63 DOWNTO 0);
         RRESP                    : IN std_logic_vector(1 DOWNTO 0);
         RVALID                  : IN std_logic;
         RLAST                   : IN std_logic;

   --    OUTPUTS 
         AWID                    : OUT std_logic_vector(ID_WIDTH - 1  DOWNTO 0);
         AWADDR                  : OUT std_logic_vector(31 DOWNTO 0);
         AWLEN                   : OUT std_logic_vector(3 DOWNTO 0);
         AWSIZE                  : OUT std_logic_vector(2 DOWNTO 0);  
         AWBURST                 : OUT std_logic_vector(1 DOWNTO 0);
         AWLOCK                  : OUT std_logic_vector(1 DOWNTO 0);
         AWCACHE                 : OUT  std_logic_vector(3 DOWNTO 0);
         AWPROT                  : OUT  std_logic_vector(2 DOWNTO 0);
         AWVALID                 : OUT std_logic;

         WID                     : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
         WDATA                   : OUT std_logic_vector(63 DOWNTO 0);
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
         TRIGGER_M0              : IN std_logic;
         RDATA_TRIGGER           : OUT std_logic;
         END_OF_SIMULATION       : OUT boolean
 );
   END COMPONENT;

  COMPONENT axi_slave
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
         ACLK                    : IN  std_logic;
         ARESETN                 : IN  std_logic;
         AWID                    : IN  std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
         AWADDR                  : IN  std_logic_vector(31 DOWNTO 0);
         AWLEN                   : IN  std_logic_vector(3 DOWNTO 0);
         AWSIZE                  : IN  std_logic_vector(2 DOWNTO 0);
         AWBURST                 : IN  std_logic_vector(1 DOWNTO 0);
         AWLOCK                  : IN  std_logic_vector(1 DOWNTO 0);
         AWCACHE                 : IN  std_logic_vector(3 DOWNTO 0);
         AWPROT                  : IN  std_logic_vector(2 DOWNTO 0);
         AWVALID                 : IN  std_logic;
         AWREADY                 : OUT std_logic;

         WID                     : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
         WDATA                   : IN std_logic_vector(63 DOWNTO 0);
         WSTRB                   : IN std_logic_vector(7 DOWNTO 0);
         WLAST                   : IN std_logic;
         WVALID                  : IN std_logic;
         WREADY                  : OUT std_logic;
         
         RID                     : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
         RDATA                   : OUT std_logic_vector(63 DOWNTO 0);
         RRESP                   : OUT std_logic_vector(1 DOWNTO 0);
         RVALID                  : OUT std_logic;
         RLAST                   : OUT std_logic;
         RREADY                  : IN  std_logic;

         ARID                    : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
         ARADDR                  : IN std_logic_vector(31 DOWNTO 0);
         ARLEN                   : IN std_logic_vector(3 DOWNTO 0);
         ARSIZE                  : IN std_logic_vector(2 DOWNTO 0);
         ARBURST                 : IN std_logic_vector(1 DOWNTO 0);
         ARLOCK                  : IN std_logic_vector(1 DOWNTO 0);
         ARCACHE                 : IN std_logic_vector(3 DOWNTO 0);
         ARPROT                  : IN std_logic_vector(2 DOWNTO 0);
         ARVALID                 : IN std_logic;
         ARREADY                 : OUT std_logic;
      
         BID                     : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0);
         BRESP                   : OUT std_logic_vector(1 DOWNTO 0);
         BVALID                  : OUT std_logic;
         BREADY                  : IN std_logic;
         
         RDATA_TRIGGER           : IN std_logic
     );
   END COMPONENT;

   CONSTANT  AXI_CLK_PERIO         :  real := 1.25;    
   SIGNAL ACLK                     :  std_logic;   
   SIGNAL ARESETN                  :  std_logic;   

   SIGNAL AWID_M0                  :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL AWADDR_M0                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_M0                 :  std_logic_vector(3 downto 0);   
   SIGNAL AWSIZE_M0                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_M0               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_M0                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_M0               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_M0                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_M0               :  std_logic;   
   SIGNAL AWREADY_M0               :  std_logic;   
   SIGNAL WID_M0                   :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL WDATA_M0                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_M0                 :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_M0                 :  std_logic;   
   SIGNAL WVALID_M0                :  std_logic;   
   SIGNAL WREADY_M0                :  std_logic;   
   SIGNAL BID_M0                   :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL BRESP_M0                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_M0                :  std_logic;   
   SIGNAL BREADY_M0                :  std_logic;   
   SIGNAL ARID_M0                  :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL ARADDR_M0                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_M0                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_M0                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_M0               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_M0                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_M0               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_M0                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_M0               :  std_logic;   
   SIGNAL ARREADY_M0               :  std_logic;   
   SIGNAL RID_M0                   :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL RDATA_M0                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_M0                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_M0                 :  std_logic;   
   SIGNAL RVALID_M0                :  std_logic;   
   SIGNAL RREADY_M0                :  std_logic;   
  
   SIGNAL AWID_M1                  :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL AWADDR_M1                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_M1                 :  std_logic_vector(3 downto 0);   
   SIGNAL AWSIZE_M1                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_M1               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_M1                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_M1               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_M1                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_M1               :  std_logic;   
   SIGNAL AWREADY_M1               :  std_logic;   
   SIGNAL WID_M1                   :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL WDATA_M1                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_M1                 :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_M1                 :  std_logic;   
   SIGNAL WVALID_M1                :  std_logic;   
   SIGNAL WREADY_M1                :  std_logic;   
   SIGNAL BID_M1                   :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL BRESP_M1                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_M1                :  std_logic;   
   SIGNAL BREADY_M1                :  std_logic;   
   SIGNAL ARID_M1                  :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL ARADDR_M1                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_M1                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_M1                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_M1               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_M1                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_M1               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_M1                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_M1               :  std_logic;   
   SIGNAL ARREADY_M1               :  std_logic;   
   SIGNAL RID_M1                   :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL RDATA_M1                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_M1                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_M1                 :  std_logic;   
   SIGNAL RVALID_M1                :  std_logic;   
   SIGNAL RREADY_M1                :  std_logic;   
  
   SIGNAL AWID_M2                  :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL AWADDR_M2                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_M2                 :  std_logic_vector(3 downto 0);   
   SIGNAL AWSIZE_M2                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_M2               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_M2                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_M2               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_M2                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_M2               :  std_logic;   
   SIGNAL AWREADY_M2               :  std_logic;   
   SIGNAL WID_M2                   :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL WDATA_M2                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_M2                 :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_M2                 :  std_logic;   
   SIGNAL WVALID_M2                :  std_logic;   
   SIGNAL WREADY_M2                :  std_logic;   
   SIGNAL BID_M2                   :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL BRESP_M2                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_M2                :  std_logic;   
   SIGNAL BREADY_M2                :  std_logic;   
   SIGNAL ARID_M2                  :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL ARADDR_M2                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_M2                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_M2                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_M2               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_M2                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_M2               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_M2                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_M2               :  std_logic;   
   SIGNAL ARREADY_M2               :  std_logic;   
   SIGNAL RID_M2                   :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL RDATA_M2                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_M2                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_M2                 :  std_logic;   
   SIGNAL RVALID_M2                :  std_logic;   
   SIGNAL RREADY_M2                :  std_logic;   
  
   SIGNAL AWID_M3                  :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL AWADDR_M3                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_M3                 :  std_logic_vector(3 downto 0);   
   SIGNAL AWSIZE_M3                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_M3               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_M3                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_M3               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_M3                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_M3               :  std_logic;   
   SIGNAL AWREADY_M3               :  std_logic;   
   SIGNAL WID_M3                   :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL WDATA_M3                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_M3                 :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_M3                 :  std_logic;   
   SIGNAL WVALID_M3                :  std_logic;   
   SIGNAL WREADY_M3                :  std_logic;   
   SIGNAL BID_M3                   :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL BRESP_M3                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_M3                :  std_logic;   
   SIGNAL BREADY_M3                :  std_logic;   
   SIGNAL ARID_M3                  :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL ARADDR_M3                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_M3                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_M3                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_M3               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_M3                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_M3               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_M3                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_M3               :  std_logic;   
   SIGNAL ARREADY_M3               :  std_logic;   
   SIGNAL RID_M3                   :  std_logic_vector(ID_WIDTH - 1  DOWNTO 0);   
   SIGNAL RDATA_M3                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_M3                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_M3                 :  std_logic;   
   SIGNAL RVALID_M3                :  std_logic;   
   SIGNAL RREADY_M3                :  std_logic;   
  
   SIGNAL AWID_S0                  :  std_logic_vector( ID_WIDTH + 1 DOWNTO 0);   
   SIGNAL AWADDR_S0                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_S0                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S0                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S0               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S0                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S0               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S0                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S0               :  std_logic;   
   SIGNAL AWREADY_S0               :  std_logic;   
   SIGNAL WID_S0                   :  std_logic_vector( ID_WIDTH + 1 DOWNTO 0);   
   SIGNAL WDATA_S0                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_S0                 :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_S0                 :  std_logic;   
   SIGNAL WVALID_S0                :  std_logic;   
   SIGNAL WREADY_S0                :  std_logic;   
   SIGNAL BID_S0                   :  std_logic_vector( ID_WIDTH + 1 DOWNTO 0);   
   SIGNAL BRESP_S0                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S0                :  std_logic;   
   SIGNAL BREADY_S0                :  std_logic;   
   SIGNAL ARID_S0                  :  std_logic_vector( ID_WIDTH + 1 DOWNTO 0);   
   SIGNAL ARADDR_S0                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_S0                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S0                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S0               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S0                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S0               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S0                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S0               :  std_logic;   
   SIGNAL ARREADY_S0               :  std_logic;   
   SIGNAL RID_S0                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL RDATA_S0                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_S0                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S0                 :  std_logic;   
   SIGNAL RVALID_S0                :  std_logic;   
   SIGNAL RREADY_S0                :  std_logic;   
   SIGNAL AWID_S1                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL AWADDR_S1                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_S1                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S1                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S1               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S1                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S1               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S1                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S1               :  std_logic;   
   SIGNAL AWREADY_S1               :  std_logic;   
   SIGNAL WID_S1                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL WDATA_S1                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_S1                 :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_S1                 :  std_logic;   
   SIGNAL WVALID_S1                :  std_logic;   
   SIGNAL WREADY_S1                :  std_logic;   
   SIGNAL BID_S1                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL BRESP_S1                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S1                :  std_logic;   
   SIGNAL BREADY_S1                :  std_logic;   
   SIGNAL ARID_S1                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL ARADDR_S1                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_S1                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S1                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S1               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S1                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S1               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S1                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S1               :  std_logic;   
   SIGNAL ARREADY_S1               :  std_logic;   
   SIGNAL RID_S1                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL RDATA_S1                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_S1                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S1                 :  std_logic;   
   SIGNAL RVALID_S1                :  std_logic;   
   SIGNAL RREADY_S1                :  std_logic;   
   SIGNAL AWID_S2                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL AWADDR_S2                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_S2                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S2                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S2               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S2                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S2               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S2                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S2               :  std_logic;   
   SIGNAL AWREADY_S2               :  std_logic;   
   SIGNAL WID_S2                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL WDATA_S2                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_S2                 :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_S2                 :  std_logic;   
   SIGNAL WVALID_S2                :  std_logic;   
   SIGNAL WREADY_S2                :  std_logic;   
   SIGNAL BID_S2                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL BRESP_S2                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S2                :  std_logic;   
   SIGNAL BREADY_S2                :  std_logic;   
   SIGNAL ARID_S2                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL ARADDR_S2                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_S2                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S2                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S2               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S2                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S2               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S2                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S2               :  std_logic;   
   SIGNAL ARREADY_S2               :  std_logic;   
   SIGNAL RID_S2                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL RDATA_S2                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_S2                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S2                 :  std_logic;   
   SIGNAL RVALID_S2                :  std_logic;   
   SIGNAL RREADY_S2                :  std_logic;   
   SIGNAL AWID_S3                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL AWADDR_S3                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_S3                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S3                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S3               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S3                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S3               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S3                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S3               :  std_logic;   
   SIGNAL AWREADY_S3               :  std_logic;   
   SIGNAL WID_S3                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL WDATA_S3                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_S3                 :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_S3                 :  std_logic;   
   SIGNAL WVALID_S3                :  std_logic;   
   SIGNAL WREADY_S3                :  std_logic;   
   SIGNAL BID_S3                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL BRESP_S3                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S3                :  std_logic;   
   SIGNAL BREADY_S3                :  std_logic;   
   SIGNAL ARID_S3                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL ARADDR_S3                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_S3                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S3                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S3               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S3                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S3               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S3                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S3               :  std_logic;   
   SIGNAL ARREADY_S3               :  std_logic;   
   SIGNAL RID_S3                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL RDATA_S3                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_S3                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S3                 :  std_logic;   
   SIGNAL RVALID_S3                :  std_logic;   
   SIGNAL RREADY_S3                :  std_logic;   
   SIGNAL AWID_S4                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL AWADDR_S4                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_S4                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S4                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S4               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S4                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S4               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S4                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S4               :  std_logic;   
   SIGNAL AWREADY_S4               :  std_logic;   
   SIGNAL WID_S4                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL WDATA_S4                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_S4                 :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_S4                 :  std_logic;   
   SIGNAL WVALID_S4                :  std_logic;   
   SIGNAL WREADY_S4                :  std_logic;   
   SIGNAL BID_S4                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL BRESP_S4                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S4                :  std_logic;   
   SIGNAL BREADY_S4                :  std_logic;   
   SIGNAL ARID_S4                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL ARADDR_S4                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_S4                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S4                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S4               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S4                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S4               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S4                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S4               :  std_logic;   
   SIGNAL ARREADY_S4               :  std_logic;   
   SIGNAL RID_S4                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL RDATA_S4                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_S4                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S4                 :  std_logic;   
   SIGNAL RVALID_S4                :  std_logic;   
   SIGNAL RREADY_S4                :  std_logic;   
   SIGNAL AWID_S5                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL AWADDR_S5                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_S5                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S5                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S5               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S5                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S5               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S5                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S5               :  std_logic;   
   SIGNAL AWREADY_S5               :  std_logic;   
   SIGNAL WID_S5                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL WDATA_S5                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_S5                 :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_S5                 :  std_logic;   
   SIGNAL WVALID_S5                :  std_logic;   
   SIGNAL WREADY_S5                :  std_logic;   
   SIGNAL BID_S5                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL BRESP_S5                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S5                :  std_logic;   
   SIGNAL BREADY_S5                :  std_logic;   
   SIGNAL ARID_S5                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL ARADDR_S5                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_S5                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S5                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S5               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S5                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S5               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S5                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S5               :  std_logic;   
   SIGNAL ARREADY_S5               :  std_logic;   
   SIGNAL RID_S5                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL RDATA_S5                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_S5                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S5                 :  std_logic;   
   SIGNAL RVALID_S5                :  std_logic;   
   SIGNAL RREADY_S5                :  std_logic;   
   SIGNAL AWID_S6                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL AWADDR_S6                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_S6                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S6                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S6               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S6                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S6               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S6                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S6               :  std_logic;   
   SIGNAL AWREADY_S6               :  std_logic;   
   SIGNAL WID_S6                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL WDATA_S6                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_S6                 :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_S6                 :  std_logic;   
   SIGNAL WVALID_S6                :  std_logic;   
   SIGNAL WREADY_S6                :  std_logic;   
   SIGNAL BID_S6                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL BRESP_S6                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S6                :  std_logic;   
   SIGNAL BREADY_S6                :  std_logic;   
   SIGNAL ARID_S6                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL ARADDR_S6                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_S6                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S6                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S6               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S6                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S6               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S6                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S6               :  std_logic;   
   SIGNAL ARREADY_S6               :  std_logic;   
   SIGNAL RID_S6                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL RDATA_S6                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_S6                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S6                 :  std_logic;   
   SIGNAL RVALID_S6                :  std_logic;   
   SIGNAL RREADY_S6                :  std_logic;   
   SIGNAL AWID_S7                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL AWADDR_S7                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_S7                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S7                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S7               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S7                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S7               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S7                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S7               :  std_logic;   
   SIGNAL AWREADY_S7               :  std_logic;   
   SIGNAL WID_S7                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL WDATA_S7                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_S7                 :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_S7                 :  std_logic;   
   SIGNAL WVALID_S7                :  std_logic;   
   SIGNAL WREADY_S7                :  std_logic;   
   SIGNAL BID_S7                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL BRESP_S7                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S7                :  std_logic;   
   SIGNAL BREADY_S7                :  std_logic;   
   SIGNAL ARID_S7                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL ARADDR_S7                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_S7                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S7                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S7               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S7                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S7               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S7                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S7               :  std_logic;   
   SIGNAL ARREADY_S7               :  std_logic;   
   SIGNAL RID_S7                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL RDATA_S7                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_S7                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S7                 :  std_logic;   
   SIGNAL RVALID_S7                :  std_logic;   
   SIGNAL RREADY_S7                :  std_logic;   
   SIGNAL AWID_S8                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL AWADDR_S8                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_S8                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S8                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S8               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S8                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S8               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S8                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S8               :  std_logic;   
   SIGNAL AWREADY_S8               :  std_logic;   
   SIGNAL WID_S8                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL WDATA_S8                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_S8                 :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_S8                 :  std_logic;   
   SIGNAL WVALID_S8                :  std_logic;   
   SIGNAL WREADY_S8                :  std_logic;   
   SIGNAL BID_S8                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL BRESP_S8                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S8                :  std_logic;   
   SIGNAL BREADY_S8                :  std_logic;   
   SIGNAL ARID_S8                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL ARADDR_S8                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_S8                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S8                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S8               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S8                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S8               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S8                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S8               :  std_logic;   
   SIGNAL ARREADY_S8               :  std_logic;   
   SIGNAL RID_S8                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL RDATA_S8                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_S8                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S8                 :  std_logic;   
   SIGNAL RVALID_S8                :  std_logic;   
   SIGNAL RREADY_S8                :  std_logic;   
   SIGNAL AWID_S9                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL AWADDR_S9                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_S9                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S9                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S9               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S9                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S9               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S9                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S9               :  std_logic;   
   SIGNAL AWREADY_S9               :  std_logic;   
   SIGNAL WID_S9                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL WDATA_S9                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_S9                 :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_S9                 :  std_logic;   
   SIGNAL WVALID_S9                :  std_logic;   
   SIGNAL WREADY_S9                :  std_logic;   
   SIGNAL BID_S9                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL BRESP_S9                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S9                :  std_logic;   
   SIGNAL BREADY_S9                :  std_logic;   
   SIGNAL ARID_S9                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL ARADDR_S9                :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_S9                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S9                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S9               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S9                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S9               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S9                :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S9               :  std_logic;   
   SIGNAL ARREADY_S9               :  std_logic;   
   SIGNAL RID_S9                   :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL RDATA_S9                 :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_S9                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S9                 :  std_logic;   
   SIGNAL RVALID_S9                :  std_logic;   
   SIGNAL RREADY_S9                :  std_logic;   
   SIGNAL AWID_S10                 :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL AWADDR_S10               :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_S10                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S10               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S10              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S10               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S10              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S10               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S10              :  std_logic;   
   SIGNAL AWREADY_S10              :  std_logic;   
   SIGNAL WID_S10                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL WDATA_S10                :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_S10                :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_S10                :  std_logic;   
   SIGNAL WVALID_S10               :  std_logic;   
   SIGNAL WREADY_S10               :  std_logic;   
   SIGNAL BID_S10                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL BRESP_S10                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S10               :  std_logic;   
   SIGNAL BREADY_S10               :  std_logic;   
   SIGNAL ARID_S10                 :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL ARADDR_S10               :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_S10                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S10               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S10              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S10               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S10              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S10               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S10              :  std_logic;   
   SIGNAL ARREADY_S10              :  std_logic;   
   SIGNAL RID_S10                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL RDATA_S10                :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_S10                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S10                :  std_logic;   
   SIGNAL RVALID_S10               :  std_logic;   
   SIGNAL RREADY_S10               :  std_logic;   
   SIGNAL AWID_S11                 :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL AWADDR_S11               :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_S11                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S11               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S11              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S11               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S11              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S11               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S11              :  std_logic;   
   SIGNAL AWREADY_S11              :  std_logic;   
   SIGNAL WID_S11                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL WDATA_S11                :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_S11                :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_S11                :  std_logic;   
   SIGNAL WVALID_S11               :  std_logic;   
   SIGNAL WREADY_S11               :  std_logic;   
   SIGNAL BID_S11                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL BRESP_S11                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S11               :  std_logic;   
   SIGNAL BREADY_S11               :  std_logic;   
   SIGNAL ARID_S11                 :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL ARADDR_S11               :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_S11                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S11               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S11              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S11               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S11              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S11               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S11              :  std_logic;   
   SIGNAL ARREADY_S11              :  std_logic;   
   SIGNAL RID_S11                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL RDATA_S11                :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_S11                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S11                :  std_logic;   
   SIGNAL RVALID_S11               :  std_logic;   
   SIGNAL RREADY_S11               :  std_logic;   
   SIGNAL AWID_S12                 :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL AWADDR_S12               :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_S12                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S12               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S12              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S12               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S12              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S12               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S12              :  std_logic;   
   SIGNAL AWREADY_S12              :  std_logic;   
   SIGNAL WID_S12                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL WDATA_S12                :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_S12                :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_S12                :  std_logic;   
   SIGNAL WVALID_S12               :  std_logic;   
   SIGNAL WREADY_S12               :  std_logic;   
   SIGNAL BID_S12                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL BRESP_S12                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S12               :  std_logic;   
   SIGNAL BREADY_S12               :  std_logic;   
   SIGNAL ARID_S12                 :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL ARADDR_S12               :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_S12                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S12               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S12              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S12               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S12              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S12               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S12              :  std_logic;   
   SIGNAL ARREADY_S12              :  std_logic;   
   SIGNAL RID_S12                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL RDATA_S12                :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_S12                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S12                :  std_logic;   
   SIGNAL RVALID_S12               :  std_logic;   
   SIGNAL RREADY_S12               :  std_logic;   
   SIGNAL AWID_S13                 :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL AWADDR_S13               :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_S13                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S13               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S13              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S13               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S13              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S13               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S13              :  std_logic;   
   SIGNAL AWREADY_S13              :  std_logic;   
   SIGNAL WID_S13                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL WDATA_S13                :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_S13                :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_S13                :  std_logic;   
   SIGNAL WVALID_S13               :  std_logic;   
   SIGNAL WREADY_S13               :  std_logic;   
   SIGNAL BID_S13                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL BRESP_S13                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S13               :  std_logic;   
   SIGNAL BREADY_S13               :  std_logic;   
   SIGNAL ARID_S13                 :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL ARADDR_S13               :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_S13                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S13               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S13              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S13               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S13              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S13               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S13              :  std_logic;   
   SIGNAL ARREADY_S13              :  std_logic;   
   SIGNAL RID_S13                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL RDATA_S13                :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_S13                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S13                :  std_logic;   
   SIGNAL RVALID_S13               :  std_logic;   
   SIGNAL RREADY_S13               :  std_logic;   
   SIGNAL AWID_S14                 :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL AWADDR_S14               :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_S14                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S14               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S14              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S14               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S14              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S14               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S14              :  std_logic;   
   SIGNAL AWREADY_S14              :  std_logic;   
   SIGNAL WID_S14                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL WDATA_S14                :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_S14                :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_S14                :  std_logic;   
   SIGNAL WVALID_S14               :  std_logic;   
   SIGNAL WREADY_S14               :  std_logic;   
   SIGNAL BID_S14                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL BRESP_S14                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S14               :  std_logic;   
   SIGNAL BREADY_S14               :  std_logic;   
   SIGNAL ARID_S14                 :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL ARADDR_S14               :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_S14                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S14               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S14              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S14               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S14              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S14               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S14              :  std_logic;   
   SIGNAL ARREADY_S14              :  std_logic;   
   SIGNAL RID_S14                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL RDATA_S14                :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_S14                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S14                :  std_logic;   
   SIGNAL RVALID_S14               :  std_logic;   
   SIGNAL RREADY_S14               :  std_logic;   
   SIGNAL AWID_S15                 :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL AWADDR_S15               :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_S15                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S15               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S15              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S15               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S15              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S15               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S15              :  std_logic;   
   SIGNAL AWREADY_S15              :  std_logic;   
   SIGNAL WID_S15                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL WDATA_S15                :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_S15                :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_S15                :  std_logic;   
   SIGNAL WVALID_S15               :  std_logic;   
   SIGNAL WREADY_S15               :  std_logic;   
   SIGNAL BID_S15                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL BRESP_S15                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S15               :  std_logic;   
   SIGNAL BREADY_S15               :  std_logic;   
   SIGNAL ARID_S15                 :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL ARADDR_S15               :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_S15                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S15               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S15              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S15               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S15              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S15               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S15              :  std_logic;   
   SIGNAL ARREADY_S15              :  std_logic;   
   SIGNAL RID_S15                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL RDATA_S15                :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_S15                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S15                :  std_logic;   
   SIGNAL RVALID_S15               :  std_logic;   
   SIGNAL RREADY_S15               :  std_logic;   
   SIGNAL AWID_S16                 :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL AWADDR_S16               :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL AWLEN_S16                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S16               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S16              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S16               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S16              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S16               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S16              :  std_logic;   
   SIGNAL AWREADY_S16              :  std_logic;   
   SIGNAL WID_S16                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL WDATA_S16                :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL WSTRB_S16                :  std_logic_vector(8 - 1 DOWNTO 0);   
   SIGNAL WLAST_S16                :  std_logic;   
   SIGNAL WVALID_S16               :  std_logic;   
   SIGNAL WREADY_S16               :  std_logic;   
   SIGNAL BID_S16                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL BRESP_S16                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_S16               :  std_logic;   
   SIGNAL BREADY_S16               :  std_logic;   
   SIGNAL ARID_S16                 :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL ARADDR_S16               :  std_logic_vector((31) DOWNTO 0);   
   SIGNAL ARLEN_S16                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S16               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S16              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S16               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S16              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S16               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S16              :  std_logic;   
   SIGNAL ARREADY_S16              :  std_logic;   
   SIGNAL RID_S16                  :  std_logic_vector( ID_WIDTH + 1  downto 0);   
   SIGNAL RDATA_S16                :  std_logic_vector((63) DOWNTO 0);   
   SIGNAL RRESP_S16                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_S16                :  std_logic;   
   SIGNAL RVALID_S16               :  std_logic;   
   SIGNAL RREADY_S16               :  std_logic;   
   SIGNAL TRIGGER_M0               :  std_logic;

   SIGNAL RDATA_TRIGGER            : std_logic;
   SIGNAL END_OF_SIMULATION1        : boolean;
   SIGNAL END_OF_SIMULATION2        : boolean;
   SIGNAL END_OF_SIMULATION3        : boolean;
   SIGNAL END_OF_SIMULATION4        : boolean;
 

BEGIN

   PROCESS
      VARIABLE xhdl_initial : BOOLEAN := TRUE;
   BEGIN
      IF (xhdl_initial) THEN
         ARESETN <= '0';
         WAIT FOR AXI_CLK_PERIOD * 10 ns;
         ARESETN <= '1' AFTER 10 * 1 ns;    
         xhdl_initial := FALSE;
      ELSE
         WAIT;
      END IF;
   END PROCESS;

   PROCESS
   BEGIN
      ACLK <= '0';    
      WAIT FOR AXI_CLK_PERIOD * 1 ns;
      ACLK <= '1';    
      WAIT FOR AXI_CLK_PERIOD * 1 ns;
      IF(END_OF_SIMULATION1) THEN
          WAIT;
      END IF;
   END PROCESS;


   master_0 : axi_master 
     GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)    
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID    => AWID_M0,
         AWADDR  => AWADDR_M0,
         AWLEN   => AWLEN_M0,
         AWSIZE  => AWSIZE_M0,
         AWBURST => AWBURST_M0,
         AWLOCK  => AWLOCK_M0,
         AWCACHE => AWCACHE_M0,
         AWPROT  => AWPROT_M0,
         AWVALID => AWVALID_M0,
         AWREADY => AWREADY_M0,
         WID     => WID_M0,
         WDATA   => WDATA_M0,
         WSTRB   => WSTRB_M0,
         WLAST   => WLAST_M0,
         WVALID  => WVALID_M0,
         WREADY  => WREADY_M0,
         BID     => BID_M0,
         BRESP   => BRESP_M0,
         BVALID  => BVALID_M0,
         BREADY  => BREADY_M0,
         ARID    => ARID_M0,
         ARADDR  => ARADDR_M0,
         ARLEN   => ARLEN_M0,
         ARSIZE  => ARSIZE_M0,
         ARBURST => ARBURST_M0,
         ARLOCK  => ARLOCK_M0,
         ARCACHE => ARCACHE_M0,
         ARPROT  => ARPROT_M0,
         ARVALID => ARVALID_M0,
         ARREADY => ARREADY_M0,
         RID     => RID_M0,
         RDATA   => RDATA_M0,
         RRESP   => RRESP_M0,
         RLAST   => RLAST_M0,
         RVALID  => RVALID_M0,
         RREADY  => RREADY_M0,
         TRIGGER_M0 => TRIGGER_M0,
         RDATA_TRIGGER => RDATA_TRIGGER,
         END_OF_SIMULATION => END_OF_SIMULATION1);   
   
   master_1 : axi_master 
     GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)    
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID    => AWID_M1,
         AWADDR  => AWADDR_M1,
         AWLEN   => AWLEN_M1,
         AWSIZE  => AWSIZE_M1,
         AWBURST => AWBURST_M1,
         AWLOCK  => AWLOCK_M1,
         AWCACHE => AWCACHE_M1,
         AWPROT  => AWPROT_M1,
         AWVALID => AWVALID_M1,
         AWREADY => AWREADY_M1,
         WID     => WID_M1,
         WDATA   => WDATA_M1,
         WSTRB   => WSTRB_M1,
         WLAST   => WLAST_M1,
         WVALID  => WVALID_M1,
         WREADY  => WREADY_M1,
         BID     => BID_M1,
         BRESP   => BRESP_M1,
         BVALID  => BVALID_M1,
         BREADY  => BREADY_M1,
         ARID    => ARID_M1,
         ARADDR  => ARADDR_M1,
         ARLEN   => ARLEN_M1,
         ARSIZE  => ARSIZE_M1,
         ARBURST => ARBURST_M1,
         ARLOCK  => ARLOCK_M1,
         ARCACHE => ARCACHE_M1,
         ARPROT  => ARPROT_M1,
         ARVALID => ARVALID_M1,
         ARREADY => ARREADY_M1,
         RID     => RID_M1,
         RDATA   => RDATA_M1,
         RRESP   => RRESP_M1,
         RLAST   => RLAST_M1,
         RVALID  => RVALID_M1,
         RREADY  => RREADY_M1,
         TRIGGER_M0 => TRIGGER_M0,
         RDATA_TRIGGER => RDATA_TRIGGER,
         END_OF_SIMULATION => END_OF_SIMULATION2);   
  
   master_2 : axi_master 
     GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)    
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID    => AWID_M2,
         AWADDR  => AWADDR_M2,
         AWLEN   => AWLEN_M2,
         AWSIZE  => AWSIZE_M2,
         AWBURST => AWBURST_M2,
         AWLOCK  => AWLOCK_M2,
         AWCACHE => AWCACHE_M2,
         AWPROT  => AWPROT_M2,
         AWVALID => AWVALID_M2,
         AWREADY => AWREADY_M2,
         WID     => WID_M2,
         WDATA   => WDATA_M2,
         WSTRB   => WSTRB_M2,
         WLAST   => WLAST_M2,
         WVALID  => WVALID_M2,
         WREADY  => WREADY_M2,
         BID     => BID_M2,
         BRESP   => BRESP_M2,
         BVALID  => BVALID_M2,
         BREADY  => BREADY_M2,
         ARID    => ARID_M2,
         ARADDR  => ARADDR_M2,
         ARLEN   => ARLEN_M2,
         ARSIZE  => ARSIZE_M2,
         ARBURST => ARBURST_M2,
         ARLOCK  => ARLOCK_M2,
         ARCACHE => ARCACHE_M2,
         ARPROT  => ARPROT_M2,
         ARVALID => ARVALID_M2,
         ARREADY => ARREADY_M2,
         RID     => RID_M2,
         RDATA   => RDATA_M2,
         RRESP   => RRESP_M2,
         RLAST   => RLAST_M2,
         RVALID  => RVALID_M2,
         RREADY  => RREADY_M2,
         TRIGGER_M0 => TRIGGER_M0,
         RDATA_TRIGGER => RDATA_TRIGGER,
         END_OF_SIMULATION => END_OF_SIMULATION3);   
         
   master_3 : axi_master 
     GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)    
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID    => AWID_M3,
         AWADDR  => AWADDR_M3,
         AWLEN   => AWLEN_M3,
         AWSIZE  => AWSIZE_M3,
         AWBURST => AWBURST_M3,
         AWLOCK  => AWLOCK_M3,
         AWCACHE => AWCACHE_M3,
         AWPROT  => AWPROT_M3,
         AWVALID => AWVALID_M3,
         AWREADY => AWREADY_M3,
         WID     => WID_M3,
         WDATA   => WDATA_M3,
         WSTRB   => WSTRB_M3,
         WLAST   => WLAST_M3,
         WVALID  => WVALID_M3,
         WREADY  => WREADY_M3,
         BID     => BID_M3,
         BRESP   => BRESP_M3,
         BVALID  => BVALID_M3,
         BREADY  => BREADY_M3,
         ARID    => ARID_M3,
         ARADDR  => ARADDR_M3,
         ARLEN   => ARLEN_M3,
         ARSIZE  => ARSIZE_M3,
         ARBURST => ARBURST_M3,
         ARLOCK  => ARLOCK_M3,
         ARCACHE => ARCACHE_M3,
         ARPROT  => ARPROT_M3,
         ARVALID => ARVALID_M3,
         ARREADY => ARREADY_M3,
         RID     => RID_M3,
         RDATA   => RDATA_M3,
         RRESP   => RRESP_M3,
         RLAST   => RLAST_M3,
         RVALID  => RVALID_M3,
         RREADY  => RREADY_M3,
         TRIGGER_M0 => TRIGGER_M0,
         RDATA_TRIGGER => RDATA_TRIGGER,
         END_OF_SIMULATION => END_OF_SIMULATION4);   
         
   slave_0 : axi_slave 
      GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID => AWID_S0,
         AWADDR => AWADDR_S0,
         AWLEN => AWLEN_S0,
         AWSIZE => AWSIZE_S0,
         AWBURST => AWBURST_S0,
         AWLOCK => AWLOCK_S0,
         AWCACHE => AWCACHE_S0,
         AWPROT => AWPROT_S0,
         AWVALID => AWVALID_S0,
         AWREADY => AWREADY_S0,
         WID => WID_S0,
         WDATA => WDATA_S0,
         WSTRB => WSTRB_S0,
         WLAST => WLAST_S0,
         WVALID => WVALID_S0,
         WREADY => WREADY_S0,
         BID   => BID_S0,
         BRESP => BRESP_S0,
         BVALID=> BVALID_S0,
         BREADY => BREADY_S0,
         ARID => ARID_S0,
         ARADDR => ARADDR_S0,
         ARLEN => ARLEN_S0,
         ARSIZE => ARSIZE_S0,
         ARBURST => ARBURST_S0,
         ARLOCK => ARLOCK_S0,
         ARCACHE => ARCACHE_S0,
         ARPROT => ARPROT_S0,
         ARVALID => ARVALID_S0,
         ARREADY => ARREADY_S0,
         RID => RID_S0,
         RDATA => RDATA_S0,
         RRESP => RRESP_S0,
         RLAST => RLAST_S0,
         RVALID => RVALID_S0,
         RREADY => RREADY_S0,   
         RDATA_TRIGGER => RDATA_TRIGGER);   
   
   slave_1 : axi_slave  
      GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID => AWID_S1,
         AWADDR => AWADDR_S1,
         AWLEN => AWLEN_S1,
         AWSIZE => AWSIZE_S1,
         AWBURST => AWBURST_S1,
         AWLOCK => AWLOCK_S1,
         AWCACHE => AWCACHE_S1,
         AWPROT => AWPROT_S1,
         AWVALID => AWVALID_S1,
         AWREADY  => AWREADY_S1,
         WID => WID_S1,
         WDATA => WDATA_S1,
         WSTRB => WSTRB_S1,
         WLAST => WLAST_S1,
         WVALID=> WVALID_S1,
         WREADY=> WREADY_S1,
         BID   => BID_S1,
         BRESP => BRESP_S1,
         BVALID=> BVALID_S1,
         BREADY => BREADY_S1,
         ARID => ARID_S1,
         ARADDR => ARADDR_S1,
         ARLEN => ARLEN_S1,
         ARSIZE => ARSIZE_S1,
         ARBURST => ARBURST_S1,
         ARLOCK => ARLOCK_S1,
         ARCACHE => ARCACHE_S1,
         ARPROT => ARPROT_S1,
         ARVALID => ARVALID_S1,
         ARREADY=> ARREADY_S1,
         RID =>  RID_S1,
         RDATA  => RDATA_S1,
         RRESP => RRESP_S1,
         RLAST => RLAST_S1,
         RVALID => RVALID_S1,
         RREADY => RREADY_S1,   
         RDATA_TRIGGER => RDATA_TRIGGER); 

     slave_2 : axi_slave  
      GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID => AWID_S2,
         AWADDR => AWADDR_S2,
         AWLEN => AWLEN_S2,
         AWSIZE => AWSIZE_S2,
         AWBURST => AWBURST_S2,
         AWLOCK => AWLOCK_S2,
         AWCACHE => AWCACHE_S2,
         AWPROT => AWPROT_S2,
         AWVALID => AWVALID_S2,
         AWREADY  => AWREADY_S2,
         WID => WID_S2,
         WDATA => WDATA_S2,
         WSTRB => WSTRB_S2,
         WLAST => WLAST_S2,
         WVALID=> WVALID_S2,
         WREADY=> WREADY_S2,
         BID   => BID_S2,
         BRESP => BRESP_S2,
         BVALID=> BVALID_S2,
         BREADY => BREADY_S2,
         ARID => ARID_S2,
         ARADDR => ARADDR_S2,
         ARLEN => ARLEN_S2,
         ARSIZE => ARSIZE_S2,
         ARBURST => ARBURST_S2,
         ARLOCK => ARLOCK_S2,
         ARCACHE => ARCACHE_S2,
         ARPROT => ARPROT_S2,
         ARVALID => ARVALID_S2,
         ARREADY=> ARREADY_S2,
         RID =>  RID_S2,
         RDATA  => RDATA_S2,
         RRESP => RRESP_S2,
         RLAST => RLAST_S2,
         RVALID => RVALID_S2,
         RREADY => RREADY_S2,   
         RDATA_TRIGGER => RDATA_TRIGGER);

      slave_3 : axi_slave  
      GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID => AWID_S3,
         AWADDR => AWADDR_S3,
         AWLEN => AWLEN_S3,
         AWSIZE => AWSIZE_S3,
         AWBURST => AWBURST_S3,
         AWLOCK => AWLOCK_S3,
         AWCACHE => AWCACHE_S3,
         AWPROT => AWPROT_S3,
         AWVALID => AWVALID_S3,
         AWREADY  => AWREADY_S3,
         WID => WID_S3,
         WDATA => WDATA_S3,
         WSTRB => WSTRB_S3,
         WLAST => WLAST_S3,
         WVALID=> WVALID_S3,
         WREADY=> WREADY_S3,
         BID   => BID_S3,
         BRESP => BRESP_S3,
         BVALID=> BVALID_S3,
         BREADY => BREADY_S3,
         ARID => ARID_S3,
         ARADDR => ARADDR_S3,
         ARLEN => ARLEN_S3,
         ARSIZE => ARSIZE_S3,
         ARBURST => ARBURST_S3,
         ARLOCK => ARLOCK_S3,
         ARCACHE => ARCACHE_S3,
         ARPROT => ARPROT_S3,
         ARVALID => ARVALID_S3,
         ARREADY=> ARREADY_S3,
         RID =>  RID_S3,
         RDATA  => RDATA_S3,
         RRESP => RRESP_S3,
         RLAST => RLAST_S3,
         RVALID => RVALID_S3,
         RREADY => RREADY_S3,   
         RDATA_TRIGGER => RDATA_TRIGGER);

   slave_4 : axi_slave  
      GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID => AWID_S4,
         AWADDR => AWADDR_S4,
         AWLEN => AWLEN_S4,
         AWSIZE => AWSIZE_S4,
         AWBURST => AWBURST_S4,
         AWLOCK => AWLOCK_S4,
         AWCACHE => AWCACHE_S4,
         AWPROT => AWPROT_S4,
         AWVALID => AWVALID_S4,
         AWREADY  => AWREADY_S4,
         WID => WID_S4,
         WDATA => WDATA_S4,
         WSTRB => WSTRB_S4,
         WLAST => WLAST_S4,
         WVALID=> WVALID_S4,
         WREADY=> WREADY_S4,
         BID   => BID_S4,
         BRESP => BRESP_S4,
         BVALID=> BVALID_S4,
         BREADY => BREADY_S4,
         ARID => ARID_S4,
         ARADDR => ARADDR_S4,
         ARLEN => ARLEN_S4,
         ARSIZE => ARSIZE_S4,
         ARBURST => ARBURST_S4,
         ARLOCK => ARLOCK_S4,
         ARCACHE => ARCACHE_S4,
         ARPROT => ARPROT_S4,
         ARVALID => ARVALID_S4,
         ARREADY=> ARREADY_S4,
         RID =>  RID_S4,
         RDATA  => RDATA_S4,
         RRESP => RRESP_S4,
         RLAST => RLAST_S4,
         RVALID => RVALID_S4,
         RREADY => RREADY_S4, 	 
         RDATA_TRIGGER => RDATA_TRIGGER);

slave_5 : axi_slave  
      GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID => AWID_S5,
         AWADDR => AWADDR_S5,
         AWLEN => AWLEN_S5,
         AWSIZE => AWSIZE_S5,
         AWBURST => AWBURST_S5,
         AWLOCK => AWLOCK_S5,
         AWCACHE => AWCACHE_S5,
         AWPROT => AWPROT_S5,
         AWVALID => AWVALID_S5,
         AWREADY  => AWREADY_S5,
         WID => WID_S5,
         WDATA => WDATA_S5,
         WSTRB => WSTRB_S5,
         WLAST => WLAST_S5,
         WVALID=> WVALID_S5,
         WREADY=> WREADY_S5,
         BID   => BID_S5,
         BRESP => BRESP_S5,
         BVALID=> BVALID_S5,
         BREADY => BREADY_S5,
         ARID => ARID_S5,
         ARADDR => ARADDR_S5,
         ARLEN => ARLEN_S5,
         ARSIZE => ARSIZE_S5,
         ARBURST => ARBURST_S5,
         ARLOCK => ARLOCK_S5,
         ARCACHE => ARCACHE_S5,
         ARPROT => ARPROT_S5,
         ARVALID => ARVALID_S5,
         ARREADY=> ARREADY_S5,
         RID =>  RID_S5,
         RDATA  => RDATA_S5,
         RRESP => RRESP_S5,
         RLAST => RLAST_S5,
         RVALID => RVALID_S5,
         RREADY => RREADY_S5,   
         RDATA_TRIGGER => RDATA_TRIGGER);

      slave_6 : axi_slave  
      GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID => AWID_S6,
         AWADDR => AWADDR_S6,
         AWLEN => AWLEN_S6,
         AWSIZE => AWSIZE_S6,
         AWBURST => AWBURST_S6,
         AWLOCK => AWLOCK_S6,
         AWCACHE => AWCACHE_S6,
         AWPROT => AWPROT_S6,
         AWVALID => AWVALID_S6,
         AWREADY  => AWREADY_S6,
         WID => WID_S6,
         WDATA => WDATA_S6,
         WSTRB => WSTRB_S6,
         WLAST => WLAST_S6,
         WVALID=> WVALID_S6,
         WREADY=> WREADY_S6,
         BID   => BID_S6,
         BRESP => BRESP_S6,
         BVALID=> BVALID_S6,
         BREADY => BREADY_S6,
         ARID => ARID_S6,
         ARADDR => ARADDR_S6,
         ARLEN => ARLEN_S6,
         ARSIZE => ARSIZE_S6,
         ARBURST => ARBURST_S6,
         ARLOCK => ARLOCK_S6,
         ARCACHE => ARCACHE_S6,
         ARPROT => ARPROT_S6,
         ARVALID => ARVALID_S6,
         ARREADY=> ARREADY_S6,
         RID =>  RID_S6,
         RDATA  => RDATA_S6,
         RRESP => RRESP_S6,
         RLAST => RLAST_S6,
         RVALID => RVALID_S6,
         RREADY => RREADY_S6,   
         RDATA_TRIGGER => RDATA_TRIGGER);

slave_7 : axi_slave  
      GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID => AWID_S7,
         AWADDR => AWADDR_S7,
         AWLEN => AWLEN_S7,
         AWSIZE => AWSIZE_S7,
         AWBURST => AWBURST_S7,
         AWLOCK => AWLOCK_S7,
         AWCACHE => AWCACHE_S7,
         AWPROT => AWPROT_S7,
         AWVALID => AWVALID_S7,
         AWREADY  => AWREADY_S7,
         WID => WID_S7,
         WDATA => WDATA_S7,
         WSTRB => WSTRB_S7,
         WLAST => WLAST_S7,
         WVALID=> WVALID_S7,
         WREADY=> WREADY_S7,
         BID   => BID_S7,
         BRESP => BRESP_S7,
         BVALID=> BVALID_S7,
         BREADY => BREADY_S7,
         ARID => ARID_S7,
         ARADDR => ARADDR_S7,
         ARLEN => ARLEN_S7,
         ARSIZE => ARSIZE_S7,
         ARBURST => ARBURST_S7,
         ARLOCK => ARLOCK_S7,
         ARCACHE => ARCACHE_S7,
         ARPROT => ARPROT_S7,
         ARVALID => ARVALID_S7,
         ARREADY=> ARREADY_S7,
         RID =>  RID_S7,
         RDATA  => RDATA_S7,
         RRESP => RRESP_S7,
         RLAST => RLAST_S7,
         RVALID => RVALID_S7,
         RREADY => RREADY_S7,   
         RDATA_TRIGGER => RDATA_TRIGGER);

      slave_8 : axi_slave  
      GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID => AWID_S8,
         AWADDR => AWADDR_S8,
         AWLEN => AWLEN_S8,
         AWSIZE => AWSIZE_S8,
         AWBURST => AWBURST_S8,
         AWLOCK => AWLOCK_S8,
         AWCACHE => AWCACHE_S8,
         AWPROT => AWPROT_S8,
         AWVALID => AWVALID_S8,
         AWREADY  => AWREADY_S8,
         WID => WID_S8,
         WDATA => WDATA_S8,
         WSTRB => WSTRB_S8,
         WLAST => WLAST_S8,
         WVALID=> WVALID_S8,
         WREADY=> WREADY_S8,
         BID   => BID_S8,
         BRESP => BRESP_S8,
         BVALID=> BVALID_S8,
         BREADY => BREADY_S8,
         ARID => ARID_S8,
         ARADDR => ARADDR_S8,
         ARLEN => ARLEN_S8,
         ARSIZE => ARSIZE_S8,
         ARBURST => ARBURST_S8,
         ARLOCK => ARLOCK_S8,
         ARCACHE => ARCACHE_S8,
         ARPROT => ARPROT_S8,
         ARVALID => ARVALID_S8,
         ARREADY=> ARREADY_S8,
         RID =>  RID_S8,
         RDATA  => RDATA_S8,
         RRESP => RRESP_S8,
         RLAST => RLAST_S8,
         RVALID => RVALID_S8,
         RREADY => RREADY_S8,   
         RDATA_TRIGGER => RDATA_TRIGGER);

      slave_9 : axi_slave  
      GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID => AWID_S9,
         AWADDR => AWADDR_S9,
         AWLEN => AWLEN_S9,
         AWSIZE => AWSIZE_S9,
         AWBURST => AWBURST_S9,
         AWLOCK => AWLOCK_S9,
         AWCACHE => AWCACHE_S9,
         AWPROT => AWPROT_S9,
         AWVALID => AWVALID_S9,
         AWREADY  => AWREADY_S9,
         WID => WID_S9,
         WDATA => WDATA_S9,
         WSTRB => WSTRB_S9,
         WLAST => WLAST_S9,
         WVALID=> WVALID_S9,
         WREADY=> WREADY_S9,
         BID   => BID_S9,
         BRESP => BRESP_S9,
         BVALID=> BVALID_S9,
         BREADY => BREADY_S9,
         ARID => ARID_S9,
         ARADDR => ARADDR_S9,
         ARLEN => ARLEN_S9,
         ARSIZE => ARSIZE_S9,
         ARBURST => ARBURST_S9,
         ARLOCK => ARLOCK_S9,
         ARCACHE => ARCACHE_S9,
         ARPROT => ARPROT_S9,
         ARVALID => ARVALID_S9,
         ARREADY=> ARREADY_S9,
         RID =>  RID_S9,
         RDATA  => RDATA_S9,
         RRESP => RRESP_S9,
         RLAST => RLAST_S9,
         RVALID => RVALID_S9,
         RREADY => RREADY_S9,   
         RDATA_TRIGGER => RDATA_TRIGGER);

slave_10 : axi_slave  
      GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID => AWID_S10,
         AWADDR => AWADDR_S10,
         AWLEN => AWLEN_S10,
         AWSIZE => AWSIZE_S10,
         AWBURST => AWBURST_S10,
         AWLOCK => AWLOCK_S10,
         AWCACHE => AWCACHE_S10,
         AWPROT => AWPROT_S10,
         AWVALID => AWVALID_S10,
         AWREADY  => AWREADY_S10,
         WID => WID_S10,
         WDATA => WDATA_S10,
         WSTRB => WSTRB_S10,
         WLAST => WLAST_S10,
         WVALID=> WVALID_S10,
         WREADY=> WREADY_S10,
         BID   => BID_S10,
         BRESP => BRESP_S10,
         BVALID=> BVALID_S10,
         BREADY => BREADY_S10,
         ARID => ARID_S10,
         ARADDR => ARADDR_S10,
         ARLEN => ARLEN_S10,
         ARSIZE => ARSIZE_S10,
         ARBURST => ARBURST_S10,
         ARLOCK => ARLOCK_S10,
         ARCACHE => ARCACHE_S10,
         ARPROT => ARPROT_S10,
         ARVALID => ARVALID_S10,
         ARREADY=> ARREADY_S10,
         RID =>  RID_S10,
         RDATA  => RDATA_S10,
         RRESP => RRESP_S10,
         RLAST => RLAST_S10,
         RVALID => RVALID_S10,
         RREADY => RREADY_S10,   
         RDATA_TRIGGER => RDATA_TRIGGER);

      slave_11 : axi_slave  
      GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID => AWID_S11,
         AWADDR => AWADDR_S11,
         AWLEN => AWLEN_S11,
         AWSIZE => AWSIZE_S11,
         AWBURST => AWBURST_S11,
         AWLOCK => AWLOCK_S11,
         AWCACHE => AWCACHE_S11,
         AWPROT => AWPROT_S11,
         AWVALID => AWVALID_S11,
         AWREADY  => AWREADY_S11,
         WID => WID_S11,
         WDATA => WDATA_S11,
         WSTRB => WSTRB_S11,
         WLAST => WLAST_S11,
         WVALID=> WVALID_S11,
         WREADY=> WREADY_S11,
         BID   => BID_S11,
         BRESP => BRESP_S11,
         BVALID=> BVALID_S11,
         BREADY => BREADY_S11,
         ARID => ARID_S11,
         ARADDR => ARADDR_S11,
         ARLEN => ARLEN_S11,
         ARSIZE => ARSIZE_S11,
         ARBURST => ARBURST_S11,
         ARLOCK => ARLOCK_S11,
         ARCACHE => ARCACHE_S11,
         ARPROT => ARPROT_S11,
         ARVALID => ARVALID_S11,
         ARREADY=> ARREADY_S11,
         RID =>  RID_S11,
         RDATA  => RDATA_S11,
         RRESP => RRESP_S11,
         RLAST => RLAST_S11,
         RVALID => RVALID_S11,
         RREADY => RREADY_S11,   
         RDATA_TRIGGER => RDATA_TRIGGER);

slave_12 : axi_slave  
      GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID => AWID_S12,
         AWADDR => AWADDR_S12,
         AWLEN => AWLEN_S12,
         AWSIZE => AWSIZE_S12,
         AWBURST => AWBURST_S12,
         AWLOCK => AWLOCK_S12,
         AWCACHE => AWCACHE_S12,
         AWPROT => AWPROT_S12,
         AWVALID => AWVALID_S12,
         AWREADY  => AWREADY_S12,
         WID => WID_S12,
         WDATA => WDATA_S12,
         WSTRB => WSTRB_S12,
         WLAST => WLAST_S12,
         WVALID=> WVALID_S12,
         WREADY=> WREADY_S12,
         BID   => BID_S12,
         BRESP => BRESP_S12,
         BVALID=> BVALID_S12,
         BREADY => BREADY_S12,
         ARID => ARID_S12,
         ARADDR => ARADDR_S12,
         ARLEN => ARLEN_S12,
         ARSIZE => ARSIZE_S12,
         ARBURST => ARBURST_S12,
         ARLOCK => ARLOCK_S12,
         ARCACHE => ARCACHE_S12,
         ARPROT => ARPROT_S12,
         ARVALID => ARVALID_S12,
         ARREADY=> ARREADY_S12,
         RID =>  RID_S12,
         RDATA  => RDATA_S12,
         RRESP => RRESP_S12,
         RLAST => RLAST_S12,
         RVALID => RVALID_S12,
         RREADY => RREADY_S12,   
         RDATA_TRIGGER => RDATA_TRIGGER);

      slave_13 : axi_slave  
      GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID => AWID_S13,
         AWADDR => AWADDR_S13,
         AWLEN => AWLEN_S13,
         AWSIZE => AWSIZE_S13,
         AWBURST => AWBURST_S13,
         AWLOCK => AWLOCK_S13,
         AWCACHE => AWCACHE_S13,
         AWPROT => AWPROT_S13,
         AWVALID => AWVALID_S13,
         AWREADY  => AWREADY_S13,
         WID => WID_S13,
         WDATA => WDATA_S13,
         WSTRB => WSTRB_S13,
         WLAST => WLAST_S13,
         WVALID=> WVALID_S13,
         WREADY=> WREADY_S13,
         BID   => BID_S13,
         BRESP => BRESP_S13,
         BVALID=> BVALID_S13,
         BREADY => BREADY_S13,
         ARID => ARID_S13,
         ARADDR => ARADDR_S13,
         ARLEN => ARLEN_S13,
         ARSIZE => ARSIZE_S13,
         ARBURST => ARBURST_S13,
         ARLOCK => ARLOCK_S13,
         ARCACHE => ARCACHE_S13,
         ARPROT => ARPROT_S13,
         ARVALID => ARVALID_S13,
         ARREADY=> ARREADY_S13,
         RID =>  RID_S13,
         RDATA  => RDATA_S13,
         RRESP => RRESP_S13,
         RLAST => RLAST_S13,
         RVALID => RVALID_S13,
         RREADY => RREADY_S13,   
         RDATA_TRIGGER => RDATA_TRIGGER);

      slave_14 : axi_slave  
      GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID => AWID_S14,
         AWADDR => AWADDR_S14,
         AWLEN => AWLEN_S14,
         AWSIZE => AWSIZE_S14,
         AWBURST => AWBURST_S14,
         AWLOCK => AWLOCK_S14,
         AWCACHE => AWCACHE_S14,
         AWPROT => AWPROT_S14,
         AWVALID => AWVALID_S14,
         AWREADY  => AWREADY_S14,
         WID => WID_S14,
         WDATA => WDATA_S14,
         WSTRB => WSTRB_S14,
         WLAST => WLAST_S14,
         WVALID=> WVALID_S14,
         WREADY=> WREADY_S14,
         BID   => BID_S14,
         BRESP => BRESP_S14,
         BVALID=> BVALID_S14,
         BREADY => BREADY_S14,
         ARID => ARID_S14,
         ARADDR => ARADDR_S14,
         ARLEN => ARLEN_S14,
         ARSIZE => ARSIZE_S14,
         ARBURST => ARBURST_S14,
         ARLOCK => ARLOCK_S14,
         ARCACHE => ARCACHE_S14,
         ARPROT => ARPROT_S14,
         ARVALID => ARVALID_S14,
         ARREADY=> ARREADY_S14,
         RID =>  RID_S14,
         RDATA  => RDATA_S14,
         RRESP => RRESP_S14,
         RLAST => RLAST_S14,
         RVALID => RVALID_S14,
         RREADY => RREADY_S14,   
         RDATA_TRIGGER => RDATA_TRIGGER);

      slave_15 : axi_slave  
      GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID => AWID_S15,
         AWADDR => AWADDR_S15,
         AWLEN => AWLEN_S15,
         AWSIZE => AWSIZE_S15,
         AWBURST => AWBURST_S15,
         AWLOCK => AWLOCK_S15,
         AWCACHE => AWCACHE_S15,
         AWPROT => AWPROT_S15,
         AWVALID => AWVALID_S15,
         AWREADY  => AWREADY_S15,
         WID => WID_S15,
         WDATA => WDATA_S15,
         WSTRB => WSTRB_S15,
         WLAST => WLAST_S15,
         WVALID=> WVALID_S15,
         WREADY=> WREADY_S15,
         BID   => BID_S15,
         BRESP => BRESP_S15,
         BVALID=> BVALID_S15,
         BREADY => BREADY_S15,
         ARID => ARID_S15,
         ARADDR => ARADDR_S15,
         ARLEN => ARLEN_S15,
         ARSIZE => ARSIZE_S15,
         ARBURST => ARBURST_S15,
         ARLOCK => ARLOCK_S15,
         ARCACHE => ARCACHE_S15,
         ARPROT => ARPROT_S15,
         ARVALID => ARVALID_S15,
         ARREADY=> ARREADY_S15,
         RID =>  RID_S15,
         RDATA  => RDATA_S15,
         RRESP => RRESP_S15,
         RLAST => RLAST_S15,
         RVALID => RVALID_S15,
         RREADY => RREADY_S15,   
         RDATA_TRIGGER => RDATA_TRIGGER);

      slave_16 : axi_slave  
      GENERIC MAP (
         FAMILY                     => 19,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)
      PORT MAP (
         ACLK => ACLK,
         ARESETN => ARESETN,
         AWID => AWID_S16,
         AWADDR => AWADDR_S16,
         AWLEN => AWLEN_S16,
         AWSIZE => AWSIZE_S16,
         AWBURST => AWBURST_S16,
         AWLOCK => AWLOCK_S16,
         AWCACHE => AWCACHE_S16,
         AWPROT => AWPROT_S16,
         AWVALID => AWVALID_S16,
         AWREADY  => AWREADY_S16,
         WID => WID_S16,
         WDATA => WDATA_S16,
         WSTRB => WSTRB_S16,
         WLAST => WLAST_S16,
         WVALID=> WVALID_S16,
         WREADY=> WREADY_S16,
         BID   => BID_S16,
         BRESP => BRESP_S16,
         BVALID=> BVALID_S16,
         BREADY => BREADY_S16,
         ARID => ARID_S16,
         ARADDR => ARADDR_S16,
         ARLEN => ARLEN_S16,
         ARSIZE => ARSIZE_S16,
         ARBURST => ARBURST_S16,
         ARLOCK => ARLOCK_S16,
         ARCACHE => ARCACHE_S16,
         ARPROT => ARPROT_S16,
         ARVALID => ARVALID_S16,
         ARREADY=> ARREADY_S16,
         RID =>  RID_S16,
         RDATA  => RDATA_S16,
         RRESP => RRESP_S16,
         RLAST => RLAST_S16,
         RVALID => RVALID_S16,
         RREADY => RREADY_S16,   
         RDATA_TRIGGER => RDATA_TRIGGER);

   CoreAXI_0 : top_sb_COREAXI_0_COREAXI
      GENERIC MAP(
         FAMILY                     => FAMILY,
         AXI_DWIDTH                 => 64,
         M0_SLAVE0ENABLE            => 1,          
         M0_SLAVE1ENABLE            => 0,          
         M0_SLAVE2ENABLE            => 0,          
         M0_SLAVE3ENABLE            => 0,          
         M0_SLAVE4ENABLE            => 0,          
         M0_SLAVE5ENABLE            => 0,          
         M0_SLAVE6ENABLE            => 0,          
         M0_SLAVE7ENABLE            => 0,          
         M0_SLAVE8ENABLE            => 0,          
         M0_SLAVE9ENABLE            => 0,          
         M0_SLAVE10ENABLE           => 0,         
         M0_SLAVE11ENABLE           => 0,         
         M0_SLAVE12ENABLE           => 0,         
         M0_SLAVE13ENABLE           => 0,         
         M0_SLAVE14ENABLE           => 0,         
         M0_SLAVE15ENABLE           => 0,         
         M0_SLAVE16ENABLE           => 0,         
         M1_SLAVE0ENABLE            => 0,          
         M1_SLAVE1ENABLE            => 0,          
         M1_SLAVE2ENABLE            => 0,          
         M1_SLAVE3ENABLE            => 0,          
         M1_SLAVE4ENABLE            => 0,          
         M1_SLAVE5ENABLE            => 0,          
         M1_SLAVE6ENABLE            => 0,          
         M1_SLAVE7ENABLE            => 0,          
         M1_SLAVE8ENABLE            => 0,          
         M1_SLAVE9ENABLE            => 0,          
         M1_SLAVE10ENABLE           => 0,         
         M1_SLAVE11ENABLE           => 0,         
         M1_SLAVE12ENABLE           => 0,         
         M1_SLAVE13ENABLE           => 0,         
         M1_SLAVE14ENABLE           => 0,         
         M1_SLAVE15ENABLE           => 0,         
         M1_SLAVE16ENABLE           => 0,         
         M2_SLAVE0ENABLE            => 0,          
         M2_SLAVE1ENABLE            => 0,          
         M2_SLAVE2ENABLE            => 0,          
         M2_SLAVE3ENABLE            => 0,          
         M2_SLAVE4ENABLE            => 0,          
         M2_SLAVE5ENABLE            => 0,          
         M2_SLAVE6ENABLE            => 0,          
         M2_SLAVE7ENABLE            => 0,          
         M2_SLAVE8ENABLE            => 0,          
         M2_SLAVE9ENABLE            => 0,          
         M2_SLAVE10ENABLE           => 0,         
         M2_SLAVE11ENABLE           => 0,         
         M2_SLAVE12ENABLE           => 0,         
         M2_SLAVE13ENABLE           => 0,         
         M2_SLAVE14ENABLE           => 0,         
         M2_SLAVE15ENABLE           => 0,         
         M2_SLAVE16ENABLE           => 0,         
         M3_SLAVE0ENABLE            => 0,          
         M3_SLAVE1ENABLE            => 0,          
         M3_SLAVE2ENABLE            => 0,          
         M3_SLAVE3ENABLE            => 0,          
         M3_SLAVE4ENABLE            => 0,          
         M3_SLAVE5ENABLE            => 0,          
         M3_SLAVE6ENABLE            => 0,          
         M3_SLAVE7ENABLE            => 0,          
         M3_SLAVE8ENABLE            => 0,          
         M3_SLAVE9ENABLE            => 0,          
         M3_SLAVE10ENABLE           => 0,         
         M3_SLAVE11ENABLE           => 0,         
         M3_SLAVE12ENABLE           => 0,         
         M3_SLAVE13ENABLE           => 0,         
         M3_SLAVE14ENABLE           => 0,         
         M3_SLAVE15ENABLE           => 0,         
         M3_SLAVE16ENABLE           => 0,         
         ID_WIDTH                   => 4,                 
         --NUM_SLAVE_SLOT             => 1,       
         NUM_MASTER_SLOT            => 1,      
         MEMSPACE                   => 1,             
         HGS_CFG                    => 1,              
         ADDR_HGS_CFG               => 1,         
         SC_0                       => 0,                 
         SC_1                       => 0,                 
         SC_2                       => 0,                 
         SC_3                       => 0,                 
         SC_4                       => 0,                 
         SC_5                       => 0,                 
         SC_6                       => 0,                 
         SC_7                       => 0,                 
         SC_8                       => 0,                 
         SC_9                       => 0,                 
         SC_10                      => 0,                
         SC_11                      => 0,                
         SC_12                      => 0,                
         SC_13                      => 0,                
         SC_14                      => 0,                
         SC_15                      => 0,                
         FEED_THROUGH               => 0,         
         INP_REG_BUF                => 1,          
         OUT_REG_BUF                => 1,          
         RD_ACCEPTANCE              => 4)    
      PORT MAP(
         ACLK                    => ACLK,
         ARESETN                 => ARESETN,
         AWID_M0                 => AWID_M0,
         AWADDR_M0               => AWADDR_M0,
         AWLEN_M0                => AWLEN_M0,
         AWSIZE_M0               => AWSIZE_M0,
         AWBURST_M0              => AWBURST_M0,
         AWLOCK_M0               => AWLOCK_M0,
         AWCACHE_M0              => AWCACHE_M0,
         AWPROT_M0               => AWPROT_M0,
         AWVALID_M0              => AWVALID_M0,
         AWREADY_M0              => AWREADY_M0,
         WID_M0                  => WID_M0,
         WDATA_M0                => WDATA_M0,
         WSTRB_M0                => WSTRB_M0,
         WLAST_M0                => WLAST_M0,
         WVALID_M0               => WVALID_M0,
         WREADY_M0               => WREADY_M0,
         BID_M0                  => BID_M0,
         BRESP_M0                => BRESP_M0,
         BVALID_M0               => BVALID_M0,
         BREADY_M0               => BREADY_M0,
         ARID_M0                 => ARID_M0,
         ARADDR_M0               => ARADDR_M0,
         ARLEN_M0                => ARLEN_M0,
         ARSIZE_M0               => ARSIZE_M0,
         ARBURST_M0              => ARBURST_M0,
         ARLOCK_M0               => ARLOCK_M0,
         ARCACHE_M0              => ARCACHE_M0,
         ARPROT_M0               => ARPROT_M0,
         ARVALID_M0              => ARVALID_M0,
         ARREADY_M0              => ARREADY_M0,
         RID_M0                  => RID_M0,
         RDATA_M0                => RDATA_M0,
         RRESP_M0                => RRESP_M0,
         RLAST_M0                => RLAST_M0,
         RVALID_M0               => RVALID_M0,
         RREADY_M0               => RREADY_M0,
         AWID_M1                 => AWID_M1,
         AWADDR_M1               => AWADDR_M1,
         AWLEN_M1                => AWLEN_M1,
         AWSIZE_M1               => AWSIZE_M1,
         AWBURST_M1              => AWBURST_M1,
         AWLOCK_M1               => AWLOCK_M1,
         AWCACHE_M1              => AWCACHE_M1,
         AWPROT_M1               => AWPROT_M1,
         AWVALID_M1              => AWVALID_M1,
         AWREADY_M1              => AWREADY_M1,
         WID_M1                  => WID_M1,
         WDATA_M1                => WDATA_M1,
         WSTRB_M1                => WSTRB_M1,
         WLAST_M1                => WLAST_M1,
         WVALID_M1               => WVALID_M1,
         WREADY_M1               => WREADY_M1,
         BID_M1                  => BID_M1,
         BRESP_M1                => BRESP_M1,
         BVALID_M1               => BVALID_M1,
         BREADY_M1               => BREADY_M1,
         ARID_M1                 => ARID_M1,
         ARADDR_M1               => ARADDR_M1,
         ARLEN_M1                => ARLEN_M1,
         ARSIZE_M1               => ARSIZE_M1,
         ARBURST_M1              => ARBURST_M1,
         ARLOCK_M1               => ARLOCK_M1,
         ARCACHE_M1              => ARCACHE_M1,
         ARPROT_M1               => ARPROT_M1,
         ARVALID_M1              => ARVALID_M1,
         ARREADY_M1              => ARREADY_M1,
         RID_M1                  => RID_M1,
         RDATA_M1                => RDATA_M1,
         RRESP_M1                => RRESP_M1,
         RLAST_M1                => RLAST_M1,
         RVALID_M1               => RVALID_M1,
         RREADY_M1               => RREADY_M1,
         AWID_M2                 => AWID_M2,
         AWADDR_M2               => AWADDR_M2,
         AWLEN_M2                => AWLEN_M2,
         AWSIZE_M2               => AWSIZE_M2,
         AWBURST_M2              => AWBURST_M2,
         AWLOCK_M2               => AWLOCK_M2,
         AWCACHE_M2              => AWCACHE_M2,
         AWPROT_M2               => AWPROT_M2,
         AWVALID_M2              => AWVALID_M2,
         AWREADY_M2              => AWREADY_M2,
         WID_M2                  => WID_M2,
         WDATA_M2                => WDATA_M2,
         WSTRB_M2                => WSTRB_M2,
         WLAST_M2                => WLAST_M2,
         WVALID_M2               => WVALID_M2,
         WREADY_M2               => WREADY_M2,
         BID_M2                  => BID_M2,
         BRESP_M2                => BRESP_M2,
         BVALID_M2               => BVALID_M2,
         BREADY_M2               => BREADY_M2,
         ARID_M2                 => ARID_M2,
         ARADDR_M2               => ARADDR_M2,
         ARLEN_M2                => ARLEN_M2,
         ARSIZE_M2               => ARSIZE_M2,
         ARBURST_M2              => ARBURST_M2,
         ARLOCK_M2               => ARLOCK_M2,
         ARCACHE_M2              => ARCACHE_M2,
         ARPROT_M2               => ARPROT_M2,
         ARVALID_M2              => ARVALID_M2,
         ARREADY_M2              => ARREADY_M2,
         RID_M2                  => RID_M2,
         RDATA_M2                => RDATA_M2,
         RRESP_M2                => RRESP_M2,
         RLAST_M2                => RLAST_M2,
         RVALID_M2               => RVALID_M2,
         RREADY_M2               => RREADY_M2,
         AWID_M3                 => AWID_M3,
         AWADDR_M3               => AWADDR_M3,
         AWLEN_M3                => AWLEN_M3,
         AWSIZE_M3               => AWSIZE_M3,
         AWBURST_M3              => AWBURST_M3,
         AWLOCK_M3               => AWLOCK_M3,
         AWCACHE_M3              => AWCACHE_M3,
         AWPROT_M3               => AWPROT_M3,
         AWVALID_M3              => AWVALID_M3,
         AWREADY_M3              => AWREADY_M3,
         WID_M3                  => WID_M3,
         WDATA_M3                => WDATA_M3,
         WSTRB_M3                => WSTRB_M3,
         WLAST_M3                => WLAST_M3,
         WVALID_M3               => WVALID_M3,
         WREADY_M3               => WREADY_M3,
         BID_M3                  => BID_M3,
         BRESP_M3                => BRESP_M3,
         BVALID_M3               => BVALID_M3,
         BREADY_M3               => BREADY_M3,
         ARID_M3                 => ARID_M3,
         ARADDR_M3               => ARADDR_M3,
         ARLEN_M3                => ARLEN_M3,
         ARSIZE_M3               => ARSIZE_M3,
         ARBURST_M3              => ARBURST_M3,
         ARLOCK_M3               => ARLOCK_M3,
         ARCACHE_M3              => ARCACHE_M3,
         ARPROT_M3               => ARPROT_M3,
         ARVALID_M3              => ARVALID_M3,
         ARREADY_M3              => ARREADY_M3,
         RID_M3                  => RID_M3,
         RDATA_M3                => RDATA_M3,
         RRESP_M3                => RRESP_M3,
         RLAST_M3                => RLAST_M3,
         RVALID_M3               => RVALID_M3,
         RREADY_M3               => RREADY_M3,
         AWID_S0                 => AWID_S0,
         AWADDR_S0               => AWADDR_S0,
         AWLEN_S0                => AWLEN_S0,
         AWSIZE_S0               => AWSIZE_S0,
         AWBURST_S0              => AWBURST_S0,
         AWLOCK_S0               => AWLOCK_S0,
         AWCACHE_S0              => AWCACHE_S0,
         AWPROT_S0               => AWPROT_S0,
         AWVALID_S0              => AWVALID_S0,
         AWREADY_S0              => AWREADY_S0,
         WID_S0                  => WID_S0,
         WDATA_S0                => WDATA_S0,
         WSTRB_S0                => WSTRB_S0,
         WLAST_S0                => WLAST_S0,
         WVALID_S0               => WVALID_S0,
         WREADY_S0               => WREADY_S0,
         BID_S0                  => BID_S0,
         BRESP_S0                => BRESP_S0,
         BVALID_S0               => BVALID_S0,
         BREADY_S0               => BREADY_S0,
         ARID_S0                 => ARID_S0,
         ARADDR_S0               => ARADDR_S0,
         ARLEN_S0                => ARLEN_S0,
         ARSIZE_S0               => ARSIZE_S0,
         ARBURST_S0              => ARBURST_S0,
         ARLOCK_S0               => ARLOCK_S0,
         ARCACHE_S0              => ARCACHE_S0,
         ARPROT_S0               => ARPROT_S0,
         ARVALID_S0              => ARVALID_S0,
         ARREADY_S0              => ARREADY_S0,
         RID_S0                  => RID_S0,
         RDATA_S0                => RDATA_S0,
         RRESP_S0                => RRESP_S0,
         RLAST_S0                => RLAST_S0,
         RVALID_S0               => RVALID_S0,
         RREADY_S0               => RREADY_S0,
         AWID_S1                 => AWID_S1,
         AWADDR_S1               => AWADDR_S1,
         AWLEN_S1                => AWLEN_S1,
         AWSIZE_S1               => AWSIZE_S1,
         AWBURST_S1              => AWBURST_S1,
         AWLOCK_S1               => AWLOCK_S1,
         AWCACHE_S1              => AWCACHE_S1,
         AWPROT_S1               => AWPROT_S1,
         AWVALID_S1              => AWVALID_S1,
         AWREADY_S1              => AWREADY_S1,
         WID_S1                  => WID_S1,
         WDATA_S1                => WDATA_S1,
         WSTRB_S1                => WSTRB_S1,
         WLAST_S1                => WLAST_S1,
         WVALID_S1               => WVALID_S1,
         WREADY_S1               => WREADY_S1,
         BID_S1                  => BID_S1,
         BRESP_S1                => BRESP_S1,
         BVALID_S1               => BVALID_S1,
         BREADY_S1               => BREADY_S1,
         ARID_S1                 => ARID_S1,
         ARADDR_S1               => ARADDR_S1,
         ARLEN_S1                => ARLEN_S1,
         ARSIZE_S1               => ARSIZE_S1,
         ARBURST_S1              => ARBURST_S1,
         ARLOCK_S1               => ARLOCK_S1,
         ARCACHE_S1              => ARCACHE_S1,
         ARPROT_S1               => ARPROT_S1,
         ARVALID_S1              => ARVALID_S1,
         ARREADY_S1              => ARREADY_S1,
         RID_S1                  => RID_S1,
         RDATA_S1                => RDATA_S1,
         RRESP_S1                => RRESP_S1,
         RLAST_S1                => RLAST_S1,
         RVALID_S1               => RVALID_S1,
         RREADY_S1               => RREADY_S1,
         AWID_S2                 => AWID_S2,
         AWADDR_S2               => AWADDR_S2,
         AWLEN_S2                => AWLEN_S2,
         AWSIZE_S2               => AWSIZE_S2,
         AWBURST_S2              => AWBURST_S2,
         AWLOCK_S2               => AWLOCK_S2,
         AWCACHE_S2              => AWCACHE_S2,
         AWPROT_S2               => AWPROT_S2,
         AWVALID_S2              => AWVALID_S2,
         AWREADY_S2              => AWREADY_S2,
         WID_S2                  => WID_S2,
         WDATA_S2                => WDATA_S2,
         WSTRB_S2                => WSTRB_S2,
         WLAST_S2                => WLAST_S2,
         WVALID_S2               => WVALID_S2,
         WREADY_S2               => WREADY_S2,
         BID_S2                  => BID_S2,
         BRESP_S2                => BRESP_S2,
         BVALID_S2               => BVALID_S2,
         BREADY_S2               => BREADY_S2,
         ARID_S2                 => ARID_S2,
         ARADDR_S2               => ARADDR_S2,
         ARLEN_S2                => ARLEN_S2,
         ARSIZE_S2               => ARSIZE_S2,
         ARBURST_S2              => ARBURST_S2,
         ARLOCK_S2               => ARLOCK_S2,
         ARCACHE_S2              => ARCACHE_S2,
         ARPROT_S2               => ARPROT_S2,
         ARVALID_S2              => ARVALID_S2,
         ARREADY_S2              => ARREADY_S2,
         RID_S2                  => RID_S2,
         RDATA_S2                => RDATA_S2,
         RRESP_S2                => RRESP_S2,
         RLAST_S2                => RLAST_S2,
         RVALID_S2               => RVALID_S2,
         RREADY_S2               => RREADY_S2,
         AWID_S3                 => AWID_S3,
         AWADDR_S3               => AWADDR_S3,
         AWLEN_S3                => AWLEN_S3,
         AWSIZE_S3               => AWSIZE_S3,
         AWBURST_S3              => AWBURST_S3,
         AWLOCK_S3               => AWLOCK_S3,
         AWCACHE_S3              => AWCACHE_S3,
         AWPROT_S3               => AWPROT_S3,
         AWVALID_S3              => AWVALID_S3,
         AWREADY_S3              => AWREADY_S3,
         WID_S3                  => WID_S3,
         WDATA_S3                => WDATA_S3,
         WSTRB_S3                => WSTRB_S3,
         WLAST_S3                => WLAST_S3,
         WVALID_S3               => WVALID_S3,
         WREADY_S3               => WREADY_S3,
         BID_S3                  => BID_S3,
         BRESP_S3                => BRESP_S3,
         BVALID_S3               => BVALID_S3,
         BREADY_S3               => BREADY_S3,
         ARID_S3                 => ARID_S3,
         ARADDR_S3               => ARADDR_S3,
         ARLEN_S3                => ARLEN_S3,
         ARSIZE_S3               => ARSIZE_S3,
         ARBURST_S3              => ARBURST_S3,
         ARLOCK_S3               => ARLOCK_S3,
         ARCACHE_S3              => ARCACHE_S3,
         ARPROT_S3               => ARPROT_S3,
         ARVALID_S3              => ARVALID_S3,
         ARREADY_S3              => ARREADY_S3,
         RID_S3                  => RID_S3,
         RDATA_S3                => RDATA_S3,
         RRESP_S3                => RRESP_S3,
         RLAST_S3                => RLAST_S3,
         RVALID_S3               => RVALID_S3,
         RREADY_S3               => RREADY_S3,
         AWID_S4                 => AWID_S4,
         AWADDR_S4               => AWADDR_S4,
         AWLEN_S4                => AWLEN_S4,
         AWSIZE_S4               => AWSIZE_S4,
         AWBURST_S4              => AWBURST_S4,
         AWLOCK_S4               => AWLOCK_S4,
         AWCACHE_S4              => AWCACHE_S4,
         AWPROT_S4               => AWPROT_S4,
         AWVALID_S4              => AWVALID_S4,
         AWREADY_S4              => AWREADY_S4,
         WID_S4                  => WID_S4,
         WDATA_S4                => WDATA_S4,
         WSTRB_S4                => WSTRB_S4,
         WLAST_S4                => WLAST_S4,
         WVALID_S4               => WVALID_S4,
         WREADY_S4               => WREADY_S4,
         BID_S4                  => BID_S4,
         BRESP_S4                => BRESP_S4,
         BVALID_S4               => BVALID_S4,
         BREADY_S4               => BREADY_S4,
         ARID_S4                 => ARID_S4,
         ARADDR_S4               => ARADDR_S4,
         ARLEN_S4                => ARLEN_S4,
         ARSIZE_S4               => ARSIZE_S4,
         ARBURST_S4              => ARBURST_S4,
         ARLOCK_S4               => ARLOCK_S4,
         ARCACHE_S4              => ARCACHE_S4,
         ARPROT_S4               => ARPROT_S4,
         ARVALID_S4              => ARVALID_S4,
         ARREADY_S4              => ARREADY_S4,
         RID_S4                  => RID_S4,
         RDATA_S4                => RDATA_S4,
         RRESP_S4                => RRESP_S4,
         RLAST_S4                => RLAST_S4,
         RVALID_S4               => RVALID_S4,
         RREADY_S4               => RREADY_S4,
         AWID_S5                 => AWID_S5,
         AWADDR_S5               => AWADDR_S5,
         AWLEN_S5                => AWLEN_S5,
         AWSIZE_S5               => AWSIZE_S5,
         AWBURST_S5              => AWBURST_S5,
         AWLOCK_S5               => AWLOCK_S5,
         AWCACHE_S5              => AWCACHE_S5,
         AWPROT_S5               => AWPROT_S5,
         AWVALID_S5              => AWVALID_S5,
         AWREADY_S5              => AWREADY_S5,
         WID_S5                  => WID_S5,
         WDATA_S5                => WDATA_S5,
         WSTRB_S5                => WSTRB_S5,
         WLAST_S5                => WLAST_S5,
         WVALID_S5               => WVALID_S5,
         WREADY_S5               => WREADY_S5,
         BID_S5                  => BID_S5,
         BRESP_S5                => BRESP_S5,
         BVALID_S5               => BVALID_S5,
         BREADY_S5               => BREADY_S5,
         ARID_S5                 => ARID_S5,
         ARADDR_S5               => ARADDR_S5,
         ARLEN_S5                => ARLEN_S5,
         ARSIZE_S5               => ARSIZE_S5,
         ARBURST_S5              => ARBURST_S5,
         ARLOCK_S5               => ARLOCK_S5,
         ARCACHE_S5              => ARCACHE_S5,
         ARPROT_S5               => ARPROT_S5,
         ARVALID_S5              => ARVALID_S5,
         ARREADY_S5              => ARREADY_S5,
         RID_S5                  => RID_S5,
         RDATA_S5                => RDATA_S5,
         RRESP_S5                => RRESP_S5,
         RLAST_S5                => RLAST_S5,
         RVALID_S5               => RVALID_S5,
         RREADY_S5               => RREADY_S5,
         AWID_S6                 => AWID_S6,
         AWADDR_S6               => AWADDR_S6,
         AWLEN_S6                => AWLEN_S6,
         AWSIZE_S6               => AWSIZE_S6,
         AWBURST_S6              => AWBURST_S6,
         AWLOCK_S6               => AWLOCK_S6,
         AWCACHE_S6              => AWCACHE_S6,
         AWPROT_S6               => AWPROT_S6,
         AWVALID_S6              => AWVALID_S6,
         AWREADY_S6              => AWREADY_S6,
         WID_S6                  => WID_S6,
         WDATA_S6                => WDATA_S6,
         WSTRB_S6                => WSTRB_S6,
         WLAST_S6                => WLAST_S6,
         WVALID_S6               => WVALID_S6,
         WREADY_S6               => WREADY_S6,
         BID_S6                  => BID_S6,
         BRESP_S6                => BRESP_S6,
         BVALID_S6               => BVALID_S6,
         BREADY_S6               => BREADY_S6,
         ARID_S6                 => ARID_S6,
         ARADDR_S6               => ARADDR_S6,
         ARLEN_S6                => ARLEN_S6,
         ARSIZE_S6               => ARSIZE_S6,
         ARBURST_S6              => ARBURST_S6,
         ARLOCK_S6               => ARLOCK_S6,
         ARCACHE_S6              => ARCACHE_S6,
         ARPROT_S6               => ARPROT_S6,
         ARVALID_S6              => ARVALID_S6,
         ARREADY_S6              => ARREADY_S6,
         RID_S6                  => RID_S6,
         RDATA_S6                => RDATA_S6,
         RRESP_S6                => RRESP_S6,
         RLAST_S6                => RLAST_S6,
         RVALID_S6               => RVALID_S6,
         RREADY_S6               => RREADY_S6,
         AWID_S7                 => AWID_S7,
         AWADDR_S7               => AWADDR_S7,
         AWLEN_S7                => AWLEN_S7,
         AWSIZE_S7               => AWSIZE_S7,
         AWBURST_S7              => AWBURST_S7,
         AWLOCK_S7               => AWLOCK_S7,
         AWCACHE_S7              => AWCACHE_S7,
         AWPROT_S7               => AWPROT_S7,
         AWVALID_S7              => AWVALID_S7,
         AWREADY_S7              => AWREADY_S7,
         WID_S7                  => WID_S7,
         WDATA_S7                => WDATA_S7,
         WSTRB_S7                => WSTRB_S7,
         WLAST_S7                => WLAST_S7,
         WVALID_S7               => WVALID_S7,
         WREADY_S7               => WREADY_S7,
         BID_S7                  => BID_S7,
         BRESP_S7                => BRESP_S7,
         BVALID_S7               => BVALID_S7,
         BREADY_S7               => BREADY_S7,
         ARID_S7                 => ARID_S7,
         ARADDR_S7               => ARADDR_S7,
         ARLEN_S7                => ARLEN_S7,
         ARSIZE_S7               => ARSIZE_S7,
         ARBURST_S7              => ARBURST_S7,
         ARLOCK_S7               => ARLOCK_S7,
         ARCACHE_S7              => ARCACHE_S7,
         ARPROT_S7               => ARPROT_S7,
         ARVALID_S7              => ARVALID_S7,
         ARREADY_S7              => ARREADY_S7,
         RID_S7                  => RID_S7,
         RDATA_S7                => RDATA_S7,
         RRESP_S7                => RRESP_S7,
         RLAST_S7                => RLAST_S7,
         RVALID_S7               => RVALID_S7,
         RREADY_S7               => RREADY_S7,
         AWID_S8                 => AWID_S8,
         AWADDR_S8               => AWADDR_S8,
         AWLEN_S8                => AWLEN_S8,
         AWSIZE_S8               => AWSIZE_S8,
         AWBURST_S8              => AWBURST_S8,
         AWLOCK_S8               => AWLOCK_S8,
         AWCACHE_S8              => AWCACHE_S8,
         AWPROT_S8               => AWPROT_S8,
         AWVALID_S8              => AWVALID_S8,
         AWREADY_S8              => AWREADY_S8,
         WID_S8                  => WID_S8,
         WDATA_S8                => WDATA_S8,
         WSTRB_S8                => WSTRB_S8,
         WLAST_S8                => WLAST_S8,
         WVALID_S8               => WVALID_S8,
         WREADY_S8               => WREADY_S8,
         BID_S8                  => BID_S8,
         BRESP_S8                => BRESP_S8,
         BVALID_S8               => BVALID_S8,
         BREADY_S8               => BREADY_S8,
         ARID_S8                 => ARID_S8,
         ARADDR_S8               => ARADDR_S8,
         ARLEN_S8                => ARLEN_S8,
         ARSIZE_S8               => ARSIZE_S8,
         ARBURST_S8              => ARBURST_S8,
         ARLOCK_S8               => ARLOCK_S8,
         ARCACHE_S8              => ARCACHE_S8,
         ARPROT_S8               => ARPROT_S8,
         ARVALID_S8              => ARVALID_S8,
         ARREADY_S8              => ARREADY_S8,
         RID_S8                  => RID_S8,
         RDATA_S8                => RDATA_S8,
         RRESP_S8                => RRESP_S8,
         RLAST_S8                => RLAST_S8,
         RVALID_S8               => RVALID_S8,
         RREADY_S8               => RREADY_S8,
         AWID_S9                 => AWID_S9,
         AWADDR_S9               => AWADDR_S9,
         AWLEN_S9                => AWLEN_S9,
         AWSIZE_S9               => AWSIZE_S9,
         AWBURST_S9              => AWBURST_S9,
         AWLOCK_S9               => AWLOCK_S9,
         AWCACHE_S9              => AWCACHE_S9,
         AWPROT_S9               => AWPROT_S9,
         AWVALID_S9              => AWVALID_S9,
         AWREADY_S9              => AWREADY_S9,
         WID_S9                  => WID_S9,
         WDATA_S9                => WDATA_S9,
         WSTRB_S9                => WSTRB_S9,
         WLAST_S9                => WLAST_S9,
         WVALID_S9               => WVALID_S9,
         WREADY_S9               => WREADY_S9,
         BID_S9                  => BID_S9,
         BRESP_S9                => BRESP_S9,
         BVALID_S9               => BVALID_S9,
         BREADY_S9               => BREADY_S9,
         ARID_S9                 => ARID_S9,
         ARADDR_S9               => ARADDR_S9,
         ARLEN_S9                => ARLEN_S9,
         ARSIZE_S9               => ARSIZE_S9,
         ARBURST_S9              => ARBURST_S9,
         ARLOCK_S9               => ARLOCK_S9,
         ARCACHE_S9              => ARCACHE_S9,
         ARPROT_S9               => ARPROT_S9,
         ARVALID_S9              => ARVALID_S9,
         ARREADY_S9              => ARREADY_S9,
         RID_S9                  => RID_S9,
         RDATA_S9                => RDATA_S9,
         RRESP_S9                => RRESP_S9,
         RLAST_S9                => RLAST_S9,
         RVALID_S9               => RVALID_S9,
         RREADY_S9               => RREADY_S9,
         AWID_S10                => AWID_S10,
         AWADDR_S10              => AWADDR_S10,
         AWLEN_S10               => AWLEN_S10,
         AWSIZE_S10              => AWSIZE_S10,
         AWBURST_S10             => AWBURST_S10,
         AWLOCK_S10              => AWLOCK_S10,
         AWCACHE_S10             => AWCACHE_S10,
         AWPROT_S10              => AWPROT_S10,
         AWVALID_S10             => AWVALID_S10,
         AWREADY_S10             => AWREADY_S10,
         WID_S10                 => WID_S10,
         WDATA_S10               => WDATA_S10,
         WSTRB_S10               => WSTRB_S10,
         WLAST_S10               => WLAST_S10,
         WVALID_S10              => WVALID_S10,
         WREADY_S10              => WREADY_S10,
         BID_S10                 => BID_S10,
         BRESP_S10               => BRESP_S10,
         BVALID_S10              => BVALID_S10,
         BREADY_S10              => BREADY_S10,
         ARID_S10                => ARID_S10,
         ARADDR_S10              => ARADDR_S10,
         ARLEN_S10               => ARLEN_S10,
         ARSIZE_S10              => ARSIZE_S10,
         ARBURST_S10             => ARBURST_S10,
         ARLOCK_S10              => ARLOCK_S10,
         ARCACHE_S10             => ARCACHE_S10,
         ARPROT_S10              => ARPROT_S10,
         ARVALID_S10             => ARVALID_S10,
         ARREADY_S10             => ARREADY_S10,
         RID_S10                 => RID_S10,
         RDATA_S10               => RDATA_S10,
         RRESP_S10               => RRESP_S10,
         RLAST_S10               => RLAST_S10,
         RVALID_S10              => RVALID_S10,
         RREADY_S10              => RREADY_S10,
         AWID_S11                => AWID_S11,
         AWADDR_S11              => AWADDR_S11,
         AWLEN_S11               => AWLEN_S11,
         AWSIZE_S11              => AWSIZE_S11,
         AWBURST_S11             => AWBURST_S11,
         AWLOCK_S11              => AWLOCK_S11,
         AWCACHE_S11             => AWCACHE_S11,
         AWPROT_S11              => AWPROT_S11,
         AWVALID_S11             => AWVALID_S11,
         AWREADY_S11             => AWREADY_S11,
         WID_S11                 => WID_S11,
         WDATA_S11               => WDATA_S11,
         WSTRB_S11               => WSTRB_S11,
         WLAST_S11               => WLAST_S11,
         WVALID_S11              => WVALID_S11,
         WREADY_S11              => WREADY_S11,
         BID_S11                 => BID_S11,
         BRESP_S11               => BRESP_S11,
         BVALID_S11              => BVALID_S11,
         BREADY_S11              => BREADY_S11,
         ARID_S11                => ARID_S11,
         ARADDR_S11              => ARADDR_S11,
         ARLEN_S11               => ARLEN_S11,
         ARSIZE_S11              => ARSIZE_S11,
         ARBURST_S11             => ARBURST_S11,
         ARLOCK_S11              => ARLOCK_S11,
         ARCACHE_S11             => ARCACHE_S11,
         ARPROT_S11              => ARPROT_S11,
         ARVALID_S11             => ARVALID_S11,
         ARREADY_S11             => ARREADY_S11,
         RID_S11                 => RID_S11,
         RDATA_S11               => RDATA_S11,
         RRESP_S11               => RRESP_S11,
         RLAST_S11               => RLAST_S11,
         RVALID_S11              => RVALID_S11,
         RREADY_S11              => RREADY_S11,
         AWID_S12                => AWID_S12,
         AWADDR_S12              => AWADDR_S12,
         AWLEN_S12               => AWLEN_S12,
         AWSIZE_S12              => AWSIZE_S12,
         AWBURST_S12             => AWBURST_S12,
         AWLOCK_S12              => AWLOCK_S12,
         AWCACHE_S12             => AWCACHE_S12,
         AWPROT_S12              => AWPROT_S12,
         AWVALID_S12             => AWVALID_S12,
         AWREADY_S12             => AWREADY_S12,
         WID_S12                 => WID_S12,
         WDATA_S12               => WDATA_S12,
         WSTRB_S12               => WSTRB_S12,
         WLAST_S12               => WLAST_S12,
         WVALID_S12              => WVALID_S12,
         WREADY_S12              => WREADY_S12,
         BID_S12                 => BID_S12,
         BRESP_S12               => BRESP_S12,
         BVALID_S12              => BVALID_S12,
         BREADY_S12              => BREADY_S12,
         ARID_S12                => ARID_S12,
         ARADDR_S12              => ARADDR_S12,
         ARLEN_S12               => ARLEN_S12,
         ARSIZE_S12              => ARSIZE_S12,
         ARBURST_S12             => ARBURST_S12,
         ARLOCK_S12              => ARLOCK_S12,
         ARCACHE_S12             => ARCACHE_S12,
         ARPROT_S12              => ARPROT_S12,
         ARVALID_S12             => ARVALID_S12,
         ARREADY_S12             => ARREADY_S12,
         RID_S12                 => RID_S12,
         RDATA_S12               => RDATA_S12,
         RRESP_S12               => RRESP_S12,
         RLAST_S12               => RLAST_S12,
         RVALID_S12              => RVALID_S12,
         RREADY_S12              => RREADY_S12,
         AWID_S13                => AWID_S13,
         AWADDR_S13              => AWADDR_S13,
         AWLEN_S13               => AWLEN_S13,
         AWSIZE_S13              => AWSIZE_S13,
         AWBURST_S13             => AWBURST_S13,
         AWLOCK_S13              => AWLOCK_S13,
         AWCACHE_S13             => AWCACHE_S13,
         AWPROT_S13              => AWPROT_S13,
         AWVALID_S13             => AWVALID_S13,
         AWREADY_S13             => AWREADY_S13,
         WID_S13                 => WID_S13,
         WDATA_S13               => WDATA_S13,
         WSTRB_S13               => WSTRB_S13,
         WLAST_S13               => WLAST_S13,
         WVALID_S13              => WVALID_S13,
         WREADY_S13              => WREADY_S13,
         BID_S13                 => BID_S13,
         BRESP_S13               => BRESP_S13,
         BVALID_S13              => BVALID_S13,
         BREADY_S13              => BREADY_S13,
         ARID_S13                => ARID_S13,
         ARADDR_S13              => ARADDR_S13,
         ARLEN_S13               => ARLEN_S13,
         ARSIZE_S13              => ARSIZE_S13,
         ARBURST_S13             => ARBURST_S13,
         ARLOCK_S13              => ARLOCK_S13,
         ARCACHE_S13             => ARCACHE_S13,
         ARPROT_S13              => ARPROT_S13,
         ARVALID_S13             => ARVALID_S13,
         ARREADY_S13             => ARREADY_S13,
         RID_S13                 => RID_S13,
         RDATA_S13               => RDATA_S13,
         RRESP_S13               => RRESP_S13,
         RLAST_S13               => RLAST_S13,
         RVALID_S13              => RVALID_S13,
         RREADY_S13              => RREADY_S13,
         AWID_S14                => AWID_S14,
         AWADDR_S14              => AWADDR_S14,
         AWLEN_S14               => AWLEN_S14,
         AWSIZE_S14              => AWSIZE_S14,
         AWBURST_S14             => AWBURST_S14,
         AWLOCK_S14              => AWLOCK_S14,
         AWCACHE_S14             => AWCACHE_S14,
         AWPROT_S14              => AWPROT_S14,
         AWVALID_S14             => AWVALID_S14,
         AWREADY_S14             => AWREADY_S14,
         WID_S14                 => WID_S14,
         WDATA_S14               => WDATA_S14,
         WSTRB_S14               => WSTRB_S14,
         WLAST_S14               => WLAST_S14,
         WVALID_S14              => WVALID_S14,
         WREADY_S14              => WREADY_S14,
         BID_S14                 => BID_S14,
         BRESP_S14               => BRESP_S14,
         BVALID_S14              => BVALID_S14,
         BREADY_S14              => BREADY_S14,
         ARID_S14                => ARID_S14,
         ARADDR_S14              => ARADDR_S14,
         ARLEN_S14               => ARLEN_S14,
         ARSIZE_S14              => ARSIZE_S14,
         ARBURST_S14             => ARBURST_S14,
         ARLOCK_S14              => ARLOCK_S14,
         ARCACHE_S14             => ARCACHE_S14,
         ARPROT_S14              => ARPROT_S14,
         ARVALID_S14             => ARVALID_S14,
         ARREADY_S14             => ARREADY_S14,
         RID_S14                 => RID_S14,
         RDATA_S14               => RDATA_S14,
         RRESP_S14               => RRESP_S14,
         RLAST_S14               => RLAST_S14,
         RVALID_S14              => RVALID_S14,
         RREADY_S14              => RREADY_S14,
         AWID_S15                => AWID_S15,
         AWADDR_S15              => AWADDR_S15,
         AWLEN_S15               => AWLEN_S15,
         AWSIZE_S15              => AWSIZE_S15,
         AWBURST_S15             => AWBURST_S15,
         AWLOCK_S15              => AWLOCK_S15,
         AWCACHE_S15             => AWCACHE_S15,
         AWPROT_S15              => AWPROT_S15,
         AWVALID_S15             => AWVALID_S15,
         AWREADY_S15             => AWREADY_S15,
         WID_S15                 => WID_S15,
         WDATA_S15               => WDATA_S15,
         WSTRB_S15               => WSTRB_S15,
         WLAST_S15               => WLAST_S15,
         WVALID_S15              => WVALID_S15,
         WREADY_S15              => WREADY_S15,
         BID_S15                 => BID_S15,
         BRESP_S15               => BRESP_S15,
         BVALID_S15              => BVALID_S15,
         BREADY_S15              => BREADY_S15,
         ARID_S15                => ARID_S15,
         ARADDR_S15              => ARADDR_S15,
         ARLEN_S15               => ARLEN_S15,
         ARSIZE_S15              => ARSIZE_S15,
         ARBURST_S15             => ARBURST_S15,
         ARLOCK_S15              => ARLOCK_S15,
         ARCACHE_S15             => ARCACHE_S15,
         ARPROT_S15              => ARPROT_S15,
         ARVALID_S15             => ARVALID_S15,
         ARREADY_S15             => ARREADY_S15,
         RID_S15                 => RID_S15,
         RDATA_S15               => RDATA_S15,
         RRESP_S15               => RRESP_S15,
         RLAST_S15               => RLAST_S15,
         RVALID_S15              => RVALID_S15,
         RREADY_S15              => RREADY_S15,
         AWID_S16                => AWID_S16,
         AWADDR_S16              => AWADDR_S16,
         AWLEN_S16               => AWLEN_S16,
         AWSIZE_S16              => AWSIZE_S16,
         AWBURST_S16             => AWBURST_S16,
         AWLOCK_S16              => AWLOCK_S16,
         AWCACHE_S16             => AWCACHE_S16,
         AWPROT_S16              => AWPROT_S16,
         AWVALID_S16             => AWVALID_S16,
         AWREADY_S16             => AWREADY_S16,
         WID_S16                 => WID_S16,
         WDATA_S16               => WDATA_S16,
         WSTRB_S16               => WSTRB_S16,
         WLAST_S16               => WLAST_S16,
         WVALID_S16              => WVALID_S16,
         WREADY_S16              => WREADY_S16,
         BID_S16                 => BID_S16,
         BRESP_S16               => BRESP_S16,
         BVALID_S16              => BVALID_S16,
         BREADY_S16              => BREADY_S16,
         ARID_S16                => ARID_S16,
         ARADDR_S16              => ARADDR_S16,
         ARLEN_S16               => ARLEN_S16,
         ARSIZE_S16              => ARSIZE_S16,
         ARBURST_S16             => ARBURST_S16,
         ARLOCK_S16              => ARLOCK_S16,
         ARCACHE_S16             => ARCACHE_S16,
         ARPROT_S16              => ARPROT_S16,
         ARVALID_S16             => ARVALID_S16,
         ARREADY_S16             => ARREADY_S16,
         RID_S16                 => RID_S16,
         RDATA_S16               => RDATA_S16,
         RRESP_S16               => RRESP_S16,
         RLAST_S16               => RLAST_S16,
         RVALID_S16              => RVALID_S16,
         RREADY_S16              => RREADY_S16);
   
  
   
  PROCESS
     VARIABLE xhdl_initial : BOOLEAN := TRUE;
  BEGIN
     IF (xhdl_initial) THEN
        TRIGGER_M0 <= '0';
       
        WAIT FOR 100 * xhdl_timescale;
        --ARESETN <= '1';    
        WAIT UNTIL (ACLK'EVENT AND ACLK = '1');
        WAIT UNTIL (ACLK'EVENT AND ACLK = '1');
        WAIT UNTIL (ACLK'EVENT AND ACLK = '1');
        
        TRIGGER_M0 <= '1';
    -- signal which trigger the transactions.
        
        xhdl_initial := FALSE;
     ELSE
        WAIT;
     END IF;
  END PROCESS;



END translated;
