extends Component
@export var anim_player : AnimationPlayer

func Enter_Tree():
	connect_user_signal("playAnim",_on_play_anim)
	create_signal("finish_anim")

func Ready():
	anim_player.play("RESET")

func _on_play_anim(anim_name,finish_signal_name = "finish_anim"):
	if anim_player.has_animation(anim_name):
		anim_player.play(anim_name)
		if anim_player.get_animation(anim_name).loop_mode == 0:
			await anim_player.animation_finished
			anim_player.play("RESET")
			host.emit_signal(finish_signal_name)
