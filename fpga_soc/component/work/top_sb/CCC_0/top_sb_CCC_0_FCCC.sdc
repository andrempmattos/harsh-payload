set_component top_sb_CCC_0_FCCC
# Microsemi Corp.
# Date: 2021-Sep-07 12:25:58
#

create_clock -period 83.3333 [ get_pins { CCC_INST/XTLOSC } ]
create_generated_clock -multiply_by 25 -divide_by 6 -source [ get_pins { CCC_INST/XTLOSC } ] -phase 0 [ get_pins { CCC_INST/GL2 } ]
