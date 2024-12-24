##################################################
#  Modelsim do file to run simuilation
#  MS 7/2015
##################################################

vlib work 
vmap work work

# Include Netlist and Testbench
vlog -sv -incr ../../rtl/main/main.v 
vlog -sv -incr test_main.v 
vlog -sv -incr ../../rtl/main/cache.v 
vlog -sv -incr ../../rtl/main/cache_controller.v
vlog -sv -incr ../../rtl/main/cache_datapath.v 
vlog -sv -incr ../../rtl/main/memory.v


# Run Simulator 
vsim +acc -t ps -lib work test_main
do waveformat.do   
run -all
