extends Node2D

@export var character: CharacterBody2D
@export var combo: Node
@export var movement_comp: Node
@export var avoid_hitbox: Area2D

@onready var damage_dealer_comp: Area2D = get_node("DamageDealerComponent")

var attacking: bool = false
var facing


func _ready() -> void:
	damage_dealer_comp.avoid_hitbox = avoid_hitbox
	facing = Slash.RIGHT


func attack():
	if not attacking:
		attacking = true
		reactivate()
		avoid_hitbox = avoid_hitbox
		combo.progress(facing)


func deactivate():
	hide()
	damage_dealer_comp.disable()
	
	
func reactivate():
	show()
	damage_dealer_comp.enable()
	
	
func face_left():
	position.x = -abs(position.x)
	facing = Slash.LEFT


func face_right():
	position.x = abs(position.x)
	facing = Slash.RIGHT
