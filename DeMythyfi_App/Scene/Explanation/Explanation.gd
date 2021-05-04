extends CanvasLayer

onready var chart : LineChart2D = $LineChart

func _ready():
	chart.plot()
	$Scroll/Control/PieChart.plot()
	

func hide() -> void:
	$Explanation.hide()


func _on_Home_pressed():
	get_tree().change_scene("res://Scene/Home.tscn")


func _on_Charts_gui_input(event: InputEvent):
	if event.is_action("click"):
		$Scroll/Control/Charts.hide()
		chart.show()
