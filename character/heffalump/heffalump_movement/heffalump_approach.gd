extends HeffalumpMovementState


class_name HeffalumpApproach

const SPEED = 300
const CLOSE_RANGE = 10
const OVERSHOOT_FACTOR = 150

var target_reached = false
var target_location: Vector2
var direction


func _init(character, target):
	direction = character.global_position.direction_to(target.global_position).normalized()
	target_location = target.global_position + direction * OVERSHOOT_FACTOR


func process(character, delta):
	if character.global_position.distance_to(target_location) > CLOSE_RANGE:
		character.go_towards(target_location, delta, SPEED)
	elif not target_reached:
		character.on_target_reached()
		target_reached = true
