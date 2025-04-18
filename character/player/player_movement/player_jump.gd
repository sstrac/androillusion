extends PlayerMovementState

class_name PlayerJump

const JUMP_SPEED = 20
const DISTANCE = 200
const EPSILON = 0.01

var theta = 0
var player_control_state: MovementState


func _init():
	player_control_state = PlayerControl.new()


func physics_process(character, delta):
	player_control_state.physics_process(character, delta)
	
	theta += delta
	character.velocity.y = -DISTANCE * sin(JUMP_SPEED * theta) + 1
	character.move_and_slide()
	
	if abs(theta - 2 * PI/JUMP_SPEED) < EPSILON:
		character.movement_comp.state = PlayerControl.new()
