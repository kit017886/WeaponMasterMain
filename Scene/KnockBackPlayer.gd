extends Component
class_name AttackPlayer
var hitbox
@export var knock_back_power = 400
@export var atk = 1

func Ready():
	if host.has_node("HitBox"):
		hitbox = host.get_node("HitBox")
	hitbox.connect("area_entered",attack_player)
	
func attack_player(area):
	if area.name == "PlayerHurtBox":
		var player = area.get_parent()
		player.emit_signal("be_attack",atk,host.velocity,knock_back_power)
