BaseUtil(){
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