vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/mux2x1/sim/mux2x1.v" \


vlog -work xil_defaultlib \
"glbl.v"

