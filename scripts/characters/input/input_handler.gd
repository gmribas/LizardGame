class_name InputHandler

extends Node

@onready var player_attributes = $"../../../PlayerAttributes"
@onready var sprite_2d = $"../Sprite2D"

var character: BaseCharacter

func withCharacter(base_character: BaseCharacter) -> InputHandler:
	self.character = base_character
	return self
	
func _process(_delta):
	# Handle jump.
	if Input.is_action_just_pressed("jump") and character.is_on_floor():
		character.velocity.y = player_attributes.JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		character.velocity.x = direction * player_attributes.SPEED
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, player_attributes.DECELERATION)

	character.move_and_slide()

	var isLeft = character.velocity.x < 0
	sprite_2d.flip_h = isLeft
