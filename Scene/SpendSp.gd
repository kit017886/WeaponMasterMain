extends Component

@export var period = 0.5

@onready var timer = $Timer

func Ready():
	print_debug("set_timer")
	timer.set_wait_time(period)
	timer.set_one_shot(false)
	timer.connect("timeout",SpendSp)
	timer.start()
	
func SpendSp():
	set_var("sp",get_var("sp")-1)

