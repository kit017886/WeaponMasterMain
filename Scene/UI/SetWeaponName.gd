extends Component
class_name SetGroupName

@export var variable_name:String
@export var variable_key:String 
@export var group_last_name:String

func Enter_Tree():
	set_variable_var()
	set_group_name()
	print_debug(get_groups())
	
func set_variable_var():
	if variable_name!= "":
		set_var(variable_key,variable_name)

func set_group_name():
	if get_var(variable_key):
		add_to_group(get_var("variable_key") + group_last_name)

