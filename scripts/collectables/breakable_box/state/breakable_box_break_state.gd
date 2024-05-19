class_name BrealableBoxBreakState

extends CollectableState

@export var hidden_prize: CollectableState

func enter(_msg := {}) -> void:
	sprite.animation = animation_name
	
func _on_sprite_animation_looped():
	if sprite.animation == animation_name:
		if hidden_prize == null:
			collectable.queue_free()
		else:
			state_machine.transition_to(hidden_prize.state_name)
