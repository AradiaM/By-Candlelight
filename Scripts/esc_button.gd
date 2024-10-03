extends Control

@onready var settings_screen = $"../Settings Screen"
@onready var line_edit: LineEdit = $"../../MarginContainer/MainHbox/TextRect/VBoxContainer/LineEdit"

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE and settings_screen.visible == false:
			settings_screen.visible = true
		else: 
			settings_screen.visible = false
			line_edit.grab_focus()
