extends Control

var lock = true
var score = 0

@onready var _score: Label = $MarginContainer/score
@onready var gameover: Label = $MarginContainer/Gameover
@onready var gameover_2: Label = $MarginContainer/Gameover2
@onready var timer: Timer = $Timer
@onready var game_over: AudioStreamPlayer = $GameOver

func _enter_tree() -> void:
	lock = true
	Signalbus.on_plane_died.connect(on_plane_died)
	Signalbus.on_point_score.connect(on_point_score)

func _ready() -> void:
	score=0

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("jump") and lock == false:
		GameManager.load_main_scene()
	elif event.is_action("ui_cancel"):
		GameManager.load_main_scene()
	

func on_plane_died():
	if get_tree().paused == false:
		game_over.play()
		ScoreManager.high_score = score
		timer.start()
		gameover.show()
		await timer.timeout
		gameover.hide()
		gameover_2.show()
		lock = false

func on_point_score():
	score += 1
	_score.text = "%04d" % score
