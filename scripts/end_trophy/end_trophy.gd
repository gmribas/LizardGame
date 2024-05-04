class_name Trophy

extends Area2D

@onready var state_machine = $StateMachine

func _on_body_entered(body):
	state_machine._on_body_entered(body)
