class_name TrapState

extends State

@export var damage = 1
@export var sprite: AnimatedSprite2D

var animation_name: StringName
var trap: Area2D
var character: BaseCharacter

func _ready():
	await self.ready
	trap = owner as Area2D
	assert(trap != null)
	assert(sprite != null)
	assert(animation_name != null)
	
	var children = get_node("/root/Root/SceneObjects").get_children()
	for child in children:
		if child is BaseCharacter:
			character = child
			break
	assert(character != null)
