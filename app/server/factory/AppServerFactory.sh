include app.server.validator.AppServerValidator
include app.server.version.AppServerVersion

include base.vars.BaseVars

include string.util.StringUtil

@class
AppServerFactory(){
	getAppServerDir(){
		local appServer=$(AppServerValidator returnAppServer ${2})
		local _appServerDir=(
			$(BaseVars returnBundleDir ${1})/
			${appServer}-
			$(AppServerVersion returnAppServerVersion ${appServer} $(BaseVars
				returnBranch ${1}))
		)

		StringUtil join _appServerDir
	}

	$@
}