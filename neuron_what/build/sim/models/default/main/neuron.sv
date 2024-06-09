// Model generated on 2024-06-08 17:33:39.537658

`timescale 1ns/1ps

`include "svreal.sv"
`include "msdsl.sv"

`default_nettype none

module neuron #(
    `DECL_REAL(I_in),
    `DECL_REAL(V_out),
    `DECL_REAL(V_out_exp),
    `DECL_REAL(V_out_lin),
    `DECL_REAL(V_out_I),
    `DECL_REAL(V_out_I_mult),
    `DECL_REAL(dv_out)
) (
    `INPUT_REAL(I_in),
    `OUTPUT_REAL(V_out),
    `OUTPUT_REAL(V_out_exp),
    `OUTPUT_REAL(V_out_lin),
    `OUTPUT_REAL(V_out_I),
    `OUTPUT_REAL(V_out_I_mult),
    `OUTPUT_REAL(dv_out),
    output wire logic digital_sel_out
);
    // Declaring internal variables.
    `MAKE_REAL(V_out_st, 10);
    logic digital_sel;
    // Assign signal: digital_sel
    `MAKE_CONST_REAL(-38.4, tmp1);
    `LE_REAL(V_out_st, tmp1, tmp0);
    assign digital_sel = tmp0;
    // Assign signal: V_out
    `ASSIGN_REAL(V_out_st, V_out);
    // Assign signal: V_out_st
    `MAKE_CONST_REAL(5.0, tmp2);
    `DFF_INTO_REAL(tmp2, V_out_st, `RST_MSDSL, `CLK_MSDSL, 1'b1, 5);
    // Assign signal: V_out_I_mult
    `MAKE_CONST_REAL(5.0, tmp3);
    `ASSIGN_REAL(tmp3, V_out_I_mult);
endmodule

`default_nettype wire
