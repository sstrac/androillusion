extends Jump

class_name AndroidJump


func post_jump(character):
	character.movement_comp.state = AndroidStill.new(character)
