include app.server.validator.AppServerValidator
include app.server.version.AppServerVersion

include repo.Repo

include string.util.StringUtil

@class
AppServerFactory(){
	getAppServerDir(){
		local _appServerDir=(
			$(Repo getBundleDir ${branch})/
			${appServer}-
			$(AppServerVersion getAppServerVersion ${appServer} ${branch})
		)

		StringUtil join _appServerDir
	}

	local appServer=$(AppServerValidator returnAppServer $@)
	local branch=$(Repo getBranch $@)

	$@
}