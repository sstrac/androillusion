extends Area2D


@export var base_damage: int
@onready var collision_shape: CollisionShape2D = get_node("CollisionShape2D")

@export var avoid_hitbox: Area2D


func disable():
	collision_shape.disabled = true


func enable():
	collision_shape.disabled = false
