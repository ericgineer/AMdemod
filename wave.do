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
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/adc_data
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/demod_out
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/demod_clk
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/rst
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/sine
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/cosine
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/cic_I_out
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/cic_Q_out
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/I_tmp
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/Q_tmp
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/I
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/Q
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/sig_squared
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/cic_out_clk
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/clk_25x
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/count_25x
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/demod_count
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/I_out
add wave -noupdate -group AMdemod /AMdemod_tb/AMdemod/Q_out
add wave -noupdate -divider sig_gen
add wave -noupdate -group sig_gen /AMdemod_tb/sig_gen/clk
add wave -noupdate -group sig_gen /AMdemod_tb/sig_gen/clken
add wave -noupdate -group sig_gen /AMdemod_tb/sig_gen/phi_inc_i
add wave -noupdate -group sig_gen /AMdemod_tb/sig_gen/fsin_o
add wave -noupdate -group sig_gen /AMdemod_tb/sig_gen/fcos_o
add wave -noupdate -group sig_gen /AMdemod_tb/sig_gen/out_valid
add wave -noupdate -group sig_gen /AMdemod_tb/sig_gen/reset_n
add wave -noupdate -divider CIC_I
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/clk
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/rst
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/decimation_ratio
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d_in
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d_out
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d_clk
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d_tmp
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d_d_tmp
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d1
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d2
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d3
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d4
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d5
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d6
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d_d6
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d7
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d_d7
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d8
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d_d8
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d9
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d_d9
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d10
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/count
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/v_comb
add wave -noupdate -group CIC_I /AMdemod_tb/AMdemod/CIC_I/d_clk_tmp
add wave -noupdate -divider CIC_Q
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/clk
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/rst
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/decimation_ratio
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d_in
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d_out
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d_clk
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d_tmp
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d_d_tmp
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d1
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d2
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d3
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d4
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d5
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d6
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d_d6
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d7
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d_d7
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d8
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d_d8
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d9
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d_d9
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d10
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/count
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/v_comb
add wave -noupdate -group CIC_Q /AMdemod_tb/AMdemod/CIC_Q/d_clk_tmp
add wave -noupdate -divider FIR_I
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/clk
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/clk_25x
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/rst
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/x
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/y
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/clk_out
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d1
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d2
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d3
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d4
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d5
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d6
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d7
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d8
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d9
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d10
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d11
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d12
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d13
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d14
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d15
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d16
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d17
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d18
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d19
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d20
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d21
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/d_mux_out
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/h_mux_out
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/mult_out
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/sum_out
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/select
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/sum_clr
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/state
add wave -noupdate -group FIR_I /AMdemod_tb/AMdemod/FIR_I/mem
add wave -noupdate -divider FIR_Q
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/clk
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/clk_25x
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/rst
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/x
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/y
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/clk_out
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d1
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d2
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d3
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d4
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d5
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d6
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d7
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d8
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d9
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d10
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d11
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d12
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d13
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d14
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d15
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d16
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d17
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d18
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d19
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d20
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d21
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/d_mux_out
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/h_mux_out
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/mult_out
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/sum_out
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/select
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/sum_clr
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/state
add wave -noupdate -group FIR_Q /AMdemod_tb/AMdemod/FIR_Q/mem
add wave -noupdate -divider FIRdemod
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/clk
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/clk_25x
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/rst
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/x
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/y
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/clk_out
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d1
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d2
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d3
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d4
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d5
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d6
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d7
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d8
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d9
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d10
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d11
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d12
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d13
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d14
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d15
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d16
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d17
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d18
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d19
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d20
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d21
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/d_mux_out
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/h_mux_out
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/mult_out
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/sum_out
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/select
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/sum_clr
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/state
add wave -noupdate -group FIRdemod /AMdemod_tb/AMdemod/FIRdemod/mem
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
WaveRestoreZoom {0 ns} {112262 ns}
