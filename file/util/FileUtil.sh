include file.name.util.FileNameUtil

include string.util.StringUtil

include system.validator.SystemValidator

@class
FileUtil(){
	extract(){
		if [[ ${1} == *.zip ]]; then
			unzip -q ${1} -d ${2}
		elif [[ ${1} == *.tar.gz ]]; then
			tar -xf ${1} -C ${2}
		elif [[ ${1} == *.7z ]]; then
			cd ${2}

			nullify 7z x ${1} -aoa -y
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
		local filePath=${1}

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