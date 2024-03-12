extends Component
class_name SetWeaponData

func __set_weapon_data(data:Dictionary):
	set_var("max_hp",data.max_hp)
	set_var("max_sp",data.max_sp)
	set_var("hp",data.hp)
	set_var("sp",data.sp)
