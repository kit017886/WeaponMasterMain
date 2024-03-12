extends Component
class_name UpdateComponent
@export var update_on_signal_name := "no_signal"
@export var update_off_signal_name := "no_signal"
@export var update_on_condition_name := "no_condition"
@export var update_off_condition_name := "no_condition"

func connect_update_on_trigger_signal():
	if update_on_signal_name != "no_signal":
		connect_user_signal(update_on_signal_name,update_trigger_on)

func connect_update_off_trigger_signal():
	if update_off_signal_name != "no_signal":
		connect_user_signal(update_off_signal_name,update_trigger_off)

func _enter_tree():
	connect_update_on_trigger_signal()
	connect_update_off_trigger_signal()

func Update(delta):
	conditional_update(delta)

func update_trigger_on():
	update_trigger = true
	
func update_trigger_off():
	update_trigger = false

func conditional_update(delta):
	if update_on_condition_name == "no_condition" or get_var(update_on_condition_name):
		if update_on_signal_name == "no_signal" or update_trigger:
			update_trigger = true
			UpdateContent(delta)
	if (update_on_condition_name != "no_condition" and !get_var(update_on_condition_name)) or get_var(update_off_condition_name):
		if update_trigger:
			Finish_Method()
			update_trigger = false

func UpdateContent(delta):
	pass

func Finish_Method():
	pass
