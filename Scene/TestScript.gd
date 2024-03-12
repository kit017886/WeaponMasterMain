extends Node

@onready var weapon_slot = get_tree().get_first_node_in_group("slot2")
var data_dictionary :Dictionary

func _ready():
	data_dictionary.max_hp = 50
	data_dictionary.max_sp = 700
	data_dictionary.atk = 10

func _on_pressed():
	weapon_slot.emit_signal("set_weapon_data",data_dictionary)
	weapon_slot.emit_signal("set_weapon_icon_tscn",data_dictionary)
