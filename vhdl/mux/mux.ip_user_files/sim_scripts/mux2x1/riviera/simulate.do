onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+mux2x1  -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.mux2x1 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {mux2x1.udo}

run 1000ns

endsim

quit -force
