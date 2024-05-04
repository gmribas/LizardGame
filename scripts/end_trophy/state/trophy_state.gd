class_name TrophyState

extends State

var trophy: Trophy

func _ready() -> void:
	await self.ready
	trophy = owner as Trophy
	assert(trophy != null)
