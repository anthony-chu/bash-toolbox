main(){
	__files=(
		colorme.sh
		include.sh
		markups.sh
		package.sh
		readvar.sh
	)

	for file in ${__files[@]}; do
		source ${projectDir}bash-toolbox/lib/${file}
	done
}

main