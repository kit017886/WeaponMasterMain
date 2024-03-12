extends Node
@export_dir var scene2

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		get_tree().change_scene_to_file(scene2)

