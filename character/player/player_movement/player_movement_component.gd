extends MovementComponent


func _ready():
	state = PlayerControl.new()


func jump():
	state = PlayerJump.new()


func post_jump():
	state = PlayerControl.new()
