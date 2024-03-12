extends Button

@onready var ModifierWindow = get_tree().get_first_node_in_group("modifier_window")
var index: int
var variable_type
var variable_key
var variable_value

func _on_pressed():
	variable_key = $"../Label".text
	match variable_type:
		TYPE_INT:
			variable_value = $"../Value".value
		TYPE_BOOL:
			variable_value = $"../Value".button_pressed
		TYPE_VECTOR2:
			variable_value = Vector2($"../Value1".value,$"../Value2".value)
		TYPE_STRING:
			variable_value = $"../Value".text
		TYPE_FLOAT:
			variable_value = $"../Value".value
	ModifierWindow.modifier_variable(variable_key,variable_value)
