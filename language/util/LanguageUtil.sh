LanguageUtil(){
	local packages=(
		base.comparator.BaseComparator

		string.validator.StringValidator
	)

	toggleArticleVowelForm(){
		local word=${1}

		if [[ $(StringValidator beginsWithVowel ${word}) ]]; then
			echo an
		else
			echo a
		fi
	}

	togglePlurality(){
		local pluralForm=${3}
		local singularForm=${2}
		local value=${1}

		if [[ $(BaseComparator isGreaterThan ${value} 1) ]]; then
			echo ${pluralForm}
		else
			echo ${singularForm}
		fi
	}

	include ${packages[@]}

	$@

	exclude ${packages[@]}
}