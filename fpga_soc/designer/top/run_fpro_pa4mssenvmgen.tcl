set_device \
    -fam SmartFusion2 \
    -die PA4M1000_N \
    -pkg vf400
set_input_cfg \
	-path {C:/Users/lirmm2/Desktop/GitHub/HARSH/fpga_soc/component/work/top_sb_MSS/ENVM.cfg}
set_output_efc \
    -path {C:\Users\lirmm2\Desktop\GitHub\HARSH\fpga_soc\designer\top\top.efc}
set_proj_dir \
    -path {C:\Users\lirmm2\Desktop\GitHub\HARSH\fpga_soc}
gen_prg -use_init false
