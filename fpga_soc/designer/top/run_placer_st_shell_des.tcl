set_device \
    -family  SmartFusion2 \
    -die     PA4M2500_N \
    -package vf400 \
    -speed   STD \
    -tempr   {IND} \
    -voltr   {IND}
set_def {VOLTAGE} {1.2}
set_def {VCCI_1.2_VOLTR} {COM}
set_def {VCCI_1.5_VOLTR} {COM}
set_def {VCCI_1.8_VOLTR} {COM}
set_def {VCCI_2.5_VOLTR} {COM}
set_def {VCCI_3.3_VOLTR} {COM}
set_def {RTG4_MITIGATION_ON} {0}
set_def USE_CONSTRAINTS_FLOW 1
set_def NETLIST_TYPE EDIF
set_name top
set_workdir {C:\Users\Sidney&Viviane\Documents\Andre\GitHub\harsh-payload\fpga_soc\designer\top}
set_log     {C:\Users\Sidney&Viviane\Documents\Andre\GitHub\harsh-payload\fpga_soc\designer\top\top_sdc.log}
set_design_state pre_layout
