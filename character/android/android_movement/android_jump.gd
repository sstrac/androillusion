extends AndroidMovementState

class_name AndroidJump

var jump_state: MovementState


func _init(character):
	jump_state = Jump.new()
	character.velocity = Vector2.ZERO
	
	
func physics_process(character, delta):
	jump_state.physics_process(character, delta)
	

func post_jump(character):
	character.movement_comp.be_still()
