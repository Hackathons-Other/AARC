extends Node

func read_csv(path: String) -> Array:
	var data := []
	var file := File.new()
	file.open(path, file.READ)
	while !file.eof_reached():
		var more := []
		var csv = file.get_csv_line()
#		if csv.size()>=7 and csv[2] != groupname:
#			groupname=csv[2]
		for string in csv:
			more.append(string)
		data.append(more)
	file.close()
	return data

func get_rand_row() -> Array:
	return DATA[(randi()) % (DATA.size() - 1) + 1]

func get_row(index : int) -> Array:
	return DATA[index + 1]

var DATA : Array

func get_rand_name() -> String:
	return get_analyst_name(get_rand_row())

func get_analyst_name(row: Array) -> String:
	return row[0]

func get_rand_quote() -> String:
	return get_quote(get_rand_row())

func get_quote(row: Array) -> String:
	return row[8]

func _ready():
	DATA = read_csv("res://csv/analysts_dataset.csv")
	print(get_rand_row())
##	print(read_csv("res://csv/sample1.csv"))
#	print(read_csv("res://csv/analysts_dataset.csv"))
