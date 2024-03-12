extends Component
class_name BeNormalHurt
@export var signal_name := "be_hurt"

func Enter_Tree():
	connect_user_signal(signal_name,be_normal_hurt)
	
func be_normal_hurt(value):
	print_debug("be hurt")
	var hp = get_var("hp")
	hp = clamp(hp-value,0,get_var("max_hp"))
	set_var("hp",hp)
