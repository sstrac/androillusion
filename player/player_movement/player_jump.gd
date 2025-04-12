extends PlayerControl

class_name PlayerJump

const JUMP_SPEED = 20
const DISTANCE = 200
const EPSILON = 0.01

var theta = 0
	

func physics_process(character, delta):
	var v_dir = Input.get_axis("up", "down")
	var h_dir = Input.get_axis("left", "right")
	character.global_position += Vector2(h_dir, v_dir) * SPEED
	
	theta += delta
	character.velocity.y = -DISTANCE * sin(JUMP_SPEED * theta) + 1
	character.move_and_slide()
	
	if abs(theta - 2 * PI/JUMP_SPEED) < EPSILON:
		character.movement_comp.state = PlayerControl.new()
