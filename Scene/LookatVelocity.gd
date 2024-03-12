extends FaceLookat
class_name LookatVelocity

func _process(delta):
	host.look_at(host.global_position + get_var("anim_velocity"))
