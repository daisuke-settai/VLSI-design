*NAND2 test

*** Technology library ***
.inc '/home/staff2/matutani/pdk/models/hspice/hspice_nom.include'

*** Netlist ***
.inc '/home/staff2/matutani/lib/Back_End/lpe_spice/NAND2_X1_lpe.spi'

*** Option and parameters ***
.options post
.temp 25
.param on  = 1.1
.param off = 0.0

*** Main circuit ***
X0 VDD VSS A2 ZN A1 NAND2_X1

*** Power supply ***
VDD VDD 0 dc on
VSS VSS 0 dc off

VA1 A1 0 pwl(0n off 1n off 1.01n on 2n on 2.01n off 3n off 3.01n on)
VA2 A2 0 pwl(0n off 2n off 2.01n on 4n on 4.01n off 6n off 6.01n on)

*** Control ***
.tran 1n 12n
.plot tran v(A1) v(A2) v(ZN)

.end
