include string.util.StringUtil

DependencyChecker(){
	getCircularDependency(){
		local dependency=${2}
		local file=${1}

		local filePath=bash-toolbox/$(StringUtil replace file [.] /).sh

		while read line; do
			if [[ "${line}" =~ include ]]; then
				local _line=(${line})

				if [[ ${dependency} == ${_line[-1]} ]]; then
					echo ${filePath}
					break
				else
					getCircularDependency ${_line[-1]} ${dependency}
				fi
			fi
		done < ${filePath}
	}

	$@
}