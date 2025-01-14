#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f counter.vcd

# run Verilator to translate Verilog into C++, inclduing C++ tesbench
verilator -Wall --cc --trace counter.sv --exe counter_tb.cpp

# build cpp project via maqke automatically generated by verilator
make -j -C obj_dir/ -f Vcounter.mk Vcounter

obj_dir/Vcounter