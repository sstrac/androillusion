extends PlayerMovementState

class_name PlayerControl

const SPEED = 300


func physics_process(character, delta):
	var dir = Input.get_vector("left", "right", "up", "down")
	character.go_in_direction(dir, delta, SPEED)
