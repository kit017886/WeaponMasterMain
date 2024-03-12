extends FaceLookat
class_name FacetoPlayerLR

@onready var player = get_tree().get_first_node_in_group("player")

func _ready():
	host.add_user_signal("face_right")
	host.add_user_signal("face_left")

func _process(delta):
	face_to_player(delta)

func face_to_player(delta):
	if player != null:
		if player.global_position.x >= host.global_position.x:
			host.emit_signal("face_right")
			host.set_meta("face_to_right",true)
		else:
			host.emit_signal("face_left")
			host.set_meta("face_to_right",false)
