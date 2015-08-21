onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider tb
add wave -noupdate /AMdemod_tb/clk
add wave -noupdate /AMdemod_tb/rst
add wave -noupdate /AMdemod_tb/adc_data
add wave -noupdate /AMdemod_tb/mod_data
add wave -noupdate /AMdemod_tb/AM_mod
add wave -noupdate /AMdemod_tb/demod_out
add wave -noupdate /AMdemod_tb/demod_clk
add wave -noupdate -divider AMdemod
add wave -noupdate /AMdemod_tb/AMdemod/clk
add wave -noupdate /AMdemod_tb/AMdemod/adc_data
add wave -noupdate /AMdemod_tb/AMdemod/demod_out
add wave -noupdate /AMdemod_tb/AMdemod/demod_clk
add wave -noupdate /AMdemod_tb/AMdemod/rst
add wave -noupdate /AMdemod_tb/AMdemod/sine
add wave -noupdate /AMdemod_tb/AMdemod/cosine
add wave -noupdate /AMdemod_tb/AMdemod/cic_stage1
add wave -noupdate /AMdemod_tb/AMdemod/cic_stage2
add wave -noupdate /AMdemod_tb/AMdemod/I_tmp
add wave -noupdate /AMdemod_tb/AMdemod/Q_tmp
add wave -noupdate /AMdemod_tb/AMdemod/I
add wave -noupdate /AMdemod_tb/AMdemod/Q
add wave -noupdate /AMdemod_tb/AMdemod/sig_squared
add wave -noupdate /AMdemod_tb/AMdemod/clk_20
add wave -noupdate /AMdemod_tb/AMdemod/count_20
add wave -noupdate -max 399.0 /AMdemod_tb/AMdemod/demod_count
add wave -noupdate -divider LO
add wave -noupdate -format Literal -radix decimal /AMdemod_tb/AMdemod/LO/clk
add wave -noupdate -format Literal -radix decimal /AMdemod_tb/AMdemod/LO/clken
add wave -noupdate -radix decimal /AMdemod_tb/AMdemod/LO/phi_inc_i
add wave -noupdate -radix decimal /AMdemod_tb/AMdemod/LO/fsin_o
add wave -noupdate -radix decimal /AMdemod_tb/AMdemod/LO/fcos_o
add wave -noupdate -format Literal -radix decimal /AMdemod_tb/AMdemod/LO/out_valid
add wave -noupdate -format Literal -radix decimal /AMdemod_tb/AMdemod/LO/reset_n
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8596 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 161
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
WaveRestoreZoom {0 ns} {25229 ns}
