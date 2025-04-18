extends Slash


const SPEED = 500
const EPSILON = 0.01

const FINAL_ROTATION = 0

var increment_factor: int
var facing
@export var sword: Node2D


func _ready() -> void:
	if facing == RIGHT:
		sword.rotation_degrees = 100
		
	elif facing == LEFT:
		sword.rotation_degrees = -100
	


func _physics_process(delta: float) -> void:
	if facing == RIGHT:
		increment_factor = -1
		
	elif facing == LEFT:
		increment_factor = 1
	
	sword.rotation_degrees += increment_factor * delta * SPEED

	if abs(sword.rotation_degrees) < EPSILON:
		queue_free()
