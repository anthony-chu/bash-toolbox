package(){
	local files=($(find bash-toolbox/${1//./\/} -type f -iname "*.sh"))

	for file in ${files[@]}; do
		source ${file}
	done
}