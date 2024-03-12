extends Component

@export var self_hp_display :Node
@onready var weapon_slots = get_tree().get_first_node_in_group("weapon_slots")
var weapon_slot :Node
var display
func _ready():
	set_var("",1)
	weapon_slot = weapon_slots.get_node("WeaponSlot"+str(1))
	#update_slot()

func update_slot():
	weapon_slot.emit_signal("update_max_hp",get_var("max_hp"))
	weapon_slot.emit_signal("update_hp",get_var("hp"))
	weapon_slot.emit_signal("update_max_sp",get_var("max_sp"))
	weapon_slot.emit_signal("update_sp",get_var("sp"))	

func __set_max_hp(value):
	weapon_slot.emit_signal("set_var","max_hp",value)
	
func __set_hp(value):
	weapon_slot.emit_signal("set_var","hp",value)
	
func __set_max_sp(value):
	weapon_slot.emit_signal("set_var","max_sp",value)

func __set_sp(value):
	weapon_slot.emit_signal("set_var","sp",value)
	
func __set_slot_num(value):
	weapon_slot = weapon_slots.get_node("WeaponSlot"+str(value))
