extends MovementState

class_name PlayerControl

const SPEED = 3

func physics_process(character, delta):
	var v_dir = Input.get_axis("up", "down")
	var h_dir = Input.get_axis("left", "right")
	character.global_position += Vector2(h_dir, v_dir) * SPEED
