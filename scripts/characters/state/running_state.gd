class_name RunningCharacterState

extends CharacterState

const ANIMATION = "running"

@onready var sprite_2d = $"../../Sprite2D"

func physics_update(delta):
	var is_on_floor = character.is_on_floor()
	var velocity_x = character.velocity.x
	
	if character.is_on_floor():
		if (character.velocity.x > 1 || character.velocity.x < -1):
			sprite_2d.animation = ANIMATION
	else:
		state_machine.transition_to("JumpingCharacterState")
