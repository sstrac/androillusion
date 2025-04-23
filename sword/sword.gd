extends Node2D

@export var character: CharacterBody2D
@export var combo: Node
@export var damage_dealer_comp: Area2D 

var attacking: bool = false
var facing


func _ready() -> void:
	facing = Slash.RIGHT


func attack():
	if not attacking:
		attacking = true
		reactivate()
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
