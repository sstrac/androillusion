extends MovementState

class_name AndroidStill

func _init(character):
	character.movement_comp.still_timer.timeout.connect(_on_still_timer_timeout.bind(character))
	character.movement_comp.still_timer.start()
	

func _on_still_timer_timeout(character):
	character.movement_comp.state = AndroidIdle.new(character)
