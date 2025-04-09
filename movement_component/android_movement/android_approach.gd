extends Approach

class_name AndroidApproach

const CLOSE_RANGE = 80

func process(character, delta):
	if character.global_position.distance_to(target.global_position) > CLOSE_RANGE:
		character.follow(target.global_position, delta)
	else:
		character.movement_comp.state = AndroidStill.new(character)
