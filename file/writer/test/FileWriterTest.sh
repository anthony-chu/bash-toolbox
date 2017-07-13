include array.util.ArrayUtil

include file.util.FileUtil
include file.writer.FileWriter

include string.util.StringUtil

include test.executor.TestExecutor
include test.util.TestUtil

FileWriterTest(){
	run(){
		TestExecutor executeTest FileWriterTest
	}

	setUp(){
		local _testDir=$(FileUtil construct ${testDir})
	}

	tearDown(){
		rm -rf /${testDir}
	}

	testAppendExistingFile(){
		local testFile=$(FileUtil makeFile ${testFile})

		FileWriter append ${testFile} "this is a string"

		local content="this is a string"
		local fileContent=$(FileUtil getContent ${testFile})

		${assertEquals} content fileContent
	}

	testReplace(){
		FileWriter append ${testFile} "this is a string"
		FileWriter replace ${testFile} this that

		local content="that is a string"
		local fileContent=$(FileUtil getContent ${testFile})

		${assertEquals} content fileContent
	}

	local assertEquals="TestUtil assertEquals"
	local testDir=$(pwd)/bash-toolbox/test/dependencies
	local testFile=$(pwd)/bash-toolbox/test/dependencies/test.txt

	setUp

	$@

	tearDown
}