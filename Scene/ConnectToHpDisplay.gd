extends Component
class_name ConnectToHpDisplay

@export var self_hp_display :Node
@onready var player_display = get_tree().get_first_node_in_group("hp_display")
var display
func _ready():
	connect_set_var_signal("set_max_hp")
	connect_set_var_signal("set_hp")
	if self_hp_display:
		display = self_hp_display
	else:
		display = player_display
	display.emit_signal("update_max_value",get_var("max_hp"))

func __set_max_hp(value):
	display.emit_signal("update_max_value",value)
	
func __set_hp(value):
	display.emit_signal("update_value",value)
