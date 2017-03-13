include array.util.ArrayUtil
include array.validator.ArrayValidator

include string.util.StringUtil
include string.validator.StringValidator

FileUtil(){
	construct(){
		local _path=${1}
		local directories=($(StringUtil replace _path / space))

		for directory in ${directories[@]}; do
			local dir=${dir}/${directory}

			if [ ! -e ${dir} ]; then
				mkdir ${dir}
			fi

			cd ${dir}
		done

		echo /$(StringUtil replace directories[@] space /)
	}

	getContent(){
		local file=${1}

		cat ${file}
	}

	makeFile(){
		local fileName=${1}
		local _fileNameArray=($(StringUtil split fileName /))
		local fileNameArray=$(ArrayUtil trim _fileNameArray 1)
		local filePath=$(
			construct /$(StringUtil replace fileNameArray[@] space /))

		for cmd in {touch,echo}; do
			${cmd} ${filePath}/${_fileNameArray[-1]}
		done
	}

	$@
}