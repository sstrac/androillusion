extends Node

const SWORD = preload("res://sword/sword.tscn")




func _on_button_2_pressed() -> void:
	var sword = SWORD.instantiate()
	add_child(sword)
	sword.position = get_node("Marker2D").global_position
