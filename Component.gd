extends Node2D
class_name Component

@export var host: Node

@onready var current_states = host.get_node("Components").get_node("CurrentStates")
@onready var spare_states = host.get_node("Components").get_node("SpareStates")
var update_trigger = false
func _enter_tree():
	Enter_Tree()
	create_method_signals()
	
func _ready():
	Ready()
	Ready_Connect()

	
func connect_set_var_signals():
	var signal_list = host.get_signal_list()
	for s in signal_list:
		connect_set_var_signal(s.name)	

func connect_set_var_signal(signal_name):
	if has_method("__"+signal_name):
		host.connect(signal_name,Callable(self,"__"+signal_name))

func create_method_signals():
	for method in get_method_list():
		if method.name.begins_with("__"):
			var signal_name = method.name.erase(0).erase(0)
			create_signal(signal_name)
			host.connect(signal_name,Callable(self,method.name))

func create_signal(signal_name:String, arguments: Array = []):
	if !host.has_signal(signal_name):
		host.add_user_signal(signal_name, arguments)

func connect_user_signal(signal_name:String, method: Callable, arguments: Array = []):
	create_signal(signal_name, arguments)
	host.connect(signal_name, method)

func set_var(key: String,value,set_emit := true):
	var variables: Dictionary
	if host.get_meta("variables"):
		variables = host.get_meta("variables")
	variables[key] = value
	var signal_name = "set_" + key
	if !host.has_signal(signal_name):
		host.add_user_signal(signal_name)
	connect_set_var_signal(signal_name)
	if set_emit:
		host.emit_signal(signal_name,value)
	host.set_meta("variables",variables)

func set_init_var(key: String,value,set_emit = true):
	var variables: Dictionary
	if host.get_meta("variables"):
		variables = host.get_meta("variables")
	if !variables.has(key):
		set_var(key,value,set_emit)

func get_var(key: String,init_value = null):
	if host.get_meta("variables"):
		if host.get_meta("variables").has(key):
			return host.get_meta("variables")[key]
	else:
		return init_value

func get_var_dict():
	if host.get_meta("variables"):
		return host.get_meta("variables")
		
func merge_var_dict(dictionary: Dictionary, overwrite: bool = false):
	var variables: Dictionary
	if host.get_meta("variables"):
		variables = host.get_meta("variables")
	var key_array = dictionary.keys()
	for key in key_array:
		if !overwrite and variables.has(key):
			continue
		else:
			set_var(key,dictionary[key])

func state_enter():
	if get_parent() != current_states:
		get_parent().remove_child(self)
		current_states.add_child(self)
		Enter_Tree()
		Ready()
		Ready_Connect()

func state_exit():
	if get_parent() == current_states:
		get_parent().remove_child(self)
		spare_states.add_child(self)
		Exit()

func is_in_state():
	return get_parent() == current_states

func Enter_Tree():
	pass

func Ready_Connect():
	connect_set_var_signals()

func Ready():
	pass
	
func Exit():
	pass

func Update(delta):
	pass

func Physics_Update(delta):
	pass


