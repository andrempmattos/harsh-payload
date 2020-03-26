-- ****************************************************************************/
-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description: CoreAXI - Multi - Master AXI bus interface that supports 
--                        up to 16 slaves 
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
   
ENTITY top_sb_COREAXI_0_COREAXI IS
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
      AWADDR_M0               : IN std_logic_vector(31 DOWNTO 0);   
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
      WDATA_M0                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      WSTRB_M0                : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
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
      ARADDR_M0               : IN std_logic_vector(31 DOWNTO 0);   
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
      RDATA_M0                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      RRESP_M0                : OUT std_logic_vector(1 DOWNTO 0);   
      RLAST_M0                : OUT std_logic;   
      RVALID_M0               : OUT std_logic;   
      RREADY_M0               : IN std_logic;   
      -- MASTER 1
-- AXI MASTER 0 write address channel signals

      AWID_M1                 : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);   
      AWADDR_M1               : IN std_logic_vector(31 DOWNTO 0);   
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
      WDATA_M1                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      WSTRB_M1                : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
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
      ARADDR_M1               : IN std_logic_vector(31 DOWNTO 0);   
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
      RDATA_M1                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      RRESP_M1                : OUT std_logic_vector(1 DOWNTO 0);   
      RLAST_M1                : OUT std_logic;   
      RVALID_M1               : OUT std_logic;   
      RREADY_M1               : IN std_logic;   
      -- MASTER 2
-- AXI MASTER 0 write address channel signals

      AWID_M2                 : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);   
      AWADDR_M2               : IN std_logic_vector(31 DOWNTO 0);   
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
      WDATA_M2                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      WSTRB_M2                : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
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
      ARADDR_M2               : IN std_logic_vector(31 DOWNTO 0);   
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
      RDATA_M2                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      RRESP_M2                : OUT std_logic_vector(1 DOWNTO 0);   
      RLAST_M2                : OUT std_logic;   
      RVALID_M2               : OUT std_logic;   
      RREADY_M2               : IN std_logic;   
      -- MASTER 3
-- AXI MASTER 0 write address channel signals

      AWID_M3                 : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);   
      AWADDR_M3               : IN std_logic_vector(31 DOWNTO 0);   
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
      WDATA_M3                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      WSTRB_M3                : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
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
      ARADDR_M3               : IN std_logic_vector(31 DOWNTO 0);   
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
      RDATA_M3                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      RRESP_M3                : OUT std_logic_vector(1 DOWNTO 0);   
      RLAST_M3                : OUT std_logic;   
      RVALID_M3               : OUT std_logic;   
      RREADY_M3               : IN std_logic;   
      -- SLAVE 0
-- AXI SLAVE 0 write address channel signals

      AWID_S0                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      AWADDR_S0               : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_S0                : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_S0               : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_S0              : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_S0               : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_S0              : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_S0               : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_S0              : OUT std_logic;   
      AWREADY_S0              : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_S0                  : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      WDATA_S0                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S0                : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_S0                : OUT std_logic;   
      WVALID_S0               : OUT std_logic;   
      WREADY_S0               : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_S0                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      BRESP_S0                : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_S0               : IN std_logic;   
      BREADY_S0               : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_S0                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      ARADDR_S0               : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_S0                : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_S0               : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_S0              : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_S0               : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_S0              : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_S0               : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_S0              : OUT std_logic;   
      ARREADY_S0              : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_S0                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      RDATA_S0                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_S0                : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_S0                : IN std_logic;   
      RVALID_S0               : IN std_logic;   
      RREADY_S0               : OUT std_logic;   
      -- SLAVE 1
-- AXI SLAVE 1 write address channel signals

      AWID_S1                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      AWADDR_S1               : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_S1                : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_S1               : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_S1              : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_S1               : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_S1              : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_S1               : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_S1              : OUT std_logic;   
      AWREADY_S1              : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_S1                  : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      WDATA_S1                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S1                : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_S1                : OUT std_logic;   
      WVALID_S1               : OUT std_logic;   
      WREADY_S1               : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_S1                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      BRESP_S1                : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_S1               : IN std_logic;   
      BREADY_S1               : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_S1                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      ARADDR_S1               : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_S1                : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_S1               : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_S1              : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_S1               : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_S1              : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_S1               : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_S1              : OUT std_logic;   
      ARREADY_S1              : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_S1                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      RDATA_S1                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_S1                : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_S1                : IN std_logic;   
      RVALID_S1               : IN std_logic;   
      RREADY_S1               : OUT std_logic;   
      -- SLAVE 2
-- AXI SLAVE 2 write address channel signals

      AWID_S2                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      AWADDR_S2               : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_S2                : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_S2               : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_S2              : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_S2               : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_S2              : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_S2               : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_S2              : OUT std_logic;   
      AWREADY_S2              : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_S2                  : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      WDATA_S2                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S2                : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_S2                : OUT std_logic;   
      WVALID_S2               : OUT std_logic;   
      WREADY_S2               : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_S2                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      BRESP_S2                : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_S2               : IN std_logic;   
      BREADY_S2               : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_S2                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      ARADDR_S2               : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_S2                : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_S2               : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_S2              : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_S2               : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_S2              : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_S2               : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_S2              : OUT std_logic;   
      ARREADY_S2              : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_S2                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      RDATA_S2                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_S2                : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_S2                : IN std_logic;   
      RVALID_S2               : IN std_logic;   
      RREADY_S2               : OUT std_logic;   
      -- SLAVE 3
-- AXI SLAVE 3 write address channel signals

      AWID_S3                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      AWADDR_S3               : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_S3                : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_S3               : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_S3              : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_S3               : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_S3              : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_S3               : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_S3              : OUT std_logic;   
      AWREADY_S3              : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_S3                  : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      WDATA_S3                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S3                : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_S3                : OUT std_logic;   
      WVALID_S3               : OUT std_logic;   
      WREADY_S3               : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_S3                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      BRESP_S3                : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_S3               : IN std_logic;   
      BREADY_S3               : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_S3                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      ARADDR_S3               : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_S3                : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_S3               : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_S3              : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_S3               : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_S3              : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_S3               : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_S3              : OUT std_logic;   
      ARREADY_S3              : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_S3                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      RDATA_S3                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_S3                : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_S3                : IN std_logic;   
      RVALID_S3               : IN std_logic;   
      RREADY_S3               : OUT std_logic;   
      -- SLAVE 4
-- AXI SLAVE 4 write address channel signals

      AWID_S4                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      AWADDR_S4               : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_S4                : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_S4               : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_S4              : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_S4               : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_S4              : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_S4               : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_S4              : OUT std_logic;   
      AWREADY_S4              : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_S4                  : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      WDATA_S4                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S4                : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_S4                : OUT std_logic;   
      WVALID_S4               : OUT std_logic;   
      WREADY_S4               : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_S4                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      BRESP_S4                : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_S4               : IN std_logic;   
      BREADY_S4               : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_S4                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      ARADDR_S4               : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_S4                : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_S4               : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_S4              : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_S4               : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_S4              : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_S4               : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_S4              : OUT std_logic;   
      ARREADY_S4              : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_S4                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      RDATA_S4                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_S4                : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_S4                : IN std_logic;   
      RVALID_S4               : IN std_logic;   
      RREADY_S4               : OUT std_logic;   
      -- SLAVE 5
-- AXI SLAVE 5 write address channel signals

      AWID_S5                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      AWADDR_S5               : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_S5                : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_S5               : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_S5              : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_S5               : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_S5              : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_S5               : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_S5              : OUT std_logic;   
      AWREADY_S5              : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_S5                  : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      WDATA_S5                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S5                : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_S5                : OUT std_logic;   
      WVALID_S5               : OUT std_logic;   
      WREADY_S5               : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_S5                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      BRESP_S5                : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_S5               : IN std_logic;   
      BREADY_S5               : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_S5                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      ARADDR_S5               : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_S5                : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_S5               : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_S5              : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_S5               : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_S5              : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_S5               : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_S5              : OUT std_logic;   
      ARREADY_S5              : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_S5                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      RDATA_S5                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_S5                : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_S5                : IN std_logic;   
      RVALID_S5               : IN std_logic;   
      RREADY_S5               : OUT std_logic;   
      -- SLAVE 6
-- AXI SLAVE 6 write address channel signals

      AWID_S6                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      AWADDR_S6               : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_S6                : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_S6               : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_S6              : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_S6               : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_S6              : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_S6               : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_S6              : OUT std_logic;   
      AWREADY_S6              : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_S6                  : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      WDATA_S6                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S6                : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_S6                : OUT std_logic;   
      WVALID_S6               : OUT std_logic;   
      WREADY_S6               : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_S6                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      BRESP_S6                : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_S6               : IN std_logic;   
      BREADY_S6               : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_S6                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      ARADDR_S6               : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_S6                : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_S6               : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_S6              : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_S6               : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_S6              : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_S6               : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_S6              : OUT std_logic;   
      ARREADY_S6              : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_S6                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      RDATA_S6                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_S6                : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_S6                : IN std_logic;   
      RVALID_S6               : IN std_logic;   
      RREADY_S6               : OUT std_logic;   
      -- SLAVE 7
-- AXI SLAVE 7 write address channel signals

      AWID_S7                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      AWADDR_S7               : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_S7                : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_S7               : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_S7              : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_S7               : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_S7              : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_S7               : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_S7              : OUT std_logic;   
      AWREADY_S7              : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_S7                  : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      WDATA_S7                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S7                : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_S7                : OUT std_logic;   
      WVALID_S7               : OUT std_logic;   
      WREADY_S7               : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_S7                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      BRESP_S7                : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_S7               : IN std_logic;   
      BREADY_S7               : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_S7                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      ARADDR_S7               : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_S7                : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_S7               : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_S7              : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_S7               : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_S7              : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_S7               : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_S7              : OUT std_logic;   
      ARREADY_S7              : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_S7                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      RDATA_S7                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_S7                : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_S7                : IN std_logic;   
      RVALID_S7               : IN std_logic;   
      RREADY_S7               : OUT std_logic;   
      -- SLAVE 8
-- AXI SLAVE 8 write address channel signals

      AWID_S8                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      AWADDR_S8               : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_S8                : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_S8               : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_S8              : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_S8               : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_S8              : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_S8               : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_S8              : OUT std_logic;   
      AWREADY_S8              : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_S8                  : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      WDATA_S8                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S8                : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_S8                : OUT std_logic;   
      WVALID_S8               : OUT std_logic;   
      WREADY_S8               : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_S8                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      BRESP_S8                : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_S8               : IN std_logic;   
      BREADY_S8               : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_S8                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      ARADDR_S8               : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_S8                : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_S8               : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_S8              : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_S8               : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_S8              : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_S8               : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_S8              : OUT std_logic;   
      ARREADY_S8              : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_S8                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      RDATA_S8                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_S8                : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_S8                : IN std_logic;   
      RVALID_S8               : IN std_logic;   
      RREADY_S8               : OUT std_logic;   
      -- SLAVE 9
-- AXI SLAVE 9 write address channel signals

      AWID_S9                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      AWADDR_S9               : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_S9                : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_S9               : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_S9              : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_S9               : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_S9              : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_S9               : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_S9              : OUT std_logic;   
      AWREADY_S9              : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_S9                  : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      WDATA_S9                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S9                : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_S9                : OUT std_logic;   
      WVALID_S9               : OUT std_logic;   
      WREADY_S9               : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_S9                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      BRESP_S9                : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_S9               : IN std_logic;   
      BREADY_S9               : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_S9                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      ARADDR_S9               : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_S9                : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_S9               : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_S9              : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_S9               : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_S9              : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_S9               : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_S9              : OUT std_logic;   
      ARREADY_S9              : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_S9                  : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      RDATA_S9                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_S9                : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_S9                : IN std_logic;   
      RVALID_S9               : IN std_logic;   
      RREADY_S9               : OUT std_logic;   
      -- SLAVE 10
-- AXI SLAVE 10 write address channel signals

      AWID_S10                : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      AWADDR_S10              : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_S10               : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_S10              : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_S10             : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_S10              : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_S10             : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_S10              : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_S10             : OUT std_logic;   
      AWREADY_S10             : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_S10                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      WDATA_S10               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S10               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_S10               : OUT std_logic;   
      WVALID_S10              : OUT std_logic;   
      WREADY_S10              : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_S10                 : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      BRESP_S10               : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_S10              : IN std_logic;   
      BREADY_S10              : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_S10                : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      ARADDR_S10              : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_S10               : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_S10              : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_S10             : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_S10              : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_S10             : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_S10              : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_S10             : OUT std_logic;   
      ARREADY_S10             : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_S10                 : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      RDATA_S10               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_S10               : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_S10               : IN std_logic;   
      RVALID_S10              : IN std_logic;   
      RREADY_S10              : OUT std_logic;   
      -- SLAVE 11
-- AXI SLAVE 11 write address channel signals

      AWID_S11                : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      AWADDR_S11              : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_S11               : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_S11              : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_S11             : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_S11              : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_S11             : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_S11              : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_S11             : OUT std_logic;   
      AWREADY_S11             : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_S11                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      WDATA_S11               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S11               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_S11               : OUT std_logic;   
      WVALID_S11              : OUT std_logic;   
      WREADY_S11              : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_S11                 : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      BRESP_S11               : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_S11              : IN std_logic;   
      BREADY_S11              : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_S11                : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      ARADDR_S11              : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_S11               : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_S11              : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_S11             : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_S11              : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_S11             : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_S11              : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_S11             : OUT std_logic;   
      ARREADY_S11             : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_S11                 : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      RDATA_S11               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_S11               : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_S11               : IN std_logic;   
      RVALID_S11              : IN std_logic;   
      RREADY_S11              : OUT std_logic;   
      -- SLAVE 12
-- AXI SLAVE 12 write address channel signals

      AWID_S12                : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      AWADDR_S12              : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_S12               : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_S12              : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_S12             : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_S12              : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_S12             : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_S12              : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_S12             : OUT std_logic;   
      AWREADY_S12             : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_S12                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      WDATA_S12               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S12               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_S12               : OUT std_logic;   
      WVALID_S12              : OUT std_logic;   
      WREADY_S12              : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_S12                 : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      BRESP_S12               : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_S12              : IN std_logic;   
      BREADY_S12              : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_S12                : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      ARADDR_S12              : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_S12               : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_S12              : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_S12             : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_S12              : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_S12             : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_S12              : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_S12             : OUT std_logic;   
      ARREADY_S12             : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_S12                 : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      RDATA_S12               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_S12               : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_S12               : IN std_logic;   
      RVALID_S12              : IN std_logic;   
      RREADY_S12              : OUT std_logic;   
      -- SLAVE 13
-- AXI SLAVE 13 write address channel signals

      AWID_S13                : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      AWADDR_S13              : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_S13               : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_S13              : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_S13             : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_S13              : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_S13             : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_S13              : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_S13             : OUT std_logic;   
      AWREADY_S13             : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_S13                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      WDATA_S13               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S13               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_S13               : OUT std_logic;   
      WVALID_S13              : OUT std_logic;   
      WREADY_S13              : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_S13                 : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      BRESP_S13               : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_S13              : IN std_logic;   
      BREADY_S13              : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_S13                : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      ARADDR_S13              : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_S13               : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_S13              : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_S13             : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_S13              : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_S13             : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_S13              : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_S13             : OUT std_logic;   
      ARREADY_S13             : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_S13                 : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      RDATA_S13               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_S13               : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_S13               : IN std_logic;   
      RVALID_S13              : IN std_logic;   
      RREADY_S13              : OUT std_logic;   
      -- SLAVE 14
-- AXI SLAVE 14 write address channel signals

      AWID_S14                : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      AWADDR_S14              : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_S14               : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_S14              : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_S14             : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_S14              : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_S14             : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_S14              : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_S14             : OUT std_logic;   
      AWREADY_S14             : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_S14                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      WDATA_S14               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S14               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_S14               : OUT std_logic;   
      WVALID_S14              : OUT std_logic;   
      WREADY_S14              : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_S14                 : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      BRESP_S14               : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_S14              : IN std_logic;   
      BREADY_S14              : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_S14                : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      ARADDR_S14              : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_S14               : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_S14              : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_S14             : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_S14              : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_S14             : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_S14              : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_S14             : OUT std_logic;   
      ARREADY_S14             : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_S14                 : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      RDATA_S14               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_S14               : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_S14               : IN std_logic;   
      RVALID_S14              : IN std_logic;   
      RREADY_S14              : OUT std_logic;   
      -- SLAVE 15
-- AXI SLAVE 15 write address channel signals

      AWID_S15                : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      AWADDR_S15              : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_S15               : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_S15              : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_S15             : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_S15              : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_S15             : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_S15              : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_S15             : OUT std_logic;   
      AWREADY_S15             : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_S15                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      WDATA_S15               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S15               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_S15               : OUT std_logic;   
      WVALID_S15              : OUT std_logic;   
      WREADY_S15              : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_S15                 : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      BRESP_S15               : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_S15              : IN std_logic;   
      BREADY_S15              : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_S15                : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      ARADDR_S15              : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_S15               : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_S15              : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_S15             : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_S15              : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_S15             : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_S15              : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_S15             : OUT std_logic;   
      ARREADY_S15             : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_S15                 : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      RDATA_S15               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_S15               : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_S15               : IN std_logic;   
      RVALID_S15              : IN std_logic;   
      RREADY_S15              : OUT std_logic;   
      -- SLAVE 16
-- AXI SLAVE 16 write address channel signals

      AWID_S16                : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      AWADDR_S16              : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_S16               : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_S16              : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_S16             : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_S16              : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_S16             : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_S16              : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_S16             : OUT std_logic;   
      AWREADY_S16             : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_S16                 : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      WDATA_S16               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S16               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_S16               : OUT std_logic;   
      WVALID_S16              : OUT std_logic;   
      WREADY_S16              : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_S16                 : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      BRESP_S16               : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_S16              : IN std_logic;   
      BREADY_S16              : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_S16                : OUT std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      ARADDR_S16              : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_S16               : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_S16              : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_S16             : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_S16              : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_S16             : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_S16              : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_S16             : OUT std_logic;   
      ARREADY_S16             : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_S16                 : IN std_logic_vector(ID_WIDTH + 1 DOWNTO 0);   
      RDATA_S16               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_S16               : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_S16               : IN std_logic;   
      RVALID_S16              : IN std_logic;   
      RREADY_S16              : OUT std_logic);   
END ENTITY top_sb_COREAXI_0_COREAXI;

ARCHITECTURE translated OF top_sb_COREAXI_0_COREAXI IS
    FUNCTION AWIDTH_CALC1 (x : integer) RETURN integer is 
    BEGIN
	IF x = 1 THEN
            RETURN 32;
	ELSIF x = 2 THEN
            RETURN 28;
	ELSIF x = 3 THEN
            RETURN 24;
	ELSIF x = 4 THEN
            RETURN 20;
	ELSIF x = 5 THEN
            RETURN 16;
	ELSIF x = 6 THEN
            RETURN 12;
    ELSE
            RETURN 32;
    END IF;
    END FUNCTION AWIDTH_CALC1;

   CONSTANT AWIDTH1 : integer := AWIDTH_CALC1(MEMSPACE);
   CONSTANT AWIDTH2 : integer := AWIDTH_CALC1(HGS_CFG);
   CONSTANT SYNC_RESET :  integer := SYNC_MODE_SEL(FAMILY); 

    FUNCTION AWIDTH_CALC2 (x : integer) RETURN integer is 
      BEGIN
	    IF x > 0 THEN
            RETURN AWIDTH1;
    	ELSIF X = 0 THEN
            RETURN AWIDTH2;
        END IF;
    END FUNCTION AWIDTH_CALC2;

   CONSTANT AXI_AWIDTH : integer := AWIDTH_CALC2(MEMSPACE);
--   CONSTANT AWIDTH1 : integer := 32 WHEN (MEMSPACE = 1) ELSE (28 WHEN (MEMSPACE = 2) ELSE (24 WHEN (MEMSPACE = 3) ELSE (20 WHEN (MEMSPACE = 4) ELSE (16 WHEN (MEMSPACE = 5) ELSE (12 WHEN (MEMSPACE = 6) ELSE 32)))));
   --   localparam AWIDTH2 = (HGS_CFG == 1 ) ? 32 : ((HGS_CFG == 2 ) ? 28 : ((HGS_CFG == 3 ) ? 24 : ((HGS_CFG == 4 ) ? 20 : ((HGS_CFG == 5 ) ? 16 : ((HGS_CFG == 6 ) ? 12 : 32)))));
   --   localparam AXI_AWIDTH           = (MEMSPACE == 0) ? AWIDTH2 : AWIDTH1;   CONSTANT  AXI_STRBWIDTH         :  integer := AXI_DWIDTH / 8;    
   CONSTANT  BASE_ID_WIDTH         :  integer := 2;    
--   CONSTANT  SINGLE_MASTER         :  integer := (1 WHEN (NUM_MASTER_SLOT = 1) ELSE 0);    
--   CONSTANT  SINGLE_SLAVE          :  integer := (1 WHEN (NUM_SLAVE_SLOT  = 1) ELSE 0);    
--   CONSTANT  SINGLE_MASTER_SINGLE_SLAVE     :  integer := ((1 WHEN (NUM_SLAVE_SLOT = 1) ELSE 0) WHEN (NUM_MASTER_SLOT = 1) ELSE 0);    
--   CONSTANT  COMB_REG              :  integer:=to_integer ((SC_0) & (SC_1) & (SC_2) & (SC_3) & (SC_4) & (SC_5) & (SC_6) & (SC_7) & (SC_8) & (SC_9) & (SC_10) & (SC_11) & (SC_12) & (SC_13) & (SC_14) & (SC_15));    
   CONSTANT  AXI_STRBWIDTH         :  integer := AXI_DWIDTH / 8;    
   CONSTANT  NUM_SLAVE_SLOT        :  integer := 16;    
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
   CONSTANT  WR_ACCEPTANCE         :  integer := 4;    

   COMPONENT axi_feedthrough
      GENERIC (
         -- --------------------------------------------------------------------------
         -- Parameter Declaration
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
         BASE_ID_WIDTH                  :  integer := 2);    
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
         WDATA_M0                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_M0                : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 
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
         RDATA_M0                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_M0                : OUT std_logic_vector(1 DOWNTO 0);   
         RLAST_M0                : OUT std_logic;   
         RVALID_M0               : OUT std_logic;   
         RREADY_M0               : IN std_logic;   
         -- SLAVE 0
-- AXI SLAVE 0 write address channel signals

         AWID_S0                 : OUT std_logic_vector(BASE_ID_WIDTH + 
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

         WID_S0                  : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_S0                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_S0                : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_S0                : OUT std_logic;   
         WVALID_S0               : OUT std_logic;   
         WREADY_S0               : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_S0                  : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_S0                : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_S0               : IN std_logic;   
         BREADY_S0               : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_S0                 : OUT std_logic_vector(BASE_ID_WIDTH + 
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

         RID_S0                  : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_S0                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_S0                : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_S0                : IN std_logic;   
         RVALID_S0               : IN std_logic;   
         RREADY_S0               : OUT std_logic);
   END COMPONENT;


   COMPONENT axi_master_stage
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
         UID_WIDTH                      :  std_logic_vector(1 DOWNTO 0) := 
         "00";    
         BASE_ID_WIDTH                  :  integer := 2);    
      PORT (
         -- --------------------------------------------------------------------------
-- I/O Declaration
-- --------------------------------------------------------------------------
-- Global signals

         ACLK                    : IN std_logic;   
         ARESETN                 : IN std_logic;   
         -- MASTER 0
-- AXI MASTER 0 write address channel signals

         AWID_M                  : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
         AWADDR_M                : IN std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_M                 : IN std_logic_vector(3 DOWNTO 0);   
         AWSIZE_M                : IN std_logic_vector(2 DOWNTO 0);   
         AWBURST_M               : IN std_logic_vector(1 DOWNTO 0);   
         AWLOCK_M                : IN std_logic_vector(1 DOWNTO 0);   
         AWCACHE_M               : IN std_logic_vector(3 DOWNTO 0);   
         AWPROT_M                : IN std_logic_vector(2 DOWNTO 0);   
         AWVALID_M               : IN std_logic;   
         AWREADY_M               : OUT std_logic;   
         -- AXI MASTER 0 write data channel signals

         WID_M                   : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
         WDATA_M                 : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_M                 : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 
         0);   
         WLAST_M                 : IN std_logic;   
         WVALID_M                : IN std_logic;   
         WREADY_M                : OUT std_logic;   
         -- AXI MASTER 0 write response channel signals

         BID_M                   : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0); 
         BRESP_M                 : OUT std_logic_vector(1 DOWNTO 0);   
         BVALID_M                : OUT std_logic;   
         BREADY_M                : IN std_logic;   
         -- AXI MASTER 0 read address channel signals

         ARID_M                  : IN std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
         ARADDR_M                : IN std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_M                 : IN std_logic_vector(3 DOWNTO 0);   
         ARSIZE_M                : IN std_logic_vector(2 DOWNTO 0);   
         ARBURST_M               : IN std_logic_vector(1 DOWNTO 0);   
         ARLOCK_M                : IN std_logic_vector(1 DOWNTO 0);   
         ARCACHE_M               : IN std_logic_vector(3 DOWNTO 0);   
         ARPROT_M                : IN std_logic_vector(2 DOWNTO 0);   
         ARVALID_M               : IN std_logic;   
         ARREADY_M               : OUT std_logic;   
         -- AXI MASTER 0 read response channel signals

         RID_M                   : OUT std_logic_vector(ID_WIDTH - 1 DOWNTO 0); 
         RDATA_M                 : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_M                 : OUT std_logic_vector(1 DOWNTO 0);   
         RLAST_M                 : OUT std_logic;   
         RVALID_M                : OUT std_logic;   
         RREADY_M                : IN std_logic;   
         -- SLAVE 0
-- AXI SLAVE 0 write address channel signals

         AWID_MI                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_MI               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_MI                : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_MI               : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_MI              : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_MI               : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_MI              : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_MI               : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_MI              : OUT std_logic;   
         AWREADY_IM              : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_MI                  : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_MI                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_MI                : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_MI                : OUT std_logic;   
         WVALID_MI               : OUT std_logic;   
         WREADY_IM               : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_IM                  : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_IM                : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_IM               : IN std_logic;   
         BREADY_MI               : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_MI                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_MI               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_MI                : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_MI               : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_MI              : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_MI               : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_MI              : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_MI               : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_MI              : OUT std_logic;   
         ARREADY_IM              : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_IM                  : IN std_logic_vector((BASE_ID_WIDTH + 
         ID_WIDTH) - 1 DOWNTO 0);   
         RDATA_IM                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_IM                : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_IM                : IN std_logic;   
         RVALID_IM               : IN std_logic;   
         RREADY_MI               : OUT std_logic;   
         master_rd_end           : OUT std_logic;   
         master_wr_end           : OUT std_logic);
   END COMPONENT;

   COMPONENT axi_slave_stage
      GENERIC (
         -- --------------------------------------------------------------------------
         -- Parameter Declaration
         -- --------------------------------------------------------------------------
         FAMILY                         :  integer := 19;    
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
         BASE_ID_WIDTH                  :  integer := 2);    
      PORT (
         -- --------------------------------------------------------------------------
-- I/O Declaration
-- --------------------------------------------------------------------------
-- Global signals

         ACLK                    : IN std_logic;   
         ARESETN                 : IN std_logic;   
         -- MASTER 0
-- AXI MASTER 0 write address channel signals

         AWID_IS                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         AWADDR_IS               : IN std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_IS                : IN std_logic_vector(3 DOWNTO 0);   
         AWSIZE_IS               : IN std_logic_vector(2 DOWNTO 0);   
         AWBURST_IS              : IN std_logic_vector(1 DOWNTO 0);   
         AWLOCK_IS               : IN std_logic_vector(1 DOWNTO 0);   
         AWCACHE_IS              : IN std_logic_vector(3 DOWNTO 0);   
         AWPROT_IS               : IN std_logic_vector(2 DOWNTO 0);   
         AWVALID_IS              : IN std_logic;   
         AWREADY_SI              : OUT std_logic;   
         -- AXI MASTER 0 write data channel signals

         WID_IS                  : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         WDATA_IS                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_IS                : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 
         0);   
         WLAST_IS                : IN std_logic;   
         WVALID_IS               : IN std_logic;   
         WREADY_SI               : OUT std_logic;   
         -- AXI MASTER 0 write response channel signals

         BID_SI                  : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         BRESP_SI                : OUT std_logic_vector(1 DOWNTO 0);   
         BVALID_SI               : OUT std_logic;   
         BREADY_IS               : IN std_logic;   
         -- AXI MASTER 0 read address channel signals

         ARID_IS                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         ARADDR_IS               : IN std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_IS                : IN std_logic_vector(3 DOWNTO 0);   
         ARSIZE_IS               : IN std_logic_vector(2 DOWNTO 0);   
         ARBURST_IS              : IN std_logic_vector(1 DOWNTO 0);   
         ARLOCK_IS               : IN std_logic_vector(1 DOWNTO 0);   
         ARCACHE_IS              : IN std_logic_vector(3 DOWNTO 0);   
         ARPROT_IS               : IN std_logic_vector(2 DOWNTO 0);   
         ARVALID_IS              : IN std_logic;   
         ARREADY_SI              : OUT std_logic;   
         -- AXI MASTER 0 read response channel signals

         RID_SI                  : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         RDATA_SI                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_SI                : OUT std_logic_vector(1 DOWNTO 0);   
         RLAST_SI                : OUT std_logic;   
         RVALID_SI               : OUT std_logic;   
         RREADY_IS               : IN std_logic;   
         -- SLAVE 0
-- AXI SLAVE 0 write address channel signals

         AWID_S                  : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_S                : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_S                 : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_S                : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_S               : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_S                : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_S               : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_S                : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_S               : OUT std_logic;   
         AWREADY_S               : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_S                   : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_S                 : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_S                 : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_S                 : OUT std_logic;   
         WVALID_S                : OUT std_logic;   
         WREADY_S                : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_S                   : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_S                 : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_S                : IN std_logic;   
         BREADY_S                : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_S                  : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_S                : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_S                 : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_S                : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_S               : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_S                : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_S               : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_S                : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_S               : OUT std_logic;   
         ARREADY_S               : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_S                   : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_S                 : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_S                 : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_S                 : IN std_logic;   
         RVALID_S                : IN std_logic;   
         RREADY_S                : OUT std_logic);
   END COMPONENT;

   COMPONENT axi_interconnect_ntom
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
         BASE_ID_WIDTH                  :  integer := 2);    
      PORT (
         -- --------------------------------------------------------------------------
-- I/O Declaration
-- --------------------------------------------------------------------------
-- Global signals

         ACLK                    : IN std_logic;   
         ARESETN                 : IN std_logic;   
         AWADDR_M0               : IN std_logic_vector(31 DOWNTO 0)
         ;   
         AWVALID_M0              : IN std_logic;   
         AWLOCK_M0               : IN std_logic_vector(1 DOWNTO 0);   
         AWADDR_M1               : IN std_logic_vector(31 DOWNTO 0)
         ;   
         AWVALID_M1              : IN std_logic;   
         AWLOCK_M1               : IN std_logic_vector(1 DOWNTO 0);   
         AWADDR_M2               : IN std_logic_vector(31 DOWNTO 0)
         ;   
         AWVALID_M2              : IN std_logic;   
         AWLOCK_M2               : IN std_logic_vector(1 DOWNTO 0);   
         AWADDR_M3               : IN std_logic_vector(31 DOWNTO 0)
         ;   
         AWVALID_M3              : IN std_logic;   
         AWLOCK_M3               : IN std_logic_vector(1 DOWNTO 0);   
         ARADDR_M0               : IN std_logic_vector(31 DOWNTO 0)
         ;   
         ARLOCK_M0               : IN std_logic_vector(1 DOWNTO 0);   
         ARVALID_M0              : IN std_logic;   
         ARADDR_M1               : IN std_logic_vector(31 DOWNTO 0)
         ;   
         ARLOCK_M1               : IN std_logic_vector(1 DOWNTO 0);   
         ARVALID_M1              : IN std_logic;   
         ARADDR_M2               : IN std_logic_vector(31 DOWNTO 0)
         ;   
         ARLOCK_M2               : IN std_logic_vector(1 DOWNTO 0);   
         ARVALID_M2              : IN std_logic;   
         ARADDR_M3               : IN std_logic_vector(31 DOWNTO 0)
         ;   
         ARLOCK_M3               : IN std_logic_vector(1 DOWNTO 0);   
         ARVALID_M3              : IN std_logic;   
         -- From Master 0
-- AXI write address channel signals

         AWID_MI0                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         AWADDR_MI0              : IN std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_MI0               : IN std_logic_vector(3 DOWNTO 0);   
         AWSIZE_MI0              : IN std_logic_vector(2 DOWNTO 0);   
         AWBURST_MI0             : IN std_logic_vector(1 DOWNTO 0);   
         AWLOCK_MI0              : IN std_logic_vector(1 DOWNTO 0);   
         AWCACHE_MI0             : IN std_logic_vector(3 DOWNTO 0);   
         AWPROT_MI0              : IN std_logic_vector(2 DOWNTO 0);   
         AWVALID_MI0             : IN std_logic;   
         AWREADY_IM0             : OUT std_logic;   
         -- AXI write data channel signals

         WID_MI0                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         WDATA_MI0               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_MI0               : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 
         0);   
         WLAST_MI0               : IN std_logic;   
         WVALID_MI0              : IN std_logic;   
         WREADY_IM0              : OUT std_logic;   
         -- AXI write response channel signals

         BID_IM0                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         BRESP_IM0               : OUT std_logic_vector(1 DOWNTO 0);   
         BVALID_IM0              : OUT std_logic;   
         BREADY_MI0              : IN std_logic;   
         -- AXI read address channel signals

         ARID_MI0                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         ARADDR_MI0              : IN std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_MI0               : IN std_logic_vector(3 DOWNTO 0);   
         ARSIZE_MI0              : IN std_logic_vector(2 DOWNTO 0);   
         ARBURST_MI0             : IN std_logic_vector(1 DOWNTO 0);   
         ARLOCK_MI0              : IN std_logic_vector(1 DOWNTO 0);   
         ARCACHE_MI0             : IN std_logic_vector(3 DOWNTO 0);   
         ARPROT_MI0              : IN std_logic_vector(2 DOWNTO 0);   
         ARVALID_MI0             : IN std_logic;   
         ARREADY_IM0             : OUT std_logic;   
         -- AXI read response channel signals

         RID_IM0                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         RDATA_IM0               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_IM0               : OUT std_logic_vector(1 DOWNTO 0);   
         RLAST_IM0               : OUT std_logic;   
         RVALID_IM0              : OUT std_logic;   
         RREADY_MI0              : IN std_logic;   
         -- From Master 1
-- AXI write address channel signals

         AWID_MI1                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         AWADDR_MI1              : IN std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_MI1               : IN std_logic_vector(3 DOWNTO 0);   
         AWSIZE_MI1              : IN std_logic_vector(2 DOWNTO 0);   
         AWBURST_MI1             : IN std_logic_vector(1 DOWNTO 0);   
         AWLOCK_MI1              : IN std_logic_vector(1 DOWNTO 0);   
         AWCACHE_MI1             : IN std_logic_vector(3 DOWNTO 0);   
         AWPROT_MI1              : IN std_logic_vector(2 DOWNTO 0);   
         AWVALID_MI1             : IN std_logic;   
         AWREADY_IM1             : OUT std_logic;   
         -- AXI write data channel signals

         WID_MI1                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         WDATA_MI1               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_MI1               : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 
         0);   
         WLAST_MI1               : IN std_logic;   
         WVALID_MI1              : IN std_logic;   
         WREADY_IM1              : OUT std_logic;   
         -- AXI write response channel signals

         BID_IM1                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         BRESP_IM1               : OUT std_logic_vector(1 DOWNTO 0);   
         BVALID_IM1              : OUT std_logic;   
         BREADY_MI1              : IN std_logic;   
         -- AXI read address channel signals

         ARID_MI1                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         ARADDR_MI1              : IN std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_MI1               : IN std_logic_vector(3 DOWNTO 0);   
         ARSIZE_MI1              : IN std_logic_vector(2 DOWNTO 0);   
         ARBURST_MI1             : IN std_logic_vector(1 DOWNTO 0);   
         ARLOCK_MI1              : IN std_logic_vector(1 DOWNTO 0);   
         ARCACHE_MI1             : IN std_logic_vector(3 DOWNTO 0);   
         ARPROT_MI1              : IN std_logic_vector(2 DOWNTO 0);   
         ARVALID_MI1             : IN std_logic;   
         ARREADY_IM1             : OUT std_logic;   
         -- AXI read response channel signals

         RID_IM1                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         RDATA_IM1               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_IM1               : OUT std_logic_vector(1 DOWNTO 0);   
         RLAST_IM1               : OUT std_logic;   
         RVALID_IM1              : OUT std_logic;   
         RREADY_MI1              : IN std_logic;   
         -- From Master 2
-- AXI write address channel signals

         AWID_MI2                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         AWADDR_MI2              : IN std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_MI2               : IN std_logic_vector(3 DOWNTO 0);   
         AWSIZE_MI2              : IN std_logic_vector(2 DOWNTO 0);   
         AWBURST_MI2             : IN std_logic_vector(1 DOWNTO 0);   
         AWLOCK_MI2              : IN std_logic_vector(1 DOWNTO 0);   
         AWCACHE_MI2             : IN std_logic_vector(3 DOWNTO 0);   
         AWPROT_MI2              : IN std_logic_vector(2 DOWNTO 0);   
         AWVALID_MI2             : IN std_logic;   
         AWREADY_IM2             : OUT std_logic;   
         -- AXI write data channel signals

         WID_MI2                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         WDATA_MI2               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_MI2               : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 
         0);   
         WLAST_MI2               : IN std_logic;   
         WVALID_MI2              : IN std_logic;   
         WREADY_IM2              : OUT std_logic;   
         -- AXI write response channel signals

         BID_IM2                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         BRESP_IM2               : OUT std_logic_vector(1 DOWNTO 0);   
         BVALID_IM2              : OUT std_logic;   
         BREADY_MI2              : IN std_logic;   
         -- AXI read address channel signals

         ARID_MI2                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         ARADDR_MI2              : IN std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_MI2               : IN std_logic_vector(3 DOWNTO 0);   
         ARSIZE_MI2              : IN std_logic_vector(2 DOWNTO 0);   
         ARBURST_MI2             : IN std_logic_vector(1 DOWNTO 0);   
         ARLOCK_MI2              : IN std_logic_vector(1 DOWNTO 0);   
         ARCACHE_MI2             : IN std_logic_vector(3 DOWNTO 0);   
         ARPROT_MI2              : IN std_logic_vector(2 DOWNTO 0);   
         ARVALID_MI2             : IN std_logic;   
         ARREADY_IM2             : OUT std_logic;   
         -- AXI read response channel signals

         RID_IM2                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         RDATA_IM2               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_IM2               : OUT std_logic_vector(1 DOWNTO 0);   
         RLAST_IM2               : OUT std_logic;   
         RVALID_IM2              : OUT std_logic;   
         RREADY_MI2              : IN std_logic;   
         -- From Master 3
-- AXI write address channel signals

         AWID_MI3                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         AWADDR_MI3              : IN std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_MI3               : IN std_logic_vector(3 DOWNTO 0);   
         AWSIZE_MI3              : IN std_logic_vector(2 DOWNTO 0);   
         AWBURST_MI3             : IN std_logic_vector(1 DOWNTO 0);   
         AWLOCK_MI3              : IN std_logic_vector(1 DOWNTO 0);   
         AWCACHE_MI3             : IN std_logic_vector(3 DOWNTO 0);   
         AWPROT_MI3              : IN std_logic_vector(2 DOWNTO 0);   
         AWVALID_MI3             : IN std_logic;   
         AWREADY_IM3             : OUT std_logic;   
         -- AXI write data channel signals

         WID_MI3                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         WDATA_MI3               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_MI3               : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 
         0);   
         WLAST_MI3               : IN std_logic;   
         WVALID_MI3              : IN std_logic;   
         WREADY_IM3              : OUT std_logic;   
         -- AXI write response channel signals

         BID_IM3                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         BRESP_IM3               : OUT std_logic_vector(1 DOWNTO 0);   
         BVALID_IM3              : OUT std_logic;   
         BREADY_MI3              : IN std_logic;   
         -- AXI read address channel signals

         ARID_MI3                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         ARADDR_MI3              : IN std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_MI3               : IN std_logic_vector(3 DOWNTO 0);   
         ARSIZE_MI3              : IN std_logic_vector(2 DOWNTO 0);   
         ARBURST_MI3             : IN std_logic_vector(1 DOWNTO 0);   
         ARLOCK_MI3              : IN std_logic_vector(1 DOWNTO 0);   
         ARCACHE_MI3             : IN std_logic_vector(3 DOWNTO 0);   
         ARPROT_MI3              : IN std_logic_vector(2 DOWNTO 0);   
         ARVALID_MI3             : IN std_logic;   
         ARREADY_IM3             : OUT std_logic;   
         -- AXI read response channel signals

         RID_IM3                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         RDATA_IM3               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_IM3               : OUT std_logic_vector(1 DOWNTO 0);   
         RLAST_IM3               : OUT std_logic;   
         RVALID_IM3              : OUT std_logic;   
         RREADY_MI3              : IN std_logic;   
         -- SLAVE 0
-- AXI SLAVE 0 write address channel signals

         AWID_IS0                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_IS0              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_IS0               : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_IS0              : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_IS0             : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_IS0              : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_IS0             : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_IS0              : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_IS0             : OUT std_logic;   
         AWREADY_SI0             : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_IS0                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_IS0               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_IS0               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_IS0               : OUT std_logic;   
         WVALID_IS0              : OUT std_logic;   
         WREADY_SI0              : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_SI0                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_SI0               : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_SI0              : IN std_logic;   
         BREADY_IS0              : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_IS0                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_IS0              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_IS0               : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_IS0              : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_IS0             : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_IS0              : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_IS0             : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_IS0              : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_IS0             : OUT std_logic;   
         ARREADY_SI0             : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_SI0                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_SI0               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_SI0               : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_SI0               : IN std_logic;   
         RVALID_SI0              : IN std_logic;   
         RREADY_IS0              : OUT std_logic;   
         -- SLAVE 1
-- AXI SLAVE 1 write address channel signals

         AWID_IS1                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_IS1              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_IS1               : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_IS1              : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_IS1             : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_IS1              : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_IS1             : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_IS1              : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_IS1             : OUT std_logic;   
         AWREADY_SI1             : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_IS1                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_IS1               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_IS1               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_IS1               : OUT std_logic;   
         WVALID_IS1              : OUT std_logic;   
         WREADY_SI1              : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_SI1                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_SI1               : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_SI1              : IN std_logic;   
         BREADY_IS1              : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_IS1                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_IS1              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_IS1               : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_IS1              : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_IS1             : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_IS1              : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_IS1             : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_IS1              : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_IS1             : OUT std_logic;   
         ARREADY_SI1             : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_SI1                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_SI1               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_SI1               : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_SI1               : IN std_logic;   
         RVALID_SI1              : IN std_logic;   
         RREADY_IS1              : OUT std_logic;   
         -- SLAVE 2
-- AXI SLAVE 2 write address channel signals

         AWID_IS2                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_IS2              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_IS2               : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_IS2              : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_IS2             : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_IS2              : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_IS2             : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_IS2              : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_IS2             : OUT std_logic;   
         AWREADY_SI2             : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_IS2                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_IS2               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_IS2               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_IS2               : OUT std_logic;   
         WVALID_IS2              : OUT std_logic;   
         WREADY_SI2              : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_SI2                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_SI2               : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_SI2              : IN std_logic;   
         BREADY_IS2              : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_IS2                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_IS2              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_IS2               : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_IS2              : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_IS2             : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_IS2              : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_IS2             : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_IS2              : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_IS2             : OUT std_logic;   
         ARREADY_SI2             : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_SI2                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_SI2               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_SI2               : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_SI2               : IN std_logic;   
         RVALID_SI2              : IN std_logic;   
         RREADY_IS2              : OUT std_logic;   
         -- SLAVE 3
-- AXI SLAVE 3 write address channel signals

         AWID_IS3                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_IS3              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_IS3               : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_IS3              : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_IS3             : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_IS3              : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_IS3             : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_IS3              : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_IS3             : OUT std_logic;   
         AWREADY_SI3             : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_IS3                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_IS3               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_IS3               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_IS3               : OUT std_logic;   
         WVALID_IS3              : OUT std_logic;   
         WREADY_SI3              : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_SI3                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_SI3               : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_SI3              : IN std_logic;   
         BREADY_IS3              : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_IS3                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_IS3              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_IS3               : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_IS3              : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_IS3             : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_IS3              : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_IS3             : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_IS3              : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_IS3             : OUT std_logic;   
         ARREADY_SI3             : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_SI3                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_SI3               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_SI3               : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_SI3               : IN std_logic;   
         RVALID_SI3              : IN std_logic;   
         RREADY_IS3              : OUT std_logic;   
         -- SLAVE 4
-- AXI SLAVE 4 write address channel signals

         AWID_IS4                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_IS4              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_IS4               : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_IS4              : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_IS4             : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_IS4              : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_IS4             : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_IS4              : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_IS4             : OUT std_logic;   
         AWREADY_SI4             : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_IS4                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_IS4               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_IS4               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_IS4               : OUT std_logic;   
         WVALID_IS4              : OUT std_logic;   
         WREADY_SI4              : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_SI4                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_SI4               : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_SI4              : IN std_logic;   
         BREADY_IS4              : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_IS4                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_IS4              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_IS4               : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_IS4              : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_IS4             : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_IS4              : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_IS4             : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_IS4              : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_IS4             : OUT std_logic;   
         ARREADY_SI4             : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_SI4                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_SI4               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_SI4               : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_SI4               : IN std_logic;   
         RVALID_SI4              : IN std_logic;   
         RREADY_IS4              : OUT std_logic;   
         -- SLAVE 5
-- AXI SLAVE 5 write address channel signals

         AWID_IS5                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_IS5              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_IS5               : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_IS5              : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_IS5             : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_IS5              : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_IS5             : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_IS5              : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_IS5             : OUT std_logic;   
         AWREADY_SI5             : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_IS5                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_IS5               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_IS5               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_IS5               : OUT std_logic;   
         WVALID_IS5              : OUT std_logic;   
         WREADY_SI5              : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_SI5                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_SI5               : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_SI5              : IN std_logic;   
         BREADY_IS5              : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_IS5                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_IS5              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_IS5               : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_IS5              : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_IS5             : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_IS5              : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_IS5             : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_IS5              : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_IS5             : OUT std_logic;   
         ARREADY_SI5             : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_SI5                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_SI5               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_SI5               : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_SI5               : IN std_logic;   
         RVALID_SI5              : IN std_logic;   
         RREADY_IS5              : OUT std_logic;   
         -- SLAVE 6
-- AXI SLAVE 6 write address channel signals

         AWID_IS6                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_IS6              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_IS6               : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_IS6              : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_IS6             : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_IS6              : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_IS6             : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_IS6              : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_IS6             : OUT std_logic;   
         AWREADY_SI6             : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_IS6                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_IS6               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_IS6               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_IS6               : OUT std_logic;   
         WVALID_IS6              : OUT std_logic;   
         WREADY_SI6              : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_SI6                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_SI6               : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_SI6              : IN std_logic;   
         BREADY_IS6              : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_IS6                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_IS6              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_IS6               : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_IS6              : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_IS6             : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_IS6              : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_IS6             : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_IS6              : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_IS6             : OUT std_logic;   
         ARREADY_SI6             : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_SI6                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_SI6               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_SI6               : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_SI6               : IN std_logic;   
         RVALID_SI6              : IN std_logic;   
         RREADY_IS6              : OUT std_logic;   
         -- SLAVE 7
-- AXI SLAVE 7 write address channel signals

         AWID_IS7                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_IS7              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_IS7               : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_IS7              : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_IS7             : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_IS7              : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_IS7             : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_IS7              : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_IS7             : OUT std_logic;   
         AWREADY_SI7             : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_IS7                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_IS7               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_IS7               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_IS7               : OUT std_logic;   
         WVALID_IS7              : OUT std_logic;   
         WREADY_SI7              : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_SI7                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_SI7               : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_SI7              : IN std_logic;   
         BREADY_IS7              : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_IS7                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_IS7              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_IS7               : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_IS7              : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_IS7             : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_IS7              : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_IS7             : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_IS7              : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_IS7             : OUT std_logic;   
         ARREADY_SI7             : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_SI7                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_SI7               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_SI7               : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_SI7               : IN std_logic;   
         RVALID_SI7              : IN std_logic;   
         RREADY_IS7              : OUT std_logic;   
         -- SLAVE 8
-- AXI SLAVE 8 write address channel signals

         AWID_IS8                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_IS8              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_IS8               : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_IS8              : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_IS8             : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_IS8              : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_IS8             : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_IS8              : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_IS8             : OUT std_logic;   
         AWREADY_SI8             : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_IS8                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_IS8               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_IS8               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_IS8               : OUT std_logic;   
         WVALID_IS8              : OUT std_logic;   
         WREADY_SI8              : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_SI8                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_SI8               : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_SI8              : IN std_logic;   
         BREADY_IS8              : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_IS8                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_IS8              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_IS8               : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_IS8              : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_IS8             : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_IS8              : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_IS8             : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_IS8              : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_IS8             : OUT std_logic;   
         ARREADY_SI8             : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_SI8                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_SI8               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_SI8               : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_SI8               : IN std_logic;   
         RVALID_SI8              : IN std_logic;   
         RREADY_IS8              : OUT std_logic;   
         -- SLAVE 9
-- AXI SLAVE 9 write address channel signals

         AWID_IS9                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_IS9              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_IS9               : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_IS9              : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_IS9             : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_IS9              : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_IS9             : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_IS9              : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_IS9             : OUT std_logic;   
         AWREADY_SI9             : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_IS9                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_IS9               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_IS9               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_IS9               : OUT std_logic;   
         WVALID_IS9              : OUT std_logic;   
         WREADY_SI9              : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_SI9                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_SI9               : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_SI9              : IN std_logic;   
         BREADY_IS9              : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_IS9                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_IS9              : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_IS9               : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_IS9              : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_IS9             : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_IS9              : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_IS9             : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_IS9              : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_IS9             : OUT std_logic;   
         ARREADY_SI9             : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_SI9                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_SI9               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_SI9               : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_SI9               : IN std_logic;   
         RVALID_SI9              : IN std_logic;   
         RREADY_IS9              : OUT std_logic;   
         -- SLAVE 10
-- AXI SLAVE 10 write address channel signals

         AWID_IS10               : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_IS10             : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_IS10              : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_IS10             : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_IS10            : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_IS10             : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_IS10            : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_IS10             : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_IS10            : OUT std_logic;   
         AWREADY_SI10            : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_IS10                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_IS10              : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_IS10              : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_IS10              : OUT std_logic;   
         WVALID_IS10             : OUT std_logic;   
         WREADY_SI10             : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_SI10                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_SI10              : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_SI10             : IN std_logic;   
         BREADY_IS10             : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_IS10               : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_IS10             : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_IS10              : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_IS10             : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_IS10            : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_IS10             : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_IS10            : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_IS10             : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_IS10            : OUT std_logic;   
         ARREADY_SI10            : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_SI10                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_SI10              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_SI10              : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_SI10              : IN std_logic;   
         RVALID_SI10             : IN std_logic;   
         RREADY_IS10             : OUT std_logic;   
         -- SLAVE 11
-- AXI SLAVE 11 write address channel signals

         AWID_IS11               : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_IS11             : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_IS11              : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_IS11             : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_IS11            : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_IS11             : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_IS11            : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_IS11             : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_IS11            : OUT std_logic;   
         AWREADY_SI11            : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_IS11                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_IS11              : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_IS11              : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_IS11              : OUT std_logic;   
         WVALID_IS11             : OUT std_logic;   
         WREADY_SI11             : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_SI11                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_SI11              : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_SI11             : IN std_logic;   
         BREADY_IS11             : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_IS11               : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_IS11             : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_IS11              : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_IS11             : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_IS11            : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_IS11             : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_IS11            : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_IS11             : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_IS11            : OUT std_logic;   
         ARREADY_SI11            : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_SI11                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_SI11              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_SI11              : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_SI11              : IN std_logic;   
         RVALID_SI11             : IN std_logic;   
         RREADY_IS11             : OUT std_logic;   
         -- SLAVE 12
-- AXI SLAVE 12 write address channel signals

         AWID_IS12               : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_IS12             : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_IS12              : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_IS12             : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_IS12            : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_IS12             : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_IS12            : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_IS12             : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_IS12            : OUT std_logic;   
         AWREADY_SI12            : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_IS12                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_IS12              : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_IS12              : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_IS12              : OUT std_logic;   
         WVALID_IS12             : OUT std_logic;   
         WREADY_SI12             : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_SI12                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_SI12              : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_SI12             : IN std_logic;   
         BREADY_IS12             : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_IS12               : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_IS12             : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_IS12              : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_IS12             : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_IS12            : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_IS12             : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_IS12            : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_IS12             : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_IS12            : OUT std_logic;   
         ARREADY_SI12            : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_SI12                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_SI12              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_SI12              : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_SI12              : IN std_logic;   
         RVALID_SI12             : IN std_logic;   
         RREADY_IS12             : OUT std_logic;   
         -- SLAVE 13
-- AXI SLAVE 13 write address channel signals

         AWID_IS13               : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_IS13             : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_IS13              : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_IS13             : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_IS13            : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_IS13             : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_IS13            : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_IS13             : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_IS13            : OUT std_logic;   
         AWREADY_SI13            : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_IS13                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_IS13              : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_IS13              : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_IS13              : OUT std_logic;   
         WVALID_IS13             : OUT std_logic;   
         WREADY_SI13             : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_SI13                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_SI13              : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_SI13             : IN std_logic;   
         BREADY_IS13             : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_IS13               : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_IS13             : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_IS13              : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_IS13             : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_IS13            : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_IS13             : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_IS13            : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_IS13             : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_IS13            : OUT std_logic;   
         ARREADY_SI13            : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_SI13                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_SI13              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_SI13              : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_SI13              : IN std_logic;   
         RVALID_SI13             : IN std_logic;   
         RREADY_IS13             : OUT std_logic;   
         -- SLAVE 14
-- AXI SLAVE 14 write address channel signals

         AWID_IS14               : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_IS14             : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_IS14              : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_IS14             : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_IS14            : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_IS14             : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_IS14            : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_IS14             : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_IS14            : OUT std_logic;   
         AWREADY_SI14            : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_IS14                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_IS14              : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_IS14              : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_IS14              : OUT std_logic;   
         WVALID_IS14             : OUT std_logic;   
         WREADY_SI14             : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_SI14                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_SI14              : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_SI14             : IN std_logic;   
         BREADY_IS14             : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_IS14               : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_IS14             : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_IS14              : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_IS14             : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_IS14            : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_IS14             : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_IS14            : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_IS14             : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_IS14            : OUT std_logic;   
         ARREADY_SI14            : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_SI14                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_SI14              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_SI14              : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_SI14              : IN std_logic;   
         RVALID_SI14             : IN std_logic;   
         RREADY_IS14             : OUT std_logic;   
         -- SLAVE 15
-- AXI SLAVE 15 write address channel signals

         AWID_IS15               : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_IS15             : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_IS15              : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_IS15             : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_IS15            : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_IS15             : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_IS15            : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_IS15             : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_IS15            : OUT std_logic;   
         AWREADY_SI15            : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_IS15                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_IS15              : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_IS15              : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_IS15              : OUT std_logic;   
         WVALID_IS15             : OUT std_logic;   
         WREADY_SI15             : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_SI15                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_SI15              : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_SI15             : IN std_logic;   
         BREADY_IS15             : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_IS15               : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_IS15             : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_IS15              : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_IS15             : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_IS15            : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_IS15             : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_IS15            : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_IS15             : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_IS15            : OUT std_logic;   
         ARREADY_SI15            : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_SI15                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_SI15              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_SI15              : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_SI15              : IN std_logic;   
         RVALID_SI15             : IN std_logic;   
         RREADY_IS15             : OUT std_logic;   
         -- SLAVE 16
-- AXI SLAVE 16 write address channel signals

         AWID_IS16               : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_IS16             : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_IS16              : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_IS16             : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_IS16            : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_IS16             : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_IS16            : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_IS16             : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_IS16            : OUT std_logic;   
         AWREADY_SI16            : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_IS16                : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_IS16              : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_IS16              : OUT std_logic_vector(AXI_DWIDTH/8 - 1 
         DOWNTO 0);   
         WLAST_IS16              : OUT std_logic;   
         WVALID_IS16             : OUT std_logic;   
         WREADY_SI16             : IN std_logic;   
         -- AXI SLAVE 0 write response channel signals

         BID_SI16                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BRESP_SI16              : IN std_logic_vector(1 DOWNTO 0);   
         BVALID_SI16             : IN std_logic;   
         BREADY_IS16             : OUT std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_IS16               : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_IS16             : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_IS16              : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_IS16             : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_IS16            : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_IS16             : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_IS16            : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_IS16             : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_IS16            : OUT std_logic;   
         ARREADY_SI16            : IN std_logic;   
         -- AXI SLAVE 0 read response channel signals

         RID_SI16                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RDATA_SI16              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_SI16              : IN std_logic_vector(1 DOWNTO 0);   
         RLAST_SI16              : IN std_logic;   
         RVALID_SI16             : IN std_logic;   
         RREADY_IS16             : OUT std_logic;   
         -- For Arbiter from Masters
-- To end grant to current master

         m0_rd_end               : IN std_logic;   
         m1_rd_end               : IN std_logic;   
         m2_rd_end               : IN std_logic;   
         m3_rd_end               : IN std_logic;   
         m0_wr_end               : IN std_logic;   
         m1_wr_end               : IN std_logic;   
         m2_wr_end               : IN std_logic;   
         m3_wr_end               : IN std_logic);
   END COMPONENT;

   -- --------------------------------------------------------------------------
   -- Internal signals
   -- --------------------------------------------------------------------------
   SIGNAL AWREADY_IM0              :  std_logic;   
   SIGNAL AWREADY_IM1              :  std_logic;   
   SIGNAL AWREADY_IM2              :  std_logic;   
   SIGNAL AWREADY_IM3              :  std_logic;   
   SIGNAL WREADY_IM0               :  std_logic;   
   SIGNAL WREADY_IM1               :  std_logic;   
   SIGNAL WREADY_IM2               :  std_logic;   
   SIGNAL WREADY_IM3               :  std_logic;   
   SIGNAL ARREADY_IM0              :  std_logic;   
   SIGNAL ARREADY_IM1              :  std_logic;   
   SIGNAL ARREADY_IM2              :  std_logic;   
   SIGNAL ARREADY_IM3              :  std_logic;   
   SIGNAL BREADY_MI0               :  std_logic;   
   SIGNAL BREADY_MI1               :  std_logic;   
   SIGNAL BREADY_MI2               :  std_logic;   
   SIGNAL BREADY_MI3               :  std_logic;   
   SIGNAL RREADY_MI0               :  std_logic;   
   SIGNAL RREADY_MI1               :  std_logic;   
   SIGNAL RREADY_MI2               :  std_logic;   
   SIGNAL RREADY_MI3               :  std_logic;   
   SIGNAL BVALID_IM0               :  std_logic;   
   SIGNAL BVALID_IM1               :  std_logic;   
   SIGNAL BVALID_IM2               :  std_logic;   
   SIGNAL BVALID_IM3               :  std_logic;   
   SIGNAL AWID_IS0                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS0               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS0                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS0               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS0              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS0               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS0              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS0               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS0              :  std_logic;   
   -- AXI SLAVE 0 write data channel signals
   SIGNAL WID_IS0                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS0                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS0                :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS0                :  std_logic;   
   SIGNAL WVALID_IS0               :  std_logic;   
   -- AXI SLAVE 0 write response channel signals
   SIGNAL BREADY_IS0               :  std_logic;   
   -- AXI SLAVE 0 read address channel signals
   SIGNAL ARID_IS0                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS0               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS0                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS0               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS0              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS0               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS0              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS0               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS0              :  std_logic;   
   -- AXI SLAVE 0 read response channel signals
   SIGNAL RREADY_IS0               :  std_logic;   
   SIGNAL AWID_IS1                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS1               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS1                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS1               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS1              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS1               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS1              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS1               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS1              :  std_logic;   
   -- AXI SLAVE 0 write data channel signals
   SIGNAL WID_IS1                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS1                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS1                :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS1                :  std_logic;   
   SIGNAL WVALID_IS1               :  std_logic;   
   -- AXI SLAVE 0 write response channel signals
   SIGNAL BREADY_IS1               :  std_logic;   
   -- AXI SLAVE 0 read address channel signals
   SIGNAL ARID_IS1                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS1               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS1                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS1               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS1              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS1               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS1              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS1               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS1              :  std_logic;   
   -- AXI SLAVE 0 read response channel signals
   SIGNAL RREADY_IS1               :  std_logic;   
   SIGNAL AWID_IS2                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS2               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS2                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS2               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS2              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS2               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS2              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS2               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS2              :  std_logic;   
   -- AXI SLAVE 0 write data channel signals
   SIGNAL WID_IS2                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS2                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS2                :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS2                :  std_logic;   
   SIGNAL WVALID_IS2               :  std_logic;   
   -- AXI SLAVE 0 write response channel signals
   SIGNAL BREADY_IS2               :  std_logic;   
   -- AXI SLAVE 0 read address channel signals
   SIGNAL ARID_IS2                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS2               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS2                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS2               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS2              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS2               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS2              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS2               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS2              :  std_logic;   
   -- AXI SLAVE 0 read response channel signals
   SIGNAL RREADY_IS2               :  std_logic;   
   SIGNAL AWID_IS3                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS3               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS3                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS3               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS3              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS3               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS3              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS3               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS3              :  std_logic;   
   -- AXI SLAVE 0 write data channel signals
   SIGNAL WID_IS3                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS3                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS3                :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS3                :  std_logic;   
   SIGNAL WVALID_IS3               :  std_logic;   
   -- AXI SLAVE 0 write response channel signals
   SIGNAL BREADY_IS3               :  std_logic;   
   -- AXI SLAVE 0 read address channel signals
   SIGNAL ARID_IS3                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS3               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS3                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS3               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS3              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS3               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS3              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS3               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS3              :  std_logic;   
   -- AXI SLAVE 0 read response channel signals
   SIGNAL RREADY_IS3               :  std_logic;   
   SIGNAL AWID_IS4                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS4               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS4                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS4               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS4              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS4               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS4              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS4               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS4              :  std_logic;   
   -- AXI SLAVE 0 write data channel signals
   SIGNAL WID_IS4                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS4                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS4                :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS4                :  std_logic;   
   SIGNAL WVALID_IS4               :  std_logic;   
   -- AXI SLAVE 0 write response channel signals
   SIGNAL BREADY_IS4               :  std_logic;   
   -- AXI SLAVE 0 read address channel signals
   SIGNAL ARID_IS4                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS4               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS4                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS4               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS4              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS4               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS4              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS4               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS4              :  std_logic;   
   -- AXI SLAVE 0 read response channel signals
   SIGNAL RREADY_IS4               :  std_logic;   
   SIGNAL AWID_IS5                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS5               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS5                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS5               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS5              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS5               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS5              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS5               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS5              :  std_logic;   
   -- AXI SLAVE 0 write data channel signals
   SIGNAL WID_IS5                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS5                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS5                :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS5                :  std_logic;   
   SIGNAL WVALID_IS5               :  std_logic;   
   -- AXI SLAVE 0 write response channel signals
   SIGNAL BREADY_IS5               :  std_logic;   
   -- AXI SLAVE 0 read address channel signals
   SIGNAL ARID_IS5                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS5               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS5                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS5               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS5              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS5               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS5              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS5               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS5              :  std_logic;   
   -- AXI SLAVE 0 read response channel signals
   SIGNAL RREADY_IS5               :  std_logic;   
   SIGNAL AWID_IS6                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS6               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS6                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS6               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS6              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS6               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS6              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS6               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS6              :  std_logic;   
   -- AXI SLAVE 0 write data channel signals
   SIGNAL WID_IS6                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS6                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS6                :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS6                :  std_logic;   
   SIGNAL WVALID_IS6               :  std_logic;   
   -- AXI SLAVE 0 write response channel signals
   SIGNAL BREADY_IS6               :  std_logic;   
   -- AXI SLAVE 0 read address channel signals
   SIGNAL ARID_IS6                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS6               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS6                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS6               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS6              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS6               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS6              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS6               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS6              :  std_logic;   
   -- AXI SLAVE 0 read response channel signals
   SIGNAL RREADY_IS6               :  std_logic;   
   SIGNAL AWID_IS7                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS7               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS7                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS7               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS7              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS7               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS7              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS7               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS7              :  std_logic;   
   -- AXI SLAVE 0 write data channel signals
   SIGNAL WID_IS7                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS7                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS7                :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS7                :  std_logic;   
   SIGNAL WVALID_IS7               :  std_logic;   
   -- AXI SLAVE 0 write response channel signals
   SIGNAL BREADY_IS7               :  std_logic;   
   -- AXI SLAVE 0 read address channel signals
   SIGNAL ARID_IS7                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS7               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS7                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS7               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS7              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS7               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS7              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS7               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS7              :  std_logic;   
   -- AXI SLAVE 0 read response channel signals
   SIGNAL RREADY_IS7               :  std_logic;   
   SIGNAL AWID_IS8                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS8               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS8                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS8               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS8              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS8               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS8              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS8               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS8              :  std_logic;   
   -- AXI SLAVE 0 write data channel signals
   SIGNAL WID_IS8                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS8                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS8                :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS8                :  std_logic;   
   SIGNAL WVALID_IS8               :  std_logic;   
   -- AXI SLAVE 0 write response channel signals
   SIGNAL BREADY_IS8               :  std_logic;   
   -- AXI SLAVE 0 read address channel signals
   SIGNAL ARID_IS8                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS8               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS8                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS8               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS8              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS8               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS8              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS8               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS8              :  std_logic;   
   -- AXI SLAVE 0 read response channel signals
   SIGNAL RREADY_IS8               :  std_logic;   
   SIGNAL AWID_IS9                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS9               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS9                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS9               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS9              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS9               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS9              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS9               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS9              :  std_logic;   
   -- AXI SLAVE 0 write data channel signals
   SIGNAL WID_IS9                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS9                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS9                :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS9                :  std_logic;   
   SIGNAL WVALID_IS9               :  std_logic;   
   -- AXI SLAVE 0 write response channel signals
   SIGNAL BREADY_IS9               :  std_logic;   
   -- AXI SLAVE 0 read address channel signals
   SIGNAL ARID_IS9                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS9               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS9                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS9               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS9              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS9               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS9              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS9               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS9              :  std_logic;   
   -- AXI SLAVE 0 read response channel signals
   SIGNAL RREADY_IS9               :  std_logic;   
   SIGNAL AWID_IS10                :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS10              :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS10               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS10              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS10             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS10              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS10             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS10              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS10             :  std_logic;   
   -- AXI SLAVE 0 write data channel signals
   SIGNAL WID_IS10                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS10               :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS10               :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS10               :  std_logic;   
   SIGNAL WVALID_IS10              :  std_logic;   
   -- AXI SLAVE 0 write response channel signals
   SIGNAL BREADY_IS10              :  std_logic;   
   -- AXI SLAVE 0 read address channel signals
   SIGNAL ARID_IS10                :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS10              :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS10               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS10              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS10             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS10              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS10             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS10              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS10             :  std_logic;   
   -- AXI SLAVE 0 read response channel signals
   SIGNAL RREADY_IS10              :  std_logic;   
   SIGNAL AWID_IS11                :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS11              :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS11               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS11              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS11             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS11              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS11             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS11              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS11             :  std_logic;   
   -- AXI SLAVE 0 write data channel signals
   SIGNAL WID_IS11                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS11               :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS11               :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS11               :  std_logic;   
   SIGNAL WVALID_IS11              :  std_logic;   
   -- AXI SLAVE 0 write response channel signals
   SIGNAL BREADY_IS11              :  std_logic;   
   -- AXI SLAVE 0 read address channel signals
   SIGNAL ARID_IS11                :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS11              :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS11               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS11              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS11             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS11              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS11             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS11              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS11             :  std_logic;   
   -- AXI SLAVE 0 read response channel signals
   SIGNAL RREADY_IS11              :  std_logic;   
   SIGNAL AWID_IS12                :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS12              :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS12               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS12              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS12             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS12              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS12             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS12              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS12             :  std_logic;   
   -- AXI SLAVE 0 write data channel signals
   SIGNAL WID_IS12                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS12               :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS12               :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS12               :  std_logic;   
   SIGNAL WVALID_IS12              :  std_logic;   
   -- AXI SLAVE 0 write response channel signals
   SIGNAL BREADY_IS12              :  std_logic;   
   -- AXI SLAVE 0 read address channel signals
   SIGNAL ARID_IS12                :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS12              :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS12               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS12              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS12             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS12              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS12             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS12              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS12             :  std_logic;   
   -- AXI SLAVE 0 read response channel signals
   SIGNAL RREADY_IS12              :  std_logic;   
   SIGNAL AWID_IS13                :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS13              :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS13               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS13              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS13             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS13              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS13             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS13              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS13             :  std_logic;   
   -- AXI SLAVE 0 write data channel signals
   SIGNAL WID_IS13                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS13               :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS13               :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS13               :  std_logic;   
   SIGNAL WVALID_IS13              :  std_logic;   
   -- AXI SLAVE 0 write response channel signals
   SIGNAL BREADY_IS13              :  std_logic;   
   -- AXI SLAVE 0 read address channel signals
   SIGNAL ARID_IS13                :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS13              :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS13               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS13              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS13             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS13              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS13             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS13              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS13             :  std_logic;   
   -- AXI SLAVE 0 read response channel signals
   SIGNAL RREADY_IS13              :  std_logic;   
   SIGNAL AWID_IS14                :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS14              :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS14               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS14              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS14             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS14              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS14             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS14              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS14             :  std_logic;   
   -- AXI SLAVE 0 write data channel signals
   SIGNAL WID_IS14                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS14               :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS14               :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS14               :  std_logic;   
   SIGNAL WVALID_IS14              :  std_logic;   
   -- AXI SLAVE 0 write response channel signals
   SIGNAL BREADY_IS14              :  std_logic;   
   -- AXI SLAVE 0 read address channel signals
   SIGNAL ARID_IS14                :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS14              :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS14               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS14              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS14             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS14              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS14             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS14              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS14             :  std_logic;   
   -- AXI SLAVE 0 read response channel signals
   SIGNAL RREADY_IS14              :  std_logic;   
   SIGNAL AWID_IS15                :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS15              :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS15               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS15              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS15             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS15              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS15             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS15              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS15             :  std_logic;   
   -- AXI SLAVE 0 write data channel signals
   SIGNAL WID_IS15                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS15               :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS15               :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS15               :  std_logic;   
   SIGNAL WVALID_IS15              :  std_logic;   
   -- AXI SLAVE 0 write response channel signals
   SIGNAL BREADY_IS15              :  std_logic;   
   -- AXI SLAVE 0 read address channel signals
   SIGNAL ARID_IS15                :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS15              :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS15               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS15              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS15             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS15              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS15             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS15              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS15             :  std_logic;   
   -- AXI SLAVE 0 read response channel signals
   SIGNAL RREADY_IS15              :  std_logic;   
   SIGNAL AWID_IS16                :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS16              :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS16               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS16              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS16             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS16              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS16             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS16              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS16             :  std_logic;   
   -- AXI SLAVE 0 write data channel signals
   SIGNAL WID_IS16                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS16               :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS16               :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS16               :  std_logic;   
   SIGNAL WVALID_IS16              :  std_logic;   
   -- AXI SLAVE 0 write response channel signals
   SIGNAL BREADY_IS16              :  std_logic;   
   -- AXI SLAVE 0 read address channel signals
   SIGNAL ARID_IS16                :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS16              :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS16               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS16              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS16             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS16              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS16             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS16              :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS16             :  std_logic;   
   -- AXI SLAVE 0 read response channel signals
   SIGNAL RREADY_IS16              :  std_logic;   
   -- M0
   SIGNAL AWID_MI0                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_MI0               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_MI0                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_MI0               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_MI0              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_MI0               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_MI0              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_MI0               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_MI0              :  std_logic;   
   -- AXI write data channel signals
   SIGNAL WID_MI0                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_MI0                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_MI0                :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_MI0                :  std_logic;   
   SIGNAL WVALID_MI0               :  std_logic;   
   -- AXI read address channel signals
   SIGNAL ARID_MI0                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_MI0               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_MI0                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_MI0               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_MI0              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_MI0               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_MI0              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_MI0               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_MI0              :  std_logic;   
   SIGNAL BRESP_IM0                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BID_IM0                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RID_IM0                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_IM0                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_IM0                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RVALID_IM0               :  std_logic;   
   SIGNAL RLAST_IM0                :  std_logic;   
   -- M1
   SIGNAL AWID_MI1                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_MI1               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_MI1                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_MI1               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_MI1              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_MI1               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_MI1              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_MI1               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_MI1              :  std_logic;   
   -- AXI write data channel signals
   SIGNAL WID_MI1                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_MI1                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_MI1                :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_MI1                :  std_logic;   
   SIGNAL WVALID_MI1               :  std_logic;   
   -- AXI read address channel signals
   SIGNAL ARID_MI1                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_MI1               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_MI1                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_MI1               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_MI1              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_MI1               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_MI1              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_MI1               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_MI1              :  std_logic;   
   SIGNAL BRESP_IM1                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BID_IM1                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RID_IM1                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_IM1                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_IM1                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RVALID_IM1               :  std_logic;   
   SIGNAL RLAST_IM1                :  std_logic;   
   -- M2
   SIGNAL AWID_MI2                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_MI2               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_MI2                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_MI2               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_MI2              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_MI2               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_MI2              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_MI2               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_MI2              :  std_logic;   
   -- AXI write data channel signals
   SIGNAL WID_MI2                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_MI2                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_MI2                :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_MI2                :  std_logic;   
   SIGNAL WVALID_MI2               :  std_logic;   
   -- AXI read address channel signals
   SIGNAL ARID_MI2                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_MI2               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_MI2                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_MI2               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_MI2              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_MI2               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_MI2              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_MI2               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_MI2              :  std_logic;   
   SIGNAL BRESP_IM2                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BID_IM2                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RID_IM2                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_IM2                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_IM2                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RVALID_IM2               :  std_logic;   
   SIGNAL RLAST_IM2                :  std_logic;   
   -- M3
   SIGNAL AWID_MI3                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_MI3               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_MI3                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_MI3               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_MI3              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_MI3               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_MI3              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_MI3               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_MI3              :  std_logic;   
   -- AXI write data channel signals
   SIGNAL WID_MI3                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_MI3                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_MI3                :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_MI3                :  std_logic;   
   SIGNAL WVALID_MI3               :  std_logic;   
   -- AXI read address channel signals
   SIGNAL ARID_MI3                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_MI3               :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_MI3                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_MI3               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_MI3              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_MI3               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_MI3              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_MI3               :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_MI3              :  std_logic;   
   SIGNAL BRESP_IM3                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BID_IM3                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RID_IM3                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_IM3                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_IM3                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RVALID_IM3               :  std_logic;   
   SIGNAL RLAST_IM3                :  std_logic;   
   -- ===================================================================
   -- AXI SLAVE 0 write data channel signals
   -- AXI SLAVE 0 write response channel signals
   -- AXI SLAVE 0 read address channel signals
   -- AXI SLAVE 0 read response channel signals
   -- AXI SLAVE 0 write data channel signals
   -- AXI SLAVE 0 write response channel signals
   -- AXI SLAVE 0 read address channel signals
   -- AXI SLAVE 0 read response channel signals
   -- AXI SLAVE 0 write data channel signals
   -- AXI SLAVE 0 write response channel signals
   -- AXI SLAVE 0 read address channel signals
   -- AXI SLAVE 0 read response channel signals
   -- AXI SLAVE 0 write data channel signals
   -- AXI SLAVE 0 write response channel signals
   -- AXI SLAVE 0 read address channel signals
   -- AXI SLAVE 0 read response channel signals
   -- AXI SLAVE 0 write data channel signals
   -- AXI SLAVE 0 write response channel signals
   -- AXI SLAVE 0 read address channel signals
   -- AXI SLAVE 0 read response channel signals
   -- AXI SLAVE 0 write data channel signals
   -- AXI SLAVE 0 write response channel signals
   -- AXI SLAVE 0 read address channel signals
   -- AXI SLAVE 0 read response channel signals
   -- AXI SLAVE 0 write data channel signals
   -- AXI SLAVE 0 write response channel signals
   -- AXI SLAVE 0 read address channel signals
   -- AXI SLAVE 0 read response channel signals
   -- AXI SLAVE 0 write data channel signals
   -- AXI SLAVE 0 write response channel signals
   -- AXI SLAVE 0 read address channel signals
   -- AXI SLAVE 0 read response channel signals
   -- AXI SLAVE 0 write data channel signals
   -- AXI SLAVE 0 write response channel signals
   -- AXI SLAVE 0 read address channel signals
   -- AXI SLAVE 0 read response channel signals
   -- AXI SLAVE 0 write data channel signals
   -- AXI SLAVE 0 write response channel signals
   -- AXI SLAVE 0 read address channel signals
   -- AXI SLAVE 0 read response channel signals
   -- AXI SLAVE 0 write data channel signals
   -- AXI SLAVE 0 write response channel signals
   -- AXI SLAVE 0 read address channel signals
   -- AXI SLAVE 0 read response channel signals
   -- AXI SLAVE 0 write data channel signals
   -- AXI SLAVE 0 write response channel signals
   -- AXI SLAVE 0 read address channel signals
   -- AXI SLAVE 0 read response channel signals
   -- AXI SLAVE 0 write data channel signals
   -- AXI SLAVE 0 write response channel signals
   -- AXI SLAVE 0 read address channel signals
   -- AXI SLAVE 0 read response channel signals
   -- AXI SLAVE 0 write data channel signals
   -- AXI SLAVE 0 write response channel signals
   -- AXI SLAVE 0 read address channel signals
   -- AXI SLAVE 0 read response channel signals
   -- AXI SLAVE 0 write data channel signals
   -- AXI SLAVE 0 write response channel signals
   -- AXI SLAVE 0 read address channel signals
   -- AXI SLAVE 0 read response channel signals
   -- AXI SLAVE 0 write data channel signals
   -- AXI SLAVE 0 write response channel signals
   -- AXI SLAVE 0 read address channel signals
   -- AXI SLAVE 0 read response channel signals
   -- AXI SLAVE 0 write data channel signals
   -- AXI SLAVE 0 write response channel signals
   -- AXI SLAVE 0 read address channel signals
   SIGNAL AWREADY_SI0              :  std_logic;   
   SIGNAL AWREADY_SI1              :  std_logic;   
   SIGNAL AWREADY_SI2              :  std_logic;   
   SIGNAL AWREADY_SI3              :  std_logic;   
   SIGNAL AWREADY_SI4              :  std_logic;   
   SIGNAL AWREADY_SI5              :  std_logic;   
   SIGNAL AWREADY_SI6              :  std_logic;   
   SIGNAL AWREADY_SI7              :  std_logic;   
   SIGNAL AWREADY_SI8              :  std_logic;   
   SIGNAL AWREADY_SI9              :  std_logic;   
   SIGNAL AWREADY_SI10             :  std_logic;   
   SIGNAL AWREADY_SI11             :  std_logic;   
   SIGNAL AWREADY_SI12             :  std_logic;   
   SIGNAL AWREADY_SI13             :  std_logic;   
   SIGNAL AWREADY_SI14             :  std_logic;   
   SIGNAL AWREADY_SI15             :  std_logic;   
   SIGNAL AWREADY_SI16             :  std_logic;   
   SIGNAL WREADY_SI0               :  std_logic;   
   SIGNAL WREADY_SI1               :  std_logic;   
   SIGNAL WREADY_SI2               :  std_logic;   
   SIGNAL WREADY_SI3               :  std_logic;   
   SIGNAL WREADY_SI4               :  std_logic;   
   SIGNAL WREADY_SI5               :  std_logic;   
   SIGNAL WREADY_SI6               :  std_logic;   
   SIGNAL WREADY_SI7               :  std_logic;   
   SIGNAL WREADY_SI8               :  std_logic;   
   SIGNAL WREADY_SI9               :  std_logic;   
   SIGNAL WREADY_SI10              :  std_logic;   
   SIGNAL WREADY_SI11              :  std_logic;   
   SIGNAL WREADY_SI12              :  std_logic;   
   SIGNAL WREADY_SI13              :  std_logic;   
   SIGNAL WREADY_SI14              :  std_logic;   
   SIGNAL WREADY_SI15              :  std_logic;   
   SIGNAL WREADY_SI16              :  std_logic;   
   SIGNAL ARREADY_SI0              :  std_logic;   
   SIGNAL ARREADY_SI1              :  std_logic;   
   SIGNAL ARREADY_SI2              :  std_logic;   
   SIGNAL ARREADY_SI3              :  std_logic;   
   SIGNAL ARREADY_SI4              :  std_logic;   
   SIGNAL ARREADY_SI5              :  std_logic;   
   SIGNAL ARREADY_SI6              :  std_logic;   
   SIGNAL ARREADY_SI7              :  std_logic;   
   SIGNAL ARREADY_SI8              :  std_logic;   
   SIGNAL ARREADY_SI9              :  std_logic;   
   SIGNAL ARREADY_SI10             :  std_logic;   
   SIGNAL ARREADY_SI11             :  std_logic;   
   SIGNAL ARREADY_SI12             :  std_logic;   
   SIGNAL ARREADY_SI13             :  std_logic;   
   SIGNAL ARREADY_SI14             :  std_logic;   
   SIGNAL ARREADY_SI15             :  std_logic;   
   SIGNAL ARREADY_SI16             :  std_logic;   

   SIGNAL BID_SI0                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_SI0                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_SI0               :  std_logic;   
   SIGNAL RID_SI0                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_SI0                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_SI0                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_SI0                :  std_logic;   
   SIGNAL RVALID_SI0               :  std_logic;   
   SIGNAL BID_SI1                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_SI1                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_SI1               :  std_logic;   
   SIGNAL RID_SI1                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_SI1                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_SI1                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_SI1                :  std_logic;   
   SIGNAL RVALID_SI1               :  std_logic;   
   SIGNAL BID_SI2                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_SI2                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_SI2               :  std_logic;   
   SIGNAL RID_SI2                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_SI2                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_SI2                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_SI2                :  std_logic;   
   SIGNAL RVALID_SI2               :  std_logic;   
   SIGNAL BID_SI3                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_SI3                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_SI3               :  std_logic;   
   SIGNAL RID_SI3                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_SI3                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_SI3                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_SI3                :  std_logic;   
   SIGNAL RVALID_SI3               :  std_logic;   
   SIGNAL BID_SI4                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_SI4                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_SI4               :  std_logic;   
   SIGNAL RID_SI4                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_SI4                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_SI4                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_SI4                :  std_logic;   
   SIGNAL RVALID_SI4               :  std_logic;   
   SIGNAL BID_SI5                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_SI5                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_SI5               :  std_logic;   
   SIGNAL RID_SI5                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_SI5                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_SI5                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_SI5                :  std_logic;   
   SIGNAL RVALID_SI5               :  std_logic;   
   SIGNAL BID_SI6                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_SI6                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_SI6               :  std_logic;   
   SIGNAL RID_SI6                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_SI6                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_SI6                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_SI6                :  std_logic;   
   SIGNAL RVALID_SI6               :  std_logic;   
   SIGNAL BID_SI7                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_SI7                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_SI7               :  std_logic;   
   SIGNAL RID_SI7                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_SI7                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_SI7                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_SI7                :  std_logic;   
   SIGNAL RVALID_SI7               :  std_logic;   
   SIGNAL BID_SI8                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_SI8                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_SI8               :  std_logic;   
   SIGNAL RID_SI8                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_SI8                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_SI8                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_SI8                :  std_logic;   
   SIGNAL RVALID_SI8               :  std_logic;   
   SIGNAL BID_SI9                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_SI9                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_SI9               :  std_logic;   
   SIGNAL RID_SI9                  :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_SI9                :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_SI9                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_SI9                :  std_logic;   
   SIGNAL RVALID_SI9               :  std_logic;   
   SIGNAL BID_SI10                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_SI10               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_SI10              :  std_logic;   
   SIGNAL RID_SI10                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_SI10               :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_SI10               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_SI10               :  std_logic;   
   SIGNAL RVALID_SI10              :  std_logic;   
   SIGNAL BID_SI11                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_SI11               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_SI11              :  std_logic;   
   SIGNAL RID_SI11                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_SI11               :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_SI11               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_SI11               :  std_logic;   
   SIGNAL RVALID_SI11              :  std_logic;   
   SIGNAL BID_SI12                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_SI12               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_SI12              :  std_logic;   
   SIGNAL RID_SI12                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_SI12               :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_SI12               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_SI12               :  std_logic;   
   SIGNAL RVALID_SI12              :  std_logic;   
   SIGNAL BID_SI13                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_SI13               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_SI13              :  std_logic;   
   SIGNAL RID_SI13                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_SI13               :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_SI13               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_SI13               :  std_logic;   
   SIGNAL RVALID_SI13              :  std_logic;   
   SIGNAL BID_SI14                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_SI14               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_SI14              :  std_logic;   
   SIGNAL RID_SI14                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_SI14               :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_SI14               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_SI14               :  std_logic;   
   SIGNAL RVALID_SI14              :  std_logic;   
   SIGNAL BID_SI15                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_SI15               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_SI15              :  std_logic;   
   SIGNAL RID_SI15                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_SI15               :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_SI15               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_SI15               :  std_logic;   
   SIGNAL RVALID_SI15              :  std_logic;   
   SIGNAL BID_SI16                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_SI16               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_SI16              :  std_logic;   
   SIGNAL RID_SI16                 :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_SI16               :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_SI16               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_SI16               :  std_logic;   
   SIGNAL RVALID_SI16              :  std_logic;   
   SIGNAL BID_IM                   :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_IM                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_IM                :  std_logic;   
   SIGNAL RID_IM                   :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_IM                 :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_IM                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_IM                 :  std_logic;   
   SIGNAL RVALID_IM                :  std_logic;   
   SIGNAL m0_rd_end                :  std_logic;   
   SIGNAL m1_rd_end                :  std_logic;   
   SIGNAL m2_rd_end                :  std_logic;   
   SIGNAL m3_rd_end                :  std_logic;   
   SIGNAL m0_wr_end                :  std_logic;   
   SIGNAL m1_wr_end                :  std_logic;   
   SIGNAL m2_wr_end                :  std_logic;   
   SIGNAL m3_wr_end                :  std_logic;   
   SIGNAL AWREADY_M0_xhdl1         :  std_logic;   
   SIGNAL WREADY_M0_xhdl2          :  std_logic;   
   SIGNAL BID_M0_xhdl3             :  std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
   SIGNAL BRESP_M0_xhdl4           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_M0_xhdl5          :  std_logic;   
   SIGNAL ARREADY_M0_xhdl6         :  std_logic;   
   SIGNAL RID_M0_xhdl7             :  std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
   SIGNAL RDATA_M0_xhdl8           :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_M0_xhdl9           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_M0_xhdl10          :  std_logic;   
   SIGNAL RVALID_M0_xhdl11         :  std_logic;   
   SIGNAL AWREADY_M1_xhdl12        :  std_logic;   
   SIGNAL WREADY_M1_xhdl13         :  std_logic;   
   SIGNAL BID_M1_xhdl14            :  std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
   SIGNAL BRESP_M1_xhdl15          :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_M1_xhdl16         :  std_logic;   
   SIGNAL ARREADY_M1_xhdl17        :  std_logic;   
   SIGNAL RID_M1_xhdl18            :  std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
   SIGNAL RDATA_M1_xhdl19          :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_M1_xhdl20          :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_M1_xhdl21          :  std_logic;   
   SIGNAL RVALID_M1_xhdl22         :  std_logic;   
   SIGNAL AWREADY_M2_xhdl23        :  std_logic;   
   SIGNAL WREADY_M2_xhdl24         :  std_logic;   
   SIGNAL BID_M2_xhdl25            :  std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
   SIGNAL BRESP_M2_xhdl26          :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_M2_xhdl27         :  std_logic;   
   SIGNAL ARREADY_M2_xhdl28        :  std_logic;   
   SIGNAL RID_M2_xhdl29            :  std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
   SIGNAL RDATA_M2_xhdl30          :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_M2_xhdl31          :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_M2_xhdl32          :  std_logic;   
   SIGNAL RVALID_M2_xhdl33         :  std_logic;   
   SIGNAL AWREADY_M3_xhdl34        :  std_logic;   
   SIGNAL WREADY_M3_xhdl35         :  std_logic;   
   SIGNAL BID_M3_xhdl36            :  std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
   SIGNAL BRESP_M3_xhdl37          :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_M3_xhdl38         :  std_logic;   
   SIGNAL ARREADY_M3_xhdl39        :  std_logic;   
   SIGNAL RID_M3_xhdl40            :  std_logic_vector(ID_WIDTH - 1 DOWNTO 0);  
   SIGNAL RDATA_M3_xhdl41          :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_M3_xhdl42          :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_M3_xhdl43          :  std_logic;   
   SIGNAL RVALID_M3_xhdl44         :  std_logic;   
   SIGNAL AWID_S0_xhdl45           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_S0_xhdl46         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_S0_xhdl47          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S0_xhdl48         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S0_xhdl49        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S0_xhdl50         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S0_xhdl51        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S0_xhdl52         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S0_xhdl53        :  std_logic;   
   SIGNAL WID_S0_xhdl54            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_S0_xhdl55          :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_S0_xhdl56          :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_S0_xhdl57          :  std_logic;   
   SIGNAL WVALID_S0_xhdl58         :  std_logic;   
   SIGNAL BREADY_S0_xhdl59         :  std_logic;   
   SIGNAL ARID_S0_xhdl60           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_S0_xhdl61         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_S0_xhdl62          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S0_xhdl63         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S0_xhdl64        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S0_xhdl65         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S0_xhdl66        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S0_xhdl67         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S0_xhdl68        :  std_logic;   
   SIGNAL RREADY_S0_xhdl69         :  std_logic;   
   SIGNAL AWID_S1_xhdl70           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_S1_xhdl71         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_S1_xhdl72          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S1_xhdl73         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S1_xhdl74        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S1_xhdl75         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S1_xhdl76        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S1_xhdl77         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S1_xhdl78        :  std_logic;   
   SIGNAL WID_S1_xhdl79            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_S1_xhdl80          :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_S1_xhdl81          :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_S1_xhdl82          :  std_logic;   
   SIGNAL WVALID_S1_xhdl83         :  std_logic;   
   SIGNAL BREADY_S1_xhdl84         :  std_logic;   
   SIGNAL ARID_S1_xhdl85           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_S1_xhdl86         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_S1_xhdl87          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S1_xhdl88         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S1_xhdl89        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S1_xhdl90         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S1_xhdl91        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S1_xhdl92         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S1_xhdl93        :  std_logic;   
   SIGNAL RREADY_S1_xhdl94         :  std_logic;   
   SIGNAL AWID_S2_xhdl95           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_S2_xhdl96         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_S2_xhdl97          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S2_xhdl98         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S2_xhdl99        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S2_xhdl100        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S2_xhdl101       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S2_xhdl102        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S2_xhdl103       :  std_logic;   
   SIGNAL WID_S2_xhdl104           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_S2_xhdl105         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_S2_xhdl106         :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_S2_xhdl107         :  std_logic;   
   SIGNAL WVALID_S2_xhdl108        :  std_logic;   
   SIGNAL BREADY_S2_xhdl109        :  std_logic;   
   SIGNAL ARID_S2_xhdl110          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_S2_xhdl111        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_S2_xhdl112         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S2_xhdl113        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S2_xhdl114       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S2_xhdl115        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S2_xhdl116       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S2_xhdl117        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S2_xhdl118       :  std_logic;   
   SIGNAL RREADY_S2_xhdl119        :  std_logic;   
   SIGNAL AWID_S3_xhdl120          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_S3_xhdl121        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_S3_xhdl122         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S3_xhdl123        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S3_xhdl124       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S3_xhdl125        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S3_xhdl126       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S3_xhdl127        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S3_xhdl128       :  std_logic;   
   SIGNAL WID_S3_xhdl129           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_S3_xhdl130         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_S3_xhdl131         :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_S3_xhdl132         :  std_logic;   
   SIGNAL WVALID_S3_xhdl133        :  std_logic;   
   SIGNAL BREADY_S3_xhdl134        :  std_logic;   
   SIGNAL ARID_S3_xhdl135          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_S3_xhdl136        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_S3_xhdl137         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S3_xhdl138        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S3_xhdl139       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S3_xhdl140        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S3_xhdl141       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S3_xhdl142        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S3_xhdl143       :  std_logic;   
   SIGNAL RREADY_S3_xhdl144        :  std_logic;   
   SIGNAL AWID_S4_xhdl145          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_S4_xhdl146        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_S4_xhdl147         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S4_xhdl148        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S4_xhdl149       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S4_xhdl150        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S4_xhdl151       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S4_xhdl152        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S4_xhdl153       :  std_logic;   
   SIGNAL WID_S4_xhdl154           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_S4_xhdl155         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_S4_xhdl156         :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_S4_xhdl157         :  std_logic;   
   SIGNAL WVALID_S4_xhdl158        :  std_logic;   
   SIGNAL BREADY_S4_xhdl159        :  std_logic;   
   SIGNAL ARID_S4_xhdl160          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_S4_xhdl161        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_S4_xhdl162         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S4_xhdl163        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S4_xhdl164       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S4_xhdl165        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S4_xhdl166       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S4_xhdl167        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S4_xhdl168       :  std_logic;   
   SIGNAL RREADY_S4_xhdl169        :  std_logic;   
   SIGNAL AWID_S5_xhdl170          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_S5_xhdl171        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_S5_xhdl172         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S5_xhdl173        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S5_xhdl174       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S5_xhdl175        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S5_xhdl176       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S5_xhdl177        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S5_xhdl178       :  std_logic;   
   SIGNAL WID_S5_xhdl179           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_S5_xhdl180         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_S5_xhdl181         :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_S5_xhdl182         :  std_logic;   
   SIGNAL WVALID_S5_xhdl183        :  std_logic;   
   SIGNAL BREADY_S5_xhdl184        :  std_logic;   
   SIGNAL ARID_S5_xhdl185          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_S5_xhdl186        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_S5_xhdl187         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S5_xhdl188        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S5_xhdl189       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S5_xhdl190        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S5_xhdl191       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S5_xhdl192        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S5_xhdl193       :  std_logic;   
   SIGNAL RREADY_S5_xhdl194        :  std_logic;   
   SIGNAL AWID_S6_xhdl195          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_S6_xhdl196        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_S6_xhdl197         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S6_xhdl198        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S6_xhdl199       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S6_xhdl200        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S6_xhdl201       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S6_xhdl202        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S6_xhdl203       :  std_logic;   
   SIGNAL WID_S6_xhdl204           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_S6_xhdl205         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_S6_xhdl206         :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_S6_xhdl207         :  std_logic;   
   SIGNAL WVALID_S6_xhdl208        :  std_logic;   
   SIGNAL BREADY_S6_xhdl209        :  std_logic;   
   SIGNAL ARID_S6_xhdl210          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_S6_xhdl211        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_S6_xhdl212         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S6_xhdl213        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S6_xhdl214       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S6_xhdl215        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S6_xhdl216       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S6_xhdl217        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S6_xhdl218       :  std_logic;   
   SIGNAL RREADY_S6_xhdl219        :  std_logic;   
   SIGNAL AWID_S7_xhdl220          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_S7_xhdl221        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_S7_xhdl222         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S7_xhdl223        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S7_xhdl224       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S7_xhdl225        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S7_xhdl226       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S7_xhdl227        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S7_xhdl228       :  std_logic;   
   SIGNAL WID_S7_xhdl229           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_S7_xhdl230         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_S7_xhdl231         :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_S7_xhdl232         :  std_logic;   
   SIGNAL WVALID_S7_xhdl233        :  std_logic;   
   SIGNAL BREADY_S7_xhdl234        :  std_logic;   
   SIGNAL ARID_S7_xhdl235          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_S7_xhdl236        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_S7_xhdl237         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S7_xhdl238        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S7_xhdl239       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S7_xhdl240        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S7_xhdl241       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S7_xhdl242        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S7_xhdl243       :  std_logic;   
   SIGNAL RREADY_S7_xhdl244        :  std_logic;   
   SIGNAL AWID_S8_xhdl245          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_S8_xhdl246        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_S8_xhdl247         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S8_xhdl248        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S8_xhdl249       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S8_xhdl250        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S8_xhdl251       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S8_xhdl252        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S8_xhdl253       :  std_logic;   
   SIGNAL WID_S8_xhdl254           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_S8_xhdl255         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_S8_xhdl256         :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_S8_xhdl257         :  std_logic;   
   SIGNAL WVALID_S8_xhdl258        :  std_logic;   
   SIGNAL BREADY_S8_xhdl259        :  std_logic;   
   SIGNAL ARID_S8_xhdl260          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_S8_xhdl261        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_S8_xhdl262         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S8_xhdl263        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S8_xhdl264       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S8_xhdl265        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S8_xhdl266       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S8_xhdl267        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S8_xhdl268       :  std_logic;   
   SIGNAL RREADY_S8_xhdl269        :  std_logic;   
   SIGNAL AWID_S9_xhdl270          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_S9_xhdl271        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_S9_xhdl272         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S9_xhdl273        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S9_xhdl274       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S9_xhdl275        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S9_xhdl276       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S9_xhdl277        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S9_xhdl278       :  std_logic;   
   SIGNAL WID_S9_xhdl279           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_S9_xhdl280         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_S9_xhdl281         :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_S9_xhdl282         :  std_logic;   
   SIGNAL WVALID_S9_xhdl283        :  std_logic;   
   SIGNAL BREADY_S9_xhdl284        :  std_logic;   
   SIGNAL ARID_S9_xhdl285          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_S9_xhdl286        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_S9_xhdl287         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S9_xhdl288        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S9_xhdl289       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S9_xhdl290        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S9_xhdl291       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S9_xhdl292        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S9_xhdl293       :  std_logic;   
   SIGNAL RREADY_S9_xhdl294        :  std_logic;   
   SIGNAL AWID_S10_xhdl295         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_S10_xhdl296       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_S10_xhdl297        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S10_xhdl298       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S10_xhdl299      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S10_xhdl300       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S10_xhdl301      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S10_xhdl302       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S10_xhdl303      :  std_logic;   
   SIGNAL WID_S10_xhdl304          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_S10_xhdl305        :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_S10_xhdl306        :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_S10_xhdl307        :  std_logic;   
   SIGNAL WVALID_S10_xhdl308       :  std_logic;   
   SIGNAL BREADY_S10_xhdl309       :  std_logic;   
   SIGNAL ARID_S10_xhdl310         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_S10_xhdl311       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_S10_xhdl312        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S10_xhdl313       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S10_xhdl314      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S10_xhdl315       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S10_xhdl316      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S10_xhdl317       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S10_xhdl318      :  std_logic;   
   SIGNAL RREADY_S10_xhdl319       :  std_logic;   
   SIGNAL AWID_S11_xhdl320         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_S11_xhdl321       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_S11_xhdl322        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S11_xhdl323       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S11_xhdl324      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S11_xhdl325       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S11_xhdl326      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S11_xhdl327       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S11_xhdl328      :  std_logic;   
   SIGNAL WID_S11_xhdl329          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_S11_xhdl330        :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_S11_xhdl331        :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_S11_xhdl332        :  std_logic;   
   SIGNAL WVALID_S11_xhdl333       :  std_logic;   
   SIGNAL BREADY_S11_xhdl334       :  std_logic;   
   SIGNAL ARID_S11_xhdl335         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_S11_xhdl336       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_S11_xhdl337        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S11_xhdl338       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S11_xhdl339      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S11_xhdl340       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S11_xhdl341      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S11_xhdl342       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S11_xhdl343      :  std_logic;   
   SIGNAL RREADY_S11_xhdl344       :  std_logic;   
   SIGNAL AWID_S12_xhdl345         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_S12_xhdl346       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_S12_xhdl347        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S12_xhdl348       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S12_xhdl349      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S12_xhdl350       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S12_xhdl351      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S12_xhdl352       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S12_xhdl353      :  std_logic;   
   SIGNAL WID_S12_xhdl354          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_S12_xhdl355        :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_S12_xhdl356        :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_S12_xhdl357        :  std_logic;   
   SIGNAL WVALID_S12_xhdl358       :  std_logic;   
   SIGNAL BREADY_S12_xhdl359       :  std_logic;   
   SIGNAL ARID_S12_xhdl360         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_S12_xhdl361       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_S12_xhdl362        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S12_xhdl363       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S12_xhdl364      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S12_xhdl365       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S12_xhdl366      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S12_xhdl367       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S12_xhdl368      :  std_logic;   
   SIGNAL RREADY_S12_xhdl369       :  std_logic;   
   SIGNAL AWID_S13_xhdl370         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_S13_xhdl371       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_S13_xhdl372        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S13_xhdl373       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S13_xhdl374      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S13_xhdl375       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S13_xhdl376      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S13_xhdl377       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S13_xhdl378      :  std_logic;   
   SIGNAL WID_S13_xhdl379          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_S13_xhdl380        :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_S13_xhdl381        :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_S13_xhdl382        :  std_logic;   
   SIGNAL WVALID_S13_xhdl383       :  std_logic;   
   SIGNAL BREADY_S13_xhdl384       :  std_logic;   
   SIGNAL ARID_S13_xhdl385         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_S13_xhdl386       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_S13_xhdl387        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S13_xhdl388       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S13_xhdl389      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S13_xhdl390       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S13_xhdl391      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S13_xhdl392       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S13_xhdl393      :  std_logic;   
   SIGNAL RREADY_S13_xhdl394       :  std_logic;   
   SIGNAL AWID_S14_xhdl395         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_S14_xhdl396       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_S14_xhdl397        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S14_xhdl398       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S14_xhdl399      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S14_xhdl400       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S14_xhdl401      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S14_xhdl402       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S14_xhdl403      :  std_logic;   
   SIGNAL WID_S14_xhdl404          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_S14_xhdl405        :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_S14_xhdl406        :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_S14_xhdl407        :  std_logic;   
   SIGNAL WVALID_S14_xhdl408       :  std_logic;   
   SIGNAL BREADY_S14_xhdl409       :  std_logic;   
   SIGNAL ARID_S14_xhdl410         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_S14_xhdl411       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_S14_xhdl412        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S14_xhdl413       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S14_xhdl414      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S14_xhdl415       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S14_xhdl416      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S14_xhdl417       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S14_xhdl418      :  std_logic;   
   SIGNAL RREADY_S14_xhdl419       :  std_logic;   
   SIGNAL AWID_S15_xhdl420         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_S15_xhdl421       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_S15_xhdl422        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S15_xhdl423       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S15_xhdl424      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S15_xhdl425       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S15_xhdl426      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S15_xhdl427       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S15_xhdl428      :  std_logic;   
   SIGNAL WID_S15_xhdl429          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_S15_xhdl430        :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_S15_xhdl431        :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_S15_xhdl432        :  std_logic;   
   SIGNAL WVALID_S15_xhdl433       :  std_logic;   
   SIGNAL BREADY_S15_xhdl434       :  std_logic;   
   SIGNAL ARID_S15_xhdl435         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_S15_xhdl436       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_S15_xhdl437        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S15_xhdl438       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S15_xhdl439      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S15_xhdl440       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S15_xhdl441      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S15_xhdl442       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S15_xhdl443      :  std_logic;   
   SIGNAL RREADY_S15_xhdl444       :  std_logic;   
   SIGNAL AWID_S16_xhdl445         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_S16_xhdl446       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_S16_xhdl447        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S16_xhdl448       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S16_xhdl449      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S16_xhdl450       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S16_xhdl451      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S16_xhdl452       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S16_xhdl453      :  std_logic;   
   SIGNAL WID_S16_xhdl454          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_S16_xhdl455        :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_S16_xhdl456        :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_S16_xhdl457        :  std_logic;   
   SIGNAL WVALID_S16_xhdl458       :  std_logic;   
   SIGNAL BREADY_S16_xhdl459       :  std_logic;   
   SIGNAL ARID_S16_xhdl460         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_S16_xhdl461       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_S16_xhdl462        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S16_xhdl463       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S16_xhdl464      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S16_xhdl465       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S16_xhdl466      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S16_xhdl467       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S16_xhdl468      :  std_logic;   
   SIGNAL RREADY_S16_xhdl469       :  std_logic;   
   SIGNAL areset_n                 :  std_logic;   
   SIGNAL sresetn                  :  std_logic;   

BEGIN
   -- --------------------------------------------------------------------------
   -- Resets
   -- --------------------------------------------------------------------------
   areset_n  <= '1' WHEN (SYNC_RESET = 1) ELSE ARESETN;
   sresetn   <= ARESETN WHEN (SYNC_RESET = 1) ELSE '1';

   AWREADY_M0 <= AWREADY_M0_xhdl1;
   WREADY_M0 <= WREADY_M0_xhdl2;
   BID_M0 <= BID_M0_xhdl3;
   BRESP_M0 <= BRESP_M0_xhdl4;
   BVALID_M0 <= BVALID_M0_xhdl5;
   ARREADY_M0 <= ARREADY_M0_xhdl6;
   RID_M0 <= RID_M0_xhdl7;
   RDATA_M0 <= RDATA_M0_xhdl8;
   RRESP_M0 <= RRESP_M0_xhdl9;
   RLAST_M0 <= RLAST_M0_xhdl10;
   RVALID_M0 <= RVALID_M0_xhdl11;
   AWREADY_M1 <= AWREADY_M1_xhdl12;
   WREADY_M1 <= WREADY_M1_xhdl13;
   BID_M1 <= BID_M1_xhdl14;
   BRESP_M1 <= BRESP_M1_xhdl15;
   BVALID_M1 <= BVALID_M1_xhdl16;
   ARREADY_M1 <= ARREADY_M1_xhdl17;
   RID_M1 <= RID_M1_xhdl18;
   RDATA_M1 <= RDATA_M1_xhdl19;
   RRESP_M1 <= RRESP_M1_xhdl20;
   RLAST_M1 <= RLAST_M1_xhdl21;
   RVALID_M1 <= RVALID_M1_xhdl22;
   AWREADY_M2 <= AWREADY_M2_xhdl23;
   WREADY_M2 <= WREADY_M2_xhdl24;
   BID_M2 <= BID_M2_xhdl25;
   BRESP_M2 <= BRESP_M2_xhdl26;
   BVALID_M2 <= BVALID_M2_xhdl27;
   ARREADY_M2 <= ARREADY_M2_xhdl28;
   RID_M2 <= RID_M2_xhdl29;
   RDATA_M2 <= RDATA_M2_xhdl30;
   RRESP_M2 <= RRESP_M2_xhdl31;
   RLAST_M2 <= RLAST_M2_xhdl32;
   RVALID_M2 <= RVALID_M2_xhdl33;
   AWREADY_M3 <= AWREADY_M3_xhdl34;
   WREADY_M3 <= WREADY_M3_xhdl35;
   BID_M3 <= BID_M3_xhdl36;
   BRESP_M3 <= BRESP_M3_xhdl37;
   BVALID_M3 <= BVALID_M3_xhdl38;
   ARREADY_M3 <= ARREADY_M3_xhdl39;
   RID_M3 <= RID_M3_xhdl40;
   RDATA_M3 <= RDATA_M3_xhdl41;
   RRESP_M3 <= RRESP_M3_xhdl42;
   RLAST_M3 <= RLAST_M3_xhdl43;
   RVALID_M3 <= RVALID_M3_xhdl44;
   AWID_S0 <= AWID_S0_xhdl45;
   AWADDR_S0 <= AWADDR_S0_xhdl46;
   AWLEN_S0 <= AWLEN_S0_xhdl47;
   AWSIZE_S0 <= AWSIZE_S0_xhdl48;
   AWBURST_S0 <= AWBURST_S0_xhdl49;
   AWLOCK_S0 <= AWLOCK_S0_xhdl50;
   AWCACHE_S0 <= AWCACHE_S0_xhdl51;
   AWPROT_S0 <= AWPROT_S0_xhdl52;
   AWVALID_S0 <= AWVALID_S0_xhdl53;
   WID_S0 <= WID_S0_xhdl54;
   WDATA_S0 <= WDATA_S0_xhdl55;
   WSTRB_S0 <= WSTRB_S0_xhdl56;
   WLAST_S0 <= WLAST_S0_xhdl57;
   WVALID_S0 <= WVALID_S0_xhdl58;
   BREADY_S0 <= BREADY_S0_xhdl59;
   ARID_S0 <= ARID_S0_xhdl60;
   ARADDR_S0 <= ARADDR_S0_xhdl61;
   ARLEN_S0 <= ARLEN_S0_xhdl62;
   ARSIZE_S0 <= ARSIZE_S0_xhdl63;
   ARBURST_S0 <= ARBURST_S0_xhdl64;
   ARLOCK_S0 <= ARLOCK_S0_xhdl65;
   ARCACHE_S0 <= ARCACHE_S0_xhdl66;
   ARPROT_S0 <= ARPROT_S0_xhdl67;
   ARVALID_S0 <= ARVALID_S0_xhdl68;
   RREADY_S0 <= RREADY_S0_xhdl69;
   AWID_S1 <= AWID_S1_xhdl70;
   AWADDR_S1 <= AWADDR_S1_xhdl71;
   AWLEN_S1 <= AWLEN_S1_xhdl72;
   AWSIZE_S1 <= AWSIZE_S1_xhdl73;
   AWBURST_S1 <= AWBURST_S1_xhdl74;
   AWLOCK_S1 <= AWLOCK_S1_xhdl75;
   AWCACHE_S1 <= AWCACHE_S1_xhdl76;
   AWPROT_S1 <= AWPROT_S1_xhdl77;
   AWVALID_S1 <= AWVALID_S1_xhdl78;
   WID_S1 <= WID_S1_xhdl79;
   WDATA_S1 <= WDATA_S1_xhdl80;
   WSTRB_S1 <= WSTRB_S1_xhdl81;
   WLAST_S1 <= WLAST_S1_xhdl82;
   WVALID_S1 <= WVALID_S1_xhdl83;
   BREADY_S1 <= BREADY_S1_xhdl84;
   ARID_S1 <= ARID_S1_xhdl85;
   ARADDR_S1 <= ARADDR_S1_xhdl86;
   ARLEN_S1 <= ARLEN_S1_xhdl87;
   ARSIZE_S1 <= ARSIZE_S1_xhdl88;
   ARBURST_S1 <= ARBURST_S1_xhdl89;
   ARLOCK_S1 <= ARLOCK_S1_xhdl90;
   ARCACHE_S1 <= ARCACHE_S1_xhdl91;
   ARPROT_S1 <= ARPROT_S1_xhdl92;
   ARVALID_S1 <= ARVALID_S1_xhdl93;
   RREADY_S1 <= RREADY_S1_xhdl94;
   AWID_S2 <= AWID_S2_xhdl95;
   AWADDR_S2 <= AWADDR_S2_xhdl96;
   AWLEN_S2 <= AWLEN_S2_xhdl97;
   AWSIZE_S2 <= AWSIZE_S2_xhdl98;
   AWBURST_S2 <= AWBURST_S2_xhdl99;
   AWLOCK_S2 <= AWLOCK_S2_xhdl100;
   AWCACHE_S2 <= AWCACHE_S2_xhdl101;
   AWPROT_S2 <= AWPROT_S2_xhdl102;
   AWVALID_S2 <= AWVALID_S2_xhdl103;
   WID_S2 <= WID_S2_xhdl104;
   WDATA_S2 <= WDATA_S2_xhdl105;
   WSTRB_S2 <= WSTRB_S2_xhdl106;
   WLAST_S2 <= WLAST_S2_xhdl107;
   WVALID_S2 <= WVALID_S2_xhdl108;
   BREADY_S2 <= BREADY_S2_xhdl109;
   ARID_S2 <= ARID_S2_xhdl110;
   ARADDR_S2 <= ARADDR_S2_xhdl111;
   ARLEN_S2 <= ARLEN_S2_xhdl112;
   ARSIZE_S2 <= ARSIZE_S2_xhdl113;
   ARBURST_S2 <= ARBURST_S2_xhdl114;
   ARLOCK_S2 <= ARLOCK_S2_xhdl115;
   ARCACHE_S2 <= ARCACHE_S2_xhdl116;
   ARPROT_S2 <= ARPROT_S2_xhdl117;
   ARVALID_S2 <= ARVALID_S2_xhdl118;
   RREADY_S2 <= RREADY_S2_xhdl119;
   AWID_S3 <= AWID_S3_xhdl120;
   AWADDR_S3 <= AWADDR_S3_xhdl121;
   AWLEN_S3 <= AWLEN_S3_xhdl122;
   AWSIZE_S3 <= AWSIZE_S3_xhdl123;
   AWBURST_S3 <= AWBURST_S3_xhdl124;
   AWLOCK_S3 <= AWLOCK_S3_xhdl125;
   AWCACHE_S3 <= AWCACHE_S3_xhdl126;
   AWPROT_S3 <= AWPROT_S3_xhdl127;
   AWVALID_S3 <= AWVALID_S3_xhdl128;
   WID_S3 <= WID_S3_xhdl129;
   WDATA_S3 <= WDATA_S3_xhdl130;
   WSTRB_S3 <= WSTRB_S3_xhdl131;
   WLAST_S3 <= WLAST_S3_xhdl132;
   WVALID_S3 <= WVALID_S3_xhdl133;
   BREADY_S3 <= BREADY_S3_xhdl134;
   ARID_S3 <= ARID_S3_xhdl135;
   ARADDR_S3 <= ARADDR_S3_xhdl136;
   ARLEN_S3 <= ARLEN_S3_xhdl137;
   ARSIZE_S3 <= ARSIZE_S3_xhdl138;
   ARBURST_S3 <= ARBURST_S3_xhdl139;
   ARLOCK_S3 <= ARLOCK_S3_xhdl140;
   ARCACHE_S3 <= ARCACHE_S3_xhdl141;
   ARPROT_S3 <= ARPROT_S3_xhdl142;
   ARVALID_S3 <= ARVALID_S3_xhdl143;
   RREADY_S3 <= RREADY_S3_xhdl144;
   AWID_S4 <= AWID_S4_xhdl145;
   AWADDR_S4 <= AWADDR_S4_xhdl146;
   AWLEN_S4 <= AWLEN_S4_xhdl147;
   AWSIZE_S4 <= AWSIZE_S4_xhdl148;
   AWBURST_S4 <= AWBURST_S4_xhdl149;
   AWLOCK_S4 <= AWLOCK_S4_xhdl150;
   AWCACHE_S4 <= AWCACHE_S4_xhdl151;
   AWPROT_S4 <= AWPROT_S4_xhdl152;
   AWVALID_S4 <= AWVALID_S4_xhdl153;
   WID_S4 <= WID_S4_xhdl154;
   WDATA_S4 <= WDATA_S4_xhdl155;
   WSTRB_S4 <= WSTRB_S4_xhdl156;
   WLAST_S4 <= WLAST_S4_xhdl157;
   WVALID_S4 <= WVALID_S4_xhdl158;
   BREADY_S4 <= BREADY_S4_xhdl159;
   ARID_S4 <= ARID_S4_xhdl160;
   ARADDR_S4 <= ARADDR_S4_xhdl161;
   ARLEN_S4 <= ARLEN_S4_xhdl162;
   ARSIZE_S4 <= ARSIZE_S4_xhdl163;
   ARBURST_S4 <= ARBURST_S4_xhdl164;
   ARLOCK_S4 <= ARLOCK_S4_xhdl165;
   ARCACHE_S4 <= ARCACHE_S4_xhdl166;
   ARPROT_S4 <= ARPROT_S4_xhdl167;
   ARVALID_S4 <= ARVALID_S4_xhdl168;
   RREADY_S4 <= RREADY_S4_xhdl169;
   AWID_S5 <= AWID_S5_xhdl170;
   AWADDR_S5 <= AWADDR_S5_xhdl171;
   AWLEN_S5 <= AWLEN_S5_xhdl172;
   AWSIZE_S5 <= AWSIZE_S5_xhdl173;
   AWBURST_S5 <= AWBURST_S5_xhdl174;
   AWLOCK_S5 <= AWLOCK_S5_xhdl175;
   AWCACHE_S5 <= AWCACHE_S5_xhdl176;
   AWPROT_S5 <= AWPROT_S5_xhdl177;
   AWVALID_S5 <= AWVALID_S5_xhdl178;
   WID_S5 <= WID_S5_xhdl179;
   WDATA_S5 <= WDATA_S5_xhdl180;
   WSTRB_S5 <= WSTRB_S5_xhdl181;
   WLAST_S5 <= WLAST_S5_xhdl182;
   WVALID_S5 <= WVALID_S5_xhdl183;
   BREADY_S5 <= BREADY_S5_xhdl184;
   ARID_S5 <= ARID_S5_xhdl185;
   ARADDR_S5 <= ARADDR_S5_xhdl186;
   ARLEN_S5 <= ARLEN_S5_xhdl187;
   ARSIZE_S5 <= ARSIZE_S5_xhdl188;
   ARBURST_S5 <= ARBURST_S5_xhdl189;
   ARLOCK_S5 <= ARLOCK_S5_xhdl190;
   ARCACHE_S5 <= ARCACHE_S5_xhdl191;
   ARPROT_S5 <= ARPROT_S5_xhdl192;
   ARVALID_S5 <= ARVALID_S5_xhdl193;
   RREADY_S5 <= RREADY_S5_xhdl194;
   AWID_S6 <= AWID_S6_xhdl195;
   AWADDR_S6 <= AWADDR_S6_xhdl196;
   AWLEN_S6 <= AWLEN_S6_xhdl197;
   AWSIZE_S6 <= AWSIZE_S6_xhdl198;
   AWBURST_S6 <= AWBURST_S6_xhdl199;
   AWLOCK_S6 <= AWLOCK_S6_xhdl200;
   AWCACHE_S6 <= AWCACHE_S6_xhdl201;
   AWPROT_S6 <= AWPROT_S6_xhdl202;
   AWVALID_S6 <= AWVALID_S6_xhdl203;
   WID_S6 <= WID_S6_xhdl204;
   WDATA_S6 <= WDATA_S6_xhdl205;
   WSTRB_S6 <= WSTRB_S6_xhdl206;
   WLAST_S6 <= WLAST_S6_xhdl207;
   WVALID_S6 <= WVALID_S6_xhdl208;
   BREADY_S6 <= BREADY_S6_xhdl209;
   ARID_S6 <= ARID_S6_xhdl210;
   ARADDR_S6 <= ARADDR_S6_xhdl211;
   ARLEN_S6 <= ARLEN_S6_xhdl212;
   ARSIZE_S6 <= ARSIZE_S6_xhdl213;
   ARBURST_S6 <= ARBURST_S6_xhdl214;
   ARLOCK_S6 <= ARLOCK_S6_xhdl215;
   ARCACHE_S6 <= ARCACHE_S6_xhdl216;
   ARPROT_S6 <= ARPROT_S6_xhdl217;
   ARVALID_S6 <= ARVALID_S6_xhdl218;
   RREADY_S6 <= RREADY_S6_xhdl219;
   AWID_S7 <= AWID_S7_xhdl220;
   AWADDR_S7 <= AWADDR_S7_xhdl221;
   AWLEN_S7 <= AWLEN_S7_xhdl222;
   AWSIZE_S7 <= AWSIZE_S7_xhdl223;
   AWBURST_S7 <= AWBURST_S7_xhdl224;
   AWLOCK_S7 <= AWLOCK_S7_xhdl225;
   AWCACHE_S7 <= AWCACHE_S7_xhdl226;
   AWPROT_S7 <= AWPROT_S7_xhdl227;
   AWVALID_S7 <= AWVALID_S7_xhdl228;
   WID_S7 <= WID_S7_xhdl229;
   WDATA_S7 <= WDATA_S7_xhdl230;
   WSTRB_S7 <= WSTRB_S7_xhdl231;
   WLAST_S7 <= WLAST_S7_xhdl232;
   WVALID_S7 <= WVALID_S7_xhdl233;
   BREADY_S7 <= BREADY_S7_xhdl234;
   ARID_S7 <= ARID_S7_xhdl235;
   ARADDR_S7 <= ARADDR_S7_xhdl236;
   ARLEN_S7 <= ARLEN_S7_xhdl237;
   ARSIZE_S7 <= ARSIZE_S7_xhdl238;
   ARBURST_S7 <= ARBURST_S7_xhdl239;
   ARLOCK_S7 <= ARLOCK_S7_xhdl240;
   ARCACHE_S7 <= ARCACHE_S7_xhdl241;
   ARPROT_S7 <= ARPROT_S7_xhdl242;
   ARVALID_S7 <= ARVALID_S7_xhdl243;
   RREADY_S7 <= RREADY_S7_xhdl244;
   AWID_S8 <= AWID_S8_xhdl245;
   AWADDR_S8 <= AWADDR_S8_xhdl246;
   AWLEN_S8 <= AWLEN_S8_xhdl247;
   AWSIZE_S8 <= AWSIZE_S8_xhdl248;
   AWBURST_S8 <= AWBURST_S8_xhdl249;
   AWLOCK_S8 <= AWLOCK_S8_xhdl250;
   AWCACHE_S8 <= AWCACHE_S8_xhdl251;
   AWPROT_S8 <= AWPROT_S8_xhdl252;
   AWVALID_S8 <= AWVALID_S8_xhdl253;
   WID_S8 <= WID_S8_xhdl254;
   WDATA_S8 <= WDATA_S8_xhdl255;
   WSTRB_S8 <= WSTRB_S8_xhdl256;
   WLAST_S8 <= WLAST_S8_xhdl257;
   WVALID_S8 <= WVALID_S8_xhdl258;
   BREADY_S8 <= BREADY_S8_xhdl259;
   ARID_S8 <= ARID_S8_xhdl260;
   ARADDR_S8 <= ARADDR_S8_xhdl261;
   ARLEN_S8 <= ARLEN_S8_xhdl262;
   ARSIZE_S8 <= ARSIZE_S8_xhdl263;
   ARBURST_S8 <= ARBURST_S8_xhdl264;
   ARLOCK_S8 <= ARLOCK_S8_xhdl265;
   ARCACHE_S8 <= ARCACHE_S8_xhdl266;
   ARPROT_S8 <= ARPROT_S8_xhdl267;
   ARVALID_S8 <= ARVALID_S8_xhdl268;
   RREADY_S8 <= RREADY_S8_xhdl269;
   AWID_S9 <= AWID_S9_xhdl270;
   AWADDR_S9 <= AWADDR_S9_xhdl271;
   AWLEN_S9 <= AWLEN_S9_xhdl272;
   AWSIZE_S9 <= AWSIZE_S9_xhdl273;
   AWBURST_S9 <= AWBURST_S9_xhdl274;
   AWLOCK_S9 <= AWLOCK_S9_xhdl275;
   AWCACHE_S9 <= AWCACHE_S9_xhdl276;
   AWPROT_S9 <= AWPROT_S9_xhdl277;
   AWVALID_S9 <= AWVALID_S9_xhdl278;
   WID_S9 <= WID_S9_xhdl279;
   WDATA_S9 <= WDATA_S9_xhdl280;
   WSTRB_S9 <= WSTRB_S9_xhdl281;
   WLAST_S9 <= WLAST_S9_xhdl282;
   WVALID_S9 <= WVALID_S9_xhdl283;
   BREADY_S9 <= BREADY_S9_xhdl284;
   ARID_S9 <= ARID_S9_xhdl285;
   ARADDR_S9 <= ARADDR_S9_xhdl286;
   ARLEN_S9 <= ARLEN_S9_xhdl287;
   ARSIZE_S9 <= ARSIZE_S9_xhdl288;
   ARBURST_S9 <= ARBURST_S9_xhdl289;
   ARLOCK_S9 <= ARLOCK_S9_xhdl290;
   ARCACHE_S9 <= ARCACHE_S9_xhdl291;
   ARPROT_S9 <= ARPROT_S9_xhdl292;
   ARVALID_S9 <= ARVALID_S9_xhdl293;
   RREADY_S9 <= RREADY_S9_xhdl294;
   AWID_S10 <= AWID_S10_xhdl295;
   AWADDR_S10 <= AWADDR_S10_xhdl296;
   AWLEN_S10 <= AWLEN_S10_xhdl297;
   AWSIZE_S10 <= AWSIZE_S10_xhdl298;
   AWBURST_S10 <= AWBURST_S10_xhdl299;
   AWLOCK_S10 <= AWLOCK_S10_xhdl300;
   AWCACHE_S10 <= AWCACHE_S10_xhdl301;
   AWPROT_S10 <= AWPROT_S10_xhdl302;
   AWVALID_S10 <= AWVALID_S10_xhdl303;
   WID_S10 <= WID_S10_xhdl304;
   WDATA_S10 <= WDATA_S10_xhdl305;
   WSTRB_S10 <= WSTRB_S10_xhdl306;
   WLAST_S10 <= WLAST_S10_xhdl307;
   WVALID_S10 <= WVALID_S10_xhdl308;
   BREADY_S10 <= BREADY_S10_xhdl309;
   ARID_S10 <= ARID_S10_xhdl310;
   ARADDR_S10 <= ARADDR_S10_xhdl311;
   ARLEN_S10 <= ARLEN_S10_xhdl312;
   ARSIZE_S10 <= ARSIZE_S10_xhdl313;
   ARBURST_S10 <= ARBURST_S10_xhdl314;
   ARLOCK_S10 <= ARLOCK_S10_xhdl315;
   ARCACHE_S10 <= ARCACHE_S10_xhdl316;
   ARPROT_S10 <= ARPROT_S10_xhdl317;
   ARVALID_S10 <= ARVALID_S10_xhdl318;
   RREADY_S10 <= RREADY_S10_xhdl319;
   AWID_S11 <= AWID_S11_xhdl320;
   AWADDR_S11 <= AWADDR_S11_xhdl321;
   AWLEN_S11 <= AWLEN_S11_xhdl322;
   AWSIZE_S11 <= AWSIZE_S11_xhdl323;
   AWBURST_S11 <= AWBURST_S11_xhdl324;
   AWLOCK_S11 <= AWLOCK_S11_xhdl325;
   AWCACHE_S11 <= AWCACHE_S11_xhdl326;
   AWPROT_S11 <= AWPROT_S11_xhdl327;
   AWVALID_S11 <= AWVALID_S11_xhdl328;
   WID_S11 <= WID_S11_xhdl329;
   WDATA_S11 <= WDATA_S11_xhdl330;
   WSTRB_S11 <= WSTRB_S11_xhdl331;
   WLAST_S11 <= WLAST_S11_xhdl332;
   WVALID_S11 <= WVALID_S11_xhdl333;
   BREADY_S11 <= BREADY_S11_xhdl334;
   ARID_S11 <= ARID_S11_xhdl335;
   ARADDR_S11 <= ARADDR_S11_xhdl336;
   ARLEN_S11 <= ARLEN_S11_xhdl337;
   ARSIZE_S11 <= ARSIZE_S11_xhdl338;
   ARBURST_S11 <= ARBURST_S11_xhdl339;
   ARLOCK_S11 <= ARLOCK_S11_xhdl340;
   ARCACHE_S11 <= ARCACHE_S11_xhdl341;
   ARPROT_S11 <= ARPROT_S11_xhdl342;
   ARVALID_S11 <= ARVALID_S11_xhdl343;
   RREADY_S11 <= RREADY_S11_xhdl344;
   AWID_S12 <= AWID_S12_xhdl345;
   AWADDR_S12 <= AWADDR_S12_xhdl346;
   AWLEN_S12 <= AWLEN_S12_xhdl347;
   AWSIZE_S12 <= AWSIZE_S12_xhdl348;
   AWBURST_S12 <= AWBURST_S12_xhdl349;
   AWLOCK_S12 <= AWLOCK_S12_xhdl350;
   AWCACHE_S12 <= AWCACHE_S12_xhdl351;
   AWPROT_S12 <= AWPROT_S12_xhdl352;
   AWVALID_S12 <= AWVALID_S12_xhdl353;
   WID_S12 <= WID_S12_xhdl354;
   WDATA_S12 <= WDATA_S12_xhdl355;
   WSTRB_S12 <= WSTRB_S12_xhdl356;
   WLAST_S12 <= WLAST_S12_xhdl357;
   WVALID_S12 <= WVALID_S12_xhdl358;
   BREADY_S12 <= BREADY_S12_xhdl359;
   ARID_S12 <= ARID_S12_xhdl360;
   ARADDR_S12 <= ARADDR_S12_xhdl361;
   ARLEN_S12 <= ARLEN_S12_xhdl362;
   ARSIZE_S12 <= ARSIZE_S12_xhdl363;
   ARBURST_S12 <= ARBURST_S12_xhdl364;
   ARLOCK_S12 <= ARLOCK_S12_xhdl365;
   ARCACHE_S12 <= ARCACHE_S12_xhdl366;
   ARPROT_S12 <= ARPROT_S12_xhdl367;
   ARVALID_S12 <= ARVALID_S12_xhdl368;
   RREADY_S12 <= RREADY_S12_xhdl369;
   AWID_S13 <= AWID_S13_xhdl370;
   AWADDR_S13 <= AWADDR_S13_xhdl371;
   AWLEN_S13 <= AWLEN_S13_xhdl372;
   AWSIZE_S13 <= AWSIZE_S13_xhdl373;
   AWBURST_S13 <= AWBURST_S13_xhdl374;
   AWLOCK_S13 <= AWLOCK_S13_xhdl375;
   AWCACHE_S13 <= AWCACHE_S13_xhdl376;
   AWPROT_S13 <= AWPROT_S13_xhdl377;
   AWVALID_S13 <= AWVALID_S13_xhdl378;
   WID_S13 <= WID_S13_xhdl379;
   WDATA_S13 <= WDATA_S13_xhdl380;
   WSTRB_S13 <= WSTRB_S13_xhdl381;
   WLAST_S13 <= WLAST_S13_xhdl382;
   WVALID_S13 <= WVALID_S13_xhdl383;
   BREADY_S13 <= BREADY_S13_xhdl384;
   ARID_S13 <= ARID_S13_xhdl385;
   ARADDR_S13 <= ARADDR_S13_xhdl386;
   ARLEN_S13 <= ARLEN_S13_xhdl387;
   ARSIZE_S13 <= ARSIZE_S13_xhdl388;
   ARBURST_S13 <= ARBURST_S13_xhdl389;
   ARLOCK_S13 <= ARLOCK_S13_xhdl390;
   ARCACHE_S13 <= ARCACHE_S13_xhdl391;
   ARPROT_S13 <= ARPROT_S13_xhdl392;
   ARVALID_S13 <= ARVALID_S13_xhdl393;
   RREADY_S13 <= RREADY_S13_xhdl394;
   AWID_S14 <= AWID_S14_xhdl395;
   AWADDR_S14 <= AWADDR_S14_xhdl396;
   AWLEN_S14 <= AWLEN_S14_xhdl397;
   AWSIZE_S14 <= AWSIZE_S14_xhdl398;
   AWBURST_S14 <= AWBURST_S14_xhdl399;
   AWLOCK_S14 <= AWLOCK_S14_xhdl400;
   AWCACHE_S14 <= AWCACHE_S14_xhdl401;
   AWPROT_S14 <= AWPROT_S14_xhdl402;
   AWVALID_S14 <= AWVALID_S14_xhdl403;
   WID_S14 <= WID_S14_xhdl404;
   WDATA_S14 <= WDATA_S14_xhdl405;
   WSTRB_S14 <= WSTRB_S14_xhdl406;
   WLAST_S14 <= WLAST_S14_xhdl407;
   WVALID_S14 <= WVALID_S14_xhdl408;
   BREADY_S14 <= BREADY_S14_xhdl409;
   ARID_S14 <= ARID_S14_xhdl410;
   ARADDR_S14 <= ARADDR_S14_xhdl411;
   ARLEN_S14 <= ARLEN_S14_xhdl412;
   ARSIZE_S14 <= ARSIZE_S14_xhdl413;
   ARBURST_S14 <= ARBURST_S14_xhdl414;
   ARLOCK_S14 <= ARLOCK_S14_xhdl415;
   ARCACHE_S14 <= ARCACHE_S14_xhdl416;
   ARPROT_S14 <= ARPROT_S14_xhdl417;
   ARVALID_S14 <= ARVALID_S14_xhdl418;
   RREADY_S14 <= RREADY_S14_xhdl419;
   AWID_S15 <= AWID_S15_xhdl420;
   AWADDR_S15 <= AWADDR_S15_xhdl421;
   AWLEN_S15 <= AWLEN_S15_xhdl422;
   AWSIZE_S15 <= AWSIZE_S15_xhdl423;
   AWBURST_S15 <= AWBURST_S15_xhdl424;
   AWLOCK_S15 <= AWLOCK_S15_xhdl425;
   AWCACHE_S15 <= AWCACHE_S15_xhdl426;
   AWPROT_S15 <= AWPROT_S15_xhdl427;
   AWVALID_S15 <= AWVALID_S15_xhdl428;
   WID_S15 <= WID_S15_xhdl429;
   WDATA_S15 <= WDATA_S15_xhdl430;
   WSTRB_S15 <= WSTRB_S15_xhdl431;
   WLAST_S15 <= WLAST_S15_xhdl432;
   WVALID_S15 <= WVALID_S15_xhdl433;
   BREADY_S15 <= BREADY_S15_xhdl434;
   ARID_S15 <= ARID_S15_xhdl435;
   ARADDR_S15 <= ARADDR_S15_xhdl436;
   ARLEN_S15 <= ARLEN_S15_xhdl437;
   ARSIZE_S15 <= ARSIZE_S15_xhdl438;
   ARBURST_S15 <= ARBURST_S15_xhdl439;
   ARLOCK_S15 <= ARLOCK_S15_xhdl440;
   ARCACHE_S15 <= ARCACHE_S15_xhdl441;
   ARPROT_S15 <= ARPROT_S15_xhdl442;
   ARVALID_S15 <= ARVALID_S15_xhdl443;
   RREADY_S15 <= RREADY_S15_xhdl444;
   AWID_S16 <= AWID_S16_xhdl445;
   AWADDR_S16 <= AWADDR_S16_xhdl446;
   AWLEN_S16 <= AWLEN_S16_xhdl447;
   AWSIZE_S16 <= AWSIZE_S16_xhdl448;
   AWBURST_S16 <= AWBURST_S16_xhdl449;
   AWLOCK_S16 <= AWLOCK_S16_xhdl450;
   AWCACHE_S16 <= AWCACHE_S16_xhdl451;
   AWPROT_S16 <= AWPROT_S16_xhdl452;
   AWVALID_S16 <= AWVALID_S16_xhdl453;
   WID_S16 <= WID_S16_xhdl454;
   WDATA_S16 <= WDATA_S16_xhdl455;
   WSTRB_S16 <= WSTRB_S16_xhdl456;
   WLAST_S16 <= WLAST_S16_xhdl457;
   WVALID_S16 <= WVALID_S16_xhdl458;
   BREADY_S16 <= BREADY_S16_xhdl459;
   ARID_S16 <= ARID_S16_xhdl460;
   ARADDR_S16 <= ARADDR_S16_xhdl461;
   ARLEN_S16 <= ARLEN_S16_xhdl462;
   ARSIZE_S16 <= ARSIZE_S16_xhdl463;
   ARBURST_S16 <= ARBURST_S16_xhdl464;
   ARLOCK_S16 <= ARLOCK_S16_xhdl465;
   ARCACHE_S16 <= ARCACHE_S16_xhdl466;
   ARPROT_S16 <= ARPROT_S16_xhdl467;
   ARVALID_S16 <= ARVALID_S16_xhdl468;
   RREADY_S16 <= RREADY_S16_xhdl469;
   
--   IF (FEED_THROUGH = 1 AND SINGLE_MASTER_SINGLE_SLAVE = 1) GENERATE
--   Removed NUM_SLAVE_SLOT parameter
   L1: IF (FEED_THROUGH = 1) GENERATE
      u_axi_feedthrough : axi_feedthrough 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_M0 => AWID_M0,
            AWADDR_M0 => AWADDR_M0,
            AWLEN_M0 => AWLEN_M0,
            AWSIZE_M0 => AWSIZE_M0,
            AWBURST_M0 => AWBURST_M0,
            AWLOCK_M0 => AWLOCK_M0,
            AWCACHE_M0 => AWCACHE_M0,
            AWPROT_M0 => AWPROT_M0,
            AWVALID_M0 => AWVALID_M0,
            AWREADY_M0 => AWREADY_M0_xhdl1,
            WID_M0 => WID_M0,
            WDATA_M0 => WDATA_M0,
            WSTRB_M0 => WSTRB_M0,
            WLAST_M0 => WLAST_M0,
            WVALID_M0 => WVALID_M0,
            WREADY_M0 => WREADY_M0_xhdl2,
            BID_M0 => BID_M0_xhdl3,
            BRESP_M0 => BRESP_M0_xhdl4,
            BVALID_M0 => BVALID_M0_xhdl5,
            BREADY_M0 => BREADY_M0,
            ARID_M0 => ARID_M0,
            ARADDR_M0 => ARADDR_M0,
            ARLEN_M0 => ARLEN_M0,
            ARSIZE_M0 => ARSIZE_M0,
            ARBURST_M0 => ARBURST_M0,
            ARLOCK_M0 => ARLOCK_M0,
            ARCACHE_M0 => ARCACHE_M0,
            ARPROT_M0 => ARPROT_M0,
            ARVALID_M0 => ARVALID_M0,
            ARREADY_M0 => ARREADY_M0_xhdl6,
            RID_M0 => RID_M0_xhdl7,
            RDATA_M0 => RDATA_M0_xhdl8,
            RRESP_M0 => RRESP_M0_xhdl9,
            RLAST_M0 => RLAST_M0_xhdl10,
            RVALID_M0 => RVALID_M0_xhdl11,
            RREADY_M0 => RREADY_M0,
            AWID_S0 => AWID_S0_xhdl45,
            AWADDR_S0 => AWADDR_S0_xhdl46,
            AWLEN_S0 => AWLEN_S0_xhdl47,
            AWSIZE_S0 => AWSIZE_S0_xhdl48,
            AWBURST_S0 => AWBURST_S0_xhdl49,
            AWLOCK_S0 => AWLOCK_S0_xhdl50,
            AWCACHE_S0 => AWCACHE_S0_xhdl51,
            AWPROT_S0 => AWPROT_S0_xhdl52,
            AWVALID_S0 => AWVALID_S0_xhdl53,
            AWREADY_S0 => AWREADY_S0,
            WID_S0 => WID_S0_xhdl54,
            WDATA_S0 => WDATA_S0_xhdl55,
            WSTRB_S0 => WSTRB_S0_xhdl56,
            WLAST_S0 => WLAST_S0_xhdl57,
            WVALID_S0 => WVALID_S0_xhdl58,
            WREADY_S0 => WREADY_S0,
            BID_S0 => BID_S0,
            BRESP_S0 => BRESP_S0,
            BVALID_S0 => BVALID_S0,
            BREADY_S0 => BREADY_S0_xhdl59,
            ARID_S0 => ARID_S0_xhdl60,
            ARADDR_S0 => ARADDR_S0_xhdl61,
            ARLEN_S0 => ARLEN_S0_xhdl62,
            ARSIZE_S0 => ARSIZE_S0_xhdl63,
            ARBURST_S0 => ARBURST_S0_xhdl64,
            ARLOCK_S0 => ARLOCK_S0_xhdl65,
            ARCACHE_S0 => ARCACHE_S0_xhdl66,
            ARPROT_S0 => ARPROT_S0_xhdl67,
            ARVALID_S0 => ARVALID_S0_xhdl68,
            ARREADY_S0 => ARREADY_S0,
            RID_S0 => RID_S0,
            RDATA_S0 => RDATA_S0,
            RRESP_S0 => RRESP_S0,
            RLAST_S0 => RLAST_S0,
            RVALID_S0 => RVALID_S0,
            RREADY_S0 => RREADY_S0_xhdl69);   
   END GENERATE L1;
   
   L2: IF (FEED_THROUGH /= 1) GENERATE
      u_interconnect_ntom : axi_interconnect_ntom 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            ARADDR_M0 => ARADDR_M0,
            ARLOCK_M0 => ARLOCK_M0,
            ARVALID_M0 => ARVALID_M0,
            ARADDR_M1 => ARADDR_M1,
            ARLOCK_M1 => ARLOCK_M1,
            ARVALID_M1 => ARVALID_M1,
            ARADDR_M2 => ARADDR_M2,
            ARLOCK_M2 => ARLOCK_M2,
            ARVALID_M2 => ARVALID_M2,
            ARADDR_M3 => ARADDR_M3,
            ARLOCK_M3 => ARLOCK_M3,
            ARVALID_M3 => ARVALID_M3,
            AWADDR_M0 => AWADDR_M0,
            AWVALID_M0 => AWVALID_M0,
            AWLOCK_M0 => AWLOCK_M0,
            AWADDR_M1 => AWADDR_M1,
            AWVALID_M1 => AWVALID_M1,
            AWLOCK_M1 => AWLOCK_M1,
            AWADDR_M2 => AWADDR_M2,
            AWVALID_M2 => AWVALID_M2,
            AWLOCK_M2 => AWLOCK_M2,
            AWADDR_M3 => AWADDR_M3,
            AWVALID_M3 => AWVALID_M3,
            AWLOCK_M3 => AWLOCK_M3,
            AWID_MI0 => AWID_MI0,
            AWADDR_MI0 => AWADDR_MI0,
            AWLEN_MI0 => AWLEN_MI0,
            AWSIZE_MI0 => AWSIZE_MI0,
            AWBURST_MI0 => AWBURST_MI0,
            AWLOCK_MI0 => AWLOCK_MI0,
            AWCACHE_MI0 => AWCACHE_MI0,
            AWPROT_MI0 => AWPROT_MI0,
            AWVALID_MI0 => AWVALID_MI0,
            AWREADY_IM0 => AWREADY_IM0,
            WID_MI0 => WID_MI0,
            WDATA_MI0 => WDATA_MI0,
            WSTRB_MI0 => WSTRB_MI0,
            WLAST_MI0 => WLAST_MI0,
            WVALID_MI0 => WVALID_MI0,
            WREADY_IM0 => WREADY_IM0,
            BID_IM0 => BID_IM0,
            BRESP_IM0 => BRESP_IM0,
            BVALID_IM0 => BVALID_IM0,
            BREADY_MI0 => BREADY_MI0,
            ARID_MI0 => ARID_MI0,
            ARADDR_MI0 => ARADDR_MI0,
            ARLEN_MI0 => ARLEN_MI0,
            ARSIZE_MI0 => ARSIZE_MI0,
            ARBURST_MI0 => ARBURST_MI0,
            ARLOCK_MI0 => ARLOCK_MI0,
            ARCACHE_MI0 => ARCACHE_MI0,
            ARPROT_MI0 => ARPROT_MI0,
            ARVALID_MI0 => ARVALID_MI0,
            ARREADY_IM0 => ARREADY_IM0,
            RID_IM0 => RID_IM0,
            RDATA_IM0 => RDATA_IM0,
            RRESP_IM0 => RRESP_IM0,
            RLAST_IM0 => RLAST_IM0,
            RVALID_IM0 => RVALID_IM0,
            RREADY_MI0 => RREADY_MI0,
            AWID_MI1 => AWID_MI1,
            AWADDR_MI1 => AWADDR_MI1,
            AWLEN_MI1 => AWLEN_MI1,
            AWSIZE_MI1 => AWSIZE_MI1,
            AWBURST_MI1 => AWBURST_MI1,
            AWLOCK_MI1 => AWLOCK_MI1,
            AWCACHE_MI1 => AWCACHE_MI1,
            AWPROT_MI1 => AWPROT_MI1,
            AWVALID_MI1 => AWVALID_MI1,
            AWREADY_IM1 => AWREADY_IM1,
            WID_MI1 => WID_MI1,
            WDATA_MI1 => WDATA_MI1,
            WSTRB_MI1 => WSTRB_MI1,
            WLAST_MI1 => WLAST_MI1,
            WVALID_MI1 => WVALID_MI1,
            WREADY_IM1 => WREADY_IM1,
            BID_IM1 => BID_IM1,
            BRESP_IM1 => BRESP_IM1,
            BVALID_IM1 => BVALID_IM1,
            BREADY_MI1 => BREADY_MI1,
            ARID_MI1 => ARID_MI1,
            ARADDR_MI1 => ARADDR_MI1,
            ARLEN_MI1 => ARLEN_MI1,
            ARSIZE_MI1 => ARSIZE_MI1,
            ARBURST_MI1 => ARBURST_MI1,
            ARLOCK_MI1 => ARLOCK_MI1,
            ARCACHE_MI1 => ARCACHE_MI1,
            ARPROT_MI1 => ARPROT_MI1,
            ARVALID_MI1 => ARVALID_MI1,
            ARREADY_IM1 => ARREADY_IM1,
            RID_IM1 => RID_IM1,
            RDATA_IM1 => RDATA_IM1,
            RRESP_IM1 => RRESP_IM1,
            RLAST_IM1 => RLAST_IM1,
            RVALID_IM1 => RVALID_IM1,
            RREADY_MI1 => RREADY_MI1,
            AWID_MI2 => AWID_MI2,
            AWADDR_MI2 => AWADDR_MI2,
            AWLEN_MI2 => AWLEN_MI2,
            AWSIZE_MI2 => AWSIZE_MI2,
            AWBURST_MI2 => AWBURST_MI2,
            AWLOCK_MI2 => AWLOCK_MI2,
            AWCACHE_MI2 => AWCACHE_MI2,
            AWPROT_MI2 => AWPROT_MI2,
            AWVALID_MI2 => AWVALID_MI2,
            AWREADY_IM2 => AWREADY_IM2,
            WID_MI2 => WID_MI2,
            WDATA_MI2 => WDATA_MI2,
            WSTRB_MI2 => WSTRB_MI2,
            WLAST_MI2 => WLAST_MI2,
            WVALID_MI2 => WVALID_MI2,
            WREADY_IM2 => WREADY_IM2,
            BID_IM2 => BID_IM2,
            BRESP_IM2 => BRESP_IM2,
            BVALID_IM2 => BVALID_IM2,
            BREADY_MI2 => BREADY_MI2,
            ARID_MI2 => ARID_MI2,
            ARADDR_MI2 => ARADDR_MI2,
            ARLEN_MI2 => ARLEN_MI2,
            ARSIZE_MI2 => ARSIZE_MI2,
            ARBURST_MI2 => ARBURST_MI2,
            ARLOCK_MI2 => ARLOCK_MI2,
            ARCACHE_MI2 => ARCACHE_MI2,
            ARPROT_MI2 => ARPROT_MI2,
            ARVALID_MI2 => ARVALID_MI2,
            ARREADY_IM2 => ARREADY_IM2,
            RID_IM2 => RID_IM2,
            RDATA_IM2 => RDATA_IM2,
            RRESP_IM2 => RRESP_IM2,
            RLAST_IM2 => RLAST_IM2,
            RVALID_IM2 => RVALID_IM2,
            RREADY_MI2 => RREADY_MI2,
            AWID_MI3 => AWID_MI3,
            AWADDR_MI3 => AWADDR_MI3,
            AWLEN_MI3 => AWLEN_MI3,
            AWSIZE_MI3 => AWSIZE_MI3,
            AWBURST_MI3 => AWBURST_MI3,
            AWLOCK_MI3 => AWLOCK_MI3,
            AWCACHE_MI3 => AWCACHE_MI3,
            AWPROT_MI3 => AWPROT_MI3,
            AWVALID_MI3 => AWVALID_MI3,
            AWREADY_IM3 => AWREADY_IM3,
            WID_MI3 => WID_MI3,
            WDATA_MI3 => WDATA_MI3,
            WSTRB_MI3 => WSTRB_MI3,
            WLAST_MI3 => WLAST_MI3,
            WVALID_MI3 => WVALID_MI3,
            WREADY_IM3 => WREADY_IM3,
            BID_IM3 => BID_IM3,
            BRESP_IM3 => BRESP_IM3,
            BVALID_IM3 => BVALID_IM3,
            BREADY_MI3 => BREADY_MI3,
            ARID_MI3 => ARID_MI3,
            ARADDR_MI3 => ARADDR_MI3,
            ARLEN_MI3 => ARLEN_MI3,
            ARSIZE_MI3 => ARSIZE_MI3,
            ARBURST_MI3 => ARBURST_MI3,
            ARLOCK_MI3 => ARLOCK_MI3,
            ARCACHE_MI3 => ARCACHE_MI3,
            ARPROT_MI3 => ARPROT_MI3,
            ARVALID_MI3 => ARVALID_MI3,
            ARREADY_IM3 => ARREADY_IM3,
            RID_IM3 => RID_IM3,
            RDATA_IM3 => RDATA_IM3,
            RRESP_IM3 => RRESP_IM3,
            RLAST_IM3 => RLAST_IM3,
            RVALID_IM3 => RVALID_IM3,
            RREADY_MI3 => RREADY_MI3,
            AWID_IS0 => AWID_IS0,
            AWADDR_IS0 => AWADDR_IS0,
            AWLEN_IS0 => AWLEN_IS0,
            AWSIZE_IS0 => AWSIZE_IS0,
            AWBURST_IS0 => AWBURST_IS0,
            AWLOCK_IS0 => AWLOCK_IS0,
            AWCACHE_IS0 => AWCACHE_IS0,
            AWPROT_IS0 => AWPROT_IS0,
            AWVALID_IS0 => AWVALID_IS0,
            AWREADY_SI0 => AWREADY_SI0,
            WID_IS0 => WID_IS0,
            WDATA_IS0 => WDATA_IS0,
            WSTRB_IS0 => WSTRB_IS0,
            WLAST_IS0 => WLAST_IS0,
            WVALID_IS0 => WVALID_IS0,
            WREADY_SI0 => WREADY_SI0,
            BID_SI0 => BID_SI0,
            BRESP_SI0 => BRESP_SI0,
            BVALID_SI0 => BVALID_SI0,
            BREADY_IS0 => BREADY_IS0,
            ARID_IS0 => ARID_IS0,
            ARADDR_IS0 => ARADDR_IS0,
            ARLEN_IS0 => ARLEN_IS0,
            ARSIZE_IS0 => ARSIZE_IS0,
            ARBURST_IS0 => ARBURST_IS0,
            ARLOCK_IS0 => ARLOCK_IS0,
            ARCACHE_IS0 => ARCACHE_IS0,
            ARPROT_IS0 => ARPROT_IS0,
            ARVALID_IS0 => ARVALID_IS0,
            ARREADY_SI0 => ARREADY_SI0,
            RID_SI0 => RID_SI0,
            RDATA_SI0 => RDATA_SI0,
            RRESP_SI0 => RRESP_SI0,
            RLAST_SI0 => RLAST_SI0,
            RVALID_SI0 => RVALID_SI0,
            RREADY_IS0 => RREADY_IS0,
            AWID_IS1 => AWID_IS1,
            AWADDR_IS1 => AWADDR_IS1,
            AWLEN_IS1 => AWLEN_IS1,
            AWSIZE_IS1 => AWSIZE_IS1,
            AWBURST_IS1 => AWBURST_IS1,
            AWLOCK_IS1 => AWLOCK_IS1,
            AWCACHE_IS1 => AWCACHE_IS1,
            AWPROT_IS1 => AWPROT_IS1,
            AWVALID_IS1 => AWVALID_IS1,
            AWREADY_SI1 => AWREADY_SI1,
            WID_IS1 => WID_IS1,
            WDATA_IS1 => WDATA_IS1,
            WSTRB_IS1 => WSTRB_IS1,
            WLAST_IS1 => WLAST_IS1,
            WVALID_IS1 => WVALID_IS1,
            WREADY_SI1 => WREADY_SI1,
            BID_SI1 => BID_SI1,
            BRESP_SI1 => BRESP_SI1,
            BVALID_SI1 => BVALID_SI1,
            BREADY_IS1 => BREADY_IS1,
            ARID_IS1 => ARID_IS1,
            ARADDR_IS1 => ARADDR_IS1,
            ARLEN_IS1 => ARLEN_IS1,
            ARSIZE_IS1 => ARSIZE_IS1,
            ARBURST_IS1 => ARBURST_IS1,
            ARLOCK_IS1 => ARLOCK_IS1,
            ARCACHE_IS1 => ARCACHE_IS1,
            ARPROT_IS1 => ARPROT_IS1,
            ARVALID_IS1 => ARVALID_IS1,
            ARREADY_SI1 => ARREADY_SI1,
            RID_SI1 => RID_SI1,
            RDATA_SI1 => RDATA_SI1,
            RRESP_SI1 => RRESP_SI1,
            RLAST_SI1 => RLAST_SI1,
            RVALID_SI1 => RVALID_SI1,
            RREADY_IS1 => RREADY_IS1,
            AWID_IS2 => AWID_IS2,
            AWADDR_IS2 => AWADDR_IS2,
            AWLEN_IS2 => AWLEN_IS2,
            AWSIZE_IS2 => AWSIZE_IS2,
            AWBURST_IS2 => AWBURST_IS2,
            AWLOCK_IS2 => AWLOCK_IS2,
            AWCACHE_IS2 => AWCACHE_IS2,
            AWPROT_IS2 => AWPROT_IS2,
            AWVALID_IS2 => AWVALID_IS2,
            AWREADY_SI2 => AWREADY_SI2,
            WID_IS2 => WID_IS2,
            WDATA_IS2 => WDATA_IS2,
            WSTRB_IS2 => WSTRB_IS2,
            WLAST_IS2 => WLAST_IS2,
            WVALID_IS2 => WVALID_IS2,
            WREADY_SI2 => WREADY_SI2,
            BID_SI2 => BID_SI2,
            BRESP_SI2 => BRESP_SI2,
            BVALID_SI2 => BVALID_SI2,
            BREADY_IS2 => BREADY_IS2,
            ARID_IS2 => ARID_IS2,
            ARADDR_IS2 => ARADDR_IS2,
            ARLEN_IS2 => ARLEN_IS2,
            ARSIZE_IS2 => ARSIZE_IS2,
            ARBURST_IS2 => ARBURST_IS2,
            ARLOCK_IS2 => ARLOCK_IS2,
            ARCACHE_IS2 => ARCACHE_IS2,
            ARPROT_IS2 => ARPROT_IS2,
            ARVALID_IS2 => ARVALID_IS2,
            ARREADY_SI2 => ARREADY_SI2,
            RID_SI2 => RID_SI2,
            RDATA_SI2 => RDATA_SI2,
            RRESP_SI2 => RRESP_SI2,
            RLAST_SI2 => RLAST_SI2,
            RVALID_SI2 => RVALID_SI2,
            RREADY_IS2 => RREADY_IS2,
            AWID_IS3 => AWID_IS3,
            AWADDR_IS3 => AWADDR_IS3,
            AWLEN_IS3 => AWLEN_IS3,
            AWSIZE_IS3 => AWSIZE_IS3,
            AWBURST_IS3 => AWBURST_IS3,
            AWLOCK_IS3 => AWLOCK_IS3,
            AWCACHE_IS3 => AWCACHE_IS3,
            AWPROT_IS3 => AWPROT_IS3,
            AWVALID_IS3 => AWVALID_IS3,
            AWREADY_SI3 => AWREADY_SI3,
            WID_IS3 => WID_IS3,
            WDATA_IS3 => WDATA_IS3,
            WSTRB_IS3 => WSTRB_IS3,
            WLAST_IS3 => WLAST_IS3,
            WVALID_IS3 => WVALID_IS3,
            WREADY_SI3 => WREADY_SI3,
            BID_SI3 => BID_SI3,
            BRESP_SI3 => BRESP_SI3,
            BVALID_SI3 => BVALID_SI3,
            BREADY_IS3 => BREADY_IS3,
            ARID_IS3 => ARID_IS3,
            ARADDR_IS3 => ARADDR_IS3,
            ARLEN_IS3 => ARLEN_IS3,
            ARSIZE_IS3 => ARSIZE_IS3,
            ARBURST_IS3 => ARBURST_IS3,
            ARLOCK_IS3 => ARLOCK_IS3,
            ARCACHE_IS3 => ARCACHE_IS3,
            ARPROT_IS3 => ARPROT_IS3,
            ARVALID_IS3 => ARVALID_IS3,
            ARREADY_SI3 => ARREADY_SI3,
            RID_SI3 => RID_SI3,
            RDATA_SI3 => RDATA_SI3,
            RRESP_SI3 => RRESP_SI3,
            RLAST_SI3 => RLAST_SI3,
            RVALID_SI3 => RVALID_SI3,
            RREADY_IS3 => RREADY_IS3,
            AWID_IS4 => AWID_IS4,
            AWADDR_IS4 => AWADDR_IS4,
            AWLEN_IS4 => AWLEN_IS4,
            AWSIZE_IS4 => AWSIZE_IS4,
            AWBURST_IS4 => AWBURST_IS4,
            AWLOCK_IS4 => AWLOCK_IS4,
            AWCACHE_IS4 => AWCACHE_IS4,
            AWPROT_IS4 => AWPROT_IS4,
            AWVALID_IS4 => AWVALID_IS4,
            AWREADY_SI4 => AWREADY_SI4,
            WID_IS4 => WID_IS4,
            WDATA_IS4 => WDATA_IS4,
            WSTRB_IS4 => WSTRB_IS4,
            WLAST_IS4 => WLAST_IS4,
            WVALID_IS4 => WVALID_IS4,
            WREADY_SI4 => WREADY_SI4,
            BID_SI4 => BID_SI4,
            BRESP_SI4 => BRESP_SI4,
            BVALID_SI4 => BVALID_SI4,
            BREADY_IS4 => BREADY_IS4,
            ARID_IS4 => ARID_IS4,
            ARADDR_IS4 => ARADDR_IS4,
            ARLEN_IS4 => ARLEN_IS4,
            ARSIZE_IS4 => ARSIZE_IS4,
            ARBURST_IS4 => ARBURST_IS4,
            ARLOCK_IS4 => ARLOCK_IS4,
            ARCACHE_IS4 => ARCACHE_IS4,
            ARPROT_IS4 => ARPROT_IS4,
            ARVALID_IS4 => ARVALID_IS4,
            ARREADY_SI4 => ARREADY_SI4,
            RID_SI4 => RID_SI4,
            RDATA_SI4 => RDATA_SI4,
            RRESP_SI4 => RRESP_SI4,
            RLAST_SI4 => RLAST_SI4,
            RVALID_SI4 => RVALID_SI4,
            RREADY_IS4 => RREADY_IS4,
            AWID_IS5 => AWID_IS5,
            AWADDR_IS5 => AWADDR_IS5,
            AWLEN_IS5 => AWLEN_IS5,
            AWSIZE_IS5 => AWSIZE_IS5,
            AWBURST_IS5 => AWBURST_IS5,
            AWLOCK_IS5 => AWLOCK_IS5,
            AWCACHE_IS5 => AWCACHE_IS5,
            AWPROT_IS5 => AWPROT_IS5,
            AWVALID_IS5 => AWVALID_IS5,
            AWREADY_SI5 => AWREADY_SI5,
            WID_IS5 => WID_IS5,
            WDATA_IS5 => WDATA_IS5,
            WSTRB_IS5 => WSTRB_IS5,
            WLAST_IS5 => WLAST_IS5,
            WVALID_IS5 => WVALID_IS5,
            WREADY_SI5 => WREADY_SI5,
            BID_SI5 => BID_SI5,
            BRESP_SI5 => BRESP_SI5,
            BVALID_SI5 => BVALID_SI5,
            BREADY_IS5 => BREADY_IS5,
            ARID_IS5 => ARID_IS5,
            ARADDR_IS5 => ARADDR_IS5,
            ARLEN_IS5 => ARLEN_IS5,
            ARSIZE_IS5 => ARSIZE_IS5,
            ARBURST_IS5 => ARBURST_IS5,
            ARLOCK_IS5 => ARLOCK_IS5,
            ARCACHE_IS5 => ARCACHE_IS5,
            ARPROT_IS5 => ARPROT_IS5,
            ARVALID_IS5 => ARVALID_IS5,
            ARREADY_SI5 => ARREADY_SI5,
            RID_SI5 => RID_SI5,
            RDATA_SI5 => RDATA_SI5,
            RRESP_SI5 => RRESP_SI5,
            RLAST_SI5 => RLAST_SI5,
            RVALID_SI5 => RVALID_SI5,
            RREADY_IS5 => RREADY_IS5,
            AWID_IS6 => AWID_IS6,
            AWADDR_IS6 => AWADDR_IS6,
            AWLEN_IS6 => AWLEN_IS6,
            AWSIZE_IS6 => AWSIZE_IS6,
            AWBURST_IS6 => AWBURST_IS6,
            AWLOCK_IS6 => AWLOCK_IS6,
            AWCACHE_IS6 => AWCACHE_IS6,
            AWPROT_IS6 => AWPROT_IS6,
            AWVALID_IS6 => AWVALID_IS6,
            AWREADY_SI6 => AWREADY_SI6,
            WID_IS6 => WID_IS6,
            WDATA_IS6 => WDATA_IS6,
            WSTRB_IS6 => WSTRB_IS6,
            WLAST_IS6 => WLAST_IS6,
            WVALID_IS6 => WVALID_IS6,
            WREADY_SI6 => WREADY_SI6,
            BID_SI6 => BID_SI6,
            BRESP_SI6 => BRESP_SI6,
            BVALID_SI6 => BVALID_SI6,
            BREADY_IS6 => BREADY_IS6,
            ARID_IS6 => ARID_IS6,
            ARADDR_IS6 => ARADDR_IS6,
            ARLEN_IS6 => ARLEN_IS6,
            ARSIZE_IS6 => ARSIZE_IS6,
            ARBURST_IS6 => ARBURST_IS6,
            ARLOCK_IS6 => ARLOCK_IS6,
            ARCACHE_IS6 => ARCACHE_IS6,
            ARPROT_IS6 => ARPROT_IS6,
            ARVALID_IS6 => ARVALID_IS6,
            ARREADY_SI6 => ARREADY_SI6,
            RID_SI6 => RID_SI6,
            RDATA_SI6 => RDATA_SI6,
            RRESP_SI6 => RRESP_SI6,
            RLAST_SI6 => RLAST_SI6,
            RVALID_SI6 => RVALID_SI6,
            RREADY_IS6 => RREADY_IS6,
            AWID_IS7 => AWID_IS7,
            AWADDR_IS7 => AWADDR_IS7,
            AWLEN_IS7 => AWLEN_IS7,
            AWSIZE_IS7 => AWSIZE_IS7,
            AWBURST_IS7 => AWBURST_IS7,
            AWLOCK_IS7 => AWLOCK_IS7,
            AWCACHE_IS7 => AWCACHE_IS7,
            AWPROT_IS7 => AWPROT_IS7,
            AWVALID_IS7 => AWVALID_IS7,
            AWREADY_SI7 => AWREADY_SI7,
            WID_IS7 => WID_IS7,
            WDATA_IS7 => WDATA_IS7,
            WSTRB_IS7 => WSTRB_IS7,
            WLAST_IS7 => WLAST_IS7,
            WVALID_IS7 => WVALID_IS7,
            WREADY_SI7 => WREADY_SI7,
            BID_SI7 => BID_SI7,
            BRESP_SI7 => BRESP_SI7,
            BVALID_SI7 => BVALID_SI7,
            BREADY_IS7 => BREADY_IS7,
            ARID_IS7 => ARID_IS7,
            ARADDR_IS7 => ARADDR_IS7,
            ARLEN_IS7 => ARLEN_IS7,
            ARSIZE_IS7 => ARSIZE_IS7,
            ARBURST_IS7 => ARBURST_IS7,
            ARLOCK_IS7 => ARLOCK_IS7,
            ARCACHE_IS7 => ARCACHE_IS7,
            ARPROT_IS7 => ARPROT_IS7,
            ARVALID_IS7 => ARVALID_IS7,
            ARREADY_SI7 => ARREADY_SI7,
            RID_SI7 => RID_SI7,
            RDATA_SI7 => RDATA_SI7,
            RRESP_SI7 => RRESP_SI7,
            RLAST_SI7 => RLAST_SI7,
            RVALID_SI7 => RVALID_SI7,
            RREADY_IS7 => RREADY_IS7,
            AWID_IS8 => AWID_IS8,
            AWADDR_IS8 => AWADDR_IS8,
            AWLEN_IS8 => AWLEN_IS8,
            AWSIZE_IS8 => AWSIZE_IS8,
            AWBURST_IS8 => AWBURST_IS8,
            AWLOCK_IS8 => AWLOCK_IS8,
            AWCACHE_IS8 => AWCACHE_IS8,
            AWPROT_IS8 => AWPROT_IS8,
            AWVALID_IS8 => AWVALID_IS8,
            AWREADY_SI8 => AWREADY_SI8,
            WID_IS8 => WID_IS8,
            WDATA_IS8 => WDATA_IS8,
            WSTRB_IS8 => WSTRB_IS8,
            WLAST_IS8 => WLAST_IS8,
            WVALID_IS8 => WVALID_IS8,
            WREADY_SI8 => WREADY_SI8,
            BID_SI8 => BID_SI8,
            BRESP_SI8 => BRESP_SI8,
            BVALID_SI8 => BVALID_SI8,
            BREADY_IS8 => BREADY_IS8,
            ARID_IS8 => ARID_IS8,
            ARADDR_IS8 => ARADDR_IS8,
            ARLEN_IS8 => ARLEN_IS8,
            ARSIZE_IS8 => ARSIZE_IS8,
            ARBURST_IS8 => ARBURST_IS8,
            ARLOCK_IS8 => ARLOCK_IS8,
            ARCACHE_IS8 => ARCACHE_IS8,
            ARPROT_IS8 => ARPROT_IS8,
            ARVALID_IS8 => ARVALID_IS8,
            ARREADY_SI8 => ARREADY_SI8,
            RID_SI8 => RID_SI8,
            RDATA_SI8 => RDATA_SI8,
            RRESP_SI8 => RRESP_SI8,
            RLAST_SI8 => RLAST_SI8,
            RVALID_SI8 => RVALID_SI8,
            RREADY_IS8 => RREADY_IS8,
            AWID_IS9 => AWID_IS9,
            AWADDR_IS9 => AWADDR_IS9,
            AWLEN_IS9 => AWLEN_IS9,
            AWSIZE_IS9 => AWSIZE_IS9,
            AWBURST_IS9 => AWBURST_IS9,
            AWLOCK_IS9 => AWLOCK_IS9,
            AWCACHE_IS9 => AWCACHE_IS9,
            AWPROT_IS9 => AWPROT_IS9,
            AWVALID_IS9 => AWVALID_IS9,
            AWREADY_SI9 => AWREADY_SI9,
            WID_IS9 => WID_IS9,
            WDATA_IS9 => WDATA_IS9,
            WSTRB_IS9 => WSTRB_IS9,
            WLAST_IS9 => WLAST_IS9,
            WVALID_IS9 => WVALID_IS9,
            WREADY_SI9 => WREADY_SI9,
            BID_SI9 => BID_SI9,
            BRESP_SI9 => BRESP_SI9,
            BVALID_SI9 => BVALID_SI9,
            BREADY_IS9 => BREADY_IS9,
            ARID_IS9 => ARID_IS9,
            ARADDR_IS9 => ARADDR_IS9,
            ARLEN_IS9 => ARLEN_IS9,
            ARSIZE_IS9 => ARSIZE_IS9,
            ARBURST_IS9 => ARBURST_IS9,
            ARLOCK_IS9 => ARLOCK_IS9,
            ARCACHE_IS9 => ARCACHE_IS9,
            ARPROT_IS9 => ARPROT_IS9,
            ARVALID_IS9 => ARVALID_IS9,
            ARREADY_SI9 => ARREADY_SI9,
            RID_SI9 => RID_SI9,
            RDATA_SI9 => RDATA_SI9,
            RRESP_SI9 => RRESP_SI9,
            RLAST_SI9 => RLAST_SI9,
            RVALID_SI9 => RVALID_SI9,
            RREADY_IS9 => RREADY_IS9,
            AWID_IS10 => AWID_IS10,
            AWADDR_IS10 => AWADDR_IS10,
            AWLEN_IS10 => AWLEN_IS10,
            AWSIZE_IS10 => AWSIZE_IS10,
            AWBURST_IS10 => AWBURST_IS10,
            AWLOCK_IS10 => AWLOCK_IS10,
            AWCACHE_IS10 => AWCACHE_IS10,
            AWPROT_IS10 => AWPROT_IS10,
            AWVALID_IS10 => AWVALID_IS10,
            AWREADY_SI10 => AWREADY_SI10,
            WID_IS10 => WID_IS10,
            WDATA_IS10 => WDATA_IS10,
            WSTRB_IS10 => WSTRB_IS10,
            WLAST_IS10 => WLAST_IS10,
            WVALID_IS10 => WVALID_IS10,
            WREADY_SI10 => WREADY_SI10,
            BID_SI10 => BID_SI10,
            BRESP_SI10 => BRESP_SI10,
            BVALID_SI10 => BVALID_SI10,
            BREADY_IS10 => BREADY_IS10,
            ARID_IS10 => ARID_IS10,
            ARADDR_IS10 => ARADDR_IS10,
            ARLEN_IS10 => ARLEN_IS10,
            ARSIZE_IS10 => ARSIZE_IS10,
            ARBURST_IS10 => ARBURST_IS10,
            ARLOCK_IS10 => ARLOCK_IS10,
            ARCACHE_IS10 => ARCACHE_IS10,
            ARPROT_IS10 => ARPROT_IS10,
            ARVALID_IS10 => ARVALID_IS10,
            ARREADY_SI10 => ARREADY_SI10,
            RID_SI10 => RID_SI10,
            RDATA_SI10 => RDATA_SI10,
            RRESP_SI10 => RRESP_SI10,
            RLAST_SI10 => RLAST_SI10,
            RVALID_SI10 => RVALID_SI10,
            RREADY_IS10 => RREADY_IS10,
            AWID_IS11 => AWID_IS11,
            AWADDR_IS11 => AWADDR_IS11,
            AWLEN_IS11 => AWLEN_IS11,
            AWSIZE_IS11 => AWSIZE_IS11,
            AWBURST_IS11 => AWBURST_IS11,
            AWLOCK_IS11 => AWLOCK_IS11,
            AWCACHE_IS11 => AWCACHE_IS11,
            AWPROT_IS11 => AWPROT_IS11,
            AWVALID_IS11 => AWVALID_IS11,
            AWREADY_SI11 => AWREADY_SI11,
            WID_IS11 => WID_IS11,
            WDATA_IS11 => WDATA_IS11,
            WSTRB_IS11 => WSTRB_IS11,
            WLAST_IS11 => WLAST_IS11,
            WVALID_IS11 => WVALID_IS11,
            WREADY_SI11 => WREADY_SI11,
            BID_SI11 => BID_SI11,
            BRESP_SI11 => BRESP_SI11,
            BVALID_SI11 => BVALID_SI11,
            BREADY_IS11 => BREADY_IS11,
            ARID_IS11 => ARID_IS11,
            ARADDR_IS11 => ARADDR_IS11,
            ARLEN_IS11 => ARLEN_IS11,
            ARSIZE_IS11 => ARSIZE_IS11,
            ARBURST_IS11 => ARBURST_IS11,
            ARLOCK_IS11 => ARLOCK_IS11,
            ARCACHE_IS11 => ARCACHE_IS11,
            ARPROT_IS11 => ARPROT_IS11,
            ARVALID_IS11 => ARVALID_IS11,
            ARREADY_SI11 => ARREADY_SI11,
            RID_SI11 => RID_SI11,
            RDATA_SI11 => RDATA_SI11,
            RRESP_SI11 => RRESP_SI11,
            RLAST_SI11 => RLAST_SI11,
            RVALID_SI11 => RVALID_SI11,
            RREADY_IS11 => RREADY_IS11,
            AWID_IS12 => AWID_IS12,
            AWADDR_IS12 => AWADDR_IS12,
            AWLEN_IS12 => AWLEN_IS12,
            AWSIZE_IS12 => AWSIZE_IS12,
            AWBURST_IS12 => AWBURST_IS12,
            AWLOCK_IS12 => AWLOCK_IS12,
            AWCACHE_IS12 => AWCACHE_IS12,
            AWPROT_IS12 => AWPROT_IS12,
            AWVALID_IS12 => AWVALID_IS12,
            AWREADY_SI12 => AWREADY_SI12,
            WID_IS12 => WID_IS12,
            WDATA_IS12 => WDATA_IS12,
            WSTRB_IS12 => WSTRB_IS12,
            WLAST_IS12 => WLAST_IS12,
            WVALID_IS12 => WVALID_IS12,
            WREADY_SI12 => WREADY_SI12,
            BID_SI12 => BID_SI12,
            BRESP_SI12 => BRESP_SI12,
            BVALID_SI12 => BVALID_SI12,
            BREADY_IS12 => BREADY_IS12,
            ARID_IS12 => ARID_IS12,
            ARADDR_IS12 => ARADDR_IS12,
            ARLEN_IS12 => ARLEN_IS12,
            ARSIZE_IS12 => ARSIZE_IS12,
            ARBURST_IS12 => ARBURST_IS12,
            ARLOCK_IS12 => ARLOCK_IS12,
            ARCACHE_IS12 => ARCACHE_IS12,
            ARPROT_IS12 => ARPROT_IS12,
            ARVALID_IS12 => ARVALID_IS12,
            ARREADY_SI12 => ARREADY_SI12,
            RID_SI12 => RID_SI12,
            RDATA_SI12 => RDATA_SI12,
            RRESP_SI12 => RRESP_SI12,
            RLAST_SI12 => RLAST_SI12,
            RVALID_SI12 => RVALID_SI12,
            RREADY_IS12 => RREADY_IS12,
            AWID_IS13 => AWID_IS13,
            AWADDR_IS13 => AWADDR_IS13,
            AWLEN_IS13 => AWLEN_IS13,
            AWSIZE_IS13 => AWSIZE_IS13,
            AWBURST_IS13 => AWBURST_IS13,
            AWLOCK_IS13 => AWLOCK_IS13,
            AWCACHE_IS13 => AWCACHE_IS13,
            AWPROT_IS13 => AWPROT_IS13,
            AWVALID_IS13 => AWVALID_IS13,
            AWREADY_SI13 => AWREADY_SI13,
            WID_IS13 => WID_IS13,
            WDATA_IS13 => WDATA_IS13,
            WSTRB_IS13 => WSTRB_IS13,
            WLAST_IS13 => WLAST_IS13,
            WVALID_IS13 => WVALID_IS13,
            WREADY_SI13 => WREADY_SI13,
            BID_SI13 => BID_SI13,
            BRESP_SI13 => BRESP_SI13,
            BVALID_SI13 => BVALID_SI13,
            BREADY_IS13 => BREADY_IS13,
            ARID_IS13 => ARID_IS13,
            ARADDR_IS13 => ARADDR_IS13,
            ARLEN_IS13 => ARLEN_IS13,
            ARSIZE_IS13 => ARSIZE_IS13,
            ARBURST_IS13 => ARBURST_IS13,
            ARLOCK_IS13 => ARLOCK_IS13,
            ARCACHE_IS13 => ARCACHE_IS13,
            ARPROT_IS13 => ARPROT_IS13,
            ARVALID_IS13 => ARVALID_IS13,
            ARREADY_SI13 => ARREADY_SI13,
            RID_SI13 => RID_SI13,
            RDATA_SI13 => RDATA_SI13,
            RRESP_SI13 => RRESP_SI13,
            RLAST_SI13 => RLAST_SI13,
            RVALID_SI13 => RVALID_SI13,
            RREADY_IS13 => RREADY_IS13,
            AWID_IS14 => AWID_IS14,
            AWADDR_IS14 => AWADDR_IS14,
            AWLEN_IS14 => AWLEN_IS14,
            AWSIZE_IS14 => AWSIZE_IS14,
            AWBURST_IS14 => AWBURST_IS14,
            AWLOCK_IS14 => AWLOCK_IS14,
            AWCACHE_IS14 => AWCACHE_IS14,
            AWPROT_IS14 => AWPROT_IS14,
            AWVALID_IS14 => AWVALID_IS14,
            AWREADY_SI14 => AWREADY_SI14,
            WID_IS14 => WID_IS14,
            WDATA_IS14 => WDATA_IS14,
            WSTRB_IS14 => WSTRB_IS14,
            WLAST_IS14 => WLAST_IS14,
            WVALID_IS14 => WVALID_IS14,
            WREADY_SI14 => WREADY_SI14,
            BID_SI14 => BID_SI14,
            BRESP_SI14 => BRESP_SI14,
            BVALID_SI14 => BVALID_SI14,
            BREADY_IS14 => BREADY_IS14,
            ARID_IS14 => ARID_IS14,
            ARADDR_IS14 => ARADDR_IS14,
            ARLEN_IS14 => ARLEN_IS14,
            ARSIZE_IS14 => ARSIZE_IS14,
            ARBURST_IS14 => ARBURST_IS14,
            ARLOCK_IS14 => ARLOCK_IS14,
            ARCACHE_IS14 => ARCACHE_IS14,
            ARPROT_IS14 => ARPROT_IS14,
            ARVALID_IS14 => ARVALID_IS14,
            ARREADY_SI14 => ARREADY_SI14,
            RID_SI14 => RID_SI14,
            RDATA_SI14 => RDATA_SI14,
            RRESP_SI14 => RRESP_SI14,
            RLAST_SI14 => RLAST_SI14,
            RVALID_SI14 => RVALID_SI14,
            RREADY_IS14 => RREADY_IS14,
            AWID_IS15 => AWID_IS15,
            AWADDR_IS15 => AWADDR_IS15,
            AWLEN_IS15 => AWLEN_IS15,
            AWSIZE_IS15 => AWSIZE_IS15,
            AWBURST_IS15 => AWBURST_IS15,
            AWLOCK_IS15 => AWLOCK_IS15,
            AWCACHE_IS15 => AWCACHE_IS15,
            AWPROT_IS15 => AWPROT_IS15,
            AWVALID_IS15 => AWVALID_IS15,
            AWREADY_SI15 => AWREADY_SI15,
            WID_IS15 => WID_IS15,
            WDATA_IS15 => WDATA_IS15,
            WSTRB_IS15 => WSTRB_IS15,
            WLAST_IS15 => WLAST_IS15,
            WVALID_IS15 => WVALID_IS15,
            WREADY_SI15 => WREADY_SI15,
            BID_SI15 => BID_SI15,
            BRESP_SI15 => BRESP_SI15,
            BVALID_SI15 => BVALID_SI15,
            BREADY_IS15 => BREADY_IS15,
            ARID_IS15 => ARID_IS15,
            ARADDR_IS15 => ARADDR_IS15,
            ARLEN_IS15 => ARLEN_IS15,
            ARSIZE_IS15 => ARSIZE_IS15,
            ARBURST_IS15 => ARBURST_IS15,
            ARLOCK_IS15 => ARLOCK_IS15,
            ARCACHE_IS15 => ARCACHE_IS15,
            ARPROT_IS15 => ARPROT_IS15,
            ARVALID_IS15 => ARVALID_IS15,
            ARREADY_SI15 => ARREADY_SI15,
            RID_SI15 => RID_SI15,
            RDATA_SI15 => RDATA_SI15,
            RRESP_SI15 => RRESP_SI15,
            RLAST_SI15 => RLAST_SI15,
            RVALID_SI15 => RVALID_SI15,
            RREADY_IS15 => RREADY_IS15,
            AWID_IS16 => AWID_IS16,
            AWADDR_IS16 => AWADDR_IS16,
            AWLEN_IS16 => AWLEN_IS16,
            AWSIZE_IS16 => AWSIZE_IS16,
            AWBURST_IS16 => AWBURST_IS16,
            AWLOCK_IS16 => AWLOCK_IS16,
            AWCACHE_IS16 => AWCACHE_IS16,
            AWPROT_IS16 => AWPROT_IS16,
            AWVALID_IS16 => AWVALID_IS16,
            AWREADY_SI16 => AWREADY_SI16,
            WID_IS16 => WID_IS16,
            WDATA_IS16 => WDATA_IS16,
            WSTRB_IS16 => WSTRB_IS16,
            WLAST_IS16 => WLAST_IS16,
            WVALID_IS16 => WVALID_IS16,
            WREADY_SI16 => WREADY_SI16,
            BID_SI16 => BID_SI16,
            BRESP_SI16 => BRESP_SI16,
            BVALID_SI16 => BVALID_SI16,
            BREADY_IS16 => BREADY_IS16,
            ARID_IS16 => ARID_IS16,
            ARADDR_IS16 => ARADDR_IS16,
            ARLEN_IS16 => ARLEN_IS16,
            ARSIZE_IS16 => ARSIZE_IS16,
            ARBURST_IS16 => ARBURST_IS16,
            ARLOCK_IS16 => ARLOCK_IS16,
            ARCACHE_IS16 => ARCACHE_IS16,
            ARPROT_IS16 => ARPROT_IS16,
            ARVALID_IS16 => ARVALID_IS16,
            ARREADY_SI16 => ARREADY_SI16,
            RID_SI16 => RID_SI16,
            RDATA_SI16 => RDATA_SI16,
            RRESP_SI16 => RRESP_SI16,
            RLAST_SI16 => RLAST_SI16,
            RVALID_SI16 => RVALID_SI16,
            RREADY_IS16 => RREADY_IS16,
            m0_rd_end => m0_rd_end,
            m0_wr_end => m0_wr_end,
            m1_rd_end => m1_rd_end,
            m1_wr_end => m1_wr_end,
            m2_rd_end => m2_rd_end,
            m2_wr_end => m2_wr_end,
            m3_rd_end => m3_rd_end,
            m3_wr_end => m3_wr_end);   --  interconnect_ntom
   END GENERATE L2;
   
   
   -- if (FEED_THROUGH != 1)
   
   L3: IF (FEED_THROUGH /= 1) GENERATE
      master_stage0 : axi_master_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            UID_WIDTH => "00",
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_M => AWID_M0,
            AWADDR_M => AWADDR_M0,
            AWLEN_M => AWLEN_M0,
            AWSIZE_M => AWSIZE_M0,
            AWBURST_M => AWBURST_M0,
            AWLOCK_M => AWLOCK_M0,
            AWCACHE_M => AWCACHE_M0,
            AWPROT_M => AWPROT_M0,
            AWVALID_M => AWVALID_M0,
            AWREADY_M => AWREADY_M0_xhdl1,
            WID_M => WID_M0,
            WDATA_M => WDATA_M0,
            WSTRB_M => WSTRB_M0,
            WLAST_M => WLAST_M0,
            WVALID_M => WVALID_M0,
            WREADY_M => WREADY_M0_xhdl2,
            BID_M => BID_M0_xhdl3,
            BRESP_M => BRESP_M0_xhdl4,
            BVALID_M => BVALID_M0_xhdl5,
            BREADY_M => BREADY_M0,
            ARID_M => ARID_M0,
            ARADDR_M => ARADDR_M0,
            ARLEN_M => ARLEN_M0,
            ARSIZE_M => ARSIZE_M0,
            ARBURST_M => ARBURST_M0,
            ARLOCK_M => ARLOCK_M0,
            ARCACHE_M => ARCACHE_M0,
            ARPROT_M => ARPROT_M0,
            ARVALID_M => ARVALID_M0,
            ARREADY_M => ARREADY_M0_xhdl6,
            RID_M => RID_M0_xhdl7,
            RDATA_M => RDATA_M0_xhdl8,
            RRESP_M => RRESP_M0_xhdl9,
            RLAST_M => RLAST_M0_xhdl10,
            RVALID_M => RVALID_M0_xhdl11,
            RREADY_M => RREADY_M0,
            AWID_MI => AWID_MI0,
            AWADDR_MI => AWADDR_MI0,
            AWLEN_MI => AWLEN_MI0,
            AWSIZE_MI => AWSIZE_MI0,
            AWBURST_MI => AWBURST_MI0,
            AWLOCK_MI => AWLOCK_MI0,
            AWCACHE_MI => AWCACHE_MI0,
            AWPROT_MI => AWPROT_MI0,
            AWVALID_MI => AWVALID_MI0,
            AWREADY_IM => AWREADY_IM0,
            WID_MI => WID_MI0,
            WDATA_MI => WDATA_MI0,
            WSTRB_MI => WSTRB_MI0,
            WLAST_MI => WLAST_MI0,
            WVALID_MI => WVALID_MI0,
            WREADY_IM => WREADY_IM0,
            BID_IM => BID_IM0,
            BRESP_IM => BRESP_IM0,
            BVALID_IM => BVALID_IM0,
            BREADY_MI => BREADY_MI0,
            ARID_MI => ARID_MI0,
            ARADDR_MI => ARADDR_MI0,
            ARLEN_MI => ARLEN_MI0,
            ARSIZE_MI => ARSIZE_MI0,
            ARBURST_MI => ARBURST_MI0,
            ARLOCK_MI => ARLOCK_MI0,
            ARCACHE_MI => ARCACHE_MI0,
            ARPROT_MI => ARPROT_MI0,
            ARVALID_MI => ARVALID_MI0,
            ARREADY_IM => ARREADY_IM0,
            RID_IM => RID_IM0,
            RDATA_IM => RDATA_IM0,
            RRESP_IM => RRESP_IM0,
            RLAST_IM => RLAST_IM0,
            RVALID_IM => RVALID_IM0,
            RREADY_MI => RREADY_MI0,
            master_rd_end => m0_rd_end,
            master_wr_end => m0_wr_end);   -- master_stage
   END GENERATE L3;
   -- if (NUM_MASTER_SLOT > 1)      
   
   L4: IF (NUM_MASTER_SLOT > 1 AND FEED_THROUGH /= 1) GENERATE
      master_stage1 : axi_master_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            UID_WIDTH => "01",
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_M => AWID_M1,
            AWADDR_M => AWADDR_M1,
            AWLEN_M => AWLEN_M1,
            AWSIZE_M => AWSIZE_M1,
            AWBURST_M => AWBURST_M1,
            AWLOCK_M => AWLOCK_M1,
            AWCACHE_M => AWCACHE_M1,
            AWPROT_M => AWPROT_M1,
            AWVALID_M => AWVALID_M1,
            AWREADY_M => AWREADY_M1_xhdl12,
            WID_M => WID_M1,
            WDATA_M => WDATA_M1,
            WSTRB_M => WSTRB_M1,
            WLAST_M => WLAST_M1,
            WVALID_M => WVALID_M1,
            WREADY_M => WREADY_M1_xhdl13,
            BID_M => BID_M1_xhdl14,
            BRESP_M => BRESP_M1_xhdl15,
            BVALID_M => BVALID_M1_xhdl16,
            BREADY_M => BREADY_M1,
            ARID_M => ARID_M1,
            ARADDR_M => ARADDR_M1,
            ARLEN_M => ARLEN_M1,
            ARSIZE_M => ARSIZE_M1,
            ARBURST_M => ARBURST_M1,
            ARLOCK_M => ARLOCK_M1,
            ARCACHE_M => ARCACHE_M1,
            ARPROT_M => ARPROT_M1,
            ARVALID_M => ARVALID_M1,
            ARREADY_M => ARREADY_M1_xhdl17,
            RID_M => RID_M1_xhdl18,
            RDATA_M => RDATA_M1_xhdl19,
            RRESP_M => RRESP_M1_xhdl20,
            RLAST_M => RLAST_M1_xhdl21,
            RVALID_M => RVALID_M1_xhdl22,
            RREADY_M => RREADY_M1,
            AWID_MI => AWID_MI1,
            AWADDR_MI => AWADDR_MI1,
            AWLEN_MI => AWLEN_MI1,
            AWSIZE_MI => AWSIZE_MI1,
            AWBURST_MI => AWBURST_MI1,
            AWLOCK_MI => AWLOCK_MI1,
            AWCACHE_MI => AWCACHE_MI1,
            AWPROT_MI => AWPROT_MI1,
            AWVALID_MI => AWVALID_MI1,
            AWREADY_IM => AWREADY_IM1,
            WID_MI => WID_MI1,
            WDATA_MI => WDATA_MI1,
            WSTRB_MI => WSTRB_MI1,
            WLAST_MI => WLAST_MI1,
            WVALID_MI => WVALID_MI1,
            WREADY_IM => WREADY_IM1,
            BID_IM => BID_IM1,
            BRESP_IM => BRESP_IM1,
            BVALID_IM => BVALID_IM1,
            BREADY_MI => BREADY_MI1,
            ARID_MI => ARID_MI1,
            ARADDR_MI => ARADDR_MI1,
            ARLEN_MI => ARLEN_MI1,
            ARSIZE_MI => ARSIZE_MI1,
            ARBURST_MI => ARBURST_MI1,
            ARLOCK_MI => ARLOCK_MI1,
            ARCACHE_MI => ARCACHE_MI1,
            ARPROT_MI => ARPROT_MI1,
            ARVALID_MI => ARVALID_MI1,
            ARREADY_IM => ARREADY_IM1,
            RID_IM => RID_IM1,
            RDATA_IM => RDATA_IM1,
            RRESP_IM => RRESP_IM1,
            RLAST_IM => RLAST_IM1,
            RVALID_IM => RVALID_IM1,
            RREADY_MI => RREADY_MI1,
            master_rd_end => m1_rd_end,
            master_wr_end => m1_wr_end);   -- master_stage1
   END GENERATE L4;
   -- if (NUM_MASTER_SLOT > 2)      
   
   L5: IF (NUM_MASTER_SLOT > 2 AND FEED_THROUGH /= 1) GENERATE
      master_stage2 : axi_master_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            UID_WIDTH => "10",
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_M => AWID_M2,
            AWADDR_M => AWADDR_M2,
            AWLEN_M => AWLEN_M2,
            AWSIZE_M => AWSIZE_M2,
            AWBURST_M => AWBURST_M2,
            AWLOCK_M => AWLOCK_M2,
            AWCACHE_M => AWCACHE_M2,
            AWPROT_M => AWPROT_M2,
            AWVALID_M => AWVALID_M2,
            AWREADY_M => AWREADY_M2_xhdl23,
            WID_M => WID_M2,
            WDATA_M => WDATA_M2,
            WSTRB_M => WSTRB_M2,
            WLAST_M => WLAST_M2,
            WVALID_M => WVALID_M2,
            WREADY_M => WREADY_M2_xhdl24,
            BID_M => BID_M2_xhdl25,
            BRESP_M => BRESP_M2_xhdl26,
            BVALID_M => BVALID_M2_xhdl27,
            BREADY_M => BREADY_M2,
            ARID_M => ARID_M2,
            ARADDR_M => ARADDR_M2,
            ARLEN_M => ARLEN_M2,
            ARSIZE_M => ARSIZE_M2,
            ARBURST_M => ARBURST_M2,
            ARLOCK_M => ARLOCK_M2,
            ARCACHE_M => ARCACHE_M2,
            ARPROT_M => ARPROT_M2,
            ARVALID_M => ARVALID_M2,
            ARREADY_M => ARREADY_M2_xhdl28,
            RID_M => RID_M2_xhdl29,
            RDATA_M => RDATA_M2_xhdl30,
            RRESP_M => RRESP_M2_xhdl31,
            RLAST_M => RLAST_M2_xhdl32,
            RVALID_M => RVALID_M2_xhdl33,
            RREADY_M => RREADY_M2,
            AWID_MI => AWID_MI2,
            AWADDR_MI => AWADDR_MI2,
            AWLEN_MI => AWLEN_MI2,
            AWSIZE_MI => AWSIZE_MI2,
            AWBURST_MI => AWBURST_MI2,
            AWLOCK_MI => AWLOCK_MI2,
            AWCACHE_MI => AWCACHE_MI2,
            AWPROT_MI => AWPROT_MI2,
            AWVALID_MI => AWVALID_MI2,
            AWREADY_IM => AWREADY_IM2,
            WID_MI => WID_MI2,
            WDATA_MI => WDATA_MI2,
            WSTRB_MI => WSTRB_MI2,
            WLAST_MI => WLAST_MI2,
            WVALID_MI => WVALID_MI2,
            WREADY_IM => WREADY_IM2,
            BID_IM => BID_IM2,
            BRESP_IM => BRESP_IM2,
            BVALID_IM => BVALID_IM2,
            BREADY_MI => BREADY_MI2,
            ARID_MI => ARID_MI2,
            ARADDR_MI => ARADDR_MI2,
            ARLEN_MI => ARLEN_MI2,
            ARSIZE_MI => ARSIZE_MI2,
            ARBURST_MI => ARBURST_MI2,
            ARLOCK_MI => ARLOCK_MI2,
            ARCACHE_MI => ARCACHE_MI2,
            ARPROT_MI => ARPROT_MI2,
            ARVALID_MI => ARVALID_MI2,
            ARREADY_IM => ARREADY_IM2,
            RID_IM => RID_IM2,
            RDATA_IM => RDATA_IM2,
            RRESP_IM => RRESP_IM2,
            RLAST_IM => RLAST_IM2,
            RVALID_IM => RVALID_IM2,
            RREADY_MI => RREADY_MI2,
            master_rd_end => m2_rd_end,
            master_wr_end => m2_wr_end);   -- master_stage2
   END GENERATE L5;
   -- if (NUM_MASTER_SLOT > 3)      
   
   L6: IF (NUM_MASTER_SLOT > 3 AND FEED_THROUGH /= 1) GENERATE
      master_stage3 : axi_master_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            UID_WIDTH => "11",
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_M => AWID_M3,
            AWADDR_M => AWADDR_M3,
            AWLEN_M => AWLEN_M3,
            AWSIZE_M => AWSIZE_M3,
            AWBURST_M => AWBURST_M3,
            AWLOCK_M => AWLOCK_M3,
            AWCACHE_M => AWCACHE_M3,
            AWPROT_M => AWPROT_M3,
            AWVALID_M => AWVALID_M3,
            AWREADY_M => AWREADY_M3_xhdl34,
            WID_M => WID_M3,
            WDATA_M => WDATA_M3,
            WSTRB_M => WSTRB_M3,
            WLAST_M => WLAST_M3,
            WVALID_M => WVALID_M3,
            WREADY_M => WREADY_M3_xhdl35,
            BID_M => BID_M3_xhdl36,
            BRESP_M => BRESP_M3_xhdl37,
            BVALID_M => BVALID_M3_xhdl38,
            BREADY_M => BREADY_M3,
            ARID_M => ARID_M3,
            ARADDR_M => ARADDR_M3,
            ARLEN_M => ARLEN_M3,
            ARSIZE_M => ARSIZE_M3,
            ARBURST_M => ARBURST_M3,
            ARLOCK_M => ARLOCK_M3,
            ARCACHE_M => ARCACHE_M3,
            ARPROT_M => ARPROT_M3,
            ARVALID_M => ARVALID_M3,
            ARREADY_M => ARREADY_M3_xhdl39,
            RID_M => RID_M3_xhdl40,
            RDATA_M => RDATA_M3_xhdl41,
            RRESP_M => RRESP_M3_xhdl42,
            RLAST_M => RLAST_M3_xhdl43,
            RVALID_M => RVALID_M3_xhdl44,
            RREADY_M => RREADY_M3,
            AWID_MI => AWID_MI3,
            AWADDR_MI => AWADDR_MI3,
            AWLEN_MI => AWLEN_MI3,
            AWSIZE_MI => AWSIZE_MI3,
            AWBURST_MI => AWBURST_MI3,
            AWLOCK_MI => AWLOCK_MI3,
            AWCACHE_MI => AWCACHE_MI3,
            AWPROT_MI => AWPROT_MI3,
            AWVALID_MI => AWVALID_MI3,
            AWREADY_IM => AWREADY_IM3,
            WID_MI => WID_MI3,
            WDATA_MI => WDATA_MI3,
            WSTRB_MI => WSTRB_MI3,
            WLAST_MI => WLAST_MI3,
            WVALID_MI => WVALID_MI3,
            WREADY_IM => WREADY_IM3,
            BID_IM => BID_IM3,
            BRESP_IM => BRESP_IM3,
            BVALID_IM => BVALID_IM3,
            BREADY_MI => BREADY_MI3,
            ARID_MI => ARID_MI3,
            ARADDR_MI => ARADDR_MI3,
            ARLEN_MI => ARLEN_MI3,
            ARSIZE_MI => ARSIZE_MI3,
            ARBURST_MI => ARBURST_MI3,
            ARLOCK_MI => ARLOCK_MI3,
            ARCACHE_MI => ARCACHE_MI3,
            ARPROT_MI => ARPROT_MI3,
            ARVALID_MI => ARVALID_MI3,
            ARREADY_IM => ARREADY_IM3,
            RID_IM => RID_IM3,
            RDATA_IM => RDATA_IM3,
            RRESP_IM => RRESP_IM3,
            RLAST_IM => RLAST_IM3,
            RVALID_IM => RVALID_IM3,
            RREADY_MI => RREADY_MI3,
            master_rd_end => m3_rd_end,
            master_wr_end => m3_wr_end);   -- master_stage3
   END GENERATE L6;
   
   L7: IF ((((M0_SLAVE0ENABLE = 1 OR M1_SLAVE0ENABLE = 1 OR M2_SLAVE0ENABLE = 1 OR 
   M3_SLAVE0ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE0ENABLE = 1 OR 
   M1_SLAVE0ENABLE = 1 OR M2_SLAVE0ENABLE = 1 OR M3_SLAVE0ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 1))) AND FEED_THROUGH /= 1) GENERATE
      slave_stage0 : axi_slave_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_IS => AWID_IS0,
            AWADDR_IS => AWADDR_IS0,
            AWLEN_IS => AWLEN_IS0,
            AWSIZE_IS => AWSIZE_IS0,
            AWBURST_IS => AWBURST_IS0,
            AWLOCK_IS => AWLOCK_IS0,
            AWCACHE_IS => AWCACHE_IS0,
            AWPROT_IS => AWPROT_IS0,
            AWVALID_IS => AWVALID_IS0,
            AWREADY_SI => AWREADY_SI0,
            WID_IS => WID_IS0,
            WDATA_IS => WDATA_IS0,
            WSTRB_IS => WSTRB_IS0,
            WLAST_IS => WLAST_IS0,
            WVALID_IS => WVALID_IS0,
            WREADY_SI => WREADY_SI0,
            BID_SI => BID_SI0,
            BRESP_SI => BRESP_SI0,
            BVALID_SI => BVALID_SI0,
            BREADY_IS => BREADY_IS0,
            ARID_IS => ARID_IS0,
            ARADDR_IS => ARADDR_IS0,
            ARLEN_IS => ARLEN_IS0,
            ARSIZE_IS => ARSIZE_IS0,
            ARBURST_IS => ARBURST_IS0,
            ARLOCK_IS => ARLOCK_IS0,
            ARCACHE_IS => ARCACHE_IS0,
            ARPROT_IS => ARPROT_IS0,
            ARVALID_IS => ARVALID_IS0,
            ARREADY_SI => ARREADY_SI0,
            RID_SI => RID_SI0,
            RDATA_SI => RDATA_SI0,
            RRESP_SI => RRESP_SI0,
            RLAST_SI => RLAST_SI0,
            RVALID_SI => RVALID_SI0,
            RREADY_IS => RREADY_IS0,
            AWID_S => AWID_S0_xhdl45,
            AWADDR_S => AWADDR_S0_xhdl46,
            AWLEN_S => AWLEN_S0_xhdl47,
            AWSIZE_S => AWSIZE_S0_xhdl48,
            AWBURST_S => AWBURST_S0_xhdl49,
            AWLOCK_S => AWLOCK_S0_xhdl50,
            AWCACHE_S => AWCACHE_S0_xhdl51,
            AWPROT_S => AWPROT_S0_xhdl52,
            AWVALID_S => AWVALID_S0_xhdl53,
            AWREADY_S => AWREADY_S0,
            WID_S => WID_S0_xhdl54,
            WDATA_S => WDATA_S0_xhdl55,
            WSTRB_S => WSTRB_S0_xhdl56,
            WLAST_S => WLAST_S0_xhdl57,
            WVALID_S => WVALID_S0_xhdl58,
            WREADY_S => WREADY_S0,
            BID_S => BID_S0,
            BRESP_S => BRESP_S0,
            BVALID_S => BVALID_S0,
            BREADY_S => BREADY_S0_xhdl59,
            ARID_S => ARID_S0_xhdl60,
            ARADDR_S => ARADDR_S0_xhdl61,
            ARLEN_S => ARLEN_S0_xhdl62,
            ARSIZE_S => ARSIZE_S0_xhdl63,
            ARBURST_S => ARBURST_S0_xhdl64,
            ARLOCK_S => ARLOCK_S0_xhdl65,
            ARCACHE_S => ARCACHE_S0_xhdl66,
            ARPROT_S => ARPROT_S0_xhdl67,
            ARVALID_S => ARVALID_S0_xhdl68,
            ARREADY_S => ARREADY_S0,
            RID_S => RID_S0,
            RDATA_S => RDATA_S0,
            RRESP_S => RRESP_S0,
            RLAST_S => RLAST_S0,
            RVALID_S => RVALID_S0,
            RREADY_S => RREADY_S0_xhdl69);   
   END GENERATE L7;
   
   L8: IF ((((M0_SLAVE1ENABLE = 1 OR M1_SLAVE1ENABLE = 1 OR M2_SLAVE1ENABLE = 1 OR 
   M3_SLAVE1ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE1ENABLE = 1 OR 
   M1_SLAVE1ENABLE = 1 OR M2_SLAVE1ENABLE = 1 OR M3_SLAVE1ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 1))) AND FEED_THROUGH /= 1) GENERATE
      slave_stage1 : axi_slave_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_IS => AWID_IS1,
            AWADDR_IS => AWADDR_IS1,
            AWLEN_IS => AWLEN_IS1,
            AWSIZE_IS => AWSIZE_IS1,
            AWBURST_IS => AWBURST_IS1,
            AWLOCK_IS => AWLOCK_IS1,
            AWCACHE_IS => AWCACHE_IS1,
            AWPROT_IS => AWPROT_IS1,
            AWVALID_IS => AWVALID_IS1,
            AWREADY_SI => AWREADY_SI1,
            WID_IS => WID_IS1,
            WDATA_IS => WDATA_IS1,
            WSTRB_IS => WSTRB_IS1,
            WLAST_IS => WLAST_IS1,
            WVALID_IS => WVALID_IS1,
            WREADY_SI => WREADY_SI1,
            BID_SI => BID_SI1,
            BRESP_SI => BRESP_SI1,
            BVALID_SI => BVALID_SI1,
            BREADY_IS => BREADY_IS1,
            ARID_IS => ARID_IS1,
            ARADDR_IS => ARADDR_IS1,
            ARLEN_IS => ARLEN_IS1,
            ARSIZE_IS => ARSIZE_IS1,
            ARBURST_IS => ARBURST_IS1,
            ARLOCK_IS => ARLOCK_IS1,
            ARCACHE_IS => ARCACHE_IS1,
            ARPROT_IS => ARPROT_IS1,
            ARVALID_IS => ARVALID_IS1,
            ARREADY_SI => ARREADY_SI1,
            RID_SI => RID_SI1,
            RDATA_SI => RDATA_SI1,
            RRESP_SI => RRESP_SI1,
            RLAST_SI => RLAST_SI1,
            RVALID_SI => RVALID_SI1,
            RREADY_IS => RREADY_IS1,
            AWID_S => AWID_S1_xhdl70,
            AWADDR_S => AWADDR_S1_xhdl71,
            AWLEN_S => AWLEN_S1_xhdl72,
            AWSIZE_S => AWSIZE_S1_xhdl73,
            AWBURST_S => AWBURST_S1_xhdl74,
            AWLOCK_S => AWLOCK_S1_xhdl75,
            AWCACHE_S => AWCACHE_S1_xhdl76,
            AWPROT_S => AWPROT_S1_xhdl77,
            AWVALID_S => AWVALID_S1_xhdl78,
            AWREADY_S => AWREADY_S1,
            WID_S => WID_S1_xhdl79,
            WDATA_S => WDATA_S1_xhdl80,
            WSTRB_S => WSTRB_S1_xhdl81,
            WLAST_S => WLAST_S1_xhdl82,
            WVALID_S => WVALID_S1_xhdl83,
            WREADY_S => WREADY_S1,
            BID_S => BID_S1,
            BRESP_S => BRESP_S1,
            BVALID_S => BVALID_S1,
            BREADY_S => BREADY_S1_xhdl84,
            ARID_S => ARID_S1_xhdl85,
            ARADDR_S => ARADDR_S1_xhdl86,
            ARLEN_S => ARLEN_S1_xhdl87,
            ARSIZE_S => ARSIZE_S1_xhdl88,
            ARBURST_S => ARBURST_S1_xhdl89,
            ARLOCK_S => ARLOCK_S1_xhdl90,
            ARCACHE_S => ARCACHE_S1_xhdl91,
            ARPROT_S => ARPROT_S1_xhdl92,
            ARVALID_S => ARVALID_S1_xhdl93,
            ARREADY_S => ARREADY_S1,
            RID_S => RID_S1,
            RDATA_S => RDATA_S1,
            RRESP_S => RRESP_S1,
            RLAST_S => RLAST_S1,
            RVALID_S => RVALID_S1,
            RREADY_S => RREADY_S1_xhdl94);   
   END GENERATE L8;
   
   L9: IF ((((M0_SLAVE2ENABLE = 1 OR M1_SLAVE2ENABLE = 1 OR M2_SLAVE2ENABLE = 1 OR 
   M3_SLAVE2ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE2ENABLE = 1 OR 
   M1_SLAVE2ENABLE = 1 OR M2_SLAVE2ENABLE = 1 OR M3_SLAVE2ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 1))) AND FEED_THROUGH /= 1) GENERATE
      slave_stage2 : axi_slave_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_IS => AWID_IS2,
            AWADDR_IS => AWADDR_IS2,
            AWLEN_IS => AWLEN_IS2,
            AWSIZE_IS => AWSIZE_IS2,
            AWBURST_IS => AWBURST_IS2,
            AWLOCK_IS => AWLOCK_IS2,
            AWCACHE_IS => AWCACHE_IS2,
            AWPROT_IS => AWPROT_IS2,
            AWVALID_IS => AWVALID_IS2,
            AWREADY_SI => AWREADY_SI2,
            WID_IS => WID_IS2,
            WDATA_IS => WDATA_IS2,
            WSTRB_IS => WSTRB_IS2,
            WLAST_IS => WLAST_IS2,
            WVALID_IS => WVALID_IS2,
            WREADY_SI => WREADY_SI2,
            BID_SI => BID_SI2,
            BRESP_SI => BRESP_SI2,
            BVALID_SI => BVALID_SI2,
            BREADY_IS => BREADY_IS2,
            ARID_IS => ARID_IS2,
            ARADDR_IS => ARADDR_IS2,
            ARLEN_IS => ARLEN_IS2,
            ARSIZE_IS => ARSIZE_IS2,
            ARBURST_IS => ARBURST_IS2,
            ARLOCK_IS => ARLOCK_IS2,
            ARCACHE_IS => ARCACHE_IS2,
            ARPROT_IS => ARPROT_IS2,
            ARVALID_IS => ARVALID_IS2,
            ARREADY_SI => ARREADY_SI2,
            RID_SI => RID_SI2,
            RDATA_SI => RDATA_SI2,
            RRESP_SI => RRESP_SI2,
            RLAST_SI => RLAST_SI2,
            RVALID_SI => RVALID_SI2,
            RREADY_IS => RREADY_IS2,
            AWID_S => AWID_S2_xhdl95,
            AWADDR_S => AWADDR_S2_xhdl96,
            AWLEN_S => AWLEN_S2_xhdl97,
            AWSIZE_S => AWSIZE_S2_xhdl98,
            AWBURST_S => AWBURST_S2_xhdl99,
            AWLOCK_S => AWLOCK_S2_xhdl100,
            AWCACHE_S => AWCACHE_S2_xhdl101,
            AWPROT_S => AWPROT_S2_xhdl102,
            AWVALID_S => AWVALID_S2_xhdl103,
            AWREADY_S => AWREADY_S2,
            WID_S => WID_S2_xhdl104,
            WDATA_S => WDATA_S2_xhdl105,
            WSTRB_S => WSTRB_S2_xhdl106,
            WLAST_S => WLAST_S2_xhdl107,
            WVALID_S => WVALID_S2_xhdl108,
            WREADY_S => WREADY_S2,
            BID_S => BID_S2,
            BRESP_S => BRESP_S2,
            BVALID_S => BVALID_S2,
            BREADY_S => BREADY_S2_xhdl109,
            ARID_S => ARID_S2_xhdl110,
            ARADDR_S => ARADDR_S2_xhdl111,
            ARLEN_S => ARLEN_S2_xhdl112,
            ARSIZE_S => ARSIZE_S2_xhdl113,
            ARBURST_S => ARBURST_S2_xhdl114,
            ARLOCK_S => ARLOCK_S2_xhdl115,
            ARCACHE_S => ARCACHE_S2_xhdl116,
            ARPROT_S => ARPROT_S2_xhdl117,
            ARVALID_S => ARVALID_S2_xhdl118,
            ARREADY_S => ARREADY_S2,
            RID_S => RID_S2,
            RDATA_S => RDATA_S2,
            RRESP_S => RRESP_S2,
            RLAST_S => RLAST_S2,
            RVALID_S => RVALID_S2,
            RREADY_S => RREADY_S2_xhdl119);   
   END GENERATE L9;
   -- if (M0_SLAVE3ENABLE == 1)   
   
   L10: IF ((((M0_SLAVE3ENABLE = 1 OR M1_SLAVE3ENABLE = 1 OR M2_SLAVE3ENABLE = 1 OR 
   M3_SLAVE3ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE3ENABLE = 1 OR 
   M1_SLAVE3ENABLE = 1 OR M2_SLAVE3ENABLE = 1 OR M3_SLAVE3ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 1))) AND FEED_THROUGH /= 1) GENERATE
      slave_stage3 : axi_slave_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_IS => AWID_IS3,
            AWADDR_IS => AWADDR_IS3,
            AWLEN_IS => AWLEN_IS3,
            AWSIZE_IS => AWSIZE_IS3,
            AWBURST_IS => AWBURST_IS3,
            AWLOCK_IS => AWLOCK_IS3,
            AWCACHE_IS => AWCACHE_IS3,
            AWPROT_IS => AWPROT_IS3,
            AWVALID_IS => AWVALID_IS3,
            AWREADY_SI => AWREADY_SI3,
            WID_IS => WID_IS3,
            WDATA_IS => WDATA_IS3,
            WSTRB_IS => WSTRB_IS3,
            WLAST_IS => WLAST_IS3,
            WVALID_IS => WVALID_IS3,
            WREADY_SI => WREADY_SI3,
            BID_SI => BID_SI3,
            BRESP_SI => BRESP_SI3,
            BVALID_SI => BVALID_SI3,
            BREADY_IS => BREADY_IS3,
            ARID_IS => ARID_IS3,
            ARADDR_IS => ARADDR_IS3,
            ARLEN_IS => ARLEN_IS3,
            ARSIZE_IS => ARSIZE_IS3,
            ARBURST_IS => ARBURST_IS3,
            ARLOCK_IS => ARLOCK_IS3,
            ARCACHE_IS => ARCACHE_IS3,
            ARPROT_IS => ARPROT_IS3,
            ARVALID_IS => ARVALID_IS3,
            ARREADY_SI => ARREADY_SI3,
            RID_SI => RID_SI3,
            RDATA_SI => RDATA_SI3,
            RRESP_SI => RRESP_SI3,
            RLAST_SI => RLAST_SI3,
            RVALID_SI => RVALID_SI3,
            RREADY_IS => RREADY_IS3,
            AWID_S => AWID_S3_xhdl120,
            AWADDR_S => AWADDR_S3_xhdl121,
            AWLEN_S => AWLEN_S3_xhdl122,
            AWSIZE_S => AWSIZE_S3_xhdl123,
            AWBURST_S => AWBURST_S3_xhdl124,
            AWLOCK_S => AWLOCK_S3_xhdl125,
            AWCACHE_S => AWCACHE_S3_xhdl126,
            AWPROT_S => AWPROT_S3_xhdl127,
            AWVALID_S => AWVALID_S3_xhdl128,
            AWREADY_S => AWREADY_S3,
            WID_S => WID_S3_xhdl129,
            WDATA_S => WDATA_S3_xhdl130,
            WSTRB_S => WSTRB_S3_xhdl131,
            WLAST_S => WLAST_S3_xhdl132,
            WVALID_S => WVALID_S3_xhdl133,
            WREADY_S => WREADY_S3,
            BID_S => BID_S3,
            BRESP_S => BRESP_S3,
            BVALID_S => BVALID_S3,
            BREADY_S => BREADY_S3_xhdl134,
            ARID_S => ARID_S3_xhdl135,
            ARADDR_S => ARADDR_S3_xhdl136,
            ARLEN_S => ARLEN_S3_xhdl137,
            ARSIZE_S => ARSIZE_S3_xhdl138,
            ARBURST_S => ARBURST_S3_xhdl139,
            ARLOCK_S => ARLOCK_S3_xhdl140,
            ARCACHE_S => ARCACHE_S3_xhdl141,
            ARPROT_S => ARPROT_S3_xhdl142,
            ARVALID_S => ARVALID_S3_xhdl143,
            ARREADY_S => ARREADY_S3,
            RID_S => RID_S3,
            RDATA_S => RDATA_S3,
            RRESP_S => RRESP_S3,
            RLAST_S => RLAST_S3,
            RVALID_S => RVALID_S3,
            RREADY_S => RREADY_S3_xhdl144);   
   END GENERATE L10;
   
   L11: IF ((((M0_SLAVE4ENABLE = 1 OR M1_SLAVE4ENABLE = 1 OR M2_SLAVE4ENABLE = 1 OR 
   M3_SLAVE4ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE4ENABLE = 1 OR 
   M1_SLAVE4ENABLE = 1 OR M2_SLAVE4ENABLE = 1 OR M3_SLAVE4ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 1))) AND FEED_THROUGH /= 1) GENERATE
      slave_stage4 : axi_slave_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_IS => AWID_IS4,
            AWADDR_IS => AWADDR_IS4,
            AWLEN_IS => AWLEN_IS4,
            AWSIZE_IS => AWSIZE_IS4,
            AWBURST_IS => AWBURST_IS4,
            AWLOCK_IS => AWLOCK_IS4,
            AWCACHE_IS => AWCACHE_IS4,
            AWPROT_IS => AWPROT_IS4,
            AWVALID_IS => AWVALID_IS4,
            AWREADY_SI => AWREADY_SI4,
            WID_IS => WID_IS4,
            WDATA_IS => WDATA_IS4,
            WSTRB_IS => WSTRB_IS4,
            WLAST_IS => WLAST_IS4,
            WVALID_IS => WVALID_IS4,
            WREADY_SI => WREADY_SI4,
            BID_SI => BID_SI4,
            BRESP_SI => BRESP_SI4,
            BVALID_SI => BVALID_SI4,
            BREADY_IS => BREADY_IS4,
            ARID_IS => ARID_IS4,
            ARADDR_IS => ARADDR_IS4,
            ARLEN_IS => ARLEN_IS4,
            ARSIZE_IS => ARSIZE_IS4,
            ARBURST_IS => ARBURST_IS4,
            ARLOCK_IS => ARLOCK_IS4,
            ARCACHE_IS => ARCACHE_IS4,
            ARPROT_IS => ARPROT_IS4,
            ARVALID_IS => ARVALID_IS4,
            ARREADY_SI => ARREADY_SI4,
            RID_SI => RID_SI4,
            RDATA_SI => RDATA_SI4,
            RRESP_SI => RRESP_SI4,
            RLAST_SI => RLAST_SI4,
            RVALID_SI => RVALID_SI4,
            RREADY_IS => RREADY_IS4,
            AWID_S => AWID_S4_xhdl145,
            AWADDR_S => AWADDR_S4_xhdl146,
            AWLEN_S => AWLEN_S4_xhdl147,
            AWSIZE_S => AWSIZE_S4_xhdl148,
            AWBURST_S => AWBURST_S4_xhdl149,
            AWLOCK_S => AWLOCK_S4_xhdl150,
            AWCACHE_S => AWCACHE_S4_xhdl151,
            AWPROT_S => AWPROT_S4_xhdl152,
            AWVALID_S => AWVALID_S4_xhdl153,
            AWREADY_S => AWREADY_S4,
            WID_S => WID_S4_xhdl154,
            WDATA_S => WDATA_S4_xhdl155,
            WSTRB_S => WSTRB_S4_xhdl156,
            WLAST_S => WLAST_S4_xhdl157,
            WVALID_S => WVALID_S4_xhdl158,
            WREADY_S => WREADY_S4,
            BID_S => BID_S4,
            BRESP_S => BRESP_S4,
            BVALID_S => BVALID_S4,
            BREADY_S => BREADY_S4_xhdl159,
            ARID_S => ARID_S4_xhdl160,
            ARADDR_S => ARADDR_S4_xhdl161,
            ARLEN_S => ARLEN_S4_xhdl162,
            ARSIZE_S => ARSIZE_S4_xhdl163,
            ARBURST_S => ARBURST_S4_xhdl164,
            ARLOCK_S => ARLOCK_S4_xhdl165,
            ARCACHE_S => ARCACHE_S4_xhdl166,
            ARPROT_S => ARPROT_S4_xhdl167,
            ARVALID_S => ARVALID_S4_xhdl168,
            ARREADY_S => ARREADY_S4,
            RID_S => RID_S4,
            RDATA_S => RDATA_S4,
            RRESP_S => RRESP_S4,
            RLAST_S => RLAST_S4,
            RVALID_S => RVALID_S4,
            RREADY_S => RREADY_S4_xhdl169);   
   END GENERATE L11;
   
   L12 : IF ((((M0_SLAVE5ENABLE = 1 OR M1_SLAVE5ENABLE = 1 OR M2_SLAVE5ENABLE = 1 OR 
   M3_SLAVE5ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE5ENABLE = 1 OR 
   M1_SLAVE5ENABLE = 1 OR M2_SLAVE5ENABLE = 1 OR M3_SLAVE5ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 1))) AND FEED_THROUGH /= 1) GENERATE
      slave_stage5 : axi_slave_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_IS => AWID_IS5,
            AWADDR_IS => AWADDR_IS5,
            AWLEN_IS => AWLEN_IS5,
            AWSIZE_IS => AWSIZE_IS5,
            AWBURST_IS => AWBURST_IS5,
            AWLOCK_IS => AWLOCK_IS5,
            AWCACHE_IS => AWCACHE_IS5,
            AWPROT_IS => AWPROT_IS5,
            AWVALID_IS => AWVALID_IS5,
            AWREADY_SI => AWREADY_SI5,
            WID_IS => WID_IS5,
            WDATA_IS => WDATA_IS5,
            WSTRB_IS => WSTRB_IS5,
            WLAST_IS => WLAST_IS5,
            WVALID_IS => WVALID_IS5,
            WREADY_SI => WREADY_SI5,
            BID_SI => BID_SI5,
            BRESP_SI => BRESP_SI5,
            BVALID_SI => BVALID_SI5,
            BREADY_IS => BREADY_IS5,
            ARID_IS => ARID_IS5,
            ARADDR_IS => ARADDR_IS5,
            ARLEN_IS => ARLEN_IS5,
            ARSIZE_IS => ARSIZE_IS5,
            ARBURST_IS => ARBURST_IS5,
            ARLOCK_IS => ARLOCK_IS5,
            ARCACHE_IS => ARCACHE_IS5,
            ARPROT_IS => ARPROT_IS5,
            ARVALID_IS => ARVALID_IS5,
            ARREADY_SI => ARREADY_SI5,
            RID_SI => RID_SI5,
            RDATA_SI => RDATA_SI5,
            RRESP_SI => RRESP_SI5,
            RLAST_SI => RLAST_SI5,
            RVALID_SI => RVALID_SI5,
            RREADY_IS => RREADY_IS5,
            AWID_S => AWID_S5_xhdl170,
            AWADDR_S => AWADDR_S5_xhdl171,
            AWLEN_S => AWLEN_S5_xhdl172,
            AWSIZE_S => AWSIZE_S5_xhdl173,
            AWBURST_S => AWBURST_S5_xhdl174,
            AWLOCK_S => AWLOCK_S5_xhdl175,
            AWCACHE_S => AWCACHE_S5_xhdl176,
            AWPROT_S => AWPROT_S5_xhdl177,
            AWVALID_S => AWVALID_S5_xhdl178,
            AWREADY_S => AWREADY_S5,
            WID_S => WID_S5_xhdl179,
            WDATA_S => WDATA_S5_xhdl180,
            WSTRB_S => WSTRB_S5_xhdl181,
            WLAST_S => WLAST_S5_xhdl182,
            WVALID_S => WVALID_S5_xhdl183,
            WREADY_S => WREADY_S5,
            BID_S => BID_S5,
            BRESP_S => BRESP_S5,
            BVALID_S => BVALID_S5,
            BREADY_S => BREADY_S5_xhdl184,
            ARID_S => ARID_S5_xhdl185,
            ARADDR_S => ARADDR_S5_xhdl186,
            ARLEN_S => ARLEN_S5_xhdl187,
            ARSIZE_S => ARSIZE_S5_xhdl188,
            ARBURST_S => ARBURST_S5_xhdl189,
            ARLOCK_S => ARLOCK_S5_xhdl190,
            ARCACHE_S => ARCACHE_S5_xhdl191,
            ARPROT_S => ARPROT_S5_xhdl192,
            ARVALID_S => ARVALID_S5_xhdl193,
            ARREADY_S => ARREADY_S5,
            RID_S => RID_S5,
            RDATA_S => RDATA_S5,
            RRESP_S => RRESP_S5,
            RLAST_S => RLAST_S5,
            RVALID_S => RVALID_S5,
            RREADY_S => RREADY_S5_xhdl194);   
   END GENERATE L12;
   
   L13: IF ((((M0_SLAVE6ENABLE = 1 OR M1_SLAVE6ENABLE = 1 OR M2_SLAVE6ENABLE = 1 OR 
   M3_SLAVE6ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE6ENABLE = 1 OR 
   M1_SLAVE6ENABLE = 1 OR M2_SLAVE6ENABLE = 1 OR M3_SLAVE6ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 1))) AND FEED_THROUGH /= 1) GENERATE
      slave_stage6 : axi_slave_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_IS => AWID_IS6,
            AWADDR_IS => AWADDR_IS6,
            AWLEN_IS => AWLEN_IS6,
            AWSIZE_IS => AWSIZE_IS6,
            AWBURST_IS => AWBURST_IS6,
            AWLOCK_IS => AWLOCK_IS6,
            AWCACHE_IS => AWCACHE_IS6,
            AWPROT_IS => AWPROT_IS6,
            AWVALID_IS => AWVALID_IS6,
            AWREADY_SI => AWREADY_SI6,
            WID_IS => WID_IS6,
            WDATA_IS => WDATA_IS6,
            WSTRB_IS => WSTRB_IS6,
            WLAST_IS => WLAST_IS6,
            WVALID_IS => WVALID_IS6,
            WREADY_SI => WREADY_SI6,
            BID_SI => BID_SI6,
            BRESP_SI => BRESP_SI6,
            BVALID_SI => BVALID_SI6,
            BREADY_IS => BREADY_IS6,
            ARID_IS => ARID_IS6,
            ARADDR_IS => ARADDR_IS6,
            ARLEN_IS => ARLEN_IS6,
            ARSIZE_IS => ARSIZE_IS6,
            ARBURST_IS => ARBURST_IS6,
            ARLOCK_IS => ARLOCK_IS6,
            ARCACHE_IS => ARCACHE_IS6,
            ARPROT_IS => ARPROT_IS6,
            ARVALID_IS => ARVALID_IS6,
            ARREADY_SI => ARREADY_SI6,
            RID_SI => RID_SI6,
            RDATA_SI => RDATA_SI6,
            RRESP_SI => RRESP_SI6,
            RLAST_SI => RLAST_SI6,
            RVALID_SI => RVALID_SI6,
            RREADY_IS => RREADY_IS6,
            AWID_S => AWID_S6_xhdl195,
            AWADDR_S => AWADDR_S6_xhdl196,
            AWLEN_S => AWLEN_S6_xhdl197,
            AWSIZE_S => AWSIZE_S6_xhdl198,
            AWBURST_S => AWBURST_S6_xhdl199,
            AWLOCK_S => AWLOCK_S6_xhdl200,
            AWCACHE_S => AWCACHE_S6_xhdl201,
            AWPROT_S => AWPROT_S6_xhdl202,
            AWVALID_S => AWVALID_S6_xhdl203,
            AWREADY_S => AWREADY_S6,
            WID_S => WID_S6_xhdl204,
            WDATA_S => WDATA_S6_xhdl205,
            WSTRB_S => WSTRB_S6_xhdl206,
            WLAST_S => WLAST_S6_xhdl207,
            WVALID_S => WVALID_S6_xhdl208,
            WREADY_S => WREADY_S6,
            BID_S => BID_S6,
            BRESP_S => BRESP_S6,
            BVALID_S => BVALID_S6,
            BREADY_S => BREADY_S6_xhdl209,
            ARID_S => ARID_S6_xhdl210,
            ARADDR_S => ARADDR_S6_xhdl211,
            ARLEN_S => ARLEN_S6_xhdl212,
            ARSIZE_S => ARSIZE_S6_xhdl213,
            ARBURST_S => ARBURST_S6_xhdl214,
            ARLOCK_S => ARLOCK_S6_xhdl215,
            ARCACHE_S => ARCACHE_S6_xhdl216,
            ARPROT_S => ARPROT_S6_xhdl217,
            ARVALID_S => ARVALID_S6_xhdl218,
            ARREADY_S => ARREADY_S6,
            RID_S => RID_S6,
            RDATA_S => RDATA_S6,
            RRESP_S => RRESP_S6,
            RLAST_S => RLAST_S6,
            RVALID_S => RVALID_S6,
            RREADY_S => RREADY_S6_xhdl219);   
   END GENERATE L13;
   
   L14 : IF ((((M0_SLAVE7ENABLE = 1 OR M1_SLAVE7ENABLE = 1 OR M2_SLAVE7ENABLE = 1 OR 
   M3_SLAVE7ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE7ENABLE = 1 OR 
   M1_SLAVE7ENABLE = 1 OR M2_SLAVE7ENABLE = 1 OR M3_SLAVE7ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 1))) AND FEED_THROUGH /= 1) GENERATE
      slave_stage7 : axi_slave_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_IS => AWID_IS7,
            AWADDR_IS => AWADDR_IS7,
            AWLEN_IS => AWLEN_IS7,
            AWSIZE_IS => AWSIZE_IS7,
            AWBURST_IS => AWBURST_IS7,
            AWLOCK_IS => AWLOCK_IS7,
            AWCACHE_IS => AWCACHE_IS7,
            AWPROT_IS => AWPROT_IS7,
            AWVALID_IS => AWVALID_IS7,
            AWREADY_SI => AWREADY_SI7,
            WID_IS => WID_IS7,
            WDATA_IS => WDATA_IS7,
            WSTRB_IS => WSTRB_IS7,
            WLAST_IS => WLAST_IS7,
            WVALID_IS => WVALID_IS7,
            WREADY_SI => WREADY_SI7,
            BID_SI => BID_SI7,
            BRESP_SI => BRESP_SI7,
            BVALID_SI => BVALID_SI7,
            BREADY_IS => BREADY_IS7,
            ARID_IS => ARID_IS7,
            ARADDR_IS => ARADDR_IS7,
            ARLEN_IS => ARLEN_IS7,
            ARSIZE_IS => ARSIZE_IS7,
            ARBURST_IS => ARBURST_IS7,
            ARLOCK_IS => ARLOCK_IS7,
            ARCACHE_IS => ARCACHE_IS7,
            ARPROT_IS => ARPROT_IS7,
            ARVALID_IS => ARVALID_IS7,
            ARREADY_SI => ARREADY_SI7,
            RID_SI => RID_SI7,
            RDATA_SI => RDATA_SI7,
            RRESP_SI => RRESP_SI7,
            RLAST_SI => RLAST_SI7,
            RVALID_SI => RVALID_SI7,
            RREADY_IS => RREADY_IS7,
            AWID_S => AWID_S7_xhdl220,
            AWADDR_S => AWADDR_S7_xhdl221,
            AWLEN_S => AWLEN_S7_xhdl222,
            AWSIZE_S => AWSIZE_S7_xhdl223,
            AWBURST_S => AWBURST_S7_xhdl224,
            AWLOCK_S => AWLOCK_S7_xhdl225,
            AWCACHE_S => AWCACHE_S7_xhdl226,
            AWPROT_S => AWPROT_S7_xhdl227,
            AWVALID_S => AWVALID_S7_xhdl228,
            AWREADY_S => AWREADY_S7,
            WID_S => WID_S7_xhdl229,
            WDATA_S => WDATA_S7_xhdl230,
            WSTRB_S => WSTRB_S7_xhdl231,
            WLAST_S => WLAST_S7_xhdl232,
            WVALID_S => WVALID_S7_xhdl233,
            WREADY_S => WREADY_S7,
            BID_S => BID_S7,
            BRESP_S => BRESP_S7,
            BVALID_S => BVALID_S7,
            BREADY_S => BREADY_S7_xhdl234,
            ARID_S => ARID_S7_xhdl235,
            ARADDR_S => ARADDR_S7_xhdl236,
            ARLEN_S => ARLEN_S7_xhdl237,
            ARSIZE_S => ARSIZE_S7_xhdl238,
            ARBURST_S => ARBURST_S7_xhdl239,
            ARLOCK_S => ARLOCK_S7_xhdl240,
            ARCACHE_S => ARCACHE_S7_xhdl241,
            ARPROT_S => ARPROT_S7_xhdl242,
            ARVALID_S => ARVALID_S7_xhdl243,
            ARREADY_S => ARREADY_S7,
            RID_S => RID_S7,
            RDATA_S => RDATA_S7,
            RRESP_S => RRESP_S7,
            RLAST_S => RLAST_S7,
            RVALID_S => RVALID_S7,
            RREADY_S => RREADY_S7_xhdl244);   
   END GENERATE L14;
   
   L15: IF ((((M0_SLAVE8ENABLE = 1 OR M1_SLAVE8ENABLE = 1 OR M2_SLAVE8ENABLE = 1 OR 
   M3_SLAVE8ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE8ENABLE = 1 OR 
   M1_SLAVE8ENABLE = 1 OR M2_SLAVE8ENABLE = 1 OR M3_SLAVE8ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 0))) AND FEED_THROUGH /= 1) GENERATE
      slave_stage8 : axi_slave_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_IS => AWID_IS8,
            AWADDR_IS => AWADDR_IS8,
            AWLEN_IS => AWLEN_IS8,
            AWSIZE_IS => AWSIZE_IS8,
            AWBURST_IS => AWBURST_IS8,
            AWLOCK_IS => AWLOCK_IS8,
            AWCACHE_IS => AWCACHE_IS8,
            AWPROT_IS => AWPROT_IS8,
            AWVALID_IS => AWVALID_IS8,
            AWREADY_SI => AWREADY_SI8,
            WID_IS => WID_IS8,
            WDATA_IS => WDATA_IS8,
            WSTRB_IS => WSTRB_IS8,
            WLAST_IS => WLAST_IS8,
            WVALID_IS => WVALID_IS8,
            WREADY_SI => WREADY_SI8,
            BID_SI => BID_SI8,
            BRESP_SI => BRESP_SI8,
            BVALID_SI => BVALID_SI8,
            BREADY_IS => BREADY_IS8,
            ARID_IS => ARID_IS8,
            ARADDR_IS => ARADDR_IS8,
            ARLEN_IS => ARLEN_IS8,
            ARSIZE_IS => ARSIZE_IS8,
            ARBURST_IS => ARBURST_IS8,
            ARLOCK_IS => ARLOCK_IS8,
            ARCACHE_IS => ARCACHE_IS8,
            ARPROT_IS => ARPROT_IS8,
            ARVALID_IS => ARVALID_IS8,
            ARREADY_SI => ARREADY_SI8,
            RID_SI => RID_SI8,
            RDATA_SI => RDATA_SI8,
            RRESP_SI => RRESP_SI8,
            RLAST_SI => RLAST_SI8,
            RVALID_SI => RVALID_SI8,
            RREADY_IS => RREADY_IS8,
            AWID_S => AWID_S8_xhdl245,
            AWADDR_S => AWADDR_S8_xhdl246,
            AWLEN_S => AWLEN_S8_xhdl247,
            AWSIZE_S => AWSIZE_S8_xhdl248,
            AWBURST_S => AWBURST_S8_xhdl249,
            AWLOCK_S => AWLOCK_S8_xhdl250,
            AWCACHE_S => AWCACHE_S8_xhdl251,
            AWPROT_S => AWPROT_S8_xhdl252,
            AWVALID_S => AWVALID_S8_xhdl253,
            AWREADY_S => AWREADY_S8,
            WID_S => WID_S8_xhdl254,
            WDATA_S => WDATA_S8_xhdl255,
            WSTRB_S => WSTRB_S8_xhdl256,
            WLAST_S => WLAST_S8_xhdl257,
            WVALID_S => WVALID_S8_xhdl258,
            WREADY_S => WREADY_S8,
            BID_S => BID_S8,
            BRESP_S => BRESP_S8,
            BVALID_S => BVALID_S8,
            BREADY_S => BREADY_S8_xhdl259,
            ARID_S => ARID_S8_xhdl260,
            ARADDR_S => ARADDR_S8_xhdl261,
            ARLEN_S => ARLEN_S8_xhdl262,
            ARSIZE_S => ARSIZE_S8_xhdl263,
            ARBURST_S => ARBURST_S8_xhdl264,
            ARLOCK_S => ARLOCK_S8_xhdl265,
            ARCACHE_S => ARCACHE_S8_xhdl266,
            ARPROT_S => ARPROT_S8_xhdl267,
            ARVALID_S => ARVALID_S8_xhdl268,
            ARREADY_S => ARREADY_S8,
            RID_S => RID_S8,
            RDATA_S => RDATA_S8,
            RRESP_S => RRESP_S8,
            RLAST_S => RLAST_S8,
            RVALID_S => RVALID_S8,
            RREADY_S => RREADY_S8_xhdl269);   
   END GENERATE L15;
   
   L16 : IF ((((M0_SLAVE9ENABLE = 1 OR M1_SLAVE9ENABLE = 1 OR M2_SLAVE9ENABLE = 1 OR 
   M3_SLAVE9ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE9ENABLE = 1 OR 
   M1_SLAVE9ENABLE = 1 OR M2_SLAVE9ENABLE = 1 OR M3_SLAVE9ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 0))) AND FEED_THROUGH /= 1) GENERATE
      slave_stage9 : axi_slave_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_IS => AWID_IS9,
            AWADDR_IS => AWADDR_IS9,
            AWLEN_IS => AWLEN_IS9,
            AWSIZE_IS => AWSIZE_IS9,
            AWBURST_IS => AWBURST_IS9,
            AWLOCK_IS => AWLOCK_IS9,
            AWCACHE_IS => AWCACHE_IS9,
            AWPROT_IS => AWPROT_IS9,
            AWVALID_IS => AWVALID_IS9,
            AWREADY_SI => AWREADY_SI9,
            WID_IS => WID_IS9,
            WDATA_IS => WDATA_IS9,
            WSTRB_IS => WSTRB_IS9,
            WLAST_IS => WLAST_IS9,
            WVALID_IS => WVALID_IS9,
            WREADY_SI => WREADY_SI9,
            BID_SI => BID_SI9,
            BRESP_SI => BRESP_SI9,
            BVALID_SI => BVALID_SI9,
            BREADY_IS => BREADY_IS9,
            ARID_IS => ARID_IS9,
            ARADDR_IS => ARADDR_IS9,
            ARLEN_IS => ARLEN_IS9,
            ARSIZE_IS => ARSIZE_IS9,
            ARBURST_IS => ARBURST_IS9,
            ARLOCK_IS => ARLOCK_IS9,
            ARCACHE_IS => ARCACHE_IS9,
            ARPROT_IS => ARPROT_IS9,
            ARVALID_IS => ARVALID_IS9,
            ARREADY_SI => ARREADY_SI9,
            RID_SI => RID_SI9,
            RDATA_SI => RDATA_SI9,
            RRESP_SI => RRESP_SI9,
            RLAST_SI => RLAST_SI9,
            RVALID_SI => RVALID_SI9,
            RREADY_IS => RREADY_IS9,
            AWID_S => AWID_S9_xhdl270,
            AWADDR_S => AWADDR_S9_xhdl271,
            AWLEN_S => AWLEN_S9_xhdl272,
            AWSIZE_S => AWSIZE_S9_xhdl273,
            AWBURST_S => AWBURST_S9_xhdl274,
            AWLOCK_S => AWLOCK_S9_xhdl275,
            AWCACHE_S => AWCACHE_S9_xhdl276,
            AWPROT_S => AWPROT_S9_xhdl277,
            AWVALID_S => AWVALID_S9_xhdl278,
            AWREADY_S => AWREADY_S9,
            WID_S => WID_S9_xhdl279,
            WDATA_S => WDATA_S9_xhdl280,
            WSTRB_S => WSTRB_S9_xhdl281,
            WLAST_S => WLAST_S9_xhdl282,
            WVALID_S => WVALID_S9_xhdl283,
            WREADY_S => WREADY_S9,
            BID_S => BID_S9,
            BRESP_S => BRESP_S9,
            BVALID_S => BVALID_S9,
            BREADY_S => BREADY_S9_xhdl284,
            ARID_S => ARID_S9_xhdl285,
            ARADDR_S => ARADDR_S9_xhdl286,
            ARLEN_S => ARLEN_S9_xhdl287,
            ARSIZE_S => ARSIZE_S9_xhdl288,
            ARBURST_S => ARBURST_S9_xhdl289,
            ARLOCK_S => ARLOCK_S9_xhdl290,
            ARCACHE_S => ARCACHE_S9_xhdl291,
            ARPROT_S => ARPROT_S9_xhdl292,
            ARVALID_S => ARVALID_S9_xhdl293,
            ARREADY_S => ARREADY_S9,
            RID_S => RID_S9,
            RDATA_S => RDATA_S9,
            RRESP_S => RRESP_S9,
            RLAST_S => RLAST_S9,
            RVALID_S => RVALID_S9,
            RREADY_S => RREADY_S9_xhdl294);   
   END GENERATE L16;
   
   L17: IF ((((M0_SLAVE10ENABLE = 1 OR M1_SLAVE10ENABLE = 1 OR M2_SLAVE10ENABLE = 1 
   OR M3_SLAVE10ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE10ENABLE = 1 OR 
   M1_SLAVE10ENABLE = 1 OR M2_SLAVE10ENABLE = 1 OR M3_SLAVE10ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 0))) AND FEED_THROUGH /= 1) GENERATE
      slave_stage10 : axi_slave_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_IS => AWID_IS10,
            AWADDR_IS => AWADDR_IS10,
            AWLEN_IS => AWLEN_IS10,
            AWSIZE_IS => AWSIZE_IS10,
            AWBURST_IS => AWBURST_IS10,
            AWLOCK_IS => AWLOCK_IS10,
            AWCACHE_IS => AWCACHE_IS10,
            AWPROT_IS => AWPROT_IS10,
            AWVALID_IS => AWVALID_IS10,
            AWREADY_SI => AWREADY_SI10,
            WID_IS => WID_IS10,
            WDATA_IS => WDATA_IS10,
            WSTRB_IS => WSTRB_IS10,
            WLAST_IS => WLAST_IS10,
            WVALID_IS => WVALID_IS10,
            WREADY_SI => WREADY_SI10,
            BID_SI => BID_SI10,
            BRESP_SI => BRESP_SI10,
            BVALID_SI => BVALID_SI10,
            BREADY_IS => BREADY_IS10,
            ARID_IS => ARID_IS10,
            ARADDR_IS => ARADDR_IS10,
            ARLEN_IS => ARLEN_IS10,
            ARSIZE_IS => ARSIZE_IS10,
            ARBURST_IS => ARBURST_IS10,
            ARLOCK_IS => ARLOCK_IS10,
            ARCACHE_IS => ARCACHE_IS10,
            ARPROT_IS => ARPROT_IS10,
            ARVALID_IS => ARVALID_IS10,
            ARREADY_SI => ARREADY_SI10,
            RID_SI => RID_SI10,
            RDATA_SI => RDATA_SI10,
            RRESP_SI => RRESP_SI10,
            RLAST_SI => RLAST_SI10,
            RVALID_SI => RVALID_SI10,
            RREADY_IS => RREADY_IS10,
            AWID_S => AWID_S10_xhdl295,
            AWADDR_S => AWADDR_S10_xhdl296,
            AWLEN_S => AWLEN_S10_xhdl297,
            AWSIZE_S => AWSIZE_S10_xhdl298,
            AWBURST_S => AWBURST_S10_xhdl299,
            AWLOCK_S => AWLOCK_S10_xhdl300,
            AWCACHE_S => AWCACHE_S10_xhdl301,
            AWPROT_S => AWPROT_S10_xhdl302,
            AWVALID_S => AWVALID_S10_xhdl303,
            AWREADY_S => AWREADY_S10,
            WID_S => WID_S10_xhdl304,
            WDATA_S => WDATA_S10_xhdl305,
            WSTRB_S => WSTRB_S10_xhdl306,
            WLAST_S => WLAST_S10_xhdl307,
            WVALID_S => WVALID_S10_xhdl308,
            WREADY_S => WREADY_S10,
            BID_S => BID_S10,
            BRESP_S => BRESP_S10,
            BVALID_S => BVALID_S10,
            BREADY_S => BREADY_S10_xhdl309,
            ARID_S => ARID_S10_xhdl310,
            ARADDR_S => ARADDR_S10_xhdl311,
            ARLEN_S => ARLEN_S10_xhdl312,
            ARSIZE_S => ARSIZE_S10_xhdl313,
            ARBURST_S => ARBURST_S10_xhdl314,
            ARLOCK_S => ARLOCK_S10_xhdl315,
            ARCACHE_S => ARCACHE_S10_xhdl316,
            ARPROT_S => ARPROT_S10_xhdl317,
            ARVALID_S => ARVALID_S10_xhdl318,
            ARREADY_S => ARREADY_S10,
            RID_S => RID_S10,
            RDATA_S => RDATA_S10,
            RRESP_S => RRESP_S10,
            RLAST_S => RLAST_S10,
            RVALID_S => RVALID_S10,
            RREADY_S => RREADY_S10_xhdl319);   
   END GENERATE L17;
   
   L18 : IF ((((M0_SLAVE11ENABLE = 1 OR M1_SLAVE11ENABLE = 1 OR M2_SLAVE11ENABLE = 1 
   OR M3_SLAVE11ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE11ENABLE = 1 OR 
   M1_SLAVE11ENABLE = 1 OR M2_SLAVE11ENABLE = 1 OR M3_SLAVE11ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 0))) AND FEED_THROUGH /= 1) GENERATE
      slave_stage11 : axi_slave_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_IS => AWID_IS11,
            AWADDR_IS => AWADDR_IS11,
            AWLEN_IS => AWLEN_IS11,
            AWSIZE_IS => AWSIZE_IS11,
            AWBURST_IS => AWBURST_IS11,
            AWLOCK_IS => AWLOCK_IS11,
            AWCACHE_IS => AWCACHE_IS11,
            AWPROT_IS => AWPROT_IS11,
            AWVALID_IS => AWVALID_IS11,
            AWREADY_SI => AWREADY_SI11,
            WID_IS => WID_IS11,
            WDATA_IS => WDATA_IS11,
            WSTRB_IS => WSTRB_IS11,
            WLAST_IS => WLAST_IS11,
            WVALID_IS => WVALID_IS11,
            WREADY_SI => WREADY_SI11,
            BID_SI => BID_SI11,
            BRESP_SI => BRESP_SI11,
            BVALID_SI => BVALID_SI11,
            BREADY_IS => BREADY_IS11,
            ARID_IS => ARID_IS11,
            ARADDR_IS => ARADDR_IS11,
            ARLEN_IS => ARLEN_IS11,
            ARSIZE_IS => ARSIZE_IS11,
            ARBURST_IS => ARBURST_IS11,
            ARLOCK_IS => ARLOCK_IS11,
            ARCACHE_IS => ARCACHE_IS11,
            ARPROT_IS => ARPROT_IS11,
            ARVALID_IS => ARVALID_IS11,
            ARREADY_SI => ARREADY_SI11,
            RID_SI => RID_SI11,
            RDATA_SI => RDATA_SI11,
            RRESP_SI => RRESP_SI11,
            RLAST_SI => RLAST_SI11,
            RVALID_SI => RVALID_SI11,
            RREADY_IS => RREADY_IS11,
            AWID_S => AWID_S11_xhdl320,
            AWADDR_S => AWADDR_S11_xhdl321,
            AWLEN_S => AWLEN_S11_xhdl322,
            AWSIZE_S => AWSIZE_S11_xhdl323,
            AWBURST_S => AWBURST_S11_xhdl324,
            AWLOCK_S => AWLOCK_S11_xhdl325,
            AWCACHE_S => AWCACHE_S11_xhdl326,
            AWPROT_S => AWPROT_S11_xhdl327,
            AWVALID_S => AWVALID_S11_xhdl328,
            AWREADY_S => AWREADY_S11,
            WID_S => WID_S11_xhdl329,
            WDATA_S => WDATA_S11_xhdl330,
            WSTRB_S => WSTRB_S11_xhdl331,
            WLAST_S => WLAST_S11_xhdl332,
            WVALID_S => WVALID_S11_xhdl333,
            WREADY_S => WREADY_S11,
            BID_S => BID_S11,
            BRESP_S => BRESP_S11,
            BVALID_S => BVALID_S11,
            BREADY_S => BREADY_S11_xhdl334,
            ARID_S => ARID_S11_xhdl335,
            ARADDR_S => ARADDR_S11_xhdl336,
            ARLEN_S => ARLEN_S11_xhdl337,
            ARSIZE_S => ARSIZE_S11_xhdl338,
            ARBURST_S => ARBURST_S11_xhdl339,
            ARLOCK_S => ARLOCK_S11_xhdl340,
            ARCACHE_S => ARCACHE_S11_xhdl341,
            ARPROT_S => ARPROT_S11_xhdl342,
            ARVALID_S => ARVALID_S11_xhdl343,
            ARREADY_S => ARREADY_S11,
            RID_S => RID_S11,
            RDATA_S => RDATA_S11,
            RRESP_S => RRESP_S11,
            RLAST_S => RLAST_S11,
            RVALID_S => RVALID_S11,
            RREADY_S => RREADY_S11_xhdl344);   
   END GENERATE L18;
   
   L19: IF ((((M0_SLAVE12ENABLE = 1 OR M1_SLAVE12ENABLE = 1 OR M2_SLAVE12ENABLE = 1 
   OR M3_SLAVE12ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE12ENABLE = 1 OR 
   M1_SLAVE12ENABLE = 1 OR M2_SLAVE12ENABLE = 1 OR M3_SLAVE12ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 0))) AND FEED_THROUGH /= 1) GENERATE
      slave_stage12 : axi_slave_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_IS => AWID_IS12,
            AWADDR_IS => AWADDR_IS12,
            AWLEN_IS => AWLEN_IS12,
            AWSIZE_IS => AWSIZE_IS12,
            AWBURST_IS => AWBURST_IS12,
            AWLOCK_IS => AWLOCK_IS12,
            AWCACHE_IS => AWCACHE_IS12,
            AWPROT_IS => AWPROT_IS12,
            AWVALID_IS => AWVALID_IS12,
            AWREADY_SI => AWREADY_SI12,
            WID_IS => WID_IS12,
            WDATA_IS => WDATA_IS12,
            WSTRB_IS => WSTRB_IS12,
            WLAST_IS => WLAST_IS12,
            WVALID_IS => WVALID_IS12,
            WREADY_SI => WREADY_SI12,
            BID_SI => BID_SI12,
            BRESP_SI => BRESP_SI12,
            BVALID_SI => BVALID_SI12,
            BREADY_IS => BREADY_IS12,
            ARID_IS => ARID_IS12,
            ARADDR_IS => ARADDR_IS12,
            ARLEN_IS => ARLEN_IS12,
            ARSIZE_IS => ARSIZE_IS12,
            ARBURST_IS => ARBURST_IS12,
            ARLOCK_IS => ARLOCK_IS12,
            ARCACHE_IS => ARCACHE_IS12,
            ARPROT_IS => ARPROT_IS12,
            ARVALID_IS => ARVALID_IS12,
            ARREADY_SI => ARREADY_SI12,
            RID_SI => RID_SI12,
            RDATA_SI => RDATA_SI12,
            RRESP_SI => RRESP_SI12,
            RLAST_SI => RLAST_SI12,
            RVALID_SI => RVALID_SI12,
            RREADY_IS => RREADY_IS12,
            AWID_S => AWID_S12_xhdl345,
            AWADDR_S => AWADDR_S12_xhdl346,
            AWLEN_S => AWLEN_S12_xhdl347,
            AWSIZE_S => AWSIZE_S12_xhdl348,
            AWBURST_S => AWBURST_S12_xhdl349,
            AWLOCK_S => AWLOCK_S12_xhdl350,
            AWCACHE_S => AWCACHE_S12_xhdl351,
            AWPROT_S => AWPROT_S12_xhdl352,
            AWVALID_S => AWVALID_S12_xhdl353,
            AWREADY_S => AWREADY_S12,
            WID_S => WID_S12_xhdl354,
            WDATA_S => WDATA_S12_xhdl355,
            WSTRB_S => WSTRB_S12_xhdl356,
            WLAST_S => WLAST_S12_xhdl357,
            WVALID_S => WVALID_S12_xhdl358,
            WREADY_S => WREADY_S12,
            BID_S => BID_S12,
            BRESP_S => BRESP_S12,
            BVALID_S => BVALID_S12,
            BREADY_S => BREADY_S12_xhdl359,
            ARID_S => ARID_S12_xhdl360,
            ARADDR_S => ARADDR_S12_xhdl361,
            ARLEN_S => ARLEN_S12_xhdl362,
            ARSIZE_S => ARSIZE_S12_xhdl363,
            ARBURST_S => ARBURST_S12_xhdl364,
            ARLOCK_S => ARLOCK_S12_xhdl365,
            ARCACHE_S => ARCACHE_S12_xhdl366,
            ARPROT_S => ARPROT_S12_xhdl367,
            ARVALID_S => ARVALID_S12_xhdl368,
            ARREADY_S => ARREADY_S12,
            RID_S => RID_S12,
            RDATA_S => RDATA_S12,
            RRESP_S => RRESP_S12,
            RLAST_S => RLAST_S12,
            RVALID_S => RVALID_S12,
            RREADY_S => RREADY_S12_xhdl369);   
   END GENERATE L19;
   
   L20: IF ((((M0_SLAVE13ENABLE = 1 OR M1_SLAVE13ENABLE = 1 OR M2_SLAVE13ENABLE = 1 
   OR M3_SLAVE13ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE13ENABLE = 1 OR 
   M1_SLAVE13ENABLE = 1 OR M2_SLAVE13ENABLE = 1 OR M3_SLAVE13ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 0))) AND FEED_THROUGH /= 1) GENERATE
      slave_stage13 : axi_slave_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_IS => AWID_IS13,
            AWADDR_IS => AWADDR_IS13,
            AWLEN_IS => AWLEN_IS13,
            AWSIZE_IS => AWSIZE_IS13,
            AWBURST_IS => AWBURST_IS13,
            AWLOCK_IS => AWLOCK_IS13,
            AWCACHE_IS => AWCACHE_IS13,
            AWPROT_IS => AWPROT_IS13,
            AWVALID_IS => AWVALID_IS13,
            AWREADY_SI => AWREADY_SI13,
            WID_IS => WID_IS13,
            WDATA_IS => WDATA_IS13,
            WSTRB_IS => WSTRB_IS13,
            WLAST_IS => WLAST_IS13,
            WVALID_IS => WVALID_IS13,
            WREADY_SI => WREADY_SI13,
            BID_SI => BID_SI13,
            BRESP_SI => BRESP_SI13,
            BVALID_SI => BVALID_SI13,
            BREADY_IS => BREADY_IS13,
            ARID_IS => ARID_IS13,
            ARADDR_IS => ARADDR_IS13,
            ARLEN_IS => ARLEN_IS13,
            ARSIZE_IS => ARSIZE_IS13,
            ARBURST_IS => ARBURST_IS13,
            ARLOCK_IS => ARLOCK_IS13,
            ARCACHE_IS => ARCACHE_IS13,
            ARPROT_IS => ARPROT_IS13,
            ARVALID_IS => ARVALID_IS13,
            ARREADY_SI => ARREADY_SI13,
            RID_SI => RID_SI13,
            RDATA_SI => RDATA_SI13,
            RRESP_SI => RRESP_SI13,
            RLAST_SI => RLAST_SI13,
            RVALID_SI => RVALID_SI13,
            RREADY_IS => RREADY_IS13,
            AWID_S => AWID_S13_xhdl370,
            AWADDR_S => AWADDR_S13_xhdl371,
            AWLEN_S => AWLEN_S13_xhdl372,
            AWSIZE_S => AWSIZE_S13_xhdl373,
            AWBURST_S => AWBURST_S13_xhdl374,
            AWLOCK_S => AWLOCK_S13_xhdl375,
            AWCACHE_S => AWCACHE_S13_xhdl376,
            AWPROT_S => AWPROT_S13_xhdl377,
            AWVALID_S => AWVALID_S13_xhdl378,
            AWREADY_S => AWREADY_S13,
            WID_S => WID_S13_xhdl379,
            WDATA_S => WDATA_S13_xhdl380,
            WSTRB_S => WSTRB_S13_xhdl381,
            WLAST_S => WLAST_S13_xhdl382,
            WVALID_S => WVALID_S13_xhdl383,
            WREADY_S => WREADY_S13,
            BID_S => BID_S13,
            BRESP_S => BRESP_S13,
            BVALID_S => BVALID_S13,
            BREADY_S => BREADY_S13_xhdl384,
            ARID_S => ARID_S13_xhdl385,
            ARADDR_S => ARADDR_S13_xhdl386,
            ARLEN_S => ARLEN_S13_xhdl387,
            ARSIZE_S => ARSIZE_S13_xhdl388,
            ARBURST_S => ARBURST_S13_xhdl389,
            ARLOCK_S => ARLOCK_S13_xhdl390,
            ARCACHE_S => ARCACHE_S13_xhdl391,
            ARPROT_S => ARPROT_S13_xhdl392,
            ARVALID_S => ARVALID_S13_xhdl393,
            ARREADY_S => ARREADY_S13,
            RID_S => RID_S13,
            RDATA_S => RDATA_S13,
            RRESP_S => RRESP_S13,
            RLAST_S => RLAST_S13,
            RVALID_S => RVALID_S13,
            RREADY_S => RREADY_S13_xhdl394);   
   END GENERATE L20;
   
   L21: IF ((((M0_SLAVE14ENABLE = 1 OR M1_SLAVE14ENABLE = 1 OR M2_SLAVE14ENABLE = 1 
   OR M3_SLAVE14ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE14ENABLE = 1 OR 
   M1_SLAVE14ENABLE = 1 OR M2_SLAVE14ENABLE = 1 OR M3_SLAVE14ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 0))) AND FEED_THROUGH /= 1) GENERATE
      slave_stage14 : axi_slave_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_IS => AWID_IS14,
            AWADDR_IS => AWADDR_IS14,
            AWLEN_IS => AWLEN_IS14,
            AWSIZE_IS => AWSIZE_IS14,
            AWBURST_IS => AWBURST_IS14,
            AWLOCK_IS => AWLOCK_IS14,
            AWCACHE_IS => AWCACHE_IS14,
            AWPROT_IS => AWPROT_IS14,
            AWVALID_IS => AWVALID_IS14,
            AWREADY_SI => AWREADY_SI14,
            WID_IS => WID_IS14,
            WDATA_IS => WDATA_IS14,
            WSTRB_IS => WSTRB_IS14,
            WLAST_IS => WLAST_IS14,
            WVALID_IS => WVALID_IS14,
            WREADY_SI => WREADY_SI14,
            BID_SI => BID_SI14,
            BRESP_SI => BRESP_SI14,
            BVALID_SI => BVALID_SI14,
            BREADY_IS => BREADY_IS14,
            ARID_IS => ARID_IS14,
            ARADDR_IS => ARADDR_IS14,
            ARLEN_IS => ARLEN_IS14,
            ARSIZE_IS => ARSIZE_IS14,
            ARBURST_IS => ARBURST_IS14,
            ARLOCK_IS => ARLOCK_IS14,
            ARCACHE_IS => ARCACHE_IS14,
            ARPROT_IS => ARPROT_IS14,
            ARVALID_IS => ARVALID_IS14,
            ARREADY_SI => ARREADY_SI14,
            RID_SI => RID_SI14,
            RDATA_SI => RDATA_SI14,
            RRESP_SI => RRESP_SI14,
            RLAST_SI => RLAST_SI14,
            RVALID_SI => RVALID_SI14,
            RREADY_IS => RREADY_IS14,
            AWID_S => AWID_S14_xhdl395,
            AWADDR_S => AWADDR_S14_xhdl396,
            AWLEN_S => AWLEN_S14_xhdl397,
            AWSIZE_S => AWSIZE_S14_xhdl398,
            AWBURST_S => AWBURST_S14_xhdl399,
            AWLOCK_S => AWLOCK_S14_xhdl400,
            AWCACHE_S => AWCACHE_S14_xhdl401,
            AWPROT_S => AWPROT_S14_xhdl402,
            AWVALID_S => AWVALID_S14_xhdl403,
            AWREADY_S => AWREADY_S14,
            WID_S => WID_S14_xhdl404,
            WDATA_S => WDATA_S14_xhdl405,
            WSTRB_S => WSTRB_S14_xhdl406,
            WLAST_S => WLAST_S14_xhdl407,
            WVALID_S => WVALID_S14_xhdl408,
            WREADY_S => WREADY_S14,
            BID_S => BID_S14,
            BRESP_S => BRESP_S14,
            BVALID_S => BVALID_S14,
            BREADY_S => BREADY_S14_xhdl409,
            ARID_S => ARID_S14_xhdl410,
            ARADDR_S => ARADDR_S14_xhdl411,
            ARLEN_S => ARLEN_S14_xhdl412,
            ARSIZE_S => ARSIZE_S14_xhdl413,
            ARBURST_S => ARBURST_S14_xhdl414,
            ARLOCK_S => ARLOCK_S14_xhdl415,
            ARCACHE_S => ARCACHE_S14_xhdl416,
            ARPROT_S => ARPROT_S14_xhdl417,
            ARVALID_S => ARVALID_S14_xhdl418,
            ARREADY_S => ARREADY_S14,
            RID_S => RID_S14,
            RDATA_S => RDATA_S14,
            RRESP_S => RRESP_S14,
            RLAST_S => RLAST_S14,
            RVALID_S => RVALID_S14,
            RREADY_S => RREADY_S14_xhdl419);   
   END GENERATE L21;
   
   L22: IF ((((M0_SLAVE15ENABLE = 1 OR M1_SLAVE15ENABLE = 1 OR M2_SLAVE15ENABLE = 1 
   OR M3_SLAVE15ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE15ENABLE = 1 OR 
   M1_SLAVE15ENABLE = 1 OR M2_SLAVE15ENABLE = 1 OR M3_SLAVE15ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 0))) AND FEED_THROUGH /= 1) GENERATE
      slave_stage15 : axi_slave_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_IS => AWID_IS15,
            AWADDR_IS => AWADDR_IS15,
            AWLEN_IS => AWLEN_IS15,
            AWSIZE_IS => AWSIZE_IS15,
            AWBURST_IS => AWBURST_IS15,
            AWLOCK_IS => AWLOCK_IS15,
            AWCACHE_IS => AWCACHE_IS15,
            AWPROT_IS => AWPROT_IS15,
            AWVALID_IS => AWVALID_IS15,
            AWREADY_SI => AWREADY_SI15,
            WID_IS => WID_IS15,
            WDATA_IS => WDATA_IS15,
            WSTRB_IS => WSTRB_IS15,
            WLAST_IS => WLAST_IS15,
            WVALID_IS => WVALID_IS15,
            WREADY_SI => WREADY_SI15,
            BID_SI => BID_SI15,
            BRESP_SI => BRESP_SI15,
            BVALID_SI => BVALID_SI15,
            BREADY_IS => BREADY_IS15,
            ARID_IS => ARID_IS15,
            ARADDR_IS => ARADDR_IS15,
            ARLEN_IS => ARLEN_IS15,
            ARSIZE_IS => ARSIZE_IS15,
            ARBURST_IS => ARBURST_IS15,
            ARLOCK_IS => ARLOCK_IS15,
            ARCACHE_IS => ARCACHE_IS15,
            ARPROT_IS => ARPROT_IS15,
            ARVALID_IS => ARVALID_IS15,
            ARREADY_SI => ARREADY_SI15,
            RID_SI => RID_SI15,
            RDATA_SI => RDATA_SI15,
            RRESP_SI => RRESP_SI15,
            RLAST_SI => RLAST_SI15,
            RVALID_SI => RVALID_SI15,
            RREADY_IS => RREADY_IS15,
            AWID_S => AWID_S15_xhdl420,
            AWADDR_S => AWADDR_S15_xhdl421,
            AWLEN_S => AWLEN_S15_xhdl422,
            AWSIZE_S => AWSIZE_S15_xhdl423,
            AWBURST_S => AWBURST_S15_xhdl424,
            AWLOCK_S => AWLOCK_S15_xhdl425,
            AWCACHE_S => AWCACHE_S15_xhdl426,
            AWPROT_S => AWPROT_S15_xhdl427,
            AWVALID_S => AWVALID_S15_xhdl428,
            AWREADY_S => AWREADY_S15,
            WID_S => WID_S15_xhdl429,
            WDATA_S => WDATA_S15_xhdl430,
            WSTRB_S => WSTRB_S15_xhdl431,
            WLAST_S => WLAST_S15_xhdl432,
            WVALID_S => WVALID_S15_xhdl433,
            WREADY_S => WREADY_S15,
            BID_S => BID_S15,
            BRESP_S => BRESP_S15,
            BVALID_S => BVALID_S15,
            BREADY_S => BREADY_S15_xhdl434,
            ARID_S => ARID_S15_xhdl435,
            ARADDR_S => ARADDR_S15_xhdl436,
            ARLEN_S => ARLEN_S15_xhdl437,
            ARSIZE_S => ARSIZE_S15_xhdl438,
            ARBURST_S => ARBURST_S15_xhdl439,
            ARLOCK_S => ARLOCK_S15_xhdl440,
            ARCACHE_S => ARCACHE_S15_xhdl441,
            ARPROT_S => ARPROT_S15_xhdl442,
            ARVALID_S => ARVALID_S15_xhdl443,
            ARREADY_S => ARREADY_S15,
            RID_S => RID_S15,
            RDATA_S => RDATA_S15,
            RRESP_S => RRESP_S15,
            RLAST_S => RLAST_S15,
            RVALID_S => RVALID_S15,
            RREADY_S => RREADY_S15_xhdl444);   
   END GENERATE L22;
   
   L23: IF ((((M0_SLAVE16ENABLE = 1 OR M1_SLAVE16ENABLE = 1 OR M2_SLAVE16ENABLE = 1 
   OR M3_SLAVE16ENABLE = 1) AND (MEMSPACE = 0)) OR ((M0_SLAVE16ENABLE = 1 OR 
   M1_SLAVE16ENABLE = 1 OR M2_SLAVE16ENABLE = 1 OR M3_SLAVE16ENABLE = 1) AND 
  MEMSPACE > 0 AND (SC_0 = 1 OR SC_1 = 1 OR SC_2 = 1 OR SC_3 = 1 OR SC_4 = 1 OR SC_5 = 1 OR SC_6 = 1 OR SC_7 = 1 OR SC_8 = 1 OR SC_9 = 1 OR SC_10 = 1 OR SC_11 = 1 OR SC_12 = 1 OR SC_13 = 1  OR SC_14 = 1 OR SC_15 = 1))) AND FEED_THROUGH = 0) GENERATE
      slave_stage16 : axi_slave_stage 
         GENERIC MAP (
            SYNC_RESET => SYNC_RESET,
            M0_SLAVE2ENABLE => M0_SLAVE2ENABLE,
            M1_SLAVE10ENABLE => M1_SLAVE10ENABLE,
            M2_SLAVE3ENABLE => M2_SLAVE3ENABLE,
            M3_SLAVE11ENABLE => M3_SLAVE11ENABLE,
            M1_SLAVE6ENABLE => M1_SLAVE6ENABLE,
            M3_SLAVE7ENABLE => M3_SLAVE7ENABLE,
            M2_SLAVE0ENABLE => M2_SLAVE0ENABLE,
            NUM_SLAVE_SLOT => NUM_SLAVE_SLOT,
            FEED_THROUGH => FEED_THROUGH,
            M0_SLAVE9ENABLE => M0_SLAVE9ENABLE,
            WR_ACCEPTANCE => WR_ACCEPTANCE,
            AXI_AWIDTH => AXI_AWIDTH,
            M1_SLAVE3ENABLE => M1_SLAVE3ENABLE,
            M0_SLAVE15ENABLE => M0_SLAVE15ENABLE,
            M3_SLAVE4ENABLE => M3_SLAVE4ENABLE,
            MEMSPACE => MEMSPACE,
            M2_SLAVE16ENABLE => M2_SLAVE16ENABLE,
            M0_SLAVE6ENABLE => M0_SLAVE6ENABLE,
            M1_SLAVE14ENABLE => M1_SLAVE14ENABLE,
            M2_SLAVE7ENABLE => M2_SLAVE7ENABLE,
            M1_SLAVE0ENABLE => M1_SLAVE0ENABLE,
            M0_SLAVE12ENABLE => M0_SLAVE12ENABLE,
            M3_SLAVE15ENABLE => M3_SLAVE15ENABLE,
            M3_SLAVE1ENABLE => M3_SLAVE1ENABLE,
            INP_REG_BUF => INP_REG_BUF,
            ID_WIDTH => ID_WIDTH,
            SC_10 => SC_10,
            SC_11 => SC_11,
            M2_SLAVE13ENABLE => M2_SLAVE13ENABLE,
            SC_12 => SC_12,
            M0_SLAVE3ENABLE => M0_SLAVE3ENABLE,
            SC_13 => SC_13,
            SC_14 => SC_14,
            M1_SLAVE11ENABLE => M1_SLAVE11ENABLE,
            SC_15 => SC_15,
            M2_SLAVE4ENABLE => M2_SLAVE4ENABLE,
            M3_SLAVE12ENABLE => M3_SLAVE12ENABLE,
            ADDR_HGS_CFG => ADDR_HGS_CFG,
            BASE_ID_WIDTH => BASE_ID_WIDTH,
            M2_SLAVE10ENABLE => M2_SLAVE10ENABLE,
            M1_SLAVE7ENABLE => M1_SLAVE7ENABLE,
            M0_SLAVE0ENABLE => M0_SLAVE0ENABLE,
            M3_SLAVE8ENABLE => M3_SLAVE8ENABLE,
            M2_SLAVE1ENABLE => M2_SLAVE1ENABLE,
            M1_SLAVE4ENABLE => M1_SLAVE4ENABLE,
            M0_SLAVE16ENABLE => M0_SLAVE16ENABLE,
            M3_SLAVE5ENABLE => M3_SLAVE5ENABLE,
            M0_SLAVE7ENABLE => M0_SLAVE7ENABLE,
            M1_SLAVE15ENABLE => M1_SLAVE15ENABLE,
            M2_SLAVE8ENABLE => M2_SLAVE8ENABLE,
            AXI_DWIDTH => AXI_DWIDTH,
            M1_SLAVE1ENABLE => M1_SLAVE1ENABLE,
            M0_SLAVE13ENABLE => M0_SLAVE13ENABLE,
            M3_SLAVE16ENABLE => M3_SLAVE16ENABLE,
            M3_SLAVE2ENABLE => M3_SLAVE2ENABLE,
            NUM_MASTER_SLOT => NUM_MASTER_SLOT,
            SC_0 => SC_0,
            M2_SLAVE14ENABLE => M2_SLAVE14ENABLE,
            SC_1 => SC_1,
            SC_2 => SC_2,
            M0_SLAVE4ENABLE => M0_SLAVE4ENABLE,
            SC_3 => SC_3,
            SC_4 => SC_4,
            M1_SLAVE12ENABLE => M1_SLAVE12ENABLE,
            M2_SLAVE5ENABLE => M2_SLAVE5ENABLE,
            SC_5 => SC_5,
            SC_6 => SC_6,
            M0_SLAVE10ENABLE => M0_SLAVE10ENABLE,
            SC_7 => SC_7,
            SC_8 => SC_8,
            M3_SLAVE13ENABLE => M3_SLAVE13ENABLE,
            SC_9 => SC_9,
            M2_SLAVE11ENABLE => M2_SLAVE11ENABLE,
            M1_SLAVE8ENABLE => M1_SLAVE8ENABLE,
            M0_SLAVE1ENABLE => M0_SLAVE1ENABLE,
            M3_SLAVE9ENABLE => M3_SLAVE9ENABLE,
            M2_SLAVE2ENABLE => M2_SLAVE2ENABLE,
            M3_SLAVE10ENABLE => M3_SLAVE10ENABLE,
            M1_SLAVE5ENABLE => M1_SLAVE5ENABLE,
            M3_SLAVE6ENABLE => M3_SLAVE6ENABLE,
            RD_ACCEPTANCE => RD_ACCEPTANCE,
            HGS_CFG => HGS_CFG,
            M0_SLAVE8ENABLE => M0_SLAVE8ENABLE,
            M1_SLAVE16ENABLE => M1_SLAVE16ENABLE,
            M2_SLAVE9ENABLE => M2_SLAVE9ENABLE,
            M1_SLAVE2ENABLE => M1_SLAVE2ENABLE,
            OUT_REG_BUF => OUT_REG_BUF,
            M0_SLAVE14ENABLE => M0_SLAVE14ENABLE,
            M3_SLAVE3ENABLE => M3_SLAVE3ENABLE,
            M2_SLAVE15ENABLE => M2_SLAVE15ENABLE,
            M0_SLAVE5ENABLE => M0_SLAVE5ENABLE,
            M1_SLAVE13ENABLE => M1_SLAVE13ENABLE,
            M2_SLAVE6ENABLE => M2_SLAVE6ENABLE,
            M0_SLAVE11ENABLE => M0_SLAVE11ENABLE,
            M3_SLAVE14ENABLE => M3_SLAVE14ENABLE,
            M3_SLAVE0ENABLE => M3_SLAVE0ENABLE,
            M2_SLAVE12ENABLE => M2_SLAVE12ENABLE,
            M1_SLAVE9ENABLE => M1_SLAVE9ENABLE)
         PORT MAP (
            ACLK => ACLK,
            ARESETN => ARESETN,
            AWID_IS => AWID_IS16,
            AWADDR_IS => AWADDR_IS16,
            AWLEN_IS => AWLEN_IS16,
            AWSIZE_IS => AWSIZE_IS16,
            AWBURST_IS => AWBURST_IS16,
            AWLOCK_IS => AWLOCK_IS16,
            AWCACHE_IS => AWCACHE_IS16,
            AWPROT_IS => AWPROT_IS16,
            AWVALID_IS => AWVALID_IS16,
            AWREADY_SI => AWREADY_SI16,
            WID_IS => WID_IS16,
            WDATA_IS => WDATA_IS16,
            WSTRB_IS => WSTRB_IS16,
            WLAST_IS => WLAST_IS16,
            WVALID_IS => WVALID_IS16,
            WREADY_SI => WREADY_SI16,
            BID_SI => BID_SI16,
            BRESP_SI => BRESP_SI16,
            BVALID_SI => BVALID_SI16,
            BREADY_IS => BREADY_IS16,
            ARID_IS => ARID_IS16,
            ARADDR_IS => ARADDR_IS16,
            ARLEN_IS => ARLEN_IS16,
            ARSIZE_IS => ARSIZE_IS16,
            ARBURST_IS => ARBURST_IS16,
            ARLOCK_IS => ARLOCK_IS16,
            ARCACHE_IS => ARCACHE_IS16,
            ARPROT_IS => ARPROT_IS16,
            ARVALID_IS => ARVALID_IS16,
            ARREADY_SI => ARREADY_SI16,
            RID_SI => RID_SI16,
            RDATA_SI => RDATA_SI16,
            RRESP_SI => RRESP_SI16,
            RLAST_SI => RLAST_SI16,
            RVALID_SI => RVALID_SI16,
            RREADY_IS => RREADY_IS16,
            AWID_S => AWID_S16_xhdl445,
            AWADDR_S => AWADDR_S16_xhdl446,
            AWLEN_S => AWLEN_S16_xhdl447,
            AWSIZE_S => AWSIZE_S16_xhdl448,
            AWBURST_S => AWBURST_S16_xhdl449,
            AWLOCK_S => AWLOCK_S16_xhdl450,
            AWCACHE_S => AWCACHE_S16_xhdl451,
            AWPROT_S => AWPROT_S16_xhdl452,
            AWVALID_S => AWVALID_S16_xhdl453,
            AWREADY_S => AWREADY_S16,
            WID_S => WID_S16_xhdl454,
            WDATA_S => WDATA_S16_xhdl455,
            WSTRB_S => WSTRB_S16_xhdl456,
            WLAST_S => WLAST_S16_xhdl457,
            WVALID_S => WVALID_S16_xhdl458,
            WREADY_S => WREADY_S16,
            BID_S => BID_S16,
            BRESP_S => BRESP_S16,
            BVALID_S => BVALID_S16,
            BREADY_S => BREADY_S16_xhdl459,
            ARID_S => ARID_S16_xhdl460,
            ARADDR_S => ARADDR_S16_xhdl461,
            ARLEN_S => ARLEN_S16_xhdl462,
            ARSIZE_S => ARSIZE_S16_xhdl463,
            ARBURST_S => ARBURST_S16_xhdl464,
            ARLOCK_S => ARLOCK_S16_xhdl465,
            ARCACHE_S => ARCACHE_S16_xhdl466,
            ARPROT_S => ARPROT_S16_xhdl467,
            ARVALID_S => ARVALID_S16_xhdl468,
            ARREADY_S => ARREADY_S16,
            RID_S => RID_S16,
            RDATA_S => RDATA_S16,
            RRESP_S => RRESP_S16,
            RLAST_S => RLAST_S16,
            RVALID_S => RVALID_S16,
            RREADY_S => RREADY_S16_xhdl469);   
   END GENERATE L23;

END ARCHITECTURE translated;
