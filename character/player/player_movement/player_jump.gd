extends PlayerMovementState

class_name PlayerJump

const JUMP_SPEED = 20
const JUMP_DISTANCE = 750

var player_control_state: MovementState
var jump_state: MovementState


func _init():
	player_control_state = PlayerControl.new()
	jump_state = Jump.new(JUMP_SPEED, JUMP_DISTANCE)


func physics_process(character, delta):
	player_control_state.physics_process(character, delta)
	jump_state.physics_process(character, delta)
