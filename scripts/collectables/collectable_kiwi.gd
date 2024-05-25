class_name Collectable

extends Area2D

signal animation_looped()

@export var game_manager: GameManager
@export var state_machine: StateMachine

func _on_body_entered(body):
	state_machine._on_body_entered(body)
