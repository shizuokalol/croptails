# Idle state - player is standing still
extends NodeState

# Reference to the player character
@export var player: Player
# Reference to the sprite animation handler
@export var animated_sprite_2d: AnimatedSprite2D


func _on_process(_delta: float) -> void:
	pass


# Display the appropriate idle animation based on player direction
func _on_physics_process(_delta: float) -> void:
	if player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("idle_left")
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("idle_right")
	elif player.player_direction == Vector2.UP:
		animated_sprite_2d.play("idle_back")
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("idle_front")
	else:
		animated_sprite_2d.play("idle_front")


# Check for transitions to other states
func _on_next_transitions() -> void:
	GameInputEvents.movement_input()

	# Transition to walk state if moving
	if GameInputEvents.is_movement_input():
		transition.emit("Walk")
	
	# Transition to chop state if axe is equipped and hit button pressed
	if player.current_tool == DataTypes.Tools.AxeWood && GameInputEvents.use_tool():
		transition.emit("Chop")
		
	# Transition to till state if tilling tool is equipped and hit button pressed
	if player.current_tool == DataTypes.Tools.TillGround && GameInputEvents.use_tool():
		transition.emit("Till")
	
	# Transition to water state if watering tool is equipped and hit button pressed
	if player.current_tool == DataTypes.Tools.WaterCrops && GameInputEvents.use_tool():
		transition.emit("Water")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
