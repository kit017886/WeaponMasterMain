extends Component

func __set_max_hp(value):
	host.emit_signal("update_max_hp",value)

func __set_hp(value):
	host.emit_signal("update_hp",value)
	
func __set_max_sp(value):
	host.emit_signal("update_max_sp",value)

func __set_sp(value):
	host.emit_signal("update_sp",value)

