extends Node
@onready var window = get_tree().root 

var max = 400
var min = -400
var origin_pos

@onready var  value = 0
var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	window.transparent = true
	window.borderless = true
	window.always_on_top = true
	get_viewport().transparent_bg = true
	window.position = Vector2(950,400)
	window.size = Vector2(128,128)
	origin_pos = window.position
	

func _physics_process(delta):
	value += speed*delta * Util.ping_pong_direction(value,max,min)
	window.position.x = origin_pos.x + value
