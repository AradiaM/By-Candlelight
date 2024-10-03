extends Control

const InputResponse = preload("res://Scenes/input_response.tscn")
const Response = preload("res://Scenes/response.tscn")

@export var max_memory := 30 #must add := for export var

@onready var text_v_box = $MarginContainer/MainHbox/TextRect/VBoxContainer/Scroll/TextVBox
@onready var scroll = $MarginContainer/MainHbox/TextRect/VBoxContainer/Scroll
@onready var scrollbar = scroll.get_v_scroll_bar()
@onready var command_processor = $CommandProcessor
@onready var room_manager = $RoomManager



func _ready():
	scrollbar.changed.connect(handle_scrollbar_changed)
	handle_response("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
	#command_processor.response_generated.connect(handle_response)
	var starting_room_response = command_processor.init(room_manager.get_child(0))
	handle_response(starting_room_response)
	
func handle_scrollbar_changed():
	scroll.scroll_vertical = scrollbar.max_value

func _on_line_edit_text_submitted(new_text):
	if new_text.is_empty():
		return
	var input_response = InputResponse.instantiate()
	var response = command_processor.process_command(new_text)
	input_response.set_text(new_text,response)
	add_response(input_response)

func handle_response(response_text: String):
	var response = Response.instantiate()
	response.text = response_text
	add_response(response)

func add_response(response: Control):
	text_v_box.add_child(response)
	delete_history()

func delete_history():
	if text_v_box.get_child_count() > max_memory:
		var rows_forgotten = text_v_box.get_child_count() - max_memory
		for i in range(rows_forgotten):
			text_v_box.get_child(i).queue_free()
			
