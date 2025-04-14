extends MovementComponent


@onready var timer_change_direction = get_node("ChangeDirectionTimer")
@onready var still_timer = get_node("StillTimer")


func _ready():
	state = AndroidIdle.new(character)
	timer_change_direction.timeout.connect(_on_change_direction_timeout)
	timer_change_direction.start()


func _on_change_direction_timeout():
	state.redirect_idle_point(character)


func approach(target):
	state = AndroidApproach.new(target)


func jump():
	state = AndroidJump.new()
	
	
func post_jump():
	state.post_jump(character)


func post_slash():
	state.post_slash(character)
	
	
func post_approach():
	state = AndroidStill.new(character)


func post_still():
	state = AndroidIdle.new(character)
