clear -all

analyze -sv09 cache.v cache_datapath.v cache_controller.v
elaborate -top cache

clock clk
reset ~reset
