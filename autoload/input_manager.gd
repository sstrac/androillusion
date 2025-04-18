extends Node
 

func _process(delta):
	if InputTracker.last_input_device == InputTracker.InputDevice.GAMEPAD:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func interact_pressed(event: InputEvent):
	return event.is_action_pressed("interact")
	

func dial_moved(event: InputEvent):
	return event.is_action_pressed("move_dial")


func dial_stopped(event: InputEvent):
	return event.is_action_released("move_dial")
