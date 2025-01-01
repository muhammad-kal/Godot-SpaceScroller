extends Sprite2D

func _process(delta: float) -> void:
	if Global.player != null :
		frame = Global.player.darah
		
