include curl.util.CurlUtil

include logger.Logger

@class
JiraUtil(){
	getTicket(){
		local ticket=https://issues.liferay.com/browse/${1}

		if [[ $(CurlUtil isValidUrl ${ticket}) ]]; then
			start ${ticket}
		else
			Logger logErrorMsg "_${1}_is_not_a_valid_JIRA_issue_key"
		fi
	}

	$@
}