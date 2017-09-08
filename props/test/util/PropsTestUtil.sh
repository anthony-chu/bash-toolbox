PropsTestUtil(){
	local packages=(
		file.util.FileUtil
		file.writer.FileWriter
	)

	writePropsFile(){
		FileWriter append $(FileUtil makeFile ${propsFile}) test.enabled=true
	}

	include ${packages[@]}

	$@

	exclude ${packages[@]}
}