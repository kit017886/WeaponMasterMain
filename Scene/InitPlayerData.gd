extends Component

@onready var slot1 = get_tree().get_first_node_in_group("slot1")

func _ready():
	call_deferred("init_player_data")
	
	
func init_player_data():
	slot1.emit_signal("equip")
	slot1.emit_signal("set_player_data")
