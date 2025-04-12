extends MovementComponent


func _ready():
	state = PlayerControl.new()


func jump():
	state = PlayerJump.new()
