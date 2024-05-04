class_name Collectable

extends Area2D

@onready var state_machine = $StateMachine
@onready var kiwi_2d = %Kiwi2D

func _on_body_entered(body):
	state_machine._on_body_entered(body)
