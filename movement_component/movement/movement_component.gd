extends Node

class_name MovementComponent

@export var disabled: bool
@export var character: CharacterBody2D

var state: MovementState


func process(delta):
	if not disabled:
		state.process(character, delta)
	

func physics_process(delta):
	if not disabled:
		state.physics_process(character, delta)


func approach(target: Node2D):
	pass


func jump():
	pass
