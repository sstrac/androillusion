extends Character

@export var anim: AnimationPlayer
@onready var sword = get_node("Sword")


func _ready() -> void:
	if health_comp:
		health_comp.health_changed.connect(_on_health_changed)


func _on_health_changed(change):
	anim.play('flash')


func face_left():
	sword.face_left()


func face_right():
	sword.face_right()
