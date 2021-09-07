set_device \
    -fam SmartFusion2 \
    -die PA4M2500_N \
    -pkg vf400
set_input_cfg \
	-path {C:/Users/Sidney&Viviane/Documents/Andre/GitHub/harsh-payload/fpga_soc/component/work/top_sb_MSS/ENVM.cfg}
set_output_efc \
    -path {C:\Users\Sidney&Viviane\Documents\Andre\GitHub\harsh-payload\fpga_soc\designer\top\top.efc}
set_proj_dir \
    -path {C:\Users\Sidney&Viviane\Documents\Andre\GitHub\harsh-payload\fpga_soc}
set_is_relative_path \
    -value {FALSE}
set_root_path_dir \
    -path {}
gen_prg -use_init false
