include file.name.util.FileNameUtil

include test.executor.TestExecutor
include test.util.TestUtil

@class
FileNameUtilTest(){
	run(){
		TestExecutor executeTest FileNameUtilTest
	}

	@test
	testGetPathConvertToNixPath(){
		local path="D:/foo/bar"

		${assertEquals} $(FileNameUtil getPath nix ${path}) /d/foo/bar
	}

	@test
	testGetPathConvertToWinPath(){
		local path="/d/foo/bar"

		${assertEquals} $(FileNameUtil getPath win ${path}) D:/foo/bar
	}

	@test
	testGetPathPreserveNixPath(){
		local path="/d/foo/bar"

		${assertEquals} ${path} $(FileNameUtil getPath nix ${path})
	}

	@test
	testGetPathPreserveWinPath(){
		local path="D:/foo/bar"

		${assertEquals} ${path} $(FileNameUtil getPath win ${path})
	}

	local assertEquals="TestUtil assertEquals"

	$@
}