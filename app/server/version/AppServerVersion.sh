include app.server.validator.AppServerValidator
include app.server.version.constants.AppserverVersionConstants
include app.server.version.override.AppServerVersionOverride

include base.vars.BaseVars

include string.util.StringUtil
include string.validator.StringValidator

@class
AppServerVersion(){
	getAppServerVersion(){
		if [[ ! $(StringValidator isNull ${@}) ]]; then
			if [[ $(AppServerValidator isTomcat appServer) ]]; then
				AppServerVersionOverride getTomcatVersion ${branch}
			elif [[ $(AppServerValidator isWildfly appServer) ]]; then
				AppServerVersionOverride getWildflyVersion ${branch}
			elif [[ $(AppServerValidator isTCServer appServer) ]]; then
				AppServerVersionConstants TCSERVER_VERSION
			else
				AppServerVersionConstants $(
					StringUtil toUpperCase ${appServer})_VERSION
			fi
		fi
	}

	local appServer=$(AppServerValidator returnAppServerValidator $@)
	local branch=$(BaseVars getBranch $@)

	$@
}