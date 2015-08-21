source setup.tcl

setup

#set LED values
write 0x0 0xff

#Enable ADC
write 0x1 0x1

set len 100

# For loop to write ADC values to an array

for {set i 0} {$i < $len} {incr i} {
	set adc_data($i) [format "%d" [read 0x2 0x1]]
}

# write ADC data to a text file

set outfile [open "data.txt" w]

for {set i 0} {$i < $len} {incr i} {
	puts $outfile $adc_data($i)
}

puts "Wrote $len samples to data.txt"

close $outfile
