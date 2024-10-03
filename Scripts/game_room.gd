extends PanelContainer
class_name Game_Room

@export var RoomName := "Room Name"
@export var RoomDesc := "This is the description"

var exits: Dictionary = {}

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
			
