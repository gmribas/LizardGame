class_name SawPursuingState

extends SawState

@onready var game_manager: GameManager = get_node("/root/Root/GameManager")

@export var move_speed : float = 120.0

@export var idle_state: SawState

func physics_update_action(_player_position, _saw_position):
    if _player_position.distance_to(_saw_position) > SAW_RANGE_OF_MOTION:
        state_machine.transition_to(idle_state.state_name)

func _on_body_entered(_body):
    game_manager.decrement_life_body_entered(_body, self)