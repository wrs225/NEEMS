
`timescale 1ns/1ps

`default_nettype none
module trace_port_gen #(
    `DECL_REAL(i_in_probe),
    `DECL_REAL(v_out_probe),
    `DECL_REAL(v_out_exp_probe),
    `DECL_REAL(v_out_lin_probe),
    `DECL_REAL(v_out_i_probe),
    `DECL_REAL(v_out_i_mult_probe),
    `DECL_REAL(dv_out_probe)
) (
    `INPUT_REAL(i_in_probe),
    `INPUT_REAL(v_out_probe),
    `INPUT_REAL(v_out_exp_probe),
    `INPUT_REAL(v_out_lin_probe),
    `INPUT_REAL(v_out_i_probe),
    `INPUT_REAL(v_out_i_mult_probe),
    `INPUT_REAL(dv_out_probe),
    input wire logic digital_sel_probe,
    input wire logic [63:0] emu_time,
    input wire logic emu_dec_cmp,
    input wire logic emu_clk
);


`ifdef SIMULATION_MODE_MSDSL
    initial begin
        #0;
        $dumpvars(0, digital_sel_probe);
        $dumpvars(0, i_in_probe);
        $dumpvars(0, v_out_probe);
        $dumpvars(0, v_out_exp_probe);
        $dumpvars(0, v_out_lin_probe);
        $dumpvars(0, v_out_i_probe);
        $dumpvars(0, v_out_i_mult_probe);
        $dumpvars(0, dv_out_probe);
        $dumpvars(0, emu_time);
        $dumpvars(0, emu_dec_cmp);
    end

`else
	// ILA instantiation
    ila_0 ila_0_i (
        .probe0(digital_sel_probe),
        .probe1(i_in_probe),
        .probe2(v_out_probe),
        .probe3(v_out_exp_probe),
        .probe4(v_out_lin_probe),
        .probe5(v_out_i_probe),
        .probe6(v_out_i_mult_probe),
        .probe7(dv_out_probe),
        .probe8(emu_time),
        .probe9(emu_dec_cmp),
        .clk(emu_clk)
    );


`endif // `ifdef SIMULATION_MODE_MSDSL

endmodule
`default_nettype wire
