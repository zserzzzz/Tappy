extends Control


@onready var highscore_number: Label = $MarginContainer/HighscoreNumber


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump", true) == true:
		GameManager.load_game_scene()

func _ready():
	get_tree().paused = false
	highscore_number.text = "%04d" % ScoreManager.high_score


func _enter_tree() -> void:
#	highscore_number.text = "%04d" % ScoreManager.high_score
	pass
