include app.server.version.constants.AppServerVersionConstants

include base.vars.BaseVars

include string.validator.StringValidator

@class
AppServerVersionOverride(){
	getTomcatVersion(){
		if [[ $(StringValidator isNull ${branch}) ]]; then
			AppServerVersionConstants tomcatVersion
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
			AppServerVersionConstants tomcatVersion
		fi
	}

	local branch=$(BaseVars returnBranch $@)

	$@
}