transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+design_1  -L xilinx_vip -L axi_infrastructure_v1_1_0 -L axi_vip_v1_1_15 -L processing_system7_vip_v1_0_17 -L xil_defaultlib -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_14 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.design_1 xil_defaultlib.glbl

do {design_1.udo}

run 1000ns

endsim

quit -force
