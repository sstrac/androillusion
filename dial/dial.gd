extends Control

@onready var hand = get_node("Hand")

const R = 300 # radius

var value: float:
	set(v):
		value = clamp(v, 0.0, 1.0)

func _physics_process(delta: float) -> void:

	if Input.is_action_pressed(InputActions.RIGHT_CLICK):
		var x = get_global_mouse_position().x
		var center = hand.global_position
		
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
		# Then calculate fraction of current angle over full rotation range
		value = ( hand.rotation + (PI / 2) ) / PI
