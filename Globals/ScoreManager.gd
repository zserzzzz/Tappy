extends Node

const ScoresPath := "user://tappy.tres"


var _high_score := 0
var high_score: int:
	get:
		if _high_score > 0:
			return _high_score
		else:
			return 0
	set(value):
		if value > _high_score:
			_high_score = value
			save_high_score()
	

func _ready() -> void:
	load_high_score()

func save_high_score():
	var hsr = HighScoreResource.new()
	hsr.high_score = _high_score
	ResourceSaver.save(hsr,ScoresPath)


func load_high_score():
	if ResourceLoader.exists(ScoresPath) == true:
		var hsr: HighScoreResource = load(ScoresPath)
		if hsr:
			_high_score = hsr.high_score
