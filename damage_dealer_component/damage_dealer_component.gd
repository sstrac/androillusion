extends Area2D


@export var base_damage: int
@onready var collision_shape: CollisionShape2D = get_node("CollisionShape2D")

@export var avoid_hitbox: Area2D

var multiplier: float = 1.0


func disable():
	collision_shape.set_deferred('disabled', true)


func enable():
	collision_shape.set_deferred('disabled', false)


func get_total_damage():
	return base_damage * multiplier * DialTracker.factor
