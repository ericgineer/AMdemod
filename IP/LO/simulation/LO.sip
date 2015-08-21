set_global_assignment -entity "LO" -library "lib_LO" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "LO" -library "lib_LO" -name IP_TOOL_VERSION "15.0"
set_global_assignment -entity "LO" -library "lib_LO" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_LO" -name SPD_FILE [file join $::quartus(sip_path) "../LO.spd"]
set_global_assignment -library "lib_LO" -name MISC_FILE [file join $::quartus(sip_path) "../../LO.qsys"]

set_global_assignment -library "lib_LO" -name MISC_FILE [file join $::quartus(sip_path) "LO.v"]
set_global_assignment -library "lib_LO" -name MISC_FILE [file join $::quartus(sip_path) "submodules/LO_nco_ii_0_tb.vhd"]
set_global_assignment -library "lib_LO" -name MISC_FILE [file join $::quartus(sip_path) "submodules/LO_nco_ii_0.vo"]
