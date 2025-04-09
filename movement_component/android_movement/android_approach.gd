extends Approach

class_name AndroidApproach


func process(character, delta):
	character.follow(target.global_position, delta)
