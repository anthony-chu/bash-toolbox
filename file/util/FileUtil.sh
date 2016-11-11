include array.validator.ArrayValidator
include string.util.StringUtil
include string.validator.StringValidator

FileUtil(){
	construct(){
		directories=($(StringUtil replace ${1} [/] space))

		for directory in ${directories[@]}; do
			dir=${dir}/${directory}

			if [ ! -e ${dir} ]; then
				mkdir ${dir}
				cd ${dir}
			else
				cd ${dir}
			fi
		done
	}

	getContent(){
		local file=${1}

		cat ${file}
	}

	getExtension(){
		local file=${1}
		StringUtil strip ${file} *[.]
	}

	getStatus(){
		if [[ $(StringValidator isNull $(ls | grep ${1})) ]]; then
			return;
		else
			if [[ $(ls | grep ${1}) == ${1} ]]; then
				echo true
			else
				return;
			fi
		fi
	}

	matchFileContentSubstring(){
		local pattern=${1}
		local file=${2}

		local matchingContent=($(grep -o '${pattern}' ${file}))

		if [[ $(ArrayValidator
			hasEntry ${matchingContent[@]} ${pattern}) ]]; then

			return;
		else
			echo true
		fi
	}

	$@
}