class_name CollectableSprite

extends AnimatedSprite2D

signal animation_has_looped()

func _on_animation_looped():
	animation_has_looped.emit()
