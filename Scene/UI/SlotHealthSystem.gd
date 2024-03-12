extends Component
class_name SlotHealthSystem
@export var max_hp: int
@export var max_sp: int
@export var def: int
var hp
var sp

func Ready():
	set_data()

func set_data():
	set_var("max_hp",max_hp)
	set_var("max_sp",max_sp)
	hp = max_hp
	sp = max_sp
	set_var("hp",hp)
	set_var("sp",sp)
