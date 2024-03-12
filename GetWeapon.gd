extends Component
@onready var weapon_slots = get_tree().get_first_node_in_group("weapon_slots")
@export var weapon_data : Dictionary


func _on_weapon_reward_pressed():
	weapon_slots.emit_signal("add_weapon",weapon_data)
