extends Character

@export var anim: AnimationPlayer

@onready var sword = get_node("Sword")
@onready var jump_combo = get_node("JumpCombo")


func _ready() -> void:
	jump_combo.slash_complete.connect(_on_slash_complete)
	
	if health_comp:
		health_comp.health_changed.connect(_on_health_changed)


func _on_slash_complete():
	sword.attacking = false
	sword.deactivate()
		

func _on_health_changed(change):
	anim.play('flash')


func face_left():
	sword.face_left()


func face_right():
	sword.face_right()
