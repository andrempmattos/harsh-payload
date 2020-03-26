set_component top_sb_CCC_0_FCCC
# Microsemi Corp.
# Date: 2020-Mar-26 22:06:34
#

create_clock -period 83.3333 [ get_pins { CCC_INST/CLK1_PAD } ]
create_generated_clock -multiply_by 25 -divide_by 3 -source [ get_pins { CCC_INST/CLK1_PAD } ] -phase 0 [ get_pins { CCC_INST/GL2 } ]
