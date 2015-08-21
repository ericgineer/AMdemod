#Select the master service type and check for available service paths.
set service_paths [get_service_paths master]
#Set the master service path.
set master_service_path [lindex $service_paths 0]
#Open the master service.
set claim_path [claim_service master $master_service_path mylib]


# Address map
#
# Offset 0x0 -- onchip memory
#
# offset 0x4000 -- ADCinterface
#
# 0x0: Write value to LEDs
# 0x2: Enable ADC (0: ADC off, 1: ADC on)
# 0x4: Read ADC channel A data (read only register)
# 0x6: Read ADC channel B data (read only register)
# 0x8: Channel A gain select (0: 2x, 1: 3.5x, 2: 8.5x)
# 0xA: Channel B gain select (0: 2x, 1: 3.5x, 2: 8.5x)
# 0xC: Enable onboard signal generator (0: Sig gen off, 1: Sig gen on)
# 0xE: Set onboard signal generator frequency (0: 2.5 MHz, 1: 5 MHz)
# 0x10: 0 - Display register values on LEDs
#       1 - Display ADC channel A values on LEDs
#       2 - Display ADC channel B values on LEDs
#
# 0ffset 0x5000 -- write master
#
# 0x0: write base
# 0x2: write length
# 0x4: step
# 0x6: start
# 0x8: done
# 0xA: reset

#set LED values
master_write_16 $claim_path 0x4000 0xff

# Enable ADC

master_write_16 $claim_path 0x4002 0x1

# Turn off square wave generator

master_write_16 $claim_path 0x400c 0x0

# Configure write master for ADC data recording

# Reset write master

master_write_16 $claim_path 0x500A 0x1
master_write_16 $claim_path 0x500A 0x0

# Set write base

master_write_16 $claim_path 0x5000 0x0

# Set write length

master_write_16 $claim_path 0x5002 0x7fff

# Set address step

master_write_16 $claim_path 0x5004 0x2

# Start writer

master_write_16 $claim_path 0x5006 0x1
master_write_16 $claim_path 0x5006 0x0
