clear -all

analyze -sv09 main.v cache.v cache_datapath.v cache_controller.v memory.v
elaborate -top main

clock clk
reset ~reset0 ~reset1
