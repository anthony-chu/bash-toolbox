package(){
	local files=($(find bash-toolbox/${1//./\/} -type f))

	for file in ${files[@]}; do
		source ${file}
	done
}