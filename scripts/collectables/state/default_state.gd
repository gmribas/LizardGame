class_name DefaultCollectableState

extends CollectableState

@onready var game_manager: GameManager = get_node("/root/Root/GameManager")
@export var collected_state: State

func enter(_msg := {}) -> void:
	sprite.animation = animation_name

func body_entered(_body):
	game_manager.add_points_body_entered(_body, self)
	state_machine.transition_to(collected_state.state_name)
