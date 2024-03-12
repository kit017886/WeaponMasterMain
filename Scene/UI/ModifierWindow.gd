extends Window

@export var world_node: Node
@onready var ModifyNodeOption = $VBoxContainer/ModifyNodeContainer/ModifyNodeOption
@onready var ModifierItems = $VBoxContainer/ScrollContainer/ModifierItems
@onready var int_modifier = preload("res://Scene/Modifier/int_modifier.tscn")
@onready var string_modifier = preload("res://Scene/Modifier/string_modifier.tscn")
@onready var bool_modifier = preload("res://Scene/Modifier/bool_modifier.tscn")
@onready var vector_modifier = preload("res://Scene/Modifier/vector_modifier.tscn")
@onready var float_modifier = preload("res://Scene/Modifier/float_modifier.tscn")

var modifier_node_array = []
var option_index:int

func _ready():
	get_have_meta_variables_node(world_node)
	set_ModifyNodeOption()
	update_modifer_data(0)

func get_have_meta_variables_node(node):
	for child in Util.get_all_children(node):
		if child.has_meta("variables"):
			modifier_node_array.append(child)

func set_ModifyNodeOption():
	for node in modifier_node_array:
		ModifyNodeOption.add_item(node.name)

func _on_close_requested():
	queue_free()

func _on_modify_node_option_item_selected(index):
	option_index = index
	update_modifer_data(option_index)

func update_modifer_data(index):
	if modifier_node_array[index] != null :
		var variables = modifier_node_array[index].get_meta("variables")
		set_signal_option()
		clear_modifier_items()
		add_modifier_items(variables)
	else:
		renew_ModifyNodeOption()

func renew_ModifyNodeOption():
		modifier_node_array.clear()
		get_have_meta_variables_node(world_node)
		ModifyNodeOption.clear()
		set_ModifyNodeOption()
		ModifyNodeOption.selected = 0
		option_index = 0
		update_modifer_data(0)

func modifier_variable(key,variable):
	if modifier_node_array[option_index] != null :
		print_debug(modifier_node_array[option_index])
		print_debug(str(key) + str(variable))
		modifier_node_array[option_index].emit_signal("set_var",key,variable)

func set_signal_option():
	var user_signal_array := []
	if modifier_node_array[option_index] != null :
		var modifier_node = modifier_node_array[option_index]
		var signal_array = modifier_node.get_signal_list()
		for signaldata in signal_array:
			if modifier_node.has_user_signal(signaldata.name):
				user_signal_array.append(signaldata)
				print(signaldata.name)
	
func clear_modifier_items():
	for child in ModifierItems.get_children():
		child.queue_free()
	
func add_modifier_items(dictionary):
	for key in dictionary:
		add_modifier_item(key,dictionary[key])
	
func add_modifier_item(key,variable):
	var modifier
	match typeof(variable):
		TYPE_INT:
			modifier = int_modifier.instantiate()
			modifier.get_child(1).value = variable
			modifier.get_child(2).variable_type = TYPE_INT
		TYPE_BOOL:
			modifier = bool_modifier.instantiate()
			modifier.get_child(1).button_pressed = variable
			modifier.get_child(2).variable_type = TYPE_BOOL
		TYPE_VECTOR2:
			modifier = vector_modifier.instantiate()
			modifier.get_child(1).value = variable.x
			modifier.get_child(2).value = variable.y
			modifier.get_child(3).variable_type = TYPE_VECTOR2
		TYPE_STRING:
			modifier = string_modifier.instantiate()
			modifier.get_child(1).text = variable
			modifier.get_child(2).variable_type = TYPE_STRING
		TYPE_FLOAT:
			modifier = float_modifier.instantiate()
			modifier.get_child(1).value = variable
			modifier.get_child(2).variable_type = TYPE_FLOAT
			
		_:
			modifier = string_modifier.instantiate()
			modifier.get_child(1).text = str(variable)
	modifier.get_child(0).text = key
	ModifierItems.add_child(modifier)

