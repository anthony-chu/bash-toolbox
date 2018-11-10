include file.validator.FileValidator

include test.util.TestUtil

@class
FileValidatorTest(){
	@test
	testIsFile(){
		${assertTrue} $(FileValidator isFile _file)
	}

	@test
	testIsFilePathFile(){
		${assertTrue} $(FileValidator isFilePath _file)
	}

	@test
	testIsFilePathPath(){
		${assertTrue} $(FileValidator isFilePath _path)
	}

	@test
	testIsNotFile(){
		${assertNull} $(FileValidator isFile _path)
	}

	@test
	testIsNotFilePath(){
		${assertNull} $(FileValidator isFilePath @${path})
	}

	@test
	testIsNotPath(){
		TestUtil assertNotNull $(FileValidator isPath _file)
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