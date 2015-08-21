# Create library work
vlib work
vmap work work

# Compile verilog files

vlog AMdemodulator/*.v
vlog IP/LO/simulation/*.v
vlog IP/LO/simulation/submodules/*.vo
vlog IP/CIC/cic/simulation/*.v
vlog IP/CIC/cic/simulation/submodules/*.vo

# Start simulator

vsim -novopt -t ns AMdemod_tb -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver

# Setup waveforms

do wave.do

# Run simulation

run -all
