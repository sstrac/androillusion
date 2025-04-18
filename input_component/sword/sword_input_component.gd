extends Node

@export var sword: Node2D

func _unhandled_input(event):
	if InputManager.interact_pressed(event):
		sword.attack()
