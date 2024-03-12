extends VelocityChange

@export var speed = 200
@export var limit = 5
@export var shuffle_marker := false

var start_position
var end_position
var first_end_position
var child_index = 0
var marker_positions = []

func Ready():
	start_position = host.global_position
	marker_positions = get_marker_positions(start_position)
	shuffle_marker_positions()
	first_end_position = marker_positions[0]
	end_position = first_end_position

func Physics_Update(delta):
	update_velocity()
	
func update_velocity():
	var move_direction = (end_position - host.global_position)
	if move_direction.length() < limit:
		change_direction()
	host.velocity = move_direction.normalized()*speed
	
func change_direction():
	shuffle_marker_positions()
	child_index = wrap(child_index +1, 0, marker_positions.size()+1)
	print_debug(child_index)
	if child_index < marker_positions.size():
		end_position = marker_positions[child_index]
	else:
		end_position = start_position

func shuffle_marker_positions():
	if shuffle_marker:
		marker_positions.shuffle()

func get_marker_positions(start_pos):
	var pos_array = []
	for c in get_children():
		pos_array.append(c.global_position)
	pos_array.append(start_pos)
	return pos_array
	
