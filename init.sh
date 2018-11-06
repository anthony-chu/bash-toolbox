main(){
	local __files=(
		colorme.sh
		include.sh
		markups.sh
		nullify.sh
		readvar.sh
	)

	for file in ${__files[@]}; do
		source ${projectDir}bash-toolbox/lib/${file}
	done
}

main