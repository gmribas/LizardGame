extends Node

class_name Level

const LEVEL_STATE_STARTED = 0
const LEVEL_STATE_FINISHED = 1

var state = LEVEL_STATE_STARTED

func finish():
	state = LEVEL_STATE_FINISHED
