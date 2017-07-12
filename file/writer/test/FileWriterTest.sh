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
		_testFile=$(FileUtil makeFile ${testFile})
	}

	tearDown(){
		local testDir=($(StringUtil split testFile /))

		local testDir=($(ArrayUtil trim testDir 1))

		local testDir=$(StringUtil replace testDir space /)

		rm -rf /${testDir}
	}

	testAppend(){
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
	local testFile=$(pwd)/bash-toolbox/test/dependencies/test.txt

	setUp

	$@

	tearDown
}