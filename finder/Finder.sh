include finder.util.FinderUtil

Finder(){
	findAllFiles(){
		FinderUtil _find
	}

	findBySubstring(){
		FinderUtil _find | grep ${1}
	}

	$@
}