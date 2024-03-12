extends VelocityChange
class_name Player8DirMovement

@export var max_speed = 500
@export var accel = 150
@export var friction = 15
var input = Vector2.ZERO
var input_velocity = Vector2.ZERO

func Ready():
	set_var("anim_velocity",Vector2.ZERO)

func Physics_Update(delta):
	player_movement(delta)
	
func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input.normalized()
	
func update_host_velocity(delta):
	input = get_input()
	if input == Vector2.ZERO:
		set_var("is_moving",false)
		if host.velocity.length() > (friction):
			host.velocity -= host.velocity.normalized() * (friction)
		else:
			host.velocity = Vector2.ZERO
	else:
		set_var("is_moving",true)
		host.velocity += (input * accel)
		host.velocity = host.velocity.limit_length(max_speed)
	

func update_input_velocity(delta):
	input = get_input()
	if input == Vector2.ZERO:
		set_var("is_moving",false)
		if input_velocity.length() > (friction):
			input_velocity -= input_velocity.normalized() * (friction)
		else:
			input_velocity = Vector2.ZERO
	else:
		set_var("is_moving",true)
		input_velocity += (input * accel)
		input_velocity = input_velocity.limit_length(max_speed)

func player_movement(delta):
	update_host_velocity(delta)
	update_input_velocity(delta)
	if input_velocity != Vector2.ZERO:
		set_var("anim_velocity",input_velocity)
