extends Sprite2D

@export var  KECEPATAN : int =  40
@export var skor_point : int = 5
@export var darah_musuh : int = 1

var objPartikelMati = preload("res://Musuh/musuh_mati_partikel.tscn")
signal instance_node(objek, posisi)

func _ready() -> void:
	if Global.main != null :
		connect("instance_node", Callable(Global.main, "instance_node"))

func _physics_process(delta: float) -> void:
	global_position.x -= KECEPATAN * delta
	jarakTempuh()
	Mati()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("damage_ke_musuh"):
		darah_musuh -= area.get_parent().damage
		Global.play_suara("Tertabrak")
		area.get_parent().queue_free()
		

func Mati():
	if darah_musuh <= 0:
		Global.play_suara("Meledak")
		emit_signal("instance_node", objPartikelMati, global_position)
		Global.skor += skor_point
		queue_free()

func jarakTempuh():
	if global_position.x < -20:
		queue_free()
