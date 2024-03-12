extends Component
class_name BeKnockBack
@export var signal_name := "be_knock_back"
@export var friction = 60
@export var min_velocity = 4
var knocking_back = false
var knocking_velocity = Vector2.ZERO
@export var aim_move_state : Array[Node]
var current_move_state : Array

func Enter_Tree():
	connect_user_signal(signal_name,be_knock_back)
	create_signal("knocked_back")
	
func be_knock_back(enemy_velocity,power):
	var knockbackDirection = (enemy_velocity - host.velocity).normalized() * power
	exit_aim_move_state()
	host.velocity = knockbackDirection
	knocking_velocity = knockbackDirection
	knocking_back = true

func _physics_process(delta):
	if host.velocity.length() > min_velocity and knocking_back:
		host.velocity -=  host.velocity.normalized() *friction
		if host.get_last_slide_collision():
			host.velocity = Vector2.ZERO
	else:
		if knocking_back:
			enter_current_move_state()
			host.emit_signal("knocked_back")
			knocking_back = false

func exit_aim_move_state():
	for c in aim_move_state:
		if c.get_parent() == current_states:
			c.state_exit()
			current_move_state.append(c)
			
func enter_current_move_state():
	for c in current_move_state:
		c.state_enter()
		current_move_state.erase(c)
