extends Node2D
func _physics_process(delta):
	var player = get_tree().get_first_node_in_group("player")
	if player:
		var g_pos = player.global_position
		global_position = g_pos
		player.global_position = g_pos
