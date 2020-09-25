read_sdc -scenario "place_and_route" -netlist "user" -pin_separator "/" -ignore_errors {C:/Users/Andre/Desktop/github/HARSH/fpga_soc/designer/top/place_route.sdc}
set_options -tdpr_scenario "place_and_route" 
save
set_options -analysis_scenario "place_and_route"
report -type combinational_loops -format xml {C:\Users\Andre\Desktop\github\HARSH\fpga_soc\designer\top\top_layout_combinational_loops.xml}
report -type slack {C:\Users\Andre\Desktop\github\HARSH\fpga_soc\designer\top\pinslacks.txt}
