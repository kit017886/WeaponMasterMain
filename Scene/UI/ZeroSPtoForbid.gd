extends Component
@onready var weapon_slots = get_tree().get_first_node_in_group("weapon_slots")
@export var no_sp_bg : Node
@export var no_hp_bg : Node
@export var no_hp_cross : Node
@export var hp_label : Node
@export var sp_label : Node
@export var hp_progress_bar : Node
@export var sp_progress_bar : Node
var switch = false

func __set_sp(value):
	if value <= 0 and !switch:
		switch = true
		host.emit_signal("unequip")
		no_sp()
		__switch_to_other_node()
		
func __set_hp(value):
	if value <= 0:
		host.emit_signal("unequip")
		no_hp()
		__switch_to_other_node()


func __switch_to_other_node():
	if weapon_slots.get_meta("variables")["not_gameover"]:
		var slot_num = wrap(get_var("slot_num")+1,1,weapon_slots.get_meta("variables")["weapon_amount"]+1)
		var other_node = weapon_slots.get_node("WeaponSlot"+str(slot_num))
		other_node.emit_signal("equip")	

func no_sp():
	weapon_slots.emit_signal("add_forbid_amount")
	set_var("has_sp_state",false)
	no_sp_bg.show()
	var timer = get_tree().create_timer(10)
	await timer.timeout
	if weapon_slots.get_meta("variables")["not_gameover"]:
		set_var("has_sp_state",true)
		no_sp_bg.hide()
		weapon_slots.emit_signal("sub_forbid_amount")
		switch = false

func no_hp():
	set_var("has_hp",false)
	weapon_slots.emit_signal("add_broken_amount")
	no_hp_bg.show()
	no_hp_cross.show()
	hp_label.hide()
	sp_label.hide()
	hp_progress_bar.hide()
	sp_progress_bar.hide()
