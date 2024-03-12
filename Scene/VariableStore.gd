extends Component
class_name VariableStore

@export var variables : Dictionary

func _ready():
	merge_var_dict(variables, true)
