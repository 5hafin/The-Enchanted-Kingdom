extends Node2D


var target_intercepted = false
var can_bite = true
var target = null
var bite_strength = 1

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
	target.add_bes("Зачарованный куст - ранее был яркой  и ароматной кустовой розой. Теперь же, под силами проклятья, его шипы стали настолько острыми, что ранят любого, кто соприкоснется с ними, а запах испортился и превратился в гниль. Нужно всегда быть на чеку, ведь внешне он ничем не отличается от других растений лабиринта", $F6c802d229Ddf22e.texture)
	pass # Replace with function body.
