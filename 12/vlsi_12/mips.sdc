###################################################################

# Created by write_sdc on Sat Apr 22 16:05:47 2017

###################################################################
set sdc_version 2.0

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
create_clock [get_ports clk_pad]  -period 5  -waveform {0 2.5}
