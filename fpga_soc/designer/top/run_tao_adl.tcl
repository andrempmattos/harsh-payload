set_device -family {SmartFusion2} -die {M2S025} -speed {STD}
read_adl {C:\Users\Sidney&Viviane\Documents\Andre\GitHub\harsh-payload\fpga_soc\designer\top\top.adl}
read_afl {C:\Users\Sidney&Viviane\Documents\Andre\GitHub\harsh-payload\fpga_soc\designer\top\top.afl}
map_netlist
read_sdc {C:\Users\Sidney&Viviane\Documents\Andre\GitHub\harsh-payload\fpga_soc\constraint\top_derived_constraints.sdc}
check_constraints {C:\Users\Sidney&Viviane\Documents\Andre\GitHub\harsh-payload\fpga_soc\constraint\placer_sdc_errors.log}
write_sdc -mode layout {C:\Users\Sidney&Viviane\Documents\Andre\GitHub\harsh-payload\fpga_soc\designer\top\place_route.sdc}
