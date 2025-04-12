extends MovementState

class_name Approach

var target: Node2D


func _init(_target) -> void:
	self.target = _target


func process(character, delta):
	character.go_to(target.global_position, delta)
