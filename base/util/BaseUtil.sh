BaseUtil(){
	getCurFile(){
		local thisFile=${0//*\//}

		if [[ ${1} == true ]]; then
			echo ${thisFile}
		elif [[ ${1} == false ]]; then
			echo ${thisFile/.sh/}
		fi
	}

	portListener(){
		if [[ $# == 0 ]]; then
			exit
		fi

		if [[ $(netstat -an | grep ${1}) ]]; then
			echo true
		fi
	}

	$@
}