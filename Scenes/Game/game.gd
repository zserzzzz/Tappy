extends Node2D

var pipes = preload("res://Scenes/Pipes/Pipes.tscn")
@onready var upper: Marker2D = $upper
@onready var lower: Marker2D = $lower
@onready var pipes_holder: Node = $PipesHolder


func _ready() -> void:
	spawn_pipe() 

func _on_spawntimer_timeout() -> void:
	spawn_pipe()

func spawn_pipe():
	var new_pipe := pipes.instantiate()
	new_pipe.position.y = randf_range(upper.position.y,lower.position.y)
	new_pipe.position.x = upper.position.x
	pipes_holder.add_child(new_pipe)

func _on_plane_died() -> void:
	print("died")
	get_tree().paused = true
