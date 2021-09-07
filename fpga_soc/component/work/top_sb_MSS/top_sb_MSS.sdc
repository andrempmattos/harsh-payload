set_component top_sb_MSS
# Microsemi Corp.
# Date: 2021-Sep-07 12:25:38
#

create_clock -period 80 [ get_pins { MSS_ADLIB_INST/CLK_CONFIG_APB } ]
set_false_path -ignore_errors -through [ get_pins { MSS_ADLIB_INST/CONFIG_PRESET_N } ]
