StringValidator(){
	beginsWith(){
		local char=${1}
		shift
		local string=${@}

		if [[ ${string:0:1} == ${char} ]]; then
			echo true
		fi
	}

	beginsWithVowel(){
		local string=${@}

		local vowels=(a e i o u A E I O U)

		for vowel in ${vowels[@]}; do
			if [[ $(beginsWith ${vowel} ${string}) ]]; then
				echo true
				break
			fi
		done
	}

	isAlpha(){
		local str=${@}

		isNull ${str//[a-zA-Z ]/}
	}

	isAlphaNum(){
		local str=${@}

		isNull ${str//[0-9a-zA-Z ]/}
	}

	isSubstring(){
		local str1=${1}
		local str2=${2}

		if [[ ${str1} =~ ${str2} ]]; then
			echo true
		fi
	}

	isNull(){
		if [[ ${@} == "" ]]; then
			echo true
		fi
	}

	isNum(){
		local str=${@}

		if [[ ! $(beginsWith - ${str}) ]]; then
			isNull ${str//[0-9]/}
		else
			local str=${str/-/}

			isNull ${str//[0-9]/}
		fi
	}

	isOption(){
		local opt=${1}

		if [[ $(beginsWith - ${opt}) && $(isAlphaNum ${opt//-/}) ]]; then
			echo true
		fi
	}

	$@
}