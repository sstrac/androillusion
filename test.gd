extends Node

const SWORD = preload("res://sword.tscn")




func _on_button_2_pressed() -> void:
	var sword = SWORD.instantiate()
	add_child(sword)
	sword.position = Vector2(315, 120)
