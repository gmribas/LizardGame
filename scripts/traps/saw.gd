extends CharacterBody2D

class_name SawTrap

const POSITION_THREASHOLD = 200

@export var move_speed : float = 30.0
@export var character: BaseCharacter

func _ready():
	character = get_parent().get_node(character.character_name)

func _physics_process(delta):
	var player_position = character.global_position
	var enemy_position = global_position
	var direction = player_position - enemy_position
	direction = direction.normalized()

	if (player_position.distance_to(enemy_position) <= POSITION_THREASHOLD):
		var motion = direction * move_speed * delta
		move_and_collide(motion)
