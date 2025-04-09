extends Node

@onready var player = get_node("Player")
@onready var android = get_node("Android")


func _on_button_pressed() -> void:
	android.attack(player)


func _on_button_2_pressed() -> void:
	pass
