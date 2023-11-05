extends StaticBody2D

var target_intercepted = false
var can_bite = true
var target = null
var bite_strength = 3

func _ready():
	pass

func _process(delta):
	pass




func _on_BiteCoolDown_timeout():
	can_bite = true
	$BiteCoolDown.start(3)
func _on_bite_area_area_entered(area):
	
	target_intercepted = true
	area.get_parent().reduce_hp(bite_strength)


	


