extends AndroidMovementState

class_name AndroidApproach

const SPEED = 500
const CLOSE_RANGE = 10

var target: Node2D
var last_target_location: Vector2
var target_reached = false


func _init(_target, aiming_timer):
	target = _target
	aiming_timer.timeout.connect(_charge)
	aiming_timer.start()
	

func _charge():
	last_target_location = target.global_position


func process(character, delta):
	if last_target_location:
		if character.global_position.distance_to(last_target_location) > CLOSE_RANGE:
			character.go_towards(last_target_location, delta, SPEED)
		elif not target_reached:
			character.on_target_reached()
			target_reached = true
