extends Control


const R = 300 # radius

@onready var hand = get_node("HBoxContainer/Dial/Hand")
@onready var test_rect = get_node("ColorRect")


func _physics_process(delta: float) -> void:

	if Input.is_action_pressed("left_click"):
		var x = get_global_mouse_position().x
		var center = hand.global_position
		
		if x >= center.x - R and x <= center.x + R:
			var y = center.y - sqrt(abs(pow(R, 2) - pow(center.x - x, 2)))
				
			var point_on_circle = Vector2(x, y)
			test_rect.global_position = point_on_circle
			
			var vector_to_circle_point = center.direction_to(point_on_circle)
			var angle = Vector2.UP.angle_to(vector_to_circle_point)
			hand.rotation = lerp(hand.rotation, angle, delta * 15)
		
		elif x < center.x - R:
			hand.rotation = lerp(hand.rotation, -PI / 2, delta * 15)
		
		elif x > center.x + R:
			hand.rotation = lerp(hand.rotation, PI / 2, delta * 15)
