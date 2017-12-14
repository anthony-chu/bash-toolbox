include file.util.FileUtil
include file.writer.FileWriter

include string.util.StringUtil

@class
CommandValidatorTestUtil(){
	writeBashFile(){
		local content=(
			"@class\nTest(){\n\t@description\n\talpha(){\n\t\techo\n\t}"
			"\n\n\t@ignore\n\tbeta(){\n\t\techo\n\t}"
			"\n\n\t@private\n\tkappa(){\n\t\techo\n\t}"
			"\n\n\t@test\n\tdelta(){\n\t\techo\n\t}"
			"\n\n\t\$@\n}"
		)

		FileWriter append $(FileUtil makeFile ${1}) $(StringUtil join content)
	}

	$@
}