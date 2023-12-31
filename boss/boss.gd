extends CharacterBody2D



var SPEED = 400.0

@onready var hp = 3
@export var max_hp = 3
var target_intercepted = false
var can_bite = true

var bite_strength = 3

var stands = true
var destination = Vector2()
var prev_position = Vector2()
var target = null
var default_speed = 90
@onready var pl = get_parent().get_player()

func _ready():
	SPEED = default_speed

func _process(delta):
	
	if velocity:
		prev_position = position
		move_and_slide()
	wander()
	search_for_target()
	if hp <= 0:
		die()
	
		
	
func search_for_target():
	
	
	if target:
		if position.distance_to(target.position) > 700:
			cancel_movment()
		else:
			set_destination(target.position)
	
	elif position.distance_to(pl.position) < 400:
		cancel_movment()
		SPEED = default_speed*2 if SPEED == default_speed else SPEED
		
		target = pl



func set_destination(dest):
	destination = dest
	velocity = (destination-position).normalized()*SPEED
	stands = false
	
func cancel_movment():
	velocity = Vector2()
	destination = Vector2()
	$Standingtimer.start(2)
	target = null
	SPEED = default_speed

func wander():
	var pos = position
	if stands:
		randomize()
		var x = int(randf_range(pos.x-150, pos.x+150))
		var y = int(randf_range(pos.y-150, pos.y+150))
		
		set_destination(Vector2(x, y))
	elif velocity != Vector2() and not target:
		if position.distance_to(destination) <= SPEED:
			cancel_movment()
		elif position.distance_to(prev_position)<= 0.1:
			cancel_movment()



func _on_BiteCoolDown_timeout():
	can_bite = true
	$BiteCoolDown.start(3)

func bite(targ):
	targ.reduce_hp(bite_strength)
	can_bite = false
	
	#запуск таймера кулдауна
	


func _on_bite_area_area_entered(area):
	if area.get_parent() == target:
		target_intercepted = true
		target.reduce_hp(bite_strength)
	pass # Replace with function body.


func _on_bite_area_area_exited(area):
	if area.get_parent() == target:
		target_intercepted = false
	pass # Replace with function body.
	
func reduce_hp(val):
	hp -= val
	
	
func die():	
	queue_free()
	pl.add_bes("Ахерон - В королевстве был одним из стражей королевского замка. Темные чары заколдовали его и сейчас его душа служит колдуну также доблестно и стойко, как ранее страж служил королю. Предстает в облике черного огненного призрака. Его лицо искажено из-за ужасов лабиринта, а некогда человеческое тело обгорело и погрузилось в огонь. Страж поглощает в свой огонь всех, кто захочет противостоять колдуну и снять злую магию с лабиринта. Взаимодействовать с ним могут только другие порождения лабиринта. Уязвим от острых ядовитых растений гнилой земли", $Sprite2D.texture)

