include matcher.Matcher

include string.util.StringUtil
include string.validator.StringValidator

@class
FileValidator(){
	isFile(){
		local filePath=$(readvar ${1})

		if [[ $(StringValidator isSubstring filePath [.]) ]]; then
			local newFilePath=$(StringUtil trim filePath . 1)

			isPath newFilePath
		fi
	}

	isPath(){
		local filePath=$(readvar ${1})

		if [[ ! $(StringValidator isSubstring filePath [.]) ]]; then
			local pattern='\(/[a-zA-Z\]\+\)\+'

			Matcher matches pattern filePath
		fi
	}

	$@
}