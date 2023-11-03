extends Area2D

@onready var owner = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(_body_enterned)
	
func _body_enterned():
	if is_instance_of(self, preload("res://player/player.gd")):
		if body != owner:
			body.die()
