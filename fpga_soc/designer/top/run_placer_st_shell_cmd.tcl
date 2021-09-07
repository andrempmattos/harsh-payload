read_sdc -scenario "place_and_route" -netlist "optimized" -pin_separator "/" -ignore_errors {C:/Users/Sidney&Viviane/Documents/Andre/GitHub/harsh-payload/fpga_soc/designer/top/place_route.sdc}
set_options -tdpr_scenario "place_and_route" 
save
set_options -analysis_scenario "place_and_route"
report -type combinational_loops -format xml {C:\Users\Sidney&Viviane\Documents\Andre\GitHub\harsh-payload\fpga_soc\designer\top\top_layout_combinational_loops.xml}
report -type slack {C:\Users\Sidney&Viviane\Documents\Andre\GitHub\harsh-payload\fpga_soc\designer\top\pinslacks.txt}
set coverage [report \
    -type     constraints_coverage \
    -format   xml \
    -slacks   no \
    {C:\Users\Sidney&Viviane\Documents\Andre\GitHub\harsh-payload\fpga_soc\designer\top\top_place_and_route_constraint_coverage.xml}]
set reportfile {C:\Users\Sidney&Viviane\Documents\Andre\GitHub\harsh-payload\fpga_soc\designer\top\coverage_placeandroute}
set fp [open $reportfile w]
puts $fp $coverage
close $fp