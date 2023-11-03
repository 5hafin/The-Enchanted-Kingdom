extends "res://player/player.gd"



func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction*SPEED
	
	move_and_slide()

func die():
	queue_free()
