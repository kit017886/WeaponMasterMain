extends Component

@export var seconds = 2

func Ready():
	var timer = get_tree().create_timer(seconds)
	timer.connect("timeout",on_timeout)

func on_timeout():
	host.queue_free()
