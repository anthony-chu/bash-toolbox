FileIOUtil(){
	append(){
		local toFile=${1}
		shift
		local string=$@

		echo -e "\n${string}" >> ${toFile}
	}

	replace(){
		local toFile=${1}
		local oldStr=${2}
		local newStr=${3}

		sed -i "s/${oldStr}/${newStr}/g" ${toFile}
	}

	$@
}