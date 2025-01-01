extends Node2D

func _ready() -> void:
	Global.main = self
	
func _exit_tree() -> void:
	Global.main = null

func instance_node(node, posisi):
	var nodeInstance = node.instantiate()
	add_child(nodeInstance)
	nodeInstance.global_position = posisi
