class_name GameManager extends Node

@onready var label_points = %LabelPoints

const POINTS_LABEL = "%d Points"
var points = 0

func add_points():
	points += 1
	label_points.text = POINTS_LABEL % points
