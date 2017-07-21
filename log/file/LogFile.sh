include app.server.validator.AppServerValidator

include base.vars.BaseVars

include calendar.util.CalendarUtil

include git.util.GitUtil

include file.util.FileUtil

include string.util.StringUtil

LogFile(){
	get(){
		local appServer=$(AppServerValidator returnAppServer ${1})
		local branch=$(BaseVars returnBranch ${2})

		local logFile=(/d/logs/${branch}/${appServer}/
			$(CalendarUtil getTimestamp date)/
			${branch}-build-$(GitUtil getSHA ${branch} short)-
			$(CalendarUtil getTimestamp clock).log
		)

		FileUtil makeFile $(StringUtil join logFile)
	}

	write(){
		local logFile=$(readvar ${1})
		shift
		local cmd=$(readvar ${2})

		${cmd} |& tee -a ${logFile}
	}

	$@
}