# Handles all player input events globally
class_name GameInputEvents

# Stores the current movement direction
static var direction: Vector2


# Detects movement input and returns the direction
static func movement_input() -> Vector2:
	if Input.is_action_pressed("walk_left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("walk_right"):
		direction = Vector2.RIGHT
	elif Input.is_action_pressed("walk_up"):
		direction = Vector2.UP
	elif Input.is_action_pressed("walk_down"):
		direction = Vector2.DOWN
	else:
		direction = Vector2.ZERO
	
	return direction


# Checks if there is any movement input
static func is_movement_input() -> bool:
	if direction == Vector2.ZERO:
		return false
	else:
		return true


# Checks if the tool action (hit) was pressed
static func use_tool() -> bool:
	var use_tool_value: bool = Input.is_action_just_pressed("hit")
	
	return use_tool_value
