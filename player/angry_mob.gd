extends "res://player/player.gd"

var stands = true
var destination = Vector2()


func wander():
	var pos = position
	if stands:
		randomize()
		var X = int(rand_range(pos.X-50, pos.X+50))
		
