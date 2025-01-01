extends Sprite2D

@onready var attack_speed: Timer = $AttackSpeed

var peluru = preload("res://Player/peluru.tscn")
var playerPartikelMati = preload("res://Player/Player_mati_partikel.tscn")
var musuhPartikelMati = preload("res://Musuh/musuh_mati_partikel.tscn")

var bisa_nembak = true

signal instance_node(objek, posisi)

func _ready() -> void:
	global_position.y = get_viewport().get_mouse_position().y

func _physics_process(delta: float) -> void:
	IkutMouse()
	Tembak()
	
func IkutMouse():
	global_position.y = lerp(global_position.y, get_viewport().get_mouse_position().y, 0.2)

func Tembak():
	if Input.is_action_pressed("Nembak") && bisa_nembak:
		emit_signal("instance_node", peluru, global_position)
		bisa_nembak = false
		attack_speed.start()
		
func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Musuh"):
		emit_signal("instance_node", playerPartikelMati, global_position)
		emit_signal("instance_node", musuhPartikelMati, global_position)
		area.get_parent().queue_free()
		queue_free()
	
func _on_attack_speed_timeout() -> void:
	attack_speed.start()
	bisa_nembak = true
	attack_speed.stop()
