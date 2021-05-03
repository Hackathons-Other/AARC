extends Control

onready var chart : LineChart2D = $Chart2D

func _ready():
	chart.plot()

func _on_Button_button_down():
	get_tree().change_scene("res://Scene/Home.tscn")
