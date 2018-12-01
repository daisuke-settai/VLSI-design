* SPICE NETLIST
***************************************

.SUBCKT my_inv A VSS VDD Y
** N=6 EP=4 IP=0 FDC=2
M0 Y A VSS 5 NMOS_VTL L=5e-08 W=1e-07 AD=1.25e-14 AS=1.25e-14 PD=4.5e-07 PS=4.5e-07 $X=500 $Y=200 $D=1
M1 Y A VDD 6 PMOS_VTL L=5e-08 W=1.5e-07 AD=1.875e-14 AS=1.875e-14 PD=5.5e-07 PS=5.5e-07 $X=500 $Y=1250 $D=0
.ENDS
***************************************
