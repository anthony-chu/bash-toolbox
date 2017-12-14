include file.util.FileUtil
include file.writer.FileWriter

include test.executor.TestExecutor
include test.util.TestUtil

@class
FileWriterTest(){
	run(){
		TestExecutor executeTest FileWriterTest
	}

	setUp(){
		local _testDir=$(FileUtil construct ${testDir})
	}

	tearDown(){
		rm -rf ${testDir}
	}

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
	local testDir=$(pwd)/bash-toolbox/test/dependencies
	local testFile=${testDir}/test.txt

	setUp

	$@

	tearDown
}