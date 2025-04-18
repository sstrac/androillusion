extends Control


@onready var hand = get_node("Hand")

const R = 300 # radius
const DEVICE = 0

var center
var x
var hand_moving = false

signal changed(factor)

func _ready() -> void:
	center = hand.global_position


func _unhandled_input(event: InputEvent) -> void:
	if InputManager.dial_moved(event):
		hand_moving = true
	elif InputManager.dial_stopped(event):
		hand_moving = false


func _physics_process(delta: float) -> void:
	if hand_moving:
		if InputTracker.last_input_device == InputTracker.InputDevice.KEYBOARD_MOUSE:
			_move_via_mouse(delta)
		elif InputTracker.last_input_device == InputTracker.InputDevice.GAMEPAD:
			_move_via_analogue(delta)


func _move_via_analogue(delta):
	var dir = Vector2(
		Input.get_joy_axis(DEVICE, JOY_AXIS_RIGHT_X),
		Input.get_joy_axis(DEVICE, JOY_AXIS_RIGHT_Y)
	)
	
	dir = dir.clamp(Vector2(-1.0, -1.0), Vector2(1.0, 0.0))
	var angle = Vector2.UP.angle_to(dir)
	hand.rotation = lerp(hand.rotation, angle, delta * 15)
	

func _move_via_mouse(delta):
	x = get_local_mouse_position().x
	var angle
	
	if x >= center.x - R and x <= center.x + R:
		var y = center.y - sqrt(abs(pow(R, 2) - pow(center.x - x, 2)))
		var point_on_circle = Vector2(x, y)
		angle = _calculate_hand_angle_to(point_on_circle)
		
	elif x < center.x - R:
		angle = -PI / 2
	
	elif x > center.x + R:
		angle = PI / 2
	
	hand.rotation = lerp(hand.rotation, angle, delta * 15)
		
	# Shift from -90 - 90 degrees to positive 0 - 180 degrees
	# Then calculate fraction of current angle over full rotation range i.e. curr_angle / 180
	# Finally round and scale up by a factor of 10 to make it 1-10 instead of 
	var factor = round( ( ( hand.rotation + (PI / 2) ) / PI ) * 10 )
	changed.emit(factor)
	

func _calculate_hand_angle_to(point):
	var dir_to_point = center.direction_to(point)
	return Vector2.UP.angle_to(dir_to_point)
