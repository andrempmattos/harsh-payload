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
-- Synchronizer - here clock and reset should be destination clock and reset
library ieee;
use     ieee.std_logic_1164.all;
use     ieee.std_logic_arith.all;
use     ieee.std_logic_unsigned.all;
use     ieee.std_logic_misc.all;


ENTITY Synchronizer_AXItoAHBHX IS
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
      Dout_1                  : OUT std_logic);   --  Output of Synchronizer into destination domain
END ENTITY Synchronizer_AXItoAHBHX;

ARCHITECTURE translated OF Synchronizer_AXItoAHBHX IS


   -------------------------------------------------------------------------------
   -- Register Declarations
   -------------------------------------------------------------------------------
   SIGNAL synchronizer_0           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL synchronizer_1           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL pre_sync_0_reg           :  std_logic;   
   SIGNAL pre_sync_1_reg           :  std_logic;   
   SIGNAL post_sync_0_reg          :  std_logic;   
   SIGNAL post_sync_1_reg          :  std_logic;   
   -------------------------------------------------------------------------------
   -- Wire Declarations
   -------------------------------------------------------------------------------
   SIGNAL sync_out_0               :  std_logic;   
   SIGNAL sync_out_1               :  std_logic;   
   SIGNAL Dout_0_xhdl1             :  std_logic;   
   SIGNAL Dout_1_xhdl2             :  std_logic;   

BEGIN
   Dout_0 <= Dout_0_xhdl1;
   Dout_1 <= Dout_1_xhdl2;

   --/////////////////////////////////////////////////////////////////////////////
   --                         Start-of-code                                     //
   --/////////////////////////////////////////////////////////////////////////////
   
   PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         pre_sync_0_reg <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         IF (Din_0 = '1') THEN
            pre_sync_0_reg <= NOT pre_sync_0_reg;    
         ELSE
            pre_sync_0_reg <= pre_sync_0_reg;    
         END IF;
      END IF;
   END PROCESS;

   PROCESS (HCLK, HRESETn)
   BEGIN
      IF (HRESETn = '0') THEN
         synchronizer_0(1 DOWNTO 0) <= "00";    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         synchronizer_0(1 DOWNTO 0) <= pre_sync_0_reg & synchronizer_0(1);    
      END IF;
   END PROCESS;
   sync_out_0 <= synchronizer_0(0) ;

   PROCESS (HCLK, HRESETn)
   BEGIN
      IF (HRESETn = '0') THEN
         post_sync_0_reg <= '0';    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         post_sync_0_reg <= sync_out_0;    
      END IF;
   END PROCESS;
   Dout_0_xhdl1 <= sync_out_0 XOR post_sync_0_reg ;

   ----------------------------------------------------------------------------
   ----------------------------------------------------------------------------
   
   PROCESS (ACLK, ARESETn)
   BEGIN
      IF (ARESETn = '0') THEN
         pre_sync_1_reg <= '0';    
      ELSIF (ACLK'EVENT AND ACLK = '1') THEN
         IF (Din_1 = '1') THEN
            pre_sync_1_reg <= NOT pre_sync_1_reg;    
         ELSE
            pre_sync_1_reg <= pre_sync_1_reg;    
         END IF;
      END IF;
   END PROCESS;

   PROCESS (HCLK, HRESETn)
   BEGIN
      IF (HRESETn = '0') THEN
         synchronizer_1(1 DOWNTO 0) <= "00";    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         synchronizer_1(1 DOWNTO 0) <= pre_sync_1_reg & synchronizer_1(1);    
      END IF;
   END PROCESS;
   sync_out_1 <= synchronizer_1(0) ;

   PROCESS (HCLK, HRESETn)
   BEGIN
      IF (HRESETn = '0') THEN
         post_sync_1_reg <= '0';    
      ELSIF (HCLK'EVENT AND HCLK = '1') THEN
         post_sync_1_reg <= sync_out_1;    
      END IF;
   END PROCESS;
   Dout_1_xhdl2 <= sync_out_1 XOR post_sync_1_reg ;

END ARCHITECTURE translated;
