extends Area2D

class_name SawTrap

const SAW_RANGE_OF_MOTION = 700

@onready var game_manager: GameManager = get_node("/root/Root/GameManager")

@export var move_speed : float = 120.0
@export var character: BaseCharacter
@export var state_machine: StateMachine

var already_moved = false

func _physics_process(delta):
	check_if_player_in_range(delta)

func check_if_player_in_range(delta):
	await get_tree().create_timer(0.3).timeout

	var player_position = character.global_position
	var saw_position = global_position
	var direction = player_position - saw_position
	direction = direction.normalized()

	if player_position.distance_to(saw_position) <= SAW_RANGE_OF_MOTION:
		already_moved = true
		var motion = direction * move_speed * delta
		# move towards the character and passes it if missed
		var calculate_motion: Vector2 = motion if (motion.x < 0) else motion * -1
		translate(calculate_motion)

func _on_body_entered(_body):
	state_machine._on_body_entered(_body)
