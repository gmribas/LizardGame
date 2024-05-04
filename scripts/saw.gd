extends Area2D

class_name Saw

@export var move_speed : float = 30.0
@export var move_dir : Vector2
var start_positon : Vector2
var target_position : Vector2

#func _ready():
	#start_pos = global_position
	#target_pos = start_pos + move_dir


#func _process(delta):
	#global_position = global_position.move_toward(target_pos, move_speed * delta)
