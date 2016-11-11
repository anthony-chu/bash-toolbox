include os.validator.OSValidator
include string.util.StringUtil

FileNameUtil(){
	getPath(){
		local path=${1}

		if [[ $(OSValidator isWindows) ]]; then
			drive=$(StringUtil capitalize ${path:1:1})
			headlessPath=${path/\/[a-z]/}

			echo ${drive}:${headlessPath}
		else
			echo ${path}
		fi
	}

	$@
}