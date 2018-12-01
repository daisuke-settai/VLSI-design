#
# Your design
#
set base_name "mips"
set rtl_file  "mips.v"
set clock_name "clk"
set clock_period 5.0

#
# Libraries
#
set target_library "~matutani/lib/typical.db"
set synthetic_library "dw_foundation.sldb"
set link_library [concat "*" $target_library $synthetic_library]
set symbol_library "generic.sldb"
define_design_lib WORK -path ./WORK

#
# Read RTL file(s)
#
analyze -format verilog $rtl_file
elaborate $base_name
current_design $base_name
link
uniquify

#
# Timing
#
create_clock -name $clock_name -period $clock_period [find port $clock_name]

#
# Design synthesis
#
compile
# compile -ungroup_all

#
# Output
#
write -format verilog -hierarchy -output ${base_name}.vnet
write_sdc ${base_name}.sdc

# report_timing
# report_reference -hier
# quit
