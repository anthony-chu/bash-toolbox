SystemValidator(){
	local packages=(
		system.System
	)

	isLinux(){
		if [[ $(System getOS) =~ Linux ]]; then
			echo true
		fi
	}

	isWindows(){
		if [[ $(System getOS) =~ NT ]]; then
			echo true
		fi
	}

	include ${packages[@]}

	$@

	exclude ${packages[@]}
}