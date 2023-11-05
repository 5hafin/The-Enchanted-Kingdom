extends Node2D


@onready var Character = $Character

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	play_music()
	pass

func get_player():
	return $Character

func get_health():
	return $CanvasLayer/hp_bar

func play_music():
	$AudioStreamPlayer2D.play()
