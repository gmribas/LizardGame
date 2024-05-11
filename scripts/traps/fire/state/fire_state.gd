class_name FireState
extends State

enum FireStateEnum {
	ON,
	OFF
}

var fire_trap: FireTrap

func _ready() -> void:
	await self.ready
	fire_trap = owner as FireTrap	
	assert(fire_trap != null)
