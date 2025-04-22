@tool
extends Node2D

var DETECTION_COMPONENT_SHAPE: CircleShape2D = load("res://resources/collision_shapes/detection_component.tres")

@export var exclude: CollisionObject2D
@export var radius: float
@export var length: float

var collision_points: Array


func _ready() -> void:
	if exclude != null:
		for child: ShapeCast2D in get_children():
			child.add_exception(exclude)
	

func _process(delta: float) -> void:
	DETECTION_COMPONENT_SHAPE.radius = radius
	
	for child: ShapeCast2D in get_children():
		if child.target_position.x != 0:
			child.target_position.x = length * sign(child.target_position.x)
		
		elif child.target_position.y != 0:
			child.target_position.y = length * sign(child.target_position.y)


func _physics_process(delta: float) -> void:
	if not Engine.is_editor_hint():
		for child: ShapeCast2D in get_children():
			if not child.collision_result.is_empty():
				collision_points = child.collision_result.map(func(c): return c.point)
