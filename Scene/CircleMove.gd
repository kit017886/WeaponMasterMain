extends Component

@export var speed = 1
@export var range = 5

func Physics_Update(delta):
	host.position.x += sin(Time.get_ticks_msec() *speed) * range
	
	host.position.y += cos(Time.get_ticks_msec() *speed) * range
