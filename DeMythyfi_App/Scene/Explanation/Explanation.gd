extends CanvasLayer

onready var chart : LineChart2D = $Explanation/LineChart

func _ready():
	chart.plot()
	$PieChart.plot()
	

func hide() -> void:
	$Explanation.hide()


func _on_Home_pressed():
	get_tree().change_scene("res://Scene/Home.tscn")
