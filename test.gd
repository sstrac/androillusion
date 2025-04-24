extends Node

@onready var player = get_node("Player")
@onready var android = get_node("Android")
@onready var heffalump = get_node("Heffalump")


func _on_button_pressed() -> void:
	android.charge(heffalump)
	#heffalump.charge(player)


func _on_button_2_pressed() -> void:
	pass
