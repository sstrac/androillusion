extends MovementComponent

@onready var timer_change_direction = get_node("ChangeDirectionTimer")
@onready var still_timer = get_node("StillTimer")
@onready var aiming_timer = get_node("AimingTimer")


func _ready():
	state = AndroidIdle.new(character)
	timer_change_direction.timeout.connect(_on_change_direction_timeout)
	timer_change_direction.start()

	
func _on_change_direction_timeout():
	state.redirect_idle_point(character)


func approach(target):
	state = AndroidApproach.new(target, aiming_timer)


func jump():
	state = AndroidJump.new(character)


func be_still():
	state = AndroidStill.new(character)


func be_idle():
	state = AndroidIdle.new(character)

	
func post_jump():
	state.post_jump(character)

	
func post_combo():
	be_idle()
	
