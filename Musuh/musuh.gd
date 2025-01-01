extends Sprite2D

const  KECEPATAN =  40

var objPartikelMati = preload("res://Musuh/musuh_mati_partikel.tscn")
signal instance_node(objek, posisi)

func _ready() -> void:
	if Global.main != null :
		connect("instance_node", Callable(Global.main, "instance_node"))

func _physics_process(delta: float) -> void:
	global_position.x -= KECEPATAN * delta
	jarakTempuh()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("damage_ke_musuh"):
		Global.play_suara("Meledak")
		emit_signal("instance_node", objPartikelMati, global_position)
		Global.skor += 1
		area.get_parent().queue_free()
		queue_free()

func jarakTempuh():
	if global_position.x < -20:
		queue_free()
