extends Area2D

@onready var trophy = %Trophy

const STATE_DEFAULT = 0
const STATE_FINISHED = 1
const DEFAULT_ANIMATION = "idle"
const FINISHED_ANIMATION = "finished"

const animations = [DEFAULT_ANIMATION, FINISHED_ANIMATION]
var currentState = STATE_DEFAULT

func _on_body_entered(body):
	if (body.name == "VirtualGuy" && currentState == STATE_DEFAULT):
		currentState = STATE_FINISHED
		trophy.animation = animations[currentState]
