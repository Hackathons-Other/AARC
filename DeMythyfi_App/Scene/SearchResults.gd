extends MarginContainer

var names := ["Noe Nayme", "Anoni Musk", "Jenair Rick", "Silli Pundts"]

func _ready() -> void:
	$Home/Body/SearchBar/TextEdit.text = Global.searched
	$Home/Body/Stonks/Stonks/SearchTerms.text = Global.searched
	for child in $Home/Body/Stonks/Stonks.get_children():
		if child is Field:
			child.change_quote("I predict " + Global.searched + " will yeet up")
			child.change_name(names[randi() % names.size()])
			child.change_icon_color(Global.colors[randi() % Global.colors.size()])


func _on_Home_button_up():
	get_tree().change_scene("res://Scene/Home.tscn")
