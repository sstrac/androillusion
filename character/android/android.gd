extends Character


@onready var sword = get_node("Sword")
@export var anim: AnimationPlayer


func _ready() -> void:
	if health_comp:
		health_comp.health_changed.connect(_on_health_changed)


func _on_health_changed(change):
	anim.play('flash')


func charge(target):
	movement_comp.approach(target)


func face_left():
	sword.face_left()


func face_right():
	sword.face_right()


func on_target_reached():
	sword.attack()
