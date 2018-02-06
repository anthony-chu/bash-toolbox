include file.util.FileUtil
include file.writer.FileWriter

include test.executor.TestExecutor
include test.util.TestUtil

@class
FileWriterTest(){
	@test
	testAppendCreateFile(){
		local isNotFile=$(${assertDoesNotExist} testFile)

		local content="this is a string"

		FileWriter append ${testFile} "${content}"

		local fileContent=$(FileUtil getContent ${testFile})

		if [[ ${isNotFile} == PASS &&
			$(${assertExists} testFile) == PASS &&
			$(${assertEquals} content fileContent) == PASS ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	@test
	testAppendExistingFile(){
		local testFile=$(FileUtil makeFile ${testFile})

		FileWriter append ${testFile} "this is a string"

		local content="this is a string"
		local fileContent=$(FileUtil getContent ${testFile})

		${assertEquals} content fileContent
	}

	@test
	testReplace(){
		FileWriter append ${testFile} "this is a string"
		FileWriter replace ${testFile} this that

		local content="that is a string"
		local fileContent=$(FileUtil getContent ${testFile})

		${assertEquals} content fileContent
	}

	local assertDoesNotExist="TestUtil assertDoesNotExist"
	local assertEquals="TestUtil assertEquals"
	local assertExists="TestUtil assertExists"
	local testDir=$(TestUtil setupTestDir)
	local testFile=${testDir}/test.txt

	$@

	TestUtil tearDown
}