extends Node2D


@onready var character = get_node("Character")


func attack(target):
	character.movement_comp.approach(target)
	# Do other stuff
