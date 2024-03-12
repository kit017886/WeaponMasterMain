extends Component

func Enter_Tree():
	print_debug("connect")
	print_debug(host)
	connect_user_signal("shoot_bullet",on_shoot_bullet)
	
func on_shoot_bullet(instance,start_pos,direction,speed):
	print_debug("shoot_bullet")
	host.add_child(instance)
	instance.global_position = start_pos
	instance.velocity = direction * speed
	instance.look_at(instance.global_position + direction)
