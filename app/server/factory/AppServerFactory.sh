AppServerFactory(){
	local packages=(
		app.server.validator.AppServerValidator
		app.server.version.AppServerVersion
		base.vars.BaseVars
		string.util.StringUtil
	)

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

	include ${packages[@]}

	$@

	exclude ${packages[@]}
}