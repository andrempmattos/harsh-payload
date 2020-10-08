set_component top_sb_CCC_0_FCCC
# Microsemi Corp.
# Date: 2020-Oct-06 15:51:16
#

create_clock -period 83.3333 [ get_pins { CCC_INST/XTLOSC } ]
create_generated_clock -multiply_by 25 -divide_by 3 -source [ get_pins { CCC_INST/XTLOSC } ] -phase 0 [ get_pins { CCC_INST/GL2 } ]
