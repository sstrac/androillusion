extends Node

enum SwordState { NONE, SLASH1, SLASH2, SLASH3 }

const SWORD = preload("res://sword/sword.tscn")

@export var character: CharacterBody2D

var state: SwordState = SwordState.NONE


func _unhandled_input(event):
	if event.is_action_pressed("left_click"):
		var sword = SWORD.instantiate()
		character.add_child(sword)
