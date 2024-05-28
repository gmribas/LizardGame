class_name CollectableState
extends State

@export var sprite: CollectableSprite
@export var animation_name: String
@export var point_value = 1

var collectable: Collectable

func _ready() -> void:
	await self.ready
	collectable = owner as Collectable	
	assert(collectable != null)
	assert(sprite != null)
	assert(animation_name != null)
