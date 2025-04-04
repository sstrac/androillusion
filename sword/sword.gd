extends Node2D


const SPEED = 500
const EPSILON = 0.01
const FINAL_ROTATION = 100
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	rotation_degrees += 1 * delta * SPEED

	if abs(rotation_degrees - FINAL_ROTATION) < EPSILON:
		queue_free()
