include curl.util.CurlUtil

include logger.Logger

@class
JiraUtil(){
	getTicket(){
		local ticket=https://issues.liferay.com/browse/${1}

		case $(CurlUtil getHTTPResponse ${ticket}) in
			200 ) start ${ticket} ;;
			* ) Logger logErrorMsg "_${1}_is_not_a_valid_JIRA_issue_key" ;;
		esac
	}

	$@
}