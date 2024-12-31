extends CharacterBody2D

var peluru = preload("res://Player/peluru.tscn")

signal signal_nembak(objPeluru, posPeluru)

func _physics_process(delta: float) -> void:
	IkutMouse()
	Tembak()
	
func IkutMouse():
	global_position.y = lerp(global_position.y, get_viewport().get_mouse_position().y, 0.2)

func Tembak():
	if Input.is_action_just_pressed("Nembak"):
		emit_signal("signal_nembak", peluru, global_position)
		
