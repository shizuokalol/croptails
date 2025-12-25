# Walk state - player is moving
extends NodeState

# Reference to the player character
@export var player: Player
# Reference to the sprite animation handler
@export var animated_sprite_2d: AnimatedSprite2D
# Movement speed when walking
@export var speed: int = 50


func _on_process(_delta: float) -> void:
	pass


# Handle movement and play walking animation based on direction
func _on_physics_process(_delta: float) -> void:
	var direction: Vector2 = GameInputEvents.movement_input()

	# Play walking animation based on direction
	if direction == Vector2.LEFT:
		animated_sprite_2d.play("walk_left")
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("walk_right")
	elif direction == Vector2.UP:
		animated_sprite_2d.play("walk_back")
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("walk_front")
	
	# Update player direction for other states to use
	if direction != Vector2.ZERO:
		player.player_direction = direction

	# Apply movement and physics
	player.velocity = direction * speed
	player.move_and_slide()


# Check for transition to idle state
func _on_next_transitions() -> void:
	# Return to idle if no movement input
	if !GameInputEvents.is_movement_input():
		transition.emit("idle")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
