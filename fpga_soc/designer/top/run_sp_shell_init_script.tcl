set_device \
    -family  SmartFusion2 \
    -die     PA4M1000_N \
    -package vf400 \
    -speed   -1 \
    -tempr   {COM} \
    -voltr   {COM}
set_def {VOLTAGE} {1.2}
set_def {VCCI_1.2_VOLTR} {COM}
set_def {VCCI_1.5_VOLTR} {COM}
set_def {VCCI_1.8_VOLTR} {COM}
set_def {VCCI_2.5_VOLTR} {COM}
set_def {VCCI_3.3_VOLTR} {COM}
set_def {PLL_SUPPLY} {PLL_SUPPLY_33}
set_def {VPP_SUPPLY_25_33} {VPP_SUPPLY_25}
set_def {PA4_URAM_FF_CONFIG} {SUSPEND}
set_def {PA4_SRAM_FF_CONFIG} {SUSPEND}
set_def {PA4_MSS_FF_CLOCK} {RCOSC_1MHZ}
set_def USE_CONSTRAINTS_FLOW 1
set_netlist -afl {C:\Users\lirmm2\Desktop\GitHub\HARSH\fpga_soc\designer\top\top.afl} -adl {C:\Users\lirmm2\Desktop\GitHub\HARSH\fpga_soc\designer\top\top.adl}
set_placement   {C:\Users\lirmm2\Desktop\GitHub\HARSH\fpga_soc\designer\top\top.loc}
set_routing     {C:\Users\lirmm2\Desktop\GitHub\HARSH\fpga_soc\designer\top\top.seg}
