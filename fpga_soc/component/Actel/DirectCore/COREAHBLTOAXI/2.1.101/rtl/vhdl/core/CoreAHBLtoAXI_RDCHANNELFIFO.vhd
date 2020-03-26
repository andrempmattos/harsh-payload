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
-- Notes: Read Channel Asynchronous fifo implementation
--
-- *********************************************************************/

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.std_logic_arith.all;
use     ieee.std_logic_unsigned.all;
use     ieee.std_logic_misc.all;

ENTITY CoreAHBLtoAXI_RDCHANNELFIFOHX IS
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
      wrdata                  : IN std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0);   
      rdrst_n                 : IN std_logic;   
      rdclk                   : IN std_logic;   
      rdinr                   : IN std_logic;   
      valid_ahbcmd            : IN std_logic;   
      --Outputs

      rddata                  : OUT std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0);  
      fifo_full               : OUT std_logic;   
      fifo_empty              : OUT std_logic);   
END ENTITY CoreAHBLtoAXI_RDCHANNELFIFOHX;

ARCHITECTURE translated OF CoreAHBLtoAXI_RDCHANNELFIFOHX IS
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

   FUNCTION ShiftLeft (
      val      : std_logic_vector;
      shft     : integer) RETURN std_logic_vector IS
      
      VARIABLE int      : std_logic_vector(val'LENGTH+shft-1 DOWNTO 0);
      VARIABLE rtn      : std_logic_vector(val'RANGE);
      VARIABLE fill     : std_logic_vector(shft-1 DOWNTO 0) := (others => '0');
   BEGIN
      int := val & fill;
      rtn := int(val'LENGTH-1 DOWNTO 0);
      RETURN(rtn);
   END ShiftLeft;    

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

   COMPONENT CoreAHBLtoAXI_rdch_ramHX
      GENERIC (
         -----------------------------------------------------
         -- Global parameters
         -----------------------------------------------------
         ADDR_BIT                       :  integer := 32;    
         WR_DATA_BIT                    :  integer := 32;    
         RD_DATA_BIT                    :  integer := 32);    
--         RAM_AWIDTH                     :  integer := to_integer(CONV_STD_LOGIC(FDEPTH) SRL 2));    
      PORT (
         -----------------------------------------------------
-- Input-Output Ports
-----------------------------------------------------

         WCLK                    : IN std_logic;   
         RCLK                    : IN std_logic;   
         WAddr                   : IN std_logic_vector(3 DOWNTO 0);   
         RAddr                   : IN std_logic_vector(3 DOWNTO 0);   
         We1                     : IN std_logic;   
         Re1                     : IN std_logic;   
         Wfull                   : IN std_logic;   
         Rempty                  : IN std_logic;   
         Wdata                   : IN std_logic_vector(WR_DATA_BIT - 1 DOWNTO 0)
         ;   
         Rdata                   : OUT std_logic_vector(RD_DATA_BIT - 1 DOWNTO 
         0));
   END COMPONENT;

   -------------------------------------------------------------------------------
   -- Register Declarations
   -------------------------------------------------------------------------------
   SIGNAL rbinaddr                 :  std_logic_vector(AWIDTH DOWNTO 0);   
   SIGNAL raddr_gray               :  std_logic_vector(AWIDTH DOWNTO 0);   --  Gray read address goes to write logic
   SIGNAL wbinaddr                 :  std_logic_vector(AWIDTH DOWNTO 0);   
   SIGNAL waddr_gray               :  std_logic_vector(AWIDTH DOWNTO 0);   --  Gray write address goes to read logic
   SIGNAL wsync1_rptr              :  std_logic_vector(AWIDTH DOWNTO 0);   
   SIGNAL wsync2_rptr              :  std_logic_vector(AWIDTH DOWNTO 0);   --  Synchronized read pointer in write domain
   SIGNAL rsync1_wptr              :  std_logic_vector(AWIDTH DOWNTO 0);   
   SIGNAL rsync2_wptr              :  std_logic_vector(AWIDTH DOWNTO 0);   --  Synchronized write pointer in read domain
   -------------------------------------------------------------------------------
   -- Wire Declarations
   -------------------------------------------------------------------------------
   SIGNAL rden_1                   :  std_logic;   
   SIGNAL raddr                    :  std_logic_vector(AWIDTH - 1 DOWNTO 0);   --  Read binary address goes to RAM
   SIGNAL rgraynext                :  std_logic_vector(AWIDTH DOWNTO 0);   
   SIGNAL rbinnext                 :  std_logic_vector(AWIDTH DOWNTO 0);   
   SIGNAL waddr                    :  std_logic_vector(AWIDTH - 1 DOWNTO 0);   --  Write binary address goes to RAM
   SIGNAL wgraynext                :  std_logic_vector(AWIDTH DOWNTO 0);   
   SIGNAL wbinnext                 :  std_logic_vector(AWIDTH DOWNTO 0);   
   SIGNAL writefull                :  std_logic;   
   SIGNAL wren_1                   :  std_logic;   
   SIGNAL rddata_c                 :  std_logic_vector(AXI_DWIDTH - 1 DOWNTO 0)
   ;   
   -------------------------------------------------------------------------------
   -- Instantiate RAM module
   -------------------------------------------------------------------------------
   ---------------------------------------  
   -- RAM Interface details
   ---------------------------------------  
   -- INPUT signals
   -- OUTPUT signals
   SIGNAL port_xhdl6               :  std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL port_xhdl7               :  std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL rddata_xhdl1             :  std_logic_vector(AHB_DWIDTH - 1 DOWNTO 0)
   ;   
   SIGNAL fifo_full_xhdl2          :  std_logic;   
   SIGNAL fifo_empty_xhdl3         :  std_logic;   

BEGIN
   rddata <= rddata_xhdl1;
   fifo_full <= fifo_full_xhdl2;
   fifo_empty <= fifo_empty_xhdl3;

   --/////////////////////////////////////////////////////////////////////////////
   --                         Start-of-code                                     //
   --/////////////////////////////////////////////////////////////////////////////
   -------------------------------------------------------------------------------
   -- Read Pointer Generation
   -- Read pointer is a dual n-bit gray code counter. The n-bit pointer is passed
   -- to the write clock domain through double synchronizer. n-1 bit pointer is
   -- used to address the fifo buffer.
   -------------------------------------------------------------------------------
   
   Read_Bin_Ptr : PROCESS (rdclk, rdrst_n)
   BEGIN
      IF (rdrst_n = '0') THEN
         rbinaddr <= (OTHERS => '0');    
      ELSIF (rdclk'EVENT AND rdclk = '1') THEN
         IF (valid_ahbcmd = '1') THEN
            rbinaddr <= (OTHERS => '0');    
         ELSE
            rbinaddr <= rbinnext(AWIDTH DOWNTO 0);    
         END IF;
      END IF;
   END PROCESS Read_Bin_Ptr;
   raddr <= rbinaddr(AWIDTH - 1 DOWNTO 0) ;
   rbinnext <= rbinaddr + (rdinr AND NOT fifo_empty_xhdl3) ;
   rgraynext <= (ShiftRight(rbinnext, 1)) XOR rbinnext ;

   Read_Gray_Ptr : PROCESS (rdclk, rdrst_n)
   BEGIN
      IF (rdrst_n = '0') THEN
         raddr_gray <= (OTHERS => '0');    
      ELSIF (rdclk'EVENT AND rdclk = '1') THEN
         raddr_gray <= rgraynext(AWIDTH DOWNTO 0);    
      END IF;
   END PROCESS Read_Gray_Ptr;

   -------------------------------------------------------------------------------
   -- Write Pointer Generation
   -- Write pointer is a dual n-bit gray code counter. The n-bit pointer is passed
   -- to the read clock domain through double synchronizer. n-1 bit pointer is
   -- used to address the fifo buffer.
   -------------------------------------------------------------------------------
   
   Write_Bin_Ptr : PROCESS (wrclk, wrrst_n)
   BEGIN
      IF (wrrst_n = '0') THEN
         wbinaddr <= (OTHERS => '0');    
      ELSIF (wrclk'EVENT AND wrclk = '1') THEN
         IF (valid_ahbcmd = '1') THEN
            wbinaddr <= (OTHERS => '0');    
         ELSE
            wbinaddr <= wbinnext(AWIDTH DOWNTO 0);    
         END IF;
      END IF;
   END PROCESS Write_Bin_Ptr;
   waddr <= wbinaddr(AWIDTH - 1 DOWNTO 0) ;
   wbinnext <= wbinaddr + (wrinr AND NOT fifo_full_xhdl2) ;
   wgraynext <= (ShiftRight(wbinnext, 1)) XOR wbinnext ;

   Write_Gray_Ptr : PROCESS (wrclk, wrrst_n)
   BEGIN
      IF (wrrst_n = '0') THEN
         waddr_gray <= (OTHERS => '0');    
      ELSIF (wrclk'EVENT AND wrclk = '1') THEN
         waddr_gray <= wgraynext(AWIDTH DOWNTO 0);    
      END IF;
   END PROCESS Write_Gray_Ptr;
   -------------------------------------------------------------------------------
   -- Read and Write enable generation for RAM.
   -------------------------------------------------------------------------------
   wren_1 <= wrinr ;
   rden_1 <= rdinr ;

   -------------------------------------------------------------------------------
   -- Synchronize Read gray pointer into Write domain
   -------------------------------------------------------------------------------
   
   Sync_Read_Ptr : PROCESS (wrclk, wrrst_n)
   BEGIN
      IF (wrrst_n = '0') THEN
         wsync1_rptr <= (OTHERS => '0');    
         wsync2_rptr <= (OTHERS => '0');    
      ELSIF (wrclk'EVENT AND wrclk = '1') THEN
         wsync1_rptr <= raddr_gray(AWIDTH DOWNTO 0);    
         wsync2_rptr <= wsync1_rptr;    
      END IF;
   END PROCESS Sync_Read_Ptr;

   -------------------------------------------------------------------------------
   -- Synchronize Write gray pointer into Read domain
   -------------------------------------------------------------------------------
   
   Sync_Write_Ptr : PROCESS (rdclk, rdrst_n)
   BEGIN
      IF (rdrst_n = '0') THEN
         rsync1_wptr <= (OTHERS => '0');    
         rsync2_wptr <= (OTHERS => '0');    
      ELSIF (rdclk'EVENT AND rdclk = '1') THEN
         rsync1_wptr <= waddr_gray(AWIDTH DOWNTO 0);    
         rsync2_wptr <= rsync1_wptr;    
      END IF;
   END PROCESS Sync_Write_Ptr;

   -------------------------------------------------------------------------------
   -- FIFO empty when the next read pointer equals the synchronized write pointer
   -- or on reset
   -------------------------------------------------------------------------------
   
   Gen_Empty : PROCESS (rdclk, rdrst_n)
   BEGIN
      IF (rdrst_n = '0') THEN
         fifo_empty_xhdl3 <= '1';    
      ELSIF (rdclk'EVENT AND rdclk = '1') THEN
         fifo_empty_xhdl3 <= CONV_STD_LOGIC(rgraynext = rsync2_wptr);    
      END IF;
   END PROCESS Gen_Empty;
   -------------------------------------------------------------------------------
   -- Three conditions are necessary for fifo to be full:
   -- 1) write pointer and synchronized read pointer MSB's are not equal
   -- 2) wirte pointer and synchronized read pointer 2nd MSB's are not equal
   -- 3) all other bits of write pointer and synchronized write pointer must be equal
   -------------------------------------------------------------------------------
   writefull <= CONV_STD_LOGIC(((wgraynext(AWIDTH) /= wsync2_rptr(AWIDTH)) AND 
   (wgraynext(AWIDTH - 1) /= wsync2_rptr(AWIDTH - 1))) AND (wgraynext(AWIDTH - 
   2 DOWNTO 0) = wsync2_rptr(AWIDTH - 2 DOWNTO 0))) ;

   Gen_Full : PROCESS (rdclk, rdrst_n)
   BEGIN
      IF (rdrst_n = '0') THEN
         fifo_full_xhdl2 <= '0';    
      ELSIF (rdclk'EVENT AND rdclk = '1') THEN
         fifo_full_xhdl2 <= writefull;    
      END IF;
   END PROCESS Gen_Full;
   port_xhdl6 <= wrdata(AHB_DWIDTH - 1 DOWNTO 0);
   rddata_c(AHB_DWIDTH - 1 DOWNTO 0) <= port_xhdl7;
   U_RDCH_RAM : CoreAHBLtoAXI_rdch_ramHX 
      GENERIC MAP (
         ADDR_BIT => AWIDTH,
         RD_DATA_BIT => AHB_DWIDTH,
         WR_DATA_BIT => AHB_DWIDTH)
      PORT MAP (
         WCLK => wrclk,
         RCLK => rdclk,
         WAddr => waddr(3 DOWNTO 0),
         RAddr => raddr(3 DOWNTO 0),
         We1 => wren_1,
         Re1 => rden_1,
         Wfull => fifo_full_xhdl2,
         Rempty => fifo_empty_xhdl3,
         Wdata => port_xhdl6,
         Rdata => port_xhdl7);   
   
   rddata_xhdl1(AHB_DWIDTH - 1 DOWNTO 0) <= rddata_c(AHB_DWIDTH - 1 DOWNTO 0) 
   ;

END ARCHITECTURE translated;
