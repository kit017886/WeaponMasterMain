extends Component
@export var period = 0.5
@onready var timer = $Timer

func Ready():
	timer.set_wait_time(period)
	timer.set_one_shot(false)
	timer.connect("timeout",RecoverSp)
	timer.start()

func RecoverSp():
	if get_var("unequip_state") and host.visible and get_var("sp") <= get_var("max_sp"):
		print_debug(str(host.name) + "recoversp")
		set_var("sp",get_var("sp") + 1)

func __set_has_hp(value):
	if !value:
		timer.stop()
