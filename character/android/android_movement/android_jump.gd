extends AndroidMovementState

class_name AndroidJump

var jump_state: MovementState


func _init():
	jump_state = Jump.new()
	
	
func physics_process(character, delta):
	jump_state.physics_process(character, delta)
	

func post_jump(character):
	character.movement_comp.go_still()
