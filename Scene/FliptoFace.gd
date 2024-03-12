extends FaceLookat
class_name FliptoFace
@export var animated_sprite: AnimatedSprite2D

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if host.get_meta("face_to_right"):
		animated_sprite.flip_h = false
	else:
		animated_sprite.flip_h = true
