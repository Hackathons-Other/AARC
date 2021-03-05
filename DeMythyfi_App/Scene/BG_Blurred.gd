extends TextureRect

var blur_amount = 0
var blur_change : float = .01

func _physics_process(delta):
	
	blur_amount = clamp(blur_amount + blur_change, 2.0, 5.0)
#	print("b", blur_amount)
	material.set_shader_param("blur_amount", blur_amount)


func _on_Timer_timeout():
	blur_change = wrapf((randf() - .5), -.01, .01)
#	print(blur_change)
