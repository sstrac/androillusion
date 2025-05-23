extends Slash


const EPSILON = 0.01

var increment_factor: int
var final_rotation: int

var facing

var speed: int
var sword: Node2D


func _physics_process(delta: float) -> void:
	if facing == RIGHT:
		final_rotation = 100
		increment_factor = 1
		
	elif facing == LEFT:
		final_rotation = -100
		increment_factor = -1
	
	sword.rotation_degrees += increment_factor * delta * speed

	if abs(sword.rotation_degrees - final_rotation) < EPSILON:
		queue_free()
