`timescale 1ns/1ps

`include "msdsl.sv"


`default_nettype none
module sim_ctrl_gen (
    input wire logic [63:0] emu_time_vio,
    input wire logic emu_clk,
    output wire logic emu_rst,
    output wire logic [23:0] emu_dec_thr,
    output wire logic [63:0] emu_ctrl_data,
    output wire logic [1:0] emu_ctrl_mode
);


`ifdef SIMULATION_MODE_MSDSL
    // reset sequence
    logic emu_rst_state = 1'b1;    
    assign emu_rst = emu_rst_state;
    initial begin
        @(posedge emu_clk);
        #(((0.1/(`EMU_CLK_FREQ))*1.0s)+(1.0/(`EMU_CLK_FREQ))*0*1.0s);
        emu_rst_state = 1'b0;
    end

    // decimation threshold
    `ifndef DEC_THR_VAL_MSDSL
        `define DEC_THR_VAL_MSDSL 0
    `endif // `ifdef DEC_THR_VAL_MSDSL
    assign emu_dec_thr = `DEC_THR_VAL_MSDSL;

     // stall / run / sleep controls
    logic [((`TIME_WIDTH)-1):0] emu_ctrl_data_state;
    logic [3:0] emu_ctrl_mode_state;
    assign emu_ctrl_data = emu_ctrl_data_state;
    assign emu_ctrl_mode = emu_ctrl_mode_state;

    // module for custom vio handling
    // NOTE: sim_ctrl module must be written and added to the project manually!!!


`else
	// VIO instantiation
    vio_0 vio_0_i (
        .probe_in0(emu_time_vio),
        .probe_out0(emu_rst),
        .probe_out1(emu_dec_thr),
        .probe_out2(emu_ctrl_data),
        .probe_out3(emu_ctrl_mode),
        .clk(emu_clk)
    );

`endif // `ifdef SIMULATION_MODE_MSDSL

endmodule

`default_nettype wire
