include system.validator.SystemValidator

@class
FileNameUtil(){

	@private
	_getPathUnix(){
		if [[ ${@} =~ "\\" ]]; then
        	echo /${@} | sed "s#\([A-Z]\):#\l\1#g" | sed "s#\\\\#/#g"
		else
			echo ${@}
		fi
	}

	@private
	_getPathWin(){
		if [[ ${@} =~ "/" ]]; then
			echo ${@} | sed "s#^/\([a-z]\)#\u\1:#g" | sed "s#/#\\\\#g"
		else
			echo ${@}
		fi
	}

	getHybridPath(){
		if [[ $(uname) =~ NT && $(SystemValidator isShell) ]]; then
			local path=$(_getPathWin ${@})

			echo ${path//\\/\/}
		fi
	}

	getPath(){
		if [[ $(uname) =~ NT ]]; then
			_getPathWin ${@}
		else
			_getPathUnix ${@}
		fi
	}

	$@
}