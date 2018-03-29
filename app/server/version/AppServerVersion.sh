include app.server.validator.AppServerValidator
include app.server.version.constants.AppserverVersionConstants
include app.server.version.override.AppServerVersionOverride

include string.util.StringUtil
include string.validator.StringValidator

@class
AppServerVersion(){
	getAppServerVersion(){
		if [[ ! $(StringValidator isNull ${@}) ]]; then
			local appServer=${1}
			local branch=${2}

			if [[ $(AppServerValidator isTomcat appServer) ]]; then
				AppServerVersionOverride getTomcatVersion ${branch}
			elif [[ $(AppServerValidator isTCServer appServer) ]]; then
				AppServerVersionConstants TCSERVER_VERSION
			else
				AppServerVersionConstants $(
					StringUtil toUpperCase ${appServer})_VERSION
			fi
		fi
	}

	$@
}