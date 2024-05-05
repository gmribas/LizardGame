class_name JumpingCharacterState

extends CharacterState

const ANIMATION = "jumping"

@onready var sprite_2d = $"../../Sprite2D"
@onready var player_attributes = $"../../../../PlayerAttributes"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	
func physics_update(delta):	
	# Add the gravity.
	if not character.is_on_floor():
		character.velocity.y += gravity * delta
		sprite_2d.animation = ANIMATION
	else:
		state_machine.transition_to("MovementCharacterState")
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and character.is_on_floor():
		character.velocity.y = player_attributes.JUMP_VELOCITY
