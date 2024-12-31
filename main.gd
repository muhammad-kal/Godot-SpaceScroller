extends Node2D

func _ready() -> void:
	Global.main = self
	
func _exit_tree() -> void:
	Global.main = null

func _spawn_partikel_ketika_musuh_mati(objPartikel, posPeluru):
	var partikelInstance = objPartikel.instantiate()
	add_child(partikelInstance)
	partikelInstance.global_position = posPeluru

func _on_player_signal_nembak(objPeluru: Variant, posPeluru: Variant) -> void:
	var peluruInstance = objPeluru.instantiate()
	add_child(peluruInstance)
	peluruInstance.global_position = posPeluru
	
func _on_musuh_spawner_spawn_musuh(objMusuh: Variant, posMusuh: Variant) -> void:
	var musuhInstance = objMusuh.instantiate()
	add_child(musuhInstance)
	musuhInstance.global_position = posMusuh
