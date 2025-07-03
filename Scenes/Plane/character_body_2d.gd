extends CharacterBody2D

var gravity: float = ProjectSettings.get("physics/2d/default_gravity")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	move_and_slide()
