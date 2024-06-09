
`timescale 1ns/1ps

`include "msdsl.sv"


`default_nettype none

`ifndef SIMULATION_MODE_MSDSL
module top (
    input wire logic clk_in1
);

`else
module top(
);
`endif // `ifndef SIMULATION_MODE_MSDSL

// Declaration of control signals
logic emu_rst;
logic [24  - 1:0] emu_dec_thr;
logic [64  - 1:0] emu_ctrl_data;
logic [2  - 1:0] emu_ctrl_mode;
logic [64  - 1:0] emu_time_vio;

(* dont_touch = "true" *) logic [((`DT_WIDTH)-1):0] dt_req_stall;
(* dont_touch = "true" *) logic [((`DT_WIDTH)-1):0] dt_req_default_osc;

// Declaration of probe signals
logic digital_sel_probe;
`MAKE_GENERIC_REAL(i_in_probe, 1, 25);
`MAKE_GENERIC_REAL(v_out_probe, 10, 25);
`MAKE_GENERIC_REAL(v_out_exp_probe, 1, 25);
`MAKE_GENERIC_REAL(v_out_lin_probe, 10, 25);
`MAKE_GENERIC_REAL(v_out_i_probe, 10, 25);
`MAKE_GENERIC_REAL(v_out_i_mult_probe, 10, 25);
`MAKE_GENERIC_REAL(dv_out_probe, 1, 25);
logic [64  - 1:0] emu_time;
logic emu_dec_cmp;


// create ext_clk signal when running in simulation mode
`ifdef SIMULATION_MODE_MSDSL
    logic ext_clk;
        logic clk_in1;
`endif // `ifdef SIMULATION_MODE_MSDSL

// debug clk declaration
logic dbg_hub_clk;


// emulation clock declarations
logic emu_clk, emu_clk_2x;

// declarations for time manager
logic [32  - 1:0] emu_dt;


// declarations for emu clock generator
logic clk_val_default_osc;
logic clk_default_osc;


// instantiate testbench
    tb tb_i (
    );


// Instantiation of control wrapper
    sim_ctrl_gen sim_ctrl_gen_i (
        .emu_time_vio(emu_time_vio),
        .emu_rst(emu_rst),
        .emu_dec_thr(emu_dec_thr),
        .emu_ctrl_data(emu_ctrl_data),
        .emu_ctrl_mode(emu_ctrl_mode),
        .emu_clk(emu_clk)
    );


// Instantiation of traceport wrapper
    trace_port_gen #(
        `PASS_REAL(i_in_probe, i_in_probe),
        `PASS_REAL(v_out_probe, v_out_probe),
        `PASS_REAL(v_out_exp_probe, v_out_exp_probe),
        `PASS_REAL(v_out_lin_probe, v_out_lin_probe),
        `PASS_REAL(v_out_i_probe, v_out_i_probe),
        `PASS_REAL(v_out_i_mult_probe, v_out_i_mult_probe),
        `PASS_REAL(dv_out_probe, dv_out_probe)
    ) trace_port_gen_i (
        .digital_sel_probe(digital_sel_probe),
        .i_in_probe(i_in_probe),
        .v_out_probe(v_out_probe),
        .v_out_exp_probe(v_out_exp_probe),
        .v_out_lin_probe(v_out_lin_probe),
        .v_out_i_probe(v_out_i_probe),
        .v_out_i_mult_probe(v_out_i_mult_probe),
        .dv_out_probe(dv_out_probe),
        .emu_time(emu_time),
        .emu_dec_cmp(emu_dec_cmp),
        .emu_clk(emu_clk)
    );


// Clock generator
    clk_gen clk_gen_i (
        .clk_in1(clk_in1),
        .emu_clk_2x(emu_clk_2x),
        .dbg_hub_clk(dbg_hub_clk)
    );


// Emulation Clks Generator
    gen_emu_clks gen_emu_clks_i (
        .emu_clk_2x(emu_clk_2x),
        .emu_clk(emu_clk),
        .clk_val_default_osc(clk_val_default_osc),
        .clk_default_osc(clk_default_osc)
    );


// Default oscillator
    osc_model_anasymod def_osc_i (
        .emu_clk(emu_clk),
        .emu_rst(emu_rst),
        .emu_dt(emu_dt),
        .emu_dt_req(dt_req_default_osc),
        .cke(clk_val_default_osc)
    );


// Time manager
    gen_time_manager gen_time_manager_i (
        .emu_clk(emu_clk),
        .emu_rst(emu_rst),
        .emu_time(emu_time),
        .emu_dt(emu_dt),
        .dt_req_stall(dt_req_stall),
        .dt_req_default_osc(dt_req_default_osc)
    );


// control signals
    ctrl_anasymod ctrl_anasymod_i (
        .emu_ctrl_data(emu_ctrl_data),
        .emu_ctrl_mode(emu_ctrl_mode),
        .emu_time(emu_time),
        .emu_dec_thr(emu_dec_thr),
        .emu_clk(emu_clk),
        .emu_rst(emu_rst),
        .emu_dec_cmp(emu_dec_cmp),
        .dt_req_stall(dt_req_stall)
    );


// Assignment for derived clks


// Assignment of custom control signals via absolute paths to design signals
assign emu_time_vio = emu_time;


// Assignment of probe signals via absolute paths to design signals
assign digital_sel_probe = tb_i.digital_sel_out;
assign i_in_probe = tb_i.I_in;
assign v_out_probe = tb_i.V_out;
assign v_out_exp_probe = tb_i.V_exp_out;
assign v_out_lin_probe = tb_i.V_out_lin;
assign v_out_i_probe = tb_i.V_out_I;
assign v_out_i_mult_probe = tb_i.V_out_I_mult;
assign dv_out_probe = tb_i.dv_out;


// simulation control
`ifdef SIMULATION_MODE_MSDSL
    // stop simulation after a predefined amount of emulation time
    localparam longint tstop_uint = (`TSTOP_MSDSL) / (`DT_SCALE);
    always @(emu_time) begin
        if (emu_time >= tstop_uint) begin
            $display("Ending simulation at emu_time=%e", emu_time*(`DT_SCALE));
            $finish;
        end
    end
    // dump waveforms to a specified VCD file
    `define ADD_QUOTES_TO_MACRO(macro) `"macro`"
    initial begin
        $dumpfile(`ADD_QUOTES_TO_MACRO(/home/will/Desktop/SP2024/EE207/NEEMS/neuron_what/build/sim/raw_results/top_sim.vcd));
        
        // Signals to be dumped as well for debug purposes
        
        
    end
`endif // `ifdef SIMULATION_MODE_MSDSL

endmodule

`default_nettype wire
