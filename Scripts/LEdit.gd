extends LineEdit

func _ready():
	grab_focus()
	set_caret_column(len(text))



func _on_text_submitted(_new_text):
	clear()
