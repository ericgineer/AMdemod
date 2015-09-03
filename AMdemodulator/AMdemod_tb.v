`timescale 1ns/1ns

module AMdemod_tb;
	reg clk;
	reg rst;
	
	wire signed [15:0] carrier, mod_data;
	wire signed [31:0] AM_mod;
	wire signed [17:0] demod_out;
	wire 			   demod_clk;
	
	assign AM_mod = carrier * mod_data;
	
	AMdemod AMdemod(.clk(clk),
				    .adc_data(AM_mod >>> 23),
				    .demod_out(demod_out),
				    .demod_clk(demod_clk),
				    .rst(rst));
				    
	  LO sig_gen(.clk(clk),
				 .clken(1'b1),
				 .phi_inc_i(32'd343597384),   // 10 MHz
				 .fsin_o(),
				 .fcos_o(carrier),
				 .out_valid(),
				 .reset_n(~rst));
				 
	  LO AM_gen (.clk(clk),
				 .clken(1'b1),
				 .phi_inc_i(32'd1717987),   //  50 kHz
				 .fsin_o(mod_data),
				 .fcos_o(),
				 .out_valid(),
				 .reset_n(~rst));
	
	initial
	begin
		clk <= 1'b0;
		rst <= 1'b0;
	end
	
	always #4 clk = ~clk;
	
	initial
	begin
		repeat(3) @(posedge clk);
		rst <= 1'b1;
		@(posedge clk);
		rst <= 1'b0;
		repeat(20000) @(posedge clk);
		$stop;
	end
endmodule
