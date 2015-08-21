set len 4000

# For loop to write ADC values to an array

set q 0

for {set i 0} {$i < $len} {incr i} {
	set adc_data($i) [master_read_16 $claim_path 0x$q 0x1]
	set q [expr {$q + 2}]
}

# write ADC data to a text file

set outfile [open "data.txt" w]

for {set i 0} {$i < $len} {incr i} {
	puts $outfile [format "%d" $adc_data($i)]
}

puts "Wrote $len samples to data.txt"

close $outfile
