class_name CollectedCollectableState

extends CollectableState

@export var after_collected_state: State

func enter(_msg := {}) -> void:
	sprite.animation = animation_name
	sprite.connect("animation_has_looped", _on_sprite_animation_looped)
	
func _on_sprite_animation_looped():
	if sprite.animation == animation_name:
		if after_collected_state == null:
			collectable.queue_free()
		else:
			state_machine.transition_to(after_collected_state.state_name)
