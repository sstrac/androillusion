extends Node

@export var character: CharacterBody2D

func _unhandled_input(event):
	if event.is_action_pressed("left_click"):
		character.slash_sword()
