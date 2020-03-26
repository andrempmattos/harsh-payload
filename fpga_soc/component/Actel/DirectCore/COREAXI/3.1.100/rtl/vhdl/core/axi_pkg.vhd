LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE axi_pkg IS
   FUNCTION SYNC_MODE_SEL (FAMILY: INTEGER) return INTEGER;
END;

PACKAGE BODY axi_pkg IS
    FUNCTION SYNC_MODE_SEL (FAMILY: INTEGER) RETURN INTEGER IS
       VARIABLE return_val: INTEGER := 0;
       BEGIN
          IF (FAMILY = 25) THEN
             return_val := 1;
          ELSE 
             return_val := 0;
          END IF;
          RETURN return_val;
    END SYNC_MODE_SEL;

END;



