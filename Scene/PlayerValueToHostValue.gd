extends Component
class_name PlayerValueToHostValue

@onready var player = get_tree().get_first_node_in_group("player")
@export var value_name : String

func Enter_Tree():
	player.connect("set_"+ value_name, to_host_value)

func to_host_value(val):
	if !get_var("value"):
		host.value = val
	else:
		set_var("value",val)
