extends CharacterBody2D



var SPEED = 400.0
var stands = true
var destination = Vector2()
var prev_position = Vector2()

var default_speed = 45


func _ready():
	SPEED = default_speed

func _process(delta):
	$AnimatedSprite2D.play("default")
	if velocity:
		prev_position = position
		move_and_slide()
	wander()

func set_destination(dest):
	destination = dest
	velocity = (destination-position).normalized()*SPEED
	stands = false
	
func cancel_movment():
	
	destination = Vector2()
	$Timer.start(2)


func wander():
	var pos = position
	if stands:
		randomize()
		var x = randi_range(pos.x-50, pos.x+50)
		var y = randi_range(pos.y-50, pos.y+50)
		
		set_destination(Vector2(x, y))
	elif velocity != Vector2():
		if pos.distance_to(destination) <= SPEED:
			cancel_movment()
		elif position.distance_to(prev_position)<= 0.2:
			cancel_movment()
	pass

func _on_timer_timeout():
	stands = true
	pass # Replace with function body.
