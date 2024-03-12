extends Components
class_name CurrentStates

func _process(delta):
	for c in get_children():
		c.Update(delta)

func _physics_process(delta):
	for c in get_children():
		c.Physics_Update(delta)
	
