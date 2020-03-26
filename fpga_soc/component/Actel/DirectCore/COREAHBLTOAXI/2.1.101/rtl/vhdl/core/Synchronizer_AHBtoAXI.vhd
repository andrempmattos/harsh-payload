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
-- Double Synchronizer - here clock and reset should be destination clock and reset
library ieee;
use     ieee.std_logic_1164.all;
use     ieee.std_logic_arith.all;
use     ieee.std_logic_unsigned.all;
use     ieee.std_logic_misc.all;

ENTITY Synchronizer_AHBtoAXIHX IS
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
      Dout_3                  : OUT std_logic);   --  Output of Synchronizer into destination domain
END ENTITY Synchronizer_AHBtoAXIHX;

ARCHITECTURE translated OF Synchronizer_AHBtoAXIHX IS


   -------------------------------------------------------------------------------
   -- Register Declarations
   -------------------------------------------------------------------------------
   SIGNAL synchronizer_0           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL synchronizer_1           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL synchronizer_2           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL synchronizer_3           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL Dout_0_xhdl1             :  std_logic;   
   SIGNAL Dout_1_xhdl2             :  std_logic;   
   SIGNAL Dout_2_xhdl3             :  std_logic;   
   SIGNAL Dout_3_xhdl4             :  std_logic;   

BEGIN
   Dout_0 <= Dout_0_xhdl1;
   Dout_1 <= Dout_1_xhdl2;
   Dout_2 <= Dout_2_xhdl3;
   Dout_3 <= Dout_3_xhdl4;

   --/////////////////////////////////////////////////////////////////////////////
   --                         Start-of-code                                     //
   --/////////////////////////////////////////////////////////////////////////////
   
   PROCESS (CLK, rstn)
   BEGIN
      IF (rstn = '0') THEN
         synchronizer_0(1 DOWNTO 0) <= "00";    
         synchronizer_1(1 DOWNTO 0) <= "00";    
         synchronizer_2(1 DOWNTO 0) <= "00";    
         synchronizer_3(1 DOWNTO 0) <= "00";    
      ELSIF (CLK'EVENT AND CLK = '1') THEN
         synchronizer_0(1 DOWNTO 0) <= Din_0 & synchronizer_0(1);    
         synchronizer_1(1 DOWNTO 0) <= Din_1 & synchronizer_1(1);    
         synchronizer_2(1 DOWNTO 0) <= Din_2 & synchronizer_2(1);    
         synchronizer_3(1 DOWNTO 0) <= Din_3 & synchronizer_3(1);    
      END IF;
   END PROCESS;
   Dout_0_xhdl1 <= synchronizer_0(0) ;
   Dout_1_xhdl2 <= synchronizer_1(0) ;
   Dout_2_xhdl3 <= synchronizer_2(0) ;
   Dout_3_xhdl4 <= synchronizer_3(0) ;

END ARCHITECTURE translated;
