

`include "svreal.sv"
`include "msdsl.sv"

`default_nettype none

module tb;
    // I/O definition
    `MAKE_CONST_REAL(200e-12, I_in);
    `MAKE_REAL(V_out, 10.0);


    // High-side signal
    `PWM(0.50, 500e3, hs);



    // neuron instantiation
    neuron #(
        `PASS_REAL(I_in, I_in),
        `PASS_REAL(V_out, V_out)
    ) neuron_i (
        .I_in(I_in),
        .V_out(V_out)
    );

endmodule

`default_nettype wire