extends Area2D

@onready var game_manager = %GameManager
@onready var kiwi_2d = get_node("Kiwi2D")

const STATE_DEFAULT = 0
const STATE_COLLECTED = 1
const DEFAULT_ANIMATION = "default"
const COLLECTED_ANIMATION = "collected"

const animations = [DEFAULT_ANIMATION, COLLECTED_ANIMATION]
var currentState = STATE_DEFAULT

func _on_body_entered(body):
	if (body.name == "VirtualGuy" && kiwi_2d.animation == DEFAULT_ANIMATION):
		currentState = STATE_COLLECTED
		game_manager.add_points()
		kiwi_2d.animation = animations[currentState]

func _on_kiwi_2d_animation_looped():
	if currentState == STATE_COLLECTED:
		queue_free()
