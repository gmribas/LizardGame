class_name FireOnState

extends FireState

const ANIMATION = "on"

@onready var game_manager = $"../../../../../GameManager"
@onready var sprite_2d = $Sprite2D

#var character: BaseCharacter

func enter(_msg := {}) -> void:
	sprite_2d.animation = ANIMATION

func _on_body_entered(_body):
	if (_body.name == character.character_name):		
		game_manager.decrement_life()
