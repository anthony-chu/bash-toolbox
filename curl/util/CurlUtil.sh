@class
CurlUtil(){
	getContent(){
		curl -L -s ${1}
	}

	getFile(){
		curl -O -s ${1}
	}

	getHTTPResponse(){
		curl -s -o /dev/null -w "%{http_code}" ${1}
	}

	isValidUrl(){
		if [[ $(getHTTPResponse ${1}) == 200 ]]; then
			echo true
		fi
	}

	$@
}