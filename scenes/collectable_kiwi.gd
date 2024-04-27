extends Area2D

@onready var game_manager = %GameManager
@onready var kiwi_2d = get_node("Kiwi2D")
@onready var collected_2d = get_node("Collected2D")

func _on_body_entered(body):
	if (body.name == "VirtualGuy"):
		game_manager.add_points()
		#kiwi_2d.queue_free()
		kiwi_2d.visible = false
		collected_2d.visible = true
		#queue_free()
