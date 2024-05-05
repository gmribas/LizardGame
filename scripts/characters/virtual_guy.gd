extends BaseCharacter

@onready var game_manager = $"../../GameManager"
@onready var player_attributes = $"../../PlayerAttributes"
@onready var sprite_2d = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var state_machine = $StateMachine
@onready var input_handler: InputHandler = $InputHandler

func _ready():
	character_name = "VirtualGuy"
	input_handler.withCharacter(self)
	
func _physics_process(delta):
	input_handler._process(delta)
	state_machine._physics_process(delta)
