* File: my_inv.pex.netlist
* Created: Mon Jul  4 01:27:00 2011
* Program "Calibre xRC"
* Version "v2010.4_26.16"
* 
.subckt my_inv  A VSS VDD Y
* 
* Y	Y
* VDD	VDD
* VSS	VSS
* A	A
M0 N_Y_M0_d N_A_M0_g N_VSS_M0_s 5 NMOS_VTL L=5e-08 W=1e-07 AD=1.25e-14
+ AS=1.25e-14 PD=4.5e-07 PS=4.5e-07
M1 N_Y_M1_d N_A_M1_g N_VDD_M1_s 6 PMOS_VTL L=5e-08 W=1.5e-07 AD=1.875e-14
+ AS=1.875e-14 PD=5.5e-07 PS=5.5e-07
*
* File: my_inv.pex.netlist.MY_INV.pxi
* Created: Mon Jul  4 01:27:00 2011
* 
x_PM_MY_INV_A N_A_M0_g N_A_M1_g A N_A_c_2_p PM_MY_INV_A
x_PM_MY_INV_VSS N_VSS_M0_s N_VSS_c_16_n VSS PM_MY_INV_VSS
x_PM_MY_INV_VDD N_VDD_M1_s N_VDD_c_24_n VDD PM_MY_INV_VDD
x_PM_MY_INV_Y N_Y_M0_d N_Y_M1_d Y N_Y_c_37_n N_Y_c_34_n PM_MY_INV_Y
cc_1 N_A_M0_g N_VSS_M0_s 0.00329931f
cc_2 N_A_c_2_p N_VSS_M0_s 0.00275106f
cc_3 N_A_M0_g N_VSS_c_16_n 0.00129454f
cc_4 N_A_c_2_p N_VSS_c_16_n 0.00285775f
cc_5 N_A_M1_g N_VDD_M1_s 0.0040606f
cc_6 N_A_c_2_p N_VDD_M1_s 0.00129118f
cc_7 N_A_M1_g N_VDD_c_24_n 0.00147742f
cc_8 N_A_c_2_p N_VDD_c_24_n 0.00218633f
cc_9 N_A_M0_g N_Y_M0_d 0.00340641f
cc_10 N_A_M0_g Y 0.00193114f
cc_11 N_A_M1_g Y 0.00320031f
cc_12 N_A_c_2_p Y 0.0121474f
cc_13 N_A_M1_g N_Y_c_34_n 0.00340641f
cc_14 N_VSS_M0_s N_VDD_M1_s 9.90248e-19
cc_15 N_VSS_M0_s N_Y_M0_d 0.00786986f
cc_16 N_VSS_c_16_n N_Y_M0_d 0.011195f
cc_17 N_VSS_c_16_n N_Y_c_37_n 0.00106874f
cc_18 N_VDD_c_24_n N_Y_M1_d 0.011195f
cc_19 N_VDD_M1_s N_Y_c_34_n 0.00786986f
cc_20 N_VDD_c_24_n N_Y_c_34_n 0.00106874f
*
.ends
*
*

* File: my_inv.pex.netlist.pex
* Created: Mon Jul  4 01:27:00 2011
* Program "Calibre xRC"
* Version "v2010.4_26.16"
* Nominal Temperature: 27C
* Circuit Temperature: 27C
* 
.subckt PM_MY_INV_A 2 6 10 12
c13 14 0 0.00457138f
c14 12 0 0.00835174f
c15 6 0 0.0299153f
c16 2 0 0.0226915f
r17 14 18 4.7687
r18 14 17 4.7687
r19 12 14 67.1147
r20 10 12 0.19
r21 6 18 42.9
r22 2 17 31.2
.ends

.subckt PM_MY_INV_VSS 3 6 8
c8 6 0 0.021655f
c9 3 0 0.0117522f
r10 6 8 0.285
r11 2 6 0.218002
r12 2 3 0.696667
.ends

.subckt PM_MY_INV_VDD 3 6 8
c8 6 0 0.021827f
c9 3 0 0.0117961f
r10 6 8 0.285
r11 2 6 0.218002
r12 2 3 0.696667
.ends

.subckt PM_MY_INV_Y 4 8 14 17 21
c11 21 0 0.00820657f
c12 17 0 0.00820657f
c13 14 0 0.017978f
c14 8 0 0.00497921f
c15 4 0 0.00497921f
r16 19 21 0.506667
r17 15 17 0.506667
r18 12 21 0.0223169
r19 12 14 0.76
r20 11 17 0.0223169
r21 11 14 1.01333
r22 7 19 0.0223169
r23 7 8 0.0633333
r24 3 15 0.0223169
r25 3 4 0.0633333
.ends
