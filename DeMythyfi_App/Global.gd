extends Node



var searched: String = ""
var colors : PoolColorArray= [
#	Color("ef476f"), 
#	Color("ffd166"), 
#	Color("06d6a0"), 
#	Color("118ab2")
#	Color.whitesmoke,
#	Color.aliceblue,
#	Color.webmaroon,
#	Color.cornflower,
#	Color.violet
	Color("e56598"),
	Color("b5375b"),
	Color("7da1d4"),
	Color("eff9fe")
	]

const up := "up"
const down := "down"
var directional_colors := {up : Color("00ff93"), down : Color("ff2626")}


# Load files of extension EXT from DIR and return it as an array of loaded resources
static func load_files(dir: String, ext: String = ".ogg") -> Array:
	var files: Array = []
	var filenames: Array = []
	var file_directory: Directory = Directory.new()
	if file_directory.open(dir) == OK:
		if file_directory.list_dir_begin(true) == OK:

			var file: String = file_directory.get_next()
			while file != "":
				if file.right(file.length() - ext.length()) == ext:
					filenames.append(dir + "/" + file)
	#				filenames.append("preload(\"" + dir + file + "\")")
				file = file_directory.get_next()
			file_directory.list_dir_end()
		else:
			print("ERROR: Couldn't load " + ext + " files!")

#	filenames.sort()
#	print(filenames)
	for file in filenames:
		files.append(load(file))
	return files
