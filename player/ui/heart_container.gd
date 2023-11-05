extends HBoxContainer

@onready var healthUiClass = preload("res://player/ui/health(ui).tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_max_hearts(max:int):
	for i in range(max):
		var heart = healthUiClass.instantiate()
		add_child(heart)
		
func updateHearts(currentHealth:int):
