class_name GameManager extends Node

@onready var label_points = %LabelPoints
@onready var label_lives = %LabelLives
@onready var finish_level_label = $"../SceneObjects/FinishLevel".get_node("Finish")

var points = 0
var current_level = Level.new()
var life = PlayerAttributes.DEFAULT_LIFE

func add_points_body_entered(body, item: CollectableState):
	if body is BaseCharacter:
		add_points(item.point_value)

func decrement_life_body_entered(body, item: TrapState):
	if body is BaseCharacter:
		decrement_life(item.damage)

func add_points(amount):
	points += amount
	label_points.show_points(points)

func finish_level():
	current_level.finish()
	finish_level_label.visible = true

func is_level_finished():
	return current_level.state == Level.LevelStates.LEVEL_STATE_FINISHED

func decrement_life(state: TrapState):
	life -= state.damage
	label_lives.show_lives(life)
	
	if life <= 0:
		current_level.game_over()
		