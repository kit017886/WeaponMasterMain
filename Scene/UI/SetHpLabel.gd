extends Component

@export var label : Node
@export var progressbar : Node
@export var value_name : String
var now_value := 0
var max_value := 9999

func Enter_Tree():
	connect_user_signal("update_max_"+value_name,_on_update_max_value)
	connect_user_signal("update_"+value_name,_on_update_value)
	
func _on_update_max_value(value):
	max_value = value
	if label:
		label.text = str(now_value) + "/" + str(max_value)
	if progressbar:
		progressbar.max_value = value

func _on_update_value(value):
	now_value = clamp(value,0,max_value)
	if label:
		label.text = str(now_value) + "/" + str(max_value)
	if progressbar:
		progressbar.value = value
