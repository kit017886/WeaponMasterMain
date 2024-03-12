extends Component
class_name HealthSystem
@export var max_hp: int
@export var max_sp: int
@export var def: int
var hp
var sp

func Enter_Tree():
	pass
	hp = max_hp
	sp = max_sp
	__set_data()
	

func __set_data():
	set_var("max_hp",max_hp)
	set_var("max_sp",max_sp)
	set_var("hp",hp)
	set_var("sp",sp)
	set_var("def",def)	

func __set_weapon_data(data:Dictionary):
	set_var("max_hp",data.max_hp)
	set_var("max_sp",data.max_sp)
	set_var("hp",data.hp)
	set_var("sp",data.sp)
	
