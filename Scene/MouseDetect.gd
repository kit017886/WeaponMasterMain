extends Node2D

@export var position_processor: Node

func _enter_tree():
	print_debug("enter_tree")


func _input(event):
	if event.is_action_pressed("mouse_left"): #如果滑鼠點擊左鍵
		var global_pos = event.position #取得鼠標點擊位置
		position_processor.print_position(global_pos)
	if event.is_action_pressed("a"): 
		print_debug("a")
		self.notification(NOTIFICATION_ENTER_TREE)
