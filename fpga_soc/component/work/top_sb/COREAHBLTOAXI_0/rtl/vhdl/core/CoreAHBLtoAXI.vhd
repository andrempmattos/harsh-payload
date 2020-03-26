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
ENTITY top_sb_COREAHBLTOAXI_0_COREAHBLTOAXI IS
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
      --RWM_EN                         :  integer := 0;    
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
END ENTITY top_sb_COREAHBLTOAXI_0_COREAHBLTOAXI;

ARCHITECTURE translated OF top_sb_COREAHBLTOAXI_0_COREAHBLTOAXI IS


   CONSTANT  AXI_WRSTB             :  integer := AXI_DWIDTH / 8;

    COMPONENT CoreAHBLtoAXI_AHBAccessControlHX
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
         HADDR                   : IN std_logic_vector(AHB_AWIDTH - 1 DOWNTO 0)
         ;   
         HWRITE                  : IN std_logic;   
         HREADY                  : IN std_logic;   
         HTRANS                  : IN std_logic_vector(1 DOWNTO 0);   
         HSIZE                   : IN std_logic_vector(2 DOWNTO 0);   
         HWDATA                  : IN std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
         ;   
         HBURST                  : IN std_logic_vector(2 DOWNTO 0);   
         HMASTLOCK               : IN std_logic;   
         BVALID_sync             : IN std_logic;   
         BRESP_sync              : IN std_logic_vector(1 DOWNTO 0);   
         wrch_fifo_full          : IN std_logic;   
         rdch_fifo_empty         : IN std_logic;   
         axi_read_rlast_sync     : IN std_logic;   
         RD_DATA                 : IN std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
         ;   
         -- Outputs on the AHBL Interface

         HREADYOUT               : OUT std_logic;   
         HRESP                   : OUT std_logic_vector(1 DOWNTO 0);   
         HRDATA                  : OUT std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
         ;   
         hwdata_r                : OUT std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
         ;   
         wrch_fifo_wr_en_r       : OUT std_logic;   
         rdch_fifo_rd_en_r       : OUT std_logic;   
         ahb_wr_done             : OUT std_logic;   
         ahb_rd_req              : OUT std_logic;   
         latch_ahb_sig           : OUT std_logic;   
         burst_count_r           : OUT std_logic_vector(3 DOWNTO 0);   
         burst_count_valid       : OUT std_logic;   
         HSEL_d                  : OUT std_logic;   
         HADDR_d                 : OUT std_logic_vector(AHB_AWIDTH - 1 DOWNTO 0)
         ;   
         HWRITE_d                : OUT std_logic;   
         HREADY_d                : OUT std_logic;   
         HTRANS_d                : OUT std_logic_vector(1 DOWNTO 0);   
         HSIZE_d                 : OUT std_logic_vector(2 DOWNTO 0);   
         HBURST_d                : OUT std_logic_vector(2 DOWNTO 0);   
         HMASTLOCK_d             : OUT std_logic;   
         valid_ahbcmd            : OUT std_logic;   
         ahb_busyidle_cyc        : OUT std_logic);
   END COMPONENT;
   COMPONENT CoreAHBLtoAXI_AXIAccessControlHX
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
         HADDR                   : IN std_logic_vector(AHB_AWIDTH - 1 DOWNTO 0)
         ;   
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
         axi_wr_data             : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         -- Outputs on AXI Interface

         AWID                    : OUT std_logic_vector(3 DOWNTO 0);   
         AWADDR                  : OUT std_logic_vector(AXI_AWIDTH - 1 DOWNTO 0)
         ;   
         AWLEN                   : OUT std_logic_vector(3 DOWNTO 0);   
         AWSIZE                  : OUT std_logic_vector(2 DOWNTO 0);   
         AWBURST                 : OUT std_logic_vector(1 DOWNTO 0);   
         AWLOCK                  : OUT std_logic_vector(1 DOWNTO 0);   
         AWVALID                 : OUT std_logic;   
         AWREADY                 : IN std_logic;   
         WID                     : OUT std_logic_vector(3 DOWNTO 0);   
         WDATA                   : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         WSTRB                   : OUT std_logic_vector(AXI_WRSTB - 1 DOWNTO 0)
         ;   
         WLAST                   : OUT std_logic;   
         WVALID                  : OUT std_logic;   
         WREADY                  : IN std_logic;   
         BREADY                  : OUT std_logic;   
         BID                     : IN std_logic_vector(3 DOWNTO 0);   
         BRESP                   : IN std_logic_vector(1 DOWNTO 0);   
         BVALID                  : IN std_logic;   
         ARID                    : OUT std_logic_vector(3 DOWNTO 0);   
         ARADDR                  : OUT std_logic_vector(AXI_AWIDTH - 1 DOWNTO 0)
         ;   
         ARLEN                   : OUT std_logic_vector(3 DOWNTO 0);   
         ARSIZE                  : OUT std_logic_vector(2 DOWNTO 0);   
         ARBURST                 : OUT std_logic_vector(1 DOWNTO 0);   
         ARLOCK                  : OUT std_logic_vector(1 DOWNTO 0);   
         ARVALID                 : OUT std_logic;   
         ARREADY                 : IN std_logic;   
         RREADY                  : OUT std_logic;   
         RID                     : IN std_logic_vector(3 DOWNTO 0);   
         RDATA                   : IN std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         RRESP                   : IN std_logic_vector(1 DOWNTO 0);   
         RLAST                   : IN std_logic;   
         RVALID                  : IN std_logic;   
         WRCH_fifo_rd_en         : OUT std_logic;   
         BRESP_sync              : OUT std_logic_vector(1 DOWNTO 0);   
         rdch_fifo_wr_en_r       : OUT std_logic;   
         rdch_fifo_wr_data       : OUT std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
         ;   
         axi_read_rlast          : OUT std_logic);
   END COMPONENT;

   COMPONENT Synchronizer_AXItoAHBHX
      PORT (
         -----------------------------------------------------
-- Input-Output Ports
-----------------------------------------------------

         ACLK                    : IN std_logic;   
         HCLK                    : IN std_logic;   
         ARESETn                 : IN std_logic;   
         HRESETn                 : IN std_logic;   
         Din_0                   : IN std_logic;   --  Input signal from source domain
         Dout_0                  : OUT std_logic;   --  Output of Synchronizer into destination domain
         Din_1                   : IN std_logic;   --  Input signal from source domain
         Dout_1                  : OUT std_logic);
   END COMPONENT;

   COMPONENT CoreAHBLtoAXI_reset_syncHX
      PORT (
         CLK                     : IN std_logic;   
         RESETINn                : IN std_logic;   
         RESETOUTn               : OUT std_logic);
   END COMPONENT;

   COMPONENT Synchronizer_AHBtoAXIHX
      PORT (
         -----------------------------------------------------
-- Input-Output Ports
-----------------------------------------------------

         CLK                     : IN std_logic;   
         rstn                    : IN std_logic;   
         Din_0                   : IN std_logic;   --  Input signal from source domain
         Dout_0                  : OUT std_logic;   --  Output of Synchronizer into destination domain
         Din_1                   : IN std_logic;   --  Input signal from source domain
         Dout_1                  : OUT std_logic;   --  Output of Synchronizer into destination domain
         Din_2                   : IN std_logic;   --  Input signal from source domain
         Dout_2                  : OUT std_logic;   --  Output of Synchronizer into destination domain
         Din_3                   : IN std_logic;   --  Input signal from source domain
         Dout_3                  : OUT std_logic);
   END COMPONENT;


   COMPONENT CoreAHBLtoAXI_WRCHANNELFIFOHX
      GENERIC (
         AHB_DWIDTH                     :  integer := 32;    
         --  AHB bus Data Width
         AXI_DWIDTH                     :  integer := 64;    
         --  AXI bus Data Width
         --  Address Width
         AWIDTH                         :  integer := 8);    
      PORT (
         --Inputs

         wrrst_n                 : IN std_logic;   
         wrclk                   : IN std_logic;   
         wrinr                   : IN std_logic;   
         wrdata                  : IN std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
         ;   
         rdrst_n                 : IN std_logic;   
         rdclk                   : IN std_logic;   
         rdinr                   : IN std_logic;   
         valid_ahbcmd            : IN std_logic;   
         ahb_busyidle_cyc        : IN std_logic;   
         --Outputs

         rddata                  : OUT std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
         ;   
         fifo_full               : OUT std_logic;   
         fifo_empty              : OUT std_logic);
   END COMPONENT;

   COMPONENT CoreAHBLtoAXI_RDCHANNELFIFOHX
      GENERIC (
         AHB_DWIDTH                     :  integer := 32;    
         --  AHB bus Data Width
         AXI_DWIDTH                     :  integer := 64;    
         --  AXI bus Data Width
         --  Address Width
         AWIDTH                         :  integer := 8);    
      PORT (
         --Inputs

         wrrst_n                 : IN std_logic;   
         wrclk                   : IN std_logic;   
         wrinr                   : IN std_logic;   
         wrdata                  : IN std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
         ;   
         rdrst_n                 : IN std_logic;   
         rdclk                   : IN std_logic;   
         rdinr                   : IN std_logic;   
         valid_ahbcmd            : IN std_logic;   
         --Outputs

         rddata                  : OUT std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
         ;   
         fifo_full               : OUT std_logic;   
         fifo_empty              : OUT std_logic);
   END COMPONENT;

   -------------------------------------------------------------------------------
   -- Wire Declarations
   -------------------------------------------------------------------------------
   SIGNAL wrch_axi_wr_data         :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL wrch_hwdata_r            :  std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL burst_count_r            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL BVALID_sync              :  std_logic;   
   SIGNAL BRESP_sync               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ahb_wr_done              :  std_logic;   
   SIGNAL ahb_wr_done_sync         :  std_logic;   
   SIGNAL ahb_rd_req               :  std_logic;   
   SIGNAL ahb_rd_req_sync          :  std_logic;   
   SIGNAL rdch_fifo_wr_data        :  std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL rdch_read_data           :  std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL axi_read_rlast           :  std_logic;   
   SIGNAL axi_read_rlast_sync      :  std_logic;   
   SIGNAL HSEL_d                   :  std_logic;   
   SIGNAL HADDR_d                  :  std_logic_vector(AHB_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL HWRITE_d                 :  std_logic;   
   SIGNAL HREADY_d                 :  std_logic;   
   SIGNAL HTRANS_d                 :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL HSIZE_d                  :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL HBURST_d                 :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL HMASTLOCK_d              :  std_logic;   
   SIGNAL wrch_fifo_empty          :  std_logic;   
   SIGNAL HRESET_n                 :  std_logic;   
   SIGNAL ARESET_n                 :  std_logic;   
   SIGNAL HREADYOUT_xhdl1          :  std_logic;   
   SIGNAL HRESP_xhdl2              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL HRDATA_xhdl3             :  std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL AWID_xhdl4               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWADDR_xhdl5             :  std_logic_vector(AXI_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL AWLEN_xhdl6              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL AWSIZE_xhdl7             :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL AWBURST_xhdl8            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL AWVALID_xhdl9            :  std_logic;   
   SIGNAL WID_xhdl10               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL WDATA_xhdl11             :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL WSTRB_xhdl12             :  std_logic_vector(AXI_WRSTB - 1 DOWNTO 0); 
   SIGNAL WLAST_xhdl13             :  std_logic;   
   SIGNAL WVALID_xhdl14            :  std_logic;   
   SIGNAL BREADY_xhdl15            :  std_logic;   
   SIGNAL ARID_xhdl16              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARADDR_xhdl17            :  std_logic_vector(AXI_AWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL ARLEN_xhdl18             :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL ARSIZE_xhdl19            :  std_logic_vector(2 DOWNTO 0);   
   SIGNAL ARBURST_xhdl20           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARLOCK_xhdl21            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ARVALID_xhdl22           :  std_logic;   
   SIGNAL RREADY_xhdl23            :  std_logic;   
   SIGNAL AWLOCK_xhdl24            :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL ahb_busyidle_cyc         :  std_logic;   
   SIGNAL burst_count_valid        :  std_logic;   
   SIGNAL burst_count_valid_sync   :  std_logic;   
   SIGNAL latch_ahb_sig            :  std_logic;   
   SIGNAL latch_ahb_sig_sync       :  std_logic;   
   SIGNAL rdch_fifo_empty          :  std_logic;   
   SIGNAL rdch_fifo_full           :  std_logic;   
   SIGNAL rdch_fifo_rd_en_r        :  std_logic;   
   SIGNAL rdch_fifo_wr_en_r        :  std_logic;   
   SIGNAL valid_ahbcmd             :  std_logic;   
   SIGNAL wrch_fifo_full           :  std_logic;   
   SIGNAL wrch_fifo_rd_en          :  std_logic;   
   SIGNAL wrch_fifo_wr_en_r        :  std_logic;   

BEGIN
   HREADYOUT <= HREADYOUT_xhdl1;
   HRESP <= HRESP_xhdl2;
   HRDATA <= HRDATA_xhdl3;
   AWID <= AWID_xhdl4;
   AWADDR <= AWADDR_xhdl5;
   AWLEN <= AWLEN_xhdl6;
   AWSIZE <= AWSIZE_xhdl7;
   AWBURST <= AWBURST_xhdl8;
   AWVALID <= AWVALID_xhdl9;
   WID <= WID_xhdl10;
   WDATA <= WDATA_xhdl11;
   WSTRB <= WSTRB_xhdl12;
   WLAST <= WLAST_xhdl13;
   WVALID <= WVALID_xhdl14;
   BREADY <= BREADY_xhdl15;
   ARID <= ARID_xhdl16;
   ARADDR <= ARADDR_xhdl17;
   ARLEN <= ARLEN_xhdl18;
   ARSIZE <= ARSIZE_xhdl19;
   ARBURST <= ARBURST_xhdl20;
   ARLOCK <= ARLOCK_xhdl21;
   ARVALID <= ARVALID_xhdl22;
   RREADY <= RREADY_xhdl23;
   AWLOCK <= AWLOCK_xhdl24;
   
   --/////////////////////////////////////////////////////////////////////////////
   --                         Start-of-code                                     //
   --/////////////////////////////////////////////////////////////////////////////
   -------------------------------------------------------------------------------
   -- AHB Access Control Block
   -------------------------------------------------------------------------------
   ---------------------------------------  
   -- AHB Access Control Interface details
   ---------------------------------------  
   -- INPUT signals
   -- OUTPUT signals
   U_AHBAccCntrl : CoreAHBLtoAXI_AHBAccessControlHX 
      GENERIC MAP (
         AHB_AWIDTH => AHB_AWIDTH,
         UNDEF_BURST => UNDEF_BURST,
         AHB_DWIDTH => AHB_DWIDTH,
         CLOCKS_ASYNC => CLOCKS_ASYNC)
      PORT MAP (
         HCLK => HCLK,
         HRESETn => HRESET_n,
         HSEL => HSEL,
         HADDR => HADDR,
         HWRITE => HWRITE,
         HREADY => HREADY,
         HTRANS => HTRANS,
         HSIZE => HSIZE,
         HWDATA => HWDATA,
         HBURST => HBURST,
         HMASTLOCK => HMASTLOCK,
         BVALID_sync => BVALID_sync,
         BRESP_sync => BRESP_sync,
         wrch_fifo_full => wrch_fifo_full,
         rdch_fifo_empty => rdch_fifo_empty,
         RD_DATA => rdch_read_data,
         axi_read_rlast_sync => axi_read_rlast_sync,
         HREADYOUT => HREADYOUT_xhdl1,
         HRESP => HRESP_xhdl2,
         HRDATA => HRDATA_xhdl3,
         hwdata_r => wrch_hwdata_r,
         wrch_fifo_wr_en_r => wrch_fifo_wr_en_r,
         rdch_fifo_rd_en_r => rdch_fifo_rd_en_r,
         ahb_wr_done => ahb_wr_done,
         ahb_rd_req => ahb_rd_req,
         latch_ahb_sig => latch_ahb_sig,
         burst_count_r => burst_count_r,
         burst_count_valid => burst_count_valid,
         HSEL_d => HSEL_d,
         HADDR_d => HADDR_d,
         HWRITE_d => HWRITE_d,
         HREADY_d => HREADY_d,
         HTRANS_d => HTRANS_d,
         HSIZE_d => HSIZE_d,
         HBURST_d => HBURST_d,
         HMASTLOCK_d => HMASTLOCK_d,
         valid_ahbcmd => valid_ahbcmd,
         ahb_busyidle_cyc => ahb_busyidle_cyc);   
   
   
   -------------------------------------------------------------------------------
   -- Write Channel Buffer Block 
   -------------------------------------------------------------------------------
   -- INPUT signals
   -- OUTPUT signals
   U_WrChannelFifo : CoreAHBLtoAXI_WRCHANNELFIFOHX 
      GENERIC MAP (
         AHB_DWIDTH => AHB_DWIDTH,
         AXI_DWIDTH => AXI_DWIDTH,
         AWIDTH => AHB_AWIDTH)
      PORT MAP (
         wrrst_n => HRESET_n,
         wrclk => HCLK,
         wrinr => wrch_fifo_wr_en_r,
         wrdata => wrch_hwdata_r,
         rdrst_n => ARESET_n,
         rdclk => ACLK,
         rdinr => wrch_fifo_rd_en,
         valid_ahbcmd => valid_ahbcmd,
         ahb_busyidle_cyc => ahb_busyidle_cyc,
         rddata => wrch_axi_wr_data,
         fifo_full => wrch_fifo_full,
         fifo_empty => wrch_fifo_empty);   
   
   
   -------------------------------------------------------------------------------
   -- Synchronize Signals from AHBL to AXI domain
   -------------------------------------------------------------------------------
   U_AHBtoAXI_sync : Synchronizer_AHBtoAXIHX 
      PORT MAP (
         CLK => ACLK,
         rstn => ARESET_n,
         Din_0 => ahb_wr_done,
         Dout_0 => ahb_wr_done_sync,
         Din_1 => latch_ahb_sig,
         Dout_1 => latch_ahb_sig_sync,
         Din_2 => burst_count_valid,
         Dout_2 => burst_count_valid_sync,
         Din_3 => ahb_rd_req,
         Dout_3 => ahb_rd_req_sync);   
   
   
   -------------------------------------------------------------------------------
   -- Synchronize Signals from AXI to AHBL domain
   -------------------------------------------------------------------------------
   U_AXItoAHB_sync : Synchronizer_AXItoAHBHX 
      PORT MAP (
         ACLK => ACLK,
         HCLK => HCLK,
         ARESETn => ARESET_n,
         HRESETn => HRESET_n,
         Din_0 => BVALID,
         Dout_0 => BVALID_sync,
         Din_1 => axi_read_rlast,
         Dout_1 => axi_read_rlast_sync);   
   
   
   -------------------------------------------------------------------------------
   -- AXI Access Control Block
   -------------------------------------------------------------------------------
   ---------------------------------------  
   -- AHB Interface details
   ---------------------------------------  
   -- INPUT signals
   ---------------------------------------  
   -- AXI Interface details
   ---------------------------------------  
   -- INPUT signals
   -- OUTPUT signals
   U_AXIAccCntrl : CoreAHBLtoAXI_AXIAccessControlHX 
      GENERIC MAP (
         AHB_AWIDTH => AHB_AWIDTH,
         UNDEF_BURST => UNDEF_BURST,
         AXI_AWIDTH => AXI_AWIDTH,
         AHB_DWIDTH => AHB_DWIDTH,
         AXI_DWIDTH => AXI_DWIDTH,
         CLOCKS_ASYNC => CLOCKS_ASYNC)
      PORT MAP (
         HSEL => HSEL_d,
         HADDR => HADDR_d,
         HWRITE => HWRITE_d,
         HREADY => HREADY_d,
         HTRANS => HTRANS_d,
         HSIZE => HSIZE_d,
         HBURST => HBURST_d,
         HMASTLOCK => HMASTLOCK_d,
         latch_ahb_sig_sync => latch_ahb_sig_sync,
         ahb_wr_done_sync => ahb_wr_done_sync,
         ahb_rd_req_sync => ahb_rd_req_sync,
         burst_count_r => burst_count_r,
         burst_count_valid_sync => burst_count_valid_sync,
         rdch_fifo_full => rdch_fifo_full,
         wrch_fifo_empty => wrch_fifo_empty,
         ACLK => ACLK,
         ARESETn => ARESET_n,
         AWREADY => AWREADY,
         WREADY => WREADY,
         BID => BID,
         BRESP => BRESP,
         BVALID => BVALID,
         ARREADY => ARREADY,
         RID => RID,
         RDATA => RDATA,
         RRESP => RRESP,
         RLAST => RLAST,
         RVALID => RVALID,
         axi_wr_data => wrch_axi_wr_data,
         AWID => AWID_xhdl4,
         AWADDR => AWADDR_xhdl5,
         AWLEN => AWLEN_xhdl6,
         AWSIZE => AWSIZE_xhdl7,
         AWBURST => AWBURST_xhdl8,
         AWVALID => AWVALID_xhdl9,
         WID => WID_xhdl10,
         WDATA => WDATA_xhdl11,
         WSTRB => WSTRB_xhdl12,
         WLAST => WLAST_xhdl13,
         WVALID => WVALID_xhdl14,
         BREADY => BREADY_xhdl15,
         ARID => ARID_xhdl16,
         ARADDR => ARADDR_xhdl17,
         ARLEN => ARLEN_xhdl18,
         ARSIZE => ARSIZE_xhdl19,
         ARBURST => ARBURST_xhdl20,
         ARLOCK => ARLOCK_xhdl21,
         ARVALID => ARVALID_xhdl22,
         RREADY => RREADY_xhdl23,
         AWLOCK => AWLOCK_xhdl24,
         WRCH_fifo_rd_en => wrch_fifo_rd_en,
         BRESP_sync => BRESP_sync,
         rdch_fifo_wr_en_r => rdch_fifo_wr_en_r,
         rdch_fifo_wr_data => rdch_fifo_wr_data,
         axi_read_rlast => axi_read_rlast);   
   
   
   -------------------------------------------------------------------------------
   -- Read Channel Buffer Block
   -------------------------------------------------------------------------------
   -- INPUT signals
   -- OUTPUT signals
   U_RdChannelFifo : CoreAHBLtoAXI_RDCHANNELFIFOHX 
      GENERIC MAP (
         AHB_DWIDTH => AHB_DWIDTH,
         AXI_DWIDTH => AXI_DWIDTH,
         AWIDTH => AHB_AWIDTH)
      PORT MAP (
         wrrst_n => ARESET_n,
         wrclk => ACLK,
         wrinr => rdch_fifo_wr_en_r,
         wrdata => rdch_fifo_wr_data,
         rdrst_n => HRESET_n,
         rdclk => HCLK,
         rdinr => rdch_fifo_rd_en_r,
         valid_ahbcmd => valid_ahbcmd,
         rddata => rdch_read_data,
         fifo_full => rdch_fifo_full,
         fifo_empty => rdch_fifo_empty);   
   
   
   -------------------------------------------------------------------------------
   -- Reset Synchronizer (asynchronous assert and synchronous de-assert)
   -------------------------------------------------------------------------------
   U_RST_H : CoreAHBLtoAXI_reset_syncHX 
      PORT MAP (
         CLK => HCLK,
         RESETINn => HRESETn,
         RESETOUTn => HRESET_n);   
   
   U_RST_A : CoreAHBLtoAXI_reset_syncHX 
      PORT MAP (
         CLK => ACLK,
         RESETINn => ARESETn,
         RESETOUTn => ARESET_n);   
   

END ARCHITECTURE translated;
