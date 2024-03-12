extends VelocityChange
class_name Player8DirMovementNoFriction
@export var speed = 300
var input_movement = Vector2.ZERO

func _ready():
	set_var("moveable",true)
	set_var("move_speed",speed)

func Physics_Update(delta):
	move()
	
func move():
	input_movement = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	if input_movement != Vector2.ZERO:
		host.velocity = input_movement * speed
	
	if input_movement == Vector2.ZERO:
		host.velocity = Vector2.ZERO
	
	host.move_and_slide()
	
func __set_move_speed(value):
	speed = value
