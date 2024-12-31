extends Marker2D
 
var objMusuh = preload("res://Musuh/musuh.tscn")

signal spawn_musuh(objMusuh : PackedScene, posMusuh)

func _on_timer_timeout() -> void:
	randomize()
	emit_signal("spawn_musuh", objMusuh, Vector2(180, randi_range(0,90)))
