@tool
extends PanelContainer
class_name Game_Room

@export var RoomName := "Room Name":set = set_zone_name 
@export_multiline var RoomDesc := "This is the description" :set = set_zone_desc

var exits: Dictionary = {}

func set_zone_name(new_name: String):
	$"MarginContainer/VBoxContainer/Room Name".text = new_name
	RoomName = new_name
func set_zone_desc(new_desc: String):
	$"MarginContainer/VBoxContainer/Room Description".text = new_desc
	RoomDesc = new_desc

func connect_exit(direction: String, room):
	match direction:
		"west":
			exits[direction] = room
			room.exits["east"] = self
		"east":
			exits[direction] = room
			room.exits["west"] = self
		"north":
			exits[direction] = room
			room.exits["south"] = self
		"south":
			exits[direction] = room
			room.exits["north"] = self
		_:
			printerr("invalid direction: %s", direction)
			
