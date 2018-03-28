package app.server

include string.util.StringUtil
include string.validator.StringValidator

@class
AppServerVersion(){
	returnAppServerVersion(){
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