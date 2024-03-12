extends Node2D
@export var host: CharacterBody2D
@export var animated_sprite: AnimatedSprite2D
@export var speed = 200


@onready var player = get_tree().get_first_node_in_group("player")

func _ready():
	host.set_meta("chase_switch",true)

func _physics_process(delta):
	if host.get_meta("chase_switch"):
		chase_player(delta)
	else:
		idle()

func chase_player(delta):
	host.global_position += (player.global_position - host.global_position).normalized() * speed * delta
	if animated_sprite:
		animated_sprite.play("walk")
		if(player.global_position.x - host.global_position.x)>0:
			host.set_meta("face_to_right",true)
		else:
			host.set_meta("face_to_right",false)

func idle():
	if animated_sprite:
		animated_sprite.play("idle")
