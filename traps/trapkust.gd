extends Node2D


var target_intercepted = false
var can_bite = true
var target = null
var bite_strength = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	target = area.get_parent()
	target_intercepted = true
	target.reduce_hp(bite_strength)
	pass # Replace with function body.
