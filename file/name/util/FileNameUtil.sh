include os.validator.OSValidator
include string.util.StringUtil

FileNameUtil(){
	getPath(){
		local path=${1}

		if [[ $(OSValidator isWindows) ]]; then
			local drive=$(StringUtil capitalize ${path:1:1})
			local headlessPath=${path/\/[a-z]/}

			echo ${drive}:${headlessPath}
		else
			echo ${path}
		fi
	}

	$@
}