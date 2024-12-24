onerror {resume}
quietly WaveActivateNextPane {} 0

# Top-level signals
add wave -noupdate /test_main/uut/clk
add wave -noupdate /test_main/uut/reset
add wave -noupdate /test_main/uut/p_addr0
add wave -noupdate /test_main/uut/p_addr1
add wave -noupdate /test_main/uut/p_data0
add wave -noupdate /test_main/uut/p_data1
add wave -noupdate /test_main/uut/req0
add wave -noupdate /test_main/uut/req1
add wave -noupdate /test_main/uut/ready0
add wave -noupdate /test_main/uut/ready1

# Memory signals
add wave -noupdate /test_main/uut/MEM/addr
add wave -noupdate /test_main/uut/MEM/data
add wave -noupdate /test_main/uut/MEM/clk
add wave -noupdate /test_main/uut/MEM/ready

# Zoom and refresh
TreeUpdate [SetDefaultTree]
update
WaveRestoreZoom {0 ns} {1000 ns}

# Run simulation
run -all

