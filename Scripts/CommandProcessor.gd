extends Node

var current_room = null

func init(starting_room):
	return change_room(starting_room)

func process_command(input: String):
	var words = input.split(" ", false)
	if words.size() ==0:
		return "Error"
	
	var firstWord = words[0].to_lower()
	var secondWord = " "
	
	if words.size() > 1:
		secondWord = words[1].to_lower()
		

	match firstWord:
		"go":
			return go(secondWord)
			
		"help":
			return help()
		_:
			return "I don't understand"


func go(secondWord: String):
	if secondWord == " ":
		return "Go where?"

	if current_room.exits.keys().has(secondWord):
		var change_response = change_room(current_room.exits[secondWord])
		return "\n".join(PackedStringArray(["You go %s" %secondWord, change_response]))
	else:
		return "Nope"
	
func help():
	return "You can use these commands:"

func change_room(new_room):
	current_room = new_room
	var exit_string = " ".join(PackedStringArray(new_room.exits.keys( ))) 
	var strings = "\n".join(PackedStringArray([
		 new_room.RoomName,
		 new_room.RoomDesc, 
		"Exits: " + exit_string
	]))
	return strings
