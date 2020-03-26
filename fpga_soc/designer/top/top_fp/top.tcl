open_project -project {C:\Users\lirmm2\Desktop\GitHub\HARSH\fpga_soc\designer\top\top_fp\top.pro}
set_programming_file -name {M2S010} -file {C:\Users\lirmm2\Desktop\GitHub\HARSH\fpga_soc\designer\top\top.ipd}
enable_device -name {M2S010} -enable 1
set_programming_action -action {PROGRAM} -name {M2S010} 
run_selected_actions
set_programming_file -name {M2S010} -no_file
save_project
close_project
