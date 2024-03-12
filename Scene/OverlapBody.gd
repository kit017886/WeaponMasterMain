extends CharacterBody2D

@onready var parent = $".."

func _physics_process(delta):
	parent.global_position = global_position
