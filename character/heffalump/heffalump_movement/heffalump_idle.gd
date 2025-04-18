extends HeffalumpMovementState


class_name HeffalumpIdle

var idle_state: MovementState


func _init(character):
	idle_state = Idle.new(character)
	

func redirect_idle_point(character):
	idle_state.redirect_idle_point(character)


func process(character, delta):
	idle_state.process(character, delta)
