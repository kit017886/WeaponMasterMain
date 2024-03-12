extends Component

var forbid_amount = 0
var broken_amount = 0

func Enter_Tree():
	set_var("not_gameover",true)

func __add_forbid_amount():
	forbid_amount+= 1
	gameover_judge()

func __add_broken_amount():
	broken_amount+= 1
	gameover_judge()
		
func gameover_judge():
	if forbid_amount + broken_amount == get_var("weapon_amount"):
		set_var("not_gameover",false)
		print_debug("gameover")
			
func __sub_forbid_amount():
	forbid_amount-= 1

func __sub_broken_amount():
	broken_amount-= 1
