extends Node

var current_room = null

func init(starting_room):
	current_room = starting_room

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

	return "You go %s" %secondWord
	
func help():
	return "You can use these commands:"
