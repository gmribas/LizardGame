extends CharacterBody2D

class_name SawTrap

const SAW_RANGE_OF_MOTION = 700

@onready var game_manager = $"../../../GameManager"

@export var move_speed : float = 80.0
@export var character: BaseCharacter

var already_moved = false

func _physics_process(delta):
	var player_position = character.global_position
	var saw_position = global_position
	var direction = player_position - saw_position
	direction = direction.normalized()

	if player_position.distance_to(saw_position) <= SAW_RANGE_OF_MOTION:
		already_moved = true
		var motion = direction * move_speed * delta
		# move towards the character and passes it if missed
		var calculate_motion = motion if (motion.x < 0) else motion * -1
		move_and_collide(calculate_motion)
	else:
		if already_moved:
			queue_free()


func _on_area_2d_body_entered(_body):
	if (_body.name == character.character_name):		
		game_manager.decrement_life()
