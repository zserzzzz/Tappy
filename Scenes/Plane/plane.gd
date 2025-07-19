extends CharacterBody2D

class_name Tappy

var j_vel = -400
var gravity: float = ProjectSettings.get("physics/2d/default_gravity")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var engine: AudioStreamPlayer = $engine



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		print("jumped")
		jump()

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	if velocity.y < -1000:
		velocity.y = -1000
	
	move_and_slide()
	
	if is_on_floor() == true:
		die()


func die() -> void:
	engine.stop()
	animated_sprite_2d.pause()
	set_physics_process(false)
	Signalbus.emit_on_plane_died()


func jump():
	velocity.y = j_vel
	if animation_player.is_playing():
		animation_player.stop()
	animation_player.play("jump")


func _on_touch_screen_button_pressed() -> void:
	jump()
