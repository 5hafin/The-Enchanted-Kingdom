extends CharacterBody2D

@export var is_player = false

const SPEED = 600.0



func _physics_process(delta):
	if is_player:
		var direction = Input.get_vector("left","right","up","down")
		velocity = direction*SPEED
	
		move_and_slide()

func die():
	queue_free()
