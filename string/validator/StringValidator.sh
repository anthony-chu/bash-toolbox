StringValidator(){
	beginsWith(){
		char=${1}
		shift
		string=${@}

		if [[ ${string} == ${char}* ]]; then
			echo true
		else
			return;
		fi
	}

	beginsWithVowel(){
		string=${@}

		vowels=(a e i o u A E I O U)

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
		else
			return;
		fi
	}

	isNull(){
		if [[ ${@} == "" ]]; then
			echo true
		else
			return;
		fi
	}

	isNum(){
		local str=${@}

		isNull ${str//[0-9]/}
	}

	isOption(){
		local opt=${1}

		if [[ $(beginsWith - ${opt}) && $(isAlphaNum ${opt//-/}) ]]; then
			echo true
		else
			return
		fi
	}

	$@
}