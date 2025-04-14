extends MovementState

class_name Idle

const RANGE = 300

var idle_point: Vector2


func _init(character):
	redirect_idle_point(character)


func redirect_idle_point(character):
	idle_point = character.global_position + Vector2(randf_range(-1.0, 1.0) * RANGE, randf_range(-1.0, 1.0) * RANGE)


func process(character, delta):
	character.go_to(idle_point, delta)
