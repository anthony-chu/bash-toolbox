include file.validator.FileValidator

include test.util.TestUtil

@class
FileValidatorTest(){
	@test
	testIsFile(){
		${assertTrue} $(FileValidator isFile _file)
	}

	@test
	testIsNotFile(){
		${assertNull} $(FileValidator isFile _path)
	}

	@test
	testIsNotPath(){
		${assertNull} $(FileValidator isPath _file)
	}

	@test
	testIsPath(){
		${assertTrue} $(FileValidator isPath _path)
	}

	local _file=/path/to/file.name
	local _path=/path/to/file

	local assertNull="TestUtil assertNull"
	local assertTrue="TestUtil assertTrue"

	$@
}