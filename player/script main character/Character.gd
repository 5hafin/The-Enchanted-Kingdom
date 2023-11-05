extends CharacterBody2D

@export var is_player = false

var SPEED = 200.0

@export var max_hp = 3
@onready var currentHealth : int = max_hp
@onready var valuehp = get_parent().get_health()
var vel = Vector2()


func _ready():
	#var animch = get_node("Character")
	
	pass





func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction*SPEED
	_start_Hp(currentHealth, max_hp)
	start_anim()
	move_and_slide()
	if currentHealth <=0:
		die()




func die():
	
	get_tree().change_scene_to_file("res://player/ui/interface.tscn")

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

func _start_Hp(currentHealth, max_hp):
	
	valuehp.value = currentHealth 
	valuehp.max_value = max_hp
	
func update_hp():
	valuehp.value = currentHealth
	
func reduce_hp(val):
	$AudioStreamPlayer2D.play()
	currentHealth -= val
	update_hp()
	
		
