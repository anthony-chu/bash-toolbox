include file.name.util.FileNameUtil

include string.util.StringUtil

include system.validator.SystemValidator

@class
FileUtil(){
	@deprecated
	construct(){
		local path=$(FileNameUtil getPath ${1})

		mkdir -p ${path}

		echo ${path}
	}

	deleteIfExists(){
		if [[ -e ${1} || -d ${1} ]]; then
			rm -rf ${1}
		fi
	}

	getContent(){
		cat ${1}
	}

	getCurFile(){
		local thisFile=${0//*\//}

		if [[ ${1} == true ]]; then
			echo ${thisFile}
		elif [[ ${1} == false ]]; then
			StringUtil trim thisFile . 1
		fi
	}

	makeFile(){
		local filePath=$(FileNameUtil getPath ${1})

		local fileName=${filePath//*\/}

		mkdir -p ${filePath//${fileName}/}

		for command in {touch,echo}; do
			${command} ${filePath}
		done
	}

	open(){
		if [[ $(SystemValidator isLinux) ]]; then
			local cmd=open
		elif [[ $(SystemValidator isWindows) ]]; then
			local cmd=start
		fi

		${cmd} ${1}
	}

	replace(){
		local file=${1}
		local pattern=$(readvar ${2})
		local replace=$(readvar ${3})

		sed -i "s;${pattern};${replace};g" ${file}
	}

	$@
}