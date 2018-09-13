include app.server.version.constants.AppServerVersionConstants

include base.vars.BaseVars

include string.validator.StringValidator

@class
AppServerVersionOverride(){
	getTomcatVersion(){
		if [[ $(StringValidator isSubstring ${version} 7.0) ]]; then
			echo 8.0.53
		elif [[ $(StringValidator isSubstring ${version} 6.2) ]]; then
			echo 7.0.90
		elif [[ $(StringValidator isSubstring ${version} 6.1) ]]; then
			echo 7.0.40
		elif [[ $(StringValidator isSubstring ${version} 6.0.12) ]]; then
			echo 6.0.32
		elif [[ $(StringValidator isSubstring ${version} 6.0.6) ]]; then
			echo 6.0.29
		else
			AppServerVersionConstants TOMCAT_VERSION
		fi
	}

	getWebsphereVersion(){
		if [[ $(StringValidator isSubstring ${version} 7.1) || $(
				StringValidator isSubstring ${version} master) ]]; then

			AppServerVersionConstants WEBSPHERE_VERSION
		elif [[ $(StringValidator isSubstring ${version} 7.0) ]]; then
			echo 8.5.5.0
		fi
	}

	getWildflyVersion(){
		if [[ $(StringValidator isSubstring ${version} 7.0) ]]; then
			echo 10.0.0
		elif [[ $(StringValidator isSubstring ${version} master) ||
				$(StringValidator isSubstring ${version} 7.1) ]]; then

			AppServerVersionConstants WILDFLY_VERSION
		fi
	}

	local version=${2}

	$@
}