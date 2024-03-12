extends Component

@export var speed = 400
var mouse_position = null

func _physics_process(delta):
	
	host.velocity = Vector2(0,0)
	mouse_position = get_global_mouse_position()

	if Input.is_action_pressed("forward"): #w 或者 滑鼠左鍵
		var direction = (mouse_position - host.position).normalized()
		host.velocity = (direction * speed)
	host.move_and_slide()
	host.look_at(mouse_position)
