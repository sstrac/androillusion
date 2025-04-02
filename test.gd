extends Node

const NUMBER = preload("res://number.tscn")

var number

func _on_button_pressed() -> void:
	if number == null or number.locked:
		number = NUMBER.instantiate()
		number.position = Vector2(200, 200)
		add_child(number)
		
	
	number.bump(2)
