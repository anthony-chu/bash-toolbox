include app.server.version.constants.AppServerVersionConstants

include base.vars.BaseVars

include string.validator.StringValidator

@class
AppServerVersionOverride(){
	getTomcatVersion(){
		if [[ $(StringValidator isSubstring ${branch} 7.0) ]]; then
			echo 8.0.32
		elif [[ $(StringValidator isSubstring ${branch} ee-6.2) ]]; then
			echo 7.0.62
		elif [[ $(StringValidator isSubstring ${branch} 6.2) ]]; then
			echo 7.0.42
		elif [[ $(StringValidator isSubstring ${branch} 6.1) ]]; then
			echo 7.0.40
		elif [[ $(StringValidator isSubstring ${branch} 6.0.12) ]]; then
			echo 6.0.32
		elif [[ $(StringValidator isSubstring ${branch} 6.0.6) ]]; then
			echo 6.0.29
		else
			AppServerVersionConstants TOMCAT_VERSION
		fi
	}

	getWildflyVersion(){
		if [[ $(StringValidator isSubstring ${branch} 7.0) ]]; then
			echo 10.0.0
		elif [[ $(StringValidator isSubstring ${branch} master) ||
				$(StringValidator isSubstring ${branch} 7.1) ]]; then

			AppServerVersionConstants WILDFLY_VERSION
		fi
	}

	local branch=${2}

	$@
}