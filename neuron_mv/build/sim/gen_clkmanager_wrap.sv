`timescale 1ns/1ps

`default_nettype none
module clk_gen (
    input wire logic clk_in1,
    output wire logic dbg_hub_clk,
    output wire logic emu_clk_2x
);


`ifdef SIMULATION_MODE_MSDSL
	// emulator clock sequence
	logic emu_clk_2x_state;
	
	initial begin
		// since the reset signal is initially "1", this delay+posedge will
		// cause the MSDSL templates to be reset
	    emu_clk_2x_state = 1'b0;
	    #((0.25/(`EMU_CLK_FREQ))*1s);
	    emu_clk_2x_state = 1'b1;

	    // clock runs forever
	    forever begin
	        #((0.25/(`EMU_CLK_FREQ))*1s);
	        emu_clk_2x_state = ~emu_clk_2x_state;
	    end
	end

	
	// output assignment
	assign emu_clk_2x = emu_clk_2x_state;
	
`else
	logic locked;
        clk_wiz_0 clk_wiz_0_i (
        .clk_in1(clk_in1),
        .clk_out1(emu_clk_2x),
        .clk_out2(dbg_hub_clk),
        .reset(1'b0),
        .locked(locked)
    );

`endif // `ifdef SIMULATION_MODE_MSDSL

endmodule
`default_nettype wire
