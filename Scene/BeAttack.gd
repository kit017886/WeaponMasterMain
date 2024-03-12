extends Component
class_name BeAttack

func Enter_Tree():
	set_var("can_be_attack",true)
	connect_user_signal("be_attack",_on_be_attack)

func _on_be_attack(atk,enemy_velocity,knock_back_power):
	if get_var("can_be_attack"):
		print_debug("be_attack")
		host.emit_signal("be_knock_back",enemy_velocity,knock_back_power)
		host.emit_signal("be_hurt",atk)
		host.emit_signal("hurt_anim")
		host.emit_signal("after_attack")
