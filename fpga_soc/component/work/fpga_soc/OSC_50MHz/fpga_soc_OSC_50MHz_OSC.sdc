set_component fpga_soc_OSC_50MHz_OSC
# Microsemi Corp.
# Date: 2020-Mar-24 11:06:05
#

create_clock -period 20 [ get_pins { I_RCOSC_25_50MHZ/CLKOUT } ]
