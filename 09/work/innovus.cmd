#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Fri Jun 15 11:22:41 2018                
#                                                     
#######################################################

#@(#)CDS: Innovus v16.21-s078_1 (64bit) 01/20/2017 14:00 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 16.21-s078_1 NR170119-1828/16_21-UB (database version 2.30, 368.6.1) {superthreading v1.37}
#@(#)CDS: AAE 16.21-e024 (64bit) 01/20/2017 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 16.21-s038_1 () Jan 19 2017 09:01:24 ( )
#@(#)CDS: SYNTECH 16.21-s013_1 () Jan 14 2017 08:40:50 ( )
#@(#)CDS: CPE v16.21-s075
#@(#)CDS: IQRC/TQRC 15.2.7-s638 (64bit) Wed Jan  4 19:58:15 PST 2017 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
set init_gnd_net VSS
set init_lef_file ~matutani/lib/cells.lef
set init_verilog mips.v
set init_mmmc_file Default.view
set init_top_cell mips
set init_pwr_net VDD
init_design
set init_gnd_net VSS
set init_lef_file ~matutani/lib/cells.lef
set init_verilog mips.vnet
set init_mmmc_file Default.view
set init_top_cell mips
set init_pwr_net VDD
init_design
