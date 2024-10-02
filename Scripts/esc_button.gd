extends Control

@onready var settings_screen = $"../Settings Screen"

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE and settings_screen.visible == false:
			settings_screen.visible = true
		else: 
			settings_screen.visible = false
			
