*INV test

*** Technology library ***
.inc '/home/staff2/matutani/pdk/models/hspice/hspice_nom.include'

*** Netlist ***
.inc '/home/staff2/matutani/lib/Back_End/lpe_spice/INV_X1_lpe.spi'

*** Option and parameters ***
.options post
.temp 25
.param on  = 1.1
.param off = 0.0

*** Main circuit ***
X0 VDD VSS A ZN INV_X1

*** Power supply ***
VDD VDD 0 dc on
VSS VSS 0 dc off

VA A 0 pwl(0n off 1n off 1.01n on 2n on 2.01n off 3n off 3.01n on)

*** Control ***
.tran 1n 12n
.plot tran v(A) v(ZN)

.end
