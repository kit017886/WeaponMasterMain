extends VelocityChange
class_name IdleMove

@export var move_speed := 80

var move_direction : Vector2
var wander_time : float

func randomize_wander():
	move_direction = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
	wander_time = randf_range(1,3)
	
func Ready():
	randomize_wander()
	
func Update(delta):
		if wander_time > 0:
			wander_time -= delta
		else:
			randomize_wander()

func Physics_Update(delta):
	host.velocity = move_direction * move_speed
	
