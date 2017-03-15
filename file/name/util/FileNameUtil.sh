include string.util.StringUtil

include system.validator.SystemValidator

FileNameUtil(){
	getPath(){
		local path=${1}

		if [[ $(SystemValidator isWindows) ]]; then
			local drive=$(StringUtil capitalize ${path:1:1})
			local headlessPath=${path/\/[a-z]/}

			echo ${drive}:${headlessPath}
		else
			echo ${path}
		fi
	}

	$@
}