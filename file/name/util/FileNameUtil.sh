include base.comparator.BaseComparator

include string.util.StringUtil
include string.validator.StringValidator

include system.validator.SystemValidator

@class
FileNameUtil(){

	@private
	_getPathUnix(){
		local path=${1}

		if [[ $(StringValidator isSubstring ${path} :) ]]; then
			echo /$(StringUtil replace path [A-Z]: $(
				StringUtil toLowerCase $(StringUtil substring path 1)))
			return
		fi

		echo ${path}
	}

	@private
	_getPathWin(){
		local path=${1}

		if [[ ! $(StringValidator isSubstring ${path} :) ]]; then
			local drive=$(StringUtil capitalize $(
				StringUtil substring path 1 1))

			local headlessPath=${path/\/[a-z]/}

			local path=${drive}:${headlessPath}
		fi

		echo ${path}
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