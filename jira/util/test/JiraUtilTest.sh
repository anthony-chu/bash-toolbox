include jira.util.JiraUtil

include test.util.TestUtil

@class
JiraUtilTest(){
	@ignore @test
	testGetTicketReturnErrorMessage(){
		local exception="LPS-0 is not a valid JIRA issue key"
		local response=$(JiraUtil getTicket LPS-0)
		${assertContains} response exception
	}

	local assertContains="TestUtil assertContains"

	$@
 }