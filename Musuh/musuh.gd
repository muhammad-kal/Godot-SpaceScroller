extends Sprite2D

const  KECEPATAN =  40


func _physics_process(delta: float) -> void:
	global_position.x -= KECEPATAN * delta
