extends Anim
class_name Update4DirWalkAnim
var animation

func updateAnimation():
	if host.has_node("AnimationPlayer(4dir)"):
		animation = host.get_node("AnimationPlayer(4dir)")
	elif host.has_node("AnimatedSprite2D(4dir)"):
		animation = host.get_node("AnimatedSprite2D(4dir)")
	
	var direction = "down"
	if host.velocity.length() == 0:
		if animation:
			animation.stop()
	else:
		var normal_vel = host.velocity.normalized()
		if normal_vel.x <0 and abs(normal_vel.x) > abs(normal_vel.y): direction = "left"
		elif normal_vel.x >0 and abs(normal_vel.x) > abs(normal_vel.y): direction = "right"
		elif normal_vel.y <0: direction = "up"
		if animation:
			animation.play("walk_" + direction)

func Physics_Update(delta):
	updateAnimation()
	
