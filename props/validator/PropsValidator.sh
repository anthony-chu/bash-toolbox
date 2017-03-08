PropsValidator(){
	propertyExists(){
		grep -o "${2}=.*" "${1}"
	}

	isSet(){
		if [[ $(grep -o "${2}=${3}" ${1}) ]]; then
			echo true
		fi
	}

	$@
}