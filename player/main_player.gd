extends "res://player/player.gd"

@onready var animch = get_node("main_player")
var vel = Vector2()


func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction*SPEED
	
	start_anim()
	move_and_slide()

func die():
	queue_free()

func start_anim():
	if velocity.x >0:
		$Anim.play("walk right")
	elif velocity.x < 0:
		$Anim.play("walk left")
	elif velocity.y < 0:
		$Anim.play ("walk up")
	elif velocity.y > 0:
		$Anim.play("walk down")
	elif velocity.y == 0 and velocity.x == 0:
		$Anim.play("Idle")


func set_start_hp(hp_bar, max_hp_bar):
	get_parent().hp_bar().value = hp_bar
	get_parent().hp_bar().max_value = max_hp_bar
	
func update_hp():
	hp_bar().value = hp_bar

