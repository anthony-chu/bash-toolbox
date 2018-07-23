include curl.util.CurlUtil

include logger.Logger

@class
JiraUtil(){
	getTicket(){
		local ticket=https://issues.liferay.com/browse/${1}

		case $(CurlUtil getHTTPResponse ${ticket}) in
			200 | 302 ) start ${ticket} ;;
			* ) ${_log} error "_${1}_is_not_a_valid_JIRA_issue_key" ;;
		esac
	}

	local _log="Logger log"

	$@
}