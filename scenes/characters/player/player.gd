# Main player character controller
class_name Player
extends CharacterBody2D

# The tool the player is currently holding
@export var current_tool: DataTypes.Tools = DataTypes.Tools.None

# The direction the player is facing (used for animations)
var player_direction: Vector2
