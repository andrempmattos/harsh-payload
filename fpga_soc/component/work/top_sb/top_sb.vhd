----------------------------------------------------------------------
-- Created by SmartDesign Mon Apr 06 16:40:38 2020
-- Version: v11.8 11.8.0.26
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
library COREAHBLITE_LIB;
use COREAHBLITE_LIB.all;
use COREAHBLITE_LIB.components.all;
library CORESDR_AXI_LIB;
use CORESDR_AXI_LIB.all;
----------------------------------------------------------------------
-- top_sb entity declaration
----------------------------------------------------------------------
entity top_sb is
    -- Port list
    port(
        -- Inputs
        CLK1_PAD         : in    std_logic;
        DEVRST_N         : in    std_logic;
        FAB_RESET_N      : in    std_logic;
        GPIO_29_IN       : in    std_logic;
        MMUART_0_RXD     : in    std_logic;
        -- Outputs
        BA               : out   std_logic_vector(1 downto 0);
        CAS_N            : out   std_logic;
        CKE              : out   std_logic;
        CS_N             : out   std_logic_vector(0 to 0);
        DQM              : out   std_logic_vector(1 downto 0);
        FAB_CCC_GL2      : out   std_logic;
        FAB_CCC_LOCK     : out   std_logic;
        GPIO_10_OUT      : out   std_logic;
        GPIO_11_OUT      : out   std_logic;
        GPIO_12_OUT      : out   std_logic;
        GPIO_13_OUT      : out   std_logic;
        GPIO_14_OUT      : out   std_logic;
        GPIO_15_OUT      : out   std_logic;
        GPIO_16_OUT      : out   std_logic;
        GPIO_25_OUT      : out   std_logic;
        GPIO_8_OUT       : out   std_logic;
        GPIO_9_OUT       : out   std_logic;
        INIT_DONE        : out   std_logic;
        MMUART_0_TXD     : out   std_logic;
        MSS_READY        : out   std_logic;
        OE               : out   std_logic;
        POWER_ON_RESET_N : out   std_logic;
        RAS_N            : out   std_logic;
        SA               : out   std_logic_vector(13 downto 0);
        SDRCLK           : out   std_logic;
        WE_N             : out   std_logic;
        -- Inouts
        DQ               : inout std_logic_vector(15 downto 0)
        );
end top_sb;
----------------------------------------------------------------------
-- top_sb architecture body
----------------------------------------------------------------------
architecture RTL of top_sb is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- top_sb_CCC_0_FCCC   -   Actel:SgCore:FCCC:2.0.201
component top_sb_CCC_0_FCCC
    -- Port list
    port(
        -- Inputs
        CLK1_PAD : in  std_logic;
        -- Outputs
        GL2      : out std_logic;
        LOCK     : out std_logic
        );
end component;
-- CoreAHBLite   -   Actel:DirectCore:CoreAHBLite:5.2.100
-- using entity instantiation for component CoreAHBLite
-- top_sb_COREAHBLTOAXI_0_COREAHBLTOAXI   -   Actel:DirectCore:COREAHBLTOAXI:2.1.101
component top_sb_COREAHBLTOAXI_0_COREAHBLTOAXI
    generic( 
        AHB_AWIDTH   : integer := 32 ;
        AHB_DWIDTH   : integer := 32 ;
        AXI_AWIDTH   : integer := 32 ;
        AXI_DWIDTH   : integer := 64 ;
        CLOCKS_ASYNC : integer := 0 ;
        FAMILY       : integer := 19 ;
        UNDEF_BURST  : integer := 0 
        );
    -- Port list
    port(
        -- Inputs
        ACLK      : in  std_logic;
        ARESETn   : in  std_logic;
        ARREADY   : in  std_logic;
        AWREADY   : in  std_logic;
        BID       : in  std_logic_vector(3 downto 0);
        BRESP     : in  std_logic_vector(1 downto 0);
        BVALID    : in  std_logic;
        HADDR     : in  std_logic_vector(31 downto 0);
        HBURST    : in  std_logic_vector(2 downto 0);
        HCLK      : in  std_logic;
        HMASTLOCK : in  std_logic;
        HREADY    : in  std_logic;
        HRESETn   : in  std_logic;
        HSEL      : in  std_logic;
        HSIZE     : in  std_logic_vector(2 downto 0);
        HTRANS    : in  std_logic_vector(1 downto 0);
        HWDATA    : in  std_logic_vector(31 downto 0);
        HWRITE    : in  std_logic;
        RDATA     : in  std_logic_vector(63 downto 0);
        RID       : in  std_logic_vector(3 downto 0);
        RLAST     : in  std_logic;
        RRESP     : in  std_logic_vector(1 downto 0);
        RVALID    : in  std_logic;
        WREADY    : in  std_logic;
        -- Outputs
        ARADDR    : out std_logic_vector(31 downto 0);
        ARBURST   : out std_logic_vector(1 downto 0);
        ARID      : out std_logic_vector(3 downto 0);
        ARLEN     : out std_logic_vector(3 downto 0);
        ARLOCK    : out std_logic_vector(1 downto 0);
        ARSIZE    : out std_logic_vector(2 downto 0);
        ARVALID   : out std_logic;
        AWADDR    : out std_logic_vector(31 downto 0);
        AWBURST   : out std_logic_vector(1 downto 0);
        AWID      : out std_logic_vector(3 downto 0);
        AWLEN     : out std_logic_vector(3 downto 0);
        AWLOCK    : out std_logic_vector(1 downto 0);
        AWSIZE    : out std_logic_vector(2 downto 0);
        AWVALID   : out std_logic;
        BREADY    : out std_logic;
        HRDATA    : out std_logic_vector(31 downto 0);
        HREADYOUT : out std_logic;
        HRESP     : out std_logic_vector(1 downto 0);
        RREADY    : out std_logic;
        WDATA     : out std_logic_vector(63 downto 0);
        WID       : out std_logic_vector(3 downto 0);
        WLAST     : out std_logic;
        WSTRB     : out std_logic_vector(7 downto 0);
        WVALID    : out std_logic
        );
end component;
-- top_sb_COREAXI_0_COREAXI   -   Actel:DirectCore:COREAXI:3.1.100
component top_sb_COREAXI_0_COREAXI
    generic( 
        ADDR_HGS_CFG     : integer := 1 ;
        AXI_DWIDTH       : integer := 64 ;
        FAMILY           : integer := 19 ;
        FEED_THROUGH     : integer := 0 ;
        HGS_CFG          : integer := 1 ;
        ID_WIDTH         : integer := 4 ;
        INP_REG_BUF      : integer := 1 ;
        M0_SLAVE0ENABLE  : integer := 0 ;
        M0_SLAVE1ENABLE  : integer := 0 ;
        M0_SLAVE2ENABLE  : integer := 0 ;
        M0_SLAVE3ENABLE  : integer := 0 ;
        M0_SLAVE4ENABLE  : integer := 0 ;
        M0_SLAVE5ENABLE  : integer := 0 ;
        M0_SLAVE6ENABLE  : integer := 0 ;
        M0_SLAVE7ENABLE  : integer := 0 ;
        M0_SLAVE8ENABLE  : integer := 0 ;
        M0_SLAVE9ENABLE  : integer := 0 ;
        M0_SLAVE10ENABLE : integer := 0 ;
        M0_SLAVE11ENABLE : integer := 0 ;
        M0_SLAVE12ENABLE : integer := 0 ;
        M0_SLAVE13ENABLE : integer := 0 ;
        M0_SLAVE14ENABLE : integer := 0 ;
        M0_SLAVE15ENABLE : integer := 0 ;
        M0_SLAVE16ENABLE : integer := 1 ;
        M1_SLAVE0ENABLE  : integer := 0 ;
        M1_SLAVE1ENABLE  : integer := 0 ;
        M1_SLAVE2ENABLE  : integer := 0 ;
        M1_SLAVE3ENABLE  : integer := 0 ;
        M1_SLAVE4ENABLE  : integer := 0 ;
        M1_SLAVE5ENABLE  : integer := 0 ;
        M1_SLAVE6ENABLE  : integer := 0 ;
        M1_SLAVE7ENABLE  : integer := 0 ;
        M1_SLAVE8ENABLE  : integer := 0 ;
        M1_SLAVE9ENABLE  : integer := 0 ;
        M1_SLAVE10ENABLE : integer := 0 ;
        M1_SLAVE11ENABLE : integer := 0 ;
        M1_SLAVE12ENABLE : integer := 0 ;
        M1_SLAVE13ENABLE : integer := 0 ;
        M1_SLAVE14ENABLE : integer := 0 ;
        M1_SLAVE15ENABLE : integer := 0 ;
        M1_SLAVE16ENABLE : integer := 0 ;
        M2_SLAVE0ENABLE  : integer := 0 ;
        M2_SLAVE1ENABLE  : integer := 0 ;
        M2_SLAVE2ENABLE  : integer := 0 ;
        M2_SLAVE3ENABLE  : integer := 0 ;
        M2_SLAVE4ENABLE  : integer := 0 ;
        M2_SLAVE5ENABLE  : integer := 0 ;
        M2_SLAVE6ENABLE  : integer := 0 ;
        M2_SLAVE7ENABLE  : integer := 0 ;
        M2_SLAVE8ENABLE  : integer := 0 ;
        M2_SLAVE9ENABLE  : integer := 0 ;
        M2_SLAVE10ENABLE : integer := 0 ;
        M2_SLAVE11ENABLE : integer := 0 ;
        M2_SLAVE12ENABLE : integer := 0 ;
        M2_SLAVE13ENABLE : integer := 0 ;
        M2_SLAVE14ENABLE : integer := 0 ;
        M2_SLAVE15ENABLE : integer := 0 ;
        M2_SLAVE16ENABLE : integer := 0 ;
        M3_SLAVE0ENABLE  : integer := 0 ;
        M3_SLAVE1ENABLE  : integer := 0 ;
        M3_SLAVE2ENABLE  : integer := 0 ;
        M3_SLAVE3ENABLE  : integer := 0 ;
        M3_SLAVE4ENABLE  : integer := 0 ;
        M3_SLAVE5ENABLE  : integer := 0 ;
        M3_SLAVE6ENABLE  : integer := 0 ;
        M3_SLAVE7ENABLE  : integer := 0 ;
        M3_SLAVE8ENABLE  : integer := 0 ;
        M3_SLAVE9ENABLE  : integer := 0 ;
        M3_SLAVE10ENABLE : integer := 0 ;
        M3_SLAVE11ENABLE : integer := 0 ;
        M3_SLAVE12ENABLE : integer := 0 ;
        M3_SLAVE13ENABLE : integer := 0 ;
        M3_SLAVE14ENABLE : integer := 0 ;
        M3_SLAVE15ENABLE : integer := 0 ;
        M3_SLAVE16ENABLE : integer := 0 ;
        MEMSPACE         : integer := 2 ;
        NUM_MASTER_SLOT  : integer := 1 ;
        OUT_REG_BUF      : integer := 1 ;
        RD_ACCEPTANCE    : integer := 4 ;
        SC_0             : integer := 1 ;
        SC_1             : integer := 1 ;
        SC_2             : integer := 1 ;
        SC_3             : integer := 1 ;
        SC_4             : integer := 1 ;
        SC_5             : integer := 1 ;
        SC_6             : integer := 1 ;
        SC_7             : integer := 1 ;
        SC_8             : integer := 1 ;
        SC_9             : integer := 1 ;
        SC_10            : integer := 1 ;
        SC_11            : integer := 1 ;
        SC_12            : integer := 0 ;
        SC_13            : integer := 0 ;
        SC_14            : integer := 0 ;
        SC_15            : integer := 0 
        );
    -- Port list
    port(
        -- Inputs
        ACLK        : in  std_logic;
        ARADDR_M0   : in  std_logic_vector(31 downto 0);
        ARADDR_M1   : in  std_logic_vector(31 downto 0);
        ARADDR_M2   : in  std_logic_vector(31 downto 0);
        ARADDR_M3   : in  std_logic_vector(31 downto 0);
        ARBURST_M0  : in  std_logic_vector(1 downto 0);
        ARBURST_M1  : in  std_logic_vector(1 downto 0);
        ARBURST_M2  : in  std_logic_vector(1 downto 0);
        ARBURST_M3  : in  std_logic_vector(1 downto 0);
        ARCACHE_M0  : in  std_logic_vector(3 downto 0);
        ARCACHE_M1  : in  std_logic_vector(3 downto 0);
        ARCACHE_M2  : in  std_logic_vector(3 downto 0);
        ARCACHE_M3  : in  std_logic_vector(3 downto 0);
        ARESETN     : in  std_logic;
        ARID_M0     : in  std_logic_vector(3 downto 0);
        ARID_M1     : in  std_logic_vector(3 downto 0);
        ARID_M2     : in  std_logic_vector(3 downto 0);
        ARID_M3     : in  std_logic_vector(3 downto 0);
        ARLEN_M0    : in  std_logic_vector(3 downto 0);
        ARLEN_M1    : in  std_logic_vector(3 downto 0);
        ARLEN_M2    : in  std_logic_vector(3 downto 0);
        ARLEN_M3    : in  std_logic_vector(3 downto 0);
        ARLOCK_M0   : in  std_logic_vector(1 downto 0);
        ARLOCK_M1   : in  std_logic_vector(1 downto 0);
        ARLOCK_M2   : in  std_logic_vector(1 downto 0);
        ARLOCK_M3   : in  std_logic_vector(1 downto 0);
        ARPROT_M0   : in  std_logic_vector(2 downto 0);
        ARPROT_M1   : in  std_logic_vector(2 downto 0);
        ARPROT_M2   : in  std_logic_vector(2 downto 0);
        ARPROT_M3   : in  std_logic_vector(2 downto 0);
        ARREADY_S0  : in  std_logic;
        ARREADY_S1  : in  std_logic;
        ARREADY_S10 : in  std_logic;
        ARREADY_S11 : in  std_logic;
        ARREADY_S12 : in  std_logic;
        ARREADY_S13 : in  std_logic;
        ARREADY_S14 : in  std_logic;
        ARREADY_S15 : in  std_logic;
        ARREADY_S16 : in  std_logic;
        ARREADY_S2  : in  std_logic;
        ARREADY_S3  : in  std_logic;
        ARREADY_S4  : in  std_logic;
        ARREADY_S5  : in  std_logic;
        ARREADY_S6  : in  std_logic;
        ARREADY_S7  : in  std_logic;
        ARREADY_S8  : in  std_logic;
        ARREADY_S9  : in  std_logic;
        ARSIZE_M0   : in  std_logic_vector(2 downto 0);
        ARSIZE_M1   : in  std_logic_vector(2 downto 0);
        ARSIZE_M2   : in  std_logic_vector(2 downto 0);
        ARSIZE_M3   : in  std_logic_vector(2 downto 0);
        ARVALID_M0  : in  std_logic;
        ARVALID_M1  : in  std_logic;
        ARVALID_M2  : in  std_logic;
        ARVALID_M3  : in  std_logic;
        AWADDR_M0   : in  std_logic_vector(31 downto 0);
        AWADDR_M1   : in  std_logic_vector(31 downto 0);
        AWADDR_M2   : in  std_logic_vector(31 downto 0);
        AWADDR_M3   : in  std_logic_vector(31 downto 0);
        AWBURST_M0  : in  std_logic_vector(1 downto 0);
        AWBURST_M1  : in  std_logic_vector(1 downto 0);
        AWBURST_M2  : in  std_logic_vector(1 downto 0);
        AWBURST_M3  : in  std_logic_vector(1 downto 0);
        AWCACHE_M0  : in  std_logic_vector(3 downto 0);
        AWCACHE_M1  : in  std_logic_vector(3 downto 0);
        AWCACHE_M2  : in  std_logic_vector(3 downto 0);
        AWCACHE_M3  : in  std_logic_vector(3 downto 0);
        AWID_M0     : in  std_logic_vector(3 downto 0);
        AWID_M1     : in  std_logic_vector(3 downto 0);
        AWID_M2     : in  std_logic_vector(3 downto 0);
        AWID_M3     : in  std_logic_vector(3 downto 0);
        AWLEN_M0    : in  std_logic_vector(3 downto 0);
        AWLEN_M1    : in  std_logic_vector(3 downto 0);
        AWLEN_M2    : in  std_logic_vector(3 downto 0);
        AWLEN_M3    : in  std_logic_vector(3 downto 0);
        AWLOCK_M0   : in  std_logic_vector(1 downto 0);
        AWLOCK_M1   : in  std_logic_vector(1 downto 0);
        AWLOCK_M2   : in  std_logic_vector(1 downto 0);
        AWLOCK_M3   : in  std_logic_vector(1 downto 0);
        AWPROT_M0   : in  std_logic_vector(2 downto 0);
        AWPROT_M1   : in  std_logic_vector(2 downto 0);
        AWPROT_M2   : in  std_logic_vector(2 downto 0);
        AWPROT_M3   : in  std_logic_vector(2 downto 0);
        AWREADY_S0  : in  std_logic;
        AWREADY_S1  : in  std_logic;
        AWREADY_S10 : in  std_logic;
        AWREADY_S11 : in  std_logic;
        AWREADY_S12 : in  std_logic;
        AWREADY_S13 : in  std_logic;
        AWREADY_S14 : in  std_logic;
        AWREADY_S15 : in  std_logic;
        AWREADY_S16 : in  std_logic;
        AWREADY_S2  : in  std_logic;
        AWREADY_S3  : in  std_logic;
        AWREADY_S4  : in  std_logic;
        AWREADY_S5  : in  std_logic;
        AWREADY_S6  : in  std_logic;
        AWREADY_S7  : in  std_logic;
        AWREADY_S8  : in  std_logic;
        AWREADY_S9  : in  std_logic;
        AWSIZE_M0   : in  std_logic_vector(2 downto 0);
        AWSIZE_M1   : in  std_logic_vector(2 downto 0);
        AWSIZE_M2   : in  std_logic_vector(2 downto 0);
        AWSIZE_M3   : in  std_logic_vector(2 downto 0);
        AWVALID_M0  : in  std_logic;
        AWVALID_M1  : in  std_logic;
        AWVALID_M2  : in  std_logic;
        AWVALID_M3  : in  std_logic;
        BID_S0      : in  std_logic_vector(5 downto 0);
        BID_S1      : in  std_logic_vector(5 downto 0);
        BID_S10     : in  std_logic_vector(5 downto 0);
        BID_S11     : in  std_logic_vector(5 downto 0);
        BID_S12     : in  std_logic_vector(5 downto 0);
        BID_S13     : in  std_logic_vector(5 downto 0);
        BID_S14     : in  std_logic_vector(5 downto 0);
        BID_S15     : in  std_logic_vector(5 downto 0);
        BID_S16     : in  std_logic_vector(5 downto 0);
        BID_S2      : in  std_logic_vector(5 downto 0);
        BID_S3      : in  std_logic_vector(5 downto 0);
        BID_S4      : in  std_logic_vector(5 downto 0);
        BID_S5      : in  std_logic_vector(5 downto 0);
        BID_S6      : in  std_logic_vector(5 downto 0);
        BID_S7      : in  std_logic_vector(5 downto 0);
        BID_S8      : in  std_logic_vector(5 downto 0);
        BID_S9      : in  std_logic_vector(5 downto 0);
        BREADY_M0   : in  std_logic;
        BREADY_M1   : in  std_logic;
        BREADY_M2   : in  std_logic;
        BREADY_M3   : in  std_logic;
        BRESP_S0    : in  std_logic_vector(1 downto 0);
        BRESP_S1    : in  std_logic_vector(1 downto 0);
        BRESP_S10   : in  std_logic_vector(1 downto 0);
        BRESP_S11   : in  std_logic_vector(1 downto 0);
        BRESP_S12   : in  std_logic_vector(1 downto 0);
        BRESP_S13   : in  std_logic_vector(1 downto 0);
        BRESP_S14   : in  std_logic_vector(1 downto 0);
        BRESP_S15   : in  std_logic_vector(1 downto 0);
        BRESP_S16   : in  std_logic_vector(1 downto 0);
        BRESP_S2    : in  std_logic_vector(1 downto 0);
        BRESP_S3    : in  std_logic_vector(1 downto 0);
        BRESP_S4    : in  std_logic_vector(1 downto 0);
        BRESP_S5    : in  std_logic_vector(1 downto 0);
        BRESP_S6    : in  std_logic_vector(1 downto 0);
        BRESP_S7    : in  std_logic_vector(1 downto 0);
        BRESP_S8    : in  std_logic_vector(1 downto 0);
        BRESP_S9    : in  std_logic_vector(1 downto 0);
        BVALID_S0   : in  std_logic;
        BVALID_S1   : in  std_logic;
        BVALID_S10  : in  std_logic;
        BVALID_S11  : in  std_logic;
        BVALID_S12  : in  std_logic;
        BVALID_S13  : in  std_logic;
        BVALID_S14  : in  std_logic;
        BVALID_S15  : in  std_logic;
        BVALID_S16  : in  std_logic;
        BVALID_S2   : in  std_logic;
        BVALID_S3   : in  std_logic;
        BVALID_S4   : in  std_logic;
        BVALID_S5   : in  std_logic;
        BVALID_S6   : in  std_logic;
        BVALID_S7   : in  std_logic;
        BVALID_S8   : in  std_logic;
        BVALID_S9   : in  std_logic;
        RDATA_S0    : in  std_logic_vector(63 downto 0);
        RDATA_S1    : in  std_logic_vector(63 downto 0);
        RDATA_S10   : in  std_logic_vector(63 downto 0);
        RDATA_S11   : in  std_logic_vector(63 downto 0);
        RDATA_S12   : in  std_logic_vector(63 downto 0);
        RDATA_S13   : in  std_logic_vector(63 downto 0);
        RDATA_S14   : in  std_logic_vector(63 downto 0);
        RDATA_S15   : in  std_logic_vector(63 downto 0);
        RDATA_S16   : in  std_logic_vector(63 downto 0);
        RDATA_S2    : in  std_logic_vector(63 downto 0);
        RDATA_S3    : in  std_logic_vector(63 downto 0);
        RDATA_S4    : in  std_logic_vector(63 downto 0);
        RDATA_S5    : in  std_logic_vector(63 downto 0);
        RDATA_S6    : in  std_logic_vector(63 downto 0);
        RDATA_S7    : in  std_logic_vector(63 downto 0);
        RDATA_S8    : in  std_logic_vector(63 downto 0);
        RDATA_S9    : in  std_logic_vector(63 downto 0);
        RID_S0      : in  std_logic_vector(5 downto 0);
        RID_S1      : in  std_logic_vector(5 downto 0);
        RID_S10     : in  std_logic_vector(5 downto 0);
        RID_S11     : in  std_logic_vector(5 downto 0);
        RID_S12     : in  std_logic_vector(5 downto 0);
        RID_S13     : in  std_logic_vector(5 downto 0);
        RID_S14     : in  std_logic_vector(5 downto 0);
        RID_S15     : in  std_logic_vector(5 downto 0);
        RID_S16     : in  std_logic_vector(5 downto 0);
        RID_S2      : in  std_logic_vector(5 downto 0);
        RID_S3      : in  std_logic_vector(5 downto 0);
        RID_S4      : in  std_logic_vector(5 downto 0);
        RID_S5      : in  std_logic_vector(5 downto 0);
        RID_S6      : in  std_logic_vector(5 downto 0);
        RID_S7      : in  std_logic_vector(5 downto 0);
        RID_S8      : in  std_logic_vector(5 downto 0);
        RID_S9      : in  std_logic_vector(5 downto 0);
        RLAST_S0    : in  std_logic;
        RLAST_S1    : in  std_logic;
        RLAST_S10   : in  std_logic;
        RLAST_S11   : in  std_logic;
        RLAST_S12   : in  std_logic;
        RLAST_S13   : in  std_logic;
        RLAST_S14   : in  std_logic;
        RLAST_S15   : in  std_logic;
        RLAST_S16   : in  std_logic;
        RLAST_S2    : in  std_logic;
        RLAST_S3    : in  std_logic;
        RLAST_S4    : in  std_logic;
        RLAST_S5    : in  std_logic;
        RLAST_S6    : in  std_logic;
        RLAST_S7    : in  std_logic;
        RLAST_S8    : in  std_logic;
        RLAST_S9    : in  std_logic;
        RREADY_M0   : in  std_logic;
        RREADY_M1   : in  std_logic;
        RREADY_M2   : in  std_logic;
        RREADY_M3   : in  std_logic;
        RRESP_S0    : in  std_logic_vector(1 downto 0);
        RRESP_S1    : in  std_logic_vector(1 downto 0);
        RRESP_S10   : in  std_logic_vector(1 downto 0);
        RRESP_S11   : in  std_logic_vector(1 downto 0);
        RRESP_S12   : in  std_logic_vector(1 downto 0);
        RRESP_S13   : in  std_logic_vector(1 downto 0);
        RRESP_S14   : in  std_logic_vector(1 downto 0);
        RRESP_S15   : in  std_logic_vector(1 downto 0);
        RRESP_S16   : in  std_logic_vector(1 downto 0);
        RRESP_S2    : in  std_logic_vector(1 downto 0);
        RRESP_S3    : in  std_logic_vector(1 downto 0);
        RRESP_S4    : in  std_logic_vector(1 downto 0);
        RRESP_S5    : in  std_logic_vector(1 downto 0);
        RRESP_S6    : in  std_logic_vector(1 downto 0);
        RRESP_S7    : in  std_logic_vector(1 downto 0);
        RRESP_S8    : in  std_logic_vector(1 downto 0);
        RRESP_S9    : in  std_logic_vector(1 downto 0);
        RVALID_S0   : in  std_logic;
        RVALID_S1   : in  std_logic;
        RVALID_S10  : in  std_logic;
        RVALID_S11  : in  std_logic;
        RVALID_S12  : in  std_logic;
        RVALID_S13  : in  std_logic;
        RVALID_S14  : in  std_logic;
        RVALID_S15  : in  std_logic;
        RVALID_S16  : in  std_logic;
        RVALID_S2   : in  std_logic;
        RVALID_S3   : in  std_logic;
        RVALID_S4   : in  std_logic;
        RVALID_S5   : in  std_logic;
        RVALID_S6   : in  std_logic;
        RVALID_S7   : in  std_logic;
        RVALID_S8   : in  std_logic;
        RVALID_S9   : in  std_logic;
        WDATA_M0    : in  std_logic_vector(63 downto 0);
        WDATA_M1    : in  std_logic_vector(63 downto 0);
        WDATA_M2    : in  std_logic_vector(63 downto 0);
        WDATA_M3    : in  std_logic_vector(63 downto 0);
        WID_M0      : in  std_logic_vector(3 downto 0);
        WID_M1      : in  std_logic_vector(3 downto 0);
        WID_M2      : in  std_logic_vector(3 downto 0);
        WID_M3      : in  std_logic_vector(3 downto 0);
        WLAST_M0    : in  std_logic;
        WLAST_M1    : in  std_logic;
        WLAST_M2    : in  std_logic;
        WLAST_M3    : in  std_logic;
        WREADY_S0   : in  std_logic;
        WREADY_S1   : in  std_logic;
        WREADY_S10  : in  std_logic;
        WREADY_S11  : in  std_logic;
        WREADY_S12  : in  std_logic;
        WREADY_S13  : in  std_logic;
        WREADY_S14  : in  std_logic;
        WREADY_S15  : in  std_logic;
        WREADY_S16  : in  std_logic;
        WREADY_S2   : in  std_logic;
        WREADY_S3   : in  std_logic;
        WREADY_S4   : in  std_logic;
        WREADY_S5   : in  std_logic;
        WREADY_S6   : in  std_logic;
        WREADY_S7   : in  std_logic;
        WREADY_S8   : in  std_logic;
        WREADY_S9   : in  std_logic;
        WSTRB_M0    : in  std_logic_vector(7 downto 0);
        WSTRB_M1    : in  std_logic_vector(7 downto 0);
        WSTRB_M2    : in  std_logic_vector(7 downto 0);
        WSTRB_M3    : in  std_logic_vector(7 downto 0);
        WVALID_M0   : in  std_logic;
        WVALID_M1   : in  std_logic;
        WVALID_M2   : in  std_logic;
        WVALID_M3   : in  std_logic;
        -- Outputs
        ARADDR_S0   : out std_logic_vector(31 downto 0);
        ARADDR_S1   : out std_logic_vector(31 downto 0);
        ARADDR_S10  : out std_logic_vector(31 downto 0);
        ARADDR_S11  : out std_logic_vector(31 downto 0);
        ARADDR_S12  : out std_logic_vector(31 downto 0);
        ARADDR_S13  : out std_logic_vector(31 downto 0);
        ARADDR_S14  : out std_logic_vector(31 downto 0);
        ARADDR_S15  : out std_logic_vector(31 downto 0);
        ARADDR_S16  : out std_logic_vector(31 downto 0);
        ARADDR_S2   : out std_logic_vector(31 downto 0);
        ARADDR_S3   : out std_logic_vector(31 downto 0);
        ARADDR_S4   : out std_logic_vector(31 downto 0);
        ARADDR_S5   : out std_logic_vector(31 downto 0);
        ARADDR_S6   : out std_logic_vector(31 downto 0);
        ARADDR_S7   : out std_logic_vector(31 downto 0);
        ARADDR_S8   : out std_logic_vector(31 downto 0);
        ARADDR_S9   : out std_logic_vector(31 downto 0);
        ARBURST_S0  : out std_logic_vector(1 downto 0);
        ARBURST_S1  : out std_logic_vector(1 downto 0);
        ARBURST_S10 : out std_logic_vector(1 downto 0);
        ARBURST_S11 : out std_logic_vector(1 downto 0);
        ARBURST_S12 : out std_logic_vector(1 downto 0);
        ARBURST_S13 : out std_logic_vector(1 downto 0);
        ARBURST_S14 : out std_logic_vector(1 downto 0);
        ARBURST_S15 : out std_logic_vector(1 downto 0);
        ARBURST_S16 : out std_logic_vector(1 downto 0);
        ARBURST_S2  : out std_logic_vector(1 downto 0);
        ARBURST_S3  : out std_logic_vector(1 downto 0);
        ARBURST_S4  : out std_logic_vector(1 downto 0);
        ARBURST_S5  : out std_logic_vector(1 downto 0);
        ARBURST_S6  : out std_logic_vector(1 downto 0);
        ARBURST_S7  : out std_logic_vector(1 downto 0);
        ARBURST_S8  : out std_logic_vector(1 downto 0);
        ARBURST_S9  : out std_logic_vector(1 downto 0);
        ARCACHE_S0  : out std_logic_vector(3 downto 0);
        ARCACHE_S1  : out std_logic_vector(3 downto 0);
        ARCACHE_S10 : out std_logic_vector(3 downto 0);
        ARCACHE_S11 : out std_logic_vector(3 downto 0);
        ARCACHE_S12 : out std_logic_vector(3 downto 0);
        ARCACHE_S13 : out std_logic_vector(3 downto 0);
        ARCACHE_S14 : out std_logic_vector(3 downto 0);
        ARCACHE_S15 : out std_logic_vector(3 downto 0);
        ARCACHE_S16 : out std_logic_vector(3 downto 0);
        ARCACHE_S2  : out std_logic_vector(3 downto 0);
        ARCACHE_S3  : out std_logic_vector(3 downto 0);
        ARCACHE_S4  : out std_logic_vector(3 downto 0);
        ARCACHE_S5  : out std_logic_vector(3 downto 0);
        ARCACHE_S6  : out std_logic_vector(3 downto 0);
        ARCACHE_S7  : out std_logic_vector(3 downto 0);
        ARCACHE_S8  : out std_logic_vector(3 downto 0);
        ARCACHE_S9  : out std_logic_vector(3 downto 0);
        ARID_S0     : out std_logic_vector(5 downto 0);
        ARID_S1     : out std_logic_vector(5 downto 0);
        ARID_S10    : out std_logic_vector(5 downto 0);
        ARID_S11    : out std_logic_vector(5 downto 0);
        ARID_S12    : out std_logic_vector(5 downto 0);
        ARID_S13    : out std_logic_vector(5 downto 0);
        ARID_S14    : out std_logic_vector(5 downto 0);
        ARID_S15    : out std_logic_vector(5 downto 0);
        ARID_S16    : out std_logic_vector(5 downto 0);
        ARID_S2     : out std_logic_vector(5 downto 0);
        ARID_S3     : out std_logic_vector(5 downto 0);
        ARID_S4     : out std_logic_vector(5 downto 0);
        ARID_S5     : out std_logic_vector(5 downto 0);
        ARID_S6     : out std_logic_vector(5 downto 0);
        ARID_S7     : out std_logic_vector(5 downto 0);
        ARID_S8     : out std_logic_vector(5 downto 0);
        ARID_S9     : out std_logic_vector(5 downto 0);
        ARLEN_S0    : out std_logic_vector(3 downto 0);
        ARLEN_S1    : out std_logic_vector(3 downto 0);
        ARLEN_S10   : out std_logic_vector(3 downto 0);
        ARLEN_S11   : out std_logic_vector(3 downto 0);
        ARLEN_S12   : out std_logic_vector(3 downto 0);
        ARLEN_S13   : out std_logic_vector(3 downto 0);
        ARLEN_S14   : out std_logic_vector(3 downto 0);
        ARLEN_S15   : out std_logic_vector(3 downto 0);
        ARLEN_S16   : out std_logic_vector(3 downto 0);
        ARLEN_S2    : out std_logic_vector(3 downto 0);
        ARLEN_S3    : out std_logic_vector(3 downto 0);
        ARLEN_S4    : out std_logic_vector(3 downto 0);
        ARLEN_S5    : out std_logic_vector(3 downto 0);
        ARLEN_S6    : out std_logic_vector(3 downto 0);
        ARLEN_S7    : out std_logic_vector(3 downto 0);
        ARLEN_S8    : out std_logic_vector(3 downto 0);
        ARLEN_S9    : out std_logic_vector(3 downto 0);
        ARLOCK_S0   : out std_logic_vector(1 downto 0);
        ARLOCK_S1   : out std_logic_vector(1 downto 0);
        ARLOCK_S10  : out std_logic_vector(1 downto 0);
        ARLOCK_S11  : out std_logic_vector(1 downto 0);
        ARLOCK_S12  : out std_logic_vector(1 downto 0);
        ARLOCK_S13  : out std_logic_vector(1 downto 0);
        ARLOCK_S14  : out std_logic_vector(1 downto 0);
        ARLOCK_S15  : out std_logic_vector(1 downto 0);
        ARLOCK_S16  : out std_logic_vector(1 downto 0);
        ARLOCK_S2   : out std_logic_vector(1 downto 0);
        ARLOCK_S3   : out std_logic_vector(1 downto 0);
        ARLOCK_S4   : out std_logic_vector(1 downto 0);
        ARLOCK_S5   : out std_logic_vector(1 downto 0);
        ARLOCK_S6   : out std_logic_vector(1 downto 0);
        ARLOCK_S7   : out std_logic_vector(1 downto 0);
        ARLOCK_S8   : out std_logic_vector(1 downto 0);
        ARLOCK_S9   : out std_logic_vector(1 downto 0);
        ARPROT_S0   : out std_logic_vector(2 downto 0);
        ARPROT_S1   : out std_logic_vector(2 downto 0);
        ARPROT_S10  : out std_logic_vector(2 downto 0);
        ARPROT_S11  : out std_logic_vector(2 downto 0);
        ARPROT_S12  : out std_logic_vector(2 downto 0);
        ARPROT_S13  : out std_logic_vector(2 downto 0);
        ARPROT_S14  : out std_logic_vector(2 downto 0);
        ARPROT_S15  : out std_logic_vector(2 downto 0);
        ARPROT_S16  : out std_logic_vector(2 downto 0);
        ARPROT_S2   : out std_logic_vector(2 downto 0);
        ARPROT_S3   : out std_logic_vector(2 downto 0);
        ARPROT_S4   : out std_logic_vector(2 downto 0);
        ARPROT_S5   : out std_logic_vector(2 downto 0);
        ARPROT_S6   : out std_logic_vector(2 downto 0);
        ARPROT_S7   : out std_logic_vector(2 downto 0);
        ARPROT_S8   : out std_logic_vector(2 downto 0);
        ARPROT_S9   : out std_logic_vector(2 downto 0);
        ARREADY_M0  : out std_logic;
        ARREADY_M1  : out std_logic;
        ARREADY_M2  : out std_logic;
        ARREADY_M3  : out std_logic;
        ARSIZE_S0   : out std_logic_vector(2 downto 0);
        ARSIZE_S1   : out std_logic_vector(2 downto 0);
        ARSIZE_S10  : out std_logic_vector(2 downto 0);
        ARSIZE_S11  : out std_logic_vector(2 downto 0);
        ARSIZE_S12  : out std_logic_vector(2 downto 0);
        ARSIZE_S13  : out std_logic_vector(2 downto 0);
        ARSIZE_S14  : out std_logic_vector(2 downto 0);
        ARSIZE_S15  : out std_logic_vector(2 downto 0);
        ARSIZE_S16  : out std_logic_vector(2 downto 0);
        ARSIZE_S2   : out std_logic_vector(2 downto 0);
        ARSIZE_S3   : out std_logic_vector(2 downto 0);
        ARSIZE_S4   : out std_logic_vector(2 downto 0);
        ARSIZE_S5   : out std_logic_vector(2 downto 0);
        ARSIZE_S6   : out std_logic_vector(2 downto 0);
        ARSIZE_S7   : out std_logic_vector(2 downto 0);
        ARSIZE_S8   : out std_logic_vector(2 downto 0);
        ARSIZE_S9   : out std_logic_vector(2 downto 0);
        ARVALID_S0  : out std_logic;
        ARVALID_S1  : out std_logic;
        ARVALID_S10 : out std_logic;
        ARVALID_S11 : out std_logic;
        ARVALID_S12 : out std_logic;
        ARVALID_S13 : out std_logic;
        ARVALID_S14 : out std_logic;
        ARVALID_S15 : out std_logic;
        ARVALID_S16 : out std_logic;
        ARVALID_S2  : out std_logic;
        ARVALID_S3  : out std_logic;
        ARVALID_S4  : out std_logic;
        ARVALID_S5  : out std_logic;
        ARVALID_S6  : out std_logic;
        ARVALID_S7  : out std_logic;
        ARVALID_S8  : out std_logic;
        ARVALID_S9  : out std_logic;
        AWADDR_S0   : out std_logic_vector(31 downto 0);
        AWADDR_S1   : out std_logic_vector(31 downto 0);
        AWADDR_S10  : out std_logic_vector(31 downto 0);
        AWADDR_S11  : out std_logic_vector(31 downto 0);
        AWADDR_S12  : out std_logic_vector(31 downto 0);
        AWADDR_S13  : out std_logic_vector(31 downto 0);
        AWADDR_S14  : out std_logic_vector(31 downto 0);
        AWADDR_S15  : out std_logic_vector(31 downto 0);
        AWADDR_S16  : out std_logic_vector(31 downto 0);
        AWADDR_S2   : out std_logic_vector(31 downto 0);
        AWADDR_S3   : out std_logic_vector(31 downto 0);
        AWADDR_S4   : out std_logic_vector(31 downto 0);
        AWADDR_S5   : out std_logic_vector(31 downto 0);
        AWADDR_S6   : out std_logic_vector(31 downto 0);
        AWADDR_S7   : out std_logic_vector(31 downto 0);
        AWADDR_S8   : out std_logic_vector(31 downto 0);
        AWADDR_S9   : out std_logic_vector(31 downto 0);
        AWBURST_S0  : out std_logic_vector(1 downto 0);
        AWBURST_S1  : out std_logic_vector(1 downto 0);
        AWBURST_S10 : out std_logic_vector(1 downto 0);
        AWBURST_S11 : out std_logic_vector(1 downto 0);
        AWBURST_S12 : out std_logic_vector(1 downto 0);
        AWBURST_S13 : out std_logic_vector(1 downto 0);
        AWBURST_S14 : out std_logic_vector(1 downto 0);
        AWBURST_S15 : out std_logic_vector(1 downto 0);
        AWBURST_S16 : out std_logic_vector(1 downto 0);
        AWBURST_S2  : out std_logic_vector(1 downto 0);
        AWBURST_S3  : out std_logic_vector(1 downto 0);
        AWBURST_S4  : out std_logic_vector(1 downto 0);
        AWBURST_S5  : out std_logic_vector(1 downto 0);
        AWBURST_S6  : out std_logic_vector(1 downto 0);
        AWBURST_S7  : out std_logic_vector(1 downto 0);
        AWBURST_S8  : out std_logic_vector(1 downto 0);
        AWBURST_S9  : out std_logic_vector(1 downto 0);
        AWCACHE_S0  : out std_logic_vector(3 downto 0);
        AWCACHE_S1  : out std_logic_vector(3 downto 0);
        AWCACHE_S10 : out std_logic_vector(3 downto 0);
        AWCACHE_S11 : out std_logic_vector(3 downto 0);
        AWCACHE_S12 : out std_logic_vector(3 downto 0);
        AWCACHE_S13 : out std_logic_vector(3 downto 0);
        AWCACHE_S14 : out std_logic_vector(3 downto 0);
        AWCACHE_S15 : out std_logic_vector(3 downto 0);
        AWCACHE_S16 : out std_logic_vector(3 downto 0);
        AWCACHE_S2  : out std_logic_vector(3 downto 0);
        AWCACHE_S3  : out std_logic_vector(3 downto 0);
        AWCACHE_S4  : out std_logic_vector(3 downto 0);
        AWCACHE_S5  : out std_logic_vector(3 downto 0);
        AWCACHE_S6  : out std_logic_vector(3 downto 0);
        AWCACHE_S7  : out std_logic_vector(3 downto 0);
        AWCACHE_S8  : out std_logic_vector(3 downto 0);
        AWCACHE_S9  : out std_logic_vector(3 downto 0);
        AWID_S0     : out std_logic_vector(5 downto 0);
        AWID_S1     : out std_logic_vector(5 downto 0);
        AWID_S10    : out std_logic_vector(5 downto 0);
        AWID_S11    : out std_logic_vector(5 downto 0);
        AWID_S12    : out std_logic_vector(5 downto 0);
        AWID_S13    : out std_logic_vector(5 downto 0);
        AWID_S14    : out std_logic_vector(5 downto 0);
        AWID_S15    : out std_logic_vector(5 downto 0);
        AWID_S16    : out std_logic_vector(5 downto 0);
        AWID_S2     : out std_logic_vector(5 downto 0);
        AWID_S3     : out std_logic_vector(5 downto 0);
        AWID_S4     : out std_logic_vector(5 downto 0);
        AWID_S5     : out std_logic_vector(5 downto 0);
        AWID_S6     : out std_logic_vector(5 downto 0);
        AWID_S7     : out std_logic_vector(5 downto 0);
        AWID_S8     : out std_logic_vector(5 downto 0);
        AWID_S9     : out std_logic_vector(5 downto 0);
        AWLEN_S0    : out std_logic_vector(3 downto 0);
        AWLEN_S1    : out std_logic_vector(3 downto 0);
        AWLEN_S10   : out std_logic_vector(3 downto 0);
        AWLEN_S11   : out std_logic_vector(3 downto 0);
        AWLEN_S12   : out std_logic_vector(3 downto 0);
        AWLEN_S13   : out std_logic_vector(3 downto 0);
        AWLEN_S14   : out std_logic_vector(3 downto 0);
        AWLEN_S15   : out std_logic_vector(3 downto 0);
        AWLEN_S16   : out std_logic_vector(3 downto 0);
        AWLEN_S2    : out std_logic_vector(3 downto 0);
        AWLEN_S3    : out std_logic_vector(3 downto 0);
        AWLEN_S4    : out std_logic_vector(3 downto 0);
        AWLEN_S5    : out std_logic_vector(3 downto 0);
        AWLEN_S6    : out std_logic_vector(3 downto 0);
        AWLEN_S7    : out std_logic_vector(3 downto 0);
        AWLEN_S8    : out std_logic_vector(3 downto 0);
        AWLEN_S9    : out std_logic_vector(3 downto 0);
        AWLOCK_S0   : out std_logic_vector(1 downto 0);
        AWLOCK_S1   : out std_logic_vector(1 downto 0);
        AWLOCK_S10  : out std_logic_vector(1 downto 0);
        AWLOCK_S11  : out std_logic_vector(1 downto 0);
        AWLOCK_S12  : out std_logic_vector(1 downto 0);
        AWLOCK_S13  : out std_logic_vector(1 downto 0);
        AWLOCK_S14  : out std_logic_vector(1 downto 0);
        AWLOCK_S15  : out std_logic_vector(1 downto 0);
        AWLOCK_S16  : out std_logic_vector(1 downto 0);
        AWLOCK_S2   : out std_logic_vector(1 downto 0);
        AWLOCK_S3   : out std_logic_vector(1 downto 0);
        AWLOCK_S4   : out std_logic_vector(1 downto 0);
        AWLOCK_S5   : out std_logic_vector(1 downto 0);
        AWLOCK_S6   : out std_logic_vector(1 downto 0);
        AWLOCK_S7   : out std_logic_vector(1 downto 0);
        AWLOCK_S8   : out std_logic_vector(1 downto 0);
        AWLOCK_S9   : out std_logic_vector(1 downto 0);
        AWPROT_S0   : out std_logic_vector(2 downto 0);
        AWPROT_S1   : out std_logic_vector(2 downto 0);
        AWPROT_S10  : out std_logic_vector(2 downto 0);
        AWPROT_S11  : out std_logic_vector(2 downto 0);
        AWPROT_S12  : out std_logic_vector(2 downto 0);
        AWPROT_S13  : out std_logic_vector(2 downto 0);
        AWPROT_S14  : out std_logic_vector(2 downto 0);
        AWPROT_S15  : out std_logic_vector(2 downto 0);
        AWPROT_S16  : out std_logic_vector(2 downto 0);
        AWPROT_S2   : out std_logic_vector(2 downto 0);
        AWPROT_S3   : out std_logic_vector(2 downto 0);
        AWPROT_S4   : out std_logic_vector(2 downto 0);
        AWPROT_S5   : out std_logic_vector(2 downto 0);
        AWPROT_S6   : out std_logic_vector(2 downto 0);
        AWPROT_S7   : out std_logic_vector(2 downto 0);
        AWPROT_S8   : out std_logic_vector(2 downto 0);
        AWPROT_S9   : out std_logic_vector(2 downto 0);
        AWREADY_M0  : out std_logic;
        AWREADY_M1  : out std_logic;
        AWREADY_M2  : out std_logic;
        AWREADY_M3  : out std_logic;
        AWSIZE_S0   : out std_logic_vector(2 downto 0);
        AWSIZE_S1   : out std_logic_vector(2 downto 0);
        AWSIZE_S10  : out std_logic_vector(2 downto 0);
        AWSIZE_S11  : out std_logic_vector(2 downto 0);
        AWSIZE_S12  : out std_logic_vector(2 downto 0);
        AWSIZE_S13  : out std_logic_vector(2 downto 0);
        AWSIZE_S14  : out std_logic_vector(2 downto 0);
        AWSIZE_S15  : out std_logic_vector(2 downto 0);
        AWSIZE_S16  : out std_logic_vector(2 downto 0);
        AWSIZE_S2   : out std_logic_vector(2 downto 0);
        AWSIZE_S3   : out std_logic_vector(2 downto 0);
        AWSIZE_S4   : out std_logic_vector(2 downto 0);
        AWSIZE_S5   : out std_logic_vector(2 downto 0);
        AWSIZE_S6   : out std_logic_vector(2 downto 0);
        AWSIZE_S7   : out std_logic_vector(2 downto 0);
        AWSIZE_S8   : out std_logic_vector(2 downto 0);
        AWSIZE_S9   : out std_logic_vector(2 downto 0);
        AWVALID_S0  : out std_logic;
        AWVALID_S1  : out std_logic;
        AWVALID_S10 : out std_logic;
        AWVALID_S11 : out std_logic;
        AWVALID_S12 : out std_logic;
        AWVALID_S13 : out std_logic;
        AWVALID_S14 : out std_logic;
        AWVALID_S15 : out std_logic;
        AWVALID_S16 : out std_logic;
        AWVALID_S2  : out std_logic;
        AWVALID_S3  : out std_logic;
        AWVALID_S4  : out std_logic;
        AWVALID_S5  : out std_logic;
        AWVALID_S6  : out std_logic;
        AWVALID_S7  : out std_logic;
        AWVALID_S8  : out std_logic;
        AWVALID_S9  : out std_logic;
        BID_M0      : out std_logic_vector(3 downto 0);
        BID_M1      : out std_logic_vector(3 downto 0);
        BID_M2      : out std_logic_vector(3 downto 0);
        BID_M3      : out std_logic_vector(3 downto 0);
        BREADY_S0   : out std_logic;
        BREADY_S1   : out std_logic;
        BREADY_S10  : out std_logic;
        BREADY_S11  : out std_logic;
        BREADY_S12  : out std_logic;
        BREADY_S13  : out std_logic;
        BREADY_S14  : out std_logic;
        BREADY_S15  : out std_logic;
        BREADY_S16  : out std_logic;
        BREADY_S2   : out std_logic;
        BREADY_S3   : out std_logic;
        BREADY_S4   : out std_logic;
        BREADY_S5   : out std_logic;
        BREADY_S6   : out std_logic;
        BREADY_S7   : out std_logic;
        BREADY_S8   : out std_logic;
        BREADY_S9   : out std_logic;
        BRESP_M0    : out std_logic_vector(1 downto 0);
        BRESP_M1    : out std_logic_vector(1 downto 0);
        BRESP_M2    : out std_logic_vector(1 downto 0);
        BRESP_M3    : out std_logic_vector(1 downto 0);
        BVALID_M0   : out std_logic;
        BVALID_M1   : out std_logic;
        BVALID_M2   : out std_logic;
        BVALID_M3   : out std_logic;
        RDATA_M0    : out std_logic_vector(63 downto 0);
        RDATA_M1    : out std_logic_vector(63 downto 0);
        RDATA_M2    : out std_logic_vector(63 downto 0);
        RDATA_M3    : out std_logic_vector(63 downto 0);
        RID_M0      : out std_logic_vector(3 downto 0);
        RID_M1      : out std_logic_vector(3 downto 0);
        RID_M2      : out std_logic_vector(3 downto 0);
        RID_M3      : out std_logic_vector(3 downto 0);
        RLAST_M0    : out std_logic;
        RLAST_M1    : out std_logic;
        RLAST_M2    : out std_logic;
        RLAST_M3    : out std_logic;
        RREADY_S0   : out std_logic;
        RREADY_S1   : out std_logic;
        RREADY_S10  : out std_logic;
        RREADY_S11  : out std_logic;
        RREADY_S12  : out std_logic;
        RREADY_S13  : out std_logic;
        RREADY_S14  : out std_logic;
        RREADY_S15  : out std_logic;
        RREADY_S16  : out std_logic;
        RREADY_S2   : out std_logic;
        RREADY_S3   : out std_logic;
        RREADY_S4   : out std_logic;
        RREADY_S5   : out std_logic;
        RREADY_S6   : out std_logic;
        RREADY_S7   : out std_logic;
        RREADY_S8   : out std_logic;
        RREADY_S9   : out std_logic;
        RRESP_M0    : out std_logic_vector(1 downto 0);
        RRESP_M1    : out std_logic_vector(1 downto 0);
        RRESP_M2    : out std_logic_vector(1 downto 0);
        RRESP_M3    : out std_logic_vector(1 downto 0);
        RVALID_M0   : out std_logic;
        RVALID_M1   : out std_logic;
        RVALID_M2   : out std_logic;
        RVALID_M3   : out std_logic;
        WDATA_S0    : out std_logic_vector(63 downto 0);
        WDATA_S1    : out std_logic_vector(63 downto 0);
        WDATA_S10   : out std_logic_vector(63 downto 0);
        WDATA_S11   : out std_logic_vector(63 downto 0);
        WDATA_S12   : out std_logic_vector(63 downto 0);
        WDATA_S13   : out std_logic_vector(63 downto 0);
        WDATA_S14   : out std_logic_vector(63 downto 0);
        WDATA_S15   : out std_logic_vector(63 downto 0);
        WDATA_S16   : out std_logic_vector(63 downto 0);
        WDATA_S2    : out std_logic_vector(63 downto 0);
        WDATA_S3    : out std_logic_vector(63 downto 0);
        WDATA_S4    : out std_logic_vector(63 downto 0);
        WDATA_S5    : out std_logic_vector(63 downto 0);
        WDATA_S6    : out std_logic_vector(63 downto 0);
        WDATA_S7    : out std_logic_vector(63 downto 0);
        WDATA_S8    : out std_logic_vector(63 downto 0);
        WDATA_S9    : out std_logic_vector(63 downto 0);
        WID_S0      : out std_logic_vector(5 downto 0);
        WID_S1      : out std_logic_vector(5 downto 0);
        WID_S10     : out std_logic_vector(5 downto 0);
        WID_S11     : out std_logic_vector(5 downto 0);
        WID_S12     : out std_logic_vector(5 downto 0);
        WID_S13     : out std_logic_vector(5 downto 0);
        WID_S14     : out std_logic_vector(5 downto 0);
        WID_S15     : out std_logic_vector(5 downto 0);
        WID_S16     : out std_logic_vector(5 downto 0);
        WID_S2      : out std_logic_vector(5 downto 0);
        WID_S3      : out std_logic_vector(5 downto 0);
        WID_S4      : out std_logic_vector(5 downto 0);
        WID_S5      : out std_logic_vector(5 downto 0);
        WID_S6      : out std_logic_vector(5 downto 0);
        WID_S7      : out std_logic_vector(5 downto 0);
        WID_S8      : out std_logic_vector(5 downto 0);
        WID_S9      : out std_logic_vector(5 downto 0);
        WLAST_S0    : out std_logic;
        WLAST_S1    : out std_logic;
        WLAST_S10   : out std_logic;
        WLAST_S11   : out std_logic;
        WLAST_S12   : out std_logic;
        WLAST_S13   : out std_logic;
        WLAST_S14   : out std_logic;
        WLAST_S15   : out std_logic;
        WLAST_S16   : out std_logic;
        WLAST_S2    : out std_logic;
        WLAST_S3    : out std_logic;
        WLAST_S4    : out std_logic;
        WLAST_S5    : out std_logic;
        WLAST_S6    : out std_logic;
        WLAST_S7    : out std_logic;
        WLAST_S8    : out std_logic;
        WLAST_S9    : out std_logic;
        WREADY_M0   : out std_logic;
        WREADY_M1   : out std_logic;
        WREADY_M2   : out std_logic;
        WREADY_M3   : out std_logic;
        WSTRB_S0    : out std_logic_vector(7 downto 0);
        WSTRB_S1    : out std_logic_vector(7 downto 0);
        WSTRB_S10   : out std_logic_vector(7 downto 0);
        WSTRB_S11   : out std_logic_vector(7 downto 0);
        WSTRB_S12   : out std_logic_vector(7 downto 0);
        WSTRB_S13   : out std_logic_vector(7 downto 0);
        WSTRB_S14   : out std_logic_vector(7 downto 0);
        WSTRB_S15   : out std_logic_vector(7 downto 0);
        WSTRB_S16   : out std_logic_vector(7 downto 0);
        WSTRB_S2    : out std_logic_vector(7 downto 0);
        WSTRB_S3    : out std_logic_vector(7 downto 0);
        WSTRB_S4    : out std_logic_vector(7 downto 0);
        WSTRB_S5    : out std_logic_vector(7 downto 0);
        WSTRB_S6    : out std_logic_vector(7 downto 0);
        WSTRB_S7    : out std_logic_vector(7 downto 0);
        WSTRB_S8    : out std_logic_vector(7 downto 0);
        WSTRB_S9    : out std_logic_vector(7 downto 0);
        WVALID_S0   : out std_logic;
        WVALID_S1   : out std_logic;
        WVALID_S10  : out std_logic;
        WVALID_S11  : out std_logic;
        WVALID_S12  : out std_logic;
        WVALID_S13  : out std_logic;
        WVALID_S14  : out std_logic;
        WVALID_S15  : out std_logic;
        WVALID_S16  : out std_logic;
        WVALID_S2   : out std_logic;
        WVALID_S3   : out std_logic;
        WVALID_S4   : out std_logic;
        WVALID_S5   : out std_logic;
        WVALID_S6   : out std_logic;
        WVALID_S7   : out std_logic;
        WVALID_S8   : out std_logic;
        WVALID_S9   : out std_logic
        );
end component;
-- CoreResetP   -   Actel:DirectCore:CoreResetP:7.1.100
component CoreResetP
    generic( 
        DDR_WAIT            : integer := 200 ;
        DEVICE_090          : integer := 0 ;
        DEVICE_VOLTAGE      : integer := 2 ;
        ENABLE_SOFT_RESETS  : integer := 0 ;
        EXT_RESET_CFG       : integer := 0 ;
        FDDR_IN_USE         : integer := 0 ;
        MDDR_IN_USE         : integer := 0 ;
        SDIF0_IN_USE        : integer := 0 ;
        SDIF0_PCIE          : integer := 0 ;
        SDIF0_PCIE_HOTRESET : integer := 1 ;
        SDIF0_PCIE_L2P2     : integer := 1 ;
        SDIF1_IN_USE        : integer := 0 ;
        SDIF1_PCIE          : integer := 0 ;
        SDIF1_PCIE_HOTRESET : integer := 1 ;
        SDIF1_PCIE_L2P2     : integer := 1 ;
        SDIF2_IN_USE        : integer := 0 ;
        SDIF2_PCIE          : integer := 0 ;
        SDIF2_PCIE_HOTRESET : integer := 1 ;
        SDIF2_PCIE_L2P2     : integer := 1 ;
        SDIF3_IN_USE        : integer := 0 ;
        SDIF3_PCIE          : integer := 0 ;
        SDIF3_PCIE_HOTRESET : integer := 1 ;
        SDIF3_PCIE_L2P2     : integer := 1 
        );
    -- Port list
    port(
        -- Inputs
        CLK_BASE                       : in  std_logic;
        CLK_LTSSM                      : in  std_logic;
        CONFIG1_DONE                   : in  std_logic;
        CONFIG2_DONE                   : in  std_logic;
        FAB_RESET_N                    : in  std_logic;
        FIC_2_APB_M_PRESET_N           : in  std_logic;
        FPLL_LOCK                      : in  std_logic;
        POWER_ON_RESET_N               : in  std_logic;
        RCOSC_25_50MHZ                 : in  std_logic;
        RESET_N_M2F                    : in  std_logic;
        SDIF0_PERST_N                  : in  std_logic;
        SDIF0_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF0_PSEL                     : in  std_logic;
        SDIF0_PWRITE                   : in  std_logic;
        SDIF0_SPLL_LOCK                : in  std_logic;
        SDIF1_PERST_N                  : in  std_logic;
        SDIF1_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF1_PSEL                     : in  std_logic;
        SDIF1_PWRITE                   : in  std_logic;
        SDIF1_SPLL_LOCK                : in  std_logic;
        SDIF2_PERST_N                  : in  std_logic;
        SDIF2_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF2_PSEL                     : in  std_logic;
        SDIF2_PWRITE                   : in  std_logic;
        SDIF2_SPLL_LOCK                : in  std_logic;
        SDIF3_PERST_N                  : in  std_logic;
        SDIF3_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF3_PSEL                     : in  std_logic;
        SDIF3_PWRITE                   : in  std_logic;
        SDIF3_SPLL_LOCK                : in  std_logic;
        SOFT_EXT_RESET_OUT             : in  std_logic;
        SOFT_FDDR_CORE_RESET           : in  std_logic;
        SOFT_M3_RESET                  : in  std_logic;
        SOFT_MDDR_DDR_AXI_S_CORE_RESET : in  std_logic;
        SOFT_RESET_F2M                 : in  std_logic;
        SOFT_SDIF0_0_CORE_RESET        : in  std_logic;
        SOFT_SDIF0_1_CORE_RESET        : in  std_logic;
        SOFT_SDIF0_CORE_RESET          : in  std_logic;
        SOFT_SDIF0_PHY_RESET           : in  std_logic;
        SOFT_SDIF1_CORE_RESET          : in  std_logic;
        SOFT_SDIF1_PHY_RESET           : in  std_logic;
        SOFT_SDIF2_CORE_RESET          : in  std_logic;
        SOFT_SDIF2_PHY_RESET           : in  std_logic;
        SOFT_SDIF3_CORE_RESET          : in  std_logic;
        SOFT_SDIF3_PHY_RESET           : in  std_logic;
        -- Outputs
        DDR_READY                      : out std_logic;
        EXT_RESET_OUT                  : out std_logic;
        FDDR_CORE_RESET_N              : out std_logic;
        INIT_DONE                      : out std_logic;
        M3_RESET_N                     : out std_logic;
        MDDR_DDR_AXI_S_CORE_RESET_N    : out std_logic;
        MSS_HPMS_READY                 : out std_logic;
        RESET_N_F2M                    : out std_logic;
        SDIF0_0_CORE_RESET_N           : out std_logic;
        SDIF0_1_CORE_RESET_N           : out std_logic;
        SDIF0_CORE_RESET_N             : out std_logic;
        SDIF0_PHY_RESET_N              : out std_logic;
        SDIF1_CORE_RESET_N             : out std_logic;
        SDIF1_PHY_RESET_N              : out std_logic;
        SDIF2_CORE_RESET_N             : out std_logic;
        SDIF2_PHY_RESET_N              : out std_logic;
        SDIF3_CORE_RESET_N             : out std_logic;
        SDIF3_PHY_RESET_N              : out std_logic;
        SDIF_READY                     : out std_logic;
        SDIF_RELEASED                  : out std_logic
        );
end component;
-- top_sb_FABOSC_0_OSC   -   Actel:SgCore:OSC:2.0.101
component top_sb_FABOSC_0_OSC
    -- Port list
    port(
        -- Inputs
        XTL                : in  std_logic;
        -- Outputs
        RCOSC_1MHZ_CCC     : out std_logic;
        RCOSC_1MHZ_O2F     : out std_logic;
        RCOSC_25_50MHZ_CCC : out std_logic;
        RCOSC_25_50MHZ_O2F : out std_logic;
        XTLOSC_CCC         : out std_logic;
        XTLOSC_O2F         : out std_logic
        );
end component;
-- CORESDR_AXI   -   Actel:DirectCore:CORESDR_AXI:2.0.116
component CORESDR_AXI
    generic( 
        AUTO_PCH              : integer := 0 ;
        CL                    : integer := 2 ;
        DELAY                 : integer := 6800 ;
        FAMILY                : integer := 19 ;
        MRD                   : integer := 2 ;
        RAS                   : integer := 2 ;
        RC                    : integer := 8 ;
        RCD                   : integer := 2 ;
        REF                   : integer := 4096 ;
        REGDIMM               : integer := 0 ;
        RFC                   : integer := 9 ;
        RP                    : integer := 3 ;
        RRD                   : integer := 2 ;
        SDRAM_BANKSTATMODULES : integer := 4 ;
        SDRAM_CHIPBITS        : integer := 1 ;
        SDRAM_CHIPS           : integer := 1 ;
        SDRAM_COLBITS         : integer := 8 ;
        SDRAM_DQSIZE          : integer := 16 ;
        SDRAM_ROWBITS         : integer := 12 ;
        WR                    : integer := 2 
        );
    -- Port list
    port(
        -- Inputs
        ACLK    : in    std_logic;
        ARADDR  : in    std_logic_vector(31 downto 0);
        ARBURST : in    std_logic_vector(1 downto 0);
        ARESETN : in    std_logic;
        ARID    : in    std_logic_vector(3 downto 0);
        ARLEN   : in    std_logic_vector(3 downto 0);
        ARLOCK  : in    std_logic_vector(1 downto 0);
        ARSIZE  : in    std_logic_vector(2 downto 0);
        ARVALID : in    std_logic;
        AWADDR  : in    std_logic_vector(31 downto 0);
        AWBURST : in    std_logic_vector(1 downto 0);
        AWID    : in    std_logic_vector(3 downto 0);
        AWLEN   : in    std_logic_vector(3 downto 0);
        AWLOCK  : in    std_logic_vector(1 downto 0);
        AWSIZE  : in    std_logic_vector(2 downto 0);
        AWVALID : in    std_logic;
        BREADY  : in    std_logic;
        RREADY  : in    std_logic;
        WDATA   : in    std_logic_vector(63 downto 0);
        WID     : in    std_logic_vector(3 downto 0);
        WLAST   : in    std_logic;
        WSTRB   : in    std_logic_vector(7 downto 0);
        WVALID  : in    std_logic;
        -- Outputs
        ARREADY : out   std_logic;
        AWREADY : out   std_logic;
        BA      : out   std_logic_vector(1 downto 0);
        BID     : out   std_logic_vector(3 downto 0);
        BRESP   : out   std_logic_vector(1 downto 0);
        BVALID  : out   std_logic;
        CAS_N   : out   std_logic;
        CKE     : out   std_logic;
        CS_N    : out   std_logic_vector(0 to 0);
        DQM     : out   std_logic_vector(1 downto 0);
        OE      : out   std_logic;
        RAS_N   : out   std_logic;
        RDATA   : out   std_logic_vector(63 downto 0);
        RID     : out   std_logic_vector(3 downto 0);
        RLAST   : out   std_logic;
        RRESP   : out   std_logic_vector(1 downto 0);
        RVALID  : out   std_logic;
        SA      : out   std_logic_vector(13 downto 0);
        SDRCLK  : out   std_logic;
        WE_N    : out   std_logic;
        WREADY  : out   std_logic;
        -- Inouts
        DQ      : inout std_logic_vector(15 downto 0)
        );
end component;
-- SYSRESET
component SYSRESET
    -- Port list
    port(
        -- Inputs
        DEVRST_N         : in  std_logic;
        -- Outputs
        POWER_ON_RESET_N : out std_logic
        );
end component;
-- top_sb_MSS
component top_sb_MSS
    -- Port list
    port(
        -- Inputs
        FIC_2_APB_M_PRDATA       : in  std_logic_vector(31 downto 0);
        FIC_2_APB_M_PREADY       : in  std_logic;
        FIC_2_APB_M_PSLVERR      : in  std_logic;
        GPIO_29_IN               : in  std_logic;
        MCCC_CLK_BASE            : in  std_logic;
        MCCC_CLK_BASE_PLL_LOCK   : in  std_logic;
        MDDR_SMC_AHB_M_HRDATA    : in  std_logic_vector(31 downto 0);
        MDDR_SMC_AHB_M_HREADY    : in  std_logic;
        MDDR_SMC_AHB_M_HRESP     : in  std_logic;
        MMUART_0_RXD             : in  std_logic;
        MSS_RESET_N_F2M          : in  std_logic;
        -- Outputs
        FIC_2_APB_M_PADDR        : out std_logic_vector(15 downto 2);
        FIC_2_APB_M_PCLK         : out std_logic;
        FIC_2_APB_M_PENABLE      : out std_logic;
        FIC_2_APB_M_PRESET_N     : out std_logic;
        FIC_2_APB_M_PSEL         : out std_logic;
        FIC_2_APB_M_PWDATA       : out std_logic_vector(31 downto 0);
        FIC_2_APB_M_PWRITE       : out std_logic;
        GPIO_10_OUT              : out std_logic;
        GPIO_11_OUT              : out std_logic;
        GPIO_12_OUT              : out std_logic;
        GPIO_13_OUT              : out std_logic;
        GPIO_14_OUT              : out std_logic;
        GPIO_15_OUT              : out std_logic;
        GPIO_16_OUT              : out std_logic;
        GPIO_25_OUT              : out std_logic;
        GPIO_8_OUT               : out std_logic;
        GPIO_9_OUT               : out std_logic;
        MDDR_SMC_AHB_M_HADDR     : out std_logic_vector(31 downto 0);
        MDDR_SMC_AHB_M_HBURST    : out std_logic_vector(2 downto 0);
        MDDR_SMC_AHB_M_HMASTLOCK : out std_logic;
        MDDR_SMC_AHB_M_HSIZE     : out std_logic_vector(1 downto 0);
        MDDR_SMC_AHB_M_HTRANS    : out std_logic_vector(1 downto 0);
        MDDR_SMC_AHB_M_HWDATA    : out std_logic_vector(31 downto 0);
        MDDR_SMC_AHB_M_HWRITE    : out std_logic;
        MMUART_0_TXD             : out std_logic;
        MSS_RESET_N_M2F          : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal BA_net_0                                    : std_logic_vector(1 downto 0);
signal CAS_N_net_0                                 : std_logic;
signal CKE_net_0                                   : std_logic;
signal CoreAHBLite_0_AHBmslave10_HADDR             : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave10_HBURST            : std_logic_vector(2 downto 0);
signal CoreAHBLite_0_AHBmslave10_HMASTLOCK         : std_logic;
signal CoreAHBLite_0_AHBmslave10_HPROT             : std_logic_vector(3 downto 0);
signal CoreAHBLite_0_AHBmslave10_HRDATA            : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave10_HREADY            : std_logic;
signal CoreAHBLite_0_AHBmslave10_HREADYOUT         : std_logic;
signal CoreAHBLite_0_AHBmslave10_HRESP             : std_logic_vector(1 downto 0);
signal CoreAHBLite_0_AHBmslave10_HSELx             : std_logic;
signal CoreAHBLite_0_AHBmslave10_HSIZE             : std_logic_vector(2 downto 0);
signal CoreAHBLite_0_AHBmslave10_HTRANS            : std_logic_vector(1 downto 0);
signal CoreAHBLite_0_AHBmslave10_HWDATA            : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave10_HWRITE            : std_logic;
signal COREAHBLTOAXI_0_AXIMasterIF_ARADDR          : std_logic_vector(31 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_ARBURST         : std_logic_vector(1 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_ARID            : std_logic_vector(3 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_ARLEN           : std_logic_vector(3 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_ARLOCK          : std_logic_vector(1 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_ARREADY         : std_logic;
signal COREAHBLTOAXI_0_AXIMasterIF_ARSIZE          : std_logic_vector(2 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_ARVALID         : std_logic;
signal COREAHBLTOAXI_0_AXIMasterIF_AWADDR          : std_logic_vector(31 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_AWBURST         : std_logic_vector(1 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_AWID            : std_logic_vector(3 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_AWLEN           : std_logic_vector(3 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_AWLOCK          : std_logic_vector(1 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_AWREADY         : std_logic;
signal COREAHBLTOAXI_0_AXIMasterIF_AWSIZE          : std_logic_vector(2 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_AWVALID         : std_logic;
signal COREAHBLTOAXI_0_AXIMasterIF_BID             : std_logic_vector(3 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_BREADY          : std_logic;
signal COREAHBLTOAXI_0_AXIMasterIF_BRESP           : std_logic_vector(1 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_BVALID          : std_logic;
signal COREAHBLTOAXI_0_AXIMasterIF_RDATA           : std_logic_vector(63 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_RID             : std_logic_vector(3 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_RLAST           : std_logic;
signal COREAHBLTOAXI_0_AXIMasterIF_RREADY          : std_logic;
signal COREAHBLTOAXI_0_AXIMasterIF_RRESP           : std_logic_vector(1 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_RVALID          : std_logic;
signal COREAHBLTOAXI_0_AXIMasterIF_WDATA           : std_logic_vector(63 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_WID             : std_logic_vector(3 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_WLAST           : std_logic;
signal COREAHBLTOAXI_0_AXIMasterIF_WREADY          : std_logic;
signal COREAHBLTOAXI_0_AXIMasterIF_WSTRB           : std_logic_vector(7 downto 0);
signal COREAHBLTOAXI_0_AXIMasterIF_WVALID          : std_logic;
signal COREAXI_0_AXImslave16_ARADDR                : std_logic_vector(31 downto 0);
signal COREAXI_0_AXImslave16_ARBURST               : std_logic_vector(1 downto 0);
signal COREAXI_0_AXImslave16_ARCACHE               : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave16_ARLEN                 : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave16_ARLOCK                : std_logic_vector(1 downto 0);
signal COREAXI_0_AXImslave16_ARPROT                : std_logic_vector(2 downto 0);
signal COREAXI_0_AXImslave16_ARREADY               : std_logic;
signal COREAXI_0_AXImslave16_ARSIZE                : std_logic_vector(2 downto 0);
signal COREAXI_0_AXImslave16_ARVALID               : std_logic;
signal COREAXI_0_AXImslave16_AWADDR                : std_logic_vector(31 downto 0);
signal COREAXI_0_AXImslave16_AWBURST               : std_logic_vector(1 downto 0);
signal COREAXI_0_AXImslave16_AWCACHE               : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave16_AWLEN                 : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave16_AWLOCK                : std_logic_vector(1 downto 0);
signal COREAXI_0_AXImslave16_AWPROT                : std_logic_vector(2 downto 0);
signal COREAXI_0_AXImslave16_AWREADY               : std_logic;
signal COREAXI_0_AXImslave16_AWSIZE                : std_logic_vector(2 downto 0);
signal COREAXI_0_AXImslave16_AWVALID               : std_logic;
signal COREAXI_0_AXImslave16_BREADY                : std_logic;
signal COREAXI_0_AXImslave16_BRESP                 : std_logic_vector(1 downto 0);
signal COREAXI_0_AXImslave16_BVALID                : std_logic;
signal COREAXI_0_AXImslave16_RDATA                 : std_logic_vector(63 downto 0);
signal COREAXI_0_AXImslave16_RLAST                 : std_logic;
signal COREAXI_0_AXImslave16_RREADY                : std_logic;
signal COREAXI_0_AXImslave16_RRESP                 : std_logic_vector(1 downto 0);
signal COREAXI_0_AXImslave16_RVALID                : std_logic;
signal COREAXI_0_AXImslave16_WDATA                 : std_logic_vector(63 downto 0);
signal COREAXI_0_AXImslave16_WLAST                 : std_logic;
signal COREAXI_0_AXImslave16_WREADY                : std_logic;
signal COREAXI_0_AXImslave16_WSTRB                 : std_logic_vector(7 downto 0);
signal COREAXI_0_AXImslave16_WVALID                : std_logic;
signal CORERESETP_0_RESET_N_F2M                    : std_logic;
signal CS_N_net_0                                  : std_logic_vector(0 to 0);
signal DQM_net_0                                   : std_logic_vector(1 downto 0);
signal FAB_CCC_GL2_net_0                           : std_logic;
signal FAB_CCC_LOCK_net_0                          : std_logic;
signal FABOSC_0_RCOSC_25_50MHZ_O2F                 : std_logic;
signal GPIO_8_OUT_net_0                            : std_logic;
signal GPIO_9_OUT_net_0                            : std_logic;
signal GPIO_10_OUT_net_0                           : std_logic;
signal GPIO_11_OUT_net_0                           : std_logic;
signal GPIO_12_OUT_net_0                           : std_logic;
signal GPIO_13_OUT_net_0                           : std_logic;
signal GPIO_14_OUT_net_0                           : std_logic;
signal GPIO_15_OUT_net_0                           : std_logic;
signal GPIO_16_OUT_net_0                           : std_logic;
signal GPIO_25_OUT_net_0                           : std_logic;
signal INIT_DONE_net_0                             : std_logic;
signal MMUART_0_TXD_net_0                          : std_logic;
signal MSS_READY_net_0                             : std_logic;
signal OE_net_0                                    : std_logic;
signal POWER_ON_RESET_N_net_0                      : std_logic;
signal RAS_N_net_0                                 : std_logic;
signal SA_net_0                                    : std_logic_vector(13 downto 0);
signal SDRCLK_net_0                                : std_logic;
signal top_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N       : std_logic;
signal top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HADDR  : std_logic_vector(31 downto 0);
signal top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HBURST : std_logic_vector(2 downto 0);
signal top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HLOCK  : std_logic;
signal top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HRDATA : std_logic_vector(31 downto 0);
signal top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HREADY : std_logic;
signal top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HTRANS : std_logic_vector(1 downto 0);
signal top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HWDATA : std_logic_vector(31 downto 0);
signal top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HWRITE : std_logic;
signal top_sb_MSS_TMP_0_MSS_RESET_N_M2F            : std_logic;
signal WE_N_net_0                                  : std_logic;
signal MMUART_0_TXD_net_1                          : std_logic;
signal POWER_ON_RESET_N_net_1                      : std_logic;
signal INIT_DONE_net_1                             : std_logic;
signal FAB_CCC_GL2_net_1                           : std_logic;
signal FAB_CCC_LOCK_net_1                          : std_logic;
signal MSS_READY_net_1                             : std_logic;
signal SDRCLK_net_1                                : std_logic;
signal OE_net_1                                    : std_logic;
signal CKE_net_1                                   : std_logic;
signal RAS_N_net_1                                 : std_logic;
signal CAS_N_net_1                                 : std_logic;
signal WE_N_net_1                                  : std_logic;
signal GPIO_8_OUT_net_1                            : std_logic;
signal GPIO_9_OUT_net_1                            : std_logic;
signal GPIO_10_OUT_net_1                           : std_logic;
signal GPIO_11_OUT_net_1                           : std_logic;
signal GPIO_12_OUT_net_1                           : std_logic;
signal GPIO_13_OUT_net_1                           : std_logic;
signal GPIO_14_OUT_net_1                           : std_logic;
signal GPIO_15_OUT_net_1                           : std_logic;
signal GPIO_16_OUT_net_1                           : std_logic;
signal GPIO_25_OUT_net_1                           : std_logic;
signal SA_net_1                                    : std_logic_vector(13 downto 0);
signal BA_net_1                                    : std_logic_vector(1 downto 0);
signal CS_N_net_1                                  : std_logic_vector(0 to 0);
signal DQM_net_1                                   : std_logic_vector(1 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net                                     : std_logic;
signal VCC_net                                     : std_logic;
signal PADDR_const_net_0                           : std_logic_vector(7 downto 2);
signal PWDATA_const_net_0                          : std_logic_vector(7 downto 0);
signal SDIF0_PRDATA_const_net_0                    : std_logic_vector(31 downto 0);
signal SDIF1_PRDATA_const_net_0                    : std_logic_vector(31 downto 0);
signal SDIF2_PRDATA_const_net_0                    : std_logic_vector(31 downto 0);
signal SDIF3_PRDATA_const_net_0                    : std_logic_vector(31 downto 0);
signal HPROT_M0_const_net_0                        : std_logic_vector(3 downto 0);
signal HADDR_M1_const_net_0                        : std_logic_vector(31 downto 0);
signal HTRANS_M1_const_net_0                       : std_logic_vector(1 downto 0);
signal HSIZE_M1_const_net_0                        : std_logic_vector(2 downto 0);
signal HBURST_M1_const_net_0                       : std_logic_vector(2 downto 0);
signal HPROT_M1_const_net_0                        : std_logic_vector(3 downto 0);
signal HWDATA_M1_const_net_0                       : std_logic_vector(31 downto 0);
signal HADDR_M2_const_net_0                        : std_logic_vector(31 downto 0);
signal HTRANS_M2_const_net_0                       : std_logic_vector(1 downto 0);
signal HSIZE_M2_const_net_0                        : std_logic_vector(2 downto 0);
signal HBURST_M2_const_net_0                       : std_logic_vector(2 downto 0);
signal HPROT_M2_const_net_0                        : std_logic_vector(3 downto 0);
signal HWDATA_M2_const_net_0                       : std_logic_vector(31 downto 0);
signal HADDR_M3_const_net_0                        : std_logic_vector(31 downto 0);
signal HTRANS_M3_const_net_0                       : std_logic_vector(1 downto 0);
signal HSIZE_M3_const_net_0                        : std_logic_vector(2 downto 0);
signal HBURST_M3_const_net_0                       : std_logic_vector(2 downto 0);
signal HPROT_M3_const_net_0                        : std_logic_vector(3 downto 0);
signal HWDATA_M3_const_net_0                       : std_logic_vector(31 downto 0);
signal HRDATA_S0_const_net_0                       : std_logic_vector(31 downto 0);
signal HRESP_S0_const_net_0                        : std_logic_vector(1 downto 0);
signal HRDATA_S1_const_net_0                       : std_logic_vector(31 downto 0);
signal HRESP_S1_const_net_0                        : std_logic_vector(1 downto 0);
signal HRDATA_S2_const_net_0                       : std_logic_vector(31 downto 0);
signal HRESP_S2_const_net_0                        : std_logic_vector(1 downto 0);
signal HRDATA_S3_const_net_0                       : std_logic_vector(31 downto 0);
signal HRESP_S3_const_net_0                        : std_logic_vector(1 downto 0);
signal HRDATA_S4_const_net_0                       : std_logic_vector(31 downto 0);
signal HRESP_S4_const_net_0                        : std_logic_vector(1 downto 0);
signal HRDATA_S5_const_net_0                       : std_logic_vector(31 downto 0);
signal HRESP_S5_const_net_0                        : std_logic_vector(1 downto 0);
signal HRDATA_S6_const_net_0                       : std_logic_vector(31 downto 0);
signal HRESP_S6_const_net_0                        : std_logic_vector(1 downto 0);
signal HRDATA_S7_const_net_0                       : std_logic_vector(31 downto 0);
signal HRESP_S7_const_net_0                        : std_logic_vector(1 downto 0);
signal HRDATA_S8_const_net_0                       : std_logic_vector(31 downto 0);
signal HRESP_S8_const_net_0                        : std_logic_vector(1 downto 0);
signal HRDATA_S9_const_net_0                       : std_logic_vector(31 downto 0);
signal HRESP_S9_const_net_0                        : std_logic_vector(1 downto 0);
signal HRDATA_S11_const_net_0                      : std_logic_vector(31 downto 0);
signal HRESP_S11_const_net_0                       : std_logic_vector(1 downto 0);
signal HRDATA_S12_const_net_0                      : std_logic_vector(31 downto 0);
signal HRESP_S12_const_net_0                       : std_logic_vector(1 downto 0);
signal HRDATA_S13_const_net_0                      : std_logic_vector(31 downto 0);
signal HRESP_S13_const_net_0                       : std_logic_vector(1 downto 0);
signal HRDATA_S14_const_net_0                      : std_logic_vector(31 downto 0);
signal HRESP_S14_const_net_0                       : std_logic_vector(1 downto 0);
signal HRDATA_S15_const_net_0                      : std_logic_vector(31 downto 0);
signal HRESP_S15_const_net_0                       : std_logic_vector(1 downto 0);
signal HRDATA_S16_const_net_0                      : std_logic_vector(31 downto 0);
signal HRESP_S16_const_net_0                       : std_logic_vector(1 downto 0);
signal BID_S0_const_net_0                          : std_logic_vector(5 downto 0);
signal BRESP_S0_const_net_0                        : std_logic_vector(1 downto 0);
signal RID_S0_const_net_0                          : std_logic_vector(5 downto 0);
signal RDATA_S0_const_net_0                        : std_logic_vector(63 downto 0);
signal RRESP_S0_const_net_0                        : std_logic_vector(1 downto 0);
signal BID_S1_const_net_0                          : std_logic_vector(5 downto 0);
signal BRESP_S1_const_net_0                        : std_logic_vector(1 downto 0);
signal RID_S1_const_net_0                          : std_logic_vector(5 downto 0);
signal RDATA_S1_const_net_0                        : std_logic_vector(63 downto 0);
signal RRESP_S1_const_net_0                        : std_logic_vector(1 downto 0);
signal BID_S2_const_net_0                          : std_logic_vector(5 downto 0);
signal BRESP_S2_const_net_0                        : std_logic_vector(1 downto 0);
signal RID_S2_const_net_0                          : std_logic_vector(5 downto 0);
signal RDATA_S2_const_net_0                        : std_logic_vector(63 downto 0);
signal RRESP_S2_const_net_0                        : std_logic_vector(1 downto 0);
signal BID_S3_const_net_0                          : std_logic_vector(5 downto 0);
signal BRESP_S3_const_net_0                        : std_logic_vector(1 downto 0);
signal RID_S3_const_net_0                          : std_logic_vector(5 downto 0);
signal RDATA_S3_const_net_0                        : std_logic_vector(63 downto 0);
signal RRESP_S3_const_net_0                        : std_logic_vector(1 downto 0);
signal BID_S4_const_net_0                          : std_logic_vector(5 downto 0);
signal BRESP_S4_const_net_0                        : std_logic_vector(1 downto 0);
signal RID_S4_const_net_0                          : std_logic_vector(5 downto 0);
signal RDATA_S4_const_net_0                        : std_logic_vector(63 downto 0);
signal RRESP_S4_const_net_0                        : std_logic_vector(1 downto 0);
signal BID_S5_const_net_0                          : std_logic_vector(5 downto 0);
signal BRESP_S5_const_net_0                        : std_logic_vector(1 downto 0);
signal RID_S5_const_net_0                          : std_logic_vector(5 downto 0);
signal RDATA_S5_const_net_0                        : std_logic_vector(63 downto 0);
signal RRESP_S5_const_net_0                        : std_logic_vector(1 downto 0);
signal BID_S6_const_net_0                          : std_logic_vector(5 downto 0);
signal BRESP_S6_const_net_0                        : std_logic_vector(1 downto 0);
signal RID_S6_const_net_0                          : std_logic_vector(5 downto 0);
signal RDATA_S6_const_net_0                        : std_logic_vector(63 downto 0);
signal RRESP_S6_const_net_0                        : std_logic_vector(1 downto 0);
signal BID_S7_const_net_0                          : std_logic_vector(5 downto 0);
signal BRESP_S7_const_net_0                        : std_logic_vector(1 downto 0);
signal RID_S7_const_net_0                          : std_logic_vector(5 downto 0);
signal RDATA_S7_const_net_0                        : std_logic_vector(63 downto 0);
signal RRESP_S7_const_net_0                        : std_logic_vector(1 downto 0);
signal BID_S8_const_net_0                          : std_logic_vector(5 downto 0);
signal BRESP_S8_const_net_0                        : std_logic_vector(1 downto 0);
signal RID_S8_const_net_0                          : std_logic_vector(5 downto 0);
signal RDATA_S8_const_net_0                        : std_logic_vector(63 downto 0);
signal RRESP_S8_const_net_0                        : std_logic_vector(1 downto 0);
signal BID_S9_const_net_0                          : std_logic_vector(5 downto 0);
signal BRESP_S9_const_net_0                        : std_logic_vector(1 downto 0);
signal RID_S9_const_net_0                          : std_logic_vector(5 downto 0);
signal RDATA_S9_const_net_0                        : std_logic_vector(63 downto 0);
signal RRESP_S9_const_net_0                        : std_logic_vector(1 downto 0);
signal BID_S10_const_net_0                         : std_logic_vector(5 downto 0);
signal BRESP_S10_const_net_0                       : std_logic_vector(1 downto 0);
signal RID_S10_const_net_0                         : std_logic_vector(5 downto 0);
signal RDATA_S10_const_net_0                       : std_logic_vector(63 downto 0);
signal RRESP_S10_const_net_0                       : std_logic_vector(1 downto 0);
signal BID_S11_const_net_0                         : std_logic_vector(5 downto 0);
signal BRESP_S11_const_net_0                       : std_logic_vector(1 downto 0);
signal RID_S11_const_net_0                         : std_logic_vector(5 downto 0);
signal RDATA_S11_const_net_0                       : std_logic_vector(63 downto 0);
signal RRESP_S11_const_net_0                       : std_logic_vector(1 downto 0);
signal BID_S12_const_net_0                         : std_logic_vector(5 downto 0);
signal BRESP_S12_const_net_0                       : std_logic_vector(1 downto 0);
signal RID_S12_const_net_0                         : std_logic_vector(5 downto 0);
signal RDATA_S12_const_net_0                       : std_logic_vector(63 downto 0);
signal RRESP_S12_const_net_0                       : std_logic_vector(1 downto 0);
signal BID_S13_const_net_0                         : std_logic_vector(5 downto 0);
signal BRESP_S13_const_net_0                       : std_logic_vector(1 downto 0);
signal RID_S13_const_net_0                         : std_logic_vector(5 downto 0);
signal RDATA_S13_const_net_0                       : std_logic_vector(63 downto 0);
signal RRESP_S13_const_net_0                       : std_logic_vector(1 downto 0);
signal BID_S14_const_net_0                         : std_logic_vector(5 downto 0);
signal BRESP_S14_const_net_0                       : std_logic_vector(1 downto 0);
signal RID_S14_const_net_0                         : std_logic_vector(5 downto 0);
signal RDATA_S14_const_net_0                       : std_logic_vector(63 downto 0);
signal RRESP_S14_const_net_0                       : std_logic_vector(1 downto 0);
signal BID_S15_const_net_0                         : std_logic_vector(5 downto 0);
signal BRESP_S15_const_net_0                       : std_logic_vector(1 downto 0);
signal RID_S15_const_net_0                         : std_logic_vector(5 downto 0);
signal RDATA_S15_const_net_0                       : std_logic_vector(63 downto 0);
signal RRESP_S15_const_net_0                       : std_logic_vector(1 downto 0);
signal AWCACHE_M0_const_net_0                      : std_logic_vector(3 downto 0);
signal AWPROT_M0_const_net_0                       : std_logic_vector(2 downto 0);
signal ARCACHE_M0_const_net_0                      : std_logic_vector(3 downto 0);
signal ARPROT_M0_const_net_0                       : std_logic_vector(2 downto 0);
signal AWID_M1_const_net_0                         : std_logic_vector(3 downto 0);
signal AWADDR_M1_const_net_0                       : std_logic_vector(31 downto 0);
signal AWLEN_M1_const_net_0                        : std_logic_vector(3 downto 0);
signal AWSIZE_M1_const_net_0                       : std_logic_vector(2 downto 0);
signal AWBURST_M1_const_net_0                      : std_logic_vector(1 downto 0);
signal AWLOCK_M1_const_net_0                       : std_logic_vector(1 downto 0);
signal AWCACHE_M1_const_net_0                      : std_logic_vector(3 downto 0);
signal AWPROT_M1_const_net_0                       : std_logic_vector(2 downto 0);
signal WDATA_M1_const_net_0                        : std_logic_vector(63 downto 0);
signal WID_M1_const_net_0                          : std_logic_vector(3 downto 0);
signal WSTRB_M1_const_net_0                        : std_logic_vector(7 downto 0);
signal ARID_M1_const_net_0                         : std_logic_vector(3 downto 0);
signal ARADDR_M1_const_net_0                       : std_logic_vector(31 downto 0);
signal ARLEN_M1_const_net_0                        : std_logic_vector(3 downto 0);
signal ARSIZE_M1_const_net_0                       : std_logic_vector(2 downto 0);
signal ARBURST_M1_const_net_0                      : std_logic_vector(1 downto 0);
signal ARLOCK_M1_const_net_0                       : std_logic_vector(1 downto 0);
signal ARCACHE_M1_const_net_0                      : std_logic_vector(3 downto 0);
signal ARPROT_M1_const_net_0                       : std_logic_vector(2 downto 0);
signal AWID_M2_const_net_0                         : std_logic_vector(3 downto 0);
signal AWADDR_M2_const_net_0                       : std_logic_vector(31 downto 0);
signal AWLEN_M2_const_net_0                        : std_logic_vector(3 downto 0);
signal AWSIZE_M2_const_net_0                       : std_logic_vector(2 downto 0);
signal AWBURST_M2_const_net_0                      : std_logic_vector(1 downto 0);
signal AWLOCK_M2_const_net_0                       : std_logic_vector(1 downto 0);
signal AWCACHE_M2_const_net_0                      : std_logic_vector(3 downto 0);
signal AWPROT_M2_const_net_0                       : std_logic_vector(2 downto 0);
signal WDATA_M2_const_net_0                        : std_logic_vector(63 downto 0);
signal WID_M2_const_net_0                          : std_logic_vector(3 downto 0);
signal WSTRB_M2_const_net_0                        : std_logic_vector(7 downto 0);
signal ARID_M2_const_net_0                         : std_logic_vector(3 downto 0);
signal ARADDR_M2_const_net_0                       : std_logic_vector(31 downto 0);
signal ARLEN_M2_const_net_0                        : std_logic_vector(3 downto 0);
signal ARSIZE_M2_const_net_0                       : std_logic_vector(2 downto 0);
signal ARBURST_M2_const_net_0                      : std_logic_vector(1 downto 0);
signal ARLOCK_M2_const_net_0                       : std_logic_vector(1 downto 0);
signal ARCACHE_M2_const_net_0                      : std_logic_vector(3 downto 0);
signal ARPROT_M2_const_net_0                       : std_logic_vector(2 downto 0);
signal AWID_M3_const_net_0                         : std_logic_vector(3 downto 0);
signal AWADDR_M3_const_net_0                       : std_logic_vector(31 downto 0);
signal AWLEN_M3_const_net_0                        : std_logic_vector(3 downto 0);
signal AWSIZE_M3_const_net_0                       : std_logic_vector(2 downto 0);
signal AWBURST_M3_const_net_0                      : std_logic_vector(1 downto 0);
signal AWLOCK_M3_const_net_0                       : std_logic_vector(1 downto 0);
signal AWCACHE_M3_const_net_0                      : std_logic_vector(3 downto 0);
signal AWPROT_M3_const_net_0                       : std_logic_vector(2 downto 0);
signal WDATA_M3_const_net_0                        : std_logic_vector(63 downto 0);
signal WID_M3_const_net_0                          : std_logic_vector(3 downto 0);
signal WSTRB_M3_const_net_0                        : std_logic_vector(7 downto 0);
signal ARID_M3_const_net_0                         : std_logic_vector(3 downto 0);
signal ARADDR_M3_const_net_0                       : std_logic_vector(31 downto 0);
signal ARLEN_M3_const_net_0                        : std_logic_vector(3 downto 0);
signal ARSIZE_M3_const_net_0                       : std_logic_vector(2 downto 0);
signal ARBURST_M3_const_net_0                      : std_logic_vector(1 downto 0);
signal ARLOCK_M3_const_net_0                       : std_logic_vector(1 downto 0);
signal ARCACHE_M3_const_net_0                      : std_logic_vector(3 downto 0);
signal ARPROT_M3_const_net_0                       : std_logic_vector(2 downto 0);
signal FIC_2_APB_M_PRDATA_const_net_0              : std_logic_vector(31 downto 0);
----------------------------------------------------------------------
-- Bus Interface Nets Declarations - Unequal Pin Widths
----------------------------------------------------------------------
signal COREAXI_0_AXImslave16_ARID_0_3to0           : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave16_ARID_0                : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave16_ARID                  : std_logic_vector(5 downto 0);

signal COREAXI_0_AXImslave16_AWID_0_3to0           : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave16_AWID_0                : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave16_AWID                  : std_logic_vector(5 downto 0);

signal COREAXI_0_AXImslave16_BID                   : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave16_BID_0_5to4            : std_logic_vector(5 downto 4);
signal COREAXI_0_AXImslave16_BID_0_3to0            : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave16_BID_0                 : std_logic_vector(5 downto 0);

signal COREAXI_0_AXImslave16_RID                   : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave16_RID_0_5to4            : std_logic_vector(5 downto 4);
signal COREAXI_0_AXImslave16_RID_0_3to0            : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave16_RID_0                 : std_logic_vector(5 downto 0);

signal COREAXI_0_AXImslave16_WID_0_3to0            : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave16_WID_0                 : std_logic_vector(3 downto 0);
signal COREAXI_0_AXImslave16_WID                   : std_logic_vector(5 downto 0);

signal top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HRESP_0_0to0: std_logic_vector(0 to 0);
signal top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HRESP_0: std_logic;
signal top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HRESP  : std_logic_vector(1 downto 0);

signal top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HSIZE_0_2to2: std_logic_vector(2 to 2);
signal top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HSIZE_0_1to0: std_logic_vector(1 downto 0);
signal top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HSIZE_0: std_logic_vector(2 downto 0);
signal top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HSIZE  : std_logic_vector(1 downto 0);


begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net                        <= '0';
 VCC_net                        <= '1';
 PADDR_const_net_0              <= B"000000";
 PWDATA_const_net_0             <= B"00000000";
 SDIF0_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 SDIF1_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 SDIF2_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 SDIF3_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 HPROT_M0_const_net_0           <= B"0000";
 HADDR_M1_const_net_0           <= B"00000000000000000000000000000000";
 HTRANS_M1_const_net_0          <= B"00";
 HSIZE_M1_const_net_0           <= B"000";
 HBURST_M1_const_net_0          <= B"000";
 HPROT_M1_const_net_0           <= B"0000";
 HWDATA_M1_const_net_0          <= B"00000000000000000000000000000000";
 HADDR_M2_const_net_0           <= B"00000000000000000000000000000000";
 HTRANS_M2_const_net_0          <= B"00";
 HSIZE_M2_const_net_0           <= B"000";
 HBURST_M2_const_net_0          <= B"000";
 HPROT_M2_const_net_0           <= B"0000";
 HWDATA_M2_const_net_0          <= B"00000000000000000000000000000000";
 HADDR_M3_const_net_0           <= B"00000000000000000000000000000000";
 HTRANS_M3_const_net_0          <= B"00";
 HSIZE_M3_const_net_0           <= B"000";
 HBURST_M3_const_net_0          <= B"000";
 HPROT_M3_const_net_0           <= B"0000";
 HWDATA_M3_const_net_0          <= B"00000000000000000000000000000000";
 HRDATA_S0_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S0_const_net_0           <= B"00";
 HRDATA_S1_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S1_const_net_0           <= B"00";
 HRDATA_S2_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S2_const_net_0           <= B"00";
 HRDATA_S3_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S3_const_net_0           <= B"00";
 HRDATA_S4_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S4_const_net_0           <= B"00";
 HRDATA_S5_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S5_const_net_0           <= B"00";
 HRDATA_S6_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S6_const_net_0           <= B"00";
 HRDATA_S7_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S7_const_net_0           <= B"00";
 HRDATA_S8_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S8_const_net_0           <= B"00";
 HRDATA_S9_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S9_const_net_0           <= B"00";
 HRDATA_S11_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S11_const_net_0          <= B"00";
 HRDATA_S12_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S12_const_net_0          <= B"00";
 HRDATA_S13_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S13_const_net_0          <= B"00";
 HRDATA_S14_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S14_const_net_0          <= B"00";
 HRDATA_S15_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S15_const_net_0          <= B"00";
 HRDATA_S16_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S16_const_net_0          <= B"00";
 BID_S0_const_net_0             <= B"000000";
 BRESP_S0_const_net_0           <= B"00";
 RID_S0_const_net_0             <= B"000000";
 RDATA_S0_const_net_0           <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S0_const_net_0           <= B"00";
 BID_S1_const_net_0             <= B"000000";
 BRESP_S1_const_net_0           <= B"00";
 RID_S1_const_net_0             <= B"000000";
 RDATA_S1_const_net_0           <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S1_const_net_0           <= B"00";
 BID_S2_const_net_0             <= B"000000";
 BRESP_S2_const_net_0           <= B"00";
 RID_S2_const_net_0             <= B"000000";
 RDATA_S2_const_net_0           <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S2_const_net_0           <= B"00";
 BID_S3_const_net_0             <= B"000000";
 BRESP_S3_const_net_0           <= B"00";
 RID_S3_const_net_0             <= B"000000";
 RDATA_S3_const_net_0           <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S3_const_net_0           <= B"00";
 BID_S4_const_net_0             <= B"000000";
 BRESP_S4_const_net_0           <= B"00";
 RID_S4_const_net_0             <= B"000000";
 RDATA_S4_const_net_0           <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S4_const_net_0           <= B"00";
 BID_S5_const_net_0             <= B"000000";
 BRESP_S5_const_net_0           <= B"00";
 RID_S5_const_net_0             <= B"000000";
 RDATA_S5_const_net_0           <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S5_const_net_0           <= B"00";
 BID_S6_const_net_0             <= B"000000";
 BRESP_S6_const_net_0           <= B"00";
 RID_S6_const_net_0             <= B"000000";
 RDATA_S6_const_net_0           <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S6_const_net_0           <= B"00";
 BID_S7_const_net_0             <= B"000000";
 BRESP_S7_const_net_0           <= B"00";
 RID_S7_const_net_0             <= B"000000";
 RDATA_S7_const_net_0           <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S7_const_net_0           <= B"00";
 BID_S8_const_net_0             <= B"000000";
 BRESP_S8_const_net_0           <= B"00";
 RID_S8_const_net_0             <= B"000000";
 RDATA_S8_const_net_0           <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S8_const_net_0           <= B"00";
 BID_S9_const_net_0             <= B"000000";
 BRESP_S9_const_net_0           <= B"00";
 RID_S9_const_net_0             <= B"000000";
 RDATA_S9_const_net_0           <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S9_const_net_0           <= B"00";
 BID_S10_const_net_0            <= B"000000";
 BRESP_S10_const_net_0          <= B"00";
 RID_S10_const_net_0            <= B"000000";
 RDATA_S10_const_net_0          <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S10_const_net_0          <= B"00";
 BID_S11_const_net_0            <= B"000000";
 BRESP_S11_const_net_0          <= B"00";
 RID_S11_const_net_0            <= B"000000";
 RDATA_S11_const_net_0          <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S11_const_net_0          <= B"00";
 BID_S12_const_net_0            <= B"000000";
 BRESP_S12_const_net_0          <= B"00";
 RID_S12_const_net_0            <= B"000000";
 RDATA_S12_const_net_0          <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S12_const_net_0          <= B"00";
 BID_S13_const_net_0            <= B"000000";
 BRESP_S13_const_net_0          <= B"00";
 RID_S13_const_net_0            <= B"000000";
 RDATA_S13_const_net_0          <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S13_const_net_0          <= B"00";
 BID_S14_const_net_0            <= B"000000";
 BRESP_S14_const_net_0          <= B"00";
 RID_S14_const_net_0            <= B"000000";
 RDATA_S14_const_net_0          <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S14_const_net_0          <= B"00";
 BID_S15_const_net_0            <= B"000000";
 BRESP_S15_const_net_0          <= B"00";
 RID_S15_const_net_0            <= B"000000";
 RDATA_S15_const_net_0          <= B"0000000000000000000000000000000000000000000000000000000000000000";
 RRESP_S15_const_net_0          <= B"00";
 AWCACHE_M0_const_net_0         <= B"0000";
 AWPROT_M0_const_net_0          <= B"000";
 ARCACHE_M0_const_net_0         <= B"0000";
 ARPROT_M0_const_net_0          <= B"000";
 AWID_M1_const_net_0            <= B"0000";
 AWADDR_M1_const_net_0          <= B"00000000000000000000000000000000";
 AWLEN_M1_const_net_0           <= B"0000";
 AWSIZE_M1_const_net_0          <= B"000";
 AWBURST_M1_const_net_0         <= B"00";
 AWLOCK_M1_const_net_0          <= B"00";
 AWCACHE_M1_const_net_0         <= B"0000";
 AWPROT_M1_const_net_0          <= B"000";
 WDATA_M1_const_net_0           <= B"0000000000000000000000000000000000000000000000000000000000000000";
 WID_M1_const_net_0             <= B"0000";
 WSTRB_M1_const_net_0           <= B"00000000";
 ARID_M1_const_net_0            <= B"0000";
 ARADDR_M1_const_net_0          <= B"00000000000000000000000000000000";
 ARLEN_M1_const_net_0           <= B"0000";
 ARSIZE_M1_const_net_0          <= B"000";
 ARBURST_M1_const_net_0         <= B"00";
 ARLOCK_M1_const_net_0          <= B"00";
 ARCACHE_M1_const_net_0         <= B"0000";
 ARPROT_M1_const_net_0          <= B"000";
 AWID_M2_const_net_0            <= B"0000";
 AWADDR_M2_const_net_0          <= B"00000000000000000000000000000000";
 AWLEN_M2_const_net_0           <= B"0000";
 AWSIZE_M2_const_net_0          <= B"000";
 AWBURST_M2_const_net_0         <= B"00";
 AWLOCK_M2_const_net_0          <= B"00";
 AWCACHE_M2_const_net_0         <= B"0000";
 AWPROT_M2_const_net_0          <= B"000";
 WDATA_M2_const_net_0           <= B"0000000000000000000000000000000000000000000000000000000000000000";
 WID_M2_const_net_0             <= B"0000";
 WSTRB_M2_const_net_0           <= B"00000000";
 ARID_M2_const_net_0            <= B"0000";
 ARADDR_M2_const_net_0          <= B"00000000000000000000000000000000";
 ARLEN_M2_const_net_0           <= B"0000";
 ARSIZE_M2_const_net_0          <= B"000";
 ARBURST_M2_const_net_0         <= B"00";
 ARLOCK_M2_const_net_0          <= B"00";
 ARCACHE_M2_const_net_0         <= B"0000";
 ARPROT_M2_const_net_0          <= B"000";
 AWID_M3_const_net_0            <= B"0000";
 AWADDR_M3_const_net_0          <= B"00000000000000000000000000000000";
 AWLEN_M3_const_net_0           <= B"0000";
 AWSIZE_M3_const_net_0          <= B"000";
 AWBURST_M3_const_net_0         <= B"00";
 AWLOCK_M3_const_net_0          <= B"00";
 AWCACHE_M3_const_net_0         <= B"0000";
 AWPROT_M3_const_net_0          <= B"000";
 WDATA_M3_const_net_0           <= B"0000000000000000000000000000000000000000000000000000000000000000";
 WID_M3_const_net_0             <= B"0000";
 WSTRB_M3_const_net_0           <= B"00000000";
 ARID_M3_const_net_0            <= B"0000";
 ARADDR_M3_const_net_0          <= B"00000000000000000000000000000000";
 ARLEN_M3_const_net_0           <= B"0000";
 ARSIZE_M3_const_net_0          <= B"000";
 ARBURST_M3_const_net_0         <= B"00";
 ARLOCK_M3_const_net_0          <= B"00";
 ARCACHE_M3_const_net_0         <= B"0000";
 ARPROT_M3_const_net_0          <= B"000";
 FIC_2_APB_M_PRDATA_const_net_0 <= B"00000000000000000000000000000000";
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 MMUART_0_TXD_net_1     <= MMUART_0_TXD_net_0;
 MMUART_0_TXD           <= MMUART_0_TXD_net_1;
 POWER_ON_RESET_N_net_1 <= POWER_ON_RESET_N_net_0;
 POWER_ON_RESET_N       <= POWER_ON_RESET_N_net_1;
 INIT_DONE_net_1        <= INIT_DONE_net_0;
 INIT_DONE              <= INIT_DONE_net_1;
 FAB_CCC_GL2_net_1      <= FAB_CCC_GL2_net_0;
 FAB_CCC_GL2            <= FAB_CCC_GL2_net_1;
 FAB_CCC_LOCK_net_1     <= FAB_CCC_LOCK_net_0;
 FAB_CCC_LOCK           <= FAB_CCC_LOCK_net_1;
 MSS_READY_net_1        <= MSS_READY_net_0;
 MSS_READY              <= MSS_READY_net_1;
 SDRCLK_net_1           <= SDRCLK_net_0;
 SDRCLK                 <= SDRCLK_net_1;
 OE_net_1               <= OE_net_0;
 OE                     <= OE_net_1;
 CKE_net_1              <= CKE_net_0;
 CKE                    <= CKE_net_1;
 RAS_N_net_1            <= RAS_N_net_0;
 RAS_N                  <= RAS_N_net_1;
 CAS_N_net_1            <= CAS_N_net_0;
 CAS_N                  <= CAS_N_net_1;
 WE_N_net_1             <= WE_N_net_0;
 WE_N                   <= WE_N_net_1;
 GPIO_8_OUT_net_1       <= GPIO_8_OUT_net_0;
 GPIO_8_OUT             <= GPIO_8_OUT_net_1;
 GPIO_9_OUT_net_1       <= GPIO_9_OUT_net_0;
 GPIO_9_OUT             <= GPIO_9_OUT_net_1;
 GPIO_10_OUT_net_1      <= GPIO_10_OUT_net_0;
 GPIO_10_OUT            <= GPIO_10_OUT_net_1;
 GPIO_11_OUT_net_1      <= GPIO_11_OUT_net_0;
 GPIO_11_OUT            <= GPIO_11_OUT_net_1;
 GPIO_12_OUT_net_1      <= GPIO_12_OUT_net_0;
 GPIO_12_OUT            <= GPIO_12_OUT_net_1;
 GPIO_13_OUT_net_1      <= GPIO_13_OUT_net_0;
 GPIO_13_OUT            <= GPIO_13_OUT_net_1;
 GPIO_14_OUT_net_1      <= GPIO_14_OUT_net_0;
 GPIO_14_OUT            <= GPIO_14_OUT_net_1;
 GPIO_15_OUT_net_1      <= GPIO_15_OUT_net_0;
 GPIO_15_OUT            <= GPIO_15_OUT_net_1;
 GPIO_16_OUT_net_1      <= GPIO_16_OUT_net_0;
 GPIO_16_OUT            <= GPIO_16_OUT_net_1;
 GPIO_25_OUT_net_1      <= GPIO_25_OUT_net_0;
 GPIO_25_OUT            <= GPIO_25_OUT_net_1;
 SA_net_1               <= SA_net_0;
 SA(13 downto 0)        <= SA_net_1;
 BA_net_1               <= BA_net_0;
 BA(1 downto 0)         <= BA_net_1;
 CS_N_net_1(0)          <= CS_N_net_0(0);
 CS_N(0)                <= CS_N_net_1(0);
 DQM_net_1              <= DQM_net_0;
 DQM(1 downto 0)        <= DQM_net_1;
----------------------------------------------------------------------
-- Bus Interface Nets Assignments - Unequal Pin Widths
----------------------------------------------------------------------
 COREAXI_0_AXImslave16_ARID_0_3to0(3 downto 0) <= COREAXI_0_AXImslave16_ARID(3 downto 0);
 COREAXI_0_AXImslave16_ARID_0 <= ( COREAXI_0_AXImslave16_ARID_0_3to0(3 downto 0) );

 COREAXI_0_AXImslave16_AWID_0_3to0(3 downto 0) <= COREAXI_0_AXImslave16_AWID(3 downto 0);
 COREAXI_0_AXImslave16_AWID_0 <= ( COREAXI_0_AXImslave16_AWID_0_3to0(3 downto 0) );

 COREAXI_0_AXImslave16_BID_0_5to4(5 downto 4) <= B"00";
 COREAXI_0_AXImslave16_BID_0_3to0(3 downto 0) <= COREAXI_0_AXImslave16_BID(3 downto 0);
 COREAXI_0_AXImslave16_BID_0 <= ( COREAXI_0_AXImslave16_BID_0_5to4(5 downto 4) & COREAXI_0_AXImslave16_BID_0_3to0(3 downto 0) );

 COREAXI_0_AXImslave16_RID_0_5to4(5 downto 4) <= B"00";
 COREAXI_0_AXImslave16_RID_0_3to0(3 downto 0) <= COREAXI_0_AXImslave16_RID(3 downto 0);
 COREAXI_0_AXImslave16_RID_0 <= ( COREAXI_0_AXImslave16_RID_0_5to4(5 downto 4) & COREAXI_0_AXImslave16_RID_0_3to0(3 downto 0) );

 COREAXI_0_AXImslave16_WID_0_3to0(3 downto 0) <= COREAXI_0_AXImslave16_WID(3 downto 0);
 COREAXI_0_AXImslave16_WID_0 <= ( COREAXI_0_AXImslave16_WID_0_3to0(3 downto 0) );

 top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HRESP_0_0to0(0) <= top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HRESP(0);
 top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HRESP_0 <= ( top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HRESP_0_0to0(0) );

 top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HSIZE_0_2to2(2) <= '0';
 top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HSIZE_0_1to0(1 downto 0) <= top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HSIZE(1 downto 0);
 top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HSIZE_0 <= ( top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HSIZE_0_2to2(2) & top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HSIZE_0_1to0(1 downto 0) );

----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- CCC_0   -   Actel:SgCore:FCCC:2.0.201
CCC_0 : top_sb_CCC_0_FCCC
    port map( 
        -- Inputs
        CLK1_PAD => CLK1_PAD,
        -- Outputs
        GL2      => FAB_CCC_GL2_net_0,
        LOCK     => FAB_CCC_LOCK_net_0 
        );
-- CoreAHBLite_0   -   Actel:DirectCore:CoreAHBLite:5.2.100
CoreAHBLite_0 : entity COREAHBLITE_LIB.CoreAHBLite
    generic map( 
        FAMILY             => ( 19 ),
        HADDR_SHG_CFG      => ( 1 ),
        M0_AHBSLOT0ENABLE  => ( 0 ),
        M0_AHBSLOT1ENABLE  => ( 0 ),
        M0_AHBSLOT2ENABLE  => ( 0 ),
        M0_AHBSLOT3ENABLE  => ( 0 ),
        M0_AHBSLOT4ENABLE  => ( 0 ),
        M0_AHBSLOT5ENABLE  => ( 0 ),
        M0_AHBSLOT6ENABLE  => ( 0 ),
        M0_AHBSLOT7ENABLE  => ( 0 ),
        M0_AHBSLOT8ENABLE  => ( 0 ),
        M0_AHBSLOT9ENABLE  => ( 0 ),
        M0_AHBSLOT10ENABLE => ( 1 ),
        M0_AHBSLOT11ENABLE => ( 0 ),
        M0_AHBSLOT12ENABLE => ( 0 ),
        M0_AHBSLOT13ENABLE => ( 0 ),
        M0_AHBSLOT14ENABLE => ( 0 ),
        M0_AHBSLOT15ENABLE => ( 0 ),
        M0_AHBSLOT16ENABLE => ( 0 ),
        M1_AHBSLOT0ENABLE  => ( 0 ),
        M1_AHBSLOT1ENABLE  => ( 0 ),
        M1_AHBSLOT2ENABLE  => ( 0 ),
        M1_AHBSLOT3ENABLE  => ( 0 ),
        M1_AHBSLOT4ENABLE  => ( 0 ),
        M1_AHBSLOT5ENABLE  => ( 0 ),
        M1_AHBSLOT6ENABLE  => ( 0 ),
        M1_AHBSLOT7ENABLE  => ( 0 ),
        M1_AHBSLOT8ENABLE  => ( 0 ),
        M1_AHBSLOT9ENABLE  => ( 0 ),
        M1_AHBSLOT10ENABLE => ( 0 ),
        M1_AHBSLOT11ENABLE => ( 0 ),
        M1_AHBSLOT12ENABLE => ( 0 ),
        M1_AHBSLOT13ENABLE => ( 0 ),
        M1_AHBSLOT14ENABLE => ( 0 ),
        M1_AHBSLOT15ENABLE => ( 0 ),
        M1_AHBSLOT16ENABLE => ( 0 ),
        M2_AHBSLOT0ENABLE  => ( 0 ),
        M2_AHBSLOT1ENABLE  => ( 0 ),
        M2_AHBSLOT2ENABLE  => ( 0 ),
        M2_AHBSLOT3ENABLE  => ( 0 ),
        M2_AHBSLOT4ENABLE  => ( 0 ),
        M2_AHBSLOT5ENABLE  => ( 0 ),
        M2_AHBSLOT6ENABLE  => ( 0 ),
        M2_AHBSLOT7ENABLE  => ( 0 ),
        M2_AHBSLOT8ENABLE  => ( 0 ),
        M2_AHBSLOT9ENABLE  => ( 0 ),
        M2_AHBSLOT10ENABLE => ( 0 ),
        M2_AHBSLOT11ENABLE => ( 0 ),
        M2_AHBSLOT12ENABLE => ( 0 ),
        M2_AHBSLOT13ENABLE => ( 0 ),
        M2_AHBSLOT14ENABLE => ( 0 ),
        M2_AHBSLOT15ENABLE => ( 0 ),
        M2_AHBSLOT16ENABLE => ( 0 ),
        M3_AHBSLOT0ENABLE  => ( 0 ),
        M3_AHBSLOT1ENABLE  => ( 0 ),
        M3_AHBSLOT2ENABLE  => ( 0 ),
        M3_AHBSLOT3ENABLE  => ( 0 ),
        M3_AHBSLOT4ENABLE  => ( 0 ),
        M3_AHBSLOT5ENABLE  => ( 0 ),
        M3_AHBSLOT6ENABLE  => ( 0 ),
        M3_AHBSLOT7ENABLE  => ( 0 ),
        M3_AHBSLOT8ENABLE  => ( 0 ),
        M3_AHBSLOT9ENABLE  => ( 0 ),
        M3_AHBSLOT10ENABLE => ( 0 ),
        M3_AHBSLOT11ENABLE => ( 0 ),
        M3_AHBSLOT12ENABLE => ( 0 ),
        M3_AHBSLOT13ENABLE => ( 0 ),
        M3_AHBSLOT14ENABLE => ( 0 ),
        M3_AHBSLOT15ENABLE => ( 0 ),
        M3_AHBSLOT16ENABLE => ( 0 ),
        MEMSPACE           => ( 1 ),
        SC_0               => ( 0 ),
        SC_1               => ( 0 ),
        SC_2               => ( 0 ),
        SC_3               => ( 0 ),
        SC_4               => ( 0 ),
        SC_5               => ( 0 ),
        SC_6               => ( 0 ),
        SC_7               => ( 0 ),
        SC_8               => ( 0 ),
        SC_9               => ( 0 ),
        SC_10              => ( 0 ),
        SC_11              => ( 0 ),
        SC_12              => ( 0 ),
        SC_13              => ( 0 ),
        SC_14              => ( 0 ),
        SC_15              => ( 0 )
        )
    port map( 
        -- Inputs
        HCLK          => FAB_CCC_GL2_net_0,
        HRESETN       => MSS_READY_net_0,
        REMAP_M0      => GND_net,
        HMASTLOCK_M0  => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HLOCK,
        HWRITE_M0     => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HWRITE,
        HMASTLOCK_M1  => GND_net, -- tied to '0' from definition
        HWRITE_M1     => GND_net, -- tied to '0' from definition
        HMASTLOCK_M2  => GND_net, -- tied to '0' from definition
        HWRITE_M2     => GND_net, -- tied to '0' from definition
        HMASTLOCK_M3  => GND_net, -- tied to '0' from definition
        HWRITE_M3     => GND_net, -- tied to '0' from definition
        HREADYOUT_S0  => VCC_net, -- tied to '1' from definition
        HREADYOUT_S1  => VCC_net, -- tied to '1' from definition
        HREADYOUT_S2  => VCC_net, -- tied to '1' from definition
        HREADYOUT_S3  => VCC_net, -- tied to '1' from definition
        HREADYOUT_S4  => VCC_net, -- tied to '1' from definition
        HREADYOUT_S5  => VCC_net, -- tied to '1' from definition
        HREADYOUT_S6  => VCC_net, -- tied to '1' from definition
        HREADYOUT_S7  => VCC_net, -- tied to '1' from definition
        HREADYOUT_S8  => VCC_net, -- tied to '1' from definition
        HREADYOUT_S9  => VCC_net, -- tied to '1' from definition
        HREADYOUT_S10 => CoreAHBLite_0_AHBmslave10_HREADYOUT,
        HREADYOUT_S11 => VCC_net, -- tied to '1' from definition
        HREADYOUT_S12 => VCC_net, -- tied to '1' from definition
        HREADYOUT_S13 => VCC_net, -- tied to '1' from definition
        HREADYOUT_S14 => VCC_net, -- tied to '1' from definition
        HREADYOUT_S15 => VCC_net, -- tied to '1' from definition
        HREADYOUT_S16 => VCC_net, -- tied to '1' from definition
        HADDR_M0      => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HADDR,
        HSIZE_M0      => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HSIZE_0,
        HTRANS_M0     => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HTRANS,
        HWDATA_M0     => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HWDATA,
        HBURST_M0     => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HBURST,
        HPROT_M0      => HPROT_M0_const_net_0, -- tied to X"0" from definition
        HADDR_M1      => HADDR_M1_const_net_0, -- tied to X"0" from definition
        HSIZE_M1      => HSIZE_M1_const_net_0, -- tied to X"0" from definition
        HTRANS_M1     => HTRANS_M1_const_net_0, -- tied to X"0" from definition
        HWDATA_M1     => HWDATA_M1_const_net_0, -- tied to X"0" from definition
        HBURST_M1     => HBURST_M1_const_net_0, -- tied to X"0" from definition
        HPROT_M1      => HPROT_M1_const_net_0, -- tied to X"0" from definition
        HADDR_M2      => HADDR_M2_const_net_0, -- tied to X"0" from definition
        HSIZE_M2      => HSIZE_M2_const_net_0, -- tied to X"0" from definition
        HTRANS_M2     => HTRANS_M2_const_net_0, -- tied to X"0" from definition
        HWDATA_M2     => HWDATA_M2_const_net_0, -- tied to X"0" from definition
        HBURST_M2     => HBURST_M2_const_net_0, -- tied to X"0" from definition
        HPROT_M2      => HPROT_M2_const_net_0, -- tied to X"0" from definition
        HADDR_M3      => HADDR_M3_const_net_0, -- tied to X"0" from definition
        HSIZE_M3      => HSIZE_M3_const_net_0, -- tied to X"0" from definition
        HTRANS_M3     => HTRANS_M3_const_net_0, -- tied to X"0" from definition
        HWDATA_M3     => HWDATA_M3_const_net_0, -- tied to X"0" from definition
        HBURST_M3     => HBURST_M3_const_net_0, -- tied to X"0" from definition
        HPROT_M3      => HPROT_M3_const_net_0, -- tied to X"0" from definition
        HRDATA_S0     => HRDATA_S0_const_net_0, -- tied to X"0" from definition
        HRESP_S0      => HRESP_S0_const_net_0, -- tied to X"0" from definition
        HRDATA_S1     => HRDATA_S1_const_net_0, -- tied to X"0" from definition
        HRESP_S1      => HRESP_S1_const_net_0, -- tied to X"0" from definition
        HRDATA_S2     => HRDATA_S2_const_net_0, -- tied to X"0" from definition
        HRESP_S2      => HRESP_S2_const_net_0, -- tied to X"0" from definition
        HRDATA_S3     => HRDATA_S3_const_net_0, -- tied to X"0" from definition
        HRESP_S3      => HRESP_S3_const_net_0, -- tied to X"0" from definition
        HRDATA_S4     => HRDATA_S4_const_net_0, -- tied to X"0" from definition
        HRESP_S4      => HRESP_S4_const_net_0, -- tied to X"0" from definition
        HRDATA_S5     => HRDATA_S5_const_net_0, -- tied to X"0" from definition
        HRESP_S5      => HRESP_S5_const_net_0, -- tied to X"0" from definition
        HRDATA_S6     => HRDATA_S6_const_net_0, -- tied to X"0" from definition
        HRESP_S6      => HRESP_S6_const_net_0, -- tied to X"0" from definition
        HRDATA_S7     => HRDATA_S7_const_net_0, -- tied to X"0" from definition
        HRESP_S7      => HRESP_S7_const_net_0, -- tied to X"0" from definition
        HRDATA_S8     => HRDATA_S8_const_net_0, -- tied to X"0" from definition
        HRESP_S8      => HRESP_S8_const_net_0, -- tied to X"0" from definition
        HRDATA_S9     => HRDATA_S9_const_net_0, -- tied to X"0" from definition
        HRESP_S9      => HRESP_S9_const_net_0, -- tied to X"0" from definition
        HRDATA_S10    => CoreAHBLite_0_AHBmslave10_HRDATA,
        HRESP_S10     => CoreAHBLite_0_AHBmslave10_HRESP,
        HRDATA_S11    => HRDATA_S11_const_net_0, -- tied to X"0" from definition
        HRESP_S11     => HRESP_S11_const_net_0, -- tied to X"0" from definition
        HRDATA_S12    => HRDATA_S12_const_net_0, -- tied to X"0" from definition
        HRESP_S12     => HRESP_S12_const_net_0, -- tied to X"0" from definition
        HRDATA_S13    => HRDATA_S13_const_net_0, -- tied to X"0" from definition
        HRESP_S13     => HRESP_S13_const_net_0, -- tied to X"0" from definition
        HRDATA_S14    => HRDATA_S14_const_net_0, -- tied to X"0" from definition
        HRESP_S14     => HRESP_S14_const_net_0, -- tied to X"0" from definition
        HRDATA_S15    => HRDATA_S15_const_net_0, -- tied to X"0" from definition
        HRESP_S15     => HRESP_S15_const_net_0, -- tied to X"0" from definition
        HRDATA_S16    => HRDATA_S16_const_net_0, -- tied to X"0" from definition
        HRESP_S16     => HRESP_S16_const_net_0, -- tied to X"0" from definition
        -- Outputs
        HREADY_M0     => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HREADY,
        HREADY_M1     => OPEN,
        HREADY_M2     => OPEN,
        HREADY_M3     => OPEN,
        HSEL_S0       => OPEN,
        HWRITE_S0     => OPEN,
        HREADY_S0     => OPEN,
        HMASTLOCK_S0  => OPEN,
        HSEL_S1       => OPEN,
        HWRITE_S1     => OPEN,
        HREADY_S1     => OPEN,
        HMASTLOCK_S1  => OPEN,
        HSEL_S2       => OPEN,
        HWRITE_S2     => OPEN,
        HREADY_S2     => OPEN,
        HMASTLOCK_S2  => OPEN,
        HSEL_S3       => OPEN,
        HWRITE_S3     => OPEN,
        HREADY_S3     => OPEN,
        HMASTLOCK_S3  => OPEN,
        HSEL_S4       => OPEN,
        HWRITE_S4     => OPEN,
        HREADY_S4     => OPEN,
        HMASTLOCK_S4  => OPEN,
        HSEL_S5       => OPEN,
        HWRITE_S5     => OPEN,
        HREADY_S5     => OPEN,
        HMASTLOCK_S5  => OPEN,
        HSEL_S6       => OPEN,
        HWRITE_S6     => OPEN,
        HREADY_S6     => OPEN,
        HMASTLOCK_S6  => OPEN,
        HSEL_S7       => OPEN,
        HWRITE_S7     => OPEN,
        HREADY_S7     => OPEN,
        HMASTLOCK_S7  => OPEN,
        HSEL_S8       => OPEN,
        HWRITE_S8     => OPEN,
        HREADY_S8     => OPEN,
        HMASTLOCK_S8  => OPEN,
        HSEL_S9       => OPEN,
        HWRITE_S9     => OPEN,
        HREADY_S9     => OPEN,
        HMASTLOCK_S9  => OPEN,
        HSEL_S10      => CoreAHBLite_0_AHBmslave10_HSELx,
        HWRITE_S10    => CoreAHBLite_0_AHBmslave10_HWRITE,
        HREADY_S10    => CoreAHBLite_0_AHBmslave10_HREADY,
        HMASTLOCK_S10 => CoreAHBLite_0_AHBmslave10_HMASTLOCK,
        HSEL_S11      => OPEN,
        HWRITE_S11    => OPEN,
        HREADY_S11    => OPEN,
        HMASTLOCK_S11 => OPEN,
        HSEL_S12      => OPEN,
        HWRITE_S12    => OPEN,
        HREADY_S12    => OPEN,
        HMASTLOCK_S12 => OPEN,
        HSEL_S13      => OPEN,
        HWRITE_S13    => OPEN,
        HREADY_S13    => OPEN,
        HMASTLOCK_S13 => OPEN,
        HSEL_S14      => OPEN,
        HWRITE_S14    => OPEN,
        HREADY_S14    => OPEN,
        HMASTLOCK_S14 => OPEN,
        HSEL_S15      => OPEN,
        HWRITE_S15    => OPEN,
        HREADY_S15    => OPEN,
        HMASTLOCK_S15 => OPEN,
        HSEL_S16      => OPEN,
        HWRITE_S16    => OPEN,
        HREADY_S16    => OPEN,
        HMASTLOCK_S16 => OPEN,
        HRESP_M0      => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HRESP,
        HRDATA_M0     => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HRDATA,
        HRESP_M1      => OPEN,
        HRDATA_M1     => OPEN,
        HRESP_M2      => OPEN,
        HRDATA_M2     => OPEN,
        HRESP_M3      => OPEN,
        HRDATA_M3     => OPEN,
        HADDR_S0      => OPEN,
        HSIZE_S0      => OPEN,
        HTRANS_S0     => OPEN,
        HWDATA_S0     => OPEN,
        HBURST_S0     => OPEN,
        HPROT_S0      => OPEN,
        HADDR_S1      => OPEN,
        HSIZE_S1      => OPEN,
        HTRANS_S1     => OPEN,
        HWDATA_S1     => OPEN,
        HBURST_S1     => OPEN,
        HPROT_S1      => OPEN,
        HADDR_S2      => OPEN,
        HSIZE_S2      => OPEN,
        HTRANS_S2     => OPEN,
        HWDATA_S2     => OPEN,
        HBURST_S2     => OPEN,
        HPROT_S2      => OPEN,
        HADDR_S3      => OPEN,
        HSIZE_S3      => OPEN,
        HTRANS_S3     => OPEN,
        HWDATA_S3     => OPEN,
        HBURST_S3     => OPEN,
        HPROT_S3      => OPEN,
        HADDR_S4      => OPEN,
        HSIZE_S4      => OPEN,
        HTRANS_S4     => OPEN,
        HWDATA_S4     => OPEN,
        HBURST_S4     => OPEN,
        HPROT_S4      => OPEN,
        HADDR_S5      => OPEN,
        HSIZE_S5      => OPEN,
        HTRANS_S5     => OPEN,
        HWDATA_S5     => OPEN,
        HBURST_S5     => OPEN,
        HPROT_S5      => OPEN,
        HADDR_S6      => OPEN,
        HSIZE_S6      => OPEN,
        HTRANS_S6     => OPEN,
        HWDATA_S6     => OPEN,
        HBURST_S6     => OPEN,
        HPROT_S6      => OPEN,
        HADDR_S7      => OPEN,
        HSIZE_S7      => OPEN,
        HTRANS_S7     => OPEN,
        HWDATA_S7     => OPEN,
        HBURST_S7     => OPEN,
        HPROT_S7      => OPEN,
        HADDR_S8      => OPEN,
        HSIZE_S8      => OPEN,
        HTRANS_S8     => OPEN,
        HWDATA_S8     => OPEN,
        HBURST_S8     => OPEN,
        HPROT_S8      => OPEN,
        HADDR_S9      => OPEN,
        HSIZE_S9      => OPEN,
        HTRANS_S9     => OPEN,
        HWDATA_S9     => OPEN,
        HBURST_S9     => OPEN,
        HPROT_S9      => OPEN,
        HADDR_S10     => CoreAHBLite_0_AHBmslave10_HADDR,
        HSIZE_S10     => CoreAHBLite_0_AHBmslave10_HSIZE,
        HTRANS_S10    => CoreAHBLite_0_AHBmslave10_HTRANS,
        HWDATA_S10    => CoreAHBLite_0_AHBmslave10_HWDATA,
        HBURST_S10    => CoreAHBLite_0_AHBmslave10_HBURST,
        HPROT_S10     => CoreAHBLite_0_AHBmslave10_HPROT,
        HADDR_S11     => OPEN,
        HSIZE_S11     => OPEN,
        HTRANS_S11    => OPEN,
        HWDATA_S11    => OPEN,
        HBURST_S11    => OPEN,
        HPROT_S11     => OPEN,
        HADDR_S12     => OPEN,
        HSIZE_S12     => OPEN,
        HTRANS_S12    => OPEN,
        HWDATA_S12    => OPEN,
        HBURST_S12    => OPEN,
        HPROT_S12     => OPEN,
        HADDR_S13     => OPEN,
        HSIZE_S13     => OPEN,
        HTRANS_S13    => OPEN,
        HWDATA_S13    => OPEN,
        HBURST_S13    => OPEN,
        HPROT_S13     => OPEN,
        HADDR_S14     => OPEN,
        HSIZE_S14     => OPEN,
        HTRANS_S14    => OPEN,
        HWDATA_S14    => OPEN,
        HBURST_S14    => OPEN,
        HPROT_S14     => OPEN,
        HADDR_S15     => OPEN,
        HSIZE_S15     => OPEN,
        HTRANS_S15    => OPEN,
        HWDATA_S15    => OPEN,
        HBURST_S15    => OPEN,
        HPROT_S15     => OPEN,
        HADDR_S16     => OPEN,
        HSIZE_S16     => OPEN,
        HTRANS_S16    => OPEN,
        HWDATA_S16    => OPEN,
        HBURST_S16    => OPEN,
        HPROT_S16     => OPEN 
        );
-- COREAHBLTOAXI_0   -   Actel:DirectCore:COREAHBLTOAXI:2.1.101
COREAHBLTOAXI_0 : top_sb_COREAHBLTOAXI_0_COREAHBLTOAXI
    generic map( 
        AHB_AWIDTH   => ( 32 ),
        AHB_DWIDTH   => ( 32 ),
        AXI_AWIDTH   => ( 32 ),
        AXI_DWIDTH   => ( 64 ),
        CLOCKS_ASYNC => ( 0 ),
        FAMILY       => ( 19 ),
        UNDEF_BURST  => ( 0 )
        )
    port map( 
        -- Inputs
        HCLK      => FAB_CCC_GL2_net_0,
        HRESETn   => MSS_READY_net_0,
        HSEL      => CoreAHBLite_0_AHBmslave10_HSELx,
        HWRITE    => CoreAHBLite_0_AHBmslave10_HWRITE,
        HREADY    => CoreAHBLite_0_AHBmslave10_HREADY,
        HMASTLOCK => CoreAHBLite_0_AHBmslave10_HMASTLOCK,
        ACLK      => FAB_CCC_GL2_net_0,
        ARESETn   => MSS_READY_net_0,
        AWREADY   => COREAHBLTOAXI_0_AXIMasterIF_AWREADY,
        WREADY    => COREAHBLTOAXI_0_AXIMasterIF_WREADY,
        BVALID    => COREAHBLTOAXI_0_AXIMasterIF_BVALID,
        ARREADY   => COREAHBLTOAXI_0_AXIMasterIF_ARREADY,
        RLAST     => COREAHBLTOAXI_0_AXIMasterIF_RLAST,
        RVALID    => COREAHBLTOAXI_0_AXIMasterIF_RVALID,
        HADDR     => CoreAHBLite_0_AHBmslave10_HADDR,
        HTRANS    => CoreAHBLite_0_AHBmslave10_HTRANS,
        HSIZE     => CoreAHBLite_0_AHBmslave10_HSIZE,
        HWDATA    => CoreAHBLite_0_AHBmslave10_HWDATA,
        HBURST    => CoreAHBLite_0_AHBmslave10_HBURST,
        BID       => COREAHBLTOAXI_0_AXIMasterIF_BID,
        BRESP     => COREAHBLTOAXI_0_AXIMasterIF_BRESP,
        RID       => COREAHBLTOAXI_0_AXIMasterIF_RID,
        RDATA     => COREAHBLTOAXI_0_AXIMasterIF_RDATA,
        RRESP     => COREAHBLTOAXI_0_AXIMasterIF_RRESP,
        -- Outputs
        HREADYOUT => CoreAHBLite_0_AHBmslave10_HREADYOUT,
        AWVALID   => COREAHBLTOAXI_0_AXIMasterIF_AWVALID,
        WLAST     => COREAHBLTOAXI_0_AXIMasterIF_WLAST,
        WVALID    => COREAHBLTOAXI_0_AXIMasterIF_WVALID,
        BREADY    => COREAHBLTOAXI_0_AXIMasterIF_BREADY,
        ARVALID   => COREAHBLTOAXI_0_AXIMasterIF_ARVALID,
        RREADY    => COREAHBLTOAXI_0_AXIMasterIF_RREADY,
        HRESP     => CoreAHBLite_0_AHBmslave10_HRESP,
        HRDATA    => CoreAHBLite_0_AHBmslave10_HRDATA,
        AWID      => COREAHBLTOAXI_0_AXIMasterIF_AWID,
        AWADDR    => COREAHBLTOAXI_0_AXIMasterIF_AWADDR,
        AWLEN     => COREAHBLTOAXI_0_AXIMasterIF_AWLEN,
        AWSIZE    => COREAHBLTOAXI_0_AXIMasterIF_AWSIZE,
        AWBURST   => COREAHBLTOAXI_0_AXIMasterIF_AWBURST,
        AWLOCK    => COREAHBLTOAXI_0_AXIMasterIF_AWLOCK,
        WID       => COREAHBLTOAXI_0_AXIMasterIF_WID,
        WDATA     => COREAHBLTOAXI_0_AXIMasterIF_WDATA,
        ARID      => COREAHBLTOAXI_0_AXIMasterIF_ARID,
        ARADDR    => COREAHBLTOAXI_0_AXIMasterIF_ARADDR,
        ARLEN     => COREAHBLTOAXI_0_AXIMasterIF_ARLEN,
        ARSIZE    => COREAHBLTOAXI_0_AXIMasterIF_ARSIZE,
        ARBURST   => COREAHBLTOAXI_0_AXIMasterIF_ARBURST,
        ARLOCK    => COREAHBLTOAXI_0_AXIMasterIF_ARLOCK,
        WSTRB     => COREAHBLTOAXI_0_AXIMasterIF_WSTRB 
        );
-- COREAXI_0   -   Actel:DirectCore:COREAXI:3.1.100
COREAXI_0 : top_sb_COREAXI_0_COREAXI
    generic map( 
        ADDR_HGS_CFG     => ( 1 ),
        AXI_DWIDTH       => ( 64 ),
        FAMILY           => ( 19 ),
        FEED_THROUGH     => ( 0 ),
        HGS_CFG          => ( 1 ),
        ID_WIDTH         => ( 4 ),
        INP_REG_BUF      => ( 1 ),
        M0_SLAVE0ENABLE  => ( 0 ),
        M0_SLAVE1ENABLE  => ( 0 ),
        M0_SLAVE2ENABLE  => ( 0 ),
        M0_SLAVE3ENABLE  => ( 0 ),
        M0_SLAVE4ENABLE  => ( 0 ),
        M0_SLAVE5ENABLE  => ( 0 ),
        M0_SLAVE6ENABLE  => ( 0 ),
        M0_SLAVE7ENABLE  => ( 0 ),
        M0_SLAVE8ENABLE  => ( 0 ),
        M0_SLAVE9ENABLE  => ( 0 ),
        M0_SLAVE10ENABLE => ( 0 ),
        M0_SLAVE11ENABLE => ( 0 ),
        M0_SLAVE12ENABLE => ( 0 ),
        M0_SLAVE13ENABLE => ( 0 ),
        M0_SLAVE14ENABLE => ( 0 ),
        M0_SLAVE15ENABLE => ( 0 ),
        M0_SLAVE16ENABLE => ( 1 ),
        M1_SLAVE0ENABLE  => ( 0 ),
        M1_SLAVE1ENABLE  => ( 0 ),
        M1_SLAVE2ENABLE  => ( 0 ),
        M1_SLAVE3ENABLE  => ( 0 ),
        M1_SLAVE4ENABLE  => ( 0 ),
        M1_SLAVE5ENABLE  => ( 0 ),
        M1_SLAVE6ENABLE  => ( 0 ),
        M1_SLAVE7ENABLE  => ( 0 ),
        M1_SLAVE8ENABLE  => ( 0 ),
        M1_SLAVE9ENABLE  => ( 0 ),
        M1_SLAVE10ENABLE => ( 0 ),
        M1_SLAVE11ENABLE => ( 0 ),
        M1_SLAVE12ENABLE => ( 0 ),
        M1_SLAVE13ENABLE => ( 0 ),
        M1_SLAVE14ENABLE => ( 0 ),
        M1_SLAVE15ENABLE => ( 0 ),
        M1_SLAVE16ENABLE => ( 0 ),
        M2_SLAVE0ENABLE  => ( 0 ),
        M2_SLAVE1ENABLE  => ( 0 ),
        M2_SLAVE2ENABLE  => ( 0 ),
        M2_SLAVE3ENABLE  => ( 0 ),
        M2_SLAVE4ENABLE  => ( 0 ),
        M2_SLAVE5ENABLE  => ( 0 ),
        M2_SLAVE6ENABLE  => ( 0 ),
        M2_SLAVE7ENABLE  => ( 0 ),
        M2_SLAVE8ENABLE  => ( 0 ),
        M2_SLAVE9ENABLE  => ( 0 ),
        M2_SLAVE10ENABLE => ( 0 ),
        M2_SLAVE11ENABLE => ( 0 ),
        M2_SLAVE12ENABLE => ( 0 ),
        M2_SLAVE13ENABLE => ( 0 ),
        M2_SLAVE14ENABLE => ( 0 ),
        M2_SLAVE15ENABLE => ( 0 ),
        M2_SLAVE16ENABLE => ( 0 ),
        M3_SLAVE0ENABLE  => ( 0 ),
        M3_SLAVE1ENABLE  => ( 0 ),
        M3_SLAVE2ENABLE  => ( 0 ),
        M3_SLAVE3ENABLE  => ( 0 ),
        M3_SLAVE4ENABLE  => ( 0 ),
        M3_SLAVE5ENABLE  => ( 0 ),
        M3_SLAVE6ENABLE  => ( 0 ),
        M3_SLAVE7ENABLE  => ( 0 ),
        M3_SLAVE8ENABLE  => ( 0 ),
        M3_SLAVE9ENABLE  => ( 0 ),
        M3_SLAVE10ENABLE => ( 0 ),
        M3_SLAVE11ENABLE => ( 0 ),
        M3_SLAVE12ENABLE => ( 0 ),
        M3_SLAVE13ENABLE => ( 0 ),
        M3_SLAVE14ENABLE => ( 0 ),
        M3_SLAVE15ENABLE => ( 0 ),
        M3_SLAVE16ENABLE => ( 0 ),
        MEMSPACE         => ( 2 ),
        NUM_MASTER_SLOT  => ( 1 ),
        OUT_REG_BUF      => ( 1 ),
        RD_ACCEPTANCE    => ( 4 ),
        SC_0             => ( 1 ),
        SC_1             => ( 1 ),
        SC_2             => ( 1 ),
        SC_3             => ( 1 ),
        SC_4             => ( 1 ),
        SC_5             => ( 1 ),
        SC_6             => ( 1 ),
        SC_7             => ( 1 ),
        SC_8             => ( 1 ),
        SC_9             => ( 1 ),
        SC_10            => ( 1 ),
        SC_11            => ( 1 ),
        SC_12            => ( 0 ),
        SC_13            => ( 0 ),
        SC_14            => ( 0 ),
        SC_15            => ( 0 )
        )
    port map( 
        -- Inputs
        ACLK        => FAB_CCC_GL2_net_0,
        ARESETN     => MSS_READY_net_0,
        AWVALID_M0  => COREAHBLTOAXI_0_AXIMasterIF_AWVALID,
        WLAST_M0    => COREAHBLTOAXI_0_AXIMasterIF_WLAST,
        WVALID_M0   => COREAHBLTOAXI_0_AXIMasterIF_WVALID,
        BREADY_M0   => COREAHBLTOAXI_0_AXIMasterIF_BREADY,
        ARVALID_M0  => COREAHBLTOAXI_0_AXIMasterIF_ARVALID,
        RREADY_M0   => COREAHBLTOAXI_0_AXIMasterIF_RREADY,
        AWVALID_M1  => GND_net, -- tied to '0' from definition
        WLAST_M1    => GND_net, -- tied to '0' from definition
        WVALID_M1   => GND_net, -- tied to '0' from definition
        BREADY_M1   => GND_net, -- tied to '0' from definition
        ARVALID_M1  => GND_net, -- tied to '0' from definition
        RREADY_M1   => GND_net, -- tied to '0' from definition
        AWVALID_M2  => GND_net, -- tied to '0' from definition
        WLAST_M2    => GND_net, -- tied to '0' from definition
        WVALID_M2   => GND_net, -- tied to '0' from definition
        BREADY_M2   => GND_net, -- tied to '0' from definition
        ARVALID_M2  => GND_net, -- tied to '0' from definition
        RREADY_M2   => GND_net, -- tied to '0' from definition
        AWVALID_M3  => GND_net, -- tied to '0' from definition
        WLAST_M3    => GND_net, -- tied to '0' from definition
        WVALID_M3   => GND_net, -- tied to '0' from definition
        BREADY_M3   => GND_net, -- tied to '0' from definition
        ARVALID_M3  => GND_net, -- tied to '0' from definition
        RREADY_M3   => GND_net, -- tied to '0' from definition
        AWREADY_S0  => GND_net, -- tied to '0' from definition
        WREADY_S0   => GND_net, -- tied to '0' from definition
        BVALID_S0   => GND_net, -- tied to '0' from definition
        ARREADY_S0  => GND_net, -- tied to '0' from definition
        RLAST_S0    => GND_net, -- tied to '0' from definition
        RVALID_S0   => GND_net, -- tied to '0' from definition
        AWREADY_S1  => GND_net, -- tied to '0' from definition
        WREADY_S1   => GND_net, -- tied to '0' from definition
        BVALID_S1   => GND_net, -- tied to '0' from definition
        ARREADY_S1  => GND_net, -- tied to '0' from definition
        RLAST_S1    => GND_net, -- tied to '0' from definition
        RVALID_S1   => GND_net, -- tied to '0' from definition
        AWREADY_S2  => GND_net, -- tied to '0' from definition
        WREADY_S2   => GND_net, -- tied to '0' from definition
        BVALID_S2   => GND_net, -- tied to '0' from definition
        ARREADY_S2  => GND_net, -- tied to '0' from definition
        RLAST_S2    => GND_net, -- tied to '0' from definition
        RVALID_S2   => GND_net, -- tied to '0' from definition
        AWREADY_S3  => GND_net, -- tied to '0' from definition
        WREADY_S3   => GND_net, -- tied to '0' from definition
        BVALID_S3   => GND_net, -- tied to '0' from definition
        ARREADY_S3  => GND_net, -- tied to '0' from definition
        RLAST_S3    => GND_net, -- tied to '0' from definition
        RVALID_S3   => GND_net, -- tied to '0' from definition
        AWREADY_S4  => GND_net, -- tied to '0' from definition
        WREADY_S4   => GND_net, -- tied to '0' from definition
        BVALID_S4   => GND_net, -- tied to '0' from definition
        ARREADY_S4  => GND_net, -- tied to '0' from definition
        RLAST_S4    => GND_net, -- tied to '0' from definition
        RVALID_S4   => GND_net, -- tied to '0' from definition
        AWREADY_S5  => GND_net, -- tied to '0' from definition
        WREADY_S5   => GND_net, -- tied to '0' from definition
        BVALID_S5   => GND_net, -- tied to '0' from definition
        ARREADY_S5  => GND_net, -- tied to '0' from definition
        RLAST_S5    => GND_net, -- tied to '0' from definition
        RVALID_S5   => GND_net, -- tied to '0' from definition
        AWREADY_S6  => GND_net, -- tied to '0' from definition
        WREADY_S6   => GND_net, -- tied to '0' from definition
        BVALID_S6   => GND_net, -- tied to '0' from definition
        ARREADY_S6  => GND_net, -- tied to '0' from definition
        RLAST_S6    => GND_net, -- tied to '0' from definition
        RVALID_S6   => GND_net, -- tied to '0' from definition
        AWREADY_S7  => GND_net, -- tied to '0' from definition
        WREADY_S7   => GND_net, -- tied to '0' from definition
        BVALID_S7   => GND_net, -- tied to '0' from definition
        ARREADY_S7  => GND_net, -- tied to '0' from definition
        RLAST_S7    => GND_net, -- tied to '0' from definition
        RVALID_S7   => GND_net, -- tied to '0' from definition
        AWREADY_S8  => GND_net, -- tied to '0' from definition
        WREADY_S8   => GND_net, -- tied to '0' from definition
        BVALID_S8   => GND_net, -- tied to '0' from definition
        ARREADY_S8  => GND_net, -- tied to '0' from definition
        RLAST_S8    => GND_net, -- tied to '0' from definition
        RVALID_S8   => GND_net, -- tied to '0' from definition
        AWREADY_S9  => GND_net, -- tied to '0' from definition
        WREADY_S9   => GND_net, -- tied to '0' from definition
        BVALID_S9   => GND_net, -- tied to '0' from definition
        ARREADY_S9  => GND_net, -- tied to '0' from definition
        RLAST_S9    => GND_net, -- tied to '0' from definition
        RVALID_S9   => GND_net, -- tied to '0' from definition
        AWREADY_S10 => GND_net, -- tied to '0' from definition
        WREADY_S10  => GND_net, -- tied to '0' from definition
        BVALID_S10  => GND_net, -- tied to '0' from definition
        ARREADY_S10 => GND_net, -- tied to '0' from definition
        RLAST_S10   => GND_net, -- tied to '0' from definition
        RVALID_S10  => GND_net, -- tied to '0' from definition
        AWREADY_S11 => GND_net, -- tied to '0' from definition
        WREADY_S11  => GND_net, -- tied to '0' from definition
        BVALID_S11  => GND_net, -- tied to '0' from definition
        ARREADY_S11 => GND_net, -- tied to '0' from definition
        RLAST_S11   => GND_net, -- tied to '0' from definition
        RVALID_S11  => GND_net, -- tied to '0' from definition
        AWREADY_S12 => GND_net, -- tied to '0' from definition
        WREADY_S12  => GND_net, -- tied to '0' from definition
        BVALID_S12  => GND_net, -- tied to '0' from definition
        ARREADY_S12 => GND_net, -- tied to '0' from definition
        RLAST_S12   => GND_net, -- tied to '0' from definition
        RVALID_S12  => GND_net, -- tied to '0' from definition
        AWREADY_S13 => GND_net, -- tied to '0' from definition
        WREADY_S13  => GND_net, -- tied to '0' from definition
        BVALID_S13  => GND_net, -- tied to '0' from definition
        ARREADY_S13 => GND_net, -- tied to '0' from definition
        RLAST_S13   => GND_net, -- tied to '0' from definition
        RVALID_S13  => GND_net, -- tied to '0' from definition
        AWREADY_S14 => GND_net, -- tied to '0' from definition
        WREADY_S14  => GND_net, -- tied to '0' from definition
        BVALID_S14  => GND_net, -- tied to '0' from definition
        ARREADY_S14 => GND_net, -- tied to '0' from definition
        RLAST_S14   => GND_net, -- tied to '0' from definition
        RVALID_S14  => GND_net, -- tied to '0' from definition
        AWREADY_S15 => GND_net, -- tied to '0' from definition
        WREADY_S15  => GND_net, -- tied to '0' from definition
        BVALID_S15  => GND_net, -- tied to '0' from definition
        ARREADY_S15 => GND_net, -- tied to '0' from definition
        RLAST_S15   => GND_net, -- tied to '0' from definition
        RVALID_S15  => GND_net, -- tied to '0' from definition
        AWREADY_S16 => COREAXI_0_AXImslave16_AWREADY,
        WREADY_S16  => COREAXI_0_AXImslave16_WREADY,
        BVALID_S16  => COREAXI_0_AXImslave16_BVALID,
        ARREADY_S16 => COREAXI_0_AXImslave16_ARREADY,
        RLAST_S16   => COREAXI_0_AXImslave16_RLAST,
        RVALID_S16  => COREAXI_0_AXImslave16_RVALID,
        AWID_M0     => COREAHBLTOAXI_0_AXIMasterIF_AWID,
        AWADDR_M0   => COREAHBLTOAXI_0_AXIMasterIF_AWADDR,
        AWLEN_M0    => COREAHBLTOAXI_0_AXIMasterIF_AWLEN,
        AWSIZE_M0   => COREAHBLTOAXI_0_AXIMasterIF_AWSIZE,
        AWBURST_M0  => COREAHBLTOAXI_0_AXIMasterIF_AWBURST,
        AWLOCK_M0   => COREAHBLTOAXI_0_AXIMasterIF_AWLOCK,
        AWCACHE_M0  => AWCACHE_M0_const_net_0, -- tied to X"0" from definition
        AWPROT_M0   => AWPROT_M0_const_net_0, -- tied to X"0" from definition
        WID_M0      => COREAHBLTOAXI_0_AXIMasterIF_WID,
        WDATA_M0    => COREAHBLTOAXI_0_AXIMasterIF_WDATA,
        WSTRB_M0    => COREAHBLTOAXI_0_AXIMasterIF_WSTRB,
        ARID_M0     => COREAHBLTOAXI_0_AXIMasterIF_ARID,
        ARADDR_M0   => COREAHBLTOAXI_0_AXIMasterIF_ARADDR,
        ARLEN_M0    => COREAHBLTOAXI_0_AXIMasterIF_ARLEN,
        ARSIZE_M0   => COREAHBLTOAXI_0_AXIMasterIF_ARSIZE,
        ARBURST_M0  => COREAHBLTOAXI_0_AXIMasterIF_ARBURST,
        ARLOCK_M0   => COREAHBLTOAXI_0_AXIMasterIF_ARLOCK,
        ARCACHE_M0  => ARCACHE_M0_const_net_0, -- tied to X"0" from definition
        ARPROT_M0   => ARPROT_M0_const_net_0, -- tied to X"0" from definition
        AWID_M1     => AWID_M1_const_net_0, -- tied to X"0" from definition
        AWADDR_M1   => AWADDR_M1_const_net_0, -- tied to X"0" from definition
        AWLEN_M1    => AWLEN_M1_const_net_0, -- tied to X"0" from definition
        AWSIZE_M1   => AWSIZE_M1_const_net_0, -- tied to X"0" from definition
        AWBURST_M1  => AWBURST_M1_const_net_0, -- tied to X"0" from definition
        AWLOCK_M1   => AWLOCK_M1_const_net_0, -- tied to X"0" from definition
        AWCACHE_M1  => AWCACHE_M1_const_net_0, -- tied to X"0" from definition
        AWPROT_M1   => AWPROT_M1_const_net_0, -- tied to X"0" from definition
        WID_M1      => WID_M1_const_net_0, -- tied to X"0" from definition
        WDATA_M1    => WDATA_M1_const_net_0, -- tied to X"0" from definition
        WSTRB_M1    => WSTRB_M1_const_net_0, -- tied to X"0" from definition
        ARID_M1     => ARID_M1_const_net_0, -- tied to X"0" from definition
        ARADDR_M1   => ARADDR_M1_const_net_0, -- tied to X"0" from definition
        ARLEN_M1    => ARLEN_M1_const_net_0, -- tied to X"0" from definition
        ARSIZE_M1   => ARSIZE_M1_const_net_0, -- tied to X"0" from definition
        ARBURST_M1  => ARBURST_M1_const_net_0, -- tied to X"0" from definition
        ARLOCK_M1   => ARLOCK_M1_const_net_0, -- tied to X"0" from definition
        ARCACHE_M1  => ARCACHE_M1_const_net_0, -- tied to X"0" from definition
        ARPROT_M1   => ARPROT_M1_const_net_0, -- tied to X"0" from definition
        AWID_M2     => AWID_M2_const_net_0, -- tied to X"0" from definition
        AWADDR_M2   => AWADDR_M2_const_net_0, -- tied to X"0" from definition
        AWLEN_M2    => AWLEN_M2_const_net_0, -- tied to X"0" from definition
        AWSIZE_M2   => AWSIZE_M2_const_net_0, -- tied to X"0" from definition
        AWBURST_M2  => AWBURST_M2_const_net_0, -- tied to X"0" from definition
        AWLOCK_M2   => AWLOCK_M2_const_net_0, -- tied to X"0" from definition
        AWCACHE_M2  => AWCACHE_M2_const_net_0, -- tied to X"0" from definition
        AWPROT_M2   => AWPROT_M2_const_net_0, -- tied to X"0" from definition
        WID_M2      => WID_M2_const_net_0, -- tied to X"0" from definition
        WDATA_M2    => WDATA_M2_const_net_0, -- tied to X"0" from definition
        WSTRB_M2    => WSTRB_M2_const_net_0, -- tied to X"0" from definition
        ARID_M2     => ARID_M2_const_net_0, -- tied to X"0" from definition
        ARADDR_M2   => ARADDR_M2_const_net_0, -- tied to X"0" from definition
        ARLEN_M2    => ARLEN_M2_const_net_0, -- tied to X"0" from definition
        ARSIZE_M2   => ARSIZE_M2_const_net_0, -- tied to X"0" from definition
        ARBURST_M2  => ARBURST_M2_const_net_0, -- tied to X"0" from definition
        ARLOCK_M2   => ARLOCK_M2_const_net_0, -- tied to X"0" from definition
        ARCACHE_M2  => ARCACHE_M2_const_net_0, -- tied to X"0" from definition
        ARPROT_M2   => ARPROT_M2_const_net_0, -- tied to X"0" from definition
        AWID_M3     => AWID_M3_const_net_0, -- tied to X"0" from definition
        AWADDR_M3   => AWADDR_M3_const_net_0, -- tied to X"0" from definition
        AWLEN_M3    => AWLEN_M3_const_net_0, -- tied to X"0" from definition
        AWSIZE_M3   => AWSIZE_M3_const_net_0, -- tied to X"0" from definition
        AWBURST_M3  => AWBURST_M3_const_net_0, -- tied to X"0" from definition
        AWLOCK_M3   => AWLOCK_M3_const_net_0, -- tied to X"0" from definition
        AWCACHE_M3  => AWCACHE_M3_const_net_0, -- tied to X"0" from definition
        AWPROT_M3   => AWPROT_M3_const_net_0, -- tied to X"0" from definition
        WID_M3      => WID_M3_const_net_0, -- tied to X"0" from definition
        WDATA_M3    => WDATA_M3_const_net_0, -- tied to X"0" from definition
        WSTRB_M3    => WSTRB_M3_const_net_0, -- tied to X"0" from definition
        ARID_M3     => ARID_M3_const_net_0, -- tied to X"0" from definition
        ARADDR_M3   => ARADDR_M3_const_net_0, -- tied to X"0" from definition
        ARLEN_M3    => ARLEN_M3_const_net_0, -- tied to X"0" from definition
        ARSIZE_M3   => ARSIZE_M3_const_net_0, -- tied to X"0" from definition
        ARBURST_M3  => ARBURST_M3_const_net_0, -- tied to X"0" from definition
        ARLOCK_M3   => ARLOCK_M3_const_net_0, -- tied to X"0" from definition
        ARCACHE_M3  => ARCACHE_M3_const_net_0, -- tied to X"0" from definition
        ARPROT_M3   => ARPROT_M3_const_net_0, -- tied to X"0" from definition
        BID_S0      => BID_S0_const_net_0, -- tied to X"0" from definition
        BRESP_S0    => BRESP_S0_const_net_0, -- tied to X"0" from definition
        RID_S0      => RID_S0_const_net_0, -- tied to X"0" from definition
        RDATA_S0    => RDATA_S0_const_net_0, -- tied to X"0" from definition
        RRESP_S0    => RRESP_S0_const_net_0, -- tied to X"0" from definition
        BID_S1      => BID_S1_const_net_0, -- tied to X"0" from definition
        BRESP_S1    => BRESP_S1_const_net_0, -- tied to X"0" from definition
        RID_S1      => RID_S1_const_net_0, -- tied to X"0" from definition
        RDATA_S1    => RDATA_S1_const_net_0, -- tied to X"0" from definition
        RRESP_S1    => RRESP_S1_const_net_0, -- tied to X"0" from definition
        BID_S2      => BID_S2_const_net_0, -- tied to X"0" from definition
        BRESP_S2    => BRESP_S2_const_net_0, -- tied to X"0" from definition
        RID_S2      => RID_S2_const_net_0, -- tied to X"0" from definition
        RDATA_S2    => RDATA_S2_const_net_0, -- tied to X"0" from definition
        RRESP_S2    => RRESP_S2_const_net_0, -- tied to X"0" from definition
        BID_S3      => BID_S3_const_net_0, -- tied to X"0" from definition
        BRESP_S3    => BRESP_S3_const_net_0, -- tied to X"0" from definition
        RID_S3      => RID_S3_const_net_0, -- tied to X"0" from definition
        RDATA_S3    => RDATA_S3_const_net_0, -- tied to X"0" from definition
        RRESP_S3    => RRESP_S3_const_net_0, -- tied to X"0" from definition
        BID_S4      => BID_S4_const_net_0, -- tied to X"0" from definition
        BRESP_S4    => BRESP_S4_const_net_0, -- tied to X"0" from definition
        RID_S4      => RID_S4_const_net_0, -- tied to X"0" from definition
        RDATA_S4    => RDATA_S4_const_net_0, -- tied to X"0" from definition
        RRESP_S4    => RRESP_S4_const_net_0, -- tied to X"0" from definition
        BID_S5      => BID_S5_const_net_0, -- tied to X"0" from definition
        BRESP_S5    => BRESP_S5_const_net_0, -- tied to X"0" from definition
        RID_S5      => RID_S5_const_net_0, -- tied to X"0" from definition
        RDATA_S5    => RDATA_S5_const_net_0, -- tied to X"0" from definition
        RRESP_S5    => RRESP_S5_const_net_0, -- tied to X"0" from definition
        BID_S6      => BID_S6_const_net_0, -- tied to X"0" from definition
        BRESP_S6    => BRESP_S6_const_net_0, -- tied to X"0" from definition
        RID_S6      => RID_S6_const_net_0, -- tied to X"0" from definition
        RDATA_S6    => RDATA_S6_const_net_0, -- tied to X"0" from definition
        RRESP_S6    => RRESP_S6_const_net_0, -- tied to X"0" from definition
        BID_S7      => BID_S7_const_net_0, -- tied to X"0" from definition
        BRESP_S7    => BRESP_S7_const_net_0, -- tied to X"0" from definition
        RID_S7      => RID_S7_const_net_0, -- tied to X"0" from definition
        RDATA_S7    => RDATA_S7_const_net_0, -- tied to X"0" from definition
        RRESP_S7    => RRESP_S7_const_net_0, -- tied to X"0" from definition
        BID_S8      => BID_S8_const_net_0, -- tied to X"0" from definition
        BRESP_S8    => BRESP_S8_const_net_0, -- tied to X"0" from definition
        RID_S8      => RID_S8_const_net_0, -- tied to X"0" from definition
        RDATA_S8    => RDATA_S8_const_net_0, -- tied to X"0" from definition
        RRESP_S8    => RRESP_S8_const_net_0, -- tied to X"0" from definition
        BID_S9      => BID_S9_const_net_0, -- tied to X"0" from definition
        BRESP_S9    => BRESP_S9_const_net_0, -- tied to X"0" from definition
        RID_S9      => RID_S9_const_net_0, -- tied to X"0" from definition
        RDATA_S9    => RDATA_S9_const_net_0, -- tied to X"0" from definition
        RRESP_S9    => RRESP_S9_const_net_0, -- tied to X"0" from definition
        BID_S10     => BID_S10_const_net_0, -- tied to X"0" from definition
        BRESP_S10   => BRESP_S10_const_net_0, -- tied to X"0" from definition
        RID_S10     => RID_S10_const_net_0, -- tied to X"0" from definition
        RDATA_S10   => RDATA_S10_const_net_0, -- tied to X"0" from definition
        RRESP_S10   => RRESP_S10_const_net_0, -- tied to X"0" from definition
        BID_S11     => BID_S11_const_net_0, -- tied to X"0" from definition
        BRESP_S11   => BRESP_S11_const_net_0, -- tied to X"0" from definition
        RID_S11     => RID_S11_const_net_0, -- tied to X"0" from definition
        RDATA_S11   => RDATA_S11_const_net_0, -- tied to X"0" from definition
        RRESP_S11   => RRESP_S11_const_net_0, -- tied to X"0" from definition
        BID_S12     => BID_S12_const_net_0, -- tied to X"0" from definition
        BRESP_S12   => BRESP_S12_const_net_0, -- tied to X"0" from definition
        RID_S12     => RID_S12_const_net_0, -- tied to X"0" from definition
        RDATA_S12   => RDATA_S12_const_net_0, -- tied to X"0" from definition
        RRESP_S12   => RRESP_S12_const_net_0, -- tied to X"0" from definition
        BID_S13     => BID_S13_const_net_0, -- tied to X"0" from definition
        BRESP_S13   => BRESP_S13_const_net_0, -- tied to X"0" from definition
        RID_S13     => RID_S13_const_net_0, -- tied to X"0" from definition
        RDATA_S13   => RDATA_S13_const_net_0, -- tied to X"0" from definition
        RRESP_S13   => RRESP_S13_const_net_0, -- tied to X"0" from definition
        BID_S14     => BID_S14_const_net_0, -- tied to X"0" from definition
        BRESP_S14   => BRESP_S14_const_net_0, -- tied to X"0" from definition
        RID_S14     => RID_S14_const_net_0, -- tied to X"0" from definition
        RDATA_S14   => RDATA_S14_const_net_0, -- tied to X"0" from definition
        RRESP_S14   => RRESP_S14_const_net_0, -- tied to X"0" from definition
        BID_S15     => BID_S15_const_net_0, -- tied to X"0" from definition
        BRESP_S15   => BRESP_S15_const_net_0, -- tied to X"0" from definition
        RID_S15     => RID_S15_const_net_0, -- tied to X"0" from definition
        RDATA_S15   => RDATA_S15_const_net_0, -- tied to X"0" from definition
        RRESP_S15   => RRESP_S15_const_net_0, -- tied to X"0" from definition
        BID_S16     => COREAXI_0_AXImslave16_BID_0,
        BRESP_S16   => COREAXI_0_AXImslave16_BRESP,
        RID_S16     => COREAXI_0_AXImslave16_RID_0,
        RDATA_S16   => COREAXI_0_AXImslave16_RDATA,
        RRESP_S16   => COREAXI_0_AXImslave16_RRESP,
        -- Outputs
        AWREADY_M0  => COREAHBLTOAXI_0_AXIMasterIF_AWREADY,
        WREADY_M0   => COREAHBLTOAXI_0_AXIMasterIF_WREADY,
        BVALID_M0   => COREAHBLTOAXI_0_AXIMasterIF_BVALID,
        ARREADY_M0  => COREAHBLTOAXI_0_AXIMasterIF_ARREADY,
        RLAST_M0    => COREAHBLTOAXI_0_AXIMasterIF_RLAST,
        RVALID_M0   => COREAHBLTOAXI_0_AXIMasterIF_RVALID,
        AWREADY_M1  => OPEN,
        WREADY_M1   => OPEN,
        BVALID_M1   => OPEN,
        ARREADY_M1  => OPEN,
        RLAST_M1    => OPEN,
        RVALID_M1   => OPEN,
        AWREADY_M2  => OPEN,
        WREADY_M2   => OPEN,
        BVALID_M2   => OPEN,
        ARREADY_M2  => OPEN,
        RLAST_M2    => OPEN,
        RVALID_M2   => OPEN,
        AWREADY_M3  => OPEN,
        WREADY_M3   => OPEN,
        BVALID_M3   => OPEN,
        ARREADY_M3  => OPEN,
        RLAST_M3    => OPEN,
        RVALID_M3   => OPEN,
        AWVALID_S0  => OPEN,
        WLAST_S0    => OPEN,
        WVALID_S0   => OPEN,
        BREADY_S0   => OPEN,
        ARVALID_S0  => OPEN,
        RREADY_S0   => OPEN,
        AWVALID_S1  => OPEN,
        WLAST_S1    => OPEN,
        WVALID_S1   => OPEN,
        BREADY_S1   => OPEN,
        ARVALID_S1  => OPEN,
        RREADY_S1   => OPEN,
        AWVALID_S2  => OPEN,
        WLAST_S2    => OPEN,
        WVALID_S2   => OPEN,
        BREADY_S2   => OPEN,
        ARVALID_S2  => OPEN,
        RREADY_S2   => OPEN,
        AWVALID_S3  => OPEN,
        WLAST_S3    => OPEN,
        WVALID_S3   => OPEN,
        BREADY_S3   => OPEN,
        ARVALID_S3  => OPEN,
        RREADY_S3   => OPEN,
        AWVALID_S4  => OPEN,
        WLAST_S4    => OPEN,
        WVALID_S4   => OPEN,
        BREADY_S4   => OPEN,
        ARVALID_S4  => OPEN,
        RREADY_S4   => OPEN,
        AWVALID_S5  => OPEN,
        WLAST_S5    => OPEN,
        WVALID_S5   => OPEN,
        BREADY_S5   => OPEN,
        ARVALID_S5  => OPEN,
        RREADY_S5   => OPEN,
        AWVALID_S6  => OPEN,
        WLAST_S6    => OPEN,
        WVALID_S6   => OPEN,
        BREADY_S6   => OPEN,
        ARVALID_S6  => OPEN,
        RREADY_S6   => OPEN,
        AWVALID_S7  => OPEN,
        WLAST_S7    => OPEN,
        WVALID_S7   => OPEN,
        BREADY_S7   => OPEN,
        ARVALID_S7  => OPEN,
        RREADY_S7   => OPEN,
        AWVALID_S8  => OPEN,
        WLAST_S8    => OPEN,
        WVALID_S8   => OPEN,
        BREADY_S8   => OPEN,
        ARVALID_S8  => OPEN,
        RREADY_S8   => OPEN,
        AWVALID_S9  => OPEN,
        WLAST_S9    => OPEN,
        WVALID_S9   => OPEN,
        BREADY_S9   => OPEN,
        ARVALID_S9  => OPEN,
        RREADY_S9   => OPEN,
        AWVALID_S10 => OPEN,
        WLAST_S10   => OPEN,
        WVALID_S10  => OPEN,
        BREADY_S10  => OPEN,
        ARVALID_S10 => OPEN,
        RREADY_S10  => OPEN,
        AWVALID_S11 => OPEN,
        WLAST_S11   => OPEN,
        WVALID_S11  => OPEN,
        BREADY_S11  => OPEN,
        ARVALID_S11 => OPEN,
        RREADY_S11  => OPEN,
        AWVALID_S12 => OPEN,
        WLAST_S12   => OPEN,
        WVALID_S12  => OPEN,
        BREADY_S12  => OPEN,
        ARVALID_S12 => OPEN,
        RREADY_S12  => OPEN,
        AWVALID_S13 => OPEN,
        WLAST_S13   => OPEN,
        WVALID_S13  => OPEN,
        BREADY_S13  => OPEN,
        ARVALID_S13 => OPEN,
        RREADY_S13  => OPEN,
        AWVALID_S14 => OPEN,
        WLAST_S14   => OPEN,
        WVALID_S14  => OPEN,
        BREADY_S14  => OPEN,
        ARVALID_S14 => OPEN,
        RREADY_S14  => OPEN,
        AWVALID_S15 => OPEN,
        WLAST_S15   => OPEN,
        WVALID_S15  => OPEN,
        BREADY_S15  => OPEN,
        ARVALID_S15 => OPEN,
        RREADY_S15  => OPEN,
        AWVALID_S16 => COREAXI_0_AXImslave16_AWVALID,
        WLAST_S16   => COREAXI_0_AXImslave16_WLAST,
        WVALID_S16  => COREAXI_0_AXImslave16_WVALID,
        BREADY_S16  => COREAXI_0_AXImslave16_BREADY,
        ARVALID_S16 => COREAXI_0_AXImslave16_ARVALID,
        RREADY_S16  => COREAXI_0_AXImslave16_RREADY,
        BID_M0      => COREAHBLTOAXI_0_AXIMasterIF_BID,
        BRESP_M0    => COREAHBLTOAXI_0_AXIMasterIF_BRESP,
        RID_M0      => COREAHBLTOAXI_0_AXIMasterIF_RID,
        RDATA_M0    => COREAHBLTOAXI_0_AXIMasterIF_RDATA,
        RRESP_M0    => COREAHBLTOAXI_0_AXIMasterIF_RRESP,
        BID_M1      => OPEN,
        BRESP_M1    => OPEN,
        RID_M1      => OPEN,
        RDATA_M1    => OPEN,
        RRESP_M1    => OPEN,
        BID_M2      => OPEN,
        BRESP_M2    => OPEN,
        RID_M2      => OPEN,
        RDATA_M2    => OPEN,
        RRESP_M2    => OPEN,
        BID_M3      => OPEN,
        BRESP_M3    => OPEN,
        RID_M3      => OPEN,
        RDATA_M3    => OPEN,
        RRESP_M3    => OPEN,
        AWID_S0     => OPEN,
        AWADDR_S0   => OPEN,
        AWLEN_S0    => OPEN,
        AWSIZE_S0   => OPEN,
        AWBURST_S0  => OPEN,
        AWLOCK_S0   => OPEN,
        AWCACHE_S0  => OPEN,
        AWPROT_S0   => OPEN,
        WID_S0      => OPEN,
        WDATA_S0    => OPEN,
        WSTRB_S0    => OPEN,
        ARID_S0     => OPEN,
        ARADDR_S0   => OPEN,
        ARLEN_S0    => OPEN,
        ARSIZE_S0   => OPEN,
        ARBURST_S0  => OPEN,
        ARLOCK_S0   => OPEN,
        ARCACHE_S0  => OPEN,
        ARPROT_S0   => OPEN,
        AWID_S1     => OPEN,
        AWADDR_S1   => OPEN,
        AWLEN_S1    => OPEN,
        AWSIZE_S1   => OPEN,
        AWBURST_S1  => OPEN,
        AWLOCK_S1   => OPEN,
        AWCACHE_S1  => OPEN,
        AWPROT_S1   => OPEN,
        WID_S1      => OPEN,
        WDATA_S1    => OPEN,
        WSTRB_S1    => OPEN,
        ARID_S1     => OPEN,
        ARADDR_S1   => OPEN,
        ARLEN_S1    => OPEN,
        ARSIZE_S1   => OPEN,
        ARBURST_S1  => OPEN,
        ARLOCK_S1   => OPEN,
        ARCACHE_S1  => OPEN,
        ARPROT_S1   => OPEN,
        AWID_S2     => OPEN,
        AWADDR_S2   => OPEN,
        AWLEN_S2    => OPEN,
        AWSIZE_S2   => OPEN,
        AWBURST_S2  => OPEN,
        AWLOCK_S2   => OPEN,
        AWCACHE_S2  => OPEN,
        AWPROT_S2   => OPEN,
        WID_S2      => OPEN,
        WDATA_S2    => OPEN,
        WSTRB_S2    => OPEN,
        ARID_S2     => OPEN,
        ARADDR_S2   => OPEN,
        ARLEN_S2    => OPEN,
        ARSIZE_S2   => OPEN,
        ARBURST_S2  => OPEN,
        ARLOCK_S2   => OPEN,
        ARCACHE_S2  => OPEN,
        ARPROT_S2   => OPEN,
        AWID_S3     => OPEN,
        AWADDR_S3   => OPEN,
        AWLEN_S3    => OPEN,
        AWSIZE_S3   => OPEN,
        AWBURST_S3  => OPEN,
        AWLOCK_S3   => OPEN,
        AWCACHE_S3  => OPEN,
        AWPROT_S3   => OPEN,
        WID_S3      => OPEN,
        WDATA_S3    => OPEN,
        WSTRB_S3    => OPEN,
        ARID_S3     => OPEN,
        ARADDR_S3   => OPEN,
        ARLEN_S3    => OPEN,
        ARSIZE_S3   => OPEN,
        ARBURST_S3  => OPEN,
        ARLOCK_S3   => OPEN,
        ARCACHE_S3  => OPEN,
        ARPROT_S3   => OPEN,
        AWID_S4     => OPEN,
        AWADDR_S4   => OPEN,
        AWLEN_S4    => OPEN,
        AWSIZE_S4   => OPEN,
        AWBURST_S4  => OPEN,
        AWLOCK_S4   => OPEN,
        AWCACHE_S4  => OPEN,
        AWPROT_S4   => OPEN,
        WID_S4      => OPEN,
        WDATA_S4    => OPEN,
        WSTRB_S4    => OPEN,
        ARID_S4     => OPEN,
        ARADDR_S4   => OPEN,
        ARLEN_S4    => OPEN,
        ARSIZE_S4   => OPEN,
        ARBURST_S4  => OPEN,
        ARLOCK_S4   => OPEN,
        ARCACHE_S4  => OPEN,
        ARPROT_S4   => OPEN,
        AWID_S5     => OPEN,
        AWADDR_S5   => OPEN,
        AWLEN_S5    => OPEN,
        AWSIZE_S5   => OPEN,
        AWBURST_S5  => OPEN,
        AWLOCK_S5   => OPEN,
        AWCACHE_S5  => OPEN,
        AWPROT_S5   => OPEN,
        WID_S5      => OPEN,
        WDATA_S5    => OPEN,
        WSTRB_S5    => OPEN,
        ARID_S5     => OPEN,
        ARADDR_S5   => OPEN,
        ARLEN_S5    => OPEN,
        ARSIZE_S5   => OPEN,
        ARBURST_S5  => OPEN,
        ARLOCK_S5   => OPEN,
        ARCACHE_S5  => OPEN,
        ARPROT_S5   => OPEN,
        AWID_S6     => OPEN,
        AWADDR_S6   => OPEN,
        AWLEN_S6    => OPEN,
        AWSIZE_S6   => OPEN,
        AWBURST_S6  => OPEN,
        AWLOCK_S6   => OPEN,
        AWCACHE_S6  => OPEN,
        AWPROT_S6   => OPEN,
        WID_S6      => OPEN,
        WDATA_S6    => OPEN,
        WSTRB_S6    => OPEN,
        ARID_S6     => OPEN,
        ARADDR_S6   => OPEN,
        ARLEN_S6    => OPEN,
        ARSIZE_S6   => OPEN,
        ARBURST_S6  => OPEN,
        ARLOCK_S6   => OPEN,
        ARCACHE_S6  => OPEN,
        ARPROT_S6   => OPEN,
        AWID_S7     => OPEN,
        AWADDR_S7   => OPEN,
        AWLEN_S7    => OPEN,
        AWSIZE_S7   => OPEN,
        AWBURST_S7  => OPEN,
        AWLOCK_S7   => OPEN,
        AWCACHE_S7  => OPEN,
        AWPROT_S7   => OPEN,
        WID_S7      => OPEN,
        WDATA_S7    => OPEN,
        WSTRB_S7    => OPEN,
        ARID_S7     => OPEN,
        ARADDR_S7   => OPEN,
        ARLEN_S7    => OPEN,
        ARSIZE_S7   => OPEN,
        ARBURST_S7  => OPEN,
        ARLOCK_S7   => OPEN,
        ARCACHE_S7  => OPEN,
        ARPROT_S7   => OPEN,
        AWID_S8     => OPEN,
        AWADDR_S8   => OPEN,
        AWLEN_S8    => OPEN,
        AWSIZE_S8   => OPEN,
        AWBURST_S8  => OPEN,
        AWLOCK_S8   => OPEN,
        AWCACHE_S8  => OPEN,
        AWPROT_S8   => OPEN,
        WID_S8      => OPEN,
        WDATA_S8    => OPEN,
        WSTRB_S8    => OPEN,
        ARID_S8     => OPEN,
        ARADDR_S8   => OPEN,
        ARLEN_S8    => OPEN,
        ARSIZE_S8   => OPEN,
        ARBURST_S8  => OPEN,
        ARLOCK_S8   => OPEN,
        ARCACHE_S8  => OPEN,
        ARPROT_S8   => OPEN,
        AWID_S9     => OPEN,
        AWADDR_S9   => OPEN,
        AWLEN_S9    => OPEN,
        AWSIZE_S9   => OPEN,
        AWBURST_S9  => OPEN,
        AWLOCK_S9   => OPEN,
        AWCACHE_S9  => OPEN,
        AWPROT_S9   => OPEN,
        WID_S9      => OPEN,
        WDATA_S9    => OPEN,
        WSTRB_S9    => OPEN,
        ARID_S9     => OPEN,
        ARADDR_S9   => OPEN,
        ARLEN_S9    => OPEN,
        ARSIZE_S9   => OPEN,
        ARBURST_S9  => OPEN,
        ARLOCK_S9   => OPEN,
        ARCACHE_S9  => OPEN,
        ARPROT_S9   => OPEN,
        AWID_S10    => OPEN,
        AWADDR_S10  => OPEN,
        AWLEN_S10   => OPEN,
        AWSIZE_S10  => OPEN,
        AWBURST_S10 => OPEN,
        AWLOCK_S10  => OPEN,
        AWCACHE_S10 => OPEN,
        AWPROT_S10  => OPEN,
        WID_S10     => OPEN,
        WDATA_S10   => OPEN,
        WSTRB_S10   => OPEN,
        ARID_S10    => OPEN,
        ARADDR_S10  => OPEN,
        ARLEN_S10   => OPEN,
        ARSIZE_S10  => OPEN,
        ARBURST_S10 => OPEN,
        ARLOCK_S10  => OPEN,
        ARCACHE_S10 => OPEN,
        ARPROT_S10  => OPEN,
        AWID_S11    => OPEN,
        AWADDR_S11  => OPEN,
        AWLEN_S11   => OPEN,
        AWSIZE_S11  => OPEN,
        AWBURST_S11 => OPEN,
        AWLOCK_S11  => OPEN,
        AWCACHE_S11 => OPEN,
        AWPROT_S11  => OPEN,
        WID_S11     => OPEN,
        WDATA_S11   => OPEN,
        WSTRB_S11   => OPEN,
        ARID_S11    => OPEN,
        ARADDR_S11  => OPEN,
        ARLEN_S11   => OPEN,
        ARSIZE_S11  => OPEN,
        ARBURST_S11 => OPEN,
        ARLOCK_S11  => OPEN,
        ARCACHE_S11 => OPEN,
        ARPROT_S11  => OPEN,
        AWID_S12    => OPEN,
        AWADDR_S12  => OPEN,
        AWLEN_S12   => OPEN,
        AWSIZE_S12  => OPEN,
        AWBURST_S12 => OPEN,
        AWLOCK_S12  => OPEN,
        AWCACHE_S12 => OPEN,
        AWPROT_S12  => OPEN,
        WID_S12     => OPEN,
        WDATA_S12   => OPEN,
        WSTRB_S12   => OPEN,
        ARID_S12    => OPEN,
        ARADDR_S12  => OPEN,
        ARLEN_S12   => OPEN,
        ARSIZE_S12  => OPEN,
        ARBURST_S12 => OPEN,
        ARLOCK_S12  => OPEN,
        ARCACHE_S12 => OPEN,
        ARPROT_S12  => OPEN,
        AWID_S13    => OPEN,
        AWADDR_S13  => OPEN,
        AWLEN_S13   => OPEN,
        AWSIZE_S13  => OPEN,
        AWBURST_S13 => OPEN,
        AWLOCK_S13  => OPEN,
        AWCACHE_S13 => OPEN,
        AWPROT_S13  => OPEN,
        WID_S13     => OPEN,
        WDATA_S13   => OPEN,
        WSTRB_S13   => OPEN,
        ARID_S13    => OPEN,
        ARADDR_S13  => OPEN,
        ARLEN_S13   => OPEN,
        ARSIZE_S13  => OPEN,
        ARBURST_S13 => OPEN,
        ARLOCK_S13  => OPEN,
        ARCACHE_S13 => OPEN,
        ARPROT_S13  => OPEN,
        AWID_S14    => OPEN,
        AWADDR_S14  => OPEN,
        AWLEN_S14   => OPEN,
        AWSIZE_S14  => OPEN,
        AWBURST_S14 => OPEN,
        AWLOCK_S14  => OPEN,
        AWCACHE_S14 => OPEN,
        AWPROT_S14  => OPEN,
        WID_S14     => OPEN,
        WDATA_S14   => OPEN,
        WSTRB_S14   => OPEN,
        ARID_S14    => OPEN,
        ARADDR_S14  => OPEN,
        ARLEN_S14   => OPEN,
        ARSIZE_S14  => OPEN,
        ARBURST_S14 => OPEN,
        ARLOCK_S14  => OPEN,
        ARCACHE_S14 => OPEN,
        ARPROT_S14  => OPEN,
        AWID_S15    => OPEN,
        AWADDR_S15  => OPEN,
        AWLEN_S15   => OPEN,
        AWSIZE_S15  => OPEN,
        AWBURST_S15 => OPEN,
        AWLOCK_S15  => OPEN,
        AWCACHE_S15 => OPEN,
        AWPROT_S15  => OPEN,
        WID_S15     => OPEN,
        WDATA_S15   => OPEN,
        WSTRB_S15   => OPEN,
        ARID_S15    => OPEN,
        ARADDR_S15  => OPEN,
        ARLEN_S15   => OPEN,
        ARSIZE_S15  => OPEN,
        ARBURST_S15 => OPEN,
        ARLOCK_S15  => OPEN,
        ARCACHE_S15 => OPEN,
        ARPROT_S15  => OPEN,
        AWID_S16    => COREAXI_0_AXImslave16_AWID,
        AWADDR_S16  => COREAXI_0_AXImslave16_AWADDR,
        AWLEN_S16   => COREAXI_0_AXImslave16_AWLEN,
        AWSIZE_S16  => COREAXI_0_AXImslave16_AWSIZE,
        AWBURST_S16 => COREAXI_0_AXImslave16_AWBURST,
        AWLOCK_S16  => COREAXI_0_AXImslave16_AWLOCK,
        AWCACHE_S16 => COREAXI_0_AXImslave16_AWCACHE,
        AWPROT_S16  => COREAXI_0_AXImslave16_AWPROT,
        WID_S16     => COREAXI_0_AXImslave16_WID,
        WDATA_S16   => COREAXI_0_AXImslave16_WDATA,
        WSTRB_S16   => COREAXI_0_AXImslave16_WSTRB,
        ARID_S16    => COREAXI_0_AXImslave16_ARID,
        ARADDR_S16  => COREAXI_0_AXImslave16_ARADDR,
        ARLEN_S16   => COREAXI_0_AXImslave16_ARLEN,
        ARSIZE_S16  => COREAXI_0_AXImslave16_ARSIZE,
        ARBURST_S16 => COREAXI_0_AXImslave16_ARBURST,
        ARLOCK_S16  => COREAXI_0_AXImslave16_ARLOCK,
        ARCACHE_S16 => COREAXI_0_AXImslave16_ARCACHE,
        ARPROT_S16  => COREAXI_0_AXImslave16_ARPROT 
        );
-- CORERESETP_0   -   Actel:DirectCore:CoreResetP:7.1.100
CORERESETP_0 : CoreResetP
    generic map( 
        DDR_WAIT            => ( 200 ),
        DEVICE_090          => ( 0 ),
        DEVICE_VOLTAGE      => ( 2 ),
        ENABLE_SOFT_RESETS  => ( 0 ),
        EXT_RESET_CFG       => ( 0 ),
        FDDR_IN_USE         => ( 0 ),
        MDDR_IN_USE         => ( 0 ),
        SDIF0_IN_USE        => ( 0 ),
        SDIF0_PCIE          => ( 0 ),
        SDIF0_PCIE_HOTRESET => ( 1 ),
        SDIF0_PCIE_L2P2     => ( 1 ),
        SDIF1_IN_USE        => ( 0 ),
        SDIF1_PCIE          => ( 0 ),
        SDIF1_PCIE_HOTRESET => ( 1 ),
        SDIF1_PCIE_L2P2     => ( 1 ),
        SDIF2_IN_USE        => ( 0 ),
        SDIF2_PCIE          => ( 0 ),
        SDIF2_PCIE_HOTRESET => ( 1 ),
        SDIF2_PCIE_L2P2     => ( 1 ),
        SDIF3_IN_USE        => ( 0 ),
        SDIF3_PCIE          => ( 0 ),
        SDIF3_PCIE_HOTRESET => ( 1 ),
        SDIF3_PCIE_L2P2     => ( 1 )
        )
    port map( 
        -- Inputs
        RESET_N_M2F                    => top_sb_MSS_TMP_0_MSS_RESET_N_M2F,
        FIC_2_APB_M_PRESET_N           => top_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N,
        POWER_ON_RESET_N               => POWER_ON_RESET_N_net_0,
        FAB_RESET_N                    => FAB_RESET_N,
        RCOSC_25_50MHZ                 => FABOSC_0_RCOSC_25_50MHZ_O2F,
        CLK_BASE                       => FAB_CCC_GL2_net_0,
        CLK_LTSSM                      => GND_net, -- tied to '0' from definition
        FPLL_LOCK                      => VCC_net, -- tied to '1' from definition
        SDIF0_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        SDIF1_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        SDIF2_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        SDIF3_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        CONFIG1_DONE                   => VCC_net,
        CONFIG2_DONE                   => VCC_net,
        SDIF0_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF1_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF2_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF3_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF0_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF0_PWRITE                   => VCC_net, -- tied to '1' from definition
        SDIF1_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF1_PWRITE                   => VCC_net, -- tied to '1' from definition
        SDIF2_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF2_PWRITE                   => VCC_net, -- tied to '1' from definition
        SDIF3_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF3_PWRITE                   => VCC_net, -- tied to '1' from definition
        SOFT_EXT_RESET_OUT             => GND_net, -- tied to '0' from definition
        SOFT_RESET_F2M                 => GND_net, -- tied to '0' from definition
        SOFT_M3_RESET                  => GND_net, -- tied to '0' from definition
        SOFT_MDDR_DDR_AXI_S_CORE_RESET => GND_net, -- tied to '0' from definition
        SOFT_FDDR_CORE_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_CORE_RESET          => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_0_CORE_RESET        => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_1_CORE_RESET        => GND_net, -- tied to '0' from definition
        SOFT_SDIF1_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF1_CORE_RESET          => GND_net, -- tied to '0' from definition
        SOFT_SDIF2_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF2_CORE_RESET          => GND_net, -- tied to '0' from definition
        SOFT_SDIF3_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF3_CORE_RESET          => GND_net, -- tied to '0' from definition
        SDIF0_PRDATA                   => SDIF0_PRDATA_const_net_0, -- tied to X"0" from definition
        SDIF1_PRDATA                   => SDIF1_PRDATA_const_net_0, -- tied to X"0" from definition
        SDIF2_PRDATA                   => SDIF2_PRDATA_const_net_0, -- tied to X"0" from definition
        SDIF3_PRDATA                   => SDIF3_PRDATA_const_net_0, -- tied to X"0" from definition
        -- Outputs
        MSS_HPMS_READY                 => MSS_READY_net_0,
        DDR_READY                      => OPEN,
        SDIF_READY                     => OPEN,
        RESET_N_F2M                    => CORERESETP_0_RESET_N_F2M,
        M3_RESET_N                     => OPEN,
        EXT_RESET_OUT                  => OPEN,
        MDDR_DDR_AXI_S_CORE_RESET_N    => OPEN,
        FDDR_CORE_RESET_N              => OPEN,
        SDIF0_CORE_RESET_N             => OPEN,
        SDIF0_0_CORE_RESET_N           => OPEN,
        SDIF0_1_CORE_RESET_N           => OPEN,
        SDIF0_PHY_RESET_N              => OPEN,
        SDIF1_CORE_RESET_N             => OPEN,
        SDIF1_PHY_RESET_N              => OPEN,
        SDIF2_CORE_RESET_N             => OPEN,
        SDIF2_PHY_RESET_N              => OPEN,
        SDIF3_CORE_RESET_N             => OPEN,
        SDIF3_PHY_RESET_N              => OPEN,
        SDIF_RELEASED                  => OPEN,
        INIT_DONE                      => INIT_DONE_net_0 
        );
-- FABOSC_0   -   Actel:SgCore:OSC:2.0.101
FABOSC_0 : top_sb_FABOSC_0_OSC
    port map( 
        -- Inputs
        XTL                => GND_net, -- tied to '0' from definition
        -- Outputs
        RCOSC_25_50MHZ_CCC => OPEN,
        RCOSC_25_50MHZ_O2F => FABOSC_0_RCOSC_25_50MHZ_O2F,
        RCOSC_1MHZ_CCC     => OPEN,
        RCOSC_1MHZ_O2F     => OPEN,
        XTLOSC_CCC         => OPEN,
        XTLOSC_O2F         => OPEN 
        );
-- MSS_SMC_0   -   Actel:DirectCore:CORESDR_AXI:2.0.116
MSS_SMC_0 : CORESDR_AXI
    generic map( 
        AUTO_PCH              => ( 0 ),
        CL                    => ( 2 ),
        DELAY                 => ( 6800 ),
        FAMILY                => ( 19 ),
        MRD                   => ( 2 ),
        RAS                   => ( 2 ),
        RC                    => ( 8 ),
        RCD                   => ( 2 ),
        REF                   => ( 4096 ),
        REGDIMM               => ( 0 ),
        RFC                   => ( 9 ),
        RP                    => ( 3 ),
        RRD                   => ( 2 ),
        SDRAM_BANKSTATMODULES => ( 4 ),
        SDRAM_CHIPBITS        => ( 1 ),
        SDRAM_CHIPS           => ( 1 ),
        SDRAM_COLBITS         => ( 8 ),
        SDRAM_DQSIZE          => ( 16 ),
        SDRAM_ROWBITS         => ( 12 ),
        WR                    => ( 2 )
        )
    port map( 
        -- Inputs
        ACLK    => FAB_CCC_GL2_net_0,
        ARESETN => MSS_READY_net_0,
        AWVALID => COREAXI_0_AXImslave16_AWVALID,
        WLAST   => COREAXI_0_AXImslave16_WLAST,
        WVALID  => COREAXI_0_AXImslave16_WVALID,
        BREADY  => COREAXI_0_AXImslave16_BREADY,
        ARVALID => COREAXI_0_AXImslave16_ARVALID,
        RREADY  => COREAXI_0_AXImslave16_RREADY,
        AWID    => COREAXI_0_AXImslave16_AWID_0,
        AWADDR  => COREAXI_0_AXImslave16_AWADDR,
        AWLEN   => COREAXI_0_AXImslave16_AWLEN,
        AWSIZE  => COREAXI_0_AXImslave16_AWSIZE,
        AWBURST => COREAXI_0_AXImslave16_AWBURST,
        AWLOCK  => COREAXI_0_AXImslave16_AWLOCK,
        WID     => COREAXI_0_AXImslave16_WID_0,
        WDATA   => COREAXI_0_AXImslave16_WDATA,
        WSTRB   => COREAXI_0_AXImslave16_WSTRB,
        ARID    => COREAXI_0_AXImslave16_ARID_0,
        ARADDR  => COREAXI_0_AXImslave16_ARADDR,
        ARLEN   => COREAXI_0_AXImslave16_ARLEN,
        ARSIZE  => COREAXI_0_AXImslave16_ARSIZE,
        ARBURST => COREAXI_0_AXImslave16_ARBURST,
        ARLOCK  => COREAXI_0_AXImslave16_ARLOCK,
        -- Outputs
        AWREADY => COREAXI_0_AXImslave16_AWREADY,
        WREADY  => COREAXI_0_AXImslave16_WREADY,
        BVALID  => COREAXI_0_AXImslave16_BVALID,
        ARREADY => COREAXI_0_AXImslave16_ARREADY,
        RLAST   => COREAXI_0_AXImslave16_RLAST,
        RVALID  => COREAXI_0_AXImslave16_RVALID,
        SDRCLK  => SDRCLK_net_0,
        OE      => OE_net_0,
        CKE     => CKE_net_0,
        RAS_N   => RAS_N_net_0,
        CAS_N   => CAS_N_net_0,
        WE_N    => WE_N_net_0,
        BID     => COREAXI_0_AXImslave16_BID,
        BRESP   => COREAXI_0_AXImslave16_BRESP,
        RID     => COREAXI_0_AXImslave16_RID,
        RDATA   => COREAXI_0_AXImslave16_RDATA,
        RRESP   => COREAXI_0_AXImslave16_RRESP,
        SA      => SA_net_0,
        BA      => BA_net_0,
        CS_N    => CS_N_net_0,
        DQM     => DQM_net_0,
        -- Inouts
        DQ      => DQ 
        );
-- SYSRESET_POR
SYSRESET_POR : SYSRESET
    port map( 
        -- Inputs
        DEVRST_N         => DEVRST_N,
        -- Outputs
        POWER_ON_RESET_N => POWER_ON_RESET_N_net_0 
        );
-- top_sb_MSS_0
top_sb_MSS_0 : top_sb_MSS
    port map( 
        -- Inputs
        MCCC_CLK_BASE            => FAB_CCC_GL2_net_0,
        MMUART_0_RXD             => MMUART_0_RXD,
        MCCC_CLK_BASE_PLL_LOCK   => FAB_CCC_LOCK_net_0,
        MSS_RESET_N_F2M          => CORERESETP_0_RESET_N_F2M,
        MDDR_SMC_AHB_M_HRESP     => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HRESP_0,
        MDDR_SMC_AHB_M_HREADY    => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HREADY,
        FIC_2_APB_M_PREADY       => VCC_net, -- tied to '1' from definition
        FIC_2_APB_M_PSLVERR      => GND_net, -- tied to '0' from definition
        GPIO_29_IN               => GPIO_29_IN,
        MDDR_SMC_AHB_M_HRDATA    => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HRDATA,
        FIC_2_APB_M_PRDATA       => FIC_2_APB_M_PRDATA_const_net_0, -- tied to X"0" from definition
        -- Outputs
        MMUART_0_TXD             => MMUART_0_TXD_net_0,
        MSS_RESET_N_M2F          => top_sb_MSS_TMP_0_MSS_RESET_N_M2F,
        MDDR_SMC_AHB_M_HMASTLOCK => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HLOCK,
        MDDR_SMC_AHB_M_HWRITE    => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HWRITE,
        FIC_2_APB_M_PRESET_N     => top_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N,
        FIC_2_APB_M_PCLK         => OPEN,
        FIC_2_APB_M_PWRITE       => OPEN,
        FIC_2_APB_M_PENABLE      => OPEN,
        FIC_2_APB_M_PSEL         => OPEN,
        GPIO_8_OUT               => GPIO_8_OUT_net_0,
        GPIO_9_OUT               => GPIO_9_OUT_net_0,
        GPIO_10_OUT              => GPIO_10_OUT_net_0,
        GPIO_11_OUT              => GPIO_11_OUT_net_0,
        GPIO_12_OUT              => GPIO_12_OUT_net_0,
        GPIO_13_OUT              => GPIO_13_OUT_net_0,
        GPIO_14_OUT              => GPIO_14_OUT_net_0,
        GPIO_15_OUT              => GPIO_15_OUT_net_0,
        GPIO_16_OUT              => GPIO_16_OUT_net_0,
        GPIO_25_OUT              => GPIO_25_OUT_net_0,
        MDDR_SMC_AHB_M_HBURST    => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HBURST,
        MDDR_SMC_AHB_M_HTRANS    => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HTRANS,
        MDDR_SMC_AHB_M_HSIZE     => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HSIZE,
        MDDR_SMC_AHB_M_HWDATA    => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HWDATA,
        MDDR_SMC_AHB_M_HADDR     => top_sb_MSS_TMP_0_MDDR_SMC_AHB_MASTER_HADDR,
        FIC_2_APB_M_PADDR        => OPEN,
        FIC_2_APB_M_PWDATA       => OPEN 
        );

end RTL;
