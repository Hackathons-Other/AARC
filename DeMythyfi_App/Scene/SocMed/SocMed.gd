extends Control

export (NodePath) var grid

func _ready() -> void:
	for child in get_children():
		if child is Button:
			child.connect("button_up", self, "move_to", [child])
	for child in get_node(grid).get_children():

		child.Toggle.connect("button_down", self, "move_to", [child])
		child._on_Toggle_button_down()

onready var Tween := $Tween
#onready var Cam := $Cam
var current_node: Control
onready var Feed := $Feed
onready var Grid : GridContainer = get_node(grid)

func move_to(node: Control) -> void:
	# Clicked another node
#	if current_node and current_node != node and current_node.has_method("_on_Toggle_button_down"):
#		current_node._on_Toggle_button_down()
#		current_node.get_parent().remove_child(current_node)
#		Grid.add_child(current_node)

	# If we declick current node
	if node == current_node:
#		current_node._on_Toggle_button_down()
#		current_node.get_parent().remove_child(current_node)
		
		for child in Grid.get_children():
			child.show()
		Grid.columns = 3

#		current_node.get_parent().remove_child(current_node)
#		Grid.add_child(current_node)
	else:
#		current_node.set_size(Vector2(42, 42))
#	Tween.interpolate_property(Cam, "position:y", Cam.position.y, node.rect_global_position.y  + node.rect_size.y / 2, 1, Tween.TRANS_CUBIC)
#	Tween.start()

		for child in Grid.get_children():
			if child != node:
				child.hide()

		
		Grid.columns = 1
	current_node = node
#	print(node.name)
	#	node.set_size(Vector2(42, 300))
#		current_node.get_parent().remove_child(current_node)
#		Feed.add_child(current_node)
	

