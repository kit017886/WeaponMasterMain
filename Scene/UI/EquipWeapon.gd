extends Component
@export var equip_texture_node : Node
@export var slot_num : int
@onready var weapon_slots = get_tree().get_first_node_in_group("weapon_slots")
@onready var player =  get_tree().get_first_node_in_group("player")

func Ready():
	set_var("slot_num",slot_num)
	set_var("has_sp_state",true)
	set_var("has_hp",true)
	set_var("unequip_state",true)

func __equip():
	if get_var("has_sp_state") and get_var("has_hp"):
		set_var("unequip_state",false)
		var previous_node = weapon_slots.get_meta("variables")["previous_slot_node"]
		if previous_node != host:
			equip_texture_node.show()
			previous_node.emit_signal("unequip")
			weapon_slots.emit_signal("set_var","previous_slot_num",slot_num)
			add_weapon_player()
	else:
		host.emit_signal("switch_to_other_node")
		
func add_weapon_player():
	player =  get_tree().get_first_node_in_group("player")
	var new_weapon = host.get_meta("variables")["tscn"].instantiate()
	player.get_parent().add_child(new_weapon)
	new_weapon.emit_signal("set_var","slot_num",slot_num)
	new_weapon.global_position = player.global_position
	new_weapon.velocity = player.velocity
	new_weapon.rotation = player.rotation
	new_weapon.emit_signal("set_weapon_data",host.get_meta("variables"))
	new_weapon.emit_signal("set_var","sp",new_weapon.get_meta("variables")["sp"]-1)
	var remote = player.get_node("RemoteTransform2D")
	player.remove_child(remote)
	new_weapon.add_child(remote)
	player.queue_free()


func __set_player_data():
	player.emit_signal("set_weapon_data",host.get_meta("variables"))
	
func __unequip():
	set_var("unequip_state",true)
	equip_texture_node.hide()
	
func _on_button_pressed():
	__equip()
