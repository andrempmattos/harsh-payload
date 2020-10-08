----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Tue Oct 06 15:51:23 2020
-- Parameters for CORESDR_AXI
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant AUTO_PCH : integer := 0;
    constant CL : integer := 2;
    constant DELAY : integer := 10000;
    constant FAMILY : integer := 19;
    constant HDL_license : string( 1 to 1 ) := "U";
    constant MRD : integer := 2;
    constant RAS : integer := 5;
    constant RC : integer := 8;
    constant RCD : integer := 2;
    constant REF : integer := 8192;
    constant REGDIMM : integer := 0;
    constant RFC : integer := 8;
    constant RP : integer := 2;
    constant RRD : integer := 2;
    constant SDRAM_BANKSTATMODULES : integer := 4;
    constant SDRAM_CHIPBITS : integer := 2;
    constant SDRAM_CHIPS : integer := 3;
    constant SDRAM_COLBITS : integer := 10;
    constant SDRAM_DQSIZE : integer := 16;
    constant SDRAM_ROWBITS : integer := 13;
    constant testbench : string( 1 to 4 ) := "User";
    constant WR : integer := 2;
end coreparameters;
