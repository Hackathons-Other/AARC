class_name Topic
extends VBoxContainer

onready var tween := $Tween
export var fade_time := .2


var names := ["$GME", "$MOON", "$OOPS", "$LOL", "$TLDR", "$WAT", "$YOO", "$EAT", "$HAH"]

func _ready():
#	for child in get_children():
#		if child is Topic:
#			print(child.name)
	randomize()
	get_node("Toggle").text = names[randi() % names.size()]
	get_node("Toggle").self_modulate = Global.colors[randi() % Global.colors.size()]


func _on_Label_button_down():
	for child in get_children():
		if child is Field:
			if !child.visible:
				child.show()
			tween.interpolate_property(child, "modulate:a", child.modulate.a, int(round(child.modulate.a + 1)) % 2, fade_time)
			tween.start()


func _on_Tween_tween_completed(object, key):
	if key == ":modulate:a":
		for child in get_children():
			if child is Field and child.modulate.a == 0:
				child.hide()
