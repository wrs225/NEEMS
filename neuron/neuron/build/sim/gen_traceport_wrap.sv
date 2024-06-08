
`timescale 1ns/1ps

`default_nettype none
module trace_port_gen (
    input wire logic [63:0] emu_time,
    input wire logic emu_dec_cmp,
    input wire logic emu_clk
);


`ifdef SIMULATION_MODE_MSDSL
    initial begin
        #0;
        $dumpvars(0, emu_time);
        $dumpvars(0, emu_dec_cmp);
    end

`else
	// ILA instantiation
    ila_0 ila_0_i (
        .probe0(emu_time),
        .probe1(emu_dec_cmp),
        .clk(emu_clk)
    );


`endif // `ifdef SIMULATION_MODE_MSDSL

endmodule
`default_nettype wire
