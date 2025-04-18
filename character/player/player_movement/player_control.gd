extends PlayerMovementState

class_name PlayerControl

const SPEED = 300

func physics_process(character, delta):
	var v_dir = Input.get_axis("up", "down")
	var h_dir = Input.get_axis("left", "right")
	character.go_in_direction(Vector2(h_dir, v_dir).normalized(), delta, SPEED)
