extends "res://player/player.gd"

var stands = true
var destination = Vector2()
var prev_position = Vector2()
var target = null
var default_speed = 100

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
	if position.distance_to(pl.position) < 200:
		cancel_movment()
		SPEED = default_speed*5 if SPEED == default_speed else SPEED
		
		target = pl

	else:
		if target:
			cancel_movment()
		target = null
	if target:
		set_destination(target.position)

func set_destination(dest):
	destination = dest
	velocity = (destination-position).normalized()*SPEED
	stands = false
	
func cancel_movment():
	velocity = Vector2()
	destination = Vector2()
	$Standing_Timer.start(0)
	SPEED = default_speed

func wander():
	var pos = position
	if stands:
		randomize()
		var x = int(randf_range(pos.x-350, pos.x+350))
		var y = int(randf_range(pos.y-350, pos.y+350))
		
		set_destination(Vector2(x, y))
	elif velocity != Vector2():
		if pos.distance_to(destination) <= 50:
			cancel_movment()
		elif pos.distance_to(prev_position)<= 0.6:
			cancel_movment()

func _on_standing_timer_timeout():
	stands = true
	pass # Replace with function body.
