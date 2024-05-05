class_name InputHandler

extends Node

@onready var player_attributes = $"../../../PlayerAttributes"

var character: BaseCharacter

func withCharacter(base_character: BaseCharacter) -> InputHandler:
	self.character = base_character
	return self
	
func _process(_delta):
	# Handle jump.
	if Input.is_action_just_pressed("jump") and character.is_on_floor():
		character.velocity.y = player_attributes.JUMP_VELOCITY
