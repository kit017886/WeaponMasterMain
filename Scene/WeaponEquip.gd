extends Component

func Enter_Tree():
	set_var("previous_slot_num",1)
	set_var("previous_slot_node", host.get_node("WeaponSlot1"))
	
func __set_previous_slot_num(value):
	set_var("previous_slot_node", host.get_node("WeaponSlot" + str(value)))
