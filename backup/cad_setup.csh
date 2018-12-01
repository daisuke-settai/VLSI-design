#!/bin/csh

# Last update 2017/05/20

#
# Synopsys Design Compiler
#
setenv DIR /usr/local/vdec/synopsys/syn_vB-2008.09/
set path=( ${DIR}/bin $path )

#
# Synopsys HSPICE
#
setenv DIR /usr/local/vdec/synopsys/hspice_vC-2009.03/
set path=( ${DIR}/hspice/bin ${DIR}/hspice/linux $path )

#
# Synopsys CosmoScope
#
setenv DIR /usr/local/vdec/synopsys/CosmosScope_B-2008.09/
set path=( ${DIR}/ai_bin $path )

#
# Cadence Virtuoso
#
setenv DIR /usr/local/vdec/cadence/IC06.12.517-612/
set path=( ${DIR}/tools/bin ${DIR}/tools/dfII/bin $path )

#
# Cadence SoC Encounter
#
#setenv DIR /usr/local/vdec/cadence/SOC08.10.001/
#setenv DIR /usr/local/vdec/cadence/EDI09.10.000/
#setenv DIR /usr/local/vdec/cadence/EDI10.10.000/
#set path=( ${DIR}/tools/bin ${DIR}/tools/dfII/bin $path )
setenv DIR /usr/local/vdec/cadence/INNOVUS16.21.000/
set path=( ${DIR}/tools.lnx86/bin ${DIR}/tools.lnx86/dfII/bin $path )

#
# Cadence NC-Verilog, Simvision
#
setenv DIR /usr/local/vdec/cadence/IUS06.20.004/
set path=( ${DIR}/tools/bin ${DIR}/tools/dfII/bin $path )

#
# Mentor Calibre
#
setenv DIR /usr/local/vdec/mentor/ixl_cal_2010.4_26.16/
setenv MGC_HOME /usr/local/vdec/mentor/ixl_cal_2010.4_26.16/
set path=( ${DIR}/bin $path )

#
# License
#
setenv CDS_LIC_FILE         5280@vdec-cad1:5280@vdec-cad2:5280@vdec-cad3
#setenv CDS_LIC_FILE         5280@ls-vdc.vdc.ce.titech.ac.jp
setenv SNPSLMD_LICENSE_FILE 1700@vdec-cad1:1700@vdec-cad2:1700@vdec-cad3
setenv MGLS_LICENSE_FILE    1717@vdec-cad1:1717@vdec-cad2:1717@vdec-cad3

#
# CAD servers
#
alias cad0	ssh -X 192.168.0.15
alias cad1	ssh -X 192.168.0.16
alias cad2	ssh -X 192.168.0.17
alias cad3	ssh -X 192.168.0.18
alias cad4	ssh -X 192.168.0.19

#
# Misc.
#
setenv LANG C
