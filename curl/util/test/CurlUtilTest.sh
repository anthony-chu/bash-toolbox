include curl.util.CurlUtil

include test.util.TestUtil

@class
CurlUtilTest(){
	@test
	testGetHTTPResponse(){
		${assertEquals} $(CurlUtil getHTTPResponse https://www.google.com/) 200
	}

	@test
	testIsValidUrlInvalid(){
		${assertNull} $(CurlUtil isValidUrl https://issues.lifeary.com/browse/LPS-0)
	}

	@test
	testIsValidUrlValid(){
		${assertTrue} $(CurlUtil isValidUrl https://www.google.com/)
	}

	local assertEquals="TestUtil assertEquals"
	local assertNull="TestUtil assertNull"
	local assertTrue="TestUtil assertTrue"

	$@
}