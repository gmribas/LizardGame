class_name MovementCharacterState

extends CharacterState

const ANIMATION_IDLE = "idle"
const ANIMATION_RUNNING = "running"

@onready var sprite_2d = $"../../Sprite2D"
@onready var game_manager = $"../../../../GameManager"
	
func physics_update(delta):
	var is_on_floor = character.is_on_floor()
	var velocity_x = character.velocity.x
	
	#End game early return
	if (game_manager.is_level_finished() && is_on_floor):
		sprite_2d.animation = ANIMATION_IDLE
		return
		
	if is_on_floor:
		if (velocity_x > 1 || velocity_x < -1):
			sprite_2d.animation = ANIMATION_RUNNING
		else:
			sprite_2d.animation = ANIMATION_IDLE
	else:
		state_machine.transition_to("JumpingCharacterState")
