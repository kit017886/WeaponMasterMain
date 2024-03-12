extends VelocityChange
class_name FollowPlayer

@export var move_speed := 120.0
@export var overlap_collision : Node

var player: CharacterBody2D
var direction

func Ready():
	player = get_tree().get_first_node_in_group("player")
	

func Physics_Update(delta):
	player = get_tree().get_first_node_in_group("player")
	if player:
		direction = player.global_position - host.global_position
		host.velocity = direction.normalized() * move_speed
		if overlap_collision.is_colliding():
			host.velocity += overlap_collision.get_push_vector() *200
