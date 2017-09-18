include base.comparator.BaseComparator

include string.util.StringUtil
include string.validator.StringValidator

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

		StringUtil replace ${path} [/] \\\\
	}

	getPath(){
		local path=${2}

		if [[ $(BaseComparator isEqual ${1} win) ]]; then
			_getPathWin ${2}
		elif [[ $(BaseComparator isEqual ${1} nix) ]]; then
			_getPathUnix ${2}
		fi
	}

	$@
}