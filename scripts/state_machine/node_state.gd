# Base class for all game states (idle, walk, chop, etc.)
class_name NodeState
extends Node

# Signal emitted when this state wants to transition to another state
@warning_ignore("unused_signal")
signal transition


# Called every frame for non-physics logic
func _on_process(_delta: float) -> void:
	pass


# Called every physics frame for physics logic and animations
func _on_physics_process(_delta: float) -> void:
	pass


# Called to check and handle state transitions
func _on_next_transitions() -> void:
	pass


# Called when entering this state
func _on_enter() -> void:
	pass


# Called when exiting this state
func _on_exit() -> void:
	pass
