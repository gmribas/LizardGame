extends Node

class_name Level

enum LevelStates { 
	LEVEL_STATE_STARTED,
	LEVEL_STATE_FINISHED,
	LEVEL_STATE_GAME_OVER
}

var state: int = LevelStates.LEVEL_STATE_STARTED

func finish():
	state = LevelStates.LEVEL_STATE_FINISHED
	
func game_over():
	state = LevelStates.LEVEL_STATE_GAME_OVER
