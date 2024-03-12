extends VelocityChange
class_name MoveBacknForth

@export var max = 400
@export var min = -400
@export_enum("x","y") var move_mode:String = "x"

@export var  value: int
@onready var origin_pos = host.position
@export var speed = 300

var _pp_direction = 1

func _ready():
	pass

func _physics_process(delta):
	value += speed*delta * ping_pong_direction(value,max,min)
	host.position[move_mode] = origin_pos[move_mode] + value

func ping_pong_direction(value,max,min):
	if value > max:
		_pp_direction = -1
	elif value < min:
		_pp_direction = 1
	return _pp_direction
