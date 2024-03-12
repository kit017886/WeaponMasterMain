extends UpdateComponent

var a = 0
func Ready():
	set_var("print_aaa",false)

func UpdateContent(delta):
	a += 1
	print(a)

func _on_timer_timeout():
	set_var("print_aaa",!get_var("print_aaa"))

func Finish_Method():
	print_debug(111111)
	a = 0
