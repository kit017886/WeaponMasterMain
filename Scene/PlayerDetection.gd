extends Area2D


func _on_body_entered(body):
	if body.is_in_group("player"):
		pass


func _on_body_exited(body):
	pass # Replace with function body.
