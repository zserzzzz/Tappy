extends CharacterBody2D

var gravity: float = ProjectSettings.get("physics/2d/default_gravity")
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		print("jumped")
		velocity.y = -500
		if animation_player.is_playing():
			animation_player.stop()
		animation_player.play("jump")

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	if velocity.y < -1000:
		velocity.y = -1000
	
	print(velocity.y)
	move_and_slide()
