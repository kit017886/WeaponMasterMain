extends UpdateComponent
@export var overlap_collision:Node

func Physics_Update(delta):
	if overlap_collision.is_colliding():
		print_debug("over_lapping")
		host.emit_signal("be_knock_back",overlap_collision.get_push_vector(),40)
