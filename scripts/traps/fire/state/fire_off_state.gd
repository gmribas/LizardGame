class_name FireOffState

extends FireState

const ANIMATION = "off"

@onready var game_manager: GameManager = get_node("/root/Root/GameManager")

func enter(_msg := {}) -> void:
	sprite.animation = ANIMATION
