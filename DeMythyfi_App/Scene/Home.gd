extends Control

func _ready() -> void:
#	modulate.a = 0
	$Body/SearchBar/Margin/TextEdit.text = G.searched
	if get_node_or_null("Anim"):
		$Anim.play("Fade")
	if get_node_or_null("Body/TabContainer/Stonks/Stonks"):
		for child in $Body/TabContainer/Stonks/Stonks.get_children():
			if child is Topic:
				child._on_Toggle_button_down()





func _on_SearchBar_searched():
	if get_node_or_null("Anim"):
		$Anim.play_backwards("Fade")
		yield($Anim, "animation_finished")
	get_tree().change_scene("res://Scene/SearchResults.tscn")
