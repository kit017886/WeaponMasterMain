extends Component
class_name HoldButtonToSpeedUp
@export var button_name := "Run"
@export var speed_up_value := 300
@export var infinite_stamina := false
@export var max_stamina := int(100)
@export var stamina_consumption := 40
@export var stamina_increment : = 80
@export var can_speed_up = true
@onready var stamina := max_stamina
var speed
var init_speed

func _ready():
	set_var("can_speed_up",can_speed_up)
	set_var("max_stamina",max_stamina)
	set_var("stamina",stamina)
	speed = get_var("move_speed")
	init_speed = speed

func _process(delta):
	if can_speed_up:
		hold_to_speed_up(delta)

func hold_to_speed_up(delta):
	if Input.is_action_pressed(button_name):
		speed_up_and_cost_stamina(delta)
	else:
		stamina += stamina_increment * delta	
	if Input.is_action_just_released(button_name):
		speed = init_speed
		set_var("move_speed",speed)
	stamina = clamp(stamina,0,max_stamina)	
	set_var("stamina",stamina)	

func speed_up_and_cost_stamina(delta):
		if stamina > 0:
			speed = init_speed + speed_up_value
		else:
			speed = init_speed
		set_var("move_speed",speed)
		if host.velocity.length() != 0 and !infinite_stamina:
			stamina -= stamina_consumption * delta
		else:
			stamina += stamina_increment * delta	
