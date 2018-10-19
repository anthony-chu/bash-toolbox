include file.writer.FileWriter

include repo.Repo

@class
UpgradePropsWriter(){
    writeUpgradeProps(){
        local fromPropsDir=${buildDir}/portal-impl/src

        local fromPropsFileName=portal-legacy-${fromVersion}.properties

        local fromPropsFilePath=${fromPropsDir}/${fromPropsFileName}

        ${append} ${propsFile}

        ${append} ${propsFile} "### ${fromVersion} properties ###"

        ${append} ${propsFile}

        cat ${fromPropsFilePath} >> ${propsFile}

        ${append} ${propsFile}
    }

    local append="FileWriter append"

    local branch=$(Repo getBranch ${2})

    local buildDir=$(Repo getBuildDir ${branch})
    local bundleDir=$(Repo getBundleDir ${branch})

    local fromVersion=${3}

    local propsFile=${bundleDir}/portal-ext.properties

    $@
}