# Create library work
vlib work
vmap work work

# Compile verilog files

vlog AMdemodulator/*.v
vlog IP/LO/simulation/*.v
vlog IP/LO/simulation/submodules/*.vo
vlog IP/CIC/*.v
vlog IP/SerialFIR/*.v

# Start simulator

vsim -novopt -t ns AMdemod_tb -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver

# Setup waveforms

do wave.do

# Run simulation

run -all
