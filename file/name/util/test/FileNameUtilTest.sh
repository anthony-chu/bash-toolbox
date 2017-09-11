include file.name.util.FileNameUtil

include test.executor.TestExecutor
include test.util.TestUtil

FileNameUtilTest(){
	run(){
		TestExecutor executeTest FileNameUtilTest
	}

	testGetPathConvertToNixPath(){
		local path="D:/foo/bar"

		${assertEquals} $(FileNameUtil getPath nix ${path}) /d/foo/bar
	}

	testGetPathConvertToWinPath(){
		local path="/d/foo/bar"

		${assertEquals} $(FileNameUtil getPath win ${path}) D:/foo/bar
	}

	testGetPathPreserveNixPath(){
		local path="/d/foo/bar"

		${assertEquals} ${path} $(FileNameUtil getPath nix ${path})
	}

	testGetPathPreserveWinPath(){
		local path="D:/foo/bar"

		${assertEquals} ${path} $(FileNameUtil getPath win ${path})
	}

	local assertEquals="TestUtil assertEquals"

	$@
}