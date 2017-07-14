include file.util.FileUtil
include file.writer.FileWriter

PropsTestUtil(){
	writePropsFile(){
		local _propsFile=$(FileUtil makeFile ${propsFile})
		FileWriter append ${_propsFile} test.enabled=true
	}

	$@
}