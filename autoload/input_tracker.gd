extends Node

enum InputDevice { UNKNOWN, KEYBOARD_MOUSE, GAMEPAD }

var last_input_device : InputDevice = InputDevice.UNKNOWN


func _ready() -> void:
	print("Connected Joypads: ", Input.get_connected_joypads())


func _input(event):
	if event is InputEventKey or event is InputEventMouse:
		last_input_device = InputDevice.KEYBOARD_MOUSE
	elif event is InputEventJoypadButton or event is InputEventJoypadMotion:
		last_input_device = InputDevice.GAMEPAD
