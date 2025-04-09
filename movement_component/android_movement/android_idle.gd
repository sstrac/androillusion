extends Idle

class_name AndroidIdle


func approach(character, target: Node2D):
	character.movement_comp.state = AndroidApproach.new(target)
