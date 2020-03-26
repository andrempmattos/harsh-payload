--**************************************************************************
-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description: interconnect_ntom - Bridge interconnect matrix 
--              This is n-to-m interconnect matrix file
--              Contains:
--                       - Wr Address Channel
--                       - Rd Address Channel
--                       - Wr Data Channel
--                       - Wr Response Channel
--                       - Rd Data Channel
--                       - Arbiter
--                       - Decoder
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


ENTITY axi_interconnect_ntom IS
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
      AWADDR_M0               : IN std_logic_vector(31 DOWNTO 0);   
      AWVALID_M0              : IN std_logic;   
      AWLOCK_M0               : IN std_logic_vector(1 DOWNTO 0);   
      AWADDR_M1               : IN std_logic_vector(31 DOWNTO 0);   
      AWVALID_M1              : IN std_logic;   
      AWLOCK_M1               : IN std_logic_vector(1 DOWNTO 0);   
      AWADDR_M2               : IN std_logic_vector(31 DOWNTO 0);   
      AWVALID_M2              : IN std_logic;   
      AWLOCK_M2               : IN std_logic_vector(1 DOWNTO 0);   
      AWADDR_M3               : IN std_logic_vector(31 DOWNTO 0);   
      AWVALID_M3              : IN std_logic;   
      AWLOCK_M3               : IN std_logic_vector(1 DOWNTO 0);   
      ARADDR_M0               : IN std_logic_vector(31 DOWNTO 0);   
      ARLOCK_M0               : IN std_logic_vector(1 DOWNTO 0);   
      ARVALID_M0              : IN std_logic;   
      ARADDR_M1               : IN std_logic_vector(31 DOWNTO 0);   
      ARLOCK_M1               : IN std_logic_vector(1 DOWNTO 0);   
      ARVALID_M1              : IN std_logic;   
      ARADDR_M2               : IN std_logic_vector(31 DOWNTO 0);   
      ARLOCK_M2               : IN std_logic_vector(1 DOWNTO 0);   
      ARVALID_M2              : IN std_logic;   
      ARADDR_M3               : IN std_logic_vector(31 DOWNTO 0);   
      ARLOCK_M3               : IN std_logic_vector(1 DOWNTO 0);   
      ARVALID_M3              : IN std_logic;   
      -- From Master 0
-- AXI write address channel signals

      AWID_MI0                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_MI0              : IN std_logic_vector(31 DOWNTO 0);   
      AWLEN_MI0               : IN std_logic_vector(3 DOWNTO 0);   
      AWSIZE_MI0              : IN std_logic_vector(2 DOWNTO 0);   
      AWBURST_MI0             : IN std_logic_vector(1 DOWNTO 0);   
      AWLOCK_MI0              : IN std_logic_vector(1 DOWNTO 0);   
      AWCACHE_MI0             : IN std_logic_vector(3 DOWNTO 0);   
      AWPROT_MI0              : IN std_logic_vector(2 DOWNTO 0);   
      AWVALID_MI0             : IN std_logic;   
      AWREADY_IM0             : OUT std_logic;   
      -- AXI write data channel signals

      WID_MI0                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_MI0               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      WSTRB_MI0               : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_MI0               : IN std_logic;   
      WVALID_MI0              : IN std_logic;   
      WREADY_IM0              : OUT std_logic;   
      -- AXI write response channel signals

      BID_IM0                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_IM0               : OUT std_logic_vector(1 DOWNTO 0);   
      BVALID_IM0              : OUT std_logic;   
      BREADY_MI0              : IN std_logic;   
      -- AXI read address channel signals

      ARID_MI0                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_MI0              : IN std_logic_vector(31 DOWNTO 0);   
      ARLEN_MI0               : IN std_logic_vector(3 DOWNTO 0);   
      ARSIZE_MI0              : IN std_logic_vector(2 DOWNTO 0);   
      ARBURST_MI0             : IN std_logic_vector(1 DOWNTO 0);   
      ARLOCK_MI0              : IN std_logic_vector(1 DOWNTO 0);   
      ARCACHE_MI0             : IN std_logic_vector(3 DOWNTO 0);   
      ARPROT_MI0              : IN std_logic_vector(2 DOWNTO 0);   
      ARVALID_MI0             : IN std_logic;   
      ARREADY_IM0             : OUT std_logic;   
      -- AXI read response channel signals

      RID_IM0                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_IM0               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      RRESP_IM0               : OUT std_logic_vector(1 DOWNTO 0);   
      RLAST_IM0               : OUT std_logic;   
      RVALID_IM0              : OUT std_logic;   
      RREADY_MI0              : IN std_logic;   
      -- From Master 1
-- AXI write address channel signals

      AWID_MI1                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_MI1              : IN std_logic_vector(31 DOWNTO 0);   
      AWLEN_MI1               : IN std_logic_vector(3 DOWNTO 0);   
      AWSIZE_MI1              : IN std_logic_vector(2 DOWNTO 0);   
      AWBURST_MI1             : IN std_logic_vector(1 DOWNTO 0);   
      AWLOCK_MI1              : IN std_logic_vector(1 DOWNTO 0);   
      AWCACHE_MI1             : IN std_logic_vector(3 DOWNTO 0);   
      AWPROT_MI1              : IN std_logic_vector(2 DOWNTO 0);   
      AWVALID_MI1             : IN std_logic;   
      AWREADY_IM1             : OUT std_logic;   
      -- AXI write data channel signals

      WID_MI1                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_MI1               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      WSTRB_MI1               : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_MI1               : IN std_logic;   
      WVALID_MI1              : IN std_logic;   
      WREADY_IM1              : OUT std_logic;   
      -- AXI write response channel signals

      BID_IM1                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_IM1               : OUT std_logic_vector(1 DOWNTO 0);   
      BVALID_IM1              : OUT std_logic;   
      BREADY_MI1              : IN std_logic;   
      -- AXI read address channel signals

      ARID_MI1                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_MI1              : IN std_logic_vector(31 DOWNTO 0);   
      ARLEN_MI1               : IN std_logic_vector(3 DOWNTO 0);   
      ARSIZE_MI1              : IN std_logic_vector(2 DOWNTO 0);   
      ARBURST_MI1             : IN std_logic_vector(1 DOWNTO 0);   
      ARLOCK_MI1              : IN std_logic_vector(1 DOWNTO 0);   
      ARCACHE_MI1             : IN std_logic_vector(3 DOWNTO 0);   
      ARPROT_MI1              : IN std_logic_vector(2 DOWNTO 0);   
      ARVALID_MI1             : IN std_logic;   
      ARREADY_IM1             : OUT std_logic;   
      -- AXI read response channel signals

      RID_IM1                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_IM1               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      RRESP_IM1               : OUT std_logic_vector(1 DOWNTO 0);   
      RLAST_IM1               : OUT std_logic;   
      RVALID_IM1              : OUT std_logic;   
      RREADY_MI1              : IN std_logic;   
      -- From Master 2
-- AXI write address channel signals

      AWID_MI2                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_MI2              : IN std_logic_vector(31 DOWNTO 0);   
      AWLEN_MI2               : IN std_logic_vector(3 DOWNTO 0);   
      AWSIZE_MI2              : IN std_logic_vector(2 DOWNTO 0);   
      AWBURST_MI2             : IN std_logic_vector(1 DOWNTO 0);   
      AWLOCK_MI2              : IN std_logic_vector(1 DOWNTO 0);   
      AWCACHE_MI2             : IN std_logic_vector(3 DOWNTO 0);   
      AWPROT_MI2              : IN std_logic_vector(2 DOWNTO 0);   
      AWVALID_MI2             : IN std_logic;   
      AWREADY_IM2             : OUT std_logic;   
      -- AXI write data channel signals

      WID_MI2                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_MI2               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      WSTRB_MI2               : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_MI2               : IN std_logic;   
      WVALID_MI2              : IN std_logic;   
      WREADY_IM2              : OUT std_logic;   
      -- AXI write response channel signals

      BID_IM2                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_IM2               : OUT std_logic_vector(1 DOWNTO 0);   
      BVALID_IM2              : OUT std_logic;   
      BREADY_MI2              : IN std_logic;   
      -- AXI read address channel signals

      ARID_MI2                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_MI2              : IN std_logic_vector(31 DOWNTO 0);   
      ARLEN_MI2               : IN std_logic_vector(3 DOWNTO 0);   
      ARSIZE_MI2              : IN std_logic_vector(2 DOWNTO 0);   
      ARBURST_MI2             : IN std_logic_vector(1 DOWNTO 0);   
      ARLOCK_MI2              : IN std_logic_vector(1 DOWNTO 0);   
      ARCACHE_MI2             : IN std_logic_vector(3 DOWNTO 0);   
      ARPROT_MI2              : IN std_logic_vector(2 DOWNTO 0);   
      ARVALID_MI2             : IN std_logic;   
      ARREADY_IM2             : OUT std_logic;   
      -- AXI read response channel signals

      RID_IM2                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_IM2               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      RRESP_IM2               : OUT std_logic_vector(1 DOWNTO 0);   
      RLAST_IM2               : OUT std_logic;   
      RVALID_IM2              : OUT std_logic;   
      RREADY_MI2              : IN std_logic;   
      -- From Master 3
-- AXI write address channel signals

      AWID_MI3                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_MI3              : IN std_logic_vector(31 DOWNTO 0);   
      AWLEN_MI3               : IN std_logic_vector(3 DOWNTO 0);   
      AWSIZE_MI3              : IN std_logic_vector(2 DOWNTO 0);   
      AWBURST_MI3             : IN std_logic_vector(1 DOWNTO 0);   
      AWLOCK_MI3              : IN std_logic_vector(1 DOWNTO 0);   
      AWCACHE_MI3             : IN std_logic_vector(3 DOWNTO 0);   
      AWPROT_MI3              : IN std_logic_vector(2 DOWNTO 0);   
      AWVALID_MI3             : IN std_logic;   
      AWREADY_IM3             : OUT std_logic;   
      -- AXI write data channel signals

      WID_MI3                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_MI3               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      WSTRB_MI3               : IN std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_MI3               : IN std_logic;   
      WVALID_MI3              : IN std_logic;   
      WREADY_IM3              : OUT std_logic;   
      -- AXI write response channel signals

      BID_IM3                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_IM3               : OUT std_logic_vector(1 DOWNTO 0);   
      BVALID_IM3              : OUT std_logic;   
      BREADY_MI3              : IN std_logic;   
      -- AXI read address channel signals

      ARID_MI3                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_MI3              : IN std_logic_vector(31 DOWNTO 0);   
      ARLEN_MI3               : IN std_logic_vector(3 DOWNTO 0);   
      ARSIZE_MI3              : IN std_logic_vector(2 DOWNTO 0);   
      ARBURST_MI3             : IN std_logic_vector(1 DOWNTO 0);   
      ARLOCK_MI3              : IN std_logic_vector(1 DOWNTO 0);   
      ARCACHE_MI3             : IN std_logic_vector(3 DOWNTO 0);   
      ARPROT_MI3              : IN std_logic_vector(2 DOWNTO 0);   
      ARVALID_MI3             : IN std_logic;   
      ARREADY_IM3             : OUT std_logic;   
      -- AXI read response channel signals

      RID_IM3                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_IM3               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      RRESP_IM3               : OUT std_logic_vector(1 DOWNTO 0);   
      RLAST_IM3               : OUT std_logic;   
      RVALID_IM3              : OUT std_logic;   
      RREADY_MI3              : IN std_logic;   
      -- SLAVE 0
-- AXI SLAVE 0 write address channel signals

      AWID_IS0                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_IS0              : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_IS0               : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS0              : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS0             : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS0              : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS0             : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS0              : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS0             : OUT std_logic;   
      AWREADY_SI0             : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_IS0                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_IS0               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_IS0               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_IS0               : OUT std_logic;   
      WVALID_IS0              : OUT std_logic;   
      WREADY_SI0              : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_SI0                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_SI0               : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_SI0              : IN std_logic;   
      BREADY_IS0              : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_IS0                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_IS0              : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_IS0               : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_IS0              : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_IS0             : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_IS0              : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_IS0             : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_IS0              : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_IS0             : OUT std_logic;   
      ARREADY_SI0             : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_SI0                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_SI0               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_SI0               : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_SI0               : IN std_logic;   
      RVALID_SI0              : IN std_logic;   
      RREADY_IS0              : OUT std_logic;   
      -- SLAVE 1
-- AXI SLAVE 1 write address channel signals

      AWID_IS1                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_IS1              : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_IS1               : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS1              : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS1             : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS1              : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS1             : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS1              : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS1             : OUT std_logic;   
      AWREADY_SI1             : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_IS1                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_IS1               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_IS1               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_IS1               : OUT std_logic;   
      WVALID_IS1              : OUT std_logic;   
      WREADY_SI1              : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_SI1                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_SI1               : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_SI1              : IN std_logic;   
      BREADY_IS1              : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_IS1                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_IS1              : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_IS1               : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_IS1              : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_IS1             : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_IS1              : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_IS1             : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_IS1              : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_IS1             : OUT std_logic;   
      ARREADY_SI1             : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_SI1                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_SI1               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_SI1               : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_SI1               : IN std_logic;   
      RVALID_SI1              : IN std_logic;   
      RREADY_IS1              : OUT std_logic;   
      -- SLAVE 2
-- AXI SLAVE 2 write address channel signals

      AWID_IS2                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_IS2              : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_IS2               : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS2              : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS2             : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS2              : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS2             : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS2              : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS2             : OUT std_logic;   
      AWREADY_SI2             : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_IS2                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_IS2               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_IS2               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_IS2               : OUT std_logic;   
      WVALID_IS2              : OUT std_logic;   
      WREADY_SI2              : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_SI2                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_SI2               : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_SI2              : IN std_logic;   
      BREADY_IS2              : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_IS2                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_IS2              : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_IS2               : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_IS2              : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_IS2             : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_IS2              : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_IS2             : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_IS2              : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_IS2             : OUT std_logic;   
      ARREADY_SI2             : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_SI2                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_SI2               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_SI2               : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_SI2               : IN std_logic;   
      RVALID_SI2              : IN std_logic;   
      RREADY_IS2              : OUT std_logic;   
      -- SLAVE 3
-- AXI SLAVE 3 write address channel signals

      AWID_IS3                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_IS3              : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_IS3               : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS3              : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS3             : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS3              : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS3             : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS3              : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS3             : OUT std_logic;   
      AWREADY_SI3             : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_IS3                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_IS3               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_IS3               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_IS3               : OUT std_logic;   
      WVALID_IS3              : OUT std_logic;   
      WREADY_SI3              : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_SI3                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_SI3               : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_SI3              : IN std_logic;   
      BREADY_IS3              : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_IS3                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_IS3              : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_IS3               : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_IS3              : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_IS3             : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_IS3              : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_IS3             : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_IS3              : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_IS3             : OUT std_logic;   
      ARREADY_SI3             : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_SI3                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_SI3               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_SI3               : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_SI3               : IN std_logic;   
      RVALID_SI3              : IN std_logic;   
      RREADY_IS3              : OUT std_logic;   
      -- SLAVE 4
-- AXI SLAVE 4 write address channel signals

      AWID_IS4                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_IS4              : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_IS4               : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS4              : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS4             : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS4              : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS4             : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS4              : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS4             : OUT std_logic;   
      AWREADY_SI4             : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_IS4                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_IS4               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_IS4               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_IS4               : OUT std_logic;   
      WVALID_IS4              : OUT std_logic;   
      WREADY_SI4              : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_SI4                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_SI4               : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_SI4              : IN std_logic;   
      BREADY_IS4              : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_IS4                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_IS4              : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_IS4               : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_IS4              : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_IS4             : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_IS4              : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_IS4             : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_IS4              : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_IS4             : OUT std_logic;   
      ARREADY_SI4             : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_SI4                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_SI4               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_SI4               : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_SI4               : IN std_logic;   
      RVALID_SI4              : IN std_logic;   
      RREADY_IS4              : OUT std_logic;   
      -- SLAVE 5
-- AXI SLAVE 5 write address channel signals

      AWID_IS5                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_IS5              : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_IS5               : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS5              : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS5             : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS5              : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS5             : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS5              : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS5             : OUT std_logic;   
      AWREADY_SI5             : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_IS5                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_IS5               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_IS5               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_IS5               : OUT std_logic;   
      WVALID_IS5              : OUT std_logic;   
      WREADY_SI5              : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_SI5                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_SI5               : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_SI5              : IN std_logic;   
      BREADY_IS5              : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_IS5                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_IS5              : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_IS5               : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_IS5              : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_IS5             : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_IS5              : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_IS5             : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_IS5              : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_IS5             : OUT std_logic;   
      ARREADY_SI5             : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_SI5                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_SI5               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_SI5               : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_SI5               : IN std_logic;   
      RVALID_SI5              : IN std_logic;   
      RREADY_IS5              : OUT std_logic;   
      -- SLAVE 6
-- AXI SLAVE 6 write address channel signals

      AWID_IS6                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_IS6              : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_IS6               : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS6              : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS6             : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS6              : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS6             : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS6              : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS6             : OUT std_logic;   
      AWREADY_SI6             : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_IS6                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_IS6               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_IS6               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_IS6               : OUT std_logic;   
      WVALID_IS6              : OUT std_logic;   
      WREADY_SI6              : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_SI6                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_SI6               : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_SI6              : IN std_logic;   
      BREADY_IS6              : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_IS6                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_IS6              : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_IS6               : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_IS6              : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_IS6             : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_IS6              : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_IS6             : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_IS6              : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_IS6             : OUT std_logic;   
      ARREADY_SI6             : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_SI6                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_SI6               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_SI6               : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_SI6               : IN std_logic;   
      RVALID_SI6              : IN std_logic;   
      RREADY_IS6              : OUT std_logic;   
      -- SLAVE 7
-- AXI SLAVE 7 write address channel signals

      AWID_IS7                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_IS7              : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_IS7               : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS7              : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS7             : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS7              : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS7             : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS7              : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS7             : OUT std_logic;   
      AWREADY_SI7             : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_IS7                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_IS7               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_IS7               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_IS7               : OUT std_logic;   
      WVALID_IS7              : OUT std_logic;   
      WREADY_SI7              : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_SI7                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_SI7               : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_SI7              : IN std_logic;   
      BREADY_IS7              : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_IS7                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_IS7              : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_IS7               : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_IS7              : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_IS7             : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_IS7              : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_IS7             : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_IS7              : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_IS7             : OUT std_logic;   
      ARREADY_SI7             : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_SI7                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_SI7               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_SI7               : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_SI7               : IN std_logic;   
      RVALID_SI7              : IN std_logic;   
      RREADY_IS7              : OUT std_logic;   
      -- SLAVE 8
-- AXI SLAVE 8 write address channel signals

      AWID_IS8                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_IS8              : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_IS8               : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS8              : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS8             : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS8              : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS8             : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS8              : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS8             : OUT std_logic;   
      AWREADY_SI8             : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_IS8                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_IS8               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_IS8               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_IS8               : OUT std_logic;   
      WVALID_IS8              : OUT std_logic;   
      WREADY_SI8              : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_SI8                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_SI8               : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_SI8              : IN std_logic;   
      BREADY_IS8              : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_IS8                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_IS8              : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_IS8               : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_IS8              : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_IS8             : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_IS8              : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_IS8             : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_IS8              : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_IS8             : OUT std_logic;   
      ARREADY_SI8             : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_SI8                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_SI8               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_SI8               : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_SI8               : IN std_logic;   
      RVALID_SI8              : IN std_logic;   
      RREADY_IS8              : OUT std_logic;   
      -- SLAVE 9
-- AXI SLAVE 9 write address channel signals

      AWID_IS9                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_IS9              : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_IS9               : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS9              : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS9             : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS9              : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS9             : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS9              : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS9             : OUT std_logic;   
      AWREADY_SI9             : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_IS9                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_IS9               : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_IS9               : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_IS9               : OUT std_logic;   
      WVALID_IS9              : OUT std_logic;   
      WREADY_SI9              : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_SI9                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_SI9               : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_SI9              : IN std_logic;   
      BREADY_IS9              : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_IS9                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_IS9              : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_IS9               : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_IS9              : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_IS9             : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_IS9              : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_IS9             : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_IS9              : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_IS9             : OUT std_logic;   
      ARREADY_SI9             : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_SI9                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_SI9               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_SI9               : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_SI9               : IN std_logic;   
      RVALID_SI9              : IN std_logic;   
      RREADY_IS9              : OUT std_logic;   
      -- SLAVE 10
-- AXI SLAVE 10 write address channel signals

      AWID_IS10               : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_IS10             : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_IS10              : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS10             : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS10            : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS10             : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS10            : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS10             : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS10            : OUT std_logic;   
      AWREADY_SI10            : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_IS10                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_IS10              : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_IS10              : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_IS10              : OUT std_logic;   
      WVALID_IS10             : OUT std_logic;   
      WREADY_SI10             : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_SI10                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_SI10              : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_SI10             : IN std_logic;   
      BREADY_IS10             : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_IS10               : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_IS10             : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_IS10              : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_IS10             : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_IS10            : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_IS10             : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_IS10            : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_IS10             : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_IS10            : OUT std_logic;   
      ARREADY_SI10            : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_SI10                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_SI10              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_SI10              : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_SI10              : IN std_logic;   
      RVALID_SI10             : IN std_logic;   
      RREADY_IS10             : OUT std_logic;   
      -- SLAVE 11
-- AXI SLAVE 11 write address channel signals

      AWID_IS11               : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_IS11             : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_IS11              : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS11             : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS11            : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS11             : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS11            : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS11             : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS11            : OUT std_logic;   
      AWREADY_SI11            : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_IS11                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_IS11              : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_IS11              : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_IS11              : OUT std_logic;   
      WVALID_IS11             : OUT std_logic;   
      WREADY_SI11             : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_SI11                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_SI11              : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_SI11             : IN std_logic;   
      BREADY_IS11             : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_IS11               : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_IS11             : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_IS11              : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_IS11             : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_IS11            : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_IS11             : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_IS11            : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_IS11             : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_IS11            : OUT std_logic;   
      ARREADY_SI11            : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_SI11                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_SI11              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_SI11              : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_SI11              : IN std_logic;   
      RVALID_SI11             : IN std_logic;   
      RREADY_IS11             : OUT std_logic;   
      -- SLAVE 12
-- AXI SLAVE 12 write address channel signals

      AWID_IS12               : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_IS12             : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_IS12              : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS12             : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS12            : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS12             : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS12            : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS12             : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS12            : OUT std_logic;   
      AWREADY_SI12            : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_IS12                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_IS12              : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_IS12              : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_IS12              : OUT std_logic;   
      WVALID_IS12             : OUT std_logic;   
      WREADY_SI12             : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_SI12                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_SI12              : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_SI12             : IN std_logic;   
      BREADY_IS12             : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_IS12               : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_IS12             : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_IS12              : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_IS12             : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_IS12            : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_IS12             : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_IS12            : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_IS12             : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_IS12            : OUT std_logic;   
      ARREADY_SI12            : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_SI12                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_SI12              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_SI12              : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_SI12              : IN std_logic;   
      RVALID_SI12             : IN std_logic;   
      RREADY_IS12             : OUT std_logic;   
      -- SLAVE 13
-- AXI SLAVE 13 write address channel signals

      AWID_IS13               : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_IS13             : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_IS13              : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS13             : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS13            : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS13             : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS13            : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS13             : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS13            : OUT std_logic;   
      AWREADY_SI13            : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_IS13                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_IS13              : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_IS13              : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_IS13              : OUT std_logic;   
      WVALID_IS13             : OUT std_logic;   
      WREADY_SI13             : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_SI13                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_SI13              : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_SI13             : IN std_logic;   
      BREADY_IS13             : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_IS13               : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_IS13             : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_IS13              : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_IS13             : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_IS13            : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_IS13             : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_IS13            : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_IS13             : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_IS13            : OUT std_logic;   
      ARREADY_SI13            : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_SI13                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_SI13              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_SI13              : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_SI13              : IN std_logic;   
      RVALID_SI13             : IN std_logic;   
      RREADY_IS13             : OUT std_logic;   
      -- SLAVE 14
-- AXI SLAVE 14 write address channel signals

      AWID_IS14               : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_IS14             : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_IS14              : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS14             : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS14            : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS14             : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS14            : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS14             : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS14            : OUT std_logic;   
      AWREADY_SI14            : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_IS14                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_IS14              : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_IS14              : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_IS14              : OUT std_logic;   
      WVALID_IS14             : OUT std_logic;   
      WREADY_SI14             : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_SI14                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_SI14              : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_SI14             : IN std_logic;   
      BREADY_IS14             : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_IS14               : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_IS14             : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_IS14              : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_IS14             : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_IS14            : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_IS14             : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_IS14            : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_IS14             : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_IS14            : OUT std_logic;   
      ARREADY_SI14            : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_SI14                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_SI14              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_SI14              : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_SI14              : IN std_logic;   
      RVALID_SI14             : IN std_logic;   
      RREADY_IS14             : OUT std_logic;   
      -- SLAVE 15
-- AXI SLAVE 15 write address channel signals

      AWID_IS15               : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_IS15             : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_IS15              : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS15             : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS15            : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS15             : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS15            : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS15             : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS15            : OUT std_logic;   
      AWREADY_SI15            : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_IS15                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_IS15              : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_IS15              : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_IS15              : OUT std_logic;   
      WVALID_IS15             : OUT std_logic;   
      WREADY_SI15             : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_SI15                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_SI15              : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_SI15             : IN std_logic;   
      BREADY_IS15             : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_IS15               : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_IS15             : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_IS15              : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_IS15             : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_IS15            : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_IS15             : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_IS15            : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_IS15             : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_IS15            : OUT std_logic;   
      ARREADY_SI15            : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_SI15                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_SI15              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_SI15              : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_SI15              : IN std_logic;   
      RVALID_SI15             : IN std_logic;   
      RREADY_IS15             : OUT std_logic;   
      -- SLAVE 16
-- AXI SLAVE 16 write address channel signals

      AWID_IS16               : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      AWADDR_IS16             : OUT std_logic_vector(31 DOWNTO 0);  
      AWLEN_IS16              : OUT std_logic_vector(3 DOWNTO 0);   
      AWSIZE_IS16             : OUT std_logic_vector(2 DOWNTO 0);   
      AWBURST_IS16            : OUT std_logic_vector(1 DOWNTO 0);   
      AWLOCK_IS16             : OUT std_logic_vector(1 DOWNTO 0);   
      AWCACHE_IS16            : OUT std_logic_vector(3 DOWNTO 0);   
      AWPROT_IS16             : OUT std_logic_vector(2 DOWNTO 0);   
      AWVALID_IS16            : OUT std_logic;   
      AWREADY_SI16            : IN std_logic;   
      -- AXI SLAVE 0 write data channel signals

      WID_IS16                : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_IS16              : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_IS16              : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_IS16              : OUT std_logic;   
      WVALID_IS16             : OUT std_logic;   
      WREADY_SI16             : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_SI16                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_SI16              : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_SI16             : IN std_logic;   
      BREADY_IS16             : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_IS16               : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      ARADDR_IS16             : OUT std_logic_vector(31 DOWNTO 0);  
      ARLEN_IS16              : OUT std_logic_vector(3 DOWNTO 0);   
      ARSIZE_IS16             : OUT std_logic_vector(2 DOWNTO 0);   
      ARBURST_IS16            : OUT std_logic_vector(1 DOWNTO 0);   
      ARLOCK_IS16             : OUT std_logic_vector(1 DOWNTO 0);   
      ARCACHE_IS16            : OUT std_logic_vector(3 DOWNTO 0);   
      ARPROT_IS16             : OUT std_logic_vector(2 DOWNTO 0);   
      ARVALID_IS16            : OUT std_logic;   
      ARREADY_SI16            : IN std_logic;   
      -- AXI SLAVE 0 read response channel signals

      RID_SI16                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_SI16              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
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
END ENTITY axi_interconnect_ntom;

ARCHITECTURE translated OF axi_interconnect_ntom IS

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

   COMPONENT axi_matrix_m
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
--         SLAVE_SELECT_WADDRCH_M  : IN std_logic_vector(16 DOWNTO 0);   
         -- AXI read response channel signals

         RID_IM                  : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         RDATA_IM                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP_IM                : OUT std_logic_vector(1 DOWNTO 0);   
         RLAST_IM                : OUT std_logic;   
         RVALID_IM               : OUT std_logic;   
         RREADY_MI               : IN std_logic;   
         -- AXI write response channel signals

         BID_IM                  : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         BRESP_IM                : OUT std_logic_vector(1 DOWNTO 0);   
         BVALID_IM               : OUT std_logic;   
         BREADY_MI               : IN std_logic;   
         -- SLAVE 0
-- AXI SLAVE 0 write data channel signals

         RID_SI0                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI0              : IN std_logic;   
         RRESP_SI0               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI0               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI0               : IN std_logic;   
         -- SLAVE 1
-- AXI SLAVE 1 write data channel signals

         RID_SI1                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI1              : IN std_logic;   
         RRESP_SI1               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI1               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI1               : IN std_logic;   
         -- SLAVE 2
-- AXI SLAVE 2 write data channel signals

         RID_SI2                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI2              : IN std_logic;   
         RRESP_SI2               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI2               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI2               : IN std_logic;   
         -- SLAVE 3
-- AXI SLAVE 3 write data channel signals

         RID_SI3                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI3              : IN std_logic;   
         RRESP_SI3               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI3               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI3               : IN std_logic;   
         -- SLAVE 4
-- AXI SLAVE 4 write data channel signals

         RID_SI4                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI4              : IN std_logic;   
         RRESP_SI4               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI4               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI4               : IN std_logic;   
         -- SLAVE 5
-- AXI SLAVE 5 write data channel signals

         RID_SI5                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI5              : IN std_logic;   
         RRESP_SI5               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI5               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI5               : IN std_logic;   
         -- SLAVE 6
-- AXI SLAVE 6 write data channel signals

         RID_SI6                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI6              : IN std_logic;   
         RRESP_SI6               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI6               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI6               : IN std_logic;   
         -- SLAVE 7
-- AXI SLAVE 7 write data channel signals

         RID_SI7                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI7              : IN std_logic;   
         RRESP_SI7               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI7               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI7               : IN std_logic;   
         -- SLAVE 8
-- AXI SLAVE 8 write data channel signals

         RID_SI8                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI8              : IN std_logic;   
         RRESP_SI8               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI8               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI8               : IN std_logic;   
         -- SLAVE 9
-- AXI SLAVE 9 write data channel signals

         RID_SI9                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI9              : IN std_logic;   
         RRESP_SI9               : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI9               : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI9               : IN std_logic;   
         -- SLAVE 10
-- AXI SLAVE 10 write data channel signals

         RID_SI10                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI10             : IN std_logic;   
         RRESP_SI10              : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI10              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI10              : IN std_logic;   
         -- SLAVE 11
-- AXI SLAVE 11 write data channel signals

         RID_SI11                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI11             : IN std_logic;   
         RRESP_SI11              : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI11              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI11              : IN std_logic;   
         -- SLAVE 12
-- AXI SLAVE 12 write data channel signals

         RID_SI12                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI12             : IN std_logic;   
         RRESP_SI12              : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI12              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI12              : IN std_logic;   
         -- SLAVE 13
-- AXI SLAVE 13 write data channel signals

         RID_SI13                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI13             : IN std_logic;   
         RRESP_SI13              : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI13              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI13              : IN std_logic;   
         -- SLAVE 14
-- AXI SLAVE 14 write data channel signals

         RID_SI14                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI14             : IN std_logic;   
         RRESP_SI14              : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI14              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI14              : IN std_logic;   
         -- SLAVE 15
-- AXI SLAVE 15 write data channel signals

         RID_SI15                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI15             : IN std_logic;   
         RRESP_SI15              : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI15              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI15              : IN std_logic;   
         -- SLAVE 16
-- AXI SLAVE 16 write data channel signals

         RID_SI16                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         RVALID_SI16             : IN std_logic;   
         RRESP_SI16              : IN std_logic_vector(1 DOWNTO 0);   
         RDATA_SI16              : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RLAST_SI16              : IN std_logic;   
         -- SLAVE 0
-- AXI SLAVE 0 write data channel signals

         BID_SI0                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI0              : IN std_logic;   
         BRESP_SI0               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 1
-- AXI SLAVE 1 write data channel signals

         BID_SI1                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI1              : IN std_logic;   
         BRESP_SI1               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 2
-- AXI SLAVE 2 write data channel signals

         BID_SI2                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI2              : IN std_logic;   
         BRESP_SI2               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 3
-- AXI SLAVE 3 write data channel signals

         BID_SI3                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI3              : IN std_logic;   
         BRESP_SI3               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 4
-- AXI SLAVE 4 write data channel signals

         BID_SI4                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI4              : IN std_logic;   
         BRESP_SI4               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 5
-- AXI SLAVE 5 write data channel signals

         BID_SI5                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI5              : IN std_logic;   
         BRESP_SI5               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 6
-- AXI SLAVE 6 write data channel signals

         BID_SI6                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI6              : IN std_logic;   
         BRESP_SI6               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 7
-- AXI SLAVE 7 write data channel signals

         BID_SI7                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI7              : IN std_logic;   
         BRESP_SI7               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 8
-- AXI SLAVE 8 write data channel signals

         BID_SI8                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI8              : IN std_logic;   
         BRESP_SI8               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 9
-- AXI SLAVE 9 write data channel signals

         BID_SI9                 : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI9              : IN std_logic;   
         BRESP_SI9               : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 10
-- AXI SLAVE 10 write data channel signals

         BID_SI10                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI10             : IN std_logic;   
         BRESP_SI10              : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 11
-- AXI SLAVE 11 write data channel signals

         BID_SI11                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI11             : IN std_logic;   
         BRESP_SI11              : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 12
-- AXI SLAVE 12 write data channel signals

         BID_SI12                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI12             : IN std_logic;   
         BRESP_SI12              : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 13
-- AXI SLAVE 13 write data channel signals

         BID_SI13                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI13             : IN std_logic;   
         BRESP_SI13              : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 14
-- AXI SLAVE 14 write data channel signals

         BID_SI14                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI14             : IN std_logic;   
         BRESP_SI14              : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 15
-- AXI SLAVE 15 write data channel signals

         BID_SI15                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI15             : IN std_logic;   
         BRESP_SI15              : IN std_logic_vector(1 DOWNTO 0);   
         -- SLAVE 16
-- AXI SLAVE 16 write data channel signals

         BID_SI16                : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
         - 1 DOWNTO 0);   
         BVALID_SI16             : IN std_logic;   
         BRESP_SI16              : IN std_logic_vector(1 DOWNTO 0);   
         RREADY_IS0              : OUT std_logic;   
         RREADY_IS1              : OUT std_logic;   
         RREADY_IS2              : OUT std_logic;   
         RREADY_IS3              : OUT std_logic;   
         RREADY_IS4              : OUT std_logic;   
         RREADY_IS5              : OUT std_logic;   
         RREADY_IS6              : OUT std_logic;   
         RREADY_IS7              : OUT std_logic;   
         RREADY_IS8              : OUT std_logic;   
         RREADY_IS9              : OUT std_logic;   
         RREADY_IS10             : OUT std_logic;   
         RREADY_IS11             : OUT std_logic;   
         RREADY_IS12             : OUT std_logic;   
         RREADY_IS13             : OUT std_logic;   
         RREADY_IS14             : OUT std_logic;   
         RREADY_IS15             : OUT std_logic;   
         RREADY_IS16             : OUT std_logic;   
         BREADY_IS0              : OUT std_logic;   
         BREADY_IS1              : OUT std_logic;   
         BREADY_IS2              : OUT std_logic;   
         BREADY_IS3              : OUT std_logic;   
         BREADY_IS4              : OUT std_logic;   
         BREADY_IS5              : OUT std_logic;   
         BREADY_IS6              : OUT std_logic;   
         BREADY_IS7              : OUT std_logic;   
         BREADY_IS8              : OUT std_logic;   
         BREADY_IS9              : OUT std_logic;   
         BREADY_IS10             : OUT std_logic;   
         BREADY_IS11             : OUT std_logic;   
         BREADY_IS12             : OUT std_logic;   
         BREADY_IS13             : OUT std_logic;   
         BREADY_IS14             : OUT std_logic;   
         BREADY_IS15             : OUT std_logic;   
         BREADY_IS16             : OUT std_logic);
   END COMPONENT;

   COMPONENT axi_matrix_s
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
         SLAVE_NUMBER            : IN std_logic_vector(4 DOWNTO 0);   
         -- For Arbiter from Masters
-- To end grant to current master

         m0_rd_end               : IN std_logic;   
         m1_rd_end               : IN std_logic;   
         m2_rd_end               : IN std_logic;   
         m3_rd_end               : IN std_logic;   
         m0_wr_end               : IN std_logic;   
         m1_wr_end               : IN std_logic;   
         m2_wr_end               : IN std_logic;   
         m3_wr_end               : IN std_logic;   
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
         WSTRB_MI0               : IN std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
         0);   
         WLAST_MI0               : IN std_logic;   
         WVALID_MI0              : IN std_logic;   
         WREADY_IM0              : OUT std_logic;   
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
         WSTRB_MI1               : IN std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
         0);   
         WLAST_MI1               : IN std_logic;   
         WVALID_MI1              : IN std_logic;   
         WREADY_IM1              : OUT std_logic;   
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
         WSTRB_MI2               : IN std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
         0);   
         WLAST_MI2               : IN std_logic;   
         WVALID_MI2              : IN std_logic;   
         WREADY_IM2              : OUT std_logic;   
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
         WSTRB_MI3               : IN std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
         0);   
         WLAST_MI3               : IN std_logic;   
         WVALID_MI3              : IN std_logic;   
         WREADY_IM3              : OUT std_logic;   
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
         -- SLAVE 0
-- AXI SLAVE 0 write address channel signals

         AWID_IS                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         AWADDR_IS               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWADDR_IS_int           : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARADDR_IS_int           : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         AWLEN_IS                : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE_IS               : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST_IS              : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK_IS               : OUT std_logic_vector(1 DOWNTO 0);   
         AWCACHE_IS              : OUT std_logic_vector(3 DOWNTO 0);   
         AWPROT_IS               : OUT std_logic_vector(2 DOWNTO 0);   
         AWVALID_IS              : OUT std_logic;   
         AWREADY_SI              : IN std_logic;   
         -- AXI SLAVE 0 write data channel signals

         WID_IS                  : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         WDATA_IS                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB_IS                : OUT std_logic_vector(AXI_STRBWIDTH - 1 
         DOWNTO 0);   
         WLAST_IS                : OUT std_logic;   
         WVALID_IS               : OUT std_logic;   
         WREADY_SI               : IN std_logic;   
         -- AXI SLAVE 0 read address channel signals

         ARID_IS                 : OUT std_logic_vector(BASE_ID_WIDTH + 
         ID_WIDTH - 1 DOWNTO 0);   
         ARADDR_IS               : OUT std_logic_vector(31 DOWNTO 0)
         ;   
         ARLEN_IS                : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE_IS               : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST_IS              : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK_IS               : OUT std_logic_vector(1 DOWNTO 0);   
         ARCACHE_IS              : OUT std_logic_vector(3 DOWNTO 0);   
         ARPROT_IS               : OUT std_logic_vector(2 DOWNTO 0);   
         ARVALID_IS              : OUT std_logic;   
         ARREADY_SI              : IN std_logic;   
         RVALID_SI               : IN std_logic;   
         RLAST_SI                : IN std_logic;   
         RREADY_IS               : IN std_logic;   
         -- To send requests to receive grant from masters 

         gated_waddr             : OUT std_logic_vector(16 DOWNTO 0);   
         gated_raddr             : OUT std_logic_vector(16 DOWNTO 0));
   END COMPONENT;


   -- --------------------------------------------------------------------------
   -- Internal signals
   -- --------------------------------------------------------------------------
   SIGNAL AWVALID_M0_r             :  std_logic;   
   SIGNAL AWADDR_M0_r              :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWVALID_M1_r             :  std_logic;   
   SIGNAL AWADDR_M1_r              :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWVALID_M2_r             :  std_logic;   
   SIGNAL AWADDR_M2_r              :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWVALID_M3_r             :  std_logic;   
   SIGNAL AWADDR_M3_r              :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWREADY_IM               :  std_logic;   
   SIGNAL ARREADY_IM               :  std_logic;   
   SIGNAL WREADY_IM                :  std_logic;   
   SIGNAL WREADY_IM_int            :  std_logic;   
   SIGNAL BID_IM_int               :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BVALID_IM_int            :  std_logic;   
   SIGNAL BRESP_IM_int             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RID_IM_int               :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_IM_int             :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RLAST_IM_int             :  std_logic;   
   SIGNAL RVALID_IM_int            :  std_logic;   
   SIGNAL RRESP_IM_int             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BRESP_IM                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_IM                :  std_logic;   
   SIGNAL BID_IM                   :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RREADY_M0IS0             :  std_logic;   
   SIGNAL RREADY_M0IS1             :  std_logic;   
   SIGNAL RREADY_M0IS2             :  std_logic;   
   SIGNAL RREADY_M0IS3             :  std_logic;   
   SIGNAL RREADY_M0IS4             :  std_logic;   
   SIGNAL RREADY_M0IS5             :  std_logic;   
   SIGNAL RREADY_M0IS6             :  std_logic;   
   SIGNAL RREADY_M0IS7             :  std_logic;   
   SIGNAL RREADY_M0IS8             :  std_logic;   
   SIGNAL RREADY_M0IS9             :  std_logic;   
   SIGNAL RREADY_M0IS10            :  std_logic;   
   SIGNAL RREADY_M0IS11            :  std_logic;   
   SIGNAL RREADY_M0IS12            :  std_logic;   
   SIGNAL RREADY_M0IS13            :  std_logic;   
   SIGNAL RREADY_M0IS14            :  std_logic;   
   SIGNAL RREADY_M0IS15            :  std_logic;   
   SIGNAL RREADY_M0IS16            :  std_logic;   
   SIGNAL RREADY_M1IS0             :  std_logic;   
   SIGNAL RREADY_M1IS1             :  std_logic;   
   SIGNAL RREADY_M1IS2             :  std_logic;   
   SIGNAL RREADY_M1IS3             :  std_logic;   
   SIGNAL RREADY_M1IS4             :  std_logic;   
   SIGNAL RREADY_M1IS5             :  std_logic;   
   SIGNAL RREADY_M1IS6             :  std_logic;   
   SIGNAL RREADY_M1IS7             :  std_logic;   
   SIGNAL RREADY_M1IS8             :  std_logic;   
   SIGNAL RREADY_M1IS9             :  std_logic;   
   SIGNAL RREADY_M1IS10            :  std_logic;   
   SIGNAL RREADY_M1IS11            :  std_logic;   
   SIGNAL RREADY_M1IS12            :  std_logic;   
   SIGNAL RREADY_M1IS13            :  std_logic;   
   SIGNAL RREADY_M1IS14            :  std_logic;   
   SIGNAL RREADY_M1IS15            :  std_logic;   
   SIGNAL RREADY_M1IS16            :  std_logic;   
   SIGNAL RREADY_M2IS0             :  std_logic;   
   SIGNAL RREADY_M2IS1             :  std_logic;   
   SIGNAL RREADY_M2IS2             :  std_logic;   
   SIGNAL RREADY_M2IS3             :  std_logic;   
   SIGNAL RREADY_M2IS4             :  std_logic;   
   SIGNAL RREADY_M2IS5             :  std_logic;   
   SIGNAL RREADY_M2IS6             :  std_logic;   
   SIGNAL RREADY_M2IS7             :  std_logic;   
   SIGNAL RREADY_M2IS8             :  std_logic;   
   SIGNAL RREADY_M2IS9             :  std_logic;   
   SIGNAL RREADY_M2IS10            :  std_logic;   
   SIGNAL RREADY_M2IS11            :  std_logic;   
   SIGNAL RREADY_M2IS12            :  std_logic;   
   SIGNAL RREADY_M2IS13            :  std_logic;   
   SIGNAL RREADY_M2IS14            :  std_logic;   
   SIGNAL RREADY_M2IS15            :  std_logic;   
   SIGNAL RREADY_M2IS16            :  std_logic;   
   SIGNAL RREADY_M3IS0             :  std_logic;   
   SIGNAL RREADY_M3IS1             :  std_logic;   
   SIGNAL RREADY_M3IS2             :  std_logic;   
   SIGNAL RREADY_M3IS3             :  std_logic;   
   SIGNAL RREADY_M3IS4             :  std_logic;   
   SIGNAL RREADY_M3IS5             :  std_logic;   
   SIGNAL RREADY_M3IS6             :  std_logic;   
   SIGNAL RREADY_M3IS7             :  std_logic;   
   SIGNAL RREADY_M3IS8             :  std_logic;   
   SIGNAL RREADY_M3IS9             :  std_logic;   
   SIGNAL RREADY_M3IS10            :  std_logic;   
   SIGNAL RREADY_M3IS11            :  std_logic;   
   SIGNAL RREADY_M3IS12            :  std_logic;   
   SIGNAL RREADY_M3IS13            :  std_logic;   
   SIGNAL RREADY_M3IS14            :  std_logic;   
   SIGNAL RREADY_M3IS15            :  std_logic;   
   SIGNAL RREADY_M3IS16            :  std_logic;   
   SIGNAL BREADY_M0IS0             :  std_logic;   
   SIGNAL BREADY_M0IS1             :  std_logic;   
   SIGNAL BREADY_M0IS2             :  std_logic;   
   SIGNAL BREADY_M0IS3             :  std_logic;   
   SIGNAL BREADY_M0IS4             :  std_logic;   
   SIGNAL BREADY_M0IS5             :  std_logic;   
   SIGNAL BREADY_M0IS6             :  std_logic;   
   SIGNAL BREADY_M0IS7             :  std_logic;   
   SIGNAL BREADY_M0IS8             :  std_logic;   
   SIGNAL BREADY_M0IS9             :  std_logic;   
   SIGNAL BREADY_M0IS10            :  std_logic;   
   SIGNAL BREADY_M0IS11            :  std_logic;   
   SIGNAL BREADY_M0IS12            :  std_logic;   
   SIGNAL BREADY_M0IS13            :  std_logic;   
   SIGNAL BREADY_M0IS14            :  std_logic;   
   SIGNAL BREADY_M0IS15            :  std_logic;   
   SIGNAL BREADY_M0IS16            :  std_logic;   
   SIGNAL BREADY_M1IS0             :  std_logic;   
   SIGNAL BREADY_M1IS1             :  std_logic;   
   SIGNAL BREADY_M1IS2             :  std_logic;   
   SIGNAL BREADY_M1IS3             :  std_logic;   
   SIGNAL BREADY_M1IS4             :  std_logic;   
   SIGNAL BREADY_M1IS5             :  std_logic;   
   SIGNAL BREADY_M1IS6             :  std_logic;   
   SIGNAL BREADY_M1IS7             :  std_logic;   
   SIGNAL BREADY_M1IS8             :  std_logic;   
   SIGNAL BREADY_M1IS9             :  std_logic;   
   SIGNAL BREADY_M1IS10            :  std_logic;   
   SIGNAL BREADY_M1IS11            :  std_logic;   
   SIGNAL BREADY_M1IS12            :  std_logic;   
   SIGNAL BREADY_M1IS13            :  std_logic;   
   SIGNAL BREADY_M1IS14            :  std_logic;   
   SIGNAL BREADY_M1IS15            :  std_logic;   
   SIGNAL BREADY_M1IS16            :  std_logic;   
   SIGNAL BREADY_M2IS0             :  std_logic;   
   SIGNAL BREADY_M2IS1             :  std_logic;   
   SIGNAL BREADY_M2IS2             :  std_logic;   
   SIGNAL BREADY_M2IS3             :  std_logic;   
   SIGNAL BREADY_M2IS4             :  std_logic;   
   SIGNAL BREADY_M2IS5             :  std_logic;   
   SIGNAL BREADY_M2IS6             :  std_logic;   
   SIGNAL BREADY_M2IS7             :  std_logic;   
   SIGNAL BREADY_M2IS8             :  std_logic;   
   SIGNAL BREADY_M2IS9             :  std_logic;   
   SIGNAL BREADY_M2IS10            :  std_logic;   
   SIGNAL BREADY_M2IS11            :  std_logic;   
   SIGNAL BREADY_M2IS12            :  std_logic;   
   SIGNAL BREADY_M2IS13            :  std_logic;   
   SIGNAL BREADY_M2IS14            :  std_logic;   
   SIGNAL BREADY_M2IS15            :  std_logic;   
   SIGNAL BREADY_M2IS16            :  std_logic;   
   SIGNAL BREADY_M3IS0             :  std_logic;   
   SIGNAL BREADY_M3IS1             :  std_logic;   
   SIGNAL BREADY_M3IS2             :  std_logic;   
   SIGNAL BREADY_M3IS3             :  std_logic;   
   SIGNAL BREADY_M3IS4             :  std_logic;   
   SIGNAL BREADY_M3IS5             :  std_logic;   
   SIGNAL BREADY_M3IS6             :  std_logic;   
   SIGNAL BREADY_M3IS7             :  std_logic;   
   SIGNAL BREADY_M3IS8             :  std_logic;   
   SIGNAL BREADY_M3IS9             :  std_logic;   
   SIGNAL BREADY_M3IS10            :  std_logic;   
   SIGNAL BREADY_M3IS11            :  std_logic;   
   SIGNAL BREADY_M3IS12            :  std_logic;   
   SIGNAL BREADY_M3IS13            :  std_logic;   
   SIGNAL BREADY_M3IS14            :  std_logic;   
   SIGNAL BREADY_M3IS15            :  std_logic;   
   SIGNAL BREADY_M3IS16            :  std_logic;   
   SIGNAL AWID_IS0_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS0_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS0_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS0_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS0_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS0_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS0_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS0_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS0_gated        :  std_logic;   
   SIGNAL AWID_IS1_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS1_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS1_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS1_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS1_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS1_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS1_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS1_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS1_gated        :  std_logic;   
   SIGNAL AWID_IS2_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS2_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS2_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS2_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS2_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS2_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS2_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS2_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS2_gated        :  std_logic;   
   SIGNAL AWID_IS3_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS3_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS3_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS3_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS3_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS3_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS3_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS3_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS3_gated        :  std_logic;   
   SIGNAL AWID_IS4_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS4_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS4_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS4_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS4_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS4_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS4_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS4_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS4_gated        :  std_logic;   
   SIGNAL AWID_IS5_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS5_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS5_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS5_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS5_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS5_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS5_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS5_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS5_gated        :  std_logic;   
   SIGNAL AWID_IS6_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS6_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS6_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS6_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS6_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS6_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS6_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS6_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS6_gated        :  std_logic;   
   SIGNAL AWID_IS7_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS7_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS7_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS7_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS7_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS7_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS7_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS7_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS7_gated        :  std_logic;   
   SIGNAL AWID_IS8_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS8_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS8_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS8_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS8_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS8_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS8_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS8_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS8_gated        :  std_logic;   
   SIGNAL AWID_IS9_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS9_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS9_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS9_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS9_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS9_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS9_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS9_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS9_gated        :  std_logic;   
   SIGNAL AWID_IS10_gated          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS10_gated        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS10_gated         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS10_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS10_gated       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS10_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS10_gated       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS10_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS10_gated       :  std_logic;   
   SIGNAL AWID_IS11_gated          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS11_gated        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS11_gated         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS11_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS11_gated       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS11_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS11_gated       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS11_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS11_gated       :  std_logic;   
   SIGNAL AWID_IS12_gated          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS12_gated        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS12_gated         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS12_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS12_gated       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS12_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS12_gated       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS12_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS12_gated       :  std_logic;   
   SIGNAL AWID_IS13_gated          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS13_gated        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS13_gated         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS13_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS13_gated       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS13_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS13_gated       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS13_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS13_gated       :  std_logic;   
   SIGNAL AWID_IS14_gated          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS14_gated        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS14_gated         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS14_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS14_gated       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS14_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS14_gated       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS14_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS14_gated       :  std_logic;   
   SIGNAL AWID_IS15_gated          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS15_gated        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS15_gated         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS15_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS15_gated       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS15_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS15_gated       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS15_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS15_gated       :  std_logic;   
   SIGNAL AWID_IS16_gated          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS16_gated        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS16_gated         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS16_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS16_gated       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS16_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS16_gated       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS16_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS16_gated       :  std_logic;   
   SIGNAL WID_IS0_gated            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WVALID_IS0_gated         :  std_logic;   
   SIGNAL WDATA_IS0_gated          :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS0_gated          :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS0_gated          :  std_logic;   
   SIGNAL WID_IS1_gated            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WVALID_IS1_gated         :  std_logic;   
   SIGNAL WDATA_IS1_gated          :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS1_gated          :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS1_gated          :  std_logic;   
   SIGNAL WID_IS2_gated            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WVALID_IS2_gated         :  std_logic;   
   SIGNAL WDATA_IS2_gated          :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS2_gated          :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS2_gated          :  std_logic;   
   SIGNAL WID_IS3_gated            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WVALID_IS3_gated         :  std_logic;   
   SIGNAL WDATA_IS3_gated          :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS3_gated          :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS3_gated          :  std_logic;   
   SIGNAL WID_IS4_gated            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WVALID_IS4_gated         :  std_logic;   
   SIGNAL WDATA_IS4_gated          :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS4_gated          :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS4_gated          :  std_logic;   
   SIGNAL WID_IS5_gated            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WVALID_IS5_gated         :  std_logic;   
   SIGNAL WDATA_IS5_gated          :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS5_gated          :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS5_gated          :  std_logic;   
   SIGNAL WID_IS6_gated            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WVALID_IS6_gated         :  std_logic;   
   SIGNAL WDATA_IS6_gated          :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS6_gated          :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS6_gated          :  std_logic;   
   SIGNAL WID_IS7_gated            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WVALID_IS7_gated         :  std_logic;   
   SIGNAL WDATA_IS7_gated          :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS7_gated          :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS7_gated          :  std_logic;   
   SIGNAL WID_IS8_gated            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WVALID_IS8_gated         :  std_logic;   
   SIGNAL WDATA_IS8_gated          :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS8_gated          :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS8_gated          :  std_logic;   
   SIGNAL WID_IS9_gated            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WVALID_IS9_gated         :  std_logic;   
   SIGNAL WDATA_IS9_gated          :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS9_gated          :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS9_gated          :  std_logic;   
   SIGNAL WID_IS10_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WVALID_IS10_gated        :  std_logic;   
   SIGNAL WDATA_IS10_gated         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS10_gated         :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS10_gated         :  std_logic;   
   SIGNAL WID_IS11_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WVALID_IS11_gated        :  std_logic;   
   SIGNAL WDATA_IS11_gated         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS11_gated         :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS11_gated         :  std_logic;   
   SIGNAL WID_IS12_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WVALID_IS12_gated        :  std_logic;   
   SIGNAL WDATA_IS12_gated         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS12_gated         :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS12_gated         :  std_logic;   
   SIGNAL WID_IS13_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WVALID_IS13_gated        :  std_logic;   
   SIGNAL WDATA_IS13_gated         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS13_gated         :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS13_gated         :  std_logic;   
   SIGNAL WID_IS14_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WVALID_IS14_gated        :  std_logic;   
   SIGNAL WDATA_IS14_gated         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS14_gated         :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS14_gated         :  std_logic;   
   SIGNAL WID_IS15_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WVALID_IS15_gated        :  std_logic;   
   SIGNAL WDATA_IS15_gated         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS15_gated         :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS15_gated         :  std_logic;   
   SIGNAL WID_IS16_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WVALID_IS16_gated        :  std_logic;   
   SIGNAL WDATA_IS16_gated         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS16_gated         :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS16_gated         :  std_logic;   
   SIGNAL ARID_IS0_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS0_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS0_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS0_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS0_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS0_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS0_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS0_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS0_gated        :  std_logic;   
   SIGNAL ARID_IS1_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS1_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS1_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS1_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS1_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS1_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS1_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS1_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS1_gated        :  std_logic;   
   SIGNAL ARID_IS2_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS2_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS2_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS2_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS2_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS2_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS2_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS2_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS2_gated        :  std_logic;   
   SIGNAL ARID_IS3_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS3_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS3_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS3_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS3_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS3_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS3_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS3_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS3_gated        :  std_logic;   
   SIGNAL ARID_IS4_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS4_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS4_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS4_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS4_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS4_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS4_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS4_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS4_gated        :  std_logic;   
   SIGNAL ARID_IS5_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS5_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS5_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS5_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS5_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS5_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS5_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS5_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS5_gated        :  std_logic;   
   SIGNAL ARID_IS6_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS6_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS6_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS6_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS6_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS6_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS6_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS6_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS6_gated        :  std_logic;   
   SIGNAL ARID_IS7_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS7_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS7_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS7_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS7_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS7_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS7_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS7_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS7_gated        :  std_logic;   
   SIGNAL ARID_IS8_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS8_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS8_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS8_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS8_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS8_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS8_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS8_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS8_gated        :  std_logic;   
   SIGNAL ARID_IS9_gated           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS9_gated         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS9_gated          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS9_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS9_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS9_gated         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS9_gated        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS9_gated         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS9_gated        :  std_logic;   
   SIGNAL ARID_IS10_gated          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS10_gated        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS10_gated         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS10_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS10_gated       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS10_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS10_gated       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS10_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS10_gated       :  std_logic;   
   SIGNAL ARID_IS11_gated          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS11_gated        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS11_gated         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS11_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS11_gated       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS11_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS11_gated       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS11_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS11_gated       :  std_logic;   
   SIGNAL ARID_IS12_gated          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS12_gated        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS12_gated         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS12_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS12_gated       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS12_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS12_gated       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS12_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS12_gated       :  std_logic;   
   SIGNAL ARID_IS13_gated          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS13_gated        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS13_gated         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS13_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS13_gated       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS13_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS13_gated       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS13_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS13_gated       :  std_logic;   
   SIGNAL ARID_IS14_gated          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS14_gated        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS14_gated         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS14_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS14_gated       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS14_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS14_gated       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS14_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS14_gated       :  std_logic;   
   SIGNAL ARID_IS15_gated          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS15_gated        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS15_gated         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS15_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS15_gated       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS15_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS15_gated       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS15_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS15_gated       :  std_logic;   
   SIGNAL ARID_IS16_gated          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS16_gated        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS16_gated         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS16_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS16_gated       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS16_gated        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS16_gated       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS16_gated        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS16_gated       :  std_logic;   
   SIGNAL AWADDR_IS16_gated_r      :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARADDR_IS16_gated_r      :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWVALID_IS16_gated_r     :  std_logic;   
   SIGNAL ARVALID_IS16_gated_r     :  std_logic;   
   SIGNAL WVALID_IS16_gated_r      :  std_logic;   
   -- AXI read response channel signals
   SIGNAL AW_MASGNT_IC             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AR_MASGNT_IC             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL wr_rdcntr                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL wr_wdcntr                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL wd_rdcntr                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL wd_wdcntr                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL rd_rdcntr                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL rd_wdcntr                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL RRESP_IC                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RDATA_IC                 :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL AWREADY_S0IM0            :  std_logic;   
   SIGNAL AWREADY_S0IM1            :  std_logic;   
   SIGNAL AWREADY_S0IM2            :  std_logic;   
   SIGNAL AWREADY_S0IM3            :  std_logic;   
   SIGNAL AWREADY_S1IM0            :  std_logic;   
   SIGNAL AWREADY_S1IM1            :  std_logic;   
   SIGNAL AWREADY_S1IM2            :  std_logic;   
   SIGNAL AWREADY_S1IM3            :  std_logic;   
   SIGNAL AWREADY_S2IM0            :  std_logic;   
   SIGNAL AWREADY_S2IM1            :  std_logic;   
   SIGNAL AWREADY_S2IM2            :  std_logic;   
   SIGNAL AWREADY_S2IM3            :  std_logic;   
   SIGNAL AWREADY_S3IM0            :  std_logic;   
   SIGNAL AWREADY_S3IM1            :  std_logic;   
   SIGNAL AWREADY_S3IM2            :  std_logic;   
   SIGNAL AWREADY_S3IM3            :  std_logic;   
   SIGNAL AWREADY_S4IM0            :  std_logic;   
   SIGNAL AWREADY_S4IM1            :  std_logic;   
   SIGNAL AWREADY_S4IM2            :  std_logic;   
   SIGNAL AWREADY_S4IM3            :  std_logic;   
   SIGNAL AWREADY_S5IM0            :  std_logic;   
   SIGNAL AWREADY_S5IM1            :  std_logic;   
   SIGNAL AWREADY_S5IM2            :  std_logic;   
   SIGNAL AWREADY_S5IM3            :  std_logic;   
   SIGNAL AWREADY_S6IM0            :  std_logic;   
   SIGNAL AWREADY_S6IM1            :  std_logic;   
   SIGNAL AWREADY_S6IM2            :  std_logic;   
   SIGNAL AWREADY_S6IM3            :  std_logic;   
   SIGNAL AWREADY_S7IM0            :  std_logic;   
   SIGNAL AWREADY_S7IM1            :  std_logic;   
   SIGNAL AWREADY_S7IM2            :  std_logic;   
   SIGNAL AWREADY_S7IM3            :  std_logic;   
   SIGNAL AWREADY_S8IM0            :  std_logic;   
   SIGNAL AWREADY_S8IM1            :  std_logic;   
   SIGNAL AWREADY_S8IM2            :  std_logic;   
   SIGNAL AWREADY_S8IM3            :  std_logic;   
   SIGNAL AWREADY_S9IM0            :  std_logic;   
   SIGNAL AWREADY_S9IM1            :  std_logic;   
   SIGNAL AWREADY_S9IM2            :  std_logic;   
   SIGNAL AWREADY_S9IM3            :  std_logic;   
   SIGNAL AWREADY_S10IM0           :  std_logic;   
   SIGNAL AWREADY_S10IM1           :  std_logic;   
   SIGNAL AWREADY_S10IM2           :  std_logic;   
   SIGNAL AWREADY_S10IM3           :  std_logic;   
   SIGNAL AWREADY_S11IM0           :  std_logic;   
   SIGNAL AWREADY_S11IM1           :  std_logic;   
   SIGNAL AWREADY_S11IM2           :  std_logic;   
   SIGNAL AWREADY_S11IM3           :  std_logic;   
   SIGNAL AWREADY_S12IM0           :  std_logic;   
   SIGNAL AWREADY_S12IM1           :  std_logic;   
   SIGNAL AWREADY_S12IM2           :  std_logic;   
   SIGNAL AWREADY_S12IM3           :  std_logic;   
   SIGNAL AWREADY_S13IM0           :  std_logic;   
   SIGNAL AWREADY_S13IM1           :  std_logic;   
   SIGNAL AWREADY_S13IM2           :  std_logic;   
   SIGNAL AWREADY_S13IM3           :  std_logic;   
   SIGNAL AWREADY_S14IM0           :  std_logic;   
   SIGNAL AWREADY_S14IM1           :  std_logic;   
   SIGNAL AWREADY_S14IM2           :  std_logic;   
   SIGNAL AWREADY_S14IM3           :  std_logic;   
   SIGNAL AWREADY_S15IM0           :  std_logic;   
   SIGNAL AWREADY_S15IM1           :  std_logic;   
   SIGNAL AWREADY_S15IM2           :  std_logic;   
   SIGNAL AWREADY_S15IM3           :  std_logic;   
   SIGNAL AWREADY_S16IM0           :  std_logic;   
   SIGNAL AWREADY_S16IM1           :  std_logic;   
   SIGNAL AWREADY_S16IM2           :  std_logic;   
   SIGNAL AWREADY_S16IM3           :  std_logic;   
   SIGNAL ARREADY_S0IM0            :  std_logic;   
   SIGNAL ARREADY_S0IM1            :  std_logic;   
   SIGNAL ARREADY_S0IM2            :  std_logic;   
   SIGNAL ARREADY_S0IM3            :  std_logic;   
   SIGNAL ARREADY_S1IM0            :  std_logic;   
   SIGNAL ARREADY_S1IM1            :  std_logic;   
   SIGNAL ARREADY_S1IM2            :  std_logic;   
   SIGNAL ARREADY_S1IM3            :  std_logic;   
   SIGNAL ARREADY_S2IM0            :  std_logic;   
   SIGNAL ARREADY_S2IM1            :  std_logic;   
   SIGNAL ARREADY_S2IM2            :  std_logic;   
   SIGNAL ARREADY_S2IM3            :  std_logic;   
   SIGNAL ARREADY_S3IM0            :  std_logic;   
   SIGNAL ARREADY_S3IM1            :  std_logic;   
   SIGNAL ARREADY_S3IM2            :  std_logic;   
   SIGNAL ARREADY_S3IM3            :  std_logic;   
   SIGNAL ARREADY_S4IM0            :  std_logic;   
   SIGNAL ARREADY_S4IM1            :  std_logic;   
   SIGNAL ARREADY_S4IM2            :  std_logic;   
   SIGNAL ARREADY_S4IM3            :  std_logic;   
   SIGNAL ARREADY_S5IM0            :  std_logic;   
   SIGNAL ARREADY_S5IM1            :  std_logic;   
   SIGNAL ARREADY_S5IM2            :  std_logic;   
   SIGNAL ARREADY_S5IM3            :  std_logic;   
   SIGNAL ARREADY_S6IM0            :  std_logic;   
   SIGNAL ARREADY_S6IM1            :  std_logic;   
   SIGNAL ARREADY_S6IM2            :  std_logic;   
   SIGNAL ARREADY_S6IM3            :  std_logic;   
   SIGNAL ARREADY_S7IM0            :  std_logic;   
   SIGNAL ARREADY_S7IM1            :  std_logic;   
   SIGNAL ARREADY_S7IM2            :  std_logic;   
   SIGNAL ARREADY_S7IM3            :  std_logic;   
   SIGNAL ARREADY_S8IM0            :  std_logic;   
   SIGNAL ARREADY_S8IM1            :  std_logic;   
   SIGNAL ARREADY_S8IM2            :  std_logic;   
   SIGNAL ARREADY_S8IM3            :  std_logic;   
   SIGNAL ARREADY_S9IM0            :  std_logic;   
   SIGNAL ARREADY_S9IM1            :  std_logic;   
   SIGNAL ARREADY_S9IM2            :  std_logic;   
   SIGNAL ARREADY_S9IM3            :  std_logic;   
   SIGNAL ARREADY_S10IM0           :  std_logic;   
   SIGNAL ARREADY_S10IM1           :  std_logic;   
   SIGNAL ARREADY_S10IM2           :  std_logic;   
   SIGNAL ARREADY_S10IM3           :  std_logic;   
   SIGNAL ARREADY_S11IM0           :  std_logic;   
   SIGNAL ARREADY_S11IM1           :  std_logic;   
   SIGNAL ARREADY_S11IM2           :  std_logic;   
   SIGNAL ARREADY_S11IM3           :  std_logic;   
   SIGNAL ARREADY_S12IM0           :  std_logic;   
   SIGNAL ARREADY_S12IM1           :  std_logic;   
   SIGNAL ARREADY_S12IM2           :  std_logic;   
   SIGNAL ARREADY_S12IM3           :  std_logic;   
   SIGNAL ARREADY_S13IM0           :  std_logic;   
   SIGNAL ARREADY_S13IM1           :  std_logic;   
   SIGNAL ARREADY_S13IM2           :  std_logic;   
   SIGNAL ARREADY_S13IM3           :  std_logic;   
   SIGNAL ARREADY_S14IM0           :  std_logic;   
   SIGNAL ARREADY_S14IM1           :  std_logic;   
   SIGNAL ARREADY_S14IM2           :  std_logic;   
   SIGNAL ARREADY_S14IM3           :  std_logic;   
   SIGNAL ARREADY_S15IM0           :  std_logic;   
   SIGNAL ARREADY_S15IM1           :  std_logic;   
   SIGNAL ARREADY_S15IM2           :  std_logic;   
   SIGNAL ARREADY_S15IM3           :  std_logic;   
   SIGNAL ARREADY_S16IM0           :  std_logic;   
   SIGNAL ARREADY_S16IM1           :  std_logic;   
   SIGNAL ARREADY_S16IM2           :  std_logic;   
   SIGNAL ARREADY_S16IM3           :  std_logic;   
   SIGNAL ARREADY_S0IM0_int        :  std_logic;   
   SIGNAL ARREADY_S0IM1_int        :  std_logic;   
   SIGNAL ARREADY_S0IM2_int        :  std_logic;   
   SIGNAL ARREADY_S0IM3_int        :  std_logic;   
   SIGNAL ARREADY_S1IM0_int        :  std_logic;   
   SIGNAL ARREADY_S1IM1_int        :  std_logic;   
   SIGNAL ARREADY_S1IM2_int        :  std_logic;   
   SIGNAL ARREADY_S1IM3_int        :  std_logic;   
   SIGNAL ARREADY_S2IM0_int        :  std_logic;   
   SIGNAL ARREADY_S2IM1_int        :  std_logic;   
   SIGNAL ARREADY_S2IM2_int        :  std_logic;   
   SIGNAL ARREADY_S2IM3_int        :  std_logic;   
   SIGNAL ARREADY_S3IM0_int        :  std_logic;   
   SIGNAL ARREADY_S3IM1_int        :  std_logic;   
   SIGNAL ARREADY_S3IM2_int        :  std_logic;   
   SIGNAL ARREADY_S3IM3_int        :  std_logic;   
   SIGNAL ARREADY_S4IM0_int        :  std_logic;   
   SIGNAL ARREADY_S4IM1_int        :  std_logic;   
   SIGNAL ARREADY_S4IM2_int        :  std_logic;   
   SIGNAL ARREADY_S4IM3_int        :  std_logic;   
   SIGNAL ARREADY_S5IM0_int        :  std_logic;   
   SIGNAL ARREADY_S5IM1_int        :  std_logic;   
   SIGNAL ARREADY_S5IM2_int        :  std_logic;   
   SIGNAL ARREADY_S5IM3_int        :  std_logic;   
   SIGNAL ARREADY_S6IM0_int        :  std_logic;   
   SIGNAL ARREADY_S6IM1_int        :  std_logic;   
   SIGNAL ARREADY_S6IM2_int        :  std_logic;   
   SIGNAL ARREADY_S6IM3_int        :  std_logic;   
   SIGNAL ARREADY_S7IM0_int        :  std_logic;   
   SIGNAL ARREADY_S7IM1_int        :  std_logic;   
   SIGNAL ARREADY_S7IM2_int        :  std_logic;   
   SIGNAL ARREADY_S7IM3_int        :  std_logic;   
   SIGNAL ARREADY_S8IM0_int        :  std_logic;   
   SIGNAL ARREADY_S8IM1_int        :  std_logic;   
   SIGNAL ARREADY_S8IM2_int        :  std_logic;   
   SIGNAL ARREADY_S8IM3_int        :  std_logic;   
   SIGNAL ARREADY_S9IM0_int        :  std_logic;   
   SIGNAL ARREADY_S9IM1_int        :  std_logic;   
   SIGNAL ARREADY_S9IM2_int        :  std_logic;   
   SIGNAL ARREADY_S9IM3_int        :  std_logic;   
   SIGNAL ARREADY_S10IM0_int       :  std_logic;   
   SIGNAL ARREADY_S10IM1_int       :  std_logic;   
   SIGNAL ARREADY_S10IM2_int       :  std_logic;   
   SIGNAL ARREADY_S10IM3_int       :  std_logic;   
   SIGNAL ARREADY_S11IM0_int       :  std_logic;   
   SIGNAL ARREADY_S11IM1_int       :  std_logic;   
   SIGNAL ARREADY_S11IM2_int       :  std_logic;   
   SIGNAL ARREADY_S11IM3_int       :  std_logic;   
   SIGNAL ARREADY_S12IM0_int       :  std_logic;   
   SIGNAL ARREADY_S12IM1_int       :  std_logic;   
   SIGNAL ARREADY_S12IM2_int       :  std_logic;   
   SIGNAL ARREADY_S12IM3_int       :  std_logic;   
   SIGNAL ARREADY_S13IM0_int       :  std_logic;   
   SIGNAL ARREADY_S13IM1_int       :  std_logic;   
   SIGNAL ARREADY_S13IM2_int       :  std_logic;   
   SIGNAL ARREADY_S13IM3_int       :  std_logic;   
   SIGNAL ARREADY_S14IM0_int       :  std_logic;   
   SIGNAL ARREADY_S14IM1_int       :  std_logic;   
   SIGNAL ARREADY_S14IM2_int       :  std_logic;   
   SIGNAL ARREADY_S14IM3_int       :  std_logic;   
   SIGNAL ARREADY_S15IM0_int       :  std_logic;   
   SIGNAL ARREADY_S15IM1_int       :  std_logic;   
   SIGNAL ARREADY_S15IM2_int       :  std_logic;   
   SIGNAL ARREADY_S15IM3_int       :  std_logic;   
   SIGNAL ARREADY_S16IM0_int       :  std_logic;   
   SIGNAL ARREADY_S16IM1_int       :  std_logic;   
   SIGNAL ARREADY_S16IM2_int       :  std_logic;   
   SIGNAL ARREADY_S16IM3_int       :  std_logic;   
   SIGNAL WREADY_S0IM0             :  std_logic;   
   SIGNAL WREADY_S0IM1             :  std_logic;   
   SIGNAL WREADY_S0IM2             :  std_logic;   
   SIGNAL WREADY_S0IM3             :  std_logic;   
   SIGNAL WREADY_S1IM0             :  std_logic;   
   SIGNAL WREADY_S1IM1             :  std_logic;   
   SIGNAL WREADY_S1IM2             :  std_logic;   
   SIGNAL WREADY_S1IM3             :  std_logic;   
   SIGNAL WREADY_S2IM0             :  std_logic;   
   SIGNAL WREADY_S2IM1             :  std_logic;   
   SIGNAL WREADY_S2IM2             :  std_logic;   
   SIGNAL WREADY_S2IM3             :  std_logic;   
   SIGNAL WREADY_S3IM0             :  std_logic;   
   SIGNAL WREADY_S3IM1             :  std_logic;   
   SIGNAL WREADY_S3IM2             :  std_logic;   
   SIGNAL WREADY_S3IM3             :  std_logic;   
   SIGNAL WREADY_S4IM0             :  std_logic;   
   SIGNAL WREADY_S4IM1             :  std_logic;   
   SIGNAL WREADY_S4IM2             :  std_logic;   
   SIGNAL WREADY_S4IM3             :  std_logic;   
   SIGNAL WREADY_S5IM0             :  std_logic;   
   SIGNAL WREADY_S5IM1             :  std_logic;   
   SIGNAL WREADY_S5IM2             :  std_logic;   
   SIGNAL WREADY_S5IM3             :  std_logic;   
   SIGNAL WREADY_S6IM0             :  std_logic;   
   SIGNAL WREADY_S6IM1             :  std_logic;   
   SIGNAL WREADY_S6IM2             :  std_logic;   
   SIGNAL WREADY_S6IM3             :  std_logic;   
   SIGNAL WREADY_S7IM0             :  std_logic;   
   SIGNAL WREADY_S7IM1             :  std_logic;   
   SIGNAL WREADY_S7IM2             :  std_logic;   
   SIGNAL WREADY_S7IM3             :  std_logic;   
   SIGNAL WREADY_S8IM0             :  std_logic;   
   SIGNAL WREADY_S8IM1             :  std_logic;   
   SIGNAL WREADY_S8IM2             :  std_logic;   
   SIGNAL WREADY_S8IM3             :  std_logic;   
   SIGNAL WREADY_S9IM0             :  std_logic;   
   SIGNAL WREADY_S9IM1             :  std_logic;   
   SIGNAL WREADY_S9IM2             :  std_logic;   
   SIGNAL WREADY_S9IM3             :  std_logic;   
   SIGNAL WREADY_S10IM0            :  std_logic;   
   SIGNAL WREADY_S10IM1            :  std_logic;   
   SIGNAL WREADY_S10IM2            :  std_logic;   
   SIGNAL WREADY_S10IM3            :  std_logic;   
   SIGNAL WREADY_S11IM0            :  std_logic;   
   SIGNAL WREADY_S11IM1            :  std_logic;   
   SIGNAL WREADY_S11IM2            :  std_logic;   
   SIGNAL WREADY_S11IM3            :  std_logic;   
   SIGNAL WREADY_S12IM0            :  std_logic;   
   SIGNAL WREADY_S12IM1            :  std_logic;   
   SIGNAL WREADY_S12IM2            :  std_logic;   
   SIGNAL WREADY_S12IM3            :  std_logic;   
   SIGNAL WREADY_S13IM0            :  std_logic;   
   SIGNAL WREADY_S13IM1            :  std_logic;   
   SIGNAL WREADY_S13IM2            :  std_logic;   
   SIGNAL WREADY_S13IM3            :  std_logic;   
   SIGNAL WREADY_S14IM0            :  std_logic;   
   SIGNAL WREADY_S14IM1            :  std_logic;   
   SIGNAL WREADY_S14IM2            :  std_logic;   
   SIGNAL WREADY_S14IM3            :  std_logic;   
   SIGNAL WREADY_S15IM0            :  std_logic;   
   SIGNAL WREADY_S15IM1            :  std_logic;   
   SIGNAL WREADY_S15IM2            :  std_logic;   
   SIGNAL WREADY_S15IM3            :  std_logic;   
   SIGNAL WREADY_S16IM0            :  std_logic;   
   SIGNAL WREADY_S16IM1            :  std_logic;   
   SIGNAL WREADY_S16IM2            :  std_logic;   
   SIGNAL WREADY_S16IM3            :  std_logic;   
   SIGNAL BID_IM0_int              :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_IM0_int            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_IM0_int           :  std_logic;   
   SIGNAL BID_IM1_int              :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_IM1_int            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_IM1_int           :  std_logic;   
   SIGNAL BID_IM2_int              :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_IM2_int            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_IM2_int           :  std_logic;   
   SIGNAL BID_IM3_int              :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_IM3_int            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_IM3_int           :  std_logic;   
   SIGNAL RID_IM0_int              :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RRESP_IM0_int            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RVALID_IM0_int           :  std_logic;   
   SIGNAL RLAST_IM0_int            :  std_logic;   
   SIGNAL RDATA_IM0_int            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RID_IM1_int              :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RRESP_IM1_int            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RVALID_IM1_int           :  std_logic;   
   SIGNAL RLAST_IM1_int            :  std_logic;   
   SIGNAL RDATA_IM1_int            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RID_IM2_int              :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RRESP_IM2_int            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RVALID_IM2_int           :  std_logic;   
   SIGNAL RLAST_IM2_int            :  std_logic;   
   SIGNAL RDATA_IM2_int            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RID_IM3_int              :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RRESP_IM3_int            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RVALID_IM3_int           :  std_logic;   
   SIGNAL RLAST_IM3_int            :  std_logic;   
   SIGNAL RDATA_IM3_int            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL BREADY_M0IS0_gated       :  std_logic;   
   SIGNAL BREADY_M0IS1_gated       :  std_logic;   
   SIGNAL BREADY_M0IS2_gated       :  std_logic;   
   SIGNAL BREADY_M0IS3_gated       :  std_logic;   
   SIGNAL BREADY_M0IS4_gated       :  std_logic;   
   SIGNAL BREADY_M0IS5_gated       :  std_logic;   
   SIGNAL BREADY_M0IS6_gated       :  std_logic;   
   SIGNAL BREADY_M0IS7_gated       :  std_logic;   
   SIGNAL BREADY_M0IS8_gated       :  std_logic;   
   SIGNAL BREADY_M0IS9_gated       :  std_logic;   
   SIGNAL BREADY_M0IS10_gated      :  std_logic;   
   SIGNAL BREADY_M0IS11_gated      :  std_logic;   
   SIGNAL BREADY_M0IS12_gated      :  std_logic;   
   SIGNAL BREADY_M0IS13_gated      :  std_logic;   
   SIGNAL BREADY_M0IS14_gated      :  std_logic;   
   SIGNAL BREADY_M0IS15_gated      :  std_logic;   
   SIGNAL BREADY_M0IS16_gated      :  std_logic;   
   SIGNAL BREADY_M1IS0_gated       :  std_logic;   
   SIGNAL BREADY_M1IS1_gated       :  std_logic;   
   SIGNAL BREADY_M1IS2_gated       :  std_logic;   
   SIGNAL BREADY_M1IS3_gated       :  std_logic;   
   SIGNAL BREADY_M1IS4_gated       :  std_logic;   
   SIGNAL BREADY_M1IS5_gated       :  std_logic;   
   SIGNAL BREADY_M1IS6_gated       :  std_logic;   
   SIGNAL BREADY_M1IS7_gated       :  std_logic;   
   SIGNAL BREADY_M1IS8_gated       :  std_logic;   
   SIGNAL BREADY_M1IS9_gated       :  std_logic;   
   SIGNAL BREADY_M1IS10_gated      :  std_logic;   
   SIGNAL BREADY_M1IS11_gated      :  std_logic;   
   SIGNAL BREADY_M1IS12_gated      :  std_logic;   
   SIGNAL BREADY_M1IS13_gated      :  std_logic;   
   SIGNAL BREADY_M1IS14_gated      :  std_logic;   
   SIGNAL BREADY_M1IS15_gated      :  std_logic;   
   SIGNAL BREADY_M1IS16_gated      :  std_logic;   
   SIGNAL BREADY_M2IS0_gated       :  std_logic;   
   SIGNAL BREADY_M2IS1_gated       :  std_logic;   
   SIGNAL BREADY_M2IS2_gated       :  std_logic;   
   SIGNAL BREADY_M2IS3_gated       :  std_logic;   
   SIGNAL BREADY_M2IS4_gated       :  std_logic;   
   SIGNAL BREADY_M2IS5_gated       :  std_logic;   
   SIGNAL BREADY_M2IS6_gated       :  std_logic;   
   SIGNAL BREADY_M2IS7_gated       :  std_logic;   
   SIGNAL BREADY_M2IS8_gated       :  std_logic;   
   SIGNAL BREADY_M2IS9_gated       :  std_logic;   
   SIGNAL BREADY_M2IS10_gated      :  std_logic;   
   SIGNAL BREADY_M2IS11_gated      :  std_logic;   
   SIGNAL BREADY_M2IS12_gated      :  std_logic;   
   SIGNAL BREADY_M2IS13_gated      :  std_logic;   
   SIGNAL BREADY_M2IS14_gated      :  std_logic;   
   SIGNAL BREADY_M2IS15_gated      :  std_logic;   
   SIGNAL BREADY_M2IS16_gated      :  std_logic;   
   SIGNAL BREADY_M3IS0_gated       :  std_logic;   
   SIGNAL BREADY_M3IS1_gated       :  std_logic;   
   SIGNAL BREADY_M3IS2_gated       :  std_logic;   
   SIGNAL BREADY_M3IS3_gated       :  std_logic;   
   SIGNAL BREADY_M3IS4_gated       :  std_logic;   
   SIGNAL BREADY_M3IS5_gated       :  std_logic;   
   SIGNAL BREADY_M3IS6_gated       :  std_logic;   
   SIGNAL BREADY_M3IS7_gated       :  std_logic;   
   SIGNAL BREADY_M3IS8_gated       :  std_logic;   
   SIGNAL BREADY_M3IS9_gated       :  std_logic;   
   SIGNAL BREADY_M3IS10_gated      :  std_logic;   
   SIGNAL BREADY_M3IS11_gated      :  std_logic;   
   SIGNAL BREADY_M3IS12_gated      :  std_logic;   
   SIGNAL BREADY_M3IS13_gated      :  std_logic;   
   SIGNAL BREADY_M3IS14_gated      :  std_logic;   
   SIGNAL BREADY_M3IS15_gated      :  std_logic;   
   SIGNAL BREADY_M3IS16_gated      :  std_logic;   
   SIGNAL gated_waddr              :  std_logic_vector(16 DOWNTO 0);   
   SIGNAL gated_raddr              :  std_logic_vector(16 DOWNTO 0);   
   SIGNAL AWADDR_IS_int            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARADDR_IS_int            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl470             :  std_logic_vector(ID_WIDTH+1 DOWNTO 0);   
   SIGNAL temp_xhdl471             :  std_logic_vector(ID_WIDTH+1 DOWNTO 0);   
   SIGNAL temp_xhdl472             :  std_logic_vector(ID_WIDTH+1 DOWNTO 0);   
   SIGNAL temp_xhdl473             :  std_logic_vector(ID_WIDTH+1 DOWNTO 0);   
   SIGNAL temp_xhdl474             :  std_logic;   
   SIGNAL temp_xhdl475             :  std_logic;   
   SIGNAL temp_xhdl476             :  std_logic;   
   SIGNAL temp_xhdl477             :  std_logic;   
   SIGNAL temp_xhdl478             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl479             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl480             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl481             :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl1578            :  std_logic;   
   SIGNAL temp_xhdl1579            :  std_logic;   
   SIGNAL temp_xhdl1580            :  std_logic;   
   SIGNAL temp_xhdl1581            :  std_logic;   
   SIGNAL temp_xhdl1582            :  std_logic;   
   SIGNAL temp_xhdl1583            :  std_logic;   
   SIGNAL temp_xhdl1584            :  std_logic;   
   SIGNAL temp_xhdl1585            :  std_logic;   
   SIGNAL temp_xhdl1586            :  std_logic;   
   SIGNAL temp_xhdl1587            :  std_logic;   
   SIGNAL temp_xhdl1588            :  std_logic;   
   SIGNAL temp_xhdl1589            :  std_logic;   
   SIGNAL temp_xhdl1590            :  std_logic;   
   SIGNAL temp_xhdl1591            :  std_logic;   
   SIGNAL temp_xhdl1592            :  std_logic;   
   SIGNAL temp_xhdl1593            :  std_logic;   
   SIGNAL temp_xhdl1594            :  std_logic;   
   SIGNAL temp_xhdl1595            :  std_logic;   
   SIGNAL temp_xhdl1596            :  std_logic;   
   SIGNAL temp_xhdl1597            :  std_logic;   
   SIGNAL temp_xhdl1598            :  std_logic;   
   SIGNAL temp_xhdl1599            :  std_logic;   
   SIGNAL temp_xhdl1600            :  std_logic;   
   SIGNAL temp_xhdl1601            :  std_logic;   
   SIGNAL temp_xhdl1602            :  std_logic;   
   SIGNAL temp_xhdl1603            :  std_logic;   
   SIGNAL temp_xhdl1604            :  std_logic;   
   SIGNAL temp_xhdl1605            :  std_logic;   
   SIGNAL temp_xhdl1606            :  std_logic;   
   SIGNAL temp_xhdl1607            :  std_logic;   
   SIGNAL temp_xhdl1608            :  std_logic;   
   SIGNAL temp_xhdl1609            :  std_logic;   
   SIGNAL temp_xhdl1610            :  std_logic;   
   SIGNAL temp_xhdl1611            :  std_logic;   
   SIGNAL temp_xhdl1612            :  std_logic;   
   SIGNAL temp_xhdl1613            :  std_logic;   
   SIGNAL temp_xhdl1614            :  std_logic;   
   SIGNAL temp_xhdl1615            :  std_logic;   
   SIGNAL temp_xhdl1616            :  std_logic;   
   SIGNAL temp_xhdl1617            :  std_logic;   
   SIGNAL temp_xhdl1618            :  std_logic;   
   SIGNAL temp_xhdl1619            :  std_logic;   
   SIGNAL temp_xhdl1620            :  std_logic;   
   SIGNAL temp_xhdl1621            :  std_logic;   
   SIGNAL temp_xhdl1622            :  std_logic;   
   SIGNAL temp_xhdl1623            :  std_logic;   
   SIGNAL temp_xhdl1624            :  std_logic;   
   SIGNAL temp_xhdl1625            :  std_logic;   
   SIGNAL temp_xhdl1626            :  std_logic;   
   SIGNAL temp_xhdl1627            :  std_logic;   
   SIGNAL temp_xhdl1628            :  std_logic;   
   SIGNAL temp_xhdl1629            :  std_logic;   
   SIGNAL temp_xhdl1630            :  std_logic;   
   SIGNAL temp_xhdl1631            :  std_logic;   
   SIGNAL temp_xhdl1632            :  std_logic;   
   SIGNAL temp_xhdl1633            :  std_logic;   
   SIGNAL temp_xhdl1634            :  std_logic;   
   SIGNAL temp_xhdl1635            :  std_logic;   
   SIGNAL temp_xhdl1636            :  std_logic;   
   SIGNAL temp_xhdl1637            :  std_logic;   
   SIGNAL temp_xhdl1638            :  std_logic;   
   SIGNAL temp_xhdl1639            :  std_logic;   
   SIGNAL temp_xhdl1640            :  std_logic;   
   SIGNAL temp_xhdl1641            :  std_logic;   
   SIGNAL temp_xhdl1642            :  std_logic;   
   SIGNAL temp_xhdl1643            :  std_logic;   
   SIGNAL temp_xhdl1644            :  std_logic;   
   SIGNAL temp_xhdl1645            :  std_logic;   
   SIGNAL temp_xhdl1663            :  std_logic;   
   SIGNAL temp_xhdl1664            :  std_logic;   
   SIGNAL temp_xhdl1665            :  std_logic;   
   SIGNAL temp_xhdl1666            :  std_logic;   
   SIGNAL temp_xhdl1667            :  std_logic;   
   SIGNAL temp_xhdl1668            :  std_logic;   
   SIGNAL temp_xhdl1669            :  std_logic;   
   SIGNAL temp_xhdl1670            :  std_logic;   
   SIGNAL temp_xhdl1671            :  std_logic;   
   SIGNAL temp_xhdl1672            :  std_logic;   
   SIGNAL temp_xhdl1673            :  std_logic;   
   SIGNAL temp_xhdl1674            :  std_logic;   
   SIGNAL temp_xhdl1675            :  std_logic;   
   SIGNAL temp_xhdl1676            :  std_logic;   
   SIGNAL temp_xhdl1677            :  std_logic;   
   SIGNAL temp_xhdl1678            :  std_logic;   
   SIGNAL temp_xhdl1679            :  std_logic;   
   SIGNAL temp_xhdl1680            :  std_logic;   
   SIGNAL temp_xhdl1681            :  std_logic;   
   SIGNAL temp_xhdl1682            :  std_logic;   
   SIGNAL temp_xhdl1683            :  std_logic;   
   SIGNAL temp_xhdl1684            :  std_logic;   
   SIGNAL temp_xhdl1685            :  std_logic;   
   SIGNAL temp_xhdl1686            :  std_logic;   
   SIGNAL temp_xhdl1687            :  std_logic;   
   SIGNAL temp_xhdl1688            :  std_logic;   
   SIGNAL temp_xhdl1689            :  std_logic;   
   SIGNAL temp_xhdl1690            :  std_logic;   
   SIGNAL temp_xhdl1691            :  std_logic;   
   SIGNAL temp_xhdl1692            :  std_logic;   
   SIGNAL temp_xhdl1693            :  std_logic;   
   SIGNAL temp_xhdl1694            :  std_logic;   
   SIGNAL temp_xhdl1695            :  std_logic;   
   SIGNAL temp_xhdl1696            :  std_logic;   
   SIGNAL temp_xhdl1697            :  std_logic;   
   SIGNAL temp_xhdl1698            :  std_logic;   
   SIGNAL temp_xhdl1699            :  std_logic;   
   SIGNAL temp_xhdl1700            :  std_logic;   
   SIGNAL temp_xhdl1701            :  std_logic;   
   SIGNAL temp_xhdl1702            :  std_logic;   
   SIGNAL temp_xhdl1703            :  std_logic;   
   SIGNAL temp_xhdl1704            :  std_logic;   
   SIGNAL temp_xhdl1705            :  std_logic;   
   SIGNAL temp_xhdl1706            :  std_logic;   
   SIGNAL temp_xhdl1707            :  std_logic;   
   SIGNAL temp_xhdl1708            :  std_logic;   
   SIGNAL temp_xhdl1709            :  std_logic;   
   SIGNAL temp_xhdl1710            :  std_logic;   
   SIGNAL temp_xhdl1711            :  std_logic;   
   SIGNAL temp_xhdl1712            :  std_logic;   
   SIGNAL temp_xhdl1713            :  std_logic;   
   SIGNAL temp_xhdl1714            :  std_logic;   
   SIGNAL temp_xhdl1715            :  std_logic;   
   SIGNAL temp_xhdl1716            :  std_logic;   
   SIGNAL temp_xhdl1717            :  std_logic;   
   SIGNAL temp_xhdl1718            :  std_logic;   
   SIGNAL temp_xhdl1719            :  std_logic;   
   SIGNAL temp_xhdl1720            :  std_logic;   
   SIGNAL temp_xhdl1721            :  std_logic;   
   SIGNAL temp_xhdl1722            :  std_logic;   
   SIGNAL temp_xhdl1723            :  std_logic;   
   SIGNAL temp_xhdl1724            :  std_logic;   
   SIGNAL temp_xhdl1725            :  std_logic;   
   SIGNAL temp_xhdl1726            :  std_logic;   
   SIGNAL temp_xhdl1727            :  std_logic;   
   SIGNAL temp_xhdl1728            :  std_logic;   
   SIGNAL temp_xhdl1729            :  std_logic;   
   SIGNAL temp_xhdl1730            :  std_logic;   
   SIGNAL temp_xhdl1748            :  std_logic;   
   SIGNAL temp_xhdl1749            :  std_logic;   
   SIGNAL temp_xhdl1750            :  std_logic;   
   SIGNAL temp_xhdl1751            :  std_logic;   
   SIGNAL temp_xhdl1752            :  std_logic;   
   SIGNAL temp_xhdl1753            :  std_logic;   
   SIGNAL temp_xhdl1754            :  std_logic;   
   SIGNAL temp_xhdl1755            :  std_logic;   
   SIGNAL temp_xhdl1756            :  std_logic;   
   SIGNAL temp_xhdl1757            :  std_logic;   
   SIGNAL temp_xhdl1758            :  std_logic;   
   SIGNAL temp_xhdl1759            :  std_logic;   
   SIGNAL temp_xhdl1760            :  std_logic;   
   SIGNAL temp_xhdl1761            :  std_logic;   
   SIGNAL temp_xhdl1762            :  std_logic;   
   SIGNAL temp_xhdl1763            :  std_logic;   
   SIGNAL temp_xhdl1764            :  std_logic;   
   SIGNAL temp_xhdl1766            :  std_logic;   
   SIGNAL temp_xhdl1767            :  std_logic;   
   SIGNAL temp_xhdl1768            :  std_logic;   
   SIGNAL temp_xhdl1769            :  std_logic;   
   SIGNAL temp_xhdl1770            :  std_logic;   
   SIGNAL temp_xhdl1771            :  std_logic;   
   SIGNAL temp_xhdl1772            :  std_logic;   
   SIGNAL temp_xhdl1773            :  std_logic;   
   SIGNAL temp_xhdl1774            :  std_logic;   
   SIGNAL temp_xhdl1775            :  std_logic;   
   SIGNAL temp_xhdl1776            :  std_logic;   
   SIGNAL temp_xhdl1777            :  std_logic;   
   SIGNAL temp_xhdl1778            :  std_logic;   
   SIGNAL temp_xhdl1779            :  std_logic;   
   SIGNAL temp_xhdl1780            :  std_logic;   
   SIGNAL temp_xhdl1781            :  std_logic;   
   SIGNAL temp_xhdl1782            :  std_logic;   
   SIGNAL temp_xhdl1784            :  std_logic;   
   SIGNAL temp_xhdl1785            :  std_logic;   
   SIGNAL temp_xhdl1786            :  std_logic;   
   SIGNAL temp_xhdl1787            :  std_logic;   
   SIGNAL temp_xhdl1788            :  std_logic;   
   SIGNAL temp_xhdl1789            :  std_logic;   
   SIGNAL temp_xhdl1790            :  std_logic;   
   SIGNAL temp_xhdl1791            :  std_logic;   
   SIGNAL temp_xhdl1792            :  std_logic;   
   SIGNAL temp_xhdl1793            :  std_logic;   
   SIGNAL temp_xhdl1794            :  std_logic;   
   SIGNAL temp_xhdl1795            :  std_logic;   
   SIGNAL temp_xhdl1796            :  std_logic;   
   SIGNAL temp_xhdl1797            :  std_logic;   
   SIGNAL temp_xhdl1798            :  std_logic;   
   SIGNAL temp_xhdl1799            :  std_logic;   
   SIGNAL temp_xhdl1800            :  std_logic;   
   SIGNAL temp_xhdl1802            :  std_logic;   
   SIGNAL temp_xhdl1803            :  std_logic;   
   SIGNAL temp_xhdl1804            :  std_logic;   
   SIGNAL temp_xhdl1805            :  std_logic;   
   SIGNAL temp_xhdl1806            :  std_logic;   
   SIGNAL temp_xhdl1807            :  std_logic;   
   SIGNAL temp_xhdl1808            :  std_logic;   
   SIGNAL temp_xhdl1809            :  std_logic;   
   SIGNAL temp_xhdl1810            :  std_logic;   
   SIGNAL temp_xhdl1811            :  std_logic;   
   SIGNAL temp_xhdl1812            :  std_logic;   
   SIGNAL temp_xhdl1813            :  std_logic;   
   SIGNAL temp_xhdl1814            :  std_logic;   
   SIGNAL temp_xhdl1815            :  std_logic;   
   SIGNAL temp_xhdl1816            :  std_logic;   
   SIGNAL temp_xhdl1817            :  std_logic;   
   SIGNAL temp_xhdl1818            :  std_logic;   
   SIGNAL temp_xhdl1820            :  std_logic;   
   SIGNAL temp_xhdl1821            :  std_logic;   
   SIGNAL temp_xhdl1822            :  std_logic;   
   SIGNAL temp_xhdl1823            :  std_logic;   
   SIGNAL temp_xhdl1824            :  std_logic;   
   SIGNAL temp_xhdl1825            :  std_logic;   
   SIGNAL temp_xhdl1826            :  std_logic;   
   SIGNAL temp_xhdl1827            :  std_logic;   
   SIGNAL temp_xhdl1828            :  std_logic;   
   SIGNAL temp_xhdl1829            :  std_logic;   
   SIGNAL temp_xhdl1830            :  std_logic;   
   SIGNAL temp_xhdl1831            :  std_logic;   
   SIGNAL temp_xhdl1832            :  std_logic;   
   SIGNAL temp_xhdl1833            :  std_logic;   
   SIGNAL temp_xhdl1834            :  std_logic;   
   SIGNAL temp_xhdl1835            :  std_logic;   
   SIGNAL temp_xhdl1836            :  std_logic;   
   SIGNAL temp_xhdl1838            :  std_logic;   
   SIGNAL temp_xhdl1839            :  std_logic;   
   SIGNAL temp_xhdl1840            :  std_logic;   
   SIGNAL temp_xhdl1841            :  std_logic;   
   SIGNAL temp_xhdl1842            :  std_logic;   
   SIGNAL temp_xhdl1843            :  std_logic;   
   SIGNAL temp_xhdl1844            :  std_logic;   
   SIGNAL temp_xhdl1845            :  std_logic;   
   SIGNAL temp_xhdl1846            :  std_logic;   
   SIGNAL temp_xhdl1847            :  std_logic;   
   SIGNAL temp_xhdl1848            :  std_logic;   
   SIGNAL temp_xhdl1849            :  std_logic;   
   SIGNAL temp_xhdl1850            :  std_logic;   
   SIGNAL temp_xhdl1851            :  std_logic;   
   SIGNAL temp_xhdl1852            :  std_logic;   
   SIGNAL temp_xhdl1853            :  std_logic;   
   SIGNAL temp_xhdl1854            :  std_logic;   
   SIGNAL temp_xhdl1856            :  std_logic;   
   SIGNAL temp_xhdl1857            :  std_logic;   
   SIGNAL temp_xhdl1858            :  std_logic;   
   SIGNAL temp_xhdl1859            :  std_logic;   
   SIGNAL temp_xhdl1860            :  std_logic;   
   SIGNAL temp_xhdl1861            :  std_logic;   
   SIGNAL temp_xhdl1862            :  std_logic;   
   SIGNAL temp_xhdl1863            :  std_logic;   
   SIGNAL temp_xhdl1864            :  std_logic;   
   SIGNAL temp_xhdl1865            :  std_logic;   
   SIGNAL temp_xhdl1866            :  std_logic;   
   SIGNAL temp_xhdl1867            :  std_logic;   
   SIGNAL temp_xhdl1868            :  std_logic;   
   SIGNAL temp_xhdl1869            :  std_logic;   
   SIGNAL temp_xhdl1870            :  std_logic;   
   SIGNAL temp_xhdl1871            :  std_logic;   
   SIGNAL temp_xhdl1872            :  std_logic;   
   SIGNAL temp_xhdl1874            :  std_logic;   
   SIGNAL temp_xhdl1875            :  std_logic;   
   SIGNAL temp_xhdl1876            :  std_logic;   
   SIGNAL temp_xhdl1877            :  std_logic;   
   SIGNAL temp_xhdl1878            :  std_logic;   
   SIGNAL temp_xhdl1879            :  std_logic;   
   SIGNAL temp_xhdl1880            :  std_logic;   
   SIGNAL temp_xhdl1881            :  std_logic;   
   SIGNAL temp_xhdl1882            :  std_logic;   
   SIGNAL temp_xhdl1883            :  std_logic;   
   SIGNAL temp_xhdl1884            :  std_logic;   
   SIGNAL temp_xhdl1885            :  std_logic;   
   SIGNAL temp_xhdl1886            :  std_logic;   
   SIGNAL temp_xhdl1887            :  std_logic;   
   SIGNAL temp_xhdl1888            :  std_logic;   
   SIGNAL temp_xhdl1889            :  std_logic;   
   SIGNAL temp_xhdl1890            :  std_logic;   
   SIGNAL temp_xhdl1892            :  std_logic;   
   SIGNAL temp_xhdl1893            :  std_logic;   
   SIGNAL temp_xhdl1894            :  std_logic;   
   SIGNAL temp_xhdl1895            :  std_logic;   
   SIGNAL temp_xhdl1896            :  std_logic;   
   SIGNAL temp_xhdl1897            :  std_logic;   
   SIGNAL temp_xhdl1898            :  std_logic;   
   SIGNAL temp_xhdl1899            :  std_logic;   
   SIGNAL temp_xhdl1900            :  std_logic;   
   SIGNAL temp_xhdl1901            :  std_logic;   
   SIGNAL temp_xhdl1902            :  std_logic;   
   SIGNAL temp_xhdl1903            :  std_logic;   
   SIGNAL temp_xhdl1904            :  std_logic;   
   SIGNAL temp_xhdl1905            :  std_logic;   
   SIGNAL temp_xhdl1906            :  std_logic;   
   SIGNAL temp_xhdl1907            :  std_logic;   
   SIGNAL temp_xhdl1908            :  std_logic;   
   SIGNAL temp_xhdl1910            :  std_logic;   
   SIGNAL temp_xhdl1911            :  std_logic;   
   SIGNAL temp_xhdl1912            :  std_logic;   
   SIGNAL temp_xhdl1913            :  std_logic;   
   SIGNAL temp_xhdl1914            :  std_logic;   
   SIGNAL temp_xhdl1915            :  std_logic;   
   SIGNAL temp_xhdl1916            :  std_logic;   
   SIGNAL temp_xhdl1917            :  std_logic;   
   SIGNAL temp_xhdl1918            :  std_logic;   
   SIGNAL temp_xhdl1919            :  std_logic;   
   SIGNAL temp_xhdl1920            :  std_logic;   
   SIGNAL temp_xhdl1921            :  std_logic;   
   SIGNAL temp_xhdl1922            :  std_logic;   
   SIGNAL temp_xhdl1923            :  std_logic;   
   SIGNAL temp_xhdl1924            :  std_logic;   
   SIGNAL temp_xhdl1925            :  std_logic;   
   SIGNAL temp_xhdl1926            :  std_logic;   
   SIGNAL temp_xhdl1928            :  std_logic;   
   SIGNAL temp_xhdl1929            :  std_logic;   
   SIGNAL temp_xhdl1930            :  std_logic;   
   SIGNAL temp_xhdl1931            :  std_logic;   
   SIGNAL temp_xhdl1932            :  std_logic;   
   SIGNAL temp_xhdl1933            :  std_logic;   
   SIGNAL temp_xhdl1934            :  std_logic;   
   SIGNAL temp_xhdl1935            :  std_logic;   
   SIGNAL temp_xhdl1936            :  std_logic;   
   SIGNAL temp_xhdl1937            :  std_logic;   
   SIGNAL temp_xhdl1938            :  std_logic;   
   SIGNAL temp_xhdl1939            :  std_logic;   
   SIGNAL temp_xhdl1940            :  std_logic;   
   SIGNAL temp_xhdl1941            :  std_logic;   
   SIGNAL temp_xhdl1942            :  std_logic;   
   SIGNAL temp_xhdl1943            :  std_logic;   
   SIGNAL temp_xhdl1944            :  std_logic;   
   SIGNAL temp_xhdl1946            :  std_logic;   
   SIGNAL temp_xhdl1947            :  std_logic;   
   SIGNAL temp_xhdl1948            :  std_logic;   
   SIGNAL temp_xhdl1949            :  std_logic;   
   SIGNAL temp_xhdl1950            :  std_logic;   
   SIGNAL temp_xhdl1951            :  std_logic;   
   SIGNAL temp_xhdl1952            :  std_logic;   
   SIGNAL temp_xhdl1953            :  std_logic;   
   SIGNAL temp_xhdl1954            :  std_logic;   
   SIGNAL temp_xhdl1955            :  std_logic;   
   SIGNAL temp_xhdl1956            :  std_logic;   
   SIGNAL temp_xhdl1957            :  std_logic;   
   SIGNAL temp_xhdl1958            :  std_logic;   
   SIGNAL temp_xhdl1959            :  std_logic;   
   SIGNAL temp_xhdl1960            :  std_logic;   
   SIGNAL temp_xhdl1961            :  std_logic;   
   SIGNAL temp_xhdl1962            :  std_logic;   
   SIGNAL temp_xhdl1964            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl1966            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl1968            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl1970            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl1972            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl1974            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl1976            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl1978            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl1980            :  std_logic;   
   SIGNAL temp_xhdl1982            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl1984            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl1986            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl1988            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl1990            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl1992            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl1994            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl1996            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl1998            :  std_logic;   
   SIGNAL temp_xhdl2000            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2002            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2004            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2006            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2008            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2010            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2012            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2014            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2016            :  std_logic;   
   SIGNAL temp_xhdl2018            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2020            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2022            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2024            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2026            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2028            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2030            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2032            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2034            :  std_logic;   
   SIGNAL temp_xhdl2036            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2038            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2040            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2042            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2044            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2046            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2048            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2050            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2052            :  std_logic;   
   SIGNAL temp_xhdl2054            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2056            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2058            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2060            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2062            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2064            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2066            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2068            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2070            :  std_logic;   
   SIGNAL temp_xhdl2072            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2074            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2076            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2078            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2080            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2082            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2084            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2086            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2088            :  std_logic;   
   SIGNAL temp_xhdl2090            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2092            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2094            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2096            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2098            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2100            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2102            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2104            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2106            :  std_logic;   
   SIGNAL temp_xhdl2108            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2110            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2112            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2114            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2116            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2118            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2120            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2122            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2124            :  std_logic;   
   SIGNAL temp_xhdl2126            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2128            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2130            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2132            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2134            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2136            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2138            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2140            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2142            :  std_logic;   
   SIGNAL temp_xhdl2144            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2146            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2148            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2150            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2152            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2154            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2156            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2158            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2160            :  std_logic;   
   SIGNAL temp_xhdl2162            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2164            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2166            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2168            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2170            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2172            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2174            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2176            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2178            :  std_logic;   
   SIGNAL temp_xhdl2180            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2182            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2184            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2186            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2188            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2190            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2192            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2194            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2196            :  std_logic;   
   SIGNAL temp_xhdl2198            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2200            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2202            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2204            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2206            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2208            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2210            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2212            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2214            :  std_logic;   
   SIGNAL temp_xhdl2216            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2218            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2220            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2222            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2224            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2226            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2228            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2230            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2232            :  std_logic;   
   SIGNAL temp_xhdl2234            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2236            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2238            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2240            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2242            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2244            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2246            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2248            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2250            :  std_logic;   
   SIGNAL temp_xhdl2261            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2263            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2265            :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL temp_xhdl2267            :  std_logic;   
   SIGNAL temp_xhdl2269            :  std_logic;   
   SIGNAL temp_xhdl2271            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2273            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2275            :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL temp_xhdl2277            :  std_logic;   
   SIGNAL temp_xhdl2279            :  std_logic;   
   SIGNAL temp_xhdl2281            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2283            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2285            :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL temp_xhdl2287            :  std_logic;   
   SIGNAL temp_xhdl2289            :  std_logic;   
   SIGNAL temp_xhdl2291            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2293            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2295            :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL temp_xhdl2297            :  std_logic;   
   SIGNAL temp_xhdl2299            :  std_logic;   
   SIGNAL temp_xhdl2301            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2303            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2305            :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL temp_xhdl2307            :  std_logic;   
   SIGNAL temp_xhdl2309            :  std_logic;   
   SIGNAL temp_xhdl2311            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2313            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2315            :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL temp_xhdl2317            :  std_logic;   
   SIGNAL temp_xhdl2319            :  std_logic;   
   SIGNAL temp_xhdl2321            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2323            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2325            :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL temp_xhdl2327            :  std_logic;   
   SIGNAL temp_xhdl2329            :  std_logic;   
   SIGNAL temp_xhdl2331            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2333            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2335            :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL temp_xhdl2337            :  std_logic;   
   SIGNAL temp_xhdl2339            :  std_logic;   
   SIGNAL temp_xhdl2341            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2343            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2345            :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL temp_xhdl2347            :  std_logic;   
   SIGNAL temp_xhdl2349            :  std_logic;   
   SIGNAL temp_xhdl2351            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2353            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2355            :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL temp_xhdl2357            :  std_logic;   
   SIGNAL temp_xhdl2359            :  std_logic;   
   SIGNAL temp_xhdl2361            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2363            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2365            :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL temp_xhdl2367            :  std_logic;   
   SIGNAL temp_xhdl2369            :  std_logic;   
   SIGNAL temp_xhdl2371            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2373            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2375            :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL temp_xhdl2377            :  std_logic;   
   SIGNAL temp_xhdl2379            :  std_logic;   
   SIGNAL temp_xhdl2381            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2383            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2385            :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL temp_xhdl2387            :  std_logic;   
   SIGNAL temp_xhdl2389            :  std_logic;   
   SIGNAL temp_xhdl2391            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2393            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2395            :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL temp_xhdl2397            :  std_logic;   
   SIGNAL temp_xhdl2399            :  std_logic;   
   SIGNAL temp_xhdl2401            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2403            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2405            :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL temp_xhdl2407            :  std_logic;   
   SIGNAL temp_xhdl2409            :  std_logic;   
   SIGNAL temp_xhdl2411            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2413            :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2415            :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL temp_xhdl2417            :  std_logic;   
   SIGNAL temp_xhdl2419            :  std_logic;   
   SIGNAL temp_xhdl2426            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2428            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2430            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2432            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2434            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2436            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2438            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2440            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2442            :  std_logic                   ;   
   SIGNAL temp_xhdl2444            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2446            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2448            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2450            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2452            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2454            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2456            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2458            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2460            :  std_logic                   ;   
   SIGNAL temp_xhdl2462            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2464            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2466            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2468            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2470            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2472            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2474            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2476            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2478            :  std_logic                   ;   
   SIGNAL temp_xhdl2480            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2482            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2484            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2486            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2488            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2490            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2492            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2494            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2496            :  std_logic                   ;   
   SIGNAL temp_xhdl2498            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2500            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2502            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2504            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2506            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2508            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2510            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2512            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2514            :  std_logic                   ;   
   SIGNAL temp_xhdl2516            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2518            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2520            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2522            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2524            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2526            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2528            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2530            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2532            :  std_logic                   ;   
   SIGNAL temp_xhdl2534            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2536            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2538            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2540            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2542            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2544            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2546            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2548            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2550            :  std_logic                   ;   
   SIGNAL temp_xhdl2552            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2554            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2556            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2558            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2560            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2562            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2564            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2566            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2568            :  std_logic                   ;   
   SIGNAL temp_xhdl2570            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2572            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2574            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2576            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2578            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2580            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2582            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2584            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2586            :  std_logic                   ;   
   SIGNAL temp_xhdl2588            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2590            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2592            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2594            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2596            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2598            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2600            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2602            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2604            :  std_logic                   ;   
   SIGNAL temp_xhdl2606            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2608            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2610            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2612            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2614            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2616            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2618            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2620            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2622            :  std_logic                   ;   
   SIGNAL temp_xhdl2624            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2626            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2628            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2630            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2632            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2634            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2636            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2638            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2640            :  std_logic                   ;   
   SIGNAL temp_xhdl2642            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2644            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2646            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2648            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2650            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2652            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2654            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2656            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2658            :  std_logic                   ;   
   SIGNAL temp_xhdl2660            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2662            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2664            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2666            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2668            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2670            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2672            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2674            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2676            :  std_logic                   ;   
   SIGNAL temp_xhdl2678            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2680            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2682            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2684            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2686            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2688            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2690            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2692            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2694            :  std_logic                   ;   
   SIGNAL temp_xhdl2696            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL temp_xhdl2698            :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL temp_xhdl2700            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2702            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2704            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2706            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl2708            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl2710            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL temp_xhdl2712            :  std_logic                   ;   
   SIGNAL AWREADY_IM0_xhdl1        :  std_logic;   
   SIGNAL WREADY_IM0_xhdl2         :  std_logic;   
   SIGNAL BID_IM0_xhdl3            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_IM0_xhdl4          :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_IM0_xhdl5         :  std_logic;   
   SIGNAL ARREADY_IM0_xhdl6        :  std_logic;   
   SIGNAL RID_IM0_xhdl7            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_IM0_xhdl8          :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_IM0_xhdl9          :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_IM0_xhdl10         :  std_logic;   
   SIGNAL RVALID_IM0_xhdl11        :  std_logic;   
   SIGNAL AWREADY_IM1_xhdl12       :  std_logic;   
   SIGNAL WREADY_IM1_xhdl13        :  std_logic;   
   SIGNAL BID_IM1_xhdl14           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_IM1_xhdl15         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_IM1_xhdl16        :  std_logic;   
   SIGNAL ARREADY_IM1_xhdl17       :  std_logic;   
   SIGNAL RID_IM1_xhdl18           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_IM1_xhdl19         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_IM1_xhdl20         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_IM1_xhdl21         :  std_logic;   
   SIGNAL RVALID_IM1_xhdl22        :  std_logic;   
   SIGNAL AWREADY_IM2_xhdl23       :  std_logic;   
   SIGNAL WREADY_IM2_xhdl24        :  std_logic;   
   SIGNAL BID_IM2_xhdl25           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_IM2_xhdl26         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_IM2_xhdl27        :  std_logic;   
   SIGNAL ARREADY_IM2_xhdl28       :  std_logic;   
   SIGNAL RID_IM2_xhdl29           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_IM2_xhdl30         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_IM2_xhdl31         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_IM2_xhdl32         :  std_logic;   
   SIGNAL RVALID_IM2_xhdl33        :  std_logic;   
   SIGNAL AWREADY_IM3_xhdl34       :  std_logic;   
   SIGNAL WREADY_IM3_xhdl35        :  std_logic;   
   SIGNAL BID_IM3_xhdl36           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL BRESP_IM3_xhdl37         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL BVALID_IM3_xhdl38        :  std_logic;   
   SIGNAL ARREADY_IM3_xhdl39       :  std_logic;   
   SIGNAL RID_IM3_xhdl40           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL RDATA_IM3_xhdl41         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL RRESP_IM3_xhdl42         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RLAST_IM3_xhdl43         :  std_logic;   
   SIGNAL RVALID_IM3_xhdl44        :  std_logic;   
   SIGNAL AWID_IS0_xhdl45          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS0_xhdl46        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS0_xhdl47         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS0_xhdl48        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS0_xhdl49       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS0_xhdl50        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS0_xhdl51       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS0_xhdl52        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS0_xhdl53       :  std_logic;   
   SIGNAL WID_IS0_xhdl54           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS0_xhdl55         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS0_xhdl56         :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS0_xhdl57         :  std_logic;   
   SIGNAL WVALID_IS0_xhdl58        :  std_logic;   
   SIGNAL BREADY_IS0_xhdl59        :  std_logic;   
   SIGNAL ARID_IS0_xhdl60          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS0_xhdl61        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS0_xhdl62         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS0_xhdl63        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS0_xhdl64       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS0_xhdl65        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS0_xhdl66       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS0_xhdl67        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS0_xhdl68       :  std_logic;   
   SIGNAL RREADY_IS0_xhdl69        :  std_logic;   
   SIGNAL AWID_IS1_xhdl70          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS1_xhdl71        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS1_xhdl72         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS1_xhdl73        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS1_xhdl74       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS1_xhdl75        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS1_xhdl76       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS1_xhdl77        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS1_xhdl78       :  std_logic;   
   SIGNAL WID_IS1_xhdl79           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS1_xhdl80         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS1_xhdl81         :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS1_xhdl82         :  std_logic;   
   SIGNAL WVALID_IS1_xhdl83        :  std_logic;   
   SIGNAL BREADY_IS1_xhdl84        :  std_logic;   
   SIGNAL ARID_IS1_xhdl85          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS1_xhdl86        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS1_xhdl87         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS1_xhdl88        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS1_xhdl89       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS1_xhdl90        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS1_xhdl91       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS1_xhdl92        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS1_xhdl93       :  std_logic;   
   SIGNAL RREADY_IS1_xhdl94        :  std_logic;   
   SIGNAL AWID_IS2_xhdl95          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS2_xhdl96        :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS2_xhdl97         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS2_xhdl98        :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS2_xhdl99       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS2_xhdl100       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS2_xhdl101      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS2_xhdl102       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS2_xhdl103      :  std_logic;   
   SIGNAL WID_IS2_xhdl104          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS2_xhdl105        :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS2_xhdl106        :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS2_xhdl107        :  std_logic;   
   SIGNAL WVALID_IS2_xhdl108       :  std_logic;   
   SIGNAL BREADY_IS2_xhdl109       :  std_logic;   
   SIGNAL ARID_IS2_xhdl110         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS2_xhdl111       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS2_xhdl112        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS2_xhdl113       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS2_xhdl114      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS2_xhdl115       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS2_xhdl116      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS2_xhdl117       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS2_xhdl118      :  std_logic;   
   SIGNAL RREADY_IS2_xhdl119       :  std_logic;   
   SIGNAL AWID_IS3_xhdl120         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS3_xhdl121       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS3_xhdl122        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS3_xhdl123       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS3_xhdl124      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS3_xhdl125       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS3_xhdl126      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS3_xhdl127       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS3_xhdl128      :  std_logic;   
   SIGNAL WID_IS3_xhdl129          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS3_xhdl130        :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS3_xhdl131        :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS3_xhdl132        :  std_logic;   
   SIGNAL WVALID_IS3_xhdl133       :  std_logic;   
   SIGNAL BREADY_IS3_xhdl134       :  std_logic;   
   SIGNAL ARID_IS3_xhdl135         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS3_xhdl136       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS3_xhdl137        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS3_xhdl138       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS3_xhdl139      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS3_xhdl140       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS3_xhdl141      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS3_xhdl142       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS3_xhdl143      :  std_logic;   
   SIGNAL RREADY_IS3_xhdl144       :  std_logic;   
   SIGNAL AWID_IS4_xhdl145         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS4_xhdl146       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS4_xhdl147        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS4_xhdl148       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS4_xhdl149      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS4_xhdl150       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS4_xhdl151      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS4_xhdl152       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS4_xhdl153      :  std_logic;   
   SIGNAL WID_IS4_xhdl154          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS4_xhdl155        :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS4_xhdl156        :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS4_xhdl157        :  std_logic;   
   SIGNAL WVALID_IS4_xhdl158       :  std_logic;   
   SIGNAL BREADY_IS4_xhdl159       :  std_logic;   
   SIGNAL ARID_IS4_xhdl160         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS4_xhdl161       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS4_xhdl162        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS4_xhdl163       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS4_xhdl164      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS4_xhdl165       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS4_xhdl166      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS4_xhdl167       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS4_xhdl168      :  std_logic;   
   SIGNAL RREADY_IS4_xhdl169       :  std_logic;   
   SIGNAL AWID_IS5_xhdl170         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS5_xhdl171       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS5_xhdl172        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS5_xhdl173       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS5_xhdl174      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS5_xhdl175       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS5_xhdl176      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS5_xhdl177       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS5_xhdl178      :  std_logic;   
   SIGNAL WID_IS5_xhdl179          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS5_xhdl180        :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS5_xhdl181        :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS5_xhdl182        :  std_logic;   
   SIGNAL WVALID_IS5_xhdl183       :  std_logic;   
   SIGNAL BREADY_IS5_xhdl184       :  std_logic;   
   SIGNAL ARID_IS5_xhdl185         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS5_xhdl186       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS5_xhdl187        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS5_xhdl188       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS5_xhdl189      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS5_xhdl190       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS5_xhdl191      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS5_xhdl192       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS5_xhdl193      :  std_logic;   
   SIGNAL RREADY_IS5_xhdl194       :  std_logic;   
   SIGNAL AWID_IS6_xhdl195         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS6_xhdl196       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS6_xhdl197        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS6_xhdl198       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS6_xhdl199      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS6_xhdl200       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS6_xhdl201      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS6_xhdl202       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS6_xhdl203      :  std_logic;   
   SIGNAL WID_IS6_xhdl204          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS6_xhdl205        :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS6_xhdl206        :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS6_xhdl207        :  std_logic;   
   SIGNAL WVALID_IS6_xhdl208       :  std_logic;   
   SIGNAL BREADY_IS6_xhdl209       :  std_logic;   
   SIGNAL ARID_IS6_xhdl210         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS6_xhdl211       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS6_xhdl212        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS6_xhdl213       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS6_xhdl214      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS6_xhdl215       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS6_xhdl216      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS6_xhdl217       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS6_xhdl218      :  std_logic;   
   SIGNAL RREADY_IS6_xhdl219       :  std_logic;   
   SIGNAL AWID_IS7_xhdl220         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS7_xhdl221       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS7_xhdl222        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS7_xhdl223       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS7_xhdl224      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS7_xhdl225       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS7_xhdl226      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS7_xhdl227       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS7_xhdl228      :  std_logic;   
   SIGNAL WID_IS7_xhdl229          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS7_xhdl230        :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS7_xhdl231        :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS7_xhdl232        :  std_logic;   
   SIGNAL WVALID_IS7_xhdl233       :  std_logic;   
   SIGNAL BREADY_IS7_xhdl234       :  std_logic;   
   SIGNAL ARID_IS7_xhdl235         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS7_xhdl236       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS7_xhdl237        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS7_xhdl238       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS7_xhdl239      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS7_xhdl240       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS7_xhdl241      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS7_xhdl242       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS7_xhdl243      :  std_logic;   
   SIGNAL RREADY_IS7_xhdl244       :  std_logic;   
   SIGNAL AWID_IS8_xhdl245         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS8_xhdl246       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS8_xhdl247        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS8_xhdl248       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS8_xhdl249      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS8_xhdl250       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS8_xhdl251      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS8_xhdl252       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS8_xhdl253      :  std_logic;   
   SIGNAL WID_IS8_xhdl254          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS8_xhdl255        :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS8_xhdl256        :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS8_xhdl257        :  std_logic;   
   SIGNAL WVALID_IS8_xhdl258       :  std_logic;   
   SIGNAL BREADY_IS8_xhdl259       :  std_logic;   
   SIGNAL ARID_IS8_xhdl260         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS8_xhdl261       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS8_xhdl262        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS8_xhdl263       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS8_xhdl264      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS8_xhdl265       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS8_xhdl266      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS8_xhdl267       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS8_xhdl268      :  std_logic;   
   SIGNAL RREADY_IS8_xhdl269       :  std_logic;   
   SIGNAL AWID_IS9_xhdl270         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS9_xhdl271       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS9_xhdl272        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS9_xhdl273       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS9_xhdl274      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS9_xhdl275       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS9_xhdl276      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS9_xhdl277       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS9_xhdl278      :  std_logic;   
   SIGNAL WID_IS9_xhdl279          :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS9_xhdl280        :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS9_xhdl281        :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS9_xhdl282        :  std_logic;   
   SIGNAL WVALID_IS9_xhdl283       :  std_logic;   
   SIGNAL BREADY_IS9_xhdl284       :  std_logic;   
   SIGNAL ARID_IS9_xhdl285         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS9_xhdl286       :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS9_xhdl287        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS9_xhdl288       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS9_xhdl289      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS9_xhdl290       :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS9_xhdl291      :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS9_xhdl292       :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS9_xhdl293      :  std_logic;   
   SIGNAL RREADY_IS9_xhdl294       :  std_logic;   
   SIGNAL AWID_IS10_xhdl295        :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS10_xhdl296      :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS10_xhdl297       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS10_xhdl298      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS10_xhdl299     :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS10_xhdl300      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS10_xhdl301     :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS10_xhdl302      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS10_xhdl303     :  std_logic;   
   SIGNAL WID_IS10_xhdl304         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS10_xhdl305       :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS10_xhdl306       :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS10_xhdl307       :  std_logic;   
   SIGNAL WVALID_IS10_xhdl308      :  std_logic;   
   SIGNAL BREADY_IS10_xhdl309      :  std_logic;   
   SIGNAL ARID_IS10_xhdl310        :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS10_xhdl311      :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS10_xhdl312       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS10_xhdl313      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS10_xhdl314     :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS10_xhdl315      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS10_xhdl316     :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS10_xhdl317      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS10_xhdl318     :  std_logic;   
   SIGNAL RREADY_IS10_xhdl319      :  std_logic;   
   SIGNAL AWID_IS11_xhdl320        :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS11_xhdl321      :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS11_xhdl322       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS11_xhdl323      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS11_xhdl324     :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS11_xhdl325      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS11_xhdl326     :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS11_xhdl327      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS11_xhdl328     :  std_logic;   
   SIGNAL WID_IS11_xhdl329         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS11_xhdl330       :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS11_xhdl331       :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS11_xhdl332       :  std_logic;   
   SIGNAL WVALID_IS11_xhdl333      :  std_logic;   
   SIGNAL BREADY_IS11_xhdl334      :  std_logic;   
   SIGNAL ARID_IS11_xhdl335        :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS11_xhdl336      :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS11_xhdl337       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS11_xhdl338      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS11_xhdl339     :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS11_xhdl340      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS11_xhdl341     :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS11_xhdl342      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS11_xhdl343     :  std_logic;   
   SIGNAL RREADY_IS11_xhdl344      :  std_logic;   
   SIGNAL AWID_IS12_xhdl345        :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS12_xhdl346      :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS12_xhdl347       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS12_xhdl348      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS12_xhdl349     :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS12_xhdl350      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS12_xhdl351     :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS12_xhdl352      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS12_xhdl353     :  std_logic;   
   SIGNAL WID_IS12_xhdl354         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS12_xhdl355       :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS12_xhdl356       :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS12_xhdl357       :  std_logic;   
   SIGNAL WVALID_IS12_xhdl358      :  std_logic;   
   SIGNAL BREADY_IS12_xhdl359      :  std_logic;   
   SIGNAL ARID_IS12_xhdl360        :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS12_xhdl361      :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS12_xhdl362       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS12_xhdl363      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS12_xhdl364     :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS12_xhdl365      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS12_xhdl366     :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS12_xhdl367      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS12_xhdl368     :  std_logic;   
   SIGNAL RREADY_IS12_xhdl369      :  std_logic;   
   SIGNAL AWID_IS13_xhdl370        :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS13_xhdl371      :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS13_xhdl372       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS13_xhdl373      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS13_xhdl374     :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS13_xhdl375      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS13_xhdl376     :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS13_xhdl377      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS13_xhdl378     :  std_logic;   
   SIGNAL WID_IS13_xhdl379         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS13_xhdl380       :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS13_xhdl381       :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS13_xhdl382       :  std_logic;   
   SIGNAL WVALID_IS13_xhdl383      :  std_logic;   
   SIGNAL BREADY_IS13_xhdl384      :  std_logic;   
   SIGNAL ARID_IS13_xhdl385        :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS13_xhdl386      :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS13_xhdl387       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS13_xhdl388      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS13_xhdl389     :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS13_xhdl390      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS13_xhdl391     :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS13_xhdl392      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS13_xhdl393     :  std_logic;   
   SIGNAL RREADY_IS13_xhdl394      :  std_logic;   
   SIGNAL AWID_IS14_xhdl395        :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS14_xhdl396      :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS14_xhdl397       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS14_xhdl398      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS14_xhdl399     :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS14_xhdl400      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS14_xhdl401     :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS14_xhdl402      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS14_xhdl403     :  std_logic;   
   SIGNAL WID_IS14_xhdl404         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS14_xhdl405       :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS14_xhdl406       :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS14_xhdl407       :  std_logic;   
   SIGNAL WVALID_IS14_xhdl408      :  std_logic;   
   SIGNAL BREADY_IS14_xhdl409      :  std_logic;   
   SIGNAL ARID_IS14_xhdl410        :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS14_xhdl411      :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS14_xhdl412       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS14_xhdl413      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS14_xhdl414     :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS14_xhdl415      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS14_xhdl416     :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS14_xhdl417      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS14_xhdl418     :  std_logic;   
   SIGNAL RREADY_IS14_xhdl419      :  std_logic;   
   SIGNAL AWID_IS15_xhdl420        :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS15_xhdl421      :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS15_xhdl422       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS15_xhdl423      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS15_xhdl424     :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS15_xhdl425      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS15_xhdl426     :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS15_xhdl427      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS15_xhdl428     :  std_logic;   
   SIGNAL WID_IS15_xhdl429         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS15_xhdl430       :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS15_xhdl431       :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS15_xhdl432       :  std_logic;   
   SIGNAL WVALID_IS15_xhdl433      :  std_logic;   
   SIGNAL BREADY_IS15_xhdl434      :  std_logic;   
   SIGNAL ARID_IS15_xhdl435        :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS15_xhdl436      :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS15_xhdl437       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS15_xhdl438      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS15_xhdl439     :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS15_xhdl440      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS15_xhdl441     :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS15_xhdl442      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS15_xhdl443     :  std_logic;   
   SIGNAL RREADY_IS15_xhdl444      :  std_logic;   
   SIGNAL AWID_IS16_xhdl445        :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_IS16_xhdl446      :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_IS16_xhdl447       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_IS16_xhdl448      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_IS16_xhdl449     :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_IS16_xhdl450      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_IS16_xhdl451     :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_IS16_xhdl452      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_IS16_xhdl453     :  std_logic;   
   SIGNAL WID_IS16_xhdl454         :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_IS16_xhdl455       :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_IS16_xhdl456       :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_IS16_xhdl457       :  std_logic;   
   SIGNAL WVALID_IS16_xhdl458      :  std_logic;   
   SIGNAL BREADY_IS16_xhdl459      :  std_logic;   
   SIGNAL ARID_IS16_xhdl460        :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_IS16_xhdl461      :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_IS16_xhdl462       :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_IS16_xhdl463      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_IS16_xhdl464     :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_IS16_xhdl465      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_IS16_xhdl466     :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_IS16_xhdl467      :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_IS16_xhdl468     :  std_logic;   
   SIGNAL RREADY_IS16_xhdl469      :  std_logic;   
   SIGNAL RREADY_M0IS0_gated       :  std_logic;   
   SIGNAL RREADY_M0IS10_gated      :  std_logic;   
   SIGNAL RREADY_M0IS11_gated      :  std_logic;   
   SIGNAL RREADY_M0IS12_gated      :  std_logic;   
   SIGNAL RREADY_M0IS13_gated      :  std_logic;   
   SIGNAL RREADY_M0IS14_gated      :  std_logic;   
   SIGNAL RREADY_M0IS15_gated      :  std_logic;   
   SIGNAL RREADY_M0IS16_gated      :  std_logic;   
   SIGNAL RREADY_M0IS1_gated       :  std_logic;   
   SIGNAL RREADY_M0IS2_gated       :  std_logic;   
   SIGNAL RREADY_M0IS3_gated       :  std_logic;   
   SIGNAL RREADY_M0IS4_gated       :  std_logic;   
   SIGNAL RREADY_M0IS5_gated       :  std_logic;   
   SIGNAL RREADY_M0IS6_gated       :  std_logic;   
   SIGNAL RREADY_M0IS7_gated       :  std_logic;   
   SIGNAL RREADY_M0IS8_gated       :  std_logic;   
   SIGNAL RREADY_M0IS9_gated       :  std_logic;   
   SIGNAL RREADY_M1IS0_gated       :  std_logic;   
   SIGNAL RREADY_M1IS10_gated      :  std_logic;   
   SIGNAL RREADY_M1IS11_gated      :  std_logic;   
   SIGNAL RREADY_M1IS12_gated      :  std_logic;   
   SIGNAL RREADY_M1IS13_gated      :  std_logic;   
   SIGNAL RREADY_M1IS14_gated      :  std_logic;   
   SIGNAL RREADY_M1IS15_gated      :  std_logic;   
   SIGNAL RREADY_M1IS16_gated      :  std_logic;   
   SIGNAL RREADY_M1IS1_gated       :  std_logic;   
   SIGNAL RREADY_M1IS2_gated       :  std_logic;   
   SIGNAL RREADY_M1IS3_gated       :  std_logic;   
   SIGNAL RREADY_M1IS4_gated       :  std_logic;   
   SIGNAL RREADY_M1IS5_gated       :  std_logic;   
   SIGNAL RREADY_M1IS6_gated       :  std_logic;   
   SIGNAL RREADY_M1IS7_gated       :  std_logic;   
   SIGNAL RREADY_M1IS8_gated       :  std_logic;   
   SIGNAL RREADY_M1IS9_gated       :  std_logic;   
   SIGNAL RREADY_M2IS0_gated       :  std_logic;   
   SIGNAL RREADY_M2IS10_gated      :  std_logic;   
   SIGNAL RREADY_M2IS11_gated      :  std_logic;   
   SIGNAL RREADY_M2IS12_gated      :  std_logic;   
   SIGNAL RREADY_M2IS13_gated      :  std_logic;   
   SIGNAL RREADY_M2IS14_gated      :  std_logic;   
   SIGNAL RREADY_M2IS15_gated      :  std_logic;   
   SIGNAL RREADY_M2IS16_gated      :  std_logic;   
   SIGNAL RREADY_M2IS1_gated       :  std_logic;   
   SIGNAL RREADY_M2IS2_gated       :  std_logic;   
   SIGNAL RREADY_M2IS3_gated       :  std_logic;   
   SIGNAL RREADY_M2IS4_gated       :  std_logic;   
   SIGNAL RREADY_M2IS5_gated       :  std_logic;   
   SIGNAL RREADY_M2IS6_gated       :  std_logic;   
   SIGNAL RREADY_M2IS7_gated       :  std_logic;   
   SIGNAL RREADY_M2IS8_gated       :  std_logic;   
   SIGNAL RREADY_M2IS9_gated       :  std_logic;   
   SIGNAL RREADY_M3IS0_gated       :  std_logic;   
   SIGNAL RREADY_M3IS10_gated      :  std_logic;   
   SIGNAL RREADY_M3IS11_gated      :  std_logic;   
   SIGNAL RREADY_M3IS12_gated      :  std_logic;   
   SIGNAL RREADY_M3IS13_gated      :  std_logic;   
   SIGNAL RREADY_M3IS14_gated      :  std_logic;   
   SIGNAL RREADY_M3IS15_gated      :  std_logic;   
   SIGNAL RREADY_M3IS16_gated      :  std_logic;   
   SIGNAL RREADY_M3IS1_gated       :  std_logic;   
   SIGNAL RREADY_M3IS2_gated       :  std_logic;   
   SIGNAL RREADY_M3IS3_gated       :  std_logic;   
   SIGNAL RREADY_M3IS4_gated       :  std_logic;   
   SIGNAL RREADY_M3IS5_gated       :  std_logic;   
   SIGNAL RREADY_M3IS6_gated       :  std_logic;   
   SIGNAL RREADY_M3IS7_gated       :  std_logic;   
   SIGNAL RREADY_M3IS8_gated       :  std_logic;   
   SIGNAL RREADY_M3IS9_gated       :  std_logic;   
   SIGNAL areset_n                  :  std_logic;   
   SIGNAL sresetn                  :  std_logic;   

BEGIN
   --///////////////////////////////////////////////////////////////////////////
   --                               Start - of - Code                         //
   --///////////////////////////////////////////////////////////////////////////

   areset_n   <= '1' WHEN (SYNC_RESET = 1) ELSE ARESETN;
   sresetn   <= ARESETN WHEN (SYNC_RESET = 1) ELSE '1';

   AWREADY_IM0 <= AWREADY_IM0_xhdl1;
   WREADY_IM0 <= WREADY_IM0_xhdl2;
   BID_IM0 <= BID_IM0_xhdl3;
   BRESP_IM0 <= BRESP_IM0_xhdl4;
   BVALID_IM0 <= BVALID_IM0_xhdl5;
   ARREADY_IM0 <= ARREADY_IM0_xhdl6;
   RID_IM0 <= RID_IM0_xhdl7;
   RDATA_IM0 <= RDATA_IM0_xhdl8;
   RRESP_IM0 <= RRESP_IM0_xhdl9;
   RLAST_IM0 <= RLAST_IM0_xhdl10;
   RVALID_IM0 <= RVALID_IM0_xhdl11;
   AWREADY_IM1 <= AWREADY_IM1_xhdl12;
   WREADY_IM1 <= WREADY_IM1_xhdl13;
   BID_IM1 <= BID_IM1_xhdl14;
   BRESP_IM1 <= BRESP_IM1_xhdl15;
   BVALID_IM1 <= BVALID_IM1_xhdl16;
   ARREADY_IM1 <= ARREADY_IM1_xhdl17;
   RID_IM1 <= RID_IM1_xhdl18;
   RDATA_IM1 <= RDATA_IM1_xhdl19;
   RRESP_IM1 <= RRESP_IM1_xhdl20;
   RLAST_IM1 <= RLAST_IM1_xhdl21;
   RVALID_IM1 <= RVALID_IM1_xhdl22;
   AWREADY_IM2 <= AWREADY_IM2_xhdl23;
   WREADY_IM2 <= WREADY_IM2_xhdl24;
   BID_IM2 <= BID_IM2_xhdl25;
   BRESP_IM2 <= BRESP_IM2_xhdl26;
   BVALID_IM2 <= BVALID_IM2_xhdl27;
   ARREADY_IM2 <= ARREADY_IM2_xhdl28;
   RID_IM2 <= RID_IM2_xhdl29;
   RDATA_IM2 <= RDATA_IM2_xhdl30;
   RRESP_IM2 <= RRESP_IM2_xhdl31;
   RLAST_IM2 <= RLAST_IM2_xhdl32;
   RVALID_IM2 <= RVALID_IM2_xhdl33;
   AWREADY_IM3 <= AWREADY_IM3_xhdl34;
   WREADY_IM3 <= WREADY_IM3_xhdl35;
   BID_IM3 <= BID_IM3_xhdl36;
   BRESP_IM3 <= BRESP_IM3_xhdl37;
   BVALID_IM3 <= BVALID_IM3_xhdl38;
   ARREADY_IM3 <= ARREADY_IM3_xhdl39;
   RID_IM3 <= RID_IM3_xhdl40;
   RDATA_IM3 <= RDATA_IM3_xhdl41;
   RRESP_IM3 <= RRESP_IM3_xhdl42;
   RLAST_IM3 <= RLAST_IM3_xhdl43;
   RVALID_IM3 <= RVALID_IM3_xhdl44;
   AWID_IS0 <= AWID_IS0_xhdl45;
   AWADDR_IS0 <= AWADDR_IS0_xhdl46;
   AWLEN_IS0 <= AWLEN_IS0_xhdl47;
   AWSIZE_IS0 <= AWSIZE_IS0_xhdl48;
   AWBURST_IS0 <= AWBURST_IS0_xhdl49;
   AWLOCK_IS0 <= AWLOCK_IS0_xhdl50;
   AWCACHE_IS0 <= AWCACHE_IS0_xhdl51;
   AWPROT_IS0 <= AWPROT_IS0_xhdl52;
   AWVALID_IS0 <= AWVALID_IS0_xhdl53;
   WID_IS0 <= WID_IS0_xhdl54;
   WDATA_IS0 <= WDATA_IS0_xhdl55;
   WSTRB_IS0 <= WSTRB_IS0_xhdl56;
   WLAST_IS0 <= WLAST_IS0_xhdl57;
   WVALID_IS0 <= WVALID_IS0_xhdl58;
   BREADY_IS0 <= BREADY_IS0_xhdl59;
   ARID_IS0 <= ARID_IS0_xhdl60;
   ARADDR_IS0 <= ARADDR_IS0_xhdl61;
   ARLEN_IS0 <= ARLEN_IS0_xhdl62;
   ARSIZE_IS0 <= ARSIZE_IS0_xhdl63;
   ARBURST_IS0 <= ARBURST_IS0_xhdl64;
   ARLOCK_IS0 <= ARLOCK_IS0_xhdl65;
   ARCACHE_IS0 <= ARCACHE_IS0_xhdl66;
   ARPROT_IS0 <= ARPROT_IS0_xhdl67;
   ARVALID_IS0 <= ARVALID_IS0_xhdl68;
   RREADY_IS0 <= RREADY_IS0_xhdl69;
   AWID_IS1 <= AWID_IS1_xhdl70;
   AWADDR_IS1 <= AWADDR_IS1_xhdl71;
   AWLEN_IS1 <= AWLEN_IS1_xhdl72;
   AWSIZE_IS1 <= AWSIZE_IS1_xhdl73;
   AWBURST_IS1 <= AWBURST_IS1_xhdl74;
   AWLOCK_IS1 <= AWLOCK_IS1_xhdl75;
   AWCACHE_IS1 <= AWCACHE_IS1_xhdl76;
   AWPROT_IS1 <= AWPROT_IS1_xhdl77;
   AWVALID_IS1 <= AWVALID_IS1_xhdl78;
   WID_IS1 <= WID_IS1_xhdl79;
   WDATA_IS1 <= WDATA_IS1_xhdl80;
   WSTRB_IS1 <= WSTRB_IS1_xhdl81;
   WLAST_IS1 <= WLAST_IS1_xhdl82;
   WVALID_IS1 <= WVALID_IS1_xhdl83;
   BREADY_IS1 <= BREADY_IS1_xhdl84;
   ARID_IS1 <= ARID_IS1_xhdl85;
   ARADDR_IS1 <= ARADDR_IS1_xhdl86;
   ARLEN_IS1 <= ARLEN_IS1_xhdl87;
   ARSIZE_IS1 <= ARSIZE_IS1_xhdl88;
   ARBURST_IS1 <= ARBURST_IS1_xhdl89;
   ARLOCK_IS1 <= ARLOCK_IS1_xhdl90;
   ARCACHE_IS1 <= ARCACHE_IS1_xhdl91;
   ARPROT_IS1 <= ARPROT_IS1_xhdl92;
   ARVALID_IS1 <= ARVALID_IS1_xhdl93;
   RREADY_IS1 <= RREADY_IS1_xhdl94;
   AWID_IS2 <= AWID_IS2_xhdl95;
   AWADDR_IS2 <= AWADDR_IS2_xhdl96;
   AWLEN_IS2 <= AWLEN_IS2_xhdl97;
   AWSIZE_IS2 <= AWSIZE_IS2_xhdl98;
   AWBURST_IS2 <= AWBURST_IS2_xhdl99;
   AWLOCK_IS2 <= AWLOCK_IS2_xhdl100;
   AWCACHE_IS2 <= AWCACHE_IS2_xhdl101;
   AWPROT_IS2 <= AWPROT_IS2_xhdl102;
   AWVALID_IS2 <= AWVALID_IS2_xhdl103;
   WID_IS2 <= WID_IS2_xhdl104;
   WDATA_IS2 <= WDATA_IS2_xhdl105;
   WSTRB_IS2 <= WSTRB_IS2_xhdl106;
   WLAST_IS2 <= WLAST_IS2_xhdl107;
   WVALID_IS2 <= WVALID_IS2_xhdl108;
   BREADY_IS2 <= BREADY_IS2_xhdl109;
   ARID_IS2 <= ARID_IS2_xhdl110;
   ARADDR_IS2 <= ARADDR_IS2_xhdl111;
   ARLEN_IS2 <= ARLEN_IS2_xhdl112;
   ARSIZE_IS2 <= ARSIZE_IS2_xhdl113;
   ARBURST_IS2 <= ARBURST_IS2_xhdl114;
   ARLOCK_IS2 <= ARLOCK_IS2_xhdl115;
   ARCACHE_IS2 <= ARCACHE_IS2_xhdl116;
   ARPROT_IS2 <= ARPROT_IS2_xhdl117;
   ARVALID_IS2 <= ARVALID_IS2_xhdl118;
   RREADY_IS2 <= RREADY_IS2_xhdl119;
   AWID_IS3 <= AWID_IS3_xhdl120;
   AWADDR_IS3 <= AWADDR_IS3_xhdl121;
   AWLEN_IS3 <= AWLEN_IS3_xhdl122;
   AWSIZE_IS3 <= AWSIZE_IS3_xhdl123;
   AWBURST_IS3 <= AWBURST_IS3_xhdl124;
   AWLOCK_IS3 <= AWLOCK_IS3_xhdl125;
   AWCACHE_IS3 <= AWCACHE_IS3_xhdl126;
   AWPROT_IS3 <= AWPROT_IS3_xhdl127;
   AWVALID_IS3 <= AWVALID_IS3_xhdl128;
   WID_IS3 <= WID_IS3_xhdl129;
   WDATA_IS3 <= WDATA_IS3_xhdl130;
   WSTRB_IS3 <= WSTRB_IS3_xhdl131;
   WLAST_IS3 <= WLAST_IS3_xhdl132;
   WVALID_IS3 <= WVALID_IS3_xhdl133;
   BREADY_IS3 <= BREADY_IS3_xhdl134;
   ARID_IS3 <= ARID_IS3_xhdl135;
   ARADDR_IS3 <= ARADDR_IS3_xhdl136;
   ARLEN_IS3 <= ARLEN_IS3_xhdl137;
   ARSIZE_IS3 <= ARSIZE_IS3_xhdl138;
   ARBURST_IS3 <= ARBURST_IS3_xhdl139;
   ARLOCK_IS3 <= ARLOCK_IS3_xhdl140;
   ARCACHE_IS3 <= ARCACHE_IS3_xhdl141;
   ARPROT_IS3 <= ARPROT_IS3_xhdl142;
   ARVALID_IS3 <= ARVALID_IS3_xhdl143;
   RREADY_IS3 <= RREADY_IS3_xhdl144;
   AWID_IS4 <= AWID_IS4_xhdl145;
   AWADDR_IS4 <= AWADDR_IS4_xhdl146;
   AWLEN_IS4 <= AWLEN_IS4_xhdl147;
   AWSIZE_IS4 <= AWSIZE_IS4_xhdl148;
   AWBURST_IS4 <= AWBURST_IS4_xhdl149;
   AWLOCK_IS4 <= AWLOCK_IS4_xhdl150;
   AWCACHE_IS4 <= AWCACHE_IS4_xhdl151;
   AWPROT_IS4 <= AWPROT_IS4_xhdl152;
   AWVALID_IS4 <= AWVALID_IS4_xhdl153;
   WID_IS4 <= WID_IS4_xhdl154;
   WDATA_IS4 <= WDATA_IS4_xhdl155;
   WSTRB_IS4 <= WSTRB_IS4_xhdl156;
   WLAST_IS4 <= WLAST_IS4_xhdl157;
   WVALID_IS4 <= WVALID_IS4_xhdl158;
   BREADY_IS4 <= BREADY_IS4_xhdl159;
   ARID_IS4 <= ARID_IS4_xhdl160;
   ARADDR_IS4 <= ARADDR_IS4_xhdl161;
   ARLEN_IS4 <= ARLEN_IS4_xhdl162;
   ARSIZE_IS4 <= ARSIZE_IS4_xhdl163;
   ARBURST_IS4 <= ARBURST_IS4_xhdl164;
   ARLOCK_IS4 <= ARLOCK_IS4_xhdl165;
   ARCACHE_IS4 <= ARCACHE_IS4_xhdl166;
   ARPROT_IS4 <= ARPROT_IS4_xhdl167;
   ARVALID_IS4 <= ARVALID_IS4_xhdl168;
   RREADY_IS4 <= RREADY_IS4_xhdl169;
   AWID_IS5 <= AWID_IS5_xhdl170;
   AWADDR_IS5 <= AWADDR_IS5_xhdl171;
   AWLEN_IS5 <= AWLEN_IS5_xhdl172;
   AWSIZE_IS5 <= AWSIZE_IS5_xhdl173;
   AWBURST_IS5 <= AWBURST_IS5_xhdl174;
   AWLOCK_IS5 <= AWLOCK_IS5_xhdl175;
   AWCACHE_IS5 <= AWCACHE_IS5_xhdl176;
   AWPROT_IS5 <= AWPROT_IS5_xhdl177;
   AWVALID_IS5 <= AWVALID_IS5_xhdl178;
   WID_IS5 <= WID_IS5_xhdl179;
   WDATA_IS5 <= WDATA_IS5_xhdl180;
   WSTRB_IS5 <= WSTRB_IS5_xhdl181;
   WLAST_IS5 <= WLAST_IS5_xhdl182;
   WVALID_IS5 <= WVALID_IS5_xhdl183;
   BREADY_IS5 <= BREADY_IS5_xhdl184;
   ARID_IS5 <= ARID_IS5_xhdl185;
   ARADDR_IS5 <= ARADDR_IS5_xhdl186;
   ARLEN_IS5 <= ARLEN_IS5_xhdl187;
   ARSIZE_IS5 <= ARSIZE_IS5_xhdl188;
   ARBURST_IS5 <= ARBURST_IS5_xhdl189;
   ARLOCK_IS5 <= ARLOCK_IS5_xhdl190;
   ARCACHE_IS5 <= ARCACHE_IS5_xhdl191;
   ARPROT_IS5 <= ARPROT_IS5_xhdl192;
   ARVALID_IS5 <= ARVALID_IS5_xhdl193;
   RREADY_IS5 <= RREADY_IS5_xhdl194;
   AWID_IS6 <= AWID_IS6_xhdl195;
   AWADDR_IS6 <= AWADDR_IS6_xhdl196;
   AWLEN_IS6 <= AWLEN_IS6_xhdl197;
   AWSIZE_IS6 <= AWSIZE_IS6_xhdl198;
   AWBURST_IS6 <= AWBURST_IS6_xhdl199;
   AWLOCK_IS6 <= AWLOCK_IS6_xhdl200;
   AWCACHE_IS6 <= AWCACHE_IS6_xhdl201;
   AWPROT_IS6 <= AWPROT_IS6_xhdl202;
   AWVALID_IS6 <= AWVALID_IS6_xhdl203;
   WID_IS6 <= WID_IS6_xhdl204;
   WDATA_IS6 <= WDATA_IS6_xhdl205;
   WSTRB_IS6 <= WSTRB_IS6_xhdl206;
   WLAST_IS6 <= WLAST_IS6_xhdl207;
   WVALID_IS6 <= WVALID_IS6_xhdl208;
   BREADY_IS6 <= BREADY_IS6_xhdl209;
   ARID_IS6 <= ARID_IS6_xhdl210;
   ARADDR_IS6 <= ARADDR_IS6_xhdl211;
   ARLEN_IS6 <= ARLEN_IS6_xhdl212;
   ARSIZE_IS6 <= ARSIZE_IS6_xhdl213;
   ARBURST_IS6 <= ARBURST_IS6_xhdl214;
   ARLOCK_IS6 <= ARLOCK_IS6_xhdl215;
   ARCACHE_IS6 <= ARCACHE_IS6_xhdl216;
   ARPROT_IS6 <= ARPROT_IS6_xhdl217;
   ARVALID_IS6 <= ARVALID_IS6_xhdl218;
   RREADY_IS6 <= RREADY_IS6_xhdl219;
   AWID_IS7 <= AWID_IS7_xhdl220;
   AWADDR_IS7 <= AWADDR_IS7_xhdl221;
   AWLEN_IS7 <= AWLEN_IS7_xhdl222;
   AWSIZE_IS7 <= AWSIZE_IS7_xhdl223;
   AWBURST_IS7 <= AWBURST_IS7_xhdl224;
   AWLOCK_IS7 <= AWLOCK_IS7_xhdl225;
   AWCACHE_IS7 <= AWCACHE_IS7_xhdl226;
   AWPROT_IS7 <= AWPROT_IS7_xhdl227;
   AWVALID_IS7 <= AWVALID_IS7_xhdl228;
   WID_IS7 <= WID_IS7_xhdl229;
   WDATA_IS7 <= WDATA_IS7_xhdl230;
   WSTRB_IS7 <= WSTRB_IS7_xhdl231;
   WLAST_IS7 <= WLAST_IS7_xhdl232;
   WVALID_IS7 <= WVALID_IS7_xhdl233;
   BREADY_IS7 <= BREADY_IS7_xhdl234;
   ARID_IS7 <= ARID_IS7_xhdl235;
   ARADDR_IS7 <= ARADDR_IS7_xhdl236;
   ARLEN_IS7 <= ARLEN_IS7_xhdl237;
   ARSIZE_IS7 <= ARSIZE_IS7_xhdl238;
   ARBURST_IS7 <= ARBURST_IS7_xhdl239;
   ARLOCK_IS7 <= ARLOCK_IS7_xhdl240;
   ARCACHE_IS7 <= ARCACHE_IS7_xhdl241;
   ARPROT_IS7 <= ARPROT_IS7_xhdl242;
   ARVALID_IS7 <= ARVALID_IS7_xhdl243;
   RREADY_IS7 <= RREADY_IS7_xhdl244;
   AWID_IS8 <= AWID_IS8_xhdl245;
   AWADDR_IS8 <= AWADDR_IS8_xhdl246;
   AWLEN_IS8 <= AWLEN_IS8_xhdl247;
   AWSIZE_IS8 <= AWSIZE_IS8_xhdl248;
   AWBURST_IS8 <= AWBURST_IS8_xhdl249;
   AWLOCK_IS8 <= AWLOCK_IS8_xhdl250;
   AWCACHE_IS8 <= AWCACHE_IS8_xhdl251;
   AWPROT_IS8 <= AWPROT_IS8_xhdl252;
   AWVALID_IS8 <= AWVALID_IS8_xhdl253;
   WID_IS8 <= WID_IS8_xhdl254;
   WDATA_IS8 <= WDATA_IS8_xhdl255;
   WSTRB_IS8 <= WSTRB_IS8_xhdl256;
   WLAST_IS8 <= WLAST_IS8_xhdl257;
   WVALID_IS8 <= WVALID_IS8_xhdl258;
   BREADY_IS8 <= BREADY_IS8_xhdl259;
   ARID_IS8 <= ARID_IS8_xhdl260;
   ARADDR_IS8 <= ARADDR_IS8_xhdl261;
   ARLEN_IS8 <= ARLEN_IS8_xhdl262;
   ARSIZE_IS8 <= ARSIZE_IS8_xhdl263;
   ARBURST_IS8 <= ARBURST_IS8_xhdl264;
   ARLOCK_IS8 <= ARLOCK_IS8_xhdl265;
   ARCACHE_IS8 <= ARCACHE_IS8_xhdl266;
   ARPROT_IS8 <= ARPROT_IS8_xhdl267;
   ARVALID_IS8 <= ARVALID_IS8_xhdl268;
   RREADY_IS8 <= RREADY_IS8_xhdl269;
   AWID_IS9 <= AWID_IS9_xhdl270;
   AWADDR_IS9 <= AWADDR_IS9_xhdl271;
   AWLEN_IS9 <= AWLEN_IS9_xhdl272;
   AWSIZE_IS9 <= AWSIZE_IS9_xhdl273;
   AWBURST_IS9 <= AWBURST_IS9_xhdl274;
   AWLOCK_IS9 <= AWLOCK_IS9_xhdl275;
   AWCACHE_IS9 <= AWCACHE_IS9_xhdl276;
   AWPROT_IS9 <= AWPROT_IS9_xhdl277;
   AWVALID_IS9 <= AWVALID_IS9_xhdl278;
   WID_IS9 <= WID_IS9_xhdl279;
   WDATA_IS9 <= WDATA_IS9_xhdl280;
   WSTRB_IS9 <= WSTRB_IS9_xhdl281;
   WLAST_IS9 <= WLAST_IS9_xhdl282;
   WVALID_IS9 <= WVALID_IS9_xhdl283;
   BREADY_IS9 <= BREADY_IS9_xhdl284;
   ARID_IS9 <= ARID_IS9_xhdl285;
   ARADDR_IS9 <= ARADDR_IS9_xhdl286;
   ARLEN_IS9 <= ARLEN_IS9_xhdl287;
   ARSIZE_IS9 <= ARSIZE_IS9_xhdl288;
   ARBURST_IS9 <= ARBURST_IS9_xhdl289;
   ARLOCK_IS9 <= ARLOCK_IS9_xhdl290;
   ARCACHE_IS9 <= ARCACHE_IS9_xhdl291;
   ARPROT_IS9 <= ARPROT_IS9_xhdl292;
   ARVALID_IS9 <= ARVALID_IS9_xhdl293;
   RREADY_IS9 <= RREADY_IS9_xhdl294;
   AWID_IS10 <= AWID_IS10_xhdl295;
   AWADDR_IS10 <= AWADDR_IS10_xhdl296;
   AWLEN_IS10 <= AWLEN_IS10_xhdl297;
   AWSIZE_IS10 <= AWSIZE_IS10_xhdl298;
   AWBURST_IS10 <= AWBURST_IS10_xhdl299;
   AWLOCK_IS10 <= AWLOCK_IS10_xhdl300;
   AWCACHE_IS10 <= AWCACHE_IS10_xhdl301;
   AWPROT_IS10 <= AWPROT_IS10_xhdl302;
   AWVALID_IS10 <= AWVALID_IS10_xhdl303;
   WID_IS10 <= WID_IS10_xhdl304;
   WDATA_IS10 <= WDATA_IS10_xhdl305;
   WSTRB_IS10 <= WSTRB_IS10_xhdl306;
   WLAST_IS10 <= WLAST_IS10_xhdl307;
   WVALID_IS10 <= WVALID_IS10_xhdl308;
   BREADY_IS10 <= BREADY_IS10_xhdl309;
   ARID_IS10 <= ARID_IS10_xhdl310;
   ARADDR_IS10 <= ARADDR_IS10_xhdl311;
   ARLEN_IS10 <= ARLEN_IS10_xhdl312;
   ARSIZE_IS10 <= ARSIZE_IS10_xhdl313;
   ARBURST_IS10 <= ARBURST_IS10_xhdl314;
   ARLOCK_IS10 <= ARLOCK_IS10_xhdl315;
   ARCACHE_IS10 <= ARCACHE_IS10_xhdl316;
   ARPROT_IS10 <= ARPROT_IS10_xhdl317;
   ARVALID_IS10 <= ARVALID_IS10_xhdl318;
   RREADY_IS10 <= RREADY_IS10_xhdl319;
   AWID_IS11 <= AWID_IS11_xhdl320;
   AWADDR_IS11 <= AWADDR_IS11_xhdl321;
   AWLEN_IS11 <= AWLEN_IS11_xhdl322;
   AWSIZE_IS11 <= AWSIZE_IS11_xhdl323;
   AWBURST_IS11 <= AWBURST_IS11_xhdl324;
   AWLOCK_IS11 <= AWLOCK_IS11_xhdl325;
   AWCACHE_IS11 <= AWCACHE_IS11_xhdl326;
   AWPROT_IS11 <= AWPROT_IS11_xhdl327;
   AWVALID_IS11 <= AWVALID_IS11_xhdl328;
   WID_IS11 <= WID_IS11_xhdl329;
   WDATA_IS11 <= WDATA_IS11_xhdl330;
   WSTRB_IS11 <= WSTRB_IS11_xhdl331;
   WLAST_IS11 <= WLAST_IS11_xhdl332;
   WVALID_IS11 <= WVALID_IS11_xhdl333;
   BREADY_IS11 <= BREADY_IS11_xhdl334;
   ARID_IS11 <= ARID_IS11_xhdl335;
   ARADDR_IS11 <= ARADDR_IS11_xhdl336;
   ARLEN_IS11 <= ARLEN_IS11_xhdl337;
   ARSIZE_IS11 <= ARSIZE_IS11_xhdl338;
   ARBURST_IS11 <= ARBURST_IS11_xhdl339;
   ARLOCK_IS11 <= ARLOCK_IS11_xhdl340;
   ARCACHE_IS11 <= ARCACHE_IS11_xhdl341;
   ARPROT_IS11 <= ARPROT_IS11_xhdl342;
   ARVALID_IS11 <= ARVALID_IS11_xhdl343;
   RREADY_IS11 <= RREADY_IS11_xhdl344;
   AWID_IS12 <= AWID_IS12_xhdl345;
   AWADDR_IS12 <= AWADDR_IS12_xhdl346;
   AWLEN_IS12 <= AWLEN_IS12_xhdl347;
   AWSIZE_IS12 <= AWSIZE_IS12_xhdl348;
   AWBURST_IS12 <= AWBURST_IS12_xhdl349;
   AWLOCK_IS12 <= AWLOCK_IS12_xhdl350;
   AWCACHE_IS12 <= AWCACHE_IS12_xhdl351;
   AWPROT_IS12 <= AWPROT_IS12_xhdl352;
   AWVALID_IS12 <= AWVALID_IS12_xhdl353;
   WID_IS12 <= WID_IS12_xhdl354;
   WDATA_IS12 <= WDATA_IS12_xhdl355;
   WSTRB_IS12 <= WSTRB_IS12_xhdl356;
   WLAST_IS12 <= WLAST_IS12_xhdl357;
   WVALID_IS12 <= WVALID_IS12_xhdl358;
   BREADY_IS12 <= BREADY_IS12_xhdl359;
   ARID_IS12 <= ARID_IS12_xhdl360;
   ARADDR_IS12 <= ARADDR_IS12_xhdl361;
   ARLEN_IS12 <= ARLEN_IS12_xhdl362;
   ARSIZE_IS12 <= ARSIZE_IS12_xhdl363;
   ARBURST_IS12 <= ARBURST_IS12_xhdl364;
   ARLOCK_IS12 <= ARLOCK_IS12_xhdl365;
   ARCACHE_IS12 <= ARCACHE_IS12_xhdl366;
   ARPROT_IS12 <= ARPROT_IS12_xhdl367;
   ARVALID_IS12 <= ARVALID_IS12_xhdl368;
   RREADY_IS12 <= RREADY_IS12_xhdl369;
   AWID_IS13 <= AWID_IS13_xhdl370;
   AWADDR_IS13 <= AWADDR_IS13_xhdl371;
   AWLEN_IS13 <= AWLEN_IS13_xhdl372;
   AWSIZE_IS13 <= AWSIZE_IS13_xhdl373;
   AWBURST_IS13 <= AWBURST_IS13_xhdl374;
   AWLOCK_IS13 <= AWLOCK_IS13_xhdl375;
   AWCACHE_IS13 <= AWCACHE_IS13_xhdl376;
   AWPROT_IS13 <= AWPROT_IS13_xhdl377;
   AWVALID_IS13 <= AWVALID_IS13_xhdl378;
   WID_IS13 <= WID_IS13_xhdl379;
   WDATA_IS13 <= WDATA_IS13_xhdl380;
   WSTRB_IS13 <= WSTRB_IS13_xhdl381;
   WLAST_IS13 <= WLAST_IS13_xhdl382;
   WVALID_IS13 <= WVALID_IS13_xhdl383;
   BREADY_IS13 <= BREADY_IS13_xhdl384;
   ARID_IS13 <= ARID_IS13_xhdl385;
   ARADDR_IS13 <= ARADDR_IS13_xhdl386;
   ARLEN_IS13 <= ARLEN_IS13_xhdl387;
   ARSIZE_IS13 <= ARSIZE_IS13_xhdl388;
   ARBURST_IS13 <= ARBURST_IS13_xhdl389;
   ARLOCK_IS13 <= ARLOCK_IS13_xhdl390;
   ARCACHE_IS13 <= ARCACHE_IS13_xhdl391;
   ARPROT_IS13 <= ARPROT_IS13_xhdl392;
   ARVALID_IS13 <= ARVALID_IS13_xhdl393;
   RREADY_IS13 <= RREADY_IS13_xhdl394;
   AWID_IS14 <= AWID_IS14_xhdl395;
   AWADDR_IS14 <= AWADDR_IS14_xhdl396;
   AWLEN_IS14 <= AWLEN_IS14_xhdl397;
   AWSIZE_IS14 <= AWSIZE_IS14_xhdl398;
   AWBURST_IS14 <= AWBURST_IS14_xhdl399;
   AWLOCK_IS14 <= AWLOCK_IS14_xhdl400;
   AWCACHE_IS14 <= AWCACHE_IS14_xhdl401;
   AWPROT_IS14 <= AWPROT_IS14_xhdl402;
   AWVALID_IS14 <= AWVALID_IS14_xhdl403;
   WID_IS14 <= WID_IS14_xhdl404;
   WDATA_IS14 <= WDATA_IS14_xhdl405;
   WSTRB_IS14 <= WSTRB_IS14_xhdl406;
   WLAST_IS14 <= WLAST_IS14_xhdl407;
   WVALID_IS14 <= WVALID_IS14_xhdl408;
   BREADY_IS14 <= BREADY_IS14_xhdl409;
   ARID_IS14 <= ARID_IS14_xhdl410;
   ARADDR_IS14 <= ARADDR_IS14_xhdl411;
   ARLEN_IS14 <= ARLEN_IS14_xhdl412;
   ARSIZE_IS14 <= ARSIZE_IS14_xhdl413;
   ARBURST_IS14 <= ARBURST_IS14_xhdl414;
   ARLOCK_IS14 <= ARLOCK_IS14_xhdl415;
   ARCACHE_IS14 <= ARCACHE_IS14_xhdl416;
   ARPROT_IS14 <= ARPROT_IS14_xhdl417;
   ARVALID_IS14 <= ARVALID_IS14_xhdl418;
   RREADY_IS14 <= RREADY_IS14_xhdl419;
   AWID_IS15 <= AWID_IS15_xhdl420;
   AWADDR_IS15 <= AWADDR_IS15_xhdl421;
   AWLEN_IS15 <= AWLEN_IS15_xhdl422;
   AWSIZE_IS15 <= AWSIZE_IS15_xhdl423;
   AWBURST_IS15 <= AWBURST_IS15_xhdl424;
   AWLOCK_IS15 <= AWLOCK_IS15_xhdl425;
   AWCACHE_IS15 <= AWCACHE_IS15_xhdl426;
   AWPROT_IS15 <= AWPROT_IS15_xhdl427;
   AWVALID_IS15 <= AWVALID_IS15_xhdl428;
   WID_IS15 <= WID_IS15_xhdl429;
   WDATA_IS15 <= WDATA_IS15_xhdl430;
   WSTRB_IS15 <= WSTRB_IS15_xhdl431;
   WLAST_IS15 <= WLAST_IS15_xhdl432;
   WVALID_IS15 <= WVALID_IS15_xhdl433;
   BREADY_IS15 <= BREADY_IS15_xhdl434;
   ARID_IS15 <= ARID_IS15_xhdl435;
   ARADDR_IS15 <= ARADDR_IS15_xhdl436;
   ARLEN_IS15 <= ARLEN_IS15_xhdl437;
   ARSIZE_IS15 <= ARSIZE_IS15_xhdl438;
   ARBURST_IS15 <= ARBURST_IS15_xhdl439;
   ARLOCK_IS15 <= ARLOCK_IS15_xhdl440;
   ARCACHE_IS15 <= ARCACHE_IS15_xhdl441;
   ARPROT_IS15 <= ARPROT_IS15_xhdl442;
   ARVALID_IS15 <= ARVALID_IS15_xhdl443;
   RREADY_IS15 <= RREADY_IS15_xhdl444;
   AWID_IS16 <= AWID_IS16_xhdl445;
   AWADDR_IS16 <= AWADDR_IS16_xhdl446;
   AWLEN_IS16 <= AWLEN_IS16_xhdl447;
   AWSIZE_IS16 <= AWSIZE_IS16_xhdl448;
   AWBURST_IS16 <= AWBURST_IS16_xhdl449;
   AWLOCK_IS16 <= AWLOCK_IS16_xhdl450;
   AWCACHE_IS16 <= AWCACHE_IS16_xhdl451;
   AWPROT_IS16 <= AWPROT_IS16_xhdl452;
   AWVALID_IS16 <= AWVALID_IS16_xhdl453;
   WID_IS16 <= WID_IS16_xhdl454;
   WDATA_IS16 <= WDATA_IS16_xhdl455;
   WSTRB_IS16 <= WSTRB_IS16_xhdl456;
   WLAST_IS16 <= WLAST_IS16_xhdl457;
   WVALID_IS16 <= WVALID_IS16_xhdl458;
   BREADY_IS16 <= BREADY_IS16_xhdl459;
   ARID_IS16 <= ARID_IS16_xhdl460;
   ARADDR_IS16 <= ARADDR_IS16_xhdl461;
   ARLEN_IS16 <= ARLEN_IS16_xhdl462;
   ARSIZE_IS16 <= ARSIZE_IS16_xhdl463;
   ARBURST_IS16 <= ARBURST_IS16_xhdl464;
   ARLOCK_IS16 <= ARLOCK_IS16_xhdl465;
   ARCACHE_IS16 <= ARCACHE_IS16_xhdl466;
   ARPROT_IS16 <= ARPROT_IS16_xhdl467;
   ARVALID_IS16 <= ARVALID_IS16_xhdl468;
   RREADY_IS16 <= RREADY_IS16_xhdl469;
   temp_xhdl470 <= "00" & BID_IM0_int(ID_WIDTH - 1 DOWNTO 0) WHEN 
   (BID_IM0_int(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH-2) = "00") ELSE 
   (OTHERS => '0');
   BID_IM0_xhdl3 <= temp_xhdl470;
   temp_xhdl471 <= "01" & BID_IM1_int(ID_WIDTH - 1 DOWNTO 0) WHEN 
   (BID_IM1_int(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH-2) = "01") ELSE 
   (OTHERS => '0');
   BID_IM1_xhdl14 <= temp_xhdl471;
   temp_xhdl472 <= "10" & BID_IM2_int(ID_WIDTH - 1 DOWNTO 0) WHEN 
   (BID_IM2_int(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH-2) = "10") ELSE 
   (OTHERS => '0');
   BID_IM2_xhdl25 <= temp_xhdl472;
   temp_xhdl473 <= "10" & BID_IM3_int(ID_WIDTH - 1 DOWNTO 0) WHEN 
   (BID_IM3_int(BASE_ID_WIDTH + ID_WIDTH - 3 DOWNTO ID_WIDTH-2) = "11") ELSE 
   (OTHERS => '0');
   BID_IM3_xhdl36 <= temp_xhdl473 ;
   temp_xhdl474 <= BVALID_IM0_int WHEN (BID_IM0_int(BASE_ID_WIDTH + ID_WIDTH - 
   3 DOWNTO ID_WIDTH-2) = "00") ELSE '0';
   BVALID_IM0_xhdl5 <= temp_xhdl474 ;
   temp_xhdl475 <= BVALID_IM1_int WHEN (BID_IM1_int(BASE_ID_WIDTH + ID_WIDTH - 
   3 DOWNTO ID_WIDTH-2) = "01") ELSE '0';
   BVALID_IM1_xhdl16 <= temp_xhdl475 ;
   temp_xhdl476 <= BVALID_IM2_int WHEN (BID_IM2_int(BASE_ID_WIDTH + ID_WIDTH - 
   3 DOWNTO ID_WIDTH-2) = "10") ELSE '0';
   BVALID_IM2_xhdl27 <= temp_xhdl476 ;
   temp_xhdl477 <= BVALID_IM3_int WHEN (BID_IM3_int(BASE_ID_WIDTH + ID_WIDTH - 
   3 DOWNTO ID_WIDTH-2) = "11") ELSE '0';
   BVALID_IM3_xhdl38 <= temp_xhdl477 ;
   temp_xhdl478 <= BRESP_IM0_int WHEN (BID_IM0_int(BASE_ID_WIDTH + ID_WIDTH - 3 
   DOWNTO ID_WIDTH-2) = "00") ELSE "00";
   BRESP_IM0_xhdl4 <= temp_xhdl478 ;
   temp_xhdl479 <= BRESP_IM1_int WHEN (BID_IM1_int(BASE_ID_WIDTH + ID_WIDTH - 3 
   DOWNTO ID_WIDTH-2) = "01") ELSE "00";
   BRESP_IM1_xhdl15 <= temp_xhdl479 ;
   temp_xhdl480 <= BRESP_IM2_int WHEN (BID_IM2_int(BASE_ID_WIDTH + ID_WIDTH - 3 
   DOWNTO ID_WIDTH-2) = "10") ELSE "00";
   BRESP_IM2_xhdl26 <= temp_xhdl480 ;
   temp_xhdl481 <= BRESP_IM3_int WHEN (BID_IM3_int(BASE_ID_WIDTH + ID_WIDTH - 3 
   DOWNTO ID_WIDTH-2) = "11") ELSE "00";
   BRESP_IM3_xhdl37 <= temp_xhdl481 ;
   RID_IM0_xhdl7 <= RID_IM0_int ;
   RID_IM1_xhdl18 <= RID_IM1_int ;
   RID_IM2_xhdl29 <= RID_IM2_int ;
   RID_IM3_xhdl40 <= RID_IM3_int ;
   RLAST_IM0_xhdl10 <= RLAST_IM0_int ;
   RLAST_IM1_xhdl21 <= RLAST_IM1_int ;
   RLAST_IM2_xhdl32 <= RLAST_IM2_int ;
   RLAST_IM3_xhdl43 <= RLAST_IM3_int ;
   RDATA_IM0_xhdl8 <= RDATA_IM0_int ;
   RDATA_IM1_xhdl19 <= RDATA_IM1_int ;
   RDATA_IM2_xhdl30 <= RDATA_IM2_int ;
   RDATA_IM3_xhdl41 <= RDATA_IM3_int ;
   RVALID_IM0_xhdl11 <= RVALID_IM0_int ;
   RVALID_IM1_xhdl22 <= RVALID_IM1_int ;
   RVALID_IM2_xhdl33 <= RVALID_IM2_int ;
   RVALID_IM3_xhdl44 <= RVALID_IM3_int ;
   RRESP_IM0_xhdl9 <= RRESP_IM0_int ;
   RRESP_IM1_xhdl20 <= RRESP_IM1_int ;
   RRESP_IM2_xhdl31 <= RRESP_IM2_int ;
   RRESP_IM3_xhdl42 <= RRESP_IM3_int ;
   
   -- ---------
   --Instances
   -- ---------
   inst_matrix_m0 : axi_matrix_m 
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
         RID_IM => RID_IM0_int,
         RDATA_IM => RDATA_IM0_int,
         RRESP_IM => RRESP_IM0_int,
         RLAST_IM => RLAST_IM0_int,
         RVALID_IM => RVALID_IM0_int,
         RREADY_MI => RREADY_MI0,
         BID_IM => BID_IM0_int,
         BVALID_IM => BVALID_IM0_int,
         BRESP_IM => BRESP_IM0_int,
         BREADY_MI => BREADY_MI0,
         RID_SI0 => RID_SI0,
         RVALID_SI0 => RVALID_SI0,
         RRESP_SI0 => RRESP_SI0,
         RDATA_SI0 => RDATA_SI0,
         RLAST_SI0 => RLAST_SI0,
         BID_SI0 => BID_SI0,
         BVALID_SI0 => BVALID_SI0,
         BRESP_SI0 => BRESP_SI0,
         RID_SI1 => RID_SI1,
         RVALID_SI1 => RVALID_SI1,
         RRESP_SI1 => RRESP_SI1,
         RDATA_SI1 => RDATA_SI1,
         RLAST_SI1 => RLAST_SI1,
         BID_SI1 => BID_SI1,
         BVALID_SI1 => BVALID_SI1,
         BRESP_SI1 => BRESP_SI1,
         RID_SI2 => RID_SI2,
         RVALID_SI2 => RVALID_SI2,
         RRESP_SI2 => RRESP_SI2,
         RDATA_SI2 => RDATA_SI2,
         RLAST_SI2 => RLAST_SI2,
         BID_SI2 => BID_SI2,
         BVALID_SI2 => BVALID_SI2,
         BRESP_SI2 => BRESP_SI2,
         RID_SI3 => RID_SI3,
         RVALID_SI3 => RVALID_SI3,
         RRESP_SI3 => RRESP_SI3,
         RDATA_SI3 => RDATA_SI3,
         RLAST_SI3 => RLAST_SI3,
         BID_SI3 => BID_SI3,
         BVALID_SI3 => BVALID_SI3,
         BRESP_SI3 => BRESP_SI3,
         RID_SI4 => RID_SI4,
         RVALID_SI4 => RVALID_SI4,
         RRESP_SI4 => RRESP_SI4,
         RDATA_SI4 => RDATA_SI4,
         RLAST_SI4 => RLAST_SI4,
         BID_SI4 => BID_SI4,
         BVALID_SI4 => BVALID_SI4,
         BRESP_SI4 => BRESP_SI4,
         RID_SI5 => RID_SI5,
         RVALID_SI5 => RVALID_SI5,
         RRESP_SI5 => RRESP_SI5,
         RDATA_SI5 => RDATA_SI5,
         RLAST_SI5 => RLAST_SI5,
         BID_SI5 => BID_SI5,
         BVALID_SI5 => BVALID_SI5,
         BRESP_SI5 => BRESP_SI5,
         RID_SI6 => RID_SI6,
         RVALID_SI6 => RVALID_SI6,
         RRESP_SI6 => RRESP_SI6,
         RDATA_SI6 => RDATA_SI6,
         RLAST_SI6 => RLAST_SI6,
         BID_SI6 => BID_SI6,
         BVALID_SI6 => BVALID_SI6,
         BRESP_SI6 => BRESP_SI6,
         RID_SI7 => RID_SI7,
         RVALID_SI7 => RVALID_SI7,
         RRESP_SI7 => RRESP_SI7,
         RDATA_SI7 => RDATA_SI7,
         RLAST_SI7 => RLAST_SI7,
         BID_SI7 => BID_SI7,
         BVALID_SI7 => BVALID_SI7,
         BRESP_SI7 => BRESP_SI7,
         RID_SI8 => RID_SI8,
         RVALID_SI8 => RVALID_SI8,
         RRESP_SI8 => RRESP_SI8,
         RDATA_SI8 => RDATA_SI8,
         RLAST_SI8 => RLAST_SI8,
         BID_SI8 => BID_SI8,
         BVALID_SI8 => BVALID_SI8,
         BRESP_SI8 => BRESP_SI8,
         RID_SI9 => RID_SI9,
         RVALID_SI9 => RVALID_SI9,
         RRESP_SI9 => RRESP_SI9,
         RDATA_SI9 => RDATA_SI9,
         RLAST_SI9 => RLAST_SI9,
         BID_SI9 => BID_SI9,
         BVALID_SI9 => BVALID_SI9,
         BRESP_SI9 => BRESP_SI9,
         RID_SI10 => RID_SI10,
         RVALID_SI10 => RVALID_SI10,
         RRESP_SI10 => RRESP_SI10,
         RDATA_SI10 => RDATA_SI10,
         RLAST_SI10 => RLAST_SI10,
         BID_SI10 => BID_SI10,
         BVALID_SI10 => BVALID_SI10,
         BRESP_SI10 => BRESP_SI10,
         RID_SI11 => RID_SI11,
         RVALID_SI11 => RVALID_SI11,
         RRESP_SI11 => RRESP_SI11,
         RDATA_SI11 => RDATA_SI11,
         RLAST_SI11 => RLAST_SI11,
         BID_SI11 => BID_SI11,
         BVALID_SI11 => BVALID_SI11,
         BRESP_SI11 => BRESP_SI11,
         RID_SI12 => RID_SI12,
         RVALID_SI12 => RVALID_SI12,
         RRESP_SI12 => RRESP_SI12,
         RDATA_SI12 => RDATA_SI12,
         RLAST_SI12 => RLAST_SI12,
         BID_SI12 => BID_SI12,
         BVALID_SI12 => BVALID_SI12,
         BRESP_SI12 => BRESP_SI12,
         RID_SI13 => RID_SI13,
         RVALID_SI13 => RVALID_SI13,
         RRESP_SI13 => RRESP_SI13,
         RDATA_SI13 => RDATA_SI13,
         RLAST_SI13 => RLAST_SI13,
         BID_SI13 => BID_SI13,
         BVALID_SI13 => BVALID_SI13,
         BRESP_SI13 => BRESP_SI13,
         RID_SI14 => RID_SI14,
         RVALID_SI14 => RVALID_SI14,
         RRESP_SI14 => RRESP_SI14,
         RDATA_SI14 => RDATA_SI14,
         RLAST_SI14 => RLAST_SI14,
         BID_SI14 => BID_SI14,
         BVALID_SI14 => BVALID_SI14,
         BRESP_SI14 => BRESP_SI14,
         RID_SI15 => RID_SI15,
         RVALID_SI15 => RVALID_SI15,
         RRESP_SI15 => RRESP_SI15,
         RDATA_SI15 => RDATA_SI15,
         RLAST_SI15 => RLAST_SI15,
         BID_SI15 => BID_SI15,
         BVALID_SI15 => BVALID_SI15,
         BRESP_SI15 => BRESP_SI15,
         RID_SI16 => RID_SI16,
         RVALID_SI16 => RVALID_SI16,
         RRESP_SI16 => RRESP_SI16,
         RDATA_SI16 => RDATA_SI16,
         RLAST_SI16 => RLAST_SI16,
         BID_SI16 => BID_SI16,
         BVALID_SI16 => BVALID_SI16,
         BRESP_SI16 => BRESP_SI16,
         RREADY_IS0 => RREADY_M0IS0,
         RREADY_IS1 => RREADY_M0IS1,
         RREADY_IS2 => RREADY_M0IS2,
         RREADY_IS3 => RREADY_M0IS3,
         RREADY_IS4 => RREADY_M0IS4,
         RREADY_IS5 => RREADY_M0IS5,
         RREADY_IS6 => RREADY_M0IS6,
         RREADY_IS7 => RREADY_M0IS7,
         RREADY_IS8 => RREADY_M0IS8,
         RREADY_IS9 => RREADY_M0IS9,
         RREADY_IS10 => RREADY_M0IS10,
         RREADY_IS11 => RREADY_M0IS11,
         RREADY_IS12 => RREADY_M0IS12,
         RREADY_IS13 => RREADY_M0IS13,
         RREADY_IS14 => RREADY_M0IS14,
         RREADY_IS15 => RREADY_M0IS15,
         RREADY_IS16 => RREADY_M0IS16,
         BREADY_IS0 => BREADY_M0IS0,
         BREADY_IS1 => BREADY_M0IS1,
         BREADY_IS2 => BREADY_M0IS2,
         BREADY_IS3 => BREADY_M0IS3,
         BREADY_IS4 => BREADY_M0IS4,
         BREADY_IS5 => BREADY_M0IS5,
         BREADY_IS6 => BREADY_M0IS6,
         BREADY_IS7 => BREADY_M0IS7,
         BREADY_IS8 => BREADY_M0IS8,
         BREADY_IS9 => BREADY_M0IS9,
         BREADY_IS10 => BREADY_M0IS10,
         BREADY_IS11 => BREADY_M0IS11,
         BREADY_IS12 => BREADY_M0IS12,
         BREADY_IS13 => BREADY_M0IS13,
         BREADY_IS14 => BREADY_M0IS14,
         BREADY_IS15 => BREADY_M0IS15,
         BREADY_IS16 => BREADY_M0IS16);   
   
   
   L1: IF (NUM_MASTER_SLOT > 1) GENERATE

      inst_matrix_m1 : axi_matrix_m 
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
            RID_IM => RID_IM1_int,
            RDATA_IM => RDATA_IM1_int,
            RRESP_IM => RRESP_IM1_int,
            RLAST_IM => RLAST_IM1_int,
            RVALID_IM => RVALID_IM1_int,
            RREADY_MI => RREADY_MI1,
            BID_IM => BID_IM1_int,
            BVALID_IM => BVALID_IM1_int,
            BRESP_IM => BRESP_IM1_int,
            BREADY_MI => BREADY_MI1,
            RID_SI0 => RID_SI0,
            RVALID_SI0 => RVALID_SI0,
            RRESP_SI0 => RRESP_SI0,
            RDATA_SI0 => RDATA_SI0,
            RLAST_SI0 => RLAST_SI0,
            BID_SI0 => BID_SI0,
            BVALID_SI0 => BVALID_SI0,
            BRESP_SI0 => BRESP_SI0,
            RID_SI1 => RID_SI1,
            RVALID_SI1 => RVALID_SI1,
            RRESP_SI1 => RRESP_SI1,
            RDATA_SI1 => RDATA_SI1,
            RLAST_SI1 => RLAST_SI1,
            BID_SI1 => BID_SI1,
            BVALID_SI1 => BVALID_SI1,
            BRESP_SI1 => BRESP_SI1,
            RID_SI2 => RID_SI2,
            RVALID_SI2 => RVALID_SI2,
            RRESP_SI2 => RRESP_SI2,
            RDATA_SI2 => RDATA_SI2,
            RLAST_SI2 => RLAST_SI2,
            BID_SI2 => BID_SI2,
            BVALID_SI2 => BVALID_SI2,
            BRESP_SI2 => BRESP_SI2,
            RID_SI3 => RID_SI3,
            RVALID_SI3 => RVALID_SI3,
            RRESP_SI3 => RRESP_SI3,
            RDATA_SI3 => RDATA_SI3,
            RLAST_SI3 => RLAST_SI3,
            BID_SI3 => BID_SI3,
            BVALID_SI3 => BVALID_SI3,
            BRESP_SI3 => BRESP_SI3,
            RID_SI4 => RID_SI4,
            RVALID_SI4 => RVALID_SI4,
            RRESP_SI4 => RRESP_SI4,
            RDATA_SI4 => RDATA_SI4,
            RLAST_SI4 => RLAST_SI4,
            BID_SI4 => BID_SI4,
            BVALID_SI4 => BVALID_SI4,
            BRESP_SI4 => BRESP_SI4,
            RID_SI5 => RID_SI5,
            RVALID_SI5 => RVALID_SI5,
            RRESP_SI5 => RRESP_SI5,
            RDATA_SI5 => RDATA_SI5,
            RLAST_SI5 => RLAST_SI5,
            BID_SI5 => BID_SI5,
            BVALID_SI5 => BVALID_SI5,
            BRESP_SI5 => BRESP_SI5,
            RID_SI6 => RID_SI6,
            RVALID_SI6 => RVALID_SI6,
            RRESP_SI6 => RRESP_SI6,
            RDATA_SI6 => RDATA_SI6,
            RLAST_SI6 => RLAST_SI6,
            BID_SI6 => BID_SI6,
            BVALID_SI6 => BVALID_SI6,
            BRESP_SI6 => BRESP_SI6,
            RID_SI7 => RID_SI7,
            RVALID_SI7 => RVALID_SI7,
            RRESP_SI7 => RRESP_SI7,
            RDATA_SI7 => RDATA_SI7,
            RLAST_SI7 => RLAST_SI7,
            BID_SI7 => BID_SI7,
            BVALID_SI7 => BVALID_SI7,
            BRESP_SI7 => BRESP_SI7,
            RID_SI8 => RID_SI8,
            RVALID_SI8 => RVALID_SI8,
            RRESP_SI8 => RRESP_SI8,
            RDATA_SI8 => RDATA_SI8,
            RLAST_SI8 => RLAST_SI8,
            BID_SI8 => BID_SI8,
            BVALID_SI8 => BVALID_SI8,
            BRESP_SI8 => BRESP_SI8,
            RID_SI9 => RID_SI9,
            RVALID_SI9 => RVALID_SI9,
            RRESP_SI9 => RRESP_SI9,
            RDATA_SI9 => RDATA_SI9,
            RLAST_SI9 => RLAST_SI9,
            BID_SI9 => BID_SI9,
            BVALID_SI9 => BVALID_SI9,
            BRESP_SI9 => BRESP_SI9,
            RID_SI10 => RID_SI10,
            RVALID_SI10 => RVALID_SI10,
            RRESP_SI10 => RRESP_SI10,
            RDATA_SI10 => RDATA_SI10,
            RLAST_SI10 => RLAST_SI10,
            BID_SI10 => BID_SI10,
            BVALID_SI10 => BVALID_SI10,
            BRESP_SI10 => BRESP_SI10,
            RID_SI11 => RID_SI11,
            RVALID_SI11 => RVALID_SI11,
            RRESP_SI11 => RRESP_SI11,
            RDATA_SI11 => RDATA_SI11,
            RLAST_SI11 => RLAST_SI11,
            BID_SI11 => BID_SI11,
            BVALID_SI11 => BVALID_SI11,
            BRESP_SI11 => BRESP_SI11,
            RID_SI12 => RID_SI12,
            RVALID_SI12 => RVALID_SI12,
            RRESP_SI12 => RRESP_SI12,
            RDATA_SI12 => RDATA_SI12,
            RLAST_SI12 => RLAST_SI12,
            BID_SI12 => BID_SI12,
            BVALID_SI12 => BVALID_SI12,
            BRESP_SI12 => BRESP_SI12,
            RID_SI13 => RID_SI13,
            RVALID_SI13 => RVALID_SI13,
            RRESP_SI13 => RRESP_SI13,
            RDATA_SI13 => RDATA_SI13,
            RLAST_SI13 => RLAST_SI13,
            BID_SI13 => BID_SI13,
            BVALID_SI13 => BVALID_SI13,
            BRESP_SI13 => BRESP_SI13,
            RID_SI14 => RID_SI14,
            RVALID_SI14 => RVALID_SI14,
            RRESP_SI14 => RRESP_SI14,
            RDATA_SI14 => RDATA_SI14,
            RLAST_SI14 => RLAST_SI14,
            BID_SI14 => BID_SI14,
            BVALID_SI14 => BVALID_SI14,
            BRESP_SI14 => BRESP_SI14,
            RID_SI15 => RID_SI15,
            RVALID_SI15 => RVALID_SI15,
            RRESP_SI15 => RRESP_SI15,
            RDATA_SI15 => RDATA_SI15,
            RLAST_SI15 => RLAST_SI15,
            BID_SI15 => BID_SI15,
            BVALID_SI15 => BVALID_SI15,
            BRESP_SI15 => BRESP_SI15,
            RID_SI16 => RID_SI16,
            RVALID_SI16 => RVALID_SI16,
            RRESP_SI16 => RRESP_SI16,
            RDATA_SI16 => RDATA_SI16,
            RLAST_SI16 => RLAST_SI16,
            BID_SI16 => BID_SI16,
            BVALID_SI16 => BVALID_SI16,
            BRESP_SI16 => BRESP_SI16,
            RREADY_IS0 => RREADY_M1IS0,
            RREADY_IS1 => RREADY_M1IS1,
            RREADY_IS2 => RREADY_M1IS2,
            RREADY_IS3 => RREADY_M1IS3,
            RREADY_IS4 => RREADY_M1IS4,
            RREADY_IS5 => RREADY_M1IS5,
            RREADY_IS6 => RREADY_M1IS6,
            RREADY_IS7 => RREADY_M1IS7,
            RREADY_IS8 => RREADY_M1IS8,
            RREADY_IS9 => RREADY_M1IS9,
            RREADY_IS10 => RREADY_M1IS10,
            RREADY_IS11 => RREADY_M1IS11,
            RREADY_IS12 => RREADY_M1IS12,
            RREADY_IS13 => RREADY_M1IS13,
            RREADY_IS14 => RREADY_M1IS14,
            RREADY_IS15 => RREADY_M1IS15,
            RREADY_IS16 => RREADY_M1IS16,
            BREADY_IS0 => BREADY_M1IS0,
            BREADY_IS1 => BREADY_M1IS1,
            BREADY_IS2 => BREADY_M1IS2,
            BREADY_IS3 => BREADY_M1IS3,
            BREADY_IS4 => BREADY_M1IS4,
            BREADY_IS5 => BREADY_M1IS5,
            BREADY_IS6 => BREADY_M1IS6,
            BREADY_IS7 => BREADY_M1IS7,
            BREADY_IS8 => BREADY_M1IS8,
            BREADY_IS9 => BREADY_M1IS9,
            BREADY_IS10 => BREADY_M1IS10,
            BREADY_IS11 => BREADY_M1IS11,
            BREADY_IS12 => BREADY_M1IS12,
            BREADY_IS13 => BREADY_M1IS13,
            BREADY_IS14 => BREADY_M1IS14,
            BREADY_IS15 => BREADY_M1IS15,
            BREADY_IS16 => BREADY_M1IS16);   
   END GENERATE L1;
   
   L2: IF (NUM_MASTER_SLOT > 2) GENERATE
      inst_matrix_m2 : axi_matrix_m 
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
            RID_IM => RID_IM2_int,
            RDATA_IM => RDATA_IM2_int,
            RRESP_IM => RRESP_IM2_int,
            RLAST_IM => RLAST_IM2_int,
            RVALID_IM => RVALID_IM2_int,
            RREADY_MI => RREADY_MI2,
            BID_IM => BID_IM2_int,
            BRESP_IM => BRESP_IM2_int,
            BVALID_IM => BVALID_IM2_int,
            BREADY_MI => BREADY_MI2,
            RID_SI0 => RID_SI0,
            RVALID_SI0 => RVALID_SI0,
            RRESP_SI0 => RRESP_SI0,
            RDATA_SI0 => RDATA_SI0,
            RLAST_SI0 => RLAST_SI0,
            BID_SI0 => BID_SI0,
            BVALID_SI0 => BVALID_SI0,
            BRESP_SI0 => BRESP_SI0,
            RID_SI1 => RID_SI1,
            RVALID_SI1 => RVALID_SI1,
            RRESP_SI1 => RRESP_SI1,
            RDATA_SI1 => RDATA_SI1,
            RLAST_SI1 => RLAST_SI1,
            BID_SI1 => BID_SI1,
            BVALID_SI1 => BVALID_SI1,
            BRESP_SI1 => BRESP_SI1,
            RID_SI2 => RID_SI2,
            RVALID_SI2 => RVALID_SI2,
            RRESP_SI2 => RRESP_SI2,
            RDATA_SI2 => RDATA_SI2,
            RLAST_SI2 => RLAST_SI2,
            BID_SI2 => BID_SI2,
            BVALID_SI2 => BVALID_SI2,
            BRESP_SI2 => BRESP_SI2,
            RID_SI3 => RID_SI3,
            RVALID_SI3 => RVALID_SI3,
            RRESP_SI3 => RRESP_SI3,
            RDATA_SI3 => RDATA_SI3,
            RLAST_SI3 => RLAST_SI3,
            BID_SI3 => BID_SI3,
            BVALID_SI3 => BVALID_SI3,
            BRESP_SI3 => BRESP_SI3,
            RID_SI4 => RID_SI4,
            RVALID_SI4 => RVALID_SI4,
            RRESP_SI4 => RRESP_SI4,
            RDATA_SI4 => RDATA_SI4,
            RLAST_SI4 => RLAST_SI4,
            BID_SI4 => BID_SI4,
            BVALID_SI4 => BVALID_SI4,
            BRESP_SI4 => BRESP_SI4,
            RID_SI5 => RID_SI5,
            RVALID_SI5 => RVALID_SI5,
            RRESP_SI5 => RRESP_SI5,
            RDATA_SI5 => RDATA_SI5,
            RLAST_SI5 => RLAST_SI5,
            BID_SI5 => BID_SI5,
            BVALID_SI5 => BVALID_SI5,
            BRESP_SI5 => BRESP_SI5,
            RID_SI6 => RID_SI6,
            RVALID_SI6 => RVALID_SI6,
            RRESP_SI6 => RRESP_SI6,
            RDATA_SI6 => RDATA_SI6,
            RLAST_SI6 => RLAST_SI6,
            BID_SI6 => BID_SI6,
            BVALID_SI6 => BVALID_SI6,
            BRESP_SI6 => BRESP_SI6,
            RID_SI7 => RID_SI7,
            RVALID_SI7 => RVALID_SI7,
            RRESP_SI7 => RRESP_SI7,
            RDATA_SI7 => RDATA_SI7,
            RLAST_SI7 => RLAST_SI7,
            BID_SI7 => BID_SI7,
            BVALID_SI7 => BVALID_SI7,
            BRESP_SI7 => BRESP_SI7,
            RID_SI8 => RID_SI8,
            RVALID_SI8 => RVALID_SI8,
            RRESP_SI8 => RRESP_SI8,
            RDATA_SI8 => RDATA_SI8,
            RLAST_SI8 => RLAST_SI8,
            BID_SI8 => BID_SI8,
            BVALID_SI8 => BVALID_SI8,
            BRESP_SI8 => BRESP_SI8,
            RID_SI9 => RID_SI9,
            RVALID_SI9 => RVALID_SI9,
            RRESP_SI9 => RRESP_SI9,
            RDATA_SI9 => RDATA_SI9,
            RLAST_SI9 => RLAST_SI9,
            BID_SI9 => BID_SI9,
            BVALID_SI9 => BVALID_SI9,
            BRESP_SI9 => BRESP_SI9,
            RID_SI10 => RID_SI10,
            RVALID_SI10 => RVALID_SI10,
            RRESP_SI10 => RRESP_SI10,
            RDATA_SI10 => RDATA_SI10,
            RLAST_SI10 => RLAST_SI10,
            BID_SI10 => BID_SI10,
            BVALID_SI10 => BVALID_SI10,
            BRESP_SI10 => BRESP_SI10,
            RID_SI11 => RID_SI11,
            RVALID_SI11 => RVALID_SI11,
            RRESP_SI11 => RRESP_SI11,
            RDATA_SI11 => RDATA_SI11,
            RLAST_SI11 => RLAST_SI11,
            BID_SI11 => BID_SI11,
            BVALID_SI11 => BVALID_SI11,
            BRESP_SI11 => BRESP_SI11,
            RID_SI12 => RID_SI12,
            RVALID_SI12 => RVALID_SI12,
            RRESP_SI12 => RRESP_SI12,
            RDATA_SI12 => RDATA_SI12,
            RLAST_SI12 => RLAST_SI12,
            BID_SI12 => BID_SI12,
            BVALID_SI12 => BVALID_SI12,
            BRESP_SI12 => BRESP_SI12,
            RID_SI13 => RID_SI13,
            RVALID_SI13 => RVALID_SI13,
            RRESP_SI13 => RRESP_SI13,
            RDATA_SI13 => RDATA_SI13,
            RLAST_SI13 => RLAST_SI13,
            BID_SI13 => BID_SI13,
            BVALID_SI13 => BVALID_SI13,
            BRESP_SI13 => BRESP_SI13,
            RID_SI14 => RID_SI14,
            RVALID_SI14 => RVALID_SI14,
            RRESP_SI14 => RRESP_SI14,
            RDATA_SI14 => RDATA_SI14,
            RLAST_SI14 => RLAST_SI14,
            BID_SI14 => BID_SI14,
            BVALID_SI14 => BVALID_SI14,
            BRESP_SI14 => BRESP_SI14,
            RID_SI15 => RID_SI15,
            RVALID_SI15 => RVALID_SI15,
            RRESP_SI15 => RRESP_SI15,
            RDATA_SI15 => RDATA_SI15,
            RLAST_SI15 => RLAST_SI15,
            BID_SI15 => BID_SI15,
            BVALID_SI15 => BVALID_SI15,
            BRESP_SI15 => BRESP_SI15,
            RID_SI16 => RID_SI16,
            RVALID_SI16 => RVALID_SI16,
            RRESP_SI16 => RRESP_SI16,
            RDATA_SI16 => RDATA_SI16,
            RLAST_SI16 => RLAST_SI16,
            BID_SI16 => BID_SI16,
            BVALID_SI16 => BVALID_SI16,
            BRESP_SI16 => BRESP_SI16,
            RREADY_IS0 => RREADY_M2IS0,
            RREADY_IS1 => RREADY_M2IS1,
            RREADY_IS2 => RREADY_M2IS2,
            RREADY_IS3 => RREADY_M2IS3,
            RREADY_IS4 => RREADY_M2IS4,
            RREADY_IS5 => RREADY_M2IS5,
            RREADY_IS6 => RREADY_M2IS6,
            RREADY_IS7 => RREADY_M2IS7,
            RREADY_IS8 => RREADY_M2IS8,
            RREADY_IS9 => RREADY_M2IS9,
            RREADY_IS10 => RREADY_M2IS10,
            RREADY_IS11 => RREADY_M2IS11,
            RREADY_IS12 => RREADY_M2IS12,
            RREADY_IS13 => RREADY_M2IS13,
            RREADY_IS14 => RREADY_M2IS14,
            RREADY_IS15 => RREADY_M2IS15,
            RREADY_IS16 => RREADY_M2IS16,
            BREADY_IS0 => BREADY_M2IS0,
            BREADY_IS1 => BREADY_M2IS1,
            BREADY_IS2 => BREADY_M2IS2,
            BREADY_IS3 => BREADY_M2IS3,
            BREADY_IS4 => BREADY_M2IS4,
            BREADY_IS5 => BREADY_M2IS5,
            BREADY_IS6 => BREADY_M2IS6,
            BREADY_IS7 => BREADY_M2IS7,
            BREADY_IS8 => BREADY_M2IS8,
            BREADY_IS9 => BREADY_M2IS9,
            BREADY_IS10 => BREADY_M2IS10,
            BREADY_IS11 => BREADY_M2IS11,
            BREADY_IS12 => BREADY_M2IS12,
            BREADY_IS13 => BREADY_M2IS13,
            BREADY_IS14 => BREADY_M2IS14,
            BREADY_IS15 => BREADY_M2IS15,
            BREADY_IS16 => BREADY_M2IS16);   
   END GENERATE L2;
   
   L3: IF (NUM_MASTER_SLOT > 3) GENERATE
      inst_matrix_m3 : axi_matrix_m 
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
            RID_IM => RID_IM3_int,
            RDATA_IM => RDATA_IM3_int,
            RRESP_IM => RRESP_IM3_int,
            RLAST_IM => RLAST_IM3_int,
            RVALID_IM => RVALID_IM3_int,
            RREADY_MI => RREADY_MI3,
            BID_IM => BID_IM3_int,
            BRESP_IM => BRESP_IM3_int,
            BVALID_IM => BVALID_IM3_int,
            BREADY_MI => BREADY_MI3,
            RID_SI0 => RID_SI0,
            RVALID_SI0 => RVALID_SI0,
            RRESP_SI0 => RRESP_SI0,
            RDATA_SI0 => RDATA_SI0,
            RLAST_SI0 => RLAST_SI0,
            BID_SI0 => BID_SI0,
            BVALID_SI0 => BVALID_SI0,
            BRESP_SI0 => BRESP_SI0,
            RID_SI1 => RID_SI1,
            RVALID_SI1 => RVALID_SI1,
            RRESP_SI1 => RRESP_SI1,
            RDATA_SI1 => RDATA_SI1,
            RLAST_SI1 => RLAST_SI1,
            BID_SI1 => BID_SI1,
            BVALID_SI1 => BVALID_SI1,
            BRESP_SI1 => BRESP_SI1,
            RID_SI2 => RID_SI2,
            RVALID_SI2 => RVALID_SI2,
            RRESP_SI2 => RRESP_SI2,
            RDATA_SI2 => RDATA_SI2,
            RLAST_SI2 => RLAST_SI2,
            BID_SI2 => BID_SI2,
            BVALID_SI2 => BVALID_SI2,
            BRESP_SI2 => BRESP_SI2,
            RID_SI3 => RID_SI3,
            RVALID_SI3 => RVALID_SI3,
            RRESP_SI3 => RRESP_SI3,
            RDATA_SI3 => RDATA_SI3,
            RLAST_SI3 => RLAST_SI3,
            BID_SI3 => BID_SI3,
            BVALID_SI3 => BVALID_SI3,
            BRESP_SI3 => BRESP_SI3,
            RID_SI4 => RID_SI4,
            RVALID_SI4 => RVALID_SI4,
            RRESP_SI4 => RRESP_SI4,
            RDATA_SI4 => RDATA_SI4,
            RLAST_SI4 => RLAST_SI4,
            BID_SI4 => BID_SI4,
            BVALID_SI4 => BVALID_SI4,
            BRESP_SI4 => BRESP_SI4,
            RID_SI5 => RID_SI5,
            RVALID_SI5 => RVALID_SI5,
            RRESP_SI5 => RRESP_SI5,
            RDATA_SI5 => RDATA_SI5,
            RLAST_SI5 => RLAST_SI5,
            BID_SI5 => BID_SI5,
            BVALID_SI5 => BVALID_SI5,
            BRESP_SI5 => BRESP_SI5,
            RID_SI6 => RID_SI6,
            RVALID_SI6 => RVALID_SI6,
            RRESP_SI6 => RRESP_SI6,
            RDATA_SI6 => RDATA_SI6,
            RLAST_SI6 => RLAST_SI6,
            BID_SI6 => BID_SI6,
            BVALID_SI6 => BVALID_SI6,
            BRESP_SI6 => BRESP_SI6,
            RID_SI7 => RID_SI7,
            RVALID_SI7 => RVALID_SI7,
            RRESP_SI7 => RRESP_SI7,
            RDATA_SI7 => RDATA_SI7,
            RLAST_SI7 => RLAST_SI7,
            BID_SI7 => BID_SI7,
            BVALID_SI7 => BVALID_SI7,
            BRESP_SI7 => BRESP_SI7,
            RID_SI8 => RID_SI8,
            RVALID_SI8 => RVALID_SI8,
            RRESP_SI8 => RRESP_SI8,
            RDATA_SI8 => RDATA_SI8,
            RLAST_SI8 => RLAST_SI8,
            BID_SI8 => BID_SI8,
            BVALID_SI8 => BVALID_SI8,
            BRESP_SI8 => BRESP_SI8,
            RID_SI9 => RID_SI9,
            RVALID_SI9 => RVALID_SI9,
            RRESP_SI9 => RRESP_SI9,
            RDATA_SI9 => RDATA_SI9,
            RLAST_SI9 => RLAST_SI9,
            BID_SI9 => BID_SI9,
            BVALID_SI9 => BVALID_SI9,
            BRESP_SI9 => BRESP_SI9,
            RID_SI10 => RID_SI10,
            RVALID_SI10 => RVALID_SI10,
            RRESP_SI10 => RRESP_SI10,
            RDATA_SI10 => RDATA_SI10,
            RLAST_SI10 => RLAST_SI10,
            BID_SI10 => BID_SI10,
            BVALID_SI10 => BVALID_SI10,
            BRESP_SI10 => BRESP_SI10,
            RID_SI11 => RID_SI11,
            RVALID_SI11 => RVALID_SI11,
            RRESP_SI11 => RRESP_SI11,
            RDATA_SI11 => RDATA_SI11,
            RLAST_SI11 => RLAST_SI11,
            BID_SI11 => BID_SI11,
            BVALID_SI11 => BVALID_SI11,
            BRESP_SI11 => BRESP_SI11,
            RID_SI12 => RID_SI12,
            RVALID_SI12 => RVALID_SI12,
            RRESP_SI12 => RRESP_SI12,
            RDATA_SI12 => RDATA_SI12,
            RLAST_SI12 => RLAST_SI12,
            BID_SI12 => BID_SI12,
            BVALID_SI12 => BVALID_SI12,
            BRESP_SI12 => BRESP_SI12,
            RID_SI13 => RID_SI13,
            RVALID_SI13 => RVALID_SI13,
            RRESP_SI13 => RRESP_SI13,
            RDATA_SI13 => RDATA_SI13,
            RLAST_SI13 => RLAST_SI13,
            BID_SI13 => BID_SI13,
            BVALID_SI13 => BVALID_SI13,
            BRESP_SI13 => BRESP_SI13,
            RID_SI14 => RID_SI14,
            RVALID_SI14 => RVALID_SI14,
            RRESP_SI14 => RRESP_SI14,
            RDATA_SI14 => RDATA_SI14,
            RLAST_SI14 => RLAST_SI14,
            BID_SI14 => BID_SI14,
            BVALID_SI14 => BVALID_SI14,
            BRESP_SI14 => BRESP_SI14,
            RID_SI15 => RID_SI15,
            RVALID_SI15 => RVALID_SI15,
            RRESP_SI15 => RRESP_SI15,
            RDATA_SI15 => RDATA_SI15,
            RLAST_SI15 => RLAST_SI15,
            BID_SI15 => BID_SI15,
            BVALID_SI15 => BVALID_SI15,
            BRESP_SI15 => BRESP_SI15,
            RID_SI16 => RID_SI16,
            RVALID_SI16 => RVALID_SI16,
            RRESP_SI16 => RRESP_SI16,
            RDATA_SI16 => RDATA_SI16,
            RLAST_SI16 => RLAST_SI16,
            BID_SI16 => BID_SI16,
            BVALID_SI16 => BVALID_SI16,
            BRESP_SI16 => BRESP_SI16,
            RREADY_IS0 => RREADY_M3IS0,
            RREADY_IS1 => RREADY_M3IS1,
            RREADY_IS2 => RREADY_M3IS2,
            RREADY_IS3 => RREADY_M3IS3,
            RREADY_IS4 => RREADY_M3IS4,
            RREADY_IS5 => RREADY_M3IS5,
            RREADY_IS6 => RREADY_M3IS6,
            RREADY_IS7 => RREADY_M3IS7,
            RREADY_IS8 => RREADY_M3IS8,
            RREADY_IS9 => RREADY_M3IS9,
            RREADY_IS10 => RREADY_M3IS10,
            RREADY_IS11 => RREADY_M3IS11,
            RREADY_IS12 => RREADY_M3IS12,
            RREADY_IS13 => RREADY_M3IS13,
            RREADY_IS14 => RREADY_M3IS14,
            RREADY_IS15 => RREADY_M3IS15,
            RREADY_IS16 => RREADY_M3IS16,
            BREADY_IS0 => BREADY_M3IS0,
            BREADY_IS1 => BREADY_M3IS1,
            BREADY_IS2 => BREADY_M3IS2,
            BREADY_IS3 => BREADY_M3IS3,
            BREADY_IS4 => BREADY_M3IS4,
            BREADY_IS5 => BREADY_M3IS5,
            BREADY_IS6 => BREADY_M3IS6,
            BREADY_IS7 => BREADY_M3IS7,
            BREADY_IS8 => BREADY_M3IS8,
            BREADY_IS9 => BREADY_M3IS9,
            BREADY_IS10 => BREADY_M3IS10,
            BREADY_IS11 => BREADY_M3IS11,
            BREADY_IS12 => BREADY_M3IS12,
            BREADY_IS13 => BREADY_M3IS13,
            BREADY_IS14 => BREADY_M3IS14,
            BREADY_IS15 => BREADY_M3IS15,
            BREADY_IS16 => BREADY_M3IS16);   
   END GENERATE L3;
   temp_xhdl1578 <= BREADY_M0IS0 WHEN M0_SLAVE0ENABLE /= 0 ELSE '0';
   BREADY_M0IS0_gated <= temp_xhdl1578 ;
   temp_xhdl1579 <= BREADY_M0IS1 WHEN M0_SLAVE1ENABLE /= 0 ELSE '0';
   BREADY_M0IS1_gated <= temp_xhdl1579 ;
   temp_xhdl1580 <= BREADY_M0IS2 WHEN M0_SLAVE2ENABLE /= 0 ELSE '0';
   BREADY_M0IS2_gated <= temp_xhdl1580 ;
   temp_xhdl1581 <= BREADY_M0IS3 WHEN M0_SLAVE3ENABLE /= 0 ELSE '0';
   BREADY_M0IS3_gated <= temp_xhdl1581 ;
   temp_xhdl1582 <= BREADY_M0IS4 WHEN M0_SLAVE4ENABLE /= 0 ELSE '0';
   BREADY_M0IS4_gated <= temp_xhdl1582 ;
   temp_xhdl1583 <= BREADY_M0IS5 WHEN M0_SLAVE5ENABLE /= 0 ELSE '0';
   BREADY_M0IS5_gated <= temp_xhdl1583 ;
   temp_xhdl1584 <= BREADY_M0IS6 WHEN M0_SLAVE6ENABLE /= 0 ELSE '0';
   BREADY_M0IS6_gated <= temp_xhdl1584 ;
   temp_xhdl1585 <= BREADY_M0IS7 WHEN M0_SLAVE7ENABLE /= 0 ELSE '0';
   BREADY_M0IS7_gated <= temp_xhdl1585 ;
   temp_xhdl1586 <= BREADY_M0IS8 WHEN M0_SLAVE8ENABLE /= 0 ELSE '0';
   BREADY_M0IS8_gated <= temp_xhdl1586 ;
   temp_xhdl1587 <= BREADY_M0IS9 WHEN M0_SLAVE9ENABLE /= 0 ELSE '0';
   BREADY_M0IS9_gated <= temp_xhdl1587 ;
   temp_xhdl1588 <= BREADY_M0IS10 WHEN M0_SLAVE10ENABLE /= 0 ELSE '0';
   BREADY_M0IS10_gated <= temp_xhdl1588 ;
   temp_xhdl1589 <= BREADY_M0IS11 WHEN M0_SLAVE11ENABLE /= 0 ELSE '0';
   BREADY_M0IS11_gated <= temp_xhdl1589 ;
   temp_xhdl1590 <= BREADY_M0IS12 WHEN M0_SLAVE12ENABLE /= 0 ELSE '0';
   BREADY_M0IS12_gated <= temp_xhdl1590 ;
   temp_xhdl1591 <= BREADY_M0IS13 WHEN M0_SLAVE13ENABLE /= 0 ELSE '0';
   BREADY_M0IS13_gated <= temp_xhdl1591 ;
   temp_xhdl1592 <= BREADY_M0IS14 WHEN M0_SLAVE14ENABLE /= 0 ELSE '0';
   BREADY_M0IS14_gated <= temp_xhdl1592 ;
   temp_xhdl1593 <= BREADY_M0IS15 WHEN M0_SLAVE15ENABLE /= 0 ELSE '0';
   BREADY_M0IS15_gated <= temp_xhdl1593 ;
   temp_xhdl1594 <= BREADY_M0IS16 WHEN M0_SLAVE16ENABLE /= 0 ELSE '0';
   BREADY_M0IS16_gated <= temp_xhdl1594 ;
   temp_xhdl1595 <= BREADY_M1IS0 WHEN M1_SLAVE0ENABLE /= 0 ELSE '0';
   BREADY_M1IS0_gated <= temp_xhdl1595 ;
   temp_xhdl1596 <= BREADY_M1IS1 WHEN M1_SLAVE1ENABLE /= 0 ELSE '0';
   BREADY_M1IS1_gated <= temp_xhdl1596 ;
   temp_xhdl1597 <= BREADY_M1IS2 WHEN M1_SLAVE2ENABLE /= 0 ELSE '0';
   BREADY_M1IS2_gated <= temp_xhdl1597 ;
   temp_xhdl1598 <= BREADY_M1IS3 WHEN M1_SLAVE3ENABLE /= 0 ELSE '0';
   BREADY_M1IS3_gated <= temp_xhdl1598 ;
   temp_xhdl1599 <= BREADY_M1IS4 WHEN M1_SLAVE4ENABLE /= 0 ELSE '0';
   BREADY_M1IS4_gated <= temp_xhdl1599 ;
   temp_xhdl1600 <= BREADY_M1IS5 WHEN M1_SLAVE5ENABLE /= 0 ELSE '0';
   BREADY_M1IS5_gated <= temp_xhdl1600 ;
   temp_xhdl1601 <= BREADY_M1IS6 WHEN M1_SLAVE6ENABLE /= 0 ELSE '0';
   BREADY_M1IS6_gated <= temp_xhdl1601 ;
   temp_xhdl1602 <= BREADY_M1IS7 WHEN M1_SLAVE7ENABLE /= 0 ELSE '0';
   BREADY_M1IS7_gated <= temp_xhdl1602 ;
   temp_xhdl1603 <= BREADY_M1IS8 WHEN M1_SLAVE8ENABLE /= 0 ELSE '0';
   BREADY_M1IS8_gated <= temp_xhdl1603 ;
   temp_xhdl1604 <= BREADY_M1IS9 WHEN M1_SLAVE9ENABLE /= 0 ELSE '0';
   BREADY_M1IS9_gated <= temp_xhdl1604 ;
   temp_xhdl1605 <= BREADY_M1IS10 WHEN M1_SLAVE10ENABLE /= 0 ELSE '0';
   BREADY_M1IS10_gated <= temp_xhdl1605 ;
   temp_xhdl1606 <= BREADY_M1IS11 WHEN M1_SLAVE11ENABLE /= 0 ELSE '0';
   BREADY_M1IS11_gated <= temp_xhdl1606 ;
   temp_xhdl1607 <= BREADY_M1IS12 WHEN M1_SLAVE12ENABLE /= 0 ELSE '0';
   BREADY_M1IS12_gated <= temp_xhdl1607 ;
   temp_xhdl1608 <= BREADY_M1IS13 WHEN M1_SLAVE13ENABLE /= 0 ELSE '0';
   BREADY_M1IS13_gated <= temp_xhdl1608 ;
   temp_xhdl1609 <= BREADY_M1IS14 WHEN M1_SLAVE14ENABLE /= 0 ELSE '0';
   BREADY_M1IS14_gated <= temp_xhdl1609 ;
   temp_xhdl1610 <= BREADY_M1IS15 WHEN M1_SLAVE15ENABLE /= 0 ELSE '0';
   BREADY_M1IS15_gated <= temp_xhdl1610 ;
   temp_xhdl1611 <= BREADY_M1IS16 WHEN M1_SLAVE16ENABLE /= 0 ELSE '0';
   BREADY_M1IS16_gated <= temp_xhdl1611 ;
   temp_xhdl1612 <= BREADY_M2IS0 WHEN M2_SLAVE0ENABLE /= 0 ELSE '0';
   BREADY_M2IS0_gated <= temp_xhdl1612 ;
   temp_xhdl1613 <= BREADY_M2IS1 WHEN M2_SLAVE1ENABLE /= 0 ELSE '0';
   BREADY_M2IS1_gated <= temp_xhdl1613 ;
   temp_xhdl1614 <= BREADY_M2IS2 WHEN M2_SLAVE2ENABLE /= 0 ELSE '0';
   BREADY_M2IS2_gated <= temp_xhdl1614 ;
   temp_xhdl1615 <= BREADY_M2IS3 WHEN M2_SLAVE3ENABLE /= 0 ELSE '0';
   BREADY_M2IS3_gated <= temp_xhdl1615 ;
   temp_xhdl1616 <= BREADY_M2IS4 WHEN M2_SLAVE4ENABLE /= 0 ELSE '0';
   BREADY_M2IS4_gated <= temp_xhdl1616 ;
   temp_xhdl1617 <= BREADY_M2IS5 WHEN M2_SLAVE5ENABLE /= 0 ELSE '0';
   BREADY_M2IS5_gated <= temp_xhdl1617 ;
   temp_xhdl1618 <= BREADY_M2IS6 WHEN M2_SLAVE6ENABLE /= 0 ELSE '0';
   BREADY_M2IS6_gated <= temp_xhdl1618 ;
   temp_xhdl1619 <= BREADY_M2IS7 WHEN M2_SLAVE7ENABLE /= 0 ELSE '0';
   BREADY_M2IS7_gated <= temp_xhdl1619 ;
   temp_xhdl1620 <= BREADY_M2IS8 WHEN M2_SLAVE8ENABLE /= 0 ELSE '0';
   BREADY_M2IS8_gated <= temp_xhdl1620 ;
   temp_xhdl1621 <= BREADY_M2IS9 WHEN M2_SLAVE9ENABLE /= 0 ELSE '0';
   BREADY_M2IS9_gated <= temp_xhdl1621 ;
   temp_xhdl1622 <= BREADY_M2IS10 WHEN M2_SLAVE10ENABLE /= 0 ELSE '0';
   BREADY_M2IS10_gated <= temp_xhdl1622 ;
   temp_xhdl1623 <= BREADY_M2IS11 WHEN M2_SLAVE11ENABLE /= 0 ELSE '0';
   BREADY_M2IS11_gated <= temp_xhdl1623 ;
   temp_xhdl1624 <= BREADY_M2IS12 WHEN M2_SLAVE12ENABLE /= 0 ELSE '0';
   BREADY_M2IS12_gated <= temp_xhdl1624 ;
   temp_xhdl1625 <= BREADY_M2IS13 WHEN M2_SLAVE13ENABLE /= 0 ELSE '0';
   BREADY_M2IS13_gated <= temp_xhdl1625 ;
   temp_xhdl1626 <= BREADY_M2IS14 WHEN M2_SLAVE14ENABLE /= 0 ELSE '0';
   BREADY_M2IS14_gated <= temp_xhdl1626 ;
   temp_xhdl1627 <= BREADY_M2IS15 WHEN M2_SLAVE15ENABLE /= 0 ELSE '0';
   BREADY_M2IS15_gated <= temp_xhdl1627 ;
   temp_xhdl1628 <= BREADY_M2IS16 WHEN M2_SLAVE16ENABLE /= 0 ELSE '0';
   BREADY_M2IS16_gated <= temp_xhdl1628 ;
   temp_xhdl1629 <= BREADY_M3IS0 WHEN M3_SLAVE0ENABLE /= 0 ELSE '0';
   BREADY_M3IS0_gated <= temp_xhdl1629 ;
   temp_xhdl1630 <= BREADY_M3IS1 WHEN M3_SLAVE1ENABLE /= 0 ELSE '0';
   BREADY_M3IS1_gated <= temp_xhdl1630 ;
   temp_xhdl1631 <= BREADY_M3IS2 WHEN M3_SLAVE2ENABLE /= 0 ELSE '0';
   BREADY_M3IS2_gated <= temp_xhdl1631 ;
   temp_xhdl1632 <= BREADY_M3IS3 WHEN M3_SLAVE3ENABLE /= 0 ELSE '0';
   BREADY_M3IS3_gated <= temp_xhdl1632 ;
   temp_xhdl1633 <= BREADY_M3IS4 WHEN M3_SLAVE4ENABLE /= 0 ELSE '0';
   BREADY_M3IS4_gated <= temp_xhdl1633 ;
   temp_xhdl1634 <= BREADY_M3IS5 WHEN M3_SLAVE5ENABLE /= 0 ELSE '0';
   BREADY_M3IS5_gated <= temp_xhdl1634 ;
   temp_xhdl1635 <= BREADY_M3IS6 WHEN M3_SLAVE6ENABLE /= 0 ELSE '0';
   BREADY_M3IS6_gated <= temp_xhdl1635 ;
   temp_xhdl1636 <= BREADY_M3IS7 WHEN M3_SLAVE7ENABLE /= 0 ELSE '0';
   BREADY_M3IS7_gated <= temp_xhdl1636 ;
   temp_xhdl1637 <= BREADY_M3IS8 WHEN M3_SLAVE8ENABLE /= 0 ELSE '0';
   BREADY_M3IS8_gated <= temp_xhdl1637 ;
   temp_xhdl1638 <= BREADY_M3IS9 WHEN M3_SLAVE9ENABLE /= 0 ELSE '0';
   BREADY_M3IS9_gated <= temp_xhdl1638 ;
   temp_xhdl1639 <= BREADY_M3IS10 WHEN M3_SLAVE10ENABLE /= 0 ELSE '0';
   BREADY_M3IS10_gated <= temp_xhdl1639 ;
   temp_xhdl1640 <= BREADY_M3IS11 WHEN M3_SLAVE11ENABLE /= 0 ELSE '0';
   BREADY_M3IS11_gated <= temp_xhdl1640 ;
   temp_xhdl1641 <= BREADY_M3IS12 WHEN M3_SLAVE12ENABLE /= 0 ELSE '0';
   BREADY_M3IS12_gated <= temp_xhdl1641 ;
   temp_xhdl1642 <= BREADY_M3IS13 WHEN M3_SLAVE13ENABLE /= 0 ELSE '0';
   BREADY_M3IS13_gated <= temp_xhdl1642 ;
   temp_xhdl1643 <= BREADY_M3IS14 WHEN M3_SLAVE14ENABLE /= 0 ELSE '0';
   BREADY_M3IS14_gated <= temp_xhdl1643 ;
   temp_xhdl1644 <= BREADY_M3IS15 WHEN M3_SLAVE15ENABLE /= 0 ELSE '0';
   BREADY_M3IS15_gated <= temp_xhdl1644 ;
   temp_xhdl1645 <= BREADY_M3IS16 WHEN M3_SLAVE16ENABLE /= 0 ELSE '0';
   BREADY_M3IS16_gated <= temp_xhdl1645 ;

   PROCESS (BRESP_IM3_int, BREADY_M1IS14_gated, BREADY_M1IS9_gated, 
   BREADY_M1IS11_gated, RREADY_M0IS10, RREADY_M0IS11, 
   BREADY_M3IS7_gated, 
   BREADY_M1IS6_gated, 
   BREADY_M3IS4_gated, 
   BREADY_M1IS3_gated, 
   BREADY_M3IS1_gated, BVALID_IM1_int, 
   BREADY_M1IS0_gated, BRESP_IM0_int, 
   BREADY_M2IS16_gated,
   BREADY_M2IS13_gated,
   BREADY_M2IS10_gated, BREADY_MI0, BREADY_MI1, BREADY_MI2, 
   BREADY_MI3, 
   BREADY_M0IS9_gated, 
   BREADY_M0IS16_gated, 
   BREADY_M2IS7_gated, BREADY_M0IS6_gated, 
   BID_IM1_int, BREADY_M0IS13_gated, BREADY_M2IS4_gated, 
   BREADY_M0IS3_gated, BREADY_M0IS10_gated, 
   BREADY_M2IS1_gated, BREADY_M3IS15_gated, BREADY_M1IS10, BREADY_M0IS0_gated, 
   BREADY_M1IS11, BREADY_M1IS12, BREADY_M1IS13, BREADY_M1IS14,
   BREADY_M1IS15, BREADY_M1IS16, BRESP_SI10, BREADY_M3IS12_gated, BRESP_SI11, 
   BRESP_SI12, BRESP_SI13, BRESP_SI14, 
   BRESP_SI15, BRESP_SI16, 
   BREADY_M2IS0, BREADY_M2IS1, 
   BREADY_M2IS2, BREADY_M2IS3, BREADY_M2IS4, 
   BREADY_M2IS5,  
   BREADY_M2IS6,  BREADY_M2IS7, BREADY_M2IS8, 
   BREADY_M2IS9, 
   BREADY_M1IS15_gated, BVALID_SI0, 
   BVALID_SI1, BVALID_SI2, BVALID_SI3, 
   BVALID_SI4, BVALID_SI5, BVALID_SI6, BVALID_SI7, BVALID_SI8, BVALID_SI9, 
   BVALID_IM3_int, BREADY_M1IS12_gated, BREADY_M3IS8_gated, BVALID_SI10, 
   BID_SI0, BVALID_SI11, BID_SI1, BRESP_IM2_int, BVALID_SI12, BID_SI2, 
   BVALID_SI13, BID_SI3, BREADY_M1IS7_gated, BVALID_SI14, BID_SI4, BVALID_SI15, 
   BID_SI5, BVALID_SI16, BID_SI6, BID_SI7, 
   BID_SI8, BREADY_M3IS5_gated, BID_SI9, BREADY_M1IS4_gated, 
   BREADY_M3IS2_gated, 
   BREADY_M1IS1_gated, 
   BVALID_IM0_int, BID_SI10, BID_SI11, BID_SI12, 
   BID_SI13, BID_SI14, 
   BREADY_M2IS14_gated, BID_SI15, BID_SI16, 
   BREADY_M2IS11_gated, BID_IM3_int, 
   BREADY_M0IS0, 
   BREADY_M3IS10, BREADY_M0IS1, BREADY_M3IS11, BREADY_M0IS2, 
   BREADY_M3IS12, BREADY_M0IS3, BREADY_M2IS8_gated, BREADY_M3IS13, BREADY_M0IS4,
   BREADY_M3IS14, BREADY_M0IS5, BREADY_M3IS15, BREADY_M0IS6, BREADY_M3IS16, 
   BREADY_M0IS7, BREADY_M0IS8, BREADY_M0IS7_gated, BREADY_M0IS9, 
   BREADY_M0IS14_gated, BREADY_M2IS5_gated, 
   BREADY_M0IS4_gated, BREADY_M0IS11_gated, 
   BREADY_M2IS2_gated, BREADY_M3IS16_gated, BID_IM0_int, BREADY_M0IS1_gated, 
   BREADY_M3IS13_gated, 
   BREADY_M3IS10_gated, BREADY_M0IS10, 
   BREADY_M0IS11, BREADY_M0IS12, BREADY_M0IS13, BREADY_M0IS14, BREADY_M0IS15, 
   BREADY_M0IS16, 
   BREADY_M3IS0,
   BREADY_M3IS1, 
   BREADY_M1IS13_gated, BREADY_M3IS4, 
   BREADY_M3IS6, BREADY_M3IS7, BREADY_M3IS8, BREADY_M3IS9_gated, BREADY_M3IS9, 
   BREADY_M1IS8_gated, BREADY_M1IS10_gated, 
   BREADY_M3IS6_gated, BVALID_IM2_int, 
   BREADY_M1IS5_gated, 
   BREADY_M3IS3_gated, BRESP_IM1_int, BREADY_M1IS2_gated,
   BREADY_M3IS0_gated, 
   BREADY_M2IS15_gated, 
   BREADY_M2IS12_gated,
   BID_IM2_int, 
   BREADY_M2IS9_gated,
   BREADY_M0IS8_gated, 
   BREADY_M0IS15_gated, BREADY_M2IS6_gated, 
   BREADY_M0IS5_gated, 
   BREADY_M2IS10, BREADY_M2IS11, BREADY_M0IS12_gated, 
   BREADY_M2IS12, BREADY_M2IS13, BREADY_M2IS14, 
   BREADY_M2IS3_gated, BREADY_M2IS15, BREADY_M2IS16, 
   BREADY_M1IS0, BRESP_SI0, BREADY_M1IS1, 
   BRESP_SI1, BREADY_M0IS2_gated, BREADY_M1IS2, 
   BRESP_SI2, BREADY_M1IS3, BRESP_SI3, 
   BREADY_M1IS4, BRESP_SI4, BREADY_M1IS5, BRESP_SI5,
   BREADY_M1IS6, BRESP_SI6, BREADY_M1IS7, BRESP_SI7, BREADY_M2IS0_gated, 
   BREADY_M1IS8, BRESP_SI8, BREADY_M3IS14_gated, BREADY_M1IS9, BRESP_SI9, 
   BREADY_M3IS11_gated, BREADY_M1IS16_gated
   )
      VARIABLE BREADY_IS0_xhdl59_xhdl1646  : std_logic;
      VARIABLE BREADY_IS1_xhdl84_xhdl1647  : std_logic;
      VARIABLE BREADY_IS2_xhdl109_xhdl1648  : std_logic;
      VARIABLE BREADY_IS3_xhdl134_xhdl1649  : std_logic;
      VARIABLE BREADY_IS4_xhdl159_xhdl1650  : std_logic;
      VARIABLE BREADY_IS5_xhdl184_xhdl1651  : std_logic;
      VARIABLE BREADY_IS6_xhdl209_xhdl1652  : std_logic;
      VARIABLE BREADY_IS7_xhdl234_xhdl1653  : std_logic;
      VARIABLE BREADY_IS8_xhdl259_xhdl1654  : std_logic;
      VARIABLE BREADY_IS9_xhdl284_xhdl1655  : std_logic;
      VARIABLE BREADY_IS10_xhdl309_xhdl1656  : std_logic;
      VARIABLE BREADY_IS11_xhdl334_xhdl1657  : std_logic;
      VARIABLE BREADY_IS12_xhdl359_xhdl1658  : std_logic;
      VARIABLE BREADY_IS13_xhdl384_xhdl1659  : std_logic;
      VARIABLE BREADY_IS14_xhdl409_xhdl1660  : std_logic;
      VARIABLE BREADY_IS15_xhdl434_xhdl1661  : std_logic;
      VARIABLE BREADY_IS16_xhdl459_xhdl1662  : std_logic;
   BEGIN
      BREADY_IS0_xhdl59_xhdl1646 := BREADY_M0IS0_gated OR BREADY_M1IS0_gated OR 
      BREADY_M2IS0_gated OR BREADY_M3IS0_gated;    
      BREADY_IS1_xhdl84_xhdl1647 := BREADY_M0IS1_gated OR BREADY_M1IS1_gated OR 
      BREADY_M2IS1_gated OR BREADY_M3IS1_gated;    
      BREADY_IS2_xhdl109_xhdl1648 := BREADY_M0IS2_gated OR BREADY_M1IS2_gated 
      OR BREADY_M2IS2_gated OR BREADY_M3IS2_gated;    
      BREADY_IS3_xhdl134_xhdl1649 := BREADY_M0IS3_gated OR BREADY_M1IS3_gated 
      OR BREADY_M2IS3_gated OR BREADY_M3IS3_gated;    
      BREADY_IS4_xhdl159_xhdl1650 := BREADY_M0IS4_gated OR BREADY_M1IS4_gated 
      OR BREADY_M2IS4_gated OR BREADY_M3IS4_gated;    
      BREADY_IS5_xhdl184_xhdl1651 := BREADY_M0IS5_gated OR BREADY_M1IS5_gated 
      OR BREADY_M2IS5_gated OR BREADY_M3IS5_gated;    
      BREADY_IS6_xhdl209_xhdl1652 := BREADY_M0IS6_gated OR BREADY_M1IS6_gated 
      OR BREADY_M2IS6_gated OR BREADY_M3IS6_gated;    
      BREADY_IS7_xhdl234_xhdl1653 := BREADY_M0IS7_gated OR BREADY_M1IS7_gated 
      OR BREADY_M2IS7_gated OR BREADY_M3IS7_gated;    
      BREADY_IS8_xhdl259_xhdl1654 := BREADY_M0IS8_gated OR BREADY_M1IS8_gated 
      OR BREADY_M2IS8_gated OR BREADY_M3IS8_gated;    
      BREADY_IS9_xhdl284_xhdl1655 := BREADY_M0IS9_gated OR BREADY_M1IS9_gated 
      OR BREADY_M2IS9_gated OR BREADY_M3IS9_gated;    
      BREADY_IS10_xhdl309_xhdl1656 := BREADY_M0IS10_gated OR 
      BREADY_M1IS10_gated OR BREADY_M2IS10_gated OR BREADY_M3IS10_gated;    
      BREADY_IS11_xhdl334_xhdl1657 := BREADY_M0IS11_gated OR 
      BREADY_M1IS11_gated OR BREADY_M2IS11_gated OR BREADY_M3IS11_gated;    
      BREADY_IS12_xhdl359_xhdl1658 := BREADY_M0IS12_gated OR 
      BREADY_M1IS12_gated OR BREADY_M2IS12_gated OR BREADY_M3IS12_gated;    
      BREADY_IS13_xhdl384_xhdl1659 := BREADY_M0IS13_gated OR 
      BREADY_M1IS13_gated OR BREADY_M2IS13_gated OR BREADY_M3IS13_gated;    
      BREADY_IS14_xhdl409_xhdl1660 := BREADY_M0IS14_gated OR 
      BREADY_M1IS14_gated OR BREADY_M2IS14_gated OR BREADY_M3IS14_gated;    
      BREADY_IS15_xhdl434_xhdl1661 := BREADY_M0IS15_gated OR 
      BREADY_M1IS15_gated OR BREADY_M2IS15_gated OR BREADY_M3IS15_gated;    
      BREADY_IS16_xhdl459_xhdl1662 := BREADY_M0IS16_gated OR 
      BREADY_M1IS16_gated OR BREADY_M2IS16_gated OR BREADY_M3IS16_gated;    
      BREADY_IS0_xhdl59 <= BREADY_IS0_xhdl59_xhdl1646;
      BREADY_IS1_xhdl84 <= BREADY_IS1_xhdl84_xhdl1647;
      BREADY_IS2_xhdl109 <= BREADY_IS2_xhdl109_xhdl1648;
      BREADY_IS3_xhdl134 <= BREADY_IS3_xhdl134_xhdl1649;
      BREADY_IS4_xhdl159 <= BREADY_IS4_xhdl159_xhdl1650;
      BREADY_IS5_xhdl184 <= BREADY_IS5_xhdl184_xhdl1651;
      BREADY_IS6_xhdl209 <= BREADY_IS6_xhdl209_xhdl1652;
      BREADY_IS7_xhdl234 <= BREADY_IS7_xhdl234_xhdl1653;
      BREADY_IS8_xhdl259 <= BREADY_IS8_xhdl259_xhdl1654;
      BREADY_IS9_xhdl284 <= BREADY_IS9_xhdl284_xhdl1655;
      BREADY_IS10_xhdl309 <= BREADY_IS10_xhdl309_xhdl1656;
      BREADY_IS11_xhdl334 <= BREADY_IS11_xhdl334_xhdl1657;
      BREADY_IS12_xhdl359 <= BREADY_IS12_xhdl359_xhdl1658;
      BREADY_IS13_xhdl384 <= BREADY_IS13_xhdl384_xhdl1659;
      BREADY_IS14_xhdl409 <= BREADY_IS14_xhdl409_xhdl1660;
      BREADY_IS15_xhdl434 <= BREADY_IS15_xhdl434_xhdl1661;
      BREADY_IS16_xhdl459 <= BREADY_IS16_xhdl459_xhdl1662;
   END PROCESS;
   temp_xhdl1663 <= RREADY_M0IS0 WHEN M0_SLAVE0ENABLE /= 0 ELSE '0';
   RREADY_M0IS0_gated <= temp_xhdl1663 ;
   temp_xhdl1664 <= RREADY_M0IS1 WHEN M0_SLAVE1ENABLE /= 0 ELSE '0';
   RREADY_M0IS1_gated <= temp_xhdl1664 ;
   temp_xhdl1665 <= RREADY_M0IS2 WHEN M0_SLAVE2ENABLE /= 0 ELSE '0';
   RREADY_M0IS2_gated <= temp_xhdl1665 ;
   temp_xhdl1666 <= RREADY_M0IS3 WHEN M0_SLAVE3ENABLE /= 0 ELSE '0';
   RREADY_M0IS3_gated <= temp_xhdl1666 ;
   temp_xhdl1667 <= RREADY_M0IS4 WHEN M0_SLAVE4ENABLE /= 0 ELSE '0';
   RREADY_M0IS4_gated <= temp_xhdl1667 ;
   temp_xhdl1668 <= RREADY_M0IS5 WHEN M0_SLAVE5ENABLE /= 0 ELSE '0';
   RREADY_M0IS5_gated <= temp_xhdl1668 ;
   temp_xhdl1669 <= RREADY_M0IS6 WHEN M0_SLAVE6ENABLE /= 0 ELSE '0';
   RREADY_M0IS6_gated <= temp_xhdl1669 ;
   temp_xhdl1670 <= RREADY_M0IS7 WHEN M0_SLAVE7ENABLE /= 0 ELSE '0';
   RREADY_M0IS7_gated <= temp_xhdl1670 ;
   temp_xhdl1671 <= RREADY_M0IS8 WHEN M0_SLAVE8ENABLE /= 0 ELSE '0';
   RREADY_M0IS8_gated <= temp_xhdl1671 ;
   temp_xhdl1672 <= RREADY_M0IS9 WHEN M0_SLAVE9ENABLE /= 0 ELSE '0';
   RREADY_M0IS9_gated <= temp_xhdl1672 ;
   temp_xhdl1673 <= RREADY_M0IS10 WHEN M0_SLAVE10ENABLE /= 0 ELSE '0';
   RREADY_M0IS10_gated <= temp_xhdl1673 ;
   temp_xhdl1674 <= RREADY_M0IS11 WHEN M0_SLAVE11ENABLE /= 0 ELSE '0';
   RREADY_M0IS11_gated <= temp_xhdl1674 ;
   temp_xhdl1675 <= RREADY_M0IS12 WHEN M0_SLAVE12ENABLE /= 0 ELSE '0';
   RREADY_M0IS12_gated <= temp_xhdl1675 ;
   temp_xhdl1676 <= RREADY_M0IS13 WHEN M0_SLAVE13ENABLE /= 0 ELSE '0';
   RREADY_M0IS13_gated <= temp_xhdl1676 ;
   temp_xhdl1677 <= RREADY_M0IS14 WHEN M0_SLAVE14ENABLE /= 0 ELSE '0';
   RREADY_M0IS14_gated <= temp_xhdl1677 ;
   temp_xhdl1678 <= RREADY_M0IS15 WHEN M0_SLAVE15ENABLE /= 0 ELSE '0';
   RREADY_M0IS15_gated <= temp_xhdl1678 ;
   temp_xhdl1679 <= RREADY_M0IS16 WHEN M0_SLAVE16ENABLE /= 0 ELSE '0';
   RREADY_M0IS16_gated <= temp_xhdl1679 ;
   temp_xhdl1680 <= RREADY_M1IS0 WHEN M1_SLAVE0ENABLE /= 0 ELSE '0';
   RREADY_M1IS0_gated <= temp_xhdl1680 ;
   temp_xhdl1681 <= RREADY_M1IS1 WHEN M1_SLAVE1ENABLE /= 0 ELSE '0';
   RREADY_M1IS1_gated <= temp_xhdl1681 ;
   temp_xhdl1682 <= RREADY_M1IS2 WHEN M1_SLAVE2ENABLE /= 0 ELSE '0';
   RREADY_M1IS2_gated <= temp_xhdl1682 ;
   temp_xhdl1683 <= RREADY_M1IS3 WHEN M1_SLAVE3ENABLE /= 0 ELSE '0';
   RREADY_M1IS3_gated <= temp_xhdl1683 ;
   temp_xhdl1684 <= RREADY_M1IS4 WHEN M1_SLAVE4ENABLE /= 0 ELSE '0';
   RREADY_M1IS4_gated <= temp_xhdl1684 ;
   temp_xhdl1685 <= RREADY_M1IS5 WHEN M1_SLAVE5ENABLE /= 0 ELSE '0';
   RREADY_M1IS5_gated <= temp_xhdl1685 ;
   temp_xhdl1686 <= RREADY_M1IS6 WHEN M1_SLAVE6ENABLE /= 0 ELSE '0';
   RREADY_M1IS6_gated <= temp_xhdl1686 ;
   temp_xhdl1687 <= RREADY_M1IS7 WHEN M1_SLAVE7ENABLE /= 0 ELSE '0';
   RREADY_M1IS7_gated <= temp_xhdl1687 ;
   temp_xhdl1688 <= RREADY_M1IS8 WHEN M1_SLAVE8ENABLE /= 0 ELSE '0';
   RREADY_M1IS8_gated <= temp_xhdl1688 ;
   temp_xhdl1689 <= RREADY_M1IS9 WHEN M1_SLAVE9ENABLE /= 0 ELSE '0';
   RREADY_M1IS9_gated <= temp_xhdl1689 ;
   temp_xhdl1690 <= RREADY_M1IS10 WHEN M1_SLAVE10ENABLE /= 0 ELSE '0';
   RREADY_M1IS10_gated <= temp_xhdl1690 ;
   temp_xhdl1691 <= RREADY_M1IS11 WHEN M1_SLAVE11ENABLE /= 0 ELSE '0';
   RREADY_M1IS11_gated <= temp_xhdl1691 ;
   temp_xhdl1692 <= RREADY_M1IS12 WHEN M1_SLAVE12ENABLE /= 0 ELSE '0';
   RREADY_M1IS12_gated <= temp_xhdl1692 ;
   temp_xhdl1693 <= RREADY_M1IS13 WHEN M1_SLAVE13ENABLE /= 0 ELSE '0';
   RREADY_M1IS13_gated <= temp_xhdl1693 ;
   temp_xhdl1694 <= RREADY_M1IS14 WHEN M1_SLAVE14ENABLE /= 0 ELSE '0';
   RREADY_M1IS14_gated <= temp_xhdl1694 ;
   temp_xhdl1695 <= RREADY_M1IS15 WHEN M1_SLAVE15ENABLE /= 0 ELSE '0';
   RREADY_M1IS15_gated <= temp_xhdl1695 ;
   temp_xhdl1696 <= RREADY_M1IS16 WHEN M1_SLAVE16ENABLE /= 0 ELSE '0';
   RREADY_M1IS16_gated <= temp_xhdl1696 ;
   temp_xhdl1697 <= RREADY_M2IS0 WHEN M2_SLAVE0ENABLE /= 0 ELSE '0';
   RREADY_M2IS0_gated <= temp_xhdl1697 ;
   temp_xhdl1698 <= RREADY_M2IS1 WHEN M2_SLAVE1ENABLE /= 0 ELSE '0';
   RREADY_M2IS1_gated <= temp_xhdl1698 ;
   temp_xhdl1699 <= RREADY_M2IS2 WHEN M2_SLAVE2ENABLE /= 0 ELSE '0';
   RREADY_M2IS2_gated <= temp_xhdl1699 ;
   temp_xhdl1700 <= RREADY_M2IS3 WHEN M2_SLAVE3ENABLE /= 0 ELSE '0';
   RREADY_M2IS3_gated <= temp_xhdl1700 ;
   temp_xhdl1701 <= RREADY_M2IS4 WHEN M2_SLAVE4ENABLE /= 0 ELSE '0';
   RREADY_M2IS4_gated <= temp_xhdl1701 ;
   temp_xhdl1702 <= RREADY_M2IS5 WHEN M2_SLAVE5ENABLE /= 0 ELSE '0';
   RREADY_M2IS5_gated <= temp_xhdl1702 ;
   temp_xhdl1703 <= RREADY_M2IS6 WHEN M2_SLAVE6ENABLE /= 0 ELSE '0';
   RREADY_M2IS6_gated <= temp_xhdl1703 ;
   temp_xhdl1704 <= RREADY_M2IS7 WHEN M2_SLAVE7ENABLE /= 0 ELSE '0';
   RREADY_M2IS7_gated <= temp_xhdl1704 ;
   temp_xhdl1705 <= RREADY_M2IS8 WHEN M2_SLAVE8ENABLE /= 0 ELSE '0';
   RREADY_M2IS8_gated <= temp_xhdl1705 ;
   temp_xhdl1706 <= RREADY_M2IS9 WHEN M2_SLAVE9ENABLE /= 0 ELSE '0';
   RREADY_M2IS9_gated <= temp_xhdl1706 ;
   temp_xhdl1707 <= RREADY_M2IS10 WHEN M2_SLAVE10ENABLE /= 0 ELSE '0';
   RREADY_M2IS10_gated <= temp_xhdl1707 ;
   temp_xhdl1708 <= RREADY_M2IS11 WHEN M2_SLAVE11ENABLE /= 0 ELSE '0';
   RREADY_M2IS11_gated <= temp_xhdl1708 ;
   temp_xhdl1709 <= RREADY_M2IS12 WHEN M2_SLAVE12ENABLE /= 0 ELSE '0';
   RREADY_M2IS12_gated <= temp_xhdl1709 ;
   temp_xhdl1710 <= RREADY_M2IS13 WHEN M2_SLAVE13ENABLE /= 0 ELSE '0';
   RREADY_M2IS13_gated <= temp_xhdl1710 ;
   temp_xhdl1711 <= RREADY_M2IS14 WHEN M2_SLAVE14ENABLE /= 0 ELSE '0';
   RREADY_M2IS14_gated <= temp_xhdl1711 ;
   temp_xhdl1712 <= RREADY_M2IS15 WHEN M2_SLAVE15ENABLE /= 0 ELSE '0';
   RREADY_M2IS15_gated <= temp_xhdl1712 ;
   temp_xhdl1713 <= RREADY_M2IS16 WHEN M2_SLAVE16ENABLE /= 0 ELSE '0';
   RREADY_M2IS16_gated <= temp_xhdl1713 ;
   temp_xhdl1714 <= RREADY_M3IS0 WHEN M3_SLAVE0ENABLE /= 0 ELSE '0';
   RREADY_M3IS0_gated <= temp_xhdl1714 ;
   temp_xhdl1715 <= RREADY_M3IS1 WHEN M3_SLAVE1ENABLE /= 0 ELSE '0';
   RREADY_M3IS1_gated <= temp_xhdl1715 ;
   temp_xhdl1716 <= RREADY_M3IS2 WHEN M3_SLAVE2ENABLE /= 0 ELSE '0';
   RREADY_M3IS2_gated <= temp_xhdl1716 ;
   temp_xhdl1717 <= RREADY_M3IS3 WHEN M3_SLAVE3ENABLE /= 0 ELSE '0';
   RREADY_M3IS3_gated <= temp_xhdl1717 ;
   temp_xhdl1718 <= RREADY_M3IS4 WHEN M3_SLAVE4ENABLE /= 0 ELSE '0';
   RREADY_M3IS4_gated <= temp_xhdl1718 ;
   temp_xhdl1719 <= RREADY_M3IS5 WHEN M3_SLAVE5ENABLE /= 0 ELSE '0';
   RREADY_M3IS5_gated <= temp_xhdl1719 ;
   temp_xhdl1720 <= RREADY_M3IS6 WHEN M3_SLAVE6ENABLE /= 0 ELSE '0';
   RREADY_M3IS6_gated <= temp_xhdl1720 ;
   temp_xhdl1721 <= RREADY_M3IS7 WHEN M3_SLAVE7ENABLE /= 0 ELSE '0';
   RREADY_M3IS7_gated <= temp_xhdl1721 ;
   temp_xhdl1722 <= RREADY_M3IS8 WHEN M3_SLAVE8ENABLE /= 0 ELSE '0';
   RREADY_M3IS8_gated <= temp_xhdl1722 ;
   temp_xhdl1723 <= RREADY_M3IS9 WHEN M3_SLAVE9ENABLE /= 0 ELSE '0';
   RREADY_M3IS9_gated <= temp_xhdl1723 ;
   temp_xhdl1724 <= RREADY_M3IS10 WHEN M3_SLAVE10ENABLE /= 0 ELSE '0';
   RREADY_M3IS10_gated <= temp_xhdl1724 ;
   temp_xhdl1725 <= RREADY_M3IS11 WHEN M3_SLAVE11ENABLE /= 0 ELSE '0';
   RREADY_M3IS11_gated <= temp_xhdl1725 ;
   temp_xhdl1726 <= RREADY_M3IS12 WHEN M3_SLAVE12ENABLE /= 0 ELSE '0';
   RREADY_M3IS12_gated <= temp_xhdl1726 ;
   temp_xhdl1727 <= RREADY_M3IS13 WHEN M3_SLAVE13ENABLE /= 0 ELSE '0';
   RREADY_M3IS13_gated <= temp_xhdl1727 ;
   temp_xhdl1728 <= RREADY_M3IS14 WHEN M3_SLAVE14ENABLE /= 0 ELSE '0';
   RREADY_M3IS14_gated <= temp_xhdl1728 ;
   temp_xhdl1729 <= RREADY_M3IS15 WHEN M3_SLAVE15ENABLE /= 0 ELSE '0';
   RREADY_M3IS15_gated <= temp_xhdl1729 ;
   temp_xhdl1730 <= RREADY_M3IS16 WHEN M3_SLAVE16ENABLE /= 0 ELSE '0';
   RREADY_M3IS16_gated <= temp_xhdl1730 ;

   PROCESS (RREADY_M3IS14_gated, 
   RREADY_M0IS10, RREADY_M0IS11, 
   RREADY_M0IS12, RREADY_M0IS13, RREADY_M0IS14, RREADY_M0IS15, 
   RREADY_M3IS11_gated, RREADY_M0IS16, RREADY_M3IS0, 
   RREADY_M3IS1, RREADY_M3IS2, RREADY_M3IS3, 
   RREADY_M3IS4, RREADY_M3IS5, RREADY_M3IS6, RREADY_M2IS14_gated, RREADY_M3IS7, 
   RREADY_M3IS8, RREADY_M3IS9, 
   RREADY_M2IS11_gated, 
   RREADY_M1IS9_gated, RREADY_M2IS8_gated, 
   RREADY_M3IS7_gated, RREADY_M1IS14_gated, RREADY_M0IS7_gated, 
   RREADY_M1IS6_gated, RREADY_M2IS5_gated, 
   RREADY_M3IS4_gated, RREADY_M1IS11_gated, RREADY_M0IS4_gated, 
   RREADY_M1IS3_gated, 
   RREADY_M2IS2_gated, RREADY_M0IS14_gated, RREADY_M3IS1_gated, 
   RREADY_M0IS1_gated, RREADY_M1IS0_gated, 
   RREADY_M0IS11_gated, RREADY_M2IS0, RREADY_M1IS10, 
   RREADY_M2IS1, RREADY_M1IS11, RREADY_M2IS2, RREADY_M1IS12, 
   RREADY_M2IS3, RREADY_M1IS13, RREADY_M3IS16_gated, 
   RREADY_M2IS4, RREADY_M1IS14, RREADY_M2IS5, RREADY_M1IS15, 
   RREADY_M2IS6, RREADY_M1IS16, RREADY_M2IS7, RREADY_M2IS8, RREADY_M2IS9, 
   RREADY_M3IS13_gated, 
   RREADY_M2IS16_gated, RREADY_M3IS10_gated, 
   RREADY_M2IS13_gated, 
   RREADY_M3IS9_gated, 
   RREADY_M1IS16_gated, RREADY_M2IS10_gated, RREADY_M0IS9_gated, 
   RREADY_M1IS8_gated, RREADY_M2IS7_gated, 
   RREADY_M3IS6_gated, RREADY_M1IS13_gated, RREADY_M0IS6_gated, RREADY_M1IS0, 
   RREADY_M1IS5_gated, RREADY_M1IS1, RREADY_M1IS2, 
   RREADY_M1IS3, RREADY_M2IS4_gated, RREADY_M1IS4, 
   RREADY_M1IS5, RREADY_M1IS6, RREADY_M0IS16_gated, RREADY_M3IS3_gated, 
   RREADY_M1IS7, RREADY_M1IS10_gated, RREADY_M1IS8, 
   RREADY_M0IS3_gated, RREADY_M1IS9, RREADY_M2IS10, RREADY_M2IS11, 
   RREADY_M2IS12, RREADY_M1IS2_gated, RREADY_M2IS13, 
   RREADY_M2IS14, RREADY_M2IS15, 
   RREADY_M2IS1_gated, RREADY_M2IS16, RREADY_M0IS13_gated, RREADY_M3IS0_gated, 
   RREADY_M0IS0_gated, RREADY_M0IS10_gated, 
   RREADY_M3IS15_gated, 
   RREADY_M3IS12_gated, 
   RREADY_M2IS15_gated, 
   RREADY_M0IS0, RREADY_M0IS1, RREADY_M0IS2, RREADY_M0IS3, 
   RREADY_M0IS4, RREADY_M2IS12_gated, RREADY_M0IS5, RREADY_M0IS6, 
   RREADY_M0IS7, RREADY_M0IS8, RREADY_M0IS9, 
   RREADY_M2IS9_gated, RREADY_M3IS8_gated, RREADY_M1IS15_gated,
   RREADY_M0IS8_gated, RREADY_M3IS10, RREADY_M1IS7_gated, 
   RREADY_M3IS11, RREADY_M3IS12, RREADY_M3IS13, 
   RREADY_M2IS6_gated, RREADY_M3IS14, RREADY_M3IS15, RREADY_M3IS16, 
   RREADY_M3IS5_gated, RREADY_M1IS12_gated, RREADY_M0IS5_gated, 
   RREADY_M1IS4_gated, 
   RREADY_M2IS3_gated, RREADY_M0IS15_gated, RREADY_M3IS2_gated, 
   RREADY_M0IS2_gated, RREADY_M1IS1_gated, 
   RREADY_M2IS0_gated, RREADY_M0IS12_gated)
      VARIABLE RREADY_IS0_xhdl69_xhdl1731  : std_logic;
      VARIABLE RREADY_IS1_xhdl94_xhdl1732  : std_logic;
      VARIABLE RREADY_IS2_xhdl119_xhdl1733  : std_logic;
      VARIABLE RREADY_IS3_xhdl144_xhdl1734  : std_logic;
      VARIABLE RREADY_IS4_xhdl169_xhdl1735  : std_logic;
      VARIABLE RREADY_IS5_xhdl194_xhdl1736  : std_logic;
      VARIABLE RREADY_IS6_xhdl219_xhdl1737  : std_logic;
      VARIABLE RREADY_IS7_xhdl244_xhdl1738  : std_logic;
      VARIABLE RREADY_IS8_xhdl269_xhdl1739  : std_logic;
      VARIABLE RREADY_IS9_xhdl294_xhdl1740  : std_logic;
      VARIABLE RREADY_IS10_xhdl319_xhdl1741  : std_logic;
      VARIABLE RREADY_IS11_xhdl344_xhdl1742  : std_logic;
      VARIABLE RREADY_IS12_xhdl369_xhdl1743  : std_logic;
      VARIABLE RREADY_IS13_xhdl394_xhdl1744  : std_logic;
      VARIABLE RREADY_IS14_xhdl419_xhdl1745  : std_logic;
      VARIABLE RREADY_IS15_xhdl444_xhdl1746  : std_logic;
      VARIABLE RREADY_IS16_xhdl469_xhdl1747  : std_logic;
   BEGIN
      RREADY_IS0_xhdl69_xhdl1731 := RREADY_M0IS0_gated OR RREADY_M1IS0_gated OR 
      RREADY_M2IS0_gated OR RREADY_M3IS0_gated;    
      RREADY_IS1_xhdl94_xhdl1732 := RREADY_M0IS1_gated OR RREADY_M1IS1_gated OR 
      RREADY_M2IS1_gated OR RREADY_M3IS1_gated;    
      RREADY_IS2_xhdl119_xhdl1733 := RREADY_M0IS2_gated OR RREADY_M1IS2_gated 
      OR RREADY_M2IS2_gated OR RREADY_M3IS2_gated;    
      RREADY_IS3_xhdl144_xhdl1734 := RREADY_M0IS3_gated OR RREADY_M1IS3_gated 
      OR RREADY_M2IS3_gated OR RREADY_M3IS3_gated;    
      RREADY_IS4_xhdl169_xhdl1735 := RREADY_M0IS4_gated OR RREADY_M1IS4_gated 
      OR RREADY_M2IS4_gated OR RREADY_M3IS4_gated;    
      RREADY_IS5_xhdl194_xhdl1736 := RREADY_M0IS5_gated OR RREADY_M1IS5_gated 
      OR RREADY_M2IS5_gated OR RREADY_M3IS5_gated;    
      RREADY_IS6_xhdl219_xhdl1737 := RREADY_M0IS6_gated OR RREADY_M1IS6_gated 
      OR RREADY_M2IS6_gated OR RREADY_M3IS6_gated;    
      RREADY_IS7_xhdl244_xhdl1738 := RREADY_M0IS7_gated OR RREADY_M1IS7_gated 
      OR RREADY_M2IS7_gated OR RREADY_M3IS7_gated;    
      RREADY_IS8_xhdl269_xhdl1739 := RREADY_M0IS8_gated OR RREADY_M1IS8_gated 
      OR RREADY_M2IS8_gated OR RREADY_M3IS8_gated;    
      RREADY_IS9_xhdl294_xhdl1740 := RREADY_M0IS9_gated OR RREADY_M1IS9_gated 
      OR RREADY_M2IS9_gated OR RREADY_M3IS9_gated;    
      RREADY_IS10_xhdl319_xhdl1741 := RREADY_M0IS10_gated OR 
      RREADY_M1IS10_gated OR RREADY_M2IS10_gated OR RREADY_M3IS10_gated;    
      RREADY_IS11_xhdl344_xhdl1742 := RREADY_M0IS11_gated OR 
      RREADY_M1IS11_gated OR RREADY_M2IS11_gated OR RREADY_M3IS11_gated;    
      RREADY_IS12_xhdl369_xhdl1743 := RREADY_M0IS12_gated OR 
      RREADY_M1IS12_gated OR RREADY_M2IS12_gated OR RREADY_M3IS12_gated;    
      RREADY_IS13_xhdl394_xhdl1744 := RREADY_M0IS13_gated OR 
      RREADY_M1IS13_gated OR RREADY_M2IS13_gated OR RREADY_M3IS13_gated;    
      RREADY_IS14_xhdl419_xhdl1745 := RREADY_M0IS14_gated OR 
      RREADY_M1IS14_gated OR RREADY_M2IS14_gated OR RREADY_M3IS14_gated;    
      RREADY_IS15_xhdl444_xhdl1746 := RREADY_M0IS15_gated OR 
      RREADY_M1IS15_gated OR RREADY_M2IS15_gated OR RREADY_M3IS15_gated;    
      RREADY_IS16_xhdl469_xhdl1747 := RREADY_M0IS16_gated OR 
      RREADY_M1IS16_gated OR RREADY_M2IS16_gated OR RREADY_M3IS16_gated;    
      RREADY_IS0_xhdl69 <= RREADY_IS0_xhdl69_xhdl1731;
      RREADY_IS1_xhdl94 <= RREADY_IS1_xhdl94_xhdl1732;
      RREADY_IS2_xhdl119 <= RREADY_IS2_xhdl119_xhdl1733;
      RREADY_IS3_xhdl144 <= RREADY_IS3_xhdl144_xhdl1734;
      RREADY_IS4_xhdl169 <= RREADY_IS4_xhdl169_xhdl1735;
      RREADY_IS5_xhdl194 <= RREADY_IS5_xhdl194_xhdl1736;
      RREADY_IS6_xhdl219 <= RREADY_IS6_xhdl219_xhdl1737;
      RREADY_IS7_xhdl244 <= RREADY_IS7_xhdl244_xhdl1738;
      RREADY_IS8_xhdl269 <= RREADY_IS8_xhdl269_xhdl1739;
      RREADY_IS9_xhdl294 <= RREADY_IS9_xhdl294_xhdl1740;
      RREADY_IS10_xhdl319 <= RREADY_IS10_xhdl319_xhdl1741;
      RREADY_IS11_xhdl344 <= RREADY_IS11_xhdl344_xhdl1742;
      RREADY_IS12_xhdl369 <= RREADY_IS12_xhdl369_xhdl1743;
      RREADY_IS13_xhdl394 <= RREADY_IS13_xhdl394_xhdl1744;
      RREADY_IS14_xhdl419 <= RREADY_IS14_xhdl419_xhdl1745;
      RREADY_IS15_xhdl444 <= RREADY_IS15_xhdl444_xhdl1746;
      RREADY_IS16_xhdl469 <= RREADY_IS16_xhdl469_xhdl1747;
   END PROCESS;
   temp_xhdl1748 <= AWREADY_S0IM0 WHEN M0_SLAVE0ENABLE /= 0 ELSE '0';
   temp_xhdl1749 <= AWREADY_S1IM0 WHEN M0_SLAVE1ENABLE /= 0 ELSE '0';
   temp_xhdl1750 <= AWREADY_S2IM0 WHEN M0_SLAVE2ENABLE /= 0 ELSE '0';
   temp_xhdl1751 <= AWREADY_S3IM0 WHEN M0_SLAVE3ENABLE /= 0 ELSE '0';
   temp_xhdl1752 <= AWREADY_S4IM0 WHEN M0_SLAVE4ENABLE /= 0 ELSE '0';
   temp_xhdl1753 <= AWREADY_S5IM0 WHEN M0_SLAVE5ENABLE /= 0 ELSE '0';
   temp_xhdl1754 <= AWREADY_S6IM0 WHEN M0_SLAVE6ENABLE /= 0 ELSE '0';
   temp_xhdl1755 <= AWREADY_S7IM0 WHEN M0_SLAVE7ENABLE /= 0 ELSE '0';
   temp_xhdl1756 <= AWREADY_S8IM0 WHEN M0_SLAVE8ENABLE /= 0 ELSE '0';
   temp_xhdl1757 <= AWREADY_S9IM0 WHEN M0_SLAVE9ENABLE /= 0 ELSE '0';
   temp_xhdl1758 <= AWREADY_S10IM0 WHEN M0_SLAVE10ENABLE /= 0 ELSE '0';
   temp_xhdl1759 <= AWREADY_S11IM0 WHEN M0_SLAVE11ENABLE /= 0 ELSE '0';
   temp_xhdl1760 <= AWREADY_S12IM0 WHEN M0_SLAVE12ENABLE /= 0 ELSE '0';
   temp_xhdl1761 <= AWREADY_S13IM0 WHEN M0_SLAVE13ENABLE /= 0 ELSE '0';
   temp_xhdl1762 <= AWREADY_S14IM0 WHEN M0_SLAVE14ENABLE /= 0 ELSE '0';
   temp_xhdl1763 <= AWREADY_S15IM0 WHEN M0_SLAVE15ENABLE /= 0 ELSE '0';
   temp_xhdl1764 <= AWREADY_S16IM0 WHEN M0_SLAVE16ENABLE /= 0 ELSE '0';
   temp_xhdl1766 <= AWREADY_S0IM1 WHEN M1_SLAVE0ENABLE /= 0 ELSE '0';
   temp_xhdl1767 <= AWREADY_S1IM1 WHEN M1_SLAVE1ENABLE /= 0 ELSE '0';
   temp_xhdl1768 <= AWREADY_S2IM1 WHEN M1_SLAVE2ENABLE /= 0 ELSE '0';
   temp_xhdl1769 <= AWREADY_S3IM1 WHEN M1_SLAVE3ENABLE /= 0 ELSE '0';
   temp_xhdl1770 <= AWREADY_S4IM1 WHEN M1_SLAVE4ENABLE /= 0 ELSE '0';
   temp_xhdl1771 <= AWREADY_S5IM1 WHEN M1_SLAVE5ENABLE /= 0 ELSE '0';
   temp_xhdl1772 <= AWREADY_S6IM1 WHEN M1_SLAVE6ENABLE /= 0 ELSE '0';
   temp_xhdl1773 <= AWREADY_S7IM1 WHEN M1_SLAVE7ENABLE /= 0 ELSE '0';
   temp_xhdl1774 <= AWREADY_S8IM1 WHEN M1_SLAVE8ENABLE /= 0 ELSE '0';
   temp_xhdl1775 <= AWREADY_S9IM1 WHEN M1_SLAVE9ENABLE /= 0 ELSE '0';
   temp_xhdl1776 <= AWREADY_S10IM1 WHEN M1_SLAVE10ENABLE /= 0 ELSE '0';
   temp_xhdl1777 <= AWREADY_S11IM1 WHEN M1_SLAVE11ENABLE /= 0 ELSE '0';
   temp_xhdl1778 <= AWREADY_S12IM1 WHEN M1_SLAVE12ENABLE /= 0 ELSE '0';
   temp_xhdl1779 <= AWREADY_S13IM1 WHEN M1_SLAVE13ENABLE /= 0 ELSE '0';
   temp_xhdl1780 <= AWREADY_S14IM1 WHEN M1_SLAVE14ENABLE /= 0 ELSE '0';
   temp_xhdl1781 <= AWREADY_S15IM1 WHEN M1_SLAVE15ENABLE /= 0 ELSE '0';
   temp_xhdl1782 <= AWREADY_S16IM1 WHEN M1_SLAVE16ENABLE /= 0 ELSE '0';
   temp_xhdl1784 <= AWREADY_S0IM2 WHEN M2_SLAVE0ENABLE /= 0 ELSE '0';
   temp_xhdl1785 <= AWREADY_S1IM2 WHEN M2_SLAVE1ENABLE /= 0 ELSE '0';
   temp_xhdl1786 <= AWREADY_S2IM2 WHEN M2_SLAVE2ENABLE /= 0 ELSE '0';
   temp_xhdl1787 <= AWREADY_S3IM2 WHEN M2_SLAVE3ENABLE /= 0 ELSE '0';
   temp_xhdl1788 <= AWREADY_S4IM2 WHEN M2_SLAVE4ENABLE /= 0 ELSE '0';
   temp_xhdl1789 <= AWREADY_S5IM2 WHEN M2_SLAVE5ENABLE /= 0 ELSE '0';
   temp_xhdl1790 <= AWREADY_S6IM2 WHEN M2_SLAVE6ENABLE /= 0 ELSE '0';
   temp_xhdl1791 <= AWREADY_S7IM2 WHEN M2_SLAVE7ENABLE /= 0 ELSE '0';
   temp_xhdl1792 <= AWREADY_S8IM2 WHEN M2_SLAVE8ENABLE /= 0 ELSE '0';
   temp_xhdl1793 <= AWREADY_S9IM2 WHEN M2_SLAVE9ENABLE /= 0 ELSE '0';
   temp_xhdl1794 <= AWREADY_S10IM2 WHEN M2_SLAVE10ENABLE /= 0 ELSE '0';
   temp_xhdl1795 <= AWREADY_S11IM2 WHEN M2_SLAVE11ENABLE /= 0 ELSE '0';
   temp_xhdl1796 <= AWREADY_S12IM2 WHEN M2_SLAVE12ENABLE /= 0 ELSE '0';
   temp_xhdl1797 <= AWREADY_S13IM2 WHEN M2_SLAVE13ENABLE /= 0 ELSE '0';
   temp_xhdl1798 <= AWREADY_S14IM2 WHEN M2_SLAVE14ENABLE /= 0 ELSE '0';
   temp_xhdl1799 <= AWREADY_S15IM2 WHEN M2_SLAVE15ENABLE /= 0 ELSE '0';
   temp_xhdl1800 <= AWREADY_S16IM2 WHEN M2_SLAVE16ENABLE /= 0 ELSE '0';
   temp_xhdl1802 <= AWREADY_S0IM3 WHEN M3_SLAVE0ENABLE /= 0 ELSE '0';
   temp_xhdl1803 <= AWREADY_S1IM3 WHEN M3_SLAVE1ENABLE /= 0 ELSE '0';
   temp_xhdl1804 <= AWREADY_S2IM3 WHEN M3_SLAVE2ENABLE /= 0 ELSE '0';
   temp_xhdl1805 <= AWREADY_S3IM3 WHEN M3_SLAVE3ENABLE /= 0 ELSE '0';
   temp_xhdl1806 <= AWREADY_S4IM3 WHEN M3_SLAVE4ENABLE /= 0 ELSE '0';
   temp_xhdl1807 <= AWREADY_S5IM3 WHEN M3_SLAVE5ENABLE /= 0 ELSE '0';
   temp_xhdl1808 <= AWREADY_S6IM3 WHEN M3_SLAVE6ENABLE /= 0 ELSE '0';
   temp_xhdl1809 <= AWREADY_S7IM3 WHEN M3_SLAVE7ENABLE /= 0 ELSE '0';
   temp_xhdl1810 <= AWREADY_S8IM3 WHEN M3_SLAVE8ENABLE /= 0 ELSE '0';
   temp_xhdl1811 <= AWREADY_S9IM3 WHEN M3_SLAVE9ENABLE /= 0 ELSE '0';
   temp_xhdl1812 <= AWREADY_S10IM3 WHEN M3_SLAVE10ENABLE /= 0 ELSE '0';
   temp_xhdl1813 <= AWREADY_S11IM3 WHEN M3_SLAVE11ENABLE /= 0 ELSE '0';
   temp_xhdl1814 <= AWREADY_S12IM3 WHEN M3_SLAVE12ENABLE /= 0 ELSE '0';
   temp_xhdl1815 <= AWREADY_S13IM3 WHEN M3_SLAVE13ENABLE /= 0 ELSE '0';
   temp_xhdl1816 <= AWREADY_S14IM3 WHEN M3_SLAVE14ENABLE /= 0 ELSE '0';
   temp_xhdl1817 <= AWREADY_S15IM3 WHEN M3_SLAVE15ENABLE /= 0 ELSE '0';
   temp_xhdl1818 <= AWREADY_S16IM3 WHEN M3_SLAVE16ENABLE /= 0 ELSE '0';

   PROCESS (AWREADY_S5IM0, AWREADY_S5IM1, AWREADY_S5IM2, AWREADY_S5IM3, 
   AWREADY_S9IM0, 
   AWREADY_S9IM1, AWREADY_S9IM2, AWREADY_S9IM3, 
   AWREADY_S11IM0, AWREADY_S11IM1, 
   AWREADY_S11IM2, AWREADY_S11IM3, AWREADY_S0IM0, 
   AWREADY_S0IM1, AWREADY_S0IM2, AWREADY_S0IM3, 
   AWREADY_S15IM0, AWREADY_S15IM1, 
   AWREADY_S15IM2, AWREADY_S15IM3, AWREADY_S4IM0, 
   AWREADY_S4IM1, AWREADY_S4IM2, AWREADY_S4IM3, 
   AWREADY_S8IM0, 
   AWREADY_S8IM1, AWREADY_S8IM2, AWREADY_S8IM3, 
   AWREADY_S10IM0, AWREADY_S10IM1, AWREADY_S10IM2, 
   AWREADY_S10IM3, AWREADY_S14IM0, AWREADY_S14IM1, AWREADY_S14IM2, 
   AWREADY_S14IM3, AWREADY_S3IM0, 
   AWREADY_S3IM1, AWREADY_S3IM2, AWREADY_S3IM3, 
   AWREADY_S7IM0, AWREADY_S7IM1, 
   AWREADY_S7IM2, AWREADY_S7IM3, 
   AWREADY_S13IM0, AWREADY_S13IM1, 
   AWREADY_S13IM2, AWREADY_S13IM3, AWREADY_S2IM0, 
   AWREADY_S2IM1, AWREADY_S2IM2, 
   AWREADY_S2IM3, AWREADY_S6IM0, 
   AWREADY_S6IM1, AWREADY_S6IM2, AWREADY_S6IM3, 
   AWREADY_S12IM0, AWREADY_S12IM1, AWREADY_S12IM2, 
   AWREADY_S12IM3, 
   AWREADY_S1IM0, AWREADY_S1IM1, AWREADY_S1IM2, AWREADY_S1IM3, 
   AWREADY_S16IM0, AWREADY_S16IM1, 
   AWREADY_S16IM2, AWREADY_S16IM3, temp_xhdl1748, temp_xhdl1749, 
      temp_xhdl1750,temp_xhdl1751,temp_xhdl1752,temp_xhdl1753, 
      temp_xhdl1754,temp_xhdl1755,temp_xhdl1756, 
      temp_xhdl1757,temp_xhdl1758,temp_xhdl1759,temp_xhdl1760, 
      temp_xhdl1761,temp_xhdl1762,temp_xhdl1763, 
      temp_xhdl1764,  temp_xhdl1766, temp_xhdl1767, 
      temp_xhdl1768,temp_xhdl1769,temp_xhdl1770,temp_xhdl1771, 
      temp_xhdl1772,temp_xhdl1773,temp_xhdl1774, 
      temp_xhdl1775,temp_xhdl1776,temp_xhdl1777,temp_xhdl1778, 
      temp_xhdl1779,temp_xhdl1780,temp_xhdl1781, 
      temp_xhdl1782,  temp_xhdl1784, temp_xhdl1785, temp_xhdl1786, temp_xhdl1787, temp_xhdl1788, temp_xhdl1789, temp_xhdl1790, temp_xhdl1791, temp_xhdl1792, temp_xhdl1793, temp_xhdl1794, temp_xhdl1795, temp_xhdl1796, temp_xhdl1797, temp_xhdl1798, temp_xhdl1799, temp_xhdl1800, temp_xhdl1802, temp_xhdl1803, temp_xhdl1804, temp_xhdl1805, temp_xhdl1806, temp_xhdl1807, temp_xhdl1808, temp_xhdl1809, temp_xhdl1810, temp_xhdl1811, temp_xhdl1812, temp_xhdl1813, temp_xhdl1814, temp_xhdl1815, temp_xhdl1816, temp_xhdl1817, temp_xhdl1818)
      VARIABLE AWREADY_IM0_xhdl1_xhdl1765  : std_logic;
      VARIABLE AWREADY_IM1_xhdl12_xhdl1783  : std_logic;
      VARIABLE AWREADY_IM2_xhdl23_xhdl1801  : std_logic;
      VARIABLE AWREADY_IM3_xhdl34_xhdl1819  : std_logic;
   BEGIN
      AWREADY_IM0_xhdl1_xhdl1765 := (temp_xhdl1748) OR (temp_xhdl1749) OR 
      (temp_xhdl1750) OR (temp_xhdl1751) OR (temp_xhdl1752) OR (temp_xhdl1753) 
      OR (temp_xhdl1754) OR (temp_xhdl1755) OR (temp_xhdl1756) OR 
      (temp_xhdl1757) OR (temp_xhdl1758) OR (temp_xhdl1759) OR (temp_xhdl1760) 
      OR (temp_xhdl1761) OR (temp_xhdl1762) OR (temp_xhdl1763) OR 
      (temp_xhdl1764);    
      AWREADY_IM1_xhdl12_xhdl1783 := (temp_xhdl1766) OR (temp_xhdl1767) OR 
      (temp_xhdl1768) OR (temp_xhdl1769) OR (temp_xhdl1770) OR (temp_xhdl1771) 
      OR (temp_xhdl1772) OR (temp_xhdl1773) OR (temp_xhdl1774) OR 
      (temp_xhdl1775) OR (temp_xhdl1776) OR (temp_xhdl1777) OR (temp_xhdl1778) 
      OR (temp_xhdl1779) OR (temp_xhdl1780) OR (temp_xhdl1781) OR 
      (temp_xhdl1782);    
      AWREADY_IM2_xhdl23_xhdl1801 := (temp_xhdl1784) OR (temp_xhdl1785) OR 
      (temp_xhdl1786) OR (temp_xhdl1787) OR (temp_xhdl1788) OR (temp_xhdl1789) 
      OR (temp_xhdl1790) OR (temp_xhdl1791) OR (temp_xhdl1792) OR 
      (temp_xhdl1793) OR (temp_xhdl1794) OR (temp_xhdl1795) OR (temp_xhdl1796) 
      OR (temp_xhdl1797) OR (temp_xhdl1798) OR (temp_xhdl1799) OR 
      (temp_xhdl1800);    
      AWREADY_IM3_xhdl34_xhdl1819 := (temp_xhdl1802) OR (temp_xhdl1803) OR 
      (temp_xhdl1804) OR (temp_xhdl1805) OR (temp_xhdl1806) OR (temp_xhdl1807) 
      OR (temp_xhdl1808) OR (temp_xhdl1809) OR (temp_xhdl1810) OR 
      (temp_xhdl1811) OR (temp_xhdl1812) OR (temp_xhdl1813) OR (temp_xhdl1814) 
      OR (temp_xhdl1815) OR (temp_xhdl1816) OR (temp_xhdl1817) OR 
      (temp_xhdl1818);    
      AWREADY_IM0_xhdl1 <= AWREADY_IM0_xhdl1_xhdl1765;
      AWREADY_IM1_xhdl12 <= AWREADY_IM1_xhdl12_xhdl1783;
      AWREADY_IM2_xhdl23 <= AWREADY_IM2_xhdl23_xhdl1801;
      AWREADY_IM3_xhdl34 <= AWREADY_IM3_xhdl34_xhdl1819;
   END PROCESS;
   temp_xhdl1820 <= WREADY_S0IM0 WHEN M0_SLAVE0ENABLE /= 0 ELSE '0';
   temp_xhdl1821 <= WREADY_S1IM0 WHEN M0_SLAVE1ENABLE /= 0 ELSE '0';
   temp_xhdl1822 <= WREADY_S2IM0 WHEN M0_SLAVE2ENABLE /= 0 ELSE '0';
   temp_xhdl1823 <= WREADY_S3IM0 WHEN M0_SLAVE3ENABLE /= 0 ELSE '0';
   temp_xhdl1824 <= WREADY_S4IM0 WHEN M0_SLAVE4ENABLE /= 0 ELSE '0';
   temp_xhdl1825 <= WREADY_S5IM0 WHEN M0_SLAVE5ENABLE /= 0 ELSE '0';
   temp_xhdl1826 <= WREADY_S6IM0 WHEN M0_SLAVE6ENABLE /= 0 ELSE '0';
   temp_xhdl1827 <= WREADY_S7IM0 WHEN M0_SLAVE7ENABLE /= 0 ELSE '0';
   temp_xhdl1828 <= WREADY_S8IM0 WHEN M0_SLAVE8ENABLE /= 0 ELSE '0';
   temp_xhdl1829 <= WREADY_S9IM0 WHEN M0_SLAVE9ENABLE /= 0 ELSE '0';
   temp_xhdl1830 <= WREADY_S10IM0 WHEN M0_SLAVE10ENABLE /= 0 ELSE '0';
   temp_xhdl1831 <= WREADY_S11IM0 WHEN M0_SLAVE11ENABLE /= 0 ELSE '0';
   temp_xhdl1832 <= WREADY_S12IM0 WHEN M0_SLAVE12ENABLE /= 0 ELSE '0';
   temp_xhdl1833 <= WREADY_S13IM0 WHEN M0_SLAVE13ENABLE /= 0 ELSE '0';
   temp_xhdl1834 <= WREADY_S14IM0 WHEN M0_SLAVE14ENABLE /= 0 ELSE '0';
   temp_xhdl1835 <= WREADY_S15IM0 WHEN M0_SLAVE15ENABLE /= 0 ELSE '0';
   temp_xhdl1836 <= WREADY_S16IM0 WHEN M0_SLAVE16ENABLE /= 0 ELSE '0';
   temp_xhdl1838 <= WREADY_S0IM1 WHEN M1_SLAVE0ENABLE /= 0 ELSE '0';
   temp_xhdl1839 <= WREADY_S1IM1 WHEN M1_SLAVE1ENABLE /= 0 ELSE '0';
   temp_xhdl1840 <= WREADY_S2IM1 WHEN M1_SLAVE2ENABLE /= 0 ELSE '0';
   temp_xhdl1841 <= WREADY_S3IM1 WHEN M1_SLAVE3ENABLE /= 0 ELSE '0';
   temp_xhdl1842 <= WREADY_S4IM1 WHEN M1_SLAVE4ENABLE /= 0 ELSE '0';
   temp_xhdl1843 <= WREADY_S5IM1 WHEN M1_SLAVE5ENABLE /= 0 ELSE '0';
   temp_xhdl1844 <= WREADY_S6IM1 WHEN M1_SLAVE6ENABLE /= 0 ELSE '0';
   temp_xhdl1845 <= WREADY_S7IM1 WHEN M1_SLAVE7ENABLE /= 0 ELSE '0';
   temp_xhdl1846 <= WREADY_S8IM1 WHEN M1_SLAVE8ENABLE /= 0 ELSE '0';
   temp_xhdl1847 <= WREADY_S9IM1 WHEN M1_SLAVE9ENABLE /= 0 ELSE '0';
   temp_xhdl1848 <= WREADY_S10IM1 WHEN M1_SLAVE10ENABLE /= 0 ELSE '0';
   temp_xhdl1849 <= WREADY_S11IM1 WHEN M1_SLAVE11ENABLE /= 0 ELSE '0';
   temp_xhdl1850 <= WREADY_S12IM1 WHEN M1_SLAVE12ENABLE /= 0 ELSE '0';
   temp_xhdl1851 <= WREADY_S13IM1 WHEN M1_SLAVE13ENABLE /= 0 ELSE '0';
   temp_xhdl1852 <= WREADY_S14IM1 WHEN M1_SLAVE14ENABLE /= 0 ELSE '0';
   temp_xhdl1853 <= WREADY_S15IM1 WHEN M1_SLAVE15ENABLE /= 0 ELSE '0';
   temp_xhdl1854 <= WREADY_S16IM1 WHEN M1_SLAVE16ENABLE /= 0 ELSE '0';
   temp_xhdl1856 <= WREADY_S0IM2 WHEN M2_SLAVE0ENABLE /= 0 ELSE '0';
   temp_xhdl1857 <= WREADY_S1IM2 WHEN M2_SLAVE1ENABLE /= 0 ELSE '0';
   temp_xhdl1858 <= WREADY_S2IM2 WHEN M2_SLAVE2ENABLE /= 0 ELSE '0';
   temp_xhdl1859 <= WREADY_S3IM2 WHEN M2_SLAVE3ENABLE /= 0 ELSE '0';
   temp_xhdl1860 <= WREADY_S4IM2 WHEN M2_SLAVE4ENABLE /= 0 ELSE '0';
   temp_xhdl1861 <= WREADY_S5IM2 WHEN M2_SLAVE5ENABLE /= 0 ELSE '0';
   temp_xhdl1862 <= WREADY_S6IM2 WHEN M2_SLAVE6ENABLE /= 0 ELSE '0';
   temp_xhdl1863 <= WREADY_S7IM2 WHEN M2_SLAVE7ENABLE /= 0 ELSE '0';
   temp_xhdl1864 <= WREADY_S8IM2 WHEN M2_SLAVE8ENABLE /= 0 ELSE '0';
   temp_xhdl1865 <= WREADY_S9IM2 WHEN M2_SLAVE9ENABLE /= 0 ELSE '0';
   temp_xhdl1866 <= WREADY_S10IM2 WHEN M2_SLAVE10ENABLE /= 0 ELSE '0';
   temp_xhdl1867 <= WREADY_S11IM2 WHEN M2_SLAVE11ENABLE /= 0 ELSE '0';
   temp_xhdl1868 <= WREADY_S12IM2 WHEN M2_SLAVE12ENABLE /= 0 ELSE '0';
   temp_xhdl1869 <= WREADY_S13IM2 WHEN M2_SLAVE13ENABLE /= 0 ELSE '0';
   temp_xhdl1870 <= WREADY_S14IM2 WHEN M2_SLAVE14ENABLE /= 0 ELSE '0';
   temp_xhdl1871 <= WREADY_S15IM2 WHEN M2_SLAVE15ENABLE /= 0 ELSE '0';
   temp_xhdl1872 <= WREADY_S16IM2 WHEN M2_SLAVE16ENABLE /= 0 ELSE '0';
   temp_xhdl1874 <= WREADY_S0IM3 WHEN M3_SLAVE0ENABLE /= 0 ELSE '0';
   temp_xhdl1875 <= WREADY_S1IM3 WHEN M3_SLAVE1ENABLE /= 0 ELSE '0';
   temp_xhdl1876 <= WREADY_S2IM3 WHEN M3_SLAVE2ENABLE /= 0 ELSE '0';
   temp_xhdl1877 <= WREADY_S3IM3 WHEN M3_SLAVE3ENABLE /= 0 ELSE '0';
   temp_xhdl1878 <= WREADY_S4IM3 WHEN M3_SLAVE4ENABLE /= 0 ELSE '0';
   temp_xhdl1879 <= WREADY_S5IM3 WHEN M3_SLAVE5ENABLE /= 0 ELSE '0';
   temp_xhdl1880 <= WREADY_S6IM3 WHEN M3_SLAVE6ENABLE /= 0 ELSE '0';
   temp_xhdl1881 <= WREADY_S7IM3 WHEN M3_SLAVE7ENABLE /= 0 ELSE '0';
   temp_xhdl1882 <= WREADY_S8IM3 WHEN M3_SLAVE8ENABLE /= 0 ELSE '0';
   temp_xhdl1883 <= WREADY_S9IM3 WHEN M3_SLAVE9ENABLE /= 0 ELSE '0';
   temp_xhdl1884 <= WREADY_S10IM3 WHEN M3_SLAVE10ENABLE /= 0 ELSE '0';
   temp_xhdl1885 <= WREADY_S11IM3 WHEN M3_SLAVE11ENABLE /= 0 ELSE '0';
   temp_xhdl1886 <= WREADY_S12IM3 WHEN M3_SLAVE12ENABLE /= 0 ELSE '0';
   temp_xhdl1887 <= WREADY_S13IM3 WHEN M3_SLAVE13ENABLE /= 0 ELSE '0';
   temp_xhdl1888 <= WREADY_S14IM3 WHEN M3_SLAVE14ENABLE /= 0 ELSE '0';
   temp_xhdl1889 <= WREADY_S15IM3 WHEN M3_SLAVE15ENABLE /= 0 ELSE '0';
   temp_xhdl1890 <= WREADY_S16IM3 WHEN M3_SLAVE16ENABLE /= 0 ELSE '0';

   PROCESS (WREADY_S9IM0, WREADY_S9IM1, WREADY_S9IM2, 
   WREADY_S9IM3, WREADY_S16IM0, WREADY_S16IM1, WREADY_S16IM2, WREADY_S16IM3, 
   WREADY_S0IM0, WREADY_S0IM1, WREADY_S0IM2, 
   WREADY_S0IM3, 
   WREADY_S4IM0, WREADY_S4IM1, WREADY_S4IM2,
   WREADY_S4IM3, WREADY_S11IM0, WREADY_S11IM1,
   WREADY_S11IM2, WREADY_S11IM3, 
   WREADY_S8IM0, WREADY_S8IM1, WREADY_S8IM2, WREADY_S8IM3, 
   WREADY_S15IM0, WREADY_S15IM1, WREADY_S15IM2, 
   WREADY_S15IM3, 
   WREADY_S3IM0, WREADY_S3IM1, WREADY_S3IM2, 
   WREADY_S3IM3, WREADY_S10IM0, 
   WREADY_S10IM1, WREADY_S10IM2, WREADY_S10IM3, 
   WREADY_S7IM0, WREADY_S7IM1, WREADY_S7IM2, 
   WREADY_S7IM3, 
   WREADY_S14IM0, WREADY_S14IM1, WREADY_S14IM2, WREADY_S14IM3,
   WREADY_S2IM0, WREADY_S2IM1, WREADY_S2IM2, WREADY_S2IM3, 
   WREADY_S6IM0, 
   WREADY_S6IM1, WREADY_S6IM2, WREADY_S6IM3, WREADY_S13IM0, 
   WREADY_S13IM1, WREADY_S13IM2, WREADY_S13IM3, 
   WREADY_S1IM0, WREADY_S1IM1, 
   WREADY_S1IM2, WREADY_S1IM3, 
   WREADY_S5IM0, WREADY_S5IM1, WREADY_S5IM2, 
   WREADY_S5IM3, 
   WREADY_S12IM0, WREADY_S12IM1, WREADY_S12IM2, WREADY_S12IM3,temp_xhdl1820, temp_xhdl1821, temp_xhdl1822, temp_xhdl1823, temp_xhdl1824, temp_xhdl1825, temp_xhdl1826, temp_xhdl1827, temp_xhdl1828, temp_xhdl1829, temp_xhdl1830, temp_xhdl1831, temp_xhdl1832, temp_xhdl1833, temp_xhdl1834, temp_xhdl1835, temp_xhdl1836, temp_xhdl1838, temp_xhdl1839, temp_xhdl1840, temp_xhdl1841, temp_xhdl1842, temp_xhdl1843, temp_xhdl1844, temp_xhdl1845, temp_xhdl1846, temp_xhdl1847, temp_xhdl1848, temp_xhdl1849, temp_xhdl1850, temp_xhdl1851, temp_xhdl1852, temp_xhdl1853, temp_xhdl1854, temp_xhdl1856, temp_xhdl1857, temp_xhdl1858, temp_xhdl1859, temp_xhdl1860, temp_xhdl1861, temp_xhdl1862, temp_xhdl1863, temp_xhdl1864, temp_xhdl1865, temp_xhdl1866, temp_xhdl1867, temp_xhdl1868, temp_xhdl1869, temp_xhdl1870, temp_xhdl1871, temp_xhdl1872, temp_xhdl1874, temp_xhdl1875, temp_xhdl1876, temp_xhdl1877, temp_xhdl1878, temp_xhdl1879, temp_xhdl1880, temp_xhdl1881, temp_xhdl1882, temp_xhdl1883, temp_xhdl1884, temp_xhdl1885, temp_xhdl1886, temp_xhdl1887, temp_xhdl1888, temp_xhdl1889, temp_xhdl1890)
      VARIABLE WREADY_IM0_xhdl2_xhdl1837  : std_logic;
      VARIABLE WREADY_IM1_xhdl13_xhdl1855  : std_logic;
      VARIABLE WREADY_IM2_xhdl24_xhdl1873  : std_logic;
      VARIABLE WREADY_IM3_xhdl35_xhdl1891  : std_logic;
   BEGIN
      WREADY_IM0_xhdl2_xhdl1837 := (temp_xhdl1820) OR (temp_xhdl1821) OR 
      (temp_xhdl1822) OR (temp_xhdl1823) OR (temp_xhdl1824) OR (temp_xhdl1825) 
      OR (temp_xhdl1826) OR (temp_xhdl1827) OR (temp_xhdl1828) OR 
      (temp_xhdl1829) OR (temp_xhdl1830) OR (temp_xhdl1831) OR (temp_xhdl1832) 
      OR (temp_xhdl1833) OR (temp_xhdl1834) OR (temp_xhdl1835) OR 
      (temp_xhdl1836);    
      WREADY_IM1_xhdl13_xhdl1855 := (temp_xhdl1838) OR (temp_xhdl1839) OR 
      (temp_xhdl1840) OR (temp_xhdl1841) OR (temp_xhdl1842) OR (temp_xhdl1843) 
      OR (temp_xhdl1844) OR (temp_xhdl1845) OR (temp_xhdl1846) OR 
      (temp_xhdl1847) OR (temp_xhdl1848) OR (temp_xhdl1849) OR (temp_xhdl1850) 
      OR (temp_xhdl1851) OR (temp_xhdl1852) OR (temp_xhdl1853) OR 
      (temp_xhdl1854);    
      WREADY_IM2_xhdl24_xhdl1873 := (temp_xhdl1856) OR (temp_xhdl1857) OR 
      (temp_xhdl1858) OR (temp_xhdl1859) OR (temp_xhdl1860) OR (temp_xhdl1861) 
      OR (temp_xhdl1862) OR (temp_xhdl1863) OR (temp_xhdl1864) OR 
      (temp_xhdl1865) OR (temp_xhdl1866) OR (temp_xhdl1867) OR (temp_xhdl1868) 
      OR (temp_xhdl1869) OR (temp_xhdl1870) OR (temp_xhdl1871) OR 
      (temp_xhdl1872);    
      WREADY_IM3_xhdl35_xhdl1891 := (temp_xhdl1874) OR (temp_xhdl1875) OR 
      (temp_xhdl1876) OR (temp_xhdl1877) OR (temp_xhdl1878) OR (temp_xhdl1879) 
      OR (temp_xhdl1880) OR (temp_xhdl1881) OR (temp_xhdl1882) OR 
      (temp_xhdl1883) OR (temp_xhdl1884) OR (temp_xhdl1885) OR (temp_xhdl1886) 
      OR (temp_xhdl1887) OR (temp_xhdl1888) OR (temp_xhdl1889) OR 
      (temp_xhdl1890);    
      WREADY_IM0_xhdl2 <= WREADY_IM0_xhdl2_xhdl1837;
      WREADY_IM1_xhdl13 <= WREADY_IM1_xhdl13_xhdl1855;
      WREADY_IM2_xhdl24 <= WREADY_IM2_xhdl24_xhdl1873;
      WREADY_IM3_xhdl35 <= WREADY_IM3_xhdl35_xhdl1891;
   END PROCESS;
   temp_xhdl1892 <= ARREADY_S0IM0 WHEN M0_SLAVE0ENABLE /= 0 ELSE '0';
   temp_xhdl1893 <= ARREADY_S1IM0 WHEN M0_SLAVE1ENABLE /= 0 ELSE '0';
   temp_xhdl1894 <= ARREADY_S2IM0 WHEN M0_SLAVE2ENABLE /= 0 ELSE '0';
   temp_xhdl1895 <= ARREADY_S3IM0 WHEN M0_SLAVE3ENABLE /= 0 ELSE '0';
   temp_xhdl1896 <= ARREADY_S4IM0 WHEN M0_SLAVE4ENABLE /= 0 ELSE '0';
   temp_xhdl1897 <= ARREADY_S5IM0 WHEN M0_SLAVE5ENABLE /= 0 ELSE '0';
   temp_xhdl1898 <= ARREADY_S6IM0 WHEN M0_SLAVE6ENABLE /= 0 ELSE '0';
   temp_xhdl1899 <= ARREADY_S7IM0 WHEN M0_SLAVE7ENABLE /= 0 ELSE '0';
   temp_xhdl1900 <= ARREADY_S8IM0 WHEN M0_SLAVE8ENABLE /= 0 ELSE '0';
   temp_xhdl1901 <= ARREADY_S9IM0 WHEN M0_SLAVE9ENABLE /= 0 ELSE '0';
   temp_xhdl1902 <= ARREADY_S10IM0 WHEN M0_SLAVE10ENABLE /= 0 ELSE '0';
   temp_xhdl1903 <= ARREADY_S11IM0 WHEN M0_SLAVE11ENABLE /= 0 ELSE '0';
   temp_xhdl1904 <= ARREADY_S12IM0 WHEN M0_SLAVE12ENABLE /= 0 ELSE '0';
   temp_xhdl1905 <= ARREADY_S13IM0 WHEN M0_SLAVE13ENABLE /= 0 ELSE '0';
   temp_xhdl1906 <= ARREADY_S14IM0 WHEN M0_SLAVE14ENABLE /= 0 ELSE '0';
   temp_xhdl1907 <= ARREADY_S15IM0 WHEN M0_SLAVE15ENABLE /= 0 ELSE '0';
   temp_xhdl1908 <= ARREADY_S16IM0 WHEN M0_SLAVE16ENABLE /= 0 ELSE '0';
   temp_xhdl1910 <= ARREADY_S0IM1 WHEN M1_SLAVE0ENABLE /= 0 ELSE '0';
   temp_xhdl1911 <= ARREADY_S1IM1 WHEN M1_SLAVE1ENABLE /= 0 ELSE '0';
   temp_xhdl1912 <= ARREADY_S2IM1 WHEN M1_SLAVE2ENABLE /= 0 ELSE '0';
   temp_xhdl1913 <= ARREADY_S3IM1 WHEN M1_SLAVE3ENABLE /= 0 ELSE '0';
   temp_xhdl1914 <= ARREADY_S4IM1 WHEN M1_SLAVE4ENABLE /= 0 ELSE '0';
   temp_xhdl1915 <= ARREADY_S5IM1 WHEN M1_SLAVE5ENABLE /= 0 ELSE '0';
   temp_xhdl1916 <= ARREADY_S6IM1 WHEN M1_SLAVE6ENABLE /= 0 ELSE '0';
   temp_xhdl1917 <= ARREADY_S7IM1 WHEN M1_SLAVE7ENABLE /= 0 ELSE '0';
   temp_xhdl1918 <= ARREADY_S8IM1 WHEN M1_SLAVE8ENABLE /= 0 ELSE '0';
   temp_xhdl1919 <= ARREADY_S9IM1 WHEN M1_SLAVE9ENABLE /= 0 ELSE '0';
   temp_xhdl1920 <= ARREADY_S10IM1 WHEN M1_SLAVE10ENABLE /= 0 ELSE '0';
   temp_xhdl1921 <= ARREADY_S11IM1 WHEN M1_SLAVE11ENABLE /= 0 ELSE '0';
   temp_xhdl1922 <= ARREADY_S12IM1 WHEN M1_SLAVE12ENABLE /= 0 ELSE '0';
   temp_xhdl1923 <= ARREADY_S13IM1 WHEN M1_SLAVE13ENABLE /= 0 ELSE '0';
   temp_xhdl1924 <= ARREADY_S14IM1 WHEN M1_SLAVE14ENABLE /= 0 ELSE '0';
   temp_xhdl1925 <= ARREADY_S15IM1 WHEN M1_SLAVE15ENABLE /= 0 ELSE '0';
   temp_xhdl1926 <= ARREADY_S16IM1 WHEN M1_SLAVE16ENABLE /= 0 ELSE '0';
   temp_xhdl1928 <= ARREADY_S0IM2 WHEN M2_SLAVE0ENABLE /= 0 ELSE '0';
   temp_xhdl1929 <= ARREADY_S1IM2 WHEN M2_SLAVE1ENABLE /= 0 ELSE '0';
   temp_xhdl1930 <= ARREADY_S2IM2 WHEN M2_SLAVE2ENABLE /= 0 ELSE '0';
   temp_xhdl1931 <= ARREADY_S3IM2 WHEN M2_SLAVE3ENABLE /= 0 ELSE '0';
   temp_xhdl1932 <= ARREADY_S4IM2 WHEN M2_SLAVE4ENABLE /= 0 ELSE '0';
   temp_xhdl1933 <= ARREADY_S5IM2 WHEN M2_SLAVE5ENABLE /= 0 ELSE '0';
   temp_xhdl1934 <= ARREADY_S6IM2 WHEN M2_SLAVE6ENABLE /= 0 ELSE '0';
   temp_xhdl1935 <= ARREADY_S7IM2 WHEN M2_SLAVE7ENABLE /= 0 ELSE '0';
   temp_xhdl1936 <= ARREADY_S8IM2 WHEN M2_SLAVE8ENABLE /= 0 ELSE '0';
   temp_xhdl1937 <= ARREADY_S9IM2 WHEN M2_SLAVE9ENABLE /= 0 ELSE '0';
   temp_xhdl1938 <= ARREADY_S10IM2 WHEN M2_SLAVE10ENABLE /= 0 ELSE '0';
   temp_xhdl1939 <= ARREADY_S11IM2 WHEN M2_SLAVE11ENABLE /= 0 ELSE '0';
   temp_xhdl1940 <= ARREADY_S12IM2 WHEN M2_SLAVE12ENABLE /= 0 ELSE '0';
   temp_xhdl1941 <= ARREADY_S13IM2 WHEN M2_SLAVE13ENABLE /= 0 ELSE '0';
   temp_xhdl1942 <= ARREADY_S14IM2 WHEN M2_SLAVE14ENABLE /= 0 ELSE '0';
   temp_xhdl1943 <= ARREADY_S15IM2 WHEN M2_SLAVE15ENABLE /= 0 ELSE '0';
   temp_xhdl1944 <= ARREADY_S16IM2 WHEN M2_SLAVE16ENABLE /= 0 ELSE '0';
   temp_xhdl1946 <= ARREADY_S0IM3 WHEN M3_SLAVE0ENABLE /= 0 ELSE '0';
   temp_xhdl1947 <= ARREADY_S1IM3 WHEN M3_SLAVE1ENABLE /= 0 ELSE '0';
   temp_xhdl1948 <= ARREADY_S2IM3 WHEN M3_SLAVE2ENABLE /= 0 ELSE '0';
   temp_xhdl1949 <= ARREADY_S3IM3 WHEN M3_SLAVE3ENABLE /= 0 ELSE '0';
   temp_xhdl1950 <= ARREADY_S4IM3 WHEN M3_SLAVE4ENABLE /= 0 ELSE '0';
   temp_xhdl1951 <= ARREADY_S5IM3 WHEN M3_SLAVE5ENABLE /= 0 ELSE '0';
   temp_xhdl1952 <= ARREADY_S6IM3 WHEN M3_SLAVE6ENABLE /= 0 ELSE '0';
   temp_xhdl1953 <= ARREADY_S7IM3 WHEN M3_SLAVE7ENABLE /= 0 ELSE '0';
   temp_xhdl1954 <= ARREADY_S8IM3 WHEN M3_SLAVE8ENABLE /= 0 ELSE '0';
   temp_xhdl1955 <= ARREADY_S9IM3 WHEN M3_SLAVE9ENABLE /= 0 ELSE '0';
   temp_xhdl1956 <= ARREADY_S10IM3 WHEN M3_SLAVE10ENABLE /= 0 ELSE '0';
   temp_xhdl1957 <= ARREADY_S11IM3 WHEN M3_SLAVE11ENABLE /= 0 ELSE '0';
   temp_xhdl1958 <= ARREADY_S12IM3 WHEN M3_SLAVE12ENABLE /= 0 ELSE '0';
   temp_xhdl1959 <= ARREADY_S13IM3 WHEN M3_SLAVE13ENABLE /= 0 ELSE '0';
   temp_xhdl1960 <= ARREADY_S14IM3 WHEN M3_SLAVE14ENABLE /= 0 ELSE '0';
   temp_xhdl1961 <= ARREADY_S15IM3 WHEN M3_SLAVE15ENABLE /= 0 ELSE '0';
   temp_xhdl1962 <= ARREADY_S16IM3 WHEN M3_SLAVE16ENABLE /= 0 ELSE '0';

   PROCESS (ARREADY_S7IM0, ARREADY_S7IM1, 
   ARREADY_S7IM2, ARREADY_S7IM3, 
   ARREADY_S11IM0, ARREADY_S11IM1, ARREADY_S11IM2, 
   ARREADY_S11IM3, 
   ARREADY_S15IM0, ARREADY_S15IM1, 
   ARREADY_S15IM2, ARREADY_S15IM3, ARREADY_S2IM0, ARREADY_S2IM1, ARREADY_S2IM2, 
   ARREADY_S2IM3, 
   ARREADY_S6IM0, ARREADY_S6IM1, 
   ARREADY_S6IM2, ARREADY_S6IM3, 
   ARREADY_S10IM0, ARREADY_S10IM1, ARREADY_S10IM2, ARREADY_S10IM3, 
   ARREADY_S14IM0, ARREADY_S14IM1, ARREADY_S14IM2, ARREADY_S14IM3, 
   ARREADY_S1IM0, ARREADY_S1IM1, ARREADY_S1IM2, ARREADY_S1IM3, 
   ARREADY_S5IM0, ARREADY_S5IM1, 
   ARREADY_S5IM2, ARREADY_S5IM3, 
   ARREADY_S9IM0, ARREADY_S9IM1, 
   ARREADY_S9IM2, ARREADY_S9IM3, 
   ARREADY_S13IM0, ARREADY_S13IM1, ARREADY_S13IM2, ARREADY_S13IM3, 
   ARREADY_S0IM0, ARREADY_S0IM1, ARREADY_S0IM2, ARREADY_S0IM3,
   ARREADY_S4IM0, 
   ARREADY_S4IM1, ARREADY_S4IM2, ARREADY_S4IM3, 
   ARREADY_S8IM0, ARREADY_S8IM1, ARREADY_S8IM2, ARREADY_S8IM3,
   ARREADY_S12IM0, ARREADY_S12IM1, ARREADY_S12IM2, 
   ARREADY_S12IM3, ARREADY_S16IM0, 
   ARREADY_S16IM1, ARREADY_S16IM2, ARREADY_S16IM3, ARREADY_S3IM0, ARREADY_S3IM1,
   ARREADY_S3IM2, ARREADY_S3IM3, temp_xhdl1892, temp_xhdl1893, temp_xhdl1894, temp_xhdl1895, temp_xhdl1896, temp_xhdl1897, temp_xhdl1898, temp_xhdl1899, temp_xhdl1900, temp_xhdl1901, temp_xhdl1902, temp_xhdl1903, temp_xhdl1904, temp_xhdl1905, temp_xhdl1906, temp_xhdl1907, temp_xhdl1908, temp_xhdl1910, temp_xhdl1911, temp_xhdl1912, temp_xhdl1913, temp_xhdl1914, temp_xhdl1915, temp_xhdl1916, temp_xhdl1917, temp_xhdl1918, temp_xhdl1919, temp_xhdl1920, temp_xhdl1921, temp_xhdl1922, temp_xhdl1923, temp_xhdl1924, temp_xhdl1925, temp_xhdl1926, temp_xhdl1928, temp_xhdl1929, temp_xhdl1930, temp_xhdl1931, temp_xhdl1932, temp_xhdl1933, temp_xhdl1934, temp_xhdl1935, temp_xhdl1936, temp_xhdl1937, temp_xhdl1938, temp_xhdl1939, temp_xhdl1940, temp_xhdl1941, temp_xhdl1942, temp_xhdl1943, temp_xhdl1944, temp_xhdl1946, temp_xhdl1947, temp_xhdl1948, temp_xhdl1949, temp_xhdl1950, temp_xhdl1951, temp_xhdl1952, temp_xhdl1953, temp_xhdl1954, temp_xhdl1955, temp_xhdl1956, temp_xhdl1957, temp_xhdl1958, temp_xhdl1959, temp_xhdl1960, temp_xhdl1961, temp_xhdl1962)
      VARIABLE ARREADY_IM0_xhdl6_xhdl1909  : std_logic;
      VARIABLE ARREADY_IM1_xhdl17_xhdl1927  : std_logic;
      VARIABLE ARREADY_IM2_xhdl28_xhdl1945  : std_logic;
      VARIABLE ARREADY_IM3_xhdl39_xhdl1963  : std_logic;
   BEGIN
      ARREADY_IM0_xhdl6_xhdl1909 := (temp_xhdl1892) OR (temp_xhdl1893) OR 
      (temp_xhdl1894) OR (temp_xhdl1895) OR (temp_xhdl1896) OR (temp_xhdl1897) 
      OR (temp_xhdl1898) OR (temp_xhdl1899) OR (temp_xhdl1900) OR 
      (temp_xhdl1901) OR (temp_xhdl1902) OR (temp_xhdl1903) OR (temp_xhdl1904) 
      OR (temp_xhdl1905) OR (temp_xhdl1906) OR (temp_xhdl1907) OR 
      (temp_xhdl1908);    
      ARREADY_IM1_xhdl17_xhdl1927 := (temp_xhdl1910) OR (temp_xhdl1911) OR 
      (temp_xhdl1912) OR (temp_xhdl1913) OR (temp_xhdl1914) OR (temp_xhdl1915) 
      OR (temp_xhdl1916) OR (temp_xhdl1917) OR (temp_xhdl1918) OR 
      (temp_xhdl1919) OR (temp_xhdl1920) OR (temp_xhdl1921) OR (temp_xhdl1922) 
      OR (temp_xhdl1923) OR (temp_xhdl1924) OR (temp_xhdl1925) OR 
      (temp_xhdl1926);    
      ARREADY_IM2_xhdl28_xhdl1945 := (temp_xhdl1928) OR (temp_xhdl1929) OR 
      (temp_xhdl1930) OR (temp_xhdl1931) OR (temp_xhdl1932) OR (temp_xhdl1933) 
      OR (temp_xhdl1934) OR (temp_xhdl1935) OR (temp_xhdl1936) OR 
      (temp_xhdl1937) OR (temp_xhdl1938) OR (temp_xhdl1939) OR (temp_xhdl1940) 
      OR (temp_xhdl1941) OR (temp_xhdl1942) OR (temp_xhdl1943) OR 
      (temp_xhdl1944);    
      ARREADY_IM3_xhdl39_xhdl1963 := (temp_xhdl1946) OR (temp_xhdl1947) OR 
      (temp_xhdl1948) OR (temp_xhdl1949) OR (temp_xhdl1950) OR (temp_xhdl1951) 
      OR (temp_xhdl1952) OR (temp_xhdl1953) OR (temp_xhdl1954) OR 
      (temp_xhdl1955) OR (temp_xhdl1956) OR (temp_xhdl1957) OR (temp_xhdl1958) 
      OR (temp_xhdl1959) OR (temp_xhdl1960) OR (temp_xhdl1961) OR 
      (temp_xhdl1962);    
      ARREADY_IM0_xhdl6 <= ARREADY_IM0_xhdl6_xhdl1909;
      ARREADY_IM1_xhdl17 <= ARREADY_IM1_xhdl17_xhdl1927;
      ARREADY_IM2_xhdl28 <= ARREADY_IM2_xhdl28_xhdl1945;
      ARREADY_IM3_xhdl39 <= ARREADY_IM3_xhdl39_xhdl1963;
   END PROCESS;
   temp_xhdl1964 <= AWID_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl1966 <= AWADDR_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl1968 <= AWLEN_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl1970 <= AWSIZE_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl1972 <= AWBURST_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl1974 <= AWLOCK_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl1976 <= AWCACHE_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl1978 <= AWPROT_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl1980 <= AWVALID_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl1982 <= AWID_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl1984 <= AWADDR_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl1986 <= AWLEN_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl1988 <= AWSIZE_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl1990 <= AWBURST_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl1992 <= AWLOCK_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl1994 <= AWCACHE_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl1996 <= AWPROT_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl1998 <= AWVALID_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2000 <= AWID_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2002 <= AWADDR_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2004 <= AWLEN_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2006 <= AWSIZE_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2008 <= AWBURST_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2010 <= AWLOCK_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2012 <= AWCACHE_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2014 <= AWPROT_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2016 <= AWVALID_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2018 <= AWID_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2020 <= AWADDR_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2022 <= AWLEN_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2024 <= AWSIZE_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2026 <= AWBURST_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2028 <= AWLOCK_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2030 <= AWCACHE_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2032 <= AWPROT_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2034 <= AWVALID_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2036 <= AWID_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2038 <= AWADDR_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2040 <= AWLEN_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2042 <= AWSIZE_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2044 <= AWBURST_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2046 <= AWLOCK_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2048 <= AWCACHE_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2050 <= AWPROT_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2052 <= AWVALID_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2054 <= AWID_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2056 <= AWADDR_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2058 <= AWLEN_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2060 <= AWSIZE_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2062 <= AWBURST_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2064 <= AWLOCK_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2066 <= AWCACHE_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2068 <= AWPROT_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2070 <= AWVALID_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2072 <= AWID_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2074 <= AWADDR_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2076 <= AWLEN_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2078 <= AWSIZE_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2080 <= AWBURST_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2082 <= AWLOCK_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2084 <= AWCACHE_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2086 <= AWPROT_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2088 <= AWVALID_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2090 <= AWID_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2092 <= AWADDR_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2094 <= AWLEN_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2096 <= AWSIZE_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2098 <= AWBURST_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2100 <= AWLOCK_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2102 <= AWCACHE_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2104 <= AWPROT_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2106 <= AWVALID_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2108 <= AWID_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2110 <= AWADDR_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2112 <= AWLEN_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2114 <= AWSIZE_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2116 <= AWBURST_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2118 <= AWLOCK_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2120 <= AWCACHE_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2122 <= AWPROT_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2124 <= AWVALID_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2126 <= AWID_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2128 <= AWADDR_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2130 <= AWLEN_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2132 <= AWSIZE_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2134 <= AWBURST_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2136 <= AWLOCK_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2138 <= AWCACHE_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2140 <= AWPROT_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2142 <= AWVALID_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2144 <= AWID_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2146 <= AWADDR_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2148 <= AWLEN_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2150 <= AWSIZE_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2152 <= AWBURST_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2154 <= AWLOCK_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2156 <= AWCACHE_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2158 <= AWPROT_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2160 <= AWVALID_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2162 <= AWID_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2164 <= AWADDR_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2166 <= AWLEN_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2168 <= AWSIZE_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2170 <= AWBURST_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2172 <= AWLOCK_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2174 <= AWCACHE_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2176 <= AWPROT_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2178 <= AWVALID_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2180 <= AWID_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2182 <= AWADDR_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2184 <= AWLEN_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2186 <= AWSIZE_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2188 <= AWBURST_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2190 <= AWLOCK_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2192 <= AWCACHE_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2194 <= AWPROT_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2196 <= AWVALID_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2198 <= AWID_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2200 <= AWADDR_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2202 <= AWLEN_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2204 <= AWSIZE_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2206 <= AWBURST_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2208 <= AWLOCK_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2210 <= AWCACHE_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2212 <= AWPROT_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2214 <= AWVALID_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2216 <= AWID_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2218 <= AWADDR_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2220 <= AWLEN_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2222 <= AWSIZE_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2224 <= AWBURST_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2226 <= AWLOCK_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2228 <= AWCACHE_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2230 <= AWPROT_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2232 <= AWVALID_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2234 <= AWID_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2236 <= AWADDR_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2238 <= AWLEN_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2240 <= AWSIZE_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2242 <= AWBURST_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2244 <= AWLOCK_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2246 <= AWCACHE_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2248 <= AWPROT_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2250 <= AWVALID_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';

   PROCESS (AWID_IS7_gated, AWVALID_IS15_gated, AWLEN_IS15_gated, 
   AWADDR_IS11_gated, AWPROT_IS4_gated, AWLEN_IS0_gated, AWLOCK_IS7_gated, 
   AWCACHE_IS6_gated, AWID_IS4_gated, AWVALID_IS12_gated, AWLEN_IS12_gated, 
   AWPROT_IS1_gated, AWLOCK_IS4_gated, AWVALID_IS9_gated, AWCACHE_IS3_gated, 
   AWID_IS1_gated, AWCACHE_IS16_gated, AWVALID_IS16_gated_r, 
   AWLOCK_IS1_gated, AWVALID_IS6_gated, AWBURST_IS14_gated, AWCACHE_IS0_gated, 
   AWLOCK_IS16_gated, AWCACHE_IS13_gated, AWPROT_IS14_gated, 
   AWBURST_IS7_gated, AWVALID_IS3_gated, 
   AWBURST_IS11_gated, AWADDR_IS16_gated_r, AWSIZE_IS14_gated, 
   AWLOCK_IS13_gated, AWPROT_IS11_gated, AWCACHE_IS10_gated, AWBURST_IS4_gated, 
   AWVALID_IS0_gated, AWSIZE_IS8_gated, AWID_IS14_gated, AWADDR_IS7_gated, 
   AWSIZE_IS11_gated, AWLOCK_IS10_gated, AWLEN_IS8_gated, AWBURST_IS1_gated, 
   AWSIZE_IS5_gated, AWID_IS11_gated, AWADDR_IS4_gated, AWADDR_IS16_gated, 
   AWPROT_IS9_gated, AWLEN_IS5_gated, AWSIZE_IS2_gated, AWADDR_IS1_gated, 
   AWID_IS9_gated, AWADDR_IS13_gated, 
   AWPROT_IS6_gated, AWLEN_IS2_gated, AWLOCK_IS9_gated, 
   AWCACHE_IS8_gated, AWID_IS6_gated, AWVALID_IS14_gated, AWLEN_IS14_gated, 
   AWADDR_IS10_gated, AWPROT_IS3_gated, AWLOCK_IS6_gated, AWCACHE_IS5_gated, 
   AWID_IS3_gated, AWVALID_IS11_gated, AWLEN_IS11_gated, AWPROT_IS0_gated, 
   AWLOCK_IS3_gated, AWVALID_IS8_gated, AWBURST_IS16_gated, AWCACHE_IS2_gated, 
   AWID_IS0_gated, AWCACHE_IS15_gated, AWPROT_IS16_gated, AWLOCK_IS0_gated, 
   AWBURST_IS9_gated, AWVALID_IS5_gated, AWBURST_IS13_gated, AWSIZE_IS16_gated, 
   AWLOCK_IS15_gated, AWCACHE_IS12_gated, AWPROT_IS13_gated, AWBURST_IS6_gated, 
   AWVALID_IS2_gated, AWBURST_IS10_gated, AWID_IS16_gated, AWADDR_IS9_gated, 
   AWSIZE_IS13_gated, AWPROT_IS10_gated, AWLOCK_IS12_gated, AWBURST_IS3_gated, 
   AWSIZE_IS7_gated, AWID_IS13_gated, AWADDR_IS6_gated, AWSIZE_IS10_gated, 
   AWBURST_IS0_gated, AWLEN_IS7_gated, AWSIZE_IS4_gated, 
   AWADDR_IS3_gated, AWID_IS10_gated, AWADDR_IS15_gated, AWPROT_IS8_gated, 
   AWLEN_IS4_gated, AWSIZE_IS1_gated, AWADDR_IS0_gated, AWID_IS8_gated, 
   AWVALID_IS16_gated, AWLEN_IS16_gated, AWADDR_IS12_gated, AWPROT_IS5_gated, 
   AWLEN_IS1_gated, AWLOCK_IS8_gated, AWCACHE_IS7_gated, 
   AWID_IS5_gated, AWVALID_IS13_gated, AWLEN_IS13_gated, AWPROT_IS2_gated, 
   AWLOCK_IS5_gated, AWCACHE_IS4_gated, AWID_IS2_gated, AWLEN_IS10_gated, 
   AWVALID_IS10_gated, AWLOCK_IS2_gated, AWVALID_IS7_gated, AWBURST_IS15_gated, 
   AWCACHE_IS1_gated, AWCACHE_IS14_gated, AWPROT_IS15_gated, AWBURST_IS8_gated, 
   AWVALID_IS4_gated, AWBURST_IS12_gated, AWSIZE_IS15_gated, AWLOCK_IS14_gated, 
   AWPROT_IS12_gated, AWCACHE_IS11_gated, AWBURST_IS5_gated, AWVALID_IS1_gated, 
   AWSIZE_IS9_gated, AWID_IS15_gated, AWADDR_IS8_gated, AWSIZE_IS12_gated, 
   AWLOCK_IS11_gated, AWBURST_IS2_gated, AWLEN_IS9_gated, AWSIZE_IS6_gated, 
   AWADDR_IS5_gated, AWID_IS12_gated, AWLEN_IS6_gated, AWSIZE_IS3_gated, 
   AWADDR_IS2_gated, AWADDR_IS14_gated, AWPROT_IS7_gated, AWLEN_IS3_gated, 
   AWSIZE_IS0_gated, AWCACHE_IS9_gated, temp_xhdl1964, temp_xhdl1966, temp_xhdl1968,temp_xhdl1970,temp_xhdl1972,temp_xhdl1974,temp_xhdl1976,temp_xhdl1978, temp_xhdl1980, temp_xhdl1982,temp_xhdl1984,temp_xhdl1986,temp_xhdl1988,temp_xhdl1990,temp_xhdl1992,temp_xhdl1994,temp_xhdl1996,temp_xhdl1998,temp_xhdl2000,temp_xhdl2002,temp_xhdl2004,temp_xhdl2006,temp_xhdl2008,temp_xhdl2010,temp_xhdl2012,temp_xhdl2014,temp_xhdl2016,temp_xhdl2018,temp_xhdl2020,temp_xhdl2022,temp_xhdl2024,temp_xhdl2026,temp_xhdl2028,temp_xhdl2030,temp_xhdl2032,temp_xhdl2034,temp_xhdl2036,temp_xhdl2038,temp_xhdl2040,temp_xhdl2042,temp_xhdl2044,temp_xhdl2046,temp_xhdl2048,temp_xhdl2050,temp_xhdl2052,temp_xhdl2054,temp_xhdl2056,temp_xhdl2058,temp_xhdl2060, temp_xhdl2062,temp_xhdl2064,temp_xhdl2066,temp_xhdl2068,temp_xhdl2070, temp_xhdl2072,temp_xhdl2074,temp_xhdl2076,temp_xhdl2078,temp_xhdl2080, temp_xhdl2082,temp_xhdl2084,temp_xhdl2086,temp_xhdl2088,temp_xhdl2090, temp_xhdl2092,temp_xhdl2094,temp_xhdl2096,temp_xhdl2098,temp_xhdl2100,temp_xhdl2102,temp_xhdl2104,temp_xhdl2106,temp_xhdl2108,temp_xhdl2110,temp_xhdl2112,temp_xhdl2114,temp_xhdl2116,temp_xhdl2118,temp_xhdl2120,temp_xhdl2122,temp_xhdl2124,temp_xhdl2126,temp_xhdl2128,temp_xhdl2130,temp_xhdl2132,temp_xhdl2134,temp_xhdl2136,temp_xhdl2138,temp_xhdl2140,temp_xhdl2142,temp_xhdl2144,temp_xhdl2146,temp_xhdl2148,temp_xhdl2150,temp_xhdl2152,temp_xhdl2154,temp_xhdl2156,temp_xhdl2158,temp_xhdl2160, temp_xhdl2162,temp_xhdl2164,temp_xhdl2166,temp_xhdl2168,temp_xhdl2170, temp_xhdl2172,temp_xhdl2174,temp_xhdl2176,temp_xhdl2178,temp_xhdl2180, temp_xhdl2182,temp_xhdl2184,temp_xhdl2186,temp_xhdl2188,temp_xhdl2190, temp_xhdl2192,temp_xhdl2194,temp_xhdl2196,temp_xhdl2198, temp_xhdl2200,temp_xhdl2202,temp_xhdl2204,temp_xhdl2206,temp_xhdl2208,temp_xhdl2210,temp_xhdl2212,temp_xhdl2214,temp_xhdl2216,temp_xhdl2218,temp_xhdl2220,temp_xhdl2222,temp_xhdl2224,temp_xhdl2226,temp_xhdl2228,temp_xhdl2230,temp_xhdl2232,temp_xhdl2234,temp_xhdl2236,temp_xhdl2238,temp_xhdl2240,temp_xhdl2242,temp_xhdl2244,temp_xhdl2246,temp_xhdl2248,temp_xhdl2250)
      VARIABLE AWID_IS0_xhdl45_xhdl1965  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE AWADDR_IS0_xhdl46_xhdl1967  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE AWLEN_IS0_xhdl47_xhdl1969  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWSIZE_IS0_xhdl48_xhdl1971  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWBURST_IS0_xhdl49_xhdl1973  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWLOCK_IS0_xhdl50_xhdl1975  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWCACHE_IS0_xhdl51_xhdl1977  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWPROT_IS0_xhdl52_xhdl1979  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWVALID_IS0_xhdl53_xhdl1981  : std_logic;
      VARIABLE AWID_IS1_xhdl70_xhdl1983  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE AWADDR_IS1_xhdl71_xhdl1985  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE AWLEN_IS1_xhdl72_xhdl1987  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWSIZE_IS1_xhdl73_xhdl1989  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWBURST_IS1_xhdl74_xhdl1991  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWLOCK_IS1_xhdl75_xhdl1993  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWCACHE_IS1_xhdl76_xhdl1995  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWPROT_IS1_xhdl77_xhdl1997  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWVALID_IS1_xhdl78_xhdl1999  : std_logic;
      VARIABLE AWID_IS2_xhdl95_xhdl2001  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE AWADDR_IS2_xhdl96_xhdl2003  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE AWLEN_IS2_xhdl97_xhdl2005  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWSIZE_IS2_xhdl98_xhdl2007  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWBURST_IS2_xhdl99_xhdl2009  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWLOCK_IS2_xhdl100_xhdl2011  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWCACHE_IS2_xhdl101_xhdl2013  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWPROT_IS2_xhdl102_xhdl2015  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWVALID_IS2_xhdl103_xhdl2017  : std_logic;
      VARIABLE AWID_IS3_xhdl120_xhdl2019  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE AWADDR_IS3_xhdl121_xhdl2021  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE AWLEN_IS3_xhdl122_xhdl2023  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWSIZE_IS3_xhdl123_xhdl2025  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWBURST_IS3_xhdl124_xhdl2027  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWLOCK_IS3_xhdl125_xhdl2029  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWCACHE_IS3_xhdl126_xhdl2031  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWPROT_IS3_xhdl127_xhdl2033  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWVALID_IS3_xhdl128_xhdl2035  : std_logic;
      VARIABLE AWID_IS4_xhdl145_xhdl2037  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE AWADDR_IS4_xhdl146_xhdl2039  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE AWLEN_IS4_xhdl147_xhdl2041  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWSIZE_IS4_xhdl148_xhdl2043  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWBURST_IS4_xhdl149_xhdl2045  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWLOCK_IS4_xhdl150_xhdl2047  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWCACHE_IS4_xhdl151_xhdl2049  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWPROT_IS4_xhdl152_xhdl2051  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWVALID_IS4_xhdl153_xhdl2053  : std_logic;
      VARIABLE AWID_IS5_xhdl170_xhdl2055  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE AWADDR_IS5_xhdl171_xhdl2057  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE AWLEN_IS5_xhdl172_xhdl2059  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWSIZE_IS5_xhdl173_xhdl2061  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWBURST_IS5_xhdl174_xhdl2063  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWLOCK_IS5_xhdl175_xhdl2065  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWCACHE_IS5_xhdl176_xhdl2067  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWPROT_IS5_xhdl177_xhdl2069  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWVALID_IS5_xhdl178_xhdl2071  : std_logic;
      VARIABLE AWID_IS6_xhdl195_xhdl2073  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE AWADDR_IS6_xhdl196_xhdl2075  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE AWLEN_IS6_xhdl197_xhdl2077  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWSIZE_IS6_xhdl198_xhdl2079  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWBURST_IS6_xhdl199_xhdl2081  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWLOCK_IS6_xhdl200_xhdl2083  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWCACHE_IS6_xhdl201_xhdl2085  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWPROT_IS6_xhdl202_xhdl2087  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWVALID_IS6_xhdl203_xhdl2089  : std_logic;
      VARIABLE AWID_IS7_xhdl220_xhdl2091  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE AWADDR_IS7_xhdl221_xhdl2093  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE AWLEN_IS7_xhdl222_xhdl2095  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWSIZE_IS7_xhdl223_xhdl2097  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWBURST_IS7_xhdl224_xhdl2099  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWLOCK_IS7_xhdl225_xhdl2101  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWCACHE_IS7_xhdl226_xhdl2103  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWPROT_IS7_xhdl227_xhdl2105  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWVALID_IS7_xhdl228_xhdl2107  : std_logic;
      VARIABLE AWID_IS8_xhdl245_xhdl2109  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE AWADDR_IS8_xhdl246_xhdl2111  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE AWLEN_IS8_xhdl247_xhdl2113  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWSIZE_IS8_xhdl248_xhdl2115  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWBURST_IS8_xhdl249_xhdl2117  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWLOCK_IS8_xhdl250_xhdl2119  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWCACHE_IS8_xhdl251_xhdl2121  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWPROT_IS8_xhdl252_xhdl2123  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWVALID_IS8_xhdl253_xhdl2125  : std_logic;
      VARIABLE AWID_IS9_xhdl270_xhdl2127  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE AWADDR_IS9_xhdl271_xhdl2129  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE AWLEN_IS9_xhdl272_xhdl2131  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWSIZE_IS9_xhdl273_xhdl2133  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWBURST_IS9_xhdl274_xhdl2135  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWLOCK_IS9_xhdl275_xhdl2137  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWCACHE_IS9_xhdl276_xhdl2139  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWPROT_IS9_xhdl277_xhdl2141  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWVALID_IS9_xhdl278_xhdl2143  : std_logic;
      VARIABLE AWID_IS10_xhdl295_xhdl2145  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE AWADDR_IS10_xhdl296_xhdl2147  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE AWLEN_IS10_xhdl297_xhdl2149  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWSIZE_IS10_xhdl298_xhdl2151  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWBURST_IS10_xhdl299_xhdl2153  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWLOCK_IS10_xhdl300_xhdl2155  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWCACHE_IS10_xhdl301_xhdl2157  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWPROT_IS10_xhdl302_xhdl2159  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWVALID_IS10_xhdl303_xhdl2161  : std_logic;
      VARIABLE AWID_IS11_xhdl320_xhdl2163  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE AWADDR_IS11_xhdl321_xhdl2165  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE AWLEN_IS11_xhdl322_xhdl2167  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWSIZE_IS11_xhdl323_xhdl2169  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWBURST_IS11_xhdl324_xhdl2171  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWLOCK_IS11_xhdl325_xhdl2173  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWCACHE_IS11_xhdl326_xhdl2175  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWPROT_IS11_xhdl327_xhdl2177  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWVALID_IS11_xhdl328_xhdl2179  : std_logic;
      VARIABLE AWID_IS12_xhdl345_xhdl2181  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE AWADDR_IS12_xhdl346_xhdl2183  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE AWLEN_IS12_xhdl347_xhdl2185  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWSIZE_IS12_xhdl348_xhdl2187  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWBURST_IS12_xhdl349_xhdl2189  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWLOCK_IS12_xhdl350_xhdl2191  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWCACHE_IS12_xhdl351_xhdl2193  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWPROT_IS12_xhdl352_xhdl2195  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWVALID_IS12_xhdl353_xhdl2197  : std_logic;
      VARIABLE AWID_IS13_xhdl370_xhdl2199  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE AWADDR_IS13_xhdl371_xhdl2201  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE AWLEN_IS13_xhdl372_xhdl2203  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWSIZE_IS13_xhdl373_xhdl2205  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWBURST_IS13_xhdl374_xhdl2207  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWLOCK_IS13_xhdl375_xhdl2209  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWCACHE_IS13_xhdl376_xhdl2211  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWPROT_IS13_xhdl377_xhdl2213  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWVALID_IS13_xhdl378_xhdl2215  : std_logic;
      VARIABLE AWID_IS14_xhdl395_xhdl2217  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE AWADDR_IS14_xhdl396_xhdl2219  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE AWLEN_IS14_xhdl397_xhdl2221  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWSIZE_IS14_xhdl398_xhdl2223  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWBURST_IS14_xhdl399_xhdl2225  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWLOCK_IS14_xhdl400_xhdl2227  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWCACHE_IS14_xhdl401_xhdl2229  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWPROT_IS14_xhdl402_xhdl2231  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWVALID_IS14_xhdl403_xhdl2233  : std_logic;
      VARIABLE AWID_IS15_xhdl420_xhdl2235  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE AWADDR_IS15_xhdl421_xhdl2237  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE AWLEN_IS15_xhdl422_xhdl2239  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWSIZE_IS15_xhdl423_xhdl2241  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWBURST_IS15_xhdl424_xhdl2243  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWLOCK_IS15_xhdl425_xhdl2245  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWCACHE_IS15_xhdl426_xhdl2247  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWPROT_IS15_xhdl427_xhdl2249  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWVALID_IS15_xhdl428_xhdl2251  : std_logic;
      VARIABLE AWID_IS16_xhdl445_xhdl2252  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE AWADDR_IS16_xhdl446_xhdl2253  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE AWLEN_IS16_xhdl447_xhdl2254  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWSIZE_IS16_xhdl448_xhdl2255  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWBURST_IS16_xhdl449_xhdl2256  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWLOCK_IS16_xhdl450_xhdl2257  : std_logic_vector(1 DOWNTO 0);
      VARIABLE AWCACHE_IS16_xhdl451_xhdl2258  : std_logic_vector(3 DOWNTO 0);
      VARIABLE AWPROT_IS16_xhdl452_xhdl2259  : std_logic_vector(2 DOWNTO 0);
      VARIABLE AWVALID_IS16_xhdl453_xhdl2260  : std_logic;
   BEGIN
      AWID_IS0_xhdl45_xhdl1965 := temp_xhdl1964;    
      AWADDR_IS0_xhdl46_xhdl1967 := temp_xhdl1966;    
      AWLEN_IS0_xhdl47_xhdl1969 := temp_xhdl1968;    
      AWSIZE_IS0_xhdl48_xhdl1971 := temp_xhdl1970;    
      AWBURST_IS0_xhdl49_xhdl1973 := temp_xhdl1972;    
      AWLOCK_IS0_xhdl50_xhdl1975 := temp_xhdl1974;    
      AWCACHE_IS0_xhdl51_xhdl1977 := temp_xhdl1976;    
      AWPROT_IS0_xhdl52_xhdl1979 := temp_xhdl1978;    
      AWVALID_IS0_xhdl53_xhdl1981 := temp_xhdl1980;    
      AWID_IS1_xhdl70_xhdl1983 := temp_xhdl1982;    
      AWADDR_IS1_xhdl71_xhdl1985 := temp_xhdl1984;    
      AWLEN_IS1_xhdl72_xhdl1987 := temp_xhdl1986;    
      AWSIZE_IS1_xhdl73_xhdl1989 := temp_xhdl1988;    
      AWBURST_IS1_xhdl74_xhdl1991 := temp_xhdl1990;    
      AWLOCK_IS1_xhdl75_xhdl1993 := temp_xhdl1992;    
      AWCACHE_IS1_xhdl76_xhdl1995 := temp_xhdl1994;    
      AWPROT_IS1_xhdl77_xhdl1997 := temp_xhdl1996;    
      AWVALID_IS1_xhdl78_xhdl1999 := temp_xhdl1998;    
      AWID_IS2_xhdl95_xhdl2001 := temp_xhdl2000;    
      AWADDR_IS2_xhdl96_xhdl2003 := temp_xhdl2002;    
      AWLEN_IS2_xhdl97_xhdl2005 := temp_xhdl2004;    
      AWSIZE_IS2_xhdl98_xhdl2007 := temp_xhdl2006;    
      AWBURST_IS2_xhdl99_xhdl2009 := temp_xhdl2008;    
      AWLOCK_IS2_xhdl100_xhdl2011 := temp_xhdl2010;    
      AWCACHE_IS2_xhdl101_xhdl2013 := temp_xhdl2012;    
      AWPROT_IS2_xhdl102_xhdl2015 := temp_xhdl2014;    
      AWVALID_IS2_xhdl103_xhdl2017 := temp_xhdl2016;    
      AWID_IS3_xhdl120_xhdl2019 := temp_xhdl2018;    
      AWADDR_IS3_xhdl121_xhdl2021 := temp_xhdl2020;    
      AWLEN_IS3_xhdl122_xhdl2023 := temp_xhdl2022;    
      AWSIZE_IS3_xhdl123_xhdl2025 := temp_xhdl2024;    
      AWBURST_IS3_xhdl124_xhdl2027 := temp_xhdl2026;    
      AWLOCK_IS3_xhdl125_xhdl2029 := temp_xhdl2028;    
      AWCACHE_IS3_xhdl126_xhdl2031 := temp_xhdl2030;    
      AWPROT_IS3_xhdl127_xhdl2033 := temp_xhdl2032;    
      AWVALID_IS3_xhdl128_xhdl2035 := temp_xhdl2034;    
      AWID_IS4_xhdl145_xhdl2037 := temp_xhdl2036;    
      AWADDR_IS4_xhdl146_xhdl2039 := temp_xhdl2038;    
      AWLEN_IS4_xhdl147_xhdl2041 := temp_xhdl2040;    
      AWSIZE_IS4_xhdl148_xhdl2043 := temp_xhdl2042;    
      AWBURST_IS4_xhdl149_xhdl2045 := temp_xhdl2044;    
      AWLOCK_IS4_xhdl150_xhdl2047 := temp_xhdl2046;    
      AWCACHE_IS4_xhdl151_xhdl2049 := temp_xhdl2048;    
      AWPROT_IS4_xhdl152_xhdl2051 := temp_xhdl2050;    
      AWVALID_IS4_xhdl153_xhdl2053 := temp_xhdl2052;    
      AWID_IS5_xhdl170_xhdl2055 := temp_xhdl2054;    
      AWADDR_IS5_xhdl171_xhdl2057 := temp_xhdl2056;    
      AWLEN_IS5_xhdl172_xhdl2059 := temp_xhdl2058;    
      AWSIZE_IS5_xhdl173_xhdl2061 := temp_xhdl2060;    
      AWBURST_IS5_xhdl174_xhdl2063 := temp_xhdl2062;    
      AWLOCK_IS5_xhdl175_xhdl2065 := temp_xhdl2064;    
      AWCACHE_IS5_xhdl176_xhdl2067 := temp_xhdl2066;    
      AWPROT_IS5_xhdl177_xhdl2069 := temp_xhdl2068;    
      AWVALID_IS5_xhdl178_xhdl2071 := temp_xhdl2070;    
      AWID_IS6_xhdl195_xhdl2073 := temp_xhdl2072;    
      AWADDR_IS6_xhdl196_xhdl2075 := temp_xhdl2074;    
      AWLEN_IS6_xhdl197_xhdl2077 := temp_xhdl2076;    
      AWSIZE_IS6_xhdl198_xhdl2079 := temp_xhdl2078;    
      AWBURST_IS6_xhdl199_xhdl2081 := temp_xhdl2080;    
      AWLOCK_IS6_xhdl200_xhdl2083 := temp_xhdl2082;    
      AWCACHE_IS6_xhdl201_xhdl2085 := temp_xhdl2084;    
      AWPROT_IS6_xhdl202_xhdl2087 := temp_xhdl2086;    
      AWVALID_IS6_xhdl203_xhdl2089 := temp_xhdl2088;    
      AWID_IS7_xhdl220_xhdl2091 := temp_xhdl2090;    
      AWADDR_IS7_xhdl221_xhdl2093 := temp_xhdl2092;    
      AWLEN_IS7_xhdl222_xhdl2095 := temp_xhdl2094;    
      AWSIZE_IS7_xhdl223_xhdl2097 := temp_xhdl2096;    
      AWBURST_IS7_xhdl224_xhdl2099 := temp_xhdl2098;    
      AWLOCK_IS7_xhdl225_xhdl2101 := temp_xhdl2100;    
      AWCACHE_IS7_xhdl226_xhdl2103 := temp_xhdl2102;    
      AWPROT_IS7_xhdl227_xhdl2105 := temp_xhdl2104;    
      AWVALID_IS7_xhdl228_xhdl2107 := temp_xhdl2106;    
      AWID_IS8_xhdl245_xhdl2109 := temp_xhdl2108;    
      AWADDR_IS8_xhdl246_xhdl2111 := temp_xhdl2110;    
      AWLEN_IS8_xhdl247_xhdl2113 := temp_xhdl2112;    
      AWSIZE_IS8_xhdl248_xhdl2115 := temp_xhdl2114;    
      AWBURST_IS8_xhdl249_xhdl2117 := temp_xhdl2116;    
      AWLOCK_IS8_xhdl250_xhdl2119 := temp_xhdl2118;    
      AWCACHE_IS8_xhdl251_xhdl2121 := temp_xhdl2120;    
      AWPROT_IS8_xhdl252_xhdl2123 := temp_xhdl2122;    
      AWVALID_IS8_xhdl253_xhdl2125 := temp_xhdl2124;    
      AWID_IS9_xhdl270_xhdl2127 := temp_xhdl2126;    
      AWADDR_IS9_xhdl271_xhdl2129 := temp_xhdl2128;    
      AWLEN_IS9_xhdl272_xhdl2131 := temp_xhdl2130;    
      AWSIZE_IS9_xhdl273_xhdl2133 := temp_xhdl2132;    
      AWBURST_IS9_xhdl274_xhdl2135 := temp_xhdl2134;    
      AWLOCK_IS9_xhdl275_xhdl2137 := temp_xhdl2136;    
      AWCACHE_IS9_xhdl276_xhdl2139 := temp_xhdl2138;    
      AWPROT_IS9_xhdl277_xhdl2141 := temp_xhdl2140;    
      AWVALID_IS9_xhdl278_xhdl2143 := temp_xhdl2142;    
      AWID_IS10_xhdl295_xhdl2145 := temp_xhdl2144;    
      AWADDR_IS10_xhdl296_xhdl2147 := temp_xhdl2146;    
      AWLEN_IS10_xhdl297_xhdl2149 := temp_xhdl2148;    
      AWSIZE_IS10_xhdl298_xhdl2151 := temp_xhdl2150;    
      AWBURST_IS10_xhdl299_xhdl2153 := temp_xhdl2152;    
      AWLOCK_IS10_xhdl300_xhdl2155 := temp_xhdl2154;    
      AWCACHE_IS10_xhdl301_xhdl2157 := temp_xhdl2156;    
      AWPROT_IS10_xhdl302_xhdl2159 := temp_xhdl2158;    
      AWVALID_IS10_xhdl303_xhdl2161 := temp_xhdl2160;    
      AWID_IS11_xhdl320_xhdl2163 := temp_xhdl2162;    
      AWADDR_IS11_xhdl321_xhdl2165 := temp_xhdl2164;    
      AWLEN_IS11_xhdl322_xhdl2167 := temp_xhdl2166;    
      AWSIZE_IS11_xhdl323_xhdl2169 := temp_xhdl2168;    
      AWBURST_IS11_xhdl324_xhdl2171 := temp_xhdl2170;    
      AWLOCK_IS11_xhdl325_xhdl2173 := temp_xhdl2172;    
      AWCACHE_IS11_xhdl326_xhdl2175 := temp_xhdl2174;    
      AWPROT_IS11_xhdl327_xhdl2177 := temp_xhdl2176;    
      AWVALID_IS11_xhdl328_xhdl2179 := temp_xhdl2178;    
      AWID_IS12_xhdl345_xhdl2181 := temp_xhdl2180;    
      AWADDR_IS12_xhdl346_xhdl2183 := temp_xhdl2182;    
      AWLEN_IS12_xhdl347_xhdl2185 := temp_xhdl2184;    
      AWSIZE_IS12_xhdl348_xhdl2187 := temp_xhdl2186;    
      AWBURST_IS12_xhdl349_xhdl2189 := temp_xhdl2188;    
      AWLOCK_IS12_xhdl350_xhdl2191 := temp_xhdl2190;    
      AWCACHE_IS12_xhdl351_xhdl2193 := temp_xhdl2192;    
      AWPROT_IS12_xhdl352_xhdl2195 := temp_xhdl2194;    
      AWVALID_IS12_xhdl353_xhdl2197 := temp_xhdl2196;    
      AWID_IS13_xhdl370_xhdl2199 := temp_xhdl2198;    
      AWADDR_IS13_xhdl371_xhdl2201 := temp_xhdl2200;    
      AWLEN_IS13_xhdl372_xhdl2203 := temp_xhdl2202;    
      AWSIZE_IS13_xhdl373_xhdl2205 := temp_xhdl2204;    
      AWBURST_IS13_xhdl374_xhdl2207 := temp_xhdl2206;    
      AWLOCK_IS13_xhdl375_xhdl2209 := temp_xhdl2208;    
      AWCACHE_IS13_xhdl376_xhdl2211 := temp_xhdl2210;    
      AWPROT_IS13_xhdl377_xhdl2213 := temp_xhdl2212;    
      AWVALID_IS13_xhdl378_xhdl2215 := temp_xhdl2214;    
      AWID_IS14_xhdl395_xhdl2217 := temp_xhdl2216;    
      AWADDR_IS14_xhdl396_xhdl2219 := temp_xhdl2218;    
      AWLEN_IS14_xhdl397_xhdl2221 := temp_xhdl2220;    
      AWSIZE_IS14_xhdl398_xhdl2223 := temp_xhdl2222;    
      AWBURST_IS14_xhdl399_xhdl2225 := temp_xhdl2224;    
      AWLOCK_IS14_xhdl400_xhdl2227 := temp_xhdl2226;    
      AWCACHE_IS14_xhdl401_xhdl2229 := temp_xhdl2228;    
      AWPROT_IS14_xhdl402_xhdl2231 := temp_xhdl2230;    
      AWVALID_IS14_xhdl403_xhdl2233 := temp_xhdl2232;    
      AWID_IS15_xhdl420_xhdl2235 := temp_xhdl2234;    
      AWADDR_IS15_xhdl421_xhdl2237 := temp_xhdl2236;    
      AWLEN_IS15_xhdl422_xhdl2239 := temp_xhdl2238;    
      AWSIZE_IS15_xhdl423_xhdl2241 := temp_xhdl2240;    
      AWBURST_IS15_xhdl424_xhdl2243 := temp_xhdl2242;    
      AWLOCK_IS15_xhdl425_xhdl2245 := temp_xhdl2244;    
      AWCACHE_IS15_xhdl426_xhdl2247 := temp_xhdl2246;    
      AWPROT_IS15_xhdl427_xhdl2249 := temp_xhdl2248;    
      AWVALID_IS15_xhdl428_xhdl2251 := temp_xhdl2250;    
      IF ( (MEMSPACE = 0 AND ADDR_HGS_CFG = 1 AND  AWVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) > "0111")) OR (MEMSPACE = 0
      AND ADDR_HGS_CFG = 0 AND AWVALID_IS16_gated_r = '1' AND  (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) < "1000")) OR (MEMSPACE > 0 AND SC_0 = 1 AND 
      AWVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) = "0000")) OR (MEMSPACE > 0 AND SC_1 = 1 AND AWVALID_IS16_gated_r = '1' AND
      (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) = "0001")) OR (MEMSPACE > 0 AND SC_2 = 1 AND AWVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) = "0010")) OR (MEMSPACE > 0 AND SC_3 = 1 AND AWVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) = "0011")) OR (MEMSPACE > 0 AND SC_4 = 1 AND AWVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) = "0100")) OR (MEMSPACE > 0 AND SC_5 = 1 AND AWVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) = "0101")) OR (MEMSPACE > 0 AND SC_6 = 1 AND AWVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) = "0110")) OR (MEMSPACE > 0 AND SC_7 = 1 AND AWVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) = "0111")) OR (MEMSPACE > 0 AND SC_8 = 1 AND AWVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) = "1000")) OR (MEMSPACE > 0 AND SC_9 = 1 AND AWVALID_IS16_gated_r = '1' AND 
      (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) = "1001")) OR (MEMSPACE > 0 AND SC_10 = 1 AND 
      AWVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) = "1010")) OR (MEMSPACE > 0 AND 
      SC_11 = 1 AND AWVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) = "1011")) OR (MEMSPACE > 0 AND SC_12 = 1 AND 
      AWVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) = "1100")) OR (MEMSPACE > 0 AND 
      SC_13 = 1 AND AWVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) = "1101")) OR (MEMSPACE > 0 AND SC_14 = 1 AND 
      AWVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) = "1110")) OR (MEMSPACE > 0 AND 
      SC_15 = 1 AND AWVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) = "1111"))) THEN
         AWID_IS16_xhdl445_xhdl2252 := AWID_IS16_gated;    
         AWADDR_IS16_xhdl446_xhdl2253 := AWADDR_IS16_gated;    
         AWLEN_IS16_xhdl447_xhdl2254 := AWLEN_IS16_gated;    
         AWSIZE_IS16_xhdl448_xhdl2255 := AWSIZE_IS16_gated;    
         AWBURST_IS16_xhdl449_xhdl2256 := AWBURST_IS16_gated;    
         AWLOCK_IS16_xhdl450_xhdl2257 := AWLOCK_IS16_gated;    
         AWCACHE_IS16_xhdl451_xhdl2258 := AWCACHE_IS16_gated;    
         AWPROT_IS16_xhdl452_xhdl2259 := AWPROT_IS16_gated;    
         AWVALID_IS16_xhdl453_xhdl2260 := AWVALID_IS16_gated;    
      -- if ((MEMSPACE == 0 && ADDR_HGS_CFG == 1'b1 && AWADDR_IS16_gated_r[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] > 4'h7)...
      
      ELSE
         AWID_IS16_xhdl445_xhdl2252 := (OTHERS => '0');    
         AWADDR_IS16_xhdl446_xhdl2253 := (OTHERS => '0');    
         AWLEN_IS16_xhdl447_xhdl2254 := (OTHERS => '0');        
         AWSIZE_IS16_xhdl448_xhdl2255 := (OTHERS => '0');    
         AWBURST_IS16_xhdl449_xhdl2256 := (OTHERS => '0');    
         AWLOCK_IS16_xhdl450_xhdl2257 := (OTHERS => '0');    
         AWCACHE_IS16_xhdl451_xhdl2258 := (OTHERS => '0');    
         AWPROT_IS16_xhdl452_xhdl2259 := (OTHERS => '0');    
         AWVALID_IS16_xhdl453_xhdl2260 := '0';    
      END IF;
      AWID_IS0_xhdl45 <= AWID_IS0_xhdl45_xhdl1965;
      AWADDR_IS0_xhdl46 <= AWADDR_IS0_xhdl46_xhdl1967;
      AWLEN_IS0_xhdl47 <= AWLEN_IS0_xhdl47_xhdl1969;
      AWSIZE_IS0_xhdl48 <= AWSIZE_IS0_xhdl48_xhdl1971;
      AWBURST_IS0_xhdl49 <= AWBURST_IS0_xhdl49_xhdl1973;
      AWLOCK_IS0_xhdl50 <= AWLOCK_IS0_xhdl50_xhdl1975;
      AWCACHE_IS0_xhdl51 <= AWCACHE_IS0_xhdl51_xhdl1977;
      AWPROT_IS0_xhdl52 <= AWPROT_IS0_xhdl52_xhdl1979;
      AWVALID_IS0_xhdl53 <= AWVALID_IS0_xhdl53_xhdl1981;
      AWID_IS1_xhdl70 <= AWID_IS1_xhdl70_xhdl1983;
      AWADDR_IS1_xhdl71 <= AWADDR_IS1_xhdl71_xhdl1985;
      AWLEN_IS1_xhdl72 <= AWLEN_IS1_xhdl72_xhdl1987;
      AWSIZE_IS1_xhdl73 <= AWSIZE_IS1_xhdl73_xhdl1989;
      AWBURST_IS1_xhdl74 <= AWBURST_IS1_xhdl74_xhdl1991;
      AWLOCK_IS1_xhdl75 <= AWLOCK_IS1_xhdl75_xhdl1993;
      AWCACHE_IS1_xhdl76 <= AWCACHE_IS1_xhdl76_xhdl1995;
      AWPROT_IS1_xhdl77 <= AWPROT_IS1_xhdl77_xhdl1997;
      AWVALID_IS1_xhdl78 <= AWVALID_IS1_xhdl78_xhdl1999;
      AWID_IS2_xhdl95 <= AWID_IS2_xhdl95_xhdl2001;
      AWADDR_IS2_xhdl96 <= AWADDR_IS2_xhdl96_xhdl2003;
      AWLEN_IS2_xhdl97 <= AWLEN_IS2_xhdl97_xhdl2005;
      AWSIZE_IS2_xhdl98 <= AWSIZE_IS2_xhdl98_xhdl2007;
      AWBURST_IS2_xhdl99 <= AWBURST_IS2_xhdl99_xhdl2009;
      AWLOCK_IS2_xhdl100 <= AWLOCK_IS2_xhdl100_xhdl2011;
      AWCACHE_IS2_xhdl101 <= AWCACHE_IS2_xhdl101_xhdl2013;
      AWPROT_IS2_xhdl102 <= AWPROT_IS2_xhdl102_xhdl2015;
      AWVALID_IS2_xhdl103 <= AWVALID_IS2_xhdl103_xhdl2017;
      AWID_IS3_xhdl120 <= AWID_IS3_xhdl120_xhdl2019;
      AWADDR_IS3_xhdl121 <= AWADDR_IS3_xhdl121_xhdl2021;
      AWLEN_IS3_xhdl122 <= AWLEN_IS3_xhdl122_xhdl2023;
      AWSIZE_IS3_xhdl123 <= AWSIZE_IS3_xhdl123_xhdl2025;
      AWBURST_IS3_xhdl124 <= AWBURST_IS3_xhdl124_xhdl2027;
      AWLOCK_IS3_xhdl125 <= AWLOCK_IS3_xhdl125_xhdl2029;
      AWCACHE_IS3_xhdl126 <= AWCACHE_IS3_xhdl126_xhdl2031;
      AWPROT_IS3_xhdl127 <= AWPROT_IS3_xhdl127_xhdl2033;
      AWVALID_IS3_xhdl128 <= AWVALID_IS3_xhdl128_xhdl2035;
      AWID_IS4_xhdl145 <= AWID_IS4_xhdl145_xhdl2037;
      AWADDR_IS4_xhdl146 <= AWADDR_IS4_xhdl146_xhdl2039;
      AWLEN_IS4_xhdl147 <= AWLEN_IS4_xhdl147_xhdl2041;
      AWSIZE_IS4_xhdl148 <= AWSIZE_IS4_xhdl148_xhdl2043;
      AWBURST_IS4_xhdl149 <= AWBURST_IS4_xhdl149_xhdl2045;
      AWLOCK_IS4_xhdl150 <= AWLOCK_IS4_xhdl150_xhdl2047;
      AWCACHE_IS4_xhdl151 <= AWCACHE_IS4_xhdl151_xhdl2049;
      AWPROT_IS4_xhdl152 <= AWPROT_IS4_xhdl152_xhdl2051;
      AWVALID_IS4_xhdl153 <= AWVALID_IS4_xhdl153_xhdl2053;
      AWID_IS5_xhdl170 <= AWID_IS5_xhdl170_xhdl2055;
      AWADDR_IS5_xhdl171 <= AWADDR_IS5_xhdl171_xhdl2057;
      AWLEN_IS5_xhdl172 <= AWLEN_IS5_xhdl172_xhdl2059;
      AWSIZE_IS5_xhdl173 <= AWSIZE_IS5_xhdl173_xhdl2061;
      AWBURST_IS5_xhdl174 <= AWBURST_IS5_xhdl174_xhdl2063;
      AWLOCK_IS5_xhdl175 <= AWLOCK_IS5_xhdl175_xhdl2065;
      AWCACHE_IS5_xhdl176 <= AWCACHE_IS5_xhdl176_xhdl2067;
      AWPROT_IS5_xhdl177 <= AWPROT_IS5_xhdl177_xhdl2069;
      AWVALID_IS5_xhdl178 <= AWVALID_IS5_xhdl178_xhdl2071;
      AWID_IS6_xhdl195 <= AWID_IS6_xhdl195_xhdl2073;
      AWADDR_IS6_xhdl196 <= AWADDR_IS6_xhdl196_xhdl2075;
      AWLEN_IS6_xhdl197 <= AWLEN_IS6_xhdl197_xhdl2077;
      AWSIZE_IS6_xhdl198 <= AWSIZE_IS6_xhdl198_xhdl2079;
      AWBURST_IS6_xhdl199 <= AWBURST_IS6_xhdl199_xhdl2081;
      AWLOCK_IS6_xhdl200 <= AWLOCK_IS6_xhdl200_xhdl2083;
      AWCACHE_IS6_xhdl201 <= AWCACHE_IS6_xhdl201_xhdl2085;
      AWPROT_IS6_xhdl202 <= AWPROT_IS6_xhdl202_xhdl2087;
      AWVALID_IS6_xhdl203 <= AWVALID_IS6_xhdl203_xhdl2089;
      AWID_IS7_xhdl220 <= AWID_IS7_xhdl220_xhdl2091;
      AWADDR_IS7_xhdl221 <= AWADDR_IS7_xhdl221_xhdl2093;
      AWLEN_IS7_xhdl222 <= AWLEN_IS7_xhdl222_xhdl2095;
      AWSIZE_IS7_xhdl223 <= AWSIZE_IS7_xhdl223_xhdl2097;
      AWBURST_IS7_xhdl224 <= AWBURST_IS7_xhdl224_xhdl2099;
      AWLOCK_IS7_xhdl225 <= AWLOCK_IS7_xhdl225_xhdl2101;
      AWCACHE_IS7_xhdl226 <= AWCACHE_IS7_xhdl226_xhdl2103;
      AWPROT_IS7_xhdl227 <= AWPROT_IS7_xhdl227_xhdl2105;
      AWVALID_IS7_xhdl228 <= AWVALID_IS7_xhdl228_xhdl2107;
      AWID_IS8_xhdl245 <= AWID_IS8_xhdl245_xhdl2109;
      AWADDR_IS8_xhdl246 <= AWADDR_IS8_xhdl246_xhdl2111;
      AWLEN_IS8_xhdl247 <= AWLEN_IS8_xhdl247_xhdl2113;
      AWSIZE_IS8_xhdl248 <= AWSIZE_IS8_xhdl248_xhdl2115;
      AWBURST_IS8_xhdl249 <= AWBURST_IS8_xhdl249_xhdl2117;
      AWLOCK_IS8_xhdl250 <= AWLOCK_IS8_xhdl250_xhdl2119;
      AWCACHE_IS8_xhdl251 <= AWCACHE_IS8_xhdl251_xhdl2121;
      AWPROT_IS8_xhdl252 <= AWPROT_IS8_xhdl252_xhdl2123;
      AWVALID_IS8_xhdl253 <= AWVALID_IS8_xhdl253_xhdl2125;
      AWID_IS9_xhdl270 <= AWID_IS9_xhdl270_xhdl2127;
      AWADDR_IS9_xhdl271 <= AWADDR_IS9_xhdl271_xhdl2129;
      AWLEN_IS9_xhdl272 <= AWLEN_IS9_xhdl272_xhdl2131;
      AWSIZE_IS9_xhdl273 <= AWSIZE_IS9_xhdl273_xhdl2133;
      AWBURST_IS9_xhdl274 <= AWBURST_IS9_xhdl274_xhdl2135;
      AWLOCK_IS9_xhdl275 <= AWLOCK_IS9_xhdl275_xhdl2137;
      AWCACHE_IS9_xhdl276 <= AWCACHE_IS9_xhdl276_xhdl2139;
      AWPROT_IS9_xhdl277 <= AWPROT_IS9_xhdl277_xhdl2141;
      AWVALID_IS9_xhdl278 <= AWVALID_IS9_xhdl278_xhdl2143;
      AWID_IS10_xhdl295 <= AWID_IS10_xhdl295_xhdl2145;
      AWADDR_IS10_xhdl296 <= AWADDR_IS10_xhdl296_xhdl2147;
      AWLEN_IS10_xhdl297 <= AWLEN_IS10_xhdl297_xhdl2149;
      AWSIZE_IS10_xhdl298 <= AWSIZE_IS10_xhdl298_xhdl2151;
      AWBURST_IS10_xhdl299 <= AWBURST_IS10_xhdl299_xhdl2153;
      AWLOCK_IS10_xhdl300 <= AWLOCK_IS10_xhdl300_xhdl2155;
      AWCACHE_IS10_xhdl301 <= AWCACHE_IS10_xhdl301_xhdl2157;
      AWPROT_IS10_xhdl302 <= AWPROT_IS10_xhdl302_xhdl2159;
      AWVALID_IS10_xhdl303 <= AWVALID_IS10_xhdl303_xhdl2161;
      AWID_IS11_xhdl320 <= AWID_IS11_xhdl320_xhdl2163;
      AWADDR_IS11_xhdl321 <= AWADDR_IS11_xhdl321_xhdl2165;
      AWLEN_IS11_xhdl322 <= AWLEN_IS11_xhdl322_xhdl2167;
      AWSIZE_IS11_xhdl323 <= AWSIZE_IS11_xhdl323_xhdl2169;
      AWBURST_IS11_xhdl324 <= AWBURST_IS11_xhdl324_xhdl2171;
      AWLOCK_IS11_xhdl325 <= AWLOCK_IS11_xhdl325_xhdl2173;
      AWCACHE_IS11_xhdl326 <= AWCACHE_IS11_xhdl326_xhdl2175;
      AWPROT_IS11_xhdl327 <= AWPROT_IS11_xhdl327_xhdl2177;
      AWVALID_IS11_xhdl328 <= AWVALID_IS11_xhdl328_xhdl2179;
      AWID_IS12_xhdl345 <= AWID_IS12_xhdl345_xhdl2181;
      AWADDR_IS12_xhdl346 <= AWADDR_IS12_xhdl346_xhdl2183;
      AWLEN_IS12_xhdl347 <= AWLEN_IS12_xhdl347_xhdl2185;
      AWSIZE_IS12_xhdl348 <= AWSIZE_IS12_xhdl348_xhdl2187;
      AWBURST_IS12_xhdl349 <= AWBURST_IS12_xhdl349_xhdl2189;
      AWLOCK_IS12_xhdl350 <= AWLOCK_IS12_xhdl350_xhdl2191;
      AWCACHE_IS12_xhdl351 <= AWCACHE_IS12_xhdl351_xhdl2193;
      AWPROT_IS12_xhdl352 <= AWPROT_IS12_xhdl352_xhdl2195;
      AWVALID_IS12_xhdl353 <= AWVALID_IS12_xhdl353_xhdl2197;
      AWID_IS13_xhdl370 <= AWID_IS13_xhdl370_xhdl2199;
      AWADDR_IS13_xhdl371 <= AWADDR_IS13_xhdl371_xhdl2201;
      AWLEN_IS13_xhdl372 <= AWLEN_IS13_xhdl372_xhdl2203;
      AWSIZE_IS13_xhdl373 <= AWSIZE_IS13_xhdl373_xhdl2205;
      AWBURST_IS13_xhdl374 <= AWBURST_IS13_xhdl374_xhdl2207;
      AWLOCK_IS13_xhdl375 <= AWLOCK_IS13_xhdl375_xhdl2209;
      AWCACHE_IS13_xhdl376 <= AWCACHE_IS13_xhdl376_xhdl2211;
      AWPROT_IS13_xhdl377 <= AWPROT_IS13_xhdl377_xhdl2213;
      AWVALID_IS13_xhdl378 <= AWVALID_IS13_xhdl378_xhdl2215;
      AWID_IS14_xhdl395 <= AWID_IS14_xhdl395_xhdl2217;
      AWADDR_IS14_xhdl396 <= AWADDR_IS14_xhdl396_xhdl2219;
      AWLEN_IS14_xhdl397 <= AWLEN_IS14_xhdl397_xhdl2221;
      AWSIZE_IS14_xhdl398 <= AWSIZE_IS14_xhdl398_xhdl2223;
      AWBURST_IS14_xhdl399 <= AWBURST_IS14_xhdl399_xhdl2225;
      AWLOCK_IS14_xhdl400 <= AWLOCK_IS14_xhdl400_xhdl2227;
      AWCACHE_IS14_xhdl401 <= AWCACHE_IS14_xhdl401_xhdl2229;
      AWPROT_IS14_xhdl402 <= AWPROT_IS14_xhdl402_xhdl2231;
      AWVALID_IS14_xhdl403 <= AWVALID_IS14_xhdl403_xhdl2233;
      AWID_IS15_xhdl420 <= AWID_IS15_xhdl420_xhdl2235;
      AWADDR_IS15_xhdl421 <= AWADDR_IS15_xhdl421_xhdl2237;
      AWLEN_IS15_xhdl422 <= AWLEN_IS15_xhdl422_xhdl2239;
      AWSIZE_IS15_xhdl423 <= AWSIZE_IS15_xhdl423_xhdl2241;
      AWBURST_IS15_xhdl424 <= AWBURST_IS15_xhdl424_xhdl2243;
      AWLOCK_IS15_xhdl425 <= AWLOCK_IS15_xhdl425_xhdl2245;
      AWCACHE_IS15_xhdl426 <= AWCACHE_IS15_xhdl426_xhdl2247;
      AWPROT_IS15_xhdl427 <= AWPROT_IS15_xhdl427_xhdl2249;
      AWVALID_IS15_xhdl428 <= AWVALID_IS15_xhdl428_xhdl2251;
      AWID_IS16_xhdl445 <= AWID_IS16_xhdl445_xhdl2252;
      AWADDR_IS16_xhdl446 <= AWADDR_IS16_xhdl446_xhdl2253;
      AWLEN_IS16_xhdl447 <= AWLEN_IS16_xhdl447_xhdl2254;
      AWSIZE_IS16_xhdl448 <= AWSIZE_IS16_xhdl448_xhdl2255;
      AWBURST_IS16_xhdl449 <= AWBURST_IS16_xhdl449_xhdl2256;
      AWLOCK_IS16_xhdl450 <= AWLOCK_IS16_xhdl450_xhdl2257;
      AWCACHE_IS16_xhdl451 <= AWCACHE_IS16_xhdl451_xhdl2258;
      AWPROT_IS16_xhdl452 <= AWPROT_IS16_xhdl452_xhdl2259;
      AWVALID_IS16_xhdl453 <= AWVALID_IS16_xhdl453_xhdl2260;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         AWADDR_IS16_gated_r <= (OTHERS => '0');    
         AWVALID_IS16_gated_r <= '0';    
         WVALID_IS16_gated_r <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         AWADDR_IS16_gated_r <= (OTHERS => '0');    
         AWVALID_IS16_gated_r <= '0';    
         WVALID_IS16_gated_r <= '0';    ELSE 
         AWADDR_IS16_gated_r <= AWADDR_IS16_gated;    
         AWVALID_IS16_gated_r <= AWVALID_IS16_gated;    
         WVALID_IS16_gated_r <= WVALID_IS16_gated;    
      END IF;
      END IF;
   END PROCESS;

   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         ARADDR_IS16_gated_r <= (OTHERS => '0');    
         ARVALID_IS16_gated_r <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         ARADDR_IS16_gated_r <= (OTHERS => '0');    
         ARVALID_IS16_gated_r <= '0';    ELSE 
         ARADDR_IS16_gated_r <= ARADDR_IS16_gated;    
         ARVALID_IS16_gated_r <= ARVALID_IS16_gated;    
      END IF;
      END IF;
      
   END PROCESS;
   temp_xhdl2261 <= WID_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2263 <= WDATA_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE 
   (OTHERS => '0');
   temp_xhdl2265 <= WSTRB_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');    
   temp_xhdl2267 <= WLAST_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2269 <= WVALID_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2271 <= WID_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2273 <= WDATA_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE 
   (OTHERS => '0');
   temp_xhdl2275 <= WSTRB_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');    
   temp_xhdl2277 <= WLAST_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2279 <= WVALID_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2281 <= WID_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2283 <= WDATA_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE 
   (OTHERS => '0');
   temp_xhdl2285 <= WSTRB_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');    
   temp_xhdl2287 <= WLAST_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2289 <= WVALID_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2291 <= WID_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2293 <= WDATA_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE 
   (OTHERS => '0');
   temp_xhdl2295 <= WSTRB_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');    
   temp_xhdl2297 <= WLAST_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2299 <= WVALID_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2301 <= WID_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2303 <= WDATA_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE 
   (OTHERS => '0');
   temp_xhdl2305 <= WSTRB_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');    
   temp_xhdl2307 <= WLAST_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2309 <= WVALID_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2311 <= WID_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2313 <= WDATA_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE 
   (OTHERS => '0');
   temp_xhdl2315 <= WSTRB_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');    
   temp_xhdl2317 <= WLAST_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2319 <= WVALID_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2321 <= WID_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2323 <= WDATA_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE 
   (OTHERS => '0');
   temp_xhdl2325 <= WSTRB_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');    
   temp_xhdl2327 <= WLAST_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2329 <= WVALID_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2331 <= WID_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2333 <= WDATA_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE 
   (OTHERS => '0');
   temp_xhdl2335 <= WSTRB_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');    
   temp_xhdl2337 <= WLAST_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2339 <= WVALID_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2341 <= WID_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2343 <= WDATA_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE 
   (OTHERS => '0');
   temp_xhdl2345 <= WSTRB_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');    
   temp_xhdl2347 <= WLAST_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2349 <= WVALID_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2351 <= WID_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2353 <= WDATA_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE 
   (OTHERS => '0');
   temp_xhdl2355 <= WSTRB_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');    
   temp_xhdl2357 <= WLAST_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2359 <= WVALID_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2361 <= WID_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2363 <= WDATA_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE 
   (OTHERS => '0');
   temp_xhdl2365 <= WSTRB_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');    
   temp_xhdl2367 <= WLAST_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2369 <= WVALID_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2371 <= WID_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2373 <= WDATA_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE 
   (OTHERS => '0');
   temp_xhdl2375 <= WSTRB_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');    
   temp_xhdl2377 <= WLAST_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2379 <= WVALID_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2381 <= WID_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2383 <= WDATA_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE 
   (OTHERS => '0');
   temp_xhdl2385 <= WSTRB_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');    
   temp_xhdl2387 <= WLAST_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2389 <= WVALID_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2391 <= WID_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2393 <= WDATA_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE 
   (OTHERS => '0');
   temp_xhdl2395 <= WSTRB_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');    
   temp_xhdl2397 <= WLAST_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2399 <= WVALID_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2401 <= WID_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2403 <= WDATA_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE 
   (OTHERS => '0');
   temp_xhdl2405 <= WSTRB_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');    
   temp_xhdl2407 <= WLAST_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2409 <= WVALID_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2411 <= WID_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2413 <= WDATA_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE 
   (OTHERS => '0');
   temp_xhdl2415 <= WSTRB_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');    
   temp_xhdl2417 <= WLAST_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2419 <= WVALID_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';

   
   PROCESS (WID_IS0_gated, WVALID_IS13_gated, WSTRB_IS6_gated, WDATA_IS13_gated,
   WDATA_IS6_gated, WLAST_IS11_gated, WVALID_IS1_gated, WVALID_IS10_gated, 
   WSTRB_IS3_gated, WDATA_IS10_gated, WLAST_IS9_gated, WDATA_IS3_gated, 
   WID_IS7_gated, WID_IS16_gated, WSTRB_IS16_gated, 
   WVALID_IS8_gated, WSTRB_IS0_gated, WLAST_IS6_gated, 
   WDATA_IS0_gated, WID_IS4_gated, WID_IS13_gated, WLAST_IS15_gated, 
   WSTRB_IS13_gated, WVALID_IS5_gated, WLAST_IS3_gated, 
   WID_IS1_gated, WVALID_IS14_gated, WID_IS10_gated, 
   WSTRB_IS7_gated, AWVALID_IS16_gated, WDATA_IS14_gated, WDATA_IS7_gated, 
   WLAST_IS12_gated, WSTRB_IS10_gated, WVALID_IS2_gated, AWADDR_IS16_gated_r, 
   WLAST_IS0_gated, WVALID_IS11_gated, WSTRB_IS4_gated, 
   WDATA_IS11_gated, WDATA_IS4_gated, WID_IS8_gated, WVALID_IS9_gated, 
   WSTRB_IS1_gated, WDATA_IS1_gated, WLAST_IS7_gated, WID_IS5_gated, 
   WID_IS14_gated, WVALID_IS16_gated_r, AWADDR_IS16_gated, WLAST_IS16_gated, 
   WSTRB_IS14_gated, WVALID_IS6_gated, WLAST_IS4_gated, 
   WID_IS2_gated, WVALID_IS15_gated, WID_IS11_gated, 
   WSTRB_IS8_gated, WDATA_IS15_gated, WDATA_IS8_gated, 
   WLAST_IS13_gated, WSTRB_IS11_gated, ARVALID_IS16_gated, WVALID_IS3_gated, 
   WLAST_IS1_gated, WVALID_IS12_gated, WSTRB_IS5_gated, WDATA_IS12_gated, 
   WDATA_IS5_gated, WID_IS9_gated, WLAST_IS10_gated, WVALID_IS0_gated, 
   WSTRB_IS2_gated, WDATA_IS2_gated, WLAST_IS8_gated, WID_IS6_gated, 
   WID_IS15_gated, WSTRB_IS15_gated, WVALID_IS7_gated, WLAST_IS5_gated,
   WID_IS3_gated, WVALID_IS16_gated, ARADDR_IS16_gated, WID_IS12_gated, 
   WSTRB_IS9_gated, WDATA_IS16_gated, WDATA_IS9_gated, WLAST_IS14_gated, 
   WSTRB_IS12_gated, WVALID_IS4_gated, WLAST_IS2_gated,    
   temp_xhdl2261,temp_xhdl2263,temp_xhdl2265,   temp_xhdl2267,   temp_xhdl2269,   temp_xhdl2271,   temp_xhdl2273,   temp_xhdl2275,   temp_xhdl2277,   temp_xhdl2279,   temp_xhdl2281,   temp_xhdl2283,   temp_xhdl2285,   temp_xhdl2287,   temp_xhdl2289,   temp_xhdl2291,   temp_xhdl2293,   temp_xhdl2295,   temp_xhdl2297,   temp_xhdl2299,   temp_xhdl2301,   temp_xhdl2303,   temp_xhdl2305,   temp_xhdl2307,   temp_xhdl2309,temp_xhdl2311,   temp_xhdl2313,   temp_xhdl2315,   temp_xhdl2317,   temp_xhdl2319,   temp_xhdl2321,   temp_xhdl2323,   temp_xhdl2325,   temp_xhdl2327,   temp_xhdl2329,   temp_xhdl2331,   temp_xhdl2333,   temp_xhdl2335,   temp_xhdl2337,   temp_xhdl2339,   temp_xhdl2341,   temp_xhdl2343,   temp_xhdl2345,   temp_xhdl2347,   temp_xhdl2349,   temp_xhdl2351,   temp_xhdl2353,   temp_xhdl2355,   temp_xhdl2357,   temp_xhdl2359,   temp_xhdl2361,   temp_xhdl2363,   temp_xhdl2365,   temp_xhdl2367,   temp_xhdl2369,   temp_xhdl2371,   temp_xhdl2373,   temp_xhdl2375,   temp_xhdl2377,   temp_xhdl2379,   temp_xhdl2381,   temp_xhdl2383,   temp_xhdl2385,   temp_xhdl2387,   temp_xhdl2389,   temp_xhdl2391,   temp_xhdl2393,   temp_xhdl2395,   temp_xhdl2397,   temp_xhdl2399,   temp_xhdl2401,   temp_xhdl2403,   temp_xhdl2405,   temp_xhdl2407,   temp_xhdl2409,   temp_xhdl2411,   temp_xhdl2413,   temp_xhdl2415,   temp_xhdl2417,   temp_xhdl2419)
      VARIABLE WID_IS0_xhdl54_xhdl2262  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE WDATA_IS0_xhdl55_xhdl2264  : std_logic_vector(AXI_DWIDTH - 1 
      DOWNTO 0);
      VARIABLE WSTRB_IS0_xhdl56_xhdl2266  : std_logic_vector(AXI_STRBWIDTH - 1 
      DOWNTO 0);
      VARIABLE WLAST_IS0_xhdl57_xhdl2268  : std_logic;
      VARIABLE WVALID_IS0_xhdl58_xhdl2270  : std_logic;
      VARIABLE WID_IS1_xhdl79_xhdl2272  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE WDATA_IS1_xhdl80_xhdl2274  : std_logic_vector(AXI_DWIDTH - 1 
      DOWNTO 0);
      VARIABLE WSTRB_IS1_xhdl81_xhdl2276  : std_logic_vector(AXI_STRBWIDTH - 1 
      DOWNTO 0);
      VARIABLE WLAST_IS1_xhdl82_xhdl2278  : std_logic;
      VARIABLE WVALID_IS1_xhdl83_xhdl2280  : std_logic;
      VARIABLE WID_IS2_xhdl104_xhdl2282  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE WDATA_IS2_xhdl105_xhdl2284  : std_logic_vector(AXI_DWIDTH - 1 
      DOWNTO 0);
      VARIABLE WSTRB_IS2_xhdl106_xhdl2286  : std_logic_vector(AXI_STRBWIDTH - 1 
      DOWNTO 0);
      VARIABLE WLAST_IS2_xhdl107_xhdl2288  : std_logic;
      VARIABLE WVALID_IS2_xhdl108_xhdl2290  : std_logic;
      VARIABLE WID_IS3_xhdl129_xhdl2292  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE WDATA_IS3_xhdl130_xhdl2294  : std_logic_vector(AXI_DWIDTH - 1 
      DOWNTO 0);
      VARIABLE WSTRB_IS3_xhdl131_xhdl2296  : std_logic_vector(AXI_STRBWIDTH - 1 
      DOWNTO 0);
      VARIABLE WLAST_IS3_xhdl132_xhdl2298  : std_logic;
      VARIABLE WVALID_IS3_xhdl133_xhdl2300  : std_logic;
      VARIABLE WID_IS4_xhdl154_xhdl2302  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE WDATA_IS4_xhdl155_xhdl2304  : std_logic_vector(AXI_DWIDTH - 1 
      DOWNTO 0);
      VARIABLE WSTRB_IS4_xhdl156_xhdl2306  : std_logic_vector(AXI_STRBWIDTH - 1 
      DOWNTO 0);
      VARIABLE WLAST_IS4_xhdl157_xhdl2308  : std_logic;
      VARIABLE WVALID_IS4_xhdl158_xhdl2310  : std_logic;
      VARIABLE WID_IS5_xhdl179_xhdl2312  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE WDATA_IS5_xhdl180_xhdl2314  : std_logic_vector(AXI_DWIDTH - 1 
      DOWNTO 0);
      VARIABLE WSTRB_IS5_xhdl181_xhdl2316  : std_logic_vector(AXI_STRBWIDTH - 1 
      DOWNTO 0);
      VARIABLE WLAST_IS5_xhdl182_xhdl2318  : std_logic;
      VARIABLE WVALID_IS5_xhdl183_xhdl2320  : std_logic;
      VARIABLE WID_IS6_xhdl204_xhdl2322  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE WDATA_IS6_xhdl205_xhdl2324  : std_logic_vector(AXI_DWIDTH - 1 
      DOWNTO 0);
      VARIABLE WSTRB_IS6_xhdl206_xhdl2326  : std_logic_vector(AXI_STRBWIDTH - 1 
      DOWNTO 0);
      VARIABLE WLAST_IS6_xhdl207_xhdl2328  : std_logic;
      VARIABLE WVALID_IS6_xhdl208_xhdl2330  : std_logic;
      VARIABLE WID_IS7_xhdl229_xhdl2332  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE WDATA_IS7_xhdl230_xhdl2334  : std_logic_vector(AXI_DWIDTH - 1 
      DOWNTO 0);
      VARIABLE WSTRB_IS7_xhdl231_xhdl2336  : std_logic_vector(AXI_STRBWIDTH - 1 
      DOWNTO 0);
      VARIABLE WLAST_IS7_xhdl232_xhdl2338  : std_logic;
      VARIABLE WVALID_IS7_xhdl233_xhdl2340  : std_logic;
      VARIABLE WID_IS8_xhdl254_xhdl2342  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE WDATA_IS8_xhdl255_xhdl2344  : std_logic_vector(AXI_DWIDTH - 1 
      DOWNTO 0);
      VARIABLE WSTRB_IS8_xhdl256_xhdl2346  : std_logic_vector(AXI_STRBWIDTH - 1 
      DOWNTO 0);
      VARIABLE WLAST_IS8_xhdl257_xhdl2348  : std_logic;
      VARIABLE WVALID_IS8_xhdl258_xhdl2350  : std_logic;
      VARIABLE WID_IS9_xhdl279_xhdl2352  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE WDATA_IS9_xhdl280_xhdl2354  : std_logic_vector(AXI_DWIDTH - 1 
      DOWNTO 0);
      VARIABLE WSTRB_IS9_xhdl281_xhdl2356  : std_logic_vector(AXI_STRBWIDTH - 1 
      DOWNTO 0);
      VARIABLE WLAST_IS9_xhdl282_xhdl2358  : std_logic;
      VARIABLE WVALID_IS9_xhdl283_xhdl2360  : std_logic;
      VARIABLE WID_IS10_xhdl304_xhdl2362  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE WDATA_IS10_xhdl305_xhdl2364  : std_logic_vector(AXI_DWIDTH - 1 
      DOWNTO 0);
      VARIABLE WSTRB_IS10_xhdl306_xhdl2366  : std_logic_vector(AXI_STRBWIDTH - 
      1 DOWNTO 0);
      VARIABLE WLAST_IS10_xhdl307_xhdl2368  : std_logic;
      VARIABLE WVALID_IS10_xhdl308_xhdl2370  : std_logic;
      VARIABLE WID_IS11_xhdl329_xhdl2372  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE WDATA_IS11_xhdl330_xhdl2374  : std_logic_vector(AXI_DWIDTH - 1 
      DOWNTO 0);
      VARIABLE WSTRB_IS11_xhdl331_xhdl2376  : std_logic_vector(AXI_STRBWIDTH - 
      1 DOWNTO 0);
      VARIABLE WLAST_IS11_xhdl332_xhdl2378  : std_logic;
      VARIABLE WVALID_IS11_xhdl333_xhdl2380  : std_logic;
      VARIABLE WID_IS12_xhdl354_xhdl2382  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE WDATA_IS12_xhdl355_xhdl2384  : std_logic_vector(AXI_DWIDTH - 1 
      DOWNTO 0);
      VARIABLE WSTRB_IS12_xhdl356_xhdl2386  : std_logic_vector(AXI_STRBWIDTH - 
      1 DOWNTO 0);
      VARIABLE WLAST_IS12_xhdl357_xhdl2388  : std_logic;
      VARIABLE WVALID_IS12_xhdl358_xhdl2390  : std_logic;
      VARIABLE WID_IS13_xhdl379_xhdl2392  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE WDATA_IS13_xhdl380_xhdl2394  : std_logic_vector(AXI_DWIDTH - 1 
      DOWNTO 0);
      VARIABLE WSTRB_IS13_xhdl381_xhdl2396  : std_logic_vector(AXI_STRBWIDTH - 
      1 DOWNTO 0);
      VARIABLE WLAST_IS13_xhdl382_xhdl2398  : std_logic;
      VARIABLE WVALID_IS13_xhdl383_xhdl2400  : std_logic;
      VARIABLE WID_IS14_xhdl404_xhdl2402  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE WDATA_IS14_xhdl405_xhdl2404  : std_logic_vector(AXI_DWIDTH - 1 
      DOWNTO 0);
      VARIABLE WSTRB_IS14_xhdl406_xhdl2406  : std_logic_vector(AXI_STRBWIDTH - 
      1 DOWNTO 0);
      VARIABLE WLAST_IS14_xhdl407_xhdl2408  : std_logic;
      VARIABLE WVALID_IS14_xhdl408_xhdl2410  : std_logic;
      VARIABLE WID_IS15_xhdl429_xhdl2412  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE WDATA_IS15_xhdl430_xhdl2414  : std_logic_vector(AXI_DWIDTH - 1 
      DOWNTO 0);
      VARIABLE WSTRB_IS15_xhdl431_xhdl2416  : std_logic_vector(AXI_STRBWIDTH - 
      1 DOWNTO 0);
      VARIABLE WLAST_IS15_xhdl432_xhdl2418  : std_logic;
      VARIABLE WVALID_IS15_xhdl433_xhdl2420  : std_logic;
      VARIABLE WID_IS16_xhdl454_xhdl2421  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE WDATA_IS16_xhdl455_xhdl2422  : std_logic_vector(AXI_DWIDTH - 1 
      DOWNTO 0);
      VARIABLE WSTRB_IS16_xhdl456_xhdl2423  : std_logic_vector(AXI_STRBWIDTH - 
      1 DOWNTO 0);
      VARIABLE WLAST_IS16_xhdl457_xhdl2424  : std_logic;
      VARIABLE WVALID_IS16_xhdl458_xhdl2425  : std_logic;
   BEGIN
      WID_IS0_xhdl54_xhdl2262      := temp_xhdl2261;    
      WDATA_IS0_xhdl55_xhdl2264    := temp_xhdl2263;    
      WSTRB_IS0_xhdl56_xhdl2266    := temp_xhdl2265;    
      WLAST_IS0_xhdl57_xhdl2268    := temp_xhdl2267;    
      WVALID_IS0_xhdl58_xhdl2270   := temp_xhdl2269;    
      WID_IS1_xhdl79_xhdl2272      := temp_xhdl2271;    
      WDATA_IS1_xhdl80_xhdl2274    := temp_xhdl2273;    
      WSTRB_IS1_xhdl81_xhdl2276    := temp_xhdl2275;    
      WLAST_IS1_xhdl82_xhdl2278    := temp_xhdl2277;    
      WVALID_IS1_xhdl83_xhdl2280   := temp_xhdl2279;    
      WID_IS2_xhdl104_xhdl2282     := temp_xhdl2281;    
      WDATA_IS2_xhdl105_xhdl2284   := temp_xhdl2283;    
      WSTRB_IS2_xhdl106_xhdl2286   := temp_xhdl2285;    
      WLAST_IS2_xhdl107_xhdl2288   := temp_xhdl2287;    
      WVALID_IS2_xhdl108_xhdl2290  := temp_xhdl2289;    
      WID_IS3_xhdl129_xhdl2292     := temp_xhdl2291;    
      WDATA_IS3_xhdl130_xhdl2294   := temp_xhdl2293;    
      WSTRB_IS3_xhdl131_xhdl2296   := temp_xhdl2295;    
      WLAST_IS3_xhdl132_xhdl2298   := temp_xhdl2297;    
      WVALID_IS3_xhdl133_xhdl2300  := temp_xhdl2299;    
      WID_IS4_xhdl154_xhdl2302     := temp_xhdl2301;    
      WDATA_IS4_xhdl155_xhdl2304   := temp_xhdl2303;    
      WSTRB_IS4_xhdl156_xhdl2306   := temp_xhdl2305;    
      WLAST_IS4_xhdl157_xhdl2308   := temp_xhdl2307;    
      WVALID_IS4_xhdl158_xhdl2310  := temp_xhdl2309;    
      WID_IS5_xhdl179_xhdl2312     := temp_xhdl2311;    
      WDATA_IS5_xhdl180_xhdl2314   := temp_xhdl2313;    
      WSTRB_IS5_xhdl181_xhdl2316   := temp_xhdl2315;    
      WLAST_IS5_xhdl182_xhdl2318   := temp_xhdl2317;    
      WVALID_IS5_xhdl183_xhdl2320  := temp_xhdl2319;    
      WID_IS6_xhdl204_xhdl2322     := temp_xhdl2321;    
      WDATA_IS6_xhdl205_xhdl2324   := temp_xhdl2323;    
      WSTRB_IS6_xhdl206_xhdl2326   := temp_xhdl2325;    
      WLAST_IS6_xhdl207_xhdl2328   := temp_xhdl2327;    
      WVALID_IS6_xhdl208_xhdl2330  := temp_xhdl2329;    
      WID_IS7_xhdl229_xhdl2332     := temp_xhdl2331;    
      WDATA_IS7_xhdl230_xhdl2334   := temp_xhdl2333;    
      WSTRB_IS7_xhdl231_xhdl2336   := temp_xhdl2335;    
      WLAST_IS7_xhdl232_xhdl2338   := temp_xhdl2337;    
      WVALID_IS7_xhdl233_xhdl2340  := temp_xhdl2339;    
      WID_IS8_xhdl254_xhdl2342     := temp_xhdl2341;    
      WDATA_IS8_xhdl255_xhdl2344   := temp_xhdl2343;    
      WSTRB_IS8_xhdl256_xhdl2346   := temp_xhdl2345;    
      WLAST_IS8_xhdl257_xhdl2348   := temp_xhdl2347;    
      WVALID_IS8_xhdl258_xhdl2350  := temp_xhdl2349;    
      WID_IS9_xhdl279_xhdl2352     := temp_xhdl2351;    
      WDATA_IS9_xhdl280_xhdl2354   := temp_xhdl2353;    
      WSTRB_IS9_xhdl281_xhdl2356   := temp_xhdl2355;    
      WLAST_IS9_xhdl282_xhdl2358   := temp_xhdl2357;    
      WVALID_IS9_xhdl283_xhdl2360  := temp_xhdl2359;    
      WID_IS10_xhdl304_xhdl2362    := temp_xhdl2361;    
      WDATA_IS10_xhdl305_xhdl2364  := temp_xhdl2363;    
      WSTRB_IS10_xhdl306_xhdl2366  := temp_xhdl2365;    
      WLAST_IS10_xhdl307_xhdl2368  := temp_xhdl2367;    
      WVALID_IS10_xhdl308_xhdl2370 := temp_xhdl2369;    
      WID_IS11_xhdl329_xhdl2372    := temp_xhdl2371;    
      WDATA_IS11_xhdl330_xhdl2374  := temp_xhdl2373;    
      WSTRB_IS11_xhdl331_xhdl2376  := temp_xhdl2375;    
      WLAST_IS11_xhdl332_xhdl2378  := temp_xhdl2377;    
      WVALID_IS11_xhdl333_xhdl2380 := temp_xhdl2379;    
      WID_IS12_xhdl354_xhdl2382    := temp_xhdl2381;    
      WDATA_IS12_xhdl355_xhdl2384  := temp_xhdl2383;    
      WSTRB_IS12_xhdl356_xhdl2386  := temp_xhdl2385;    
      WLAST_IS12_xhdl357_xhdl2388  := temp_xhdl2387;    
      WVALID_IS12_xhdl358_xhdl2390 := temp_xhdl2389;    
      WID_IS13_xhdl379_xhdl2392    := temp_xhdl2391;    
      WDATA_IS13_xhdl380_xhdl2394  := temp_xhdl2393;    
      WSTRB_IS13_xhdl381_xhdl2396  := temp_xhdl2395;    
      WLAST_IS13_xhdl382_xhdl2398  := temp_xhdl2397;    
      WVALID_IS13_xhdl383_xhdl2400 := temp_xhdl2399;    
      WID_IS14_xhdl404_xhdl2402    := temp_xhdl2401;    
      WDATA_IS14_xhdl405_xhdl2404  := temp_xhdl2403;    
      WSTRB_IS14_xhdl406_xhdl2406  := temp_xhdl2405;    
      WLAST_IS14_xhdl407_xhdl2408  := temp_xhdl2407;    
      WVALID_IS14_xhdl408_xhdl2410 := temp_xhdl2409;    
      WID_IS15_xhdl429_xhdl2412    := temp_xhdl2411;    
      WDATA_IS15_xhdl430_xhdl2414  := temp_xhdl2413;    
      WSTRB_IS15_xhdl431_xhdl2416  := temp_xhdl2415;    
      WLAST_IS15_xhdl432_xhdl2418  := temp_xhdl2417;    
      WVALID_IS15_xhdl433_xhdl2420 := temp_xhdl2419;    
      IF ( (MEMSPACE = 0 AND ADDR_HGS_CFG = 1 AND 
      WVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 
      1 DOWNTO AXI_AWIDTH - 4) > "0111")) OR (MEMSPACE = 0 AND 
      ADDR_HGS_CFG = 0 AND WVALID_IS16_gated_r = '1' AND 
      (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) 
      < "1000")) OR (MEMSPACE > 0 AND SC_0 = 1 AND 
      WVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 
      1 DOWNTO AXI_AWIDTH - 4) = "0000")) OR (MEMSPACE > 0 AND 
      SC_1 = 1 AND WVALID_IS16_gated_r = '1' AND 
      (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) 
      = "0001")) OR (MEMSPACE > 0 AND SC_2 = 1 AND 
      WVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 
      1 DOWNTO AXI_AWIDTH - 4) = "0010")) OR (MEMSPACE > 0 AND 
      SC_3 = 1 AND WVALID_IS16_gated_r = '1' AND 
      (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) 
      = "0011")) OR (MEMSPACE > 0 AND SC_4 = 1 AND 
      WVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 
      1 DOWNTO AXI_AWIDTH - 4) = "0100")) OR (MEMSPACE > 0 AND 
      SC_5 = 1 AND WVALID_IS16_gated_r = '1' AND 
      (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) 
      = "0101")) OR (MEMSPACE > 0 AND SC_6 = 1 AND 
      WVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 
      1 DOWNTO AXI_AWIDTH - 4) = "0110")) OR (MEMSPACE > 0 AND 
      SC_7 = 1 AND WVALID_IS16_gated_r = '1' AND 
      (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) 
      = "0111")) OR (MEMSPACE > 0 AND SC_8 = 1 AND 
      WVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 
      1 DOWNTO AXI_AWIDTH - 4) = "1000")) OR (MEMSPACE > 0 AND 
      SC_9 = 1 AND WVALID_IS16_gated_r = '1' AND 
      (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) 
      = "1001")) OR (MEMSPACE > 0 AND SC_10 = 1 AND 
      WVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 
      1 DOWNTO AXI_AWIDTH - 4) = "1010")) OR (MEMSPACE > 0 AND 
      SC_11 = 1 AND WVALID_IS16_gated_r = '1' AND 
      (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) 
      = "1011")) OR (MEMSPACE > 0 AND SC_12 = 1 AND 
      WVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 
      1 DOWNTO AXI_AWIDTH - 4) = "1100")) OR (MEMSPACE > 0 AND 
      SC_13 = 1 AND WVALID_IS16_gated_r = '1' AND 
      (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) 
      = "1101")) OR (MEMSPACE > 0 AND SC_14 = 1 AND 
      WVALID_IS16_gated_r = '1' AND (AWADDR_IS16_gated_r(AXI_AWIDTH - 
      1 DOWNTO AXI_AWIDTH - 4) = "1110")) OR (MEMSPACE > 0 AND 
      SC_15 = 1 AND WVALID_IS16_gated_r = '1' AND 
      (AWADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) 
      = "1111"))) THEN
         WID_IS16_xhdl454_xhdl2421 := WID_IS16_gated;    
         WDATA_IS16_xhdl455_xhdl2422 := WDATA_IS16_gated;    
         WSTRB_IS16_xhdl456_xhdl2423 := WSTRB_IS16_gated;    
         WLAST_IS16_xhdl457_xhdl2424 := WLAST_IS16_gated;    
         WVALID_IS16_xhdl458_xhdl2425 := WVALID_IS16_gated;    
      ELSE
         WID_IS16_xhdl454_xhdl2421 := (OTHERS => '0');    
         WDATA_IS16_xhdl455_xhdl2422 := (OTHERS => '0');    
         WSTRB_IS16_xhdl456_xhdl2423 := (OTHERS => '0');        
         WLAST_IS16_xhdl457_xhdl2424 := '0';    
         WVALID_IS16_xhdl458_xhdl2425 := '0';    
      END IF;
      -- if ((MEMSPACE == 0 && ADDR_HGS_CFG == 1'b1 && AWADDR_IS16_gated_r[AXI_AWIDTH - 1 : AXI_AWIDTH - 4] > 4'h7)...
      
      
      WID_IS0_xhdl54 <= WID_IS0_xhdl54_xhdl2262;
      WDATA_IS0_xhdl55 <= WDATA_IS0_xhdl55_xhdl2264;
      WSTRB_IS0_xhdl56 <= WSTRB_IS0_xhdl56_xhdl2266;
      WLAST_IS0_xhdl57 <= WLAST_IS0_xhdl57_xhdl2268;
      WVALID_IS0_xhdl58 <= WVALID_IS0_xhdl58_xhdl2270;
      WID_IS1_xhdl79 <= WID_IS1_xhdl79_xhdl2272;
      WDATA_IS1_xhdl80 <= WDATA_IS1_xhdl80_xhdl2274;
      WSTRB_IS1_xhdl81 <= WSTRB_IS1_xhdl81_xhdl2276;
      WLAST_IS1_xhdl82 <= WLAST_IS1_xhdl82_xhdl2278;
      WVALID_IS1_xhdl83 <= WVALID_IS1_xhdl83_xhdl2280;
      WID_IS2_xhdl104 <= WID_IS2_xhdl104_xhdl2282;
      WDATA_IS2_xhdl105 <= WDATA_IS2_xhdl105_xhdl2284;
      WSTRB_IS2_xhdl106 <= WSTRB_IS2_xhdl106_xhdl2286;
      WLAST_IS2_xhdl107 <= WLAST_IS2_xhdl107_xhdl2288;
      WVALID_IS2_xhdl108 <= WVALID_IS2_xhdl108_xhdl2290;
      WID_IS3_xhdl129 <= WID_IS3_xhdl129_xhdl2292;
      WDATA_IS3_xhdl130 <= WDATA_IS3_xhdl130_xhdl2294;
      WSTRB_IS3_xhdl131 <= WSTRB_IS3_xhdl131_xhdl2296;
      WLAST_IS3_xhdl132 <= WLAST_IS3_xhdl132_xhdl2298;
      WVALID_IS3_xhdl133 <= WVALID_IS3_xhdl133_xhdl2300;
      WID_IS4_xhdl154 <= WID_IS4_xhdl154_xhdl2302;
      WDATA_IS4_xhdl155 <= WDATA_IS4_xhdl155_xhdl2304;
      WSTRB_IS4_xhdl156 <= WSTRB_IS4_xhdl156_xhdl2306;
      WLAST_IS4_xhdl157 <= WLAST_IS4_xhdl157_xhdl2308;
      WVALID_IS4_xhdl158 <= WVALID_IS4_xhdl158_xhdl2310;
      WID_IS5_xhdl179 <= WID_IS5_xhdl179_xhdl2312;
      WDATA_IS5_xhdl180 <= WDATA_IS5_xhdl180_xhdl2314;
      WSTRB_IS5_xhdl181 <= WSTRB_IS5_xhdl181_xhdl2316;
      WLAST_IS5_xhdl182 <= WLAST_IS5_xhdl182_xhdl2318;
      WVALID_IS5_xhdl183 <= WVALID_IS5_xhdl183_xhdl2320;
      WID_IS6_xhdl204 <= WID_IS6_xhdl204_xhdl2322;
      WDATA_IS6_xhdl205 <= WDATA_IS6_xhdl205_xhdl2324;
      WSTRB_IS6_xhdl206 <= WSTRB_IS6_xhdl206_xhdl2326;
      WLAST_IS6_xhdl207 <= WLAST_IS6_xhdl207_xhdl2328;
      WVALID_IS6_xhdl208 <= WVALID_IS6_xhdl208_xhdl2330;
      WID_IS7_xhdl229 <= WID_IS7_xhdl229_xhdl2332;
      WDATA_IS7_xhdl230 <= WDATA_IS7_xhdl230_xhdl2334;
      WSTRB_IS7_xhdl231 <= WSTRB_IS7_xhdl231_xhdl2336;
      WLAST_IS7_xhdl232 <= WLAST_IS7_xhdl232_xhdl2338;
      WVALID_IS7_xhdl233 <= WVALID_IS7_xhdl233_xhdl2340;
      WID_IS8_xhdl254 <= WID_IS8_xhdl254_xhdl2342;
      WDATA_IS8_xhdl255 <= WDATA_IS8_xhdl255_xhdl2344;
      WSTRB_IS8_xhdl256 <= WSTRB_IS8_xhdl256_xhdl2346;
      WLAST_IS8_xhdl257 <= WLAST_IS8_xhdl257_xhdl2348;
      WVALID_IS8_xhdl258 <= WVALID_IS8_xhdl258_xhdl2350;
      WID_IS9_xhdl279 <= WID_IS9_xhdl279_xhdl2352;
      WDATA_IS9_xhdl280 <= WDATA_IS9_xhdl280_xhdl2354;
      WSTRB_IS9_xhdl281 <= WSTRB_IS9_xhdl281_xhdl2356;
      WLAST_IS9_xhdl282 <= WLAST_IS9_xhdl282_xhdl2358;
      WVALID_IS9_xhdl283 <= WVALID_IS9_xhdl283_xhdl2360;
      WID_IS10_xhdl304 <= WID_IS10_xhdl304_xhdl2362;
      WDATA_IS10_xhdl305 <= WDATA_IS10_xhdl305_xhdl2364;
      WSTRB_IS10_xhdl306 <= WSTRB_IS10_xhdl306_xhdl2366;
      WLAST_IS10_xhdl307 <= WLAST_IS10_xhdl307_xhdl2368;
      WVALID_IS10_xhdl308 <= WVALID_IS10_xhdl308_xhdl2370;
      WID_IS11_xhdl329 <= WID_IS11_xhdl329_xhdl2372;
      WDATA_IS11_xhdl330 <= WDATA_IS11_xhdl330_xhdl2374;
      WSTRB_IS11_xhdl331 <= WSTRB_IS11_xhdl331_xhdl2376;
      WLAST_IS11_xhdl332 <= WLAST_IS11_xhdl332_xhdl2378;
      WVALID_IS11_xhdl333 <= WVALID_IS11_xhdl333_xhdl2380;
      WID_IS12_xhdl354 <= WID_IS12_xhdl354_xhdl2382;
      WDATA_IS12_xhdl355 <= WDATA_IS12_xhdl355_xhdl2384;
      WSTRB_IS12_xhdl356 <= WSTRB_IS12_xhdl356_xhdl2386;
      WLAST_IS12_xhdl357 <= WLAST_IS12_xhdl357_xhdl2388;
      WVALID_IS12_xhdl358 <= WVALID_IS12_xhdl358_xhdl2390;
      WID_IS13_xhdl379 <= WID_IS13_xhdl379_xhdl2392;
      WDATA_IS13_xhdl380 <= WDATA_IS13_xhdl380_xhdl2394;
      WSTRB_IS13_xhdl381 <= WSTRB_IS13_xhdl381_xhdl2396;
      WLAST_IS13_xhdl382 <= WLAST_IS13_xhdl382_xhdl2398;
      WVALID_IS13_xhdl383 <= WVALID_IS13_xhdl383_xhdl2400;
      WID_IS14_xhdl404 <= WID_IS14_xhdl404_xhdl2402;
      WDATA_IS14_xhdl405 <= WDATA_IS14_xhdl405_xhdl2404;
      WSTRB_IS14_xhdl406 <= WSTRB_IS14_xhdl406_xhdl2406;
      WLAST_IS14_xhdl407 <= WLAST_IS14_xhdl407_xhdl2408;
      WVALID_IS14_xhdl408 <= WVALID_IS14_xhdl408_xhdl2410;
      WID_IS15_xhdl429 <= WID_IS15_xhdl429_xhdl2412;
      WDATA_IS15_xhdl430 <= WDATA_IS15_xhdl430_xhdl2414;
      WSTRB_IS15_xhdl431 <= WSTRB_IS15_xhdl431_xhdl2416;
      WLAST_IS15_xhdl432 <= WLAST_IS15_xhdl432_xhdl2418;
      WVALID_IS15_xhdl433 <= WVALID_IS15_xhdl433_xhdl2420;
      WID_IS16_xhdl454 <= WID_IS16_xhdl454_xhdl2421;
      WDATA_IS16_xhdl455 <= WDATA_IS16_xhdl455_xhdl2422;
      WSTRB_IS16_xhdl456 <= WSTRB_IS16_xhdl456_xhdl2423;
      WLAST_IS16_xhdl457 <= WLAST_IS16_xhdl457_xhdl2424;
      WVALID_IS16_xhdl458 <= WVALID_IS16_xhdl458_xhdl2425;
   END PROCESS;
   temp_xhdl2426 <= ARID_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2428 <= ARADDR_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');    
   temp_xhdl2430 <= ARLEN_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2432 <= ARSIZE_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2434 <= ARBURST_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2436 <= ARLOCK_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2438 <= ARCACHE_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2440 <= ARPROT_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2442 <= ARVALID_IS0_gated WHEN (SC_0 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2444 <= ARID_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2446 <= ARADDR_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');    
   temp_xhdl2448 <= ARLEN_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2450 <= ARSIZE_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2452 <= ARBURST_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2454 <= ARLOCK_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2456 <= ARCACHE_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2458 <= ARPROT_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2460 <= ARVALID_IS1_gated WHEN (SC_1 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2462 <= ARID_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2464 <= ARADDR_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2466 <= ARLEN_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2468 <= ARSIZE_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2470 <= ARBURST_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2472 <= ARLOCK_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2474 <= ARCACHE_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2476 <= ARPROT_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2478 <= ARVALID_IS2_gated WHEN (SC_2 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2480 <= ARID_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2482 <= ARADDR_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2484 <= ARLEN_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2486 <= ARSIZE_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2488 <= ARBURST_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2490 <= ARLOCK_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2492 <= ARCACHE_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2494 <= ARPROT_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2496 <= ARVALID_IS3_gated WHEN (SC_3 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2498 <= ARID_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2500 <= ARADDR_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2502 <= ARLEN_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2504 <= ARSIZE_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2506 <= ARBURST_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2508 <= ARLOCK_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2510 <= ARCACHE_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2512 <= ARPROT_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2514 <= ARVALID_IS4_gated WHEN (SC_4 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2516 <= ARID_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2518 <= ARADDR_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2520 <= ARLEN_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2522 <= ARSIZE_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2524 <= ARBURST_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2526 <= ARLOCK_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2528 <= ARCACHE_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2530 <= ARPROT_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2532 <= ARVALID_IS5_gated WHEN (SC_5 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2534 <= ARID_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2536 <= ARADDR_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2538 <= ARLEN_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2540 <= ARSIZE_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2542 <= ARBURST_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2544 <= ARLOCK_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2546 <= ARCACHE_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2548 <= ARPROT_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2550 <= ARVALID_IS6_gated WHEN (SC_6 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2552 <= ARID_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2554 <= ARADDR_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2556 <= ARLEN_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2558 <= ARSIZE_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2560 <= ARBURST_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2562 <= ARLOCK_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2564 <= ARCACHE_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2566 <= ARPROT_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE (OTHERS => '0');
   temp_xhdl2568 <= ARVALID_IS7_gated WHEN (SC_7 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 1)) ELSE '0';
   temp_xhdl2570 <= ARID_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2572 <= ARADDR_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2574 <= ARLEN_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2576 <= ARSIZE_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2578 <= ARBURST_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2580 <= ARLOCK_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2582 <= ARCACHE_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2584 <= ARPROT_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2586 <= ARVALID_IS8_gated WHEN (SC_8 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2588 <= ARID_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2590 <= ARADDR_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2592 <= ARLEN_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2594 <= ARSIZE_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2596 <= ARBURST_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2598 <= ARLOCK_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2600 <= ARCACHE_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2602 <= ARPROT_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2604 <= ARVALID_IS9_gated WHEN (SC_9 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2606 <= ARID_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2608 <= ARADDR_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2610 <= ARLEN_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2612 <= ARSIZE_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2614 <= ARBURST_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2616 <= ARLOCK_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2618 <= ARCACHE_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2620 <= ARPROT_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2622 <= ARVALID_IS10_gated WHEN (SC_10 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2624 <= ARID_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2626 <= ARADDR_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2628 <= ARLEN_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2630 <= ARSIZE_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2632 <= ARBURST_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2634 <= ARLOCK_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2636 <= ARCACHE_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2638 <= ARPROT_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2640 <= ARVALID_IS11_gated WHEN (SC_11 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2642 <= ARID_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2644 <= ARADDR_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2646 <= ARLEN_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2648 <= ARSIZE_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2650 <= ARBURST_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2652 <= ARLOCK_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2654 <= ARCACHE_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2656 <= ARPROT_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2658 <= ARVALID_IS12_gated WHEN (SC_12 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2660 <= ARID_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2662 <= ARADDR_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2664 <= ARLEN_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2666 <= ARSIZE_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2668 <= ARBURST_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2670 <= ARLOCK_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2672 <= ARCACHE_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2674 <= ARPROT_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2676 <= ARVALID_IS13_gated WHEN (SC_13 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2678 <= ARID_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2680 <= ARADDR_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2682 <= ARLEN_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2684 <= ARSIZE_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2686 <= ARBURST_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2688 <= ARLOCK_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2690 <= ARCACHE_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2692 <= ARPROT_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2694 <= ARVALID_IS14_gated WHEN (SC_14 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';
   temp_xhdl2696 <= ARID_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2698 <= ARADDR_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2700 <= ARLEN_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2702 <= ARSIZE_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2704 <= ARBURST_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2706 <= ARLOCK_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2708 <= ARCACHE_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2710 <= ARPROT_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE (OTHERS => '0');
   temp_xhdl2712 <= ARVALID_IS15_gated WHEN (SC_15 = 0 OR (MEMSPACE = 0 AND 
   ADDR_HGS_CFG = 0)) ELSE '0';

   
   PROCESS (ARID_IS7_gated, ARADDR_IS13_gated, ARSIZE_IS3_gated, 
   ARVALID_IS14_gated, ARCACHE_IS8_gated, ARADDR_IS2_gated, ARID_IS4_gated, 
   ARADDR_IS10_gated, ARPROT_IS7_gated, ARID_IS14_gated, ARSIZE_IS0_gated, 
   ARVALID_IS11_gated, ARCACHE_IS5_gated, ARID_IS1_gated, ARLEN_IS8_gated, 
   ARBURST_IS16_gated, ARLEN_IS15_gated, ARPROT_IS4_gated, 
   ARID_IS11_gated, ARVALID_IS8_gated, ARLOCK_IS7_gated, ARCACHE_IS2_gated, 
   ARCACHE_IS15_gated, ARLEN_IS5_gated, ARPROT_IS16_gated, ARBURST_IS13_gated, 
   ARLEN_IS12_gated, ARPROT_IS1_gated, ARBURST_IS9_gated,  
   ARVALID_IS5_gated, ARLOCK_IS4_gated, ARCACHE_IS12_gated,
   ARSIZE_IS16_gated, ARLEN_IS2_gated, ARLOCK_IS15_gated, ARPROT_IS13_gated, 
   ARBURST_IS10_gated, ARBURST_IS6_gated, ARLOCK_IS1_gated, ARVALID_IS2_gated, 
   ARADDR_IS16_gated_r, ARSIZE_IS13_gated, ARLOCK_IS12_gated, ARPROT_IS10_gated,
   ARBURST_IS3_gated, ARSIZE_IS10_gated, ARBURST_IS0_gated, ARSIZE_IS8_gated, 
   ARADDR_IS7_gated, ARID_IS9_gated, ARADDR_IS15_gated, 
   ARSIZE_IS5_gated, ARVALID_IS16_gated, 
   ARADDR_IS4_gated, ARID_IS6_gated, ARADDR_IS12_gated, ARPROT_IS9_gated, 
   ARID_IS16_gated, ARSIZE_IS2_gated, ARVALID_IS13_gated, ARCACHE_IS7_gated, 
   ARADDR_IS1_gated, ARID_IS3_gated, ARPROT_IS6_gated, ARID_IS13_gated, 
   ARLOCK_IS9_gated, ARVALID_IS10_gated, ARCACHE_IS4_gated, ARID_IS0_gated, 
   ARLEN_IS7_gated, ARBURST_IS15_gated, ARLEN_IS14_gated, ARPROT_IS3_gated, 
   ARID_IS10_gated, ARVALID_IS7_gated, ARLOCK_IS6_gated, ARCACHE_IS1_gated, 
   ARCACHE_IS14_gated, ARLEN_IS4_gated, ARPROT_IS15_gated, ARBURST_IS12_gated, 
   ARLEN_IS11_gated, ARPROT_IS0_gated, ARBURST_IS8_gated, ARLOCK_IS3_gated, 
   ARVALID_IS4_gated, ARCACHE_IS11_gated, ARSIZE_IS15_gated, ARLEN_IS1_gated, 
   ARLOCK_IS14_gated, ARPROT_IS12_gated, ARBURST_IS5_gated, ARLOCK_IS0_gated, 
   ARVALID_IS1_gated, ARLOCK_IS11_gated, ARSIZE_IS12_gated, 
   ARBURST_IS2_gated, ARADDR_IS9_gated, ARSIZE_IS7_gated, ARADDR_IS6_gated, 
   ARID_IS8_gated, ARADDR_IS14_gated, ARSIZE_IS4_gated, ARVALID_IS15_gated, 
   ARCACHE_IS9_gated, ARADDR_IS3_gated, ARID_IS5_gated, 
   ARADDR_IS11_gated, ARPROT_IS8_gated, ARID_IS15_gated, ARSIZE_IS1_gated, 
   ARVALID_IS12_gated, ARADDR_IS0_gated, ARCACHE_IS6_gated, ARID_IS2_gated, 
   ARLEN_IS9_gated, ARLEN_IS16_gated, ARPROT_IS5_gated, ARLOCK_IS8_gated, 
   ARVALID_IS9_gated, ARID_IS12_gated, ARCACHE_IS3_gated, ARCACHE_IS16_gated, 
   ARLEN_IS6_gated, ARBURST_IS14_gated, ARLEN_IS13_gated, ARPROT_IS2_gated, 
   ARLOCK_IS5_gated, ARVALID_IS6_gated, ARCACHE_IS0_gated, ARCACHE_IS13_gated, 
   ARLEN_IS3_gated, ARLOCK_IS16_gated, ARPROT_IS14_gated, ARLEN_IS10_gated, 
   ARBURST_IS11_gated, ARBURST_IS7_gated, ARVALID_IS3_gated, ARLOCK_IS2_gated, 
   ARCACHE_IS10_gated, ARVALID_IS16_gated_r, ARSIZE_IS14_gated, 
   ARLOCK_IS13_gated, ARLEN_IS0_gated, ARPROT_IS11_gated, ARBURST_IS4_gated, 
   ARVALID_IS0_gated, ARLOCK_IS10_gated, ARSIZE_IS11_gated, ARBURST_IS1_gated, 
   ARSIZE_IS9_gated, ARADDR_IS8_gated, ARADDR_IS16_gated, ARSIZE_IS6_gated, 
   ARADDR_IS5_gated,  temp_xhdl2426,   temp_xhdl2428,temp_xhdl2430,temp_xhdl2432,temp_xhdl2434,temp_xhdl2436,temp_xhdl2438,temp_xhdl2440,temp_xhdl2442,temp_xhdl2444,temp_xhdl2446,temp_xhdl2448,temp_xhdl2450,temp_xhdl2452,temp_xhdl2454,temp_xhdl2456,temp_xhdl2458,temp_xhdl2460,temp_xhdl2462,temp_xhdl2464,temp_xhdl2466,temp_xhdl2468,temp_xhdl2470,temp_xhdl2472,temp_xhdl2474,temp_xhdl2476,temp_xhdl2478,temp_xhdl2480,temp_xhdl2482,temp_xhdl2484,temp_xhdl2486,temp_xhdl2488,temp_xhdl2490,temp_xhdl2492,temp_xhdl2494,temp_xhdl2496,temp_xhdl2498,temp_xhdl2500,temp_xhdl2502,temp_xhdl2504,temp_xhdl2506,temp_xhdl2508,temp_xhdl2510,temp_xhdl2512,temp_xhdl2514,temp_xhdl2516,temp_xhdl2518,temp_xhdl2520,temp_xhdl2522,temp_xhdl2524,temp_xhdl2526,temp_xhdl2528,temp_xhdl2530,temp_xhdl2532,temp_xhdl2534,temp_xhdl2536,temp_xhdl2538,temp_xhdl2540,temp_xhdl2542,temp_xhdl2544,temp_xhdl2546,temp_xhdl2548,temp_xhdl2550,temp_xhdl2552,temp_xhdl2554,temp_xhdl2556,temp_xhdl2558,temp_xhdl2560,temp_xhdl2562,temp_xhdl2564,temp_xhdl2566,temp_xhdl2568,temp_xhdl2570,temp_xhdl2572,temp_xhdl2574,temp_xhdl2576,temp_xhdl2578,temp_xhdl2580,temp_xhdl2582,temp_xhdl2584,temp_xhdl2586,temp_xhdl2588,temp_xhdl2590,temp_xhdl2592,temp_xhdl2594,temp_xhdl2596,temp_xhdl2598,temp_xhdl2600,temp_xhdl2602,temp_xhdl2604,temp_xhdl2606,temp_xhdl2608,temp_xhdl2610,temp_xhdl2612,temp_xhdl2614,temp_xhdl2616,temp_xhdl2618,temp_xhdl2620,temp_xhdl2622,temp_xhdl2624,temp_xhdl2626,temp_xhdl2628,temp_xhdl2630,temp_xhdl2632,temp_xhdl2634,temp_xhdl2636,temp_xhdl2638,temp_xhdl2640,temp_xhdl2642,temp_xhdl2644,temp_xhdl2646,temp_xhdl2648,temp_xhdl2650,temp_xhdl2652,temp_xhdl2654,temp_xhdl2656,temp_xhdl2658,temp_xhdl2660,temp_xhdl2662,temp_xhdl2664,temp_xhdl2666,temp_xhdl2668,temp_xhdl2670,temp_xhdl2672,temp_xhdl2674,temp_xhdl2676,temp_xhdl2678,temp_xhdl2680,temp_xhdl2682,temp_xhdl2684,temp_xhdl2686,temp_xhdl2688,temp_xhdl2690,temp_xhdl2692,temp_xhdl2694,temp_xhdl2696,temp_xhdl2698,temp_xhdl2700,temp_xhdl2702,temp_xhdl2704,temp_xhdl2706,temp_xhdl2708,temp_xhdl2710,temp_xhdl2712)
      VARIABLE ARID_IS0_xhdl60_xhdl2427  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE ARADDR_IS0_xhdl61_xhdl2429  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE ARLEN_IS0_xhdl62_xhdl2431  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARSIZE_IS0_xhdl63_xhdl2433  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARBURST_IS0_xhdl64_xhdl2435  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARLOCK_IS0_xhdl65_xhdl2437  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARCACHE_IS0_xhdl66_xhdl2439  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARPROT_IS0_xhdl67_xhdl2441  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARVALID_IS0_xhdl68_xhdl2443  : std_logic;
      VARIABLE ARID_IS1_xhdl85_xhdl2445  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE ARADDR_IS1_xhdl86_xhdl2447  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE ARLEN_IS1_xhdl87_xhdl2449  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARSIZE_IS1_xhdl88_xhdl2451  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARBURST_IS1_xhdl89_xhdl2453  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARLOCK_IS1_xhdl90_xhdl2455  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARCACHE_IS1_xhdl91_xhdl2457  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARPROT_IS1_xhdl92_xhdl2459  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARVALID_IS1_xhdl93_xhdl2461  : std_logic;
      VARIABLE ARID_IS2_xhdl110_xhdl2463  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE ARADDR_IS2_xhdl111_xhdl2465  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE ARLEN_IS2_xhdl112_xhdl2467  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARSIZE_IS2_xhdl113_xhdl2469  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARBURST_IS2_xhdl114_xhdl2471  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARLOCK_IS2_xhdl115_xhdl2473  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARCACHE_IS2_xhdl116_xhdl2475  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARPROT_IS2_xhdl117_xhdl2477  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARVALID_IS2_xhdl118_xhdl2479  : std_logic;
      VARIABLE ARID_IS3_xhdl135_xhdl2481  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE ARADDR_IS3_xhdl136_xhdl2483  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE ARLEN_IS3_xhdl137_xhdl2485  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARSIZE_IS3_xhdl138_xhdl2487  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARBURST_IS3_xhdl139_xhdl2489  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARLOCK_IS3_xhdl140_xhdl2491  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARCACHE_IS3_xhdl141_xhdl2493  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARPROT_IS3_xhdl142_xhdl2495  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARVALID_IS3_xhdl143_xhdl2497  : std_logic;
      VARIABLE ARID_IS4_xhdl160_xhdl2499  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE ARADDR_IS4_xhdl161_xhdl2501  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE ARLEN_IS4_xhdl162_xhdl2503  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARSIZE_IS4_xhdl163_xhdl2505  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARBURST_IS4_xhdl164_xhdl2507  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARLOCK_IS4_xhdl165_xhdl2509  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARCACHE_IS4_xhdl166_xhdl2511  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARPROT_IS4_xhdl167_xhdl2513  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARVALID_IS4_xhdl168_xhdl2515  : std_logic;
      VARIABLE ARID_IS5_xhdl185_xhdl2517  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE ARADDR_IS5_xhdl186_xhdl2519  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE ARLEN_IS5_xhdl187_xhdl2521  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARSIZE_IS5_xhdl188_xhdl2523  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARBURST_IS5_xhdl189_xhdl2525  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARLOCK_IS5_xhdl190_xhdl2527  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARCACHE_IS5_xhdl191_xhdl2529  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARPROT_IS5_xhdl192_xhdl2531  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARVALID_IS5_xhdl193_xhdl2533  : std_logic;
      VARIABLE ARID_IS6_xhdl210_xhdl2535  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE ARADDR_IS6_xhdl211_xhdl2537  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE ARLEN_IS6_xhdl212_xhdl2539  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARSIZE_IS6_xhdl213_xhdl2541  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARBURST_IS6_xhdl214_xhdl2543  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARLOCK_IS6_xhdl215_xhdl2545  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARCACHE_IS6_xhdl216_xhdl2547  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARPROT_IS6_xhdl217_xhdl2549  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARVALID_IS6_xhdl218_xhdl2551  : std_logic;
      VARIABLE ARID_IS7_xhdl235_xhdl2553  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE ARADDR_IS7_xhdl236_xhdl2555  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE ARLEN_IS7_xhdl237_xhdl2557  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARSIZE_IS7_xhdl238_xhdl2559  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARBURST_IS7_xhdl239_xhdl2561  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARLOCK_IS7_xhdl240_xhdl2563  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARCACHE_IS7_xhdl241_xhdl2565  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARPROT_IS7_xhdl242_xhdl2567  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARVALID_IS7_xhdl243_xhdl2569  : std_logic;
      VARIABLE ARID_IS8_xhdl260_xhdl2571  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE ARADDR_IS8_xhdl261_xhdl2573  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE ARLEN_IS8_xhdl262_xhdl2575  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARSIZE_IS8_xhdl263_xhdl2577  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARBURST_IS8_xhdl264_xhdl2579  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARLOCK_IS8_xhdl265_xhdl2581  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARCACHE_IS8_xhdl266_xhdl2583  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARPROT_IS8_xhdl267_xhdl2585  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARVALID_IS8_xhdl268_xhdl2587  : std_logic;
      VARIABLE ARID_IS9_xhdl285_xhdl2589  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE ARADDR_IS9_xhdl286_xhdl2591  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE ARLEN_IS9_xhdl287_xhdl2593  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARSIZE_IS9_xhdl288_xhdl2595  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARBURST_IS9_xhdl289_xhdl2597  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARLOCK_IS9_xhdl290_xhdl2599  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARCACHE_IS9_xhdl291_xhdl2601  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARPROT_IS9_xhdl292_xhdl2603  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARVALID_IS9_xhdl293_xhdl2605  : std_logic;
      VARIABLE ARID_IS10_xhdl310_xhdl2607  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE ARADDR_IS10_xhdl311_xhdl2609  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE ARLEN_IS10_xhdl312_xhdl2611  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARSIZE_IS10_xhdl313_xhdl2613  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARBURST_IS10_xhdl314_xhdl2615  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARLOCK_IS10_xhdl315_xhdl2617  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARCACHE_IS10_xhdl316_xhdl2619  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARPROT_IS10_xhdl317_xhdl2621  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARVALID_IS10_xhdl318_xhdl2623  : std_logic;
      VARIABLE ARID_IS11_xhdl335_xhdl2625  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE ARADDR_IS11_xhdl336_xhdl2627  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE ARLEN_IS11_xhdl337_xhdl2629  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARSIZE_IS11_xhdl338_xhdl2631  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARBURST_IS11_xhdl339_xhdl2633  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARLOCK_IS11_xhdl340_xhdl2635  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARCACHE_IS11_xhdl341_xhdl2637  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARPROT_IS11_xhdl342_xhdl2639  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARVALID_IS11_xhdl343_xhdl2641  : std_logic;
      VARIABLE ARID_IS12_xhdl360_xhdl2643  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE ARADDR_IS12_xhdl361_xhdl2645  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE ARLEN_IS12_xhdl362_xhdl2647  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARSIZE_IS12_xhdl363_xhdl2649  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARBURST_IS12_xhdl364_xhdl2651  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARLOCK_IS12_xhdl365_xhdl2653  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARCACHE_IS12_xhdl366_xhdl2655  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARPROT_IS12_xhdl367_xhdl2657  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARVALID_IS12_xhdl368_xhdl2659  : std_logic;
      VARIABLE ARID_IS13_xhdl385_xhdl2661  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE ARADDR_IS13_xhdl386_xhdl2663  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE ARLEN_IS13_xhdl387_xhdl2665  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARSIZE_IS13_xhdl388_xhdl2667  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARBURST_IS13_xhdl389_xhdl2669  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARLOCK_IS13_xhdl390_xhdl2671  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARCACHE_IS13_xhdl391_xhdl2673  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARPROT_IS13_xhdl392_xhdl2675  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARVALID_IS13_xhdl393_xhdl2677  : std_logic;
      VARIABLE ARID_IS14_xhdl410_xhdl2679  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE ARADDR_IS14_xhdl411_xhdl2681  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE ARLEN_IS14_xhdl412_xhdl2683  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARSIZE_IS14_xhdl413_xhdl2685  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARBURST_IS14_xhdl414_xhdl2687  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARLOCK_IS14_xhdl415_xhdl2689  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARCACHE_IS14_xhdl416_xhdl2691  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARPROT_IS14_xhdl417_xhdl2693  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARVALID_IS14_xhdl418_xhdl2695  : std_logic;
      VARIABLE ARID_IS15_xhdl435_xhdl2697  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE ARADDR_IS15_xhdl436_xhdl2699  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE ARLEN_IS15_xhdl437_xhdl2701  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARSIZE_IS15_xhdl438_xhdl2703  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARBURST_IS15_xhdl439_xhdl2705  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARLOCK_IS15_xhdl440_xhdl2707  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARCACHE_IS15_xhdl441_xhdl2709  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARPROT_IS15_xhdl442_xhdl2711  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARVALID_IS15_xhdl443_xhdl2713  : std_logic;
      VARIABLE ARID_IS16_xhdl460_xhdl2714  : std_logic_vector(BASE_ID_WIDTH + 
      ID_WIDTH - 1 DOWNTO 0);
      VARIABLE ARADDR_IS16_xhdl461_xhdl2715  : std_logic_vector(31 
      DOWNTO 0);
      VARIABLE ARLEN_IS16_xhdl462_xhdl2716  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARSIZE_IS16_xhdl463_xhdl2717  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARBURST_IS16_xhdl464_xhdl2718  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARLOCK_IS16_xhdl465_xhdl2719  : std_logic_vector(1 DOWNTO 0);
      VARIABLE ARCACHE_IS16_xhdl466_xhdl2720  : std_logic_vector(3 DOWNTO 0);
      VARIABLE ARPROT_IS16_xhdl467_xhdl2721  : std_logic_vector(2 DOWNTO 0);
      VARIABLE ARVALID_IS16_xhdl468_xhdl2722  : std_logic;
   BEGIN 
      ARID_IS0_xhdl60_xhdl2427      :=   temp_xhdl2426;
      ARADDR_IS0_xhdl61_xhdl2429    :=   temp_xhdl2428;  
      ARLEN_IS0_xhdl62_xhdl2431     :=   temp_xhdl2430;
      ARSIZE_IS0_xhdl63_xhdl2433    :=   temp_xhdl2432;
      ARBURST_IS0_xhdl64_xhdl2435   :=   temp_xhdl2434;
      ARLOCK_IS0_xhdl65_xhdl2437    :=   temp_xhdl2436; 
      ARCACHE_IS0_xhdl66_xhdl2439   :=   temp_xhdl2438;
      ARPROT_IS0_xhdl67_xhdl2441    :=   temp_xhdl2440;  
      ARVALID_IS0_xhdl68_xhdl2443   :=   temp_xhdl2442;  
      ARID_IS1_xhdl85_xhdl2445      :=   temp_xhdl2444;    
      ARADDR_IS1_xhdl86_xhdl2447    :=   temp_xhdl2446;  
      ARLEN_IS1_xhdl87_xhdl2449     :=   temp_xhdl2448;
      ARSIZE_IS1_xhdl88_xhdl2451    :=   temp_xhdl2450;
      ARBURST_IS1_xhdl89_xhdl2453   :=   temp_xhdl2452;
      ARLOCK_IS1_xhdl90_xhdl2455    :=   temp_xhdl2454;
      ARCACHE_IS1_xhdl91_xhdl2457   :=   temp_xhdl2456;
      ARPROT_IS1_xhdl92_xhdl2459    :=   temp_xhdl2458;
      ARVALID_IS1_xhdl93_xhdl2461   :=   temp_xhdl2460;
      ARID_IS2_xhdl110_xhdl2463     :=   temp_xhdl2462;
      ARADDR_IS2_xhdl111_xhdl2465   :=   temp_xhdl2464;
      ARLEN_IS2_xhdl112_xhdl2467    :=   temp_xhdl2466;
      ARSIZE_IS2_xhdl113_xhdl2469   :=   temp_xhdl2468;
      ARBURST_IS2_xhdl114_xhdl2471  :=   temp_xhdl2470;
      ARLOCK_IS2_xhdl115_xhdl2473   :=   temp_xhdl2472;
      ARCACHE_IS2_xhdl116_xhdl2475  :=   temp_xhdl2474;
      ARPROT_IS2_xhdl117_xhdl2477   :=   temp_xhdl2476;
      ARVALID_IS2_xhdl118_xhdl2479  :=   temp_xhdl2478;
      ARID_IS3_xhdl135_xhdl2481     :=   temp_xhdl2480;
      ARADDR_IS3_xhdl136_xhdl2483   :=   temp_xhdl2482;
      ARLEN_IS3_xhdl137_xhdl2485    :=   temp_xhdl2484;
      ARSIZE_IS3_xhdl138_xhdl2487   :=   temp_xhdl2486;
      ARBURST_IS3_xhdl139_xhdl2489  :=   temp_xhdl2488;
      ARLOCK_IS3_xhdl140_xhdl2491   :=   temp_xhdl2490;
      ARCACHE_IS3_xhdl141_xhdl2493  :=   temp_xhdl2492;
      ARPROT_IS3_xhdl142_xhdl2495   :=   temp_xhdl2494;
      ARVALID_IS3_xhdl143_xhdl2497  :=   temp_xhdl2496;
      ARID_IS4_xhdl160_xhdl2499     :=   temp_xhdl2498;
      ARADDR_IS4_xhdl161_xhdl2501   :=   temp_xhdl2500;
      ARLEN_IS4_xhdl162_xhdl2503    :=   temp_xhdl2502;
      ARSIZE_IS4_xhdl163_xhdl2505   :=   temp_xhdl2504;
      ARBURST_IS4_xhdl164_xhdl2507  :=   temp_xhdl2506;
      ARLOCK_IS4_xhdl165_xhdl2509   :=   temp_xhdl2508;
      ARCACHE_IS4_xhdl166_xhdl2511  :=   temp_xhdl2510;
      ARPROT_IS4_xhdl167_xhdl2513   :=   temp_xhdl2512;
      ARVALID_IS4_xhdl168_xhdl2515  :=   temp_xhdl2514;
      ARID_IS5_xhdl185_xhdl2517     :=   temp_xhdl2516;
      ARADDR_IS5_xhdl186_xhdl2519   :=   temp_xhdl2518;
      ARLEN_IS5_xhdl187_xhdl2521    :=   temp_xhdl2520;
      ARSIZE_IS5_xhdl188_xhdl2523   :=   temp_xhdl2522;
      ARBURST_IS5_xhdl189_xhdl2525  :=   temp_xhdl2524;
      ARLOCK_IS5_xhdl190_xhdl2527   :=   temp_xhdl2526;
      ARCACHE_IS5_xhdl191_xhdl2529  :=   temp_xhdl2528;
      ARPROT_IS5_xhdl192_xhdl2531   :=   temp_xhdl2530;
      ARVALID_IS5_xhdl193_xhdl2533  :=   temp_xhdl2532;
      ARID_IS6_xhdl210_xhdl2535     :=   temp_xhdl2534;
      ARADDR_IS6_xhdl211_xhdl2537   :=   temp_xhdl2536;
      ARLEN_IS6_xhdl212_xhdl2539    :=   temp_xhdl2538;
      ARSIZE_IS6_xhdl213_xhdl2541   :=   temp_xhdl2540;
      ARBURST_IS6_xhdl214_xhdl2543  :=   temp_xhdl2542;
      ARLOCK_IS6_xhdl215_xhdl2545   :=   temp_xhdl2544;
      ARCACHE_IS6_xhdl216_xhdl2547  :=   temp_xhdl2546;
      ARPROT_IS6_xhdl217_xhdl2549   :=   temp_xhdl2548;
      ARVALID_IS6_xhdl218_xhdl2551  :=   temp_xhdl2550;
      ARID_IS7_xhdl235_xhdl2553     :=   temp_xhdl2552;
      ARADDR_IS7_xhdl236_xhdl2555   :=   temp_xhdl2554;
      ARLEN_IS7_xhdl237_xhdl2557    :=   temp_xhdl2556;
      ARSIZE_IS7_xhdl238_xhdl2559   :=   temp_xhdl2558;
      ARBURST_IS7_xhdl239_xhdl2561  :=   temp_xhdl2560;
      ARLOCK_IS7_xhdl240_xhdl2563   :=   temp_xhdl2562;
      ARCACHE_IS7_xhdl241_xhdl2565  :=   temp_xhdl2564;
      ARPROT_IS7_xhdl242_xhdl2567   :=   temp_xhdl2566;
      ARVALID_IS7_xhdl243_xhdl2569  :=   temp_xhdl2568;
      ARID_IS8_xhdl260_xhdl2571     :=   temp_xhdl2570;
      ARADDR_IS8_xhdl261_xhdl2573   :=   temp_xhdl2572;
      ARLEN_IS8_xhdl262_xhdl2575    :=   temp_xhdl2574;
      ARSIZE_IS8_xhdl263_xhdl2577   :=   temp_xhdl2576;
      ARBURST_IS8_xhdl264_xhdl2579  :=   temp_xhdl2578;
      ARLOCK_IS8_xhdl265_xhdl2581   :=   temp_xhdl2580;
      ARCACHE_IS8_xhdl266_xhdl2583  :=   temp_xhdl2582;
      ARPROT_IS8_xhdl267_xhdl2585   :=   temp_xhdl2584;
      ARVALID_IS8_xhdl268_xhdl2587  :=   temp_xhdl2586;
      ARID_IS9_xhdl285_xhdl2589     :=   temp_xhdl2588;
      ARADDR_IS9_xhdl286_xhdl2591   :=   temp_xhdl2590;
      ARLEN_IS9_xhdl287_xhdl2593    :=   temp_xhdl2592;
      ARSIZE_IS9_xhdl288_xhdl2595   :=   temp_xhdl2594;
      ARBURST_IS9_xhdl289_xhdl2597  :=   temp_xhdl2596;
      ARLOCK_IS9_xhdl290_xhdl2599   :=   temp_xhdl2598;
      ARCACHE_IS9_xhdl291_xhdl2601  :=   temp_xhdl2600;
      ARPROT_IS9_xhdl292_xhdl2603   :=   temp_xhdl2602;
      ARVALID_IS9_xhdl293_xhdl2605  :=   temp_xhdl2604;
      ARID_IS10_xhdl310_xhdl2607    :=   temp_xhdl2606;
      ARADDR_IS10_xhdl311_xhdl2609  :=   temp_xhdl2608;
      ARLEN_IS10_xhdl312_xhdl2611   :=   temp_xhdl2610;
      ARSIZE_IS10_xhdl313_xhdl2613  :=   temp_xhdl2612;
      ARBURST_IS10_xhdl314_xhdl2615 :=   temp_xhdl2614;
      ARLOCK_IS10_xhdl315_xhdl2617  :=   temp_xhdl2616;
      ARCACHE_IS10_xhdl316_xhdl2619 :=   temp_xhdl2618;
      ARPROT_IS10_xhdl317_xhdl2621  :=   temp_xhdl2620;
      ARVALID_IS10_xhdl318_xhdl2623 :=   temp_xhdl2622;
      ARID_IS11_xhdl335_xhdl2625    :=   temp_xhdl2624;
      ARADDR_IS11_xhdl336_xhdl2627  :=   temp_xhdl2626;
      ARLEN_IS11_xhdl337_xhdl2629   :=   temp_xhdl2628;
      ARSIZE_IS11_xhdl338_xhdl2631  :=   temp_xhdl2630;
      ARBURST_IS11_xhdl339_xhdl2633 :=   temp_xhdl2632;
      ARLOCK_IS11_xhdl340_xhdl2635  :=   temp_xhdl2634;
      ARCACHE_IS11_xhdl341_xhdl2637 :=   temp_xhdl2636;
      ARPROT_IS11_xhdl342_xhdl2639  :=   temp_xhdl2638;
      ARVALID_IS11_xhdl343_xhdl2641 :=   temp_xhdl2640;
      ARID_IS12_xhdl360_xhdl2643    :=   temp_xhdl2642;
      ARADDR_IS12_xhdl361_xhdl2645  :=   temp_xhdl2644;
      ARLEN_IS12_xhdl362_xhdl2647   :=   temp_xhdl2646;
      ARSIZE_IS12_xhdl363_xhdl2649  :=   temp_xhdl2648;
      ARBURST_IS12_xhdl364_xhdl2651 :=   temp_xhdl2650;
      ARLOCK_IS12_xhdl365_xhdl2653  :=   temp_xhdl2652;
      ARCACHE_IS12_xhdl366_xhdl2655 :=   temp_xhdl2654;
      ARPROT_IS12_xhdl367_xhdl2657  :=   temp_xhdl2656;
      ARVALID_IS12_xhdl368_xhdl2659 :=   temp_xhdl2658;
      ARID_IS13_xhdl385_xhdl2661    :=   temp_xhdl2660;
      ARADDR_IS13_xhdl386_xhdl2663  :=   temp_xhdl2662;
      ARLEN_IS13_xhdl387_xhdl2665   :=   temp_xhdl2664;
      ARSIZE_IS13_xhdl388_xhdl2667  :=   temp_xhdl2666;
      ARBURST_IS13_xhdl389_xhdl2669 :=   temp_xhdl2668;
      ARLOCK_IS13_xhdl390_xhdl2671  :=   temp_xhdl2670;
      ARCACHE_IS13_xhdl391_xhdl2673 :=   temp_xhdl2672;
      ARPROT_IS13_xhdl392_xhdl2675  :=   temp_xhdl2674;
      ARVALID_IS13_xhdl393_xhdl2677 :=   temp_xhdl2676;
      ARID_IS14_xhdl410_xhdl2679    :=   temp_xhdl2678;
      ARADDR_IS14_xhdl411_xhdl2681  :=   temp_xhdl2680;
      ARLEN_IS14_xhdl412_xhdl2683   :=   temp_xhdl2682;
      ARSIZE_IS14_xhdl413_xhdl2685  :=   temp_xhdl2684;
      ARBURST_IS14_xhdl414_xhdl2687 :=   temp_xhdl2686;
      ARLOCK_IS14_xhdl415_xhdl2689  :=   temp_xhdl2688;
      ARCACHE_IS14_xhdl416_xhdl2691 :=   temp_xhdl2690;
      ARPROT_IS14_xhdl417_xhdl2693  :=   temp_xhdl2692;
      ARVALID_IS14_xhdl418_xhdl2695 :=   temp_xhdl2694;
      ARID_IS15_xhdl435_xhdl2697    :=   temp_xhdl2696;
      ARADDR_IS15_xhdl436_xhdl2699  :=   temp_xhdl2698;
      ARLEN_IS15_xhdl437_xhdl2701   :=   temp_xhdl2700;
      ARSIZE_IS15_xhdl438_xhdl2703  :=   temp_xhdl2702;
      ARBURST_IS15_xhdl439_xhdl2705 :=   temp_xhdl2704;
      ARLOCK_IS15_xhdl440_xhdl2707  :=   temp_xhdl2706;
      ARCACHE_IS15_xhdl441_xhdl2709 :=   temp_xhdl2708;
      ARPROT_IS15_xhdl442_xhdl2711  :=   temp_xhdl2710;
      ARVALID_IS15_xhdl443_xhdl2713 :=   temp_xhdl2712;
      IF ( (MEMSPACE = 0 AND ADDR_HGS_CFG = 1 AND 
      ARVALID_IS16_gated_r = '1' AND (ARADDR_IS16_gated_r(AXI_AWIDTH - 
      1 DOWNTO AXI_AWIDTH - 4) > "0111")) OR (MEMSPACE = 0 AND 
      ADDR_HGS_CFG = 0 AND ARVALID_IS16_gated_r = '1' AND 
      (ARADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) 
      < "1000")) OR (MEMSPACE > 0 AND SC_0 = 1 AND 
      ARVALID_IS16_gated_r = '1' AND (ARADDR_IS16_gated_r(AXI_AWIDTH - 
      1 DOWNTO AXI_AWIDTH - 4) = "0000")) OR (MEMSPACE > 0 AND 
      SC_1 = 1 AND ARVALID_IS16_gated_r = '1' AND 
      ARADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) 
      = "0001") OR (MEMSPACE > 0 AND SC_2 = 1 AND 
      ARVALID_IS16_gated_r = '1' AND (ARADDR_IS16_gated_r(AXI_AWIDTH - 
      1 DOWNTO AXI_AWIDTH - 4) = "0010")) OR (MEMSPACE > 0 AND 
      SC_3 = 1 AND ARVALID_IS16_gated_r = '1' AND 
      ARADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) 
      = "0011") OR (MEMSPACE > 0 AND SC_4 = 1 AND 
      ARVALID_IS16_gated_r = '1' AND (ARADDR_IS16_gated_r(AXI_AWIDTH - 
      1 DOWNTO AXI_AWIDTH - 4) = "0100")) OR (MEMSPACE > 0 AND 
      SC_5 = 1 AND ARVALID_IS16_gated_r = '1' AND 
      ARADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) 
      = "0101") OR (MEMSPACE > 0 AND SC_6 = 1 AND 
      ARVALID_IS16_gated_r = '1' AND (ARADDR_IS16_gated_r(AXI_AWIDTH - 
      1 DOWNTO AXI_AWIDTH - 4) = "0110")) OR (MEMSPACE > 0 AND 
      SC_7 = 1 AND ARVALID_IS16_gated_r = '1' AND 
      ARADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) 
      = "0111") OR (MEMSPACE > 0 AND SC_8 = 1 AND 
      ARVALID_IS16_gated_r = '1' AND (ARADDR_IS16_gated_r(AXI_AWIDTH - 
      1 DOWNTO AXI_AWIDTH - 4) = "1000")) OR (MEMSPACE > 0 AND 
      SC_9 = 1 AND ARVALID_IS16_gated_r = '1' AND 
      ARADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) 
      = "1001") OR (MEMSPACE > 0 AND SC_10 = 1 AND 
      ARVALID_IS16_gated_r = '1' AND (ARADDR_IS16_gated_r(AXI_AWIDTH - 
      1 DOWNTO AXI_AWIDTH - 4) = "1010")) OR (MEMSPACE > 0 AND 
      SC_11 = 1 AND ARVALID_IS16_gated_r = '1' AND 
      ARADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) 
      = "1011") OR (MEMSPACE > 0 AND SC_12 = 1 AND 
      ARVALID_IS16_gated_r = '1' AND (ARADDR_IS16_gated_r(AXI_AWIDTH - 
      1 DOWNTO AXI_AWIDTH - 4) = "1100")) OR (MEMSPACE > 0 AND 
      SC_13 = 1 AND ARVALID_IS16_gated_r = '1' AND 
      ARADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) 
      = "1101") OR (MEMSPACE > 0 AND SC_14 = 1 AND 
      ARVALID_IS16_gated_r = '1' AND (ARADDR_IS16_gated_r(AXI_AWIDTH - 
      1 DOWNTO AXI_AWIDTH - 4) = "1110")) OR (MEMSPACE > 0 AND 
      SC_15 = 1 AND ARVALID_IS16_gated_r = '1'  AND 
      (ARADDR_IS16_gated_r(AXI_AWIDTH - 1 DOWNTO AXI_AWIDTH - 4) 
      = "1111"))) THEN
         ARID_IS16_xhdl460_xhdl2714 := ARID_IS16_gated;    
         ARADDR_IS16_xhdl461_xhdl2715 := ARADDR_IS16_gated;    
         ARLEN_IS16_xhdl462_xhdl2716 := ARLEN_IS16_gated;    
         ARSIZE_IS16_xhdl463_xhdl2717 := ARSIZE_IS16_gated;    
         ARBURST_IS16_xhdl464_xhdl2718 := ARBURST_IS16_gated;    
         ARLOCK_IS16_xhdl465_xhdl2719 := ARLOCK_IS16_gated;    
         ARCACHE_IS16_xhdl466_xhdl2720 := ARCACHE_IS16_gated;    
         ARPROT_IS16_xhdl467_xhdl2721 := ARPROT_IS16_gated;    
         ARVALID_IS16_xhdl468_xhdl2722 := ARVALID_IS16_gated;    
      ELSE 
         ARID_IS16_xhdl460_xhdl2714 := (OTHERS => '0');    
         ARADDR_IS16_xhdl461_xhdl2715 := (OTHERS => '0');    
         ARLEN_IS16_xhdl462_xhdl2716 := (OTHERS => '0');    
         ARSIZE_IS16_xhdl463_xhdl2717 := (OTHERS => '0');    
         ARBURST_IS16_xhdl464_xhdl2718 := (OTHERS => '0');    
         ARLOCK_IS16_xhdl465_xhdl2719 := (OTHERS => '0');    
         ARCACHE_IS16_xhdl466_xhdl2720 := (OTHERS => '0');    
         ARPROT_IS16_xhdl467_xhdl2721 := (OTHERS => '0');    
         ARVALID_IS16_xhdl468_xhdl2722 := '0';    
      END IF;
      ARID_IS0_xhdl60 <= ARID_IS0_xhdl60_xhdl2427;
      ARADDR_IS0_xhdl61 <= ARADDR_IS0_xhdl61_xhdl2429;
      ARLEN_IS0_xhdl62 <= ARLEN_IS0_xhdl62_xhdl2431;
      ARSIZE_IS0_xhdl63 <= ARSIZE_IS0_xhdl63_xhdl2433;
      ARBURST_IS0_xhdl64 <= ARBURST_IS0_xhdl64_xhdl2435;
      ARLOCK_IS0_xhdl65 <= ARLOCK_IS0_xhdl65_xhdl2437;
      ARCACHE_IS0_xhdl66 <= ARCACHE_IS0_xhdl66_xhdl2439;
      ARPROT_IS0_xhdl67 <= ARPROT_IS0_xhdl67_xhdl2441;
      ARVALID_IS0_xhdl68 <= ARVALID_IS0_xhdl68_xhdl2443;
      ARID_IS1_xhdl85 <= ARID_IS1_xhdl85_xhdl2445;
      ARADDR_IS1_xhdl86 <= ARADDR_IS1_xhdl86_xhdl2447;
      ARLEN_IS1_xhdl87 <= ARLEN_IS1_xhdl87_xhdl2449;
      ARSIZE_IS1_xhdl88 <= ARSIZE_IS1_xhdl88_xhdl2451;
      ARBURST_IS1_xhdl89 <= ARBURST_IS1_xhdl89_xhdl2453;
      ARLOCK_IS1_xhdl90 <= ARLOCK_IS1_xhdl90_xhdl2455;
      ARCACHE_IS1_xhdl91 <= ARCACHE_IS1_xhdl91_xhdl2457;
      ARPROT_IS1_xhdl92 <= ARPROT_IS1_xhdl92_xhdl2459;
      ARVALID_IS1_xhdl93 <= ARVALID_IS1_xhdl93_xhdl2461;
      ARID_IS2_xhdl110 <= ARID_IS2_xhdl110_xhdl2463;
      ARADDR_IS2_xhdl111 <= ARADDR_IS2_xhdl111_xhdl2465;
      ARLEN_IS2_xhdl112 <= ARLEN_IS2_xhdl112_xhdl2467;
      ARSIZE_IS2_xhdl113 <= ARSIZE_IS2_xhdl113_xhdl2469;
      ARBURST_IS2_xhdl114 <= ARBURST_IS2_xhdl114_xhdl2471;
      ARLOCK_IS2_xhdl115 <= ARLOCK_IS2_xhdl115_xhdl2473;
      ARCACHE_IS2_xhdl116 <= ARCACHE_IS2_xhdl116_xhdl2475;
      ARPROT_IS2_xhdl117 <= ARPROT_IS2_xhdl117_xhdl2477;
      ARVALID_IS2_xhdl118 <= ARVALID_IS2_xhdl118_xhdl2479;
      ARID_IS3_xhdl135 <= ARID_IS3_xhdl135_xhdl2481;
      ARADDR_IS3_xhdl136 <= ARADDR_IS3_xhdl136_xhdl2483;
      ARLEN_IS3_xhdl137 <= ARLEN_IS3_xhdl137_xhdl2485;
      ARSIZE_IS3_xhdl138 <= ARSIZE_IS3_xhdl138_xhdl2487;
      ARBURST_IS3_xhdl139 <= ARBURST_IS3_xhdl139_xhdl2489;
      ARLOCK_IS3_xhdl140 <= ARLOCK_IS3_xhdl140_xhdl2491;
      ARCACHE_IS3_xhdl141 <= ARCACHE_IS3_xhdl141_xhdl2493;
      ARPROT_IS3_xhdl142 <= ARPROT_IS3_xhdl142_xhdl2495;
      ARVALID_IS3_xhdl143 <= ARVALID_IS3_xhdl143_xhdl2497;
      ARID_IS4_xhdl160 <= ARID_IS4_xhdl160_xhdl2499;
      ARADDR_IS4_xhdl161 <= ARADDR_IS4_xhdl161_xhdl2501;
      ARLEN_IS4_xhdl162 <= ARLEN_IS4_xhdl162_xhdl2503;
      ARSIZE_IS4_xhdl163 <= ARSIZE_IS4_xhdl163_xhdl2505;
      ARBURST_IS4_xhdl164 <= ARBURST_IS4_xhdl164_xhdl2507;
      ARLOCK_IS4_xhdl165 <= ARLOCK_IS4_xhdl165_xhdl2509;
      ARCACHE_IS4_xhdl166 <= ARCACHE_IS4_xhdl166_xhdl2511;
      ARPROT_IS4_xhdl167 <= ARPROT_IS4_xhdl167_xhdl2513;
      ARVALID_IS4_xhdl168 <= ARVALID_IS4_xhdl168_xhdl2515;
      ARID_IS5_xhdl185 <= ARID_IS5_xhdl185_xhdl2517;
      ARADDR_IS5_xhdl186 <= ARADDR_IS5_xhdl186_xhdl2519;
      ARLEN_IS5_xhdl187 <= ARLEN_IS5_xhdl187_xhdl2521;
      ARSIZE_IS5_xhdl188 <= ARSIZE_IS5_xhdl188_xhdl2523;
      ARBURST_IS5_xhdl189 <= ARBURST_IS5_xhdl189_xhdl2525;
      ARLOCK_IS5_xhdl190 <= ARLOCK_IS5_xhdl190_xhdl2527;
      ARCACHE_IS5_xhdl191 <= ARCACHE_IS5_xhdl191_xhdl2529;
      ARPROT_IS5_xhdl192 <= ARPROT_IS5_xhdl192_xhdl2531;
      ARVALID_IS5_xhdl193 <= ARVALID_IS5_xhdl193_xhdl2533;
      ARID_IS6_xhdl210 <= ARID_IS6_xhdl210_xhdl2535;
      ARADDR_IS6_xhdl211 <= ARADDR_IS6_xhdl211_xhdl2537;
      ARLEN_IS6_xhdl212 <= ARLEN_IS6_xhdl212_xhdl2539;
      ARSIZE_IS6_xhdl213 <= ARSIZE_IS6_xhdl213_xhdl2541;
      ARBURST_IS6_xhdl214 <= ARBURST_IS6_xhdl214_xhdl2543;
      ARLOCK_IS6_xhdl215 <= ARLOCK_IS6_xhdl215_xhdl2545;
      ARCACHE_IS6_xhdl216 <= ARCACHE_IS6_xhdl216_xhdl2547;
      ARPROT_IS6_xhdl217 <= ARPROT_IS6_xhdl217_xhdl2549;
      ARVALID_IS6_xhdl218 <= ARVALID_IS6_xhdl218_xhdl2551;
      ARID_IS7_xhdl235 <= ARID_IS7_xhdl235_xhdl2553;
      ARADDR_IS7_xhdl236 <= ARADDR_IS7_xhdl236_xhdl2555;
      ARLEN_IS7_xhdl237 <= ARLEN_IS7_xhdl237_xhdl2557;
      ARSIZE_IS7_xhdl238 <= ARSIZE_IS7_xhdl238_xhdl2559;
      ARBURST_IS7_xhdl239 <= ARBURST_IS7_xhdl239_xhdl2561;
      ARLOCK_IS7_xhdl240 <= ARLOCK_IS7_xhdl240_xhdl2563;
      ARCACHE_IS7_xhdl241 <= ARCACHE_IS7_xhdl241_xhdl2565;
      ARPROT_IS7_xhdl242 <= ARPROT_IS7_xhdl242_xhdl2567;
      ARVALID_IS7_xhdl243 <= ARVALID_IS7_xhdl243_xhdl2569;
      ARID_IS8_xhdl260 <= ARID_IS8_xhdl260_xhdl2571;
      ARADDR_IS8_xhdl261 <= ARADDR_IS8_xhdl261_xhdl2573;
      ARLEN_IS8_xhdl262 <= ARLEN_IS8_xhdl262_xhdl2575;
      ARSIZE_IS8_xhdl263 <= ARSIZE_IS8_xhdl263_xhdl2577;
      ARBURST_IS8_xhdl264 <= ARBURST_IS8_xhdl264_xhdl2579;
      ARLOCK_IS8_xhdl265 <= ARLOCK_IS8_xhdl265_xhdl2581;
      ARCACHE_IS8_xhdl266 <= ARCACHE_IS8_xhdl266_xhdl2583;
      ARPROT_IS8_xhdl267 <= ARPROT_IS8_xhdl267_xhdl2585;
      ARVALID_IS8_xhdl268 <= ARVALID_IS8_xhdl268_xhdl2587;
      ARID_IS9_xhdl285 <= ARID_IS9_xhdl285_xhdl2589;
      ARADDR_IS9_xhdl286 <= ARADDR_IS9_xhdl286_xhdl2591;
      ARLEN_IS9_xhdl287 <= ARLEN_IS9_xhdl287_xhdl2593;
      ARSIZE_IS9_xhdl288 <= ARSIZE_IS9_xhdl288_xhdl2595;
      ARBURST_IS9_xhdl289 <= ARBURST_IS9_xhdl289_xhdl2597;
      ARLOCK_IS9_xhdl290 <= ARLOCK_IS9_xhdl290_xhdl2599;
      ARCACHE_IS9_xhdl291 <= ARCACHE_IS9_xhdl291_xhdl2601;
      ARPROT_IS9_xhdl292 <= ARPROT_IS9_xhdl292_xhdl2603;
      ARVALID_IS9_xhdl293 <= ARVALID_IS9_xhdl293_xhdl2605;
      ARID_IS10_xhdl310 <= ARID_IS10_xhdl310_xhdl2607;
      ARADDR_IS10_xhdl311 <= ARADDR_IS10_xhdl311_xhdl2609;
      ARLEN_IS10_xhdl312 <= ARLEN_IS10_xhdl312_xhdl2611;
      ARSIZE_IS10_xhdl313 <= ARSIZE_IS10_xhdl313_xhdl2613;
      ARBURST_IS10_xhdl314 <= ARBURST_IS10_xhdl314_xhdl2615;
      ARLOCK_IS10_xhdl315 <= ARLOCK_IS10_xhdl315_xhdl2617;
      ARCACHE_IS10_xhdl316 <= ARCACHE_IS10_xhdl316_xhdl2619;
      ARPROT_IS10_xhdl317 <= ARPROT_IS10_xhdl317_xhdl2621;
      ARVALID_IS10_xhdl318 <= ARVALID_IS10_xhdl318_xhdl2623;
      ARID_IS11_xhdl335 <= ARID_IS11_xhdl335_xhdl2625;
      ARADDR_IS11_xhdl336 <= ARADDR_IS11_xhdl336_xhdl2627;
      ARLEN_IS11_xhdl337 <= ARLEN_IS11_xhdl337_xhdl2629;
      ARSIZE_IS11_xhdl338 <= ARSIZE_IS11_xhdl338_xhdl2631;
      ARBURST_IS11_xhdl339 <= ARBURST_IS11_xhdl339_xhdl2633;
      ARLOCK_IS11_xhdl340 <= ARLOCK_IS11_xhdl340_xhdl2635;
      ARCACHE_IS11_xhdl341 <= ARCACHE_IS11_xhdl341_xhdl2637;
      ARPROT_IS11_xhdl342 <= ARPROT_IS11_xhdl342_xhdl2639;
      ARVALID_IS11_xhdl343 <= ARVALID_IS11_xhdl343_xhdl2641;
      ARID_IS12_xhdl360 <= ARID_IS12_xhdl360_xhdl2643;
      ARADDR_IS12_xhdl361 <= ARADDR_IS12_xhdl361_xhdl2645;
      ARLEN_IS12_xhdl362 <= ARLEN_IS12_xhdl362_xhdl2647;
      ARSIZE_IS12_xhdl363 <= ARSIZE_IS12_xhdl363_xhdl2649;
      ARBURST_IS12_xhdl364 <= ARBURST_IS12_xhdl364_xhdl2651;
      ARLOCK_IS12_xhdl365 <= ARLOCK_IS12_xhdl365_xhdl2653;
      ARCACHE_IS12_xhdl366 <= ARCACHE_IS12_xhdl366_xhdl2655;
      ARPROT_IS12_xhdl367 <= ARPROT_IS12_xhdl367_xhdl2657;
      ARVALID_IS12_xhdl368 <= ARVALID_IS12_xhdl368_xhdl2659;
      ARID_IS13_xhdl385 <= ARID_IS13_xhdl385_xhdl2661;
      ARADDR_IS13_xhdl386 <= ARADDR_IS13_xhdl386_xhdl2663;
      ARLEN_IS13_xhdl387 <= ARLEN_IS13_xhdl387_xhdl2665;
      ARSIZE_IS13_xhdl388 <= ARSIZE_IS13_xhdl388_xhdl2667;
      ARBURST_IS13_xhdl389 <= ARBURST_IS13_xhdl389_xhdl2669;
      ARLOCK_IS13_xhdl390 <= ARLOCK_IS13_xhdl390_xhdl2671;
      ARCACHE_IS13_xhdl391 <= ARCACHE_IS13_xhdl391_xhdl2673;
      ARPROT_IS13_xhdl392 <= ARPROT_IS13_xhdl392_xhdl2675;
      ARVALID_IS13_xhdl393 <= ARVALID_IS13_xhdl393_xhdl2677;
      ARID_IS14_xhdl410 <= ARID_IS14_xhdl410_xhdl2679;
      ARADDR_IS14_xhdl411 <= ARADDR_IS14_xhdl411_xhdl2681;
      ARLEN_IS14_xhdl412 <= ARLEN_IS14_xhdl412_xhdl2683;
      ARSIZE_IS14_xhdl413 <= ARSIZE_IS14_xhdl413_xhdl2685;
      ARBURST_IS14_xhdl414 <= ARBURST_IS14_xhdl414_xhdl2687;
      ARLOCK_IS14_xhdl415 <= ARLOCK_IS14_xhdl415_xhdl2689;
      ARCACHE_IS14_xhdl416 <= ARCACHE_IS14_xhdl416_xhdl2691;
      ARPROT_IS14_xhdl417 <= ARPROT_IS14_xhdl417_xhdl2693;
      ARVALID_IS14_xhdl418 <= ARVALID_IS14_xhdl418_xhdl2695;
      ARID_IS15_xhdl435 <= ARID_IS15_xhdl435_xhdl2697;
      ARADDR_IS15_xhdl436 <= ARADDR_IS15_xhdl436_xhdl2699;
      ARLEN_IS15_xhdl437 <= ARLEN_IS15_xhdl437_xhdl2701;
      ARSIZE_IS15_xhdl438 <= ARSIZE_IS15_xhdl438_xhdl2703;
      ARBURST_IS15_xhdl439 <= ARBURST_IS15_xhdl439_xhdl2705;
      ARLOCK_IS15_xhdl440 <= ARLOCK_IS15_xhdl440_xhdl2707;
      ARCACHE_IS15_xhdl441 <= ARCACHE_IS15_xhdl441_xhdl2709;
      ARPROT_IS15_xhdl442 <= ARPROT_IS15_xhdl442_xhdl2711;
      ARVALID_IS15_xhdl443 <= ARVALID_IS15_xhdl443_xhdl2713;
      ARID_IS16_xhdl460 <= ARID_IS16_xhdl460_xhdl2714;
      ARADDR_IS16_xhdl461 <= ARADDR_IS16_xhdl461_xhdl2715;
      ARLEN_IS16_xhdl462 <= ARLEN_IS16_xhdl462_xhdl2716;
      ARSIZE_IS16_xhdl463 <= ARSIZE_IS16_xhdl463_xhdl2717;
      ARBURST_IS16_xhdl464 <= ARBURST_IS16_xhdl464_xhdl2718;
      ARLOCK_IS16_xhdl465 <= ARLOCK_IS16_xhdl465_xhdl2719;
      ARCACHE_IS16_xhdl466 <= ARCACHE_IS16_xhdl466_xhdl2720;
      ARPROT_IS16_xhdl467 <= ARPROT_IS16_xhdl467_xhdl2721;
      ARVALID_IS16_xhdl468 <= ARVALID_IS16_xhdl468_xhdl2722;
   END PROCESS;
   
   L10: IF (((M0_SLAVE0ENABLE = 1 OR M1_SLAVE0ENABLE = 1 OR M2_SLAVE0ENABLE = 1 OR 
   M3_SLAVE0ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE0ENABLE = 1 OR 
   M1_SLAVE0ENABLE = 1 OR M2_SLAVE0ENABLE = 1 OR M3_SLAVE0ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 1))) GENERATE
      inst_matrix_S0 : axi_matrix_s 
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
            AWADDR_IS_int => AWADDR_IS_int,
            ARADDR_IS_int => ARADDR_IS_int,
            gated_waddr => gated_waddr,
            gated_raddr => gated_raddr,
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
            m0_rd_end => m0_rd_end,
            m1_rd_end => m1_rd_end,
            m2_rd_end => m2_rd_end,
            m3_rd_end => m3_rd_end,
            m0_wr_end => m0_wr_end,
            m1_wr_end => m1_wr_end,
            m2_wr_end => m2_wr_end,
            m3_wr_end => m3_wr_end,
            AWID_MI0 => AWID_MI0,
            AWADDR_MI0 => AWADDR_MI0,
            AWLEN_MI0 => AWLEN_MI0,
            AWSIZE_MI0 => AWSIZE_MI0,
            AWBURST_MI0 => AWBURST_MI0,
            AWLOCK_MI0 => AWLOCK_MI0,
            AWCACHE_MI0 => AWCACHE_MI0,
            AWPROT_MI0 => AWPROT_MI0,
            AWVALID_MI0 => AWVALID_MI0,
            AWREADY_IM0 => AWREADY_S0IM0,
            WID_MI0 => WID_MI0,
            WDATA_MI0 => WDATA_MI0,
            WSTRB_MI0 => WSTRB_MI0,
            WLAST_MI0 => WLAST_MI0,
            WVALID_MI0 => WVALID_MI0,
            WREADY_IM0 => WREADY_S0IM0,
            ARID_MI0 => ARID_MI0,
            ARADDR_MI0 => ARADDR_MI0,
            ARLEN_MI0 => ARLEN_MI0,
            ARSIZE_MI0 => ARSIZE_MI0,
            ARBURST_MI0 => ARBURST_MI0,
            ARLOCK_MI0 => ARLOCK_MI0,
            ARCACHE_MI0 => ARCACHE_MI0,
            ARPROT_MI0 => ARPROT_MI0,
            ARVALID_MI0 => ARVALID_MI0,
            ARREADY_IM0 => ARREADY_S0IM0,
            AWID_MI1 => AWID_MI1,
            AWADDR_MI1 => AWADDR_MI1,
            AWLEN_MI1 => AWLEN_MI1,
            AWSIZE_MI1 => AWSIZE_MI1,
            AWBURST_MI1 => AWBURST_MI1,
            AWLOCK_MI1 => AWLOCK_MI1,
            AWCACHE_MI1 => AWCACHE_MI1,
            AWPROT_MI1 => AWPROT_MI1,
            AWVALID_MI1 => AWVALID_MI1,
            AWREADY_IM1 => AWREADY_S0IM1,
            WID_MI1 => WID_MI1,
            WDATA_MI1 => WDATA_MI1,
            WSTRB_MI1 => WSTRB_MI1,
            WLAST_MI1 => WLAST_MI1,
            WVALID_MI1 => WVALID_MI1,
            WREADY_IM1 => WREADY_S0IM1,
            ARID_MI1 => ARID_MI1,
            ARADDR_MI1 => ARADDR_MI1,
            ARLEN_MI1 => ARLEN_MI1,
            ARSIZE_MI1 => ARSIZE_MI1,
            ARBURST_MI1 => ARBURST_MI1,
            ARLOCK_MI1 => ARLOCK_MI1,
            ARCACHE_MI1 => ARCACHE_MI1,
            ARPROT_MI1 => ARPROT_MI1,
            ARVALID_MI1 => ARVALID_MI1,
            ARREADY_IM1 => ARREADY_S0IM1,
            AWID_MI2 => AWID_MI2,
            AWADDR_MI2 => AWADDR_MI2,
            AWLEN_MI2 => AWLEN_MI2,
            AWSIZE_MI2 => AWSIZE_MI2,
            AWBURST_MI2 => AWBURST_MI2,
            AWLOCK_MI2 => AWLOCK_MI2,
            AWCACHE_MI2 => AWCACHE_MI2,
            AWPROT_MI2 => AWPROT_MI2,
            AWVALID_MI2 => AWVALID_MI2,
            AWREADY_IM2 => AWREADY_S0IM2,
            WID_MI2 => WID_MI2,
            WDATA_MI2 => WDATA_MI2,
            WSTRB_MI2 => WSTRB_MI2,
            WLAST_MI2 => WLAST_MI2,
            WVALID_MI2 => WVALID_MI2,
            WREADY_IM2 => WREADY_S0IM2,
            ARID_MI2 => ARID_MI2,
            ARADDR_MI2 => ARADDR_MI2,
            ARLEN_MI2 => ARLEN_MI2,
            ARSIZE_MI2 => ARSIZE_MI2,
            ARBURST_MI2 => ARBURST_MI2,
            ARLOCK_MI2 => ARLOCK_MI2,
            ARCACHE_MI2 => ARCACHE_MI2,
            ARPROT_MI2 => ARPROT_MI2,
            ARVALID_MI2 => ARVALID_MI2,
            ARREADY_IM2 => ARREADY_S0IM2,
            AWID_MI3 => AWID_MI3,
            AWADDR_MI3 => AWADDR_MI3,
            AWLEN_MI3 => AWLEN_MI3,
            AWSIZE_MI3 => AWSIZE_MI3,
            AWBURST_MI3 => AWBURST_MI3,
            AWLOCK_MI3 => AWLOCK_MI3,
            AWCACHE_MI3 => AWCACHE_MI3,
            AWPROT_MI3 => AWPROT_MI3,
            AWVALID_MI3 => AWVALID_MI3,
            AWREADY_IM3 => AWREADY_S0IM3,
            WID_MI3 => WID_MI3,
            WDATA_MI3 => WDATA_MI3,
            WSTRB_MI3 => WSTRB_MI3,
            WLAST_MI3 => WLAST_MI3,
            WVALID_MI3 => WVALID_MI3,
            WREADY_IM3 => WREADY_S0IM3,
            ARID_MI3 => ARID_MI3,
            ARADDR_MI3 => ARADDR_MI3,
            ARLEN_MI3 => ARLEN_MI3,
            ARSIZE_MI3 => ARSIZE_MI3,
            ARBURST_MI3 => ARBURST_MI3,
            ARLOCK_MI3 => ARLOCK_MI3,
            ARCACHE_MI3 => ARCACHE_MI3,
            ARPROT_MI3 => ARPROT_MI3,
            ARVALID_MI3 => ARVALID_MI3,
            ARREADY_IM3 => ARREADY_S0IM3,
            AWID_IS => AWID_IS0_gated,
            AWADDR_IS => AWADDR_IS0_gated,
            AWLEN_IS => AWLEN_IS0_gated,
            AWSIZE_IS => AWSIZE_IS0_gated,
            AWBURST_IS => AWBURST_IS0_gated,
            AWLOCK_IS => AWLOCK_IS0_gated,
            AWCACHE_IS => AWCACHE_IS0_gated,
            AWPROT_IS => AWPROT_IS0_gated,
            AWVALID_IS => AWVALID_IS0_gated,
            AWREADY_SI => AWREADY_SI0,
            RVALID_SI => RVALID_SI0,
            RLAST_SI => RLAST_SI0,
            RREADY_IS => RREADY_IS0_xhdl69,
            WID_IS => WID_IS0_gated,
            WDATA_IS => WDATA_IS0_gated,
            WSTRB_IS => WSTRB_IS0_gated,
            WLAST_IS => WLAST_IS0_gated,
            WVALID_IS => WVALID_IS0_gated,
            WREADY_SI => WREADY_SI0,
            ARID_IS => ARID_IS0_gated,
            ARADDR_IS => ARADDR_IS0_gated,
            ARLEN_IS => ARLEN_IS0_gated,
            ARSIZE_IS => ARSIZE_IS0_gated,
            ARBURST_IS => ARBURST_IS0_gated,
            ARLOCK_IS => ARLOCK_IS0_gated,
            ARCACHE_IS => ARCACHE_IS0_gated,
            ARPROT_IS => ARPROT_IS0_gated,
            ARVALID_IS => ARVALID_IS0_gated,
            ARREADY_SI => ARREADY_SI0,
            SLAVE_NUMBER => "00000");
   END GENERATE L10;
   
   L12: IF (((M0_SLAVE1ENABLE = 1 OR M1_SLAVE1ENABLE = 1 OR M2_SLAVE1ENABLE = 1 OR 
   M3_SLAVE1ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE1ENABLE = 1 OR 
   M1_SLAVE1ENABLE = 1 OR M2_SLAVE1ENABLE = 1 OR M3_SLAVE1ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 1))) GENERATE
      inst_matrix_S1 : axi_matrix_s 
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
            AWADDR_IS_int => AWADDR_IS_int,
            ARADDR_IS_int => ARADDR_IS_int,
            gated_waddr => gated_waddr,
            gated_raddr => gated_raddr,
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
            m0_rd_end => m0_rd_end,
            m1_rd_end => m1_rd_end,
            m2_rd_end => m2_rd_end,
            m3_rd_end => m3_rd_end,
            m0_wr_end => m0_wr_end,
            m1_wr_end => m1_wr_end,
            m2_wr_end => m2_wr_end,
            m3_wr_end => m3_wr_end,
            AWID_MI0 => AWID_MI0,
            AWADDR_MI0 => AWADDR_MI0,
            AWLEN_MI0 => AWLEN_MI0,
            AWSIZE_MI0 => AWSIZE_MI0,
            AWBURST_MI0 => AWBURST_MI0,
            AWLOCK_MI0 => AWLOCK_MI0,
            AWCACHE_MI0 => AWCACHE_MI0,
            AWPROT_MI0 => AWPROT_MI0,
            AWVALID_MI0 => AWVALID_MI0,
            AWREADY_IM0 => AWREADY_S1IM0,
            WID_MI0 => WID_MI0,
            WDATA_MI0 => WDATA_MI0,
            WSTRB_MI0 => WSTRB_MI0,
            WLAST_MI0 => WLAST_MI0,
            WVALID_MI0 => WVALID_MI0,
            WREADY_IM0 => WREADY_S1IM0,
            ARID_MI0 => ARID_MI0,
            ARADDR_MI0 => ARADDR_MI0,
            ARLEN_MI0 => ARLEN_MI0,
            ARSIZE_MI0 => ARSIZE_MI0,
            ARBURST_MI0 => ARBURST_MI0,
            ARLOCK_MI0 => ARLOCK_MI0,
            ARCACHE_MI0 => ARCACHE_MI0,
            ARPROT_MI0 => ARPROT_MI0,
            ARVALID_MI0 => ARVALID_MI0,
            ARREADY_IM0 => ARREADY_S1IM0,
            AWID_MI1 => AWID_MI1,
            AWADDR_MI1 => AWADDR_MI1,
            AWLEN_MI1 => AWLEN_MI1,
            AWSIZE_MI1 => AWSIZE_MI1,
            AWBURST_MI1 => AWBURST_MI1,
            AWLOCK_MI1 => AWLOCK_MI1,
            AWCACHE_MI1 => AWCACHE_MI1,
            AWPROT_MI1 => AWPROT_MI1,
            AWVALID_MI1 => AWVALID_MI1,
            AWREADY_IM1 => AWREADY_S1IM1,
            WID_MI1 => WID_MI1,
            WDATA_MI1 => WDATA_MI1,
            WSTRB_MI1 => WSTRB_MI1,
            WLAST_MI1 => WLAST_MI1,
            WVALID_MI1 => WVALID_MI1,
            WREADY_IM1 => WREADY_S1IM1,
            ARID_MI1 => ARID_MI1,
            ARADDR_MI1 => ARADDR_MI1,
            ARLEN_MI1 => ARLEN_MI1,
            ARSIZE_MI1 => ARSIZE_MI1,
            ARBURST_MI1 => ARBURST_MI1,
            ARLOCK_MI1 => ARLOCK_MI1,
            ARCACHE_MI1 => ARCACHE_MI1,
            ARPROT_MI1 => ARPROT_MI1,
            ARVALID_MI1 => ARVALID_MI1,
            ARREADY_IM1 => ARREADY_S1IM1,
            AWID_MI2 => AWID_MI2,
            AWADDR_MI2 => AWADDR_MI2,
            AWLEN_MI2 => AWLEN_MI2,
            AWSIZE_MI2 => AWSIZE_MI2,
            AWBURST_MI2 => AWBURST_MI2,
            AWLOCK_MI2 => AWLOCK_MI2,
            AWCACHE_MI2 => AWCACHE_MI2,
            AWPROT_MI2 => AWPROT_MI2,
            AWVALID_MI2 => AWVALID_MI2,
            AWREADY_IM2 => AWREADY_S1IM2,
            WID_MI2 => WID_MI2,
            WDATA_MI2 => WDATA_MI2,
            WSTRB_MI2 => WSTRB_MI2,
            WLAST_MI2 => WLAST_MI2,
            WVALID_MI2 => WVALID_MI2,
            WREADY_IM2 => WREADY_S1IM2,
            ARID_MI2 => ARID_MI2,
            ARADDR_MI2 => ARADDR_MI2,
            ARLEN_MI2 => ARLEN_MI2,
            ARSIZE_MI2 => ARSIZE_MI2,
            ARBURST_MI2 => ARBURST_MI2,
            ARLOCK_MI2 => ARLOCK_MI2,
            ARCACHE_MI2 => ARCACHE_MI2,
            ARPROT_MI2 => ARPROT_MI2,
            ARVALID_MI2 => ARVALID_MI2,
            ARREADY_IM2 => ARREADY_S1IM2,
            AWID_MI3 => AWID_MI3,
            AWADDR_MI3 => AWADDR_MI3,
            AWLEN_MI3 => AWLEN_MI3,
            AWSIZE_MI3 => AWSIZE_MI3,
            AWBURST_MI3 => AWBURST_MI3,
            AWLOCK_MI3 => AWLOCK_MI3,
            AWCACHE_MI3 => AWCACHE_MI3,
            AWPROT_MI3 => AWPROT_MI3,
            AWVALID_MI3 => AWVALID_MI3,
            AWREADY_IM3 => AWREADY_S1IM3,
            WID_MI3 => WID_MI3,
            WDATA_MI3 => WDATA_MI3,
            WSTRB_MI3 => WSTRB_MI3,
            WLAST_MI3 => WLAST_MI3,
            WVALID_MI3 => WVALID_MI3,
            WREADY_IM3 => WREADY_S1IM3,
            ARID_MI3 => ARID_MI3,
            ARADDR_MI3 => ARADDR_MI3,
            ARLEN_MI3 => ARLEN_MI3,
            ARSIZE_MI3 => ARSIZE_MI3,
            ARBURST_MI3 => ARBURST_MI3,
            ARLOCK_MI3 => ARLOCK_MI3,
            ARCACHE_MI3 => ARCACHE_MI3,
            ARPROT_MI3 => ARPROT_MI3,
            ARVALID_MI3 => ARVALID_MI3,
            ARREADY_IM3 => ARREADY_S1IM3,
            AWID_IS => AWID_IS1_gated,
            AWADDR_IS => AWADDR_IS1_gated,
            AWLEN_IS => AWLEN_IS1_gated,
            AWSIZE_IS => AWSIZE_IS1_gated,
            AWBURST_IS => AWBURST_IS1_gated,
            AWLOCK_IS => AWLOCK_IS1_gated,
            AWCACHE_IS => AWCACHE_IS1_gated,
            AWPROT_IS => AWPROT_IS1_gated,
            AWVALID_IS => AWVALID_IS1_gated,
            AWREADY_SI => AWREADY_SI1,
            RVALID_SI => RVALID_SI1,
            RLAST_SI => RLAST_SI1,
            RREADY_IS => RREADY_IS1_xhdl94,
            WID_IS => WID_IS1_gated,
            WDATA_IS => WDATA_IS1_gated,
            WSTRB_IS => WSTRB_IS1_gated,
            WLAST_IS => WLAST_IS1_gated,
            WVALID_IS => WVALID_IS1_gated,
            WREADY_SI => WREADY_SI1,
            ARID_IS => ARID_IS1_gated,
            ARADDR_IS => ARADDR_IS1_gated,
            ARLEN_IS => ARLEN_IS1_gated,
            ARSIZE_IS => ARSIZE_IS1_gated,
            ARBURST_IS => ARBURST_IS1_gated,
            ARLOCK_IS => ARLOCK_IS1_gated,
            ARCACHE_IS => ARCACHE_IS1_gated,
            ARPROT_IS => ARPROT_IS1_gated,
            ARVALID_IS => ARVALID_IS1_gated,
            ARREADY_SI => ARREADY_SI1,
            SLAVE_NUMBER => "00001");
   END GENERATE L12;
   
   L13: IF (((M0_SLAVE2ENABLE = 1 OR M1_SLAVE2ENABLE = 1 OR M2_SLAVE2ENABLE = 1 OR 
   M3_SLAVE2ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE2ENABLE = 1 OR 
   M1_SLAVE2ENABLE = 1 OR M2_SLAVE2ENABLE = 1 OR M3_SLAVE2ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 1))) GENERATE
      -- <<X-HDL>> Can't find translated component 'matrix_s'. Port & generic names and types may not match. No template will be included
      inst_matrix_S2 : axi_matrix_s 
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
            AWADDR_IS_int => AWADDR_IS_int,
            ARADDR_IS_int => ARADDR_IS_int,
            gated_waddr => gated_waddr,
            gated_raddr => gated_raddr,
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
            m0_rd_end => m0_rd_end,
            m1_rd_end => m1_rd_end,
            m2_rd_end => m2_rd_end,
            m3_rd_end => m3_rd_end,
            m0_wr_end => m0_wr_end,
            m1_wr_end => m1_wr_end,
            m2_wr_end => m2_wr_end,
            m3_wr_end => m3_wr_end,
            AWID_MI0 => AWID_MI0,
            AWADDR_MI0 => AWADDR_MI0,
            AWLEN_MI0 => AWLEN_MI0,
            AWSIZE_MI0 => AWSIZE_MI0,
            AWBURST_MI0 => AWBURST_MI0,
            AWLOCK_MI0 => AWLOCK_MI0,
            AWCACHE_MI0 => AWCACHE_MI0,
            AWPROT_MI0 => AWPROT_MI0,
            AWVALID_MI0 => AWVALID_MI0,
            AWREADY_IM0 => AWREADY_S2IM0,
            WID_MI0 => WID_MI0,
            WDATA_MI0 => WDATA_MI0,
            WSTRB_MI0 => WSTRB_MI0,
            WLAST_MI0 => WLAST_MI0,
            WVALID_MI0 => WVALID_MI0,
            WREADY_IM0 => WREADY_S2IM0,
            ARID_MI0 => ARID_MI0,
            ARADDR_MI0 => ARADDR_MI0,
            ARLEN_MI0 => ARLEN_MI0,
            ARSIZE_MI0 => ARSIZE_MI0,
            ARBURST_MI0 => ARBURST_MI0,
            ARLOCK_MI0 => ARLOCK_MI0,
            ARCACHE_MI0 => ARCACHE_MI0,
            ARPROT_MI0 => ARPROT_MI0,
            ARVALID_MI0 => ARVALID_MI0,
            ARREADY_IM0 => ARREADY_S2IM0,
            AWID_MI1 => AWID_MI1,
            AWADDR_MI1 => AWADDR_MI1,
            AWLEN_MI1 => AWLEN_MI1,
            AWSIZE_MI1 => AWSIZE_MI1,
            AWBURST_MI1 => AWBURST_MI1,
            AWLOCK_MI1 => AWLOCK_MI1,
            AWCACHE_MI1 => AWCACHE_MI1,
            AWPROT_MI1 => AWPROT_MI1,
            AWVALID_MI1 => AWVALID_MI1,
            AWREADY_IM1 => AWREADY_S2IM1,
            WID_MI1 => WID_MI1,
            WDATA_MI1 => WDATA_MI1,
            WSTRB_MI1 => WSTRB_MI1,
            WLAST_MI1 => WLAST_MI1,
            WVALID_MI1 => WVALID_MI1,
            WREADY_IM1 => WREADY_S2IM1,
            ARID_MI1 => ARID_MI1,
            ARADDR_MI1 => ARADDR_MI1,
            ARLEN_MI1 => ARLEN_MI1,
            ARSIZE_MI1 => ARSIZE_MI1,
            ARBURST_MI1 => ARBURST_MI1,
            ARLOCK_MI1 => ARLOCK_MI1,
            ARCACHE_MI1 => ARCACHE_MI1,
            ARPROT_MI1 => ARPROT_MI1,
            ARVALID_MI1 => ARVALID_MI1,
            ARREADY_IM1 => ARREADY_S2IM1,
            AWID_MI2 => AWID_MI2,
            AWADDR_MI2 => AWADDR_MI2,
            AWLEN_MI2 => AWLEN_MI2,
            AWSIZE_MI2 => AWSIZE_MI2,
            AWBURST_MI2 => AWBURST_MI2,
            AWLOCK_MI2 => AWLOCK_MI2,
            AWCACHE_MI2 => AWCACHE_MI2,
            AWPROT_MI2 => AWPROT_MI2,
            AWVALID_MI2 => AWVALID_MI2,
            AWREADY_IM2 => AWREADY_S2IM2,
            WID_MI2 => WID_MI2,
            WDATA_MI2 => WDATA_MI2,
            WSTRB_MI2 => WSTRB_MI2,
            WLAST_MI2 => WLAST_MI2,
            WVALID_MI2 => WVALID_MI2,
            WREADY_IM2 => WREADY_S2IM2,
            ARID_MI2 => ARID_MI2,
            ARADDR_MI2 => ARADDR_MI2,
            ARLEN_MI2 => ARLEN_MI2,
            ARSIZE_MI2 => ARSIZE_MI2,
            ARBURST_MI2 => ARBURST_MI2,
            ARLOCK_MI2 => ARLOCK_MI2,
            ARCACHE_MI2 => ARCACHE_MI2,
            ARPROT_MI2 => ARPROT_MI2,
            ARVALID_MI2 => ARVALID_MI2,
            ARREADY_IM2 => ARREADY_S2IM2,
            AWID_MI3 => AWID_MI3,
            AWADDR_MI3 => AWADDR_MI3,
            AWLEN_MI3 => AWLEN_MI3,
            AWSIZE_MI3 => AWSIZE_MI3,
            AWBURST_MI3 => AWBURST_MI3,
            AWLOCK_MI3 => AWLOCK_MI3,
            AWCACHE_MI3 => AWCACHE_MI3,
            AWPROT_MI3 => AWPROT_MI3,
            AWVALID_MI3 => AWVALID_MI3,
            AWREADY_IM3 => AWREADY_S2IM3,
            WID_MI3 => WID_MI3,
            WDATA_MI3 => WDATA_MI3,
            WSTRB_MI3 => WSTRB_MI3,
            WLAST_MI3 => WLAST_MI3,
            WVALID_MI3 => WVALID_MI3,
            WREADY_IM3 => WREADY_S2IM3,
            ARID_MI3 => ARID_MI3,
            ARADDR_MI3 => ARADDR_MI3,
            ARLEN_MI3 => ARLEN_MI3,
            ARSIZE_MI3 => ARSIZE_MI3,
            ARBURST_MI3 => ARBURST_MI3,
            ARLOCK_MI3 => ARLOCK_MI3,
            ARCACHE_MI3 => ARCACHE_MI3,
            ARPROT_MI3 => ARPROT_MI3,
            ARVALID_MI3 => ARVALID_MI3,
            ARREADY_IM3 => ARREADY_S2IM3,
            AWID_IS => AWID_IS2_gated,
            AWADDR_IS => AWADDR_IS2_gated,
            AWLEN_IS => AWLEN_IS2_gated,
            AWSIZE_IS => AWSIZE_IS2_gated,
            AWBURST_IS => AWBURST_IS2_gated,
            AWLOCK_IS => AWLOCK_IS2_gated,
            AWCACHE_IS => AWCACHE_IS2_gated,
            AWPROT_IS => AWPROT_IS2_gated,
            AWVALID_IS => AWVALID_IS2_gated,
            AWREADY_SI => AWREADY_SI2,
            RVALID_SI => RVALID_SI2,
            RLAST_SI => RLAST_SI2,
            RREADY_IS => RREADY_IS2_xhdl119,
            WID_IS => WID_IS2_gated,
            WDATA_IS => WDATA_IS2_gated,
            WSTRB_IS => WSTRB_IS2_gated,
            WLAST_IS => WLAST_IS2_gated,
            WVALID_IS => WVALID_IS2_gated,
            WREADY_SI => WREADY_SI2,
            ARID_IS => ARID_IS2_gated,
            ARADDR_IS => ARADDR_IS2_gated,
            ARLEN_IS => ARLEN_IS2_gated,
            ARSIZE_IS => ARSIZE_IS2_gated,
            ARBURST_IS => ARBURST_IS2_gated,
            ARLOCK_IS => ARLOCK_IS2_gated,
            ARCACHE_IS => ARCACHE_IS2_gated,
            ARPROT_IS => ARPROT_IS2_gated,
            ARVALID_IS => ARVALID_IS2_gated,
            ARREADY_SI => ARREADY_SI2,
            SLAVE_NUMBER => "00010");
   END GENERATE L13;
   
   L14: IF (((M0_SLAVE3ENABLE = 1 OR M1_SLAVE3ENABLE = 1 OR M2_SLAVE3ENABLE = 1 OR 
   M3_SLAVE3ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE3ENABLE = 1 OR 
   M1_SLAVE3ENABLE = 1 OR M2_SLAVE3ENABLE = 1 OR M3_SLAVE3ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 1))) GENERATE
      -- <<X-HDL>> Can't find translated component 'matrix_s'. Port & generic names and types may not match. No template will be included
      inst_matrix_S3 : axi_matrix_s 
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
            AWADDR_IS_int => AWADDR_IS_int,
            ARADDR_IS_int => ARADDR_IS_int,
            gated_waddr => gated_waddr,
            gated_raddr => gated_raddr,
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
            m0_rd_end => m0_rd_end,
            m1_rd_end => m1_rd_end,
            m2_rd_end => m2_rd_end,
            m3_rd_end => m3_rd_end,
            m0_wr_end => m0_wr_end,
            m1_wr_end => m1_wr_end,
            m2_wr_end => m2_wr_end,
            m3_wr_end => m3_wr_end,
            AWID_MI0 => AWID_MI0,
            AWADDR_MI0 => AWADDR_MI0,
            AWLEN_MI0 => AWLEN_MI0,
            AWSIZE_MI0 => AWSIZE_MI0,
            AWBURST_MI0 => AWBURST_MI0,
            AWLOCK_MI0 => AWLOCK_MI0,
            AWCACHE_MI0 => AWCACHE_MI0,
            AWPROT_MI0 => AWPROT_MI0,
            AWVALID_MI0 => AWVALID_MI0,
            AWREADY_IM0 => AWREADY_S3IM0,
            WID_MI0 => WID_MI0,
            WDATA_MI0 => WDATA_MI0,
            WSTRB_MI0 => WSTRB_MI0,
            WLAST_MI0 => WLAST_MI0,
            WVALID_MI0 => WVALID_MI0,
            WREADY_IM0 => WREADY_S3IM0,
            ARID_MI0 => ARID_MI0,
            ARADDR_MI0 => ARADDR_MI0,
            ARLEN_MI0 => ARLEN_MI0,
            ARSIZE_MI0 => ARSIZE_MI0,
            ARBURST_MI0 => ARBURST_MI0,
            ARLOCK_MI0 => ARLOCK_MI0,
            ARCACHE_MI0 => ARCACHE_MI0,
            ARPROT_MI0 => ARPROT_MI0,
            ARVALID_MI0 => ARVALID_MI0,
            ARREADY_IM0 => ARREADY_S3IM0,
            AWID_MI1 => AWID_MI1,
            AWADDR_MI1 => AWADDR_MI1,
            AWLEN_MI1 => AWLEN_MI1,
            AWSIZE_MI1 => AWSIZE_MI1,
            AWBURST_MI1 => AWBURST_MI1,
            AWLOCK_MI1 => AWLOCK_MI1,
            AWCACHE_MI1 => AWCACHE_MI1,
            AWPROT_MI1 => AWPROT_MI1,
            AWVALID_MI1 => AWVALID_MI1,
            AWREADY_IM1 => AWREADY_S3IM1,
            WID_MI1 => WID_MI1,
            WDATA_MI1 => WDATA_MI1,
            WSTRB_MI1 => WSTRB_MI1,
            WLAST_MI1 => WLAST_MI1,
            WVALID_MI1 => WVALID_MI1,
            WREADY_IM1 => WREADY_S3IM1,
            ARID_MI1 => ARID_MI1,
            ARADDR_MI1 => ARADDR_MI1,
            ARLEN_MI1 => ARLEN_MI1,
            ARSIZE_MI1 => ARSIZE_MI1,
            ARBURST_MI1 => ARBURST_MI1,
            ARLOCK_MI1 => ARLOCK_MI1,
            ARCACHE_MI1 => ARCACHE_MI1,
            ARPROT_MI1 => ARPROT_MI1,
            ARVALID_MI1 => ARVALID_MI1,
            ARREADY_IM1 => ARREADY_S3IM1,
            AWID_MI2 => AWID_MI2,
            AWADDR_MI2 => AWADDR_MI2,
            AWLEN_MI2 => AWLEN_MI2,
            AWSIZE_MI2 => AWSIZE_MI2,
            AWBURST_MI2 => AWBURST_MI2,
            AWLOCK_MI2 => AWLOCK_MI2,
            AWCACHE_MI2 => AWCACHE_MI2,
            AWPROT_MI2 => AWPROT_MI2,
            AWVALID_MI2 => AWVALID_MI2,
            AWREADY_IM2 => AWREADY_S3IM2,
            WID_MI2 => WID_MI2,
            WDATA_MI2 => WDATA_MI2,
            WSTRB_MI2 => WSTRB_MI2,
            WLAST_MI2 => WLAST_MI2,
            WVALID_MI2 => WVALID_MI2,
            WREADY_IM2 => WREADY_S3IM2,
            ARID_MI2 => ARID_MI2,
            ARADDR_MI2 => ARADDR_MI2,
            ARLEN_MI2 => ARLEN_MI2,
            ARSIZE_MI2 => ARSIZE_MI2,
            ARBURST_MI2 => ARBURST_MI2,
            ARLOCK_MI2 => ARLOCK_MI2,
            ARCACHE_MI2 => ARCACHE_MI2,
            ARPROT_MI2 => ARPROT_MI2,
            ARVALID_MI2 => ARVALID_MI2,
            ARREADY_IM2 => ARREADY_S3IM2,
            AWID_MI3 => AWID_MI3,
            AWADDR_MI3 => AWADDR_MI3,
            AWLEN_MI3 => AWLEN_MI3,
            AWSIZE_MI3 => AWSIZE_MI3,
            AWBURST_MI3 => AWBURST_MI3,
            AWLOCK_MI3 => AWLOCK_MI3,
            AWCACHE_MI3 => AWCACHE_MI3,
            AWPROT_MI3 => AWPROT_MI3,
            AWVALID_MI3 => AWVALID_MI3,
            AWREADY_IM3 => AWREADY_S3IM3,
            WID_MI3 => WID_MI3,
            WDATA_MI3 => WDATA_MI3,
            WSTRB_MI3 => WSTRB_MI3,
            WLAST_MI3 => WLAST_MI3,
            WVALID_MI3 => WVALID_MI3,
            WREADY_IM3 => WREADY_S3IM3,
            ARID_MI3 => ARID_MI3,
            ARADDR_MI3 => ARADDR_MI3,
            ARLEN_MI3 => ARLEN_MI3,
            ARSIZE_MI3 => ARSIZE_MI3,
            ARBURST_MI3 => ARBURST_MI3,
            ARLOCK_MI3 => ARLOCK_MI3,
            ARCACHE_MI3 => ARCACHE_MI3,
            ARPROT_MI3 => ARPROT_MI3,
            ARVALID_MI3 => ARVALID_MI3,
            ARREADY_IM3 => ARREADY_S3IM3,
            AWID_IS => AWID_IS3_gated,
            AWADDR_IS => AWADDR_IS3_gated,
            AWLEN_IS => AWLEN_IS3_gated,
            AWSIZE_IS => AWSIZE_IS3_gated,
            AWBURST_IS => AWBURST_IS3_gated,
            AWLOCK_IS => AWLOCK_IS3_gated,
            AWCACHE_IS => AWCACHE_IS3_gated,
            AWPROT_IS => AWPROT_IS3_gated,
            AWVALID_IS => AWVALID_IS3_gated,
            AWREADY_SI => AWREADY_SI3,
            RVALID_SI => RVALID_SI3,
            RLAST_SI => RLAST_SI3,
            RREADY_IS => RREADY_IS3_xhdl144,
            WID_IS => WID_IS3_gated,
            WDATA_IS => WDATA_IS3_gated,
            WSTRB_IS => WSTRB_IS3_gated,
            WLAST_IS => WLAST_IS3_gated,
            WVALID_IS => WVALID_IS3_gated,
            WREADY_SI => WREADY_SI3,
            ARID_IS => ARID_IS3_gated,
            ARADDR_IS => ARADDR_IS3_gated,
            ARLEN_IS => ARLEN_IS3_gated,
            ARSIZE_IS => ARSIZE_IS3_gated,
            ARBURST_IS => ARBURST_IS3_gated,
            ARLOCK_IS => ARLOCK_IS3_gated,
            ARCACHE_IS => ARCACHE_IS3_gated,
            ARPROT_IS => ARPROT_IS3_gated,
            ARVALID_IS => ARVALID_IS3_gated,
            ARREADY_SI => ARREADY_SI3,
            SLAVE_NUMBER => "00011");
   END GENERATE L14;
   
   L15: IF (((M0_SLAVE4ENABLE = 1 OR M1_SLAVE4ENABLE = 1 OR M2_SLAVE4ENABLE = 1 OR 
   M3_SLAVE4ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE4ENABLE = 1 OR 
   M1_SLAVE4ENABLE = 1 OR M2_SLAVE4ENABLE = 1 OR M3_SLAVE4ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 1))) GENERATE
      -- <<X-HDL>> Can't find translated component 'matrix_s'. Port & generic names and types may not match. No template will be included
      inst_matrix_S4 : axi_matrix_s 
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
            AWADDR_IS_int => AWADDR_IS_int,
            ARADDR_IS_int => ARADDR_IS_int,
            gated_waddr => gated_waddr,
            gated_raddr => gated_raddr,
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
            m0_rd_end => m0_rd_end,
            m1_rd_end => m1_rd_end,
            m2_rd_end => m2_rd_end,
            m3_rd_end => m3_rd_end,
            m0_wr_end => m0_wr_end,
            m1_wr_end => m1_wr_end,
            m2_wr_end => m2_wr_end,
            m3_wr_end => m3_wr_end,
            AWID_MI0 => AWID_MI0,
            AWADDR_MI0 => AWADDR_MI0,
            AWLEN_MI0 => AWLEN_MI0,
            AWSIZE_MI0 => AWSIZE_MI0,
            AWBURST_MI0 => AWBURST_MI0,
            AWLOCK_MI0 => AWLOCK_MI0,
            AWCACHE_MI0 => AWCACHE_MI0,
            AWPROT_MI0 => AWPROT_MI0,
            AWVALID_MI0 => AWVALID_MI0,
            AWREADY_IM0 => AWREADY_S4IM0,
            WID_MI0 => WID_MI0,
            WDATA_MI0 => WDATA_MI0,
            WSTRB_MI0 => WSTRB_MI0,
            WLAST_MI0 => WLAST_MI0,
            WVALID_MI0 => WVALID_MI0,
            WREADY_IM0 => WREADY_S4IM0,
            ARID_MI0 => ARID_MI0,
            ARADDR_MI0 => ARADDR_MI0,
            ARLEN_MI0 => ARLEN_MI0,
            ARSIZE_MI0 => ARSIZE_MI0,
            ARBURST_MI0 => ARBURST_MI0,
            ARLOCK_MI0 => ARLOCK_MI0,
            ARCACHE_MI0 => ARCACHE_MI0,
            ARPROT_MI0 => ARPROT_MI0,
            ARVALID_MI0 => ARVALID_MI0,
            ARREADY_IM0 => ARREADY_S4IM0,
            AWID_MI1 => AWID_MI1,
            AWADDR_MI1 => AWADDR_MI1,
            AWLEN_MI1 => AWLEN_MI1,
            AWSIZE_MI1 => AWSIZE_MI1,
            AWBURST_MI1 => AWBURST_MI1,
            AWLOCK_MI1 => AWLOCK_MI1,
            AWCACHE_MI1 => AWCACHE_MI1,
            AWPROT_MI1 => AWPROT_MI1,
            AWVALID_MI1 => AWVALID_MI1,
            AWREADY_IM1 => AWREADY_S4IM1,
            WID_MI1 => WID_MI1,
            WDATA_MI1 => WDATA_MI1,
            WSTRB_MI1 => WSTRB_MI1,
            WLAST_MI1 => WLAST_MI1,
            WVALID_MI1 => WVALID_MI1,
            WREADY_IM1 => WREADY_S4IM1,
            ARID_MI1 => ARID_MI1,
            ARADDR_MI1 => ARADDR_MI1,
            ARLEN_MI1 => ARLEN_MI1,
            ARSIZE_MI1 => ARSIZE_MI1,
            ARBURST_MI1 => ARBURST_MI1,
            ARLOCK_MI1 => ARLOCK_MI1,
            ARCACHE_MI1 => ARCACHE_MI1,
            ARPROT_MI1 => ARPROT_MI1,
            ARVALID_MI1 => ARVALID_MI1,
            ARREADY_IM1 => ARREADY_S4IM1,
            AWID_MI2 => AWID_MI2,
            AWADDR_MI2 => AWADDR_MI2,
            AWLEN_MI2 => AWLEN_MI2,
            AWSIZE_MI2 => AWSIZE_MI2,
            AWBURST_MI2 => AWBURST_MI2,
            AWLOCK_MI2 => AWLOCK_MI2,
            AWCACHE_MI2 => AWCACHE_MI2,
            AWPROT_MI2 => AWPROT_MI2,
            AWVALID_MI2 => AWVALID_MI2,
            AWREADY_IM2 => AWREADY_S4IM2,
            WID_MI2 => WID_MI2,
            WDATA_MI2 => WDATA_MI2,
            WSTRB_MI2 => WSTRB_MI2,
            WLAST_MI2 => WLAST_MI2,
            WVALID_MI2 => WVALID_MI2,
            WREADY_IM2 => WREADY_S4IM2,
            ARID_MI2 => ARID_MI2,
            ARADDR_MI2 => ARADDR_MI2,
            ARLEN_MI2 => ARLEN_MI2,
            ARSIZE_MI2 => ARSIZE_MI2,
            ARBURST_MI2 => ARBURST_MI2,
            ARLOCK_MI2 => ARLOCK_MI2,
            ARCACHE_MI2 => ARCACHE_MI2,
            ARPROT_MI2 => ARPROT_MI2,
            ARVALID_MI2 => ARVALID_MI2,
            ARREADY_IM2 => ARREADY_S4IM2,
            AWID_MI3 => AWID_MI3,
            AWADDR_MI3 => AWADDR_MI3,
            AWLEN_MI3 => AWLEN_MI3,
            AWSIZE_MI3 => AWSIZE_MI3,
            AWBURST_MI3 => AWBURST_MI3,
            AWLOCK_MI3 => AWLOCK_MI3,
            AWCACHE_MI3 => AWCACHE_MI3,
            AWPROT_MI3 => AWPROT_MI3,
            AWVALID_MI3 => AWVALID_MI3,
            AWREADY_IM3 => AWREADY_S4IM3,
            WID_MI3 => WID_MI3,
            WDATA_MI3 => WDATA_MI3,
            WSTRB_MI3 => WSTRB_MI3,
            WLAST_MI3 => WLAST_MI3,
            WVALID_MI3 => WVALID_MI3,
            WREADY_IM3 => WREADY_S4IM3,
            ARID_MI3 => ARID_MI3,
            ARADDR_MI3 => ARADDR_MI3,
            ARLEN_MI3 => ARLEN_MI3,
            ARSIZE_MI3 => ARSIZE_MI3,
            ARBURST_MI3 => ARBURST_MI3,
            ARLOCK_MI3 => ARLOCK_MI3,
            ARCACHE_MI3 => ARCACHE_MI3,
            ARPROT_MI3 => ARPROT_MI3,
            ARVALID_MI3 => ARVALID_MI3,
            ARREADY_IM3 => ARREADY_S4IM3,
            AWID_IS => AWID_IS4_gated,
            AWADDR_IS => AWADDR_IS4_gated,
            AWLEN_IS => AWLEN_IS4_gated,
            AWSIZE_IS => AWSIZE_IS4_gated,
            AWBURST_IS => AWBURST_IS4_gated,
            AWLOCK_IS => AWLOCK_IS4_gated,
            AWCACHE_IS => AWCACHE_IS4_gated,
            AWPROT_IS => AWPROT_IS4_gated,
            AWVALID_IS => AWVALID_IS4_gated,
            AWREADY_SI => AWREADY_SI4,
            RVALID_SI => RVALID_SI4,
            RLAST_SI => RLAST_SI4,
            RREADY_IS => RREADY_IS4_xhdl169,
            WID_IS => WID_IS4_gated,
            WDATA_IS => WDATA_IS4_gated,
            WSTRB_IS => WSTRB_IS4_gated,
            WLAST_IS => WLAST_IS4_gated,
            WVALID_IS => WVALID_IS4_gated,
            WREADY_SI => WREADY_SI4,
            ARID_IS => ARID_IS4_gated,
            ARADDR_IS => ARADDR_IS4_gated,
            ARLEN_IS => ARLEN_IS4_gated,
            ARSIZE_IS => ARSIZE_IS4_gated,
            ARBURST_IS => ARBURST_IS4_gated,
            ARLOCK_IS => ARLOCK_IS4_gated,
            ARCACHE_IS => ARCACHE_IS4_gated,
            ARPROT_IS => ARPROT_IS4_gated,
            ARVALID_IS => ARVALID_IS4_gated,
            ARREADY_SI => ARREADY_SI4,
            SLAVE_NUMBER => "00100");
   END GENERATE L15;
   
   L16: IF (((M0_SLAVE5ENABLE = 1 OR M1_SLAVE5ENABLE = 1 OR M2_SLAVE5ENABLE = 1 OR 
   M3_SLAVE5ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE5ENABLE = 1 OR 
   M1_SLAVE5ENABLE = 1 OR M2_SLAVE5ENABLE = 1 OR M3_SLAVE5ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 1))) GENERATE
      -- <<X-HDL>> Can't find translated component 'matrix_s'. Port & generic names and types may not match. No template will be included
      inst_matrix_S5 : axi_matrix_s 
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
            AWADDR_IS_int => AWADDR_IS_int,
            ARADDR_IS_int => ARADDR_IS_int,
            gated_waddr => gated_waddr,
            gated_raddr => gated_raddr,
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
            m0_rd_end => m0_rd_end,
            m1_rd_end => m1_rd_end,
            m2_rd_end => m2_rd_end,
            m3_rd_end => m3_rd_end,
            m0_wr_end => m0_wr_end,
            m1_wr_end => m1_wr_end,
            m2_wr_end => m2_wr_end,
            m3_wr_end => m3_wr_end,
            AWID_MI0 => AWID_MI0,
            AWADDR_MI0 => AWADDR_MI0,
            AWLEN_MI0 => AWLEN_MI0,
            AWSIZE_MI0 => AWSIZE_MI0,
            AWBURST_MI0 => AWBURST_MI0,
            AWLOCK_MI0 => AWLOCK_MI0,
            AWCACHE_MI0 => AWCACHE_MI0,
            AWPROT_MI0 => AWPROT_MI0,
            AWVALID_MI0 => AWVALID_MI0,
            AWREADY_IM0 => AWREADY_S5IM0,
            WID_MI0 => WID_MI0,
            WDATA_MI0 => WDATA_MI0,
            WSTRB_MI0 => WSTRB_MI0,
            WLAST_MI0 => WLAST_MI0,
            WVALID_MI0 => WVALID_MI0,
            WREADY_IM0 => WREADY_S5IM0,
            ARID_MI0 => ARID_MI0,
            ARADDR_MI0 => ARADDR_MI0,
            ARLEN_MI0 => ARLEN_MI0,
            ARSIZE_MI0 => ARSIZE_MI0,
            ARBURST_MI0 => ARBURST_MI0,
            ARLOCK_MI0 => ARLOCK_MI0,
            ARCACHE_MI0 => ARCACHE_MI0,
            ARPROT_MI0 => ARPROT_MI0,
            ARVALID_MI0 => ARVALID_MI0,
            ARREADY_IM0 => ARREADY_S5IM0,
            AWID_MI1 => AWID_MI1,
            AWADDR_MI1 => AWADDR_MI1,
            AWLEN_MI1 => AWLEN_MI1,
            AWSIZE_MI1 => AWSIZE_MI1,
            AWBURST_MI1 => AWBURST_MI1,
            AWLOCK_MI1 => AWLOCK_MI1,
            AWCACHE_MI1 => AWCACHE_MI1,
            AWPROT_MI1 => AWPROT_MI1,
            AWVALID_MI1 => AWVALID_MI1,
            AWREADY_IM1 => AWREADY_S5IM1,
            WID_MI1 => WID_MI1,
            WDATA_MI1 => WDATA_MI1,
            WSTRB_MI1 => WSTRB_MI1,
            WLAST_MI1 => WLAST_MI1,
            WVALID_MI1 => WVALID_MI1,
            WREADY_IM1 => WREADY_S5IM1,
            ARID_MI1 => ARID_MI1,
            ARADDR_MI1 => ARADDR_MI1,
            ARLEN_MI1 => ARLEN_MI1,
            ARSIZE_MI1 => ARSIZE_MI1,
            ARBURST_MI1 => ARBURST_MI1,
            ARLOCK_MI1 => ARLOCK_MI1,
            ARCACHE_MI1 => ARCACHE_MI1,
            ARPROT_MI1 => ARPROT_MI1,
            ARVALID_MI1 => ARVALID_MI1,
            ARREADY_IM1 => ARREADY_S5IM1,
            AWID_MI2 => AWID_MI2,
            AWADDR_MI2 => AWADDR_MI2,
            AWLEN_MI2 => AWLEN_MI2,
            AWSIZE_MI2 => AWSIZE_MI2,
            AWBURST_MI2 => AWBURST_MI2,
            AWLOCK_MI2 => AWLOCK_MI2,
            AWCACHE_MI2 => AWCACHE_MI2,
            AWPROT_MI2 => AWPROT_MI2,
            AWVALID_MI2 => AWVALID_MI2,
            AWREADY_IM2 => AWREADY_S5IM2,
            WID_MI2 => WID_MI2,
            WDATA_MI2 => WDATA_MI2,
            WSTRB_MI2 => WSTRB_MI2,
            WLAST_MI2 => WLAST_MI2,
            WVALID_MI2 => WVALID_MI2,
            WREADY_IM2 => WREADY_S5IM2,
            ARID_MI2 => ARID_MI2,
            ARADDR_MI2 => ARADDR_MI2,
            ARLEN_MI2 => ARLEN_MI2,
            ARSIZE_MI2 => ARSIZE_MI2,
            ARBURST_MI2 => ARBURST_MI2,
            ARLOCK_MI2 => ARLOCK_MI2,
            ARCACHE_MI2 => ARCACHE_MI2,
            ARPROT_MI2 => ARPROT_MI2,
            ARVALID_MI2 => ARVALID_MI2,
            ARREADY_IM2 => ARREADY_S5IM2,
            AWID_MI3 => AWID_MI3,
            AWADDR_MI3 => AWADDR_MI3,
            AWLEN_MI3 => AWLEN_MI3,
            AWSIZE_MI3 => AWSIZE_MI3,
            AWBURST_MI3 => AWBURST_MI3,
            AWLOCK_MI3 => AWLOCK_MI3,
            AWCACHE_MI3 => AWCACHE_MI3,
            AWPROT_MI3 => AWPROT_MI3,
            AWVALID_MI3 => AWVALID_MI3,
            AWREADY_IM3 => AWREADY_S5IM3,
            WID_MI3 => WID_MI3,
            WDATA_MI3 => WDATA_MI3,
            WSTRB_MI3 => WSTRB_MI3,
            WLAST_MI3 => WLAST_MI3,
            WVALID_MI3 => WVALID_MI3,
            WREADY_IM3 => WREADY_S5IM3,
            ARID_MI3 => ARID_MI3,
            ARADDR_MI3 => ARADDR_MI3,
            ARLEN_MI3 => ARLEN_MI3,
            ARSIZE_MI3 => ARSIZE_MI3,
            ARBURST_MI3 => ARBURST_MI3,
            ARLOCK_MI3 => ARLOCK_MI3,
            ARCACHE_MI3 => ARCACHE_MI3,
            ARPROT_MI3 => ARPROT_MI3,
            ARVALID_MI3 => ARVALID_MI3,
            ARREADY_IM3 => ARREADY_S5IM3,
            AWID_IS => AWID_IS5_gated,
            AWADDR_IS => AWADDR_IS5_gated,
            AWLEN_IS => AWLEN_IS5_gated,
            AWSIZE_IS => AWSIZE_IS5_gated,
            AWBURST_IS => AWBURST_IS5_gated,
            AWLOCK_IS => AWLOCK_IS5_gated,
            AWCACHE_IS => AWCACHE_IS5_gated,
            AWPROT_IS => AWPROT_IS5_gated,
            AWVALID_IS => AWVALID_IS5_gated,
            AWREADY_SI => AWREADY_SI5,
            RVALID_SI => RVALID_SI5,
            RLAST_SI => RLAST_SI5,
            RREADY_IS => RREADY_IS5_xhdl194,
            WID_IS => WID_IS5_gated,
            WDATA_IS => WDATA_IS5_gated,
            WSTRB_IS => WSTRB_IS5_gated,
            WLAST_IS => WLAST_IS5_gated,
            WVALID_IS => WVALID_IS5_gated,
            WREADY_SI => WREADY_SI5,
            ARID_IS => ARID_IS5_gated,
            ARADDR_IS => ARADDR_IS5_gated,
            ARLEN_IS => ARLEN_IS5_gated,
            ARSIZE_IS => ARSIZE_IS5_gated,
            ARBURST_IS => ARBURST_IS5_gated,
            ARLOCK_IS => ARLOCK_IS5_gated,
            ARCACHE_IS => ARCACHE_IS5_gated,
            ARPROT_IS => ARPROT_IS5_gated,
            ARVALID_IS => ARVALID_IS5_gated,
            ARREADY_SI => ARREADY_SI5,
            SLAVE_NUMBER => "00101");
   END GENERATE L16;
   
   L17: IF (((M0_SLAVE6ENABLE = 1 OR M1_SLAVE6ENABLE = 1 OR M2_SLAVE6ENABLE = 1 OR 
   M3_SLAVE6ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE6ENABLE = 1 OR 
   M1_SLAVE6ENABLE = 1 OR M2_SLAVE6ENABLE = 1 OR M3_SLAVE6ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 1))) GENERATE
      -- <<X-HDL>> Can't find translated component 'matrix_s'. Port & generic names and types may not match. No template will be included
      inst_matrix_S6 : axi_matrix_s 
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
            AWADDR_IS_int => AWADDR_IS_int,
            ARADDR_IS_int => ARADDR_IS_int,
            gated_waddr => gated_waddr,
            gated_raddr => gated_raddr,
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
            m0_rd_end => m0_rd_end,
            m1_rd_end => m1_rd_end,
            m2_rd_end => m2_rd_end,
            m3_rd_end => m3_rd_end,
            m0_wr_end => m0_wr_end,
            m1_wr_end => m1_wr_end,
            m2_wr_end => m2_wr_end,
            m3_wr_end => m3_wr_end,
            AWID_MI0 => AWID_MI0,
            AWADDR_MI0 => AWADDR_MI0,
            AWLEN_MI0 => AWLEN_MI0,
            AWSIZE_MI0 => AWSIZE_MI0,
            AWBURST_MI0 => AWBURST_MI0,
            AWLOCK_MI0 => AWLOCK_MI0,
            AWCACHE_MI0 => AWCACHE_MI0,
            AWPROT_MI0 => AWPROT_MI0,
            AWVALID_MI0 => AWVALID_MI0,
            AWREADY_IM0 => AWREADY_S6IM0,
            WID_MI0 => WID_MI0,
            WDATA_MI0 => WDATA_MI0,
            WSTRB_MI0 => WSTRB_MI0,
            WLAST_MI0 => WLAST_MI0,
            WVALID_MI0 => WVALID_MI0,
            WREADY_IM0 => WREADY_S6IM0,
            ARID_MI0 => ARID_MI0,
            ARADDR_MI0 => ARADDR_MI0,
            ARLEN_MI0 => ARLEN_MI0,
            ARSIZE_MI0 => ARSIZE_MI0,
            ARBURST_MI0 => ARBURST_MI0,
            ARLOCK_MI0 => ARLOCK_MI0,
            ARCACHE_MI0 => ARCACHE_MI0,
            ARPROT_MI0 => ARPROT_MI0,
            ARVALID_MI0 => ARVALID_MI0,
            ARREADY_IM0 => ARREADY_S6IM0,
            AWID_MI1 => AWID_MI1,
            AWADDR_MI1 => AWADDR_MI1,
            AWLEN_MI1 => AWLEN_MI1,
            AWSIZE_MI1 => AWSIZE_MI1,
            AWBURST_MI1 => AWBURST_MI1,
            AWLOCK_MI1 => AWLOCK_MI1,
            AWCACHE_MI1 => AWCACHE_MI1,
            AWPROT_MI1 => AWPROT_MI1,
            AWVALID_MI1 => AWVALID_MI1,
            AWREADY_IM1 => AWREADY_S6IM1,
            WID_MI1 => WID_MI1,
            WDATA_MI1 => WDATA_MI1,
            WSTRB_MI1 => WSTRB_MI1,
            WLAST_MI1 => WLAST_MI1,
            WVALID_MI1 => WVALID_MI1,
            WREADY_IM1 => WREADY_S6IM1,
            ARID_MI1 => ARID_MI1,
            ARADDR_MI1 => ARADDR_MI1,
            ARLEN_MI1 => ARLEN_MI1,
            ARSIZE_MI1 => ARSIZE_MI1,
            ARBURST_MI1 => ARBURST_MI1,
            ARLOCK_MI1 => ARLOCK_MI1,
            ARCACHE_MI1 => ARCACHE_MI1,
            ARPROT_MI1 => ARPROT_MI1,
            ARVALID_MI1 => ARVALID_MI1,
            ARREADY_IM1 => ARREADY_S6IM1,
            AWID_MI2 => AWID_MI2,
            AWADDR_MI2 => AWADDR_MI2,
            AWLEN_MI2 => AWLEN_MI2,
            AWSIZE_MI2 => AWSIZE_MI2,
            AWBURST_MI2 => AWBURST_MI2,
            AWLOCK_MI2 => AWLOCK_MI2,
            AWCACHE_MI2 => AWCACHE_MI2,
            AWPROT_MI2 => AWPROT_MI2,
            AWVALID_MI2 => AWVALID_MI2,
            AWREADY_IM2 => AWREADY_S6IM2,
            WID_MI2 => WID_MI2,
            WDATA_MI2 => WDATA_MI2,
            WSTRB_MI2 => WSTRB_MI2,
            WLAST_MI2 => WLAST_MI2,
            WVALID_MI2 => WVALID_MI2,
            WREADY_IM2 => WREADY_S6IM2,
            ARID_MI2 => ARID_MI2,
            ARADDR_MI2 => ARADDR_MI2,
            ARLEN_MI2 => ARLEN_MI2,
            ARSIZE_MI2 => ARSIZE_MI2,
            ARBURST_MI2 => ARBURST_MI2,
            ARLOCK_MI2 => ARLOCK_MI2,
            ARCACHE_MI2 => ARCACHE_MI2,
            ARPROT_MI2 => ARPROT_MI2,
            ARVALID_MI2 => ARVALID_MI2,
            ARREADY_IM2 => ARREADY_S6IM2,
            AWID_MI3 => AWID_MI3,
            AWADDR_MI3 => AWADDR_MI3,
            AWLEN_MI3 => AWLEN_MI3,
            AWSIZE_MI3 => AWSIZE_MI3,
            AWBURST_MI3 => AWBURST_MI3,
            AWLOCK_MI3 => AWLOCK_MI3,
            AWCACHE_MI3 => AWCACHE_MI3,
            AWPROT_MI3 => AWPROT_MI3,
            AWVALID_MI3 => AWVALID_MI3,
            AWREADY_IM3 => AWREADY_S6IM3,
            WID_MI3 => WID_MI3,
            WDATA_MI3 => WDATA_MI3,
            WSTRB_MI3 => WSTRB_MI3,
            WLAST_MI3 => WLAST_MI3,
            WVALID_MI3 => WVALID_MI3,
            WREADY_IM3 => WREADY_S6IM3,
            ARID_MI3 => ARID_MI3,
            ARADDR_MI3 => ARADDR_MI3,
            ARLEN_MI3 => ARLEN_MI3,
            ARSIZE_MI3 => ARSIZE_MI3,
            ARBURST_MI3 => ARBURST_MI3,
            ARLOCK_MI3 => ARLOCK_MI3,
            ARCACHE_MI3 => ARCACHE_MI3,
            ARPROT_MI3 => ARPROT_MI3,
            ARVALID_MI3 => ARVALID_MI3,
            ARREADY_IM3 => ARREADY_S6IM3,
            AWID_IS => AWID_IS6_gated,
            AWADDR_IS => AWADDR_IS6_gated,
            AWLEN_IS => AWLEN_IS6_gated,
            AWSIZE_IS => AWSIZE_IS6_gated,
            AWBURST_IS => AWBURST_IS6_gated,
            AWLOCK_IS => AWLOCK_IS6_gated,
            AWCACHE_IS => AWCACHE_IS6_gated,
            AWPROT_IS => AWPROT_IS6_gated,
            AWVALID_IS => AWVALID_IS6_gated,
            AWREADY_SI => AWREADY_SI6,
            RVALID_SI => RVALID_SI6,
            RLAST_SI => RLAST_SI6,
            RREADY_IS => RREADY_IS6_xhdl219,
            WID_IS => WID_IS6_gated,
            WDATA_IS => WDATA_IS6_gated,
            WSTRB_IS => WSTRB_IS6_gated,
            WLAST_IS => WLAST_IS6_gated,
            WVALID_IS => WVALID_IS6_gated,
            WREADY_SI => WREADY_SI6,
            ARID_IS => ARID_IS6_gated,
            ARADDR_IS => ARADDR_IS6_gated,
            ARLEN_IS => ARLEN_IS6_gated,
            ARSIZE_IS => ARSIZE_IS6_gated,
            ARBURST_IS => ARBURST_IS6_gated,
            ARLOCK_IS => ARLOCK_IS6_gated,
            ARCACHE_IS => ARCACHE_IS6_gated,
            ARPROT_IS => ARPROT_IS6_gated,
            ARVALID_IS => ARVALID_IS6_gated,
            ARREADY_SI => ARREADY_SI6,
            SLAVE_NUMBER => "00110");
   END GENERATE L17;
   
   L18: IF (((M0_SLAVE7ENABLE = 1 OR M1_SLAVE7ENABLE = 1 OR M2_SLAVE7ENABLE = 1 OR 
   M3_SLAVE7ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE7ENABLE = 1 OR 
   M1_SLAVE7ENABLE = 1 OR M2_SLAVE7ENABLE = 1 OR M3_SLAVE7ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 1))) GENERATE
      -- <<X-HDL>> Can't find translated component 'matrix_s'. Port & generic names and types may not match. No template will be included
      inst_matrix_S7 : axi_matrix_s 
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
            AWADDR_IS_int => AWADDR_IS_int,
            ARADDR_IS_int => ARADDR_IS_int,
            gated_waddr => gated_waddr,
            gated_raddr => gated_raddr,
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
            m0_rd_end => m0_rd_end,
            m1_rd_end => m1_rd_end,
            m2_rd_end => m2_rd_end,
            m3_rd_end => m3_rd_end,
            m0_wr_end => m0_wr_end,
            m1_wr_end => m1_wr_end,
            m2_wr_end => m2_wr_end,
            m3_wr_end => m3_wr_end,
            AWID_MI0 => AWID_MI0,
            AWADDR_MI0 => AWADDR_MI0,
            AWLEN_MI0 => AWLEN_MI0,
            AWSIZE_MI0 => AWSIZE_MI0,
            AWBURST_MI0 => AWBURST_MI0,
            AWLOCK_MI0 => AWLOCK_MI0,
            AWCACHE_MI0 => AWCACHE_MI0,
            AWPROT_MI0 => AWPROT_MI0,
            AWVALID_MI0 => AWVALID_MI0,
            AWREADY_IM0 => AWREADY_S7IM0,
            WID_MI0 => WID_MI0,
            WDATA_MI0 => WDATA_MI0,
            WSTRB_MI0 => WSTRB_MI0,
            WLAST_MI0 => WLAST_MI0,
            WVALID_MI0 => WVALID_MI0,
            WREADY_IM0 => WREADY_S7IM0,
            ARID_MI0 => ARID_MI0,
            ARADDR_MI0 => ARADDR_MI0,
            ARLEN_MI0 => ARLEN_MI0,
            ARSIZE_MI0 => ARSIZE_MI0,
            ARBURST_MI0 => ARBURST_MI0,
            ARLOCK_MI0 => ARLOCK_MI0,
            ARCACHE_MI0 => ARCACHE_MI0,
            ARPROT_MI0 => ARPROT_MI0,
            ARVALID_MI0 => ARVALID_MI0,
            ARREADY_IM0 => ARREADY_S7IM0,
            AWID_MI1 => AWID_MI1,
            AWADDR_MI1 => AWADDR_MI1,
            AWLEN_MI1 => AWLEN_MI1,
            AWSIZE_MI1 => AWSIZE_MI1,
            AWBURST_MI1 => AWBURST_MI1,
            AWLOCK_MI1 => AWLOCK_MI1,
            AWCACHE_MI1 => AWCACHE_MI1,
            AWPROT_MI1 => AWPROT_MI1,
            AWVALID_MI1 => AWVALID_MI1,
            AWREADY_IM1 => AWREADY_S7IM1,
            WID_MI1 => WID_MI1,
            WDATA_MI1 => WDATA_MI1,
            WSTRB_MI1 => WSTRB_MI1,
            WLAST_MI1 => WLAST_MI1,
            WVALID_MI1 => WVALID_MI1,
            WREADY_IM1 => WREADY_S7IM1,
            ARID_MI1 => ARID_MI1,
            ARADDR_MI1 => ARADDR_MI1,
            ARLEN_MI1 => ARLEN_MI1,
            ARSIZE_MI1 => ARSIZE_MI1,
            ARBURST_MI1 => ARBURST_MI1,
            ARLOCK_MI1 => ARLOCK_MI1,
            ARCACHE_MI1 => ARCACHE_MI1,
            ARPROT_MI1 => ARPROT_MI1,
            ARVALID_MI1 => ARVALID_MI1,
            ARREADY_IM1 => ARREADY_S7IM1,
            AWID_MI2 => AWID_MI2,
            AWADDR_MI2 => AWADDR_MI2,
            AWLEN_MI2 => AWLEN_MI2,
            AWSIZE_MI2 => AWSIZE_MI2,
            AWBURST_MI2 => AWBURST_MI2,
            AWLOCK_MI2 => AWLOCK_MI2,
            AWCACHE_MI2 => AWCACHE_MI2,
            AWPROT_MI2 => AWPROT_MI2,
            AWVALID_MI2 => AWVALID_MI2,
            AWREADY_IM2 => AWREADY_S7IM2,
            WID_MI2 => WID_MI2,
            WDATA_MI2 => WDATA_MI2,
            WSTRB_MI2 => WSTRB_MI2,
            WLAST_MI2 => WLAST_MI2,
            WVALID_MI2 => WVALID_MI2,
            WREADY_IM2 => WREADY_S7IM2,
            ARID_MI2 => ARID_MI2,
            ARADDR_MI2 => ARADDR_MI2,
            ARLEN_MI2 => ARLEN_MI2,
            ARSIZE_MI2 => ARSIZE_MI2,
            ARBURST_MI2 => ARBURST_MI2,
            ARLOCK_MI2 => ARLOCK_MI2,
            ARCACHE_MI2 => ARCACHE_MI2,
            ARPROT_MI2 => ARPROT_MI2,
            ARVALID_MI2 => ARVALID_MI2,
            ARREADY_IM2 => ARREADY_S7IM2,
            AWID_MI3 => AWID_MI3,
            AWADDR_MI3 => AWADDR_MI3,
            AWLEN_MI3 => AWLEN_MI3,
            AWSIZE_MI3 => AWSIZE_MI3,
            AWBURST_MI3 => AWBURST_MI3,
            AWLOCK_MI3 => AWLOCK_MI3,
            AWCACHE_MI3 => AWCACHE_MI3,
            AWPROT_MI3 => AWPROT_MI3,
            AWVALID_MI3 => AWVALID_MI3,
            AWREADY_IM3 => AWREADY_S7IM3,
            WID_MI3 => WID_MI3,
            WDATA_MI3 => WDATA_MI3,
            WSTRB_MI3 => WSTRB_MI3,
            WLAST_MI3 => WLAST_MI3,
            WVALID_MI3 => WVALID_MI3,
            WREADY_IM3 => WREADY_S7IM3,
            ARID_MI3 => ARID_MI3,
            ARADDR_MI3 => ARADDR_MI3,
            ARLEN_MI3 => ARLEN_MI3,
            ARSIZE_MI3 => ARSIZE_MI3,
            ARBURST_MI3 => ARBURST_MI3,
            ARLOCK_MI3 => ARLOCK_MI3,
            ARCACHE_MI3 => ARCACHE_MI3,
            ARPROT_MI3 => ARPROT_MI3,
            ARVALID_MI3 => ARVALID_MI3,
            ARREADY_IM3 => ARREADY_S7IM3,
            AWID_IS => AWID_IS7_gated,
            AWADDR_IS => AWADDR_IS7_gated,
            AWLEN_IS => AWLEN_IS7_gated,
            AWSIZE_IS => AWSIZE_IS7_gated,
            AWBURST_IS => AWBURST_IS7_gated,
            AWLOCK_IS => AWLOCK_IS7_gated,
            AWCACHE_IS => AWCACHE_IS7_gated,
            AWPROT_IS => AWPROT_IS7_gated,
            AWVALID_IS => AWVALID_IS7_gated,
            AWREADY_SI => AWREADY_SI7,
            RVALID_SI => RVALID_SI7,
            RLAST_SI => RLAST_SI7,
            RREADY_IS => RREADY_IS7_xhdl244,
            WID_IS => WID_IS7_gated,
            WDATA_IS => WDATA_IS7_gated,
            WSTRB_IS => WSTRB_IS7_gated,
            WLAST_IS => WLAST_IS7_gated,
            WVALID_IS => WVALID_IS7_gated,
            WREADY_SI => WREADY_SI7,
            ARID_IS => ARID_IS7_gated,
            ARADDR_IS => ARADDR_IS7_gated,
            ARLEN_IS => ARLEN_IS7_gated,
            ARSIZE_IS => ARSIZE_IS7_gated,
            ARBURST_IS => ARBURST_IS7_gated,
            ARLOCK_IS => ARLOCK_IS7_gated,
            ARCACHE_IS => ARCACHE_IS7_gated,
            ARPROT_IS => ARPROT_IS7_gated,
            ARVALID_IS => ARVALID_IS7_gated,
            ARREADY_SI => ARREADY_SI7,
            SLAVE_NUMBER => "00111");
   END GENERATE L18;
   
   L19: IF (((M0_SLAVE8ENABLE = 1 OR M1_SLAVE8ENABLE = 1 OR M2_SLAVE8ENABLE = 1 OR 
   M3_SLAVE8ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE8ENABLE = 1 OR 
   M1_SLAVE8ENABLE = 1 OR M2_SLAVE8ENABLE = 1 OR M3_SLAVE8ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 0))) GENERATE
      -- <<X-HDL>> Can't find translated component 'matrix_s'. Port & generic names and types may not match. No template will be included
      inst_matrix_S8 : axi_matrix_s 
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
            AWADDR_IS_int => AWADDR_IS_int,
            ARADDR_IS_int => ARADDR_IS_int,
            gated_waddr => gated_waddr,
            gated_raddr => gated_raddr,
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
            m0_rd_end => m0_rd_end,
            m1_rd_end => m1_rd_end,
            m2_rd_end => m2_rd_end,
            m3_rd_end => m3_rd_end,
            m0_wr_end => m0_wr_end,
            m1_wr_end => m1_wr_end,
            m2_wr_end => m2_wr_end,
            m3_wr_end => m3_wr_end,
            AWID_MI0 => AWID_MI0,
            AWADDR_MI0 => AWADDR_MI0,
            AWLEN_MI0 => AWLEN_MI0,
            AWSIZE_MI0 => AWSIZE_MI0,
            AWBURST_MI0 => AWBURST_MI0,
            AWLOCK_MI0 => AWLOCK_MI0,
            AWCACHE_MI0 => AWCACHE_MI0,
            AWPROT_MI0 => AWPROT_MI0,
            AWVALID_MI0 => AWVALID_MI0,
            AWREADY_IM0 => AWREADY_S8IM0,
            WID_MI0 => WID_MI0,
            WDATA_MI0 => WDATA_MI0,
            WSTRB_MI0 => WSTRB_MI0,
            WLAST_MI0 => WLAST_MI0,
            WVALID_MI0 => WVALID_MI0,
            WREADY_IM0 => WREADY_S8IM0,
            ARID_MI0 => ARID_MI0,
            ARADDR_MI0 => ARADDR_MI0,
            ARLEN_MI0 => ARLEN_MI0,
            ARSIZE_MI0 => ARSIZE_MI0,
            ARBURST_MI0 => ARBURST_MI0,
            ARLOCK_MI0 => ARLOCK_MI0,
            ARCACHE_MI0 => ARCACHE_MI0,
            ARPROT_MI0 => ARPROT_MI0,
            ARVALID_MI0 => ARVALID_MI0,
            ARREADY_IM0 => ARREADY_S8IM0,
            AWID_MI1 => AWID_MI1,
            AWADDR_MI1 => AWADDR_MI1,
            AWLEN_MI1 => AWLEN_MI1,
            AWSIZE_MI1 => AWSIZE_MI1,
            AWBURST_MI1 => AWBURST_MI1,
            AWLOCK_MI1 => AWLOCK_MI1,
            AWCACHE_MI1 => AWCACHE_MI1,
            AWPROT_MI1 => AWPROT_MI1,
            AWVALID_MI1 => AWVALID_MI1,
            AWREADY_IM1 => AWREADY_S8IM1,
            WID_MI1 => WID_MI1,
            WDATA_MI1 => WDATA_MI1,
            WSTRB_MI1 => WSTRB_MI1,
            WLAST_MI1 => WLAST_MI1,
            WVALID_MI1 => WVALID_MI1,
            WREADY_IM1 => WREADY_S8IM1,
            ARID_MI1 => ARID_MI1,
            ARADDR_MI1 => ARADDR_MI1,
            ARLEN_MI1 => ARLEN_MI1,
            ARSIZE_MI1 => ARSIZE_MI1,
            ARBURST_MI1 => ARBURST_MI1,
            ARLOCK_MI1 => ARLOCK_MI1,
            ARCACHE_MI1 => ARCACHE_MI1,
            ARPROT_MI1 => ARPROT_MI1,
            ARVALID_MI1 => ARVALID_MI1,
            ARREADY_IM1 => ARREADY_S8IM1,
            AWID_MI2 => AWID_MI2,
            AWADDR_MI2 => AWADDR_MI2,
            AWLEN_MI2 => AWLEN_MI2,
            AWSIZE_MI2 => AWSIZE_MI2,
            AWBURST_MI2 => AWBURST_MI2,
            AWLOCK_MI2 => AWLOCK_MI2,
            AWCACHE_MI2 => AWCACHE_MI2,
            AWPROT_MI2 => AWPROT_MI2,
            AWVALID_MI2 => AWVALID_MI2,
            AWREADY_IM2 => AWREADY_S8IM2,
            WID_MI2 => WID_MI2,
            WDATA_MI2 => WDATA_MI2,
            WSTRB_MI2 => WSTRB_MI2,
            WLAST_MI2 => WLAST_MI2,
            WVALID_MI2 => WVALID_MI2,
            WREADY_IM2 => WREADY_S8IM2,
            ARID_MI2 => ARID_MI2,
            ARADDR_MI2 => ARADDR_MI2,
            ARLEN_MI2 => ARLEN_MI2,
            ARSIZE_MI2 => ARSIZE_MI2,
            ARBURST_MI2 => ARBURST_MI2,
            ARLOCK_MI2 => ARLOCK_MI2,
            ARCACHE_MI2 => ARCACHE_MI2,
            ARPROT_MI2 => ARPROT_MI2,
            ARVALID_MI2 => ARVALID_MI2,
            ARREADY_IM2 => ARREADY_S8IM2,
            AWID_MI3 => AWID_MI3,
            AWADDR_MI3 => AWADDR_MI3,
            AWLEN_MI3 => AWLEN_MI3,
            AWSIZE_MI3 => AWSIZE_MI3,
            AWBURST_MI3 => AWBURST_MI3,
            AWLOCK_MI3 => AWLOCK_MI3,
            AWCACHE_MI3 => AWCACHE_MI3,
            AWPROT_MI3 => AWPROT_MI3,
            AWVALID_MI3 => AWVALID_MI3,
            AWREADY_IM3 => AWREADY_S8IM3,
            WID_MI3 => WID_MI3,
            WDATA_MI3 => WDATA_MI3,
            WSTRB_MI3 => WSTRB_MI3,
            WLAST_MI3 => WLAST_MI3,
            WVALID_MI3 => WVALID_MI3,
            WREADY_IM3 => WREADY_S8IM3,
            ARID_MI3 => ARID_MI3,
            ARADDR_MI3 => ARADDR_MI3,
            ARLEN_MI3 => ARLEN_MI3,
            ARSIZE_MI3 => ARSIZE_MI3,
            ARBURST_MI3 => ARBURST_MI3,
            ARLOCK_MI3 => ARLOCK_MI3,
            ARCACHE_MI3 => ARCACHE_MI3,
            ARPROT_MI3 => ARPROT_MI3,
            ARVALID_MI3 => ARVALID_MI3,
            ARREADY_IM3 => ARREADY_S8IM3,
            AWID_IS => AWID_IS8_gated,
            AWADDR_IS => AWADDR_IS8_gated,
            AWLEN_IS => AWLEN_IS8_gated,
            AWSIZE_IS => AWSIZE_IS8_gated,
            AWBURST_IS => AWBURST_IS8_gated,
            AWLOCK_IS => AWLOCK_IS8_gated,
            AWCACHE_IS => AWCACHE_IS8_gated,
            AWPROT_IS => AWPROT_IS8_gated,
            AWVALID_IS => AWVALID_IS8_gated,
            AWREADY_SI => AWREADY_SI8,
            RVALID_SI => RVALID_SI8,
            RLAST_SI => RLAST_SI8,
            RREADY_IS => RREADY_IS8_xhdl269,
            WID_IS => WID_IS8_gated,
            WDATA_IS => WDATA_IS8_gated,
            WSTRB_IS => WSTRB_IS8_gated,
            WLAST_IS => WLAST_IS8_gated,
            WVALID_IS => WVALID_IS8_gated,
            WREADY_SI => WREADY_SI8,
            ARID_IS => ARID_IS8_gated,
            ARADDR_IS => ARADDR_IS8_gated,
            ARLEN_IS => ARLEN_IS8_gated,
            ARSIZE_IS => ARSIZE_IS8_gated,
            ARBURST_IS => ARBURST_IS8_gated,
            ARLOCK_IS => ARLOCK_IS8_gated,
            ARCACHE_IS => ARCACHE_IS8_gated,
            ARPROT_IS => ARPROT_IS8_gated,
            ARVALID_IS => ARVALID_IS8_gated,
            ARREADY_SI => ARREADY_SI8,
            SLAVE_NUMBER => "01000");
   END GENERATE L19;
   
   L20: IF (((M0_SLAVE9ENABLE = 1 OR M1_SLAVE9ENABLE = 1 OR M2_SLAVE9ENABLE = 1 OR 
   M3_SLAVE9ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE9ENABLE = 1 OR 
   M1_SLAVE9ENABLE = 1 OR M2_SLAVE9ENABLE = 1 OR M3_SLAVE9ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 0))) GENERATE
      -- <<X-HDL>> Can't find translated component 'matrix_s'. Port & generic names and types may not match. No template will be included
      inst_matrix_S9 : axi_matrix_s 
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
            AWADDR_IS_int => AWADDR_IS_int,
            ARADDR_IS_int => ARADDR_IS_int,
            gated_waddr => gated_waddr,
            gated_raddr => gated_raddr,
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
            m0_rd_end => m0_rd_end,
            m1_rd_end => m1_rd_end,
            m2_rd_end => m2_rd_end,
            m3_rd_end => m3_rd_end,
            m0_wr_end => m0_wr_end,
            m1_wr_end => m1_wr_end,
            m2_wr_end => m2_wr_end,
            m3_wr_end => m3_wr_end,
            AWID_MI0 => AWID_MI0,
            AWADDR_MI0 => AWADDR_MI0,
            AWLEN_MI0 => AWLEN_MI0,
            AWSIZE_MI0 => AWSIZE_MI0,
            AWBURST_MI0 => AWBURST_MI0,
            AWLOCK_MI0 => AWLOCK_MI0,
            AWCACHE_MI0 => AWCACHE_MI0,
            AWPROT_MI0 => AWPROT_MI0,
            AWVALID_MI0 => AWVALID_MI0,
            AWREADY_IM0 => AWREADY_S9IM0,
            WID_MI0 => WID_MI0,
            WDATA_MI0 => WDATA_MI0,
            WSTRB_MI0 => WSTRB_MI0,
            WLAST_MI0 => WLAST_MI0,
            WVALID_MI0 => WVALID_MI0,
            WREADY_IM0 => WREADY_S9IM0,
            ARID_MI0 => ARID_MI0,
            ARADDR_MI0 => ARADDR_MI0,
            ARLEN_MI0 => ARLEN_MI0,
            ARSIZE_MI0 => ARSIZE_MI0,
            ARBURST_MI0 => ARBURST_MI0,
            ARLOCK_MI0 => ARLOCK_MI0,
            ARCACHE_MI0 => ARCACHE_MI0,
            ARPROT_MI0 => ARPROT_MI0,
            ARVALID_MI0 => ARVALID_MI0,
            ARREADY_IM0 => ARREADY_S9IM0,
            AWID_MI1 => AWID_MI1,
            AWADDR_MI1 => AWADDR_MI1,
            AWLEN_MI1 => AWLEN_MI1,
            AWSIZE_MI1 => AWSIZE_MI1,
            AWBURST_MI1 => AWBURST_MI1,
            AWLOCK_MI1 => AWLOCK_MI1,
            AWCACHE_MI1 => AWCACHE_MI1,
            AWPROT_MI1 => AWPROT_MI1,
            AWVALID_MI1 => AWVALID_MI1,
            AWREADY_IM1 => AWREADY_S9IM1,
            WID_MI1 => WID_MI1,
            WDATA_MI1 => WDATA_MI1,
            WSTRB_MI1 => WSTRB_MI1,
            WLAST_MI1 => WLAST_MI1,
            WVALID_MI1 => WVALID_MI1,
            WREADY_IM1 => WREADY_S9IM1,
            ARID_MI1 => ARID_MI1,
            ARADDR_MI1 => ARADDR_MI1,
            ARLEN_MI1 => ARLEN_MI1,
            ARSIZE_MI1 => ARSIZE_MI1,
            ARBURST_MI1 => ARBURST_MI1,
            ARLOCK_MI1 => ARLOCK_MI1,
            ARCACHE_MI1 => ARCACHE_MI1,
            ARPROT_MI1 => ARPROT_MI1,
            ARVALID_MI1 => ARVALID_MI1,
            ARREADY_IM1 => ARREADY_S9IM1,
            AWID_MI2 => AWID_MI2,
            AWADDR_MI2 => AWADDR_MI2,
            AWLEN_MI2 => AWLEN_MI2,
            AWSIZE_MI2 => AWSIZE_MI2,
            AWBURST_MI2 => AWBURST_MI2,
            AWLOCK_MI2 => AWLOCK_MI2,
            AWCACHE_MI2 => AWCACHE_MI2,
            AWPROT_MI2 => AWPROT_MI2,
            AWVALID_MI2 => AWVALID_MI2,
            AWREADY_IM2 => AWREADY_S9IM2,
            WID_MI2 => WID_MI2,
            WDATA_MI2 => WDATA_MI2,
            WSTRB_MI2 => WSTRB_MI2,
            WLAST_MI2 => WLAST_MI2,
            WVALID_MI2 => WVALID_MI2,
            WREADY_IM2 => WREADY_S9IM2,
            ARID_MI2 => ARID_MI2,
            ARADDR_MI2 => ARADDR_MI2,
            ARLEN_MI2 => ARLEN_MI2,
            ARSIZE_MI2 => ARSIZE_MI2,
            ARBURST_MI2 => ARBURST_MI2,
            ARLOCK_MI2 => ARLOCK_MI2,
            ARCACHE_MI2 => ARCACHE_MI2,
            ARPROT_MI2 => ARPROT_MI2,
            ARVALID_MI2 => ARVALID_MI2,
            ARREADY_IM2 => ARREADY_S9IM2,
            AWID_MI3 => AWID_MI3,
            AWADDR_MI3 => AWADDR_MI3,
            AWLEN_MI3 => AWLEN_MI3,
            AWSIZE_MI3 => AWSIZE_MI3,
            AWBURST_MI3 => AWBURST_MI3,
            AWLOCK_MI3 => AWLOCK_MI3,
            AWCACHE_MI3 => AWCACHE_MI3,
            AWPROT_MI3 => AWPROT_MI3,
            AWVALID_MI3 => AWVALID_MI3,
            AWREADY_IM3 => AWREADY_S9IM3,
            WID_MI3 => WID_MI3,
            WDATA_MI3 => WDATA_MI3,
            WSTRB_MI3 => WSTRB_MI3,
            WLAST_MI3 => WLAST_MI3,
            WVALID_MI3 => WVALID_MI3,
            WREADY_IM3 => WREADY_S9IM3,
            ARID_MI3 => ARID_MI3,
            ARADDR_MI3 => ARADDR_MI3,
            ARLEN_MI3 => ARLEN_MI3,
            ARSIZE_MI3 => ARSIZE_MI3,
            ARBURST_MI3 => ARBURST_MI3,
            ARLOCK_MI3 => ARLOCK_MI3,
            ARCACHE_MI3 => ARCACHE_MI3,
            ARPROT_MI3 => ARPROT_MI3,
            ARVALID_MI3 => ARVALID_MI3,
            ARREADY_IM3 => ARREADY_S9IM3,
            AWID_IS => AWID_IS9_gated,
            AWADDR_IS => AWADDR_IS9_gated,
            AWLEN_IS => AWLEN_IS9_gated,
            AWSIZE_IS => AWSIZE_IS9_gated,
            AWBURST_IS => AWBURST_IS9_gated,
            AWLOCK_IS => AWLOCK_IS9_gated,
            AWCACHE_IS => AWCACHE_IS9_gated,
            AWPROT_IS => AWPROT_IS9_gated,
            AWVALID_IS => AWVALID_IS9_gated,
            AWREADY_SI => AWREADY_SI9,
            RVALID_SI => RVALID_SI9,
            RLAST_SI => RLAST_SI9,
            RREADY_IS => RREADY_IS9_xhdl294,
            WID_IS => WID_IS9_gated,
            WDATA_IS => WDATA_IS9_gated,
            WSTRB_IS => WSTRB_IS9_gated,
            WLAST_IS => WLAST_IS9_gated,
            WVALID_IS => WVALID_IS9_gated,
            WREADY_SI => WREADY_SI9,
            ARID_IS => ARID_IS9_gated,
            ARADDR_IS => ARADDR_IS9_gated,
            ARLEN_IS => ARLEN_IS9_gated,
            ARSIZE_IS => ARSIZE_IS9_gated,
            ARBURST_IS => ARBURST_IS9_gated,
            ARLOCK_IS => ARLOCK_IS9_gated,
            ARCACHE_IS => ARCACHE_IS9_gated,
            ARPROT_IS => ARPROT_IS9_gated,
            ARVALID_IS => ARVALID_IS9_gated,
            ARREADY_SI => ARREADY_SI9,
            SLAVE_NUMBER => "01001");
   END GENERATE L20;
   
   L21: IF (((M0_SLAVE10ENABLE = 1 OR M1_SLAVE10ENABLE = 1 OR M2_SLAVE10ENABLE = 1 
   OR M3_SLAVE10ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE10ENABLE = 1 OR 
   M1_SLAVE10ENABLE = 1 OR M2_SLAVE10ENABLE = 1 OR M3_SLAVE10ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 0))) GENERATE
      -- <<X-HDL>> Can't find translated component 'matrix_s'. Port & generic names and types may not match. No template will be included
      inst_matrix_S10 : axi_matrix_s 
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
            AWADDR_IS_int => AWADDR_IS_int,
            ARADDR_IS_int => ARADDR_IS_int,
            gated_waddr => gated_waddr,
            gated_raddr => gated_raddr,
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
            m0_rd_end => m0_rd_end,
            m1_rd_end => m1_rd_end,
            m2_rd_end => m2_rd_end,
            m3_rd_end => m3_rd_end,
            m0_wr_end => m0_wr_end,
            m1_wr_end => m1_wr_end,
            m2_wr_end => m2_wr_end,
            m3_wr_end => m3_wr_end,
            AWID_MI0 => AWID_MI0,
            AWADDR_MI0 => AWADDR_MI0,
            AWLEN_MI0 => AWLEN_MI0,
            AWSIZE_MI0 => AWSIZE_MI0,
            AWBURST_MI0 => AWBURST_MI0,
            AWLOCK_MI0 => AWLOCK_MI0,
            AWCACHE_MI0 => AWCACHE_MI0,
            AWPROT_MI0 => AWPROT_MI0,
            AWVALID_MI0 => AWVALID_MI0,
            AWREADY_IM0 => AWREADY_S10IM0,
            WID_MI0 => WID_MI0,
            WDATA_MI0 => WDATA_MI0,
            WSTRB_MI0 => WSTRB_MI0,
            WLAST_MI0 => WLAST_MI0,
            WVALID_MI0 => WVALID_MI0,
            WREADY_IM0 => WREADY_S10IM0,
            ARID_MI0 => ARID_MI0,
            ARADDR_MI0 => ARADDR_MI0,
            ARLEN_MI0 => ARLEN_MI0,
            ARSIZE_MI0 => ARSIZE_MI0,
            ARBURST_MI0 => ARBURST_MI0,
            ARLOCK_MI0 => ARLOCK_MI0,
            ARCACHE_MI0 => ARCACHE_MI0,
            ARPROT_MI0 => ARPROT_MI0,
            ARVALID_MI0 => ARVALID_MI0,
            ARREADY_IM0 => ARREADY_S10IM0,
            AWID_MI1 => AWID_MI1,
            AWADDR_MI1 => AWADDR_MI1,
            AWLEN_MI1 => AWLEN_MI1,
            AWSIZE_MI1 => AWSIZE_MI1,
            AWBURST_MI1 => AWBURST_MI1,
            AWLOCK_MI1 => AWLOCK_MI1,
            AWCACHE_MI1 => AWCACHE_MI1,
            AWPROT_MI1 => AWPROT_MI1,
            AWVALID_MI1 => AWVALID_MI1,
            AWREADY_IM1 => AWREADY_S10IM1,
            WID_MI1 => WID_MI1,
            WDATA_MI1 => WDATA_MI1,
            WSTRB_MI1 => WSTRB_MI1,
            WLAST_MI1 => WLAST_MI1,
            WVALID_MI1 => WVALID_MI1,
            WREADY_IM1 => WREADY_S10IM1,
            ARID_MI1 => ARID_MI1,
            ARADDR_MI1 => ARADDR_MI1,
            ARLEN_MI1 => ARLEN_MI1,
            ARSIZE_MI1 => ARSIZE_MI1,
            ARBURST_MI1 => ARBURST_MI1,
            ARLOCK_MI1 => ARLOCK_MI1,
            ARCACHE_MI1 => ARCACHE_MI1,
            ARPROT_MI1 => ARPROT_MI1,
            ARVALID_MI1 => ARVALID_MI1,
            ARREADY_IM1 => ARREADY_S10IM1,
            AWID_MI2 => AWID_MI2,
            AWADDR_MI2 => AWADDR_MI2,
            AWLEN_MI2 => AWLEN_MI2,
            AWSIZE_MI2 => AWSIZE_MI2,
            AWBURST_MI2 => AWBURST_MI2,
            AWLOCK_MI2 => AWLOCK_MI2,
            AWCACHE_MI2 => AWCACHE_MI2,
            AWPROT_MI2 => AWPROT_MI2,
            AWVALID_MI2 => AWVALID_MI2,
            AWREADY_IM2 => AWREADY_S10IM2,
            WID_MI2 => WID_MI2,
            WDATA_MI2 => WDATA_MI2,
            WSTRB_MI2 => WSTRB_MI2,
            WLAST_MI2 => WLAST_MI2,
            WVALID_MI2 => WVALID_MI2,
            WREADY_IM2 => WREADY_S10IM2,
            ARID_MI2 => ARID_MI2,
            ARADDR_MI2 => ARADDR_MI2,
            ARLEN_MI2 => ARLEN_MI2,
            ARSIZE_MI2 => ARSIZE_MI2,
            ARBURST_MI2 => ARBURST_MI2,
            ARLOCK_MI2 => ARLOCK_MI2,
            ARCACHE_MI2 => ARCACHE_MI2,
            ARPROT_MI2 => ARPROT_MI2,
            ARVALID_MI2 => ARVALID_MI2,
            ARREADY_IM2 => ARREADY_S10IM2,
            AWID_MI3 => AWID_MI3,
            AWADDR_MI3 => AWADDR_MI3,
            AWLEN_MI3 => AWLEN_MI3,
            AWSIZE_MI3 => AWSIZE_MI3,
            AWBURST_MI3 => AWBURST_MI3,
            AWLOCK_MI3 => AWLOCK_MI3,
            AWCACHE_MI3 => AWCACHE_MI3,
            AWPROT_MI3 => AWPROT_MI3,
            AWVALID_MI3 => AWVALID_MI3,
            AWREADY_IM3 => AWREADY_S10IM3,
            WID_MI3 => WID_MI3,
            WDATA_MI3 => WDATA_MI3,
            WSTRB_MI3 => WSTRB_MI3,
            WLAST_MI3 => WLAST_MI3,
            WVALID_MI3 => WVALID_MI3,
            WREADY_IM3 => WREADY_S10IM3,
            ARID_MI3 => ARID_MI3,
            ARADDR_MI3 => ARADDR_MI3,
            ARLEN_MI3 => ARLEN_MI3,
            ARSIZE_MI3 => ARSIZE_MI3,
            ARBURST_MI3 => ARBURST_MI3,
            ARLOCK_MI3 => ARLOCK_MI3,
            ARCACHE_MI3 => ARCACHE_MI3,
            ARPROT_MI3 => ARPROT_MI3,
            ARVALID_MI3 => ARVALID_MI3,
            ARREADY_IM3 => ARREADY_S10IM3,
            AWID_IS => AWID_IS10_gated,
            AWADDR_IS => AWADDR_IS10_gated,
            AWLEN_IS => AWLEN_IS10_gated,
            AWSIZE_IS => AWSIZE_IS10_gated,
            AWBURST_IS => AWBURST_IS10_gated,
            AWLOCK_IS => AWLOCK_IS10_gated,
            AWCACHE_IS => AWCACHE_IS10_gated,
            AWPROT_IS => AWPROT_IS10_gated,
            AWVALID_IS => AWVALID_IS10_gated,
            AWREADY_SI => AWREADY_SI10,
            RVALID_SI => RVALID_SI10,
            RLAST_SI => RLAST_SI10,
            RREADY_IS => RREADY_IS10_xhdl319,
            WID_IS => WID_IS10_gated,
            WDATA_IS => WDATA_IS10_gated,
            WSTRB_IS => WSTRB_IS10_gated,
            WLAST_IS => WLAST_IS10_gated,
            WVALID_IS => WVALID_IS10_gated,
            WREADY_SI => WREADY_SI10,
            ARID_IS => ARID_IS10_gated,
            ARADDR_IS => ARADDR_IS10_gated,
            ARLEN_IS => ARLEN_IS10_gated,
            ARSIZE_IS => ARSIZE_IS10_gated,
            ARBURST_IS => ARBURST_IS10_gated,
            ARLOCK_IS => ARLOCK_IS10_gated,
            ARCACHE_IS => ARCACHE_IS10_gated,
            ARPROT_IS => ARPROT_IS10_gated,
            ARVALID_IS => ARVALID_IS10_gated,
            ARREADY_SI => ARREADY_SI10,
            SLAVE_NUMBER => "01010");
   END GENERATE L21;
   
   L22: IF (((M0_SLAVE11ENABLE = 1 OR M1_SLAVE11ENABLE = 1 OR M2_SLAVE11ENABLE = 1 
   OR M3_SLAVE11ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE11ENABLE = 1 OR 
   M1_SLAVE11ENABLE = 1 OR M2_SLAVE11ENABLE = 1 OR M3_SLAVE11ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 0))) GENERATE
      -- <<X-HDL>> Can't find translated component 'matrix_s'. Port & generic names and types may not match. No template will be included
      inst_matrix_S11 : axi_matrix_s 
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
            AWADDR_IS_int => AWADDR_IS_int,
            ARADDR_IS_int => ARADDR_IS_int,
            gated_waddr => gated_waddr,
            gated_raddr => gated_raddr,
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
            m0_rd_end => m0_rd_end,
            m1_rd_end => m1_rd_end,
            m2_rd_end => m2_rd_end,
            m3_rd_end => m3_rd_end,
            m0_wr_end => m0_wr_end,
            m1_wr_end => m1_wr_end,
            m2_wr_end => m2_wr_end,
            m3_wr_end => m3_wr_end,
            AWID_MI0 => AWID_MI0,
            AWADDR_MI0 => AWADDR_MI0,
            AWLEN_MI0 => AWLEN_MI0,
            AWSIZE_MI0 => AWSIZE_MI0,
            AWBURST_MI0 => AWBURST_MI0,
            AWLOCK_MI0 => AWLOCK_MI0,
            AWCACHE_MI0 => AWCACHE_MI0,
            AWPROT_MI0 => AWPROT_MI0,
            AWVALID_MI0 => AWVALID_MI0,
            AWREADY_IM0 => AWREADY_S11IM0,
            WID_MI0 => WID_MI0,
            WDATA_MI0 => WDATA_MI0,
            WSTRB_MI0 => WSTRB_MI0,
            WLAST_MI0 => WLAST_MI0,
            WVALID_MI0 => WVALID_MI0,
            WREADY_IM0 => WREADY_S11IM0,
            ARID_MI0 => ARID_MI0,
            ARADDR_MI0 => ARADDR_MI0,
            ARLEN_MI0 => ARLEN_MI0,
            ARSIZE_MI0 => ARSIZE_MI0,
            ARBURST_MI0 => ARBURST_MI0,
            ARLOCK_MI0 => ARLOCK_MI0,
            ARCACHE_MI0 => ARCACHE_MI0,
            ARPROT_MI0 => ARPROT_MI0,
            ARVALID_MI0 => ARVALID_MI0,
            ARREADY_IM0 => ARREADY_S11IM0,
            AWID_MI1 => AWID_MI1,
            AWADDR_MI1 => AWADDR_MI1,
            AWLEN_MI1 => AWLEN_MI1,
            AWSIZE_MI1 => AWSIZE_MI1,
            AWBURST_MI1 => AWBURST_MI1,
            AWLOCK_MI1 => AWLOCK_MI1,
            AWCACHE_MI1 => AWCACHE_MI1,
            AWPROT_MI1 => AWPROT_MI1,
            AWVALID_MI1 => AWVALID_MI1,
            AWREADY_IM1 => AWREADY_S11IM1,
            WID_MI1 => WID_MI1,
            WDATA_MI1 => WDATA_MI1,
            WSTRB_MI1 => WSTRB_MI1,
            WLAST_MI1 => WLAST_MI1,
            WVALID_MI1 => WVALID_MI1,
            WREADY_IM1 => WREADY_S11IM1,
            ARID_MI1 => ARID_MI1,
            ARADDR_MI1 => ARADDR_MI1,
            ARLEN_MI1 => ARLEN_MI1,
            ARSIZE_MI1 => ARSIZE_MI1,
            ARBURST_MI1 => ARBURST_MI1,
            ARLOCK_MI1 => ARLOCK_MI1,
            ARCACHE_MI1 => ARCACHE_MI1,
            ARPROT_MI1 => ARPROT_MI1,
            ARVALID_MI1 => ARVALID_MI1,
            ARREADY_IM1 => ARREADY_S11IM1,
            AWID_MI2 => AWID_MI2,
            AWADDR_MI2 => AWADDR_MI2,
            AWLEN_MI2 => AWLEN_MI2,
            AWSIZE_MI2 => AWSIZE_MI2,
            AWBURST_MI2 => AWBURST_MI2,
            AWLOCK_MI2 => AWLOCK_MI2,
            AWCACHE_MI2 => AWCACHE_MI2,
            AWPROT_MI2 => AWPROT_MI2,
            AWVALID_MI2 => AWVALID_MI2,
            AWREADY_IM2 => AWREADY_S11IM2,
            WID_MI2 => WID_MI2,
            WDATA_MI2 => WDATA_MI2,
            WSTRB_MI2 => WSTRB_MI2,
            WLAST_MI2 => WLAST_MI2,
            WVALID_MI2 => WVALID_MI2,
            WREADY_IM2 => WREADY_S11IM2,
            ARID_MI2 => ARID_MI2,
            ARADDR_MI2 => ARADDR_MI2,
            ARLEN_MI2 => ARLEN_MI2,
            ARSIZE_MI2 => ARSIZE_MI2,
            ARBURST_MI2 => ARBURST_MI2,
            ARLOCK_MI2 => ARLOCK_MI2,
            ARCACHE_MI2 => ARCACHE_MI2,
            ARPROT_MI2 => ARPROT_MI2,
            ARVALID_MI2 => ARVALID_MI2,
            ARREADY_IM2 => ARREADY_S11IM2,
            AWID_MI3 => AWID_MI3,
            AWADDR_MI3 => AWADDR_MI3,
            AWLEN_MI3 => AWLEN_MI3,
            AWSIZE_MI3 => AWSIZE_MI3,
            AWBURST_MI3 => AWBURST_MI3,
            AWLOCK_MI3 => AWLOCK_MI3,
            AWCACHE_MI3 => AWCACHE_MI3,
            AWPROT_MI3 => AWPROT_MI3,
            AWVALID_MI3 => AWVALID_MI3,
            AWREADY_IM3 => AWREADY_S11IM3,
            WID_MI3 => WID_MI3,
            WDATA_MI3 => WDATA_MI3,
            WSTRB_MI3 => WSTRB_MI3,
            WLAST_MI3 => WLAST_MI3,
            WVALID_MI3 => WVALID_MI3,
            WREADY_IM3 => WREADY_S11IM3,
            ARID_MI3 => ARID_MI3,
            ARADDR_MI3 => ARADDR_MI3,
            ARLEN_MI3 => ARLEN_MI3,
            ARSIZE_MI3 => ARSIZE_MI3,
            ARBURST_MI3 => ARBURST_MI3,
            ARLOCK_MI3 => ARLOCK_MI3,
            ARCACHE_MI3 => ARCACHE_MI3,
            ARPROT_MI3 => ARPROT_MI3,
            ARVALID_MI3 => ARVALID_MI3,
            ARREADY_IM3 => ARREADY_S11IM3,
            AWID_IS => AWID_IS11_gated,
            AWADDR_IS => AWADDR_IS11_gated,
            AWLEN_IS => AWLEN_IS11_gated,
            AWSIZE_IS => AWSIZE_IS11_gated,
            AWBURST_IS => AWBURST_IS11_gated,
            AWLOCK_IS => AWLOCK_IS11_gated,
            AWCACHE_IS => AWCACHE_IS11_gated,
            AWPROT_IS => AWPROT_IS11_gated,
            AWVALID_IS => AWVALID_IS11_gated,
            AWREADY_SI => AWREADY_SI11,
            RVALID_SI => RVALID_SI11,
            RLAST_SI => RLAST_SI11,
            RREADY_IS => RREADY_IS11_xhdl344,
            WID_IS => WID_IS11_gated,
            WDATA_IS => WDATA_IS11_gated,
            WSTRB_IS => WSTRB_IS11_gated,
            WLAST_IS => WLAST_IS11_gated,
            WVALID_IS => WVALID_IS11_gated,
            WREADY_SI => WREADY_SI11,
            ARID_IS => ARID_IS11_gated,
            ARADDR_IS => ARADDR_IS11_gated,
            ARLEN_IS => ARLEN_IS11_gated,
            ARSIZE_IS => ARSIZE_IS11_gated,
            ARBURST_IS => ARBURST_IS11_gated,
            ARLOCK_IS => ARLOCK_IS11_gated,
            ARCACHE_IS => ARCACHE_IS11_gated,
            ARPROT_IS => ARPROT_IS11_gated,
            ARVALID_IS => ARVALID_IS11_gated,
            ARREADY_SI => ARREADY_SI11,
            SLAVE_NUMBER => "01011");
   END GENERATE L22;
   
   L23: IF (((M0_SLAVE12ENABLE = 1 OR M1_SLAVE12ENABLE = 1 OR M2_SLAVE12ENABLE = 1 
   OR M3_SLAVE12ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE12ENABLE = 1 OR 
   M1_SLAVE12ENABLE = 1 OR M2_SLAVE12ENABLE = 1 OR M3_SLAVE12ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 0))) GENERATE
      -- <<X-HDL>> Can't find translated component 'matrix_s'. Port & generic names and types may not match. No template will be included
      inst_matrix_S12 : axi_matrix_s 
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
            AWADDR_IS_int => AWADDR_IS_int,
            ARADDR_IS_int => ARADDR_IS_int,
            gated_waddr => gated_waddr,
            gated_raddr => gated_raddr,
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
            m0_rd_end => m0_rd_end,
            m1_rd_end => m1_rd_end,
            m2_rd_end => m2_rd_end,
            m3_rd_end => m3_rd_end,
            m0_wr_end => m0_wr_end,
            m1_wr_end => m1_wr_end,
            m2_wr_end => m2_wr_end,
            m3_wr_end => m3_wr_end,
            AWID_MI0 => AWID_MI0,
            AWADDR_MI0 => AWADDR_MI0,
            AWLEN_MI0 => AWLEN_MI0,
            AWSIZE_MI0 => AWSIZE_MI0,
            AWBURST_MI0 => AWBURST_MI0,
            AWLOCK_MI0 => AWLOCK_MI0,
            AWCACHE_MI0 => AWCACHE_MI0,
            AWPROT_MI0 => AWPROT_MI0,
            AWVALID_MI0 => AWVALID_MI0,
            AWREADY_IM0 => AWREADY_S12IM0,
            WID_MI0 => WID_MI0,
            WDATA_MI0 => WDATA_MI0,
            WSTRB_MI0 => WSTRB_MI0,
            WLAST_MI0 => WLAST_MI0,
            WVALID_MI0 => WVALID_MI0,
            WREADY_IM0 => WREADY_S12IM0,
            ARID_MI0 => ARID_MI0,
            ARADDR_MI0 => ARADDR_MI0,
            ARLEN_MI0 => ARLEN_MI0,
            ARSIZE_MI0 => ARSIZE_MI0,
            ARBURST_MI0 => ARBURST_MI0,
            ARLOCK_MI0 => ARLOCK_MI0,
            ARCACHE_MI0 => ARCACHE_MI0,
            ARPROT_MI0 => ARPROT_MI0,
            ARVALID_MI0 => ARVALID_MI0,
            ARREADY_IM0 => ARREADY_S12IM0,
            AWID_MI1 => AWID_MI1,
            AWADDR_MI1 => AWADDR_MI1,
            AWLEN_MI1 => AWLEN_MI1,
            AWSIZE_MI1 => AWSIZE_MI1,
            AWBURST_MI1 => AWBURST_MI1,
            AWLOCK_MI1 => AWLOCK_MI1,
            AWCACHE_MI1 => AWCACHE_MI1,
            AWPROT_MI1 => AWPROT_MI1,
            AWVALID_MI1 => AWVALID_MI1,
            AWREADY_IM1 => AWREADY_S12IM1,
            WID_MI1 => WID_MI1,
            WDATA_MI1 => WDATA_MI1,
            WSTRB_MI1 => WSTRB_MI1,
            WLAST_MI1 => WLAST_MI1,
            WVALID_MI1 => WVALID_MI1,
            WREADY_IM1 => WREADY_S12IM1,
            ARID_MI1 => ARID_MI1,
            ARADDR_MI1 => ARADDR_MI1,
            ARLEN_MI1 => ARLEN_MI1,
            ARSIZE_MI1 => ARSIZE_MI1,
            ARBURST_MI1 => ARBURST_MI1,
            ARLOCK_MI1 => ARLOCK_MI1,
            ARCACHE_MI1 => ARCACHE_MI1,
            ARPROT_MI1 => ARPROT_MI1,
            ARVALID_MI1 => ARVALID_MI1,
            ARREADY_IM1 => ARREADY_S12IM1,
            AWID_MI2 => AWID_MI2,
            AWADDR_MI2 => AWADDR_MI2,
            AWLEN_MI2 => AWLEN_MI2,
            AWSIZE_MI2 => AWSIZE_MI2,
            AWBURST_MI2 => AWBURST_MI2,
            AWLOCK_MI2 => AWLOCK_MI2,
            AWCACHE_MI2 => AWCACHE_MI2,
            AWPROT_MI2 => AWPROT_MI2,
            AWVALID_MI2 => AWVALID_MI2,
            AWREADY_IM2 => AWREADY_S12IM2,
            WID_MI2 => WID_MI2,
            WDATA_MI2 => WDATA_MI2,
            WSTRB_MI2 => WSTRB_MI2,
            WLAST_MI2 => WLAST_MI2,
            WVALID_MI2 => WVALID_MI2,
            WREADY_IM2 => WREADY_S12IM2,
            ARID_MI2 => ARID_MI2,
            ARADDR_MI2 => ARADDR_MI2,
            ARLEN_MI2 => ARLEN_MI2,
            ARSIZE_MI2 => ARSIZE_MI2,
            ARBURST_MI2 => ARBURST_MI2,
            ARLOCK_MI2 => ARLOCK_MI2,
            ARCACHE_MI2 => ARCACHE_MI2,
            ARPROT_MI2 => ARPROT_MI2,
            ARVALID_MI2 => ARVALID_MI2,
            ARREADY_IM2 => ARREADY_S12IM2,
            AWID_MI3 => AWID_MI3,
            AWADDR_MI3 => AWADDR_MI3,
            AWLEN_MI3 => AWLEN_MI3,
            AWSIZE_MI3 => AWSIZE_MI3,
            AWBURST_MI3 => AWBURST_MI3,
            AWLOCK_MI3 => AWLOCK_MI3,
            AWCACHE_MI3 => AWCACHE_MI3,
            AWPROT_MI3 => AWPROT_MI3,
            AWVALID_MI3 => AWVALID_MI3,
            AWREADY_IM3 => AWREADY_S12IM3,
            WID_MI3 => WID_MI3,
            WDATA_MI3 => WDATA_MI3,
            WSTRB_MI3 => WSTRB_MI3,
            WLAST_MI3 => WLAST_MI3,
            WVALID_MI3 => WVALID_MI3,
            WREADY_IM3 => WREADY_S12IM3,
            ARID_MI3 => ARID_MI3,
            ARADDR_MI3 => ARADDR_MI3,
            ARLEN_MI3 => ARLEN_MI3,
            ARSIZE_MI3 => ARSIZE_MI3,
            ARBURST_MI3 => ARBURST_MI3,
            ARLOCK_MI3 => ARLOCK_MI3,
            ARCACHE_MI3 => ARCACHE_MI3,
            ARPROT_MI3 => ARPROT_MI3,
            ARVALID_MI3 => ARVALID_MI3,
            ARREADY_IM3 => ARREADY_S12IM3,
            AWID_IS => AWID_IS12_gated,
            AWADDR_IS => AWADDR_IS12_gated,
            AWLEN_IS => AWLEN_IS12_gated,
            AWSIZE_IS => AWSIZE_IS12_gated,
            AWBURST_IS => AWBURST_IS12_gated,
            AWLOCK_IS => AWLOCK_IS12_gated,
            AWCACHE_IS => AWCACHE_IS12_gated,
            AWPROT_IS => AWPROT_IS12_gated,
            AWVALID_IS => AWVALID_IS12_gated,
            AWREADY_SI => AWREADY_SI12,
            RVALID_SI => RVALID_SI12,
            RLAST_SI => RLAST_SI12,
            RREADY_IS => RREADY_IS12_xhdl369,
            WID_IS => WID_IS12_gated,
            WDATA_IS => WDATA_IS12_gated,
            WSTRB_IS => WSTRB_IS12_gated,
            WLAST_IS => WLAST_IS12_gated,
            WVALID_IS => WVALID_IS12_gated,
            WREADY_SI => WREADY_SI12,
            ARID_IS => ARID_IS12_gated,
            ARADDR_IS => ARADDR_IS12_gated,
            ARLEN_IS => ARLEN_IS12_gated,
            ARSIZE_IS => ARSIZE_IS12_gated,
            ARBURST_IS => ARBURST_IS12_gated,
            ARLOCK_IS => ARLOCK_IS12_gated,
            ARCACHE_IS => ARCACHE_IS12_gated,
            ARPROT_IS => ARPROT_IS12_gated,
            ARVALID_IS => ARVALID_IS12_gated,
            ARREADY_SI => ARREADY_SI12,
            SLAVE_NUMBER => "01100");
   END GENERATE L23;
   
   L24: IF (((M0_SLAVE13ENABLE = 1 OR M1_SLAVE13ENABLE = 1 OR M2_SLAVE13ENABLE = 1 
   OR M3_SLAVE13ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE13ENABLE = 1 OR 
   M1_SLAVE13ENABLE = 1 OR M2_SLAVE13ENABLE = 1 OR M3_SLAVE13ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 0))) GENERATE
      -- <<X-HDL>> Can't find translated component 'matrix_s'. Port & generic names and types may not match. No template will be included
      inst_matrix_S13 : axi_matrix_s 
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
            AWADDR_IS_int => AWADDR_IS_int,
            ARADDR_IS_int => ARADDR_IS_int,
            gated_waddr => gated_waddr,
            gated_raddr => gated_raddr,
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
            m0_rd_end => m0_rd_end,
            m1_rd_end => m1_rd_end,
            m2_rd_end => m2_rd_end,
            m3_rd_end => m3_rd_end,
            m0_wr_end => m0_wr_end,
            m1_wr_end => m1_wr_end,
            m2_wr_end => m2_wr_end,
            m3_wr_end => m3_wr_end,
            AWID_MI0 => AWID_MI0,
            AWADDR_MI0 => AWADDR_MI0,
            AWLEN_MI0 => AWLEN_MI0,
            AWSIZE_MI0 => AWSIZE_MI0,
            AWBURST_MI0 => AWBURST_MI0,
            AWLOCK_MI0 => AWLOCK_MI0,
            AWCACHE_MI0 => AWCACHE_MI0,
            AWPROT_MI0 => AWPROT_MI0,
            AWVALID_MI0 => AWVALID_MI0,
            AWREADY_IM0 => AWREADY_S13IM0,
            WID_MI0 => WID_MI0,
            WDATA_MI0 => WDATA_MI0,
            WSTRB_MI0 => WSTRB_MI0,
            WLAST_MI0 => WLAST_MI0,
            WVALID_MI0 => WVALID_MI0,
            WREADY_IM0 => WREADY_S13IM0,
            ARID_MI0 => ARID_MI0,
            ARADDR_MI0 => ARADDR_MI0,
            ARLEN_MI0 => ARLEN_MI0,
            ARSIZE_MI0 => ARSIZE_MI0,
            ARBURST_MI0 => ARBURST_MI0,
            ARLOCK_MI0 => ARLOCK_MI0,
            ARCACHE_MI0 => ARCACHE_MI0,
            ARPROT_MI0 => ARPROT_MI0,
            ARVALID_MI0 => ARVALID_MI0,
            ARREADY_IM0 => ARREADY_S13IM0,
            AWID_MI1 => AWID_MI1,
            AWADDR_MI1 => AWADDR_MI1,
            AWLEN_MI1 => AWLEN_MI1,
            AWSIZE_MI1 => AWSIZE_MI1,
            AWBURST_MI1 => AWBURST_MI1,
            AWLOCK_MI1 => AWLOCK_MI1,
            AWCACHE_MI1 => AWCACHE_MI1,
            AWPROT_MI1 => AWPROT_MI1,
            AWVALID_MI1 => AWVALID_MI1,
            AWREADY_IM1 => AWREADY_S13IM1,
            WID_MI1 => WID_MI1,
            WDATA_MI1 => WDATA_MI1,
            WSTRB_MI1 => WSTRB_MI1,
            WLAST_MI1 => WLAST_MI1,
            WVALID_MI1 => WVALID_MI1,
            WREADY_IM1 => WREADY_S13IM1,
            ARID_MI1 => ARID_MI1,
            ARADDR_MI1 => ARADDR_MI1,
            ARLEN_MI1 => ARLEN_MI1,
            ARSIZE_MI1 => ARSIZE_MI1,
            ARBURST_MI1 => ARBURST_MI1,
            ARLOCK_MI1 => ARLOCK_MI1,
            ARCACHE_MI1 => ARCACHE_MI1,
            ARPROT_MI1 => ARPROT_MI1,
            ARVALID_MI1 => ARVALID_MI1,
            ARREADY_IM1 => ARREADY_S13IM1,
            AWID_MI2 => AWID_MI2,
            AWADDR_MI2 => AWADDR_MI2,
            AWLEN_MI2 => AWLEN_MI2,
            AWSIZE_MI2 => AWSIZE_MI2,
            AWBURST_MI2 => AWBURST_MI2,
            AWLOCK_MI2 => AWLOCK_MI2,
            AWCACHE_MI2 => AWCACHE_MI2,
            AWPROT_MI2 => AWPROT_MI2,
            AWVALID_MI2 => AWVALID_MI2,
            AWREADY_IM2 => AWREADY_S13IM2,
            WID_MI2 => WID_MI2,
            WDATA_MI2 => WDATA_MI2,
            WSTRB_MI2 => WSTRB_MI2,
            WLAST_MI2 => WLAST_MI2,
            WVALID_MI2 => WVALID_MI2,
            WREADY_IM2 => WREADY_S13IM2,
            ARID_MI2 => ARID_MI2,
            ARADDR_MI2 => ARADDR_MI2,
            ARLEN_MI2 => ARLEN_MI2,
            ARSIZE_MI2 => ARSIZE_MI2,
            ARBURST_MI2 => ARBURST_MI2,
            ARLOCK_MI2 => ARLOCK_MI2,
            ARCACHE_MI2 => ARCACHE_MI2,
            ARPROT_MI2 => ARPROT_MI2,
            ARVALID_MI2 => ARVALID_MI2,
            ARREADY_IM2 => ARREADY_S13IM2,
            AWID_MI3 => AWID_MI3,
            AWADDR_MI3 => AWADDR_MI3,
            AWLEN_MI3 => AWLEN_MI3,
            AWSIZE_MI3 => AWSIZE_MI3,
            AWBURST_MI3 => AWBURST_MI3,
            AWLOCK_MI3 => AWLOCK_MI3,
            AWCACHE_MI3 => AWCACHE_MI3,
            AWPROT_MI3 => AWPROT_MI3,
            AWVALID_MI3 => AWVALID_MI3,
            AWREADY_IM3 => AWREADY_S13IM3,
            WID_MI3 => WID_MI3,
            WDATA_MI3 => WDATA_MI3,
            WSTRB_MI3 => WSTRB_MI3,
            WLAST_MI3 => WLAST_MI3,
            WVALID_MI3 => WVALID_MI3,
            WREADY_IM3 => WREADY_S13IM3,
            ARID_MI3 => ARID_MI3,
            ARADDR_MI3 => ARADDR_MI3,
            ARLEN_MI3 => ARLEN_MI3,
            ARSIZE_MI3 => ARSIZE_MI3,
            ARBURST_MI3 => ARBURST_MI3,
            ARLOCK_MI3 => ARLOCK_MI3,
            ARCACHE_MI3 => ARCACHE_MI3,
            ARPROT_MI3 => ARPROT_MI3,
            ARVALID_MI3 => ARVALID_MI3,
            ARREADY_IM3 => ARREADY_S13IM3,
            AWID_IS => AWID_IS13_gated,
            AWADDR_IS => AWADDR_IS13_gated,
            AWLEN_IS => AWLEN_IS13_gated,
            AWSIZE_IS => AWSIZE_IS13_gated,
            AWBURST_IS => AWBURST_IS13_gated,
            AWLOCK_IS => AWLOCK_IS13_gated,
            AWCACHE_IS => AWCACHE_IS13_gated,
            AWPROT_IS => AWPROT_IS13_gated,
            AWVALID_IS => AWVALID_IS13_gated,
            AWREADY_SI => AWREADY_SI13,
            RVALID_SI => RVALID_SI13,
            RLAST_SI => RLAST_SI13,
            RREADY_IS => RREADY_IS13_xhdl394,
            WID_IS => WID_IS13_gated,
            WDATA_IS => WDATA_IS13_gated,
            WSTRB_IS => WSTRB_IS13_gated,
            WLAST_IS => WLAST_IS13_gated,
            WVALID_IS => WVALID_IS13_gated,
            WREADY_SI => WREADY_SI13,
            ARID_IS => ARID_IS13_gated,
            ARADDR_IS => ARADDR_IS13_gated,
            ARLEN_IS => ARLEN_IS13_gated,
            ARSIZE_IS => ARSIZE_IS13_gated,
            ARBURST_IS => ARBURST_IS13_gated,
            ARLOCK_IS => ARLOCK_IS13_gated,
            ARCACHE_IS => ARCACHE_IS13_gated,
            ARPROT_IS => ARPROT_IS13_gated,
            ARVALID_IS => ARVALID_IS13_gated,
            ARREADY_SI => ARREADY_SI13,
            SLAVE_NUMBER => "01101");
   END GENERATE L24;
   
   L25: IF (((M0_SLAVE14ENABLE = 1 OR M1_SLAVE14ENABLE = 1 OR M2_SLAVE14ENABLE = 1 
   OR M3_SLAVE14ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE14ENABLE = 1 OR 
   M1_SLAVE14ENABLE = 1 OR M2_SLAVE14ENABLE = 1 OR M3_SLAVE14ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 0))) GENERATE
      -- <<X-HDL>> Can't find translated component 'matrix_s'. Port & generic names and types may not match. No template will be included
      inst_matrix_S14 : axi_matrix_s 
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
            AWADDR_IS_int => AWADDR_IS_int,
            ARADDR_IS_int => ARADDR_IS_int,
            gated_waddr => gated_waddr,
            gated_raddr => gated_raddr,
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
            m0_rd_end => m0_rd_end,
            m1_rd_end => m1_rd_end,
            m2_rd_end => m2_rd_end,
            m3_rd_end => m3_rd_end,
            m0_wr_end => m0_wr_end,
            m1_wr_end => m1_wr_end,
            m2_wr_end => m2_wr_end,
            m3_wr_end => m3_wr_end,
            AWID_MI0 => AWID_MI0,
            AWADDR_MI0 => AWADDR_MI0,
            AWLEN_MI0 => AWLEN_MI0,
            AWSIZE_MI0 => AWSIZE_MI0,
            AWBURST_MI0 => AWBURST_MI0,
            AWLOCK_MI0 => AWLOCK_MI0,
            AWCACHE_MI0 => AWCACHE_MI0,
            AWPROT_MI0 => AWPROT_MI0,
            AWVALID_MI0 => AWVALID_MI0,
            AWREADY_IM0 => AWREADY_S14IM0,
            WID_MI0 => WID_MI0,
            WDATA_MI0 => WDATA_MI0,
            WSTRB_MI0 => WSTRB_MI0,
            WLAST_MI0 => WLAST_MI0,
            WVALID_MI0 => WVALID_MI0,
            WREADY_IM0 => WREADY_S14IM0,
            ARID_MI0 => ARID_MI0,
            ARADDR_MI0 => ARADDR_MI0,
            ARLEN_MI0 => ARLEN_MI0,
            ARSIZE_MI0 => ARSIZE_MI0,
            ARBURST_MI0 => ARBURST_MI0,
            ARLOCK_MI0 => ARLOCK_MI0,
            ARCACHE_MI0 => ARCACHE_MI0,
            ARPROT_MI0 => ARPROT_MI0,
            ARVALID_MI0 => ARVALID_MI0,
            ARREADY_IM0 => ARREADY_S14IM0,
            AWID_MI1 => AWID_MI1,
            AWADDR_MI1 => AWADDR_MI1,
            AWLEN_MI1 => AWLEN_MI1,
            AWSIZE_MI1 => AWSIZE_MI1,
            AWBURST_MI1 => AWBURST_MI1,
            AWLOCK_MI1 => AWLOCK_MI1,
            AWCACHE_MI1 => AWCACHE_MI1,
            AWPROT_MI1 => AWPROT_MI1,
            AWVALID_MI1 => AWVALID_MI1,
            AWREADY_IM1 => AWREADY_S14IM1,
            WID_MI1 => WID_MI1,
            WDATA_MI1 => WDATA_MI1,
            WSTRB_MI1 => WSTRB_MI1,
            WLAST_MI1 => WLAST_MI1,
            WVALID_MI1 => WVALID_MI1,
            WREADY_IM1 => WREADY_S14IM1,
            ARID_MI1 => ARID_MI1,
            ARADDR_MI1 => ARADDR_MI1,
            ARLEN_MI1 => ARLEN_MI1,
            ARSIZE_MI1 => ARSIZE_MI1,
            ARBURST_MI1 => ARBURST_MI1,
            ARLOCK_MI1 => ARLOCK_MI1,
            ARCACHE_MI1 => ARCACHE_MI1,
            ARPROT_MI1 => ARPROT_MI1,
            ARVALID_MI1 => ARVALID_MI1,
            ARREADY_IM1 => ARREADY_S14IM1,
            AWID_MI2 => AWID_MI2,
            AWADDR_MI2 => AWADDR_MI2,
            AWLEN_MI2 => AWLEN_MI2,
            AWSIZE_MI2 => AWSIZE_MI2,
            AWBURST_MI2 => AWBURST_MI2,
            AWLOCK_MI2 => AWLOCK_MI2,
            AWCACHE_MI2 => AWCACHE_MI2,
            AWPROT_MI2 => AWPROT_MI2,
            AWVALID_MI2 => AWVALID_MI2,
            AWREADY_IM2 => AWREADY_S14IM2,
            WID_MI2 => WID_MI2,
            WDATA_MI2 => WDATA_MI2,
            WSTRB_MI2 => WSTRB_MI2,
            WLAST_MI2 => WLAST_MI2,
            WVALID_MI2 => WVALID_MI2,
            WREADY_IM2 => WREADY_S14IM2,
            ARID_MI2 => ARID_MI2,
            ARADDR_MI2 => ARADDR_MI2,
            ARLEN_MI2 => ARLEN_MI2,
            ARSIZE_MI2 => ARSIZE_MI2,
            ARBURST_MI2 => ARBURST_MI2,
            ARLOCK_MI2 => ARLOCK_MI2,
            ARCACHE_MI2 => ARCACHE_MI2,
            ARPROT_MI2 => ARPROT_MI2,
            ARVALID_MI2 => ARVALID_MI2,
            ARREADY_IM2 => ARREADY_S14IM2,
            AWID_MI3 => AWID_MI3,
            AWADDR_MI3 => AWADDR_MI3,
            AWLEN_MI3 => AWLEN_MI3,
            AWSIZE_MI3 => AWSIZE_MI3,
            AWBURST_MI3 => AWBURST_MI3,
            AWLOCK_MI3 => AWLOCK_MI3,
            AWCACHE_MI3 => AWCACHE_MI3,
            AWPROT_MI3 => AWPROT_MI3,
            AWVALID_MI3 => AWVALID_MI3,
            AWREADY_IM3 => AWREADY_S14IM3,
            WID_MI3 => WID_MI3,
            WDATA_MI3 => WDATA_MI3,
            WSTRB_MI3 => WSTRB_MI3,
            WLAST_MI3 => WLAST_MI3,
            WVALID_MI3 => WVALID_MI3,
            WREADY_IM3 => WREADY_S14IM3,
            ARID_MI3 => ARID_MI3,
            ARADDR_MI3 => ARADDR_MI3,
            ARLEN_MI3 => ARLEN_MI3,
            ARSIZE_MI3 => ARSIZE_MI3,
            ARBURST_MI3 => ARBURST_MI3,
            ARLOCK_MI3 => ARLOCK_MI3,
            ARCACHE_MI3 => ARCACHE_MI3,
            ARPROT_MI3 => ARPROT_MI3,
            ARVALID_MI3 => ARVALID_MI3,
            ARREADY_IM3 => ARREADY_S14IM3,
            AWID_IS => AWID_IS14_gated,
            AWADDR_IS => AWADDR_IS14_gated,
            AWLEN_IS => AWLEN_IS14_gated,
            AWSIZE_IS => AWSIZE_IS14_gated,
            AWBURST_IS => AWBURST_IS14_gated,
            AWLOCK_IS => AWLOCK_IS14_gated,
            AWCACHE_IS => AWCACHE_IS14_gated,
            AWPROT_IS => AWPROT_IS14_gated,
            AWVALID_IS => AWVALID_IS14_gated,
            AWREADY_SI => AWREADY_SI14,
            RVALID_SI => RVALID_SI14,
            RLAST_SI => RLAST_SI14,
            RREADY_IS => RREADY_IS14_xhdl419,
            WID_IS => WID_IS14_gated,
            WDATA_IS => WDATA_IS14_gated,
            WSTRB_IS => WSTRB_IS14_gated,
            WLAST_IS => WLAST_IS14_gated,
            WVALID_IS => WVALID_IS14_gated,
            WREADY_SI => WREADY_SI14,
            ARID_IS => ARID_IS14_gated,
            ARADDR_IS => ARADDR_IS14_gated,
            ARLEN_IS => ARLEN_IS14_gated,
            ARSIZE_IS => ARSIZE_IS14_gated,
            ARBURST_IS => ARBURST_IS14_gated,
            ARLOCK_IS => ARLOCK_IS14_gated,
            ARCACHE_IS => ARCACHE_IS14_gated,
            ARPROT_IS => ARPROT_IS14_gated,
            ARVALID_IS => ARVALID_IS14_gated,
            ARREADY_SI => ARREADY_SI14,
            SLAVE_NUMBER => "01110");
   END GENERATE L25;
   
   L26: IF (((M0_SLAVE15ENABLE = 1 OR M1_SLAVE15ENABLE = 1 OR M2_SLAVE15ENABLE = 1 
   OR M3_SLAVE15ENABLE = 1) AND (MEMSPACE > 0)) OR ((M0_SLAVE15ENABLE = 1 OR 
   M1_SLAVE15ENABLE = 1 OR M2_SLAVE15ENABLE = 1 OR M3_SLAVE15ENABLE = 1) AND 
   (MEMSPACE = 0 AND ADDR_HGS_CFG = 0))) GENERATE
      -- <<X-HDL>> Can't find translated component 'matrix_s'. Port & generic names and types may not match. No template will be included
      inst_matrix_S15 : axi_matrix_s 
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
            AWADDR_IS_int => AWADDR_IS_int,
            ARADDR_IS_int => ARADDR_IS_int,
            gated_waddr => gated_waddr,
            gated_raddr => gated_raddr,
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
            m0_rd_end => m0_rd_end,
            m1_rd_end => m1_rd_end,
            m2_rd_end => m2_rd_end,
            m3_rd_end => m3_rd_end,
            m0_wr_end => m0_wr_end,
            m1_wr_end => m1_wr_end,
            m2_wr_end => m2_wr_end,
            m3_wr_end => m3_wr_end,
            AWID_MI0 => AWID_MI0,
            AWADDR_MI0 => AWADDR_MI0,
            AWLEN_MI0 => AWLEN_MI0,
            AWSIZE_MI0 => AWSIZE_MI0,
            AWBURST_MI0 => AWBURST_MI0,
            AWLOCK_MI0 => AWLOCK_MI0,
            AWCACHE_MI0 => AWCACHE_MI0,
            AWPROT_MI0 => AWPROT_MI0,
            AWVALID_MI0 => AWVALID_MI0,
            AWREADY_IM0 => AWREADY_S15IM0,
            WID_MI0 => WID_MI0,
            WDATA_MI0 => WDATA_MI0,
            WSTRB_MI0 => WSTRB_MI0,
            WLAST_MI0 => WLAST_MI0,
            WVALID_MI0 => WVALID_MI0,
            WREADY_IM0 => WREADY_S15IM0,
            ARID_MI0 => ARID_MI0,
            ARADDR_MI0 => ARADDR_MI0,
            ARLEN_MI0 => ARLEN_MI0,
            ARSIZE_MI0 => ARSIZE_MI0,
            ARBURST_MI0 => ARBURST_MI0,
            ARLOCK_MI0 => ARLOCK_MI0,
            ARCACHE_MI0 => ARCACHE_MI0,
            ARPROT_MI0 => ARPROT_MI0,
            ARVALID_MI0 => ARVALID_MI0,
            ARREADY_IM0 => ARREADY_S15IM0,
            AWID_MI1 => AWID_MI1,
            AWADDR_MI1 => AWADDR_MI1,
            AWLEN_MI1 => AWLEN_MI1,
            AWSIZE_MI1 => AWSIZE_MI1,
            AWBURST_MI1 => AWBURST_MI1,
            AWLOCK_MI1 => AWLOCK_MI1,
            AWCACHE_MI1 => AWCACHE_MI1,
            AWPROT_MI1 => AWPROT_MI1,
            AWVALID_MI1 => AWVALID_MI1,
            AWREADY_IM1 => AWREADY_S15IM1,
            WID_MI1 => WID_MI1,
            WDATA_MI1 => WDATA_MI1,
            WSTRB_MI1 => WSTRB_MI1,
            WLAST_MI1 => WLAST_MI1,
            WVALID_MI1 => WVALID_MI1,
            WREADY_IM1 => WREADY_S15IM1,
            ARID_MI1 => ARID_MI1,
            ARADDR_MI1 => ARADDR_MI1,
            ARLEN_MI1 => ARLEN_MI1,
            ARSIZE_MI1 => ARSIZE_MI1,
            ARBURST_MI1 => ARBURST_MI1,
            ARLOCK_MI1 => ARLOCK_MI1,
            ARCACHE_MI1 => ARCACHE_MI1,
            ARPROT_MI1 => ARPROT_MI1,
            ARVALID_MI1 => ARVALID_MI1,
            ARREADY_IM1 => ARREADY_S15IM1,
            AWID_MI2 => AWID_MI2,
            AWADDR_MI2 => AWADDR_MI2,
            AWLEN_MI2 => AWLEN_MI2,
            AWSIZE_MI2 => AWSIZE_MI2,
            AWBURST_MI2 => AWBURST_MI2,
            AWLOCK_MI2 => AWLOCK_MI2,
            AWCACHE_MI2 => AWCACHE_MI2,
            AWPROT_MI2 => AWPROT_MI2,
            AWVALID_MI2 => AWVALID_MI2,
            AWREADY_IM2 => AWREADY_S15IM2,
            WID_MI2 => WID_MI2,
            WDATA_MI2 => WDATA_MI2,
            WSTRB_MI2 => WSTRB_MI2,
            WLAST_MI2 => WLAST_MI2,
            WVALID_MI2 => WVALID_MI2,
            WREADY_IM2 => WREADY_S15IM2,
            ARID_MI2 => ARID_MI2,
            ARADDR_MI2 => ARADDR_MI2,
            ARLEN_MI2 => ARLEN_MI2,
            ARSIZE_MI2 => ARSIZE_MI2,
            ARBURST_MI2 => ARBURST_MI2,
            ARLOCK_MI2 => ARLOCK_MI2,
            ARCACHE_MI2 => ARCACHE_MI2,
            ARPROT_MI2 => ARPROT_MI2,
            ARVALID_MI2 => ARVALID_MI2,
            ARREADY_IM2 => ARREADY_S15IM2,
            AWID_MI3 => AWID_MI3,
            AWADDR_MI3 => AWADDR_MI3,
            AWLEN_MI3 => AWLEN_MI3,
            AWSIZE_MI3 => AWSIZE_MI3,
            AWBURST_MI3 => AWBURST_MI3,
            AWLOCK_MI3 => AWLOCK_MI3,
            AWCACHE_MI3 => AWCACHE_MI3,
            AWPROT_MI3 => AWPROT_MI3,
            AWVALID_MI3 => AWVALID_MI3,
            AWREADY_IM3 => AWREADY_S15IM3,
            WID_MI3 => WID_MI3,
            WDATA_MI3 => WDATA_MI3,
            WSTRB_MI3 => WSTRB_MI3,
            WLAST_MI3 => WLAST_MI3,
            WVALID_MI3 => WVALID_MI3,
            WREADY_IM3 => WREADY_S15IM3,
            ARID_MI3 => ARID_MI3,
            ARADDR_MI3 => ARADDR_MI3,
            ARLEN_MI3 => ARLEN_MI3,
            ARSIZE_MI3 => ARSIZE_MI3,
            ARBURST_MI3 => ARBURST_MI3,
            ARLOCK_MI3 => ARLOCK_MI3,
            ARCACHE_MI3 => ARCACHE_MI3,
            ARPROT_MI3 => ARPROT_MI3,
            ARVALID_MI3 => ARVALID_MI3,
            ARREADY_IM3 => ARREADY_S15IM3,
            AWID_IS => AWID_IS15_gated,
            AWADDR_IS => AWADDR_IS15_gated,
            AWLEN_IS => AWLEN_IS15_gated,
            AWSIZE_IS => AWSIZE_IS15_gated,
            AWBURST_IS => AWBURST_IS15_gated,
            AWLOCK_IS => AWLOCK_IS15_gated,
            AWCACHE_IS => AWCACHE_IS15_gated,
            AWPROT_IS => AWPROT_IS15_gated,
            AWVALID_IS => AWVALID_IS15_gated,
            AWREADY_SI => AWREADY_SI15,
            RVALID_SI => RVALID_SI15,
            RLAST_SI => RLAST_SI15,
            RREADY_IS => RREADY_IS15_xhdl444,
            WID_IS => WID_IS15_gated,
            WDATA_IS => WDATA_IS15_gated,
            WSTRB_IS => WSTRB_IS15_gated,
            WLAST_IS => WLAST_IS15_gated,
            WVALID_IS => WVALID_IS15_gated,
            WREADY_SI => WREADY_SI15,
            ARID_IS => ARID_IS15_gated,
            ARADDR_IS => ARADDR_IS15_gated,
            ARLEN_IS => ARLEN_IS15_gated,
            ARSIZE_IS => ARSIZE_IS15_gated,
            ARBURST_IS => ARBURST_IS15_gated,
            ARLOCK_IS => ARLOCK_IS15_gated,
            ARCACHE_IS => ARCACHE_IS15_gated,
            ARPROT_IS => ARPROT_IS15_gated,
            ARVALID_IS => ARVALID_IS15_gated,
            ARREADY_SI => ARREADY_SI15,
            SLAVE_NUMBER => "01111");
   END GENERATE L26;
   
   L27: IF (((M0_SLAVE16ENABLE = 1 OR M1_SLAVE16ENABLE = 1 OR M2_SLAVE16ENABLE = 1 OR M3_SLAVE16ENABLE = 1) AND (MEMSPACE = 0)) OR 
            ((M0_SLAVE16ENABLE = 1 OR M1_SLAVE16ENABLE = 1 OR M2_SLAVE16ENABLE = 1 OR M3_SLAVE16ENABLE = 1) AND  
              (MEMSPACE > 0 AND (SC_0 = 1 OR SC_1 = 1 OR SC_2 = 1 OR SC_3 = 1 OR SC_4 = 1 OR SC_5 = 1 OR SC_6 = 1 OR SC_7 = 1 OR SC_8 = 1 OR SC_9 = 1 OR SC_10 = 1 OR SC_11 = 1 OR SC_12 = 1 OR SC_13 = 1 OR SC_14 = 1 OR SC_15 = 1) ))) GENERATE
      inst_matrix_S16 : axi_matrix_s 
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
            AWADDR_IS_int => AWADDR_IS_int,
            ARADDR_IS_int => ARADDR_IS_int,
            gated_waddr => gated_waddr,
            gated_raddr => gated_raddr,
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
            m0_rd_end => m0_rd_end,
            m1_rd_end => m1_rd_end,
            m2_rd_end => m2_rd_end,
            m3_rd_end => m3_rd_end,
            m0_wr_end => m0_wr_end,
            m1_wr_end => m1_wr_end,
            m2_wr_end => m2_wr_end,
            m3_wr_end => m3_wr_end,
            AWID_MI0 => AWID_MI0,
            AWADDR_MI0 => AWADDR_MI0,
            AWLEN_MI0 => AWLEN_MI0,
            AWSIZE_MI0 => AWSIZE_MI0,
            AWBURST_MI0 => AWBURST_MI0,
            AWLOCK_MI0 => AWLOCK_MI0,
            AWCACHE_MI0 => AWCACHE_MI0,
            AWPROT_MI0 => AWPROT_MI0,
            AWVALID_MI0 => AWVALID_MI0,
            AWREADY_IM0 => AWREADY_S16IM0,
            WID_MI0 => WID_MI0,
            WDATA_MI0 => WDATA_MI0,
            WSTRB_MI0 => WSTRB_MI0,
            WLAST_MI0 => WLAST_MI0,
            WVALID_MI0 => WVALID_MI0,
            WREADY_IM0 => WREADY_S16IM0,
            ARID_MI0 => ARID_MI0,
            ARADDR_MI0 => ARADDR_MI0,
            ARLEN_MI0 => ARLEN_MI0,
            ARSIZE_MI0 => ARSIZE_MI0,
            ARBURST_MI0 => ARBURST_MI0,
            ARLOCK_MI0 => ARLOCK_MI0,
            ARCACHE_MI0 => ARCACHE_MI0,
            ARPROT_MI0 => ARPROT_MI0,
            ARVALID_MI0 => ARVALID_MI0,
            ARREADY_IM0 => ARREADY_S16IM0,
            AWID_MI1 => AWID_MI1,
            AWADDR_MI1 => AWADDR_MI1,
            AWLEN_MI1 => AWLEN_MI1,
            AWSIZE_MI1 => AWSIZE_MI1,
            AWBURST_MI1 => AWBURST_MI1,
            AWLOCK_MI1 => AWLOCK_MI1,
            AWCACHE_MI1 => AWCACHE_MI1,
            AWPROT_MI1 => AWPROT_MI1,
            AWVALID_MI1 => AWVALID_MI1,
            AWREADY_IM1 => AWREADY_S16IM1,
            WID_MI1 => WID_MI1,
            WDATA_MI1 => WDATA_MI1,
            WSTRB_MI1 => WSTRB_MI1,
            WLAST_MI1 => WLAST_MI1,
            WVALID_MI1 => WVALID_MI1,
            WREADY_IM1 => WREADY_S16IM1,
            ARID_MI1 => ARID_MI1,
            ARADDR_MI1 => ARADDR_MI1,
            ARLEN_MI1 => ARLEN_MI1,
            ARSIZE_MI1 => ARSIZE_MI1,
            ARBURST_MI1 => ARBURST_MI1,
            ARLOCK_MI1 => ARLOCK_MI1,
            ARCACHE_MI1 => ARCACHE_MI1,
            ARPROT_MI1 => ARPROT_MI1,
            ARVALID_MI1 => ARVALID_MI1,
            ARREADY_IM1 => ARREADY_S16IM1,
            AWID_MI2 => AWID_MI2,
            AWADDR_MI2 => AWADDR_MI2,
            AWLEN_MI2 => AWLEN_MI2,
            AWSIZE_MI2 => AWSIZE_MI2,
            AWBURST_MI2 => AWBURST_MI2,
            AWLOCK_MI2 => AWLOCK_MI2,
            AWCACHE_MI2 => AWCACHE_MI2,
            AWPROT_MI2 => AWPROT_MI2,
            AWVALID_MI2 => AWVALID_MI2,
            AWREADY_IM2 => AWREADY_S16IM2,
            WID_MI2 => WID_MI2,
            WDATA_MI2 => WDATA_MI2,
            WSTRB_MI2 => WSTRB_MI2,
            WLAST_MI2 => WLAST_MI2,
            WVALID_MI2 => WVALID_MI2,
            WREADY_IM2 => WREADY_S16IM2,
            ARID_MI2 => ARID_MI2,
            ARADDR_MI2 => ARADDR_MI2,
            ARLEN_MI2 => ARLEN_MI2,
            ARSIZE_MI2 => ARSIZE_MI2,
            ARBURST_MI2 => ARBURST_MI2,
            ARLOCK_MI2 => ARLOCK_MI2,
            ARCACHE_MI2 => ARCACHE_MI2,
            ARPROT_MI2 => ARPROT_MI2,
            ARVALID_MI2 => ARVALID_MI2,
            ARREADY_IM2 => ARREADY_S16IM2,
            AWID_MI3 => AWID_MI3,
            AWADDR_MI3 => AWADDR_MI3,
            AWLEN_MI3 => AWLEN_MI3,
            AWSIZE_MI3 => AWSIZE_MI3,
            AWBURST_MI3 => AWBURST_MI3,
            AWLOCK_MI3 => AWLOCK_MI3,
            AWCACHE_MI3 => AWCACHE_MI3,
            AWPROT_MI3 => AWPROT_MI3,
            AWVALID_MI3 => AWVALID_MI3,
            AWREADY_IM3 => AWREADY_S16IM3,
            WID_MI3 => WID_MI3,
            WDATA_MI3 => WDATA_MI3,
            WSTRB_MI3 => WSTRB_MI3,
            WLAST_MI3 => WLAST_MI3,
            WVALID_MI3 => WVALID_MI3,
            WREADY_IM3 => WREADY_S16IM3,
            ARID_MI3 => ARID_MI3,
            ARADDR_MI3 => ARADDR_MI3,
            ARLEN_MI3 => ARLEN_MI3,
            ARSIZE_MI3 => ARSIZE_MI3,
            ARBURST_MI3 => ARBURST_MI3,
            ARLOCK_MI3 => ARLOCK_MI3,
            ARCACHE_MI3 => ARCACHE_MI3,
            ARPROT_MI3 => ARPROT_MI3,
            ARVALID_MI3 => ARVALID_MI3,
            ARREADY_IM3 => ARREADY_S16IM3,
            AWID_IS => AWID_IS16_gated,
            AWADDR_IS => AWADDR_IS16_gated,
            AWLEN_IS => AWLEN_IS16_gated,
            AWSIZE_IS => AWSIZE_IS16_gated,
            AWBURST_IS => AWBURST_IS16_gated,
            AWLOCK_IS => AWLOCK_IS16_gated,
            AWCACHE_IS => AWCACHE_IS16_gated,
            AWPROT_IS => AWPROT_IS16_gated,
            AWVALID_IS => AWVALID_IS16_gated,
            AWREADY_SI => AWREADY_SI16,
            RVALID_SI => RVALID_SI16,
            RLAST_SI => RLAST_SI16,
            RREADY_IS => RREADY_IS16_xhdl469,
            WID_IS => WID_IS16_gated,
            WDATA_IS => WDATA_IS16_gated,
            WSTRB_IS => WSTRB_IS16_gated,
            WLAST_IS => WLAST_IS16_gated,
            WVALID_IS => WVALID_IS16_gated,
            WREADY_SI => WREADY_SI16,
            ARID_IS => ARID_IS16_gated,
            ARADDR_IS => ARADDR_IS16_gated,
            ARLEN_IS => ARLEN_IS16_gated,
            ARSIZE_IS => ARSIZE_IS16_gated,
            ARBURST_IS => ARBURST_IS16_gated,
            ARLOCK_IS => ARLOCK_IS16_gated,
            ARCACHE_IS => ARCACHE_IS16_gated,
            ARPROT_IS => ARPROT_IS16_gated,
            ARVALID_IS => ARVALID_IS16_gated,
            ARREADY_SI => ARREADY_SI16,
            SLAVE_NUMBER => "10000");
   END GENERATE L27;
   
   

   -- **********************************************************************************
   -- ----------------------------------------------------------------------------------
   -- For WREADY selection
   -- ----------------------------------------------------------------------------------
   
   -- **********************************************************************************
   -- ----------------------------------------------------------------------------------
   -- For WREADY Selection
   -- ----------------------------------------------------------------------------------

   
   PROCESS (ACLK, areset_n)
   BEGIN
      IF (NOT areset_n = '1') THEN
         AWVALID_M0_r <= '0';    
         AWADDR_M0_r <= (OTHERS => '0');    
         AWVALID_M1_r <= '0';    
         AWADDR_M1_r <= (OTHERS => '0');    
         AWVALID_M2_r <= '0';    
         AWADDR_M2_r <= (OTHERS => '0');    
         AWVALID_M3_r <= '0';    
         AWADDR_M3_r <= (OTHERS => '0');    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
      IF (NOT sresetn = '1') THEN
         AWVALID_M0_r <= '0';    
         AWADDR_M0_r <= (OTHERS => '0');    
         AWVALID_M1_r <= '0';    
         AWADDR_M1_r <= (OTHERS => '0');    
         AWVALID_M2_r <= '0';    
         AWADDR_M2_r <= (OTHERS => '0');    
         AWVALID_M3_r <= '0';    
         AWADDR_M3_r <= (OTHERS => '0');    ELSE 
         AWVALID_M0_r <= AWVALID_M0;    
         AWADDR_M0_r <= AWADDR_M0;    
         AWVALID_M1_r <= AWVALID_M1;    
         AWADDR_M1_r <= AWADDR_M1;    
         AWVALID_M2_r <= AWVALID_M2;    
         AWADDR_M2_r <= AWADDR_M2;    
         AWVALID_M3_r <= AWVALID_M3;    
         AWADDR_M3_r <= AWADDR_M3;    
      END IF;
      END IF;
   END PROCESS;
   -- **********************************************************************************

END ARCHITECTURE translated;
