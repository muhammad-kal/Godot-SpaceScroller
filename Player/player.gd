extends CharacterBody2D


func _physics_process(delta: float) -> void:
	IkutMouse()
	
func IkutMouse():
	global_position.y = lerp(global_position.y, get_viewport().get_mouse_position().y, 0.2)
