extends Component
var weapon_icon_path = "res://Image/WeaponIcon/"
var weapon_tscn_path = "res://Scene/Tscn/WeaponTscn/"
@export var weapon_icon_node: Node


func __set_weapon_icon_tscn(data:Dictionary):
	set_icon(data.icon_name)
	set_tscn(data.tscn_name)

func set_icon(icon_name):
	var icon_image = load(weapon_icon_path + icon_name + ".png")
	weapon_icon_node.texture = icon_image
	
func set_tscn(tscn_name):
	var tscn = load(weapon_tscn_path + tscn_name + ".tscn")
	set_var("tscn",tscn)
	print_debug(get_var("tscn"))
