PropsValidator(){
	propertyExists(){
		grep -o "${2}=.*" "${1}"
	}

	$@
}