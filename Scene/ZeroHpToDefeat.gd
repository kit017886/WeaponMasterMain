extends Component

func Enter_Tree():
	connect_user_signal("knocked_back",zero_hp_to_defeat)
	
func zero_hp_to_defeat():
	if get_var("hp") <= 0:
		host.queue_free()
