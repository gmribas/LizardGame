class_name DefaultCollectableState

extends CollectableState

const ANIMATION = "default"

@onready var game_manager = $"../../../../../GameManager"
@onready var kiwi_2d = %Kiwi2D

func enter(_msg := {}) -> void:
	kiwi_2d.animation = ANIMATION

func body_entered(_body):
	if (_body.name == "VirtualGuy"):		
		state_machine.transition_to("CollectedCollectableState")
		game_manager.add_points()
		
