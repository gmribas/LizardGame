class_name IdleTrophyState

extends TrophyState

@onready var trophySprite = %Trophy

const ANIMATION = "idle"

func enter(_msg := {}) -> void:
	trophySprite.animation = ANIMATION
	
func body_entered(body):
	if (body.name == "VirtualGuy"):
		state_machine.transition_to("FinishedTrophyState")
