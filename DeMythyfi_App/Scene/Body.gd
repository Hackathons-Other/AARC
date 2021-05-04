extends VBoxContainer

var color := [Color("ef476f"), Color("ffd166"), Color("06d6a0"), Color("118ab2")]

func _ready():
	for child in get_children():
		if child is Topic:
#			print(child.name)
			child.get_node("Toggle").self_modulate = color[randi() % color.size()]
