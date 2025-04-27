extends Node

const SLASH1_SCENE = preload("res://equipment/sword/slash/slash_down.tscn")
const SLASH2_SCENE = preload("res://equipment/sword/slash/slash_up.tscn")
const ORDERED_SLASHES = [SLASH2_SCENE, SLASH1_SCENE, SLASH2_SCENE, SLASH1_SCENE]
const JUMP_UP_SLASH_COMBO_INDEX = 2
const LAND_SLASH_COMBO_INDEX = 3

const JUMP_UP_SLASH_COMBO_DAMAGE_MULTIPLIER = 2
const LAND_SLASH_COMBO_DAMAGE_MULTIPLIER = 3

@export var movement_comp: Node
@export var damage_dealer_comp: Node
@export var sword: Node2D
@export var slash_speed: int

@onready var reset_timer: Timer = get_node("ResetTimer")

var slashing = false
var curr_slash_i = -1

signal slash_complete


func _ready() -> void:
	reset_timer.timeout.connect(_reset_combo)


func _reset_combo():
	if not slashing:
		curr_slash_i = -1


func _slash_complete():
	slashing = false
	slash_complete.emit()


func progress(facing):
	slashing = true
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
	slash.tree_exited.connect(_slash_complete)
	sword.add_child(slash)
	
	if curr_slash_i == JUMP_UP_SLASH_COMBO_INDEX:
		damage_dealer_comp.multiplier = JUMP_UP_SLASH_COMBO_DAMAGE_MULTIPLIER
		movement_comp.jump()
		
	elif curr_slash_i == LAND_SLASH_COMBO_INDEX:
		damage_dealer_comp.multiplier = LAND_SLASH_COMBO_DAMAGE_MULTIPLIER

	else:
		damage_dealer_comp.multiplier = 1


func combo_complete() -> bool:
	return curr_slash_i == len(ORDERED_SLASHES) - 1
