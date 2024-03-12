extends Component
@export var weapon_data : Dictionary

func Ready():
	host.emit_signal("set_weapon_data",weapon_data)
	host.emit_signal("set_weapon_icon_tscn",weapon_data)
