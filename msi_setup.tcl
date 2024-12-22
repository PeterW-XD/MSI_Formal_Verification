clear -all

analyze -sv09 main.v memory.v cache.v cache_datapath.v cache_controller.v
elaborate -top main

clock clk
reset ~reset
