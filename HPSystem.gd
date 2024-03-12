extends Node2D

@export var host: Node
@export var hp: int
func _ready():
	set_host_hp()
	add_zero_hp_signal()
	connect_hurt_func()

func set_host_hp():
	host.set_meta("hp",hp)

func add_hurt_signal():
	host.add_user_signal("hurt")
	
func add_zero_hp_signal():
	host.add_user_signal("zero_hp")

func connect_hurt_func():
	if !host.has_signal("hurt"):
		add_hurt_signal()
	host.connect("hurt",_on_hurt)

func _on_hurt(value):
	var old_value = host.get_meta("hp")
	host.set_meta("hp",old_value- value)
	if old_value- value < 0:
		host.emit_signal("zero_hp")

