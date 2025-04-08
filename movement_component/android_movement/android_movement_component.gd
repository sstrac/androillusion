extends MovementComponent


@onready var timer_change_direction = get_node("Timer")


func _ready():
	state = AndroidIdle.new(character)
	timer_change_direction.timeout.connect(_on_change_direction_timeout)
	timer_change_direction.start()


func _on_change_direction_timeout():
	state.redirect_idle_point(character)
