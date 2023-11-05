extends StaticBody2D




var target_intercepted = false
var can_bite = true
var bite_strength = 1
var target = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if target_intercepted and can_bite:
		bite(target)
	pass

func _on_BiteCoolDown_timeout():
	can_bite = true
	$BiteCoolDown.start(1)

func bite(targ):
	targ.reduce_hp(bite_strength)
	can_bite = false
	
	#запуск таймера кулдауна
	
func _on_bitarea_area_entered(area):
	if area.get_parent() == target:
		target_intercepted = true
		target.reduce_hp(bite_strength)
		
	pass # Replace with function body.


func _on_bitarea_area_exited(area):
	if area.get_parent() == target:
		target_intercepted = false
	pass # Replace with function body.



