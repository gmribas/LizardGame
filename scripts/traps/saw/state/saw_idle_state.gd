class_name SawIdleState

extends SawState

@onready var game_manager: GameManager = get_node("/root/Root/GameManager")

@export var pusuing_state: SawState

func enter(_msg := {}) -> void:
	sprite.animation = animation_name

func physics_update_action(_player_position, _saw_position):
	if _player_position.distance_to(_saw_position) <= SAW_RANGE_OF_MOTION:
		state_machine.transition_to(pusuing_state.state_name)
