include app.server.validator.AppServerValidator
include app.server.version.constants.AppServerVersionConstants
include app.server.version.override.AppServerVersionOverride

include string.util.StringUtil

@class
AppServerVersion(){
	getAppServerVersion(){
		if [[ 	$(AppServerValidator isJboss appServer) ||
				$(AppServerValidator isTomcat appServer) ||
				$(AppServerValidator isWebsphere appServer) ||
				$(AppServerValidator isWildfly appServer) ]]; then

			local _appServer=$(StringUtil capitalize ${appServer})

			AppServerVersionOverride get${_appServer}Version ${liferayVersion}
		elif [[ $(AppServerValidator isTCServer appServer) ]]; then
			AppServerVersionConstants TCSERVER_VERSION
		else
			AppServerVersionConstants $(
				StringUtil toUpperCase ${appServer})_VERSION
		fi
	}

	local appServer=$(AppServerValidator returnAppServer ${@})
	local liferayVersion=${3}

	$@
}