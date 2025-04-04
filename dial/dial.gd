extends Control


@onready var hand = get_node("Hand")

const R = 300 # radius
var center
var x
var hand_moving = false

signal changed(factor)

func _ready() -> void:
	center = hand.global_position


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(InputActions.RIGHT_CLICK):
		hand_moving = true
	elif event.is_action_released(InputActions.RIGHT_CLICK):
		hand_moving = false


func _physics_process(delta: float) -> void:
	if hand_moving:
		x = get_local_mouse_position().x
		
		if x >= center.x - R and x <= center.x + R:
			var y = center.y - sqrt(abs(pow(R, 2) - pow(center.x - x, 2)))
				
			var point_on_circle = Vector2(x, y)
			
			var vector_to_circle_point = center.direction_to(point_on_circle)
			var angle = Vector2.UP.angle_to(vector_to_circle_point)
			hand.rotation = lerp(hand.rotation, angle, delta * 15)
		
		elif x < center.x - R:
			hand.rotation = lerp(hand.rotation, -PI / 2, delta * 15)
		
		elif x > center.x + R:
			hand.rotation = lerp(hand.rotation, PI / 2, delta * 15)
			
		# Shift from -90 - 90 degrees to positive 0 - 180 degrees
		# Then calculate fraction of current angle over full rotation range i.e. curr_angle / 180
		# Finally round and scale up by a factor of 10 to make it 1-10 instead of 
		var factor = round( ( ( hand.rotation + (PI / 2) ) / PI ) * 10 )
		changed.emit(factor)
		
