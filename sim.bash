ghdl -a hdl/src/node.vhd
ghdl -a hdl/tb/tb.vhd
ghdl -e tb
./tb --wave=wave.ghw --stop-time=100ns
