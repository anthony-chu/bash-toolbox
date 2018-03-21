include base.comparator.BaseComparator

include string.util.StringUtil
include string.validator.StringValidator

@class
FileNameUtil(){

	@private
	_getPathUnix(){
		local path=${1}

		if [[ $(StringValidator isSubstring ${path} :) ]]; then
			echo /$(StringUtil replace path [A-Z]: $(
				StringUtil toLowerCase ${path:0:1}))
			return
		fi

		echo ${path}
	}

	@private
	_getPathWin(){
		local path=${1}

		if [[ ! $(StringValidator isSubstring ${path} :) ]]; then
			local drive=$(StringUtil capitalize ${path:1:1})
			local headlessPath=${path/\/[a-z]/}

			local path=${drive}:${headlessPath}
		fi

		echo ${path}
	}

	getPath(){
		if [[ $(BaseComparator isEqual $# 2) &&
			$(BaseComparator isEqual ${1} 1) ]]; then
			_getPathWin ${2}
		else
			_getPathUnix ${1}
		fi
	}

	$@
}