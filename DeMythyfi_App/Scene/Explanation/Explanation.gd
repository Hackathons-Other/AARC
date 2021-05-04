extends CanvasLayer

onready var chart : LineChart2D = $LineChart
const ANALYST_DIR := "res://backend/analysis/"
const CHART_FOLDER_END := "_analysis"
onready var charts := [
	$Scroll/Control/Charts/Chart,
	$Scroll/Control/Charts/HBox/Chart2,
	$Scroll/Control/Charts/HBox/Chart3
]
var analyst := "Joe Tenebruso"
func _ready():
	plot()

func plot() -> void:
	chart.plot()
	$Scroll/Control/PieChart.plot()
	var metrics := CSV.read_json(ANALYST_DIR + analyst + "_analysis/metrics.json")
	var Analytics := get_node("Scroll/Control/Analytics")
	Analytics.get_node("Name").text = analyst
	for metric in metrics:
		var val = metrics[metric]
#		print(metric.capitalize())
		set_metric(Analytics.get_node(metric.capitalize()), val)
	var i := 0
	for chart in CSV.load_files(ANALYST_DIR + analyst + CHART_FOLDER_END):
		charts[i].texture = chart
		i += 1

func set_metric(metric, val: float) -> void:
	var end := ""
	if metric.name == "Accuracy":
		end = "%"
		val = round(val * 10000) / 100
	else:
		val = round(val * 100) / 100
	metric.get_node("Value").text = str(val) + end

var original

func hide(hide_it := true) -> void:
	original.visible = hide_it
	$VBox.visible = !hide_it
	$Scroll.visible = !hide_it
	chart.visible = !hide_it
	$bg.visible = !hide_it

func show() -> void:
	$Scroll/Control/PieChart.plot()
	hide(false)

func _on_Home_pressed():
	hide()
#	get_tree().change_scene("res://Scene/Home.tscn")


func _on_Charts_gui_input(event: InputEvent):
	if event.is_action("click"):
		$Scroll/Control/Charts.hide()
		chart.show()
