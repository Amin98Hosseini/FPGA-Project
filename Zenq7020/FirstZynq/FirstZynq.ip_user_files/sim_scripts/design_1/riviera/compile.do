transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xilinx_vip
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_15
vlib riviera/processing_system7_vip_v1_0_17
vlib riviera/xil_defaultlib
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_14

vmap xilinx_vip riviera/xilinx_vip
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_15 riviera/axi_vip_v1_1_15
vmap processing_system7_vip_v1_0_17 riviera/processing_system7_vip_v1_0_17
vmap xil_defaultlib riviera/xil_defaultlib
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_14 riviera/proc_sys_reset_v5_0_14

vlog -work xilinx_vip  -incr "+incdir+E:/Program/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_15 -l processing_system7_vip_v1_0_17 -l xil_defaultlib -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 \
"E:/Program/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"E:/Program/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"E:/Program/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"E:/Program/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"E:/Program/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"E:/Program/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"E:/Program/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"E:/Program/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"E:/Program/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work axi_infrastructure_v1_1_0  -incr -v2k5 "+incdir+../../../../FirstZynq.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../FirstZynq.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+E:/Program/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_15 -l processing_system7_vip_v1_0_17 -l xil_defaultlib -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 \
"../../../../FirstZynq.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_15  -incr "+incdir+../../../../FirstZynq.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../FirstZynq.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+E:/Program/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_15 -l processing_system7_vip_v1_0_17 -l xil_defaultlib -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 \
"../../../../FirstZynq.gen/sources_1/bd/design_1/ipshared/5753/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_17  -incr "+incdir+../../../../FirstZynq.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../FirstZynq.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+E:/Program/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_15 -l processing_system7_vip_v1_0_17 -l xil_defaultlib -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 \
"../../../../FirstZynq.gen/sources_1/bd/design_1/ipshared/6b2b/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../FirstZynq.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../FirstZynq.gen/sources_1/bd/design_1/ipshared/6b2b/hdl" "+incdir+E:/Program/Xilinx/Vivado/2023.2/data/xilinx_vip/include" -l xilinx_vip -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_15 -l processing_system7_vip_v1_0_17 -l xil_defaultlib -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 \
"../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93  -incr \
"../../../../FirstZynq.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_14 -93  -incr \
"../../../../FirstZynq.gen/sources_1/bd/design_1/ipshared/408c/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_proc_sys_reset_0_0/sim/design_1_proc_sys_reset_0_0.vhd" \
"../../../bd/design_1/sim/design_1.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

