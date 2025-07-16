extends Control


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump", true) == true:
		get_tree().change_scene_to_file("res://Scenes/Game/game.tscn")
