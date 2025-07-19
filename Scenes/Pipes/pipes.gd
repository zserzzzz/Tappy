extends Node2D

@onready var score: AudioStreamPlayer = $Score


func _process(delta: float) -> void:
	position.x += -120 * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	set_process(false)
	queue_free()
	print("pipe deleted")


func _on_pipe_body_entered(body: Node2D) -> void:
	if body is Tappy:
		print("plane collided")
		body.die()


func _on_laser_body_entered(body: Node2D) -> void:
	if body is Tappy:
		Signalbus.emit_on_point_score()
		score.play()
