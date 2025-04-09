extends MovementState

class_name Approach

var target: Node2D


func _init(target) -> void:
	self.target = target


func process(character, delta):
	character.follow(target.global_position, delta)
