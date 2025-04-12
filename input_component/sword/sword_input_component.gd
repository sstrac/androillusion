extends Node

@export var sword: Node2D

func _unhandled_input(event):
	if event.is_action_pressed("left_click"):
		sword.attack()
