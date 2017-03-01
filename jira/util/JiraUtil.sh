include app.server.validator.AppServerValidator
include app.server.version.AppServerVersion

include base.comparator.BaseComparator
include base.vars.BaseVars

include git.util.GitUtil

include string.util.StringUtil

JiraUtil(){
	_getEnv(){
		local appServerVersion=$(AppServerVersion
			returnAppServerVersion ${1} ${2})

		local environment=(
			$(StringUtil capitalize ${1})_
			${appServerVersion}_
			+_MySQL_5.7
		)

		local message=$(StringUtil build environment)

		StringUtil replace message _ space
	}

	fixed(){
		echo "*Fixed on:*"
	}

	nlr(){
		echo "*No Longer Reproducible on:*"
	}

	repro(){
		echo "*Reproduced on:*"
	}

	local _args=(${@})
	local appServer=$(AppServerValidator returnAppServer _args)
	local branch=$(BaseVars returnBranch ${_args[@]})

	if [[ $(BaseComparator isEqual ${branch} master) ]]; then
		branch=$(StringUtil capitalize ${branch})
	fi

	local gitInfo="Portal ${branch} GIT ID: $(GitUtil getOriginSHA ${branch})"

	$@
	_getEnv ${appServer} ${branch}
	echo ${gitInfo}
}