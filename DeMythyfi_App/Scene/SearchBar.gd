extends HBoxContainer
class_name SearchBar

signal searched

func _on_Search_button_up() -> void:
	Global.searched = $Margin/TextEdit.text
	emit_signal("searched")

