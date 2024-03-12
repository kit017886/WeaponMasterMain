extends FaceLookat
class_name LookatPlayer
@onready var player = get_tree().get_first_node_in_group("player")

func _process(delta):
	look_at_player(delta)

func look_at_player(delta):
	if player != null:
		var target_position = player.global_position
		host.look_at(target_position)	
