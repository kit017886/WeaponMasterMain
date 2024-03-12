extends Component

func _process(delta):
	if Input.is_action_just_pressed("M"):
		var speed = get_var("move_speed") + 50
		set_var("move_speed",speed)
	if Input.is_action_just_pressed("N"):
		var speed = get_var("move_speed") + 50
		set_var("move_speed",speed)
