`define BUS_ADDR_WIDTH	32
`define MEM_ADDR_WIDTH  30
`define DATA_WIDTH      32

`define Enable		1
`define Disable		0
`define Enable_		0
`define Disable_	1
`define BGRT0		0
`define BGRT1		1
`define Free		1
`define Read 		1
`define Write		0

//busarb
//processor
`define P0		0
`define P1		1
`define Done		1
`define Not_done	0
`define Store		0
`define Load_or_Fetch	1

// dmode
`define MtoM		1
`define MtoIO		2
`define IOtoM		3

//dmac state
`define Wait		0
`define Read1		1
`define Write1		2
`define Complete	3

`define WAKE            0
`define SLEEP           1

`define Not_Done        0
`define Done		1
