----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Thu Mar 26 22:06:35 2020
-- Parameters for COREAHBLTOAXI
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant AHB_AWIDTH : integer := 32;
    constant AHB_DWIDTH : integer := 32;
    constant AXI_AWIDTH : integer := 32;
    constant AXI_DWIDTH : integer := 64;
    constant CLOCKS_ASYNC : integer := 0;
    constant FAMILY : integer := 19;
    constant HDL_License : string( 1 to 1 ) := "U";
    constant Testbench : string( 1 to 4 ) := "User";
    constant UNDEF_BURST : integer := 0;
end coreparameters;
