extends Control




func _on_play_pressed():
	get_tree().change_scene_to_file("res://player/ui/bes.tscn")
	


func _on_saves_pressed():
	pass # Replace with function body.


func _on_guid_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()


func _on_options_pressed():
	get_tree().change_scene_to_file("res://player/ui/options_interface.tscn")
