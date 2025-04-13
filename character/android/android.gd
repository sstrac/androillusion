extends Character


@onready var sword = get_node("Sword")


func charge(target):
	movement_comp.approach(target)


func on_target_reached():
	sword.attack()
