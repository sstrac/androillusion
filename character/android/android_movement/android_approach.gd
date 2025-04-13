extends Approach

class_name AndroidApproach

const CLOSE_RANGE = 80

var target_reached = false

func process(character, delta):
	if character.global_position.distance_to(target.global_position) > CLOSE_RANGE:
		character.go_to(target.global_position, delta)
	elif not target_reached:
		character.on_target_reached()
		target_reached = true


func post_jump(_character):
	pass
	

func post_slash(character):
	character.movement_comp.state = AndroidStill.new(character)
