extends ParallaxBackground

@export var kecepatan : int 
var offset_scroll = 1

func _process(delta: float) -> void:
	offset_scroll += kecepatan * delta
	set_scroll_offset(Vector2(-offset_scroll, 0))
