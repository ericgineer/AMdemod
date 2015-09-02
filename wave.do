onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider tb
add wave -noupdate -group AMdemod_tb /AMdemod_tb/clk
add wave -noupdate -group AMdemod_tb /AMdemod_tb/rst
add wave -noupdate -group AMdemod_tb /AMdemod_tb/carrier
add wave -noupdate -group AMdemod_tb /AMdemod_tb/mod_data
add wave -noupdate -group AMdemod_tb /AMdemod_tb/AM_mod
add wave -noupdate -group AMdemod_tb /AMdemod_tb/demod_out
add wave -noupdate -group AMdemod_tb /AMdemod_tb/demod_clk
add wave -noupdate -divider AMdemod
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/clk
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/clk_25x
add wave -noupdate -group AMdemod -height 17 -max 127.0 -min -128.0 /AMdemod_tb/AMdemod/adc_data
add wave -noupdate -group AMdemod -height 17 -max 9173.0 -min -365.0 /AMdemod_tb/AMdemod/demod_out
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/demod_clk
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/rst
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/sine
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/cosine
add wave -noupdate -group AMdemod -height 17 -max 112.0 /AMdemod_tb/AMdemod/cic_out
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/I_tmp
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/Q_tmp
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/I
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/Q
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/sig_squared
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/cic_out_clk
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/demod_count
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/count_25x
add wave -noupdate -divider sig_gen
add wave -noupdate -group sig_gen /AMdemod_tb/sig_gen/clk
add wave -noupdate -group sig_gen /AMdemod_tb/sig_gen/clken
add wave -noupdate -group sig_gen /AMdemod_tb/sig_gen/phi_inc_i
add wave -noupdate -group sig_gen /AMdemod_tb/sig_gen/fsin_o
add wave -noupdate -group sig_gen /AMdemod_tb/sig_gen/fcos_o
add wave -noupdate -group sig_gen /AMdemod_tb/sig_gen/out_valid
add wave -noupdate -group sig_gen /AMdemod_tb/sig_gen/reset_n
add wave -noupdate -divider CIC
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/clk
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/rst
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/decimation_ratio
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d_in
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d_out
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d_clk
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d_tmp
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d_d_tmp
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d1
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d_d1
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d2
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d_d2
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d3
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d_d3
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d4
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d_d4
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d5
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d_d5
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d6
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d_d6
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d7
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d_d7
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d8
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d_d8
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d9
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d_d9
add wave -noupdate -group CIC /AMdemod_tb/AMdemod/CIC/d10
add wave -noupdate -group CIC -radix decimal /AMdemod_tb/AMdemod/CIC/count
add wave -noupdate -divider FIR
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/clk
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/clk_25x
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/rst
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/x
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/y
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/clk_out
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d1
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d2
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d3
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d4
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d5
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d6
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d7
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d8
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d9
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d10
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d11
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d12
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d13
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d14
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d15
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d16
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d17
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d18
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d19
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d20
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d21
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/d_mux_out
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/h_mux_out
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/mult_out
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/sum_out
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/select
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/sum_clr
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/state
add wave -noupdate -group FIR /AMdemod_tb/AMdemod/FIR/mem
add wave -noupdate -divider LO
add wave -noupdate -group LO /AMdemod_tb/AMdemod/LO/clk
add wave -noupdate -group LO /AMdemod_tb/AMdemod/LO/clken
add wave -noupdate -group LO /AMdemod_tb/AMdemod/LO/phi_inc_i
add wave -noupdate -group LO /AMdemod_tb/AMdemod/LO/fsin_o
add wave -noupdate -group LO /AMdemod_tb/AMdemod/LO/fcos_o
add wave -noupdate -group LO /AMdemod_tb/AMdemod/LO/out_valid
add wave -noupdate -group LO /AMdemod_tb/AMdemod/LO/reset_n
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 3} {90220 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 147
configure wave -valuecolwidth 96
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ns} {4549 ns}
