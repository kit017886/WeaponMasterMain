extends Node2D

@export var host: CharacterBody2D
@export var speed = 600
@export var range = 50
var mouse_position = null
var taget_position = Vector2()
var is_arrived = true

func _ready():
	taget_position = host.global_position

func _physics_process(delta):
	mouse_position = get_global_mouse_position()
	if Input.is_action_just_pressed("forward"): #w 或者 滑鼠左鍵
		var direction = (mouse_position - host.global_position).normalized()
		taget_position = host.global_position + (direction*range)
		is_arrived = false
	if is_arrived == false and host.global_position.distance_to(taget_position) > 10:
		var direction = (taget_position - host.global_position).normalized()
		host.velocity = (direction * speed)
		host.move_and_slide()
	else:
		is_arrived = true

	
