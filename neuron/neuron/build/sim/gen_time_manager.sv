`timescale 1ns/1ps

`include "msdsl.sv"


`default_nettype none

module gen_time_manager (
    input wire logic emu_clk,
    input wire logic emu_rst,
    input wire logic [31:0] dt_req_stall,
    input wire logic [31:0] dt_req_default_osc,
    output wire logic [63:0] emu_time,
    output wire logic [31:0] emu_dt
);

    (* dont_touch = "true" *) logic [((`DT_WIDTH)-1):0] __dt_req_min_0;
    assign __dt_req_min_0 = (((dt_req_default_osc) < (dt_req_stall)) ? (dt_req_default_osc) : (dt_req_stall));
    assign emu_dt = __dt_req_min_0;

    // assign internal state variable to output
    logic [((`TIME_WIDTH)-1):0] emu_time_state;
    assign emu_time = emu_time_state;

    // update emulation time on each clock cycle
    always @(posedge emu_clk) begin
        if (emu_rst==1'b1) begin
            emu_time_state <= 0;
        end else begin
            emu_time_state <= emu_time_state + emu_dt;
        end
    end
endmodule

`default_nettype wire
