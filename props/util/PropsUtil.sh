@class
PropsUtil(){
	getProperty(){
		if [[ -e ${1} ]]; then
			cat ${1} | grep ${2}=.*
		fi
	}

	$@
}