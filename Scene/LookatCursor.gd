extends FaceLookat
class_name LookatCursor

func _process(delta):
	var mouse_position = get_global_mouse_position()
	host.look_at(mouse_position)
