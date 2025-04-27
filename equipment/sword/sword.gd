extends Equipment

@export var character: CharacterBody2D
@export var combo: Node
@export var damage_dealer_comp: Node
@export var avoid_hitbox: Area2D

@onready var collision_shape: CollisionShape2D = get_node("CollisionShape2D")


var attacking: bool = false
var facing


func _ready() -> void:
	facing = Slash.RIGHT
	


func attack():
	if not attacking:
		attacking = true
		reactivate()
		combo.progress(facing)


# We want to progress a frame so physics detects the swords collision
# object disablement, to ensure the hitbox detects the collision object
# exiting the area. Once attack is called after the frame, the collision
# object is re-enabled and area_entered is triggered again for the next attack
# _slash_complete -> disable collision -> physics frame -> reenable collision -> area_entered signal sent
func plan_attack():
	get_tree().process_frame.connect(attack, CONNECT_ONE_SHOT)

	
	
func deactivate():
	hide()
	collision_shape.set_deferred('disabled', true)
	
	
func reactivate():
	show()
	collision_shape.set_deferred('disabled', false)

	
func face_left():
	position.x = -abs(position.x)
	facing = Slash.LEFT


func face_right():
	position.x = abs(position.x)
	facing = Slash.RIGHT
