class_name SawState

extends TrapState

const SAW_RANGE_OF_MOTION = 700

func enter(_msg := {}) -> void:
	sprite.animation = animation_name

func physics_update(_delta):
	await get_tree().create_timer(0.3).timeout
	var player_position = character.global_position
	var saw_position = trap.global_position
	var direction = player_position - saw_position
	direction = direction.normalized()

	physics_update_action(player_position, saw_position)


func physics_update_action(_player_position, _saw_position):
	pass