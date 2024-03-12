extends Component

func Enter_Tree():
	connect_user_signal("hurt_anim",_on_hurt_anim)

func _on_hurt_anim():
	host.emit_signal("playAnim","hurt_blink")
