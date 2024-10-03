extends Node

func _ready() -> void:
	$GameRoom.connect_exit("east", $House)
