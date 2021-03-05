extends HBoxContainer

signal sort_confidence

func _on_Confidence_button_up():
	emit_signal("sort_confidence")
