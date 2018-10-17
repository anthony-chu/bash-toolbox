include base.comparator.BaseComparator

include string.util.StringUtil
include string.validator.StringValidator

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
			echo $@
		fi
	}

	getPath(){
		if [[ $(SystemValidator isWindows) ]]; then
			_getPathWin ${1}
		else
			_getPathUnix ${1}
		fi
	}

	$@
}