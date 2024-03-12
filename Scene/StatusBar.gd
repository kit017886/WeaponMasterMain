extends Component
class_name StatusBar
var max_value:int

func Enter_Tree():
	connect_user_signal("update_max_hp",on_update_max_value)
	connect_user_signal("update_value",on_update_value)
	
func on_update_max_value(val):
	max_value = val
	host.max_value = val
	
func on_update_value(val):
	host.value = clamp(val,0,max_value)
