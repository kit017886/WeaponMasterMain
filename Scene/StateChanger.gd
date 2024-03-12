extends UpdateComponent
class_name StateChanger

@export var machine: Node
@export var state : Array[Node]

func state_transition(state, new_state):
	if state.is_in_state() and !new_state.is_in_state():
		state.state_exit()
		new_state.state_enter()
	
