extends Node2D

@export var character: CharacterBody2D
@export var combo: Node
@export var movement_comp: Node
@export var avoid_hitbox: Area2D

@onready var damage_dealer_comp: Area2D = get_node("DamageDealerComponent")

var attacking: bool = false

func _ready() -> void:
	damage_dealer_comp.avoid_hitbox = avoid_hitbox


func attack():
	if not attacking:
		attacking = true
		show()
		avoid_hitbox = avoid_hitbox
		combo.progress()
