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

		StringUtil replace directories[@] space /
	}

	getContent(){
		local file=${1}

		cat ${file}
	}

	getExtension(){
		local file=${1}
		StringUtil strip file .*[.]
	}

	getStatus(){
		if [[ ! $(StringValidator isNull $(ls | grep ${1})) ]]; then
			if [[ $(ls | grep ${1}) == ${1} ]]; then
				echo true
			fi
		fi
	}

	makeFile(){
		local fileName=${1}
		local fileNameArray=($(StringUtil split fileName /))
		local _fileName=${fileNameArray[-1]}
		local _filePath=($(ArrayUtil flipArray fileNameArray))
		local _filePath=${filePath[@]:1}
		local filePath=($(ArrayUtil flipArray _filePath))

		local filePath=$(construct $(StringUtil replace filePath[@] space /))

		for cmd in {touch,echo}; do
			${cmd} /${filePath}/${_fileName}
		done
	}

	matchFileContentSubstring(){
		local pattern=${1}
		local file=${2}

		local matchingContent=($(grep -o '${pattern}' ${file}))

		if [[ ! $(ArrayValidator hasEntry matchingContent ${pattern}) ]]; then
			echo true
		fi
	}

	$@
}