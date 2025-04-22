extends Node

const SLASH1_SCENE = preload("res://sword/slash/slash_down.tscn")
const SLASH2_SCENE = preload("res://sword/slash/slash_up.tscn")
const ORDERED_SLASHES = [SLASH2_SCENE, SLASH1_SCENE, SLASH2_SCENE, SLASH1_SCENE]
const JUMP_UP_SLASH_COMBO_I = 2

@export var movement_comp: Node
@export var sword: Node2D
@export var slash_speed: int

@onready var reset_timer: Timer = get_node("ResetTimer")

var curr_slash_i = -1

signal slash_complete


func _ready() -> void:
	reset_timer.timeout.connect(_reset_combo)


func _reset_combo():
	curr_slash_i = -1


func progress(facing):
	reset_timer.start()
	
	assert(sword != null)
	
	curr_slash_i += 1
	
	if curr_slash_i == ORDERED_SLASHES.size():
		curr_slash_i = 0
	
	var slash_scene = ORDERED_SLASHES[curr_slash_i]
	
	var slash = slash_scene.instantiate()
	slash.sword = sword
	slash.facing = facing
	slash.speed = slash_speed
	slash.tree_exited.connect(func(): slash_complete.emit())
	sword.add_child(slash)
	
	if curr_slash_i == JUMP_UP_SLASH_COMBO_I:
		movement_comp.jump()


func combo_complete():
	return curr_slash_i == len(ORDERED_SLASHES) - 1
