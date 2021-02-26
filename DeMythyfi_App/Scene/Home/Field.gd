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
		Percent.modulate = Global.directional_colors[Global.down]
	else:
		Percent.modulate = Global.directional_colors[Global.up]
	Percent.text = str(round(conf)) + "%"


func init_random() -> void:
	# TODO: Get actual dir
	randomize()
	set_confidence(randf() * 100)
	var coin_flip := randi() % 2
	if coin_flip == 1:
		set_dir(Global.up)
	else:
		set_dir(Global.down)

func set_dir(dir: String) -> void:
	"""Use Global.up or Global.down as dir"""
	Direction.modulate = Global.directional_colors[dir]
	if dir == Global.down:
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
