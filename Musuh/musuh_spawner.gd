extends Marker2D
 
var objMusuh = preload("res://Musuh/musuh.tscn")

signal instance_node(objMusuh : PackedScene, posMusuh)

func _on_timer_timeout() -> void:
	randomize()
	emit_signal("instance_node", objMusuh, Vector2(180, randi_range(0,90)))
