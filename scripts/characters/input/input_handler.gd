class_name InputHandler

extends Node

@onready var sprite_2d = $"../Sprite2D"
@onready var game_manager = $"../../../GameManager"

var character: BaseCharacter

func withCharacter(base_character: BaseCharacter) -> InputHandler:
	self.character = base_character
	return self
	
func _process(_delta):
	#End game early return
	if (game_manager.is_level_finished()):
		return
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and character.is_on_floor():
		character.velocity.y = PlayerAttributes.JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		character.velocity.x = direction * PlayerAttributes.SPEED
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, PlayerAttributes.DECELERATION)

	character.move_and_slide()

	var isLeft = character.velocity.x < 0
	sprite_2d.flip_h = isLeft
