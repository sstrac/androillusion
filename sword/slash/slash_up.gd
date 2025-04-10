extends Node


const SPEED = 500
const EPSILON = 0.01
const FINAL_ROTATION = 100
# Called when the node enters the scene tree for the first time.

@export var sword: Node2D

func _ready() -> void:
	sword.rotation_degrees = FINAL_ROTATION


func _physics_process(delta: float) -> void:
	sword.rotation_degrees -= 1 * delta * SPEED

	if abs(sword.rotation_degrees) < EPSILON:
		sword.queue_free()
