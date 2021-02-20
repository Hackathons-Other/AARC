class_name Field
extends HBoxContainer

onready var Percent := $CenterContainer/Profile/Percent
onready var Direction := $Direction
onready var Icon := $CenterContainer/Icon

var confidence : float

func _ready() -> void:
	init_random()

func change_quote(s: String) -> void:
	$Quotes.text = s

func change_name(to : String) -> void:
	$CenterContainer/Profile/Name.text = to

func change_icon_color(color : Color) -> void:
	Icon.modulate = color

func set_confidence(conf: float) -> void:
	confidence = conf
	if conf < 50:
		Percent.modulate = Global.directional_colors[Global.down]
	else:
		Percent.modulate = Global.directional_colors[Global.up]


func init_random() -> void:
	# TODO: Get actual dir
	randomize()
	set_confidence(randf() * 100)
	Percent.text = str(round(confidence)) + "%"
	var coin_flip := randi() % 2
	if coin_flip == 1:
		set_dir(Global.up)
	else:
		set_dir(Global.down)

func set_dir(dir: String) -> void:
	Direction.modulate = Global.directional_colors[dir]
	if dir == Global.down:
		Direction.flip_v = true
	else:
		Direction.flip_v = false
