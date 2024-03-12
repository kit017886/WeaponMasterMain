extends Anim
class_name Update2DirFilpWalkAnim

func _process(delta):
	update_filp()
	update_walk_anim()

func update_filp():
	var sprite
	if host.has_node("AnimatedSprite2D(1dir)"):
		sprite = host.get_node("AnimatedSprite2D(1dir)")
	elif host.has_node("Sprite2D"):
		sprite = host.get_node("Sprite2D")
	else:
		sprite = host
	if host.velocity.x > 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true

func update_walk_anim():
	var anim
	if host.has_node("AnimatedSprite2D(1dir)"):
		anim = host.get_node("AnimatedSprite2D(1dir)")
	elif host.has_node("AnimationPlayer"):
		anim = host.get_node("AnimationPlayer")
	if host.velocity.length() != 0:
		anim.play("walk")
	else:
		anim.play("idle")
		
