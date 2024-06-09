`timescale 1ns/1ps

`include "svreal.sv"
`include "msdsl.sv"

`default_nettype none

module tb;
// I/O definition
`MAKE_CONST_REAL(30e-12, I_in);
`MAKE_REAL(V_out, 1000);
`MAKE_REAL(V_exp_out, 1e-6);
`MAKE_REAL(V_out_lin, 1000);
`MAKE_REAL(V_out_I, 1000);
`MAKE_REAL(V_out_I_mult, 1000);
`MAKE_REAL(dv_out, 1000);

logic digital_sel_out;

// neuron instantiation
neuron #(
    `PASS_REAL(I_in, I_in),
    `PASS_REAL(V_out, V_out),
    `PASS_REAL(V_out_exp, V_exp_out),
    `PASS_REAL(V_out_lin, V_out_lin),
    `PASS_REAL(V_out_I, V_out_I),
    `PASS_REAL(V_out_I_mult, V_out_I_mult),
    `PASS_REAL(dv_out, dv_out)
) neuron_i (
    .I_in(I_in),
    .V_out(V_out),
    .V_out_exp(V_exp_out),
    .V_out_lin(V_out_lin),
    .V_out_I(V_out_I),
    .V_out_I_mult(V_out_I_mult),
    .dv_out(dv_out),
    .digital_sel_out(digital_sel_out)
);
endmodule

`default_nettype wire