extends Node

var main = null
var player = null
var suara_controller = null

var skor = 0

func play_suara(nama_suara):
	if suara_controller != null :
		if suara_controller.has_node(nama_suara):
			suara_controller.get_node(nama_suara).play()
