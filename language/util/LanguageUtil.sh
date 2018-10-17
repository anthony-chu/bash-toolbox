include base.comparator.BaseComparator

include string.validator.StringValidator

@class
LanguageUtil(){
	toggleArticleVowelForm(){
		local word=${1}

		if [[ $(StringValidator beginsWithVowel ${word}) ]]; then
			echo an ${word}
		else
			echo a ${word}
		fi
	}

	togglePlurality(){
		local pluralForm=${3}
		local singularForm=${2}
		local value=${1}

		if [[ ${value} -gt 1 || ${value} == 0 ]]; then

			echo ${value} ${pluralForm}
		else
			echo ${value} ${singularForm}
		fi
	}

	$@
}