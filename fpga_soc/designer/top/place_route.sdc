# Microsemi Corp.
# Date: 2021-Sep-07 12:45:43
# This file was generated based on the following SDC source files:
#   C:/Users/Sidney&Viviane/Documents/Andre/GitHub/harsh-payload/fpga_soc/constraint/top_derived_constraints.sdc
#

create_clock -name {top_sb_0/OSC_0/I_XTLOSC/CLKOUT} -period 83.3333 [ get_pins { top_sb_0/OSC_0/I_XTLOSC/CLKOUT } ]
create_generated_clock -name {top_sb_0/CCC_0/GL2} -multiply_by 25 -divide_by 6 -source [ get_pins { top_sb_0/CCC_0/CCC_INST/INST_CCC_IP/XTLOSC } ] -phase 0 [ get_pins { top_sb_0/CCC_0/CCC_INST/INST_CCC_IP/GL2 } ]
set_false_path -through [ get_pins { top_sb_0/top_sb_MSS_0/MSS_ADLIB_INST/INST_MSS_025_IP/CONFIG_PRESET_N } ]
set_false_path -through [ get_pins { top_sb_0/SYSRESET_POR/INST_SYSRESET_FF_IP/POWER_ON_RESET_N } ]
