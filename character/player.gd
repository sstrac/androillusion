extends Character

const SWORD = preload("res://sword/sword.tscn")


func _unhandled_input(event):
	if event.is_action_pressed("left_click"):
		var sword = SWORD.instantiate()
		add_child(sword)
