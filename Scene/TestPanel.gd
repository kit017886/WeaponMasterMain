extends Panel
@onready var item_container = $VBoxContainer
@export var player: Node
var dict

# Called when the node enters the scene tree for the first time.
func _ready():
	dict = player.get_meta("variables")
	pass
	

