class_name VirtualGuy

extends BaseCharacter

@onready var game_manager = $"../../GameManager"
@onready var player_attributes = $"../../PlayerAttributes"
@onready var sprite_2d = $Sprite2D
@onready var input_handler: InputHandler = $InputHandler

@export var jump_state: State
@export var movement_state: State

func _ready():
	character_name = "VirtualGuy"
	input_handler.withCharacter(self)
	input_handler.jump_state = jump_state
	input_handler.movement_state = movement_state
	
func _physics_process(delta):
	input_handler._process(delta)
