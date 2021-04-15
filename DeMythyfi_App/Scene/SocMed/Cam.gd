extends Camera2D

var clicked := false

#func _unhandled_input(event):
#	if event.is_action_pressed("click"):
#		clicked = true
#	elif event.is_action_released("click"):
#		clicked = false
#	if event is InputEventMouseMotion and clicked:
#		position -= event.relative
