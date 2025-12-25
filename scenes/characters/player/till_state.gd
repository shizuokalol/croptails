# Till state - player is tilling the ground
extends NodeState

# Reference to the player character
@export var player: Player
# Reference to the sprite animation handler
@export var animated_sprite_2d: AnimatedSprite2D


func _on_process(_delta: float) -> void:
	pass


func _on_physics_process(_delta: float) -> void:
	pass


# Return to idle once the animation finishes
func _on_next_transitions() -> void:
	if !animated_sprite_2d.is_playing():
		transition.emit("Idle")


# Play the tilling animation in the direction the player is facing
func _on_enter() -> void:
	if player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("tilling_left")
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("tilling_right")
	elif player.player_direction == Vector2.UP:
		animated_sprite_2d.play("tilling_back")
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("tilling_front")
	else:
		animated_sprite_2d.play("tilling_front")


func _on_exit() -> void:
	animated_sprite_2d.stop()
