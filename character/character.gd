extends CharacterBody2D

class_name Character

const SWORD_SCENE = preload("res://sword/sword.tscn")
const JUMP_COMBO_SCENE = preload("res://player/jump_combo.tscn")

@onready var label = get_node('Label')
@onready var anim = get_node("AnimationPlayer")
@onready var health_comp = get_node("HealthComponent")
@onready var hitbox_comp: Area2D = get_node("HitboxComponent")
@onready var damage_feedback_comp = get_node("DamageFeedbackComponent")

@export var movement_comp: Node

var jump_combo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = '%d' % health_comp.health
	health_comp.health_changed.connect(_on_health_changed)
	jump_combo = JUMP_COMBO_SCENE.instantiate()
	jump_combo.movement_comp = movement_comp


func _on_health_changed(change):
	label.text = '%d' % health_comp.health
	anim.play('flash')


func _physics_process(delta: float) -> void:
	movement_comp.physics_process(delta)
	

func _process(delta: float) -> void:
	movement_comp.process(delta)
	
	
### Used only by state ###
func go_to(pos, delta, speed=100):
	global_position = global_position.move_toward(pos, delta * speed) 
	move_and_slide()


func spawn_sword():
	var sword: Node2D = SWORD_SCENE.instantiate()
	sword.avoid_hitbox = hitbox_comp
	jump_combo.sword = sword
	jump_combo.progress()
	add_child(sword)
	
