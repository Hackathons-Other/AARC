class_name Topic
extends VBoxContainer

onready var tween := $Tween
export var fade_time := .2


var descending := true
var names : PoolStringArray = ["$GME", "$MOON", "$OOPS", "$LOL", "$TLDR", "$WAT", "$YOO", "$EAT", "$HAH"]
var person_names : PoolStringArray = ["Noe Nayme", "Anoni Musk", "Jenair Rick", "Silli Pundts"]
var confidences := []

func _ready():
#	for child in get_children():
#		if child is Topic:
#			print(child.name)
	randomize()
	get_node("Toggle").text = names[randi() % names.size()]
	get_node("Toggle").self_modulate = Global.colors[randi() % Global.colors.size()]
	for child in get_children():
		if child is Field:
			randomize()
			var conf := randf() * 100
			child.set_confidence(conf)
			var p_name := person_names[randi() % person_names.size()]
			child.set_name(p_name)
			var color = Global.colors[randi() % Global.colors.size()]
			child.set_color(color)
			confidences.append([conf, p_name, color])




func _on_Tween_tween_completed(object, key):
	if key == ":modulate:a":
		for child in get_children():
			if (child is Field or child.name == "Header") and child.modulate.a == 0:
				child.hide()


func _on_Confidence_button_up():
	var i := 0
	if descending:
		confidences.sort_custom(CustomSort, "sort_descending")
	else:
		confidences.sort_custom(CustomSort, "sort_ascending")
	descending = !descending # TODO: need to set this for each individual column
	for child in get_children():
		if child is Field:
			child.set_confidence(confidences[i][0])
			child.set_name(confidences[i][1])
			child.set_color(confidences[i][2])
			i += 1

class CustomSort:
	static func sort_descending(a, b):
		if a[0] > b[0]: # ONLY WORKS FOR CONFIDENCE SCORE FOR NOW BC OF 0 INDEX
			return true
		return false
	static func sort_ascending(a, b):
		if a[0] < b[0]: # ONLY WORKS FOR CONFIDENCE SCORE FOR NOW BC OF 0 INDEX
			return true
		return false

func _on_Toggle_button_down():
	for child in get_children():
		if child is Field or child.name == "Header":
			if !child.visible:
				child.show()
			tween.interpolate_property(child, "modulate:a", child.modulate.a, int(round(child.modulate.a + 1)) % 2, fade_time)
			tween.start()
