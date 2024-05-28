class_name FireOnState

extends FireState

const ANIMATION = "on"

@onready var game_manager: GameManager = get_node("/root/Root/GameManager")

var fire_off_state: FireState

func enter(_msg := {}) -> void:
	sprite.animation = ANIMATION

func _on_body_entered(_body):
	game_manager.decrement_life_body_entered(_body, self)
	state_machine.transition_to(fire_off_state.state_name)
