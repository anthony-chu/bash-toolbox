BaseUtil(){
	extendAntOpts(){
		if [[ ${1} =~ 6. ]]; then
			echo $(timestamp log) [ INFO_ ] Configuring ANT_OPTS JVM...
			export ANT_OPTS="${ANT_OPTS} -XX:MaxPermSize=1024m"
			echo $(timestamp log) [ INFO_ ] Completed.
		fi
	}

	getCurFile(){
		local thisFile=${0//*\//}

		if [[ ${1} == true ]]; then
			echo ${thisFile}
		elif [[ ${1} == false ]]; then
			echo ${thisFile/.sh/}
		fi
	}

	gitpr(){
		source "d:/git-tools/git-pull-request/git-pull-request.sh"
	}

	portListener(){
		if [[ $# == 0 ]]; then
			exit
		fi

		if [[ $(netstat -an | grep ${1}) ]]; then
			echo true
		fi
	}

	setJavaHome(){
		if [[ ${1} =~ 6. ]]; then
			echo $(timestamp log) [ INFO_ ] Configuring Liferay to use JDK7...
			export JAVA_HOME="C:\Program Files\Java\jdk1.7.0_80"
			echo $(timestamp log) [ INFO_ ] Completed.
		fi
	}

	$@
}