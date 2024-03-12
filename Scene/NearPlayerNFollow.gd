extends StateChanger
class_name NearPlayerNFollow
@export var max_detect_range = 600

@onready var player = host.get_tree().get_first_node_in_group("player")

func _ready():
	set_init_var("max_detect_range",max_detect_range)

func Physics_Update(delta):
	player = host.get_tree().get_first_node_in_group("player")
	if player:
		var direction = player.global_position - host.global_position
		if direction.length() < get_var("max_detect_range"):
			state_transition(state[0],state[1])
			
		if direction.length() > get_var("max_detect_range"):
			state_transition(state[1],state[0])
