`timescale 10ns/10ns

module AMdemod(input wire clk,
			   input wire signed [7:0] adc_data,
			   output wire signed [17:0] demod_out,
			   output wire 				demod_clk,
			   input wire rst);

   wire signed [15:0] sine, cosine;
   wire signed [7:0] cic_out;
   reg signed [23:0] I_tmp, Q_tmp;
   reg signed [7:0] I, Q;
   reg signed [15:0] sig_squared;
   
   wire cic_out_clk;
   
   reg clk_25x;
   reg [15:0] count_25x, demod_count;
      

   LO LO(.clk(clk),
		 .clken(1'b1),
		 .phi_inc_i(32'd343597384),   // 10 MHz
		 .fsin_o(sine),
		 .fcos_o(cosine),
		 .out_valid(),
		 .reset_n(~rst));
		 
	CIC CIC(.clk(clk),
			.rst(rst),
			.decimation_ratio(16'd125),
	        .d_in(sig_squared >>> 8),
	        .d_out(cic_out),
			.d_clk(cic_out_clk));
			
	SerialFIR FIR(.clk(cic_out_clk),
                  .clk_25x(clk_25x),
                  .rst(rst),
                  .x(cic_out),
                  .y(demod_out),
                  .clk_out(demod_clk));
			  
	// 24x clock generator for Serial FIR (24x CIC out clock, not main clock)
	always @(posedge clk)
	begin
		if (rst)
		begin
			clk_25x <= 1'b0;
			count_25x <= 16'b0;
		end else
		begin
			if (count_25x != 16'd4)
				count_25x <= count_25x + 1;
			else
				count_25x <= 16'd0;
			if (count_25x == 16'd0)
				clk_25x <= 1'b1;
			if (count_25x == 16'd2)
				clk_25x <= 1'b0;
		end
	end		  
		 
	always @(posedge clk)
	begin
		if (rst)
		begin
			I <= 16'b0;
			Q <= 16'b0;
			I_tmp <= 24'b0;
			Q_tmp <= 24'b0;
		end else
		begin
			I_tmp <= cosine * adc_data;
			Q_tmp <= sine   * adc_data;
			I <= I_tmp >>> 15;
			Q <= Q_tmp >>> 15;
			sig_squared <= I * I + Q * Q;
		end
	end

endmodule
