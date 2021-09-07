open_project -project {C:\Users\Sidney&Viviane\Documents\Andre\GitHub\harsh-payload\fpga_soc\designer\top\top_fp\top.pro}\
         -connect_programmers {FALSE}
load_programming_data \
    -name {M2S025} \
    -fpga {C:\Users\Sidney&Viviane\Documents\Andre\GitHub\harsh-payload\fpga_soc\designer\top\top.map} \
    -header {C:\Users\Sidney&Viviane\Documents\Andre\GitHub\harsh-payload\fpga_soc\designer\top\top.hdr} \
    -envm {C:\Users\Sidney&Viviane\Documents\Andre\GitHub\harsh-payload\fpga_soc\designer\top\top.efc} \
    -spm {C:\Users\Sidney&Viviane\Documents\Andre\GitHub\harsh-payload\fpga_soc\designer\top\top.spm} \
    -dca {C:\Users\Sidney&Viviane\Documents\Andre\GitHub\harsh-payload\fpga_soc\designer\top\top.dca}
export_single_ppd \
    -name {M2S025} \
    -file {D:/andre_tcc/job/tempExport\top.ppd}

save_project
close_project
