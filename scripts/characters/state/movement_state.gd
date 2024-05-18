class_name MovementCharacterState

extends CharacterState

const ANIMATION_IDLE = "idle"
const ANIMATION_RUNNING = "running"

@onready var sprite_2d: AnimatedSprite2D = $"../../Sprite2D"
@onready var game_manager: GameManager = $"../../../../GameManager"
	
func physics_update(_delta):
	#End game early return
	if (game_manager.is_level_finished() && character.is_on_floor()):
		sprite_2d.animation = ANIMATION_IDLE
		return
	
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


func handle_animation(_delta):
	var velocity_x = character.velocity.x
	var isLeft = velocity_x < 0
	sprite_2d.flip_h = isLeft

	if (velocity_x == 0):
		sprite_2d.animation = ANIMATION_IDLE
	else:
		sprite_2d.animation = ANIMATION_RUNNING