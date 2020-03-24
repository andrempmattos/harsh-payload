onerror {resume}
virtual type { AXI_IDLE AXI_RADR AXI_WADR AXI_RTRN AXI_WTRN AXI_WRSP AXI_RFIF AXI_WFIF AXI_WREQ AXI_RREQ} axiStates
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Address Signals}
add wave -noupdate /testbench/CORESDR_AHB/hready_int
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/datain
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/datain_reg
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/dataout
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/dataout_reg
add wave -noupdate /testbench/CORESDR_AHB/HWDATA_reg
add wave -noupdate /testbench/CORESDR_AHB/HSELREG
add wave -noupdate /testbench/CORESDR_AHB/HRDATA_4
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/HRDATA_3
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/HRDATA_2
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/HRDATA_1
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/HRDATA_0
add wave -noupdate -divider AHB
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/HCLK
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/HRESETN
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/HADDR
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/HRDATA_reg
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/HRDATA_IN
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/HREADY
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/HREADYIN
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/HRESP
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/HSEL
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/HSIZE
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/HTRANS
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/HWDATA
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/HRDATA
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/HWRITE
add wave -noupdate -divider SDR
add wave -noupdate /testbench/CORESDR_AHB/SDRCLK
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/SA
add wave -noupdate /testbench/CORESDR_AHB/OE
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/BA
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/CS_N
add wave -noupdate /testbench/CORESDR_AHB/CAS_N
add wave -noupdate /testbench/CORESDR_AHB/CKE
add wave -noupdate /testbench/CORESDR_AHB/WE_N
add wave -noupdate /testbench/CORESDR_AHB/RAS_N
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/DQ
add wave -noupdate /testbench/CORESDR_AHB/DQM
add wave -noupdate -divider {Local Bus Interface}
add wave -noupdate /testbench/CORESDR_AHB/wdata_valid
add wave -noupdate /testbench/CORESDR_AHB/data_valid
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/B_SIZE_reg
add wave -noupdate -radix hexadecimal /testbench/CORESDR_AHB/RADDR
add wave -noupdate /testbench/CORESDR_AHB/W_REQ_int
add wave -noupdate /testbench/CORESDR_AHB/R_REQ_int
add wave -noupdate /testbench/CORESDR_AHB/W_VALID
add wave -noupdate /testbench/CORESDR_AHB/R_VALID
add wave -noupdate /testbench/CORESDR_AHB/D_REQ
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {522551081 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 449
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {522191676 ps} {522976754 ps}
