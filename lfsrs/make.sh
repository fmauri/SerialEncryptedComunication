ghdl -a --ieee=synopsys a5_v1.vhd

ghdl -e --ieee=synopsys LFSR1
ghdl -e --ieee=synopsys LFSR2
ghdl -e --ieee=synopsys LFSR3

ghdl -r --ieee=synopsys LFSR1
ghdl -r --ieee=synopsys LFSR2
ghdl -r --ieee=synopsys LFSR3

ghdl -a --ieee=synopsys a5_v1_tb.vhd
ghdl -e --ieee=synopsys a5_v1_tb
ghdl -r --ieee=synopsys a5_v1_tb --stop-time=500ns > output.txt
