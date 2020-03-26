set_family {SmartFusion2}
read_adl {C:\Users\lirmm2\Desktop\GitHub\HARSH\fpga_soc\designer\top\top.adl}
map_netlist
read_sdc {C:\Users\lirmm2\Desktop\GitHub\HARSH\fpga_soc\constraint\top_derived_constraints.sdc}
check_constraints {C:\Users\lirmm2\Desktop\GitHub\HARSH\fpga_soc\constraint\placer_sdc_errors.log}
write_sdc -strict {C:\Users\lirmm2\Desktop\GitHub\HARSH\fpga_soc\designer\top\place_route.sdc}
