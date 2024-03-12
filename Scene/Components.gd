extends Node2D
class_name Components
@export var host: Node

func _enter_tree():
	for c in get_children():
		if !c.host:
			c.host = host
	
