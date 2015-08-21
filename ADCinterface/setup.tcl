set claim_path 0

proc setup {} {
	#Select the master service type and check for available service paths.
	set service_paths [get_service_paths master]
	#Set the master service path.
	set master_service_path [lindex $service_paths 0]
	#Open the master service.
	global claim_path
	set claim_path [claim_service master $master_service_path mylib]
}

proc read {addr length} {
	global claim_path
	set val [master_read_8 $claim_path $addr $length]
	return $val
}

proc write {addr value} {
	global claim_path
	master_write_8 $claim_path $addr $value
}
