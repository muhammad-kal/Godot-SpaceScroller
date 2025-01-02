extends Marker2D
 
@export var banyak_musuh : int

@export var musuh_1 : PackedScene
@export var musuh_2 : PackedScene
@export var musuh_3 : PackedScene

signal instance_node(objMusuh : PackedScene, posMusuh)

func _on_timer_timeout() -> void:
	randomize()
	var musuh_yang_keluar = randi_range(1, banyak_musuh)
	emit_signal("instance_node", get("musuh_" + str(musuh_yang_keluar)), Vector2(180, randi_range(0,90)))
