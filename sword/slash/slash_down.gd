extends Node


const SPEED = 500
const EPSILON = 0.01
const FINAL_ROTATION = 100

@export var sword: Node2D


func _physics_process(delta: float) -> void:
	sword.rotation_degrees += 1 * delta * SPEED

	if abs(sword.rotation_degrees - FINAL_ROTATION) < EPSILON:
		queue_free()
