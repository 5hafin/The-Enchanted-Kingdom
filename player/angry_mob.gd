extends "res://player/player.gd"

var stands = true
var destination = Vector2()
var prev_position = Vector2()
var target = null
var default_speed = 50

func _ready():
	SPEED = default_speed

func _process(delta):
	if velocity:
		prev_position = position
		move_and_slide()
	wander()
	search_for_target()
	
func search_for_target():
	var pl = get_parent().get_player()
	
	if target:
		if position.distance_to(target.position) > 300:
			cancel_movment()
		else:
			set_destination(target.position)
	
	elif position.distance_to(pl.position) < 100:
		cancel_movment()
		SPEED = default_speed*3 if SPEED == default_speed else SPEED
		
		target = pl



func set_destination(dest):
	destination = dest
	velocity = (destination-position).normalized()*SPEED
	stands = false
	
func cancel_movment():
	velocity = Vector2()
	destination = Vector2()
	$Standing_Timer.start(1)
	target = null
	SPEED = default_speed

func wander():
	var pos = position
	if stands:
		randomize()
		var x = int(randf_range(pos.x-10, pos.x+10))
		var y = int(randf_range(pos.y-10, pos.y+10))
		
		set_destination(Vector2(x, y))
	elif velocity != Vector2() and not target:
		if pos.distance_to(destination) <= SPEED-100:
			cancel_movment()
		elif pos.distance_to(prev_position)<= 0.6:
			cancel_movment()

func _on_standing_timer_timeout():
	stands = true
	pass # Replace with function body.

func die():
	queue_free()
