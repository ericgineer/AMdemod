module top_ADCinterface(input  wire [7:0]  adc_dataandclock_adc_data,  //   adc_dataandclock.adc_data
						input  wire        adc_dataandclock_adc_clk,   //                   .adc_clk
						output wire        adc_interface_adc_csbn,     //      adc_interface.adc_csbn
						output wire        adc_interface_adc_sdio,     //                   .adc_sdio
						output wire        adc_interface_adc_sclk,     //                   .adc_sclk
						output wire        adc_interface_adc_oen,      //                   .adc_oen
						output wire        adc_interface_adc_sdon,     //                   .adc_sdon
						output wire        adc_interface_cha_3p5,      //                   .cha_3p5
						output wire        adc_interface_cha_2x,       //                   .cha_2x
						output wire        adc_interface_cha_8p5x,     //                   .cha_8p5x
						output wire        adc_interface_cha_in1,      //                   .cha_in1
						output wire        adc_interface_cha_in3,      //                   .cha_in3
						output wire        adc_interface_cha_en,       //                   .cha_en
						output wire        adc_interface_cha_in4,      //                   .cha_in4
						output wire        adc_interface_mon_fs,       //                   .mon_fs
						output wire        adc_interface_mon_en,       //                   .mon_en
						output wire        adc_interface_chb_en,       //                   .chb_en
						output wire        adc_interface_chb_in2,      //                   .chb_in2
						output wire        adc_interface_chb_in1,      //                   .chb_in1
						output wire        adc_interface_chb_in4,      //                   .chb_in4
						output wire        adc_interface_chb_3p5x,     //                   .chb_3p5x
						output wire        adc_interface_chb_2x,       //                   .chb_2x
						output wire        adc_interface_chb_8p5x,     //                   .chb_8p5x
						input  wire        buttonsandswitches_b1,      // buttonsandswitches.b1
						input  wire        buttonsandswitches_b2,      //                   .b2
						input  wire        buttonsandswitches_sw1,     //                   .sw1
						input  wire        buttonsandswitches_sw2,     //                   .sw2
						input  wire        buttonsandswitches_sw3,     //                   .sw3
						input  wire        clk_clk,                    //                clk.clk
						output wire [7:0]  leds_led);                  //               leds.led
						
	wire [7:0] ch_a_data, ch_b_data;
	
	wire signed [31:0] AM_mod;
	wire signed [15:0] adc_data, mod_data;
	
	assign AM_mod = adc_data * mod_data;

	ADCinterface_qsys ADCinterface(.adc_dataandclock_adc_clk(adc_dataandclock_adc_clk),
								   .adc_interface_adc_csbn(adc_interface_adc_csbn),
								   .adc_interface_adc_sdio(adc_interface_adc_sdio),
								   .adc_interface_adc_sclk(adc_interface_adc_sclk),
								   .adc_interface_adc_oen(adc_interface_adc_oen),
								   .adc_interface_adc_sdon(adc_interface_adc_sdon),
								   .adc_interface_cha_3p5(adc_interface_cha_3p5),
								   .adc_interface_cha_2x(adc_interface_cha_2x),
								   .adc_interface_cha_8p5x(adc_interface_cha_8p5x),
								   .adc_interface_cha_in1(adc_interface_cha_in1),
								   .adc_interface_cha_in3(adc_interface_cha_in3),
								   .adc_interface_cha_en(adc_interface_cha_en),
								   .adc_interface_cha_in4(adc_interface_cha_in4),
								   .adc_interface_mon_fs(adc_interface_mon_fs),
								   .adc_interface_mon_en(adc_interface_mon_en),
								   .adc_interface_chb_en(adc_interface_chb_en),
								   .adc_interface_chb_in2(adc_interface_chb_in2),
								   .adc_interface_chb_in1(adc_interface_chb_in1),
								   .adc_interface_chb_in4(adc_interface_chb_in4),
								   .adc_interface_chb_3p5x(adc_interface_chb_3p5x),
								   .adc_interface_chb_2x(adc_interface_chb_2x),
								   .adc_interface_chb_8p5x(adc_interface_chb_8p5x),
								   .buttonsandswitches_b1(buttonsandswitches_b1),
								   .buttonsandswitches_b2(buttonsandswitches_b2),
								   .buttonsandswitches_sw1(buttonsandswitches_sw1),
								   .buttonsandswitches_sw2(buttonsandswitches_sw2),
								   .buttonsandswitches_sw3(buttonsandswitches_sw3),
								   .clk_clk(adc_dataandclock_adc_clk),
								   .leds_led(leds_led),
								   .streamfromadc_adc_a_stream(ch_a_data),
								   .streamfromadc_adc_b_stream(ch_b_data));
									
	ADCstream ADCstream(.datain(adc_dataandclock_adc_data),
					    .inclock(adc_dataandclock_adc_clk),
						.dataout_h(ch_a_data),
						.dataout_l(ch_b_data));
						
	
	AMdemod AMdemod(.clk(adc_dataandclock_adc_clk),
			        .adc_data(AM_mod >>> 23),
			        .rst(1'b0));
			        
		LO sig_gen(.clk(adc_dataandclock_adc_clk),
					 .clken(1'b1),
					 .phi_inc_i(32'd343597384),   // 10 MHz
					 .fsin_o(adc_data),
					 .fcos_o(),
					 .out_valid(),
					 .reset_n(1'b1));
				 
	  LO AM_gen (.clk(adc_dataandclock_adc_clk),
				 .clken(1'b1),
				 .phi_inc_i(32'd343597),   //  10 kHz
				 .fsin_o(mod_data),
				 .fcos_o(),
				 .out_valid(),
				 .reset_n(1'b1));
	
endmodule