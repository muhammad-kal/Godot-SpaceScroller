extends Sprite2D

@export var kecepatan = 100

func _process(delta: float) -> void:
	global_position.x += 100 * delta
	jarakTempuh()
	
func jarakTempuh():
	if global_position.x > 180 :
		queue_free()
