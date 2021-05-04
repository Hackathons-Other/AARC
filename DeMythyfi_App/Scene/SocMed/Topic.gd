class_name TopicSocMed
extends VBoxContainer

onready var tween := $Tween
onready var Toggle := $Toggle
onready var Img := $CenterContainer/Img
export var fade_time := .2


var names : PoolStringArray = ["$GME", "$MOON", "$OOPS", "$LOL", "$TLDR", "$WAT", "$YOO", "$EAT", "$HAH"]
var person_names : PoolStringArray = ["Noe Nayme", "Anoni Musk", "Jenair Rick", "Silli Pundts"]
var imgs := G.load_files("res://Img/Logo/", "jpg")

func _ready():
#	for child in get_children():
#		if child is Topic:
#			print(child.name)
	randomize()
	Img.texture = imgs[randi() % imgs.size()]
	get_node("Toggle").text = names[randi() % names.size()]
	get_node("Toggle").self_modulate = G.colors[randi() % G.colors.size()]
#	for child in get_children():
#		if child is Field:
##			randomize()
#			var conf := randf() * 100
#			child.set_confidence(conf)
#			var p_name := person_names[randi() % person_names.size()]
#			child.set_name(p_name)
#			var color = G.colors[randi() % G.colors.size()]
#			child.set_color(color)
#			confidences.append([conf, p_name, color])


onready var Scroll := $Scroll

func _on_Tween_tween_completed(object, key):
	if key == ":modulate:a":
		if Scroll.modulate.a == 0:
			Scroll.hide()
#		for child in get_children():
#			if child.modulate.a == 0:
#				child.hide()





func _on_Toggle_button_down():
	for child in get_children():
		if child is ScrollContainer:
			if !child.visible:
				child.show()
			tween.interpolate_property(child, "modulate:a", child.modulate.a, int(round(child.modulate.a + 1)) % 2, fade_time)
			tween.start()
#	print(name)


func _on_Toggle_toggled(button_pressed):
	pass # Replace with function body.
