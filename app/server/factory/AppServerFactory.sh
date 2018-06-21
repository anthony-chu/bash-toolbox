include app.server.validator.AppServerValidator
include app.server.version.AppServerVersion

include base.vars.BaseVars

include string.util.StringUtil

@class
AppServerFactory(){
	getAppServerDir(){
		local _appServerDir=(
			$(BaseVars getBundleDir ${branch})/
			${appServer}-
			$(AppServerVersion getAppServerVersion ${appServer} ${branch})
		)

		StringUtil join _appServerDir
	}

	local appServer=$(AppServerValidator returnAppServer $@)
	local branch=$(BaseVars getBranch $@)

	$@
}