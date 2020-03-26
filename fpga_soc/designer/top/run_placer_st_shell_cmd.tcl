read_sdc -scenario "place_and_route" -netlist "user" -pin_separator "/" -ignore_errors {C:/Users/lirmm2/Desktop/GitHub/HARSH/fpga_soc/designer/top/place_route.sdc}
set_options -tdpr_scenario "place_and_route" 
save
set_options -analysis_scenario "place_and_route"
report -type combinational_loops -format xml {C:\Users\lirmm2\Desktop\GitHub\HARSH\fpga_soc\designer\top\top_layout_combinational_loops.xml}
report -type slack {C:\Users\lirmm2\Desktop\GitHub\HARSH\fpga_soc\designer\top\pinslacks.txt}
