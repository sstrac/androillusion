extends CharacterBody2D

class_name Character

const SWORD_SCENE = preload("res://sword/sword.tscn")
const SLASH1_SCENE = preload("res://sword/slash/slash_down.tscn")
const SLASH2_SCENE = preload("res://sword/slash/slash_up.tscn")
const COMBO_ORDERED = [SLASH1_SCENE, SLASH2_SCENE]

@onready var label = get_node('Label')
@onready var anim = get_node("AnimationPlayer")
@onready var health_comp = get_node("HealthComponent")
@onready var damage_feedback_comp = get_node("DamageFeedbackComponent")

@export var movement_comp: Node

var curr_slash_i = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = '%d' % health_comp.health
	health_comp.health_changed.connect(_on_health_changed)


func _on_health_changed(change):
	label.text = '%d' % health_comp.health
	anim.play('flash')


func _physics_process(delta: float) -> void:
	movement_comp.physics_process(delta)
	

func _process(delta: float) -> void:
	movement_comp.process(delta)
	
	
### Used only by state ###
func follow(pos, delta, speed=100):
	global_position = global_position.move_toward(pos, delta * speed) 
	move_and_slide()
	

func spawn_sword():
	var sword = SWORD_SCENE.instantiate()
	
	var slash_scene = COMBO_ORDERED[curr_slash_i + 1]
	
	var sword_movement = slash_scene.instantiate()
	sword_movement.sword = sword
	sword.add_child(sword_movement)
	add_child(sword)
	
	if curr_slash_i + 1 == COMBO_ORDERED.size() - 1:
		curr_slash_i = -1
	else:
		curr_slash_i += 1
