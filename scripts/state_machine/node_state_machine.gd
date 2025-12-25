# Manages state transitions and controls the active state
class_name NodeStateMachine
extends Node

# The initial state to enter when ready
@export var initial_node_state: NodeState

# Dictionary to store all available states by name
var node_states: Dictionary = {}
# The currently active state
var current_node_state: NodeState
# Name of the current state
var current_node_state_name: String

# Initialize the state machine on scene start
func _ready() -> void:
	# Register all child nodes that are states
	for child in get_children():
		if child is NodeState:
			node_states[child.name.to_lower()] = child
			# Connect each state's transition signal to handle state changes
			child.transition.connect(transition_to)
	
	# Enter the initial state
	if initial_node_state:
		initial_node_state._on_enter()
		current_node_state = initial_node_state


# Called every frame for non-physics updates
func _process(delta: float) -> void:
	if current_node_state:
		current_node_state._on_process(delta)


# Called every physics frame for movement and physics
func _physics_process(delta: float) -> void:
	if current_node_state:
		current_node_state._on_physics_process(delta)
		# Check and handle state transitions
		current_node_state._on_next_transitions()


# Handle transitioning to a new state
func transition_to(node_state_name: String) -> void:
	# Don't transition if already in the same state
	if node_state_name == current_node_state.name.to_lower():
		return
	
	# Find the new state
	var new_node_state = node_states.get(node_state_name.to_lower())
	
	# If state doesn't exist, cancel transition
	if !new_node_state:
		return
	
	# Exit current state
	if current_node_state:
		current_node_state._on_exit()
	
	# Enter new state
	new_node_state._on_enter()
	
	# Update the current state
	current_node_state = new_node_state
	current_node_state_name = current_node_state.name.to_lower()
	print("Current State: ", current_node_state_name)
