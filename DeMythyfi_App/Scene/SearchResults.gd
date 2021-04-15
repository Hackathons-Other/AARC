extends MarginContainer

func _ready() -> void:
	$Home/Body/SearchBar/Margin/TextEdit.text = G.searched
	$Home/Body/Stonks/Topic/Toggle.text = G.searched
	for child in $Home/Body/Stonks/Topic.get_children():
		if child is Field:
			child.set_quote(CSV.get_rand_quote())
#			child.set_quote("I predict " + G.searched + " will yeet up")


func _on_Home_button_up():
	get_tree().change_scene("res://Scene/Home.tscn")
