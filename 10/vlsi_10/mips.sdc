###################################################################

# Created by write_sdc on Fri Jun 22 12:42:21 2018

###################################################################
set sdc_version 1.7

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
create_clock [get_ports clk]  -period 10  -waveform {0 5}
set_clock_uncertainty 0.02  [get_clocks clk]
set_input_delay -clock clk  0.1  [get_ports {memdata[7]}]
set_input_delay -clock clk  0.1  [get_ports {memdata[6]}]
set_input_delay -clock clk  0.1  [get_ports {memdata[5]}]
set_input_delay -clock clk  0.1  [get_ports {memdata[4]}]
set_input_delay -clock clk  0.1  [get_ports {memdata[3]}]
set_input_delay -clock clk  0.1  [get_ports {memdata[2]}]
set_input_delay -clock clk  0.1  [get_ports {memdata[1]}]
set_input_delay -clock clk  0.1  [get_ports {memdata[0]}]
set_output_delay -clock clk  0.1  [get_ports memread]
set_output_delay -clock clk  0.1  [get_ports memwrite]
set_output_delay -clock clk  0.1  [get_ports {adr[7]}]
set_output_delay -clock clk  0.1  [get_ports {adr[6]}]
set_output_delay -clock clk  0.1  [get_ports {adr[5]}]
set_output_delay -clock clk  0.1  [get_ports {adr[4]}]
set_output_delay -clock clk  0.1  [get_ports {adr[3]}]
set_output_delay -clock clk  0.1  [get_ports {adr[2]}]
set_output_delay -clock clk  0.1  [get_ports {adr[1]}]
set_output_delay -clock clk  0.1  [get_ports {adr[0]}]
set_output_delay -clock clk  0.1  [get_ports {writedata[7]}]
set_output_delay -clock clk  0.1  [get_ports {writedata[6]}]
set_output_delay -clock clk  0.1  [get_ports {writedata[5]}]
set_output_delay -clock clk  0.1  [get_ports {writedata[4]}]
set_output_delay -clock clk  0.1  [get_ports {writedata[3]}]
set_output_delay -clock clk  0.1  [get_ports {writedata[2]}]
set_output_delay -clock clk  0.1  [get_ports {writedata[1]}]
set_output_delay -clock clk  0.1  [get_ports {writedata[0]}]
