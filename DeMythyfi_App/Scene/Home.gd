extends MarginContainer

func _ready() -> void:
	$Body/SearchBar/TextEdit.text = Global.searched


func _on_Search_button_up() -> void:
	Global.searched = $Body/SearchBar/TextEdit.text
	get_tree().change_scene("res://Scene/SearchResults.tscn")
