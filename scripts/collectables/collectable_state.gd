# Boilerplate class to get full autocompletion and type checks for the `collectable` when coding the collectable's states.
# Without this, we have to run the game to see typos and other errors the compiler could otherwise catch while scripting.
class_name CollectableState
extends State

enum CollectableStateEnum {
	DEFAULT,
	COLLECTED
}

const DEFAULT_ANIMATION = "default"
const COLLECTED_ANIMATION = "collected"

const animations = [DEFAULT_ANIMATION, COLLECTED_ANIMATION]

# Typed reference to the collectable node.
var collectable: Collectable

func _ready() -> void:
	# The states are children of the `Collectable` node so their `_ready()` callback will execute first.
	# That's why we wait for the `owner` to be ready first.
	await self.ready
	# The `as` keyword casts the `owner` variable to the `Collectable` type.
	# If the `owner` is not a `Collectable`, we'll get `null`.
	collectable = owner as Collectable
	# This check will tell us if we inadvertently assign a derived state script
	# in a scene other than `Collectable.tscn`, which would be unintended. This can
	# help prevent some bugs that are difficult to understand.
	assert(collectable != null)
