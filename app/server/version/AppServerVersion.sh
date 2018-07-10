include app.server.validator.AppServerValidator
include app.server.version.constants.AppServerVersionConstants
include app.server.version.override.AppServerVersionOverride

include base.vars.BaseVars

include string.util.StringUtil
include string.validator.StringValidator

@class
AppServerVersion(){
	getAppServerVersion(){
		if [[ $(AppServerValidator isTomcat appServer) ||
				$(AppServerValidator isWebsphere appServer) ||
				$(AppServerValidator isWildfly appServer) ]]; then

			local _appServer=$(StringUtil capitalize ${appServer})

			AppServerVersionOverride get${_appServer}Version ${branch}
		elif [[ $(AppServerValidator isTCServer appServer) ]]; then
			AppServerVersionConstants TCSERVER_VERSION
		else
			AppServerVersionConstants $(
				StringUtil toUpperCase ${appServer})_VERSION
		fi
	}

	local appServer=$(AppServerValidator returnAppServer $@)
	local branch=$(BaseVars getBranch $@)

	$@
}