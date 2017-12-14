include file.util.FileUtil
include file.writer.FileWriter

include string.util.StringUtil

@class
CommandValidatorTestUtil(){
	writeBashFile(){
		local content=(
			"Test(){\n\t@ignore\n\talpha(){\n\t\techo\n\t}"
			"\n\n\t@private\n\tbeta(){\n\t\techo\n\t}"
			"\n\n\t@test\n\tkappa(){\n\t\techo\n\t}\n\n\t\$@\n}"
		)

		FileWriter append $(FileUtil makeFile ${1}) $(StringUtil join content)
	}

	$@
}