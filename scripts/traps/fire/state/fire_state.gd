class_name FireState
extends TrapState

var fire_trap: FireTrap

func _ready() -> void:
	await self.ready
	fire_trap = owner as FireTrap	
	assert(fire_trap != null)
