-- Version: v12.6 12.900.20.24

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity top_sb_OSC_0_OSC is

    port( XTL                : in    std_logic;
          RCOSC_25_50MHZ_CCC : out   std_logic;
          RCOSC_25_50MHZ_O2F : out   std_logic;
          RCOSC_1MHZ_CCC     : out   std_logic;
          RCOSC_1MHZ_O2F     : out   std_logic;
          XTLOSC_CCC         : out   std_logic;
          XTLOSC_O2F         : out   std_logic
        );

end top_sb_OSC_0_OSC;

architecture DEF_ARCH of top_sb_OSC_0_OSC is 

  component XTLOSC
    generic (MODE:std_logic_vector(1 downto 0) := "11"; 
        FREQUENCY:real := 20.0);

    port( XTL    : in    std_logic := 'U';
          CLKOUT : out   std_logic
        );
  end component;


begin 


    I_XTLOSC : XTLOSC
      generic map(MODE => "11", FREQUENCY => 12.0)

      port map(XTL => XTL, CLKOUT => XTLOSC_CCC);
    

end DEF_ARCH; 
