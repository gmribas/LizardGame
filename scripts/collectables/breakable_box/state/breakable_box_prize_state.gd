class_name BrealableBoxPrizeState

extends CollectableState

func enter(_msg := {}) -> void:
	sprite.animation = animation_name
	

func _on_body_entered(body):
	state_machine._on_body_entered(body)
