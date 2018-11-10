include matcher.Matcher

include string.util.StringUtil

@class
FileValidator(){
	isFile(){
		local filePath=$(readvar ${1})

		if [[ ${filePath} =~ . ]]; then
			local newFilePath=$(StringUtil trim filePath . 1)

			isPath newFilePath
		fi
	}

	isFilePath(){
		isPath ${1} || isFile ${1}
	}

	isPath(){
		local filePath=$(readvar ${1})
		local pattern='\(/[a-zA-Z\]\+\)\+'

		Matcher matches pattern filePath
	}

	$@
}