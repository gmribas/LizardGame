class_name CollectableState
extends State

enum CollectableStateEnum {
	DEFAULT,
	FINISHED
}

var collectable: Collectable

func _ready() -> void:
	await self.ready
	collectable = owner as Collectable	
	assert(collectable != null)
