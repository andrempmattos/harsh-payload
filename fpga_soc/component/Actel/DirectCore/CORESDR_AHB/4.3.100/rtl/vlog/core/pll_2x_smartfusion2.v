//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Sep 28 15:36:44 2012
// Version: v11.0 10.9.1.8
//////////////////////////////////////////////////////////////////////

`timescale 1 ns/100 ps

// PLL_2X
module PLL_2X(
    // Inputs
    CLKA,
    POWERDOWN,
    // Outputs
    GLA,
    LOCK
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  CLKA;
input  POWERDOWN;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output GLA;
output LOCK;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   CLKA;
wire   GLA_net_0;
wire   LOCK_net_0;
wire   POWERDOWN;
wire   LOCK_net_1;
wire   GLA_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   VCC_net;
wire   GND_net;
wire   [7:2]PADDR_const_net_0;
wire   [7:0]PWDATA_const_net_0;
//--------------------------------------------------------------------
// Inverted Nets
//--------------------------------------------------------------------
wire   PLL_POWERDOWN_N_IN_POST_INV0_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net            = 1'b1;
assign GND_net            = 1'b0;
assign PADDR_const_net_0  = 6'h00;
assign PWDATA_const_net_0 = 8'h00;
//--------------------------------------------------------------------
// Inversions
//--------------------------------------------------------------------
assign PLL_POWERDOWN_N_IN_POST_INV0_0 =  POWERDOWN;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign LOCK_net_1 = LOCK_net_0;
assign LOCK       = LOCK_net_1;
assign GLA_net_1  = GLA_net_0;
assign GLA        = GLA_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------PLL_2X_CCC_0_CCC   -   Actel:SgCore:CCC:2.0.002
PLL_2X_CCC_0_CCC CCC_0(
        // Inputs
        .CLK0            ( CLKA ),
        .PLL_ARST_N      ( VCC_net ),
        .PLL_POWERDOWN_N ( PLL_POWERDOWN_N_IN_POST_INV0_0 ),
        // Outputs
        .GL0             ( GLA_net_0 ),
        .LOCK            ( LOCK_net_0 ) 
        );


endmodule

`timescale 1 ns/100 ps
// Version: v11.0 10.9.1.8


module PLL_2X_CCC_0_CCC(
       LOCK,
       PLL_ARST_N,
       PLL_POWERDOWN_N,
       CLK0,
       GL0
    );
output LOCK;
input  PLL_ARST_N;
input  PLL_POWERDOWN_N;
input  CLK0;
output GL0;

    wire gnd_net, vcc_net, GL0_net;
    
    VCC vcc_inst (.Y(vcc_net));
    GND gnd_inst (.Y(gnd_net));
    CLKINT GL0_INST (.A(GL0_net), .Y(GL0));
    CCC #( .INIT(212'h0000007FC0000044CFC000318C6318C1F18C61F00404040400100)
        , .VCOFREQUENCY(528.000) )  CCC_INST_2x (.Y0(), .Y1(), .Y2(), .Y3(
        ), .PRDATA({nc0, nc1, nc2, nc3, nc4, nc5, nc6, nc7}), .LOCK(
        LOCK), .BUSY(), .CLK0(CLK0), .CLK1(vcc_net), .CLK2(vcc_net), 
        .CLK3(vcc_net), .NGMUX0_SEL(gnd_net), .NGMUX1_SEL(gnd_net), 
        .NGMUX2_SEL(gnd_net), .NGMUX3_SEL(gnd_net), .NGMUX0_HOLD_N(
        vcc_net), .NGMUX1_HOLD_N(vcc_net), .NGMUX2_HOLD_N(vcc_net), 
        .NGMUX3_HOLD_N(vcc_net), .NGMUX0_ARST_N(vcc_net), 
        .NGMUX1_ARST_N(vcc_net), .NGMUX2_ARST_N(vcc_net), 
        .NGMUX3_ARST_N(vcc_net), .PLL_BYPASS_N(vcc_net), .PLL_ARST_N(
        PLL_ARST_N), .PLL_POWERDOWN_N(PLL_POWERDOWN_N), .GPD0_ARST_N(
        vcc_net), .GPD1_ARST_N(vcc_net), .GPD2_ARST_N(vcc_net), 
        .GPD3_ARST_N(vcc_net), .PRESET_N(gnd_net), .PCLK(vcc_net), 
        .PSEL(vcc_net), .PENABLE(vcc_net), .PWRITE(vcc_net), .PADDR({
        vcc_net, vcc_net, vcc_net, vcc_net, vcc_net, vcc_net}), 
        .PWDATA({vcc_net, vcc_net, vcc_net, vcc_net, vcc_net, vcc_net, 
        vcc_net, vcc_net}), .CLK0_PAD(gnd_net), .CLK1_PAD(gnd_net), 
        .CLK2_PAD(gnd_net), .CLK3_PAD(gnd_net), .GL0(GL0_net), .GL1(), 
        .GL2(), .GL3(), .RCOSC_25_50MHZ(gnd_net), .RCOSC_1MHZ(gnd_net), 
        .XTLOSC(gnd_net));
    
endmodule

