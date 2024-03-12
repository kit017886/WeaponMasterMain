extends Component


func _ready():
	set_var("abc",222)
	
func __set_abc(value):
	print_debug("abc"+str(value))

func __ttt(value):
	print_debug("aaa"+str(value))
