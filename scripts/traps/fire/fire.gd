extends Area2D

class_name FireTrap

@onready var game_manager: GameManager = get_node("/root/Root/GameManager")
@onready var sprite_2d = $Sprite2D

@export var state_machine: StateMachine

func _on_body_entered(_body):		
	state_machine._on_body_entered(_body)
