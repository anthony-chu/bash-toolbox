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