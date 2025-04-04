extends Node2D

@export var stacking_number_scene: PackedScene

var number

func feedback(damage) -> void:
	if number == null or number.locked:
		number = stacking_number_scene.instantiate()
		add_child(number)
		
	
	number.bump(damage)
