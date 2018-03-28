package app.server

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
				AppServerVersionConstants tcserverVersion
			else
				AppServerVersionConstants ${appServer}Version
			fi
		fi
	}

	$@
}