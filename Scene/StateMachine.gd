extends Node2D
@export var host: Node
@export var initial_state : State

var current_state : State
var states : Dictionary = {}
func _enter_tree():
	for c in get_children():
		if !c.host:
			c.host = host

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
	
	if initial_state:
		initial_state.Ready()
		current_state = initial_state

func _process(delta):
	if current_state:
		current_state.Update(delta)

func _physics_process(delta):
	if current_state:
		current_state.Physics_Update((delta))

func state_transition(state, new_state):
	if state != current_state:
		return
		
	if current_state:
		current_state.Exit()
		
	if new_state:
		print_debug(new_state)
		new_state.Ready()
		current_state = new_state
	
	
		

