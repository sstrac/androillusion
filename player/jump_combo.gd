extends Node

const SLASH1_SCENE = preload("res://sword/slash/slash_down.tscn")
const SLASH2_SCENE = preload("res://sword/slash/slash_up.tscn")
const ORDERED_SLASHES = [SLASH2_SCENE, SLASH1_SCENE, SLASH2_SCENE, SLASH1_SCENE]
const JUMP_UP_SLASH_COMBO_I = 2

@export var movement_comp: Node
var sword: Node2D

var curr_slash_i = -1

func progress():
	curr_slash_i += 1
	
	if curr_slash_i == ORDERED_SLASHES.size():
		curr_slash_i = 0
		
	if curr_slash_i == JUMP_UP_SLASH_COMBO_I:
		movement_comp.jump()
	
	var slash_scene = ORDERED_SLASHES[curr_slash_i]
	
	var slash = slash_scene.instantiate()
	slash.sword = sword
	sword.add_child(slash)
	
