extends Component
@export var atk = 3
@export var knock_back_power =200
var hitbox

func Ready():
	host.set_meta("atk",atk)
	hitbox = host.find_child("HitBox")
	hitbox.connect("area_entered",normal_attack)

func normal_attack(area):
	if area.name == "HurtBox" and area.get_parent().is_in_group("enemy"):
		var enemy = area.get_parent()
		enemy.emit_signal("be_attack",atk,host.velocity,knock_back_power)
