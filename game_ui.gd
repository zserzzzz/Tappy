extends Control


var main = load("res://Scenes/Main/main.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("ui_cancel"):
		get_tree().change_scene_to_packed(main)
