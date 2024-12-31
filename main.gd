extends Node2D

func _on_player_signal_nembak(objPeluru: Variant, posPeluru: Variant) -> void:
	var peluruInstance = objPeluru.instantiate()
	add_child(peluruInstance)
	peluruInstance.global_position = posPeluru
	
	
