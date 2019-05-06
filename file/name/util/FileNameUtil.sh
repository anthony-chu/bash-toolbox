include system.validator.SystemValidator

@class
FileNameUtil(){
	@deprecate
	getHybridPath(){
		local path=$(_getPathWin ${@})

		echo ${path//\\/\/}
	}

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

	getPath(){
		if [[ $(SystemValidator isWindows) ]]; then
			local path=$(_getPathWin ${@})

			if [[ $(SystemValidator isShell) ]]; then
				local path=${path//\\/\/}
			fi
		else
			local path=$(_getPathUnix ${@})
		fi

		echo ${path}
	}

	$@
}