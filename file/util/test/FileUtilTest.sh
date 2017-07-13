include file.util.FileUtil
include file.writer.FileWriter

include test.executor.TestExecutor
include test.util.TestUtil

FileUtilTest(){
	run(){
		TestExecutor executeTest FileUtilTest
	}

	setUp(){
		if [ ! -d ${testDir} ]; then
			mkdir ${testDir}
		fi
	}

	tearDown(){
		rm -rf ${testDir}
	}

	testConstruct(){
		${assertExists} $(FileUtil construct ${testDir}/foo)
	}

	testGetContent(){
		local content="this is a string"
		local file=$(FileUtil makeFile ${testDir}/test.txt)

		FileWriter append ${file} "this is a string"

		local fileContent=$(FileUtil getContent ${file})

		${assertEquals} content fileContent
	}

	testMakeFile(){
		${assertExists} $(FileUtil makeFile ${testDir}/test.txt)
	}

	local assertEquals="TestUtil assertEquals"
	local assertExists="TestUtil assertExists"
	local testDir=~/test

	setUp

	$@

	tearDown
}