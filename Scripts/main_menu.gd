extends Control



func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/base.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/settings_screen.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
