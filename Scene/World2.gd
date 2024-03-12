extends Sprite2D

var max = 400
var min = -400

@onready var  value = 0
@onready var origin_pos = position
var speed = 300

func _ready():
	pass

func _physics_process(delta):
	value += speed*delta * Util.ping_pong_direction(value,max,min)
	position.x = origin_pos.x + value


func pingpong(delta):
	value += speed*delta
	var new_value = pingpong(value,max - min)
	if value > ((max - min)*2):
		value = new_value
