extends MarginContainer


func _on_Search_button_up():
	Global.searched = $Body/SearchBar/TextEdit.text
	get_tree().change_scene("res://Scene/SearchResults.tscn")
