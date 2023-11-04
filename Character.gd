extends CharacterBody2D

@export var is_player = false

var SPEED = 200.0




@onready var animch = get_node("Character")
var vel = Vector2()


func _ready():
	pass





func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction*SPEED
	
	start_anim()
	move_and_slide()

func die():
	queue_free()

func start_anim():
	if velocity.x >0:
		$Anim.play("вправо")
	elif velocity.x < 0:
		$Anim.play("влево")
	elif velocity.y < 0:
		$Anim.play ("вверх")
	elif velocity.y > 0:
		$Anim.play("вниз")
	elif velocity.y == 0 and velocity.x == 0:
		$Anim.play("стоит")




