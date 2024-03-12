extends Component

var slot_node

func Enter_Tree():
	set_var("weapon_amount",1)
	
func __add_weapon(dictionary):
	set_var("weapon_amount",get_var("weapon_amount") + 1)
	var slot_num = get_var("weapon_amount")
	if slot_num <= 5:
		print_debug(slot_num)
		slot_node = host.get_node("WeaponSlot" + str(slot_num))
		slot_node.emit_signal("set_weapon_data",dictionary)
		slot_node.emit_signal("set_weapon_icon_tscn",dictionary)
		slot_node.show()
	else:
		print_debug("武器已滿")
	
	
