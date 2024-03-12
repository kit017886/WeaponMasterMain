extends Area2D
@export var host:Node

func _on_body_entered(body):
	if body.is_in_group("monster"):
		var dir = host.global_position.direction_to(body.global_position)
		host.emit_signal("attack",body,dir)
