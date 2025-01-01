extends Label


func _process(delta: float) -> void:
	text = "Skor : " + str(Global.skor)
