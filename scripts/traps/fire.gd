extends Area2D

class_name FireTrap

@onready var game_manager: GameManager = $"../../../GameManager"

@export var character: BaseCharacter

func _on_body_entered(_body):
	if (_body.name == character.character_name):		
		game_manager.decrement_life()
