class_name Field
extends HBoxContainer

func change_quote(s: String) -> void:
	$Quotes.text = s

func change_name(to : String) -> void:
	$Profile/Name.text = to

func change_icon_color(color : Color) -> void:
	$Profile/Icon.modulate = color
