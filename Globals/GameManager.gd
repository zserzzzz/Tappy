extends Node


var game := preload("res://Scenes/Game/game.tscn")
var main := preload("res://Scenes/Main/main.tscn")


func load_game_scene():
	get_tree().change_scene_to_packed(game)



func load_main_scene():
	get_tree().change_scene_to_packed(main)
