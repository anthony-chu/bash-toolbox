include array.util.ArrayUtil

include file.name.util.FileNameUtil

include string.util.StringUtil

include system.validator.SystemValidator

@class
FileUtil(){
	construct(){
		local _path=$(FileNameUtil getPath ${1})

		for directory in $(StringUtil replace _path / space); do
			local dir=${dir}/${directory}

			if [ ! -e ${dir} ]; then
				mkdir ${dir}
			fi

			cd ${dir}
		done

		echo ${_path}
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
		local fileName=$(FileNameUtil getPath ${1})
		local _fileNameArray=($(StringUtil split fileName /))
		local fileNameArray=($(ArrayUtil trim _fileNameArray 1))
		local filePath=$(construct /$(StringUtil replace fileNameArray space /))

		for cmd in {touch,echo}; do
			${cmd} ${filePath}/${_fileNameArray[-1]}
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