extends AndroidMovementState

class_name AndroidApproach

const SPEED = 500
const CLOSE_RANGE = 10

#Using composition to get base state functionality
var approach_state: MovementState

var charge: bool = false
var target_reached = false

var last_target_location: Vector2


func _init(target, aiming_timer):
	approach_state = Approach.new(target)
	approach_state.target = target
	aiming_timer.timeout.connect(_charge)
	aiming_timer.start()
	

func _charge():
	charge = true
	last_target_location = approach_state.target.global_position


func process(character, delta):
	if charge:
		if character.global_position.distance_to(last_target_location) > CLOSE_RANGE:
			character.go_towards(last_target_location, delta, SPEED)
		elif not target_reached:
			character.on_target_reached()
			target_reached = true


func post_slash(character):
	character.movement_comp.be_idle()
	
