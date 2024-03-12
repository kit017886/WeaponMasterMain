extends Component


func  __set_has_hp(value):
	if !value:
		var player = get_tree().get_first_node_in_group("player")
		player.queue_free()
	
