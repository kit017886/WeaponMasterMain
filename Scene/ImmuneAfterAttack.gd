extends Component

@export var immune_time = 0.5

func Enter_Tree():
	connect_user_signal("after_attack",_on_after_attack)
	
func _on_after_attack():
	if get_var("can_be_attack"):
		set_var("can_be_attack",false)
		var timer = get_tree().create_timer(immune_time)
		await timer.timeout
		set_var("can_be_attack",true)
