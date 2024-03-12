extends Node2D
signal aaa

func _ready():
	aaa.connect(signal_function)
	aaa.connect(flag_function)
	aaa.connect(flag_function2)

func _notification(what):
	if what == NOTIFICATION_WM_MOUSE_ENTER:
		aaa.emit()

func signal_function():
	print_debug("function!!!")

func flag_function(flag):
	if flag == "abc":
		print_debug("abcfunction!!!!!")
		
func flag_function2(flag,arg1):
	print_debug("function2!!!!!")
