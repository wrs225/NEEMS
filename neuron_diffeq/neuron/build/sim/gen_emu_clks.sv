
`timescale 1ns/1ps

`default_nettype none

module gen_emu_clks (
    input wire logic emu_clk_2x,
    input wire logic clk_val_default_osc,
    output wire logic emu_clk,
    output wire logic clk_default_osc
);


// generate emu_clk
logic emu_clk_unbuf = 0;

always @(posedge emu_clk_2x) begin
    emu_clk_unbuf <= ~emu_clk_unbuf;
end
`ifndef SIMULATION_MODE_MSDSL
    BUFG buf_emu_clk (.I(emu_clk_unbuf), .O(emu_clk));
`else
    assign emu_clk = emu_clk_unbuf;
`endif

// Handle default oscillator
logic clk_unbuf_default_osc = 0;
always @(posedge emu_clk_2x) begin
    clk_unbuf_default_osc <= (~emu_clk_unbuf) & clk_val_default_osc;
end
`ifndef SIMULATION_MODE_MSDSL
    BUFG buf_default_osc (.I(clk_unbuf_default_osc), .O(clk_default_osc));
`else
    assign clk_default_osc = clk_unbuf_default_osc;
`endif

// generate other clocks

endmodule
 
`default_nettype wire
