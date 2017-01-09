include app.server.validator.AppServerValidator
include app.server.version.AppServerVersion

include base.vars.BaseVars

include string.util.StringUtil

AppServerFactory(){
	getAppServerDir(){
		local appServer=$(AppServerValidator returnAppServer ${2})
		local _appServerDir=(
			$(BaseVars returnBundleDir ${1})/
			${appServer}-
			$(AppServerVersion returnAppServerVersion ${appServer} $(BaseVars
				returnBranch ${1}))
		)

		StringUtil build _appServerDir
	}

	$@
}