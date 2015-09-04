`timescale 10ns/10ns

module AMdemod(input wire clk,
			   input wire signed [7:0] adc_data,
			   output wire signed [17:0] demod_out,
			   output wire 				demod_clk,
			   input wire rst);

   wire signed [15:0] sine, cosine;
   wire signed [7:0] cic_I_out, cic_Q_out;
   reg signed [23:0] I_tmp, Q_tmp;
   reg signed [7:0] I, Q;
   wire signed [17:0] I_out, Q_out;
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
		 
	CIC #(.width(42)) CIC_I(.clk(clk),
			.rst(rst),
			.decimation_ratio(16'd125), // Downsample to 1 MHz
	        .d_in(I),
	        .d_out(cic_I_out),
			.d_clk(cic_out_clk));
			
	SerialFIR FIR_I(.clk(cic_out_clk),
                  .clk_25x(clk_25x),
                  .rst(rst),
                  .x(cic_I_out),
                  .y(I_out),
                  .clk_out(demod_clk));
                  
    CIC #(.width(42)) CIC_Q(.clk(clk),
			.rst(rst),
			.decimation_ratio(16'd125), // Downsample to 1 MHz
	        .d_in(Q),
	        .d_out(cic_Q_out),
			.d_clk(cic_out_clk));
			
	SerialFIR FIR_Q(.clk(cic_out_clk),
                  .clk_25x(clk_25x),
                  .rst(rst),
                  .x(cic_Q_out),
                  .y(Q_out),
                  .clk_out(demod_clk));
                  
    SerialFIR FIRdemod(.clk(cic_out_clk),
                  .clk_25x(clk_25x),
                  .rst(rst),
                  .x(sig_squared >>> 8),
                  .y(demod_out),
                  .clk_out(demod_clk));
			  
	// 25x clock generator for Serial FIR (25x CIC out clock, not main clock)
	always @(posedge clk)
	begin
		if (rst)
		begin
			clk_25x <= 1'b0;
			count_25x <= 16'b0;
		end else
		begin
			if (count_25x != 16'd4) // 25x-1
				count_25x <= count_25x + 16'b1;
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
			I <= 8'b0;
			Q <= 8'b0;
			I_tmp <= 24'b0;
			Q_tmp <= 24'b0;
		end else
		begin
			I_tmp <= cosine * adc_data;
			Q_tmp <= sine   * adc_data;
			I <= I_tmp >>> 15;
			Q <= Q_tmp >>> 15;
			sig_squared <= (I_out >>> 7) * (I_out >>> 7) + (Q_out >>> 7) * (Q_out >>> 7);
		end
	end

endmodule
