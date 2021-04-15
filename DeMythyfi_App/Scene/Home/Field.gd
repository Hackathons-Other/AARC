class_name Field
extends HBoxContainer

onready var Percent := $CenterContainer/Profile/Percent
onready var Direction := $Direction
onready var Icon := $CenterContainer/Icon

var confidence : float

#func _ready() -> void:
#	init_random()

func set_quote(s: String) -> void:
	$Quotes.text = s

func set_name(to : String) -> void:
	$CenterContainer/Profile/Name.text = to

func set_color(color : Color) -> void:
	Icon.modulate = color

func set_confidence(conf: float) -> void:
	confidence = conf
	if conf < 50:
		Percent.modulate = G.directional_colors[G.down]
	else:
		Percent.modulate = G.directional_colors[G.up]
	Percent.text = str(round(conf)) + "%"


func init_random() -> void:
	# TODO: Get actual dir
	randomize()
	set_confidence(randf() * 100)
	var coin_flip := randi() % 2
	if coin_flip == 1:
		set_dir(G.up)
	else:
		set_dir(G.down)

func set_dir(dir: String) -> void:
	"""Use G.up or G.down as dir"""
	Direction.modulate = G.directional_colors[dir]
	if dir == G.down:
		Direction.flip_v = true
	else:
		Direction.flip_v = false

var dist_dragged: float = 0
var first_drag_pos: Vector2 = Vector2()

func _on_Quotes_gui_input(event):
	# TODO: enable for mobile: (event is InputEventScreenTouch or 
	if (event is InputEventMouseButton and event.button_index == BUTTON_LEFT):
		if !event.pressed and dist_dragged <= 3:
			OS.shell_open("www.google.com")
		elif event.pressed:
			first_drag_pos = event.global_position


func _on_Percent_gui_input(event: InputEvent):
	if event.is_action_pressed("click"):
		get_tree().change_scene("res://Scene/Explanation/Explanation.tscn")
