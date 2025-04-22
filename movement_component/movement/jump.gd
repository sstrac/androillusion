extends MovementState


class_name Jump

const EPSILON = 0.01

var theta = 0
var speed
var distance

func _init(speed=20, distance=1000) -> void:
	self.speed = speed
	self.distance = distance
	
	
func physics_process(character, delta):
	theta += delta
	character.velocity.y = -distance * sin(speed * theta) + 1
	character.move_and_slide()
	
	if abs(theta - 2 * PI/speed) < EPSILON:
		character.movement_comp.post_jump()
