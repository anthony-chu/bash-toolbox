@class
StringValidator(){
	beginsWith(){
		local beginning=${1}
		shift
		local string=${@}

		if [[ ${string} == ${beginning}* ]]; then
			echo true
		fi
	}

	beginsWithVowel(){
		local string=${@}

		if [[ ${string} == [aeiouAEIOU]* ]]; then
			echo true
		fi
	}

	endsWith(){
		local end=${1}
		shift
		local string=$@

		if [[ ${string} == *${end} ]]; then
			echo true
		fi
	}

	isAlpha(){
		if [[ ! ${str//[a-zA-Z]/} ]];
			echo true
		fi
	}

	isAlphaNum(){
		if [[ ! ${str//[0-9a-zA-Z]/} ]];
			echo true
		fi
	}

	isSubstring(){
		if [[ $(readvar ${1}) =~ $(readvar ${2}) ]]; then
			echo true
		fi
	}

	isNull(){
		if [[ ! ${1} ]]; then
			echo true
		fi
	}

	isNum(){
		if [[ ! ${1//-[0-9]/} ]]; then
			echo true
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