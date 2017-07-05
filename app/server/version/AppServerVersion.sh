include app.server.validator.AppServerValidator
include app.server.version.constants.AppServerVersionConstants

include string.validator.StringValidator

AppServerVersion(){
	_overrideTomcatVersion(){
		local branch=${1}

		if [[ $(StringValidator isNull ${branch}) ]]; then
			AppServerVersionConstants tomcatVersion
		elif [[ $(StringValidator isSubstring ${branch} ee-6.2.x) ]]; then
			echo 7.0.62
		elif [[ $(StringValidator isSubstring ${branch} 6.2) ]]; then
			echo 7.0.42
		elif [[ $(StringValidator isSubstring ${branch} 6.1) ]]; then
			echo 7.0.40
		elif [[ $(StringValidator isSubstring ${branch} ee-6.0) ]]; then
			echo 6.0.32
		elif [[ $(StringValidator isSubstring ${branch} 6.0) ]]; then
			echo 6.0.29
		else
			AppServerVersionConstants tomcatVersion
		fi
	}

	returnAppServerVersion(){
		if [[ ! $(StringValidator isNull ${@}) ]]; then
			local appServer=${1}
			local branch=${2}

			if [[ $(AppServerValidator isTomcat appServer) ]]; then
				_overrideTomcatVersion ${branch}
			elif [[ $(AppServerValidator isTCServer appServer) ]]; then
				AppServerVersionConstants tcserverVersion
			else
				AppServerVersionConstants ${appServer}Version
			fi
		fi
	}

	$@
}