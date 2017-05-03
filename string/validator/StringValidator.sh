StringValidator(){
	beginsWith(){
		local char=${1}
		shift
		local string=${@}

		if [[ ${string} == ${char}* ]]; then
			echo true
		fi
	}

	beginsWithVowel(){
		local string=${@}

		case "${string}" in
			[aeiouAEIOU]*) echo true;;
		esac
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
		if [[ $(readvar ${1}) =~ $(readvar ${2}) ]]; then
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

		if [[ $(beginsWith - ${str}) ]]; then
			local str=${str/-/}
		fi

		isNull ${str//[0-9]/}
	}

	isOption(){
		local opt=${1}

		if [[ $(beginsWith - ${opt}) && $(isAlphaNum ${opt//-/}) ]]; then
			echo true
		fi
	}

	$@
}