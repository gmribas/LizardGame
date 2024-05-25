class_name InputHandler

extends Node

@onready var sprite_2d = $"../Sprite2D"
@onready var game_manager: GameManager = get_node("/root/Root/GameManager")
@onready var state_machine: StateMachine = $"../StateMachine"

var character: BaseCharacter

var jump_state: State

var movement_state: State

func withCharacter(base_character: BaseCharacter) -> InputHandler:
	self.character = base_character
	return self
	
func _process(_delta):
	if not game_manager.is_level_finished():
		if Input.is_action_just_pressed("jump"):
			state_machine.transition_to(jump_state.state_name)
		elif Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"): 
			state_machine.transition_to(movement_state.state_name)	

		state_machine._physics_process(_delta)
