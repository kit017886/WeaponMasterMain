extends UpdateComponent

@export var shoot_key = "ui_accept"
@export var bullet: PackedScene
@export var shoot_speed = 2000
@export var cooldown_time = 0.1
@onready var bullet_manager = get_tree().get_first_node_in_group("bullet_manager")
var can_shoot = true


func _unhandled_input(event):
	if event.is_action_released(shoot_key):
		shoot()
		
func shoot():
	var bullet_instance = bullet.instantiate()
	if bullet_manager and can_shoot:
		print_debug(bullet_manager)
		bullet_manager.emit_signal("shoot_bullet",bullet_instance,host.global_position, get_var("anim_velocity").normalized(),shoot_speed)
		cooldown()

func cooldown():
	can_shoot = false
	var timer = get_tree().create_timer(cooldown_time)
	await timer.timeout
	can_shoot = true
