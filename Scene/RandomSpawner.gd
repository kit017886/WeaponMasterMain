extends Component
@export var period = 3
@export var min_length = 800
@export var max_length = 1200
@onready var monster = preload("res://Scene/slime.tscn")
@export var scene: Node 
@export var timer: Node


func Ready():
	randomize()
	timer.set_wait_time(period)
	timer.set_one_shot(false)
	timer.connect("timeout",spawn_monster)
	timer.start()
	
func spawn_monster():
	var length = randf_range(min_length,max_length)
	var sign = [-1,1]
	var x = randf_range(0,max_length) * sign[randi_range(0,1)]
	var y = randf_range(0,max_length) * sign[randi_range(0,1)]
	var new_pos = Vector2(x,y).limit_length(length)
	var player = get_tree().get_first_node_in_group("player")
	if player:
		var new_monster = monster.instantiate()
		scene.add_child(new_monster)
		new_monster.global_position = player.global_position + new_pos


func __stop_spawn():
	timer.stop()
