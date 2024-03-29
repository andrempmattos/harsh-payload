# Microsemi Corp.
# Date: 2021-Sep-07 12:26:46
# This file was generated based on the following SDC source files:
#   C:/Users/Sidney&Viviane/Documents/Andre/GitHub/harsh-payload/fpga_soc/component/work/top_sb/CCC_0/top_sb_CCC_0_FCCC.sdc
#   C:/Microsemi/Libero_SoC_v12.6/Designer/data/aPA4M/cores/constraints/coreresetp.sdc
#   C:/Users/Sidney&Viviane/Documents/Andre/GitHub/harsh-payload/fpga_soc/component/work/top_sb/FABOSC_0/top_sb_FABOSC_0_OSC.sdc
#   C:/Users/Sidney&Viviane/Documents/Andre/GitHub/harsh-payload/fpga_soc/component/work/top_sb/OSC_0/top_sb_OSC_0_OSC.sdc
#   C:/Users/Sidney&Viviane/Documents/Andre/GitHub/harsh-payload/fpga_soc/component/work/top_sb_MSS/top_sb_MSS.sdc
#   C:/Microsemi/Libero_SoC_v12.6/Designer/data/aPA4M/cores/constraints/sysreset.sdc
#

create_clock -name {top_sb_0/OSC_0/I_XTLOSC/CLKOUT} -period 83.3333 [ get_pins { top_sb_0/OSC_0/I_XTLOSC/CLKOUT } ]
create_clock -ignore_errors -name {top_sb_0/FABOSC_0/I_RCOSC_25_50MHZ/CLKOUT} -period 20 [ get_pins { top_sb_0/FABOSC_0/I_RCOSC_25_50MHZ/CLKOUT } ]
create_generated_clock -name {top_sb_0/CCC_0/GL2} -multiply_by 25 -divide_by 6 -source [ get_pins { top_sb_0/CCC_0/CCC_INST/XTLOSC } ] -phase 0 [ get_pins { top_sb_0/CCC_0/CCC_INST/GL2 } ]
set_false_path -ignore_errors -through [ get_nets { top_sb_0/CORERESETP_0/ddr_settled top_sb_0/CORERESETP_0/count_ddr_enable top_sb_0/CORERESETP_0/release_sdif*_core top_sb_0/CORERESETP_0/count_sdif*_enable } ]
set_false_path -ignore_errors -from [ get_cells { top_sb_0/CORERESETP_0/MSS_HPMS_READY_int } ] -to [ get_cells { top_sb_0/CORERESETP_0/sm0_areset_n_rcosc top_sb_0/CORERESETP_0/sm0_areset_n_rcosc_q1 } ]
set_false_path -ignore_errors -from [ get_cells { top_sb_0/CORERESETP_0/MSS_HPMS_READY_int top_sb_0/CORERESETP_0/SDIF*_PERST_N_re } ] -to [ get_cells { top_sb_0/CORERESETP_0/sdif*_areset_n_rcosc* } ]
set_false_path -ignore_errors -through [ get_nets { top_sb_0/CORERESETP_0/CONFIG1_DONE top_sb_0/CORERESETP_0/CONFIG2_DONE top_sb_0/CORERESETP_0/SDIF*_PERST_N top_sb_0/CORERESETP_0/SDIF*_PSEL top_sb_0/CORERESETP_0/SDIF*_PWRITE top_sb_0/CORERESETP_0/SDIF*_PRDATA[*] top_sb_0/CORERESETP_0/SOFT_EXT_RESET_OUT top_sb_0/CORERESETP_0/SOFT_RESET_F2M top_sb_0/CORERESETP_0/SOFT_M3_RESET top_sb_0/CORERESETP_0/SOFT_MDDR_DDR_AXI_S_CORE_RESET top_sb_0/CORERESETP_0/SOFT_FDDR_CORE_RESET top_sb_0/CORERESETP_0/SOFT_SDIF*_PHY_RESET top_sb_0/CORERESETP_0/SOFT_SDIF*_CORE_RESET top_sb_0/CORERESETP_0/SOFT_SDIF0_0_CORE_RESET top_sb_0/CORERESETP_0/SOFT_SDIF0_1_CORE_RESET } ]
set_false_path -ignore_errors -through [ get_pins { top_sb_0/top_sb_MSS_0/MSS_ADLIB_INST/CONFIG_PRESET_N } ]
set_false_path -ignore_errors -through [ get_pins { top_sb_0/SYSRESET_POR/POWER_ON_RESET_N } ]
