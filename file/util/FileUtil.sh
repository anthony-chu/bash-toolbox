include array.util.ArrayUtil
include array.validator.ArrayValidator

include file.name.util.FileNameUtil

include string.util.StringUtil
include string.validator.StringValidator

FileUtil(){
	construct(){
		local _path=$(FileNameUtil getPath nix ${1})
		local directories=($(StringUtil replace _path / space))

		for directory in ${directories[@]}; do
			local dir=${dir}/${directory}

			if [ ! -e ${dir} ]; then
				mkdir ${dir}
			fi

			cd ${dir}
		done

		echo /$(StringUtil replace directories space /)
	}

	getContent(){
		local file=${1}

		cat ${file}
	}

	getCurFile(){
		local thisFile=${0//*\//}

		if [[ ${1} == true ]]; then
			echo ${thisFile}
		elif [[ ${1} == false ]]; then
			StringUtil strip thisFile .sh
		fi
	}

	makeFile(){
		local fileName=$(FileNameUtil getPath nix ${1})
		local _fileNameArray=($(StringUtil split fileName /))
		local fileNameArray=($(ArrayUtil trim _fileNameArray 1))
		local filePath=$(construct /$(StringUtil replace fileNameArray space /))

		for cmd in {touch,echo}; do
			${cmd} ${filePath}/${_fileNameArray[-1]}
		done
	}

	$@
}