include app.server.validator.AppServerValidator
include app.server.version.AppServerVersion

include base.comparator.BaseComparator
include base.vars.BaseVars

include git.util.GitUtil

include string.util.StringUtil

JiraUtil(){
	@private
	_getEnv(){
		local appServerVersion=$(AppServerVersion
			returnAppServerVersion ${1} ${2})

		local environment=(
			$(StringUtil capitalize ${1})
			${appServerVersion}
			+_MySQL_5.7
		)

		StringUtil replace $(StringUtil join environment _) _ space
		echo "Portal *${branch}* GIT ID: $(GitUtil getOriginSHA ${branch})"
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

	tested(){
		echo "*Tested on:*"
	}

	local appServer=$(AppServerValidator returnAppServer ${@})
	local branch=$(BaseVars returnBranch ${@})

	while [[ $(BaseComparator isEqual ${1} ${branch}) || $(
		BaseComparator isEqual ${1} ${appServer}) ]]; do

		shift
	done

	if [[ $(BaseComparator isEqual ${branch} master) ]]; then
		local branch=$(StringUtil capitalize ${branch})
	fi

	$@
	_getEnv ${appServer} ${branch}
}