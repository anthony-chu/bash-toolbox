include file.name.util.FileNameUtil
include file.writer.FileWriter

include props.writer.util.PropsWriterUtil

include repo.Repo

@class
DefaultPortalPropsWriter(){
	@private
	_writeProps(){
		local file=${2}

		local keyValuePair=${1}

		local key=${keyValuePair%%=*}

		local value=${keyValuePair/${key}=/}

		PropsWriterUtil setProps ${file} ${key} ${value}

		FileWriter append ${file}
	}

	writeBaseProps(){
		local propsKeyValueList=(
			liferay.home=$(FileNameUtil getHybridPath ${bundleDir})
			plugin.notifications.enabled=false
			index.on.startup=false
			browser.launcher.url=
			setup.wizard.enabled=false
			mail.session.jndi.name=
			tunnel.servlet.hosts.allowed=
			auth.verifier.TunnelAuthVerifier.hosts.allowed=
			javascript.fast.load=false
			minifier.enabled=false
		)

		for propsKeyValue in ${propsKeyValueList[@]}; do
			_writeProps ${propsKeyValue} ${propsFile}
		done
	}

	writeClusterProps(){
		local port=11312

		if [[ ${2} && ! ${2//[0-9]/} ]]; then
			local propsKeyValueList=$((port+${2}))
		fi

		local propsKeyValueList=(
			cluster.link.autodetect.address=
			cluster.link.enabled=true
			dl.store.impl=com.liferay.portal.db.DBStore
			web.server.display.node=true
			module.framework.properties.osgi.console=${port}
		)

		for propsKeyValue in ${propsKeyValueList[@]}; do
			_writeProps ${propsKeyValue} ${propsFile}
		done
	}

	writeDatabaseProps(){
		local databaseName=lportal${branch//[-.]/}

		local propsKeyValueList=(
			jdbc.default.jndi.name=
			jdbc.default.driverClassName=com.mysql.jdbc.Driver
			jdbc.default.url=jdbc:mysql://localhost/${databaseName}?useUnicode=true\&characterEncoding=UTF-8\&useFastDateParsing=false
			jdbc.default.username=
			jdbc.default.password=
		)

		for propsKeyValue in ${propsKeyValueList[@]}; do
			_writeProps ${propsKeyValue} ${propsFile}
		done

		FileWriter append ${propsFile}
	}

	local branch=$(Repo getBranch ${2})

	local bundleDir=$(Repo getBundleDir ${branch})

	local propsFile=${bundleDir}/portal-ext.properties

	$@
}