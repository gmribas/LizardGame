extends Area2D

class_name FireTrap

@onready var game_manager: GameManager = get_node("/root/Root/GameManager")
@onready var sprite_2d = $Sprite2D

@export var character: BaseCharacter

func _on_body_entered(_body):
	if (_body is BaseCharacter && sprite_2d.animation != "off"):		
		game_manager.decrement_life()
		sprite_2d.animation = "off"
