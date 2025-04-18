extends MovementComponent


class_name HeffalumpMovementComponent


func _ready() -> void:
	state = HeffalumpIdle.new(character)
