class_name CharacterState

extends State

var character: BaseCharacter

func _ready() -> void:
	await self.ready
	character = owner as BaseCharacter
	assert(character != null)
