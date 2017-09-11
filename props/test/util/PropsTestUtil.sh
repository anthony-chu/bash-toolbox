include file.util.FileUtil
include file.writer.FileWriter

PropsTestUtil(){
	writePropsFile(){
		FileWriter append $(FileUtil makeFile ${propsFile}) test.enabled=true
	}

	$@
}