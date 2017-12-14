include file.util.FileUtil
include file.writer.FileWriter

@class
PropsTestUtil(){
	writePropsFile(){
		FileWriter append $(FileUtil makeFile ${1}) test.enabled=true
	}

	$@
}