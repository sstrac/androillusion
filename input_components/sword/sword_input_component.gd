extends Node

const SWORD_SCENE = preload("res://sword/sword.tscn")
const SLASH1_SCENE = preload("res://sword/slash/slash_down.tscn")
const SLASH2_SCENE = preload("res://sword/slash/slash_up.tscn")
const COMBO_ORDERED = [SLASH1_SCENE, SLASH2_SCENE]

@export var character: CharacterBody2D

var curr_slash_i = -1

func _unhandled_input(event):
	if event.is_action_pressed("left_click"):
		var sword = SWORD_SCENE.instantiate()
		
		var slash_scene = COMBO_ORDERED[curr_slash_i + 1]
		
		var sword_movement = slash_scene.instantiate()
		sword_movement.sword = sword
		sword.add_child(sword_movement)
		character.add_child(sword)
		
		if curr_slash_i + 1 == COMBO_ORDERED.size() - 1:
			curr_slash_i = -1
		else:
			curr_slash_i += 1
