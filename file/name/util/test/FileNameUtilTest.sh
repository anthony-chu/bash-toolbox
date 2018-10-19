include file.name.util.FileNameUtil

include test.util.TestUtil

@class
FileNameUtilTest(){
	@test
	testGetHybridPathFromUnixPath(){
		local path=/d/foo/bar

		${assertEquals} $(FileNameUtil getHybridPath ${path}) D:/foo/bar
	}

	@test
	testGetHybridPathFromWindowsPath(){
		local path="D:\\foo\\bar"

		${assertEquals} $(FileNameUtil getHybridPath ${path}) D:/foo/bar
	}

	@test
	testGetPathConvertToUnixPath(){
		local path="D:\\foo\\bar"

		${assertEquals} $(FileNameUtil _getPathUnix ${path}) /d/foo/bar
	}

	@test
	testGetPathConvertToWinPath(){
		local path="/d/foo/bar"

		${assertEquals} $(FileNameUtil _getPathWin ${path}) 'D:\\foo\\bar'
	}

	@test
	testGetPathPreserveUnixPath(){
		local path="/d/foo/bar"

		${assertEquals} ${path} $(FileNameUtil _getPathUnix ${path})
	}

	@test
	testGetPathPreserveWinPath(){
		local path="D:\\foo\\bar"

		${assertEquals} ${path} $(FileNameUtil _getPathWin ${path})
	}

	local assertEquals="TestUtil assertEquals"

	$@
}