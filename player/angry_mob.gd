extends "res://player/player.gd"

var stands = true
var destination = Vector2()



func _ready():
	SPEED = 300

func _process(delta):
	if velocity:
		move_and_slide()
	wander()

func set_destination(dest):
	destination = dest
	velocity = (destination-position).normalized()*SPEED
	stands = false
	
func cancel_movment():
	velocity = Vector2()
	destination = Vector2()
	$Standing_Timer.start(0)

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


func _on_standing_timer_timeout():
	stands = true
	pass # Replace with function body.
