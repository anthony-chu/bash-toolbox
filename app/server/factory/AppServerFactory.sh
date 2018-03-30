include app.server.validator.AppServerValidator
include app.server.version.AppServerVersion

include base.vars.BaseVars

include string.util.StringUtil

@class
AppServerFactory(){
	getAppServerDir(){
		local appServer=$(AppServerValidator returnAppServer ${2})
		local _appServerDir=(
			$(BaseVars getBundleDir ${1})/
			${appServer}-
			$(AppServerVersion getAppServerVersion ${appServer} $(BaseVars
				getBranch ${1}))
		)

		StringUtil join _appServerDir
	}

	$@
}