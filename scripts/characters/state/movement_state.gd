class_name MovementCharacterState

extends CharacterState

const ANIMATION_IDLE = "idle"
const ANIMATION_RUNNING = "running"

@export var jump_state: State

@onready var sprite_2d: AnimatedSprite2D = $"../../Sprite2D"
	
func physics_update(_delta):
	handle_movent(_delta)
	handle_animation(_delta)
	
func handle_movent( _delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		character.velocity.x = direction * PlayerAttributes.SPEED
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, PlayerAttributes.DECELERATION)

	character.move_and_slide()

	# Character hit something from above and the gravity dynamic is in the jumping_state.gd
	if not character.is_on_floor():
		state_machine.transition_to(jump_state.state_name)


func handle_animation(_delta):
	var velocity_x = character.velocity.x
	var isLeft = velocity_x < 0
	sprite_2d.flip_h = isLeft

	if (velocity_x == 0):
		sprite_2d.animation = ANIMATION_IDLE
	else:
		sprite_2d.animation = ANIMATION_RUNNING