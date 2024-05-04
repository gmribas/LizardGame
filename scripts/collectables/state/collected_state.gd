class_name CollectedCollectableState

extends CollectableState

const ANIMATION = "collected"

@onready var kiwi_2d = %Kiwi2D

func enter(_msg := {}) -> void:
	kiwi_2d.animation = ANIMATION
	
func _on_kiwi_2d_animation_looped():
	if kiwi_2d.animation == ANIMATION:
		collectable.queue_free()
