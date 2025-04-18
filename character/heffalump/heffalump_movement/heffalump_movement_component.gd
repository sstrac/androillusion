extends MovementComponent


class_name HeffalumpMovementComponent


@onready var timer_change_direction = get_node("ChangeDirectionTimer")
@onready var still_timer = get_node("StillTimer")


func _ready() -> void:
	state = HeffalumpIdle.new(character)
	timer_change_direction.timeout.connect(_on_change_direction_timeout)
	timer_change_direction.start()
	

func _on_change_direction_timeout():
	state.redirect_idle_point(character)


func approach(target):
	state = HeffalumpApproach.new(character, target)
	

func be_idle():
	state = HeffalumpIdle.new(character)
