class_name FinishedTrophyState

extends TrophyState

@onready var trophySprite = %Trophy
@onready var game_manager: GameManager = $"../../../../GameManager"

const ANIMATION = "finished"

func enter(_msg := {}) -> void:
	trophySprite.animation = ANIMATION
	game_manager.finish_level()
