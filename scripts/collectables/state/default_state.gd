class_name DefaultCollectableState

extends CollectableState

@onready var game_manager: GameManager = $"../../../../../GameManager"
@export var collected_state: State

func enter(_msg := {}) -> void:
	sprite.animation = animation_name

func body_entered(_body):
	if (_body is BaseCharacter):	
		state_machine.transition_to(collected_state.state_name)
		game_manager.add_points()
		
