`timescale 10ns/10ns

module AMdemod(input wire clk,
			   input wire signed [7:0] adc_data,
			   output reg signed [59:0] demod_out,
			   output reg 				demod_clk,
			   input wire rst);

   wire signed [15:0] sine, cosine;
   wire signed [59:0] cic_stage1, cic_stage2;
   reg signed [23:0] I_tmp, Q_tmp;
   reg signed [7:0] I, Q;
   reg signed [15:0] sig_squared;
   
   
   reg clk_20;
   reg [15:0] count_20, demod_count;
      

   LO LO(.clk(clk),
		 .clken(1'b1),
		 .phi_inc_i(32'd343597384),   // 10 MHz
		 .fsin_o(sine),
		 .fcos_o(cosine),
		 .out_valid(),
		 .reset_n(~rst));
		 
    cic cic_1(.in_error(1'b0),
			  .in_valid(1'b1),
			  .in_ready(),  
			  .in_data(sig_squared[15:8]),
			  .out_data(cic_stage1),
			  .out_error(),
			  .out_valid(),
			  .out_ready(1'b1),
			  .clk(clk),
			  .reset_n(~rst));
			  
	cic cic_2(.in_error(1'b0),
			  .in_valid(1'b1),
			  .in_ready(),  
			  .in_data(cic_stage1[59:52]),
			  .out_data(cic_stage2),
			  .out_error(),
			  .out_valid(),
			  .out_ready(1'b1),
			  .clk(clk_20),
			  .reset_n(~rst));
			  
	// Decimate by 20 clock generator
	always @(posedge clk)
	begin
		if (rst)
		begin
			clk_20 <= 1'b0;
			count_20 <= 16'b0;
		end else
		begin
			if (count_20 != 16'd9)
				count_20 <= count_20 + 1;
			else
			begin
				count_20 <= 16'd0;
				clk_20 <= ~clk_20;
			end
		end
	end
	
	// Decimate by 40 clock generator
	always @(posedge clk)
	begin
		if (rst)
		begin
			demod_clk <= 1'b0;
			demod_count <= 16'b0;
		end else
		begin
			if (demod_count != 16'd399)
				demod_count <= demod_count + 1;
			else
			begin
				demod_count <= 16'd0;
				demod_clk <= ~demod_clk;
			end
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
			demod_out <= 8'b0;
		end else
		begin
			I_tmp <= cosine * adc_data;
			Q_tmp <= sine   * adc_data;
			I <= I_tmp >>> 15;
			Q <= Q_tmp >>> 15;
			sig_squared <= I * I + Q * Q;
			demod_out <= cic_stage2;
		end
	end

endmodule
