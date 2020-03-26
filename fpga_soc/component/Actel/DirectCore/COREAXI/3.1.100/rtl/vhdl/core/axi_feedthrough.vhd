-- ****************************************************************************/
-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description: axi_feedthrough.v
-- This file is used in SingleMaster-Single Slave mode. It is only wire
-- connection betweem master and slave.
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
   use work.axi_pkg.all;


ENTITY axi_feedthrough IS
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
      -- SLAVE 0
-- AXI SLAVE 0 write address channel signals

      AWID_S0                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
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

      WID_S0                  : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      WDATA_S0                : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);  
      WSTRB_S0                : OUT std_logic_vector(AXI_DWIDTH/8 - 1 DOWNTO 0)
      ;   
      WLAST_S0                : OUT std_logic;   
      WVALID_S0               : OUT std_logic;   
      WREADY_S0               : IN std_logic;   
      -- AXI SLAVE 0 write response channel signals

      BID_S0                  : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      BRESP_S0                : IN std_logic_vector(1 DOWNTO 0);   
      BVALID_S0               : IN std_logic;   
      BREADY_S0               : OUT std_logic;   
      -- AXI SLAVE 0 read address channel signals

      ARID_S0                 : OUT std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
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

      RID_S0                  : IN std_logic_vector(BASE_ID_WIDTH + ID_WIDTH - 
      1 DOWNTO 0);   
      RDATA_S0                : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0);   
      RRESP_S0                : IN std_logic_vector(1 DOWNTO 0);   
      RLAST_S0                : IN std_logic;   
      RVALID_S0               : IN std_logic;   
      RREADY_S0               : OUT std_logic);   
END ENTITY axi_feedthrough;

ARCHITECTURE translated OF axi_feedthrough IS


   CONSTANT  AXI_STRBWIDTH         :  integer := AXI_DWIDTH / 8;    
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
   SIGNAL AWID_S0_xhdl12           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL AWADDR_S0_xhdl13         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL AWLEN_S0_xhdl14          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_S0_xhdl15         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_S0_xhdl16        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWLOCK_S0_xhdl17         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWCACHE_S0_xhdl18        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWPROT_S0_xhdl19         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWVALID_S0_xhdl20        :  std_logic;   
   SIGNAL WID_S0_xhdl21            :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL WDATA_S0_xhdl22          :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_S0_xhdl23          :  std_logic_vector(AXI_STRBWIDTH - 1 DOWNTO 
   0);   
   SIGNAL WLAST_S0_xhdl24          :  std_logic;   
   SIGNAL WVALID_S0_xhdl25         :  std_logic;   
   SIGNAL BREADY_S0_xhdl26         :  std_logic;   
   SIGNAL ARID_S0_xhdl27           :  std_logic_vector(BASE_ID_WIDTH + ID_WIDTH 
   - 1 DOWNTO 0);   
   SIGNAL ARADDR_S0_xhdl28         :  std_logic_vector(31 DOWNTO 0)
   ;   
   SIGNAL ARLEN_S0_xhdl29          :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_S0_xhdl30         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_S0_xhdl31        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_S0_xhdl32         :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARCACHE_S0_xhdl33        :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARPROT_S0_xhdl34         :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARVALID_S0_xhdl35        :  std_logic;   
   SIGNAL RREADY_S0_xhdl36         :  std_logic;   
   SIGNAL areset_n                  :  std_logic;   
   SIGNAL sresetn                  :  std_logic;   

BEGIN
   --///////////////////////////////////////////////////////////////////////////
   --                               Start - of - Code                         //
   --///////////////////////////////////////////////////////////////////////////
   areset_n   <= '1' WHEN (SYNC_RESET = 1) ELSE ARESETN;
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
   AWID_S0 <= AWID_S0_xhdl12;
   AWADDR_S0 <= AWADDR_S0_xhdl13;
   AWLEN_S0 <= AWLEN_S0_xhdl14;
   AWSIZE_S0 <= AWSIZE_S0_xhdl15;
   AWBURST_S0 <= AWBURST_S0_xhdl16;
   AWLOCK_S0 <= AWLOCK_S0_xhdl17;
   AWCACHE_S0 <= AWCACHE_S0_xhdl18;
   AWPROT_S0 <= AWPROT_S0_xhdl19;
   AWVALID_S0 <= AWVALID_S0_xhdl20;
   WID_S0 <= WID_S0_xhdl21;
   WDATA_S0 <= WDATA_S0_xhdl22;
   WSTRB_S0 <= WSTRB_S0_xhdl23;
   WLAST_S0 <= WLAST_S0_xhdl24;
   WVALID_S0 <= WVALID_S0_xhdl25;
   BREADY_S0 <= BREADY_S0_xhdl26;
   ARID_S0 <= ARID_S0_xhdl27;
   ARADDR_S0 <= ARADDR_S0_xhdl28;
   ARLEN_S0 <= ARLEN_S0_xhdl29;
   ARSIZE_S0 <= ARSIZE_S0_xhdl30;
   ARBURST_S0 <= ARBURST_S0_xhdl31;
   ARLOCK_S0 <= ARLOCK_S0_xhdl32;
   ARCACHE_S0 <= ARCACHE_S0_xhdl33;
   ARPROT_S0 <= ARPROT_S0_xhdl34;
   ARVALID_S0 <= ARVALID_S0_xhdl35;
   RREADY_S0 <= RREADY_S0_xhdl36;
   -- ************************************************************************//
   -- For Single Master - Single Slave Cfg and FEED_THROUGH = 1 --- Start     //  
   -- ************************************************************************//
   -- --------------------------------------------------------------------------
   -- This is feedthrough mode
   -- This is direct wire connection between the master and slave. It consumes no
   -- logic.
   -- --------------------------------------------------------------------------
   -- SLAVE 0
   -- AXI SLAVE 0 write address channel signals
   AWID_S0_xhdl12 <= "00" & AWID_M0 ;
   AWADDR_S0_xhdl13 <= AWADDR_M0 ;
   AWLEN_S0_xhdl14 <= AWLEN_M0 ;
   AWSIZE_S0_xhdl15 <= AWSIZE_M0 ;
   AWBURST_S0_xhdl16 <= AWBURST_M0 ;
   AWLOCK_S0_xhdl17 <= AWLOCK_M0 ;
   AWCACHE_S0_xhdl18 <= AWCACHE_M0 ;
   AWPROT_S0_xhdl19 <= AWPROT_M0 ;
   AWVALID_S0_xhdl20 <= AWVALID_M0 ;
   AWREADY_M0_xhdl1 <= AWREADY_S0 ;
   -- AXI SLAVE 0 write data channel signals
   WID_S0_xhdl21 <= "00" & WID_M0 ;
   WDATA_S0_xhdl22 <= WDATA_M0 ;
   WSTRB_S0_xhdl23 <= WSTRB_M0 ;
   WLAST_S0_xhdl24 <= WLAST_M0 ;
   WVALID_S0_xhdl25 <= WVALID_M0 ;
   WREADY_M0_xhdl2 <= WREADY_S0 ;
   -- AXI SLAVE 0 write response channel signals
   BID_M0_xhdl3 <= BID_S0(3 DOWNTO 0) ;
   BRESP_M0_xhdl4 <= BRESP_S0 ;
   BVALID_M0_xhdl5 <= BVALID_S0 ;
   BREADY_S0_xhdl26 <= BREADY_M0 ;
   -- AXI SLAVE 0 read address channel signals
   ARID_S0_xhdl27 <= "00" & ARID_M0 ;
   ARADDR_S0_xhdl28 <= ARADDR_M0 ;
   ARLEN_S0_xhdl29 <= ARLEN_M0 ;
   ARSIZE_S0_xhdl30 <= ARSIZE_M0 ;
   ARBURST_S0_xhdl31 <= ARBURST_M0 ;
   ARLOCK_S0_xhdl32 <= ARLOCK_M0 ;
   ARCACHE_S0_xhdl33 <= ARCACHE_M0 ;
   ARPROT_S0_xhdl34 <= ARPROT_M0 ;
   ARVALID_S0_xhdl35 <= ARVALID_M0 ;
   ARREADY_M0_xhdl6 <= ARREADY_S0 ;
   -- AXI SLAVE 0 read response channel signals
   RID_M0_xhdl7 <= RID_S0(3 DOWNTO 0) ;
   RDATA_M0_xhdl8 <= RDATA_S0 ;
   RRESP_M0_xhdl9 <= RRESP_S0 ;
   RLAST_M0_xhdl10 <= RLAST_S0 ;
   RVALID_M0_xhdl11 <= RVALID_S0 ;
   RREADY_S0_xhdl36 <= RREADY_M0 ;
   -- ************************************************************************//
   -- For Single Master - Single Slave Cfg and FEED_THROUGH = 1 --- End       //  
   -- ************************************************************************//

END ARCHITECTURE translated;
