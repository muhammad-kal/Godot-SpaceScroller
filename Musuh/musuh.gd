extends Sprite2D

const  KECEPATAN =  40

var objPartikelMati = preload("res://Musuh/musuh_mati_partikel.tscn")
signal partikel_musuh_mati(objPartikel, posPartikel)

func _ready() -> void:
	if Global.main != null :
		connect("partikel_musuh_mati", Callable(Global.main, "_spawn_partikel_ketika_musuh_mati"))

func _physics_process(delta: float) -> void:
	global_position.x -= KECEPATAN * delta
	jarakTempuh()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("damage_ke_musuh"):
		emit_signal("partikel_musuh_mati", objPartikelMati, global_position)
		area.get_parent().queue_free()
		queue_free()

func jarakTempuh():
	if global_position.x < -20:
		queue_free()
