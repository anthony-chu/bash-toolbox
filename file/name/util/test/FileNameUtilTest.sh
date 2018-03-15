include file.name.util.FileNameUtil

include test.util.TestUtil

@class
FileNameUtilTest(){
	@test
	testGetPathConvertToNixPath(){
		local path="D:/foo/bar"

		${assertEquals} $(FileNameUtil _getPathUnix ${path}) /d/foo/bar
	}

	@test
	testGetPathConvertToWinPath(){
		local path="/d/foo/bar"

		${assertEquals} $(FileNameUtil _getPathWin ${path}) D:/foo/bar
	}

	@test
	testGetPathPreserveNixPath(){
		local path="/d/foo/bar"

		${assertEquals} ${path} $(FileNameUtil _getPathUnix ${path})
	}

	@test
	testGetPathPreserveWinPath(){
		local path="D:/foo/bar"

		${assertEquals} ${path} $(FileNameUtil _getPathWin ${path})
	}

	local assertEquals="TestUtil assertEquals"

	$@
}