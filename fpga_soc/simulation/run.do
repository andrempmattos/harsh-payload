quietly set ACTELLIBNAME SmartFusion2
quietly set PROJECT_DIR "C:/Users/lirmm2/Desktop/GitHub/HARSH/fpga_soc"
source "${PROJECT_DIR}/simulation/CM3_compile_bfm.tcl";
source "${PROJECT_DIR}/simulation/bfmtovec_compile.tcl";

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap SmartFusion2 "C:/Microsemi/Libero_SoC_v11.8/Designer/lib/modelsim/precompiled/vlog/SmartFusion2"
vmap COREAHBLITE_LIB "../component/Actel/DirectCore/CoreAHBLite/5.4.102/mti/user_vlog/COREAHBLITE_LIB"
vcom -work COREAHBLITE_LIB -force_refresh
vlog -work COREAHBLITE_LIB -force_refresh

vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORESDR_AHB/4.3.100/rtl/vlog/core/pll_2x_smartfusion2.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORESDR_AHB/4.3.100/rtl/vlog/core/pll_4x_smartfusion2.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORESDR_AHB/4.3.100/rtl/vlog/core/coresdrahb_openbank.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORESDR_AHB/4.3.100/rtl/vlog/core/coresdrahb_fastsdram.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORESDR_AHB/4.3.100/rtl/vlog/core/coresdrahb_fastinit.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/Actel/DirectCore/CORESDR_AHB/4.3.100/rtl/vlog/core/coresdrahb_coresdr.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/fpga_soc/Controller_SDRAM_AHB/rtl/vlog/core/coresdrahb_coresdr_ahb.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/fpga_soc/FCCC_100MHz/fpga_soc_FCCC_100MHz_FCCC.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/fpga_soc_MSS/fpga_soc_MSS.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/fpga_soc/OSC_50MHz/fpga_soc_OSC_50MHz_OSC.v"
vlog -vlog01compat -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.4.102/rtl/vlog/core/coreahblite_addrdec.v"
vlog -vlog01compat -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.4.102/rtl/vlog/core/coreahblite_defaultslavesm.v"
vlog -vlog01compat -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.4.102/rtl/vlog/core/coreahblite_masterstage.v"
vlog -vlog01compat -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.4.102/rtl/vlog/core/coreahblite_slavearbiter.v"
vlog -vlog01compat -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.4.102/rtl/vlog/core/coreahblite_slavestage.v"
vlog -vlog01compat -work COREAHBLITE_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAHBLite/5.4.102/rtl/vlog/core/coreahblite_matrix4x16.v"
vlog -vlog01compat -work COREAHBLITE_LIB "${PROJECT_DIR}/component/work/fpga_soc/CoreAHBLite_Interface/rtl/vlog/core/coreahblite.v"
vlog -vlog01compat -work presynth "${PROJECT_DIR}/component/work/fpga_soc/fpga_soc.v"
vlog "+incdir+${PROJECT_DIR}/component/work/fpga_soc/Controller_SDRAM_AHB/rtl/vlog" "+incdir+${PROJECT_DIR}/component/work/fpga_soc/Controller_SDRAM_AHB/rtl/vlog/test/user" -vlog01compat -work presynth "${PROJECT_DIR}/component/work/fpga_soc/Controller_SDRAM_AHB/rtl/vlog/test/user/testbench.v"
vlog "+incdir+${PROJECT_DIR}/component/work/fpga_soc/Controller_SDRAM_AHB/rtl/vlog/test/user" -vlog01compat -work presynth "${PROJECT_DIR}/component/work/fpga_soc/Controller_SDRAM_AHB/rtl/vlog/test/user/mt48lc16m16a2.v"

vsim -L SmartFusion2 -L presynth -L COREAHBLITE_LIB  -t 1fs presynth.testbench
add wave /testbench/*
run 500us
