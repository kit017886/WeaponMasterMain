extends Component

class_name HostConnectVarMethod

func _enter_tree():
	connect_user_signal("set_var",set_var)
	connect_user_signal("set_init_var",set_init_var)
	connect_user_signal("merge_var_dict",merge_var_dict)
