###################################################################

# Created by write_sdc on Fri May 18 12:11:46 2018

###################################################################
set sdc_version 1.7

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
create_clock [get_ports clk]  -period 5  -waveform {0 2.5}
