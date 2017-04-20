PropsUtil(){
	getProperty(){
		grep -o "${2}=.*" "${1}"
	}

	$@
}