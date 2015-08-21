`timescale 1ns/1ns

module write_master_tb;
	reg ddr_waitrequest, clk1, clk2, rst;
	wire [31:0] ddr_addr;
	wire 		ddr_write;
	wire [15:0] ddr_writedata;
	
	reg signed    [15:0] writedata;
	wire signed   [15:0] readdata;
	reg 		  [2:0]  addr;
	reg 		  	     read;
	reg 			     write;
	
	reg signed    [15:0] d_in;
	reg 				 d_in_clk;
	
	
	reg 		  [15:0] count;

	write_master write_master(//DDR3 Avalon-MM interface
							 .ddr_waitrequest(ddr_waitrequest),
							 .ddr_addr(ddr_addr),
							 .ddr_write(ddr_write),
							 .ddr_writedata(ddr_writedata),
								
							 //writetodram Avalon-MM interface
							 .writedata(writedata),
							 .readdata(readdata),
							 .addr(addr),
							 .read(read),
							 .write(write),
							
							 //Streaming input
							 .d_in(count),
							 .d_in_clk(clk2),
							  
							 //Clock and reset
							 .clk(clk1),
							 .rst(rst));
							 
							 
	task avmmwrite;
		input [2:0] a;
		input [15:0] data;
		
		begin
			addr <= a;
			writedata <= data;
			write <= 1'b1;
			@(posedge clk1);
			write <= 1'b0;
		end
	endtask 
	
	task avmmread;
		input [2:0] a;
		begin
			addr <= a;
			read <= 1'b1;
			@(posedge clk1);
			read <= 1'b0;
		end
	endtask
		
							 
							 
	always #100 clk1 = ~clk1;
	always #1  clk2 = ~clk2;
	
	initial 
	begin
		clk1 <= 1'b0;
		clk2 <= 1'b0;
		rst <= 1'b0;
		count <= 16'b0;
		repeat(3) @(posedge clk1);
		rst <= 1'b1;
		@(posedge clk1);
		rst <= 1'b0;
		
		repeat(3) @(posedge clk1);
		
		avmmwrite(3'h5, 16'h1);  // Reset
		avmmwrite(3'h5, 16'h0);  // clear reset
		avmmwrite(3'h0, 16'h0);  // write base
		avmmwrite(3'h1, 16'h100); // write length
		avmmwrite(3'h2, 16'h1); // step
		avmmwrite(3'h3, 16'h1); // start
		avmmwrite(3'h3, 16'h0); // clear start
		
		while ( count <  16'h100)
		begin
			count <= count + 1;
			@(posedge clk2);
		end
		repeat(10) @(posedge clk1);
		avmmread(3'h4);
		repeat(10) @(posedge clk1);
		$stop;
	end
endmodule
		
