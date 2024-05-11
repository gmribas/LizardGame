class_name JumpingCharacterState

extends CharacterState

const ANIMATION = "jumping"

@export var jump_height: float
@export var jump_time_to_peak: float
@export var jump_time_to_descent: float

@onready var jump_velocity: float = (2.0 * jump_height) / jump_time_to_peak
@onready var jump_gravity: float = (2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)
@onready var fall_gravity: float= (2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)

@onready var sprite_2d = $"../../Sprite2D"
@onready var player_attributes = $"../../../../PlayerAttributes"
@onready var game_manager = $"../../../../GameManager"
	
func get_gravity() -> float: 
	return jump_gravity if character.velocity.y < 0.0 else fall_gravity

func jump(delta):
	character.velocity.y = jump_velocity
	
func physics_update(delta):	
	#End game early return
	if (game_manager.is_level_finished()):
		return
		
	# Add the gravity.
	if not character.is_on_floor():
		character.velocity.y += get_gravity() * delta
		sprite_2d.animation = ANIMATION
	else:
		state_machine.transition_to("MovementCharacterState")
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and character.is_on_floor():
		jump(delta)
